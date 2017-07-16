Return-Path: <jan.kiszka@web.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFD40E00B9E; Sun, 16 Jul 2017 07:57:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [212.227.17.12 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (jan.kiszka[at]web.de)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36CD6E0083A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 16 Jul 2017 07:57:37 -0700 (PDT)
Received: from md1f2u6c.ww002.siemens.net ([95.157.57.47]) by smtp.web.de
	(mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
	0Lmu6S-1e9MT62i44-00h72D for <meta-virtualization@yoctoproject.org>;
	Sun, 16 Jul 2017 16:57:36 +0200
Resent-From: Jan Kiszka <jan.kiszka@web.de>
Resent-To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Resent-Date: Sun, 16 Jul 2017 16:57:36 +0200
Resent-Message-ID: <c30405ba-fd4a-9cd1-7f0b-d14a22dbf81b@web.de>
Resent-User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1
	Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
X-Mozilla-News-Host: news://news.gmane.org:119
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <31337e74-968a-0b25-edd0-4da346dee232@web.de>
Date: Sun, 16 Jul 2017 16:48:22 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
X-Provags-ID: V03:K0:Tr8IA0bpEfyUjL+7VGmMZEd7UWL6q4TP/+jlAcrvKPr8vYA1jk+
	qpKr/kTvo1UjR7tbR3dn3HrNpQ2Uokx8lIOAsguMwBCjV+LpyVfMMuj4+PrMCYAN6AwdCH5
	91PFMLdN0yYqsNwwVTZd+sLB7G/do036LO611/G0UX5l6GtwksrEsCJtDqp5M2U3IHOow7Y
	IJuEB38bCuCWtVtrRCY4Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lFU7oxgn3AE=:1LBaFX5HdyyerBF4A0rjgD
	gnC27wqBB7QCt03n5dzwFTMu7jKZSSlLuyAn0iygdywQbHNKYmWI7u4KdfZEJ//UhtsCsUUIT
	UlQJnLPkLVrlC4N8W5evKmWkQOS2WOcxocv58EagsLbcojy86EbmwFqzCfTgg6b5TqogR7hKm
	kFVksjdFGWayaBm7dmZkZ+QI1bBqzUVId7Cf27bx8P+6hi3EJf8boJSqNt5tMXexpBR4BbHU8
	x1wbsedWiUALg/1PgITrTmm2czjvi8X+L8q7xbnfKQgP5WfNf9RZwS/ZLEx8sgYMNaU7PRVBf
	NIU00vLISo0o8a0WhT1s+Z7osJUQcQR0gtK8N+J4BPc0CFSdouDFNQd6j9tWctGVKHptLgZzz
	xCpN67XfZMj6AMFEr3aEeKwjAmDU0vVNtGe2KgKpkCuh7Rq8c351vSgGloYhaaDjwsVgN4rvr
	fSCRoNZStTI8TlC0jfmK5zT+qpQ9LUddFVSCGZBYVphagro7byr5TWAXkgCjtGq0Z+dPk434V
	HZQ7rgCIItejEEQkukUMw1K+z4V89uzlN2Sgm0+yGRwsx7CFi0i1U7EUHxCEl1dHDE7Ye6Xmy
	XYm1+z8VtSljFLZMaxYHkG7D9x9TY0FX/dsDISLOY/XUTNkkoRVm/gRcMIaBHp5j6dQdxVLnV
	qjUMJiZNsZHybn0JZzGXv22ADc0yJk0hC/3OzmYnsYsdmiSABRa8PxoCpy//SdzOtEYH7Aqs+
	n0xXNKImAVGuCuxzVYZN/NGMWUdLetFOVYoqcDNQG6QMVKqpiXhink3UE/QGIG4PUAjfuDCp3
	FoRAyf98Q2auD9lOCNdXDSkE61mNzoO3nJkQQBW3jTgbbArp5U=
Subject: [PATCH] docker: Fix and update sysvinit script
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
X-List-Received-Date: Sun, 16 Jul 2017 14:57:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Jan Kiszka <jan.kiszka@siemens.com>

Fix daemonization, align args with docker.service, fix line breaks in
log file - and fix INITSCRIPT_PARAMS (there is no variable
OS_DEFAULT_INITSCRIPT_PARAMS).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-containers/docker/docker_git.bb     | 2 +-
 recipes-containers/docker/files/docker.init | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index c1b38dc..3d16371 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -116,7 +116,7 @@ SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
 INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
 INITSCRIPT_NAME_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
-INITSCRIPT_PARAMS_${PN} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
+INITSCRIPT_PARAMS_${PN} = "defaults"
 
 do_install() {
 	mkdir -p ${D}/${bindir}
diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
index 9c01c75..2e8eb9e 100644
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
2.12.3

