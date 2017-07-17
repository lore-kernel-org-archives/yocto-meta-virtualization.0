Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B5D1E00C3B; Mon, 17 Jul 2017 13:05:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAAFFE00C41
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:25 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4PlL001719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:25 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:13 -0400
Message-ID: <1500321853-984-13-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] docker: Fix and update sysvinit script
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jul 2017 20:05:34 -0000
Content-Type: text/plain

From: Jan Kiszka <jan.kiszka@siemens.com>

Fix daemonization, align args with docker.service, fix line breaks in
log file - and fix INITSCRIPT_PARAMS (there is no variable
OS_DEFAULT_INITSCRIPT_PARAMS).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-containers/docker/docker_git.bb     | 2 +-
 recipes-containers/docker/files/docker.init | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 16ebd2104a53..1ced8f479e27 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -122,7 +122,7 @@ SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
 INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
 INITSCRIPT_NAME_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
-INITSCRIPT_PARAMS_${PN} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
+INITSCRIPT_PARAMS_${PN} = "defaults"
 
 do_install() {
 	mkdir -p ${D}/${bindir}
diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
index 9c01c7581acc..2e8eb9e40a3f 100644
--- a/recipes-containers/docker/files/docker.init
+++ b/recipes-containers/docker/files/docker.init
@@ -28,6 +28,7 @@ exec="/usr/bin/$prog"
 pidfile="/var/run/$prog.pid"
 lockfile="/var/lock/subsys/$prog"
 logfile="/var/log/$prog"
+other_args="--registry-mirror=http://localhost:5000 --insecure-registry=http://localhost:5000 --raw-logs"
 
 [ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
 
@@ -38,8 +39,8 @@ start() {
 
     if ! [ -f $pidfile ]; then
         printf "Starting $prog:\t"
-        echo "\n$(date)\n" >> $logfile
-        "$unshare" -m -- $exec -d $other_args &>> $logfile &
+        echo -e "\n$(date)\n" >> $logfile
+        "$unshare" -m -- $exec daemon $other_args &>> $logfile &
         pid=$!
         touch $lockfile
         # wait up to 10 seconds for the pidfile to exist.  see
-- 
2.4.0.53.g8440f74


