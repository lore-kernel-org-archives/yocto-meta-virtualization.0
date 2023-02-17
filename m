Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6D7C6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 13:48:14 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.6613.1676641688240904135
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 05:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aJPoElbA;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id f26so513641ion.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pbk6yRswEwbkVXsTOyCgEZk8BHvET4J/4e0Fag9uWCg=;
        b=aJPoElbAD/y2SIsGg1ba980bw08uNNgNHduxQR2JO6KyKgGLoFl+wQisrhaGNHunVb
         ef8Gpw/SN4E0SNmU19xg2O711aPOLDJL9EGovbeapawA0fBz64NMgR+nKtR0CHwtwyI4
         eMMm0nzcXLCcWNmNPMhdU08+MHFjB+gIlRxDEg9v+RZFCOMVWc9K4DvKP0lQ+sTDsEUR
         5JHnSblc2hJyLUwkbA3h2IwdsGI3pFmXhEfTgBt3LpWmxYI/+7DJJKA5gdzhvIiFX/r3
         nnyfePyqquuvoZa8IL8LTdTBhgDlUVHPrGFyVDTJwp17/Bj5Z5tcd+zx1lTDrAF6XKto
         zDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbk6yRswEwbkVXsTOyCgEZk8BHvET4J/4e0Fag9uWCg=;
        b=aUPc+UdqoR8OZIq+IwYPrgHm0ifPGjdGOWHwG2ZN5UCHIVjUxJsYhj29zZ3BWWlwN5
         DZKbZN792uutqaYXyh9/NeASiiux5ipuCJ0X8P6nLt3yfRdwooVXwNUBZZj9v9Fo6Ql2
         2esGtCTJK+UWS+vUCTSJQv4/elwS15WZUCmfLXYD+AlGD4Hywt7tsYU8divCgpv+L4EH
         z47Gw7usxTIYyxf7Y6aD1pEVZqUqSt4jKIPGVHjBsLC8hL+mhvcAx+xQBxYgs5Ol5Ysl
         ZDyvZehs+yAfdF4Kh7LtYTGWPxMV5wt9MUdimntTCsuRxbQieTi3r4ywomc0kYHK+jwg
         2Lmg==
X-Gm-Message-State: AO0yUKXhrM/njFonnGdvsrOZ95dEvoGVp/3+XNB8hd6gTQzlCUc46maS
	XQoxDvEzPwzVujvkNzkZOxAWej0lU53wpQNk1es=
X-Google-Smtp-Source: AK7set+St+NGm6er/kvA2TjChLY9jRDLpTRXcY7k0gGO2kiizXan9dZxNSvTYjFzBHdQWJrZxJfgbISQ+yZGcxBILu8=
X-Received: by 2002:a5d:8254:0:b0:71c:1bd4:b768 with SMTP id
 n20-20020a5d8254000000b0071c1bd4b768mr2890751ioo.84.1676641687324; Fri, 17
 Feb 2023 05:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20230217053224.3870-1-Qi.Chen@windriver.com> <20230217053224.3870-2-Qi.Chen@windriver.com>
In-Reply-To: <20230217053224.3870-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 08:47:56 -0500
Message-ID: <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 13:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7866

This still needs to be enabled by default in the packageconfig, unless you can
show that the existing builds were not detecting libselinux and using it.

Bruce

On Fri, Feb 17, 2023 at 12:32 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> For cri-o, libselinux is optional, this can be seen from
> its Makefile. So let's make selinux optional by using PACKAGECONFIG.
> In this way, meta-selinux dependency could be removed.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 66d1116..7af698f 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -39,14 +39,14 @@ DEPENDS = " \
>      ostree \
>      libdevmapper \
>      libseccomp \
> -    libselinux \
>      "
>  RDEPENDS:${PN} = " \
>      cni \
>      libdevmapper \
>      "
>
> -SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[selinux] = ",,libselinux"
>
>  PACKAGES =+ "${PN}-config"
>
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7861): https://lists.yoctoproject.org/g/meta-virtualization/message/7861
> Mute This Topic: https://lists.yoctoproject.org/mt/97023221/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

