Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5EEC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 21:01:40 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.154002.1719262891572329919
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 14:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4KDXo20;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f97a4c4588so2817419a34.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719262891; x=1719867691; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CsOf7yeOUBdfsT8OTU0vQfT9vyTBV4yeIQLzUd2Eqbg=;
        b=S4KDXo20pW6VwUf76CkvjA47DmVCtPR35zEEyhHBcvw46TzNs2sIHaeXRFObc4F8/U
         SKMcy5R7LgNt0gF0p+6+a5sa7abpgRJNW2P+BA6WroUoSK2218tj7UpV/Nnfq4eaBk5e
         vgsCuX1HgMF2m8XH+U0nXAGBbLdkhUNi3SSwJhGcf38kT7jOWHkAyBAqyoFRgqoLsqB4
         wy9V9WKfO8dH3RV5aAv9GP9GvdHtxCMhSpjOR/FPR3rvs9Y/ZZFj6vEBVy9u58DqHiiK
         zaC96QXX8ySnCSEOmYnuEoGOoXMtAEu1cMn8hAxKOpf55h6Wg+TyXemBtrMIkA+sxYBj
         fiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719262891; x=1719867691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsOf7yeOUBdfsT8OTU0vQfT9vyTBV4yeIQLzUd2Eqbg=;
        b=njNb7xFhilhlSRyrJ/dagV5O6cSYU7IaHiuhxD1aIRsp1e7ZIaM2c5ELfq/kpTl/JQ
         8Z6JIG5LqahfoLhWuS0WG6PxjMrNqOYt92kNQqM64TSKmGMTxJbPWH5wJVs17vmpmW3V
         m/ThDvAq1ReW4cXBzmNug/V7XBZKWewwpwffiJInHlHdXwnpv3jqSMi9wOBFwlqDynFF
         pZS6rd+ueil7PKZDJiw3fdd4rvpWIFSTnlLFIr6mym5775I9gI5Wnv/PfX0wlST05b9Q
         6DoypHq5GfvS24HG8w5bqtWVKW9jof+doAhcL2wZq9ApgGrRvzEtS4zIdgWa6FYk9Gpa
         cQcw==
X-Gm-Message-State: AOJu0Yz82AsCxFHkdoWQ1qcCc2ObYD4yuTjxIxjhdpYBR4t1ATY7F86Z
	AjVMeuHuqgA5YjLnPz6GGgrK34zpkSxT7fgXPu+ooEjEvOWi9KAk6BfLoP5n
X-Google-Smtp-Source: AGHT+IEFLYw3IDm2AfVKEcIlCT2FVMghfZs4KsueRGdXYJLdqU3HsTFIxfBLIXYKVdzRJC8nB0etww==
X-Received: by 2002:a05:6871:297:b0:259:83dc:2a5b with SMTP id 586e51a60fabf-25d017f96d4mr6894122fac.54.1719262890588;
        Mon, 24 Jun 2024 14:01:30 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce93741dsm345378585a.124.2024.06.24.14.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:01:30 -0700 (PDT)
Date: Mon, 24 Jun 2024 21:01:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: update ptest cases in black
 list
Message-ID: <ZnneqOUIq+eXulZf@gmail.com>
References: <20240619032127.1637376-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619032127.1637376-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 21:01:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8807

staged no master-next.

Bruce

In message: [meta-virtualization][PATCH] lxc: update ptest cases in black list
on 19/06/2024 Xiangyu Chen via lists.yoctoproject.org wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Released lxc-test-shutdowntest and lxc-test-state-server due to
> those back to normal since lxc upgraded to 6.0.0.
> 
> lxc-test-no-new-privs and lxc-test-checkpoint-restore are broken test,
> already reported to upstream[1][2], move them to blacklist until
> upstream fix them.
> 
> lxc-test-usernic always fails when use ptest-runner, but normal with
> run-ptest by manual.
> 
> Ref:
> [1] https://github.com/lxc/lxc/issues/4296
> [2] https://github.com/lxc/lxc/issues/4435
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-containers/lxc/files/run-ptest | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
> index 196adb04..278107d9 100644
> --- a/recipes-containers/lxc/files/run-ptest
> +++ b/recipes-containers/lxc/files/run-ptest
> @@ -12,9 +12,15 @@ blacklist="$blacklist lxc-test-apparmor"
>  blacklist="$blacklist lxc-test-apparmor-mount"
>  #lxc-test-get_item would report Built without AppArmor support error
>  blacklist="$blacklist lxc-test-get_item"
> -# These currently hang so skip them until someone fixes them up
> -blacklist="$blacklist lxc-test-shutdowntest"
> -blacklist="$blacklist lxc-test-state-server"
> +# This is a broken case, also fails on opensuse, already reported to
> +# upstream https://github.com/lxc/lxc/issues/4296
> +blacklist="$blacklist lxc-test-no-new-privs"
> +# lxc doesn't adapt the criu's new mount flag, that cause restore fails
> +# already reported to upstream https://github.com/lxc/lxc/issues/4435
> +blacklist="$blacklist lxc-test-checkpoint-restore"
> +# if we run "run-ptest" under /usr/lib64/lxc/ptest, the result is normal
> +# but it would be failed when using "ptest-runner lxc"
> +blacklist="$blacklist lxc-test-usernic"
>  
>  # Tests in firstrunlist will be run first
>  firstrunlist=""
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8802): https://lists.yoctoproject.org/g/meta-virtualization/message/8802
> Mute This Topic: https://lists.yoctoproject.org/mt/106754344/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


