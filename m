Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 678E5E009ED; Wed, 22 Jul 2015 02:16:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F1B7E009BE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 02:16:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98720087"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jul 2015 17:20:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6M9EjHd030419
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 17:14:45 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 22 Jul 2015 17:16:33 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 22 Jul 2015 17:16:28 +0800
Message-ID: <1437556588-2083-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH] libconfig-general-perl: upgrade 2.51 -> 2.58
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
X-List-Received-Date: Wed, 22 Jul 2015 09:16:42 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...libconfig-general-perl_2.51.bb => libconfig-general-perl_2.58.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/perl/{libconfig-general-perl_2.51.bb => libconfig-general-perl_2.58.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.51.bb b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.51.bb
rename to meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
index 8535845..fd06ccc 100644
--- a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.51.bb
+++ b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Config file parser module"
 HOMEPAGE = "http://search.cpan.org/dist/Config-General/"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 SECTION = "libs"
-PR = "r0"
 LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=3ba4bbac1e79a08332688196f637d2b2"
 
 SRCNAME = "Config-General"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3100325f99bdc2f265645a842e6bb025"
-SRC_URI[sha256sum] = "8ff530cd4818a040c1bc2ba96e3e8237241dde1208d206685d1204270ef00bce"
+SRC_URI[md5sum] = "79397bfbf32dbe772bdc2167afc5c5a6"
+SRC_URI[sha256sum] = "d63cf3f4c600a87de336db806a7def0385ba5e3a9be427e0c65e407558b82eef"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


