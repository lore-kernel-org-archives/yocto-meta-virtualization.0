Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D75DE00D7E; Mon, 13 Nov 2017 11:32:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46A19E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vADJWc4o017671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:38 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:38 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:23 -0500
Message-ID: <1510601551-32245-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 03/11] python-cinderclient: uprev to latest stable/pike
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:45 -0000
Content-Type: text/plain

Remove old patches and update runtime dependencies based on
requirements.txt

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../fix_cinderclient_memory_leak.patch             | 37 ----------------------
 .../python/python-cinderclient_git.bb              | 30 +++++++++---------
 2 files changed, 15 insertions(+), 52 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-cinderclient/fix_cinderclient_memory_leak.patch

diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient/fix_cinderclient_memory_leak.patch b/meta-openstack/recipes-devtools/python/python-cinderclient/fix_cinderclient_memory_leak.patch
deleted file mode 100644
index 137edfd..0000000
--- a/meta-openstack/recipes-devtools/python/python-cinderclient/fix_cinderclient_memory_leak.patch
+++ /dev/null
@@ -1,37 +0,0 @@
----
- cinderclient/openstack/common/apiclient/client.py |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
---- a/cinderclient/openstack/common/apiclient/client.py
-+++ b/cinderclient/openstack/common/apiclient/client.py
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
diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index e264694..bf76e9d 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -8,32 +8,32 @@ DEPENDS = "python-setuptools-git"
 SRCNAME = "python-cinderclient"
 
 SRC_URI = "\
-	git://github.com/openstack/python-cinderclient.git;branch=master \
-	file://fix_cinderclient_memory_leak.patch \
+	git://github.com/openstack/python-cinderclient.git;branch=stable/pike \
 	file://cinder-api-check.sh \
 	"
 
-PV="1.4.0+git${SRCPV}"
-SRCREV="c167dda40cc65fe437a12b815ef91bbde4efb6bb"
+PV="3.1.0+git${SRCPV}"
+SRCREV="3640aeab6e11987288a2f149fbeedb1c026045e2"
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor rmargparse
+inherit setuptools monitor
 
 DEPENDS += " \
         python-pip \
         python-pbr \
         "
 
-RDEPENDS_${PN} += "python-prettytable \
-                   python-simplejson \
-                   python-requests \
-                   python-setuptools-git \
-                   python-pbr \
-                   python-keystoneclient \
-                   python-babel \
-                   python-six \
-	           "
-
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-prettytable \
+        python-keystoneauth1 \
+        python-simplejson \
+        python-babel \
+        python-six \
+        python-oslo.i18n \
+        python-oslo.utils \
+        "
+	
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
 
-- 
2.7.4


