Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.10407.1584150872456469165
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Mar 2020 18:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M67aSRTc;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 695E0E01840; Fri, 13 Mar 2020 18:54:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8732E017FB
	for <meta-virtualization@yoctoproject.org>; Fri, 13 Mar 2020 18:54:30 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id u25so16178597qkk.3
        for <meta-virtualization@yoctoproject.org>; Fri, 13 Mar 2020 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wowZAjqS/cuX45wc7xLIh7K/X4PcjcI8fc642FZSdUc=;
        b=M67aSRTcEAlDLgdEhc54SMOuJW853szlvHowb7MpKEFQadzpeMEOtjqQtrKGtelkva
         PgZdylQzBqrhk6d7Uyr9kopIwyxFbfPk/dGqQ5KfW0chqUYIbo0rZVS2QGbJc6FM74yr
         rUuOOMUijsxLOUwIE0a3d8h5n6/cBe5NcnXEj6dW/yCxN3+zgzKwEjw5eQbyzglJiMxg
         pkzEVOxHOT5RoCn1CKb009b4QxveO/qzhpONI8KN2WbxI7sao/WTRIyToDqfd2BrRfAr
         eLBDfdyGgywbIFMfqlQgrY8iGLTrbY2veOh32I7Fx5WR/eNiaSFENEus9eOSe4nu1f/M
         yMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wowZAjqS/cuX45wc7xLIh7K/X4PcjcI8fc642FZSdUc=;
        b=p3H9/E8ZJd3GkAkBJSRXB+OcwxSk6ygirT2RIPMT1BEYN12BlhqLoLdbAkxNG8MlZk
         3qu2mxuTfzkupsJh9gYlljzhdBXaImdm1NejD52I81cmedZcAhEcGgIpa4DNboWGlACS
         Gkhgbi3IjNuL5LK4cIhSEDn3GHtViHJKV0lJqGN47g6f48aIJgsEf6tn0asTrP/Kwbqw
         ka4fg6fEwEYhJgONqh4NB6JGfkYiFHqDhz3s9cVQnM5LYWIzm6NyLF+c5+2Ujm9LUA2c
         271T6t9ro5rqL5RmUkJCRBtaBuYvpDe0RwcKMQQKLIAuTbRL5sTBIDkdEOobekd9tNSR
         wzQg==
X-Gm-Message-State: ANhLgQ3cX6wibpPKRKmDaoSMnRDayAwvlKpkNUuqW0F2VtG+AkmKhNfG
	RY8i5Du3SpMOE98gRncYOMScLhmBPYZ+iw==
X-Google-Smtp-Source: ADFU+vsU2rgoCv326PTLNP1Gx2J6TtvG1gnyc2NiUPUTzMursfpPRk6MgxluVE76xVODXFUTcB02xQ==
X-Received: by 2002:a37:4808:: with SMTP id v8mr14477954qka.263.1584150869800;
        Fri, 13 Mar 2020 18:54:29 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 206sm18288839qkn.36.2020.03.13.18.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 18:54:29 -0700 (PDT)
Date: Fri, 13 Mar 2020 21:54:27 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: christopher.w.clark@gmail.com
Cc: meta-virtualization@yoctoproject.org, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH] xen, xen-tools: reproducible build compiler flags
Message-ID: <20200314015426.GC61675@gmail.com>
References: <20200309045656.16214-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200309045656.16214-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] xen, xen-tools: reproducible build compiler flags
on 08/03/2020 christopher.w.clark@gmail.com wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> The change to the method of passing compiler flags into the Xen build
> system in 6b697676 omitted passing the compiler flags for improving
> build reproducibility, so this commit returns them and includes a change
> to use the -ffile-prefix-map compiler option to remove host filesystem
> artefacts instead of the prior method of redefining the __FILE__ builtin
> macro.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/xen/xen.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index d863c8f..2a02805 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -101,12 +101,12 @@ export LDFLAGS=""
>  #   It must not be compiled with SSE compiler options enabled and the Xen build
>  #   explicitly clears CFLAGS to ensure that, so such options must not be passed
>  #   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
> -CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"
> +CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
>  EXTRA_CFLAGS_XEN_CORE="${HOST_CC_ARCH} ${CFLAGS}"
>  EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
>  # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
>  # in CC to ensure that configure can compile binaries for the right arch.
> -CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS}"
> +CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
>  EXTRA_CFLAGS_XEN_CORE_arm="${SECURITY_CFLAGS} ${CFLAGS}"
>  EXTRA_CFLAGS_XEN_TOOLS_arm="${SECURITY_CFLAGS} ${CFLAGS}"
>  
> @@ -155,10 +155,10 @@ EXTRA_OEMAKE += "${@['', 'XEN_WHOAMI=${PF} XEN_DOMAIN=${DISTRO} XEN_BUILD_HOST=$
>                      [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}${@get_build_time_vars(d)}"
>  
>  # Improve build reproducibility: compiler flags to remove filesystem differences.
> -# Suppress __FILE__ via an alternative builtin.
> -CC += "${@['', '-gno-record-gcc-switches -Wno-builtin-macro-redefined -D__FILE__=__VERSION__ ' + \
> -               '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
> -          [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
> +CC_REPRODUCIBLE_OPTIONS = "${@['', '-gno-record-gcc-switches ' + \
> +                                   '-ffile-prefix-map=${S}=${PN}-source ' + \
> +                                   '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
> +                             [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
>  
>  # check for XSM in package config to allow XSM_ENABLE to be set
>  python () {
> -- 
> 2.17.1
> 
