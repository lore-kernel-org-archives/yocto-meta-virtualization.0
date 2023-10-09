Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76036E95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 12:06:29 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.59829.1696853182404307010
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 05:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqauZEjJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77575233636so300096385a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Oct 2023 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696853181; x=1697457981; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcIIibMqRkULMmgGWrYcItlhfZrMNLxihBahWBVL/pk=;
        b=ZqauZEjJNaWqHzJyfmaxUicBq2ASitBDnIeRK/TCPUzSi0nsBko41/N/Ox6l7jPvOT
         W2thsgQ8ZtkQK3h0banVuqdcML6IZS8RcCj/edJlmYNT84JiogeQ4SVvoW/0k3UzuR62
         b80VsZ6XckQt3OWro9K/D1igLaWlx6eVqTZxUbxJ4vnOPfVMoidJ/4eci3Yeyrhmk+4Q
         6RYquqJkN8eGbbaOSeHcTY7tLI/WoxRnRmlbD5UsRGYGj9fpclm1sHNkFoQSgbL5AODm
         v3vwZEZ1otQ4gyM1WtBIK46lpQgMAAENE81gc1wEiZiNjuK13YJHYWhsNgevhv4vD0PS
         s8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853181; x=1697457981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcIIibMqRkULMmgGWrYcItlhfZrMNLxihBahWBVL/pk=;
        b=ZR2jEHBdIhxGNHhW3va0KtT/TEpEbgNXHR6eRHV4ewNGYuWgaM2edh/euHlsA+YCzN
         ylKO9o6N94rv/L2MMEBfK8lO/gk+bBnSR4UR1yIgFFEP6AfTrljmmycIy+u1n6L2GfAH
         y/S5HktRoGzz9OMp5melijcsC1iPWhrgopUajF5Yv9ETXKiA7W5IWykpq0uJcTwDnik8
         dw17nJ9hdaNHg72+gp21bvRsWMf/rEOutDyNkH/F6VLfu8kUr+o9aixgKOP5yb0+QAIc
         KRDrpmqsHosOKsGCRHUC73aP6PEpjpx3YVAsby8GuSZXeaR9q9XUJ7iqEl8mKzpMOz3d
         nJgA==
X-Gm-Message-State: AOJu0YyJavfblzKzYcd68EBGclHREXFEBa/VCcC1r4WX7JbVMIFvkNpl
	fPmMFZWxzE9TjgHLSJFzEu0Wled9zF5hs/2K
X-Google-Smtp-Source: AGHT+IE7KuWD4QQxkkPqUwkpiEFE+9MZQFh1dTOiFCrNMRD/WKhMy9WnvHJJUGp3q7l6HL174AUEtA==
X-Received: by 2002:a05:620a:3953:b0:76f:456:38fb with SMTP id qs19-20020a05620a395300b0076f045638fbmr18372353qkn.31.1696853181200;
        Mon, 09 Oct 2023 05:06:21 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d4-20020a05620a136400b00774292e636dsm3473841qkl.63.2023.10.09.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:06:20 -0700 (PDT)
Date: Mon, 9 Oct 2023 08:06:19 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] umoci: Remove the buildpath issue
Message-ID: <ZSPsu9qH1ySRKhBJ@gmail.com>
References: <20231008080259.3346765-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008080259.3346765-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Oct 2023 12:06:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8341

umoci is really only a host tool (in the system testing),
which is why only the class native trimpath was applied.

Are you actually using it on the target ?

Bruce

In message: [meta-virtualization] [PATCH] umoci: Remove the buildpath issue
on 08/10/2023 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Pass -trimpath to the build to fix the below build path issue:
>   WARNING: umoci-v0.4.7+git-r0 do_package_qa: QA Issue: File /usr/sbin/umoci in package umoci contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/umoci/umoci_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
> index feaf6dff..e2116892 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -68,6 +68,7 @@ do_compile() {
>  
>      export GO111MODULE=off
>  
> +    export BUILD_FLAGS="-trimpath"
>      cd ${S}
>  
>      oe_runmake umoci
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8340): https://lists.yoctoproject.org/g/meta-virtualization/message/8340
> Mute This Topic: https://lists.yoctoproject.org/mt/101829789/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


