Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84516CDB479
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:52:13 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.24952.1697050328192853122
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 11:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gxI8utU+;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-419787a43ebso1142401cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697050327; x=1697655127; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJQOWRr5kIRRZ4RV5jinu+bqp9mulNkCo8+5xJssbfg=;
        b=gxI8utU+EMpeZGDh9JbDOmGyuh+wneWOFHRPRZSI95CyV98ZbVTclUXqfX2dJwNmuC
         KkOxRhZyTEPXiFDZ4p44HHThugmMgDVJ621tuK948D1Z6UNvSJyt49oyIjPYT++oj4pz
         E3wC6mfGcHWxKRU59CwQbc588NpeN6sTdtAaViZjy6YV8Yg3v6ZjXahrzZBlivVzFnBP
         jqCNgMsgiQJipk40W7/UTkUigrmzWiMkQ64t67fVYaSx2Q6coozMx8ECTAGOc/L7sixp
         gAkcm1SgpLtd+6kRmQ7lRwdmBtFMs2ELjsQeW+CNU9lj1Q0oiCvXGFq0Jvm6ojRQwLK8
         pCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050327; x=1697655127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJQOWRr5kIRRZ4RV5jinu+bqp9mulNkCo8+5xJssbfg=;
        b=QceGBzOEF1y+hc+laVyaReIydQm61Kukko0m3VokYDosrQlf8qNf2E0FAnEp0p7i1Q
         NnXTKVlEXuVzRss8ZztwFTOe2zFfomG9kcXqCreVA4g9HL/jwZPSp8Z/bBZtmJZS+KSf
         szq3xLwGI/FDys94lNtiM+U8m3CjzDttR77o6KnNpFaZ0YgC8PZE7ao3Mi9pZyAFHAmX
         7Ltf8/HEIuN7tEnrJzNzYpjO28tGBiFVi8+0ZVGXN5kD0tx7WOfVU8sNvN5fv/iikc9o
         MxpDjeeJ6x1JN4lxDq9kIeLhW5g4Z40MNiyucZImi44ALqYFK+CUp6iBvNR53Px8CDkS
         PC8g==
X-Gm-Message-State: AOJu0Yz1LauLU6EFnL6ywrfzt8Y1mRxz83QgKoEHqqdQSV8D3jSX5vXu
	mFm+TRbFZjVshA2p4SzYXCk=
X-Google-Smtp-Source: AGHT+IFgjBx+L7V4gpvmHSsdbBSGiEYII1IeYVLCj7vqjnBgVLgkrv09M1to+eR0rgZtcmLP+pVJyw==
X-Received: by 2002:a05:622a:58f:b0:410:ab6d:54da with SMTP id c15-20020a05622a058f00b00410ab6d54damr28589466qtb.16.1697050327172;
        Wed, 11 Oct 2023 11:52:07 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id n10-20020ac8674a000000b004196a813639sm5541087qtp.17.2023.10.11.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:52:05 -0700 (PDT)
Date: Wed, 11 Oct 2023 18:52:03 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick@subset.ch
Cc: meta-virtualization@lists.yoctoproject.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [meta-virtualization][PATCH v2] catatonit: update to version
 0.2.0
Message-ID: <ZSbu0/WQgS8/lOLr@gmail.com>
References: <ZSPs3QhJ+7TPatj2@gmail.com>
 <20231009153449.151855-1-patrick@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153449.151855-1-patrick@subset.ch>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 18:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8348

my update script shows a few more commits, but yes, not exactly
anything very exiciting.

This is now staged on master-next.

Bruce

In message: [meta-virtualization][PATCH v2] catatonit: update to version 0.2.0
on 09/10/2023 patrick@subset.ch wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Main change is the relicense from GPL-3 to GPL-2, which will allow
> catatonit (and hence podman) to be used in deployments where the license
> previously posed an issue.
> 
> Contains the following commits:
> 
>         7f0c9bb version: release catatonit 0.2.0
>         fe191ef license: switch to GPLv2-or-later
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  .../catatonit/{catatonit_0.1.7.bb => catatonit_0.2.0.bb}    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-containers/catatonit/{catatonit_0.1.7.bb => catatonit_0.2.0.bb} (69%)
> 
> diff --git a/recipes-containers/catatonit/catatonit_0.1.7.bb b/recipes-containers/catatonit/catatonit_0.2.0.bb
> similarity index 69%
> rename from recipes-containers/catatonit/catatonit_0.1.7.bb
> rename to recipes-containers/catatonit/catatonit_0.2.0.bb
> index da3973de..13537a4a 100644
> --- a/recipes-containers/catatonit/catatonit_0.1.7.bb
> +++ b/recipes-containers/catatonit/catatonit_0.2.0.bb
> @@ -6,11 +6,11 @@ SUMMARY = "A container init that is so simple it's effectively brain-dead."
>  HOMEPAGE = "https://github.com/openSUSE/catatonit"
>  DESCRIPTION = "${SUMMARY}"
>  SECTION = "base"
> -LICENSE = "GPL-3.0-or-later"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/openSUSE/${BPN};protocol=https;branch=main"
> -SRCREV = "d8d72fea155c144ed3bf298a35a1aba5625a5656"
> +SRCREV = "7f0c9bb45d3490c3e7f579833c9b0689f78c8923"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8343): https://lists.yoctoproject.org/g/meta-virtualization/message/8343
> Mute This Topic: https://lists.yoctoproject.org/mt/101854955/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


