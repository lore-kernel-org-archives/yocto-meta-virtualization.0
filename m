Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16893.1581455677006630667
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TeNVHRh8;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88181E01723; Tue, 11 Feb 2020 13:14:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65CEDE016D7
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 13:14:34 -0800 (PST)
Received: by mail-lf1-f66.google.com with SMTP id z18so8093272lfe.2
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YypHjr/tSoVT7f3q/sQ1bAVYUu6kWOWnIjNcz5isLy4=;
        b=TeNVHRh8zcCdJo4xW/BEep+jUzaKmkgHA32Jsw3VE+OwlPVWGDKcP9jq6i8PvYJ2p6
         rR2bo5xvD7VXghoTv52mianhxbQrm5OhPjYoy1sJ3irXm44/9yUD2j8ahQTzxuTMtpla
         AcUkxZKXliQiF395KrAyzNoKrzyM++b2dEh09peEEDBqsoAMX5+eto5v2HN5Rug7cRf6
         wfU8UzgJXD6Z/ttE5USS6PKifKuKWYibq6Ojvb+lPyvfJQxrbbRhNzp7hw9oBRKVXQD+
         OnSamw9xEhxJ2r2C46WHWeuDHiP7/+artUAw3Hz6uhnbBkctjrlSPCQUiZ8u9+j+e0S5
         /S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YypHjr/tSoVT7f3q/sQ1bAVYUu6kWOWnIjNcz5isLy4=;
        b=IprahCVkV1ZqAXFODoscmhS5TTEyQLyToZYr03vq5gS8SZHMHNkdl69PkuZNvI/tv2
         UdeV1RUU51ALKYAY50UY0Em7sZhU8OJrkvKcd22ZbI4JuT036BZXNfMG5GwEvUuObQmn
         qNs9LJVoZcFXNbP1fQDNWKorp8yyG01JtFUd6b7i5G7pnrMxPcn5PXoSNjMaWMAslcx6
         IgS93Y9iBDJtur2d2ygZ15wPX1DP6FLrjsXGkmGUIdhLvmn2LTu3EKrsVrvKKv1GP2jl
         BEZ2vs37pwU1/Bl6HORL1K4t3tCXE/VhGldJW7QxBBZ/KVvGBUTEYFWKKDGxzM9g2Kbs
         +r7A==
X-Gm-Message-State: APjAAAV8Gs/E0ec2A7hRfIN64b3p7pfHKkTMVjecycrcRMpU1mIYi8jv
	BvHXRXVVn9x5aTkGrevW93gE/jKZaK+phG7qyuw=
X-Google-Smtp-Source: APXvYqyTLVTmlDVIcyVJx1sp5emF2BKFaGyNZkqlDnMtUJFIUHeJz1B5ZtZVsu2tmqF35ayLtCY7aTR/4gsJZyjFn40=
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr4671686lfm.189.1581455673149;
 Tue, 11 Feb 2020 13:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com> <20200210050754.3534-10-christopher.w.clark@gmail.com>
In-Reply-To: <20200210050754.3534-10-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 11 Feb 2020 16:14:22 -0500
Message-ID: <CADkTA4Mj=j+wQQ2=8=mXUiLEJcBHGyg5Pfhn+UHTbhDDDhwLYw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 06/16] xen: retire Qemu packaging from the Xen recipe
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, 
	Eric Chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Modern Qemu supports Xen and the qemu binary to be used with Xen should
> be built with the Qemu recipe.

A nice cleanup/simplification!

Bruce

>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen.inc | 87 ------------------------------------
>  1 file changed, 87 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 146e02b..fa0044b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -217,7 +217,6 @@ PACKAGES = "\
>      ${PN}-misc \
>      ${PN}-pygrub \
>      ${PN}-python \
> -    ${PN}-qemu \
>      ${PN}-remus \
>      ${PN}-scripts-block \
>      ${PN}-scripts-common \
> @@ -546,92 +545,6 @@ FILES_${PN}-python = "\
>      "
>
>  INSANE_SKIP_${PN} = "already-stripped"
> -INSANE_SKIP_${PN}-qemu = "arch"
> -FILES_${PN}-qemu = " \
> -    ${datadir}/xen/qemu \
> -    ${libdir}/xen/bin/qemu-system-i386 \
> -    ${libdir}/xen/bin/qemu-system-x86_64 \
> -    ${libdir}/xen/bin/qemu-img \
> -    ${libdir}/xen/bin/qemu-nbd \
> -    ${libdir}/xen/bin/qemu-ga \
> -    ${libdir}/xen/bin/qemu-io \
> -    ${libdir}/xen/bin/qemu-dm \
> -    ${libdir}/xen/bin/virtfs-proxy-helper \
> -    /usr/libexec/qemu-bridge-helper \
> -    ${libdir}/xen/libexec/qemu-bridge-helper \
> -    /usr/etc/qemu \
> -    /usr/etc/qemu/target-x86_64.conf \
> -    ${libdir}/xen/etc/qemu/target-x86_64.conf \
> -    ${datadir}/qemu-xen \
> -    ${datadir}/qemu-xen/qemu \
> -    ${datadir}/qemu-xen/qemu/bamboo.dtb \
> -    ${datadir}/qemu-xen/qemu/pxe-pcnet.rom \
> -    ${datadir}/qemu-xen/qemu/vgabios-vmware.bin \
> -    ${datadir}/qemu-xen/qemu/pxe-eepro100.rom \
> -    ${datadir}/qemu-xen/qemu/pxe-e1000.rom \
> -    ${datadir}/qemu-xen/qemu/openbios-ppc \
> -    ${datadir}/qemu-xen/qemu/multiboot.bin \
> -    ${datadir}/qemu-xen/qemu/vgabios-cirrus.bin \
> -    ${datadir}/qemu-xen/qemu/bios.bin \
> -    ${datadir}/qemu-xen/qemu/vgabios-stdvga.bin \
> -    ${datadir}/qemu-xen/qemu/palcode-clipper \
> -    ${datadir}/qemu-xen/qemu/pxe-ne2k_pci.rom \
> -    ${datadir}/qemu-xen/qemu/spapr-rtas.bin \
> -    ${datadir}/qemu-xen/qemu/slof.bin \
> -    ${datadir}/qemu-xen/qemu/vgabios-qxl.bin \
> -    ${datadir}/qemu-xen/qemu/pxe-rtl8139.rom \
> -    ${datadir}/qemu-xen/qemu/openbios-sparc64 \
> -    ${datadir}/qemu-xen/qemu/pxe-virtio.rom \
> -    ${datadir}/qemu-xen/qemu/kvmvapic.bin \
> -    ${datadir}/qemu-xen/qemu/openbios-sparc32 \
> -    ${datadir}/qemu-xen/qemu/petalogix-s3adsp1800.dtb \
> -    ${datadir}/qemu-xen/qemu/sgabios.bin \
> -    ${datadir}/qemu-xen/qemu/linuxboot.bin \
> -    ${datadir}/qemu-xen/qemu/qemu-icon.bmp \
> -    ${datadir}/qemu-xen/qemu/ppc_rom.bin \
> -    ${datadir}/qemu-xen/qemu/vgabios.bin \
> -    ${datadir}/qemu-xen/qemu/s390-zipl.rom \
> -    ${datadir}/qemu-xen/qemu/petalogix-ml605.dtb \
> -    ${datadir}/qemu-xen/qemu/keymaps \
> -    ${datadir}/qemu-xen/qemu/keymaps/common \
> -    ${datadir}/qemu-xen/qemu/keymaps/th \
> -    ${datadir}/qemu-xen/qemu/keymaps/is \
> -    ${datadir}/qemu-xen/qemu/keymaps/en-gb \
> -    ${datadir}/qemu-xen/qemu/keymaps/ar \
> -    ${datadir}/qemu-xen/qemu/keymaps/fr-be \
> -    ${datadir}/qemu-xen/qemu/keymaps/ru \
> -    ${datadir}/qemu-xen/qemu/keymaps/hu \
> -    ${datadir}/qemu-xen/qemu/keymaps/de-ch \
> -    ${datadir}/qemu-xen/qemu/keymaps/no \
> -    ${datadir}/qemu-xen/qemu/keymaps/fr \
> -    ${datadir}/qemu-xen/qemu/keymaps/pl \
> -    ${datadir}/qemu-xen/qemu/keymaps/fr-ca \
> -    ${datadir}/qemu-xen/qemu/keymaps/de \
> -    ${datadir}/qemu-xen/qemu/keymaps/fr-ch \
> -    ${datadir}/qemu-xen/qemu/keymaps/bepo \
> -    ${datadir}/qemu-xen/qemu/keymaps/lv \
> -    ${datadir}/qemu-xen/qemu/keymaps/ja \
> -    ${datadir}/qemu-xen/qemu/keymaps/da \
> -    ${datadir}/qemu-xen/qemu/keymaps/lt \
> -    ${datadir}/qemu-xen/qemu/keymaps/hr \
> -    ${datadir}/qemu-xen/qemu/keymaps/es \
> -    ${datadir}/qemu-xen/qemu/keymaps/modifiers \
> -    ${datadir}/qemu-xen/qemu/keymaps/sl \
> -    ${datadir}/qemu-xen/qemu/keymaps/it \
> -    ${datadir}/qemu-xen/qemu/keymaps/nl \
> -    ${datadir}/qemu-xen/qemu/keymaps/fo \
> -    ${datadir}/qemu-xen/qemu/keymaps/mk \
> -    ${datadir}/qemu-xen/qemu/keymaps/pt-br \
> -    ${datadir}/qemu-xen/qemu/keymaps/tr \
> -    ${datadir}/qemu-xen/qemu/keymaps/sv \
> -    ${datadir}/qemu-xen/qemu/keymaps/fi \
> -    ${datadir}/qemu-xen/qemu/keymaps/en-us \
> -    ${datadir}/qemu-xen/qemu/keymaps/et \
> -    ${datadir}/qemu-xen/qemu/keymaps/nl-be \
> -    ${datadir}/qemu-xen/qemu/keymaps/pt \
> -    ${bindir}/qemu-nbd-xen \
> -    ${bindir}/qemu-img-xen \
> -    "
>
>  FILES_${PN}-remus = "\
>      ${bindir}/remus \
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
