Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.2181.1591065093828963684
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 19:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fsz0ksz/;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id c14so10155899qka.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2020 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jOUXlCYI60jHEwGki1gBNaHgKDOkMS+85tmUQVadIMM=;
        b=fsz0ksz/DsYx0FewJ1sm8EctOhcQfVmWSDVChlF7Jr53nQLGIcviHAy3NqTaxs/udn
         dOffuLcb7rSqpcQP9gM2yIFaaU8fTxaTdf+GPNV2rJUWcF/SsDe01Cklv8CkqHiYcWRa
         NmbjJIDXPBEHtwkLUwXemmsPFaagFPXVONpomVEz5Lqs6o3wQfe+2fG5b3AQc+nijKNc
         AHzkFKNN4KXBodo+bi6BwiorP/L079/PyOLkjDmtcZYudSMXZsuwmCCPV8aRcN3u7iHw
         ShQS4kUMNNH1IZfWPor8hKD2EngNOwB1rLHqT8Ww2REONSpF3bgLsEh+mTZwfiH1XMTQ
         b9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jOUXlCYI60jHEwGki1gBNaHgKDOkMS+85tmUQVadIMM=;
        b=pz+5TIXRT5kce305g5B9+iuHCBLf1avf/Vq4p5LIbjlb11SPK42kprQ/oAsvkcd8Ds
         Tv2VTWy2wPm42nbR+SCgkf9T8Q8MAGB5JV249SBLKQ0Z2IJcXAcH0wJym2ar17tplkrp
         777Quk413D2KK0a6QuCXVcKLX5HAem71ZgjgXKOmlfg4Lh+bWM0fV71yO56oMrBYgLcb
         PMsG4S/15wpKIlwjMLP//LYC3YY6qiVQnt5dt0X2Yv3g/HfbLBDItrN8fOGKZ3GahuOj
         SQw0DgYioGjItwSARZYm5G24nSGnhAZhLhCMfKLNUOuwDXIRCRUh+2mJsYrLBRsZ9pBM
         cDmA==
X-Gm-Message-State: AOAM532g+QjENR3Cjp5TPw5e6h0ASCXmgTysYGJUa8Jqspsx+c9tLiql
	O/LIXd5EyMNeDcnvcCwP45E=
X-Google-Smtp-Source: ABdhPJwQkXQWtilo3+oxXp5h/cZRiyVbdPdR5jaRggfHmWuBLXGvqnAnKPHkpDaCwXmpnbbw912Npw==
X-Received: by 2002:a37:dd6:: with SMTP id 205mr21984323qkn.323.1591065092849;
        Mon, 01 Jun 2020 19:31:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id i94sm1332746qtd.2.2020.06.01.19.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 19:31:32 -0700 (PDT)
Date: Mon, 1 Jun 2020 22:31:30 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Babak Sarashki <babak.sarashki@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, zbsarashki@gmail.com
Subject: Re: [meta-virtualization][m-c-s][PATCH] postgresql: Fix install error on non existent file
Message-ID: <20200602023128.GA36868@gmail.com>
References: <20200529194129.89590-1-Babak.SarAshki@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200529194129.89590-1-Babak.SarAshki@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged

Bruce

In message: [meta-virtualization][m-c-s][PATCH] postgresql: Fix install error on non existent file
on 29/05/2020 Babak Sarashki wrote:

> From: Babak Sarashki <babak.sarashki@windriver.com>
> 
> Commit 103939fec ("postgresql: Allow successful run of postgresql-setup")
> renamed .bash_profile to .profile. This commit reflects the file rename.
> 
> Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
> ---
>  meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> index b6a9c3c..3de5845 100644
> --- a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> +++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
> @@ -35,7 +35,7 @@ do_install_append() {
>      sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
>  
>      # Update PGDATA throughout
> -    files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
> +    files="${D}${localstatedir}/lib/${BPN}/.profile"
>      files="$files ${D}${systemd_unitdir}/system/postgresql.service"
>      files="$files ${D}${bindir}/${BPN}-setup"
>      files="$files ${D}${sysconfdir}/init.d/${BPN}-server"
> -- 
> 2.23.0
> 

> 

