Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E98BC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 03:22:35 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.218615.1698376954644623785
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 20:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BKz5Voyy;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41cc776ccb4so11589271cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Oct 2023 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698376953; x=1698981753; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5t2XlDvDMEp1YWBp1r1VbBy3qh/nb7SQIkhFV0PEaKk=;
        b=BKz5VoyyJl9tdTH/ov1COw7ixWyEXQnHmbJVSayovZFTfWR+A3gfGBwqzU7kDsrPJU
         HVkDiU9/Nfm+i2AzS7bHFL07DavDrbmpJR65OlzKESdVPq3D9tID5LODPCDxQiZ5FDTO
         ITpuer3ZR6DEcdkGLjFesH+A+cg5d0wka/zVFHAeoxflf0WOwlKJLieU2ujhruOTi/2s
         shzMKTvbhKOVOdfRby5TZwErNPqWT99tw2DOM5NEa96NCRdEYtNVcGYhUHpuFd+ucYAr
         WmAbViS1pefiy4fcWcMYbaCnvV7k+ciIkFT2NjerXEo3Qij3QtdXIiDOqKx1zxAWkL12
         Su6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698376953; x=1698981753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t2XlDvDMEp1YWBp1r1VbBy3qh/nb7SQIkhFV0PEaKk=;
        b=gUFd/pPoixhbiDh601e9+Ow+n38I0WF0gsrt63ugfLaZIG4N74yXQ7jLzLCloru/V3
         /knpLN9uhuctnalvEi2lnTfvwqFvHN719S7lJy8XG4EtECBc1/Cr10qCvL0yPOXly8Pl
         J007h1cHQ2/q8MM4pCq7Vtpc3XXN+VKqNgQkwdwM4RNnM3yfXbbZaG1CcHO5jiSk6Udj
         AlISrFE7vzaJY3rzWHB4WmQ8KkS8CIErNUfWMUKv/zNv/xlW5/ASqoBPpNSfd+G+tZIu
         +zGdUcHBAuuiAuOK5Eqvan9EQ2LaT3p5I/JS07Nh6hZE4lfjR+X4IYYw8M5V3KuWyM6/
         wpTA==
X-Gm-Message-State: AOJu0Yyg77VlrUbEjy5UK9bKjLMaUZKknWLJMbPi40UW5mspr/T7aJmF
	bjqwEb43/GPPjnktoXqMgfMEE1npmHaaRDdd
X-Google-Smtp-Source: AGHT+IGPM2LzfjwDQ5BUkhmnJAHIZfIA+LTqbercM54lPZ6GopioEPIt02Xk0qfSJwwhIva8j5jVOQ==
X-Received: by 2002:ac8:5bc2:0:b0:418:11ee:6315 with SMTP id b2-20020ac85bc2000000b0041811ee6315mr1751737qtb.43.1698376953509;
        Thu, 26 Oct 2023 20:22:33 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id q6-20020a05622a030600b004180fdcb482sm264349qtw.81.2023.10.26.20.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 20:22:33 -0700 (PDT)
Date: Fri, 27 Oct 2023 03:22:31 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [mickledore][master][PATCH] cni: clean dir
 ${B}/plugins before do_compile
Message-ID: <ZTss905ikoIx1LhQ@gmail.com>
References: <20231026114349.57798-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026114349.57798-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Oct 2023 03:22:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8402

merged to mickledore and staged for master.

Bruce

In message: [meta-virtualization] [mickledore][master][PATCH] cni: clean dir ${B}/plugins before do_compile
on 26/10/2023 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Clean dir ${B}/plugins before do_compile to avoid cni generated binaries
> like /usr/libexec/cni/bridge has wrong dynamic linker path and reports
> error like: /usr/libexec/cni/bridge: no such file or directory".
> 
> Reproduce steps:
> 1. bitbake cni
> 2. enable usrmerge feature in local.conf
> 3. bitbake cni
> 
> After step 2, GOBUILDFLAGS changed,
> "-I /lib64/ld-linux-aarch64.so.1" -> "/usr/lib/ld-linux-aarch64.so.1"
> 
> But "go build" seems only check if the cached packagefile changed, since
> all not changed, the dynamic linker still use the old one, maybe go
> build should improve this.
> 
> Clean dir ${B}/plugins to trigger rebuild of the binaries here.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-networking/cni/cni_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index 71880cd1..a1a31f2d 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -53,6 +53,8 @@ do_compile() {
>  	done
>  }
>  
> +do_compile[cleandirs] = "${B}/plugins"
> +
>  do_install() {
>      localbindir="${libexecdir}/cni/"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8399): https://lists.yoctoproject.org/g/meta-virtualization/message/8399
> Mute This Topic: https://lists.yoctoproject.org/mt/102197983/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


