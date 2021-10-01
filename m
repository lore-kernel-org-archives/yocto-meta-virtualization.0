Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.2795.1633055792865629648
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 19:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NVNM9JcQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id t2so7669677qtx.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Sep 2021 19:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0UKE+8zpo7QjF/4banMqYj/eNrzBiojtx7IoWYufjfY=;
        b=NVNM9JcQRfjFHKATs3+jcM+IW3hIbuo2rGWt/LU7ZoFAKwTlkyRD32GXiGntodG4tY
         +57sFhpfy8rgV+8VEry5qsgJDhJ6NdZwTj53bvg1DUbSLe6rCHnzYG0I1EM1sSp64jOq
         q8D4eCN6CChZWy38CJWlP1v/HBGhksbt4p2N4I+t4IZEFhTTpysiBxiezUQIDPdZ2gkY
         L4RozgclVHbUE4gS5Z7t5IAzBgi6P7capwTeX5N8F8yIR3V/nF7SIjzsHcgbg+Ag7RJ5
         nMPa+tUpeCqgfJ5zyuu4p5qlNy20cSs1Bz5/M80B4Hvw0HXQhBdHi+Wi+Sk4BlHDytXD
         /48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0UKE+8zpo7QjF/4banMqYj/eNrzBiojtx7IoWYufjfY=;
        b=hYJouayqLPlPptjU2ie+mmP+pbSaTp+s5GvgClDK/Z1j3uRB5Yoni/J4rsql5fFGOJ
         ZLjcq3alMiheiZcWr1slCToCe8WKPfLVkiMT+ZoSq+npMoSyfxtjFDJnkXH0M2t31AFd
         fdl/6iKhfxCBCdNjWjldqCQcEWtuU8TSFSHuLrqMtrwEadD6EcLGHzCvrCCFpc1ljB54
         OgAJEyvGFONpZRdsmJAjt2Z+B4QuJ7lOyGPqkRENsPgwneflv/IWlyxXXl+cVNXyjo55
         kym1PQ66wQ7OhZ08o1ebCd+xB8i81TvXqvghmGfKv6Uv+fBAShq0vfj3yuC91pFt7FBI
         Bjxw==
X-Gm-Message-State: AOAM532RW6eIjHoiWXch57ZvvT2Bxobh4vOgbhIiEkXoDVvuCbon9MKV
	n4O1MFH6q+5VY7J0ie6mXJE=
X-Google-Smtp-Source: ABdhPJzXDyvfinb5/hxsev4B1qj3iUTNNqwPh03nqxQajnWqB5cE3cHuIRilwunv5Y93saJ4jBCawA==
X-Received: by 2002:ac8:408b:: with SMTP id p11mr10185808qtl.87.1633055791918;
        Thu, 30 Sep 2021 19:36:31 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id x10sm2684559qtq.45.2021.09.30.19.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 19:36:31 -0700 (PDT)
Date: Thu, 30 Sep 2021 22:36:29 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] oath: inherit pkgconfig
Message-ID: <20211001023629.GB11771@gmail.com>
References: <20210930084950.41628-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210930084950.41628-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've been watching for these as well, but haven't gotten to doing
my 'all' builds to trigger them.

Out of curiosity, what level of coverage do you end up with on
the meta-virt layers ? I'm just trying to scope out how many more
of these may be lurking :D

I've grabbed this, and will push it shortly.

Bruce

In message: [meta-virtualization][PATCH] oath: inherit pkgconfig
on 30/09/2021 Martin Jansa wrote:

> * Newer oe-core doesn't pull many default dependencies anymore:
>   https://lists.openembedded.org/g/openembedded-core/message/156185
>   add explicit dependency on pkgconfig through pkgconfig.bbclass as
>   we're using it here.
> 
> * fixes:
>   ../../oath-toolkit-2.6.2/liboath/configure: line 30585: PKG_PROG_PKG_CONFIG: command not found
>   checking for gtk-doc... ../../oath-toolkit-2.6.2/liboath/configure: line 30595: syntax error near unexpected token `$gtk_doc_requires,have_gtk_doc=yes,have_gtk_doc=no'
>   ../../oath-toolkit-2.6.2/liboath/configure: line 30595: `  PKG_CHECK_EXISTS($gtk_doc_requires,have_gtk_doc=yes,have_gtk_doc=no)'
>   configure: error: ../../oath-toolkit-2.6.2/liboath/configure failed for liboath
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/oath/oath_2.6.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/oath/oath_2.6.2.bb b/recipes-extended/oath/oath_2.6.2.bb
> index f423044..d568ec0 100644
> --- a/recipes-extended/oath/oath_2.6.2.bb
> +++ b/recipes-extended/oath/oath_2.6.2.bb
> @@ -12,7 +12,7 @@ S = "${WORKDIR}/${BPN}-toolkit-${PV}"
>  SRC_URI[md5sum] = "4a05cd4768764843bd5493609a6bdb17"
>  SRC_URI[sha256sum] = "b03446fa4b549af5ebe4d35d7aba51163442d255660558cd861ebce536824aa0"
>  
> -inherit autotools
> +inherit autotools pkgconfig
>  
>  # Specify any options you want to pass to the configure script using EXTRA_OECONF:
>  EXTRA_OECONF = ""
> -- 
> 2.32.0
> 

> 
> 
> 

