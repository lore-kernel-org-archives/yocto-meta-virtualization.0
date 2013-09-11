Return-Path: <cjp256@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE963E013AE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:08 -0700 (PDT)
Received: by mail-qc0-f175.google.com with SMTP id v2so4728955qcr.20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B9CYBv0/AmN2ZvyUWHG+XxJVbjqjVmnv5WxqD2f0OgI=;
	b=J7fGnIRxJZH4/OxNs95n4A9ErR/rBw0+pImvVxyJzUq91F5CVwBDhXTC+ii7Fq/BhR
	F9HDj3Am+tFZrDbCmfF8TtWmFGiAI5HsMCXvM62+YnVrtsk9yyKgkdimtJ8GEtQN9LhK
	6nhABax0MW/4CpHWzLAjSG14zZdUfRGnuW6ik7VtNlAfFrJ2hkSiMempL23K4SglQVMb
	46mrjKO75S0M1015pPj4T080Fy2XnaN8shOgLlXHWe8AGlxp6o5ei1IbC2acBhQjKDbz
	Ooo/MKEB1aasyDlgiTIfefaBMC7/h0y7IZVm1mwuN2rZ9Ef+BC5KJXGGjSzRnN+fWgzU
	+asw==
X-Received: by 10.49.127.179 with SMTP id nh19mr37216604qeb.1.1378861387879;
	Tue, 10 Sep 2013 18:03:07 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id f14sm34325809qej.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 18:03:07 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 10 Sep 2013 21:02:37 -0400
Message-Id: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH v2 0/4] xen 4.3.0 recipe and updated xen-image-minimal
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
X-List-Received-Date: Wed, 11 Sep 2013 01:03:13 -0000

This set of patches should provide a user with the ability to generate a xen 4.3.0 based dom0 image.

[NOTES]

With these patches, xen-image-minimal requires "xen" and "aufs" to be present in DISTRO_FEATURES to function correctly.  This means that xen-image-minimal has only been tested with 3.8 and 3.10 since 3.4 does not have aufs patches available.

v1 -> v2 changelog:
xen-image-initramfs: removed image and related init script
xen-image-minimal: use core-image-minimal-initramfs
xen-image-minimal: minimalized package set, add xen-pciback module
xen-4.3.0: minimize RDEPENDS - anyone interested in using the python toolstack bits will likely have to fill in some blanks
linux-yocto/xen.cfg: update to support 3.4, 3.8, 3.10 (may include some spurious options for 3.4 & 3.8 used for 3.10)
linux-yocto/xen.cfg: remove PCI_STUB
linux-yocto/xen.cfg: include PCIDEV_BACKEND as module instead of built-in
linux-yocto_3.4.bbappend: remove aufs option since it's not available in 3.4 anyways

these patches are available for your convenience at:
repo: https://github.com/cjp256/meta-virtualization.git
branch: patches-xen-v2

[DISTRO TESTING]

This image has been tested using:

machine=sugarbay
DISTRO_FEATURES += " aufs xen"

[BUILDING IMAGE]

bitbake xen-image-minimal

[QEMU BUILD TESTING]

To start up and test core-image-xen using kvm on hardware supporting nested virtualization:

kvm -hda deploy/images/xen-image-minimal-sugarbay.hddimg -cpu host -no-kvm-irqchip -m 4096 -net nic,model=e1000 -net user -serial stdio

..or..

kvm -hdc deploy/images/xen-image-minimal-sugarbay.iso -cpu host -no-kvm-irqchip -m 4096 -net nic,model=e1000 -net user -serial stdio

[XEN TESTING]

To test the runtime core-image-xen and boot a debian PV virtual machine:

#!/bin/sh -x

# bring up networking
ifconfig eth0 up
brctl addbr br0
brctl addif br0 eth0
udhcpc -i br0

# place vm in debian
mkdir -p /test/debian
cd /test/debian

# pull example kernel, initrd
wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/initrd.gz
wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/vmlinuz

# create empty disk
dd if=/dev/zero of=disk.img bs=1M skip=4000 count=1

cat > debian.cfg << EOF
kernel = "/test/debian/vmlinuz"
ramdisk = "/test/debian/initrd.gz"
extra = "debian-installer/exit/always_halt=true -- console=hvc0"
vif = ['bridge=br0']
memory = "256"
name = "debian"
disk = ['file:/test/debian/disk.img,xvda,w']
EOF

xl -v create -d debian.cfg

xl console debian

Chris Patterson (4):
  linux-yocto: add kernel fragment and scc to support xen on linux 3.4,
    3.8, and 3.10.
  linux-yocto: add optional support for aufs and xen using
    DISTRO_FEATURES.
  xen: add 4.3.0 recipe.
  xen-image-minimal: update image to support xen 4.3.0 base with xl
    toolstack.

 recipes-extended/images/xen-image-minimal.bb   |  52 +-
 recipes-extended/xen/xen_4.3.0.bb              | 626 +++++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/xen.cfg       |  55 +++
 recipes-kernel/linux/linux-yocto/xen.scc       |   4 +
 recipes-kernel/linux/linux-yocto_3.10.bbappend |   6 +
 recipes-kernel/linux/linux-yocto_3.4.bbappend  |   3 +
 recipes-kernel/linux/linux-yocto_3.8.bbappend  |   6 +
 7 files changed, 746 insertions(+), 6 deletions(-)
 create mode 100644 recipes-extended/xen/xen_4.3.0.bb
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc

-- 
1.8.4.rc3


