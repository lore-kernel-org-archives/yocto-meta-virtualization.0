Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6ECB7E00A01; Wed,  5 Aug 2015 13:29:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5836E00A96
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:29:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KTudP001881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:29:56 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:29:56 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:42 -0400
Message-ID: <1438806592-32745-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 01/11] meta-openstack: remove unneeded dangling bbappends
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
X-List-Received-Date: Wed, 05 Aug 2015 20:29:59 -0000
Content-Type: text/plain

Several bbappends are now dangling as the base recipes have moved to
different versions. These specific danglers have been reviewed and
don't have any demonstrable purpose any longer and can therefor be
removed.

For example the busybox default config now enables CONFIG_WHICH so
there is no reason to continue to 'patch' this config setting.

For recipes which used brokensep in order to work around S != B build
issues the fact that the bbappend was dangling and the recipe was
building successfully is enough to demonstrate that the bbappend was
no longer needed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-containers/lxc/lxc_1.0.7.bbappend          | 1 -
 meta-openstack/recipes-core/busybox/busybox/horizon.cfg           | 1 -
 meta-openstack/recipes-core/busybox/busybox_1.23.1.bbappend       | 5 -----
 meta-openstack/recipes-devtools/python/python-nose_1.2.1.bbappend | 2 --
 meta-openstack/recipes-graphics/xorg-lib/libxaw_1.0.10.bbappend   | 1 -
 meta-openstack/recipes-support/ntp/ntp_4.2.8.bbappend             | 1 -
 6 files changed, 11 deletions(-)
 delete mode 100644 meta-openstack/recipes-containers/lxc/lxc_1.0.7.bbappend
 delete mode 100644 meta-openstack/recipes-core/busybox/busybox/horizon.cfg
 delete mode 100644 meta-openstack/recipes-core/busybox/busybox_1.23.1.bbappend
 delete mode 100644 meta-openstack/recipes-devtools/python/python-nose_1.2.1.bbappend
 delete mode 100644 meta-openstack/recipes-graphics/xorg-lib/libxaw_1.0.10.bbappend
 delete mode 100644 meta-openstack/recipes-support/ntp/ntp_4.2.8.bbappend

diff --git a/meta-openstack/recipes-containers/lxc/lxc_1.0.7.bbappend b/meta-openstack/recipes-containers/lxc/lxc_1.0.7.bbappend
deleted file mode 100644
index 7447c56..0000000
--- a/meta-openstack/recipes-containers/lxc/lxc_1.0.7.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-inherit autotools-brokensep
diff --git a/meta-openstack/recipes-core/busybox/busybox/horizon.cfg b/meta-openstack/recipes-core/busybox/busybox/horizon.cfg
deleted file mode 100644
index 52ec794..0000000
--- a/meta-openstack/recipes-core/busybox/busybox/horizon.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_WHICH=y
diff --git a/meta-openstack/recipes-core/busybox/busybox_1.23.1.bbappend b/meta-openstack/recipes-core/busybox/busybox_1.23.1.bbappend
deleted file mode 100644
index 569bd30..0000000
--- a/meta-openstack/recipes-core/busybox/busybox_1.23.1.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-            file://horizon.cfg \
-           "
diff --git a/meta-openstack/recipes-devtools/python/python-nose_1.2.1.bbappend b/meta-openstack/recipes-devtools/python/python-nose_1.2.1.bbappend
deleted file mode 100644
index 353fa3a..0000000
--- a/meta-openstack/recipes-devtools/python/python-nose_1.2.1.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-# repair the install location to be site-packages/nose/*
-inherit setuptools
diff --git a/meta-openstack/recipes-graphics/xorg-lib/libxaw_1.0.10.bbappend b/meta-openstack/recipes-graphics/xorg-lib/libxaw_1.0.10.bbappend
deleted file mode 100644
index 7447c56..0000000
--- a/meta-openstack/recipes-graphics/xorg-lib/libxaw_1.0.10.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-inherit autotools-brokensep
diff --git a/meta-openstack/recipes-support/ntp/ntp_4.2.8.bbappend b/meta-openstack/recipes-support/ntp/ntp_4.2.8.bbappend
deleted file mode 100644
index 7447c56..0000000
--- a/meta-openstack/recipes-support/ntp/ntp_4.2.8.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-inherit autotools-brokensep
-- 
2.1.4


