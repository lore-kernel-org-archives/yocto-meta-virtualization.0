Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 718EDE009EC; Tue, 21 Jul 2015 04:56:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1000 seconds by postgrey-1.32 at yocto-www;
	Tue, 21 Jul 2015 04:56:10 PDT
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5E06E00998
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Jul 2015 04:56:10 -0700 (PDT)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6LBdTKa025942 for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Jul 2015 06:39:29 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015072106392956-104500 ;
	Tue, 21 Jul 2015 06:39:29 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1437478768-18436-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/21/2015 06:39:29 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/21/2015 06:39:29 AM,
	Serialize complete at 07/21/2015 06:39:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-21_04:, , signatures=0
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Subject: [PATCH] meta-openstack: gptfdisk: Remove recipe
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
Date: Tue, 21 Jul 2015 11:56:11 -0000
X-Original-Date: Tue, 21 Jul 2015 14:39:28 +0300
X-List-Received-Date: Tue, 21 Jul 2015 11:56:11 -0000

A gptfdisk recipe has been added to openembedded-core by commit 8c219e
making this one unecessary.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../gptfdsik/files/fix-host-contamination.patch    | 18 -------------
 .../recipes-extended/gptfdsik/gptfdisk_0.8.10.bb   | 31 ----------------------
 2 files changed, 49 deletions(-)
 delete mode 100644 meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch
 delete mode 100644 meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb

diff --git a/meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch b/meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch
deleted file mode 100644
index 8939cc1..0000000
--- a/meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-fix host contamination
-
-Make sure that the Makefile uses gcc cross
-compiler from build system, but not use
-the host gcc
-
-Signed-off-by: Vu Tran <vu.tran@windriver.com>
-
-diff --git a/Makefile b/Makefile
-index 1ae018e..4c23b45 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,3 @@
--CC=gcc
--CXX=g++
- CFLAGS+=-D_FILE_OFFSET_BITS=64
- #CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
- CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
diff --git a/meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb b/meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb
deleted file mode 100644
index 67e3c14..0000000
--- a/meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Disk partitioning tool for GUID Partition Table"
-DESCRIPTION = "\
-  GPT fdisk is a disk partitioning tool loosely modeled on \
-  Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. \
-  The related FixParts utility fixes some common problems on Master Boot \
-  Record (MBR) disks."
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "r0"
-
-SRC_URI = "http://sourceforge.net/projects/${PN}/files/${PN}/${PV}/${PN}-${PV}.tar.gz \
-           file://fix-host-contamination.patch \
-"
-
-SRC_URI[md5sum] = "9cf4246c181c324bdbd553fe9b348373"
-SRC_URI[sha256sum] = "73e64151203ae0c347c488358e71ca582bb7fb7f0d66df86b71c42050390eb9b"
-
-do_install () {
-    install -d ${D}${sbindir}
-    install -m 755 ${S}/gdisk ${D}${sbindir}/
-    install -m 755 ${S}/cgdisk ${D}${sbindir}/
-    install -m 755 ${S}/sgdisk ${D}${sbindir}/
-    install -m 755 ${S}/fixparts ${D}${sbindir}/
-}
-
-FILES_${PN} += "${sbindir}/* \
-"
-
-DEPENDS += "util-linux"
-- 
2.1.4


