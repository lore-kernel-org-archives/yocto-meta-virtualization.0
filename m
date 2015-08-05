Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7849E00ACE; Wed,  5 Aug 2015 13:30:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 811A3E00AA9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:02 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KU1YN010623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:02 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:29:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:44 -0400
Message-ID: <1438806592-32745-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 03/11] meta-openstack: add wildcard to qemu bbappend
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
X-List-Received-Date: Wed, 05 Aug 2015 20:30:14 -0000
Content-Type: text/plain

This is currently a dangling bbappend as qemu is now version
2.4.0. The content of the bbappend appears to still be relevant, with
some minor cleanup, so simply renaming this bbappend to apply to a
range of releases. 'virtfs' enables 'attr' and 'attr' is not a
standalone pkgconfig so drop this. Pkgconfig 'cap-ng' has been renamed
to 'libcap-ng', so follow suit.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend   | 5 +++++
 meta-openstack/recipes-devtools/qemu/qemu_2.2.0.bbappend | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
 delete mode 100644 meta-openstack/recipes-devtools/qemu/qemu_2.2.0.bbappend

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
new file mode 100644
index 0000000..ca8274e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
@@ -0,0 +1,5 @@
+PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
+
+PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
+PACKAGECONFIG_class-native = "fdt"
+PACKAGECONFIG_class-nativesdk = "fdt"
diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.2.0.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_2.2.0.bbappend
deleted file mode 100644
index 1c8c682..0000000
--- a/meta-openstack/recipes-devtools/qemu/qemu_2.2.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
-
-PACKAGECONFIG ?= "fdt spice virtfs attr cap-ng"
-PACKAGECONFIG_class-native = "fdt"
-PACKAGECONFIG_class-nativesdk = "fdt"
-- 
2.1.4


