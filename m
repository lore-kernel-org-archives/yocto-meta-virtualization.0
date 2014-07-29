Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F025E007EA; Tue, 29 Jul 2014 04:56:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,URIBL_BLACK
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.7 URIBL_BLACK Contains an URL listed in the URIBL
	blacklist *      [URIs: configure.ac]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 978F5E007E4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 04:56:45 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 29 Jul 2014 13:56:38 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id D7E6A288F33;
	Tue, 29 Jul 2014 13:56:38 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 29 Jul 2014 13:56:34 +0200
Message-ID: <1406634994-37663-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] netcf: remove recipe
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
X-List-Received-Date: Tue, 29 Jul 2014 11:56:57 -0000
Content-Type: text/plain

meta-networking layer includes a newer version (0.2.3) of netcf recipe.
Since meta-virtualization layer depends on meta-oe/meta-networking layer,
we can avoid duplication by removing this recipe.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 ...ix-network-driver-check-issue-on-opensuse.patch | 28 ----------------------
 recipes-networking/netcf/netcf_git.bb              | 27 ---------------------
 2 files changed, 55 deletions(-)
 delete mode 100644 recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
 delete mode 100644 recipes-networking/netcf/netcf_git.bb

diff --git a/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch b/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
deleted file mode 100644
index eef5b5c..0000000
--- a/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 285871a2db42727665a2ab7fc16fa2fb8fa830d3 Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Thu, 23 May 2013 17:39:35 +0800
-Subject: [PATCH] fix network driver check issue on opensuse
-
-Upstream-Status: Pending
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
----
- configure.ac |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3f30865..708eb28 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,7 +77,7 @@ fi
- if test "x$with_driver" = "xcheck" && test -f /etc/ubuntu_version ; then
-   with_driver=debian
- fi
--if test "x$with_driver" = "xcheck" && test -f /etc/suse-release ; then
-+if test "x$with_driver" = "xcheck" && (test -f /etc/suse-release || test -f /etc/SuSE-release) ; then
-   with_driver=suse
- fi
- if test "x$with_driver" = "xcheck" ; then
--- 
-1.7.3.4
-
diff --git a/recipes-networking/netcf/netcf_git.bb b/recipes-networking/netcf/netcf_git.bb
deleted file mode 100644
index 218cd17..0000000
--- a/recipes-networking/netcf/netcf_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "netcf"
-DESCRIPTION = "netcf is a cross-platform network configuration library."
-HOMEPAGE = "https://fedorahosted.org/netcf/"
-SECTION = "console/tools"
-LICENSE = "LGPLv2.1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
-
-SRCREV = "2b0d9ca226c13d7150382367f62b256bdb2db5ef"
-PR = "r1"
-PV = "0.2.2+git${SRCPV}"
-
-SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
-           file://0001-fix-network-driver-check-issue-on-opensuse.patch \
-"
-
-DEPENDS += "augeas libnl libxslt libxml2"
-
-S = "${WORKDIR}/git"
-
-inherit gettext autotools-brokensep
-
-do_configure_prepend() {
-	cd ${S}
-	./bootstrap
-}
-
-- 
1.9.1


