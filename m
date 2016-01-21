Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD48BE00AE4; Thu, 21 Jan 2016 06:12:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC565E00AB5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jan 2016 06:12:39 -0800 (PST)
Received: by mail-io0-f180.google.com with SMTP id 77so54983129ioc.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jan 2016 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EJnIH6jngMRpwMpI0jjYJrwfBnXKXMIZCbUwQGPUdNA=;
	b=aqiZIi1AZaDvELqjuCqqn+3SmXhOMUOtVOpwJGPsYgijSbYZo2CviwBi74Xb4nHaY6
	WwztcOpa3Xd0QiWINwuc+SaGQHxP3yp+OshEk5wZDDHv//hJcZbxkxdtp1Qh1rOzmcuY
	sWGKPMOHfqgrd/UFJ7CBh962faOtQLKWfs9Kw900Bj1G4D5L390ABNhVzQekA7hUKPBR
	ocq04MA79W7o+vPQU1/a18YYmGDev7gM3MLFAA+QjncGFc5WLqOwQ6fgi0JP8Ogp2IlC
	A7lQwK3b35UVgEear+QX1yqQZfFaruPrP/pg2DILapE7FA4UMbGvOP97AiV8KBvuk20D
	Peeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=EJnIH6jngMRpwMpI0jjYJrwfBnXKXMIZCbUwQGPUdNA=;
	b=ZycmeVLCf6Q3Eqgy5EeJxxzryBMtHpzm6BRSe2uoa8jxCoNL4ZqxHGXLxYz9xlhYfz
	Kpgh72KkEepvPhnt0k6pdyT6gK6k4LbAZJfSzFnYYYokicWz1ukRPXisfxi35FpjuBLx
	feaxbMzLtKRUoJS4KkZVs21rsOvWKoydZtOA2qGfpFhKGCGWbDUI7mjQnK86T+bT24K1
	UMSL/34UdP3kUxyds++bRHueLqdXAAe8HZVsHi7U+/ALGnktXjVvdBGe742VcHifo3Ce
	QNtZDyRpTvmIkfghRitBO0/U6cGOVF8d8eV8JWBTKL9jbArEPazXJRUnAy43wSmUhCiq
	+taw==
X-Gm-Message-State: ALoCoQlQBktafIe1ie0KBTaNU2qSDJF0ziYgOCuJx4gTr6ddSTt5x73VVlhjlST6wd6RgdAaUfEGiX5Q/AK7oQlJeTpalx/4TA==
MIME-Version: 1.0
X-Received: by 10.107.33.12 with SMTP id h12mr34574551ioh.108.1453385558901;
	Thu, 21 Jan 2016 06:12:38 -0800 (PST)
Received: by 10.79.115.5 with HTTP; Thu, 21 Jan 2016 06:12:38 -0800 (PST)
In-Reply-To: <CADqm_SRdKySYQwvUMepd3uVvYzLW+Qd6tc77k616h3BiTe5-NQ@mail.gmail.com>
References: <CADqm_SRdKySYQwvUMepd3uVvYzLW+Qd6tc77k616h3BiTe5-NQ@mail.gmail.com>
Date: Thu, 21 Jan 2016 09:12:38 -0500
Message-ID: <CABZSBQe3AnzvwfW-x4Fum_AoHYn2OO1VD=YEmmRkNhJmZGOcSA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: "McGillion, Brian" <brian.mcgillion@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Failure to build xen-image-minimal
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
X-List-Received-Date: Thu, 21 Jan 2016 14:12:44 -0000
Content-Type: text/plain; charset=UTF-8

Hello Brian,

Have you added 'xen' to your DISTRO_FEATURES?  You can try
DISTRO_FEATURES_append = " xen" in your local.conf.

Good luck! :)
-Chris

On Wed, Jan 20, 2016 at 11:11 AM, McGillion, Brian
<brian.mcgillion@intel.com> wrote:
> Hi,
>
> I am trying to build a default xen-image-minimal target.
>
> Followed these steps
> git clone http://git.yoctoproject.org/git/poky
> cd poky/
> git clone git://git.yoctoproject.org/meta-yocto-kernel-extras
> git clone git://git.yoctoproject.org/meta-intel.git
> git clone git://git.yoctoproject.org/meta-virtualization
> git clone git://github.com/openembedded/meta-openembedded.git
> git clone git://github.com/errordeveloper/oe-meta-go.git
>
> source oe-init-build-env
>
> bitbake-layers add-layer meta-intel
> bitbake-layers add-layer meta-virtualization
> bitbake-layers add-layer meta-openembedded/meta-oe
> bitbake-layers add-layer meta-openembedded/meta-networking
> bitbake-layers add-layer meta-openembedded/meta-python
> bitbake-layers add-layer meta-openembedded/meta-filesystems
> bitbake-layers add-layer oe-meta-go
>
>
> edit conf/local.conf adding the following
>
> MACHINE ?= "intel-corei7-64" or MACHINE ?= "genericx86_64"
> PACKAGE_CLASSES = "package_deb "
>
>
> bitbake xen-image-minimal
>
>
>
> with the following result:
>
> ERROR: Unable to install packages. Command
> '/home/brian/embedded/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/apt-get
> install --force-yes --allow-unauthenticated kernel-module-xen-netback
> kernel-module-xen-gntalloc run-postinsts kernel-module-xen-acpi-processor
> packagegroup-core-ssh-openssh kernel-module-xen-pciback
> kernel-module-xen-blkback kernel-module-xen-gntdev qemu xen-base
> packagegroup-core-boot kernel-module-xen-wdt' returned 100:
> Reading package lists...
> Building dependency tree...
> Reading state information...
> E: Unable to locate package kernel-module-xen-netback
> E: Unable to locate package kernel-module-xen-gntalloc
> E: Unable to locate package kernel-module-xen-acpi-processor
> E: Unable to locate package kernel-module-xen-pciback
> E: Unable to locate package kernel-module-xen-blkback
> E: Unable to locate package kernel-module-xen-gntdev
> E: Unable to locate package kernel-module-xen-wdt
>
> ERROR: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/brian/embedded/yocto/poky/build/tmp/work/genericx86_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_rootfs.25163
> ERROR: Task 9
> (/home/brian/embedded/yocto/poky/meta-virtualization/recipes-extended/images/xen-image-minimal.bb,
> do_rootfs) failed with exit code '1'
>
>
> if the following directory should contain the final kernel .config that is
> being built then I do not see the xen config options that are defined in
> /meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg being applied.
>
> yocto/poky/build/tmp/work/genericx86_64-poky-linux/linux-yocto/4.1.15+gitAUTOINC+46bb64d605_788dfc9859-r0/linux-genericx86_64-standard-build
>
> Any help is greatly appreciated.
>
> Thanks,
> Brian
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

