Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80936E00AB4; Tue, 28 Apr 2015 20:10:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DAA0E00A54
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39nYP000088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:50 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:49 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:58 +0800
Message-ID: <401310d70f68f0c21b63d190ff9eb386c569a36c.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 48/55] python-warlock: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:27 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-warlock_1.0.1.bb
rename to meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
index babd0f5..49f1390 100644
--- a/meta-openstack/recipes-devtools/python/python-warlock_1.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://README.md;md5=97b002bcda83d22e7d3fd1427688a6a6"
 
 DEPENDS += "python-jsonschema python-jsonpatch"
 
-PR = "r0"
 SRCNAME = "warlock"
 
 SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a0096d4843da1f939c873460b53c02e0"
-SRC_URI[sha256sum] = "986ccfd647f89c1c8e7ebe40d159e5633818a58754b3ffdf51c4816927977791"
+SRC_URI[md5sum] = "79649fd8096eeb0c175a193f06237676"
+SRC_URI[sha256sum] = "bbfb4279034ccc402723e38d2a2e67cd619988bf4802fda7ba3e8fab15762651"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


