Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FA0FE009CD; Tue, 28 Apr 2015 20:09:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B3CAE009AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39ERx009383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:14 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:14 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:28 +0800
Message-ID: <e60cbc75304abf219a641ee9d9a3d92c99bd2e90.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/55] python-memcache: upgrade to 1.2.9
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
 .../python/{python-memcache_1.2.5.bb => python-memcache_1.2.9.bb}  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-memcache_1.2.5.bb => python-memcache_1.2.9.bb} (67%)

diff --git a/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
rename to meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
index 6597e86..9679859 100644
--- a/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A comprehensive, fast, pure Python memcached client"
 HOMEPAGE = "https://github.com/Pinterest/pymemcache"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=42205da10d12fff27726c08f588b1a0b"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e8538d10fb74087ea2dc61033b6ebf9f"
 
-PR = "r0"
 
 SRCNAME = "pymemcache"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "56dcfa6dfa7205118b60531e5336ab8b"
-SRC_URI[sha256sum] = "d8b3d52909eedf975f21236b099510866df8f6cf3d68f67f763609fe2c5ea78b"
+SRC_URI[md5sum] = "215510250997423a2a57da061b1bd592"
+SRC_URI[sha256sum] = "05fd71f0337384024cc3d1340d35fd0d46307cf711eac9365b0eb166812bb121"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


