Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0292C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 16:30:40 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.47226.1674491430364918903
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 08:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hNOqojgV;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-15bb8ec196aso14556150fac.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UPZ03+D9oN7jPDHnVfaANrIWfa9BZ9/sVrtD0KyaWOQ=;
        b=hNOqojgVdnAUuIius2JTN5x+a8QjBWxFOpbKG+128p14rScN17DGk6mkLBmYi0YV9f
         twFa0GF7IkhXePz8brFX5LucxALJpv4mVbLOpXuRI7WBEATjgXykQEO7WntXw/5ntZLp
         SgKp5+rTAL4gM8VDMBNQjxzPqzyAidnWTd+zoJCltV/jXO/b1cyqSXorl1lm4PRua78h
         6Pw/P9az0NqPaHCYc7vKv5hHi/bB+WaapC2Vq27UU1FqNA+LPU5I9XmpZxF3I7OVu8+T
         I8sjq72u88F2UxJoXNOcrnNo+N2G1epfUrT6Fq/gJ42QQ/wkE/LgYvwaX5dIlYKhpzO1
         BJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPZ03+D9oN7jPDHnVfaANrIWfa9BZ9/sVrtD0KyaWOQ=;
        b=z1jo/Bq3vHbB6hhxkrKyVg1XEFm1nOAMM7kKxdlzR41nYF3gOTBMn3PF6zSuCVwnn1
         oBiRrblrJQNlILI6OjrxsmCa/Q1EsBmHHcPHDu0+Xi+mvletjepg4cPsWV9cUGw7HLpg
         bdAnI9m7zAjSbND1wEBZweLl704LP6d+Tvtc+7Lgq80ZPk3o4xjNoxs8P/uScNLvKKo3
         fAC0vLZNhBQoi3pga33pjjstDH4SsHAk826zd70J2928UhSVrHmxdfMSmYmvmV8ACrtX
         dpArAAYg1OJjiBATq1su5oqWarbMq96UBBX/shqosSgi0RBy3acz6x3uxd/6GhJdlt7I
         Ozog==
X-Gm-Message-State: AFqh2krju9POUqHzmuXXIcOIKVccXA+O8ZbRXOXkXVlsNmyKDd9Fd5mo
	8N+nc8mn2wBRcCd/DEttslRIrr3oU9Mt1v4rw8U=
X-Google-Smtp-Source: AMrXdXuxsh3Nc57PN6zLXcCEfS6KiJBZZalJMnY1UqLuWgbRhF5Iy2AfP4LLgQw/FuyKDM22i16ub+Rz8gyVbREjxj0=
X-Received: by 2002:a05:6870:ebc3:b0:144:e1eb:419 with SMTP id
 cr3-20020a056870ebc300b00144e1eb0419mr1938656oab.262.1674491429346; Mon, 23
 Jan 2023 08:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20230123154454.1514564-1-jdmason@kudzu.us>
In-Reply-To: <20230123154454.1514564-1-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2023 08:30:18 -0800
Message-ID: <CAMKF1srz31kw5nEaPWSvH6RtdS6A2a9miDurDBszYFSemM=Tzw@mail.gmail.com>
Subject: Re: [PATCH] xen: force usage of gcc
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d361b305f2f0eaad"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 16:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7830

--000000000000d361b305f2f0eaad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 7:44 AM Jon Mason <jdmason@kudzu.us> wrote:

> xen-tools and xen (and possibly others) fail to compile with clang, with
> the following error:
>  configure: error: in
> `/builder/meta-arm/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/x=
en-tools/4.17+stableAUTOINC+11560248ff-r0/git/tools':
>  configure: error: C compiler cannot create executables
>  See `config.log' for more details
>  configure: error: ./configure failed for tools



And what=E2=80=99s does config.log say ?
Can you post this file somewhere


>
> Force all of xen to use gcc until this issue can be resolved.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  recipes-extended/xen/xen.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 5937763a7ddf..dcd281b5a21b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -2,6 +2,8 @@ HOMEPAGE =3D "http://xen.org"
>  LICENSE =3D "GPL-2.0-only"
>  SECTION =3D "console/tools"
>
> +TOOLCHAIN =3D "gcc"
> +
>  inherit autotools-brokensep pkgconfig
>
>  require xen-arch.inc
> --
> 2.30.2
>
>

--000000000000d361b305f2f0eaad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jan 23, 2023 at 7:44 AM Jon Mason &lt;<a href=3D"ma=
ilto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">xen-tools and xen (and possibly others) fail to compile=
 with clang, with the following error:<br>
=C2=A0configure: error: in `/builder/meta-arm/build/tmp/work/cortexa15t2hf-=
neon-poky-linux-gnueabi/xen-tools/4.17+stableAUTOINC+11560248ff-r0/git/tool=
s&#39;:<br>
=C2=A0configure: error: C compiler cannot create executables<br>
=C2=A0See `config.log&#39; for more details<br>
=C2=A0configure: error: ./configure failed for tools</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">And what=
=E2=80=99s does config.log say ?=C2=A0</div><div dir=3D"auto">Can you post =
this file somewhere=C2=A0</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
<br>
Force all of xen to use gcc until this issue can be resolved.<br>
<br>
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us" target=3D"=
_blank">jdmason@kudzu.us</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 5937763a7ddf..dcd281b5a21b 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -2,6 +2,8 @@ HOMEPAGE =3D &quot;<a href=3D"http://xen.org" rel=3D"norefe=
rrer" target=3D"_blank">http://xen.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0SECTION =3D &quot;console/tools&quot;<br>
<br>
+TOOLCHAIN =3D &quot;gcc&quot;<br>
+<br>
=C2=A0inherit autotools-brokensep pkgconfig<br>
<br>
=C2=A0require xen-arch.inc<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000d361b305f2f0eaad--

