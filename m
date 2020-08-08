Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.3525.1596853424038536794
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 19:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESC+vlG+;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 77so3502127qkm.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2020 19:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kWx7LKFrD7BI3L9+b4IXAo0ZE9E3r0hwCLru/h5Gp/Y=;
        b=ESC+vlG+XUXG8CNNiyS+SG1MHLpECh8kwVvYDlpv2id9lLt/NvIdyjqMx36PMowyiV
         bPlwQHl7glUsMSavEk5crWIHi+fxiCPlMNEiMsPZLZX6taC9fVbQXnrFBdBCxMOIvdSr
         2BI/pW4Qgt8GR23uHK+Ji4r3D6C75Yhmg12V+HOUWhLXwEQhzKPVJGOaQiHozi+jNZo+
         KtrlnwvspmJIPTvYrbgUgzbTE9SDSiXz5XbsdHCgi/2rEl6P5m4AohOcos4nTieY8KdA
         1hZNYdseoA602iXzstAe5ZvWRDF69Cx9lPWV/C/OXd0GSF1gH20EyXPNjh2B8ATo5JOH
         YHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kWx7LKFrD7BI3L9+b4IXAo0ZE9E3r0hwCLru/h5Gp/Y=;
        b=bHTdd6bNa7O/xcb+oRO2z+v0wPiBpnxzhPvFo4BnJYIFjQ7Dlce+6Tr5LBA80eZzX0
         Xxa/HP513+xYLU21lpYnxcSSe1ERZ+H1FsbIN2PhuFvrVGTclMqGCYXqsirjxV+5zFRA
         4SLmeEC3mU0mzRa0R0s3hb/5bH3U0i3UUVxNA47d3X4LvTRnG5B669c98Vwg7r0Qx7On
         6nwwsnrKTUOC3UMZfKeCs6ynyXl0RhVrJURjcW4mFAGuzrlaP6WlPVDR8eW4b7EvbpGz
         jz39lkhV1h0PcPIPIpxy0Jk/TblpZsBx/4qnnxEHId7YZ6yyS7H83wq4aOFTgr/4TrIq
         OXsw==
X-Gm-Message-State: AOAM532v7zsWeKmZhrsxI8M+NJpyfH0xaW1P6kG9P+k7I1RsuEKLJYfj
	MoYxzofvmag9k1lWUwGcrzI=
X-Google-Smtp-Source: ABdhPJzMw4FAcCyDSsfud3AqBqHmG5CSfQsNc39yFWVIBfYo5zwhMgrByw+HbkK/pNjlPGMoKjBqlQ==
X-Received: by 2002:a37:4c89:: with SMTP id z131mr15526933qka.404.1596853423201;
        Fri, 07 Aug 2020 19:23:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id n15sm8128138qkk.28.2020.08.07.19.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 19:23:42 -0700 (PDT)
Date: Fri, 7 Aug 2020 22:23:40 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, randy.macleod@windriver.com
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] libvirt: specify location of dmidecode
Message-ID: <20200808022337.GA1716@gmail.com>
References: <20200804163734.26719-1-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200804163734.26719-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [meta-virt][PATCH 1/1] libvirt: specify location of dmidecode
on 04/08/2020 Joe Slater wrote:

> We should tell configure where dmidecode is rather than
> have it search the host for it.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_6.3.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
> index b6a5594..340c372 100644
> --- a/recipes-extended/libvirt/libvirt_6.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
> @@ -59,6 +59,7 @@ acpaths = "-I ./m4"
>  CACHED_CONFIGUREVARS += "\
>  ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
>  ac_cv_path_AUGPARSE=/usr/bin/augparse \
> +ac_cv_path_DMIDECODE=/usr/sbin/dmidecode \
>  ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
>  ac_cv_path_BRCTL=/usr/sbin/brctl \
>  ac_cv_path_TC=/sbin/tc \
> -- 
> 2.7.4
> 

> 

