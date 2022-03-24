Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C06C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 12:51:54 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.10225.1648126312797337698
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 05:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KtC7BldQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id h196so3385064qke.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ykw9Z8DD29EB3XHgsmveKuM8h3sb8Jex2EBSJj232ow=;
        b=KtC7BldQJDE4v3mbwnPraTMALjQcfPpY2je3UTlpphSHOECNufLiClwKIfgIq0yEaL
         G90exEhfTPVXR9kpetVpbouMpqTtWhZDNGXrzwshWJdzzM4o6ZJat+fqvw+AgUAoN05/
         PmxyW5A9eg1AEs3Ts9Pzs5TvdJAKstnSlVBHiLFMG2rjyHbulow5EjeNVyfjJ5UyMIP5
         mxATmaNX+xQRTs62sRk5iyiYXkQ3ANARX/mjvwiAMI1E6DvKrJD8Onum9mLy8TMq8bZ8
         ieHzF/zwQWrbfrvTbgYt+jWTyGz6pHYoG4ZP1TFoD0JYh7vSzwWzgqjJLhzlIw+NaNw8
         ofTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ykw9Z8DD29EB3XHgsmveKuM8h3sb8Jex2EBSJj232ow=;
        b=XXBnxX8v5klKsP2r9JI/vH5OPDfupMYadQwXHekqKvCnnsSTKDA1pb+bIKoahnyOYK
         CIJZnrJHxbGlPmjC2b1Z48dDbCo59KMdCBKn6CUMsGUTITlh1CCNGMJwhldu1RpmsZc9
         oemsAJwMF9mCcQ4JaKWO010yiYAwtllgYT/DLOg1NyAZlfmVorFgPHQhcSWOIp8TOVMp
         SprKxJRG36lF6s8WORIiCKgIaNC3nQuoxOXj4KwFo8qj8vTwgLH9XEXLZepaovxyjI6U
         O6JkC1DR7rhU9fPDKzd5l+hIFQ22xpWcX30/sUMPkwLaMuMmJdYSsFghNnOxhXro+yM8
         xc8w==
X-Gm-Message-State: AOAM531hR68bjyCwPTI+NEIA/ZHbRDj9rknLR+OJxK5eb3W4sWhNuorr
	fLhoTO8j/8sNNh1DzL7NpIVAVZcHhVHpeA==
X-Google-Smtp-Source: 
 ABdhPJyMBQ2eM6HC56+7vgfDhOSqxIUjXsHSIJ5XqjkFzaw3Vgrmy4ZatIKllEVv+iaMWfm5jjr6Yw==
X-Received: by 2002:a05:620a:40cb:b0:67e:cdf4:5523 with SMTP id
 g11-20020a05620a40cb00b0067ecdf45523mr3143173qko.238.1648126311740;
        Thu, 24 Mar 2022 05:51:51 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 p68-20020a378d47000000b006491d2d1450sm1541817qkd.10.2022.03.24.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 05:51:51 -0700 (PDT)
Date: Thu, 24 Mar 2022 08:51:49 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V2] ceph: set CXXFLAGS and CFLAGS
Message-ID: <20220324125146.GA54203@gmail.com>
References: <20220322205443.65641-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322205443.65641-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Mar 2022 12:51:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7115

thanks for V2!

I forgot that I was testing with v1, and pushed it instead of
this .. but since the functional change is the same, we'll
leave it as-is.

Cheers,

Bruce

In message: [meta-virtualization][PATCH V2] ceph: set CXXFLAGS and CFLAGS
on 22/03/2022 sakib.sajal@windriver.com wrote:

> In oe-core, the commit:
>    a83623a54a Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"
> 
> drops compiler flags overrides for all cmake-based recipes,
> causing the ceph compile to fail with the error:
>   ld: cannot find crtn.o: No such file or directory
> 
>   collect2: error: ld returned 1 exit status
> 
> Add the override back for ceph to fix the build error.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/ceph/ceph_15.2.15.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index c72953a..17dbcf3 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -66,6 +66,9 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
>                   -DWITH_REENTRANT_STRSIGNAL=ON \
>  "
>  
> +CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +
>  export STAGING_DIR_HOST
>  
>  do_configure:prepend () {
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7105): https://lists.yoctoproject.org/g/meta-virtualization/message/7105
> Mute This Topic: https://lists.yoctoproject.org/mt/89962111/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


