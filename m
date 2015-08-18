Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36968E00861; Tue, 18 Aug 2015 02:42:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B7BCE00861
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 02:42:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99758957"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2015 17:45:48 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7I9gTOa006724
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Aug 2015 17:42:29 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 18 Aug 2015 17:42:31 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Aug 2015 17:42:10 +0800
Message-ID: <1439890931-6587-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 1/2] python-vcversioner: add new recipe
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

Add python-vcversioner,since the newer python-jsonschema depends on it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python/python-vcversioner_2.14.0.0.bb                | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
new file mode 100644
index 0000000..2fe96ab
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "http://github.com/Julian/jsonschema"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://vcversioner.py;beginline=1;endline=13;md5=b20bc154910c13368ad5ba54560f0b0c"
+
+SRCNAME = "vcversioner"
+
+SRC_URI = "http://pypi.python.org/packages/source/v/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
+SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.8.4.2


