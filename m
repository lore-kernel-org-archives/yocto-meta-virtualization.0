Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 406FCE00BD0; Thu, 22 Jun 2017 02:21:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A63AE00B8B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Jun 2017 02:21:28 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5M9LRt7005939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Jun 2017 02:21:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Jun 2017 02:21:26 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 22 Jun 2017 17:14:43 +0800
Message-ID: <1498122883-17423-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] lxc: add gmp libidn gnutls nettle rdepends
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
X-List-Received-Date: Thu, 22 Jun 2017 09:21:33 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix the following QA warnings:
QA Issue: lxc rdepends on gmp, but it isn't a build dependency,
missing gmp in DEPENDS or PACKAGECONFIG? [build-deps]
QA Issue: lxc rdepends on libidn, but it isn't a build dependency,
missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
QA Issue: lxc rdepends on gnutls, but it isn't a build dependency,
missing gnutls in DEPENDS or PACKAGECONFIG? [build-deps]
QA Issue: lxc rdepends on nettle, but it isn't a build dependency,
missing nettle in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 3dd9f63..f4d1102 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -17,6 +17,10 @@ RDEPENDS_${PN} = " \
 		perl-module-constant \
 		perl-module-overload \
 		perl-module-exporter-heavy \
+		gmp \
+		libidn \
+		gnutls \
+		nettle \
 "
 RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls"
 
-- 
2.8.1


