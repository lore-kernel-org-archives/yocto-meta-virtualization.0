Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDD0C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 21:39:24 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.96911.1705354754979472558
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 13:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVole1gu;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-429c7ba12a2so28793751cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705354754; x=1705959554; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMnMRgQ0zrRmljdcOKif+fauXL2wyGyj2BSAyE485do=;
        b=kVole1gub1RIDX2sUjz+rj6n83M5aFHMZ1L5xDt3u92COVyJ+VPkh085z0TEHvOCQa
         7or+DS1cq5TTU+aWj7KZUY2ypd0qZuIQmWucKbv3FHUdOKYh6yQgMhKiP7xTFkJ3fiYm
         zSu8UWYvBLgSKfBsZ2gt8pIaG+27HF9DO3dFqzSj5u/YKTMNQv032IOTMmKvh5kGIVvU
         hlvvGLDC+et2hS+Y8qNFZG579s5fk4OHmvnPRmi8NREWgXw+3aHxl7nTd3zeUVUS134X
         LH1dXogWKXsf5UZ5mjrUFeSzCqsdFR9Zz81X5Az60CpEncvtA3Il5L/rIvJuCqIce3Xj
         9NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705354754; x=1705959554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMnMRgQ0zrRmljdcOKif+fauXL2wyGyj2BSAyE485do=;
        b=tNqx2KhVHyb5oYljrlQUG30MjrILxrADwuPHbKr7M9n8nGhT8CtkHRHk6WrRhd61vt
         YyVnFrziyZQURMXIPQK1HZj8D9qNLIkwvwCCk5kF5UMK/aXayXKFpQIlAJp3tLluWgvu
         IFi4m1x2z1ykETwr7qAbcfPVto37J47ksYIvo6fL+jA6wVt1RFVAkde+EhkEJeOpmzoP
         bzCS815ssSRFUm8OK4SOjAZZke4OBRgYJOu/0QcPhtd5GaC15gD+TdxLH/fpzy69LawT
         bDpCQw+HfdvwbMcsyMdl/CXFCOzCSg2IkdOR3ej9s/mCz1bW8nmYubv6HB4YGk4EUqNz
         yeSg==
X-Gm-Message-State: AOJu0YzRVdZEBWGC+FYufIxmLONdF61Blm2TFwLgn9lmPslHC5e4pIQR
	OMAaMlESDj851bABfLRCF1o=
X-Google-Smtp-Source: AGHT+IGtdVRjC8qs/TqsDbk3nnKH8Mr0KTsLVEThiIXh2yETuoH+glk8TbR7Q/R3ho1g3xoGEx0kOg==
X-Received: by 2002:ac8:4e45:0:b0:429:ce08:eadd with SMTP id e5-20020ac84e45000000b00429ce08eaddmr7374493qtw.77.1705354754020;
        Mon, 15 Jan 2024 13:39:14 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e7-20020ac81307000000b00429e6f1cc0csm1734525qtj.80.2024.01.15.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:39:13 -0800 (PST)
Date: Mon, 15 Jan 2024 21:39:12 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 2/2] podman: add test instructions
 for podman system service
Message-ID: <ZaWmAAIcQWQ7xnfG@gmail.com>
References: <20231219092911.14331-1-liu.ming50@gmail.com>
 <20231219092911.14331-3-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219092911.14331-3-liu.ming50@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 21:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8540

I somehow missed merging this, it is now staged on master-next.

Bruce

In message: [meta-virtualization] [PATCH 2/2] podman: add test instructions for podman system service
on 19/12/2023 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/podman/README | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/recipes-containers/podman/README b/recipes-containers/podman/README
> index 4c223a39..213ac256 100644
> --- a/recipes-containers/podman/README
> +++ b/recipes-containers/podman/README
> @@ -18,3 +18,24 @@ Basic configuration:
>  % podman images
>  % podman unshare cat /proc/self/uid_map
>  
> +
> +podman system service
> +---------------
> +
> +The podman system service command creates a listening service that answers API
> +calls for Podman, it supports systemd socket activation.
> +
> +Test with docker-compose (v2):
> +
> +To be noticed, docker could NOT be installed together with podman, so
> +docker-compose should be built as a standalone tool, remove 'docker-plugin'
> +from its PACKAGECONFIG at build time:
> +
> +```
> +PACKAGECONFIG:remove:pn-docker-compose = "docker-plugin"
> +```
> +
> +% sudo systemctl start podman.socket
> +% git clone https://github.com/docker/awesome-compose.git
> +% cd awesome-compose/postgresql-pgadmin; source .env
> +% sudo docker-compose up -d
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8519): https://lists.yoctoproject.org/g/meta-virtualization/message/8519
> Mute This Topic: https://lists.yoctoproject.org/mt/103259877/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


