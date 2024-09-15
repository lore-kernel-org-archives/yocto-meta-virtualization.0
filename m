Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39999C35FE7
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 11:44:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.113058.1726400640797725398
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Sep 2024 04:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OD+0oaZL;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d87196ec9fso1643352a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Sep 2024 04:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726400640; x=1727005440; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d6kZAcwMi/ItIiBtpxYRp+0HOpT8AfeyYhXNvtQG8zk=;
        b=OD+0oaZLtHJI1QIF8VlldMJPg3aoE+OSdU8uzD8thzqjrNUJejJ299AiqM9vuhiILm
         K7xlIiORS6O2UsrOBRBK+leGoS4cyg3anpR3e3Dhi+B3/nWGVOJSP8ficlLI+GRuuiW1
         KBvzcMK/Ar6C+i1q3bdhT7wHQqGjDRrAOchgVBVT6txRX/dqpOLdmAGuMBkQrX3Mdtlp
         EE/hy892H6hX90zYAC//iO1AP9jM1vDVWqbklTO4Ag3bcNB+w+tnecxRq13oQDxyqQui
         e2BhCok4xIQPPFtTk2E3ybBDAvIE87NSKC6eM5FfxOLlL7JYJFs+U05Gdvw0wWkOW8xZ
         +ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726400640; x=1727005440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6kZAcwMi/ItIiBtpxYRp+0HOpT8AfeyYhXNvtQG8zk=;
        b=NydRPWDcEEmJVl5sU6iWXdXNkxwgiFX4QhvSNy/kOtOVH8mg/jstd2I2EHe6/3LWRB
         VTWPvPwa7HUpAKMd2HaZUl2p64n7U3zsgo08z1SuX4qQixvg9Nxkns6v2G9dF9qqG9SO
         mtV8raHjqnU+4yvlVpjmYuI80xn6VO2Z+vlhzHQI/5u9en66WJ9PZNjNSeG332Ck72id
         As09QlxZslrooHcZ1XMQRUHqxmnJjIz5hE72PHpIruH3DbQNoD5vNuYZeRtfXptqQh4S
         fyLaGOQLMpUDIv86poaEt2uLvwMpHwQ3I5/9DtsP6rvFtqz6XzFSTx0b2wor8lvs/SlL
         R4iA==
X-Gm-Message-State: AOJu0Yxw6z2gqhW2RIt2l831hHT83bTHvj45ZsqU0nfgZK8bfV9hVVRB
	ThZeB0sYKCmkZvHMqEHT/sYhS30WNVVhAilXQOOcWMLWRZE7q5UcVudVb+hrurrGOuYfTgtdbCp
	bneOf+Bal1itr2QYHKvT9QYY7nhM=
X-Google-Smtp-Source: AGHT+IFDcuV/NowNr/QtlQAOk37ls/YyRlaRu2WOpyxhujogfUAQGcUbzn7MBIcR7brMO8U1d6obVMVO6UF0wj/1ef4=
X-Received: by 2002:a17:90a:3da1:b0:2d3:d68e:e8d8 with SMTP id
 98e67ed59e1d1-2dbb9f7630fmr8834492a91.40.1726400639935; Sun, 15 Sep 2024
 04:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080816.81614-1-peron.clem@gmail.com>
In-Reply-To: <20240915080816.81614-1-peron.clem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 15 Sep 2024 07:43:48 -0400
Message-ID: <CADkTA4M7x2Fu5vk7oUNXQw-b0g-D_QfeG2SVjN8dkKLZUB0xRA@mail.gmail.com>
Subject: Re: [PATCH] k3s: fix PV not properly bumped
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e2361b062226f803"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Sep 2024 11:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8895

--000000000000e2361b062226f803
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have another round of package updates about to land, so I'll probably not
take this change exactly, but thanks for the patch, I'll look into what
went wrong in my upgrade process.

Bruce

On Sun, Sep 15, 2024 at 4:08=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:

> This has been missed in commit
> 4fbc98c93c5a68bde74b4691da190885022bdbbf
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/
> k3s_git.bb
> index f9443c46..c42e907e 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -19,7 +19,7 @@ SRC_URI[k3s.md5sum] =3D "363d3a08dc0b72ba6e6577964f6e94=
a5"
>  SRCREV_k3s =3D "16321f2554c50281218f3efe999e085b5c6aeefc"
>
>  SRCREV_FORMAT =3D "k3s_fuse"
> -PV =3D "v1.28.7+k3s1+git${SRCREV_k3s}"
> +PV =3D "v1.30.2+k3s2+git${SRCREV_k3s}"
>
>  include src_uri.inc
>
> --
> 2.45.2
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e2361b062226f803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I h=
ave another round of package updates about to land, so I&#39;ll probably no=
t take this change exactly, but thanks for the patch, I&#39;ll look into wh=
at went wrong in my upgrade process.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Sep 15, 2024 at 4:08=E2=80=AFAM Cl=C3=A9ment=
 P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>This has been missed in commit<br>
4fbc98c93c5a68bde74b4691da190885022bdbbf<br>
<br>
Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gma=
il.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferre=
r" target=3D"_blank">k3s_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"no=
referrer" target=3D"_blank">k3s_git.bb</a> b/recipes-containers/k3s/<a href=
=3D"http://k3s_git.bb" rel=3D"noreferrer" target=3D"_blank">k3s_git.bb</a><=
br>
index f9443c46..c42e907e 100644<br>
--- a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferre=
r" target=3D"_blank">k3s_git.bb</a><br>
+++ b/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferre=
r" target=3D"_blank">k3s_git.bb</a><br>
@@ -19,7 +19,7 @@ SRC_URI[k3s.md5sum] =3D &quot;363d3a08dc0b72ba6e6577964f6=
e94a5&quot;<br>
=C2=A0SRCREV_k3s =3D &quot;16321f2554c50281218f3efe999e085b5c6aeefc&quot;<b=
r>
<br>
=C2=A0SRCREV_FORMAT =3D &quot;k3s_fuse&quot;<br>
-PV =3D &quot;v1.28.7+k3s1+git${SRCREV_k3s}&quot;<br>
+PV =3D &quot;v1.30.2+k3s2+git${SRCREV_k3s}&quot;<br>
<br>
=C2=A0include src_uri.inc<br>
<br>
-- <br>
2.45.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000e2361b062226f803--

