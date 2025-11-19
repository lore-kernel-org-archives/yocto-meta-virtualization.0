Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0834ACF6495
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:29:52 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20874.1763594990247622443
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9T3kihN;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee44df7750so2290781cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594989; x=1764199789; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5KOKPUrce9mxMLAG/zlNR+32e4760GATY267L4HqEN0=;
        b=Z9T3kihNloIbWTEOfrbApXO+aQZecPaeZYcuj6DCHz81J0o1a9/4/4FaxSn+AFn0pt
         WawQqC20fcy9BpDDFCRicUK9oOvA8cC+RgT24Z3c/5sMG8b2ihv36szV5JYWlSpsmX27
         /e+xnVoBQZR/fDhKI+PjmcclrUqQ10ICHqlKbcNwMSCP0vRl2P3XZuWs3vwguxwIzYFk
         AjXmYUMq+t+31oPtxGQ8peB9l6c8RKZDB9WYHK3qglYG7fjRXdZ7QlXfwAK5SIdW9Yka
         O2egzpwhv1pkkR207xwM344peqKw/oYsDjfq/uPHRJxcjnHHQB92+DXOHoporSq1bXY2
         QF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594989; x=1764199789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KOKPUrce9mxMLAG/zlNR+32e4760GATY267L4HqEN0=;
        b=fBzY0S2WHDq8rWjSAKcjlkfGHdmscK+yxdSQxkBUVNAUI4WjFS0n2c+LEek9L+9VDM
         B/Pnn+S5wdQPMsjCdwbizFx/+pNR05ZeuVTTxlkNZ1yUQUFplGLoajQV1QUfVh8OCVF+
         c7X+A80zS6jgvrhs+V0IZdEJ5MNue1JeEnevzw9FjkgbaBKQfbSVT5ef07PFjTdYs70y
         vlkeF8/dKae6omHBxAEdJWMJ5Enzy3q3bxXbE1iscDphQvg+xssqRHcxzMxGgf0gFjFj
         ps+8/cQl2qUmSolECFqs7jm4cynUsIOnawabXBdwkX86P3B+bwy0Uu89I9xkcVCMR+cG
         9SxA==
X-Gm-Message-State: AOJu0YxJ9LqBU/Z1Bu8U75X744eUhdogd7gRc9aaiaUGUAnzBnUiBnhC
	MG1DsKIuJnFBmQjpvXIu/tjmF9QoKocLsYVXoAuj8aTr6QzUg/TA6qRuFUBQmdEd
X-Gm-Gg: ASbGncttQR3oYmRp276KGvMGgQtvJuV6BAq9+fxclPQu1ll60xNZAn7mNehtDzQwZxb
	rIRs/mvYvfdQW9XDq1W2P6nc9kZhDYVYzZ9MBTL+a8ETGLTANKssabgR1bfoXYP8vdzw07OVHpg
	Dpoy5SqxPmKqOVyxK5rs+ffXAc6bjD9F3qO8xczXe83k7pOAYGL0eM9LYAL7fg655PJ08D39uZ2
	FNA8djoAz6zH3Yol25re7AeiEYviQV9oJbGDkYrb4qf7D5ZPJ5ADuuXeTBSZPE9ZSS8mfDUwHy0
	NUngQWQJO002kdLxvwUzeK2GkjCzSZLzK+Hy6A4bf1+2AP3SFdJ6wryqvoUyURut+/Hrs7fhkuH
	6aYJmWdGdogVGLSg/TLvycNv/8YwieIaoqFWC0/CN1kQU8dFsd9rFYJDWso/4ksc3Yie21P39Er
	aMdR51++07lWKsr5QugtR1Q/WieV2HDN3nHjRo7CwagYb2SA9Joyg2uyLYesBC3atfWCTqChh+F
	Rc=
X-Google-Smtp-Source: AGHT+IE+shs6TuVZZJrN6Fb9AVdGFemgxxJFglKLkmt+mfPzs+jc3zFX0IaP5gIynYJsjPUmvaxWZA==
X-Received: by 2002:ac8:5a03:0:b0:4b9:6bbf:7073 with SMTP id d75a77b69052e-4ee4b0d35c9mr6779041cf.53.1763594989237;
        Wed, 19 Nov 2025 15:29:49 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d6aab4sm5959391cf.15.2025.11.19.15.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:29:48 -0800 (PST)
Date: Wed, 19 Nov 2025 18:29:46 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: matt@mattfischer.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] Add gpgme as a RDEPENDS for podman
Message-ID: <aR5S6n2X6jYW4VsN@gmail.com>
References: <20251118205020.50459-1-matt@mattfischer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118205020.50459-1-matt@mattfischer.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9451

staged on master-next.

Bruce

In message: [meta-virtualization][PATCH] Add gpgme as a RDEPENDS for podman
on 18/11/2025 Matt Fischer via lists.yoctoproject.org wrote:

> podman needs gpgme in order to run. In some usages, this
> is being pulled in transitively by skopeo, but since skopeo
> was removed as a podman dependency last year, it now needs to be
> direct.
> ---
>  recipes-containers/podman/podman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index f20022bb..f09e01f8 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -143,7 +143,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
>  COMPATIBLE_HOST = "^(?!mips).*"
>  
>  RDEPENDS:${PN} += "\
> -	catatonit conmon ${VIRTUAL-RUNTIME_container_runtime} iptables libdevmapper \
> +	catatonit conmon ${VIRTUAL-RUNTIME_container_runtime} gpgme iptables libdevmapper \
>  	${VIRTUAL-RUNTIME_container_dns} ${VIRTUAL-RUNTIME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} \
>  "
>  RRECOMMENDS:${PN} += "slirp4netns \
> -- 
> 2.50.1 (Apple Git-155)
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9442): https://lists.yoctoproject.org/g/meta-virtualization/message/9442
> Mute This Topic: https://lists.yoctoproject.org/mt/116363696/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


