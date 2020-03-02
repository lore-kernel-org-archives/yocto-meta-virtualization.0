Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1377.1583179741700485170
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 12:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lhbc+3pF;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40F93E017A6; Mon,  2 Mar 2020 12:09:01 -0800 (PST)
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
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FC3BE0082A
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Mar 2020 12:09:00 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id y3so1256394edj.13
        for <meta-virtualization@yoctoproject.org>; Mon, 02 Mar 2020 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GakUbORRCMpAtL8pkitQvSOXRpqPzIgOxFzaCPr/xxc=;
        b=Lhbc+3pFNdsVyWv/kAKnIWWSIDjiVTlqGKlQrgwNHjRKPkx4kJQzZ2oEwbukbwv11c
         2C3V8BmAzMZ/vQX3rVroaCOtzMEN+xFGokljyGCZ7LXvgsl+zVmAPZoTlz7u75ZcaIr2
         /yLRt33CRTlIVfCfR+dzq9WZhNb0juC6HS/fOAYndb7AUmjF2sEdNYCPqe81y/85hYJn
         gTQH/EfVmoVO5ubFht9/g2BPE0P+asNo578AxCL15Il5lOF+CE81oABPE22iqh4OIjJi
         kCbfzDH80q36VUaf/jLCBvt3emm7co4yPMcVrNJC3GApIXRwDuLLF7hbOiKaF3IMi0TU
         BoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GakUbORRCMpAtL8pkitQvSOXRpqPzIgOxFzaCPr/xxc=;
        b=mfoyPyV5FbqbGtyut7reB291jJgaMYFkrJvJqO5C7LEP78D9ni6St+lRtIDdmjyE6o
         rIV9SymLnQ+HHHBLCwIyZgALxFAeclKedLUi9tfINoKaXECjnhtcQVV6Dp5W/opNFAJA
         /0nrhQHnbqZUlUp6R/A+7ZxD9rW5rVbKeM1RSqRqFFgnwPi3pMvJM9cMthi5LTHNmumb
         d8dz2mdSXuAPPr5G/UVosguZ6qkCHznY+L3q6V128X1/kLcvGNEOQc1SUuXmKo5x52o1
         0x+T3hLlmPtNMtWrCe5AYj0Huo4edzP8gOoiz78zu/96sxPBc3CTdAsApguCAO86DBYi
         TtjQ==
X-Gm-Message-State: ANhLgQ0Gdjm3j73i8144TICmzsNumeVbxvUg/AMIwUfILPVfDqM67O3D
	FrQTnI2Ihd6/zj3IbleHVD3O7UWXihSYhQPs6KE=
X-Google-Smtp-Source: ADFU+vvm8bBABo/VvzWIrhCWhtlZy3k+JIUv1L7EqqOghruF2S2oYit5OFg5s4rvUU0kAjIRc7ftw2CbNiEytTwlboM=
X-Received: by 2002:a05:6402:38f:: with SMTP id o15mr898635edv.365.1583179739297;
 Mon, 02 Mar 2020 12:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20200227220124.13167-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200227220124.13167-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 2 Mar 2020 15:08:47 -0500
Message-ID: <CADkTA4OL8y6OoxJrmr-PgMTnzN4OUo4Xbm_dJ9uWAnaJpS4oWw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-image-minimal: enable runqemu for x86-64
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Feb 27, 2020 at 5:01 PM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Booting this Xen image with QEMU works when launching from the
> wic-generated pcbios disk image with the directdisk-xen.wks kickstart
> file, so add the variable settings to make doing it simple -- eg:
>
>     runqemu xen-image-minimal nographic slirp
>
> Tested with MACHINEs: qemux86-64 and genericx86-64
>
> Memory allocated to qemu is increased slightly over the default to allow
> for running Xen and the Linux dom0 and guest VMs.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>
> This patch requires the recently-submitted Xen patch series to be applied first.
> ( https://lists.yoctoproject.org/g/meta-virtualization/message/5133 )
>
>
>  recipes-extended/images/xen-image-minimal.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index dcdc864..c965f22 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -72,3 +72,16 @@ build_syslinux_cfg () {
>         echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
>  }
>
> +# Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
> +WKS_FILE_x86-64 = "directdisk-xen.wks"
> +QB_MEM = "-m 400"
> +QB_DEFAULT_KERNEL = ""
> +QB_DEFAULT_FSTYPE = "wic"
> +QB_FSINFO = "wic:kernel-in-fs"
> +# qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which is needed
> +# to boot this image, so add it here:
> +IMAGE_FSTYPES_qemux86-64 += "wic"
> +# Networking: the qemuboot.bbclass default virtio network device works ok
> +# and so does the emulated e1000 -- choose according to the network device
> +# drivers that are present in your dom0 Linux kernel. To switch to e1000:
> +# QB_NETWORK_DEVICE = "-device e1000,netdev=net0,mac=@MAC@"
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
