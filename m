Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21879E00C9A; Fri, 18 Mar 2016 13:50:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76E50E00C90
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 13:50:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2IKoFvh025724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 13:50:15 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 13:50:14 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 18 Mar 2016 16:50:11 -0400
Message-ID: <1458334211-26727-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458334211-26727-1-git-send-email-mark.asselstine@windriver.com>
References: <1458334211-26727-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/3] python: satisfy setup.py 'setup_requires'
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
X-List-Received-Date: Fri, 18 Mar 2016 20:50:21 -0000
Content-Type: text/plain

Python setuptools will attempt to satisfy the packages defined as
'setup_requires' in setup.py by first looking for the package
availability locally and ultimately by downloading it from PyPI. This
is actually a huge security hole and packages should move to using pip
instead, but this is another story that the upstream packages have to
address. This also disregards BB_NO_NETWORK and may prove to introduce
host contamination.

The best approach is to ensure we have the -native version of the
'setup_requires' packages present such that setup.py will not attempt
to complete the download from PyPI.

Make 'pbr' -native available and for packages which we have identified
as having 'setup_requires' include 'pbr' add the necessary
python-pbr-native DEPENDS.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb     | 5 +++++
 meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb   | 5 +++++
 meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 5 +++++
 meta-openstack/recipes-devtools/python/python-heat_git.bb         | 5 +++++
 meta-openstack/recipes-devtools/python/python-heatclient_git.bb   | 5 +++++
 .../recipes-devtools/python/python-keystoneclient_git.bb          | 5 +++++
 meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb  | 5 +++++
 meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb       | 5 +++++
 meta-openstack/recipes-devtools/python/python-oslo.config_git.bb  | 5 +++++
 meta-openstack/recipes-devtools/python/python-oslo.context_git.bb | 5 +++++
 meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb    | 5 +++++
 meta-openstack/recipes-devtools/python/python-oslo.log_git.bb     | 5 +++++
 .../recipes-devtools/python/python-oslo.serialization_git.bb      | 5 +++++
 meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb   | 5 +++++
 meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb        | 4 ++++
 .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb    | 5 +++++
 meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb  | 5 +++++
 meta-openstack/recipes-devtools/python/python-swiftclient_git.bb  | 5 +++++
 .../recipes-devtools/python/python-testscenarios_0.5.0.bb         | 5 +++++
 meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb  | 8 ++++++--
 meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb       | 5 +++++
 21 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
index c241ab4..2c9341f 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
@@ -19,6 +19,11 @@ DEPENDS += "\
     python-pbr \
     "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    python-pbr-native \
+    "
+
 RDEPENDS_${PN} += "python-prettytable \
             python-cmd2 \
             python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
index c2b79e4..ac40e9d 100644
--- a/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
@@ -25,6 +25,11 @@ DEPENDS += " \
 	python-pbr \
 	"
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += "python-testtools \
 	python-pbr \
 	"
diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
index f9edf6d..22dc854 100644
--- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
@@ -24,6 +24,11 @@ inherit setuptools monitor rmargparse
 
 FILES_${PN} += "${datadir}/${SRCNAME}"
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    python-pbr-native \
+    "
+
 RDEPENDS_${PN} = "gmp \
    python-warlock \
    python-pyopenssl \
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index c2b2da7..e5c9b09 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -167,6 +167,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
         python-heatclient \
         python-sqlalchemy \
diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
index 10428c2..26d86be 100644
--- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
@@ -9,6 +9,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} +="python-cliff \
 	python-httplib2 \
 	python-iso8601 \
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
index 495f1e3..0b67e40 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
@@ -25,6 +25,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
 	python-iso8601 \
 	python-prettytable \
diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
index 5ae891b..9ba93df 100644
--- a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
@@ -19,6 +19,11 @@ DEPENDS += "\
     python-pbr \
     "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    python-pbr-native \
+    "
+
 RDEPENDS_${PN} += "\
     python-pbr \
     "
diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
index 6d58573..7eb948e 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
@@ -20,6 +20,11 @@ DEPENDS += "\
     python-pbr \
     "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    python-pbr-native \
+    "
+
 RDEPENDS_${PN} += " \
     python-pbr \
     python-fixtures \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
index abd3269..9eaec3c 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
@@ -19,6 +19,11 @@ DEPENDS += " \
         python-pip \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
     python-pbr \
     python-netaddr \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
index 3543cae..28285ad 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
@@ -19,6 +19,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         bash \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
index 84aab41..55d6317 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
@@ -21,6 +21,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-babel \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
index d4f7fe0..b290863 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
@@ -19,6 +19,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         bash \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
index 32b1cc3..1bf11f4 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
@@ -20,6 +20,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
index a833f6c..3bacd7c 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
@@ -20,6 +20,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
index fdf80b3..2018a1b 100644
--- a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
@@ -21,6 +21,10 @@ DEPENDS += " \
         python-pip \
         "
 
+DEPENDS_class-native += ""
+
 # RDEPENDS_default:
 RDEPENDS_${PN} += " \
         "
+
+BBCLASSEXTEND = "native"
diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
index 32ecdb3..5c3636e 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
@@ -20,6 +20,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += "python-sqlalchemy  \
 	python-decorator \
 	python-tempita  \
diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
index bdacb14..0029c2a 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
@@ -20,6 +20,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
         python-pbr \
         python-argparse \
diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
index 1c506a8..5f423c4 100644
--- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
@@ -24,6 +24,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
         python-simplejson \
         python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
index 994b6b5..a777b31 100644
--- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
@@ -20,6 +20,11 @@ DEPENDS += "\
     python-pbr \
     "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    python-pbr-native \
+    "
+
 RDEPENDS_${PN} += "\
     python-testtools \
     python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
index fe03a5f..3138aae 100644
--- a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
@@ -16,10 +16,14 @@ SRC_URI[sha256sum] = "8afd6400fb4e75adb0b29bd09695ecb2024cd7befab4677a58c147701a
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
-
 DEPENDS += " \
     python-pbr \
-"
+    "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    python-pbr-native \
+    "
 
 RDEPENDS_${PN} += "\
     python-extras \
diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
index 523c3df..db89474 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
@@ -20,6 +20,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += "\
         python-pbr \
         "
-- 
2.1.4


