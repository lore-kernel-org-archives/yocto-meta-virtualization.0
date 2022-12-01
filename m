Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E958CC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 21:51:06 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.58453.1669931462000728671
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 13:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GEjd6uVW;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id jr1so2745325qtb.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 13:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfPHbIzbJwlH5lOhGfaZdpdyi5zdmRPvMfVDIJ08DPE=;
        b=GEjd6uVWy+izjVPIoqmlgIpyOcsFE7FT6cuGCKKvwAVjEf10ByLyr+TpWZ6/8phH/D
         ZgCZZG7wu2Dyre9oiCvsSrDxN2mCTj5RjlNrVSm/K3nPqO04M3h71aSe0tLcSbYt9vOm
         r4d/8pxXsdj64M18E/rreHbEslTtvTcqEI4vuBOPMnTlzzwMBFRHd25USrBlcukJBlS5
         cuKsbHb87K6z2Q0c2heTkb8Wko91VXvzKv1+tBhP6LEcbz4pnwURc9/xFDWx23p1PO04
         qeKcme2Urcv6+bjuJ/6i19IbFUiUrzwxRESxJEWYPvDdAYoMS3+4hJmapSmRpOv0ISLh
         bGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfPHbIzbJwlH5lOhGfaZdpdyi5zdmRPvMfVDIJ08DPE=;
        b=HcLpGkFWKn0WdhYzcnz6u2yYgBlkqMgVnO1incDeJ8LK2xekHbA/CPIyEDp4CH6hoc
         4qvPvVaJl5bhTquidOXit7eedrKfpuxTHmil4bY2YK+yitWlmN8s9cBIG/PEztFKjbgS
         ajEU4het8recAjp2SASvABGZNvmNaUFRHKl0v67apwANCzoM9T50MfH5vvDUhgTYfHey
         bx/qvN5I2y1O4szXNaiNZDum5DbsPI581/TFi8rwgIhXMlOiD+SHjaeSiNxKplXNC4Z8
         l9Y1etuVA2tA8WYJwPQTQaipvY7rsiQcBVL52+SzNQ+57fT3jrjajiSPVLrOQ9zmz/9f
         6H5g==
X-Gm-Message-State: ANoB5pmPfn1ILW8B85q9FvqhDT1XjOsELR+lJ0YHclm0ZHnKpNcZgJm3
	mG341g+pVHXmYoxu39HvOGB5+FM5BoPBbA==
X-Google-Smtp-Source: AA0mqf58/GWh8yE8OMS+LiCdDkDB2DxpaF1J2SoDfiJq9e/e+a7Cgeo0zmB6jSd26qx4Zct+k9Md8A==
X-Received: by 2002:a05:622a:8c8:b0:3a5:7de1:9708 with SMTP id i8-20020a05622a08c800b003a57de19708mr63654251qte.616.1669931461066;
        Thu, 01 Dec 2022 13:51:01 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id k25-20020ac81419000000b003a569a0afcasm3083916qtj.66.2022.12.01.13.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:51:00 -0800 (PST)
Date: Thu, 1 Dec 2022 16:50:59 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][kirkstone][PATCH 1/2] libvirt:
 Update bbappends version from 6 to 8
Message-ID: <20221201215058.GC30616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130211623.3617596-2-chaitanya.vadrevu@ni.com>
 <20221130211623.3617596-1-chaitanya.vadrevu@ni.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 21:51:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7725

merged.

Bruce

In message: [meta-virtualization][m-c-s][kirkstone][PATCH 1/2] libvirt: Update bbappends version from 6 to 8
on 30/11/2022 Chaitanya Vadrevu wrote:

> meta-virtualization has upgraded libvirt to 8.1
> 
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  .../libvirt/{libvirt_6.%.bbappend => libvirt_8.%.bbappend}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_6.%.bbappend => libvirt_8.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
> rename to meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7717): https://lists.yoctoproject.org/g/meta-virtualization/message/7717
> Mute This Topic: https://lists.yoctoproject.org/mt/95368504/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][m-c-s][kirkstone][PATCH 2/2] qemu: Update bbappends version from 5 to 6
on 30/11/2022 Chaitanya Vadrevu wrote:

> openembedded-core has upgraded qemu to 6.2
> 
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  .../qemu/{qemu_5.%.bbappend => qemu_6.%.bbappend}                 | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/qemu/{qemu_5.%.bbappend => qemu_6.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_6.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
> rename to meta-openstack/recipes-devtools/qemu/qemu_6.%.bbappend
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7718): https://lists.yoctoproject.org/g/meta-virtualization/message/7718
> Mute This Topic: https://lists.yoctoproject.org/mt/95368506/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



