Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A7FEE00CD9; Thu, 22 Mar 2018 20:30:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2409AE00C6B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Mar 2018 20:30:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38089878"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Mar 2018 11:28:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1E6154D0EFF3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 11:28:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 23 Mar 2018 11:28:53 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 23 Mar 2018 11:28:54 +0800
Message-ID: <1521775736-38102-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 1E6154D0EFF3.A5C7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-psycopg2: 2.6.2 -> 2.7.4
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
X-List-Received-Date: Fri, 23 Mar 2018 03:30:15 -0000
Content-Type: text/plain

1.Upgrade python-psycopg2 from 2.6.2 to 2.7.4.
2.Modify remove-pg-config.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-psycopg2/remove-pg-config.patch | 7 ++++---
 .../python/{python-psycopg2_2.6.2.bb => python-psycopg2_2.7.4.bb}  | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.6.2.bb => python-psycopg2_2.7.4.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
index 37acc30..8f426f5 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2/remove-pg-config.patch
@@ -14,13 +14,14 @@ diff --git a/setup.cfg b/setup.cfg
 index d00ce92..4b45aac 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -1,5 +1,6 @@
+@@ -1,6 +1,6 @@
  [build_ext]
  define = 
+-pg_config = 
 +pg_config="/bin/true"
  use_pydatetime = 1
+ mx_include_dir = 
  have_ssl = 0
- 
 diff --git a/setup.py b/setup.py
 index d71d489..b101696 100644
 --- a/setup.py
@@ -42,7 +43,7 @@ index d71d489..b101696 100644
 +                pgversion = "9.4.4"
  
              verre = re.compile(
-                 r"(\d+)\.(\d+)(?:(?:\.(\d+))|(devel|(alpha|beta|rc)\d+))")
+                 r"(\d+)(?:\.(\d+))?(?:(?:\.(\d+))|(devel|(?:alpha|beta|rc)\d+))?")
 -- 
 2.7.4
 
diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
index 37a4bdd..674322d 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://remove-pg-config.patch \
           "
 
-SRC_URI[md5sum] = "4a392949ba31a378a18ed3e775a4693f"
-SRC_URI[sha256sum] = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c"
+SRC_URI[md5sum] = "70fc57072e084565a42689d416cf2c5c"
+SRC_URI[sha256sum] = "8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209"
 
 inherit distutils pypi
 
-- 
2.7.4




