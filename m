Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D4BE95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 12:06:59 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.59387.1696853216109117057
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 05:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lz1+vSHt;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41807974fc1so28998061cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Oct 2023 05:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696853215; x=1697458015; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSbY3RiMGDsrqJ4txbqqbLCLb/AfDSMlG0kjkikpKzE=;
        b=lz1+vSHtew69SWO8ovW2n6RnnITuHFW/XGZ5lB9SlxhTy9xNe8NQguzM/nrDVXWmpU
         89NeKu1ksh8rsw5DUKcZJNJcmOevIp/D4Y6kyboJntOeixM3o/q2H4r1192QBoUpjePg
         0ckifJ93w1em+ci4L8hZ29gukCQwS8N++/QvsWU0QTgEDK7Pp/E1EiJX70145Hxq8qkh
         DFp7QS/wUCcb4AtIMRWDQKQUHw2SdmPJ/211lz14vX/dUPw2U5Q2XWjHPYnF094ZtPnI
         0n0C1hNZU22oBu63eiuzjmywqRVTqY3UTMeXXWYRnU8DxmwGgFSE8x7MHD+x0/oi24Kl
         oelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853215; x=1697458015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSbY3RiMGDsrqJ4txbqqbLCLb/AfDSMlG0kjkikpKzE=;
        b=BzuQyUr6sYaJQt8jK1V4/r7qr/xUVTxS7UvuA20ujZyvlLkDjl1AMC/O7VK8YvuhIG
         Ngwfkg2BmC4UkKs5t9+W/j85b3j5R2fo2+SZxXa6pdI/E3NOs6U8QzsESk2WATb2UGN4
         niF3woQByHDkdxQoumW2TZ38XWpSQ2aw5gWKEcT9HocuKIJd/3DWX+1bX/2TLgLWpiNj
         ++6QXtBhdZrIuCie6aPamhTCuDx3DnVMrZtbR6AGaXfWnMgZA2M4lMxdjShOKxI6kGLO
         h29cO/Y97cT1EpAJZZ19yVRrh18O0g7L9dUhPUmwOfykkiKVKf2kSz9gIY45VwUBHH/3
         grBA==
X-Gm-Message-State: AOJu0YyMOyOc0O3R4fy5sKrl+np7VbP/Dgk5F8SYvjR+CYNImCCuqVQy
	jb5YHZwMFgEW0PoNEHAZmRs=
X-Google-Smtp-Source: AGHT+IGgwN0v1KaxDdIsmchlzXeCj3eNusjXDB6x9kTPblsitMpcTVbCMX2vdoLewIh2Zs2Iov0Jrg==
X-Received: by 2002:a05:622a:1707:b0:415:2623:d8df with SMTP id h7-20020a05622a170700b004152623d8dfmr19355975qtk.7.1696853215088;
        Mon, 09 Oct 2023 05:06:55 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id m13-20020ac866cd000000b003f6ac526568sm3629128qtp.39.2023.10.09.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:06:54 -0700 (PDT)
Date: Mon, 9 Oct 2023 08:06:53 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick@subset.ch
Cc: meta-virtualization@lists.yoctoproject.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [meta-virtualization][PATCH] catatonit: update to version 0.2.0
Message-ID: <ZSPs3QhJ+7TPatj2@gmail.com>
References: <20231003132435.3846212-1-patrick@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003132435.3846212-1-patrick@subset.ch>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Oct 2023 12:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8342

Would it be possible to get a v2 with the changelog (shortlogs)
between 0.1.7 and 0.2.0 in the commit log ?

Bruce

In message: [meta-virtualization][PATCH] catatonit: update to version 0.2.0
on 03/10/2023 patrick@subset.ch wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Main change is the relicense from GPL-3 to GPL-2, which will allow
> catatonit (and hence podman) to be used in deployments where the license
> previously posed an issue.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  .../catatonit/{catatonit_0.1.7.bb => catatonit_0.2.0.bb}    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-containers/catatonit/{catatonit_0.1.7.bb => catatonit_0.2.0.bb} (69%)
> 
> diff --git a/recipes-containers/catatonit/catatonit_0.1.7.bb b/recipes-containers/catatonit/catatonit_0.2.0.bb
> similarity index 69%
> rename from recipes-containers/catatonit/catatonit_0.1.7.bb
> rename to recipes-containers/catatonit/catatonit_0.2.0.bb
> index da3973de..13537a4a 100644
> --- a/recipes-containers/catatonit/catatonit_0.1.7.bb
> +++ b/recipes-containers/catatonit/catatonit_0.2.0.bb
> @@ -6,11 +6,11 @@ SUMMARY = "A container init that is so simple it's effectively brain-dead."
>  HOMEPAGE = "https://github.com/openSUSE/catatonit"
>  DESCRIPTION = "${SUMMARY}"
>  SECTION = "base"
> -LICENSE = "GPL-3.0-or-later"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/openSUSE/${BPN};protocol=https;branch=main"
> -SRCREV = "d8d72fea155c144ed3bf298a35a1aba5625a5656"
> +SRCREV = "7f0c9bb45d3490c3e7f579833c9b0689f78c8923"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8334): https://lists.yoctoproject.org/g/meta-virtualization/message/8334
> Mute This Topic: https://lists.yoctoproject.org/mt/101733542/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


