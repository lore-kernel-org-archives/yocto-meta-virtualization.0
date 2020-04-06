Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4993.1586146864592789742
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Apr 2020 21:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0364L3GI019324
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 5 Apr 2020 21:21:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Sun, 5 Apr 2020
 21:20:50 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] lxc: Fix containers failed to start with LXC 3.2.1
Date: Mon, 6 Apr 2020 12:20:49 +0800
Message-ID: <20200406042049.28540-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

LXC 3.2.1 has a bug that containers may start failed in some cases, and
this patch from upstream fix it.

-------error message------
lxc-start vc0 20200323102154.497 ERROR    cgfsng -
cgfsng.c:__do_cgroup_enter:1500 - No space left on device - Failed to
enter cgroup "/sys/fs/cgroup/cpuset//lxc.monitor/vc0-4/cgroup.procs"
lxc-start vc0 20200323102154.497 ERROR    start -
start.c:__lxc_start:2009 - Failed to enter monitor cgroup
lxc-start vc0 20200323102154.497 ERROR    lxccontainer -
lxccontainer.c:wait_on_daemonized_start:872 - Received container state
"STOPPING" instead of "RUNNING"
lxc-start vc0 20200323102154.497 ERROR    lxc_start -
lxc_start.c:main:329 - The container failed to start
lxc-start vc0 20200323102154.497 ERROR    lxc_start -
lxc_start.c:main:332 - To get more details, run the container in
foreground mode
-------------------------

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...1-cgroups-initialize-cpuset-properly.patch | 40 +++++++++++++++++++
 recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch

diff --git a/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch b/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
new file mode 100644
index 0000000..9d0c2ae
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
@@ -0,0 +1,40 @@
+From b31d62b847a3ee013613795094cce4acc12345ef Mon Sep 17 00:00:00 2001
+From: Christian Brauner <christian.brauner@ubuntu.com>
+Date: Sun, 28 Jul 2019 23:13:26 +0200
+Subject: [PATCH] cgroups: initialize cpuset properly
+
+Closes #3108.
+Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
+
+Upstream-Status: Backport[https://github.com/lxc/lxc/pull/3108]
+
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+---
+ src/lxc/cgroups/cgfsng.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
+index 7b8fe6736..c29c0958e 100644
+--- a/src/lxc/cgroups/cgfsng.c
++++ b/src/lxc/cgroups/cgfsng.c
+@@ -496,12 +496,12 @@ static bool cg_legacy_filter_and_set_cpus(char *path, bool am_initialized)
+ 	}
+ 
+ 	if (!flipped_bit) {
+-		DEBUG("No isolated or offline cpus present in cpuset");
+-		return true;
++		cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
++		TRACE("No isolated or offline cpus present in cpuset");
++	} else {
++		cpulist = move_ptr(posscpus);
++		TRACE("Removed isolated or offline cpus from cpuset");
+ 	}
+-	DEBUG("Removed isolated or offline cpus from cpuset");
+-
+-	cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
+ 	if (!cpulist) {
+ 		ERROR("Failed to create cpu list");
+ 		return false;
+-- 
+2.18.2
+
diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
index 9592dd9..57e48c1 100644
--- a/recipes-containers/lxc/lxc_3.2.1.bb
+++ b/recipes-containers/lxc/lxc_3.2.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
+	file://0001-cgroups-initialize-cpuset-properly.patch \
 	"
 
 SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
-- 
2.24.1

