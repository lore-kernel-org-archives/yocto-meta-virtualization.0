Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37CF3E00BEA; Fri,  4 Mar 2016 13:19:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81639E00B89
	for <meta-virtualization@yoctoproject.org>;
	Fri,  4 Mar 2016 13:19:51 -0800 (PST)
X-TM-IMSS-Message-ID: <6697ca7a0006dc4d@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	6697ca7a0006dc4d ; Fri, 4 Mar 2016 16:18:57 -0500
Received: from moss-terrapin.infosec.tycho.ncsc.mil (moss-terrapin
	[192.168.25.69])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u24LJmea004283
	for <meta-virtualization@yoctoproject.org>;
	Fri, 4 Mar 2016 16:19:50 -0500
From: Machon Gregory <mbgrego@tycho.nsa.gov>
To: meta-virtualization@yoctoproject.org
Date: Fri,  4 Mar 2016 16:30:16 -0500
Message-Id: <1457127016-16947-1-git-send-email-mbgrego@tycho.nsa.gov>
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
Subject: [PATCH] Fix QA Issues when building for aarch64 machines
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
X-List-Received-Date: Fri, 04 Mar 2016 21:19:54 -0000

When building for the aarch64 based machines the following QA Issue is
produced:

ERROR: QA Issue: xen: Files/directories were installed but not shipped in any package:
  /usr/lib64
  /usr/lib64/efi
  /usr/lib64/efi/xen-4.6.efi
  /usr/lib64/efi/xen-4.6.0.efi
  /usr/lib64/efi/xen.efi
  /usr/lib64/efi/xen-4.efi

Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
---
 recipes-extended/xen/xen.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d35bc3f..2eba012 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -151,6 +151,7 @@ PACKAGES = "\
     ${PN}-dev \
     ${PN}-devd \
     ${PN}-doc \
+    ${PN}-efi \
     ${PN}-flask \
     ${PN}-fsimage \
     ${PN}-gdbsx \
@@ -303,6 +304,11 @@ FILES_${PN}-hypervisor = "\
     /boot/xen-syms-* \
     "
 
+FILES_${PN}-efi = "\
+    ${exec_prefix}/lib64 \
+    ${exec_prefix}/lib64/xen* \
+    "
+
 FILES_${PN}-base = "\
     ${sysconfdir}/xen/auto \
     ${sysconfdir}/xen/cpupool \
-- 
2.1.0


