Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.2824.1635469964151921049
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 18:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S2OWa2Y+;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id s9so2688299qvk.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Oct 2021 18:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BuvXH1GjtKxu4E0jiOiVD45etTDHs4tXgPWqCZx+rwc=;
        b=S2OWa2Y+Sjt1ZLVCrgTvIloiQFaGh0WDT+Q6BWcgTi8WGcuTLcEuNIVhtfzDlkx0UU
         bW4kwKTXSaiIT3UxposznF5b7klW69Xjuch3CYWq3JC03S7eT9KuXo7inRrFuzqB6BLh
         RFhYYIGTQ2r8Rg89eVfrZfPHih2ytniq0F0XA/GDJ/qhhJItZDxj4ZS1WLDNGZ5d40/i
         7xMzkTXFOziqfSnNFkwBomRwqthldZhb1LjoDSVjBuWil/drgYOnYwf8iV9TM9T2nDaF
         4CSkHqu3H7eHqXUkqeYnXGn507p6WljIAYRTApFRo9/AepkQwNhPNoUBYnPZ8Gp4hVAn
         IEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BuvXH1GjtKxu4E0jiOiVD45etTDHs4tXgPWqCZx+rwc=;
        b=KcvlF4/cV8LOha6GFKk6UDoiTv2BKMVPXcjMpqFAUIn30tWykThXH9UcYLGDl5WKVV
         hHiK5Q8C8wMaGhL7PGn4GKvfWNc6CMJ2askYyEVTGV/J9/Ik5QQ7GqDqpziMJR8qLKPj
         xpAzAbVZB2fVKPWnZ8UvSo2qF2TEXJUUljrrrmfa2f6BlV5t8OupwFKIdmpPByJFmJq5
         N4yqc2axE31p1SMXBLfegFlMinRKerC+i2M0t4MbwuzhopUwGSfXOP11nyIWQbRIcqdt
         T7+1ARIGvdSyVlDYC1Gq+B/1FSJ7mbp9O1QhblJzMVKYYK7thhnyjwW/IKo90RP602QM
         XCqQ==
X-Gm-Message-State: AOAM531Q+cB3JAR9XVMl/w/th+wSfhqwvAnTJcGGzTRtVfyWxN+ZkQrX
	BsxHUPqExLwhCOd781UpcSs=
X-Google-Smtp-Source: ABdhPJxneeoOv2dlK5Z2PhreiCPIuPUAEUkwgh+imtCwltYAOAc0FAkZ2XUty23ZvMcOVRJXJUqOyQ==
X-Received: by 2002:a05:6214:e84:: with SMTP id hf4mr7992406qvb.38.1635469963169;
        Thu, 28 Oct 2021 18:12:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id x22sm3444528qkp.103.2021.10.28.18.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:12:42 -0700 (PDT)
Date: Thu, 28 Oct 2021 21:12:41 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][hardknott][PATCH] python3-posix-ipc: Add LDSHARED to recipe
Message-ID: <20211029011238.GA22105@gmail.com>
References: <20211025154631.14039-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20211025154631.14039-1-trevor.gamblin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][m-c-s][hardknott][PATCH] python3-posix-ipc: Add LDSHARED to recipe
on 25/10/2021 Trevor Gamblin wrote:

> Doing "import posix_ipc" on hardknott builds gives the following error:
> 
> ImportError: /usr/lib/python3.9/site-packages/posix_ipc.cpython-39-x86_64-linux-gnu.so: undefined symbol: shm_unlink
> 
> Set LDSHARED for the recipe with "-lrt" included to fix this.

Thanks for the fix, most appreciated.

This is now merged.

Bruce

> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../recipes-devtools/python/python3-posix-ipc_1.0.4.bb          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb b/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
> index 2e8dca06..cded499d 100644
> --- a/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
> @@ -20,6 +20,8 @@ DEPENDS += " \
>          ${PYTHON_PN}-pip \
>          "
>  
> +LDSHARED="${CCLD} -shared -lrt"
> +
>  # RDEPENDS_default: 
>  RDEPENDS_${PN} += " \
>          "
> -- 
> 2.33.0
> 

> 
> 
> 

