Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2327.1625687018736645219
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 12:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kK32xKsH;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	by mail.yoctoproject.org (Postfix) with ESMTPS id AE69438C051C
	for <meta-virtualization@yoctoproject.org>; Wed,  7 Jul 2021 19:43:37 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id j14so1630719qvu.6
        for <meta-virtualization@yoctoproject.org>; Wed, 07 Jul 2021 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7tpmYY8SWgMtWvqEnNVQeEaY8rgF5UlkP3N95GrbUVg=;
        b=kK32xKsHXBOa5DIWOdq7clwLrxWyqHJ+CGjEDEX8rfSefVrZrgEdfh1hkWSN4vw2p3
         /VVmGqHAs2xrgdphELHoxj4RwTOGpLKM6V/sZF4y4NRstg4y3nvDYiWeL20K/q6yspgb
         /1hczseGtsowRxRvERihZwRJg6X1m64RJcA6Yaz6aX2jU6stShRybrcU9b/BYn9R2OpJ
         9NZYfIqxP74RUT/kCSL1OV449J/VnD2FtwT4EhfPtddhuK5by+XHf/TgjicjbnQBuXog
         cV4zFYKvcBqNv/UD+Y4I1IpEqPKjAT4AFxovbFLNU2u239vVrT+43q6w62QhumctOWs9
         hytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7tpmYY8SWgMtWvqEnNVQeEaY8rgF5UlkP3N95GrbUVg=;
        b=W0VIQB3XYw1GK0SIePn2oOEtpfvR8ePRue+bWeyYteM/iw2D454UiNxyTqYWB4l9Lf
         3QvKlPIIZkqJ2PCotFe9UKgjyaOIxIOtCw6C0060iE5MLMJY9O5R61BPMylDyzGZU3Dy
         P2XSYVwHG6DJAHoG3KLXiSVxw3aT9brZGDpY6KRhHVZbjvghra0qoIEuEZPradErAowO
         Jqlnu8NMIV+uGS71hpze9yK6WEzYLThjDA7x5qpk4t+M2syQ4FX/4w63BtS2H8iqqYT4
         Wh+ZUzN8uVkvGV6g+VdX6NMViNcy3qhvxaK2nVhaLDfFaa7Gxu+J0sCkWG/F8nBUCIyg
         kMCg==
X-Gm-Message-State: AOAM532DLNh7lcDg7VIBoB+0ZjUB//LabK8mcCfDsTRp1UmcEMbUz9gh
	FkAHb08DyGbi7J5D2hjV2J0=
X-Google-Smtp-Source: ABdhPJzBl/uPIk31FAROUmPSHMc4+PvddD0S51szT3jdVhoc9z/7aocUS9Dt3HN6Khdi43Eq1bLFSg==
X-Received: by 2002:ad4:5906:: with SMTP id ez6mr25616823qvb.6.1625687016736;
        Wed, 07 Jul 2021 12:43:36 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u18sm28487qta.38.2021.07.07.12.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 12:43:36 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:43:34 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] criu: skip QA checks textrel
Message-ID: <20210707194334.GC55535@gmail.com>
References: <1625638084-8262-1-git-send-email-zangrc.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1625638084-8262-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Were these warnings always there ? or has it been something introduced
by recent uprevs of crui ?

Bruce


In message: [meta-virtualization] [PATCH] criu: skip QA checks textrel
on 07/07/2021 zangrc wrote:

> WARNING: criu-3.14+gitAUTOINC+e49ce513c8-r0 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index febf81e..6342620 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -22,6 +22,8 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=criu-dev \
>             file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
>            "
>  
> +INSANE_SKIP_${PN} += "textrel"
> +
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>  
>  DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd libnet"
> -- 
> 2.25.1
> 

> 
> 
> 

