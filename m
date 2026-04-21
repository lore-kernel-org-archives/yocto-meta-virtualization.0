Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB40F5A8D8
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 02:37:04 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4869.1776739018463292519
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 19:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F2FOQuGc;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8acae26e564so44119976d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2026 19:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776739017; x=1777343817; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cv4MWzzkfX5ZWPJORyBkii9IOVDBMs9iGBGJCLeyOsA=;
        b=F2FOQuGclRW6Ibr95M8zDRR9PxlROIqaXb+ltR4sNFZsiuoEMpIWe9XTcD759WbV3D
         4SVYTeQqdsNvhMiFrKcI6baBvirI9hPvyhdsUl/cchabED7a5azKvc5d4aXOQibsKLCi
         X8aoiTPItPzHzYSOEHlM4PdHRYtoFkvx7FO5MXNx6VkPLFv4AlagMOVLAmLw0v+KOU1h
         Qi3j5y+7zqRT5cEfvW98Zyng/4tIAA9cp0vK2NrgIX+AoMP7m1LCNblkrB5yHf7e2Wpj
         h13TJm8mv9taF0tVdVMg3vSwcUSfm3w1KV604m1hEklVpoMsmnQlRuZfuhpPRW3/pAcB
         qPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776739017; x=1777343817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cv4MWzzkfX5ZWPJORyBkii9IOVDBMs9iGBGJCLeyOsA=;
        b=Yqd1DbBbAfKi+YUNwQtsOyTMLWA/UE5pc4komb076e48nSF243EkL4CvwQksM4jHHB
         5VGu8riFUvW4KkZuoYC8mBwXqMzVrn9IksN5eEQORhflA/jlt5YFS4aio5etzQQs56n2
         QOx6PBVNQPzZEu6EcLdP487US7pRnmDTjdALCbDZYFwzqnaG/MYkTmDtZg+mgjhVPEYR
         JbWnqdGvRC5cEs4cGb9ujibYSRFYot+9WSdsuNqGLpZsi8vtJXjtpRQnG0HzYtuMgOdm
         +cDam0t7q0VHtxBgqWTaUYPpVas9fxhpmF9b/PZeRC26uNJafBwFAud0lQG/6KA1ilE+
         w/Ew==
X-Gm-Message-State: AOJu0YyJ9DCFQEy9WOZy3gZz1Cyj+b0/914HbLX+YIa9Cx08OTYwXscT
	xLH1NhXEDRIyk1XyLanERayAMOxlU38v1fFk/VcalzSTgCe3jIxV70ex
X-Gm-Gg: AeBDieu7UI7QQa2IL7KLM7NFM69Nf8byJCyNJOXmw32uDKQYX70W/yLUqSqhsOFtyTb
	cpdm6Y1CeFMY0KLOMQBtrAS5qD/yKA/dWjI69j91TI7cGOwoRCmFh17QJf0L3dKCTWBY0ceXh0N
	EXlCJa1XUMPxmRi+2d+lxiGYYhYyYZHcdELq3g0lyvEbd9f4rEdtCxlqv5wzzrXVVCT12Hl3vlj
	d6KKi2RbBGtgYAiUsjjldqabWOR2uiVDV7CJsdk5mOd2YuXTrg5PfWGpEFUo3fytV7+Mxgquadl
	pg0vLWfWJArKe+3KFuWh9QN+RA5gkgXvUG3Hx6a9pmR3FBrd9QKmr/3boPG9l6LsKWvgRGOFD69
	w0414w5boavpr7hxqvFzuXhnqKSwiVkFxkoAmgBETy7K0JG2fZggLSVZy26GRl2oYLKyt2XmbH8
	iBeRxp5y5lqbepn1DWWsdIpH0SuYztlQ72+yBNHzZFtCfCrZtuqeBkuklVxDGi0TQhtcElSOs+e
	0tABF25LxHeVTVrmDtXv4RhizwbynABCwVtvXLuJv/fQ98=
X-Received: by 2002:a05:6214:250b:b0:8ac:b24a:f543 with SMTP id 6a1803df08f44-8b0282436a0mr284356356d6.50.1776739017360;
        Mon, 20 Apr 2026 19:36:57 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm92595206d6.2.2026.04.20.19.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:36:56 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:36:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [master] [PATCH] criu: Add CVE_PRODUCT to
 align with NVD CPE
Message-ID: <aebix8I7hE0y717X@gmail.com>
References: <20260417083343.2343973-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417083343.2343973-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 02:37:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9716

merged.

Bruce

In message: [meta-virtualization] [master] [PATCH] criu: Add CVE_PRODUCT to align with NVD CPE
on 17/04/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> CVE_PRODUCT has been set to criu:checkpoint/restore_in_userspace to align
> with the product naming used in the NVD CPE database for criu.
> 
> The slash-containing product token is intentional as NVD references this
> project under checkpoint/restore_in_userspace.
> 
> Only a single CPE entry exists in the NVD for this product:
>  cpe:2.3:a:criu:checkpoint/restore_in_userspace
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index c27ca56e..1d36ca18 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -108,3 +108,5 @@ FILES:${PN}-staticdev += " \
>              ${libexecdir}/compel/std.lib.a \
>              ${libexecdir}/compel/fds.lib.a \
>              "
> +
> +CVE_PRODUCT = "criu:checkpoint\/restore_in_userspace"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9710): https://lists.yoctoproject.org/g/meta-virtualization/message/9710
> Mute This Topic: https://lists.yoctoproject.org/mt/118872439/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


