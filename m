Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B77D5E00C10; Tue,  8 Dec 2015 09:35:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 015C6E00BEB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:47 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:46 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:44 +0100
Message-ID: <1449596034-8308-33-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 32/42] python-cliff: Fix object has no attribute debug error
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
X-List-Received-Date: Tue, 08 Dec 2015 17:35:14 -0000
Content-Type: text/plain

Apply fix provided by upstream for the "object has no attribute error"
when help is called.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 ...1-Fix-object-has-no-attribute-debug-error.patch | 32 ++++++++++++++++++++++
 .../recipes-devtools/python/python-cliff_1.10.0.bb |  5 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cliff/0001-Fix-object-has-no-attribute-debug-error.patch

diff --git a/meta-openstack/recipes-devtools/python/python-cliff/0001-Fix-object-has-no-attribute-debug-error.patch b/meta-openstack/recipes-devtools/python/python-cliff/0001-Fix-object-has-no-attribute-debug-error.patch
new file mode 100644
index 0000000..38d5343
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cliff/0001-Fix-object-has-no-attribute-debug-error.patch
@@ -0,0 +1,32 @@
+From f2c997161df01579cabf312a694289a1a83ae6ca Mon Sep 17 00:00:00 2001
+From: TerryHowe <terrylhowe@gmail.com>
+Date: Thu, 28 May 2015 07:55:11 -0600
+Subject: [PATCH] Fix object has no attribute debug error
+
+When print_help_if_requested is called, if there is an error,
+"object has no attribute 'debug'" gets printed out.  This is
+because the parser is passed in to the command rather than the
+parsed arguments.
+
+Change-Id: I1863421eff82b3f493d276432369ada9f783b165
+Partial-Bug: #1459519
+---
+ cliff/app.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cliff/app.py b/cliff/app.py
+index e052571..a41386a 100644
+--- a/cliff/app.py
++++ b/cliff/app.py
+@@ -198,7 +198,7 @@ class App(object):
+     def print_help_if_requested(self):
+         if self.deferred_help and self.options.deferred_help:
+             action = HelpAction(None, None, default=self)
+-            action(self.parser, self.parser, None, None)
++            action(self.parser, self.options, None, None)
+ 
+     def run(self, argv):
+         """Equivalent to the main program for the application.
+-- 
+2.1.0
+
diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
index e107a28..e7e1f7e 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
@@ -4,10 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PR = "r0"
 SRCNAME = "cliff"
 
-SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+    file://0001-Fix-object-has-no-attribute-debug-error.patch \
+    "
 
 SRC_URI[md5sum] = "8f3f67d57bf5a2541efeedcea1aa64ab"
 SRC_URI[sha256sum] = "209882e199fdf98aeed0db44b922aa688e5a66d81c45148a5743804f9aa680e1"
-- 
2.5.0


