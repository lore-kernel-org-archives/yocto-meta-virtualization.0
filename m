Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7D29E00C58; Wed,  4 Apr 2018 13:03:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB8C5E00C54
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w34K3JLZ011955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:19 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:18 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:55 -0400
Message-ID: <1522872176-22946-11-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 11/12] python-tooz: uprev to v1.48.0
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:27 -0000
Content-Type: text/plain

Required the introduction of python-voluptuous. Required by the
stable/pike version of python-nova.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{python-tooz_1.25.0.bb => python-tooz_1.48.0.bb}    | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tooz_1.25.0.bb => python-tooz_1.48.0.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb b/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
rename to meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
index a46cf41..6260663 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "939eaf6c5e49d3a41e8c9f2e92126cfc"
-SRC_URI[sha256sum] = "d61639640b8e4fc64195306f8fae92cf271a002c690bf693ee51f9790cf8141e"
+SRC_URI[md5sum] = "8b39e07002f21c15d2a463b63d8a2952"
+SRC_URI[sha256sum] = "c1b17935207e9c4809feff91b679883928aa5bd3fce75e09b4945c261b513e60"
 
 inherit setuptools pypi
 
@@ -16,22 +16,17 @@ DEPENDS += " \
         python-pbr \
         "
 
-# RDEPENDS_default: 
+# RDEPENDS_default:
 RDEPENDS_${PN} += " \
-        python-kazoo \
-        python-zake \
-        python-sysv-ipc \
-        python-memcache \
         python-pbr \
-        python-babel \
         python-stevedore \
         python-six \
-        python-iso8601 \
+        python-voluptuous \
         python-msgpack \
         python-fasteners \
-        python-retrying \
+        python-tenacity \
+        python-futures \
         python-futurist \
         python-oslo.utils \
         python-oslo.serialization \
-        python-futures \
         "
-- 
2.7.4


