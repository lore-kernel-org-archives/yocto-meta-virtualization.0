Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4630EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 18:52:05 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.28507.1690311122352647098
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 11:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TrLISAum;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-76714d3c3a7so571128985a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jul 2023 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690311121; x=1690915921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1qgaxRT7WN/s87mXeNLskvh62NpJqzs90ZWpq8ndco=;
        b=TrLISAumHMyAylH90oAOMejWfJNJOEItO6xYHQ1n09fu7tyj9+FkrEDx9xisNrpsC5
         eXCmfwv3t0hnE8Sj2ZRrdYdxAFiIMS2hRdV1YbnF20aHIGTU/fCYkBDOAOIREp51AHr9
         ySdmf5WXuuGLn2oBb9XOhlF7NNnAentRkURwWyz7yFiQkLV6ki1rYqAPFhT1kn3PuVgL
         9ltrDufbthqlZZja/bA6n13AphPGnpDaQO0WCu6mrH+ZzlxIol+AFKPfqb9xfcE9KD/W
         LS8ncO177b9PE6ruK/5OWcVoEdX8wm7OnLkKeQZORx+XWGo3o6BxOx669XPclwOS/UTn
         TpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690311121; x=1690915921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1qgaxRT7WN/s87mXeNLskvh62NpJqzs90ZWpq8ndco=;
        b=XVsJirzzUKVeE6gZQsvFWKfpY0lnRXNkw7o8s7lT70Ajx8glcuP/peqIdkaQDhaZMI
         OtwnvXsAkUzKlJFVt6YiB1Kl39/Odvawc0No6jXOvSaQe6GDYLUpVVVl9bsZhTmECc+5
         39Ntowx8/caZhyoueDK3dcGFFNbJOLmCdo+oXyN+sNHeT4qS6777a79Mp6dBRH1Cr9f5
         nG8a3IIenGhS4t37HnK2R7Jb5FMKzwuDuy70HduPAAYotQP3n/x/p8MmD02wVgUhfM1t
         97wMmbOr0U6eJxlAq/d3psasXNTgtv+q/XbuUHWkoP7KRi5gwBQ0vd1pRUuDPbDMjWPf
         cbxg==
X-Gm-Message-State: ABy/qLaXeLNBYrR0RkLRgjE43lZIKIa9J76N6OJ5yfJIB9QmFiUHfTZJ
	1XI581Y45sZpDV55BIXsf54=
X-Google-Smtp-Source: APBJJlFPDLNKVng8GzybukLFI5JcG1sU+qbzcIL4XJ4RaP4AJR3U0l7c5e+Q1cRibHMV5WML4LAykw==
X-Received: by 2002:a05:620a:232:b0:763:c8be:819b with SMTP id u18-20020a05620a023200b00763c8be819bmr3581916qkm.22.1690311121279;
        Tue, 25 Jul 2023 11:52:01 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id ow4-20020a05620a820400b007682af2c8aasm3852606qkn.126.2023.07.25.11.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 11:52:00 -0700 (PDT)
Date: Tue, 25 Jul 2023 14:51:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] kubernetes: set CVE_VERSION
 explicitly
Message-ID: <ZMAZzwyUn4Vi5Sjq@gmail.com>
References: <20230724031548.2485517-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724031548.2485517-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jul 2023 18:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8133

We could also do this programatically via a simple
inline python, that way it won't be missed during
uprev's.

I'll take care of that shortly, as I'm upreving
packages at the moment.

Bruce

In message: [meta-virtualization][PATCH] kubernetes: set CVE_VERSION explicitly
on 24/07/2023 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The CVE_VERSION defaults to PV, but in NVD database, there's no
> prefixing 'v' in database. So set CVE_VERSION explicitly for better
> CVE scanning.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 8b7c9e0..fefb2c1 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -6,6 +6,7 @@ maintenance, and scaling of applications. \
>  "
>  
>  PV = "v1.27.1+git${SRCREV_kubernetes}"
> +CVE_VERSION = "1.27.1"
>  SRCREV_kubernetes = "2555e0f90e80a13628f47eca5cde34decc89babb"
>  SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
>  PE = "1"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8130): https://lists.yoctoproject.org/g/meta-virtualization/message/8130
> Mute This Topic: https://lists.yoctoproject.org/mt/100322950/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


