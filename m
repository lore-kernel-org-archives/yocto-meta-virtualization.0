Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8BAC10DC3
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 22:19:54 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.83757.1701728392535655534
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Dec 2023 14:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvWFVoi3;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b894f5a7f3so2782846b6e.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 14:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701728391; x=1702333191; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WykNaXinWKsmRsg2ZuvUygCc1xKOa+DLDh1GnAXg30=;
        b=VvWFVoi3Oqbs4qcnaXS4S/QTammaHr7aEYWZvkm9bE53nfXQIthV/EJho0nYUsyIEY
         sBZRZIRJGKdQAZ5pS6fzeBRYrczKNZwzVfMVe/9JuUJEx2GPIIBkcxCwp4J9CnAJlUqK
         eVoBun5aK9Z5cQHbMnGlR1y1feVjVuEzlnMtTMNHOJmw9cWdUBuUJuPpxzfCeRmXdXkT
         0gE2n1/mP1qBBbSkYuZt0aNMgMXKpSkKiqiNgi6SmWfZmgcUZ6FuEjrGPFFd7AaPaIYl
         NZkoZyKMra4yiNM55M4yOiq3CjTFpk2i/ACLkW1n+F43xTghbOnHe4ebauGKI/Q9hjBE
         pTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701728391; x=1702333191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WykNaXinWKsmRsg2ZuvUygCc1xKOa+DLDh1GnAXg30=;
        b=idC6J7R1nz5502vIedDLYHopMAlgi7BUlJWU4WGyYNCR0XbZa3tzS8y0n13mFx8BCO
         Bvxymxk1CtX8wNJELNs7FIHQGLp3KYLABsJGfNsHKVIDC9bL9drpN0CaiZ3Lzj1wUxYm
         ijFbwMigsxAlQXESyXhQafsHtVXdOFSHjV8tadPJMBKmuXZw4UbX1p6HcbvwOZxyoNdJ
         Vyxc9TRx/SExW664lV5TcdCEQDKCTjJfJ7lADcxyOjICINUeQneFwYjoovUlDvuW8Gbg
         clqMmZnIOkxClO/f+OLqsh6wJmagQ2/bM+7Ys6e/S+No+jv/dtAx8ipCZf/3Wp+U9yeG
         LhKQ==
X-Gm-Message-State: AOJu0YxrWCcCk4dIrzqWB/6gFHV9uEoZk8N3qMwmrOfTDOajdQ4lkUo+
	lATwI9jzEGRmGfKcI9PtqVyzy8uNI7s=
X-Google-Smtp-Source: AGHT+IEnszz+oudkyYTO6S7XLi3KDuE1L5Km4QWzcfzl3zJfGdaFL9oTGpRcvJjdU7Chcqf5krxQBQ==
X-Received: by 2002:a05:6808:1892:b0:3b5:6599:ce4c with SMTP id bi18-20020a056808189200b003b56599ce4cmr7189913oib.57.1701728391650;
        Mon, 04 Dec 2023 14:19:51 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id to12-20020a05620a4c8c00b0077dc5e60fa1sm4550809qkn.54.2023.12.04.14.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 14:19:51 -0800 (PST)
Date: Mon, 4 Dec 2023 22:19:49 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: add distrosysconfdir option to
 make sure the lxc configuration in correct folder
Message-ID: <ZW5QhUaOkNq0pXEC@gmail.com>
References: <20231130054524.1125012-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130054524.1125012-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 22:19:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8488

merged.

Bruce

In message: [meta-virtualization][PATCH] lxc: add distrosysconfdir option to make sure the lxc configuration in correct folder
on 30/11/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> After the commit[1] "meson.build: allow explicit distrosysconfdir", the config of lxc would install
> to distrosysconfdir[2], if this value not set, it might set to /etc/sysconfig, that cause lxc-net
> configuration cannot be found[3] due to our bb file install the lxc-net to /etc/default folder.
> 
> Ref:
> [1] https://github.com/lxc/lxc/commit/16ebb29dccb35bf74e8a19e8c45d2513f927476f
> [2] https://github.com/lxc/lxc/blob/main/config/sysconfig/meson.build#L9
> [3] https://github.com/lxc/lxc/blob/main/config/sysconfig/lxc.in#L28
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 94e71087..33ea4ee7 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -60,7 +60,7 @@ PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-Dtests=true', '
>  
>  # No meson equivalent for --with-distro
>  # EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
> -EXTRA_OEMESON += "${PTEST_CONF}"
> +EXTRA_OEMESON += "${PTEST_CONF} -Ddistrosysconfdir=${sysconfdir}/default"
>  # No meson equivalent for these yet
>  # EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8482): https://lists.yoctoproject.org/g/meta-virtualization/message/8482
> Mute This Topic: https://lists.yoctoproject.org/mt/102888929/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


