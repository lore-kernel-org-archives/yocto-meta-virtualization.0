Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE1A0E00932; Wed,  4 Apr 2018 13:03:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D23E0E008F2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K39v2004214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:09 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:08 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:45 -0400
Message-ID: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 01/12] python-websockify: uprev to v0.8.0
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:11 -0000
Content-Type: text/plain

This version is required by the stable/pike version of python-nova.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/{python-websockify_0.6.0.bb => python-websockify_0.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-websockify_0.6.0.bb => python-websockify_0.8.0.bb} (69%)

diff --git a/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
similarity index 69%
rename from meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
index 386a227..641caab 100644
--- a/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3b5f97c9d64189899b91b3728bfd774"
 
-SRC_URI[md5sum] = "673a70d007c1a2445c8ef5c7a3067c07"
-SRC_URI[sha256sum] = "da4364f54fdcc5350059febe2e8fdf2b53d16cf04ee23c71315e561119f44529"
+SRC_URI[md5sum] = "8fa547ca4de84a96aa3472d55fbcdd59"
+SRC_URI[sha256sum] = "547d3d98c5081f2dc2872a2e4a3aef33e0ee5141d5f6209204aab2f4a41548d2"
 
 inherit setuptools pypi
 
-- 
2.7.4


