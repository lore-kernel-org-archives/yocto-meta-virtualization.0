Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A57AE00828; Mon, 23 Jan 2017 00:25:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6532EE007EB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 00:25:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15004294"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 16:25:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C8CE247B1510
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 16:25:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 16:25:46 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 16:25:25 +0800
Message-ID: <1485159925-6652-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C8CE247B1510.A6943
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-psycopg2: 2.6.1 -> 2.6.2
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
X-List-Received-Date: Mon, 23 Jan 2017 08:25:58 -0000
Content-Type: text/plain

1) Upgrade python-psycopg2 from 2.6.1 to 2.6.2.
2) Modify remove-pg-config.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/python-psycopg2/remove-pg-config.patch  | 34 +++++++++-------------
 ...-psycopg2_2.6.1.bb => python-psycopg2_2.6.2.bb} |  6 ++--
 2 files changed, 17 insertions(+), 23 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.6.1.bb => python-psycopg2_2.6.2.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
index b2f94dd..37acc30 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
@@ -1,37 +1,31 @@
-From 392c4581da49f133938e70f6215bfebba28ecc56 Mon Sep 17 00:00:00 2001
+From 92d42775735d1555449b860c214ca7265d7ad75b Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Tue, 4 Aug 2015 20:59:18 -0400
+Date: Tue, 24 Jan 2017 00:43:35 +0900
 Subject: [PATCH] setup: don't use pg_config
 
-The package uses the pg_config command to detect the libdir and
-includedir path.  Commented the lines because the command is not
-available at buildtime and the package succesfully build without them.
-
-Signed-off-by: Mark Asselstine <bruce.ashfield@windriver.com>
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 ---
- setup.cfg | 2 +-
+ setup.cfg | 1 +
  setup.py  | 5 +----
- 2 files changed, 2 insertions(+), 5 deletions(-)
+ 2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/setup.cfg b/setup.cfg
-index 90a47dd..986871b 100644
+index d00ce92..4b45aac 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -9,7 +9,7 @@ define=
- # build psycopg2. If pg_config is not in the path or is installed under a
- # different name uncomment the following option and set it to the pg_config
- # full path.
--#pg_config=
+@@ -1,5 +1,6 @@
+ [build_ext]
+ define = 
 +pg_config="/bin/true"
+ use_pydatetime = 1
+ have_ssl = 0
  
- # Set to 1 to use Python datetime objects for default date/time representation.
- use_pydatetime=1
 diff --git a/setup.py b/setup.py
-index 975fe10..85502ca 100644
+index d71d489..b101696 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -389,16 +389,13 @@ class psycopg_build_ext(build_ext):
+@@ -398,16 +398,13 @@ class psycopg_build_ext(build_ext):
              self.libraries.append("pq")
  
          try:
@@ -50,5 +44,5 @@ index 975fe10..85502ca 100644
              verre = re.compile(
                  r"(\d+)\.(\d+)(?:(?:\.(\d+))|(devel|(alpha|beta|rc)\d+))")
 -- 
-2.1.4
+2.7.4
 
diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
index 1d78afa..2cdb138 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
@@ -8,12 +8,12 @@ DEPENDS = "postgresql"
 PR = "r0"
 SRCNAME = "psycopg2"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/7b/a8/dc2d50a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc/${SRCNAME}-${PV}.tar.gz \
            file://remove-pg-config.patch \
           "
 
-SRC_URI[md5sum] = "842b44f8c95517ed5b792081a2370da1"
-SRC_URI[sha256sum] = "6acf9abbbe757ef75dc2ecd9d91ba749547941abaffbe69ff2086a9e37d4904c"
+SRC_URI[md5sum] = "4a392949ba31a378a18ed3e775a4693f"
+SRC_URI[sha256sum] = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




