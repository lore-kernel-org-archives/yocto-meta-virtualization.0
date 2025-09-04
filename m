Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5A5CA1010
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:40:16 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.29557.1756950009962717134
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxh9G7HY;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b109c482c8so10449681cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950009; x=1757554809; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3fW7aKJHrADpMC/tEQTyxaVw90yrZbSUeyvBhqBgFY=;
        b=jxh9G7HY3nraZtKROtcru8W4cPEH8W0Lq5g+YaXCZnXYq9ar1eFvwhL1kkC/ipguTb
         WtTjVRX6AccAuHBTVJbri/jF0y5Wl2RG+TNFm5/3yBTEgVe6rMfUTq1Lc48BZQtyB+Hm
         gypTFt+UXGC2HUsteoITi/UOXxudaXDmGc4s60DtirUXUtyUvmwzbBm8CdEIpMCuFZOs
         ejNT8uGnev6Mj9GQkKjfJTSZwFP0p5M1ZbWYplkqvzejGCYdyWxquR8WTjqPCKhgcvkL
         qp3JG83dihuBsYJH1Cqd1AIs+5wwNkAlZ9RHPvsDN3RuVvlQ/kl5p0Fil72/fWLYzuef
         QsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950009; x=1757554809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3fW7aKJHrADpMC/tEQTyxaVw90yrZbSUeyvBhqBgFY=;
        b=c3PDSlbQOcmCJugtnL+H470W24n1SWC+ZinKPrUm/1TwVQ5Z3gyNHSRaCJFl3uM2vZ
         eXEFBR8EA1JjN/p4j8duzMiOsg+bKx7GMSEIr+oHWsg0QWbOs+/RYtrSbaBXeKp6FNTu
         L4JEwVO+G2H+TYOplW+IapgTBH+tODsCv4DJ7C1AipzdxzdBapQpxcO+Oc4pDFQymUK7
         NPe/yuVMc/Kd2MrGkCcyvUIK7EPMhZdOhtC42orOGtHlP5yDHcsJtmoGoMoc3JOF3dLG
         IuqY28GPk90Pd+DocfMloVddQE0s2p8EMfIh8LAI1HK5Jt9S5XHofmLIgRHYDDPQIHBZ
         gb0Q==
X-Gm-Message-State: AOJu0YxPsBBxfxFJuuevkfZXUPldVZ/TwLE3pvTCzVWyKRuNXk/0kiDh
	DStvwbJjlIBzEBcMpIhxnb821fBY6GRvzwDX0MIGzL+7z9UZ4z+NyIy7s7c9/zaY
X-Gm-Gg: ASbGncsZxEqYPcppyd4Rxss+xNyX0xB0LZYRFSSofvZv/heUwk5w5mAnsSGnDJdzLgZ
	YnjYapCGWdYgRYDlmIyuYfvShOK6jVW57io2P6J6hWdv8BWK5STiMsrzu2JvN084Zag4KTs5O/t
	0dY1WTycEHXum5xJWRKaVbcsHOWNCI04hgWbqxWyVdm5TM7h5h7s3Gy/7LVqqVEouoNpY+5I4Zx
	U+vcEz8QJlEQd9+PC0BTiLxItsVugtqnJVc9BOWx7t0MLcdw34pti2AHs+MmaDu5ZaIBKKFI2aA
	Kq9bJ33YzKyVuvEwzVFUxTZZzeJWdXYrWkOjiLfIqSQil6DjmXC1wkYIRUzUTUkANuObBQ2J/Ti
	JMlnlTYtGVSlJPPwN583P84n9Fbrf1+B4/bcyh5rbqINp/PPDCTodp7kgiBBGAvvyZaahgU/bjW
	iUPnksbkkCbn87N6xguCYY3kRwHtZHouNc
X-Google-Smtp-Source: AGHT+IE+XJHOUMCQxrt9TFBcBd+9rb92KqBDNj3xhIyVTr7+vnP70/HhwU+9a4FuQW5e75DRqzBUHw==
X-Received: by 2002:ac8:5745:0:b0:4b2:8ac5:27c9 with SMTP id d75a77b69052e-4b31dd92fefmr203664911cf.84.1756950008872;
        Wed, 03 Sep 2025 18:40:08 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aabf586c5sm201991385a.60.2025.09.03.18.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:40:08 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:40:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] cri-o: correct SRC_URI and HOMEPAGE
Message-ID: <aLjt9gDTUQd6KljB@gmail.com>
References: <20250826080710.2228501-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826080710.2228501-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9371


In message: [meta-virtualization][PATCH] cri-o: correct SRC_URI and HOMEPAGE
on 26/08/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> cri-o now resides under https://github.com/cri-o/cri-o.
> 
> The old URL, https://github.com/kubernetes-sigs/cri-o, now redirects
> to https://github.com/cri-o/cri-o.
> 
> Correct SRC_URI and HOMEPAGE to use https://github.com/cri-o/cri-o.

I've been using that repoistory for my latest round of updates, but
hadn't gotten to updating the recipe yet.

This is applied to master-next

Bruce

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 11374297..5b348a8b 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -1,4 +1,4 @@
> -HOMEPAGE = "https://github.com/kubernetes-sigs/cri-o"
> +HOMEPAGE = "https://github.com/cri-o/cri-o"
>  SUMMARY = "Open Container Initiative-based implementation of Kubernetes Container Runtime Interface"
>  DESCRIPTION = "cri-o is meant to provide an integration path between OCI conformant \
>  runtimes and the kubelet. Specifically, it implements the Kubelet Container Runtime \
> @@ -16,7 +16,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>  
>  SRCREV_cri-o = "87ce1c120d022797913f0792e15dd0107d19dffe"
>  SRC_URI = "\
> -	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.34;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
> +	git://github.com/cri-o/cri-o.git;branch=release-1.34;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
>          file://crio.conf \
>          file://run-ptest \
>  	"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9360): https://lists.yoctoproject.org/g/meta-virtualization/message/9360
> Mute This Topic: https://lists.yoctoproject.org/mt/114896487/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


