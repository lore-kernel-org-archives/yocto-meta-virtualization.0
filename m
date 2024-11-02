Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46A4E6B27E
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 04:04:46 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.11132.1730520282827962383
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 21:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amthUEy7;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4609e784352so17035841cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Nov 2024 21:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730520282; x=1731125082; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8koiU5U3bOk52KqjZWMOsYYZ2HeEIw3Ksfv1PDUuMU=;
        b=amthUEy7tAnUiOdnv95ne8AVilxQjA6UwhWbcMkkUnB7cxjFlkPXBcsNjhCgsTxBA/
         V8BqNYbL0Yk5wEFhTuvGII824UbHj95NgqAuvH7syKtBE4jFQv8oIONi/GN0BSaD9YBZ
         8uQ4sXhDOYNMDrmIk2LCgQxgqAhZNDLNXQssiNlWFTd7TpIL4eMCU2C9+IPtrxF5v2xn
         eJWL4UwRuHHKwGANjPJFfOUUBEORPW25Itt7zfFZzSF9qGoXzHOXQTFhYBJOuuQe507J
         s2ve6MKx/FRn0ddVzHnI5BJIQVjMNBkQb9hUDLXX7NRuR0dqUY9TCvEMaxkoEE7fNyFl
         Kc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730520282; x=1731125082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8koiU5U3bOk52KqjZWMOsYYZ2HeEIw3Ksfv1PDUuMU=;
        b=b4mUo39mmhYM1ewRwFmHGTfLcc+/g7EnTMwCR3UrWTlAMuRodrIHTLhYssIUfs6Nwx
         bnraZUBl/PCqfG0Eew8BDwzPipKBcMF4aCX/dPBYRYb+li/8o21O1kzo31oZELsF7BU0
         TwqMZ8+PDljnUGgnR66/gqsidLviWX0REwWPJK+yAQW1lzE5l3cQFC/gwcmKEfkFLlky
         gCER0zhZE8XTrVAuEze/55UWrSutfVZyOnXE/IFDP5XLvAxlnZfLkkENthxyhbeptHQr
         KRYDai6haiaud/R+qP5++TErprU+7NuS/PzMyY4gAN02sMHBcU1d5PBDEhIk+EKyKz0O
         BvpQ==
X-Gm-Message-State: AOJu0YwRRXEBTqiB+ckKkdTMbgyWRrWSJ1BzHih6IclfnRBOM87k1xcB
	Uxya91adi8qoRNofEDNrS3rtTpbwsHFosHhOLEYSZdztdnCM1qk5
X-Google-Smtp-Source: AGHT+IHKR0yynEIj7NKHa/41Ddw1QqviqpdsuIdBlTq+Db8uGXoA+uhvmJCNqowDyDfmHCBU85Defg==
X-Received: by 2002:a05:622a:1a83:b0:45d:6daa:8aaf with SMTP id d75a77b69052e-46171703991mr162261231cf.29.1730520281691;
        Fri, 01 Nov 2024 21:04:41 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad0c7009sm25183951cf.43.2024.11.01.21.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 21:04:41 -0700 (PDT)
Date: Sat, 2 Nov 2024 00:04:39 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] container-host-config: Remove
 centos registry
Message-ID: <ZyWk10RYDTZbr9XT@gmail.com>
References: <20241021150231.1221025-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021150231.1221025-1-lukasz.czechowski@thaumatec.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 04:04:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8951

merged to master (styhead shortly) and scarthgap.

Bruce

In message: [meta-virtualization][PATCH] container-host-config: Remove centos registry
on 21/10/2024 Lukasz Czechowski wrote:

> Update registry list by removing 'registry.centos.org' entry.
> This registry is no longer available.
> Decommissioning of the registry was announced in the thread:
> https://lists.centos.org/hyperkitty/list/devel@lists.centos.org/thread/EHGCQUHLDQ6LI474ZAB7MPRZFJD77P3S/
> 
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> ---
>  .../container-host-config/container-host-config/registries.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/container-host-config/container-host-config/registries.conf b/recipes-containers/container-host-config/container-host-config/registries.conf
> index ba6c3f6e..926d8c36 100644
> --- a/recipes-containers/container-host-config/container-host-config/registries.conf
> +++ b/recipes-containers/container-host-config/container-host-config/registries.conf
> @@ -9,7 +9,7 @@
>  # and 'registries.block'.
>  
>  [registries.search]
> -registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
> +registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com']
>  
>  # If you need to access insecure registries, add the registry's fully-qualified name.
>  # An insecure registry is one that does not have a valid SSL certificate or only does HTTP.
> -- 
> 2.43.0
> 

