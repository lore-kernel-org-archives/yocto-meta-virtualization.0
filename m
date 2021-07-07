Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.2399.1625686959636403419
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 12:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+XdJvC/;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id n9so2940946qtk.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pUPMGbyLp3y8xpFjQHJ76e+A4aszQIoJAfK84CmOzhk=;
        b=R+XdJvC/7ZtToG3cun1qfBLy8faJaR3oJLB018zScXouslrqx9FzsIpQvyTCzzlGrw
         XTrffgZdrGlwl+ak5nW/z0/cc47+5zD+T2fWYWcppEVvQeDWiWOT6b2aS9N0V7B0witl
         CkWOC8yXW7YWqtc75Ci/4wifgxypZoaN2lej6G/WyUpc6gDJw6oTpp/IKRkeT/ePKQTe
         aaxz2gJJhX1eLOgNG1B32/0qH+eZ3LTas7QeQljGC5cJRiIO4Q9QDdNb1mYSChGhQASS
         nWd1GHL60iJZFJtFQs1p/YyNtoFsZIPw/cGIMWKgziHSFcLtHMf7i+37GSNjqnIdfHpM
         uD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pUPMGbyLp3y8xpFjQHJ76e+A4aszQIoJAfK84CmOzhk=;
        b=uPAXW9cR/sr92GYn/0lU8gbZMjsYUrefXXeBpgMVQ6tX2/ixfsnm5ZucZFWa1R2vmW
         RdUDc92np2TPbbAnRr4+xHWG0oGfv8DXZSroAXk09oMBn85AmhsgTbHVUCaYCCYzjLAU
         A1BpWl7zwjRhKlXfWlPntCJ7jZbGMo+a9oB02hOmsrV0UZi3c2Cvy8zsIVKY/6dOLNQw
         2kiANHjzYHMfY/ys6SJJZBXmCRwZ0aVL7FYyXfM3YpuXqHwf7GbBFnVGTLTcWbmFfXKO
         q0QBqhkggaT/TEWOqZfUwF4YmitR8HOnEY3mDJZV+2nW9K0flgxQ1Wdr956TaPWB9qH4
         Od0w==
X-Gm-Message-State: AOAM533J73FfubQDNADTUW4guWu5vyx5ax53YaKiQLb0oUO98WEMeyFP
	gZIcmMuR+gaFr4NHsTpqsUeaEYZZPB/MoI+W
X-Google-Smtp-Source: ABdhPJxQUGeoFH3T4v10zwPAIHBUWCmPps18OKlMyf/hEOymy0iNchCuVoJjd87IpsETskmpAmc99w==
X-Received: by 2002:ac8:46c2:: with SMTP id h2mr12351834qto.353.1625686958788;
        Wed, 07 Jul 2021 12:42:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n64sm8791868qkd.79.2021.07.07.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 12:42:38 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:42:36 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] Revert "nagios-nsca: blacklist recipe due to unsupported libmcrypt"
Message-ID: <20210707194234.GA55535@gmail.com>
References: <20210705032433.28402-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210705032433.28402-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] Revert "nagios-nsca: blacklist recipe due to unsupported libmcrypt"
on 05/07/2021 hongxu wrote:

> The libmcrypt build issue has been fixed by oe
> 
> This reverts commit e7a0ea3e0fc43f6c2ec8fee70ec1315014ffbec1.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/nagios/nagios-nsca_2.9.2.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> index 1fce1983..fd45d84c 100644
> --- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> +++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> @@ -84,5 +84,3 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
>  INITSCRIPT_PACKAGES = "${PN}-daemon"
>  INITSCRIPT_NAME_${PN}-daemon = "nsca"
>  INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
> -
> -PNBLACKLIST[nagios-nsca] ?= "Depends on libmcrypt, which is considered abandonware"
> -- 
> 2.27.0
> 

> 
> 
> 

