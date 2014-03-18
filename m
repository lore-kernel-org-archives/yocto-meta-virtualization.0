Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 50860E00502
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Mar 2014 03:34:23 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 18 Mar 2014 11:34:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 9DB2E2800D0;
	Tue, 18 Mar 2014 11:34:14 +0100 (CET)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Mar 2014 11:34:12 +0100
Message-ID: <1395138852-21444-3-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
References: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/2] libvirt: Update version to 1.2.2
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
X-List-Received-Date: Tue, 18 Mar 2014 10:34:23 -0000
Content-Type: text/plain

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
 recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 2144a56..195a9de 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "e1effd6007b2ebd5d024c6c3838456fb"
-SRC_URI[libvirt_python.sha256sum] = "bce558606b157d0717ee7bd6537d85dd4c0321c59b4235c967db7a3aad80e246"
+SRC_URI[libvirt_python.md5sum] = "cd3b75c0eb64e933f0b648fbdca6e868"
+SRC_URI[libvirt_python.sha256sum] = "94d79d662b6010f6c688b8856b2d95077736d48ffa35feed5a339d7fafbf8c39"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_1.2.1.bb
rename to recipes-extended/libvirt/libvirt_1.2.2.bb
index e2c0f99..0cd6b99 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
@@ -31,8 +31,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://run-ptest \
           "
 
-SRC_URI[libvirt.md5sum] = "cce374220f67895afb6331bd2ddedbfd"
-SRC_URI[libvirt.sha256sum] = "bc29b5751bf36753c17e2fdbb75e70c7b07df3d9527586d3426e90f5f4abb898"
+SRC_URI[libvirt.md5sum] = "592958ad1ddce7574d8cb0a31e635acd"
+SRC_URI[libvirt.sha256sum] = "a48377e307c5c21b67e43db99af909a23c33aff8cbbaa3361fd389eb047cbbc3"
 
 inherit autotools gettext update-rc.d pkgconfig ptest
 
-- 
1.8.5.3


