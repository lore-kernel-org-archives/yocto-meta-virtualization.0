Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 294E5E00D1E; Wed,  4 Oct 2017 13:55:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B800AE00D06
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Oct 2017 13:55:50 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id d13so21095888qta.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Oct 2017 13:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7m64kxcwU6gvmnZzJNxVsYqpf3+2oO9Nni28fv2GcKg=;
	b=XZufeEcBMThhedL/PkvPgyKoP9nD8Lsm78iMKNje/SEotThvMFP4fNO276Q3oQ+QKJ
	vO6zB9jA2JuDw1ZsRyaBudgGcVpuHTfUwG4WyDDl+Gx1vlbPh/nrNhnflPqEyR4H8VMw
	v3g91PwYOY6HhZqMvTNJ9MRDQ3RxYVTfEDv4oZl02N6E2oqYrYPi01OU0ZBzj+QQ+TT0
	538P9c9zH5SsHLGVkDz5y1uYHnNi/3SYw2gLwk9FyHsoumnNcWdrGG79UhWMpH2lbc8Q
	KoGdYeuNtJRZdMej3NPv4zB2OSKAYzqnXcNIiGcOeVDO4LFZBaygS+AC/1l3hny1ZXO0
	7p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7m64kxcwU6gvmnZzJNxVsYqpf3+2oO9Nni28fv2GcKg=;
	b=JJFQXPK+zUqqolx4vLbtoeqsfyOqF5OWgYlomrPKfqOM0VeXWKrj6qnOQxPJHUZymn
	NeYd6JSYR4a+xIQOkkUvCVvPN5Y9mq3orqvLb2B4Mrb3JIGNx040ZsQs1fpY/DwKJKHc
	TCH6if+khuDrHFb2usms61Ap5jO9MCx/aehb3961sqT+xdEYl01YuSk8sfC6bl+Ils7C
	r4/y8+OYIb0ZLKdwlewDEYHtpiYVvo6v+9LaOFJz4voNboqXAm53Bhbe54t1o35ZbITv
	0Km3cKK6ffJKzIfSWgoxvaki+ex5Uoypqsac8tvOCRLzdYR3fgrb2as/rrTS+98VQCvO
	lMtQ==
X-Gm-Message-State: AMCzsaX/8uM90T8b5ahIUcSmWlkhDMcaHq4Y3KBFJX6x85Q6en+5Gwzx
	8ewTr1QEQtmL6Gxbcz7CvpRphJe9ilM+mZugrgP8iw==
X-Google-Smtp-Source: AOwi7QAqUgt/D/rrSz7QCvlwZVInEubK0675G9E7+zcrp0dpylxzL4rZ356qRft1eeItFz0rRT/3nOyV5A8dEin6u0g=
X-Received: by 10.200.38.35 with SMTP id u32mr12665588qtu.312.1507150549415;
	Wed, 04 Oct 2017 13:55:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Wed, 4 Oct 2017 13:55:48 -0700 (PDT)
In-Reply-To: <1507057406-19771-1-git-send-email-christopher.w.clark@gmail.com>
References: <1507057406-19771-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Oct 2017 16:55:48 -0400
Message-ID: <CADkTA4Ou5FwWqFxFhwnWZZYH-vjRtUUYtw9WJZtgTUz71sE01A@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH] xen-guest-image-minimal: remove lines modifying DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Oct 2017 20:55:51 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Oct 3, 2017 at 3:03 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Remove recipe lines modifying DISTRO_FEATURES that were intended to
> simplify the non-x86 x11 image dependencies, but did not.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> Reported-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>
>  recipes-extended/images/xen-guest-image-minimal.bb | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
> index bca6017..d311eae 100644
> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -13,11 +13,6 @@ IMAGE_INSTALL += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-fbd
>  IMAGE_INSTALL_append_x86-64 = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
>  IMAGE_INSTALL_append_x86    = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
>
> -# When xf86-video-vesa is not present, add opengl and don't require wayland:
> -DISTRO_FEATURES_append = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', \
> -                             bb.utils.contains('IMAGE_INSTALL', 'xf86-video-vesa', '', ' opengl', d), '', d)}"
> -DISTRO_FEATURES_remove = "${@bb.utils.contains('IMAGE_INSTALL', 'xf86-video-vesa', '', 'wayland', d)}"
> -
>  REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' x11', '', d)} xen"
>
>  LICENSE = "MIT"
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

