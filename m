Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0F8BE00ABE; Tue, 28 Apr 2015 20:10:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B54FCE009E1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:54 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39sws000094
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:54 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:54 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:09:02 +0800
Message-ID: <f7b842c04039ba4f73689240ddd2c849b0e793c6.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 52/55] python-xstatic-jasmine: upgrade to 2.1.2.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...static-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} (67%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_1.3.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jasmine_1.3.1.1.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
index 1f1d606..529a2de 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_1.3.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Jasmine JavaScript library packaged for setuptools "
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Jasmine"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dfe5bf1328f6947f43208400409167b0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=eb6b9af5c233043f32ed0225d52cf4a4"
 
-PR = "r0"
 
 SRCNAME = "XStatic-Jasmine"
 SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "343a6848f32a0ec5015d8732a82b130b"
-SRC_URI[sha256sum] = "b9a8f8f0bf51ebdf7118c598c2e62b10ad9e1326858dbb61a07b3711b9491465"
+SRC_URI[md5sum] = "63fdb4a8668eb70ceef1a311e8b02dcb"
+SRC_URI[sha256sum] = "ba80ab9a324a7abfa5bb4855aaca279aceaf3e0223830d28a17a994770ecc1b4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


