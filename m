Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26946E00BBF; Thu,  8 Nov 2018 11:54:38 -0800 (PST)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B334E00A54
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Nov 2018 11:54:37 -0800 (PST)
Received: by mail-lj1-f195.google.com with SMTP id s5-v6so30710ljd.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Nov 2018 11:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ncdhgMzzRPFVDYULXOATtYE8+ZnbnulZYreyYB+yARI=;
	b=AfWr8ilOP243it0SqWGZyHBEetcVlQFmEge1LEh6FY1XA6QM8QeFkusP2CmSq/wGHN
	1ZTyzU8b54HYikCAbaxTIZplXCgoALy3yC9LY0RKkb0H6qrnihAvsYq5TvzpC3ieTAW7
	AusWPeOicZZuS4fi+MBK/Gp9I7fCTKcgBUP5YVLkW2G27fw4nKO7uUtpP8hheAJu4Wp6
	wQjTNZR4dsGXRXJFwV7BQn1sFyqe4zGTRhA7/SvrtqB9NnNa3sAjPbgQILzFO4Gbv0c6
	e9cwRX1+PT+xP1v4BA1BbO9N/00QFb4OoqrqmMMf+N1q8o/iNDeAVZjVPLR5HAQPYSWq
	dY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ncdhgMzzRPFVDYULXOATtYE8+ZnbnulZYreyYB+yARI=;
	b=JYqmq2oSFcb0LBpa5iQmbng2taP6qQVJAoK7IwfqkXYqPZbrmL5EkMyFVMD5DPCq/L
	tv+BScCXZ2IIwLqtvsZG02VxbvuD0n/zj3/e0aKoyxHt8ElOxlxxhGq+xPgdxBWQPQ1S
	Ii2MlVlqfV12ZOTRbGNxYLPq1f5wmc/aKcYSDHxePKVsIIatw0mYD2Y4UXdjmRzkBg/Z
	OCcEIx+w2L8hQ0ypCdfHqMe/U9kx3MeUC/vraNl7WmXin11V15l/n9QpsMXtYRo+4z/5
	5M4zmBpS0gPk8xupi/P6GPs4zqwPVm4iWWCIMEDkFVbW+3PDaxW2zs3lMOBI65buwiPo
	mhFQ==
X-Gm-Message-State: AGRZ1gJuL59+8qZilIUk5SJPC0Vz2ZEERlmvEX/NGYPviiVVpyWmuXLB
	tcC5l+E3XoJI7Li5ttKQFIrBTF1cVpC71W75JhKNYC1U
X-Google-Smtp-Source: AJdET5dRnY45AZH9gPgJiGu8OwPW3cGvABJumajaKUmQIRs6V8xkq5oivIJRq18zk4c8usVSJl+XbBEJH/9fWR0pdfQ=
X-Received: by 2002:a2e:5555:: with SMTP id
	j82-v6mr4057087ljb.69.1541706876186; 
	Thu, 08 Nov 2018 11:54:36 -0800 (PST)
MIME-Version: 1.0
References: <1541654317-38773-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1541654317-38773-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Nov 2018 14:54:24 -0500
Message-ID: <CADkTA4O1eAXA8jMFHCdLMbVxDKPYdeoJbdJT3-G_2v2Ezx5wRQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: fix rbd create operation not supported
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
X-List-Received-Date: Thu, 08 Nov 2018 19:54:38 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Thu, Nov 8, 2018 at 12:18 AM Dengke Du <dengke.du@windriver.com> wrote:
>
> When using qemu-img to create rbd based image:
>
>     qemu-img create -f rbd rbd:libvirt-pool/libvirt-image 2G
>
> Output errors:
>
>     qemu-img: rbd:libvirt-pool/libvirt-image: error rbd create: Operation not supported
>
> Accroding to upstream's advice:
>
>     http://lists.ceph.com/pipermail/ceph-users-ceph.com/2018-November/031014.html
>
> This is because the system can't find libcls_rbd.so, this library
> was packaged in ceph-dev, we should package it in ceph.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-extended/ceph/ceph_13.2.2.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_13.2.2.bb
> index 3d9faae..08021cf 100644
> --- a/recipes-extended/ceph/ceph_13.2.2.bb
> +++ b/recipes-extended/ceph/ceph_13.2.2.bb
> @@ -80,9 +80,7 @@ do_install_append () {
>  }
>
>  FILES_${PN} += "\
> -                ${libdir}/rados-classes/*.so.* \
> -"
> -FILES_${PN}-dev += "\
> +               ${libdir}/rados-classes/*.so.* \
>                 ${libdir}/ceph/compressor/*.so \
>                 ${libdir}/rados-classes/*.so \
>                 ${libdir}/ceph/*.so \
> @@ -102,3 +100,4 @@ PACKAGES += " \
>         ${PN}-python \
>  "
>  INSANE_SKIP_${PN}-python += "ldflags"
> +INSANE_SKIP_${PN} += "dev-so"
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

