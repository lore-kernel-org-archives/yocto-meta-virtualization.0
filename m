Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web09.14097.1582896237281981057
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Feb 2020 05:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M0LchAvh;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: belal.elkady4@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id x7so3337575ljc.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Feb 2020 05:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zsrBzBUUUAFP/Xr4UniIBXhTYQrAsI6FpX0Mz/9+4v4=;
        b=M0LchAvhOibh5dDECsOHH3id7K+KG567ErZEWlPT2dqd9ds9+vl5DH2VwQ1yrMBLqa
         g7griRKq70rc7ICS2sU8rSZP2X7ekCmhT5TVdGfVg0GpbGt130tANxjdE48nG/TzHviL
         BaYjBSxFwWD8jeAnd5gb7mHVnyqB17zFTPLai37TGJVZFSTUxvvuXVU0jMbxyuCtqi99
         8LXS+2VqBqDL5TlmuTmHyZt9oSuoOhiSjfnoj82h09EU52YHcgaW2Xu6KKnZdADcq9Um
         F+CUUhGx63VX6vlCKtfIgY9pmtiXNsPVzTHKKz5Sa1QdIFPd+BMXLUJXgonSiPqG/aWH
         sQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zsrBzBUUUAFP/Xr4UniIBXhTYQrAsI6FpX0Mz/9+4v4=;
        b=IGnsMl23wbs+Mh+/aWKK8EBk0RMmdD9oL9B2GVR002oCyJvnIoS01UsQd26Nf66XK8
         JH/KdpAPLTnmzUsMG95IgcyJ4xpP8i2oef6wrh2v2r64SbXAQGQfjDQW82ft0RZ1WrEH
         JG5CUvWppZ4PoMZN7w5h/UmYwKl/CnCGg/H8mECE7B8hjY005dnNlVO2asjhpl3FMgRx
         mbTEci3S+fFfMT3LiP+08RgaWOK3A9M6kIG7JcSasKOGn+3zznDTlA8+CfMRth06Q7+3
         P2ZVSPvJytKVy0QNgJmc138VQFCHF7z7i3flL2uDAi2jxOzy2xkKnQ89/fn7jHedLpqJ
         VSyQ==
X-Gm-Message-State: ANhLgQ1jVLyjRIEq4Jk/7qpcLp17MLJoMXDYI0SCTQtKc8uebwt28ktW
	KHUP9u4mIP/2AdD2ugO6GY4MnZo6k6zvYoYr0C6iTGBLnQo=
X-Google-Smtp-Source: ADFU+vvTIkmqM0rxXGQq8SZk8Z8ujwTnKSUvaLXw9Q/dnbVXsQo91e7V88hJUtYMlbUmHdBqzVBS42DjGoYW2GbxAGU=
X-Received: by 2002:a2e:761a:: with SMTP id r26mr2899665ljc.135.1582896234972;
 Fri, 28 Feb 2020 05:23:54 -0800 (PST)
MIME-Version: 1.0
From: "Belal Elkady" <belal.elkady4@gmail.com>
Date: Fri, 28 Feb 2020 14:23:44 +0100
Message-ID: <CACNDKPByE9Y1j55ALvw7bbeA_xt1ex0Q_rkTb6UomjuyiOLdAg@mail.gmail.com>
Subject: [yocto] [meta-virtualization] No match for argument: kernel-module-kvm
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cd48bf059fa2bfc0"

--000000000000cd48bf059fa2bfc0
Content-Type: text/plain; charset="UTF-8"

  Hello ,

I am trying to build kvm-image-minimal and I got this error

ERROR: kvm-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command
'/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf
-v --rpmverbosity=info -y -c
/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
--setopt=reposdir=/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs/etc/yum.repos.d
--installroot=/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs
--setopt=logdir=/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/temp
--repofrompath=oe-repo,/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/oe-rootfs-repo
--nogpgcheck install intel-microcode kernel-module-kvm
kernel-module-kvm-amd kernel-module-kvm-intel libvirt libvirt-libvirtd
libvirt-virsh packagegroup-core-boot packagegroup-core-ssh-openssh qemu
run-postinsts' returned 1:
DNF version: 4.2.2
cachedir:
/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs/var/cache/dnf
Added oe-repo repo from
/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/oe-rootfs-repo
repo: using cache for: oe-repo
not found other for:
not found modules for:
not found deltainfo for:
not found updateinfo for:
oe-repo: using metadata from Fri 28 Feb 2020 11:09:06 AM UTC.
Last metadata expiration check: 0:00:03 ago on Fri 28 Feb 2020 11:09:07 AM
UTC.
No module defaults found
No match for argument: kernel-module-kvm
No match for argument: kernel-module-kvm-amd
No match for argument: kernel-module-kvm-intel
Error: Unable to find a match

I added the layer meta-virtualization and its dependencies in bblayers

  ${TOPDIR}/../../Yocto/meta-openembedded/meta-oe \
  ${TOPDIR}/../../Yocto/meta-openembedded/meta-python \
  ${TOPDIR}/../../Yocto/meta-openembedded/meta-networking \
   ${TOPDIR}/../../Yocto/meta-openembedded/meta-filesystems \
  ${TOPDIR}/../../Yocto/meta-virtualization \

and added this configurations in local.conf

DISTRO_FEATURES_append = " virtualization"
BB_DANGLINGAPPENDS_WARNONLY ?= "true"

and I added the last line to avoid getting error from the dangling bbappend
receipe
meta-virtualization/recipes-kernel/linux/linux-yocto_5.4.bbappend


thank you ,
Belal Abdelmoteleb

--000000000000cd48bf059fa2bfc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 Hello ,=C2=A0<div><br></div><div>I am trying=C2=A0t=
o build kvm-image-minimal and I got this error=C2=A0</div><div><font color=
=3D"#ff0000"><br></font></div><div><font color=3D"#ff0000">ERROR: kvm-image=
-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command &#39;/home/belal/a=
msr_training/Applications/Minnowboard/tmp/work/intel_corei7_64-poky-linux/k=
vm-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=
=3Dinfo -y -c /home/belal/amsr_training/Applications/Minnowboard/tmp/work/i=
ntel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf =
--setopt=3Dreposdir=3D/home/belal/amsr_training/Applications/Minnowboard/tm=
p/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs/etc/yum.r=
epos.d --installroot=3D/home/belal/amsr_training/Applications/Minnowboard/t=
mp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs --setopt=
=3Dlogdir=3D/home/belal/amsr_training/Applications/Minnowboard/tmp/work/int=
el_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/temp --repofrompath=3Doe-r=
epo,/home/belal/amsr_training/Applications/Minnowboard/tmp/work/intel_corei=
7_64-poky-linux/kvm-image-minimal/1.0-r0/oe-rootfs-repo --nogpgcheck instal=
l intel-microcode kernel-module-kvm kernel-module-kvm-amd kernel-module-kvm=
-intel libvirt libvirt-libvirtd libvirt-virsh packagegroup-core-boot packag=
egroup-core-ssh-openssh qemu run-postinsts&#39; returned 1:<br>DNF version:=
 4.2.2<br>cachedir: /home/belal/amsr_training/Applications/Minnowboard/tmp/=
work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/rootfs/var/cache/d=
nf<br>Added oe-repo repo from /home/belal/amsr_training/Applications/Minnow=
board/tmp/work/intel_corei7_64-poky-linux/kvm-image-minimal/1.0-r0/oe-rootf=
s-repo<br>repo: using cache for: oe-repo<br>not found other for:<br>not fou=
nd modules for:<br>not found deltainfo for:<br>not found updateinfo for:<br=
>oe-repo: using metadata from Fri 28 Feb 2020 11:09:06 AM UTC.<br>Last meta=
data expiration check: 0:00:03 ago on Fri 28 Feb 2020 11:09:07 AM UTC.<br>N=
o module defaults found<br>No match for argument: kernel-module-kvm<br>No m=
atch for argument: kernel-module-kvm-amd<br>No match for argument: kernel-m=
odule-kvm-intel<br>Error: Unable to find a match</font><br></div><div><font=
 color=3D"#ff0000"><br></font></div><div>I added the layer meta-virtualizat=
ion and its dependencies in bblayers=C2=A0</div><div><br></div><div>=C2=A0 =
${TOPDIR}/../../Yocto/meta-openembedded/meta-oe \<br>=C2=A0 ${TOPDIR}/../..=
/Yocto/meta-openembedded/meta-python \<br>=C2=A0 ${TOPDIR}/../../Yocto/meta=
-openembedded/meta-networking \<br>=C2=A0 =C2=A0${TOPDIR}/../../Yocto/meta-=
openembedded/meta-filesystems \<br>=C2=A0 ${TOPDIR}/../../Yocto/meta-virtua=
lization \<br></div><div><br></div><div>and added this configurations in lo=
cal.conf=C2=A0</div><div><br></div><div>DISTRO_FEATURES_append =3D &quot; v=
irtualization&quot;<br>BB_DANGLINGAPPENDS_WARNONLY ?=3D &quot;true&quot;<br=
></div><div><br></div><div>and I added the last line to avoid getting error=
 from the dangling bbappend receipe=C2=A0</div><div>meta-virtualization/rec=
ipes-kernel/linux/linux-yocto_5.4.bbappend<br></div><div><br></div><div><br=
></div><div>thank you ,=C2=A0</div><div>Belal Abdelmoteleb</div><div class=
=3D"gmail-yj6qo"></div><div class=3D"gmail-adL"><br></div></div>

--000000000000cd48bf059fa2bfc0--
