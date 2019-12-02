Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.39.1575259931938666690
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I8bSk2br;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D0FAE010ED; Sun,  1 Dec 2019 20:12:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0262BE010EB
	for <meta-virtualization@yoctoproject.org>; Sun,  1 Dec 2019 20:12:09 -0800 (PST)
Received: by mail-qt1-f195.google.com with SMTP id g24so33192573qtq.11
        for <meta-virtualization@yoctoproject.org>; Sun, 01 Dec 2019 20:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PjRUzq9i0t92y3k/fDgDWAPadft0Ny8v2raX1Ha+shA=;
        b=I8bSk2brcAcOLocbD9O0YveYNjBKbROoVm3+c5jou3zFOJ+8t6lfc4kLNQ8bUuojoG
         dLmAbxidgU/HrFba1jDrWfe09DKUqwZL+JPNCf1fuzP6CM/5zFlBjzBFqyzun7NUJhP+
         CESiDRHO+aKhTfo/Wp1t817TGF+OY2wHWUNIlA4G4nDjMiJ+CtILYQmCelrjnOEiXyrO
         1c6XgB/qy4xuxZYWTjCdzpeAKa1SYFR/UXSp5MYeJZvyT/JhVKIvb+epO/kcnTnK1iwo
         uARuoK3kTwig3O9kKkASRytMqa/BdKSgxdmus3bgG11WnMIuQgSQ6lfD0SR3MtFFta5u
         moVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PjRUzq9i0t92y3k/fDgDWAPadft0Ny8v2raX1Ha+shA=;
        b=qfwe/S0QYFtTIVJj/CfO98PtKU8Eo4N7fEhr9sEOZ7uTTjId2Lsng44O8HI1CjIg4j
         rjLgh8eo60gRA5dE3oW5vhgIsVyZ7GRyxfOeCfjA+vKHHfnJY4hKOoW2PQw0GcqHZPmS
         /WGW1pHQG7ChazXNfsfhFpyO7543K3UClIAA37f4KfwU4GVucW+RqmGcIDqHYOpW36Gn
         /wrUtjKlCXltBsmZ1lHpSRcxvruRwOVxYTDuFi3JtosvmzM5VSAHy6sD9lM0b+syiDv6
         4cqcs6lhCPO1ke3YATaoYiEPyZP79P5B9guWK5dkCSYaViQXaJFgvhkKUd3mOH4AJLI1
         eLjg==
X-Gm-Message-State: APjAAAV+gN3dWY9zyak/f7veIdxEKy4IGhZGRxJdIc8rhY3jv2N62W5o
	uepOZEl7zrpWGPOhspjhBR+lZqeHtEQ=
X-Google-Smtp-Source: APXvYqzLjXS/mljEA08tupwBXsZWrSvvNu1I3+2F+q1P+y2+Ww4uOsZ0ROnXh86Je6IBCKlfk/UKWA==
X-Received: by 2002:ac8:745a:: with SMTP id h26mr64581651qtr.192.1575259928060;
        Sun, 01 Dec 2019 20:12:08 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id c12sm2410198qkk.83.2019.12.01.20.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 20:12:07 -0800 (PST)
Date: Sun, 1 Dec 2019 23:12:05 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: nkaminski <norbert.kaminski@3mdeb.com>
Cc: meta-virtualization@yoctoproject.org, piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: Re: [meta-virtualization][PATCH] docker.inc: Add xt-addrtype kernel module
Message-ID: <20191202041202.GA27618@gmail.com>
References: <20191128195952.8230-1-norbert.kaminski@3mdeb.com>
MIME-Version: 1.0
In-Reply-To: <20191128195952.8230-1-norbert.kaminski@3mdeb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks!

This version applied and is now merged.

Bruce

In message: Re: [meta-virtualization][PATCH] docker.inc: Add xt-addrtype kernel module
on 28/11/2019 nkaminski wrote:

> From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> 
> Trying to use docker info and hello world container without this module
> causes a daemon error.
> 
> docker info error log:
> 
> Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the
> docker daemon running?
> 
> dockerd error log:
> 
> PREROUTING chain: iptables failed: iptables --wait -t nat -A PREROUTING -m
> addrtype --dst-type LOCAL -j DOCKER: iptables v1.8.3 (legacy): Couldn't
> load match `addrtype':No such file or directory
> 
> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> 
> ---
>  recipes-containers/docker/docker.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 0083902..32d4a2e 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -29,7 +29,7 @@ RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                   "
>  RDEPENDS_${PN} += "virtual/containerd virtual/runc"
>  
> -RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-xt-addrtype"
>  
>  PROVIDES += "virtual/docker"
>  
> -- 
> 2.17.1
> 
