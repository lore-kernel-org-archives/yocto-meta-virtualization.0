Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD304E00A51; Tue, 28 Apr 2015 20:09:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F278BE009E7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:30 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39UFV000042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:30 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:30 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:41 +0800
Message-ID: <7c42af47a8ecc1b5d7f19ccfab0772796c1e5445.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 31/55] python-pymongo: upgrade to 3.0.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-pymongo_2.6.3.bb => python-pymongo_3.0.1.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pymongo_2.6.3.bb => python-pymongo_3.0.1.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-pymongo_2.6.3.bb b/meta-openstack/recipes-devtools/python/python-pymongo_3.0.1.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-pymongo_2.6.3.bb
rename to meta-openstack/recipes-devtools/python/python-pymongo_3.0.1.bb
index 1b37969..2f28003 100644
--- a/meta-openstack/recipes-devtools/python/python-pymongo_2.6.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-pymongo_3.0.1.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-PR = "r0"
 SRCNAME = "pymongo"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "da4a7d6ee47fe30b3978b8805d266167"
-SRC_URI[sha256sum] = "cabe1d785ad5db6ed8ff70dcb9c987958fc75400f066ec78911ca3f37184a4e2"
+SRC_URI[md5sum] = "f2aab37b56229981f975ad1daf61b774"
+SRC_URI[sha256sum] = "d26076e838335d33d10f35f5b94a5a618a7aea5519c889b9ec473b23200b1237"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


