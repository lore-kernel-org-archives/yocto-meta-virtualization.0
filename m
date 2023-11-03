Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D274C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 03:26:02 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.22016.1698981953655622948
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 20:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MK0HDvVX;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-778925998cbso94309285a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Nov 2023 20:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698981953; x=1699586753; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5TF0re7l9jAsRA50j5yg5YIwnm8gCWWHhI9v40BQKX8=;
        b=MK0HDvVXwIEw3tpdG8RntKTeFoe2ON2QhaiVK2Zz/tvQhOmm7r+RtgJOoYSkw7CzEy
         OFsYMkgjqSggNcPUcWmMadNlJ2GlmslHtesvdq3G1pxRBOwHykYU3BgPXSvhiL1bWVnb
         DBWeNDcLWu7f33kntudgNpeR2LKVWz2hmD+8faIRSHj/cs14r0mdPVazfZdisABhMU2p
         SGY8yqlLP09rHTWg8bR+/TLNxu8mWhP3FXdCiKdqGutB5eXSqIE+7Q9wC10YSu/NHvWm
         ixY3gdeMKWcelYAT71mPncaEXUKgQvRNE1u8AT6GY3gq/1hqwRupkcBBZlrTyo8gCbML
         POyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698981953; x=1699586753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TF0re7l9jAsRA50j5yg5YIwnm8gCWWHhI9v40BQKX8=;
        b=e4TLyoR5c1dHhggVim4UJKaE/e4hmaQFSnn51OKg5eZAq30DOqVYkiWzhRd0sExejK
         uwmJXE+rhb/35AgrsdzqU+r+7IZvvvfwgtI3uOTgx4gFyuQz2rwFgTgo7z1OmbXHGOx6
         hfdOahTYdkC8v4mQctN3UJx9VY5CCmTYkNFFHuPtp0nWEM6jeAmnPPvwYZdDmyOyvWIC
         o5w35Y6ZDgvYI85azxdgDsNjCMaCV6pcFnsPBtYE+fgHjH2jxBhyY1ssQKosuWHpaFFQ
         0CyTeRy68Tbdfz5IIy7B6ZavJo7DmPZLQZ6urrlQnvVEnV/iacruRi1AP6Gu14vlW5n6
         5U/w==
X-Gm-Message-State: AOJu0YydHqd3KCTlGui4KqHXQIHBS8iqZH0mybTrRzX5J6Og2PhoTpWg
	IKp1rY6GKlGQWZXHJ7F+qGw=
X-Google-Smtp-Source: AGHT+IFhhtVu+EN0oTFDZAhlpbJScE665BlXwNN5BpsEfTqxNEP5PwG7Wn9tGKABbadOCKXQ4QlIqg==
X-Received: by 2002:a05:620a:24d6:b0:778:b78b:3338 with SMTP id m22-20020a05620a24d600b00778b78b3338mr23781135qkn.10.1698981952609;
        Thu, 02 Nov 2023 20:25:52 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bs36-20020a05620a472400b00773f008da40sm336528qkb.125.2023.11.02.20.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 20:25:51 -0700 (PDT)
Date: Fri, 3 Nov 2023 03:25:49 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
Message-ID: <ZURoPepW3tQ2LZxE@gmail.com>
References: <20231016212626.2146963-1-JPEWhacker@gmail.com>
 <20231030190802.1275280-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030190802.1275280-1-JPEWhacker@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 03:26:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8414

merged to master-next

With any luck, I'll complete my release testing and master-next
will become master shortly

Bruce

In message: [meta-virtualization][PATCH v2] classes/image-oci: Map image architecture correctly
on 30/10/2023 Joshua Watt wrote:

> OCI requires that the architecture [1] be a valid GOARCH [2]. To
> correctly perform this mapping, use the go library code from OE core.
> 
> [1]: https://github.com/opencontainers/image-spec/blob/main/config.md#properties
> [2]: https://go.dev/doc/install/source#environment
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
> index 9ddb88b..0ec5c48 100644
> --- a/classes/image-oci.bbclass
> +++ b/classes/image-oci.bbclass
> @@ -52,7 +52,7 @@ OCI_IMAGE_AUTHOR_EMAIL ?= "${PATCH_GIT_USER_EMAIL}"
>  OCI_IMAGE_TAG ?= "latest"
>  OCI_IMAGE_RUNTIME_UID ?= ""
>  
> -OCI_IMAGE_ARCH ?= "${TARGET_ARCH}"
> +OCI_IMAGE_ARCH ?= "${@oe.go.map_arch(d.getVar('TARGET_ARCH'))}"
>  OCI_IMAGE_SUBARCH ?= "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
>  
>  OCI_IMAGE_ENTRYPOINT ?= "sh"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8408): https://lists.yoctoproject.org/g/meta-virtualization/message/8408
> Mute This Topic: https://lists.yoctoproject.org/mt/102282594/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


