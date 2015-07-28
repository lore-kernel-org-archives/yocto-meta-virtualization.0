Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DF66E00A49; Tue, 28 Jul 2015 02:50:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
	TVD_SPACE_RATIO autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5312E00902
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 02:50:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98979447"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jul 2015 17:54:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6S9mwXA024499
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 17:48:59 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 28 Jul 2015 17:50:49 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 28 Jul 2015 17:50:05 +0800
Message-ID: <1438077007-1836-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 2/4] python-suds: upgrade 0.4 -> 0.4.1
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
X-List-Received-Date: Tue, 28 Jul 2015 09:50:53 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-suds_0.4.1.bb          | 15 +++++++++++++++
 meta-openstack/recipes-devtools/python/python-suds_0.4.bb | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-suds_0.4.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-suds_0.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-suds_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-suds_0.4.1.bb
new file mode 100644
index 0000000..5e12e37
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-suds_0.4.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Lightweight SOAP client"
+HOMEPAGE = "https://fedorahosted.org/suds/"
+SECTION = "devel/python"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=847e96bce86d8774f491a92924343a29"
+
+PR = "r0"
+SRCNAME = "suds"
+
+SRC_URI = "https://fedorahosted.org/releases/s/u/${SRCNAME}/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "95a2f04378931e973cbb3cca8f8d9765"
+SRC_URI[sha256sum] = "dd711c2635483733cd3aebf5073edf338595a2d2cae1398041f0273e9bdaac66"
+
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python-suds_0.4.bb b/meta-openstack/recipes-devtools/python/python-suds_0.4.bb
deleted file mode 100644
index 15a9973..0000000
--- a/meta-openstack/recipes-devtools/python/python-suds_0.4.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Lightweight SOAP client"
-HOMEPAGE = "https://fedorahosted.org/suds/"
-SECTION = "devel/python"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=847e96bce86d8774f491a92924343a29"
-
-PR = "r0"
-SRCNAME = "suds"
-
-SRC_URI = "https://fedorahosted.org/releases/s/u/${SRCNAME}/${PN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "05523dfd3fc0de3f19dde4aca5dd17e9"
-SRC_URI[sha256sum] = "66a2ee8dab56834d0a6b4ad88ed3daf2ff9824eeb9e5f66c93bf966d6db309d1"
-
-inherit setuptools
-- 
1.8.4.2


