Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A6FC5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 13:07:26 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.20629.1748524038097668592
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 May 2025 06:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T2cExtRz;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso842130a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748524037; x=1749128837; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sA69XTafD3l1X/mTKweQc8M+9/IEAAq6hbIYNyHSmSU=;
        b=T2cExtRz/mGMcfVrHyiVKPLnZhBIDKV0Plb9dAkFfzEmJtPSKlreESGvNWrPf8Dlcx
         8rUgyCPXQS1AlsH6I9rEJd32L2yKk2WG8d4ugKj7QiNShaStA+5/0s1V6V4JR7tBW1pp
         JhrdDhBfKg5PAjOFlGBXzWd7yEXljBPEacOi9WivGZHhpX8fMIT6WKZrngadiU5+rLLR
         xqubvkUnOWkoWHjbg+UGJbg5sUF83cnQwM5GK9UUT0yyF21b1lSV7x+hBbDply2E4Tq4
         ky7DHjw3dPd3RE0Ukz8OdFdHTVU4phh1VO/9wDNT33LDKpDffcYCt25ZqSddeL7zcHcN
         T5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748524037; x=1749128837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sA69XTafD3l1X/mTKweQc8M+9/IEAAq6hbIYNyHSmSU=;
        b=Ys2SuwLH58W4AlCxsz0TscTZ7JudFuvGP4ciHaGOlzCC4AuaKZaDfCCmv+8jvlMRLY
         Fnzm5qxXvfvAUx6LDParcsizxZXhIPR0uOzzFvUDiRG3fX0Y503QF/tqQn7Wg7+c84lv
         E9smkrk1ddKo5bJVi7Zo46tOKyrI2U4bKklJa+Zy90D9lrl59Xz767Hs/juRC5jduOO9
         XO0Lg9BoDyiNL3KSocgw7/rpdRWDpElYtxKtPa+VcZDAjrYE+iUU3SIM+jqYOnD6cC1B
         Y7usN6GanpZIbURrDs0mI7vwkUp8ChjFDNaBq2pD4PUYtYGRpb6VUXjgw8yrkEiZ6JHp
         IW1g==
X-Gm-Message-State: AOJu0YwHBuvP+cJJtAGV4nWuYxxLdLatjvnCY1T71xFUzyxtgn4ewz8l
	/Xee2kT9VmQUbZ+EMa711juxa5L8xO9w7UaXgcdounCZvaETbGHeEE1Oqcu/QJ5kBbzvhMQ2G9B
	6ocJZnY48+ctrAEGZMwglh/mPytdXMUs9Tndx
X-Gm-Gg: ASbGncsL7yxv0a7ROAhG1LglnA/3fV6LHiUVKwo6BGMCWHHYmgiiOSWlcKDDwRiq4Ux
	oBFfRsXcicobVn3PrDpg7mLU7emICjledz/hNuEwMTgA9un0uAhs6YGRisRRvcnoT6gL5rxClW6
	7D+XcEGQ++PShHyME2Tog8Zz4317zTw1Xfdw==
X-Google-Smtp-Source: AGHT+IEPLSYZMWxwK9IBd/MuswKTy9TsFQuM6++na0ZhLa5fDS4epo1V9p4Q6yFBcVzXpahHMXMORXyEs+wGAUdLQHc=
X-Received: by 2002:a17:90b:3f4d:b0:311:ffe8:20e8 with SMTP id
 98e67ed59e1d1-311ffe8330amr6773200a91.1.1748524037018; Thu, 29 May 2025
 06:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250529035110.1881797-1-Qi.Chen@windriver.com>
In-Reply-To: <20250529035110.1881797-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 May 2025 09:07:14 -0400
X-Gm-Features: AX0GCFsMF2mjNagOlVSw-QUDWvL7TKEiMtRgNcJR3havC7LYyiIzUjUkBHaQ3m8
Message-ID: <CADkTA4NNhT=pxaFqqjusrJg1MQ+ArUW8EH0jnrxDzfFMv2U+8g@mail.gmail.com>
Subject: Re: [meta-virtualization][master][walnascar][PATCH 1/3]
 docker-distribution: bump to v3.0.0 stable version
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001b9ad1063645fafc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 13:07:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9265

--0000000000001b9ad1063645fafc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As I've mentioned before, I'm not doing package upgrades at the moment.

A full pass of the recipes will happen at the m2 timeframe of the current
release.

Cheers,

Bruce

On Wed, May 28, 2025 at 11:51=E2=80=AFPM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Bump docker-distribution from v3.0.0-beta.1 to v3.0.0 stable
> version.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker-distribution/
> docker-distribution_git.bb b/recipes-containers/docker-distribution/
> docker-distribution_git.bb
> index 495b0d17..41c4e227 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "The Docker toolset to pack, ship, store, and
> deliver content"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80=
314"
>
> -SRCREV_distribution =3D "f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a"
> +SRCREV_distribution =3D "9ed95e7365224025ee89365e12cf128e1f1bf965"
>  SRC_URI =3D "git://
> github.com/docker/distribution.git;branch=3Dmain;name=3Ddistribution;dest=
suffix=3Dgit/src/github.com/distribution/distribution/v3;protocol=3Dhttps
> \
>             file://docker-registry.service \
>             file://0001-build-use-to-use-cross-go-compiler.patch \
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://
> github.com/docker/distribution.git;branch=3Dmain;name=3Ddistributio
>
>  PACKAGES =3D+ "docker-registry"
>
> -PV =3D "v3.0.0-beta.1"
> +PV =3D "v3.0.0"
>  S =3D "${WORKDIR}/git/src/github.com/distribution/distribution/v3"
>
>  GO_IMPORT =3D "import"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9262):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9262
> Mute This Topic: https://lists.yoctoproject.org/mt/113356930/1050810
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

--0000000000001b9ad1063645fafc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">As =
I&#39;ve mentioned before, I&#39;m not doing package upgrades at the moment=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">A full pass of the reci=
pes will happen at the m2 timeframe of the current release.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 28, 2025 at =
11:51=E2=80=AFPM Chen Qi via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.=
yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a =
href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.c=
om</a>&gt;<br>
<br>
Bump docker-distribution from v3.0.0-beta.1 to v3.0.0 stable<br>
version.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../docker-distribution/<a href=3D"http://docker-distribution_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">docker-distribution_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-distribution/<a href=3D"http://docke=
r-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribu=
tion_git.bb</a> b/recipes-containers/docker-distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-dis=
tribution_git.bb</a><br>
index 495b0d17..41c4e227 100644<br>
--- a/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
+++ b/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
@@ -3,7 +3,7 @@ SUMMARY =3D &quot;The Docker toolset to pack, ship, store, =
and deliver content&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd2794c0df5b907fdace23=
5a619d80314&quot;<br>
<br>
-SRCREV_distribution =3D &quot;f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a&quo=
t;<br>
+SRCREV_distribution =3D &quot;9ed95e7365224025ee89365e12cf128e1f1bf965&quo=
t;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/distribut=
ion.git;branch=3Dmain;name=3Ddistribution;destsuffix=3Dgit/src/github.com/d=
istribution/distribution/v3;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/docker/distribution.git;branch=3Dmain;name=3Ddistributio=
n;destsuffix=3Dgit/src/github.com/distribution/distribution/v3;protocol=3Dh=
ttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker-registry.service \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-use-to-use-cros=
s-go-compiler.patch \<br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/dock=
er/distribution.git;branch=3Dmain;name=3Ddistributio" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/docker/distribution.git;branch=3Dmain;name=3Ddis=
tributio</a><br>
<br>
=C2=A0PACKAGES =3D+ &quot;docker-registry&quot;<br>
<br>
-PV =3D &quot;v3.0.0-beta.1&quot;<br>
+PV =3D &quot;v3.0.0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git/src/<a href=3D"http://github.com/distribut=
ion/distribution/v3" rel=3D"noreferrer" target=3D"_blank">github.com/distri=
bution/distribution/v3</a>&quot;<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9262): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9262" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9262</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113356930/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113356930/1050810</a><br>
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
rek II<br><br></div>

--0000000000001b9ad1063645fafc--

