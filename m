Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD20DE00A38; Tue, 18 Aug 2015 02:42:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1BD1E009B3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 02:42:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99758958"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2015 17:45:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7I9gU8I006727
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 17:42:31 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 18 Aug 2015 17:42:33 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Aug 2015 17:42:11 +0800
Message-ID: <1439890931-6587-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1439890931-6587-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1439890931-6587-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 2/2] python-jsonschema: upgrade 2.4.0 -> 2.5.1
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
X-List-Received-Date: Tue, 18 Aug 2015 09:42:35 -0000
Content-Type: text/plain

The newer python-jsonschema depends on python-vcversioner.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../{python-jsonschema_2.4.0.bb => python-jsonschema_2.5.1.bb}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.4.0.bb => python-jsonschema_2.5.1.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-jsonschema_2.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
index e27a242..a3a7ec0 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
@@ -9,9 +9,11 @@ SRCNAME = "jsonschema"
 
 SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "f645c88123189976058fcf550c02e50f"
-SRC_URI[sha256sum] = "acf1e360b4682d64ba6acc35dbc65d81d9bde68a291a97f14f16f4282733f5a4"
+SRC_URI[md5sum] = "e491298485bdefeecb0f1ca3d65e5292"
+SRC_URI[sha256sum] = "9088494da4c74497a7a27842ae4ca9c3355b5f7754121edc440463eaf020f079"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+DEPENDS += "python-vcversioner"
-- 
1.8.4.2


