Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5A4AE00B92; Thu, 14 Feb 2019 06:21:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C520E0053F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:21:01 -0800 (PST)
Received: by mail-lf1-f66.google.com with SMTP id g2so4641571lfh.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9pOqSSOIWDFzNb7A6sLhB3iJx593x3KRZk3AdPpmLfQ=;
	b=U32GjFZRb3k6rGhfEMTN9hXqbzSVeX1r7X1BUM0fXf3gt1Ly9zuf4WFubRdoN+EL+q
	fcof+OF9keXVMOq66pSKt7NMAE56yj53OlaVfBMkqmzD/vQxhpuZLh4Cg8hqe5ms58SL
	VXfELmCGAfEkTHqJPch8w8HO/hsz1NBoj4xCLXSJvhEdLRWSDk64e1c8cTd8U+/kL4b8
	y3zzrNTcKCHAYbXwZ5ad2TCjAV2zjKH/YJi3prkZSt3Z9tTVhlEMqYKUwALH+yPtWbND
	4kn47b3Ba02SpYTCuno6oG1dadSjTi5r7hgGmhHQOLTJ4f/ngFWvjXRDw7m7WU5ClP/Z
	73/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9pOqSSOIWDFzNb7A6sLhB3iJx593x3KRZk3AdPpmLfQ=;
	b=mphgS9WFJ4Wl8OMV9Vbv+kveckHOAsUcKANxf2Zy9LhrfcDFUJ7HZjauHjcy7QTPBG
	avfOPIVgHz07+wM+8SShrMkiUEentjMIM+rkQpmMslk18BCuko02TsHcslSbm1TNqJXN
	M7u9TUsJT0dHIJNn4BzjJW/EMNd2lb+W1s9F8IyQ0bsDhZQdZe2N6yIqCalICv4i4NZW
	mv1BqKfAJ7rkJ4ZL40rzkES5vlOI/T+Ar6x9Hi88I2lNzm2bYc7IsZ9RWF9pIwCFjPK9
	5L+o//BJ5yPjs94gFrUyPChf9yreYVw8Vw/AcLO9w9/VfOFwoZSqicgN3AsOPgSHZnCN
	7VLA==
X-Gm-Message-State: AHQUAubLfhG4nXKxpcgubmlvUdo2ia+Lq8dCs0ANifQmHaPUb/nxGGKc
	NXD/h9liD31RG3IwCfDYrr9olUpgcik6yRTGQ9o=
X-Google-Smtp-Source: AHgI3IaZaONuKyceziXvN4kna5bKt83jydECCgvHlNvYtsL45raKvTETPFI/zdnqmCxteK1BD0TLD5BPcHXYvIw7Spc=
X-Received: by 2002:a19:4f15:: with SMTP id d21mr2486483lfb.86.1550154059919; 
	Thu, 14 Feb 2019 06:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20190214034453.31484-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190214034453.31484-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Feb 2019 09:20:48 -0500
Message-ID: <CADkTA4Nz7zKB1cE38jXE3eYziept2oAfSvYHvZEHPf2Vdx8R_Q@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-paramiko:upgrade to 2.4.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 14:21:01 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Feb 13, 2019 at 10:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-paramiko from 2.4.1 to 2.4.2
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../{python-paramiko_2.4.1.bb => python-paramiko_2.4.2.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-paramiko_2.4.1.bb => python-paramiko_2.4.2.bb} (65%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
> similarity index 65%
> rename from meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
> rename to meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
> index 6906c41..a570c32 100644
> --- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>
> -SRC_URI[md5sum] = "f9fa1204f706767b6c179effa7c0fb9e"
> -SRC_URI[sha256sum] = "33e36775a6c71790ba7692a73f948b329cf9295a72b0102144b031114bd2a4f3"
> +SRC_URI[md5sum] = "a476ea106177fe22e797428d54811aed"
> +SRC_URI[sha256sum] = "a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca5445ce7df409f900fcb"
>
>  inherit setuptools pypi
>
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

