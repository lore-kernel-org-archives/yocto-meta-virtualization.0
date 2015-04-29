Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67483E00AA8; Tue, 28 Apr 2015 20:10:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6EF7E009D8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:46 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39kFZ009427
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:46 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:46 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:55 +0800
Message-ID: <d71ad560b915c560a762cc9881a2664531b7d1e5.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 45/55] python-tooz: upgrade to 0.15.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-tooz_0.4.bb => python-tooz_0.15.0.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tooz_0.4.bb => python-tooz_0.15.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb b/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
rename to meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
index 1237f47..dd4ed52 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 
 SRCNAME = "tooz"
 SRC_URI = "http://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "26c2ff05188be7a4ba9d13ef54a6280c"
-SRC_URI[sha256sum] = "4db6b9058f2886af067bb81b8f757de095fc7a0bb24beef82c769478229ee595"
+SRC_URI[md5sum] = "741a416818c47b26a6017152daad22ce"
+SRC_URI[sha256sum] = "3a6ae76d8eae96092db0ed340c6ab4bf4d1418eaa19d659a7a56a92227134eb3"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


