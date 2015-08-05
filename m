Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F87AE00B44; Wed,  5 Aug 2015 13:30:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 712D6E00A97
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KUDtP010711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:13 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:30:12 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:52 -0400
Message-ID: <1438806592-32745-12-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 11/11] horizon: add missing dependencies to address startup errors
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
X-List-Received-Date: Wed, 05 Aug 2015 20:30:17 -0000
Content-Type: text/plain

Horizon requires python-xstatic-angular-lrdragndrop and
xstatic-magic-search otherwise errors will prevent the dashboard from
being accessed. The depencies are spelled out clearly in the
openstack-dashboard-error.log, as per the following error:

ImportError: Could not import settings 'openstack_dashboard.settings'
(Is it on sys.path? Is there an import error in the settings file?):
No module named angular_lrdragndrop

Even with these added dependencies there are other issues that prevent
the dashboard from being accessed but at least with these dependencies
satisfied we can move on to fixing the remaining runtime issues.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-horizon_git.bb  |  4 +++-
 .../python-xstatic-angular-lrdragndrop_1.0.2.2.bb  | 22 ++++++++++++++++++++++
 .../python/python-xstatic-magic-search_0.2.5.1.bb  | 21 +++++++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 9dd764f..f5c6c03 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -40,6 +40,8 @@ RDEPENDS_${PN} += " python-django \
     python-xstatic-angular-mock \
     python-xstatic-angular-bootstrap \
     python-xstatic-angular-irdragndrop \
+    python-xstatic-angular-lrdragndrop \
+    python-xstatic-magic-search \
     python-xstatic-d3 \
     python-xstatic-hogan \
     python-xstatic-jasmine \
@@ -71,7 +73,7 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
     "
 
 SRCREV = "b99cf48ff346494198fb9740495eacc14fa406bf"
-PV = "2015.1.0+git${SRCPV}"
+PV = "2015.1.0+git${SRCPV}p1"
 S = "${WORKDIR}/git"
 
 inherit setuptools update-rc.d python-dir default_configs openstackchef monitor
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
new file mode 100644
index 0000000..1bc71a3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "LrDragNDrop javascript library packaged for setuptools"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-lrdragndrop"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=92d5d5d8e51c0c2f4f6db4a084a59173"
+
+SRCNAME = "XStatic-Angular-lrdragndrop"
+SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "afd682cab9f436cf22b025dfcabaa225"
+SRC_URI[sha256sum] = "1cf04495981db5dfd5536441e17ec69bb18d624f847ddc203f3259d81b10a77e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
new file mode 100644
index 0000000..23fb832
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "An AngularJS directive that provides a UI for both faceted filtering and as-you-type filtering"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Magic-Search"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e3d8469611ec04e52d71f2e293d54e9c"
+
+SRCNAME = "XStatic-Magic-Search"
+SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "cfb8a82129fffbe1f5c6339240cb6139"
+SRC_URI[sha256sum] = "9b2f35a5792f4e763e6dc319036e3676f3e18f46153096f3ab5e507177ec007e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        "
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.1.4


