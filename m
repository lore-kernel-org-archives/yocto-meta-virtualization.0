Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C08C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:00:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.21441.1736949652593897665
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 06:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrRB4qvE;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so11125567a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736949652; x=1737554452; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1OsU/Ehal5nbVo+rvYX0ISaQ8Nv+9hXi+tIAKTaBzwQ=;
        b=HrRB4qvEeXeWzA+FlIJUDOx5mOD4rvqFuqsj2QWMRKged4BNPvz97EKI1oPFZut+iP
         FctzbyTIq8fjXjtUZXKuhWDPIj2Ss7lXWipFC7VVCJ97jaLuOnJ+AEKOqFXOjl5eaM6G
         QA4rAfw2/BeCgXT++eZbT1O1Go6ryJ5VShSz7oZlqk0EysfD177HhKjVJaDMPPiZbtpr
         GCbe6oCESBu1jUPyzCaFXD4nuc5z7yDF0tjGzlvA4Mdw23NS8RkS5mwQ4dvDpfASe7I9
         g/9FO8znz3jN1ZEjQ6ni6iKn6Fpwo+CEF2RGEmM6CRKR3ZDsWQx1qO08cdB4GRmuO5DR
         vzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736949652; x=1737554452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OsU/Ehal5nbVo+rvYX0ISaQ8Nv+9hXi+tIAKTaBzwQ=;
        b=bTX6pKTVWh21jX/17q1FjlxR5mfOJM4NeJPyiGNeEMkVwI6u+/SUg9Kv9znUGBpK5u
         Dac1Wx4RhQifrUCk12Rf8DxroWZ9cYFtlXffBnzfj1NAM11q5oV6gNTELrQpeWot1Zdn
         hiRHZ7g3wMcnfXIGx80SXg6ScB78+g0codEnyXeIZMuhOZyzldd3YAfqbXcF7KzbYtxV
         ByvgyodEYXjEgWD2mzZAZt36saSdcexHhrOgexMhfQeAqnDPnNicRzpX6N+Rot+d28U/
         bOlyZdUlmSqx4frBdIKBAiR5mhGkOnboVpq0AA+crhb4pywzcL7JFSC7Wbrw3iJhAk+c
         gJvg==
X-Gm-Message-State: AOJu0YywwQFE/AFu7fr7Azzxl2Jp+uCYrSaIosG7tCCs43Gdu1WLnggq
	7SIE2r4y1zH3FUaYAbS0Ly6URvdM/xm3w9sv0PdjmgKBnJ5D+D5mDDO9vE7vMwG01kY5pJXujR2
	LT0d/sTBZbSRgt10HDuKV5UWwtNUp5AcKOLs=
X-Gm-Gg: ASbGnctB2KulEep7n3YXWtim/OZj3UFQKVOR3BeMKxQ8h90s4/xBDTVXTTzKyXucDIm
	yKzillJ3RaYNm9uR6ycZCZt1eNPzwQkPKcXesyPs=
X-Google-Smtp-Source: AGHT+IGEHp7Ci9zzCaeoWCvX1ZiF9X97Hb1xTCaQAD7tgyL7gBHU6YfdLTs/yxxygETwH6w5yi6lO5VTm6iCerf54qM=
X-Received: by 2002:a17:90b:2e8b:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2f548f0894dmr43785465a91.7.1736949651901; Wed, 15 Jan 2025
 06:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20250115054639.1079705-1-Qi.Chen@windriver.com> <20250115054639.1079705-2-Qi.Chen@windriver.com>
In-Reply-To: <20250115054639.1079705-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2025 09:00:40 -0500
X-Gm-Features: AbW1kvZTVIVFgONAxQCP7-cTD1zn9uXmJ5HpsBTDMJwreJKD_xQNI0YGkuXugLc
Message-ID: <CADkTA4NQrFPR+ZMtSxAVMRcx2p2iP+zode7jARYo=r18KP3Aow@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/4] cri-o: update to 1.31.4
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fe9313062bbf1ae5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 14:00:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9087

--000000000000fe9313062bbf1ae5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I already have an updated cri-o under test.

I'm not sure why you adjusted the patchdir, it isn't required.

Bruce

On Wed, Jan 15, 2025 at 12:47=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> 0001-Add-trimpath-to-build-nri.test.patch is rebased against this new
> version.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb          |  6 +++---
>  .../0001-Add-trimpath-to-build-nri.test.patch  | 18 +++++++++---------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb
> b/recipes-containers/cri-o/cri-o_git.bb
> index f04c4feb..5c2c453e 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -14,10 +14,10 @@ At a high level, we expect the scope of cri-o to be
> restricted to the following
>   - Resource isolation as required by the CRI \
>   "
>
> -SRCREV_cri-o =3D "20c06a19cb395445620c31730c0f1a0a1922eaae"
> +SRCREV_cri-o =3D "33d75981bee230f791709975125d7386fe2c530a"
>  SRC_URI =3D "\
>         git://
> github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;name=3Dcri-o;p=
rotocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;name=
=3Dcri-o;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
> -        file://0001-Add-trimpath-to-build-nri.test.patch \
> +
> file://0001-Add-trimpath-to-build-nri.test.patch;patchdir=3Dsrc/import \
>          file://crio.conf \
>          file://run-ptest \
>         "
> @@ -28,7 +28,7 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c2
>
>  GO_IMPORT =3D "import"
>
> -PV =3D "1.31.0+git${SRCREV_cri-o}"
> +PV =3D "1.31.4+git${SRCREV_cri-o}"
>
>  inherit features_check ptest
>  REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> diff --git
> a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> index c6be41f0..bf73250a 100644
> ---
> a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> +++
> b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> @@ -1,4 +1,4 @@
> -From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001
> +From a1eafac8256fbff81b72c82213eb5a37858d2e6a Mon Sep 17 00:00:00 2001
>  From: Peng Zhang <peng.zhang1.cn@windriver.com>
>  Date: Fri, 25 Oct 2024 10:42:02 +0800
>  Subject: [PATCH] Add --trimpath to build nri.test
> @@ -13,19 +13,19 @@ Signed-off-by: Peng Zhang <
> peng.zhang1.cn@windriver.com>
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index:
> cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makef=
ile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ----
> cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/=
Makefile
> -+++
> cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makef=
ile
> -@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
> +diff --git a/Makefile b/Makefile
> +index 34f9d429d..f5a033023 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -213,7 +213,7 @@ test/checkcriu/checkcriu: $(GO_FILES) ## Build the
> checkcriu test binary.
>         $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@
> ./test/checkcriu
>
> - test/nri/nri.test: $(wildcard test/nri/*.go)
> + test/nri/nri.test: $(wildcard test/nri/*.go) ## Build the NRI test
> binary.
>  -      $(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
>  +      $(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
> ${TRIMPATH}
>
> - bin/crio: $(GO_FILES)
> + bin/crio: $(GO_FILES) ## Build the CRI-O main binary.
>         $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@
> ./cmd/crio
>  --
> -2.34.1
> +2.25.1
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9082):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9082
> Mute This Topic: https://lists.yoctoproject.org/mt/110623151/1050810
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

--000000000000fe9313062bbf1ae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I already=C2=A0have an updated cri-o under test.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">I&#39;m not sure why you adjusted the=
 patchdir, it isn&#39;t required.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div></div><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2025 at 12:47=E2=80=AFAM Chen=
 Qi via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a=
> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.yoctoproject.org">win=
driver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Che=
n@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
0001-Add-trimpath-to-build-nri.test.patch is rebased against this new<br>
version.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 6 +++---<br>
=C2=A0.../0001-Add-trimpath-to-build-nri.test.patch=C2=A0 | 18 +++++++++---=
------<br>
=C2=A02 files changed, 12 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> b/recipes-containers/cri=
-o/<a href=3D"http://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri=
-o_git.bb</a><br>
index f04c4feb..5c2c453e 100644<br>
--- a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a><br>
+++ b/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a><br>
@@ -14,10 +14,10 @@ At a high level, we expect the scope of cri-o to be res=
tricted to the following<br>
=C2=A0 - Resource isolation as required by the CRI \<br>
=C2=A0 &quot;<br>
<br>
-SRCREV_cri-o =3D &quot;20c06a19cb395445620c31730c0f1a0a1922eaae&quot;<br>
+SRCREV_cri-o =3D &quot;33d75981bee230f791709975125d7386fe2c530a&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/kubernetes-s=
igs/cri-o.git;branch=3Drelease-1.31;name=3Dcri-o;protocol=3Dhttps;destsuffi=
x=3D$%7BGO_SRCURI_DESTSUFFIX%7D" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;name=3Dcri-o;protocol=
=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-trimpath-to-build-nri.test.pat=
ch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-trimpath-to-build-nri.test.pat=
ch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crio.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=
=3De3fc50a88d0a364313df4b21ef20c2<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<br>
-PV =3D &quot;1.31.0+git${SRCREV_cri-o}&quot;<br>
+PV =3D &quot;1.31.4+git${SRCREV_cri-o}&quot;<br>
<br>
=C2=A0inherit features_check ptest<br>
=C2=A0REQUIRED_DISTRO_FEATURES ?=3D &quot;seccomp&quot;<br>
diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.=
test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.=
test.patch<br>
index c6be41f0..bf73250a 100644<br>
--- a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.pa=
tch<br>
+++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.pa=
tch<br>
@@ -1,4 +1,4 @@<br>
-From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001<br>
+From a1eafac8256fbff81b72c82213eb5a37858d2e6a Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Peng Zhang &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.com" =
target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 25 Oct 2024 10:42:02 +0800<br>
=C2=A0Subject: [PATCH] Add --trimpath to build nri.test<br>
@@ -13,19 +13,19 @@ Signed-off-by: Peng Zhang &lt;<a href=3D"mailto:peng.zh=
ang1.cn@windriver.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&g=
t;<br>
=C2=A0 Makefile | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import=
/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/impo=
rt/Makefile<br>
-+++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Ma=
kefile<br>
-@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)<br>
+diff --git a/Makefile b/Makefile<br>
+index 34f9d429d..f5a033023 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -213,7 +213,7 @@ test/checkcriu/checkcriu: $(GO_FILES) ## Build the che=
ckcriu test binary.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags &quo=
t;$(BUILDTAGS)&quot; -o $@ ./test/checkcriu<br>
<br>
- test/nri/nri.test: $(wildcard test/nri/*.go)<br>
+ test/nri/nri.test: $(wildcard test/nri/*.go) ## Build the NRI test binary=
.<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 $(GO) test --tags &quot;test $(BUILDTAGS)&quot;=
 -c ./test/nri -o $@<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 $(GO) test --tags &quot;test $(BUILDTAGS)&quot;=
 -c ./test/nri -o $@ ${TRIMPATH}<br>
<br>
- bin/crio: $(GO_FILES)<br>
+ bin/crio: $(GO_FILES) ## Build the CRI-O main binary.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags &quo=
t;$(BUILDTAGS)&quot; -o $@ ./cmd/crio<br>
=C2=A0-- <br>
-2.34.1<br>
+2.25.1<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9082): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9082" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9082</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110623151/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110623151/1050810</a><br>
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

--000000000000fe9313062bbf1ae5--

