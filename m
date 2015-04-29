Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD58FE009D8; Tue, 28 Apr 2015 20:09:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33CCDE009F4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39Q7Y009400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:27 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:26 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:38 +0800
Message-ID: <964848e69d4885993a11c5e08ae85a48ca76029a.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 28/55] python-paste: upgrade to 2.0.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-paste_1.7.5.1.bb => python-paste_2.0.1.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-paste_1.7.5.1.bb => python-paste_2.0.1.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-paste_1.7.5.1.bb b/meta-openstack/recipes-devtools/python/python-paste_2.0.1.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-paste_1.7.5.1.bb
rename to meta-openstack/recipes-devtools/python/python-paste_2.0.1.bb
index f76b4b5..946d1f4 100644
--- a/meta-openstack/recipes-devtools/python/python-paste_1.7.5.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-paste_2.0.1.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-PR = "r0"
 SRCNAME = "Paste"
 
 SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7ea5fabed7dca48eb46dc613c4b6c4ed"
-SRC_URI[sha256sum] = "11645842ba8ec986ae8cfbe4c6cacff5c35f0f4527abf4f5581ae8b4ad49c0b6"
+SRC_URI[md5sum] = "5aa1890d20e6f93b46e855aa1e17ba27"
+SRC_URI[sha256sum] = "28383e843cb46a9375a90da6e2ec5fcd7704ed9f3f3b5e954928beb52b0e5b41"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


