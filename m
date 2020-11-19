Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.11605.1605802021853210348
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 08:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ta2fEF3z;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id l2so5876137qkf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Nov 2020 08:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bTNQQKixjz5AcVKGyuGxi30VSDB8IKMRHCsj+lGqi+E=;
        b=ta2fEF3zXnsPJAEbt4+OVkTGrXs+AQlxANSSRnuV4xwU4+6gYwdonpMSZKMBG/Dmml
         5FoJciPg2TqcgZCGAWBk9tXp5mL7dcywYLAV46fj8l6drca9aigo2aDfYCtczLiWzsfT
         6jR0CAthOmMHDDOjgo9jyKmNqYjoYXCrphQemanguv7g+wAIhB+areyyJgv+k7wYOkBH
         8tiG9IoWB7/sXoDplDHFWXzv9LnrGcdRybvyZtaCcSv61/0UU9b30tWUkto6h2jNj1i+
         aCjULk6TWuV/JCYfh/qnpsbBH+KcI+Lf4kM+MXAwovuavn4KeJY3R8zax3vilHwBqHtP
         FCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bTNQQKixjz5AcVKGyuGxi30VSDB8IKMRHCsj+lGqi+E=;
        b=oj6NDAeBBC2vbOfWe78HZhSY44NH28NUoUfruvKmAMkYG40A4gmyR4CEzrJ3k1SFG8
         qcH5w8BIjW9nrPXgIzKpQSyFvNqRePMiUVuFYpzdc5CbeaLZhQ8VGhSK5aL08yR6EqQ7
         Dsyqw+1LVMmRWp3XDsWjTEm6UR2QBSPs8s9EPA5Pf0ZNm5JUeeX0IXAPU/nzLyHbIOqZ
         Kuhufakfn6RDHdEiK4EK1mwrlMt5MB4B4tL7SETSctuGAfCplElc62kPA9/UxrAcezi3
         /7nw3Vaxpafn+kC9Fp5s+AJ0CrdqRzLj1DW9yYX2nbNO+m12KtJDLF15MPsVlR3GxvhJ
         M8nw==
X-Gm-Message-State: AOAM531TwXH5JBMcY+nogb+JK04VKkHXPVpJv5bG2ezEaBrITyNBhkfF
	CUP4mnarrY04QUtjKHuG/lk=
X-Google-Smtp-Source: ABdhPJym+pPc7HG9C3JFtVuT8dybkrUpHh9iBkajxnKgec/ckU6uYbWdRPFkX1/foFISTzCaOwWusg==
X-Received: by 2002:a37:b07:: with SMTP id 7mr11930483qkl.370.1605802013113;
        Thu, 19 Nov 2020 08:06:53 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id c12sm147264qtx.54.2020.11.19.08.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:06:52 -0800 (PST)
Date: Thu, 19 Nov 2020 11:06:50 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nagios-core: fix do_install during cross builds
Message-ID: <20201119160647.GA9432@gmail.com>
References: <20201117223336.39599-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20201117223336.39599-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] nagios-core: fix do_install during cross builds
on 17/11/2020 sakib.sajal@windriver.com wrote:

> Upstream started stripping built binaries by default, using
> HOSTTOOLS install to strip binaries that are different in
> architecture from the host, raising errors:
> 
> strip: Unable to recognise the format of the input file
> TOPDIR/tmp-glibc/hosttools/install: strip process terminated abnormally
> 
> Hence, build unstripped binaries and let oe build system
> strip the binaries during do_package.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.6.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
> index aaa722c..4cbec2b 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.6.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
> @@ -80,7 +80,7 @@ do_compile() {
>  }
>  
>  do_install() {
> -    oe_runmake 'DESTDIR=${D}' install
> +    oe_runmake 'DESTDIR=${D}' install-unstripped
>      oe_runmake 'DESTDIR=${D}' install-init
>      oe_runmake 'DESTDIR=${D}' install-config
>      oe_runmake 'DESTDIR=${D}' install-commandmode
> @@ -158,5 +158,3 @@ CVE_PRODUCT = "nagios_core"
>  ALTERNATIVE_PRIORITY_${PN} = '20'
>  ALTERNATIVE_${PN} = "nagios"
>  ALTERNATIVE_LINK_NAME[nagios] = "${localstatedir}/nagios"
> -
> -INSANE_SKIP_${PN} = "already-stripped"
> -- 
> 2.29.2
> 

> 
> 
> 

