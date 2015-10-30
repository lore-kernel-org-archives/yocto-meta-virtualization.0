Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CBBEE00AF6; Thu, 29 Oct 2015 19:55:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFC91E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:55:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9U2sx7Z002809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:54:59 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 29 Oct 2015 19:54:58 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Oct 2015 22:54:56 -0400
Message-ID: <1446173696-15191-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446173696-15191-1-git-send-email-mark.asselstine@windriver.com>
References: <1446173696-15191-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 2/2] horizon: add an upstream patch needed for pyscss 1.3.4
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
X-List-Received-Date: Fri, 30 Oct 2015 02:55:02 -0000
Content-Type: text/plain

Without this patch we will get an error:
Don't know how to merge conflicting combinators: <SimpleSelector: u'+ .btn:not(:first-child)'> and <SimpleSelector: u'> .btn'>

when attempting to connect to the horizon dashboard.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../Compatibility-fix-for-pyscss-1.3.4.patch       | 68 ++++++++++++++++++++++
 .../recipes-devtools/python/python-horizon_git.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-horizon/Compatibility-fix-for-pyscss-1.3.4.patch

diff --git a/meta-openstack/recipes-devtools/python/python-horizon/Compatibility-fix-for-pyscss-1.3.4.patch b/meta-openstack/recipes-devtools/python/python-horizon/Compatibility-fix-for-pyscss-1.3.4.patch
new file mode 100644
index 0000000..a94d757
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-horizon/Compatibility-fix-for-pyscss-1.3.4.patch
@@ -0,0 +1,68 @@
+From cca93ade7c23c1f2794376161b6660a459292eee Mon Sep 17 00:00:00 2001
+From: Richard Jones <r1chardj0n3s@gmail.com>
+Date: Fri, 1 May 2015 11:39:37 +1000
+Subject: [PATCH] Compatibility fix for pyscss 1.3.4
+
+Commit cca93ade7c23c1f2794376161b6660a459292eee from
+https://github.com/openstack/horizon.git
+
+This commit alters the action-list.scss file so it is compatible
+with the newer version of pyScss (1.3.4+), allowing us to
+upgrade to that version.
+
+This change is a prerequisite for the update to get into the
+global requirements so that that change can pass testing.
+
+Change-Id: Idec7ce039b57476ce20b7b678431459c2ca0bdbf
+Co-Authored-By: Kelly Domico <kelly.domico@hp.com>
+---
+ .../static/angular/action-list/action-list.scss    | 23 +++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+ mode change 100644 => 100755 horizon/static/angular/action-list/action-list.scss
+
+diff --git a/horizon/static/angular/action-list/action-list.scss b/horizon/static/angular/action-list/action-list.scss
+old mode 100644
+new mode 100755
+index 58092e0..5b3fcc4
+--- a/horizon/static/angular/action-list/action-list.scss
++++ b/horizon/static/angular/action-list/action-list.scss
+@@ -22,16 +22,33 @@ action-list.btn-group {
+     right: -0.35em;
+     z-index: 3;
+ 
+-    & + .btn:not(:first-child) {
++    & + .btn:last-child:not(:first-child):not(.dropdown-toggle),
++    & + .btn:not(:last-child):not(:first-child):not(.dropdown-toggle),
++    & + .btn.single-button:not(:first-child),
++    & + .btn.split-button:not(:first-child):not(:last-child) {
+       border-top-left-radius: 4px;
+       border-bottom-left-radius: 4px;
++    }
++  }
+ 
+-      &.btn-sm {
++  &.btn-group-sm {
++    notifications {
++      & + .btn:last-child:not(:first-child):not(.dropdown-toggle),
++      & + .btn:not(:last-child):not(:first-child):not(.dropdown-toggle),
++      & + .btn.single-button:not(:first-child),
++      & + .btn.split-button:not(:first-child):not(:last-child) {
+         border-top-left-radius: 3px;
+         border-bottom-left-radius: 3px;
+       }
++    }
++  }
+ 
+-      &.btn-lg {
++  &.btn-group-lg {
++    notifications {
++      & + .btn:last-child:not(:first-child):not(.dropdown-toggle),
++      & + .btn:not(:last-child):not(:first-child):not(.dropdown-toggle),
++      & + .btn.single-button:not(:first-child),
++      & + .btn.split-button:not(:first-child):not(:last-child) {
+         border-top-left-radius: 6px;
+         border-bottom-left-radius: 6px;
+       }
+-- 
+2.1.4
+
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index f5c6c03..cf62d44 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -70,6 +70,7 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
     file://openstack-dashboard-apache.conf \
     file://local_settings.py \
     file://horizon-use-full-package-path-to-test-directories.patch \
+    file://Compatibility-fix-for-pyscss-1.3.4.patch \
     "
 
 SRCREV = "b99cf48ff346494198fb9740495eacc14fa406bf"
-- 
2.1.4


