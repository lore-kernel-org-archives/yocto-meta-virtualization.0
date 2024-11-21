Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87046D75BBA
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:44:30 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.3876.1732164265964354210
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSSmXRje;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-460b04e4b1cso3469481cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732164265; x=1732769065; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mh/+lHVQWUL9aNSuVIdP5PV4UmlHPRjnGv5/gT5zTmI=;
        b=VSSmXRje4xLCAur7zzzUCAcl91suI7kskWytOcokK37DUwbwcLJWQkzstSLyku3wJO
         J9DtjUaGrWD/+UcwqberPiGRJYmHzdgNTBIIedoMCvnQFMHafCfoVVgC+BZHC+BtEQ2z
         IPhgKE/3X8Iwru9asWHdSy3co1GLePNQVqPwB2Y2zT6qXvRVmHX/mg+wMvMmV/R88Ccu
         YwvNxEzZtqSwAP65DNlgC+3yk0qpYT9Yd04fzSP7Pq+SKD39pRGCG2R3E5eAdybdJ5Qu
         m9h/4bJdvsaT3+7kCilmFHJO+fS+Ll9JeyvIwKPy3zgid1Jj2ZiTdi3N2XWJXL48ab91
         FGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732164265; x=1732769065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh/+lHVQWUL9aNSuVIdP5PV4UmlHPRjnGv5/gT5zTmI=;
        b=mhZAhDqTNQlCkO44v8qNqTP20lOYOGPWGKmHrgcP1kmbPOdpDItjfOwsMAJ1LnnyOY
         oKfV/cSipaZpSMBqOOgRksRClD5puJSNZIksAejBjaTxSAM0JU/ZPR1b0HQthILfXaPe
         DDmF1ZIqukcf6G9HJWa68vxddH8MYt3CGfZaSR/vi61HxgBZwmWhPOMzsVfOPCkyU4CX
         Sis68glzX185c0Wu0WeW8E0ubw5f72EM6C/GpB8peLm1UK5yZZ+BBCskf6kR3EIWLboC
         W2MTCUNSDS3ua2uqcQVDXeBWc6Zo6W+DZVxX1C9zWaMBKEcexw8uJGMtZ2PueIDSI+6Q
         zVvg==
X-Gm-Message-State: AOJu0YwRETfYmXM8+puydxDVQ1hgko7kMbQImQKhJZfQF6q2GKKW9ZZT
	/2Y3OKGnNBXcIpiLari4zZ0AxNwmElBZ394tiWiZzSeGywIJmMJR
X-Gm-Gg: ASbGncsVQ95ABY+R/enmnU26cHE5yROIjXW8CE+T2fQhru5svTU1iN1vrSW/N0yquwL
	rfuNly8kcwCNWMbFIncDhLoAFmNLCmZwBi9EfzQPHGgzK+2VbvovUEjOEps+XJY7zDsnYpToIkZ
	xC1wRVR9KQwyYMqie0pp3wHnVFfKCfK4Z4Fdb5E/1r4UQOa7CoVpcRsp+ETRYBXS+3POXU1eGT9
	t5GAIegNLvT1xhEbQTcokYUXPAJdCmitcDYC44qAsYUjU0LvjoxrT4+lIL7/JTfJKeBgxhm3uNh
	sqWrULaEf3/HzQnn2bgKF82/LK9A
X-Google-Smtp-Source: AGHT+IFDA+vGS7+NyUpClD9JQ1rTxegKjL49yqHuI6XZu3ARfkOg++oAxC0klMQwYyYF1qvJ4MiqOg==
X-Received: by 2002:a05:622a:22a2:b0:458:4a68:7d15 with SMTP id d75a77b69052e-46479566e3dmr77121961cf.44.1732164265025;
        Wed, 20 Nov 2024 20:44:25 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b479d53086sm166447585a.42.2024.11.20.20.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:44:24 -0800 (PST)
Date: Thu, 21 Nov 2024 04:44:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH 0/6] Add
 bbclass for xen boot script variables
Message-ID: <Zz66phxMLOMSfZhN@gmail.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:44:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8993

In message: [meta-virtualization][master][scarthgap][styhead][PATCH 0/6] Add bbclass for xen boot script variables
on 18/11/2024 Sandeep Gundlupet Raju wrote:

> 1. Add xen-u-boot-scr.bbclass for generic xen boot script variables
>    use by any soc devices.
> 2. Inherit xen-u-boot-scr.bbclass in xen-rpi-u-boot-scr.
> 3. Move xen variables to xen-boot-env.inc file in xilinx
>    dynamic layers.
> 4. Include xen-boot-env if BOOTMODE = "xen" switch is enabled.
> 5. Add load address to boot.cmd.xen script echo messages.
> 6. Inherit xen-u-boot-scr bbclass in xen-boot-env.inc.
> 7. If user brings in their own boot.cmd.xxx file they can just
>    inherit xen-u-boot-scr bbclass and use the generic xen boot
>    script variables.

Just one request for a slightly different bbclass name
and a question about BOOTMODE.

A quick v2, and I don't have any concerns about merging
the series.

Bruce

> 
> Sandeep Gundlupet Raju (6):
>   xen-u-boot-scr: Add bbclass for xen boot script variables
>   xen-rpi-u-boot-scr: Inherit xen-u-boot-scr bbclass
>   xen-boot-env: Move xen variables to inc file
>   u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
>   boot.cmd.xen: Add load address to echo messages
>   xen-boot-env.inc: Inherit xen-u-boot-scr bbclass
> 
>  classes-recipe/xen-u-boot-scr.bbclass         | 43 +++++++++++++++++++
>  .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in  | 10 ++---
>  .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 13 +++---
>  .../u-boot/u-boot-xlnx-scr.bbappend           |  7 ++-
>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
>  .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
>  7 files changed, 97 insertions(+), 50 deletions(-)
>  create mode 100644 classes-recipe/xen-u-boot-scr.bbclass
>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
> 
> -- 
> 2.34.1
> 

