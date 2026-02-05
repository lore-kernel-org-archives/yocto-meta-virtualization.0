Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FCEA7950
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 01:39:16 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11276.1770255551339723449
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 17:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UpapKSTa;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c613161b489so146807a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 17:39:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770255551; cv=none;
        d=google.com; s=arc-20240605;
        b=B3T++hUkyux/t+EdPDnFtUR9RzEqxnY2fu4tGNzvQrNUjue8cstkKKsEIbOZWfDelY
         o5P+Oe3C9EMTlWEri2ZHcubbnpHpXkr/lW1TZRIEOtlLCUzecTVrSHqhq9nJvxKJiZAC
         erzMAq4XQZNOkqaHrYX9tmxNub6iF36SVnVAzel2BACoz1uRIMJRo4LQEa6r+PzMxuOL
         /R4/plsmlEIOkL+UeI6wq2NfBxyy1OE7WZPNmhLjN+Qkev5oz32otGwG493IZOPeWhK4
         qi5BV5DEuFYxFvokg1QBIvhAwjuuhNNvDVRM3AUq44a/mbgFJOLukzo553aQTxLk3k/U
         Oi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lanndh6yCO9HNEaA7SJvinSO93nmUqBDIeWiZhH3M2c=;
        fh=F3YnY7tRo0OnsSuEOCDfMXGOikGTwc/BG8r4NZRf3ZE=;
        b=DRl2ryr/HzEai24/SJPNY/8mWg+ljXItudzVCTuUSKb63Orx9Ri+sSvcCqtZwRO2DI
         xiB+jR9jSR5IX0wkna6rGbCoj/07aBU4jgsv/nLAgQWCDNDZB7aXbiKHp7u8uJf6GMei
         weSW67MoU52IOms7kpQf3yAVFWkgv9U/fbW98GANnzFf4YoOoBsLuofRjKeldB1mMQ3D
         s2cEBZmLG1X+/BYXP9LwBJK2TyM+uYhRsQCkCE6U9rd2A1sHi0T41tQCSkLQ0Ae8mKPI
         R+jBzYhMOcDUtRslailvZepEKn6soE5AKGNPspkt/P/8hop9PPHHBYOa3S/9VajCeq2Q
         7I9Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255551; x=1770860351; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lanndh6yCO9HNEaA7SJvinSO93nmUqBDIeWiZhH3M2c=;
        b=UpapKSTaKRBm6rEO03BlWEs054d9+RKWIpWw+j6bVyl7inRygGXcobp4eMfaoav5bi
         CC8oLTMv9dLuIXrq3kMZTH6Iv71eGaCYDb21kVOsXTCcLQtFvPM5oigM+0jV71R7FdaV
         2LdD5uVpDW5Knm5ktXScrTdNB7Lgrn0hDNwuPybfRbcCIulUD4Vl7hoAHqHu8uAepP54
         cbbNus+GU7E8V6KP0TNypkjiIej7MS9DmXtunonKP+dKXJdDiilDQ+2ZEB8ltZFtRMmm
         /9jtR5DQ+QyNDWqCAszLhTzXutQ2pkn8izzy4OPmd2G+ljR6ed3xeumB12b5Xi4ENg4W
         tgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255551; x=1770860351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lanndh6yCO9HNEaA7SJvinSO93nmUqBDIeWiZhH3M2c=;
        b=JDnQteslFDxcPcMd0o1lQspBIkkq+NoaAYhqDtGcN5on7CcrsWzhwi7sABsDkWH/7E
         Zt8yeaNAuQYFTO61LDBK69PTrkCoUd5hZcR0yrQ6QIZDUWu2rbAF0m0B1EHN3tAzRu3t
         u8EvH07zzNzT97SqMxT82qG3lzImFc6k0BgQH7IJiIOFndwrf3qSEQKPBPLhztrp+2gJ
         0WRwfPfuTxW9TtMwpBdorD2yVd+rvzIS8c1hjSCbM3BTuYNrYFlYQ19B5YKAQNx7/syl
         0eRA7GAJtdqqrkEPszPOnWg6yxFKCLlh8mXKzxA+9mYoZoIf5cbZq1Y1qqABCCAtXiQu
         hliw==
X-Gm-Message-State: AOJu0YxFXYRCTmTTEefeSLbewlmPu5xAIwkObaqswWuw7H0nhC/CUnBy
	FLFZfvLZm+qglbu2vUwfcdVO0AJ94BFnmRvc5x8gzeCKBLLm1+Nrb7eCiKNK0PJOjIEBF5kim/h
	bkmC1QajrwbYGkpYiJbgOAhAg5fvGE278nbmb
X-Gm-Gg: AZuq6aIgvjYqGLwNVX+6jCaJQua90nOnv1wXELCTkS03L3OBk/C1PTVcjykYI/LBzCS
	7OLuRKDaibcdLmq9xzMFzRnjhMrTj+KNus3JCOtgVDeJx6SSswPBnJ8P2B7vUQERhhwd5wh+tbA
	Se6mQ0x4Tkh3Q+nO6xVCYNTowersrl8W4tVRjUE+UZ0HZr0lFy1hOHeKfVhGSdxA2QkEfmSjZrU
	DCPQkwtVLYRpk35gvmaG8YP/SDSgvwbdmXbD53HCoA3FeLijOafh1no/9oCtdl/0wozZ/7XwmiK
	hhceiJZw2zpjvlOPLV1lY1h1Cowu
X-Received: by 2002:a17:90a:e7c5:b0:34e:5516:6655 with SMTP id
 98e67ed59e1d1-35487115908mr3724789a91.9.1770255550517; Wed, 04 Feb 2026
 17:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20260203035140.902906-1-Qi.Chen@windriver.com>
In-Reply-To: <20260203035140.902906-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 20:38:59 -0500
X-Gm-Features: AZwV_QjitXWxHAVptbhLbt5Yj6K3t8HgIPwnCK3oqeQt59hx9GPGw3A2qsCLrjo
Message-ID: <CADkTA4PmJ16DoD8sdN1XrU3ATJY_Q-MEwCZX9bpk61QY5+qoYw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nerdctl: use -modcacherw to avoid
 do_rm_work failure
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000040164d064a09bd29"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Feb 2026 01:39:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9557

--00000000000040164d064a09bd29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 10:52=E2=80=AFPM Chen Qi via lists.yoctoproject.org =
<Qi.Chen=3D
windriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> When rm_work is enabled, building nerdctl fails because do_rm_work
> fails to remove the contents under pkg/mod/ as they are readonly.
> Use '-modcacherw' to fix this issue.
>

I'm going a different way to fix this.

I've avoided using modcacherw so far, and would like to continue as
having it on can mask some issues.

I have permissions fixups, they should be firing for this, and I'm
sorting that out now as I work through some package updates.

Bruce


>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> b/recipes-containers/nerdctl/nerdctl_git.bb
> index 8f63b48c..1c37bcf8 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -78,7 +78,7 @@ do_compile() {
>          export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGE=
T}"
>
>          # -trimpath removes build paths from the binary (required for
> reproducible builds)
> -        oe_runmake GO=3D${GO} BUILDTAGS=3D"${BUILDTAGS}"
> GO_BUILD_FLAGS=3D"-trimpath" binaries
> +        oe_runmake GO=3D${GO} BUILDTAGS=3D"${BUILDTAGS}"
> GO_BUILD_FLAGS=3D"-trimpath -modcacherw" binaries
>  }
>
>  do_install() {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9554):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9554
> Mute This Topic: https://lists.yoctoproject.org/mt/117611093/1050810
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

--00000000000040164d064a09bd29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 2, 2026 at 10:52=
=E2=80=AFPM Chen Qi via <a href=3D"http://lists.yoctoproject.org">lists.yoc=
toproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.yocto=
project.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
<br>
When rm_work is enabled, building nerdctl fails because do_rm_work<br>
fails to remove the contents under pkg/mod/ as they are readonly.<br>
Use &#39;-modcacherw&#39; to fix this issue.<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m going =
a different way to fix this.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I&#39;ve avoided=C2=A0using modcacherw so far, and would like to=
 continue as</div><div class=3D"gmail_default" style=3D"font-size:small">ha=
ving it on can mask some issues.<br><br>I have permissions fixups, they sho=
uld be firing for this, and I&#39;m</div><div class=3D"gmail_default" style=
=3D"font-size:small">sorting that out now as I work through=C2=A0some packa=
ge updates.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" r=
el=3D"noreferrer" target=3D"_blank">nerdctl_git.bb</a> b/recipes-containers=
/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nerdctl_git.bb</a><br>
index 8f63b48c..1c37bcf8 100644<br>
--- a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
+++ b/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
@@ -78,7 +78,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --s=
ysroot=3D${STAGING_DIR_TARGET}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# -trimpath removes build paths from the =
binary (required for reproducible builds)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake GO=3D${GO} BUILDTAGS=3D&quot;${BUIL=
DTAGS}&quot; GO_BUILD_FLAGS=3D&quot;-trimpath&quot; binaries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake GO=3D${GO} BUILDTAGS=3D&quot;${BUIL=
DTAGS}&quot; GO_BUILD_FLAGS=3D&quot;-trimpath -modcacherw&quot; binaries<br=
>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9554): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9554" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9554</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117611093/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117611093/1050810</a><br>
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

--00000000000040164d064a09bd29--

