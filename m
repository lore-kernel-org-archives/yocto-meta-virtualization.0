Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A7FC5479A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 20:02:58 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.3668.1692302568217449166
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 13:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Aa2x9yPf;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a6f3ef3155so99427b6e.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692302567; x=1692907367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LIdLEeDoRxW6hRD2hjFiaBX//n3Ec7vfxDX/8sb6XcM=;
        b=Aa2x9yPfbD/LBinKfl8FL5GhLyFFnScBiwTt9GbfofZMxvzvZAX0p9tL2VsAfzBW1D
         dNF0PZhhKnERduH4aaPl5HnCW2twidkRtTG75MqlmqbabuUcWB9u7NhmzIg/1fIJMyZl
         d+LgsNGAylwR71GejC1D6DHY2lfXZHLQwLpE0X5yFuYxK+JJPXdvIwNIPKTFTZczVXFX
         v9/1nN3Fb8IWTawmeDAQW23nV+4f3IbJ6LDWyfHhSJ2r+M54VTtF0JNmk1mEK09WBbWU
         32SDTenHXaXDeIVyiB/HnucbwW3txplLNrNwsp7kZav4Uy+3FZX2OEnk8i8IwcYKQ+it
         cA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692302567; x=1692907367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIdLEeDoRxW6hRD2hjFiaBX//n3Ec7vfxDX/8sb6XcM=;
        b=lfq51N4SRUBigh+gkbrNyygau8zGdsLObgK/2ik7bE5R1obecTRLEV4uIan2VzF0MK
         h0mQIcSWO1f+3MueFSWb2kHe7dfMYJen3sR4+pHKFBeXALbMGcH+zpgYcW3nRudL4qUn
         Ku9HbqE/ZDdYZ3Bu7qLB3GN4l1TV+08UfNEDbYqQcdrN82/RwW4baUP8h7xVS+ulNtCW
         MK6XVm6hcg9ndWkQFcGLtDRCpK24PfAdqvVceg/JCDmNUiB/Hrpe4hEL1TtMRAt7DLcr
         BvRvXh0NAkxo8jLDFtolAL6gWMBifa7uyJ4wVCYVovbiPL/nqaKp01WmcfbtWK7kQqJO
         kZwA==
X-Gm-Message-State: AOJu0Yx88ZbZz0qoJiPTmzB8VqDL93tLpcWTUkgyE7V586o0z3BJ9bgO
	UUZigBkW8O4vQ9tBSuaVoyo=
X-Google-Smtp-Source: AGHT+IErfi4qjYaR3zIFQpAVWUhmOUg07wxPd3gIpsYOQ0Sy3sgmZtvHmzY/azZHM7HHIbMxXtTIMQ==
X-Received: by 2002:a54:4013:0:b0:3a7:3ab9:e589 with SMTP id x19-20020a544013000000b003a73ab9e589mr599088oie.35.1692302567422;
        Thu, 17 Aug 2023 13:02:47 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b00767d2870e39sm43760qkf.41.2023.08.17.13.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:02:47 -0700 (PDT)
Date: Thu, 17 Aug 2023 20:02:45 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] vhost-device: fix README.md location
Message-ID: <ZN585cM5gyoF2GJ3@gmail.com>
References: <20230817-vhost-device-readme-v1-1-dbc9a864306e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817-vhost-device-readme-v1-1-dbc9a864306e@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 20:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8209

In message: [meta-virtualization][PATCH] vhost-device: fix README.md location
on 17/08/2023 Erik Schilling wrote:

> I accidentially created it in the root while it meant to go to the
> subfolder.
> 
> Link: https://lore.kernel.org/yocto-meta-virtualization/CUUO41I813NY.CPU5GWIZUCC4@fedora/
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Apparently I also messed up the README.md location...

I didn't notice it either!

merged.

Bruce

> ---
>  README.md => recipes-extended/vhost-device/README.md | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/README.md b/recipes-extended/vhost-device/README.md
> similarity index 100%
> rename from README.md
> rename to recipes-extended/vhost-device/README.md
> 
> ---
> base-commit: 28205358690f79e13c1970ea7d61bce0131da027
> change-id: 20230817-vhost-device-readme-49ce8d7d57aa
> 
> Best regards,
> -- 
> Erik Schilling <erik.schilling@linaro.org>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8207): https://lists.yoctoproject.org/g/meta-virtualization/message/8207
> Mute This Topic: https://lists.yoctoproject.org/mt/100796683/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


