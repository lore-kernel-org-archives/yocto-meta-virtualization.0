Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBFDDE00D9C; Mon, 13 Nov 2017 11:32:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99207E00DAB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:51 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWpVZ010451
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:51 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:50 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:30 -0500
Message-ID: <1510601551-32245-11-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 10/11] python-xstatic-*: uprev to required versions
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:59 -0000
Content-Type: text/plain

The python-horizon requires specific versions of the various
python-xstatic-* per its requirements.txt file. Being 'xtatic'
packages these have no additional dependencies so the uprevs are
mostly straitforward version updates with a check that the license
hasn't changed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ....2.bb => python-xstatic-angular-bootstrap_2.2.0.0.bb} | 15 +++++----------
 ....0.2.bb => python-xstatic-angular-gettext_2.3.8.0.bb} | 13 +++++--------
 ...ular_1.3.7.0.bb => python-xstatic-angular_1.5.8.0.bb} | 15 +++++----------
 ...2.0.0.bb => python-xstatic-bootstrap-scss_3.3.7.1.bb} | 15 +++++----------
 ...h_3.3.5.3.bb => python-xstatic-bootswatch_3.3.7.0.bb} | 11 ++++-------
 ...tatic-d3_3.1.6.2.bb => python-xstatic-d3_3.5.17.0.bb} | 15 +++++----------
 ...4.3.0.0.bb => python-xstatic-font-awesome_4.7.0.0.bb} | 16 ++++++----------
 ...mine_2.1.2.0.bb => python-xstatic-jasmine_2.4.1.1.bb} | 14 +++++---------
 ...pt_2.0.0.2.bb => python-xstatic-jsencrypt_2.3.1.1.bb} | 15 +++++----------
 ....3.2.bb => python-xstatic-roboto-fontface_0.5.0.0.bb} | 13 +++++--------
 ...m.js_0.0.4.2.bb => python-xstatic-term.js_0.0.7.0.bb} | 15 +++++----------
 11 files changed, 55 insertions(+), 102 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular-bootstrap_0.11.0.2.bb => python-xstatic-angular-bootstrap_2.2.0.0.bb} (38%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular-gettext_2.1.0.2.bb => python-xstatic-angular-gettext_2.3.8.0.bb} (42%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular_1.3.7.0.bb => python-xstatic-angular_1.5.8.0.bb} (43%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-bootstrap-scss_3.2.0.0.bb => python-xstatic-bootstrap-scss_3.3.7.1.bb} (36%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-bootswatch_3.3.5.3.bb => python-xstatic-bootswatch_3.3.7.0.bb} (53%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-d3_3.1.6.2.bb => python-xstatic-d3_3.5.17.0.bb} (42%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-font-awesome_4.3.0.0.bb => python-xstatic-font-awesome_4.7.0.0.bb} (42%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jasmine_2.1.2.0.bb => python-xstatic-jasmine_2.4.1.1.bb} (43%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jsencrypt_2.0.0.2.bb => python-xstatic-jsencrypt_2.3.1.1.bb} (43%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-roboto-fontface_0.4.3.2.bb => python-xstatic-roboto-fontface_0.5.0.0.bb} (39%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-term.js_0.0.4.2.bb => python-xstatic-term.js_0.0.7.0.bb} (39%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-bootstrap_0.11.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-bootstrap_2.2.0.0.bb
similarity index 38%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular-bootstrap_0.11.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-angular-bootstrap_2.2.0.0.bb
index aac0fa7..1265e4b 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-bootstrap_0.11.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-bootstrap_2.2.0.0.bb
@@ -2,19 +2,14 @@ DESCRIPTION = "Angular JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Bootstrap"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2e4ff6677f43e488434dd77116b7f7ff"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-PR = "r0"
+PYPI_PACKAGE = "XStatic-Angular-Bootstrap"
 
-SRCNAME = "XStatic-Angular-Bootstrap"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "1d7d02580f022c36628f99fbf40e39c9"
+SRC_URI[sha256sum] = "61b0a86aad66bf0d333ed24496f51d77cb20ad5bf664140d86e880b15a231166"
 
-SRC_URI[md5sum] = "bac078c4e6496367677680c89162ee83"
-SRC_URI[sha256sum] = "cbe428bf04c000460776b521f6ace0455e9f3f20135499e9aa2f4af693dc7b3e"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 DEPENDS += " \
         python-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.1.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb
similarity index 42%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.1.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb
index 0f270b2..d9c14a2 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb
@@ -2,17 +2,14 @@ DESCRIPTION = "Angular-Gettext javascript library packaged for setuptools (easy_
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Gettext"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=46d1a7b9d85c18f6acc979ab4e2ae6d9"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCNAME = "XStatic-Angular-Gettext"
-SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+PYPI_PACKAGE = "XStatic-Angular-Gettext"
 
-SRC_URI[md5sum] = "371919adc1c6d6a45085f8a006b44efa"
-SRC_URI[sha256sum] = "c0745f433bb2f87d8222cdd65690c9089f5128c736309c3bc8d689aec39fa493"
+SRC_URI[md5sum] = "de55242cf5dc5fa712ac7e4a53aeb12b"
+SRC_URI[sha256sum] = "18db14dccaae5d64a9b66d08d0134b6c154fc1fb1e216964bba8e403e03c870e"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 DEPENDS += " \
         python-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular_1.3.7.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular_1.5.8.0.bb
similarity index 43%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular_1.3.7.0.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-angular_1.5.8.0.bb
index 39e5e6c..360fbfc 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular_1.3.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular_1.5.8.0.bb
@@ -2,19 +2,14 @@ DESCRIPTION = "Angular JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fef10afacf31c10c1fb9ce04e3763269"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-PR = "r0"
+PYPI_PACKAGE = "XStatic-Angular"
 
-SRCNAME = "XStatic-Angular"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "15384e734161d31ff18a644f9632f25b"
+SRC_URI[sha256sum] = "b1dcdd7a66d3041625698bba2ac480ffc2447b05f551f10fcae2ac33139eb033"
 
-SRC_URI[md5sum] = "fa26884ab0b2acfa09e372aedd7e7b04"
-SRC_URI[sha256sum] = "7cad216b226399cbe8d2909ed5b9f28d724907b9c9e1e078e6e25d320a3d5dd7"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 # DEPENDS_default: python-pip
 
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.2.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb
similarity index 36%
rename from meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.2.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb
index 703bd71..b5d714e 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.2.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb
@@ -2,19 +2,14 @@ DESCRIPTION = "%DESCRIPTION%"
 HOMEPAGE = "%URL%"
 SECTION = "devel/python"
 LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=21ce610a6aa67eed6d6867db316597ee"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-PR = "r0"
+PYPI_PACKAGE = "XStatic-Bootstrap-SCSS"
 
-SRCNAME = "XStatic-Bootstrap-SCSS"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "cc0d26647d10e1de84ba6649d3264f77"
+SRC_URI[sha256sum] = "4d388df037293163bf3242e0b60c79d06e1f743af8b0be8473f92676340e5acd"
 
-SRC_URI[md5sum] = "903d7de8aef6bee93d976b42d35edf7b"
-SRC_URI[sha256sum] = "7e9858737e2e6aac921ec7a3fca627e522901c3061611e154ebc0b8a892c7018"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 # DEPENDS_default: python-pip
 
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.5.3.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb
similarity index 53%
rename from meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.5.3.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb
index a0a0ecc..1b95871 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.5.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb
@@ -4,15 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCNAME = "XStatic-bootswatch"
-SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+PYPI_PACKAGE = "XStatic-bootswatch"
 
-SRC_URI[md5sum] = "b7c76560828274bdcfee3f5e6fc5a147"
-SRC_URI[sha256sum] = "3c018cb0fdf591a520b2832a4ba8d8face633c765f29f9ccca8275b47be8aa94"
+SRC_URI[md5sum] = "422f09e076ff1741b76a9f7554ceca32"
+SRC_URI[sha256sum] = "93ee5863c1ec07212fe12ae137a10708b4102720391d460f061dd3f441ba3b6e"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 DEPENDS += " \
         python-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-d3_3.1.6.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-d3_3.5.17.0.bb
similarity index 42%
rename from meta-openstack/recipes-devtools/python/python-xstatic-d3_3.1.6.2.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-d3_3.5.17.0.bb
index ee33537..2a7ae7d 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-d3_3.1.6.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-d3_3.5.17.0.bb
@@ -2,19 +2,14 @@ DESCRIPTION = "D3 JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-D3"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0acf9e872391f112ea29deaa9fb0cab5"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-PR = "r0"
+PYPI_PACKAGE = "XStatic-D3"
 
-SRCNAME = "XStatic-D3"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "2729f32f218b122999c26daeaf67a0a8"
+SRC_URI[sha256sum] = "176e93eee7192e07fc54334ddb1a6b64fcfc8cde6abb23f65727856bb9dd1829"
 
-SRC_URI[md5sum] = "835164e50cfbeb781a42e4d16f75a50c"
-SRC_URI[sha256sum] = "46fe521f8dad99f5e20f6702180510c37b81d11f1d78119d308fcec31381f90e"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 # DEPENDS_default: python-pip
 
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
similarity index 42%
rename from meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
index 4f90fbb..76ae529 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
@@ -1,19 +1,15 @@
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=821ae461252f11e98fefe8bdfaa130ca"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=fac3a519e5e9eb96316656e0ca4f2b90"
 
+PYPI_PACKAGE = "XStatic-Font-Awesome"
 
-SRCNAME = "XStatic-Font-Awesome"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
+SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
 
-SRC_URI[md5sum] = "56e637fe7b3dcdd2ebd683996ad60759"
-SRC_URI[sha256sum] = "d2c0548990a22744ad20013e1d095de8ba1ea56b1878d8393a721205b03885c3"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 # DEPENDS_default: python-pip
 
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.4.1.1.bb
similarity index 43%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.4.1.1.bb
index 529a2de..b68fb62 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.4.1.1.bb
@@ -2,18 +2,14 @@ DESCRIPTION = "Jasmine JavaScript library packaged for setuptools "
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Jasmine"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=eb6b9af5c233043f32ed0225d52cf4a4"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+PYPI_PACKAGE = "XStatic-Jasmine"
 
-SRCNAME = "XStatic-Jasmine"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "9378ce965dfcb4ddb64855cc717d4ec8"
+SRC_URI[sha256sum] = "d1e8bf3c0e1cf683cc2c0aad95f197e9e51ea747fb91291445223a2b7dbc4740"
 
-SRC_URI[md5sum] = "63fdb4a8668eb70ceef1a311e8b02dcb"
-SRC_URI[sha256sum] = "ba80ab9a324a7abfa5bb4855aaca279aceaf3e0223830d28a17a994770ecc1b4"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 # DEPENDS_default: python-pip
 
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.0.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.3.1.1.bb
similarity index 43%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.0.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.3.1.1.bb
index a891f5c..3ddcd89 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.0.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.3.1.1.bb
@@ -2,19 +2,14 @@ DESCRIPTION = "JSEncrypt JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-JSEncrypt"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=42bc00ba34391939fc6c1f4898c187b3"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-PR = "r0"
+PYPI_PACKAGE = "XStatic-JSEncrypt"
 
-SRCNAME = "XStatic-JSEncrypt"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "4b03331d4b2f6c12e2e4b8ee6056bda0"
+SRC_URI[sha256sum] = "a277912a4f70d1d2f58c8d94b992d244e69fcf851a2cbed5d83cb4fc422a72f2"
 
-SRC_URI[md5sum] = "a2a24f2990500d6709643c3413dd93f8"
-SRC_URI[sha256sum] = "5852892afc6f80c7848f4110b6dad190a54aeb908271d67aaeae9d966f4a26b5"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 # DEPENDS_default: python-pip
 
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb
similarity index 39%
rename from meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb
index cba2389..3c828b4 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb
@@ -2,17 +2,14 @@ DESCRIPTION = "A simple package providing the Roboto fontface."
 HOMEPAGE = "https://github.com/choffmeister/roboto-fontface-bower"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7eeeb6915ae97fbbac6282f36b6fcaaa"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRCNAME = "XStatic-roboto-fontface"
-SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+PYPI_PACKAGE = "XStatic-roboto-fontface"
 
-SRC_URI[md5sum] = "2a19734d8e08bbe1413f37e703e288f8"
-SRC_URI[sha256sum] = "e539aa991300d8ee09ee557d3cab1066237806e365ceaf868084777379e307a5"
+SRC_URI[md5sum] = "32273ba68fa063623461db0b0767524f"
+SRC_URI[sha256sum] = "6d272df58e20eec3a15bca279163f38614c7074e2fecb537a58b29d109e83f62"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 DEPENDS += " \
         python-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.4.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.7.0.bb
similarity index 39%
rename from meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.4.2.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.7.0.bb
index 79221c0..ef37760 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.4.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.7.0.bb
@@ -2,19 +2,14 @@ DESCRIPTION = "Angular JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-term.js/0.0.4.2"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0d4ffb2adc6dcb63bbd77832cf91447e"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-PR = "r0"
+PYPI_PACKAGE = "XStatic-term.js"
 
-SRCNAME = "XStatic-term.js"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "7434ecf6f5680c293cf3806245dc946b"
+SRC_URI[sha256sum] = "b5f3ab69cb638391f04254913a11b2aab08e2d51c5b81bb6a564c5a6d442bd31"
 
-SRC_URI[md5sum] = "2224354fa1d98599d9383df5b2e749b7"
-SRC_URI[sha256sum] = "1ed5c1cd4de60d6f290a032bfc7cdc4261d8d36cb7788b2b0a610551bbda15ec"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 DEPENDS += " \
         python-pip \
-- 
2.7.4


