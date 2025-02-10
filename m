Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B524C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 18:30:51 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.89.1739212250085875290
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 10:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HusBxCHJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f42992f608so7177150a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 10:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739212249; x=1739817049; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97zCtjBd4fSPI0eU1w3yTMM7t7kDgFbQzoipwjx65RQ=;
        b=HusBxCHJbU20PYzSP/hpTOuYSpWgArx0wFE/o0halerR675jfDsc8cEklGmBI5Y0pt
         bZdZBy2URhcTvIgFeHnPe0O7muZZMbm6mJj3tELn5lgL2BUtC2nz/0luG/l3F1ZV8Ez3
         42mnBFtDkMyE365fiIYMlR/s/ZFHbB2vlJzdYtjCK+rTTZT2v3M1MwstFy8O7r05nfUs
         e4JIG8khRQ7erYOpC5AGPNnLshV5XwnE6tzoFYOSJ+6UE/oXLVKnSH2dguzIUVPnNHPa
         mef5RWDU0PUmICCd8wzYVB+7Odjq5WdoNx+exiqsgTvKrYGNhkxFeBh4GUgB2+HarpGV
         pq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212249; x=1739817049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97zCtjBd4fSPI0eU1w3yTMM7t7kDgFbQzoipwjx65RQ=;
        b=tBXfbaZJ7z5NjCnJcrN0UpGWzNOs8mkUqMOrvDM8j3lLkgE8nNDQKSoQxr0P/vh68Q
         75XAeHcFkKP3dUxhgRZ88WNINhEhlUaaf2b+EAvb2li1MJMEGQUyVAsxblahFV5fLuP5
         +djfKxGrSkhNUBBmL1fE9OOpxHKx7Cz0NsKiAlna5P1fEir7S0XAZHUuuS/wkmBx+xHy
         /FZGcZ3PQ5IXsBhuxKYZ7x5zNGQRjjBjcglOvxkfgpKd/2DHTUOMTSz0QnlyWPetTn5L
         ONfZ+b9GQbpapOXvQoYPMoYsfXcaQsxFa6KJk5uUY345ChHNvYxjn+culNz9h5iKYcE5
         iTlQ==
X-Gm-Message-State: AOJu0YwVTVk8xHuz4j/gHuwLcesuslRjnc7FvL722iF8oRF27Nc+25Cl
	/ZLqIJQltdJqxydPgJGRFEmbwz7jZXXiIt0u4GUTdWdSCDFqIexqzEg0MtTEnlzXH4Apuki8pnl
	n0S6dh+T0gf9Fv2C2oREtuxO50xY=
X-Gm-Gg: ASbGncukgRIMBfE69M8/rVzCJHKiO6mhUkTWQ3ksyvm+hGlVYQ1dzsvPDXe3FB+9A1l
	fiz8ZgTqK//9219dMmVTHxefRxNdD1e2Am55KPvyP7m5maXn8NEUatCY3U5SUjF1JElDobCRgXg
	==
X-Google-Smtp-Source: AGHT+IH6Zlmr2KpEigzns5JiD348WTTJZHcLtk2jIpQ9TlgUPOagdzsjQUgprTZ7+RqAhFpOEbz3g4oP+8tNNTk/h1U=
X-Received: by 2002:a17:90b:344c:b0:2ee:4b8f:a5b1 with SMTP id
 98e67ed59e1d1-2fa242d9eefmr21761553a91.24.1739212249165; Mon, 10 Feb 2025
 10:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20250210074700.1751058-1-hongxu.jia@windriver.com>
In-Reply-To: <20250210074700.1751058-1-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2025 13:30:37 -0500
X-Gm-Features: AWEUYZnh7bvIpJPY7EAnYH-bD6Ed17_3z2jtH7qdhHdwyBPeCOQTFCJt810PSy4
Message-ID: <CADkTA4NQ20HzxWm7ubXqd4wFXsTBQHGYkr_t1vAKHaDukyZSkw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2 1/3] nerdctl: fix do_compile failed
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004cf987062dcde88e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 18:30:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9135

--0000000000004cf987062dcde88e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 2:47=E2=80=AFAM hongxu via lists.yoctoproject.org
<hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> Using latest poky + meta-virtualization + meta-openembedded, build multli=
b
> failed
>
> ...local.conf...
> MACHINE =3D "qemux86-64"
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"
>

Aha. In my experience, the entire stack doesn't function all that well on
32 bit.

Have you confirmed the runtime management of containers on 32bit ? (I'd
prefer to depreciate it and just support 64 bit arches).

Bruce



>
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
>  ...xternal-specification-of-build-setti.patch | 28 +++++++++++--------
>  recipes-containers/nerdctl/nerdctl_git.bb     |  1 +
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git
> a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> index ca7b3042..cf7037f3 100644
> ---
> a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> +++
> b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
> @@ -6,20 +6,26 @@ Subject: [PATCH] Makefile: allow external specification
> of build settings
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
> View/Reply Online (#9131):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9131
> Mute This Topic: https://lists.yoctoproject.org/mt/111098600/1050810
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

--0000000000004cf987062dcde88e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2025 at 2:47=
=E2=80=AFAM hongxu via <a href=3D"http://lists.yoctoproject.org">lists.yoct=
oproject.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists=
.yoctoproject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Using latest pok=
y + meta-virtualization + meta-openembedded, build multlib failed<br>
<br>
...local.conf...<br>
MACHINE =3D &quot;qemux86-64&quot;<br>
require conf/multilib.conf<br>
MULTILIBS =3D &quot;multilib:lib32&quot;<br>
DEFAULTTUNE:virtclass-multilib-lib32 =3D &quot;x86&quot;<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ah=
a. In my experience, the entire stack doesn&#39;t function all that well on=
 32 bit.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Have you confirm=
ed the runtime management of containers on 32bit ? (I&#39;d prefer to depre=
ciate it and just support 64 bit arches).</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
$ bitbake lib32-nerdctl<br>
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
=C2=A0...xternal-specification-of-build-setti.patch | 28 +++++++++++-------=
-<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A02 files changed, 18 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-externa=
l-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0=
001-Makefile-allow-external-specification-of-build-setti.patch<br>
index ca7b3042..cf7037f3 100644<br>
--- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-speci=
fication-of-build-setti.patch<br>
+++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-speci=
fication-of-build-setti.patch<br>
@@ -6,20 +6,26 @@ Subject: [PATCH] Makefile: allow external specification o=
f build settings<br>
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
View/Reply Online (#9131): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9131" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9131</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111098600/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111098600/1050810</a><br>
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

--0000000000004cf987062dcde88e--

