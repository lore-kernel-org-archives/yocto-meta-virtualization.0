Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D27EE63F3F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:21:54 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24820.1771262505121572489
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 09:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZBKK8od;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso2217165b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Feb 2026 09:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771262504; cv=none;
        d=google.com; s=arc-20240605;
        b=eUfoztIqKRLvcYAWURYloQXW4UXwPhFq0k8wM5HSWxdWNfPeJIbgpnkMFHrZteSkb2
         rNe/TXmtEyKJA+QVgO2Bv6IQfS6Ds4g7ZUcNLULVS/+knGypZsr4E/e+z7/hChacxSrK
         3JP7F/R9J4caUOOGvlSZSk7fQTcjHkU+6GA7XI6rruzQr6j5xsu8ePYWmmM+ndhbROds
         jICA1lX8Iz0QhF2avBFB1/bg50Wzlr7dqbAeydvU5cPAMSTkyifQk6kCf6e49i+H7SmJ
         DBGbuFztS2X3vLa0ULGAAtIVEWuxmYIay8/xQ1PiBVyrcIs2KDW/TTY+Phpuo90Pq9sX
         aGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SH9kVW61DJ0j4G575KLPwh8Mxeq3BgNklSR3MtoH0AI=;
        fh=lP96Y0vbCHpvEIxkePlHQseUtVqc/S3lU3XvgkX6AsI=;
        b=IdmnQ+RR48hG32yzqM/3kkgEiaduhD63lXVqlUSnAkak2+cU9gqKnfSvebfdoCH9rD
         wlQKv58RngHK5ykcwPoRTQ9WIKgNc5J5W/Y+f2plbM849ZVqPu7aPfk6sHk1KfsCq3gg
         qVO0TeqHbnwdC570LwYJ7Gp1TM4ByggkwvduHk52WBwcq0ryQo9tDuigXQVmqdEmChat
         jpuNjU2WBa28UMYfAUHxnteY0fAlwO3WQJOC1/WhG5gqRO+kQ8sF0qDmMbqjI9VCO07I
         yHlUMl3QgvShDMFxdGbRSO8r+8EYv/HzTTcm10qoDAkjleqxr4EKB6WcNmub+KgOyaDK
         MyOA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771262504; x=1771867304; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SH9kVW61DJ0j4G575KLPwh8Mxeq3BgNklSR3MtoH0AI=;
        b=FZBKK8odQpxKl4CKb57j4a9Y2zdc/Hpl5OJhQrvz+G8/V0w0ItU0O7L8L+oWhhv7Dn
         bRppL0fmWI/1KcP1pn1ZIacdTnc5eaZ/Am5Tx0SATY3mNtZOiWv+SuxCODU3yhDjI6sE
         xMUxKwqVY/bvy19HxxrrFtoZahU4JYcG/rcISlr7TN1obA48CZpsMWEFl4ACGMvYzKO2
         tZ2Ko9oXeTeTKHWBYeWonzLY1bdA3UCoyXlVtaX7lPQL0z97YgT+aHJqrOiJsDuTxD7d
         r7GzFBUZg2OTm34GnKZ9vuZc4eie9BrbI7e89XQLjn7RR1/Oebj3v0k1imXzbAswfqdO
         wJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262504; x=1771867304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH9kVW61DJ0j4G575KLPwh8Mxeq3BgNklSR3MtoH0AI=;
        b=soEDR7OqB3h6Huy/nEVq+vX4eUa15BCSqaE6zJ5e+i9GR7zEypJI13iV3MS75G97aH
         Xh3fVAuFfEEJ442ZBKNf6VuC/frKtYlgxRUPPbz1tqiQXe+0D/9RKUY52bvlSGb7MOD1
         Mx6vrNOt6FbD6TgZUpQfKMdDgltDiUq1eRMIF6z0+BHxb58vvVeCNyE9yASh2OEuvfkM
         no7s/qiN6dYBpkfw+1pGbzOouQV2hvmeVWXtlQV8EjYCd1NLf8atg5gvX+q3U35GQo42
         qx/KDGwFE22NagPCwKMiLen0paBBM2aIaoW9LGcHknJFTmsROEhLNpYzWty/BtEgw3qx
         XWBA==
X-Gm-Message-State: AOJu0YzoaFirAK1Ntq/QhBUuAawLs4YapSdipHdJtz2XVZLgfU9WbmAX
	austT6b5S313DkLWFrtheAKu48B3SnomJUeD8+I6wdz+tuocD5aRQ1i8gFczj2oOmVaTS/f1qzd
	sx+jzoiF3qyoOLezSs3BkRr1o92piXq8=
X-Gm-Gg: AZuq6aJSc4n836zjMudXCZwYHUnO4H6kSM97WEOXKjMzNh2O7AfC4KM8+V2mK3Isd3l
	0C9YHPphLeWfJwGjBRyMHU/0GI0F4mbRlwaZsf6xeQo5NiUkjQDmxZy6mj0lNB8w9PIcTyHYiNA
	M//ffQgkP8QMcCGnoJl4lJWitGNM0UEYcKMtYg/lGLaxT86STyJOQWfuSIQ17uNW7eeIcIp+Po5
	qCSDgghhMREpxZYCOt05wqjdkM18ruV86udUb+YEYQSAdPBLGFOusTZx4rEX6eDYzgTn57ybePU
	8uSj3T0kfItzQGQH36MydPi6e3ZNK3AQEE0gGwY2
X-Received: by 2002:a17:90b:524b:b0:356:22ef:57b9 with SMTP id
 98e67ed59e1d1-356aab969ffmr8047967a91.3.1771262504356; Mon, 16 Feb 2026
 09:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
In-Reply-To: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Feb 2026 12:21:32 -0500
X-Gm-Features: AaiRm50u3FyLQhNIsRdtwATw9cbUT7wGxa2ZB-2d8tnFSHLRq6dLZY610jrkfu0
Message-ID: <CADkTA4PF6nXSAm7Fo3DT8vPgEEiUStXO9zidXgVhwfyM5Hbzmw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] Update docker-moby to v25.0.9
To: felix@piedallu.me
Cc: meta-virtualization@lists.yoctoproject.org, 
	=?UTF-8?B?RsOpbGl4IFBpw6lkYWxsdQ==?= <felix.piedallu@non.se.com>, 
	pascal.eberhard@se.com
Content-Type: multipart/alternative; boundary="000000000000604ff3064af4307d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Feb 2026 17:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9595

--000000000000604ff3064af4307d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 12:17=E2=80=AFPM felix via lists.yoctoproject.org <=
felix=3D
piedallu.me@lists.yoctoproject.org> wrote:

> This patch updates docker-moby to version v25.0.9.
>
> This is not the latest release of the v25.0 branch but the latest
> supporting Go 1.22, provided in oe-core scarthgap.
> Updating to newer releases will require updating go to 1.23.
>

So I assume this is for scarthgap ?  That's not indicated in the subject
line, so I want to be sure.

Also note, if a newer go is backported to one of the mixin layers, I'm find
to take newer 25.x releases of docker, we just need to select a default
that builds with oe-core only.

Bruce



>
> Signed-off-by: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
> ---
> F=C3=A9lix Pi=C3=A9dallu (3):
>       docker-moby: Update libnetwork
>       docker-moby: Update docker cli
>       docker-moby: Update to v25.0.9
>
>  recipes-containers/docker/docker-moby_git.bb       |  11 +-
>  .../docker/files/CVE-2024-29018.patch              | 344
> ---------------------
>  .../docker/files/CVE-2024-36620.patch              |  39 ---
>  .../docker/files/CVE-2024-36621.patch              |  82 -----
>  4 files changed, 4 insertions(+), 472 deletions(-)
> ---
> base-commit: 8b1543e121deda2445f80f74d85c10316d5b31f4
> change-id: 20260216-upstream-update-docker-moby-d0826db5916b
>
> Best regards,
> --
> F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9591):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9591
> Mute This Topic: https://lists.yoctoproject.org/mt/117842532/1050810
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

--000000000000604ff3064af4307d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 16, 2026 at 12:17=
=E2=80=AFPM felix via <a href=3D"http://lists.yoctoproject.org">lists.yocto=
project.org</a> &lt;felix=3D<a href=3D"mailto:piedallu.me@lists.yoctoprojec=
t.org">piedallu.me@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">This patch updates docker-moby to =
version v25.0.9.<br>
<br>
This is not the latest release of the v25.0 branch but the latest<br>
supporting Go 1.22, provided in oe-core scarthgap.<br>
Updating to newer releases will require updating go to 1.23.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">So I assume this is for scarthgap ?=C2=A0 That&#39;s not indicated in the=
 subject line, so I want to be sure.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Also note, if a newer go is backported to one of the mixin laye=
rs, I&#39;m find to take newer 25.x releases of docker, we just need to sel=
ect a default that builds with oe-core only.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: F=C3=A9lix Pi=C3=A9dallu &lt;<a href=3D"mailto:felix.piedall=
u@non.se.com" target=3D"_blank">felix.piedallu@non.se.com</a>&gt;<br>
---<br>
F=C3=A9lix Pi=C3=A9dallu (3):<br>
=C2=A0 =C2=A0 =C2=A0 docker-moby: Update libnetwork<br>
=C2=A0 =C2=A0 =C2=A0 docker-moby: Update docker cli<br>
=C2=A0 =C2=A0 =C2=A0 docker-moby: Update to v25.0.9<br>
<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 11 +-<br>
=C2=A0.../docker/files/CVE-2024-29018.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 344 ---------------------<br>
=C2=A0.../docker/files/CVE-2024-36620.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 39 ---<br>
=C2=A0.../docker/files/CVE-2024-36621.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 82 -----<br>
=C2=A04 files changed, 4 insertions(+), 472 deletions(-)<br>
---<br>
base-commit: 8b1543e121deda2445f80f74d85c10316d5b31f4<br>
change-id: 20260216-upstream-update-docker-moby-d0826db5916b<br>
<br>
Best regards,<br>
-- <br>
F=C3=A9lix Pi=C3=A9dallu &lt;<a href=3D"mailto:felix.piedallu@non.se.com" t=
arget=3D"_blank">felix.piedallu@non.se.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9591): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9591" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9591</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117842532/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117842532/1050810</a><br>
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

--000000000000604ff3064af4307d--

