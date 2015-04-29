Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59C45E009E4; Tue, 28 Apr 2015 20:06:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8567AE009A6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:59 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T35xgK029701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:59 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:05:58 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:48 +0800
Message-ID: <d568691d75722e487008abcc3af1a20ef9b958aa.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/55] python-django-nose: upgrade to 1.4
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
X-List-Received-Date: Wed, 29 Apr 2015 03:06:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-django-nose_1.3.bb => python-django-nose_1.4.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-nose_1.3.bb => python-django-nose_1.4.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-nose_1.3.bb b/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-django-nose_1.3.bb
rename to meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
index b6a7566..a316c04 100644
--- a/meta-openstack/recipes-devtools/python/python-django-nose_1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
@@ -7,13 +7,12 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f88f52f66738ec7259424ce46e855c2"
 
-PR = "r0"
 SRCNAME = "django-nose"
 
 SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \ 
           "
-SRC_URI[md5sum] = "d39d72ac877cd67af6b41e129911fbfd"
-SRC_URI[sha256sum] = "3667d26a41fec30364a0ef72580832ca5328802d553f6d6e72af5ac21cb36365"
+SRC_URI[md5sum] = "2713d95286ea49860458a312d2efe653"
+SRC_URI[sha256sum] = "26cef3c6f62df2eee955a25195de6f793881317c0f5fd1a1c6f9e22f351a9313"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


