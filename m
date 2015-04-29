Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B908E009F3; Tue, 28 Apr 2015 20:09:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A997E009B4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39FBT029994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:16 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:15 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:29 +0800
Message-ID: <a9f25b1bac5925a6a482230026168c7b31fb1aa1.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 19/55] python-netaddr: upgrade to 0.7.14
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-netaddr_0.7.13.bb => python-netaddr_0.7.14.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-netaddr_0.7.13.bb => python-netaddr_0.7.14.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.13.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-netaddr_0.7.13.bb
rename to meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb
index 074705b..346663f 100644
--- a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.13.bb
+++ b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b277425f87f3b06d25af45d8b96f9682"
 
-PR = "r0"
 SRCNAME = "netaddr"
 
 SRC_URI = "https://pypi.python.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "fcf004101890f40fe9980d6980c695ba"
-SRC_URI[sha256sum] = "66b39922fabf219bb419231d370262191d2e38c93e96ca343c0c27a712f6cf67"
+SRC_URI[md5sum] = "4aecd1ce80ddf242953f2a196046a14a"
+SRC_URI[sha256sum] = "6d19b06b9bb6c9562b5f67ec36511946cfcfebf024a0c804b6fd5c36d3b11fb6"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


