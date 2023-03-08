Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9284FC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 22:09:09 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.6878.1678313347964323049
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 14:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EXLLr3t6;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d7so19803004qtr.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678313347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9WqMqdJbX0QPIvr56mfmlqzTTn1SZy8hhOjL94j7nc=;
        b=EXLLr3t60fSSPUrGLGL3PskVzXT7BhXo/pgAUO0nvs9JY1iXyCmGgM/FQWCt2+x+hO
         xKlfNKgYb4nORYXVuxiipR8TwYDOa6F2dDXuZ7XhfZJfvqiZOId1eyBIb+PvmXxcfjcp
         fBSe5I0DPgnbCEn5JtgkXvbAF/fZI9A9M+IFCCNhnKRzm2Ui7IjAqZlskYNYMeKLt9Ft
         IpiZa4jP3QSPfLply3IlyszuEK1AJAHCcMAa2qkD/hcm2NgZSBDGK3Si/YflzwdW+u7u
         6CuDMebVC+CqnYevavLRV1eCH+lG66q9XjvcRYhxRwZaWxr5xip0nEm8TU+9YyPpe6Ki
         85SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678313347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9WqMqdJbX0QPIvr56mfmlqzTTn1SZy8hhOjL94j7nc=;
        b=3ZuaM57oq/8nYPhBgCJi180tFcNpuk+uTXPe4XqnceYUX9QkZk/JS/Xor0RnWocP3T
         lIRb5h2J4blLxKRIJqq5DTMO24MN8aaHDTSW3c8rCpdRLlFpEnKOqH1xqbcB6C0O5uqM
         MWDnKnZMTkJjkn6QVNDeQf9gCMr6G+VZdbuqIITkMHFIspKS249pQ9Z+a2p6fV5Tscws
         mC3OCCo40JJ3wrha5HxOKCGjhG6Ivc9co+qIrELUn9ZGhKCcb0AbCN805accvcTqMuPe
         RsT3PvpqbSf3S8L1Y0K8S83aoqZdWRClHkDR/dO1uwMmFrSZkFZ5nYDC8O/v9r4jwd9s
         6VLQ==
X-Gm-Message-State: AO0yUKURPfLnE8LgKDZRYq/1aUhx4Af+XsVd2b/GmU5I35QnUw9IT8xG
	D4TNFdQqYolWhD24BRzGkH8=
X-Google-Smtp-Source: AK7set8jwz+Ao5i/rWBbwG9ZQSOp/kzv20hd+vq8fS2BorVDeCtlPyeIbv6fXv5REX7LVO+VM3VLoA==
X-Received: by 2002:ac8:7f01:0:b0:3b9:bc8c:c202 with SMTP id f1-20020ac87f01000000b003b9bc8cc202mr38147074qtk.13.1678313346981;
        Wed, 08 Mar 2023 14:09:06 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z24-20020ac87cb8000000b003bfa8e1b7d1sm12131900qtv.32.2023.03.08.14.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:09:06 -0800 (PST)
Date: Wed, 8 Mar 2023 17:09:04 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: skip lxc-test-apparmor-mount
 and lxc-test-get_item in ptest
Message-ID: <ZAkHgMzlCWp1pRny@gmail.com>
References: <20230301061237.380129-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301061237.380129-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 22:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7937

merged.

I'm still holding the template patch while we investigate the bash/busybox differences a bit more.

Bruce

In message: [meta-virtualization][PATCH] lxc: skip lxc-test-apparmor-mount and lxc-test-get_item in ptest
on 01/03/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> lxc-test-apparmor-mount and lxc-test-get_item related to apparmor,
> since the lxc-test-apparmor has been already skipped, so also skip
> those two cases.
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-containers/lxc/files/run-ptest | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
> index 3f3a75f..2e5af3c 100644
> --- a/recipes-containers/lxc/files/run-ptest
> +++ b/recipes-containers/lxc/files/run-ptest
> @@ -9,6 +9,9 @@ dmesg -n 1
>  blacklist=""
>  # Not applicable
>  blacklist="$blacklist lxc-test-apparmor"
> +blacklist="$blacklist lxc-test-apparmor-mount"
> +#lxc-test-get_item would report Built without AppArmor support error
> +blacklist="$blacklist lxc-test-get_item"
>  # These currently hang so skip them until someone fixes them up
>  blacklist="$blacklist lxc-test-shutdowntest"
>  blacklist="$blacklist lxc-test-state-server"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7910): https://lists.yoctoproject.org/g/meta-virtualization/message/7910
> Mute This Topic: https://lists.yoctoproject.org/mt/97309060/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


