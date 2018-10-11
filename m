Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D211DE00AC8; Thu, 11 Oct 2018 11:39:34 -0700 (PDT)
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
	*      [209.85.208.177 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71A1AE00A54
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:39:33 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id z21-v6so9175009ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CVwSL9Bo8IANQb07YCm3aVp2o4xHS2ChB2IjQBLd2gc=;
	b=CBNnDVdkEUUwsimlKHu5qWcCpxLooTYIdI3cnQL81nWKUbmaq232MAj3OdVR62iCNc
	lmcNPrSlRhD+zD/cDEczqEgFNR/GXeLdHZhNfZ0YlyNfahS3WCRO/mfG1cpbs1ICsMUV
	T7BMA8PEDoS75UfHNZ0cixPfqrqjaMkNpzJfc3NA/Irv+119FWPwc1UMdmDPu9QZsm2Q
	ndDsPA55EaI/KxCuXQLxxlJkWWT/YsPpz7yB/moJ0sGOV+owgRw5vxOyn74Brkj8+4JC
	VGD3C4LdHrs3w8SiK0/my9wEkpys3HR1ZR9Yv8+6dTrss1QKarqt5XwLkekGMpvPvz59
	mSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CVwSL9Bo8IANQb07YCm3aVp2o4xHS2ChB2IjQBLd2gc=;
	b=VRimz/Afd8KSsqOwdfD23WsCvBMszUTPpPwncM7tXcV6NviL4R5efvWRKHpt+Pi/iX
	7J/foN5RrMJmbQAgIeGij8VYhNKoskQz3CEdS0N6zqqyji8JGBYw0G3Hy/KjY8Ep6HuT
	wkAb2yqTUg/fAubp6ILQeJB4EGcVp/DWG05ffBalEpXWg4UGYnnjkOA7vkUOO7ui/2Ew
	cY2xf+icprvNbNQvsgG0umT6QVjgyU95AMkDpIepNDvwkf2O1XbabpBOOcORIbsb1FZJ
	aIShnKpCX+8uljII21mNC4u3q/tEIzlziO6ph+WeZ8Zk1DUuOMz/8W0sjpi2+3eNFQV0
	GN9w==
X-Gm-Message-State: ABuFfoh8xtMqITKSxJlNrgSjPChl58/2xIPaD1KnXlFjWMerwN54BCfw
	brvj+BIwYfEhcC7oOIg6lSEkEGebI73VWouHibw=
X-Google-Smtp-Source: ACcGV62GLST+fMLNut2M8/1N0eQIwyQLhRHYo2nlJrpfXdwV9fHh/6wccncqHZYBfo4XDVFmDgf8sTvDxdaPhhR2gf8=
X-Received: by 2002:a2e:5109:: with SMTP id
	f9-v6mr1964821ljb.155.1539283172254; 
	Thu, 11 Oct 2018 11:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <1539271026-18249-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1539271026-18249-1-git-send-email-cjp256@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:39:20 -0400
Message-ID: <CADkTA4PrAMrrXUvJfBD-T8ujdzr=x=RUHNso7vTF8GNJ2O9ttg@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] ipxe: recipe cleanup and uprev to current
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
X-List-Received-Date: Thu, 11 Oct 2018 18:39:34 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Thu, Oct 11, 2018 at 11:17 AM Chris Patterson <cjp256@gmail.com> wrote:
>
> From: Chris Patterson <pattersonc@ainfosec.com>
>
> - Use OE's cross compiler (was building with host's).
> - Uprev to latest git (no releases)
> - Update LICENSE file path and checksum
> - Remove configure sed and set isolinux bin variable used in Makefile
> - Scrub LDFLAGS and use LD
> - Add xz depends
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-extended/ipxe/ipxe_git.bb | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
> index c0c8a7b..18c92d2 100644
> --- a/recipes-extended/ipxe/ipxe_git.bb
> +++ b/recipes-extended/ipxe/ipxe_git.bb
> @@ -1,10 +1,10 @@
>  DESCRIPTION = "Open source network boot firmware"
>  HOMEPAGE = "http://ipxe.org"
>  LICENSE = "GPLv2"
> -DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native"
> -LIC_FILES_CHKSUM = "file://../COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> +DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native xz"
> +LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
> +SRCREV = "133f4c47baef6002b2ccb4904a035cda2303c6e5"
>  PV = "gitr${SRCPV}"
>  PR = "r0"
>
> @@ -12,15 +12,10 @@ SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https"
>
>  FILES_${PN} = "/usr/share/firmware/*.rom"
>
> -EXTRA_OEMAKE = "NO_WERROR=1"
> -#PARALLEL_MAKE=""
> +EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}""
>
>  S = "${WORKDIR}/git/src"
>
> -do_configure() {
> -   sed -i s#^ISOLINUX_BIN[\ \\t]*=.*#ISOLINUX_BIN\ =\ ${STAGING_DIR_TARGET}/usr/lib/syslinux/isolinux.bin# arch/i386/Makefile
> -}
> -
>  do_compile() {
>     oe_runmake
>  }
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

