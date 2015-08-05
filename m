Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 446E5E00A54; Wed,  5 Aug 2015 13:30:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FDE1E00AEB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:08 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KU7mE010650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:08 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:30:07 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:48 -0400
Message-ID: <1438806592-32745-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 07/11] python-psycopg2: reinstate patch to avoid pg_config
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
X-List-Received-Date: Wed, 05 Aug 2015 20:30:15 -0000
Content-Type: text/plain

When building we get an error:
Error: pg_config executable not found.

Previously there was a patch that removed references to pg_config.
This patch was dropped during the version uprev for an unknown
reason. Reinstate this patch with minor updates to allow it to patch
the new version of python-psycopg2 and get the build working again.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-psycopg2/remove-pg-config.patch  | 63 ++++++++++++++--------
 .../python/python-psycopg2_2.6.1.bb                |  5 ++
 2 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
index 6b72ef7..b2f94dd 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
@@ -1,14 +1,37 @@
-Upstream-status: Inappropriate [embedded specific]
+From 392c4581da49f133938e70f6215bfebba28ecc56 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 4 Aug 2015 20:59:18 -0400
+Subject: [PATCH] setup: don't use pg_config
 
-The package uses the pg_config command to detect the libdir and includedir path.
-Commented the lines because the command is not available at buildtime and the
-package succesfully build without them.
+The package uses the pg_config command to detect the libdir and
+includedir path.  Commented the lines because the command is not
+available at buildtime and the package succesfully build without them.
 
-Index: psycopg2-2.5/setup.py
-===================================================================
---- psycopg2-2.5.orig/setup.py
-+++ psycopg2-2.5/setup.py
-@@ -377,9 +377,6 @@
+Signed-off-by: Mark Asselstine <bruce.ashfield@windriver.com>
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ setup.cfg | 2 +-
+ setup.py  | 5 +----
+ 2 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 90a47dd..986871b 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -9,7 +9,7 @@ define=
+ # build psycopg2. If pg_config is not in the path or is installed under a
+ # different name uncomment the following option and set it to the pg_config
+ # full path.
+-#pg_config=
++pg_config="/bin/true"
+ 
+ # Set to 1 to use Python datetime objects for default date/time representation.
+ use_pydatetime=1
+diff --git a/setup.py b/setup.py
+index 975fe10..85502ca 100644
+--- a/setup.py
++++ b/setup.py
+@@ -389,16 +389,13 @@ class psycopg_build_ext(build_ext):
              self.libraries.append("pq")
  
          try:
@@ -18,16 +41,14 @@ Index: psycopg2-2.5/setup.py
              try:
                  # Here we take a conservative approach: we suppose that
                  # *at least* PostgreSQL 7.4 is available (this is the only
-Index: psycopg2-2.5/setup.cfg
-===================================================================
---- psycopg2-2.5.orig/setup.cfg
-+++ psycopg2-2.5/setup.cfg
-@@ -11,7 +11,7 @@
- # build psycopg2. If pg_config is not in the path or is installed under a
- # different name uncomment the following option and set it to the pg_config
- # full path.
--#pg_config=
-+pg_config="/bin/true"
+                 # 7.x series supported by psycopg 2)
+                 pgversion = pg_config_helper.query("version").split()[1]
+             except:
+-                pgversion = "7.4.0"
++                pgversion = "9.4.4"
  
- # Set to 1 to use Python datetime objects for default date/time representation.
- use_pydatetime=1
+             verre = re.compile(
+                 r"(\d+)\.(\d+)(?:(?:\.(\d+))|(devel|(alpha|beta|rc)\d+))")
+-- 
+2.1.4
+
diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
index 8882903..1d78afa 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
@@ -9,6 +9,7 @@ PR = "r0"
 SRCNAME = "psycopg2"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+           file://remove-pg-config.patch \
           "
 
 SRC_URI[md5sum] = "842b44f8c95517ed5b792081a2370da1"
@@ -17,3 +18,7 @@ SRC_URI[sha256sum] = "6acf9abbbe757ef75dc2ecd9d91ba749547941abaffbe69ff2086a9e37
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
+
+DEPENDS += " \
+    postgresql \
+"
-- 
2.1.4


