Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88AF8E00CEE; Thu, 26 Jul 2018 07:41:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4F11E00CDD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:41:19 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id b22-v6so1381294lfa.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ct4nlEX8h+Mv7pvHVTpB3rt+lPytGUaUY7AkoFYBGlo=;
	b=ufRdnXZzDHBDUwhhAHdKzletOdXAwHDgWjZCwDgoz25RyUq2TJW5FiEfy3qywcrZzz
	SUoT+dPgg8f2uOcNZJvkiIARcAcuQJUe4T0xNT/WesGOghADRMRWxJs88MYQfA5q44pH
	pMcjj1TevzXN2sJQhEfPZIvZ5qe1Q/ORMRYiFgJSokNHcrGIrEMnFCU4R1nULniTpKoJ
	sOLxpOF/zfFnRVeunkstAsgK0L6/hxCHW2xbnxNvxhBLEC/bTJnOvk5QtywyhpyptF14
	mponXFgzU6/rKBSkhryVWM3LTbcgCSc4pIne7GDmsNtyiblEZAnXqJWRMAc8LhTO53nf
	wjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ct4nlEX8h+Mv7pvHVTpB3rt+lPytGUaUY7AkoFYBGlo=;
	b=TLGXvDEIn3BqhQlonhz4IAiyWTjZLhnGx4VOT9O8ERgMXjCSNS//x9y77z7wn7zMA0
	drVibvT+JB/5IHLHh3r3eTkEGnUKXw1dwO4NUEHKMyTxyR2ZMHYgeGWAZLbU8m/UlGjX
	viJ4Omq10Blc2mp025bXSJ/JeRV8DOsKcJUP8Oqc48HvTKtiiuakyiEs7GB6H+N81CUQ
	yzoAZ3KW2o36v8sKi8oni8F1WuuapO55ORgYiShP6BqesBnm/ZNXMB29Tzpv5gciF3o5
	tjR7TVSjnHlR1MTYgvyi3dAjD6CnBxRM7rBgzT+gMYR44AB6tGa8TS+tpnAepsB/PiiP
	OqLA==
X-Gm-Message-State: AOUpUlGaR+1+C+dC/JjStPk620pjXr8EYAxPEv2rBS4p5uBrdOC6hk5t
	oa0K/Q2cSlNgeM32t/9ziY/rUS5wrOUBB8GlkUw=
X-Google-Smtp-Source: AAOMgpfLUT9wS4iRIBF6XE9uZca0H2HqqzSRrS8MEibErwC2DL1c9WWFcNDx+rZkeJtOLqcq+JN1QiKPFCVHBUO/okM=
X-Received: by 2002:a19:5509:: with SMTP id
	n9-v6mr1701182lfe.133.1532616078502; 
	Thu, 26 Jul 2018 07:41:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 07:41:18
	-0700 (PDT)
In-Reply-To: <20180724110856.925-1-zhe.he@windriver.com>
References: <20180724110856.925-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jul 2018 10:41:18 -0400
Message-ID: <CADkTA4NEFB1pKFBmbHdNGRF1nKNdxUmqHvwEPqPA8HLsG8KQMQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux-yocto: Fix systemd-modules-load.service start failure
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
X-List-Received-Date: Thu, 26 Jul 2018 14:41:20 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jul 24, 2018 at 7:08 AM, He Zhe <zhe.he@windriver.com> wrote:
> systemd-modules-load.service bindly load whatever in modules-load.d/*.conf,
> in this case, kvm_intel and kvm_amd. One of them must fail on a specific
> board and causes the following failure.
>
> This patches remove them from KERNEL_MODULE_AUTOLOAD and leaves them to udev.
>
> systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE
> Failed to start Load Kernel Modules.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
> index 9905ed9..c09b07c 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -10,8 +10,6 @@ KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'featu
>
>  KERNEL_MODULE_AUTOLOAD += "openvswitch"
>  KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm', '', d)}"
> -KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm-amd', '', d)}"
> -KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm-intel', '', d)}"
>
>  # aufs kernel support required for xen-image-minimal
>  KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> --
> 2.11.0
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

