Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00B17E01595
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2013 08:48:02 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id u14so3943308lbd.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2013 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3n5ZBLSpGUCHiNf0KbtHflFBs3go0TmSJoZ6li9bEps=;
	b=Kf72g5Ppj0Qk7agHoxzgJvh2pyeAEaDc2fBZX1r580+0dpROo2RS2kKkvcdb2QjjlK
	HQ+lhNuqnzG6rASaBZfvhHSUSOEIgdNlwV0BitFGRjYxX4cg6ldy/oonqeUQZ2k3CuEB
	A5ct+UegHaaVXEEnFpw4ZnL1cL7mMeHdSoMYwzl/4ThzpAgkdDYyit2yv7kxn5NbKKbN
	LjcpoTB6ojfiHBDOz19hZCELNJ1DOlQGx9ErCUvB5cZTcyL04wuq4SqzbCsO3B11hqcq
	rjDtHPdcFOx2e2V0HuzL/hZEGL0avaNZP6FzqgkeftLfnkbbpuqKTjzTErOFRWqh7FVj
	jyOg==
MIME-Version: 1.0
X-Received: by 10.112.210.66 with SMTP id ms2mr544690lbc.51.1380037680650;
	Tue, 24 Sep 2013 08:48:00 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Tue, 24 Sep 2013 08:48:00 -0700 (PDT)
In-Reply-To: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
References: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
Date: Tue, 24 Sep 2013 11:48:00 -0400
Message-ID: <CADkTA4P9X_nQmX9Fss2Ob-RwhXZKAS8mVeQA=X2Vem7TV=PxOA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 0/4] xen 4.3.0 recipe and updated xen-image-minimal
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
X-List-Received-Date: Tue, 24 Sep 2013 15:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 10, 2013 at 9:02 PM, Chris Patterson <cjp256@gmail.com> wrote:
> This set of patches should provide a user with the ability to generate a xen 4.3.0 based dom0 image.
>
> [NOTES]
>
> With these patches, xen-image-minimal requires "xen" and "aufs" to be present in DISTRO_FEATURES to function correctly.  This means that xen-image-minimal has only been tested with 3.8 and 3.10 since 3.4 does not have aufs patches available.

I've merged the series as is. Once the smoke clears from the Yocto 1.5
release, I'll
factor the fragments out into a common location, there wasn't a window
to do it sooner
and I had been waiting a bit .. but I've given up for now, and it's
better to have this in
the layer for wider use.

Thanks for the nice series, glad to see this fixed up and working.

Bruce

>
> v1 -> v2 changelog:
> xen-image-initramfs: removed image and related init script
> xen-image-minimal: use core-image-minimal-initramfs
> xen-image-minimal: minimalized package set, add xen-pciback module
> xen-4.3.0: minimize RDEPENDS - anyone interested in using the python toolstack bits will likely have to fill in some blanks
> linux-yocto/xen.cfg: update to support 3.4, 3.8, 3.10 (may include some spurious options for 3.4 & 3.8 used for 3.10)
> linux-yocto/xen.cfg: remove PCI_STUB
> linux-yocto/xen.cfg: include PCIDEV_BACKEND as module instead of built-in
> linux-yocto_3.4.bbappend: remove aufs option since it's not available in 3.4 anyways
>
> these patches are available for your convenience at:
> repo: https://github.com/cjp256/meta-virtualization.git
> branch: patches-xen-v2
>
> [DISTRO TESTING]
>
> This image has been tested using:
>
> machine=sugarbay
> DISTRO_FEATURES += " aufs xen"
>
> [BUILDING IMAGE]
>
> bitbake xen-image-minimal
>
> [QEMU BUILD TESTING]
>
> To start up and test core-image-xen using kvm on hardware supporting nested virtualization:
>
> kvm -hda deploy/images/xen-image-minimal-sugarbay.hddimg -cpu host -no-kvm-irqchip -m 4096 -net nic,model=e1000 -net user -serial stdio
>
> ..or..
>
> kvm -hdc deploy/images/xen-image-minimal-sugarbay.iso -cpu host -no-kvm-irqchip -m 4096 -net nic,model=e1000 -net user -serial stdio
>
> [XEN TESTING]
>
> To test the runtime core-image-xen and boot a debian PV virtual machine:
>
> #!/bin/sh -x
>
> # bring up networking
> ifconfig eth0 up
> brctl addbr br0
> brctl addif br0 eth0
> udhcpc -i br0
>
> # place vm in debian
> mkdir -p /test/debian
> cd /test/debian
>
> # pull example kernel, initrd
> wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/initrd.gz
> wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/vmlinuz
>
> # create empty disk
> dd if=/dev/zero of=disk.img bs=1M skip=4000 count=1
>
> cat > debian.cfg << EOF
> kernel = "/test/debian/vmlinuz"
> ramdisk = "/test/debian/initrd.gz"
> extra = "debian-installer/exit/always_halt=true -- console=hvc0"
> vif = ['bridge=br0']
> memory = "256"
> name = "debian"
> disk = ['file:/test/debian/disk.img,xvda,w']
> EOF
>
> xl -v create -d debian.cfg
>
> xl console debian
>
> Chris Patterson (4):
>   linux-yocto: add kernel fragment and scc to support xen on linux 3.4,
>     3.8, and 3.10.
>   linux-yocto: add optional support for aufs and xen using
>     DISTRO_FEATURES.
>   xen: add 4.3.0 recipe.
>   xen-image-minimal: update image to support xen 4.3.0 base with xl
>     toolstack.
>
>  recipes-extended/images/xen-image-minimal.bb   |  52 +-
>  recipes-extended/xen/xen_4.3.0.bb              | 626 +++++++++++++++++++++++++
>  recipes-kernel/linux/linux-yocto/xen.cfg       |  55 +++
>  recipes-kernel/linux/linux-yocto/xen.scc       |   4 +
>  recipes-kernel/linux/linux-yocto_3.10.bbappend |   6 +
>  recipes-kernel/linux/linux-yocto_3.4.bbappend  |   3 +
>  recipes-kernel/linux/linux-yocto_3.8.bbappend  |   6 +
>  7 files changed, 746 insertions(+), 6 deletions(-)
>  create mode 100644 recipes-extended/xen/xen_4.3.0.bb
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
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

