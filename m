Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1497DE00A2C; Tue, 28 Apr 2015 20:09:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94C00E00949
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39SAq000036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:28 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:27 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:39 +0800
Message-ID: <02877d98caa11e45d3516090a097879131ab1663.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 29/55] python-pycadf: upgrade to 0.9.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-pycadf_0.6.0.bb => python-pycadf_0.9.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pycadf_0.6.0.bb => python-pycadf_0.9.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
index 6762b6c..a363119 100644
--- a/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PR = "r0"
 
 SRCNAME = "pycadf"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "283ff62801098f499e37aa493c1d18bb"
-SRC_URI[sha256sum] = "9ba1e9ac52ee2a2d6d9cc89847323559cc2ffe7b4d80b703944a0a1f75c7093f"
+SRC_URI[md5sum] = "cadda6f685a31abf18a0efe40541fec8"
+SRC_URI[sha256sum] = "3bda0f95b6defd0d0c6afc827617002ddd0688bed5ccc93a25965aa1d6b40094"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


