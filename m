Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D373BE00747
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 20:37:32 -0700 (PDT)
Received: by mail-ie0-f174.google.com with SMTP id k14so2382523iea.33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 20:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0BljDEXD7c2zEYNOoc+bm8sAovcBV18CPr2Ymdy8X8g=;
	b=kjqbkCUEYyFK+0mJO0NOUtdVloH0+OC0sHXAEK/YzyKbbLRdL1EBjAE6XrIsSkBvkJ
	+hekQjiSXagOQkv1XJ5vnz19F9oe9ZXww5ijffh8jDBwsLV2YZ2TTF5V03YYf/K4MjsK
	wsJQNbaZOTbunt2jmV6Sc7F2u1B1VkcIDbSKU0wsaWP/ghlEArhfSqghW07RGgbSNi+G
	3jvpnbzazl7HRBtcSJIJoJC8gMPB4aU99baP61wkjIDsWVpLegUrt3TlV+S1I5WshXDY
	Rvg2ihCADaJpI3b7fwZrWdOOkmsMpz36CTuf8CxMukjJAt+GIGVZv7vg9nw2fm0yfKL0
	tW3g==
X-Received: by 10.50.50.104 with SMTP id b8mr778558igo.1.1377833851664;
	Thu, 29 Aug 2013 20:37:31 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id p5sm1744506igj.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 20:37:30 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 29 Aug 2013 23:37:20 -0400
Message-Id: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] xen 4.3.0 recipe and updated xen-image-minimal
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
X-List-Received-Date: Fri, 30 Aug 2013 03:37:33 -0000

This set of patches should provide a user with the ability to generate a xen 4.3.0 based dom0 image.

[NOTES]

With these patches, xen-image-minimal requires "xen" and "aufs" to be present in DISTRO_FEATURES to function correctly.  

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

# bring up networking
ifconfig eth0 up
brctl addbr br0
brctl addif br0 eth0
udhcpc -i br0

# place test debian vm in /test/debian
mkdir -p /test/debian
cd /test/debian

# pull example kernel, initrd
wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/initrd.gz
wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/vmlinuz

# create 4G disk
truncate -s 4096M disk.img

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
  linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
  linux-yocto: add optional support for aufs and xen using
    DISTRO_FEATURES.
  xen: add 4.3.0 recipe.
  xen-image-minimal: update image to support xen 4.3.0 base with xl
    toolstack.

 recipes-extended/images/xen-image-initramfs.bb     |   17 +
 recipes-extended/images/xen-image-minimal.bb       |   55 +-
 .../initrdscripts/files/init-boot-xen.sh           |  205 +++++++
 .../initrdscripts/initramfs-boot-xen_1.0.bb        |   16 +
 recipes-extended/xen/xen_4.3.0.bb                  |  623 ++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/xen.cfg           |   53 ++
 recipes-kernel/linux/linux-yocto/xen.scc           |    4 +
 recipes-kernel/linux/linux-yocto_3.4.bbappend      |    6 +
 recipes-kernel/linux/linux-yocto_3.8.bbappend      |    6 +
 9 files changed, 978 insertions(+), 7 deletions(-)
 create mode 100644 recipes-extended/images/xen-image-initramfs.bb
 create mode 100644 recipes-extended/initrdscripts/files/init-boot-xen.sh
 create mode 100644 recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
 create mode 100644 recipes-extended/xen/xen_4.3.0.bb
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc

-- 
1.7.10.4


