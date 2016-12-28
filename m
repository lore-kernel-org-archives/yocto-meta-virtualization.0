Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD45BE003DB; Tue, 27 Dec 2016 17:46:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 66 seconds by postgrey-1.32 at yocto-www;
	Tue, 27 Dec 2016 17:46:20 PST
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 835A5E0030B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Dec 2016 17:46:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14308799"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Dec 2016 09:45:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9A8B2477B1ED
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Dec 2016 09:45:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 28 Dec 2016 09:45:01 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Dec 2016 09:44:11 +0800
Message-ID: <1482889451-47606-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 9A8B2477B1ED.A78D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] libconfig-general-perl 2.58 -> 2.63
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
X-List-Received-Date: Wed, 28 Dec 2016 01:46:24 -0000
Content-Type: text/plain

Upgrade libconfig-general-perl from 2.58 to 2.63

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...{libconfig-general-perl_2.58.bb => libconfig-general-perl_2.63.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/perl/{libconfig-general-perl_2.58.bb => libconfig-general-perl_2.63.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.63.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
rename to meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.63.bb
index fd06ccc..ec84c44 100644
--- a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
+++ b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.63.bb
@@ -8,8 +8,8 @@ SRCNAME = "Config-General"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "79397bfbf32dbe772bdc2167afc5c5a6"
-SRC_URI[sha256sum] = "d63cf3f4c600a87de336db806a7def0385ba5e3a9be427e0c65e407558b82eef"
+SRC_URI[md5sum] = "e3ea2a6dc76931cf638b5227aceabf60"
+SRC_URI[sha256sum] = "0a9bf977b8aabe76343e88095d2296c8a422410fd2a05a1901f2b20e2e1f6fad"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




