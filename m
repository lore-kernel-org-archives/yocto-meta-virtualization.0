Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.52479.1600723945350868510
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 14:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=acC0IOH2;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id w16so16896600qkj.7
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Sep 2020 14:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AwLW09TQ5PBSsnEZDSXZsGKyyj5tcrTmV6djeJuKZL4=;
        b=acC0IOH2nPKe7K5Lyunjs85zzN/vJbyXwlpORZcD0QlhtK26Q5M9ysuFUKEPRdZ97f
         6RILl+X2zpVV7/ZbgMfHtpLzpEQp2hGbYEKAyHBRZMZ/luSV0HU6Lq5zbwuHR0nB4exy
         2rsPMaAEHflv0HFwMEkwwhKlW5r5gjj20P1vB1xJM6VPygzXecm5/whE2bvkMtLP7tN4
         L1u8clrcAn/MRQlqey5YvNGsIQk4fwmLdxuEHJ2xa06m/qfGay/+29XOQ9mIUHhx4ZGV
         BY6RGmi4U5z6/zMzj04OwRIUnp1Q/NxnFdp5Ea2XIRCDJK0KA98RU/qZ0HvqRI3CFHEI
         56tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AwLW09TQ5PBSsnEZDSXZsGKyyj5tcrTmV6djeJuKZL4=;
        b=NIYDoUaFgAbeRzfj7YQQOle5+E8TebphvllPdogvjUkd3iqqIZDj69KYQXv1fWS9dt
         UOx5/Bi+3OQN64YKuD9g4r3KCwM61FUShNEC+8GqJVzPQBX2hfoYCwlLO88/R3uzqES2
         c0BYzTObt+gHuTDjAHiblpFGR6G4dPEP5V0k5gebZJhVRPLPdmAXhWgubsREr3fYfe+8
         e5rRUW4TLDo6WN5e7NNjlWSit7xjDuPQECse5ncJzgxPEQclcynJcoJR7mk+/BMOtfuE
         tOaZoNT+qSTQviHKYNTwtUCdLKxJ4ud7We1xviXdNIE2ksOtc4jNgum1WzVX3U0rKLeV
         V1Tg==
X-Gm-Message-State: AOAM533MIqVm5vsljoFITCLA/GYxAcE2MXlqATCTM80AUIls5BCxEAER
	6iy+/p1+lqczQCqV5hq6TR8=
X-Google-Smtp-Source: ABdhPJwYFQDyWQPgw2gEPRAXBJNphJKW5KAmV/LjyEsP3HmZcbe4L3u6wQzL5/URcZWMKkQzg6MvYg==
X-Received: by 2002:a37:2713:: with SMTP id n19mr1791798qkn.497.1600723944510;
        Mon, 21 Sep 2020 14:32:24 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id e90sm11027624qtd.4.2020.09.21.14.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:32:23 -0700 (PDT)
Date: Mon, 21 Sep 2020 17:32:22 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 2/2] sloci-image: set CLEANBROKEN = 1
Message-ID: <20200921213218.GA47079@gmail.com>
References: <20200915064803.14962-1-hongxu.jia@windriver.com>
 <20200915064803.14962-2-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200915064803.14962-2-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adjusted for me not merging the recipe name change .. and merged.

Bruce

In message: [meta-virtualization][PATCH 2/2] sloci-image: set CLEANBROKEN = 1
on 15/09/2020 Hongxu Jia wrote:

> Workaround rebuild failure
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/sloci-image/sloci-image_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/sloci-image/sloci-image_git.bb b/recipes-containers/sloci-image/sloci-image_git.bb
> index 30fa4c1..fc3c329 100644
> --- a/recipes-containers/sloci-image/sloci-image_git.bb
> +++ b/recipes-containers/sloci-image/sloci-image_git.bb
> @@ -22,4 +22,6 @@ do_install() {
>          make PREFIX="${exec_prefix}" DESTDIR=${D} install
>  }
>  
> +CLEANBROKEN = "1"
> +
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.18.2
> 
