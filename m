Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0995E00DB1; Wed, 21 Aug 2019 22:26:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 479A3E00DAE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2019 22:26:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,415,1559491200"; d="scan'208";a="74047326"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2019 13:26:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C8824CE03EB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Aug 2019 13:26:23 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 22 Aug 2019 13:26:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 22 Aug 2019 13:25:50 +0800
Message-ID: <20190822052550.19674-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5C8824CE03EB.A939A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] libvirt: upgrade 5.5.0 -> 5.6.0
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
X-List-Received-Date: Thu, 22 Aug 2019 05:26:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
 recipes-extended/libvirt/{libvirt_5.5.0.bb => libvirt_5.6.0.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_5.5.0.bb => libvirt_5.6.0.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 796d6dd..ffbaa41 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "4c8c38c409f967b8b47e0d7c6df050a4"
-SRC_URI[libvirt_python.sha256sum] = "561cafedb83e41880405905f6309f4a86981cfe05edbbc83c839f7c47d8ba603"
+SRC_URI[libvirt_python.md5sum] = "143f83a2f89b6523a1b1c51be6a316b4"
+SRC_URI[libvirt_python.sha256sum] = "4df13fed9528a7eec153ab70196dcd481f6377ae5bf9ef84e07dfa1515202486"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.6.0.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_5.5.0.bb
rename to recipes-extended/libvirt/libvirt_5.6.0.bb
index de936c4..643c49e 100644
--- a/recipes-extended/libvirt/libvirt_5.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.6.0.bb
@@ -40,8 +40,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
           "
 
-SRC_URI[libvirt.md5sum] = "27c5fb6c8d2d46eb9e8165aeb3b499b0"
-SRC_URI[libvirt.sha256sum] = "2306ef0947a594f91ec9da4b8b0307bdb54b897f17de19f48e8ecdca08ff35e8"
+SRC_URI[libvirt.md5sum] = "e818bb25ead24119925781b7519a8401"
+SRC_URI[libvirt.sha256sum] = "65f4f9924e10135aa694ca8bcb0b55725883d08e0b32c42111603d573aabb9b4"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
 USERADD_PACKAGES = "${PN}"
-- 
2.7.4




