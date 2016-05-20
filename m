Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66FDBE00EC4; Thu, 19 May 2016 23:34:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C479FE009B8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:34:18 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4K6YHAV031097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:34:17 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 23:34:16 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 May 2016 14:34:15 +0800
Message-ID: <1463726055-4807-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [meta-cloud-services][PATCH] python-repoze: Add license to avoid warning
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
X-List-Received-Date: Fri, 20 May 2016 06:34:20 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

"WARNING: python-repoze.who: No generic license file exists for: BSD-derived in
any provider"

Add BSD Modification Variant license

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-openstack/licenses/BSD-Modification           | 35 ++++++++++++++++++++++
 .../python/python-repoze.who_2.2.bb                |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-openstack/licenses/BSD-Modification

diff --git a/meta-openstack/licenses/BSD-Modification b/meta-openstack/licenses/BSD-Modification
new file mode 100644
index 0000000..f74b496
--- /dev/null
+++ b/meta-openstack/licenses/BSD-Modification
@@ -0,0 +1,35 @@
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are
+met:
+
+1.  Redistributions in source code must retain the accompanying
+    copyright notice, this list of conditions, and the following
+    disclaimer.
+
+2.  Redistributions in binary form must reproduce the accompanying
+    copyright notice, this list of conditions, and the following
+    disclaimer in the documentation and/or other materials provided
+    with the distribution.
+
+3.  Names of the copyright holders must not be used to endorse or
+    promote products derived from this software without prior
+    written permission from the copyright holders.
+
+4.  If any files are modified, you must cause the modified files to
+    carry prominent notices stating that you changed the files and
+    the date of any change.
+
+Disclaimer
+
+  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND
+  ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+  HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
+  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+  TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
+  THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+  SUCH DAMAGE.
diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
index 35e5821..0bd1d42 100644
--- a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "An identification and authentication framework for WSGI"
 HOMEPAGE = "http://repoze.org/"
 SECTION = "devel/python"
-LICENSE = "BSD-derived"
+LICENSE = "BSD-Modification"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
 
 
-- 
1.9.1


