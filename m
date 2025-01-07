Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8593BE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 22:07:06 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.4894.1736287616819018051
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 14:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XH46F/os;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46b1d40abbdso31510121cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 14:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736287616; x=1736892416; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3ruiAFcd25KhAuCEtJtuDxZrfIUI012Jvp9W4qAcUc=;
        b=XH46F/osJsK5vhYglaPyRrPanOSX6bAYppgUKK4FT2sAu549ErUFyCPRv6fyp4miy1
         OtkHKBzmLL2O683OHxBNBAeLWwRUnJ28PSVLoJxROrnlBzr8WWH/MdxzTujXWVJF6t2E
         jSi5TX/qVZzXBNn7eMAyYcJ25BXW7isqoU8gJ26ACsu8Tlm8dfdnuyGfY0aDV8+oJ4gL
         JmVTU7VPaSa9zUviILk6at/X9X+tv6AU2eRjgkJo2uFVhfxefig2jFHiP3Af4mUJXlnh
         32dFybWtORS0X2ZQelCR3ZIXvmvSvyHpXYhBns06/7ziEJapW048q17OK4EKLXeOk6W2
         vrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736287616; x=1736892416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3ruiAFcd25KhAuCEtJtuDxZrfIUI012Jvp9W4qAcUc=;
        b=tdr2NCFCFil/iKM1tI+3fWFNnlj2hC3DAOwjZQq5fE0LuW4w8kA9WWw4TafaYCcsh+
         8ux59pguK9DRb1re5eiUkqOCzpL+YbaqUk8TZrYwgeIM3ZkOPyXQx9NCV1DzXvh/ouxg
         WI2UZ8Pjn+vr5Ns6HF811Tg3mOKNEeytxT1GROOWUL9dONNimzrjPTFGyB+zdSsVnRax
         Ou/2bkrwqG/8ea+/U03Olz45g/zySH4L9HIB2U1JnOKJAr+6bXYpta8GNZwTXhFOIjbg
         FYSp4QlgGtZddfdIyjqi8m30LhALgmZgT9eE5ukNwgT8/OrRLjGTdMEIkzqW2nLbg0G+
         fBUg==
X-Gm-Message-State: AOJu0YwgnUQIGzalhQWWP8yLLbeXQR1/uFe333KtOgJYQpfsAnyiw94c
	PeQBgr/n61oi4PJUAslDK2h5bBMASOuX3wxmRFrcQV6UKgHTukj5c9HFUof+H3FdNA==
X-Gm-Gg: ASbGnctw0gWpvkFsT+84nIZSVboLA3aHdbrdKqHLLPbnHXjJjdpedhdPbRfgdOJ9mxl
	e9+a2plhL1zWdDYgqYnylHwVLO6g+Pf4FrxV7cWcHYwZfSKBBYP5c/NYbILrfPHUd8kXTlEpybX
	xLTdmOgsG+uuwrKxekdeez1s5dw9ik6tdFHRhMP5HVUtwJfo2ObX4bnVwc+p+mwWg7hI3qFeaHt
	vWD3LejhSxoyf0muapp1ypPNXSq5QBgq2UTVFnpxuOd1fH5cO8AZdPMxiLCogSIbddAQy9ko+ad
	Xq70JqKo5ETDyoNrlwDMlZvvt1mVozN0o5c=
X-Google-Smtp-Source: AGHT+IGFsroEpupAfBcNKnpx1wfhwgF/lbdyQtn+D5KWo8PWIqZVkGQCpVNQ+njA9mgO0SgKgUFaZA==
X-Received: by 2002:a05:620a:2b91:b0:7b6:66d0:5ac2 with SMTP id af79cd13be357-7bcd97d6498mr62649985a.54.1736287615785;
        Tue, 07 Jan 2025 14:06:55 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bd0a5sm1630258085a.20.2025.01.07.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:06:55 -0800 (PST)
Date: Tue, 7 Jan 2025 22:06:53 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: L.Anderweit@phytec.de
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH][styhead][master] podman-compose:
 Add runtime dependencies
Message-ID: <Z32lfda1dN9YzNGX@gmail.com>
References: <20241218092134.2506858-1-l.anderweit@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218092134.2506858-1-l.anderweit@phytec.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 22:07:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9075

Sorry for the delay on this.

I'm now starting a full upgrade cycle on the meta-virtualization
recipes, so I've caught up on other pending items.

I've been known to reject cleanups mixed in with fixes, but
since I've already made you wait a long time for this, I just
merged it as-is!

Bruce

In message: [meta-virtualization][PATCH][styhead][master] podman-compose: Add runtime dependencies
on 18/12/2024 Leonard Anderweit via lists.yoctoproject.org wrote:

> Add missing runtime dependencies on python modules asyncio, json and
> getpass provided by unixadmin.
> Sort the dependencies alphabetically while at it.
> 
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> ---
>  recipes-containers/podman-compose/podman-compose_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman-compose/podman-compose_git.bb b/recipes-containers/podman-compose/podman-compose_git.bb
> index 0ee171dc88ad..c76bf1c447b8 100644
> --- a/recipes-containers/podman-compose/podman-compose_git.bb
> +++ b/recipes-containers/podman-compose/podman-compose_git.bb
> @@ -14,6 +14,9 @@ S = "${WORKDIR}/git"
>  DEPENDS += "python3-pyyaml-native"
>  
>  RDEPENDS:${PN} += "\
> -    python3-pyyaml \
> +    python3-asyncio \
>      python3-dotenv \
> +    python3-json \
> +    python3-pyyaml \
> +    python3-unixadmin \
>  "
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9061): https://lists.yoctoproject.org/g/meta-virtualization/message/9061
> Mute This Topic: https://lists.yoctoproject.org/mt/110177990/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


