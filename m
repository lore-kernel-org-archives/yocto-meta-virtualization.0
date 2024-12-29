Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA08E7718B
	for <webhook@archiver.kernel.org>; Sun, 29 Dec 2024 03:53:51 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.40113.1735444429281662924
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 19:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+csy8YW;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so10648239a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 19:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735444429; x=1736049229; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6L7CEuMroABFm6IziJeLyAGJoC+t1vuRYhxzS2NyrT4=;
        b=c+csy8YWe9Rd+BqEv+JGdIua4atFDpk9N5dFhhdMtVJ+AG+EjsFlLYUbiJXihx/kZD
         ylpgPjEF9kXONByGHhwaDvZs9SDLCC0dKL0jGxXmf6g7VJRN0KSnhBu9hVn3s1O0fYMU
         zH2vq9jQ8vWtEizd2idjB+POdwaXlOaHDpi364GYKKPn183zwTU0zR27NuI7mRxrUxfy
         2y9ybmGdn9DDBN3xAtTaM1PdgGiqU1AR2Zv1rB5aFocMvOVgzNJ/kuSNOvmCHOxcu9pt
         OEP7tb9ZaCy4jbduHrLYnXplmfHtSFSou45KqcLiXcDPvPrywRilBIYlz49MEaFMwoio
         ABZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735444429; x=1736049229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6L7CEuMroABFm6IziJeLyAGJoC+t1vuRYhxzS2NyrT4=;
        b=dvxjAxvusJk+ipjzpVk/LO1XmHnCPphIREYDcj0X2CmyCuxHxWDiD/XaSJPWCDIvln
         1MQhRfYPhhvBxWEFEupD+Kb9wtsgByOi34SMfJx2DR6zdX/FRgnv3/2dIsFqis/c+MMH
         r/t6aBuTQOVgyP8D1OTD2dH5PJ2AgyaHKqcAYqcmiumM67f6PHgnjgZDWWhs7NrapsMk
         57OeLPFvEKPkS4DuLrJ2WPHSYl+5ASga+SWbi77xmQfODhm9gcD1g+vLgXQ7My+Rpbuj
         s91lof18LvdZBDY0tNhknEUikmLjBugbfYB84R2bjpaj5JKqH0WPHo00cnqDncW5JF4A
         IoUQ==
X-Gm-Message-State: AOJu0Yx3bnTiAvjsJFFOMee7KWGJ1kH6HVFxtk6qqDElhniVAa/RnWSe
	AsdRr95rRTYWeypMoaOaFPTXWLDVNZivBvP/gQqEuAFh0/S5M6dlHvHfSOEpWBC4cuHvid6eMC9
	EUZ9dDMZAaQ6uBPEDac8bLXaHHfM=
X-Gm-Gg: ASbGncutV5tPWFNPmOPVxfDCnGNKWe5Rmx0c9HVdPSfl0RGk/wPO0IxU/pn52jGdYFZ
	zkWFjsCxAGZvF/26xtmulSIJ/aXfLnsnGs4CK5g==
X-Google-Smtp-Source: AGHT+IEYfhi6vqB4Rj3htbWBbZiivvsA5CDDMqR54BVrHJNKnOWW3ZEH8LfMo9KgLnLaX405YwYoJD3dLdDD1eGZeJE=
X-Received: by 2002:a17:90b:54cd:b0:2ee:6d04:9dac with SMTP id
 98e67ed59e1d1-2f452f02678mr43869338a91.32.1735444428557; Sat, 28 Dec 2024
 19:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20241211090417.8979-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20241211090417.8979-1-hsimeliere.opensource@witekio.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Dec 2024 22:53:36 -0500
Message-ID: <CADkTA4Mt5jP0RsaXiMvk4zYqABG0Ba69P=9TOnX+uFk=4vgWVw@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap][PATCH] runc-opencontainers:
 upgrade 1.1.12 -> 1.1.14
To: hsimeliere.opensource@witekio.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Bruno VERNAY <bruno.vernay@se.com>
Content-Type: multipart/alternative; boundary="000000000000b11651062a60a4bc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Dec 2024 03:53:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9069

--000000000000b11651062a60a4bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't forgotten about this, I'll catch up with merges when I return
from holidays on January 2nd

Bruce

On Wed, Dec 11, 2024 at 4:04=E2=80=AFAM Hugo Simeliere via lists.yoctoproje=
ct.org
<hsimeliere.opensource=3Dwitekio.com@lists.yoctoproject.org> wrote:

> From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>
> Alignment with runc-docker version
> Includes fix for CVE-2024-45310 and other bug fixes
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md
>
> Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> b/recipes-containers/runc/runc-opencontainers_git.bb
> index 188b8440..6eef2c8f 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,11 +1,11 @@
>  include runc.inc
>
> -SRCREV =3D "a9833ff391a71b30069a6c3f816db113379a4346"
> +SRCREV =3D "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
>  SRC_URI =3D " \
>      git://
> github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=3Dhttps \
>
>  file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>      "
> -RUNC_VERSION =3D "1.1.12"
> +RUNC_VERSION =3D "1.1.14"
>
>  CVE_PRODUCT =3D "runc"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9058):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9058
> Mute This Topic: https://lists.yoctoproject.org/mt/110058226/1050810
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

--000000000000b11651062a60a4bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I h=
aven&#39;t forgotten about this, I&#39;ll catch up with merges when I retur=
n from holidays on January 2nd</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 11, 2024 at 4:04=E2=80=
=AFAM Hugo Simeliere via <a href=3D"http://lists.yoctoproject.org">lists.yo=
ctoproject.org</a> &lt;hsimeliere.opensource=3D<a href=3D"mailto:witekio.co=
m@lists.yoctoproject.org">witekio.com@lists.yoctoproject.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Hugo SIME=
LIERE &lt;<a href=3D"mailto:hsimeliere.opensource@witekio.com" target=3D"_b=
lank">hsimeliere.opensource@witekio.com</a>&gt;<br>
<br>
Alignment with runc-docker version<br>
Includes fix for CVE-2024-45310 and other bug fixes<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/ru=
nc/blob/v1.1.14/CHANGELOG.md</a><br>
<br>
Signed-off-by: Bruno VERNAY &lt;<a href=3D"mailto:bruno.vernay@se.com" targ=
et=3D"_blank">bruno.vernay@se.com</a>&gt;<br>
Signed-off-by: Hugo SIMELIERE &lt;<a href=3D"mailto:hsimeliere.opensource@w=
itekio.com" target=3D"_blank">hsimeliere.opensource@witekio.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a> | 4 ++=
--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_=
git.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a>=
 b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb" re=
l=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
index 188b8440..6eef2c8f 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
@@ -1,11 +1,11 @@<br>
=C2=A0include runc.inc<br>
<br>
-SRCREV =3D &quot;a9833ff391a71b30069a6c3f816db113379a4346&quot;<br>
+SRCREV =3D &quot;2c9f5602f0ba3d9da1c2596322dfc4e156844890&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/opencontainers/runc;=
branch=3Drelease-1.1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=3Dhttps</a> \=
<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-=
remove-re.patch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-RUNC_VERSION =3D &quot;1.1.12&quot;<br>
+RUNC_VERSION =3D &quot;1.1.14&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;runc&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9058): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9058" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9058</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110058226/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110058226/1050810</a><br>
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

--000000000000b11651062a60a4bc--

