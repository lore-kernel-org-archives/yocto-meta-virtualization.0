Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38A2BE00DDE; Wed, 16 Sep 2015 09:26:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2C31E00BED
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 09:26:40 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8GGQdVr022356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 09:26:39 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 09:26:38 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 16 Sep 2015 12:26:37 -0400
Message-ID: <1442420798-8646-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] libvirt: upgrade 1.2.17 -> 1.2.19
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
X-List-Received-Date: Wed, 16 Sep 2015 16:26:43 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The release notes is http://libvirt.org/news.html

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Roys' original patch with context fixed up to apply against the
latest. (non-thunking).

 .../{libvirt-1.2.17 => libvirt-1.2.19}/0001-to-fix-build-error.patch  | 0
 recipes-extended/libvirt/libvirt-python.inc                           | 4 ++--
 recipes-extended/libvirt/{libvirt_1.2.17.bb => libvirt_1.2.19.bb}     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt-1.2.17 => libvirt-1.2.19}/0001-to-fix-build-error.patch (100%)
 rename recipes-extended/libvirt/{libvirt_1.2.17.bb => libvirt_1.2.19.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
similarity index 100%
rename from recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch
rename to recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index f42e491..015b4b6 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "a695e323e33db562d86e947f7ac77f09"
-SRC_URI[libvirt_python.sha256sum] = "f4d3db4012a800a2519e62bbef4ce14a37e030a20ab18f5b66759533a39b36ed"
+SRC_URI[libvirt_python.md5sum] = "429e328028fc59b62404a4163004f2ae"
+SRC_URI[libvirt_python.sha256sum] = "88ab63b0c53e435bd2c6e8551805fe273353708efd4dfab908257dc5f37bec49"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.19.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_1.2.17.bb
rename to recipes-extended/libvirt/libvirt_1.2.19.bb
index 06cb51b..f433321 100644
--- a/recipes-extended/libvirt/libvirt_1.2.17.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
@@ -35,8 +35,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "a1f49050223be3cbd7678c32b1ee2756"
-SRC_URI[libvirt.sha256sum] = "e07eaf20b0590fae05ba3b53ad4dac3e5fbd771437563cc78b692f23ddd02fad"
+SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
+SRC_URI[libvirt.sha256sum] = "282c141f03331d640020c15f81464b27400e0ee307ef4c5190393b021caedd6e"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
-- 
2.1.4


