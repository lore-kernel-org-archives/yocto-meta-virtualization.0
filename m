Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7417C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 02:56:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.5515.1646881008363540289
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 18:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22A2ujQW025428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 9 Mar 2022 18:56:46 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 9 Mar 2022 18:56:45 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 18:56:45 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 9 Mar 2022 18:56:44 -0800
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: backport patch to fix compile error
Date: Thu, 10 Mar 2022 10:56:42 +0800
Message-ID: <20220310025642.35956-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 02:56:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7080

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix compile error of libvirt:

| runtime error: file ../libvirt-7.2.0/docs/page.xsl line 217 element element
| xsl:element: The effective name '' is not a valid QName.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...cs-Fix-template-matching-in-page.xsl.patch | 64 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-page.xsl.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-page.xsl.patch b/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-page.xsl.patch
new file mode 100644
index 0000000..9dd650e
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-page.xsl.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 54814c87f3706cc8eb894634ebef0f9cf7dabae6 Mon Sep 17 00:00:00 2001
+From: Martin Kletzander <mkletzan@redhat.com>
+Date: Mon, 21 Feb 2022 09:26:13 +0100
+Subject: [PATCH] docs: Fix template matching in page.xsl
+
+Our last default template had a match of "node()" which incidentally matched
+everything, including text nodes.  Since this has the same priority according to
+the XSLT spec, section 5.5:
+
+  https://www.w3.org/TR/1999/REC-xslt-19991116#conflict
+
+this is an error.  Also according to the same spec section, the XSLT processor
+may signal the error or pick the last rule.
+
+This was uncovered with libxslt 1.1.35 which contains the following commit:
+
+  https://gitlab.gnome.org/GNOME/libxslt/-/commit/b0074eeca3c6b21b4da14fdf712b853900c51635
+
+which makes the build fail with:
+
+  runtime error: file ../docs/page.xsl line 223 element element
+  xsl:element: The effective name '' is not a valid QName.
+
+because our last rule also matches text nodes and we are trying to extract the
+node name out of them.
+
+To fix this we change the match to "*" which only matches elements and not all
+the nodes, and to avoid any possible errors with different XSLT processors we
+also bump the priority of the match="text()" rule a little higher, just in case
+someone needs to use an XSLT processor that chooses signalling the error instead
+of the optional recovery.
+
+https://bugs.gentoo.org/833586
+
+Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
+---
+ docs/page.xsl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/docs/page.xsl b/docs/page.xsl
+index fd67918d3b..72a6fa0842 100644
+--- a/docs/page.xsl
++++ b/docs/page.xsl
+@@ -215,11 +215,11 @@
+     </xsl:element>
+   </xsl:template>
+ 
+-  <xsl:template match="text()" mode="copy">
++  <xsl:template match="text()" mode="copy" priority="0">
+     <xsl:value-of select="."/>
+   </xsl:template>
+ 
+-  <xsl:template match="node()" mode="copy">
++  <xsl:template match="*" mode="copy">
+     <xsl:element name="{name()}">
+       <xsl:copy-of select="./@*"/>
+       <xsl:apply-templates mode="copy" />
+-- 
+2.33.0
+
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index 5ad7d59..1fc55b8 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
            file://0001-security-fix-SELinux-label-generation-logic.patch \
            file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
+           file://0001-docs-Fix-template-matching-in-page.xsl.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
-- 
2.17.1


