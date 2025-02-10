Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EDBC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 03:41:14 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.43034.1739158866908014437
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 19:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+p7B26l;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f0444b478so54788725ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Feb 2025 19:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739158866; x=1739763666; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gWLGiv4sTLk3Pudk78cg6OsGs1AILrcIfkjknpo3/iU=;
        b=k+p7B26ltvmwhAF4DqgBix7C2dEWiFWqrNHNZ7pr76TvHNV9aLG5gdZUvrEmD9a9OZ
         fuW188kihGSezFpfBLZkEIlVZyA9l4gNi6dbyVNQ1clkPWtdLhpaFVbzgAbW/qRPfuOS
         FIL+qCqXposfeO5aOECViwGRDqnhvyPL1Q/6SVYI9otVomc5461rRCDbOA8jL3z7cXoZ
         hBwJa7Q+ogIeR/kFFo6YeRaMG+OERD7IlyZJxltYCk1JpFDPREXT4Dx9aASkV5aZHPoS
         WZJKh8Kdxp/2TuR6WjDCGmI8/uz1tj9GAGgy9EmAMwnGkb+oe3YgIkMI6duL4fHS/XT6
         scRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158866; x=1739763666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWLGiv4sTLk3Pudk78cg6OsGs1AILrcIfkjknpo3/iU=;
        b=gmbGtexCfzKwDFx3g8yMxKo4wBLK31VC9HylqHB5nWXFUKeXuEMn0NAEWuudm5vMAw
         BHhpl1j9TJbZjsKVyGa+gylQoC7N5H/YtHqHnwF2ymyhxAKd2VyvuwwWkpbqbmfPdAeA
         JM/d4tFWmeSklqWat0nUDDhe9hgY2hu0omLlpUR0qhEVVyWjT+kqcLNZmSGxcxp2vcrg
         Bkee4tD6Qh4XeTYriB4iZQDdTiTV0uwUMWPO5QRtitJ3Oj5bIT18+fOw0s5+ZJVLnLCf
         En8JWo+eN026AO7blvNkpekw8VqmWvOhS6NuPRcXhIDU3FiRdjV3PXfME08PSJtLr2+p
         RWqQ==
X-Gm-Message-State: AOJu0YwUgm5Q0dxP1AYUKlRbTt/cqs1rvV9D+0a86tn6HsIyNUSYtyK9
	zUsF2EApkJnH1pboPoU/a+1SrzKAgSnG6MMh8JqS2Hgwm8s3JnNxBjpjkguoyVCXlSlxuj/T/WC
	mBILHkkimTmNzD541GlIfo6iatyWmR9YNK2w=
X-Gm-Gg: ASbGncuphBpG40UtP9EENDJvy9NtV76T7nGDPbHTo8eV+X8oZGaN6naib3HCSYOUoqP
	u/xRaygdBmp8cfLbgw0uajcXAdtfoHNvG58JEddojd/JyHSJMbnAp1oJPDEXX9LxbXxhptacn5A
	==
X-Google-Smtp-Source: AGHT+IHXM1o2NWseqHH9diL9WILvQcR2xq2BYWAvEkBoIgJOspB2SdEZXutP1ew5Ekpjc32oeI7NMSca9fkl4qzjOyU=
X-Received: by 2002:a17:902:e802:b0:21f:b61:3fda with SMTP id
 d9443c01a7336-21f4e7595a6mr188553235ad.37.1739158865996; Sun, 09 Feb 2025
 19:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20250210024557.670568-1-hongxu.jia@windriver.com>
In-Reply-To: <20250210024557.670568-1-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 9 Feb 2025 22:40:54 -0500
X-Gm-Features: AWEUYZkeX7Kd26RyvdCfNwaP0iB-ErZAcpbbTl6ooWUn6_5hhojC0cu9A5Y12zA
Message-ID: <CADkTA4N7rntXtDP210HsQzQP9pUV3OWWGEzO3Z3tSxKhk2YoZw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] nerdctl: fix do_compile failed
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006a728d062dc17af8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 03:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9127

--0000000000006a728d062dc17af8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This builds just fine for me.

The update never would have been pushed otherwise.

You'll need to elaborate on your distro and other settings that are
triggering this.

Bruce

On Sun, Feb 9, 2025 at 9:46=E2=80=AFPM hongxu via lists.yoctoproject.org
<hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> $ bitbake lib32-nerdctl
> ...
> -buildmode=3Dpie requires external (cgo) linking, but cgo is not enabled
> make: *** [Makefile:63: nerdctl] Error 1
> ...
>
> Get back the patch to allow external specification of build settings and
> rebase to v2.0.2
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...xternal-specification-of-build-setti.patch | 34 +++++++++++--------
>  recipes-containers/nerdctl/nerdctl_git.bb     |  1 +
>  2 files changed, 21 insertions(+), 14 deletions(-)
>
> diff --git
> a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> index ca7b3042..a384b9e6 100644
> ---
> a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> +++
> b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> @@ -1,25 +1,31 @@
> -From 0e6809ea075acd3edf7de197cd4e190ccdad6361 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Mon, 29 Mar 2021 20:50:47 -0400
> +From d254c922f14ca20d09d5258aa908a1105c6acd73 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
>

You can't change the "from:" in a patch.

Bruce



> +Date: Sun, 9 Feb 2025 21:06:29 +0800
>  Subject: [PATCH] Makefile: allow external specification of build setting=
s
>
>  Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
> +Rebase to v2.0.2
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - Makefile | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> + src/import/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: nerdctl-v2.0.0-beta.1/src/import/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile
> -+++ nerdctl-v2.0.0-beta.1/src/import/Makefile
> -@@ -38,7 +38,7 @@
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index ae4e18c..eb22f9f 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -45,7 +45,7 @@ endif
>
>   GO_BUILD_LDFLAGS ?=3D -s -w
>   GO_BUILD_FLAGS ?=3D
> --export GO_BUILD=3DGO111MODULE=3Don CGO_ENABLED=3D0 GOOS=3D$(GOOS) $(GO)=
 build
> -ldflags "$(GO_BUILD_LDFLAGS) -X $(PACKAGE)/pkg/version.Version=3D$(VERSI=
ON)
> -X $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
> -+export GO_BUILD=3D$(GO) build -ldflags "$(GO_BUILD_LDFLAGS) -X
> $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
> $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
> +-export GO_BUILD=3DCGO_ENABLED=3D0 GOOS=3D$(GOOS) $(GO) -C $(MAKEFILE_DI=
R)
> build -ldflags "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X
> $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
> $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
> ++export GO_BUILD=3DGOOS=3D$(GOOS) $(GO) -C $(MAKEFILE_DIR) build -ldflag=
s
> "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X
> $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
> $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
> +
> + recursive_wildcard=3D$(wildcard $1$2) $(foreach e,$(wildcard $1*),$(cal=
l
> recursive_wildcard,$e/,$2))
>
> - ifdef VERBOSE
> -       VERBOSE_FLAG :=3D -v
> +--
> +2.34.1
> +
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> b/recipes-containers/nerdctl/nerdctl_git.bb
> index 63b96846..84734c9f 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -19,6 +19,7 @@ include src_uri.inc
>
>  # patches and config
>  SRC_URI +=3D " \
> +
> file://0001-Makefile-allow-external-specification-of-build-setti.patch \
>              file://modules.txt \
>             "
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9125):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9125
> Mute This Topic: https://lists.yoctoproject.org/mt/111096110/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006a728d062dc17af8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">This builds just fine for me.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">The update=C2=A0never would have been pushed otherwise=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">You&#39;ll need to elab=
orate on your distro and other settings that are triggering this.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sun, Feb 9, 2025 at 9:46=E2=80=AFPM hongxu via <a href=3D"http://lists.yo=
ctoproject.org">lists.yoctoproject.org</a> &lt;hongxu.jia=3D<a href=3D"mail=
to:eng.windriver.com@lists.yoctoproject.org">eng.windriver.com@lists.yoctop=
roject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">$ bitbake lib32-nerdctl<br>
...<br>
-buildmode=3Dpie requires external (cgo) linking, but cgo is not enabled<br=
>
make: *** [Makefile:63: nerdctl] Error 1<br>
...<br>
<br>
Get back the patch to allow external specification of build settings and re=
base to v2.0.2<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0...xternal-specification-of-build-setti.patch | 34 +++++++++++-------=
-<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A02 files changed, 21 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-externa=
l-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0=
001-Makefile-allow-external-specification-of-build-setti.patch<br>
index ca7b3042..a384b9e6 100644<br>
--- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-speci=
fication-of-build-setti.patch<br>
+++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-speci=
fication-of-build-setti.patch<br>
@@ -1,25 +1,31 @@<br>
-From 0e6809ea075acd3edf7de197cd4e190ccdad6361 Mon Sep 17 00:00:00 2001<br>
-From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" targe=
t=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
-Date: Mon, 29 Mar 2021 20:50:47 -0400<br>
+From d254c922f14ca20d09d5258aa908a1105c6acd73 Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">You can&#39;t cha=
nge the &quot;from:&quot; in a patch.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+Date: Sun, 9 Feb 2025 21:06:29 +0800<br>
=C2=A0Subject: [PATCH] Makefile: allow external specification of build sett=
ings<br>
<br>
=C2=A0Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
+<br>
+Rebase to v2.0.2<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0---<br>
- Makefile | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+ src/import/Makefile | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-Index: nerdctl-v2.0.0-beta.1/src/import/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile<br>
-+++ nerdctl-v2.0.0-beta.1/src/import/Makefile<br>
-@@ -38,7 +38,7 @@<br>
+diff --git a/src/import/Makefile b/src/import/Makefile<br>
+index ae4e18c..eb22f9f 100644<br>
+--- a/src/import/Makefile<br>
++++ b/src/import/Makefile<br>
+@@ -45,7 +45,7 @@ endif<br>
<br>
=C2=A0 GO_BUILD_LDFLAGS ?=3D -s -w<br>
=C2=A0 GO_BUILD_FLAGS ?=3D<br>
--export GO_BUILD=3DGO111MODULE=3Don CGO_ENABLED=3D0 GOOS=3D$(GOOS) $(GO) b=
uild -ldflags &quot;$(GO_BUILD_LDFLAGS) -X $(PACKAGE)/pkg/version.Version=
=3D$(VERSION) -X $(PACKAGE)/pkg/version.Revision=3D$(REVISION)&quot;<br>
-+export GO_BUILD=3D$(GO) build -ldflags &quot;$(GO_BUILD_LDFLAGS) -X $(PAC=
KAGE)/pkg/version.Version=3D$(VERSION) -X $(PACKAGE)/pkg/version.Revision=
=3D$(REVISION)&quot;<br>
+-export GO_BUILD=3DCGO_ENABLED=3D0 GOOS=3D$(GOOS) $(GO) -C $(MAKEFILE_DIR)=
 build -ldflags &quot;$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X $(PACKAGE)/pkg=
/version.Version=3D$(VERSION) -X $(PACKAGE)/pkg/version.Revision=3D$(REVISI=
ON)&quot;<br>
++export GO_BUILD=3DGOOS=3D$(GOOS) $(GO) -C $(MAKEFILE_DIR) build -ldflags =
&quot;$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X $(PACKAGE)/pkg/version.Version=
=3D$(VERSION) -X $(PACKAGE)/pkg/version.Revision=3D$(REVISION)&quot;<br>
+ <br>
+ recursive_wildcard=3D$(wildcard $1$2) $(foreach e,$(wildcard $1*),$(call =
recursive_wildcard,$e/,$2))<br>
<br>
- ifdef VERBOSE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0VERBOSE_FLAG :=3D -v<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" r=
el=3D"noreferrer" target=3D"_blank">nerdctl_git.bb</a> b/recipes-containers=
/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nerdctl_git.bb</a><br>
index 63b96846..84734c9f 100644<br>
--- a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
+++ b/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
@@ -19,6 +19,7 @@ include src_uri.inc<br>
<br>
=C2=A0# patches and config<br>
=C2=A0SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-allow-exter=
nal-specification-of-build-setti.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://modules.txt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9125): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9125" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9125</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111096110/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111096110/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000006a728d062dc17af8--

