Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 923AEE0140D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jul 2013 22:19:43 -0700 (PDT)
Received: by mail-la0-f53.google.com with SMTP id fs12so8187733lab.40
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jul 2013 22:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TOfV4WMDQgNp7x89UM5eAg7TROa17sRoC8V7apEwywI=;
	b=QJd4UZHr8eh+vsRJmyncGaKYrH85UVwAGrKuqz4T1n05nOyHRemy2cMiqWoQEWKT/v
	1Hb9IVcXpjLgwalGZP7bPS6KtsvNeJb5cAFRvu8kqJKW8uw5nLmbL0Yj/HjCo+Nb8doS
	sjFTaH76GtM8ji4PlAbjEuJmcFy1OtxXgFgNhgMkpyfKDW1ojotAwZdjuROlL7m9dxT5
	7HrIlLxIKLeczQyZGJJefpC7EkU5YgZu+7ZajV5Upenx2MRf2HM0oyjrN/oJaHH8kFzd
	fkNVO56i3L275wMxgDEMHxSHAAbgs9c9locmM5+c93EoDTlED0UewvN/wRtlvOlJomTy
	DIaw==
MIME-Version: 1.0
X-Received: by 10.112.130.37 with SMTP id ob5mr20614991lbb.77.1373692782026;
	Fri, 12 Jul 2013 22:19:42 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Fri, 12 Jul 2013 22:19:41 -0700 (PDT)
In-Reply-To: <1373587374-3084-1-git-send-email-stickmanthe@gmail.com>
References: <1373587374-3084-1-git-send-email-stickmanthe@gmail.com>
Date: Sat, 13 Jul 2013 01:19:41 -0400
Message-ID: <CADkTA4PuTfncTH9m=NedFjwHA9GR_Ybc4X76OaQSj-M2RiX7ig@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Muller <stickmanthe@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.inc: Fixed typos in initscript declarations and syntax
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
X-List-Received-Date: Sat, 13 Jul 2013 05:19:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 11, 2013 at 8:02 PM, Peter Muller <stickmanthe@gmail.com> wrote:
> Signed-off-by: Peter Muller <stickmanthe@gmail.com>

Thanks Peter,

Sorry for the delay, I was on vacation!  I've queued the change. And
will push it
out when I'm back to the office on Monday.

Bruce

> ---
>  recipes-extended/xen/xen.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 6207897..ccaa8fe 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -222,7 +222,7 @@ INITSCRIPT_NAME_${PN}-watchdog = "xen-watchdog"
>  INITSCRIPT_PARAMS_${PN}-watchdog = "defaults 66"
>  INITSCRIPT_NAME_${PN}-domains = "xendomains"
>  INITSCRIPT_PARAMS_${PN}-domains = "defaults 68"
> -NITSCRIPT_NAME_${PN}-minimal = "xenminiinit"
> +INITSCRIPT_NAME_${PN}-minimal = "xenminiinit"
>  INITSCRIPT_PARAMS_${PN}-minimal = "defaults 69"
>
>  do_compile() {
> @@ -295,7 +295,7 @@ do_install() {
>                 fi
>         done
>
> -       cp -av ${S}/dist/install/* ${D}/
> +       cp -av ${S}/dist/install/\* ${D}/
>         install -d ${D}/etc/xen
>         install -d ${D}/etc/init.d
>
> --
> 1.8.3.1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

