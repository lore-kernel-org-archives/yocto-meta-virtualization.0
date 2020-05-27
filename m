Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.4905.1590582225073211518
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 May 2020 05:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rXlJTyxQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id q13so857520edi.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2020 05:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iurx8YQN/MhimL2YSglRNORDpTLo9FehwZx3E1n7GLM=;
        b=rXlJTyxQI4+T+8YzFQE/Zf4Kmz8AuNh8atg/SmVBpG7z7WxsPGU+WlyzQgNr07c4k9
         1Uys/V/23Uwc1yHKwP3wtcDHfH/Bb4QI1MG7rN6sG/3kAhuTS0p38LUxHPlFsEV59ES4
         nTKhHJXX14d8QU0XUGuCSC1bDWNKbbdskWnK2t4BT0a+zfK8zJhUzQOVfG63L1gh9fS9
         3VdLtJUbbq5Ejzah3yBn5qd6uh/vjNal8j6Xctep1rij+pmVcYT6i7e34SKU6dSKU+Vr
         qw7NyWierzfcutBh/WyA8aRhrwxbWiTxhGc8SIcZVPBEDmA5/+lzXtXZtPAFxvbPAay1
         ufTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iurx8YQN/MhimL2YSglRNORDpTLo9FehwZx3E1n7GLM=;
        b=M5LuFJGolSQ5Fhb1ctdZyhom329tLVdmJTusoP1a8TEWzuZFUH2FphN7IcwORVP5ll
         tydU8Z11xhlMqObos+nUQTsPK6VBNeFfBlGiKjA7srkaLUYo4AoUnEQv9KMbaLrWfIaY
         Tu7v2rreCJCkjIjUAAo5wZrYOG7w5m7qclGSOfvE7N/VbOxToW7RyUQFDl4A6BZao1hW
         iJGtlrKqdYwkosHA2fAHs6XE/M/WBJRWQAMFGsGdALZuxo5uFhrTEnySycHrWz+aNNbZ
         07Z2k+jHSDpHG28j0QPXYncSmyhwdmVblECY2/9E1+3E1Qima8H/mLuIrDWD44oKdqEV
         dhVw==
X-Gm-Message-State: AOAM53236TSYIlppIgt3rrTiCb0wAlzVfopLkJd/XHE+eXDUf3Sp8jgD
	Yz/8yATlR6IrPYqegNG35CL7VfyYuMPrN0FygAQ=
X-Google-Smtp-Source: ABdhPJzaUBFwco5g0CcM6fgIe89MTAIaxJXovasBnW30bUoox4L+dDWU9hf0zhjk4yjz3SJRyyuBo7kXwz0o50BXD5U=
X-Received: by 2002:aa7:d850:: with SMTP id f16mr22891560eds.365.1590582223284;
 Wed, 27 May 2020 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <UK36.1590564847438252986.f6GO@lists.yoctoproject.org>
In-Reply-To: <UK36.1590564847438252986.f6GO@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 May 2020 08:23:31 -0400
Message-ID: <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
Subject: Re: [meta-virtualization] Failure to build xen-image-minimal. Yocto bitbake failed @99% while building xen-minimal-image
To: Siddhuvgowda.18695@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 3:34 AM <Siddhuvgowda.18695@gmail.com> wrote:
>
> Hello dear meta-virtualization team,
>
> I am building the xen minimal image using yocto warrior ("bitbake xen-im=
age-minimal") by giving the target machine as "raspberrypi4". It reached 99=
% but at last I got below error and the whole process terminated with error=
.
>
> ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command=
 '/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnuea=
bi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbo=
sity=3Dinfo -y -c /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-=
poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf --setop=
t=3Dreposdir=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-pok=
y-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum.repos.d --installro=
ot=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gn=
ueabi/xen-image-minimal/1.0-r0/rootfs --setopt=3Dlogdir=3D/home/siddhu/Docu=
ments/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minima=
l/1.0-r0/temp --repofrompath=3Doe-repo,/home/siddhu/Documents/yocto/build/t=
mp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-=
repo --nogpgcheck install kernel-module-xen-blkback kernel-module-xen-gntal=
loc kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wd=
t packagegroup-core-boot packagegroup-core-ssh-dropbear packagegroup-core-s=
sh-openssh qemu run-postinsts xen-base locale-base-en-us locale-base-en-gb'=
 returned 1:
>
> DNF version: 4.1.0
>
> cachedir: /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-=
linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf
>
> Added oe-repo repo from /home/siddhu/Documents/yocto/build/tmp/work/rasp=
berrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo
>
> repo: using cache for: oe-repo
>
> not found other for:
>
> not found modules for:
>
> not found deltainfo for:
>
> not found updateinfo for:
>
> oe-repo: using metadata from Wed 27 May 2020 06:15:39 AM UTC.
>
> Last metadata expiration check: 0:00:01 ago on Wed 27 May 2020 06:15:45 =
AM UTC.
>
> No module defaults found
>
> No match for argument: kernel-module-xen-blkback
>
> No match for argument: kernel-module-xen-gntalloc
>
> No match for argument: kernel-module-xen-gntdev
>
> No match for argument: kernel-module-xen-netback
>
> No match for argument: kernel-module-xen-wdt

Have you checked that these modules are enabled in your kernel config ?

We provide reference fragments in meta-virtualization, but if the
kernel recipe you are using doesn't support fragment merging (like
linux-yocto, which is what I test), then you won't have those configs
enabled simply by using meta-virt.

Cheers,

Bruce

>
> Error: Unable to find a match
>
>
>
> ERROR: xen-image-minimal-1.0-r0 do_rootfs:
>
> ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
>
> ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/build/=
tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp/log.=
do_rootfs.14256
>
> ERROR: Task (/home/siddhu/Documents/yocto/sources/meta-virtualization/re=
cipes-extended/images/xen-image-minimal.bb:do_rootfs) failed with exit code=
 '1'
>
> NOTE: Tasks Summary: Attempted 2605 tasks of which 2152 didn't need to b=
e rerun and 1 failed.
>
> Summary: 1 task failed:
>
>   /home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-exten=
ded/images/xen-image-minimal.bb:do_rootfs
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit co=
de.
>
> May I know what mistake I am doing here please. I have attached screensh=
ot also.
>
>
> My bblayer.conf file is as below:
>
> # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.=
conf
> # changes incompatibly
> POKY_BBLAYERS_CONF_VERSION =3D "2"
> BBPATH =3D "${TOPDIR}"
>
> BBFILES ?=3D ""
> BBLAYERS ?=3D " \
>
>   /home/siddhu/Documents/yocto/sources/poky/meta \
>   /home/siddhu/Documents/yocto/sources/poky/meta-poky \
>   /home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
>   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
>   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia=
 \
>   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
>   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking=
 \
>   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystem=
s \
>   /home/siddhu/Documents/yocto/sources/meta-cloud-services \
>   /home/siddhu/Documents/yocto/sources/meta-selinux \
>   /home/siddhu/Documents/yocto/sources/meta-virtualization\
>   /home/siddhu/Documents/yocto/sources/meta-raspberrypi \
>   "
>
> My local.conf file I have added the below details:
>
> MACHINE ??=3D "raspberrypi4"
> DISTRO_FEATURES +=3D "virtualization xen"
> PACKAGE_CLASSES ?=3D "package_rpm"
> CONF_VERSION =3D "1"
> IMAGE_FEATURES +=3D "ssh-server-dropbear"
>
>
> I have tried the same for "cubieboard2" also even there I faced the same=
 issue.Eagerly waiting for the response.
>
> Regards,
> Siddhartha V
>
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
