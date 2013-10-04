Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97C7FE0166C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Oct 2013 19:43:08 -0700 (PDT)
Received: by mail-pd0-f180.google.com with SMTP id y10so3382162pdj.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Oct 2013 19:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=93p5QnsZtVJ1IukzqLXAyqgTE+WTM3EYceBSGKVvLH4=;
	b=WnODugPv5vjMlW/GCk5tT7Hp5VjFH8Z0ntg73BjZU4i/xS461lm06agWjKQiLMCVi9
	V5zUkm8+b9kHjBXXDTeUisS2MwZVD3ia8Y1Ie2RwORGLIk7b0mGxN2gQ/5M/cSmPutq3
	UgbDVJb5e9gtLa/OpR5LBnFT4WprZEKWJWuLUdUkQgDylmRfvikHcZbuLOkLS46hH5oG
	KQUGthtEeJGkXtC9YoWGOB+rValo/3pg+cGNkcK2/lput8Ka92TmGdM/Wfv9H82Geyv0
	qqtYaeVlOsNaWrinLsA0D/GYsazphwvihreW6TeRmphTziSxKR9daoCknoM19zo5ocgj
	Q3QA==
MIME-Version: 1.0
X-Received: by 10.68.172.3 with SMTP id ay3mr11930118pbc.5.1380854587751; Thu,
	03 Oct 2013 19:43:07 -0700 (PDT)
Received: by 10.68.43.130 with HTTP; Thu, 3 Oct 2013 19:43:07 -0700 (PDT)
In-Reply-To: <20131002221420.GA2972@longhaul.twobit.us>
References: <20131002221420.GA2972@longhaul.twobit.us>
Date: Thu, 3 Oct 2013 22:43:07 -0400
Message-ID: <CADkTA4Papk_zS8xQrP_oaZe=XDZeat9fijThg1DYxcQZh39RdA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Put the xend daemon in the xen-xend package.
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
X-List-Received-Date: Fri, 04 Oct 2013 02:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 2, 2013 at 6:14 PM, Philip Tricca <flihp@twobit.us> wrote:
> Just a bit of clean up. I know xend is deprecated and hopefully no
> one will use it but it should end up in the right package.

cleanups are good. I tweaked the short log to have xen:, but otherwise
no other changes.

merged.

Bruce

>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen_4.3.0.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
> index 00394b9..0baea97 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.0.bb
> @@ -276,7 +276,6 @@ FILES_${PN}-misc = "\
>      ${sbindir}/gtraceview \
>      ${sbindir}/xen-bugtool \
>      ${sbindir}/xencov \
> -    ${sbindir}/xend \
>      ${sbindir}/xenperf \
>      ${sbindir}/xenpm \
>      ${sbindir}/xsview \
> @@ -519,7 +518,10 @@ FILES_${PN}-xm = "\
>      "
>
>  FILES_${PN}-xencommons += "${sysconfdir}/init.d/xencommons"
> -FILES_${PN}-xend += "${sysconfdir}/init.d/xend"
> +FILES_${PN}-xend += " \
> +    ${sysconfdir}/init.d/xend \
> +    ${sbindir}/xend \
> +    "
>  FILES_${PN}-xendomains += "${sysconfdir}/init.d/xendomains"
>  FILES_${PN}-xen-watchdog += "${sysconfdir}/init.d/xen-watchdog"
>
> --
> 1.7.10.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

