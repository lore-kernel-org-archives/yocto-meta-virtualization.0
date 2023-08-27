Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB3FC83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:30:43 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.27098.1693143034205558347
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CHILBa82;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76d93cf8e13so163429385a.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693143033; x=1693747833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QRBmIYAKB5RerjF0tFmoZ/DcFMQOz6/0lyW37Ywj/So=;
        b=CHILBa827zJdpT+mjvWsSif4btyp2rz66y9Zbo2nehjrPmEvxJTs4ZNAUEbr8YEI2W
         82wpdlpdbMJR8kQs3VGRs2RHDUBHA56RQyIjXO8OxYxrYe1bStjymzvdw7SkAlCRlJ4j
         D4UcVw4++0Du59NHKpOO7h8gg7A6FtTH7/Rs04RVMY6XFdtG5tN0jkoxuVzKYZvPMAOJ
         iU2GpUWXLnAzT5ikfp7bjvta8oJM/KafnYaYMut2CwVK7+kQlZfgl1GlMj1BIdRrPzXL
         bA/AJvjwSgq4qxU3J/tl/S4QQL6gK/Kz56858DgJb4tZnnxw49hGy/Kev+Vv79ghTkwo
         2YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693143033; x=1693747833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRBmIYAKB5RerjF0tFmoZ/DcFMQOz6/0lyW37Ywj/So=;
        b=bmW/vGzfddShUYvsclgBsRLTNhjvs1ZHYYdQFKuGq99e3/b8/aEC3Ih4UL17TGyVCr
         rJbXxuQZlByH/p2E8oYI5DrOS09DfKOF7neVPfuVAL51DW6mzJNt7GjJPzRWaXkBGH5R
         e6BDa09UWtjnrupIqDPM9p7Ebjlr8k6lqpidktEyoGUI3J6VVrW9DkShp+0irE6DEu7R
         ldoUcE04f2RoauAlbCEiUBzGuUSvWLXUp9ENw75c55ePULftsdKtUw+LLWpGIIYCrLiF
         EHl3Vf/jkHZnffWFcR0arGZixBOstXUc8HeD62dK+j6SeEQSjZdqEG3lU7mP5dABe58r
         SqOQ==
X-Gm-Message-State: AOJu0Yw4xewWVEdpqgZ4eZ0j3cRHlaAJB98KB0D2w9/s80NK8K1ErqJi
	sMphhGqtsF90Xemoqfco1x0=
X-Google-Smtp-Source: AGHT+IHVpTLf4JrhupR4rybHxNTbFkhAiXYc/VxC0Gz6u+4BrcO0WZzGAlrD4Z/p9cZqfi+OcQEnDQ==
X-Received: by 2002:a05:620a:1987:b0:76f:11d5:6532 with SMTP id bm7-20020a05620a198700b0076f11d56532mr696301qkb.76.1693143033180;
        Sun, 27 Aug 2023 06:30:33 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i5-20020a05620a144500b0076dacd14484sm1744479qkl.83.2023.08.27.06.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:30:26 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:30:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to
 fuse3
Message-ID: <ZOtP7s2ivBE4sp+A@gmail.com>
References: <20230824081002.6730-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824081002.6730-1-f_l_k@t-online.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:30:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8240

In message: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to fuse3
on 24/08/2023 Markus Volk wrote:

> Using fuse2 and fuse3 in the same environment can be problematic. Most
> projects I know of now support fuse3. ostree, flatpak, xdg-desktop-portal
> and some other recipes in meta-openembedded are configured to use fuse3 and
> libvirt is also able to do so.
> 
> This commit switches libvirt to fuse3 to reduce the number of recipes that still use
> the old version.

I had previously updated libvirt to 9.6.0 in master-next,
so I tweaked the patch for that version and applied it to
that branch.

It is worth re-testing master-next and 9.6.0 to see if
everything still works as you expect.

I'll be merging master-next to master next week, once I'm
back from holidays.

Bruce

> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/libvirt/libvirt_9.2.0.bb
> index 5e70470..9b5b2de 100644
> --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
> @@ -156,7 +156,7 @@ PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,"
>  PACKAGECONFIG[python] = ",,python3,"
>  PACKAGECONFIG[sasl] = "-Dsasl=enabled,-Dsasl=disabled,cyrus-sasl,cyrus-sasl"
>  PACKAGECONFIG[numactl] = "-Dnumactl=enabled,-Dnumactl=disabled,numactl,"
> -PACKAGECONFIG[fuse] = "-Dfuse=enabled,-Dfuse=disabled,fuse,"
> +PACKAGECONFIG[fuse] = "-Dfuse=enabled,-Dfuse=disabled,fuse3,"
>  PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit,"
>  PACKAGECONFIG[libcap-ng] = "-Dcapng=enabled,-Dcapng=disabled,libcap-ng,"
>  PACKAGECONFIG[wireshark] = "-Dwireshark_dissector=enabled,-Dwireshark_dissector=disabled,wireshark libwsutil,"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8226): https://lists.yoctoproject.org/g/meta-virtualization/message/8226
> Mute This Topic: https://lists.yoctoproject.org/mt/100931588/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


