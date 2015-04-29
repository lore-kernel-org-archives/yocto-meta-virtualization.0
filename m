Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55B0EE009CF; Tue, 28 Apr 2015 20:09:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9764E009C7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39BKU029988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:11 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:11 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:25 +0800
Message-ID: <c4bdb583703056fdff2f5346a9dc829ce19c60e4.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/55] python-kombu: upgrade to 3.0.26
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-kombu_3.0.3.bb => python-kombu_3.0.26.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_3.0.3.bb => python-kombu_3.0.26.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu_3.0.3.bb b/meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-kombu_3.0.3.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb
index d0bf7fd..d3cc17d 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_3.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A messaging framework for Python"
 HOMEPAGE = "http://kombu.readthedocs.org"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34442d8097d82121c4a8c1ab10e7d471"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a25a2e176842f3a9934f9d7ee8e0edae"
 
-PR = "r0"
 SRCNAME = "kombu"
 
 SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8f33b7e9c4b5757e151b455f51a3a4be"
-SRC_URI[sha256sum] = "7da5e90cde3f8c9aea7210345ee15e66da4438bee56087cb0f00e8c7f03dd66a"
+SRC_URI[md5sum] = "dda05763cd4b72a131fe1ef9ba93d542"
+SRC_URI[sha256sum] = "1f565abd44c4b7dfaa4dd543d52f982d2f006aba0a2b3830542b4d25a801fe09"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


