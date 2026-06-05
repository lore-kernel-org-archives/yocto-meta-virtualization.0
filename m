Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70E0CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 03:33:38 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.737.1780630415037924180
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 20:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S1znAnXS;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5178a42caa3so12810961cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 20:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780630414; x=1781235214; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tsk1IHcqsK9lsSWaOKroqXG11hIhRWBz1IDjaK+anU=;
        b=S1znAnXSyvWYTyGf0KADwZrCuPusPWkpa30GWrtvHban6Z6VhLSIavWN7T+ediyfn+
         9TBXPLUOAtg+rxbI6ydrIWlpzPXvdaJmV7brShiLua45NCYYr0lM8XHfH0gPN2DTp2bQ
         BcJ8fjtJYdEZVxYz4AwyJjW6W9G4K08GqkGL/43HeTqYZWRsodTi06ms3mdDtXSgq9P3
         ByGarkg2CX65ZMJYoSfE8SI55IHzRtFPXTlzJ6GPcXDQwdqY/FU/eCGQTHQUaDTU0clz
         jtMNZ1E1DUhZkXHJF9aTXmTl0f75iWul5vygxxHktXhL4yRJ84s7BfY1ShYeeCPHP6zR
         KBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630414; x=1781235214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Tsk1IHcqsK9lsSWaOKroqXG11hIhRWBz1IDjaK+anU=;
        b=L8+JcjhlOIMIRQiE87Jfk5C83XGvUm62BsgM3zG4gflqJLcoTEXhS50ityAJWE8qE4
         4adSAtdU1g/jZLs2X5GsYkULacq6jEIy+PxKz6Ycl6Qu7pvXI+gDpJe5sXEB8p4+jRkQ
         q3Wa4vY+CYGUcBwt1NDpPZwbD5xle1oc1vk0xPGiAdnwDVDA96Js4w/jcFqfCCh91OUt
         2mUQ8yzURx93L+xV1iMEngCeEXdOwCBND/tWKd/r0atkm/vFFMbDK0FjwK1BK/zshi2x
         Uy5EadsUEgj83g5otxxyofrZ5w2hbUrKsmmEljgioN4rJjH+bPZ0Ku197yPoKIXW2eNM
         +0Lw==
X-Gm-Message-State: AOJu0YzOBEui3cpJBJ8d/4jKsPbPzoKfXTvQzE2bh6y27+J2MjiBmuAy
	G3D4hSvcsNSlYLaaPBDptl0J0BywF/k67JI2KFW8VSlZ00nyme48mtn9Po2URxCS
X-Gm-Gg: Acq92OGnv47DapEArx47BegZFzXN4p/dpIuTfYLtMdyrzsk6+Dwp9SgwlrBYrwETCMf
	U6K9erEAWEEmlALCOuAcwonCz9TdCYTSuDfjqOhfpQxBgfWKSFejMPmWw6NK9LqmeNXDIQqhF27
	vk+Sphbwc7sgsJLmAhuBDOY1HbTEUpljO3dB0UtunTaqsMUEn5EKN8ui/VZz5I1LFT8GANlVBI/
	JDez7CSE4Pb37DGFmQnx5JSkZhbHoFzH3wz275oTIFf9m90tgqX4JUkD159qUfSNuBuQ5efzB3A
	S41dACoGGiM48zY7uXVsDjy13pEk64Y4jNt23qTAhHnV+8RqAPQMT1zRus4QmKNzKtefJd9iCjk
	OaaB6tKBjnoQVfgl+Gn7Utkwu7qRFGqhMJwiho0rZbZxvmXj345/d3V2q408KTi/kj0AxcUMcad
	won2R8s6ZcpvehcXnKZPjNCNK5xMgDlzyz72h6iY7OM7TTeljtB+hHxPlDoFZouHamjHjPG2HNe
	hf7PICYx3exNVQOC05oXFUw/qpMS8fB4QmpfB6uUKrPWIf3bfUQV0ZTxMYJ+mxebSIBoJ31s5BL
	tbgbMgal7SU73qb2Jz++czMZ+UvreArV
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr9552791cf.4.1780630413973;
        Thu, 04 Jun 2026 20:33:33 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd077be8sm70020796d6.40.2026.06.04.20.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:33 -0700 (PDT)
Date: Fri, 5 Jun 2026 03:33:31 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Haitao.Liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 1/2] openvswitch: update to
 3.7.1
Message-ID: <aiJDi26A0vKWSgvu@gmail.com>
References: <20260601090145.412741-1-haitao.liu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601090145.412741-1-haitao.liu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2026 03:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9854



In message: [meta-virtualization][wrynose][PATCH 1/2] openvswitch: update to 3.7.1
on 01/06/2026 jason.lau via lists.yoctoproject.org wrote:

> pick up the following commits:
> 
>     7921d9c69 Set release date for 3.7.1.
>     e1b82e9b7 github: Temporarily disable system tests for DPDK and AF_XDP.
>     a9785c7e1 conntrack: Fix replace_substring to handle larger packets.
>     7dc6fb7ba Update DPDK version for older releases to 23.11.6 and 24.11.4.
> 
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 87790090..8dcb7ca4 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -13,12 +13,12 @@ RDEPENDS:${PN}-ptest += "\
>  	python3-resource findutils which diffutils \
>  	"
>  
> -PV = "3.7.0"
> +PV = "3.7.1"
>  CVE_VERSION = "3.5.0"

Not related to your patch, but it looks like I missed the
CVE_VERSION.

Can you do a v2 with that fixed to match PV ?

Bruce

>  
>  FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
>  
> -SRCREV = "0d4c78e153d2b22ab1b173cd4a4dfff89002666d"
> +SRCREV = "7921d9c6924b8934ea1de9481891ac1172649280"
>  SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.7 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>              file://run-ptest \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9834): https://lists.yoctoproject.org/g/meta-virtualization/message/9834
> Mute This Topic: https://lists.yoctoproject.org/mt/119587461/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


