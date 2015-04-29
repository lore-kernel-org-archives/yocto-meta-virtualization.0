Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19314E009E4; Tue, 28 Apr 2015 20:06:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E93CE00932
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:58 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T35wls009361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:58 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:05:57 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:47 +0800
Message-ID: <4da93718b859b1653a6cf135ba950948dd02218d.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/55] python-django-compressor: upgrade to 1.5
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
 ...thon-django-compressor_1.4.bb => python-django-compressor_1.5.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-compressor_1.4.bb => python-django-compressor_1.5.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-compressor_1.4.bb b/meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-django-compressor_1.4.bb
rename to meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb
index 7989468..b33aed6 100644
--- a/meta-openstack/recipes-devtools/python/python-django-compressor_1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9f8de96acfc347c41ce7c15f2e918ef6"
 
-PR = "r0"
 SRCNAME = "django_compressor"
 
 SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "dc050f1a85f83f927f94bcb09e8bdd0f"
-SRC_URI[sha256sum] = "b26034230efcef7d60e5267890eda656dfc49c567f27125d907eee4fe7f9a6ec"
+SRC_URI[md5sum] = "274dd82a45ddd13e111852dd101a5924"
+SRC_URI[sha256sum] = "0189fd1dbf87d802f4e4e21ebc9220f29bbb7771b252a958ad6119f61453e22e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


