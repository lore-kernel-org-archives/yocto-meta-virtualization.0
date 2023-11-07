Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB70BC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 01:49:19 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.1370.1699321752945069135
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 17:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ad22Wb7D;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7789a4c01ddso340966485a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 17:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699321752; x=1699926552; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIpLNs6ld5JLEq9LmGUIXrLJlBySu4l1tjfuca2s29s=;
        b=ad22Wb7DfTot8WxhJthJa0WZWtq/jgjJq6fxvMBu0BX1ctAX1WapbjFxy6EWXZUYHj
         dKFG2UyAAWvouEjFABSlsSMcmmCq9nJH5kthaQqmKNCtpxnr7PcaWv7gKgrqqOPt+u8Z
         YiADO6I098JZFToXBTxmWTIyTJ3xIzEbWqKJQlXMMU5qr+1FimWc55FHbzO4O8EBgkI4
         kkzWfR9yM2epDH5MZkFEWxdr6b8LikI86neEeF+AB1cUq+EFfzJOn7AdYIJWAWidXVLR
         A0Y9VysZiiuwJvg6kyUNLdzw96zmNHUfUvOKds1Wk2n9rp3AuoJYc1diZNbFbSY4KwTQ
         eVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699321752; x=1699926552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIpLNs6ld5JLEq9LmGUIXrLJlBySu4l1tjfuca2s29s=;
        b=rHqYr9yIM4MUQSk+dcq1a3yGM4YKhtiRdYgTqCx/I5jN2dAEFfya6o46Nzb6I90b/7
         QyDliDGfpRTNAfd9zida1FJxgESDszeiB82pV9SBMqaiHuTZ1AEqmT+DeemXcs7uaTEs
         /P5SN9q0TazfSq/gdWtv3nYscROIMaQe2ShP/OYPchlQ4UWs/31AaWMG8ZWOXjSMokmZ
         AJv0U5DHKuWhdJ9ny8U4YIqhI+Hp8WWMbepFt0ZpsBAN2qx6W+mh/OD5BfQdhhx7ep73
         VIVRMGNvcOxo64Zl1nXgqo4qfSB8gXqXIn+AuOBkW1ByxCXLF3G/mmOMFurNkmT+WoIF
         5UvQ==
X-Gm-Message-State: AOJu0Yy56tgm3TFXuiJ5P5zeLMjgGuu0eVekcYcWY2epsfQYxsvd7Ze8
	ZorPPpjdtHe8oYDgJ34RWmU=
X-Google-Smtp-Source: AGHT+IF1LYRh/n4cRCh7UoGTW8PHKTp8+4Vi65qxfyvwwSHz7S8tCDtNjJUqjUpe1Eu/XCIApeHJIA==
X-Received: by 2002:a05:620a:171f:b0:778:a93c:e661 with SMTP id az31-20020a05620a171f00b00778a93ce661mr36346173qkb.32.1699321751773;
        Mon, 06 Nov 2023 17:49:11 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d11-20020a05620a240b00b00767dc4c539bsm3795829qkn.44.2023.11.06.17.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 17:49:11 -0800 (PST)
Date: Tue, 7 Nov 2023 01:49:09 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 2/2] grpc-go: Upgrade 1.41.0 ->
 1.59.0
Message-ID: <ZUmXlRPppFM+YERB@gmail.com>
References: <20231105140429.1973258-1-peter.marko@siemens.com>
 <20231105140429.1973258-2-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105140429.1973258-2-peter.marko@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 01:49:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8430


In message: [meta-virtualization][PATCH 2/2] grpc-go: Upgrade 1.41.0 -> 1.59.0
on 05/11/2023 Peter Marko via lists.yoctoproject.org wrote:

> From: Peter Marko <peter.marko@siemens.com>
> 
> CVE: CVE-2023-44487

There should also be a list of shortlogs covered by the update
(as you can see in most other recipe updates here)

> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-devtools/go/grpc-go_git.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
> index b3b58ed4..8fe0875d 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3b83ef96387f14655fc854ddc
>  SRCNAME = "grpc-go"
>  
>  PKG_NAME = "google.golang.org/grpc"
> -SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
> +SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=${BRANCH};protocol=https"
>  
> -SRCREV = "5d8e5aad40bedb696205b96b786f1d0e1326b3f8"
> -PV = "1.41.0+git"
> +SRCREV = "7765221f4bf6104973db7946d56936cf838cad46"
> +BRANCH = "v1.59.x"
> +PV = "1.59.0+git"

We don't need to make branch a variable, it doesn't really
add anything to the patch or recipe.

Bruce

>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8423): https://lists.yoctoproject.org/g/meta-virtualization/message/8423
> Mute This Topic: https://lists.yoctoproject.org/mt/102400852/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


