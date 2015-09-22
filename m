Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49FF4E00BD0; Tue, 22 Sep 2015 03:28:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D9BA3E0055C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Sep 2015 03:28:25 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 12:28:21 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 22 Sep 2015 12:28:21 +0200
Message-ID: <1442917701-55338-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][master][PATCH] python packages: add build dependency on python-pbr
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
X-List-Received-Date: Tue, 22 Sep 2015 10:28:28 -0000
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
 meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb    | 5 +++++
 meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 1 +
 .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb        | 8 ++++++++
 meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb | 8 ++++++++
 meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb      | 4 ++++
 .../recipes-devtools/python/python-openstackclient_1.1.0.bb      | 8 ++++++++
 .../recipes-devtools/python/python-oslo.concurrency_1.9.0.bb     | 2 ++
 .../recipes-devtools/python/python-oslo.context_git.bb           | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb   | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb | 1 +
 meta-openstack/recipes-devtools/python/python-oslo.log_git.bb    | 1 +
 .../recipes-devtools/python/python-oslo.messaging_git.bb         | 2 ++
 .../recipes-devtools/python/python-oslo.middleware_1.1.0.bb      | 2 ++
 .../recipes-devtools/python/python-oslo.policy_0.4.0.bb          | 2 ++
 .../recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb        | 2 ++
 .../recipes-devtools/python/python-oslo.serialization_git.bb     | 1 +
 meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb  | 2 ++
 .../recipes-devtools/python/python-oslo.vmware_1.19.0.bb         | 1 +
 meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb  | 5 +++++
 .../recipes-devtools/python/python-osprofiler_0.3.0.bb           | 2 ++
 meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb    | 2 ++
 .../recipes-devtools/python/python-testscenarios_0.5.0.bb        | 9 ++++++++-
 meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb | 5 ++++-
 meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb     | 2 ++
 24 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
index d8ef0af..49d4186 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
@@ -15,8 +15,13 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+DEPENDS += "\
+    python-pbr \
+    "
+
 RDEPENDS_${PN} += "python-prettytable \
             python-cmd2 \
+            python-pbr \
             python-pyparsing"
 
 CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
index ae32037..d80c570 100644
--- a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
@@ -28,5 +28,6 @@ RDEPENDS_${PN} = " \
    python-cinderclient \
    python-oslo.config \
    python-oslo.i18n \
+   python-pbr \
    "
 
diff --git a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb b/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
index 3d6756a..1915fc1 100644
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
+RDPENDS_${PN} += "\
+    python-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
index 35131a7..5ae891b 100644
--- a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
@@ -14,3 +14,11 @@ SRC_URI[sha256sum] = "9e42252f17d1dd89ee31745e0c4fbe58862c25147eb0ef5295c9cd9bcb
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils 
+
+DEPENDS += "\
+    python-pbr \
+    "
+
+RDEPENDS_${PN} += "\
+    python-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
index 7ef5276..6d58573 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
@@ -16,6 +16,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+DEPENDS += "\
+    python-pbr \
+    "
+
 RDEPENDS_${PN} += " \
     python-pbr \
     python-fixtures \
diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
index 3fd26d3..3aa733e 100644
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
@@ -14,3 +14,11 @@ SRC_URI[sha256sum] = "875b54ac95e29cc83ae76513b48306c8493c12d5ba7d23aea3432216f2
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
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb
index 76d3424..c82f6ba 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb
@@ -19,8 +19,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
index 05034f9..ec2651e 100644
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
         bash \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb
index 9ca1742..30f98f5 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb
@@ -17,6 +17,7 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 RDEPENDS_${PN} += " \
@@ -28,4 +29,5 @@ RDEPENDS_${PN} += " \
        python-sqlalchemy \
        python-sqlalchemy-migrate \
        python-stevedore \
+       python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
index 575a8e5..2b47833 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
@@ -25,4 +25,5 @@ DEPENDS += " \
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
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
index b368eca..5c891f3 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
@@ -19,8 +19,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb
index 2816559..bfd6953 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb
@@ -18,10 +18,12 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
 "
 
 RDEPENDS_${PN} += " \
         python-oslo.config \
         python-oslo.i18n \
         python-oslo.serialization \
+        python-pbr \
 "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb
index d087a38..d391ed3 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb
@@ -19,8 +19,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
index 7f0fb9c..db2869c 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
@@ -24,4 +24,5 @@ DEPENDS += " \
 
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
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
index ace65ba..f39ff57 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
@@ -21,4 +21,5 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += " \
+        python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb b/meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb
index 30cff23..6f4f766 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb
@@ -18,6 +18,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+DEPENDS += "\
+    python-pbr \
+    "
+
 RDEPENDS_${PN} = "python-fixtures \
                   python-subunit \
                   python-testrepository \
@@ -25,5 +29,6 @@ RDEPENDS_${PN} = "python-fixtures \
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
diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
index a363119..afdc99b 100644
--- a/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
@@ -19,6 +19,7 @@ FILES_${PN} += "${datadir}/etc/${SRCNAME}/*"
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 RDEPENDS_${PN} += " \
@@ -29,4 +30,5 @@ RDEPENDS_${PN} += " \
       python-pytz \
       python-six \
       python-webob \
+      python-pbr \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
index 34c241b..994b6b5 100644
--- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
@@ -16,4 +16,11 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-RDEPENDS_${PN} += " python-testtools"
+DEPENDS += "\
+    python-pbr \
+    "
+
+RDEPENDS_${PN} += "\
+    python-testtools \
+    python-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
index a58c91a..fe03a5f 100644
--- a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
@@ -21,4 +21,7 @@ DEPENDS += " \
     python-pbr \
 "
 
-RDEPENDS_${PN} += "python-extras"
+RDEPENDS_${PN} += "\
+    python-extras \
+    python-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb b/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
index dd4ed52..75e921e 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
@@ -19,6 +19,7 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr \
         "
 
 # RDEPENDS_default: 
@@ -27,4 +28,5 @@ RDEPENDS_${PN} += " \
         python-zake \
         python-sysv-ipc \
         python-memcache \
+        python-pbr \
         "
-- 
1.9.1


