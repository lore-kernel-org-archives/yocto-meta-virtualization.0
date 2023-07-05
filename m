Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8592EEB64D9
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 02:45:23 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.8671.1688525117594211446
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Jul 2023 19:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZU+heY9H;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-785ccf19489so299601539f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Jul 2023 19:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688525117; x=1691117117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GNjF4JilwqhWqkFF4TNUkiw9x6BehK4Nox0dzuDcA0=;
        b=ZU+heY9HazI1FUcHXdzKiA7jLagQKuR3X0UV0CRSIRWC+6C77xnMYhDQ/c4oV5114q
         OnG/RD3jZtJDe0cxPAR7/BaKYoilsZPiOsxtdHJvZCU9ndHFChLfBkhqP2QBXmgaX7mz
         U65hh3N/QY9qaGIr8Sm9ApOeIKLfLfGlIf33NgMFtUq5RwFbbY7QKltDwDPL5eRmlZUm
         vFoKy74HSPfcGKtabEQtlTFJ8vpqYa95glFe82P7Emvh2tJh3MbKeb98mRWgFyUm+qZ/
         6AZQyfwJ5WRKZs5ynu5Ki0hg5c2LRgpMN7jRglhRTKEYQjlaOcHeHx7fzdrvQ551sSKT
         wa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688525117; x=1691117117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GNjF4JilwqhWqkFF4TNUkiw9x6BehK4Nox0dzuDcA0=;
        b=YsOeLmm7h8UMDpTuwPdeSijISyUbOS48toiMoJp+wa0O/DY7BqKVYVlL52r/3sZ32V
         lEAvW3cCzz2d2t6My2cCEcJN8SW+Hv/Y77bDgJcxkx+p4F9Uqd8AP2PCf3krrx+tVF4D
         qp4IUmO7+BVYEa49SAkvZLzBqeBT8JQGMms5QXt25G38Uu0ovrmhMxQEn+35UwGwdI6t
         gaRdUV2g6w2E3LcYmLr7PNb++46F8LC52nxA5ouh+81nXfES8uOb0rkKzwFUDDbbC04/
         65KvIuygqGT+TLkW0PKuLFp11fHFXxEV0nmPUYza3lVTk5K2lx30kchLkFa2NosRWQjw
         3Jyg==
X-Gm-Message-State: AC+VfDy7xIZ7V+FTC49egLiFI4wrvIzHFfVBigIKd0uNjts+y/yUYf2V
	KhKDNJHH35WeUzergczhx+jp2tk3TvlN1FSZdhs=
X-Google-Smtp-Source: ACHHUZ6MHGKEeyGYXlvHZf7JXU5+sQ4NU7CYw76T/6d7KSxvP+m3EHeYq/GGvmm1k642V7Nej+eNdbEklovpMAW2amo=
X-Received: by 2002:a05:6602:35d:b0:785:d0d7:3304 with SMTP id
 w29-20020a056602035d00b00785d0d73304mr15452409iou.14.1688525116801; Tue, 04
 Jul 2023 19:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230628032936.3257233-1-Qi.Chen@windriver.com>
In-Reply-To: <20230628032936.3257233-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Jul 2023 22:45:05 -0400
Message-ID: <CADkTA4Mtbt2QGDT8RyrkqivatKFKbJD95y6fuxNzKKAyDCHQ2g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kubernetes: do not strip binaries at build
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Jul 2023 02:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8118

I haven't forgotten about these.

I'm going through an uprev cycle for many of the packages (and the
kernel), so I've been fighting a few issues.

If I can't get the other issues resolved, I will bump the priority on
these and merge them wednesday.

Bruce

On Tue, Jun 27, 2023 at 11:30=E2=80=AFPM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Yocto/OE has its own way to control binary stripping. So don't do
> it in the go build process. Otherwise, we'll get empty dbg packages.
>
> Setting DBG=3D1 solves this problem, as stated in comments in the Makefil=
e.
> """
>   # Note: Specify DBG=3D1 for building unstripped binaries, which allows =
you to use code debugging
>   # tools like delve. When DBG is unspecified, it defaults to "-s -w" whi=
ch strips debug
>   # information.
> """
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-co=
ntainers/kubernetes/kubernetes_git.bb
> index 3a6e711..8b7c9e0 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -87,7 +87,7 @@ do_compile() {
>         export GOBIN=3D""
>
>         # to limit what is built, use 'WHAT', i.e. make WHAT=3Dcmd/kubele=
t
> -       make cross CGO_FLAGS=3D${CGO_FLAGS} GO=3D${GO} KUBE_BUILD_PLATFOR=
MS=3D${GOOS}/${GOARCH} GOLDFLAGS=3D""
> +       make cross CGO_FLAGS=3D${CGO_FLAGS} GO=3D${GO} KUBE_BUILD_PLATFOR=
MS=3D${GOOS}/${GOARCH} GOLDFLAGS=3D"" DBG=3D1
>  }
>
>  do_install() {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8113): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8113
> Mute This Topic: https://lists.yoctoproject.org/mt/99823673/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

