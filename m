Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C90EE49A5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 23:22:52 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.56.1692746564118434565
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 16:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 497B132F9
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Aug 2023 01:22:42 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.228.72]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYaht-1pqnS40; Wed, 23 Aug 2023 01:22:41 +0200
Date: Wed, 23 Aug 2023 00:53:20 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCHv2] libvirt-glib: fix introspection
 and documentation build
To: meta-virtualization@lists.yoctoproject.org
Message-Id: <W8ETZR.TDO8J5B36D4N1@t-online.de>
In-Reply-To: <177DD60BD2874A85.27837@lists.yoctoproject.org>
References: <177DD60BD2874A85.27837@lists.yoctoproject.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-iKuLbRPYQeU9A0zLzJq5"
X-TOI-EXPURGATEID: 150726::1692746561-B0FF72DD-322CA3EB/0/0 CLEAN NORMAL
X-TOI-MSGID: 90c549d9-c8f5-453b-a991-74f0c2b29341
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 23:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8222

--=-iKuLbRPYQeU9A0zLzJq5
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 removes the unneeded dependency on libxslt

On Wed, Aug 23 2023 at 12:46:04 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...ild-allow-crosscompiling-gir-and-doc.patch | 37 
> +++++++++++++++++++
>  .../libvirt/libvirt-glib_4.0.0.bb             | 13 +++++--
>  2 files changed, 47 insertions(+), 3 deletions(-)
>  create mode 100644 
> recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
> 
> diff --git 
> a/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch 
> b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
> new file mode 100644
> index 0000000..cd17bbb
> --- /dev/null
> +++ 
> b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
> @@ -0,0 +1,37 @@
> +From 019d727990d41b5d7911895b75bcb021e4cca3c6 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 21 Aug 2023 10:23:08 +0200
> +Subject: [PATCH] meson.build: allow crosscompiling gir and doc
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 134feb6..a089f42 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -58,7 +58,7 @@ includedir = join_paths(prefix, 
> get_option('includedir'))
> +
> + # gobject introspection
> + gir = find_program('g-ir-scanner', required: 
> get_option('introspection'))
> +-enable_introspection = gir.found() and not meson.is_cross_build()
> ++enable_introspection = gir.found()
> +
> + # vala
> + vapi_opt = get_option('vapi')
> +@@ -73,7 +73,7 @@ endif
> + # gtk-doc
> + if not get_option('docs').disabled()
> +   gtk_doc = find_program('gtkdoc-scan', required: 
> get_option('docs'))
> +-  enable_doc = gtk_doc.found() and not meson.is_cross_build()
> ++  enable_doc = gtk_doc.found()
> + else
> +   enable_doc = false
> + endif
> +--
> +2.41.0
> +
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb 
> b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> index a5cd827..e6effaf 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> @@ -5,10 +5,17 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> 
>  DEPENDS = "glib-2.0 libvirt libxml2"
> 
> -SRC_URI = 
> "git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master"
> +SRC_URI = " \
> +	git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master \
> +	file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch 
> <file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch/> \
> +"
> 
>  SRCREV = "e0bfc34682744a74b850fa217e9c206a9eb80612"
>  S = "${WORKDIR}/git"
> 
> -inherit meson pkgconfig gobject-introspection vala
> -GIR_MESON_OPTION = ''
> +inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
> +
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +GTKDOC_MESON_ENABLE_FLAG = 'enabled'
> +GTKDOC_MESON_DISABLE_FLAG = 'disabled'
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8221): 
> <https://lists.yoctoproject.org/g/meta-virtualization/message/8221>
> Mute This Topic: <https://lists.yoctoproject.org/mt/100904573/3618223>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org 
> <mailto:meta-virtualization+owner@lists.yoctoproject.org>
> Unsubscribe: 
> <https://lists.yoctoproject.org/g/meta-virtualization/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-iKuLbRPYQeU9A0zLzJq5
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 removes the unneeded dependency on libxslt</div></div><div id="geary-quote" dir="auto"><br>On Wed, Aug 23 2023 at 12:46:04 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...ild-allow-crosscompiling-gir-and-doc.patch | 37 +++++++++++++++++++
 .../libvirt/libvirt-glib_4.0.0.bb             | 13 +++++--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch

diff --git a/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
new file mode 100644
index 0000000..cd17bbb
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
@@ -0,0 +1,37 @@
+From 019d727990d41b5d7911895b75bcb021e4cca3c6 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 21 Aug 2023 10:23:08 +0200
+Subject: [PATCH] meson.build: allow crosscompiling gir and doc
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 134feb6..a089f42 100644
+--- a/meson.build
++++ b/meson.build
+@@ -58,7 +58,7 @@ includedir = join_paths(prefix, get_option('includedir'))
+ 
+ # gobject introspection
+ gir = find_program('g-ir-scanner', required: get_option('introspection'))
+-enable_introspection = gir.found() and not meson.is_cross_build()
++enable_introspection = gir.found()
+ 
+ # vala
+ vapi_opt = get_option('vapi')
+@@ -73,7 +73,7 @@ endif
+ # gtk-doc
+ if not get_option('docs').disabled()
+   gtk_doc = find_program('gtkdoc-scan', required: get_option('docs'))
+-  enable_doc = gtk_doc.found() and not meson.is_cross_build()
++  enable_doc = gtk_doc.found()
+ else
+   enable_doc = false
+ endif
+-- 
+2.41.0
+
diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
index a5cd827..e6effaf 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -5,10 +5,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0 libvirt libxml2"
 
-SRC_URI = "git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master"
+SRC_URI = " \
+	git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master \
+	<a href="file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch">file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch</a> \
+"
 
 SRCREV = "e0bfc34682744a74b850fa217e9c206a9eb80612"
 S = "${WORKDIR}/git"
 
-inherit meson pkgconfig gobject-introspection vala
-GIR_MESON_OPTION = ''
+inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_ENABLE_FLAG = 'enabled'
+GTKDOC_MESON_DISABLE_FLAG = 'disabled'
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#8221): <a href="https://lists.yoctoproject.org/g/meta-virtualization/message/8221">https://lists.yoctoproject.org/g/meta-virtualization/message/8221</a>
Mute This Topic: <a href="https://lists.yoctoproject.org/mt/100904573/3618223">https://lists.yoctoproject.org/mt/100904573/3618223</a>
Group Owner: <a href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-iKuLbRPYQeU9A0zLzJq5--


