Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72E29E01514; Mon, 16 Jul 2018 08:33:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39CBCE010C6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:32:39 -0700 (PDT)
Received: by mail-yw0-f193.google.com with SMTP id w76-v6so14315026ywg.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xHi+lDVRba9l2E3rP34xz/Rey/UEmljZl8RM9tU88vc=;
	b=Lgown9F+CIKOXUfnfWhLigK/p8Um3w9rAfnrI2OaN6b0Q1zXsaCy7HJnkLbfd4eo1o
	XvYrcqaup44tp6hUFWQJ0j5W36NwD8SbvtgtP2Q/EkkXSTvobzn64DQuvq684RYiPYO7
	gPgpcSBXnqCpLad1JVusu41KPycN5cOfYG8XpROdcABZlZ0C7cJHnq3S2xMmVmxnvPEW
	aDqdLhF8G6X1Ys8+cUrYqiHuX0ng5NZT+HJFogNAvvanhC2dNiZCwPqZ6ALG7UXHLnJs
	F82v9g8VXI/tE2G/ykvF/v2Vpt4mL9dQictStnMX2itdxfqwGcNlTHu3HYaAAv8FXaMc
	7tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=xHi+lDVRba9l2E3rP34xz/Rey/UEmljZl8RM9tU88vc=;
	b=iYgN+lZ9fTtWLk85kntILXIB/s+7XVUb1YaWyEV2sVszThI8hYKW/fF9kPsf6k7vBZ
	DGXfwXcA9SJJkapmZ5LD7RvHcF/GUV/8nrJ9CLB0vkSgoIGXIUlM0mciBy+hlcIv+fG3
	WO+cUKhU5mEet4QUfa6vPg36T6F+yOjgsMyiwNwHdxaV5NpFz2ObQQ/3tFSSV03QQ/40
	j0lJChTT/k+2IFiKn9H6wb83Z9jG8qredlRksJsGvp/7VuXS+qclPFG73PT5JbtcP7x2
	4u4RYQnW7Jy4Qg/MDMJscG3ToDOqhObTvOt1CesUEieEo4qbvxbe9PuygnP57L/eR+ka
	DR0w==
X-Gm-Message-State: AOUpUlEInuZQfVz7shfUMeKndGLAQny+CSj/j3VWdLnMjI2xcSybCF9g
	OCibstSsbeF1nG08rtt59Pg+6WWlMA9DVppDNII=
X-Google-Smtp-Source: AAOMgpcJKODdvvsl/XFPn89yVl0M/M3W/C80p3fUzgsmmvPHQNqCxW1X8RXuFPHD01whQOE3LLTwe61xT/qVJi+BcXs=
X-Received: by 2002:a0d:c342:: with SMTP id
	f63-v6mr8555987ywd.508.1531755156569; 
	Mon, 16 Jul 2018 08:32:36 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Mon, 16 Jul 2018 08:32:36 -0700 (PDT)
In-Reply-To: <20180716093631.27024-4-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
	<20180716093631.27024-4-hongl.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 16 Jul 2018 11:32:36 -0400
X-Google-Sender-Auth: XVpYY4xN6MnUJd7MgC4ngChNsVk
Message-ID: <CAPuovEKfcRuHN0Vvdpfjkm=LT_=-b94y6WA3QXG+rzvgRyieRQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-kombu:4.1.0 -> 4.2.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 15:33:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-kombu from 4.1.0 to 4.2.0.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---

This should be fine.

Mark

>  .../python/{python-kombu_4.1.0.bb => python-kombu_4.2.0.bb}           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.1.0.bb => python-kombu_4.2.0.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> index 8d44426..47cb5bf 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "2fb2be9fec0e6514231bba23a3779439"
> -SRC_URI[sha256sum] = "4249d9dd9dbf1fcec471d1c2def20653c9310dd1a217272d77e4844f9d5273cb"
> +SRC_URI[md5sum] = "cb7e668936cd5ffc3232b72a2a4f931f"
> +SRC_URI[sha256sum] = "d601c47312833c0f6f4aaf037f293b2627398d4cf8526e6ba0360287294ee1fb"
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

