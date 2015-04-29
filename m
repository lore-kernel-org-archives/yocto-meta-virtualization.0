Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A2EFE009D4; Tue, 28 Apr 2015 20:09:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40238E009B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39Idb009388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:18 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:17 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:30 +0800
Message-ID: <a8ea3c1718740f94c64903e05c26fff7c18a93fb.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 20/55] python-openstackclient: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...ython-openstackclient_1.0.3.bb => python-openstackclient_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.3.bb => python-openstackclient_1.1.0.bb} (74%)

diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
similarity index 74%
rename from meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
rename to meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
index ae8e82c..3fd26d3 100644
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
@@ -8,8 +8,8 @@ SRCNAME = "python-openstackclient"
 
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "595c9be3ae2f967f7dd5f33753137377"
-SRC_URI[sha256sum] = "d39a2e6cf98d409f8545b9d3a207eb8cbf3b2fc5ea17b0f8d9bed52326ca9f49"
+SRC_URI[md5sum] = "c965b343b0fdf97d01e28d5460c7c175"
+SRC_URI[sha256sum] = "875b54ac95e29cc83ae76513b48306c8493c12d5ba7d23aea3432216f2fa91ba"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


