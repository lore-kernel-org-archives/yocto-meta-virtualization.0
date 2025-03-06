Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFADC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:35:14 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.20185.1741282508935382194
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 09:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VIw9qQx/;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7be8f28172dso62058785a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282508; x=1741887308; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoLqY0iT1vBKpkSTQfqYTj8Axn/6g9781dZKIgJ90/w=;
        b=VIw9qQx/ci04hHp+w2X4UwX8rdVky3fTY01Jn4+F6lgx6jOhI9GbkGr+mtEP/9iM14
         cApn+vex2enXffU9AfcG83tnpsXKGO3XuiLpjfEFA5aN8Xj6DXmTFUdBCW7p2miEPYl1
         eZSQMmC5wvp+Md75/Cjh4TtAmbONgMcw3dpPcz+oEikP6EmE6m5LJIV+UKkxIgrUPVR6
         ylwnF6lLVccbvF47OYMqs3wC/dDOyRqZpP0r4bvmv5YUnDW/Pfiomu43Ey2S8H8za9AA
         d950D9kbB6gi/pzPD1MuyALE65YIAMRPP721Ax6jJN483Il5L7ZA/QaIteItUsvVhTl6
         9OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282508; x=1741887308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoLqY0iT1vBKpkSTQfqYTj8Axn/6g9781dZKIgJ90/w=;
        b=eV2aEyqhY4x13B0Uo4LBAD9g2OIHxXNaxmgxHzZxISzWClcBOVM2AinqhGsWGTmZDb
         qzTb6L1gXwBnhh1nsu3dNsyzReTP4/J7R7llmw3mpB/1fJG7Q2VPguKJjGRThZY8ustz
         zUhzkdohu56VEeTIwH+eqxfRxb2hl4XU/YMa0NyJJh3qUIYj85ypLH2anzEAFWLyj5pQ
         4NE9d9hwfBDOsTWOE6HVKlErFW97wCiy1fJjyB/qXjoVV1D4OFXv5rDdACHLCy1itQsF
         mmvV2VayOmJyRn770iXfoOquunDKjhDD/gJ7CI8EE8EByRTIXKsTrNuq/OXIET2WEqGF
         jjCA==
X-Gm-Message-State: AOJu0YwR6fw+l3SaP8frNyhbbIypm2Sr/pFPjqfWhgQDm74tohcT83NR
	gk7CpcjvfOQ3+uACwM7lFLvjRxR4AHwDhdn3CzrW5pDQ8BY56T9NN216O02OI4M=
X-Gm-Gg: ASbGncto11h+1XN8lnt3FCAy7BzoZcSrkI0aevSr1k/dbRsmn+lP1zRvGFyXXJRvYi/
	y2Qd2seQU4Kn02oHd+7/fCxbWQ53maue9TkqM0/+oS7whvwAKDq+s6AQn4rS6xg1zkTXd0+aCxv
	XQ4fVDTYFK/97uc2li1AWe58MqZcuRjkez9lbTPqoMOC40fAVG+17y8JuMXxtEfIFxaiLrVXqzD
	1eZV7HFZ4lT8Gq3K4aiFR8a12o+TaTocD9FUf/vEJtjybhPXlBai5AzzFOtuH1p8DmTmFZ0LmJE
	/VRrQy+2Fgk4iiKVAWKqbqfAhJvZ3QBKMp6cPt112buXajWbGYpA3nerGTT2ntaSyD6beMCL57b
	SLeABZPR77AueutLOmVZ39ko=
X-Google-Smtp-Source: AGHT+IE/+KLQo3cKesd47z/n1ESeQjxOCKMdryYxw+qj3AiKqodt2tKnHaS0LCw0+X9Ud1PZck88aQ==
X-Received: by 2002:a05:620a:2581:b0:7c0:8950:e3ed with SMTP id af79cd13be357-7c3d8e76453mr1394895285a.54.1741282507823;
        Thu, 06 Mar 2025 09:35:07 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e534e83bsm115572985a.47.2025.03.06.09.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:35:07 -0800 (PST)
Date: Thu, 6 Mar 2025 17:35:05 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] buildah: drop SRCREV_FORMAT
Message-ID: <Z8ncyR29CaanmuhW@gmail.com>
References: <20250206044748.3701612-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206044748.3701612-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 17:35:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9155

I adjusted the patch for my recent buildah uprev, and staged
this on master-next.

Bruce

In message: [meta-virtualization][PATCH] buildah: drop SRCREV_FORMAT
on 05/02/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The source comes from one repo, there's no need to use SRCREV_FORMAT
> any more. So drop it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index ae3495ba..58c862a2 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -27,9 +27,7 @@ GO_INSTALL = "${GO_IMPORT}"
>  GO_WORKDIR = "${GO_INSTALL}"
>  GOBUILDFLAGS += "-mod vendor"
>  
> -SRCREV_FORMAT = "buildah_storage"
> -SRCREV_buildah = "c0602013adc2142f017a6b973a70b33e57bd5539"
> -SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
> +SRCREV = "c0602013adc2142f017a6b973a70b33e57bd5539"
>  
>  SRC_URI = " \
>      git://github.com/containers/buildah;branch=release-1.37;name=buildah;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9124): https://lists.yoctoproject.org/g/meta-virtualization/message/9124
> Mute This Topic: https://lists.yoctoproject.org/mt/111027187/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


