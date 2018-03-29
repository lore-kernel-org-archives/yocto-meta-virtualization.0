Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C38C0E009C8; Thu, 29 Mar 2018 05:03:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9021FE0084A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 05:03:48 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id a22-v6so8035934lfg.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oBF6eLBB7kxSKiuyYrmfWpNeixQUrbCbumoPuuEOU5A=;
	b=qZVKbXE2YwoctLgFjIlPzMKBDQK4AeTGEcIEbO/rc85p3w+AXTGaxuf8LZbEtw4V3S
	fgVU7Pq2drWDEXd6QZ7aCa41a26m+/QIfrjecB6JXezxaXTtoFJeTDaWrDcpowvcT1bT
	Q5/ZN4Dy1rveTNFqI8yBO3S1eV6gvw5qLCM7/kZ+Ha83l4M83gCVcogCN4RxlzDRenKo
	8rmxgPCUPbTn7jXCh+IeNejCiEVhHFpq9dLorTzjT9XOJ1oKeLwLF4BcNhgm7nUi6a8B
	MyNuRuwI/iCRvkIrKj4pGI78iU1pGZNMMT2M/e5138HdD4aFLC0Iu2A4ElFC+dj8kkkY
	xc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oBF6eLBB7kxSKiuyYrmfWpNeixQUrbCbumoPuuEOU5A=;
	b=RHI4EbkIwYf6q8QNJFZ6S9vuMqudykrQwu+WM3TgCzTBPHIZJ0x+KWgidgUArxJhaA
	AuKQqLIJo2oiCcST2B3cC0lfDRhJTSAVqpSKxBFzSU2g2s5d6EM13bDg1Zf3O+/QHCKp
	ygmq1yT4RcxQefj3dvaZa2DZLi6LUoVmVTcxbtREeaS/IxErNcKvMD8EYZOjmsiPNpSQ
	AltXmnv76aINEMcB8DrLFWyoBYYHI7mZxRufOsUyOtB+I+8SvKxhWv/QVPl7qfVTmonw
	p3QwJb3+8UQ60kKeZ51J/AxvJgz8DgZCLMHGdINhNff8Igkaaz5FwYntL3bHcJM2UvwM
	Jiiw==
X-Gm-Message-State: ALQs6tAsB6XrtI1KXOUXoxDCL2v3ZKzeDLsAIjC8DVXCb1oZ1rSBzNqh
	ezP8EFD4w1sRB+cjnNT/qrFysdKBR0hfz1KDRWAPxw==
X-Google-Smtp-Source: AIpwx4/AVS5TPo4uVEmNtKCquarKmlJnOtFHfYRVX3uy07qESQge3bAMrDxQwXeihd6Cbt84ZZ+NATah0vlYBUDI7qs=
X-Received: by 10.46.9.148 with SMTP id 142mr1476463ljj.129.1522325027610;
	Thu, 29 Mar 2018 05:03:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 29 Mar 2018 05:03:47 -0700 (PDT)
In-Reply-To: <1521775736-38102-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Mar 2018 08:03:47 -0400
Message-ID: <CADkTA4PfWygzQ8+=V5VYsDMr1gE0efQD5PXBuP=WRwhtv3RXuA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>, 
	Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-mox3: 0.20.0 -> 0.25.0
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
X-List-Received-Date: Thu, 29 Mar 2018 12:03:51 -0000
Content-Type: text/plain; charset="UTF-8"

These are all merged, except for the headclient update, since I was
waiting to hear if it
impacts the uprev to the OpenStack Pike release.

Bruce

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-mox3 from 0.20.0 to 0.25.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-mox3_0.20.0.bb => python-mox3_0.25.0.bb}           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-mox3_0.20.0.bb => python-mox3_0.25.0.bb} (75%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
> similarity index 75%
> rename from meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> rename to meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
> index 95ed6e1..062fc7c 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "53be7bf2d109c8bdf477c75b369773b8"
> -SRC_URI[sha256sum] = "7b1549222353f6cc5b705734ef186fe2cc323d30c3987df50eceb77273595606"
> +SRC_URI[md5sum] = "77bb9a6a57187b708d822bad05c51e0e"
> +SRC_URI[sha256sum] = "b7476f7a2dfe4d7ad743e3cbbf04ade624b3a208a0042f3f8b2ae7b00559543a"
>
>  inherit setuptools pypi
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

