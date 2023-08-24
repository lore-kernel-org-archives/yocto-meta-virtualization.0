Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AF5C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 02:28:22 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.2352.1692844093879073342
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Aug 2023 19:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=do5dz8hr;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-34961362f67so1268405ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Aug 2023 19:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692844093; x=1693448893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1lvtINwdyufyXBmk4UnwE9k12j7KfQ4tEr9PMRjMSQ=;
        b=do5dz8hrqyW4BQsBswzHj5qCeFC09HhdfSV6C5QouF+eJFUoWfVE6k8bYvRtghZqRP
         hcPU2Jnk6W15zVotNAGUJUgEAnkqlNBiPHmPz3Qonhqwkn/82hY9BX/hq8kYJfi4zjHq
         +lO08yaBKqJnDh4K17Spz7PvNsJjSYbW4+AEh2UN/gsorUZEeExt5XBY6ZuJMwUKvusK
         gq2Pt72lq7H+iODL0q3VCeQyzoPExVMBN3j8DF7ByRcjHAg8FBwjEsiu6BTavskmA7U/
         Jcs0nWvtNYzVUWv9ANzHY/3led/d51mmq2UB5PXoewzECpWTJ/dqkzGkIe6s1rJBq/Yh
         Wkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692844093; x=1693448893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1lvtINwdyufyXBmk4UnwE9k12j7KfQ4tEr9PMRjMSQ=;
        b=HmugaxHUK6CBQBPEdRzWF+cGFYM66fXoXHGQ3x5qGtA5FI1RxpP/g0O0OwuqurXIE/
         4NzVGYAsS+lXcrsegp+kXKOiHfisZchWMFxkRJ+KdkMJ2OzGf6LYduQChRhIgmjKmDd5
         Cr35noDuGvK9jC6Dukj45I0yAFpdgCSN0ldYAUwWMndZraqYkFBU6GWCALOaXf9sctVp
         VWZYccGz3kD/SaLlEcInMLCkTEjqSx1/5gMnbQR0ZIbnfeJuuhP4o/4LTOjEgTOEb6x/
         uth8XXa1cnnMxMvN0yv0HK5zT4sy5p8L+7VC8FzMOt52iLnri5LG43DCSiSzJzN6R1PZ
         B9JA==
X-Gm-Message-State: AOJu0Yy2gmpxCywerGoNQzUnCwFYlfDt3OwSZIVxGS7bVcXZUpeORcaa
	qgyOm3j/AK+9Qx0iIjt9ifPii1kGuKek8U0twzU=
X-Google-Smtp-Source: AGHT+IGN2IB9rlIg8UWcagXHCDZw7n5YPUdr1if2VzBS3YyhgCFqSxXCbTOw0o1RyRtlwpayRNcrVgjJpTjIXw9g6Bg=
X-Received: by 2002:a05:6e02:2188:b0:349:178b:2818 with SMTP id
 j8-20020a056e02218800b00349178b2818mr3983159ila.13.1692844093026; Wed, 23 Aug
 2023 19:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230822215534.475219-1-f_l_k@t-online.de> <20230822215534.475219-2-f_l_k@t-online.de>
In-Reply-To: <20230822215534.475219-2-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2023 22:28:02 -0400
Message-ID: <CADkTA4PbL2QQDJDS6Jwhc0cvUq-thQ1Bt3onDP5tXa7QAZk7_Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: update from fuse2 to fuse3
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 02:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8224

I'm ok with the change, but we need to document why we are making
the switch in the commit log.

Bruce

On Tue, Aug 22, 2023 at 5:55=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended=
/libvirt/libvirt_9.2.0.bb
> index 5e70470..9b5b2de 100644
> --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
> @@ -156,7 +156,7 @@ PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dsel=
inux=3Ddisabled,libselinux,"
>  PACKAGECONFIG[python] =3D ",,python3,"
>  PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl,c=
yrus-sasl"
>  PACKAGECONFIG[numactl] =3D "-Dnumactl=3Denabled,-Dnumactl=3Ddisabled,num=
actl,"
> -PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse,"
> +PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse3,"
>  PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
>  PACKAGECONFIG[libcap-ng] =3D "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libca=
p-ng,"
>  PACKAGECONFIG[wireshark] =3D "-Dwireshark_dissector=3Denabled,-Dwireshar=
k_dissector=3Ddisabled,wireshark libwsutil,"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8220): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8220
> Mute This Topic: https://lists.yoctoproject.org/mt/100903758/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

