Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DCBC5B549
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 02:34:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.34884.1749090888470237440
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 19:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PajmCQyQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7caeeef95d4so55145685a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Jun 2025 19:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749090887; x=1749695687; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KHvx2/Ar04wKzrWKuKrJ1B8jiL5vddumRrvdCaZazQQ=;
        b=PajmCQyQXcjr98EVWVGNmoEN+E4n/w0tLj81Q0YgwgJdlnPbwufuprY5tnEF7q4Q4n
         cFC58flExKzfMjUhCMnHl/eUs2ThRuAX277/3I3/QFD/heSNfMCUwdK3E/h7haigi6kE
         JGLHP5cowqDD3Muk51HXJWnVoHc2kFqrDSM1U+FfCaRiYNzbHmHYBCpW8WM9xWG/9lmB
         UWl/WXRoYbixy1mZmL7ZMaybls50n64oweaHoc4+G5z8lRpEMAYYVoeeh5SqrNg+AFE9
         /jL3t5J2V/NCv1gR3GqBO7LsqzmN3hBAsWm2EXOQDJwtzEjtCkAF05KVfO0U24iX7bAE
         CaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749090887; x=1749695687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHvx2/Ar04wKzrWKuKrJ1B8jiL5vddumRrvdCaZazQQ=;
        b=Ecl8zuzh8NprKkjMKdZ4BjgpvU4W7q7cjjzg4FI+HJ0wLL8QouqmbggQQHR+wn2W2S
         cqk2KqJdNSteet6S34v/QHWggB0q4a11Op5Em1JzV2VHrtAWb+QfQwmhuB5GhD4uKleq
         Qt54TRtbkucnENAOOABkqWsbuf9egCxw75+7Hv4DecZ2ABF7jeIi9nASBM3S9ol2Fz0L
         AKLZVYLsDSZG7x63Cww25+Bi9bfcu02pYcr2fFLAsdcC+8j/wecu1PhjiFIDzkY9UQVK
         QRBMK5vJ/JNY1o67CkrSg5c15SwhNE6vAlrsKTifaWpS6uwS5txSqh5HqMQ/PmoSIyyD
         acsg==
X-Gm-Message-State: AOJu0YwEjTAayw1SZnsJfXeOTxHnbZKz9Q9UQ6q8y7bXvr70hXda6ICB
	s5IJQMk8o4Rw+WDUzl8vowTCZgn1r60Q7QnRrcSgATQaIU3LIC1Pm63piQccqEQO
X-Gm-Gg: ASbGnctm+llSOsExrvW0rJAvp6gDtQRTvl/tA7BJrVC7rzsNucuRI0WlZf0SzH+bsjF
	b3vWEEXq2KSI7EzfgNN+QWB4Djyxw1HdiIE/TOG9I3SBWWugDr4XBUqIuKn2AI7a7DPP4zso8DZ
	iGdO65Wl35w+p5Im0eBhfiQs45G6Ni1bsk/zC5BqApAw58oNjEam0xvd64EN62I/wxywnHqDU15
	dIWjH4mn6i2s5jqt09IMkcV+r7KZxz+477XNxPgwOD7J+u4KmOYzRIxOOSYic36JSMhDnCn2J1h
	KPxl8kQwF6fLr4qZgaybcuYGo/vF0XDnaop6ccCx2b8k6CoweN9kFJ2AVcPB5cBr+7yxiXrUpyq
	V4RXYTMS14S41fuTw6klG45nVPAPWCA==
X-Google-Smtp-Source: AGHT+IEAJRoIaB849PuRDRFFf7V996v9f81HG7ObviVK1aY1Zooht8chacBhp9rGPXIOA9QtW4a39Q==
X-Received: by 2002:a05:620a:3184:b0:7d2:16f:b5e7 with SMTP id af79cd13be357-7d2199c05c5mr895171485a.54.1749090887476;
        Wed, 04 Jun 2025 19:34:47 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d218d56b59sm317690385a.83.2025.06.04.19.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 19:34:46 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:34:44 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] cni: make ca-certificates a
 packageconfig
Message-ID: <aEECRB/Bswa29tiz@gmail.com>
References: <20250526210708.3721789-1-patrick.vogelaar@belden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526210708.3721789-1-patrick.vogelaar@belden.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jun 2025 02:34:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9270


Something mangled the patch in transit.

I had a reject, but fixed that up.

When I pushed the repo, the author was invalid (the mailing list was
referenced), I ammended the author so I could push it.

I know I've sent the instructions on how to fixup a send previously,
but can't for the life of me locate them right now.

Bruce

In message: [meta-virtualization][PATCH v2] cni: make ca-certificates a packageconfig
on 26/05/2025 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org wrote:

> Moving ca-certificates into a packageconfig allows using cni without
> installing all the certificates.
> 
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
> ---
>  recipes-networking/cni/cni_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index b41b47cf..2cdbb169 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -89,10 +89,11 @@ do_install() {
>      ln -sf ${libexecdir}/cni/ ${D}/opt/cni/bin
>  }
>  
> +PACKAGECONFIG ?= "ca-certs"
> +PACKAGECONFIG[ca-certs] = ",,,ca-certificates"
> +
>  FILES:${PN} += "${libexecdir}/cni/* /opt/cni/bin"
>  
>  INSANE_SKIP:${PN} += "ldflags already-stripped"
>  
>  deltask compile_ptest_base
> -
> -RDEPENDS:${PN} += " ca-certificates"
> -- 
> 2.34.1
> 
> 
> **********************************************************************
> DISCLAIMER:
> Privileged and/or Confidential information may be contained in this message. If you are not the addressee of this message, you may not copy, use or deliver this message to anyone. In such event, you should destroy the message and kindly notify the sender by reply e-mail. It is understood that opinions or conclusions that do not relate to the official business of the company are neither given nor endorsed by the company. Thank You.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9260): https://lists.yoctoproject.org/g/meta-virtualization/message/9260
> Mute This Topic: https://lists.yoctoproject.org/mt/113316120/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


