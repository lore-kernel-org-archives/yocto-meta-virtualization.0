Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D07BFE00BEB; Tue,  8 Dec 2015 09:34:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id AA1CAE00546
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:27 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:26 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:31 +0100
Message-ID: <1449596034-8308-20-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 19/42] json: upgrade 1.8.1 -> 1.8.3
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:44 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

Dropped 0001-Dont-compile-extensions.patch, it is not needed anymore.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../ruby/json/0001-Dont-compile-extensions.patch     | 20 --------------------
 meta-openstack/recipes-devtools/ruby/json_git.bb     |  5 ++---
 2 files changed, 2 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch

diff --git a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch b/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
deleted file mode 100644
index 0c2f513..0000000
--- a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From 8c6e4b688cc7feade17caa832f9304262025fd17 Mon Sep 17 00:00:00 2001
-From: Qian Lei <qianl.fnst@cn.fujitsu.com>
-Date: Tue, 27 Jan 2015 19:34:26 +0800
-Subject: [PATCH] Dont compile extensions
-
-Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
----
- json.gemspec | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json.gemspec b/json.gemspec
-index 75926b1..af7e9ca 100644
---- a/json.gemspec
-+++ b/json.gemspec
-@@ -13 +13 @@ Gem::Specification.new do |s|
--  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
-+#  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
--- 
-1.8.3.1
-
diff --git a/meta-openstack/recipes-devtools/ruby/json_git.bb b/meta-openstack/recipes-devtools/ruby/json_git.bb
index f738ece..a417798 100644
--- a/meta-openstack/recipes-devtools/ruby/json_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/json_git.bb
@@ -9,15 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aef161fe3c86f1a8d6c71d3b8c5655c5"
 
 PR = "r0"
 
-BPV = "1.8.1"
+BPV = "1.8.3"
 PV = "${BPV}"
-SRCREV = "92a96dea2b24b9c68856004d69491f46aedd0925"
+SRCREV = "db4c71a7701b95c30f945ee1536240920dcfdc17"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://github.com/flori/json.git \
-    file://0001-Dont-compile-extensions.patch \
     "
 
 inherit ruby
-- 
2.5.0


