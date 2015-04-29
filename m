Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 411ADE009C2; Tue, 28 Apr 2015 20:09:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F4B5E009C2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39KED009391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:20 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:19 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:32 +0800
Message-ID: <fae3fa47122b31b23822b19b991429d0c72579df.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 22/55] python-oslo.config: upgrade to 1.11.0
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
 .../{python-oslo.config_1.6.1.bb => python-oslo.config_1.11.0.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.config_1.6.1.bb => python-oslo.config_1.11.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_1.6.1.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_1.11.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-oslo.config_1.6.1.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.config_1.11.0.bb
index 6cc72f6..3f25df1 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_1.6.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_1.11.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PR = "r0"
 SRCNAME = "oslo.config"
 
 SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d51fd561300f46945dd24977c429280c"
-SRC_URI[sha256sum] = "4709df3a8ba05e6a47300770f1c90ade77b3d095f28e8f75191df8745268bb20"
+SRC_URI[md5sum] = "f2e8c995a9452ef6a02c7270561cadcb"
+SRC_URI[sha256sum] = "a5f61075b16e9155cc4e5aceab98f6e47d85bccaeb3739e364e151a9af0bc1ed"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


