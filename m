Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA5D3E00744
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 21:07:05 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id er20so1996145lab.22
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 21:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JplxzUPDqSPkF2IvzigLkWuA7erWM9UKvZWaCHME/t8=;
	b=U8+BOKUPEf/4OA8QtOs3VaZaKtR+rckTpZ3x9leeelyOMTYOgL9VjkBK6xYhF1AyRS
	HBGerRiJ4JFOXUGwsHNzGFCMAZL86PCXsk0LSdcJ+I84fKLYOVt3HJYibBkktv1uTRAN
	Wcm1Ig8W+O58XUn1M4/8UH8+bzDq0hRJS6lrwHeLaEBiekWu3Csoa+3aaCc5gbzKetK3
	FRUWZ2N4mKN66UGginP5YXZyFpR1WwgtYlprFhmDyUxsAjoczgksyy3NqXpIi+eZ4/jT
	ifzwRxqlguVlgREP9AraLgfb92Qe3BEVdi6OaeJfaJBYImZBIqa7BLYBkL+Z6Y2IgXAv
	FE3g==
MIME-Version: 1.0
X-Received: by 10.152.8.199 with SMTP id t7mr14865131laa.21.1385269624189;
	Sat, 23 Nov 2013 21:07:04 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Sat, 23 Nov 2013 21:07:04 -0800 (PST)
In-Reply-To: <1385237848-30558-1-git-send-email-cjp256@gmail.com>
References: <1385237848-30558-1-git-send-email-cjp256@gmail.com>
Date: Sun, 24 Nov 2013 00:07:04 -0500
Message-ID: <CADkTA4Nkr1=O1oDkPKNpQ2fyNZdLZwABa_rOf8dJfZZVTNR7XQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen-image-minimal: fix syslinux dependency
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
X-List-Received-Date: Sun, 24 Nov 2013 05:07:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 23, 2013 at 3:17 PM, Chris Patterson <cjp256@gmail.com> wrote:
> Install libcom32.c32 when populating syslinux-based images.
>
> When syslinux upgraded to v6, libcom32.c32 became a dependency
> for mboot.c32.

Thanks Chris.

Merged.

Bruce

>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index 00146f7..13917c5 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -21,10 +21,12 @@ LICENSE = "MIT"
>  inherit core-image
>
>  syslinux_iso_populate_append() {
> +       install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${ISODIR}${ISOLINUXDIR}
>         install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${ISODIR}${ISOLINUXDIR}
>  }
>
>  syslinux_hddimg_populate_append() {
> +       install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${HDDDIR}${SYSLINUXDIR}
>         install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${HDDDIR}${SYSLINUXDIR}
>  }
>
> --
> 1.8.4.rc3
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

