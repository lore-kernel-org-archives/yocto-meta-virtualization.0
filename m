Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCB06E00C4A; Wed,  2 Dec 2015 08:34:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 55A4EE0086A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:43 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:42 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:41 +0100
Message-ID: <1449073966-29707-36-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 35/40] horizon: add missing dependencies to address startup errors
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:23 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

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
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>

Conflicts:
	meta-openstack/recipes-devtools/python/python-horizon_git.bb
---
 .../recipes-devtools/python/python-horizon_git.bb  |  7 +++++--
 .../python-xstatic-angular-lrdragndrop_1.0.2.2.bb  | 22 ++++++++++++++++++++++
 .../python/python-xstatic-magic-search_0.2.5.1.bb  | 21 +++++++++++++++++++++
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index d0a9bab..b7c0046 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -39,6 +39,9 @@ RDEPENDS_${PN} += " python-django \
     python-xstatic-angular-cookies \
     python-xstatic-angular-mock \
     python-xstatic-angular-bootstrap \
+    python-xstatic-angular-irdragndrop \
+    python-xstatic-angular-lrdragndrop \
+    python-xstatic-magic-search \
     python-xstatic-d3 \
     python-xstatic-hogan \
     python-xstatic-jasmine \
@@ -70,8 +73,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
     file://horizon-use-full-package-path-to-test-directories.patch \
     "
 
-SRCREV="9b37723a21e88c29732e2a4a9eeeecb9ecf19204"
-PV="2015.1.0b2+git${SRCPV}"
+SRCREV = "b99cf48ff346494198fb9740495eacc14fa406bf"
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
2.1.0


