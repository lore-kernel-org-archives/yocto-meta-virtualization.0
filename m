Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DA5C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 21:00:51 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.153978.1719262848972886095
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 14:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/aHycxa;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f977acff19so2329074a34.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719262848; x=1719867648; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t4W/pBLT1i4PAqIuz5SSAntgDrDVHnt4cYa/N1ytf/g=;
        b=Y/aHycxaxzbin6BBJXGRR8LR+SmwAJCUrQJe601nPdNPNXK2oZ1sUEmzTHI1tzrtVw
         v8svmrd3xX6HntBzzpJOz83SoyyBRnsqayQ/ETn6knW+bJR6o3cUyKuJeJGqOa3jLw1o
         k0MyKqoM6znU5M165GaqFfXeOUcAKbG1h7WhxWHVt6/PoYE21/rcTVsHfGJ3EjzYg6q2
         /uYcfFyIErcw2sPafCYLQU3CxJvVLBBYGf0h1W4GK683Acrl6TTLKktPP8mOjvKZIwZh
         7wjuM25tU9hItyD1MKEz0mS7lnT+9CnrhUgNAmdTi/5GvQGqHZyzocDwyw1dRMKBd3Lw
         LAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719262848; x=1719867648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4W/pBLT1i4PAqIuz5SSAntgDrDVHnt4cYa/N1ytf/g=;
        b=dM42A2bT4h15d5kckA6I3NwnxUw7wCpCqMDFkLXjGkOSRpDEEwz2wiNVuXhhEaahRi
         XLlQFV1dky9XVIlUYowSmME6AND8Q67jKVKzVA1AjQonkNCpIAOlwKOq4eS2vVuZ2LFe
         tKnK3S1FTwoRVM6078AXGKgwagXxwUpDXjjO82qyc+nE+rKctWY0H/Ev5v7yDJuInyv2
         xycVdOOKH8sDsqgfIwopmBKwUdkvBLPw62PIPpn02Vw7EPR830YrEkGhpCMst114+y6i
         32xkM7au3B14G/9n+FBWevr+pG6NyFp92GFrWzT83W1g66F+SePdysStEnAmkoh5021o
         b/cA==
X-Gm-Message-State: AOJu0YzKtCsGYFHph/OvpoKeVTduEX5SS8iH+lyDYPVVmnD/x5JC3LDP
	xUFzIO96V3j7fgjQk6/eK6O+zc/DJzdkdo8AgMAh96QpvgVzbVhtbETJY01U
X-Google-Smtp-Source: AGHT+IEJ37nlFmvcpemiB21+o6nNQJLnpypd+4AAABWVvY+fnI6qBMLIOu6uQOiAICWSC1H7D54Gow==
X-Received: by 2002:a9d:76d0:0:b0:6f9:6161:c8c8 with SMTP id 46e09a7af769-700ac5bf5c1mr6898038a34.36.1719262848107;
        Mon, 24 Jun 2024 14:00:48 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce8b0f3esm349591085a.29.2024.06.24.14.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:00:47 -0700 (PDT)
Date: Mon, 24 Jun 2024 21:00:45 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: liezhi.yang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] yq_git: Set apply=no for SRC_URI
 diff
Message-ID: <ZnnefcE1K7YSdn1X@gmail.com>
References: <20240619085432.371189-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619085432.371189-1-liezhi.yang@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 21:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8806

staged on master-next

Bruce

In message: [meta-virtualization][PATCH] yq_git: Set apply=no for SRC_URI diff
on 19/06/2024 Robert Yang via lists.yoctoproject.org wrote:

> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Fixed a do_patch error use git shallow tarball (BB_GIT_SHALLOW = "1"):
> 
> $ bitbake yp -cpatch
> 
> ERROR: do_patch: Importing patch 'github.com.pkg.diff' with striplevel '1'
> 
> The github.com.pkg.diff is ud.clonedir of git://github.com/pkg/diff:
> * When use regular git repo as source, oe.patch.patch_path() will NOT
>   handle it as a patch since the directory github.com.pkg.diff exists,
>   and nothing is wrong.
> 
> * When use git shallow tarball, the github.com.pkg.diff doesn't exist since
>   it is fetched as a tarball, then oe.patch.patch_path() will handle it
>   as a patch, then the error happens.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 014101ba..a1adfc96 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -41,7 +41,7 @@ SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https;destsuffix=${
>             git://github.com/magiconair/properties;name=properties;destsuffix=build/vendor/src/github.com/magiconair/properties;branch=main;protocol=https \
>             git://github.com/golang/net;name=net;destsuffix=build/vendor/src/golang.org/x/net;branch=master;protocol=https \
>             git://github.com/golang/text;name=text;destsuffix=build/vendor/src/golang.org/x/text;branch=master;protocol=https \
> -           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https \
> +           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https;apply=no \
>             file://run-ptest \
>             "
>  
> -- 
> 2.45.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8804): https://lists.yoctoproject.org/g/meta-virtualization/message/8804
> Mute This Topic: https://lists.yoctoproject.org/mt/106757049/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


