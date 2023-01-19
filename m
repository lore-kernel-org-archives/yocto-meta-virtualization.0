Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCCCC46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 20:14:03 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.56429.1674159242722964112
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 12:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zj/B22/w;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 66so4076083yba.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 12:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/iJWIipnuVoS1H+vZ3QJNYne3l1oWL0pE8Egdo4NINg=;
        b=Zj/B22/wqRigTkWSPzWC6f//3N7GWL0RCsumzbUy5QZVc54sNGlMqjx0oDokdUguAi
         YfoMafHpnBMNIvLJNWXLTDwwbaKC7Ljz58wj0+Wk4roJFABFjaUJiy9anog71VDv0tnY
         TR3lCEeUvrS+BzbCVFLcUhauks1eeUE8j6lE18rtyUg2Q9cpAAsQ5C2aMDpXSiK+wuMn
         J50+WpK+L4B3YI5lb8CBQYUcQmTWxSWl+CQZsoadEkm/ni0BpKKRNcL6jSGGke1vPc1G
         XNI8ufp5g7yrD7hH+8+t9+IukjvA/KXHSQ6gYGYcaqhqU5w1G3G1YzvVY5Gvr1WX5vZz
         s/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iJWIipnuVoS1H+vZ3QJNYne3l1oWL0pE8Egdo4NINg=;
        b=HurPnnfBKRBSdDX3lp6d0Gc3wpqssIWPThdAmd2WxsG7KltIj7D0z+e9mDNXWJVkZC
         mhZhg8b1IVdZFVOku+s57WTDbrC+WXE/3QIDu/B1c01oSDnBJxAVfKbINmLJ6+YKyo7a
         gpscM25SWcdfSOP0Ubt5bnwZfTCDKGmKnXjQ3CexekyHEKW8ZPhwp7nelfhMy1lX+Rcm
         4AEuL02HFTzg6frMi0qrh0WY6yZIJ9Y43DmQMWwLzWQ25X8JsL0NeBrv9Pwd0T53qzYO
         oTkozp2zPl7iElclrD5XaYAe7C2rWRNXVpLDg1iIVQ6Jm6E+jokpYxufZATRGr7g3u4w
         C9DQ==
X-Gm-Message-State: AFqh2kqc3u5AeA0BFDmzAE40WwMhk+x8e5/ivZJuO+pjemovFtikOCkA
	zitIkSHJ0HL81RosROSaYi0=
X-Google-Smtp-Source: AMrXdXvaCUY+gbV5/CGuR5S2OQzD1k4gukTa1OrcTBfZUnhS8jeM/XVlTlMTCQUYmrtd/IXqG6rpcA==
X-Received: by 2002:a25:40d1:0:b0:7b0:f394:d521 with SMTP id n200-20020a2540d1000000b007b0f394d521mr10687471yba.14.1674159241690;
        Thu, 19 Jan 2023 12:14:01 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a254f00b007056237b41bsm24698331qko.67.2023.01.19.12.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:14:01 -0800 (PST)
Date: Thu, 19 Jan 2023 15:13:59 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][PATCH] ovs: update CVE_VERSION to
 3.0.3
Message-ID: <Y8mkh1Fv51UQ574K@gmail.com>
References: <20230116053920.3547806-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116053920.3547806-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:14:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7821

Good Catch!

My package update scripts don't take that into account, so I missed it!

Bruce

In message: [meta-virtualization][master][PATCH] ovs: update CVE_VERSION to 3.0.3
on 16/01/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 3dd7cf7..1ad3e57 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -15,7 +15,7 @@ RDEPENDS:${PN}-ptest += "\
>  
>  S = "${WORKDIR}/git"
>  PV = "3.0.3+${SRCPV}"
> -CVE_VERSION = "2.17.1"
> +CVE_VERSION = "3.0.3"
>  
>  FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7814): https://lists.yoctoproject.org/g/meta-virtualization/message/7814
> Mute This Topic: https://lists.yoctoproject.org/mt/96301725/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


