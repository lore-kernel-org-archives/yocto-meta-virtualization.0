Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B03C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 13:02:07 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.67546.1722517323995339157
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 06:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hfg05cnd;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7515437ff16so5281732a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722517323; x=1723122123; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyCuHJPJXsyVje4IiDk7uhY5rGEO47VD/lCvwZLeGr0=;
        b=Hfg05cndf1qaO5Kr8UzfecWkHo9OPEXJ8df92YLYk3438BzlshDMTxtEYwAYV2ZpgL
         7BYqsxjyGqpCuPAMJAlbsbBGXhjx18ypNvDPGS2mowVdrOLPcdfxYGPV96KTwLUM98DZ
         ZMfhZcRreMbYeDu7J+YWmhXd/+q529Qi+F7lxt8lBGJaBqDS9jns1dbEZIYUZeMySZ3k
         cACMtNx/m/MlKs/+3w5eoldpA+nzQs4rnUyOam/rqXyggMkHOfDXB86bWEEAFn1M26CI
         8LEtGB3CwOk1LWBCAWqcDQmiHZWJhQVEn0ssD4zQwOK/ft8MD6jjMpdvWC4UDiG2vhmd
         TJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517323; x=1723122123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyCuHJPJXsyVje4IiDk7uhY5rGEO47VD/lCvwZLeGr0=;
        b=hb7npdERUY53ZPOOJmNo89w0p/W+qGeW8kMlG9eICFqhf15F0IzSTBOJUMdqGWNEvn
         Q8mF9oiUAayXQ4oO/KgyDUj0A0hOKzavvhluNVJBxIPWeJ3dtITvxY6lROAFc8tOohFC
         MDZnOAefw7SxrfWj5GeuiP0MknE+TcsR2+Lp6T3cZuMM7KaTOc5B8tKD2du5ESx95+Yo
         Pw8UdYdCilStiM7Kt27/fNgvSz8ro0XJbuclN9KHPE5SyOsEeb7YTEiHWNfndrlDLL+e
         4LaI1j58SNPC3A+0BjOD9xbXKBehuWwwZD+DsDKDDbric9Remk/0/QMJ9c4dtMhjbM16
         aYNg==
X-Gm-Message-State: AOJu0YywXzGzl1HnmtepRh+Yh3lhNCn0CCpRb9zE/liUy9+g+QBe4KBs
	+gBMUjx21DRwXpPMYd39N9E50ezLJ2Yh09p1VjnfIiKmc4Sec+gnV7xSZlSxTxirYQhGklF2gP0
	NeTN14r7/VuYKfI/9UNqccqFDAUA=
X-Google-Smtp-Source: AGHT+IHwRyXJSe+tK9BUQEBWpKJc+fhHILbSqRzKuWMYdxJcTn10etjSjFD5bJoq8dHvC1EJ6Y91ZZK4JMZRjx6s6M8=
X-Received: by 2002:a17:90a:fe88:b0:2c9:7fba:d88b with SMTP id
 98e67ed59e1d1-2cff9419943mr106499a91.14.1722517318121; Thu, 01 Aug 2024
 06:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240801070827.2759041-1-Qi.Chen@windriver.com>
In-Reply-To: <20240801070827.2759041-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Aug 2024 09:01:46 -0400
Message-ID: <CADkTA4OageXrb1stzSYaH7Zr-K=iaZCWdGeY_PJLTifxsg+OjQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][scarthgap][PATCH] kubernetes: fix
 runtime init error caused by git shallow tarball
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 13:02:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8851

On Thu, Aug 1, 2024 at 3:08=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> k8s uses 'git describe' to determine its version and passes it to
> go ldflags at build time. This value is actually very important,
> because 'kubeadm init' will use it.
>
> In case of shallow tarball, the git history is not complete and
> the command 'git describe' not succeed, resulting in a default
> version, v0.0.0-master+$Format:%H$. This causes 'kubeadm init'
> failure like below:
>
>   [init] Using Kubernetes version: v1.0.0-placeholder-version
>   [preflight] Running pre-flight checks
>   error execution phase preflight: [preflight] Some fatal errors occurred=
:
>     [ERROR KubeletVersion]: couldn't get kubelet version: Unable to parse
>     output from Kubelet: "Kubernetes v0.0.0-master+$Format:%H$"
>
> Fix this by exporting KUBE_GIT_VERSION explicitly. This export
> line is deliberately put right under the PV & SRCREV settings
> so that when people upgrade k8s, they don't forget to update
> this value too.

This is something that either needs to be carried in your layers .. or ..

If it is to merge to meta-virt, it should just use our existing PV and
SRCREV values
and be conditional on shallow clones being enabled, since it is working
around a limitation of those that choose to use shallow clones.

Cheers,

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-co=
ntainers/kubernetes/kubernetes_git.bb
> index a742486c..a6fcff90 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -10,6 +10,11 @@ CVE_VERSION =3D "1.29.1"
>  SRCREV_kubernetes =3D "a02da633101bd7919153dd56412b09221c0139bf"
>  SRCREV_kubernetes-release =3D "21382abdbfa8e6a43fd417306fa649cb651cc06e"
>  PE =3D "1"
> +# NOTE: update the following value when upgrading k8s
> +# The value is derived from the following command in k8s repo:
> +#   git describe --tags --match=3D'v*' --abbrev=3D14 "a02da633101bd79191=
53dd56412b09221c0139bf^{commit}"
> +# This following setting is needed in case, otherwise there'll be runtim=
e error in case of shallow tarball.
> +export KUBE_GIT_VERSION=3D"v1.29.1-1-ga02da633101bd7"
>
>  BBCLASSEXTEND =3D "devupstream:target"
>  LIC_FILES_CHKSUM:class-devupstream =3D "file://LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8850): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8850
> Mute This Topic: https://lists.yoctoproject.org/mt/107661203/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

