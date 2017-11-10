Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EF74E00D4A; Fri, 10 Nov 2017 13:31:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 849F9E00D3A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:11 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAALVBrQ023693
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:11 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 10 Nov 2017 13:31:09 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 10 Nov 2017 16:30:58 -0500
Message-ID: <1510349460-18777-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
References: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/5] python-keystoneclient: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 10 Nov 2017 21:31:14 -0000
Content-Type: text/plain

This package no longer contains bash-completions, so drop this part of
the packaging. Remove old, no longer applicable patches. Update the
list of runtime dependencies, based on required.txt.

Requires the version update to python-django-openstack-auth.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../fix_keystoneclient_memory_leak.patch           | 37 --------------------
 ...ent-fix-test-path-to-example-certificates.patch | 31 -----------------
 .../python/python-keystoneclient_git.bb            | 40 ++++++++++------------
 3 files changed, 18 insertions(+), 90 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-keystoneclient/fix_keystoneclient_memory_leak.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-keystoneclient/keystoneclient-fix-test-path-to-example-certificates.patch

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient/fix_keystoneclient_memory_leak.patch b/meta-openstack/recipes-devtools/python/python-keystoneclient/fix_keystoneclient_memory_leak.patch
deleted file mode 100644
index 05a1d23..0000000
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient/fix_keystoneclient_memory_leak.patch
+++ /dev/null
@@ -1,37 +0,0 @@
----
- keystoneclient/openstack/common/apiclient/client.py |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
---- a/keystoneclient/openstack/common/apiclient/client.py
-+++ b/keystoneclient/openstack/common/apiclient/client.py
-@@ -90,6 +90,7 @@
-         self.user_agent = user_agent or self.user_agent
- 
-         self.times = []  # [("item", starttime, endtime), ...]
-+        self.times_max_len = 200
-         self.timings = timings
- 
-         # requests within the same session can reuse TCP connections from pool
-@@ -142,6 +143,12 @@
-     def reset_timings(self):
-         self.times = []
- 
-+    def get_timings_max_len(self):
-+        return self.times_max_len
-+
-+    def set_timings_max_len(self, new_len):
-+        self.times_max_len = new_len
-+
-     def request(self, method, url, **kwargs):
-         """Send an http request with the specified characteristics.
- 
-@@ -173,6 +180,9 @@
-         if self.timings:
-             self.times.append(("%s %s" % (method, url),
-                                start_time, time.time()))
-+            # remove oldest items until we maintain max length
-+            while len(self.times) > self.times_max_len:
-+                del self.times[0]
-         self._http_log_resp(resp)
- 
-         if resp.status_code >= 400:
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient/keystoneclient-fix-test-path-to-example-certificates.patch b/meta-openstack/recipes-devtools/python/python-keystoneclient/keystoneclient-fix-test-path-to-example-certificates.patch
deleted file mode 100644
index a75e1da..0000000
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient/keystoneclient-fix-test-path-to-example-certificates.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fae14f85d43da3842b2a065baf0442d61a573598 Mon Sep 17 00:00:00 2001
-From: Keith Holman <Keith.Holman@windriver.com>
-Date: Fri, 13 Jun 2014 17:08:03 -0400
-Subject: [PATCH] keystoneclient: fix test path to example certificates
-
-The tests included with keystoneclient expect them to be ran from the
-source tree.  This fix changes base path of the system to where they
-are actually deployed on the system.  This fix is required for some
-tests to work properly.
-
-Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
----
- keystoneclient/tests/client_fixtures.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/keystoneclient/tests/client_fixtures.py b/keystoneclient/tests/client_fixtures.py
-index 1743162..6bfcb93 100644
---- a/keystoneclient/tests/client_fixtures.py
-+++ b/keystoneclient/tests/client_fixtures.py
-@@ -25,7 +25,7 @@ from keystoneclient import utils
- 
- 
- TESTDIR = os.path.dirname(os.path.abspath(__file__))
--ROOTDIR = os.path.normpath(os.path.join(TESTDIR, '..', '..'))
-+ROOTDIR = os.path.normpath(os.path.join(TESTDIR, '..'))
- CERTDIR = os.path.join(ROOTDIR, 'examples', 'pki', 'certs')
- CMSDIR = os.path.join(ROOTDIR, 'examples', 'pki', 'cms')
- KEYDIR = os.path.join(ROOTDIR, 'examples', 'pki', 'private')
--- 
-1.9.3
-
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
index 0b67e40..e82c5f6 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
@@ -7,16 +7,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 SRCNAME = "keystoneclient"
 
 SRC_URI = "\
-	git://github.com/openstack/python-keystoneclient.git;branch=master \
-	file://fix_keystoneclient_memory_leak.patch \
+	git://github.com/openstack/python-keystoneclient.git;branch=stable/pike \
 	file://keystone-api-check.sh \
 	"
 
-PV = "1.7.1+git${SRCPV}"
-SRCREV = "28138b588224c6b0503620ac2e24bd37dad25370"
+PV = "3.13.0+git${SRCPV}"
+SRCREV = "7ff05baa1fa56f152173651f16fc6fd181291292"
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor rmargparse
+inherit setuptools monitor
 
 FILES_${PN}-doc += "${datadir}/keystoneclient" 
 
@@ -31,28 +30,25 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += " \
-	python-iso8601 \
-	python-prettytable \
-	python-requests \
-	python-simplejson \
-	python-oslo.config \
-	python-oslo.serialization \
-	python-pbr \
-	python-argparse \
-	"
-
-PACKAGECONFIG ?= "bash-completion"
-PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
+        bash \
+        python-pbr \
+        python-debtcollector \
+        python-keystoneauth1 \
+        python-oslo.config \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-positional \
+        python-requests \
+        python-six \
+        python-stevedore \
+        "
 
 do_install_append() {
-	install -d ${D}/${sysconfdir}/bash_completion.d
-	install -m 664 ${S}/tools/keystone.bash_completion ${D}/${sysconfdir}/bash_completion.d
-
 	cp -r ${S}/examples ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}
 }
 
-PACKAGES =+ " ${SRCNAME}-tests ${BPN}-bash-completion"
-FILES_${BPN}-bash-completion = "${sysconfdir}/bash_completion.d/*"
+PACKAGES =+ " ${SRCNAME}-tests"
 
 FILES_${SRCNAME}-tests = "${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/examples \
         "
-- 
2.7.4


