Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web08.11453.1605802033298208349
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 08:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e730Czz3;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q5so5785807qkc.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Nov 2020 08:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4cdefNIDDPS4E050rOvc8jrFP2qOGBFYBUc+ga0iPBQ=;
        b=e730Czz3WfgTyEtqnf4vU9XF3h9uPgXE8rJdhi8vKaa9lfphJlMCee271SKZB/1k0f
         U3MHvzjXPKbCr9XgWFenX+jTko2oF+huwPGzRNkKzbjGG67JsC73hUA8bnzE2r1cla/6
         Cw75DGed0D9dY35+ibGyKUtoQ3TyaUbzewOQu8SMTrooyDrUv5hdh4Uy2zi/LRyJANBj
         XMSSagM1Cbzq9HtjEhyQiDbGDElPDZqCuBzZVG+BZQ4ZnQk37EKt3MlTqOZFwYIyz+Xa
         Av0xuJsa1wpQCs2tDUi2eCN7frSQLMzqtaLb73ladmTwgqHvv2FRoaq1jZECnTZFDxcC
         KYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4cdefNIDDPS4E050rOvc8jrFP2qOGBFYBUc+ga0iPBQ=;
        b=XiF3At0oMVrhfu7OAtbJAn3KiBb/U47OH42asGWW0lkBTr5LEjOMyjx1+VHXShbc4s
         q8hEuTnA0tO8YjBU91O7gvLYYhuREb5gRMhGAudBDeCbsXLXs3vucxiswXLhhssgIUoR
         9qPlQ2EYovIFsoy1MQOJMmBOpAfp+PZn0+HGiASl1fclyK4Q2QouYAptLoo9bUMzLbf/
         VzQeTE+XjUKx0PvgfKF2THdHjpeth2e4owscAN/xVFJ2AbO37+EvtNqbRpQja9OG6gRf
         z9eWjqY82rjHYA15Y1KjxyqiVdkfpfnc7inykXIoGnHDS4KMyeYfwVH0z2uTRTxe8v/d
         iSxQ==
X-Gm-Message-State: AOAM533yuiicRM0sBOpvE0KI1rcT/r8M6A6tBzsVNcYpHld43/UungJz
	dNKmQsSCI5Uwl+ilpRnYm/k=
X-Google-Smtp-Source: ABdhPJwn7sd3m3GIMFs2uuPcrW6jtB4ZUcErN/lQeqtjgkH3qRChUjB+gm5jNByVdOh19/zr6hMROQ==
X-Received: by 2002:a37:658b:: with SMTP id z133mr11841323qkb.356.1605802032301;
        Thu, 19 Nov 2020 08:07:12 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id w54sm192809qtb.0.2020.11.19.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:07:11 -0800 (PST)
Date: Thu, 19 Nov 2020 11:07:09 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix host gcc can't recognized option -fmacro-prefix-map
Message-ID: <20201119160708.GB9432@gmail.com>
References: <1605763101-60407-1-git-send-email-naveen.kumar.saini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1605763101-60407-1-git-send-email-naveen.kumar.saini@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: fix host gcc can't recognized option -fmacro-prefix-map
on 19/11/2020 Naveen Saini wrote:

> libvirt-python picks host gcc (instead of cross gcc) to build shared
> library in absense of LD*SHARED flags.
> 
> Instead of inherit distutils3-base.class, taking SHARED flags to create
> libvirt-python package.
> 
> Ref: https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/distutils-common-base.bbclass
> 
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 7b87d5e..819eceb 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -24,6 +24,11 @@ export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
>  export LIBVIRT_LIBS = "-L${B}/src/.libs -lvirt -ldl"
>  export LDFLAGS="-L${B}/src/.libs"
> +export LDSHARED  = "${CCLD} -shared"
> +export LDCXXSHARED  = "${CXX} -shared"
> +export CCSHARED  = "-fPIC -DPIC"
> +export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
> +
>  
>  LIBVIRT_INSTALL_ARGS = "--root=${D} \
>      --prefix=${prefix} \
> -- 
> 2.7.4
> 

> 
> 
> 

