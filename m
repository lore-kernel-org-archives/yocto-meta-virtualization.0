Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D09E7E00B30; Tue, 20 Sep 2016 06:35:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.181.36 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.36])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CB0FE00AF2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 06:35:02 -0700 (PDT)
Received: from 1bmLCL-0005Qq-UC by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bmLCO-0005bA-VN
	for meta-virtualization@yoctoproject.org;
	Tue, 20 Sep 2016 06:35:00 -0700
Received: by emcmailer; Tue, 20 Sep 2016 06:35:00 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bmLCL-0005Qq-UC
	for meta-virtualization@yoctoproject.org;
	Tue, 20 Sep 2016 06:34:57 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 15:34:56 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id E64D2441596;
	Tue, 20 Sep 2016 15:34:56 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 20 Sep 2016 15:34:56 +0200
Message-ID: <1474378496-24714-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH] multipath-tools: Drop recipe
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
X-List-Received-Date: Tue, 20 Sep 2016 13:35:07 -0000
Content-Type: text/plain

A newer version of the recipe is maintained in meta-openembedded/meta-oe.
No reason to keep an older version here.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 .../multipath-tools/multipath-tools_git.bb         | 46 ----------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 recipes-extended/multipath-tools/multipath-tools_git.bb

diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
deleted file mode 100644
index 9ba5cd6..0000000
--- a/recipes-extended/multipath-tools/multipath-tools_git.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "Tools to Manage Multipathed Devices with the device-mapper"
-DESCRIPTION = "This package provides the tools to manage multipathed devices by \
-instructing the device-mapper multipath module what to do"
-
-HOMEPAGE = "http://christophe.varoqui.free.fr/"
-DEPENDS = "readline libaio lvm2 udev"
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
-S="${WORKDIR}/git"
-
-
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
-
-SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
-PV = "0.4.9+gitr${SRCPV}"
-
-inherit autotools-brokensep
-
-EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
-
-PACKAGES =+ "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd libmultipath-dev libmpathpersist-dev"
-
-
-RDEPENDS_${PN} += "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd udev"
-
-do_install_append () {
-	ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
-	ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}     = ""
-
-FILES_libmpathpersist = "${libdir}/libmpathpersist*.so.0"
-FILES_mpathpersist = "${sbindir}/mpathpersist"
-FILES_kpartx = "${sbindir}/kpartx ${base_libdir}/udev/"
-FILES_libmultipath = "${libdir}/libcheck*.so ${libdir}/libpri*.so ${libdir}/libmultipath*.so.0"
-FILES_multipath = "${sbindir}/multipath ${sysconfdir}"
-FILES_multipathd = "${sbindir}/multipathd ${base_libdir}"
-
-#put the symbol link lib in -dev 
-FILES_libmultipath-dev = "${libdir}/libmultipath*.so"
-FILES_libmpathpersist-dev = "${libdir}/libmpathpersist*.so"
-
-
-- 
1.9.1


