Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7971EE00ABE; Wed, 16 Dec 2015 08:58:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF2C9E00321
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Dec 2015 08:58:48 -0800 (PST)
X-TM-IMSS-Message-ID: <13a2265b0003916b@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	13a2265b0003916b ; Wed, 16 Dec 2015 11:59:05 -0500
Received: from moss-terrapin.infosec.tycho.ncsc.mil (moss-terrapin
	[192.168.25.69])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id tBGGwimv026693; 
	Wed, 16 Dec 2015 11:58:47 -0500
From: Machon Gregory <mbgrego@tycho.nsa.gov>
To: meta-virtualization@yoctoproject.org
Date: Wed, 16 Dec 2015 12:08:42 -0500
Message-Id: <1450285722-14530-2-git-send-email-mbgrego@tycho.nsa.gov>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
References: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
X-TM-AS-MML: disable
Subject: [V2 Patch 2/2] Enables XSM functionality in builds that contain "xsm" in the PACKAGECONFIG.
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
X-List-Received-Date: Wed, 16 Dec 2015 16:58:50 -0000

* Correctly identifies xenpolicy by ${PV}
* Adds a check to identify if xsm is specified in PACKAGECONFIG and if so manually sets XSM_ENABLE in Xen's .config

Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
---
 recipes-extended/xen/xen.inc | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9e35459..03ec935 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -333,7 +333,7 @@ FILES_${PN}-flask = "\
     ${sbindir}/flask-loadpolicy \
     ${sbindir}/flask-set-bool \
     ${sbindir}/flask-setenforce \
-    /boot/xenpolicy.24 \
+    /boot/xenpolicy-${PV} \
     "
 
 FILES_${PN}-gdbsx = "\
@@ -715,6 +715,15 @@ EXTRA_OECONF += " \
     --disable-ocamltools \
     "
 
+# check for XSM in package config to allow XSM_ENABLE to be set 
+python () {
+    pkgconfig = d.getVar('PACKAGECONFIG', True)
+    if ('xsm') in pkgconfig.split():
+        d.setVar('XSM_ENABLED', '1')
+    else:
+        d.setVar('XSM_ENABLED', '0')
+}
+
 do_configure() {
     # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
     if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
@@ -727,6 +736,11 @@ do_configure() {
         fi
     fi
 
+    #./configure --enable-xsm does not set XSM_ENABLE must be done manually
+    if [ "${XSM_ENABLED}" = "1" ]; then
+        echo "XSM_ENABLE := y" > ${S}/.config
+    fi
+
     # do configure
     oe_runconf
 }
-- 
2.1.0


