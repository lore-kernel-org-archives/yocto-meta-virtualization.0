Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D2B5E00D7B; Mon, 13 Nov 2017 11:32:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D73F3E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWb0m019649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:37 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:22 -0500
Message-ID: <1510601551-32245-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 02/11] python-ceilometerclient: uprev to latest stable/pike
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:38 -0000
Content-Type: text/plain

Drop old patches and update runtime dependency list.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../fix_ceilometerclient_memory_leak.patch         | 37 ----------------------
 .../python/python-ceilometerclient_git.bb          | 23 ++++++--------
 2 files changed, 9 insertions(+), 51 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-ceilometerclient/fix_ceilometerclient_memory_leak.patch

diff --git a/meta-openstack/recipes-devtools/python/python-ceilometerclient/fix_ceilometerclient_memory_leak.patch b/meta-openstack/recipes-devtools/python/python-ceilometerclient/fix_ceilometerclient_memory_leak.patch
deleted file mode 100644
index 8abc654..0000000
--- a/meta-openstack/recipes-devtools/python/python-ceilometerclient/fix_ceilometerclient_memory_leak.patch
+++ /dev/null
@@ -1,37 +0,0 @@
----
- ceilometerclient/openstack/common/apiclient/client.py |   12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
---- a/ceilometerclient/openstack/common/apiclient/client.py
-+++ b/ceilometerclient/openstack/common/apiclient/client.py
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
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
index a830e51..0341cac 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
@@ -9,30 +9,25 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} +=" \
-        python-cliff \
-	python-httplib2 \
-	python-iso8601 \
-	python-prettytable \
-	python-pyparsing \
-	python-simplejson \
-	python-pbr \
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-iso8601 \
+        python-keystoneauth1 \
         python-oslo.i18n \
         python-oslo.serialization \
         python-oslo.utils \
-        python-keystoneclient \
+        python-prettytable \
         python-requests \
         python-six \
         python-stevedore \
-	"
+        "
 
 SRC_URI = "\
-	git://github.com/openstack/python-ceilometerclient.git;branch=master \
-	file://fix_ceilometerclient_memory_leak.patch \
+	git://github.com/openstack/python-ceilometerclient.git;branch=stable/pike \
 	"
 
-PV = "1.5.0+git${SRCPV}"
-SRCREV = "daed7e59c383f1ca74d75160cbc99fbd89675648"
+PV = "2.9.0+git${SRCPV}"
+SRCREV = "4ee321feeef39fa2a297ad8e58e931b8a03d8f14"
 S = "${WORKDIR}/git"
 
 inherit setuptools rmargparse
-- 
2.7.4


