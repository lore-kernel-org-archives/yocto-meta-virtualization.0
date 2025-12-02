Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36ACCCFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 04:43:57 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.688.1764650636785635736
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 20:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8uLMtiL;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-882379c0b14so39774986d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 20:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764650636; x=1765255436; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJfBIUjONZ6adZT+20mLC0sZ0J37MbnsUhiNPQ0MQPA=;
        b=C8uLMtiLqwWOHYhvaERP407f6AXP0/EhgZV2EuaOYTl5zwL5GjSj/Ex7AY63+oWxcf
         TBF650LBVVPXTIB/A3pqLUjrrI4rTO6NlgJMQxK32hmLQB5DPakNgkyPLu6a/vJ+kIwJ
         6k6nUJG8k1O/q8PkkAVGOQuRmx75Yv4DhBbqKR3ichoDnv3o8FyZN3GaXVWFbZ5A6qdg
         8mC+U6wI4sjQTXqgAngugLNUTu31Dl/C2Px6X+IDqckycplJ6PCNityfp8cJhOE9MfVw
         RXcHIkTnikyvyuoUdOKfMdn8DeATodk4zXZA44ueAFMDKpFVEu+9hrUc/2cE3wC68h7X
         TntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764650636; x=1765255436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJfBIUjONZ6adZT+20mLC0sZ0J37MbnsUhiNPQ0MQPA=;
        b=MHwmz2SMpu3wzkmnVwTQVCtJJMJjO9AYMfKmIaWqQLu9aUXBKVFEbL2wMAnkBd83op
         fR0vf4BhJEk9QxH5DVQ5DDF/GmBDIRyHB+D3NqS3A9+9wmuvq8JnmZPKugbs8SP1fViO
         LXE7a34yGsPB2rdy0W6kP9wENFDPSKwKXnfqpCHk2nvLmFIV0HNE5ktSfc7nnzajyfqW
         4ZOWpx7QMHaWFSRIYxfe3m0vwEfS4PJsWAufD5CrA0wcnE/czEPimbIgViUHZpkOYUOp
         Wyg6ahHJg5I1FATFR3A2hbSWKZOhchsCT6QuGq+Q1iyen0p3fYU/mhOGmVK9ZRNpI8aR
         EvMA==
X-Gm-Message-State: AOJu0YwEDs6iT5tZHWuR4ygdMPiq1VOIL8qPB/uEHFhOPaMO0I3i09qy
	5cC6NY5EoqYgsFXZ1DgkiOaPovHsqC+MLCAaoTQTt8aQFFD5/XpcNF7O
X-Gm-Gg: ASbGnctVlFdNIr5kW8gbdEtTT2sJf45XGjzC4mnSQKyA2rBAw9AzlK2bVri20KKhydg
	3W9wLyCfmi4RrzH+t0zU4NattEwxHKsjCGqt9mxLqpEGRJJ3Qr7jjGt8yoX85ffmZx2IW/XemD/
	MIiYpVwyLaJ1GmvD5W0AKdyGo5Lt0VgviUPoYJBgUKW5uV1fuFPSyijHBINipWkIt+0a1yO+37Q
	SVZO8Aw9/PxKdtyNEXrvczbG9dsdqWukmIOudJ/PrHSdCppdwEc6CTRzDF6biot9MSrU9CbktqV
	i4C2kBf+g6wT/zVDuORj4qYQFTVG/54o8+uAYCmFgd+KmJhjyW0icCSiA+Eo6CJpcJLW+cygjhf
	T6awc5ts4IbkUBZ5erXOl6ii3dKR/LtQ8BiboRFZCV4OdiXTRT+pLMIYqGCxzaD9jTyj2X/ZJnx
	cDTGclykzbh7E+ro/TMix8vh+J3GUzJ7fsoDClVkrA9xbE3H7TjVapEvWimPZu44tV
X-Google-Smtp-Source: AGHT+IEJHpz+pZ0Ou9nD8xKBwuxvcPJEKs3CWXEI8WwpGOVOq1nows/tmlPiPRuJdujxCP6ZWBzKDw==
X-Received: by 2002:ad4:5bc8:0:b0:882:3f45:c828 with SMTP id 6a1803df08f44-8847c54446fmr657374226d6.36.1764650635729;
        Mon, 01 Dec 2025 20:43:55 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b492b3sm96842446d6.33.2025.12.01.20.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:43:55 -0800 (PST)
Date: Mon, 1 Dec 2025 23:43:53 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jaeyoon.jung@lge.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] irqbalance: fix build with musl
Message-ID: <aS5uifQnsbkA5GNS@gmail.com>
References: <20251126042241.3881019-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126042241.3881019-1-jaeyoon.jung@lge.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 04:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9468

Rather than do this backport, I completed the long overdue update
to irqbalance that should already contain this patch.

There were quite a few adjustments needed, so I haven't pushed
this to master yet.

You can see the RFC version of the update on master-next.

Bruce

In message: [meta-virtualization] [PATCH] irqbalance: fix build with musl
on 26/11/2025 Jaeyoon Jung (LGE) via lists.yoctoproject.org wrote:

> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
> 
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
>  ...fix-initialisation-of-regex_t-struct.patch | 36 +++++++++++++++++++
>  recipes-extended/irqbalance/irqbalance_git.bb |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch
> 
> diff --git a/recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch b/recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch
> new file mode 100644
> index 00000000..993d9ad8
> --- /dev/null
> +++ b/recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch
> @@ -0,0 +1,36 @@
> +From d02ec54e635da8da8439d35b0523ce2b5d5dbae1 Mon Sep 17 00:00:00 2001
> +From: psykose <alice@ayaya.dev>
> +Date: Wed, 19 Apr 2023 19:31:19 +0000
> +Subject: [PATCH] procinterrupts: fix initialisation of regex_t struct
> +
> +{NULL} utilises the null pointer, but this is not valid, because null is a pointer:
> +
> +procinterrupts.c:110:29: error: initialization of 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Werror=int-conversion]
> +  110 |                 { "eth.*" ,{NULL} ,NULL, IRQ_TYPE_LEGACY, IRQ_GBETH },
> +
> +0-initialisation should be done with '0' instead of a pointer.
> +
> +Upstream-Status: Backport [https://github.com/Irqbalance/irqbalance/commit/d02ec54e635da8da8439d35b0523ce2b5d5dbae1]
> +---
> + procinterrupts.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/procinterrupts.c b/procinterrupts.c
> +index ec7a52b..dfa95c6 100644
> +--- a/procinterrupts.c
> ++++ b/procinterrupts.c
> +@@ -107,10 +107,10 @@ static void guess_arm_irq_hints(char *name, struct irq_info *info)
> + 	static int compiled = 0;
> + 	/* Note: Last entry is a catchall */
> + 	static struct irq_match matches[] = {
> +-		{ "eth.*" ,{NULL} ,NULL, IRQ_TYPE_LEGACY, IRQ_GBETH },
> +-		{ "[A-Z0-9]{4}[0-9a-f]{4}", {NULL} ,check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
> +-		{ "PNP[0-9a-f]{4}", {NULL} ,check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
> +-		{ ".*", {NULL}, NULL, IRQ_TYPE_LEGACY, IRQ_OTHER},
> ++		{ "eth.*" , {0},NULL, IRQ_TYPE_LEGACY, IRQ_GBETH },
> ++		{ "[A-Z0-9]{4}[0-9a-f]{4}", {0}, check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
> ++		{ "PNP[0-9a-f]{4}", {0}, check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
> ++		{ ".*", {0}, NULL, IRQ_TYPE_LEGACY, IRQ_OTHER},
> + 		{NULL},
> + 	};
> + 
> diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
> index 46b8ed0f..7fdf1216 100644
> --- a/recipes-extended/irqbalance/irqbalance_git.bb
> +++ b/recipes-extended/irqbalance/irqbalance_git.bb
> @@ -11,6 +11,7 @@ SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
>             file://add-initscript.patch \
>             file://irqbalance-Add-status-and-reload-commands.patch \
>             file://0001-add-void-to-fix-strict-prototypes.patch \
> +           file://0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch \
>            "
>  
>  CFLAGS += "-Wno-error=format-security"
> -- 
> 2.47.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9457): https://lists.yoctoproject.org/g/meta-virtualization/message/9457
> Mute This Topic: https://lists.yoctoproject.org/mt/116481013/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


