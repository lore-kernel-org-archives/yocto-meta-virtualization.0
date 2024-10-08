Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1B0CEF163
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 12:34:31 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.8003.1728390870599834475
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 05:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9V8BA0z;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6dfff346a83so45966467b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Oct 2024 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728390870; x=1728995670; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3P+vFIq4ZXs9qeN7MKloBFqrgXXwK6aGpvVkfupzOE4=;
        b=g9V8BA0zSrPIMcGkX5Cm1Fp06XqqOtwFGVjG4uMAGgrWoJ7tzgZhAbYOzYgoeCFq6q
         cdDtxo99M4APZYR92qDQKz3yE/mnB/8YQKKbboAvN5JImufY/rz7PW4SiC7pdKx84cZ0
         Qa4I3SepBByvJcoIsr/UgHKsFlzeNe+FtbyPxP1KbBZ/REtydKCJqlgluWHqe1xtZUBc
         uYVHDCoHarxFbwWuXnm9iHGHjqCN3R4D0T/JSg91BBS+q7sBLyfEE4bBDyyTlfHip6ak
         ocD/vH4wDwEOnYTLHO2yrURfboyKQV73IJEPjAQfdoN+p/C7Z16XVE43JbpxC3QfW0V8
         fm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728390870; x=1728995670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P+vFIq4ZXs9qeN7MKloBFqrgXXwK6aGpvVkfupzOE4=;
        b=OCVIe62G+s8erXH2lW1Pme/vpyrtIzpndnwK9xGJrMv4fBriTaXlWzxvlM3Kldars3
         zrhvxht8cqk2uxyzzqX75jwi+5jLPxKpB6fbtzlOyHesoGwkDM5mc0q1KD+XFpiLJewR
         4lZtAqvnWi771qIaDFN4HnYgCSchV1RlLgXESqUHgXbH9ZrF8TnDEWv1/T+Y4AMgLCPq
         LxvOWufNza+cw4ocX497neNTDw5ocy2pFWQ1F1JH1ZxgG0g896bDsEiEuRW7PCUafgj9
         4ipHveEqELB0nbYrBjgqcnSFUwsj3nK9lR66xbwFqlWJ3WL1B5q+0sVH1ApoA6nPbYCF
         2JrQ==
X-Gm-Message-State: AOJu0Ywx8/4Ok1AfNMBZgoluvCuN4LAbgrCP4DQYx0iPXrdVrh4oLCZ9
	RZ+fTSbrLtJ0GkrLuk+YHk70xRUJ4afHeQMAmd6b3vm3ncS/PE/bNEbExk72LYFGSKoz7a66Cqg
	SnjNhVVDaz+6tjIBFO86GCGw0fOM=
X-Google-Smtp-Source: AGHT+IHbaS3PHKXPW+E8RbhAk4pwinO2Q7l6f4lvh11+W5EEuewBzUC7JYHuMozTE38esRmqD4c8yJ9nhApGgryRWPU=
X-Received: by 2002:a05:690c:62c2:b0:6dd:bcce:7cd7 with SMTP id
 00721157ae682-6e2c72a07bemr138731067b3.42.1728390869706; Tue, 08 Oct 2024
 05:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <1728378181-22499-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1728378181-22499-1-git-send-email-wangmy@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Oct 2024 08:34:17 -0400
Message-ID: <CADkTA4PqXtC=74xA7iR97__g-sZjsk0_iHqHSFr0L87A49qp9w@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf:
 use styhead to LAYERSERIES_COMPAT
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Oct 2024 12:34:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8918

I already have this change locally ..

But it can't be pushed, since the layer isn't actually compatible with syth=
ead.

Bruce

On Tue, Oct 8, 2024 at 5:03=E2=80=AFAM wangmy via lists.yoctoproject.org
<wangmy=3Dfujitsu.com@lists.yoctoproject.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> conf: mark layer compatible with styhead
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-openstack/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.c=
onf
> index b035adf7..6774aec6 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "openstack-layer"
>  BBFILE_PATTERN_openstack-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-layer =3D "5"
> -LAYERSERIES_COMPAT_openstack-layer =3D "scarthgap"
> +LAYERSERIES_COMPAT_openstack-layer =3D "styhead"
>  BB_DANGLINGAPPENDS_WARNONLY ?=3D "true"
>
>  LAYERDEPENDS_openstack-layer =3D " \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8917): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8917
> Mute This Topic: https://lists.yoctoproject.org/mt/108885730/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

