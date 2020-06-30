Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.8300.1593489378416488470
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 20:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=POE/fXTS;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g13so14597962qtv.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 20:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lq2GjtEJguPHINGOSAIMW+i8cBW6Gvo6AY+TXNVT9dI=;
        b=POE/fXTS4kVt07OhLeONftjiD3XptfqQDXzEQLBJ1OUNHacgNwqTe7y7npeUNt4oId
         /J19o0jT0VH4AXKd+bExwg6E5ocJQb3/D9M9xwWka/3t2BvwdlhrXjVDTxCHO9g2ZwNb
         6fwl3x0knOq1LyVY3CMFcfa3DTunmmkIYzMEPx4BPzu8U4T2Tb2w7D1vbY0ZidBKJcfl
         hA/eYuYqYbqKHEuzKEFxIKj5DUeyCQEdl7G35Vzr6ivTWl4ZWPDLvC/hF8Q0E0eH0uSc
         YaSR5Q0ZyLbIXYMvoJa2yHrMrPPtaqzt+yCj/dcuiQi6zao4olz1XsQu91eR/evfBO3U
         odiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lq2GjtEJguPHINGOSAIMW+i8cBW6Gvo6AY+TXNVT9dI=;
        b=Ev1pBzd4KDYghpzBhybUcAX8Bfal+R7LfUkzkgtUROE2lddpLaDS2RIq9W34D8kjc1
         D5ohzNinRqLGBU4HNh0Tx1og+yvcmvU8yO60a+HxHK4RESe4/wlRsriyKHL/4Xh9KeMD
         Q1PjenTrw83T2xeaDJOsPN9QjfNlnf9DJwQC5NR7LSQtlguv55slPVwd0LcRJQEAgx5L
         lWXwQuWYd4nQSAo4QapFwDlJyEyvUu0cEJpuk9RThyVzBwRIvaeKP1MzdhMN6pq2fbax
         EOAow3uk9VFy6YXtHNY7I9xuVRGcMw4CbWIYFMPWfJoxtbdnKf2X9qmVHKejARj7kyB2
         kz4g==
X-Gm-Message-State: AOAM530T89lL+PnK0A9IK8TVw3r81byzP78KzlGnU3DErY6N3w7dcgta
	v+pLlaFzlA/le7wVKyXSRIY=
X-Google-Smtp-Source: ABdhPJzFOoUIegSSpTL6TWyW9ge6zfG/8BI59WxL59kW0GP64pW4DfAYZ65Zo3f1QupUhjYPhYioHw==
X-Received: by 2002:ac8:2f67:: with SMTP id k36mr18710424qta.345.1593489377581;
        Mon, 29 Jun 2020 20:56:17 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id i28sm2103144qkh.1.2020.06.29.20.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:56:16 -0700 (PDT)
Date: Tue, 30 Jun 2020 03:56:15 +0000
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] qemu bbappend: 4.% -> 5.%
Message-ID: <20200630035612.GA8697@gmail.com>
References: <20200629093038.49327-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200629093038.49327-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] qemu bbappend: 4.% -> 5.%
on 29/06/2020 hongxu wrote:

> The oe-core has upgraded qemu to 5.XX
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../qemu/{qemu_4.%.bbappend => qemu_5.%.bbappend}                 | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/qemu/{qemu_4.%.bbappend => qemu_5.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/qemu/qemu_4.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-devtools/qemu/qemu_4.%.bbappend
> rename to meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
> -- 
> 2.21.0
> 

> 

