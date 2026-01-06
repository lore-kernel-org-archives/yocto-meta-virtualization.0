Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DC4CEFD01
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:43:02 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98833.1767728578236053789
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bzy1w6h3;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bb6a27d3edso114065085a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728577; x=1768333377; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2SWT1ij3awlSikkOKpzlt+gaAHXhd+ccEk+521VD08=;
        b=Bzy1w6h3pcn+1ZV5AnZD/FLsokofG/GbeD5+EbL2bo2Iml1R1Cz8THYB8b8wCGyz9A
         2u/xDzRNQUOH05lDmoId+dKDKoN9SANxpfatoJwwsSJex/JRwxReFVS1aIX/ZPWCSGtW
         o/O3j0vYFDDyCoSriHnpO/gx6pNfOb0sKpbmpDywiALylEboOkshr65fKEfG4JjwSe6i
         dmAzL8thPUhw3d4WillQAETnPy2/4EwX0rJy4uaxU8W3FNaP+aSfkBYiJtmD8gSaD06F
         nFx+Ymh929UwR9XH0cpu6l1lJ5r13NP9xR/uKf25qb1fTKmVwRlEPqmMQO3XfH/rAPLR
         /GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728577; x=1768333377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2SWT1ij3awlSikkOKpzlt+gaAHXhd+ccEk+521VD08=;
        b=LvUGfethnTanyH9SdfgCtvxcBTJT9fJQqdTiOV7/dKnE12IVY9bwgDBomTCdVXzNK/
         s27eUcy46QpLJ+COsZR5OgwIIQJWZYZb+7HplTI/pqbS81khA2zlTFGJ09xbSNItuk1d
         pY0R14Qf+iQDqOMlwIH7LPslVhzQUq4Qs6lBmQKl9d9xNh1dEV2EJtmWMqNLgkZrL2ZK
         sGdNqbo3AnNZky7MRKigJyzoTviOY7reLxOlk+2BoVeOSaYqp2GnbSNMekCSf5Tqcsar
         8+5dNfRLn6G16ym7PLoagcUgB1JGZdUz0hgZ7+Fau6aaLZ1vQa3GA7kqHg5hY0r/og3j
         Rmiw==
X-Gm-Message-State: AOJu0Yy9R4c3ihvmVTOoDnIaKY0nl76pUihqQ509Rz2ZkZKZh6XUgp5U
	LrSd0NEdQHp+7KqulpWThu3JEl+VMTFyFmhgaLl0gcnclR+4Yy98i8E2md1EXvypJ3E=
X-Gm-Gg: AY/fxX4Qe8lSSgHzGUDGbtgQp1r2w9h11tYLo64ud3PD09w01b32X8O2P8TVj0LVwq1
	D/rJ/by0e3uVetpNcPotVCLQ3XGCLgMcAagQwqNqI18l79aECf+veag9wSsulhSOK4ATGJMYupS
	EF2W9tsc5esuuyVXVSgjHQduGTEepb/BqBjrCfSnejhb4XsZH+kEP5VbbA7PuNMPFlwLECqomLc
	W0rh/1LysJDjM+WAqutxMvP8pTDvXdII6h6FGG118Ik2gX5Am8Rw6XZOdh0jaEf9ILodQuVQTeK
	nO1fCCYn8np7zZy4g1bId8guVNO7HTyyqngpbv5lCI8rxPyhzjTeE0RJt2aRN6DCVsbzMhpoJ5L
	moU3gO4KTPTdQwT+SNwI8nZ4ep0Wt0RptCyj1Jy4c1qSvn5Yd0Uq+tmu98fL09+IjWMNEFVfcj9
	gEMnn+cjFDrPl5HxM1BxaNjT9BDd2JKuNoYcnqJdyoFfM+43/GFIuTehbcKcu52Ukj
X-Google-Smtp-Source: AGHT+IFTrmyMcybnl4pjflg6dDy5/2xUjOf8Vez/nxTB3uTMXMFxDOLJSw9rO0nhb8lybCNXDYNAbA==
X-Received: by 2002:a05:620a:258e:b0:8b2:598d:6e66 with SMTP id af79cd13be357-8c37eb76db2mr577403585a.22.1767728577138;
        Tue, 06 Jan 2026 11:42:57 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm225651385a.5.2026.01.06.11.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:42:56 -0800 (PST)
Date: Tue, 6 Jan 2026 14:42:55 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.kjellerstedt@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v"
 from PV
Message-ID: <aV1lv8fgagu8jtLB@gmail.com>
References: <20250907105926.1650992-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907105926.1650992-1-pkj@axis.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:43:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9528

I didn't forget about this.

The version variables are ridciously all over the place.

I'm not doing it for this release, but for the LTS, I'll
unify them one way or the other, and I'm leaning towards
dropping the "v", since it isn't hugely important to me
and there's such a lack of consistency.

Bruce"

In message: [meta-virtualization] [PATCH] containerd: Remove leading "v" from PV
on 07/09/2025 Peter Kjellerstedt via lists.yoctoproject.org wrote:

> The leading "v" in the version otherwise makes its way into, e.g., the
> SBOM.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> There are another 30 recipes in meta-virtualization that have a leading
> "v" in their versions, but this is the only one of them that we use.
> I can send patches for the others as well if you want.
> 
>  recipes-containers/containerd/containerd_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
> index bae86146..c46d1673 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.1;protocol=ht
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v2.1.4"
> +CONTAINERD_VERSION = "2.1.4"
>  
>  # EXTRA_OEMAKE += "GODEBUG=1"
>  

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9377): https://lists.yoctoproject.org/g/meta-virtualization/message/9377
> Mute This Topic: https://lists.yoctoproject.org/mt/115111597/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


