Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B26CC61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 06:36:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.65386.1673246164751751622
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jan 2023 22:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dfwf63gm;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u19so17528035ejm.8
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jan 2023 22:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87pStYFZxHLy1+GSlIPD8VY0Efgp2ZmLKmlBJFIzqvY=;
        b=dfwf63gm1hbbLzKQVXUdkaULxOxJ+YLk8+cWAcBV5cGqLlVTv7XabbNssJzUFmHxOd
         nU/xgcXJGoMbs7l3I24G/m8DG80DN5Hp08vU4tSLCu0T+j4L20O6dRBRsxsgTJW8XidM
         +h0sMZHwsbNyoWqDnu1uVMEeKDKCrRl3kiwn/abbT4VB5ACogwarRAbcRQxlcFiN9YGp
         sJhm/I7dpdUCJbckW1Ecs9kp0fxHIILJvGigeJ7zIrPquK9rORTluzL2tPxesCCbVSTp
         P7qsMUZhHZqZOgQnfiWqjZjYnO/z51Tthf/Y/2WAQJ0B5vQyVPdKuhx/6tT+IV+fA9Gl
         YBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87pStYFZxHLy1+GSlIPD8VY0Efgp2ZmLKmlBJFIzqvY=;
        b=kZ15IfvkdQdtRxDbEGxTWGb8R5dM1nX0vNilc1KAfVml1k/VuNDAJ5N8VlEjQm/NnW
         J6OMGhEltTc7IouGBToUv84o7u+94vz/BzGTxx7xyJea20h+2hj2hMmTGtrJ2c/ZdodJ
         psWtTPEKjA/s3oHhZpqNOQhYWZvY9dw49L018syjYLeODWK4zKu3v98NWg4BeifFxDNk
         GLhKRo8+x1xgdoBnol1KiwAVxGYndPk5tbMDvUzqPclHm4H8lBpC6HADerVmGQo/NRM8
         D4oWQLCK0/Ubi9XUOyIJA5CTuywWiRbZkyeTAGgVKuaYxMa3HYxkuch7ChWmAlqlbtK+
         xzxA==
X-Gm-Message-State: AFqh2kqtc6Dxdhb41sHLMMtx8YkNxAtQU/8R/0qHcfZNBlZ8lYtPvYSI
	trUU5L7Ma6QbLFxtFNKI+Cr4rZrItsIx5jdT8GQ=
X-Google-Smtp-Source: AMrXdXuKUwCq8S10rjovbYi+zagKlKMsrsNS29PbnsoaTcYND8Eyi5T6EPan8Wg8ZaJHhUCilZvCSDr/l4WU+MkxbRU=
X-Received: by 2002:a17:906:910:b0:7c1:136d:b841 with SMTP id
 i16-20020a170906091000b007c1136db841mr4383880ejd.216.1673246163299; Sun, 08
 Jan 2023 22:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20230106144630.23637-1-michal.orzel@amd.com> <20230106144630.23637-4-michal.orzel@amd.com>
In-Reply-To: <20230106144630.23637-4-michal.orzel@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Jan 2023 22:35:51 -0800
Message-ID: <CACMJ4GYgr2-UGp29Lc2QPQ+0bBEEjEM7ieebTWgnM1+KO7PiQQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] xen: Bump default version to 4.17 stable
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, bertrand.marquis@arm.com, 
	stefano.stabellini@amd.com, stewart.hildebrand@amd.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000002f737e05f1cefbab"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jan 2023 06:36:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7805

--0000000000002f737e05f1cefbab
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 6:46 AM Michal Orzel <michal.orzel@amd.com> wrote:

> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

thanks
Christopher



> ---
> Changes in v2:
>  - none
> ---
>  conf/distro/include/meta-virt-default-versions.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/include/meta-virt-default-versions.inc
> b/conf/distro/include/meta-virt-default-versions.inc
> index b2ce0210c05c..388eca90bed4 100644
> --- a/conf/distro/include/meta-virt-default-versions.inc
> +++ b/conf/distro/include/meta-virt-default-versions.inc
> @@ -1,4 +1,4 @@
>  # Meta-virtuailization PREFERED_VERSION
>
> -PREFERRED_VERSION_xen ?= "4.16+stable%"
> -PREFERRED_VERSION_xen-tools ?= "4.16+stable%"
> +PREFERRED_VERSION_xen ?= "4.17+stable%"
> +PREFERRED_VERSION_xen-tools ?= "4.17+stable%"
> --
> 2.25.1
>
>

--0000000000002f737e05f1cefbab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 6, 2023 at 6:46 AM Michal=
 Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt;<br></blockquote><div><br></div><di=
v>Reviewed-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@=
gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><div><br></div><div>t=
hanks</div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
---<br>
Changes in v2:<br>
=C2=A0- none<br>
---<br>
=C2=A0conf/distro/include/meta-virt-default-versions.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/dist=
ro/include/meta-virt-default-versions.inc<br>
index b2ce0210c05c..388eca90bed4 100644<br>
--- a/conf/distro/include/meta-virt-default-versions.inc<br>
+++ b/conf/distro/include/meta-virt-default-versions.inc<br>
@@ -1,4 +1,4 @@<br>
=C2=A0# Meta-virtuailization PREFERED_VERSION<br>
<br>
-PREFERRED_VERSION_xen ?=3D &quot;4.16+stable%&quot;<br>
-PREFERRED_VERSION_xen-tools ?=3D &quot;4.16+stable%&quot;<br>
+PREFERRED_VERSION_xen ?=3D &quot;4.17+stable%&quot;<br>
+PREFERRED_VERSION_xen-tools ?=3D &quot;4.17+stable%&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000002f737e05f1cefbab--

