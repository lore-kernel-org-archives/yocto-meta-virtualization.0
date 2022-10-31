Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ADBECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 16:04:52 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.11259.1667232289937970378
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 09:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RnYU8/zl;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id h206so6630287iof.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Oct 2022 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDou+1Flx/4g0nqaGekEUQr/3aGfFqirlKEeWHFBCyA=;
        b=RnYU8/zlDtBWbIYhrsQSXioSRjZMMxMH6cwovpSJFn3rbDtmA+0J/Bf6qaUWvC9akf
         /cGzc53moJocxLl9ZwN+gaZky2ftYQ/GMMuLS02qC7ASxLl/QpqFCC4OoptUPhRv5qAD
         K9aW6P3/Dvzkr2e7EuR96PguEM50PL5CYenyLbY0XFOkty2vC3whCwfmfbWFrHmsnQTV
         i5SUjyiCRzuneY6N6l+m2jKH5ARc1BbU0n0XXrOzbHrFp3DrPfvQVfrdVPY5MOm3hnpN
         ANmwyAKHIZqo2tirASa31Q7mCq1lc8Zg9gUztoyC50nsuL231/mz7zw6GfdLdBmlhi8Q
         uDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDou+1Flx/4g0nqaGekEUQr/3aGfFqirlKEeWHFBCyA=;
        b=NOMC+GorCAbDw+qbZjepDFNk+UZK85Ap11Vpci9BVVLgzHqzb3/dlW0iIfPsXaQHN6
         ppsn6BVRG6lovV3loVIqXFlm8TtiEZB4AYy2cdAr/I4MxxNWOytNRRtTmnJlP9vjKTJ7
         0VV3JYk/vca0sissaaUnlqJV+aXWv+bp9wcliBtXjoczFPQ2LD4FKT2UVLHuIHhIwaE0
         tSZ8v/vJqSo0aLzaCVatycrTj1MXgSy7Lflz1Fyi6gY7+sdditEAmVIuDbFgZ+3Z8nUb
         8I4ehw8t1Xn/VbcWn2PPSjp/VAo+cqBzVTY08p9IQlEXqi/gzmgezL5a72XCgQ/zOyyX
         H3jQ==
X-Gm-Message-State: ACrzQf0ZLQvGvAWwfHO63BZ1QBs+4pSQKyB8C6mMdibs/NnkUzFgiIyf
	oME3R8Yur9eEYNwPCkEc+OeWm5byEiGUDW5W0Yc=
X-Google-Smtp-Source: AMsMyM41x51oK1wo5tvM4zoc33eQrNp8AKwU9fObgIqpLAUSUl9mCDb4yxJrt5cGDzk+0VdZeTDPm22+1rOI9aVHAuk=
X-Received: by 2002:a6b:3ec5:0:b0:6ce:16bf:2e8e with SMTP id
 l188-20020a6b3ec5000000b006ce16bf2e8emr5204304ioa.160.1667232289159; Mon, 31
 Oct 2022 09:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221030161333.12430-1-f_l_k@t-online.de> <20221030161333.12430-2-f_l_k@t-online.de>
In-Reply-To: <20221030161333.12430-2-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 31 Oct 2022 12:04:37 -0400
Message-ID: <CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005a80cc05ec56c4a7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Oct 2022 16:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7669

--0000000000005a80cc05ec56c4a7
Content-Type: text/plain; charset="UTF-8"

Markus,

My comments about introducing the use case of the new recipe, how it was
tested, etc, apply to this commit as well.

See inline for more questions.

On Sun, Oct 30, 2022 at 12:13 PM Markus Volk <f_l_k@t-online.de> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ata-meson.build-fix-for-recent-meson.patch | 44 +++++++++++++++++++
>  .../virt-viewer/virt-viewer_11.0.bb           | 30 +++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644
> recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build-fix-for-recent-meson.patch
>  create mode 100644 recipes-extended/virt-viewer/virt-viewer_11.0.bb
>
> diff --git
> a/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build-fix-for-recent-meson.patch
> b/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build-fix-for-recent-meson.patch
> new file mode 100644
> index 0000000..5a4fe77
> --- /dev/null
> +++
> b/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build-fix-for-recent-meson.patch
> @@ -0,0 +1,44 @@
> +From b2d3cde0ff9816c468986f2d62c67d0713a4c49e Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sat, 29 Oct 2022 15:35:23 +0200
> +Subject: [PATCH] data/meson.build: fix for recent meson
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Patch-Status: Backport
>
Since this is a git based recipe, there's no need to stay on the release
tag. Bumping the SRCREV to pickup a patch like this is preferable to
carrying a patch as part of the recipe.


> +
> +---
> + data/meson.build | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index d718491..4325108 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -2,7 +2,6 @@ if host_machine.system() != 'windows'
> +   desktop = 'remote-viewer.desktop'
> +
> +   i18n.merge_file (
> +-    desktop,
> +     type: 'desktop',
> +     input: desktop + '.in',
> +     output: desktop,
> +@@ -14,7 +13,6 @@ if host_machine.system() != 'windows'
> +   mimetypes = 'virt-viewer-mime.xml'
> +
> +   i18n.merge_file (
> +-    mimetypes,
> +     type: 'xml',
> +     input: mimetypes + '.in',
> +     output: mimetypes,
> +@@ -27,7 +25,6 @@ if host_machine.system() != 'windows'
> +   metainfo = 'remote-viewer.appdata.xml'
> +
> +   i18n.merge_file (
> +-    metainfo,
> +     type: 'xml',
> +     input: metainfo + '.in',
> +     output: metainfo,
> +--
> +2.34.1
> +
> diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> new file mode 100644
> index 0000000..a09f0cf
> --- /dev/null
> +++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Virtual Machine Viewer"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +# for librest support rest_0.7 would be needed
> +DEPENDS = " \
> +       desktop-file-utils-native \
> +       glib-2.0 \
> +       gtk+3 \
> +       gtk-vnc \
> +       libvirt \
> +       libvirt-glib \
> +       libxml2 \
> +       spice-gtk \
> +       spice-protocol \
> +       vte \
>

These dependencies are the biggest "issue" with the recipe.
meta-virtualization doesn't currently have a dependency on the layers that
provide those packages.

I'm always striving to keep our dependencies (in terms of layers) as small
as possible. In particular, these dependencies imply that the target has
support for graphics and some sort of desktop environment available.

To keep the dependency dynamic, we should check on an appropriate distro
feature and raise a skiprecipe if the distro features aren't in place. See
what we do with selinux/seccomp in a few other recipes. That allows us to
not make the new layers as hard dependencies. If they do become hard
dependencies of meta-virt, we need to update the layer.conf or we'll fail
the yocto compatibility tests.

Cheers,

Bruce


> +"
> +
> +SRC_URI = " \
> +       git://
> gitlab.com/virt-viewer/virt-viewer.git;protocol=https;branch=master \
> +       file://0001-data-meson.build-fix-for-recent-meson.patch \
> +"
> +
> +SRCREV = "8d8923d259b79c7c9ad3560a49be81dc0f38b88b"
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection
> +
> +FILES:${PN} += "${datadir}"
> +GIR_MESON_OPTION = ''
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7666):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7666
> Mute This Topic: https://lists.yoctoproject.org/mt/94667263/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005a80cc05ec56c4a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Markus,</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">My =
comments about introducing=C2=A0the use case of the new recipe, how it was =
tested, etc, apply to this commit as well.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">See inline for more questions.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022=
 at 12:13 PM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-o=
nline.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"=
 target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...ata-meson.build-fix-for-recent-meson.patch | 44 ++++++++++++++++++=
+<br>
=C2=A0.../virt-viewer/<a href=3D"http://virt-viewer_11.0.bb" rel=3D"norefer=
rer" target=3D"_blank">virt-viewer_11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 30 +++++++++++++<br>
=C2=A02 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/virt-viewer/virt-viewer/0001-data=
-meson.build-fix-for-recent-meson.patch<br>
=C2=A0create mode 100644 recipes-extended/virt-viewer/<a href=3D"http://vir=
t-viewer_11.0.bb" rel=3D"noreferrer" target=3D"_blank">virt-viewer_11.0.bb<=
/a><br>
<br>
diff --git a/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build=
-fix-for-recent-meson.patch b/recipes-extended/virt-viewer/virt-viewer/0001=
-data-meson.build-fix-for-recent-meson.patch<br>
new file mode 100644<br>
index 0000000..5a4fe77<br>
--- /dev/null<br>
+++ b/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build-fix-fo=
r-recent-meson.patch<br>
@@ -0,0 +1,44 @@<br>
+From b2d3cde0ff9816c468986f2d62c67d0713a4c49e Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Sat, 29 Oct 2022 15:35:23 +0200<br>
+Subject: [PATCH] data/meson.build: fix for recent meson<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+<br>
+Patch-Status: Backport<br></blockquote><div><span class=3D"gmail_default" =
style=3D"font-size:small"></span></div><div><span class=3D"gmail_default" s=
tyle=3D"font-size:small">Since this is a git based recipe, there&#39;s no n=
eed to stay on the release tag. Bumping the SRCREV to pickup a patch like t=
his is preferable to carrying a patch as part of the recipe.</span></div><d=
iv><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+---<br>
+ data/meson.build | 3 ---<br>
+ 1 file changed, 3 deletions(-)<br>
+<br>
+diff --git a/data/meson.build b/data/meson.build<br>
+index d718491..4325108 100644<br>
+--- a/data/meson.build<br>
++++ b/data/meson.build<br>
+@@ -2,7 +2,6 @@ if host_machine.system() !=3D &#39;windows&#39;<br>
+=C2=A0 =C2=A0desktop =3D &#39;remote-viewer.desktop&#39;<br>
+ <br>
+=C2=A0 =C2=A0i18n.merge_file (<br>
+-=C2=A0 =C2=A0 desktop,<br>
+=C2=A0 =C2=A0 =C2=A0type: &#39;desktop&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0input: desktop + &#39;.in&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0output: desktop,<br>
+@@ -14,7 +13,6 @@ if host_machine.system() !=3D &#39;windows&#39;<br>
+=C2=A0 =C2=A0mimetypes =3D &#39;virt-viewer-mime.xml&#39;<br>
+ <br>
+=C2=A0 =C2=A0i18n.merge_file (<br>
+-=C2=A0 =C2=A0 mimetypes,<br>
+=C2=A0 =C2=A0 =C2=A0type: &#39;xml&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0input: mimetypes + &#39;.in&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0output: mimetypes,<br>
+@@ -27,7 +25,6 @@ if host_machine.system() !=3D &#39;windows&#39;<br>
+=C2=A0 =C2=A0metainfo =3D &#39;remote-viewer.appdata.xml&#39;<br>
+ <br>
+=C2=A0 =C2=A0i18n.merge_file (<br>
+-=C2=A0 =C2=A0 metainfo,<br>
+=C2=A0 =C2=A0 =C2=A0type: &#39;xml&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0input: metainfo + &#39;.in&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0output: metainfo,<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/recipes-extended/virt-viewer/<a href=3D"http://virt-viewer_11.=
0.bb" rel=3D"noreferrer" target=3D"_blank">virt-viewer_11.0.bb</a> b/recipe=
s-extended/virt-viewer/<a href=3D"http://virt-viewer_11.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">virt-viewer_11.0.bb</a><br>
new file mode 100644<br>
index 0000000..a09f0cf<br>
--- /dev/null<br>
+++ b/recipes-extended/virt-viewer/<a href=3D"http://virt-viewer_11.0.bb" r=
el=3D"noreferrer" target=3D"_blank">virt-viewer_11.0.bb</a><br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;Virtual Machine Viewer&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552&quot;<br>
+<br>
+# for librest support rest_0.7 would be needed<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0desktop-file-utils-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0glib-2.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk+3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk-vnc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libvirt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libvirt-glib \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spice-gtk \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spice-protocol \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vte \<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">These dependencies are th=
e biggest &quot;issue&quot; with the recipe. meta-virtualization doesn&#39;=
t currently have a dependency on the layers that provide those packages.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I&#39;m always strivi=
ng to keep our dependencies (in terms of layers) as small as possible. In p=
articular, these dependencies imply that the target has support for graphic=
s and some sort of desktop environment available.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">To keep the dependency dynamic, we should check on=
 an appropriate distro feature and raise a skiprecipe if the distro feature=
s aren&#39;t in place. See what we do with selinux/seccomp in a few other r=
ecipes. That allows us to not make the new layers as hard dependencies. If =
they do become hard dependencies of meta-virt, we need to update the layer.=
conf or we&#39;ll fail the yocto compatibility tests.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Cheers,</div></div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://gitlab.com/virt-viewer/=
virt-viewer.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">gitlab.com/virt-viewer/virt-viewer.git;protocol=3Dhttps;branch=
=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-data-meson.build-fix-for-recent-mes=
on.patch \<br>
+&quot;<br>
+<br>
+SRCREV =3D &quot;8d8923d259b79c7c9ad3560a49be81dc0f38b88b&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection=
<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}&quot;<br>
+GIR_MESON_OPTION =3D &#39;&#39;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7666): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7666" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7666</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94667263/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94667263/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000005a80cc05ec56c4a7--

