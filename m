Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBE1C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 18:35:10 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.62266.1697826904340978583
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 11:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A7qapEoJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ce2fc858feso730976a34.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Oct 2023 11:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697826903; x=1698431703; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VomWzJlM0DP/xrJyVRSWo/pOVhm6pub3f02Mu+uqQtU=;
        b=A7qapEoJEDz93kaUvmg4eYDRXGncEi3qwYpIri+C82d1CpWKzjOm/BXKHwzr/Zg6j4
         pBc4CpKDwSNdMknCGf0v4g3AsU504OEuerXKAX20zhR8iK9EV8+zsA5ncoyRSyQ0eQ9S
         gpsG72Fk49ChKKTHzA0BdzjRmDQ4YUNsaiWVKSdbl3WNF2uKOpmoFpJXHElOvCSgTHnC
         bkuszjQXwWoXx4+mSJlJQRIFoXys+ieOfzIfLmqOxpLMJhFxy16NJFGBfSgyjT093CA1
         wnWPQm536KxXqjbp7Zl8NLcwo8BpDS2b0ziQmvGxui7rr06itDbX+Hh2Fbgre5SzN8hv
         yOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697826903; x=1698431703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VomWzJlM0DP/xrJyVRSWo/pOVhm6pub3f02Mu+uqQtU=;
        b=d9Q4HaDInwtj5KP32pLHpQsSfS2LbZ4N+F/Fk8JKN3fG4g59WzkHx9ZmCmmR5gAKOP
         DuR7gMoak6WU0qEjENbLMnen7p+CZK7H6XcoRbQNiOnYW95fOUvoCBrlMJjnh4A5d39P
         1lQYqnCLoFMdNI4Bd8UyhXDzW8P86D82k2v+b9OTHTAM9HaYpKcYM6eH52EugKvJmjLO
         0nxHKc/hk3oWpwgWFCYOF3lSKL5oNFb/vynw06f0QTsW+n4z61DepoagOLr06gfQbFhO
         grQUAfAFHpJ5i6QTSYofGASUxS1jUIKX6uw32VqaF4SAqF6t9WzwiksxE99LLR3p0P+z
         fjyw==
X-Gm-Message-State: AOJu0Yzeoj0naMryFKUhS/51HkaacbHYC6rxxkgyvOd54MaqqMPGG4/I
	WHtmIPD1HvEmOlguLIecwU4=
X-Google-Smtp-Source: AGHT+IGi8A/ph81S9erJrA4Kdfywt2zuk23jGVtbi7woc5V8RstOMXCYNtGUFK3WSVydR4tOrzNMlw==
X-Received: by 2002:a05:6830:11:b0:6b9:4516:7d1e with SMTP id c17-20020a056830001100b006b945167d1emr2723203otp.30.1697826903336;
        Fri, 20 Oct 2023 11:35:03 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r13-20020a0cf60d000000b0065b12c7a48dsm874147qvm.133.2023.10.20.11.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 11:35:02 -0700 (PDT)
Date: Fri, 20 Oct 2023 18:35:01 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: soumya.sambu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][mickledore][PATCH 1/1] kubernetes: Upgrade
 v1.27.1 -> v1.27.5
Message-ID: <ZTLIVb+5KPDIjXnd@gmail.com>
References: <20231019095052.1389561-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019095052.1389561-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Oct 2023 18:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8382

In message: [meta-virtualization][mickledore][PATCH 1/1] kubernetes: Upgrade v1.27.1 -> v1.27.5
on 19/10/2023 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> Addresses CVE-2023-2431, CVE-2023-2727, CVE-2023-2728,
> CVE-2023-3676, CVE-2023-3955 and few other bugs.

Whenever targeting a CVE fix for a release branch, commits should
state whether or not other branches are vulnerable, and at the same
time confirm that there's a newer release available in those other
branches (typically that is why they aren't vulnerable)

> 
> Changelog:
> https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v1275

As you can tell from the other commits in the layer, linking to a changelog
isn't the preferred way to document changes. They aren't searchable when
done in this manner.

I'll wait for a v2 with the changelog.

Bruce


> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 3a6e7119..560fd8b7 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>  
> -PV = "v1.27.1+git${SRCREV_kubernetes}"
> -SRCREV_kubernetes = "2555e0f90e80a13628f47eca5cde34decc89babb"
> +PV = "v1.27.5+git${SRCREV_kubernetes}"
> +SRCREV_kubernetes = "93e0d7146fb9c3e9f68aa41b2b4265b2fcdb0a4c"
>  SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
>  PE = "1"
>  
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8381): https://lists.yoctoproject.org/g/meta-virtualization/message/8381
> Mute This Topic: https://lists.yoctoproject.org/mt/102057034/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


