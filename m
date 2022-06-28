Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6D5C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 03:41:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.51905.1656387666075268238
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 20:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pvlKvI3C;
 spf=pass (domain: gmail.com, ip: 209.85.219.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id y14so18288272qvs.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8J/KWviKE+SQEaucKf0LsVtjFftYLegcZ29k4g4sBF4=;
        b=pvlKvI3C9A4x+xuhblzyMvzUv7fM5BB6chfk7kikCFWWtuK6wGeqOxUW4bRVE5wmWo
         n8ICHmrVqoNN08c58Gbs9Ia41YyMmar1u8GG8AVdUpf9OmKRIP1sjq7XZZf76hSWf+MT
         4CS5QGVcHugxSR0ETy4tMXBgU9csOI4raToj5PYy6xElBt3atqwKtg0xq3xkTezjyS2N
         UBwI6Ujew2OrJUpmCzpT+8eE97PUArHGu+6coHwkyt2rjRsmZNkQJfiCqLK+eqAPA8EW
         LIH7H3lfu3xXADk92G+4DHmdUNsAhJLBpBpXh5KOZRtwU5I17iQCb0SkovGVImb45u5J
         4D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8J/KWviKE+SQEaucKf0LsVtjFftYLegcZ29k4g4sBF4=;
        b=hcZISm91UQr6VxfW2R36FzJiPgGCYp/hQyMSZ5hkXcCM6m2xVuj1ef3tTnRoje4d2I
         uWdC5MyPuyJyLZGj/tc62KqBUpW5I2RrH0TDdz11MakVZrW+43fhFpnRBPiu/5aBAT2p
         lDjXWj5wgETAN7GPqwaCCiZcg+8mj+CYHbmAOFqw3DDbQvro5caN6X+sy0HPULF2f/Vf
         3zl24RhXulliZTkQ0Jj3Mpvcpw7wBjoOUagy7+gCr5/cH9C7gtlDYLemNxk9UWUHsLD/
         WD2uWWszwf8Ezi1gtIbWfXCbvOjoSeBHublXrjSjkjz6xjIXiUIpdhCFpxioPN5Nv2HN
         Semg==
X-Gm-Message-State: AJIora8DdoxVPpv3rN/7YCqp6SPr8lqxG9kOtqSYrSh6bC/2glY8nkLr
	qACg2PZAGzelMf/Cgaal+LI=
X-Google-Smtp-Source: 
 AGRyM1vPTaJdHdxfdPtNY89xlnXifjc77xPizmPvObyQaytGpgortK8D338cLpY/lbW+LLnp/o5llA==
X-Received: by 2002:ac8:57cf:0:b0:317:ca4f:7333 with SMTP id
 w15-20020ac857cf000000b00317ca4f7333mr11875027qta.489.1656387665034;
        Mon, 27 Jun 2022 20:41:05 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 o23-20020ac84297000000b0031871343473sm6091100qtl.83.2022.06.27.20.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:41:04 -0700 (PDT)
Date: Mon, 27 Jun 2022 23:41:02 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH]
 python3-heat-cfntools: fix typo
Message-ID: <20220628034059.GA10008@gmail.com>
References: <20220608064117.1602215-1-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608064117.1602215-1-yi.zhao@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jun 2022 03:41:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7398

merged.

Bruce

In message: [meta-virtualization] [meta-cloud-services][PATCH] python3-heat-cfntools: fix typo
on 08/06/2022 Yi Zhao wrote:

> Fix typo:
> RDPENDS_${PN} -> RDEPENDS:${PN}
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../recipes-devtools/python/python3-heat-cfntools_1.4.2.bb      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb b/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
> index 8439daa..a6dee5c 100644
> --- a/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
> @@ -18,6 +18,6 @@ DEPENDS += " \
>          python3-pbr-native \
>          "
>  
> -RDPENDS_${PN} += "\
> +RDEPENDS:${PN} += "\
>      python3-pbr \
>      "
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7345): https://lists.yoctoproject.org/g/meta-virtualization/message/7345
> Mute This Topic: https://lists.yoctoproject.org/mt/91618357/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


