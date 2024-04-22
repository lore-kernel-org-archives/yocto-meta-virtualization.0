Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEBDC07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 15:05:03 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.20939.1713798295549837335
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 08:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LWRbEStM;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78f056f0a53so311185185a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713798294; x=1714403094; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kfzg9Q2TH5mBze4wQa32Xu2BDtp8MA+y5AEhn98UOg=;
        b=LWRbEStMl4UuHuVJxmIVAPmGyxYseE1K5GdZ643Dd25pcTAMqqaBgTgARhDoLqzRwo
         YRtVyzexLH2e0RTk0x9d8QvfzqP+dVM1lpfO4zlXHDkRyuw9BzQgpeSGGy2pVg+FFqJy
         iPvxwHmDCaclv9W7IJ2+IxEug26DqydyBiuBS239cBsfe5iyP2e/YlA81qf9XmlpHBf8
         m2k/5vcJy4k0kPmumDMeihHHsFWxK+KS3vCYE0kEicgzXzjEeVc8Maa2H3ntS3Up7ce3
         6OVFaYm3q3UL4Sh4HzDU9mzm4gsFNAzgTXSJwmMvigbzrnUOxtqhaCty8YQ7xeJZ4dgu
         cNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798294; x=1714403094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kfzg9Q2TH5mBze4wQa32Xu2BDtp8MA+y5AEhn98UOg=;
        b=QJtjz1Kwy6z1YeJcVlCinUOoPqDv5jtJci6VxPmA9YPK7wZ4Fw8VAk8ilpviX6lOG3
         dPRiz3LitL+wjGmPSOm7RoQqlHSKB99zVgDRkh7vpOZ11psxXcHjw6iiuiWXtn3XRC1S
         e+G7lu5nwNFR+jQi6LJAk5gsdPvNdTwmcdX3St8DHx8P1F19sSk+f7lCBWjOHr2RzwRx
         6y7NK3baYMGAlaIQqI1h+3IQ27+mFHO8caRv+WXDeD62tomuwibxY9X1LN+fhWvkpNz6
         C4CCwW3VgoJhtrG8mDJJETAkwgNEoofH1F8XPJLblEu9FYwW68auq5Ox7qy+Dr2d0jsN
         9JCQ==
X-Gm-Message-State: AOJu0YzUIDqQRn2vGTPWvr1lOzzXuruiB2tbaHQpiry8McDUiXySbfnT
	N435U41MdrP3OUZHBMCh41DPQdvE9F7Fs5vqjk9tNZHLnZ1hBGrC
X-Google-Smtp-Source: AGHT+IHi1IG3kQAf5tPvbCV5R0PYR0pN/aPRiMsKvapD3L4Y9AfTJpRj24glNfgDA1xokNOSYUutFQ==
X-Received: by 2002:a05:620a:8326:b0:78e:d292:2edb with SMTP id pa38-20020a05620a832600b0078ed2922edbmr10724919qkn.6.1713798294489;
        Mon, 22 Apr 2024 08:04:54 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id de19-20020a05620a371300b0078ec3f23519sm4378519qkb.8.2024.04.22.08.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 08:04:54 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:04:52 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?iso-8859-1?B?Wm9sdOFuIEL2c3r2cm3pbnlp?= <zboszor@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] python3-os-brick: Fix syntax
 error
Message-ID: <ZiZ8lNi03PvTp+ko@gmail.com>
References: <20240416043058.243257-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416043058.243257-1-zboszor@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8692

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] python3-os-brick: Fix syntax error
on 16/04/2024 Zolt�n B�sz�rm�nyi wrote:

> RDEPENDS:${PN} must have a closing quotation mark.
> This error was present since the recipe was added.
> Scarthgap catches it as a syntax error.
> 
> Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> ---
>  meta-openstack/recipes-devtools/python/python3-os-brick_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb b/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
> index 093b673e..cef666d4 100644
> --- a/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
> @@ -40,3 +40,4 @@ RDEPENDS:${PN} += " \
>          python3-retrying \
>          python3-six \
>          python3-os-win \
> +"
> -- 
> 2.44.0
> 

