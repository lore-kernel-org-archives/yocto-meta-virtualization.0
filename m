Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web09.13672.1583154699920397232
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 05:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=a9S3etuY;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: olkuroch@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4650; q=dns/txt; s=iport;
  t=1583154699; x=1584364299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4OrrglWoAasz6w3Jmt8vS8ICEEEtYRfOwD6IMyOjFrg=;
  b=a9S3etuYcO+g770hhgpynBgJDjDwDKiduKi4ii/zgN36n100+5nB1Jfc
   mRAxw/mT5YQEd31UCiXGBIRbwjjT+8Z8HNc7oCEPu0f1kGPP2Zuosm3tv
   9hO4AP4gH2XmmaliaTo1Tb11tkKBY3iu/hkkCs0DW1vS13oltfcpYm1gw
   8=;
X-IronPort-AV: E=Sophos;i="5.70,507,1574121600"; 
   d="scan'208";a="735327536"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Mar 2020 13:11:38 +0000
Received: from sjc-ads-6800.cisco.com (sjc-ads-6800.cisco.com [10.30.217.115])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTP id 022DBcMO020691;
	Mon, 2 Mar 2020 13:11:38 GMT
Received: by sjc-ads-6800.cisco.com (Postfix, from userid 588222)
	id 5C8F31550; Mon,  2 Mar 2020 05:11:38 -0800 (PST)
From: "Oleksii Kurochko" <olkuroch@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Oleksii Kurochko <olkuroch@cisco.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization,zeus][PATCH] lxc: Backport patch that renames memfd_create() function
Date: Mon,  2 Mar 2020 05:11:30 -0800
Message-Id: <20200302131130.2965-1-olkuroch@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.217.115, sjc-ads-6800.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
Content-Transfer-Encoding: 8bit

When Autotools makes configuration of LXC, the check of
the memfd_create() function fails because __stub_memfd_create and
__stub___memfd_create (The GNU C library defines this for functions
which it implements to always fail with ENOSYS) are defined in Glibc,
which leads to the fact that the macro HAVE_MEMFD_CREATE is not
defined and LXC provides defintion of the memfd_create() function as
static inline which in turn conflicts with a definition from
the <bits/mman-shared.h> file and causes an error:
| In file included from ../../../lxc-3.2.1/src/lxc/conf.c:79:
| <src_path>//lxc/syscall_wrappers.h:77:19: error: static declaration
| of 'memfd_create' follows non-static declaration
| | static inline int memfd_create(const char *name, unsigned int flags) {
| |                   ^~~~~~~~~~~~
| In file included from /usr/include/bits/mman-linux.h:111,
|                  from /usr/include/bits/mman.h:34,
|                  from /usr/include/sys/mman.h:41,
|                  from <src_path>/lxc-3.2.1/src/lxc/conf.c:42:
| /usr/include/bits/mman-shared.h:50:5: note: previous declaration
|  of 'memfd_create' was here
| | int memfd_create (const char *__name, unsigned int __flags) __THROW;
| |     ^~~~~~~~~~~~

Upstream PR: https://github.com/lxc/lxc/pull/3168 (merged)

Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 15e9fc23ecaf0607880211c96818ffea8e4044fc)
Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
---
 ...-rename-internal-memfd_create-to-mem.patch | 46 +++++++++++++++++++
 recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch

diff --git a/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
new file mode 100644
index 000000000000..9d5b5b8aefc1
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
@@ -0,0 +1,46 @@
+From b1694cccddadc8b084cd9eb502d9e86e0728709b Mon Sep 17 00:00:00 2001
+From: Patrick Havelange <patrick.havelange@essensium.com>
+Date: Tue, 22 Oct 2019 12:29:54 +0200
+Subject: [PATCH v2] syscall_wrappers: rename internal memfd_create to
+ memfd_create_lxc
+
+In case the internal memfd_create has to be used, make sure we don't
+clash with the already existing memfd_create function from glibc.
+
+This can happen if this glibc function is a stub. In this case, at
+./configure time, the test for this function will return false, however
+the declaration of that function is still available. This leads to
+compilation errors.
+
+Upstream-Status: Backport [lxc-3.2.1 https://github.com/lxc/lxc/pull/3168]
+
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+(cherry picked from commit 40b06c78773dfd5e12e568a576b1abb133f61b71)
+Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
+---
+ v2: added Upstream-Status
+
+ src/lxc/syscall_wrappers.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
+index ce67da5b5308..b7edba63f5d7 100644
+--- a/src/lxc/syscall_wrappers.h
++++ b/src/lxc/syscall_wrappers.h
+@@ -74,7 +74,7 @@ static inline long __keyctl(int cmd, unsigned long arg2, unsigned long arg3,
+ #endif
+ 
+ #ifndef HAVE_MEMFD_CREATE
+-static inline int memfd_create(const char *name, unsigned int flags) {
++static inline int memfd_create_lxc(const char *name, unsigned int flags) {
+ 	#ifndef __NR_memfd_create
+ 		#if defined __i386__
+ 			#define __NR_memfd_create 356
+@@ -113,6 +113,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
+ 	return -1;
+ 	#endif
+ }
++#define memfd_create memfd_create_lxc
+ #else
+ extern int memfd_create(const char *name, unsigned int flags);
+ #endif
diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
index b85251562b58..957811743dc6 100644
--- a/recipes-containers/lxc/lxc_3.2.1.bb
+++ b/recipes-containers/lxc/lxc_3.2.1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://network-restore-ability-to-move-nl80211-devices.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+	file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
 	"
 
 SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
-- 
2.19.1

