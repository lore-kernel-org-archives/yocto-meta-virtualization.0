Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A76B9E009BD; Tue, 14 Apr 2015 23:01:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7896EE009C2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 23:01:07 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3F616fs027403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 23:01:07 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 23:01:12 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 14:01:06 +0800
Message-ID: <137cc6b70180cf3809c033e1167870cf933507f9.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/14] python-openstackclient: upgrade to 1.0.3
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
X-List-Received-Date: Wed, 15 Apr 2015 06:01:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...thon-openstackclient_1.0.2.bb => python-openstackclient_1.0.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.2.bb => python-openstackclient_1.0.3.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-openstackclient_1.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
index b0f0717..ae8e82c 100644
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PR = "r0"
 SRCNAME = "python-openstackclient"
 
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "44f33ac00cd47392688af959178eb5c3"
-SRC_URI[sha256sum] = "6d1d5c8100f37b96b7d6f9a8b429af790235cb33b54c6237c16b0b1534c851b7"
+SRC_URI[md5sum] = "595c9be3ae2f967f7dd5f33753137377"
+SRC_URI[sha256sum] = "d39a2e6cf98d409f8545b9d3a207eb8cbf3b2fc5ea17b0f8d9bed52326ca9f49"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


