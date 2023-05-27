Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32D3C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 20:31:32 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.17387.1685219485253605934
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 13:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DKL/v4qS;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51492fdae85so882679a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685219483; x=1687811483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xW+DZ11SUIhemKEsp8vtgJeXxLjbpheQsPHZrJd3x+0=;
        b=DKL/v4qSOL9Y3EkOgtqT1rQHuq6vGWzzoJJjIImr+YTuxfGz+LzPl7GjS4+Xi4dzsh
         q/tv6EejwIwR09Ng97YxzHISOv+sTJT6v7UI1bQfmPuqQGQoiAI5AZSZSB8Q1KSXNzK9
         MITxNbUjDnUt+T2ZqYEacPuySxtHURzvjd7YEOV9XBjLxpf0kgyXGYvhuA1Nr/96UYEK
         CUWCwv1eegrukNQkjPxq5Zq5Djt4lhEUsU6WNbusRUGKBWzZdtEx1tvfbQnA/CqsmGqB
         ennxadYBhS/Mf20iUI5BkLzI99T5KntglTPRV4kByRBaym9YDFwncbqkfculXwOtmzxM
         b5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685219483; x=1687811483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW+DZ11SUIhemKEsp8vtgJeXxLjbpheQsPHZrJd3x+0=;
        b=F7Z5y+RK+G3sJw+ktb30RmM5/LtCyiEuic85KqGzrsFWtc1SrGIk6ATAkPONgFsUuF
         5GApZXCAUkdnCVGLKtHAELCWTkC2eNWZfS0cJTeMRb7btaFB2IfryWD10up34Da/NDTH
         4qeHGEEfcEnRhrGz3+lVuopwEiLdPusBuxZyKzyBdgzIhIjCrKTz8zDIvOgC+uHQPTkK
         jECZZVSq1M7BBGRhLeG0oY9BLQUWa5hBMmkmdToqTblqPydaB9iKCAOINKYMvgpcxSFK
         gxQCp60PG29HkyBA50hgCwFiRUAygfaA+VcvSEZ/YHM7WeJF57IcAcoWnbJizFriVTE0
         5jTw==
X-Gm-Message-State: AC+VfDxaCSSEmeu1dP/sX6KY7fIGsJpQAT+WgA/NkW2wYD1R5YJ3NDNv
	85z6ESSY64oTV8E/zWoWeQEwjk+RmoUhS/xKgEg=
X-Google-Smtp-Source: ACHHUZ4ZcTTTihQklCA2yrr7OtTLRt7KNj1unvRaS4Fza1O6nAc613+nnyD2S8rlWvdLZAUzQBg/KqpGue0BD4AEPHE=
X-Received: by 2002:aa7:dd45:0:b0:514:92d8:54b3 with SMTP id
 o5-20020aa7dd45000000b0051492d854b3mr1442745edw.12.1685219483231; Sat, 27 May
 2023 13:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230526173636.3039823-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230526173636.3039823-1-Martin.Jansa@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sat, 27 May 2023 13:31:11 -0700
Message-ID: <CACMJ4Gbp4wJ26+kwN87i+UOpM0pKx4dJdQm3wXpq55Fiiypvfw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] rpi: linux-yocto: drop 5.15 bbappend
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000aaa8f505fcb2bc14"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 20:31:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8079

--000000000000aaa8f505fcb2bc14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 10:36=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.c=
om>
wrote:

> * 5.15 recipe was dropped from oe-core in:
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3De30b37776d16cfd4ce7f79746427ccd95b306059


This removal is ok along with an update to the 6.1 kernel to replace it, so
I've just posted a corresponding patch to add that.

thanks

Christopher



>
> ---
>  .../recipes-kernel/linux/linux-yocto_5.15.bbappend          | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
>
> diff --git
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappe=
nd
> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappe=
nd
> deleted file mode 100644
> index 572f7ec..0000000
> ---
> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappe=
nd
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# Enable use of the linux-yocto 5.15 kernel for the Raspberry Pi 4
> -KBRANCH:raspberrypi4-64 ?=3D "v5.15/standard/bcm-2xxx-rpi"
> -KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
> -
> -require linux-yocto_xen-rpi.inc
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8076):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8076
> Mute This Topic: https://lists.yoctoproject.org/mt/99154515/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aaa8f505fcb2bc14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, May 26, 2023 at 10:36=E2=80=AFAM =
Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">* 5.15 recipe was dropped from oe-core in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=
=3Dmaster-next&amp;id=3De30b37776d16cfd4ce7f79746427ccd95b306059" rel=3D"no=
referrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/=
commit/?h=3Dmaster-next&amp;id=3De30b37776d16cfd4ce7f79746427ccd95b306059</=
a></blockquote><div><br></div><div>This removal is ok along with an update =
to the 6.1 kernel to replace it, so I&#39;ve just posted a corresponding pa=
tch to add that.</div><div><br></div><div>thanks</div><div><br></div><div>C=
hristopher</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
---<br>
=C2=A0.../recipes-kernel/linux/linux-yocto_5.15.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 6 ------<br>
=C2=A01 file changed, 6 deletions(-)<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/li=
nux-yocto_5.15.bbappend<br>
<br>
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.=
15.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5=
.15.bbappend<br>
deleted file mode 100644<br>
index 572f7ec..0000000<br>
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbap=
pend<br>
+++ /dev/null<br>
@@ -1,6 +0,0 @@<br>
-# Enable use of the linux-yocto 5.15 kernel for the Raspberry Pi 4<br>
-KBRANCH:raspberrypi4-64 ?=3D &quot;v5.15/standard/bcm-2xxx-rpi&quot;<br>
-KMACHINE:raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
-COMPATIBLE_MACHINE:raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<br>
-<br>
-require linux-yocto_xen-rpi.inc<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8076): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8076" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8076</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99154515/3619=
037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99154515/3619037</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark@gm=
ail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000aaa8f505fcb2bc14--

