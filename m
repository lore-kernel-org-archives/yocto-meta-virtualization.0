Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24BF2E00A75; Mon, 21 Sep 2015 07:58:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 95E19E00306
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Sep 2015 07:57:54 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Sep 2015 16:57:51 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 21 Sep 2015 16:57:44 +0200
Message-ID: <1442847464-38235-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442847464-38235-1-git-send-email-josep.puigdemont@enea.com>
References: <1442847464-38235-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH] python packages: add build dependency on python-pbr
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
X-List-Received-Date: Mon, 21 Sep 2015 14:58:00 -0000
Content-Type: text/plain

Some packages fail to build because their dependency on
python-pbr during built time is not properly stated in the
recipe. Sometimes the build succeeds anyway because the
python-pbr package has already been built previously. To
avoid the occasional build failure, this patch adds a
dependency on python-pbr to all those packages that
declare it as a dependency in their setup.py file.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 4 ++++
 .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb         | 8 ++++++++
 meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb       | 4 ++++
 .../recipes-devtools/python/python-openstackclient_1.0.3.bb       | 8 ++++++++
 .../recipes-devtools/python/python-oslo.concurrency_1.5.0.bb      | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.context_git.bb | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb    | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb  | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.log_git.bb     | 1 +
 .../recipes-devtools/python/python-oslo.messaging_git.bb          | 2 ++
 .../recipes-devtools/python/python-oslo.middleware_0.4.0.bb       | 2 ++
 .../recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb         | 2 ++
 .../recipes-devtools/python/python-oslo.serialization_git.bb      | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb   | 2 ++
 meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb   | 5 +++++
 meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb | 2 ++
 meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb     | 2 ++
 meta-openstack/recipes-devtools/python/python-tooz_0.4.bb         | 2 ++
 18 files changed, 54 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
index a8ba1ed..5435b06 100644
--- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
@@ -25,6 +25,10 @@ inherit setuptools monitor
 
 FILES_${PN} += "${datadir}/${SRCNAME}"
 
+DEPENDS += " \
+   python-pbr \
+   "
+
 RDEPENDS_${PN} = "gmp \
    python-warlock \
    python-pyopenssl \
diff --git a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb b/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
index 3d6756a..383a76c 100644
--- a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
@@ -15,3 +15,11 @@ SRC_URI[sha256sum] = "de7d93338d3afb71cc4c53d713740316ead0af3a9c869b1231617347e9
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+DEPENDS += "\
+    python-pbr \
+    "
+
+RDEPENDS_${PN} += "\
+    python-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb
index 9e40686..bd1c9aa 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb
@@ -16,6 +16,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+DEPENDS += "\
+    python-pbr \
+"
+
 RDEPENDS_${PN} += " \
     python-pbr \
     python-fixtures \
diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
index ae8e82c..77cb5d2 100644
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.3.bb
@@ -14,3 +14,11 @@ SRC_URI[sha256sum] = "d39a2e6cf98d409f8545b9d3a207eb8cbf3b2fc5ea17b0f8d9bed52326
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+DEPENDS += "\
+    python-pbr \
+    "
+
+RDEPENDS_${PN} += "\
+    python-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb
index 50136ae..bdd3559 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb
@@ -20,8 +20,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
index 05034f9..d48abe5 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
@@ -18,9 +18,11 @@ inherit setuptools
 DEPENDS += " \
         python-pip \
         python-babel \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         bash \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb
index 04b5dd3..1c3a7b4 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb
@@ -18,6 +18,7 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 RDEPENDS_${PN} += " \
@@ -29,4 +30,5 @@ RDEPENDS_${PN} += " \
        python-sqlalchemy \
        python-sqlalchemy-migrate \
        python-stevedore \
+       python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
index fa710d0..d2bc53b 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
@@ -20,9 +20,11 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-babel \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
index 974578b..bfcbe31 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
@@ -18,6 +18,7 @@ inherit setuptools
 DEPENDS += " \
         python-pip \
         python-babel \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
index 8bb85cb..8841ec0 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
@@ -19,9 +19,11 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         bash \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
index 7f18179..6affd47 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
@@ -20,8 +20,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb
index 3a2477b..e3a47fa 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb
@@ -20,8 +20,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
index 451c6b9..db2869c 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
@@ -19,8 +19,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
index 27a80b6..33c7e53 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
@@ -19,8 +19,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb
index b3819e4..fae73cc 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb
@@ -19,6 +19,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+DEPENDS += " \
+    python-pbr \
+"
+
 RDEPENDS_${PN} = "python-fixtures \
                   python-subunit \
                   python-testrepository \
@@ -26,5 +30,6 @@ RDEPENDS_${PN} = "python-fixtures \
                   python-testtools \
                   python-mock \
                   python-mox \
+                  python-pbr \
                   bash \
 "
diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb
index 7e1fc09..1883dbb 100644
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb
@@ -20,10 +20,12 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-six \
         python-webob \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
index 6762b6c..1857063 100644
--- a/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
@@ -20,6 +20,7 @@ FILES_${PN} += "${datadir}/etc/${SRCNAME}/*"
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 RDEPENDS_${PN} += " \
@@ -30,4 +31,5 @@ RDEPENDS_${PN} += " \
       python-pytz \
       python-six \
       python-webob \
+      python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb b/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
index 1237f47..9ea75c3 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_0.4.bb
@@ -20,6 +20,7 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
@@ -28,4 +29,5 @@ RDEPENDS_${PN} += " \
         python-zake \
         python-sysv-ipc \
         python-memcache \
+        python-pbr \
         "
-- 
1.9.1


