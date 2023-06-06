Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E33C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:24:30 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.7317.1686054265650999009
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 05:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B+oDQSeI;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-777a4c8e8f4so153322339f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686054265; x=1688646265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKPC628ar2KwVWZ+G448+vto/Ysb9ojdXT7IqhHh5ms=;
        b=B+oDQSeItY5lJSc17lHPN2ztYBROYty2NviDC3IsOXsG0bhI2UIPTesKVAXZBx6tfG
         TbmCA5YIGUsUDIU7d+mNkxNL4Xpc09tvYAWqith3ChsTlww8fri/pSd9vRRIk8fmyth6
         PfG9rHVtOgKzliqJ2HTidouLU6r141QWLejVp03/NtyMZmo4CbdbPloAAy93bGn1JSFz
         7Wj2V3w8bU8kYvirXOimR9beNqW1UkOXeztagWx2yo/WhJ71wR7hNBuzGBZUHq6KlnCe
         itg0xRU/Mjao966q3BfN1OkZk5KuuloeiFIjFHKtSd5E67Yeimu7ONuAVB1VNCCym73v
         YW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054265; x=1688646265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKPC628ar2KwVWZ+G448+vto/Ysb9ojdXT7IqhHh5ms=;
        b=GRCbkiBGdfInbNXkymC7CNJC9r3pQNGjjtCMS7hWGbDR1EW6g/jWEnS+6AuHgMKpPA
         uI14oZIzGKmQVD4DDqnKQDoxRAOh8amr8192uLzBTlVpK6TorHEAgxabs6M4LfMud8XN
         jrSBOBtvQYW/CX0Pqo63ab/+oJ2bw2guaIDbx8K5KayKNP2iIWQZuaLtZ++qxrpsb0f2
         gYf+DUeaUcmIkIF0k+9WuRPwx7w4xCe11+YfxnsGFgXBjVbRCu/0Q3qI/EM+TnGSdTqh
         CVoRN6d5JDop8OPhUEaj01OtKWsSCUjVmPskIn9Zu5VncpoqnCK3FI53fYE5nX+T1vEh
         pCiw==
X-Gm-Message-State: AC+VfDwJH4LKY9Ya29tdFkG2YVTdVxecxFiqDRSLuHpAY+ncNO0GjXin
	iwr3vh4DSXcQqAqLwnOMNZJseaTKUQeeeU0SR0g=
X-Google-Smtp-Source: ACHHUZ4rMugPR1WGiFhizJnPCHeRrk1tq8fPBWdIij9Ja+zLzzDfNIWx/smVWJXLCXr8PUb8puFtph4Yho0h+SPP3GQ=
X-Received: by 2002:a6b:da0f:0:b0:770:1978:7ec2 with SMTP id
 x15-20020a6bda0f000000b0077019787ec2mr4433283iob.5.1686054264685; Tue, 06 Jun
 2023 05:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230606070502.1019140-1-Qi.Chen@windriver.com>
In-Reply-To: <20230606070502.1019140-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Jun 2023 08:24:15 -0400
Message-ID: <CADkTA4Oa1jJiijSkWOdhPowTNmCH5xNS7xs3SePiR0jPPBq+nQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][mickledore][PATCH] runc: bump to 1.1.6
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 12:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8092

master-next has already moved past these versions. I'll be
cherry-picking them into mickledore once I finish testing as they are
bugfix releases.

Bruce

On Tue, Jun 6, 2023 at 3:05=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb         | 4 ++--
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-contain=
ers/runc/runc-docker_git.bb
> index b74ffc3a..cc09cc39 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all =
components
>  #       have been updated to match.
> -SRCREV_runc-docker =3D "17a2d451d635e5eda2e4902324428f1bc65b0364"
> +SRCREV_runc-docker =3D "0f48801a0e21e3f0bc4e74643ead2a502df4818d"
>  SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.1;n=
ame=3Drunc-docker;protocol=3Dhttps \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove=
-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>
> -RUNC_VERSION =3D "1.1.5"
> +RUNC_VERSION =3D "1.1.6"
>
>  CVE_PRODUCT =3D "runc"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes=
-containers/runc/runc-opencontainers_git.bb
> index a5a2f11b..60e029c6 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,10 +1,10 @@
>  include runc.inc
>
> -SRCREV =3D "17a2d451d635e5eda2e4902324428f1bc65b0364"
> +SRCREV =3D "0f48801a0e21e3f0bc4e74643ead2a502df4818d"
>  SRC_URI =3D " \
>      git://github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=
=3Dhttps \
>      file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.pat=
ch \
>      "
> -RUNC_VERSION =3D "1.1.5"
> +RUNC_VERSION =3D "1.1.6"
>
>  CVE_PRODUCT =3D "runc"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8088): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8088
> Mute This Topic: https://lists.yoctoproject.org/mt/99358528/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

