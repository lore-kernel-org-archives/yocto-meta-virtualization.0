Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AC4C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 15:52:50 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.54055.1684338768752610316
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 May 2023 08:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XhlQCoQY;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-757741ca000so104119885a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684338768; x=1686930768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C6t9Fvx1DYAgkm6WqxgPOXHBNZTWY6xTyyiR1h5ao2I=;
        b=XhlQCoQYJnGksqBecUOUG3D8+jSEUXiuIKejPOTYTY/fXAYTa0kip1TgfpjirA+/JM
         hR5qpSCeH2lJhPkMWBVh0hybs8ZQ8aLTFQj7WoeuW6/UtyrpEu4GYo6S0MLHeMlll0oa
         cJWbCdLzk8g6adVtRpWRwGpHEN4SSawWgCFoeHUitQ/yYj3ybJkb101bhknI4jap9ucf
         j/B6PPE5hXf3DGwsfT+ndB5wcsyDoK7yO4nAEold9U+SnZRkoPdlANCyUywgwgSggOVO
         94KMu8zfegyO4PDdVbUT4DbWhAqI/x7MQR2yh3n707kq8GZ+gnQM8ezJApmhCb2BKHPD
         Bo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684338768; x=1686930768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6t9Fvx1DYAgkm6WqxgPOXHBNZTWY6xTyyiR1h5ao2I=;
        b=K/upffQhGZX/hRv6bBGXwpWdHJQyIltOcBtz0IIptUlJdcgxFH3lNKGBqQZ1hWwcfa
         m2qIKc3MGwPLh/4rmSuL4TT+jhM4h8bTewJj6bpNbj0VQ7mAzmDJYwefdDNBh/MoFgBt
         3M95Q93lIkJJlxDLJneBBV7CcgrZrtubGNahE4TiJMazfAqwsdDW+oujx1O6VoUjfA/K
         UnGCXqhbNDFGcf/MGQfTxfQdvNL/p37oHOXF29TFm+0UHsEJkGjPagDKYrmFVjYzmD8p
         UStQR2FLabgVdjLG1YssWER4H5ri1wnhhGjb2yr9ZkMJ7xIed3EePbGaeby1U1B2m+FS
         JhTw==
X-Gm-Message-State: AC+VfDwBZLKvrjMEB+TUBPeIHhC7qxM0/xXw7KFALIglgAiVD7XXYJP3
	/RxKIwDAb15oBHIe98BUHPx6XUKHj842zw==
X-Google-Smtp-Source: ACHHUZ7fTVRGSq4IucoJq9Y30APJ/Soyq9B+u9n9qXSW4dMAxfE8JM+LFyaFYu7jhZlM891yDM2+Sw==
X-Received: by 2002:a05:6214:e46:b0:5ef:45a7:a3c0 with SMTP id o6-20020a0562140e4600b005ef45a7a3c0mr129481qvc.27.1684338767707;
        Wed, 17 May 2023 08:52:47 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id o5-20020a0ce405000000b0062382196588sm916004qvl.108.2023.05.17.08.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 08:52:47 -0700 (PDT)
Date: Wed, 17 May 2023 11:52:45 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] xtf: Supply DEBUG_PREFIX_MAP to the
 compiler flags
Message-ID: <ZGT4TVLbIjSfuQNh@gmail.com>
References: <20230517033331.3565724-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517033331.3565724-1-christopher.w.clark@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 15:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8063

merged to master and mickledore.

Bruce

In message: [meta-virtualization][PATCH] xtf: Supply DEBUG_PREFIX_MAP to the compiler flags
on 16/05/2023 Christopher Clark wrote:

> Fixes the QA warnings about package contains reference to TMPDIR.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/xen/xtf_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
> index 537abc3..59f1cad 100644
> --- a/recipes-extended/xen/xtf_git.bb
> +++ b/recipes-extended/xen/xtf_git.bb
> @@ -30,7 +30,7 @@ RDEPENDS:${PN} = " \
>      "
>  
>  do_compile() {
> -    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
> +    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" \
>                 CPP="${CPP}" \
>                 LD="${LD}" \
>                 OBJCOPY="${OBJCOPY}" \
> -- 
> 2.25.1
> 

