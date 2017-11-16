Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1265E00CF5; Wed, 15 Nov 2017 18:19:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B29BE00C45
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 18:19:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30214036"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Nov 2017 10:19:43 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id BF2DE41860C7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Nov 2017 10:19:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 16 Nov 2017 10:19:41 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 Nov 2017 16:23:03 +0800
Message-ID: <1510820583-62275-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: BF2DE41860C7.A7FE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-psycopg2: update to 2.7.3.2
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
X-List-Received-Date: Thu, 16 Nov 2017 02:19:46 -0000
Content-Type: text/plain

1) Upgrade python-psycopg2 from 2.6.2 to 2.7.3.2.

2) Update the remove-pg-config.patch for 2.7.3.2.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-psycopg2/remove-pg-config.patch  | 29 +++++++++++-----------
 ...sycopg2_2.6.2.bb => python-psycopg2_2.7.3.2.bb} |  6 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.6.2.bb => python-psycopg2_2.7.3.2.bb} (60%)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
index 37acc30..4a29724 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
@@ -1,31 +1,32 @@
-From 92d42775735d1555449b860c214ca7265d7ad75b Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Tue, 24 Jan 2017 00:43:35 +0900
-Subject: [PATCH] setup: don't use pg_config
+Subject: [PATCH] Subject: [PATCH] setup: don't use pg_config
+
+Update for psycopg2_2.7.3.2.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- setup.cfg | 1 +
+ setup.cfg | 2 +-
  setup.py  | 5 +----
- 2 files changed, 2 insertions(+), 4 deletions(-)
+ 2 files changed, 2 insertions(+), 5 deletions(-)
 
 diff --git a/setup.cfg b/setup.cfg
-index d00ce92..4b45aac 100644
+index b629abf..64bc1ca 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -1,5 +1,6 @@
+@@ -1,6 +1,6 @@
  [build_ext]
  define = 
-+pg_config="/bin/true"
+-pg_config = 
++pg_config = "/bin/true"
  use_pydatetime = 1
+ mx_include_dir = 
  have_ssl = 0
- 
 diff --git a/setup.py b/setup.py
-index d71d489..b101696 100644
+index 86f32d2..d805548 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -398,16 +398,13 @@ class psycopg_build_ext(build_ext):
+@@ -404,16 +404,13 @@ class psycopg_build_ext(build_ext):
              self.libraries.append("pq")
  
          try:
@@ -39,10 +40,10 @@ index d71d489..b101696 100644
                  pgversion = pg_config_helper.query("version").split()[1]
              except:
 -                pgversion = "7.4.0"
-+                pgversion = "9.4.4"
++                pgversion = "9.4.13"
  
              verre = re.compile(
-                 r"(\d+)\.(\d+)(?:(?:\.(\d+))|(devel|(alpha|beta|rc)\d+))")
+                 r"(\d+)(?:\.(\d+))?(?:(?:\.(\d+))|(devel|(?:alpha|beta|rc)\d+))?")
 -- 
 2.7.4
 
diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.3.2.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.7.3.2.bb
index 2cdb138..8f7fd77 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.3.2.bb
@@ -8,12 +8,12 @@ DEPENDS = "postgresql"
 PR = "r0"
 SRCNAME = "psycopg2"
 
-SRC_URI = "https://pypi.python.org/packages/7b/a8/dc2d50a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/dd/47/000b405d73ca22980684fd7bd3318690cc03cfa3b2ae1c5b7fff8050b28a/${SRCNAME}-${PV}.tar.gz \
            file://remove-pg-config.patch \
           "
 
-SRC_URI[md5sum] = "4a392949ba31a378a18ed3e775a4693f"
-SRC_URI[sha256sum] = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c"
+SRC_URI[md5sum] = "8114e672d5f23fa5329874a4314fbd6f"
+SRC_URI[sha256sum] = "5c3213be557d0468f9df8fe2487eaf2990d9799202c5ff5cb8d394d09fad9b2a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




