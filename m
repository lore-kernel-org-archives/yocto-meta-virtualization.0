Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7D5CD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 03:36:21 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85228.1781321771577532825
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 20:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jCsOdVtG;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cceaacd07bso19008296d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 20:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781321770; x=1781926570; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JjHpmwfa/410nRp6xO3Sa0d/3CYX+WJDKZSzv3E99zw=;
        b=jCsOdVtGfNcwlk4AQmqwkDS1r/euPvJKW0eT4GWzvTkAxTMnSZ++mnx2iXK60eXqiM
         7UM7j0igcrfYERe4R9I6hi2x93gVq1dNneE3Euf7JNO+akEjI0WrhUhVgRnONNN1iYZG
         cbfXdkBMw4F4g2/1pKFmURsAvUUhi98EXT993IkiK5SB24z5Ey1O+sAtEEoWfOcNg/Av
         p852ep0b1zZ56cBUPa+RN6gzWW9GATbWw/nS45Wy0TBH5t9N6LCzH7gKh0HgTLF/ExVM
         HF5vdCp9FxR2pqersqvW1lfNi1iAiN1ZDK+uFJGrLDbrWHzIphdcw40lkWVkk7AZ12uy
         KVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781321770; x=1781926570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjHpmwfa/410nRp6xO3Sa0d/3CYX+WJDKZSzv3E99zw=;
        b=f0WMIjnHry53qH6lOU5ftC8HQIlcq75M3dT8hzySghQ3rvICD0y66aMY873k+qnSlj
         O7BJ766CQyqwp+3MQB/cY/Uvrp3x2tnOBwpv46Jrsn+7GZKQr3k0gAw46ab4i1Pkiz0l
         xYTIe8MtcG6Ln7pk0tOYEwKwxD2UnJ14MXv4/yXDmJ2Pr8Ae0YbLcloj8TjxBfvb1lcg
         BpNo8pYfIYwLubdK87pv9IWquu7NIWop8xxrmAHxOxp5pr5JKxBwOZVmM8pPCDx8HqUO
         bhFeaIpm6p32FtRCCR1Lvj6+cRqf277ze5cMn9SJdG85YtATuC7Bln7GBUof/avQ6rUc
         4e3A==
X-Gm-Message-State: AOJu0YyzoKbuxYLwOcCTgASfVY1w1Ne+wJwK4Q0fLiYsJT20t8ZmilcB
	afWx2lOZclB0mTINW51KIeFsxK5/Lf+5X5TVSKx0IoCf6YpLQ0Mumh6Y
X-Gm-Gg: Acq92OGN1S6CVyY9dIgKgMaiNJmAc0egemsKKnwZY9oI40cKYRvhgWo3jPHGD3Xur4w
	R9EAcgz9DmdyW9Arq86O1WbNcm4Xb+ZN62LnuAM+81kZFSdZw9Yz0RmcKqmnYzNB7eU13Y1rfNi
	vg4OWkV5f/RIKG7y2UcXGh6/IG+OzJSJHJtHiwAOZLzfnoWYOUsEMV+jR5PrkgBsebho7HZ3pIu
	PZ25K1M4B9j8LwT22vQD+Y3BLLoLiJ20hZWl+msSPiP+SvB+m4hPDdiCpOEU0fD0A80Zds9AOpq
	uDPKr4IE/9eqeMPcE3cxhhYREyhtW+UMeRgEXqSkQY0s1+eKhxof76QVnif4lwKhxijU/g/ppll
	I5ZNqXZG0Oca/QTCgsM4527hH7uBtXou2KlfyjXlvIp4a5XJOwslugeD7djSHQv9pMKT0Jxd7ru
	V8AIgLIW60i/GsUPuh/d+vBSjnqH/qdT+lKk7ez6YLn16h2OURyCKEp7VN1RU4FJs+fFIPPhr2P
	SnYgNvag+IqXxE7KrhPaQ6gq/RXMzM8liLaDsbhT6PxzwILBmS8ByuWHIQznXDQYVzLy+ZGXDyE
	q62nJjMUWdLgKUJqBi+scw==
X-Received: by 2002:a05:6214:29ea:b0:8cc:e170:de2 with SMTP id 6a1803df08f44-8d32bb3cd0cmr91914326d6.1.1781321770420;
        Fri, 12 Jun 2026 20:36:10 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d3045781d9sm42353996d6.30.2026.06.12.20.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 20:36:09 -0700 (PDT)
Date: Sat, 13 Jun 2026 03:36:07 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [meta-virtualization][PATCH] vcontainer-tarball: unset
 OECORE_NATIVE_SYSROOT in CI
Message-ID: <vbzpr4p5az5bt6457hqwwmbnsewxm6cchh7samlisgmm2bpjbd@b75vpm7so263>
References: <20260612201149.67662-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612201149.67662-2-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 03:36:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9884

staged on master-next.

I'm finally getting close to pushing master-next -> master

Bruce

In message: [meta-virtualization][PATCH] vcontainer-tarball: unset OECORE_NATIVE_SYSROOT in CI
on 12/06/2026 Tim Orling via lists.yoctoproject.org wrote:

> Add 'unset OECORE_NATIVE_SYSROOT' to the end of environment-setup-ci
> for the same reasons it needed to be in environment-setup-none.
> 
> This fixes issues seen on AutoBuilder workers which use buildtools-tarball
> and also usage of oe-run-native (e.g. for skopeo-native or cosign-native).
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  recipes-containers/vcontainer/vcontainer-tarball.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/vcontainer/vcontainer-tarball.bb b/recipes-containers/vcontainer/vcontainer-tarball.bb
> index 7e59c77d..f943cfd0 100644
> --- a/recipes-containers/vcontainer/vcontainer-tarball.bb
> +++ b/recipes-containers/vcontainer/vcontainer-tarball.bb
> @@ -451,6 +451,8 @@ ENVEOF
>  export VCONTAINER_DIR="${SDKPATH}"
>  export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"
>  export PATH="${SDKPATH}:${SDKPATHNATIVE}/usr/bin:/usr/bin:/bin:\$PATH"
> +# Clean up - unset to avoid confusing other Yocto tools' >> $script
> +unset OECORE_NATIVE_SYSROOT
>  CISCRIPT
>      chmod 755 $ci_script
>  
> -- 
> 2.54.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9883): https://lists.yoctoproject.org/g/meta-virtualization/message/9883
> Mute This Topic: https://lists.yoctoproject.org/mt/119779995/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


