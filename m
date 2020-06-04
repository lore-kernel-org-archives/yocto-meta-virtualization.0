Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.24357.1591305184295164710
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 14:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CVJuvm7c;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id q16so2715056plr.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2020 14:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=S507f0M6l6UPChp7PNvDUHUYSZ3zXYrbm3yy6HlXDfA=;
        b=CVJuvm7c8KgSIEcXCxwZOyMBmWugFc15Uan8AzfEf4lHC3sjK+5ZTDDXx1eimMlXC4
         yzlvbUXFMh6AK4uLBpxm4T5Vxl6+u0zwtZwJPZEppx9qsImuYJ9QDdzR5M7bCTKke5DN
         ouLgfxXOiPJoOgOZRmCMh0K198RJhJy9ZeICxA9ZDHyBg37op6yOElfAVL0Fi2QZmGUU
         aDVrwoV9q+d8yrf1fjs+uBrc5iT+zlbMPFxlSO10gdXWtnxoR9rcuGOz2131U21+qDB7
         86uk5DCm/dWRy6uD2q5gMkLiGQdKaeIXkLBGwQI1as5CfSWf4f3S9uiizWmmF9y6xk98
         kmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=S507f0M6l6UPChp7PNvDUHUYSZ3zXYrbm3yy6HlXDfA=;
        b=UvFXNwhAtiLSW0h6Fzx5cHVKHxB6gWDQ+lB+j4a++/cPN6P1yJ/hSEVCZHWGLmnh8w
         mzsav9EDVqx7jts5Jv4Uu9TSDRRe200bEXKrbVMnvMt2Wykw+xK0qoYZkFEjLiA4stng
         V4yHqiGLWUCES88rTWUJ2c8oHQBmKiXjVuRGCW+7XG959CrxFm5TTzfF39cHY7ZXJO0Z
         rT6KeIMntVElQafovTVf9cwR6BdpXnB1khEAxBWK3lIdQrpZmqMxLno7SdsJ2xISwaBp
         iuj+mDeZ2suwYQd8/aIGrDCc/4MaHKba7rjMZSz4BHH7ATcQ+XjfRJjq1bT8cxg4nHT2
         zQdg==
X-Gm-Message-State: AOAM530QajlFAaTPaeCCHDtNfQnora0pTtaehmdF9IP99YzrpLRNwwk4
	6d2ZmFgpzjfXj2Q6Rb3rglA=
X-Google-Smtp-Source: ABdhPJz50JYftOPA9HAdj4qNaDhEZPUaYmvCDiBh0147mhCmYJZuHNdv9AZizTmkLcQhHNH7BavQ8A==
X-Received: by 2002:a17:902:c30c:: with SMTP id k12mr6864677plx.130.1591305183692;
        Thu, 04 Jun 2020 14:13:03 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from ?IPv6:2600:380:4a68:c8e0:28a3:46dd:6d64:5600? ([2600:380:4a68:c8e0:28a3:46dd:6d64:5600])
        by smtp.gmail.com with ESMTPSA id j17sm4798666pgk.66.2020.06.04.14.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 14:13:02 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-virtualization] How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
Date: Thu, 4 Jun 2020 14:13:01 -0700
Message-Id: <96BF8243-B90E-4E4B-B7D0-29A384966AAE@gmail.com>
References: <F6Xm.1591272345632844743.Xl2d@lists.yoctoproject.org>
Cc: meta-virtualization@lists.yoctoproject.org
In-Reply-To: <F6Xm.1591272345632844743.Xl2d@lists.yoctoproject.org>
To: Siddhartha V <Siddhuvgowda.18695@gmail.com>
X-Mailer: iPhone Mail (17D50)
Content-Type: multipart/alternative; boundary=Apple-Mail-72D5111E-92E2-4CEF-814A-D84E84A989AC
Content-Transfer-Encoding: 7bit

--Apple-Mail-72D5111E-92E2-4CEF-814A-D84E84A989AC
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Siddhartha,

I am also interested in running Xen on the Raspberry Pi 4. I hope to have =
time next week to be able to look into it.

Christopher

> On Jun 4, 2020, at 5:05 AM, Siddhartha V <Siddhuvgowda.18695@gmail.com> =
wrote:
>=20
> =EF=BB=BF
> Hello dear meta-virtualization team,
>=20
> I am building the xen minimal image using yocto warrior ("bitbake xen-im=
age-minimal") by giving the target machine as "raspberrypi4".
> Sorry for reposting I have already created a post (Failure to build xen-=
image-minimal. Yocto bitbake failed @99% while building xen-minimal-image).=
 From past ten days I have been stuck here. I felt it might not be reaching=
 the purpose so I am creating again.
>=20
> My bblayer.conf file is as below:
> # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.=
conf
> # changes incompatibly
> POKY_BBLAYERS_CONF_VERSION =3D "2"
> BBPATH =3D "${TOPDIR}"
>=20
> BBFILES ?=3D ""
> BBLAYERS ?=3D " \
>=20
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
>=20
> My local.conf file I have added the below details:
> MACHINE ??=3D "raspberrypi4"
> DISTRO_FEATURES +=3D "virtualization xen"
> PACKAGE_CLASSES ?=3D "package_rpm"
> CONF_VERSION =3D "1"
> IMAGE_FEATURES +=3D "ssh-server-dropbear"
>=20
> Actually I have manually enabled the "CONFIG_XEN=3Dy" (which was not set=
 earlier) in .config file @ path :=20
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnue=
abi/linux-raspberrypi/1_4.19.88+gitAUTOINC+988cc7beac-r0/linux-raspberrypi4=
-standard-build/
> later I anable "CONFIG_NETXEN_NIC=3Dy"(which was not set earlier)=20
> But even then I am not able to build the final kernel image.
>=20
> But I am getting a warning:=20
> WARNING: /home/siddhu/Documents/yocto/sources/meta-raspberrypi/recipes-k=
ernel/linux/linux-raspberrypi_4.19.bb.do_compile is tainted from a forced r=
un
> Initialising tasks: 100% |#######################################| Time:=
 0:00:04
> Sstate summary: Wanted 27 Found 25 Missed 2 Current 840 (92% match, 99% =
complete)
>=20
> Will it impact on image anyway?
>=20
> Below is the my error details:
>=20
>=20
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
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
> DNF version: 4.1.0
> cachedir: /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-=
linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf
> Added oe-repo repo from /home/siddhu/Documents/yocto/build/tmp/work/rasp=
berrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo
> repo: using cache for: oe-repo
> not found other for:=20
> not found modules for:=20
> not found deltainfo for:=20
> not found updateinfo for:=20
> oe-repo: using metadata from Thu 04 Jun 2020 11:38:41 AM UTC.
> Last metadata expiration check: 0:00:01 ago on Thu 04 Jun 2020 11:38:42 =
AM UTC.
> No module defaults found
> No match for argument: kernel-module-xen-blkback
> No match for argument: kernel-module-xen-gntalloc
> No match for argument: kernel-module-xen-gntdev
> No match for argument: kernel-module-xen-netback
> No match for argument: kernel-module-xen-wdt
> Error: Unable to find a match
>  
> ERROR: xen-image-minimal-1.0-r0 do_rootfs:=20
> ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/build/=
tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp/log.=
do_rootfs.31739
> ERROR: Task (/home/siddhu/Documents/yocto/sources/meta-virtualization/re=
cipes-extended/images/xen-image-minimal.bb:do_rootfs) failed with exit code=
 '1'
> NOTE: Tasks Summary: Attempted 2605 tasks of which 2604 didn't need to b=
e rerun and 1 failed.
>  
> Summary: 1 task failed:
>   /home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-exten=
ded/images/xen-image-minimal.bb:do_rootfs
>  
> I have tried the same for "cubieboard2" also even there I faced the same=
 issue.Eagerly waiting for the response.
>=20
> I have attached the recent log too Please help me on this.=20
>=20
>=20
>=20
> Best Regards,
> Siddhartha V
> <log.do_rootfs.31739>
>=20

--Apple-Mail-72D5111E-92E2-4CEF-814A-D84E84A989AC
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body dir=3D"auto"><div dir=3D"ltr">Hello Siddhartha,</di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">I am also interested in runni=
ng Xen on the Raspberry Pi 4. I hope to have time next week to be able to l=
ook into it.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Christopher</=
div><div dir=3D"ltr"><br><blockquote type=3D"cite">On Jun 4, 2020, at 5:05 =
AM, Siddhartha V &lt;Siddhuvgowda.18695@gmail.com&gt; wrote:<br><br></block=
quote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<p style=3D=
"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI'=
, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">Hel=
lo dear meta-virtualization team,</p>
<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont=
, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji';">I am building the xen minimal image using yocto warrior<span style=
=
=3D"font-weight: bold;">&nbsp;("bitbake xen-image-minimal")&nbsp;</span>by=
 giving the target machine as&nbsp;<span style=3D"font-weight: bold;">"rasp=
berrypi4"</span>.<br>Sorry for reposting I have already created a post (<a =
style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;" href=
=
=3D"https://lists.yoctoproject.org/g/meta-virtualization/topic/failure_to_=
build/74495311?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,74495311">=
Failure to build xen-image-minimal. Yocto bitbake failed @99% while buildin=
g xen-minimal-image</a>). From past ten days I have been stuck here. I felt=
 it might not be reaching the purpose so I am creating again.</p>
<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont=
, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji';"><span style=3D"font-weight: bold;">My bblayer.conf file is as belo=
w:</span><br><span style=3D"color: #24292e; font-family: -apple-system, Bli=
nkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emo=
ji', 'Segoe UI Emoji';"># POKY_BBLAYERS_CONF_VERSION is increased each time=
 build/conf/bblayers.conf<br></span><span style=3D"color: #24292e; font-fam=
ily: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-=
serif, 'Apple Color Emoji', 'Segoe UI Emoji';"># changes incompatibly<br></=
span><span style=3D"color: #24292e; font-family: -apple-system, BlinkMacSys=
temFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Se=
goe UI Emoji';">POKY_BBLAYERS_CONF_VERSION =3D "2"<br></span><span style=3D=
"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI'=
, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">BBP=
ATH =3D "${TOPDIR}"<br><br></span><span style=3D"color: #24292e; font-famil=
y: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-se=
rif, 'Apple Color Emoji', 'Segoe UI Emoji';">BBFILES ?=3D ""<br></span><spa=
n style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, =
'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Em=
oji';">BBLAYERS ?=3D " \</span></p>
<p><span style=3D"color: #24292e; font-family: -apple-system, BlinkMacSyst=
emFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Seg=
oe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/poky/meta \<br><=
/span><span style=3D"color: #24292e; font-family: -apple-system, BlinkMacSy=
stemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'S=
egoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/poky/meta-poky=
 \<br></span><span style=3D"color: #24292e; font-family: -apple-system, Bli=
nkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emo=
ji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/poky/me=
ta-yocto-bsp \<br></span><span style=3D"color: #24292e; font-family: -apple=
-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'App=
le Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sou=
rces/meta-openembedded/meta-oe \<br></span><span style=3D"color: #24292e; f=
ont-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial=
, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/D=
ocuments/yocto/sources/meta-openembedded/meta-multimedia \<br></span><span =
style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'S=
egoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoj=
i';">&nbsp; /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-pyt=
hon \<br></span><span style=3D"color: #24292e; font-family: -apple-system, =
BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color =
Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/meta=
-openembedded/meta-networking \<br></span><span style=3D"color: #24292e; fo=
nt-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial,=
 sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Do=
cuments/yocto/sources/meta-openembedded/meta-filesystems \<br></span><span =
style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'S=
egoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoj=
i';">&nbsp; /home/siddhu/Documents/yocto/sources/meta-cloud-services \<br><=
/span><span style=3D"color: #24292e; font-family: -apple-system, BlinkMacSy=
stemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'S=
egoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/meta-selinux \=
<br></span><span style=3D"color: #24292e; font-family: -apple-system, Blink=
MacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji=
', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/sources/meta-virt=
ualization\<br></span><span style=3D"color: #24292e; font-family: -apple-sy=
stem, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple =
Color Emoji', 'Segoe UI Emoji';">&nbsp; /home/siddhu/Documents/yocto/source=
s/meta-raspberrypi \<br></span><span style=3D"color: #24292e; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji';">&nbsp; "<br><br><span style=3D"fo=
nt-weight: bold;">My local.conf file I have added the below details:</span>=
<br></span><span style=3D"color: #24292e; font-family: -apple-system, Blink=
MacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji=
', 'Segoe UI Emoji';">MACHINE ??=3D "raspberrypi4"<br></span><span style=3D=
"color: #24292e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI'=
, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">DIS=
TRO_FEATURES +=3D "virtualization xen"<br></span><span style=3D"color: #242=
92e; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica,=
 Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">PACKAGE_CLASSES=
 ?=3D "package_rpm"<br></span>CONF_VERSION =3D "1"<br>IMAGE_FEATURES +=3D "=
ssh-server-dropbear"</p>
<div><strong>Actually I have manually enabled the "CONFIG_XEN=3Dy" (which =
was not set earlier) in .config file @ path :</strong>&nbsp;<br>
<div>/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-g=
nueabi/linux-raspberrypi/1_4.19.88+gitAUTOINC+988cc7beac-r0/linux-raspberry=
pi4-standard-build/</div>
<div><strong>later I anable "CONFIG_NETXEN_NIC=3Dy"</strong><span style=3D=
"font-weight: bold;"><strong>(</strong>which was not set earlier)&nbsp;</sp=
an><br>But even then I am not able to build the final kernel image.<br><br>=
<strong>But I am getting a warning:&nbsp;</strong><br>
<div>WARNING: /home/siddhu/Documents/yocto/sources/meta-raspberrypi/recipe=
s-kernel/linux/linux-raspberrypi_4.19.bb.do_compile is tainted from a force=
d run</div>
<div>Initialising tasks: 100% |#######################################| Ti=
me: 0:00:04</div>
<div>Sstate summary: Wanted 27 Found 25 Missed 2 Current 840 (92% match, 9=
9% complete)</div>
<div><br>Will it impact on image anyway?<br><br><strong>Below is the my er=
ror details:</strong><br><br><br></div>
</div>
<blockquote>
<div>NOTE: Executing SetScene Tasks</div>
<div>NOTE: Executing RunQueue Tasks</div>
<div><strong>ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke d=
nf.</strong> Command '/home/siddhu/Documents/yocto/build/tmp/work/raspberry=
pi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/b=
in/dnf -v --rpmverbosity=3Dinfo -y -c /home/siddhu/Documents/yocto/build/tm=
p/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/=
dnf/dnf.conf --setopt=3Dreposdir=3D/home/siddhu/Documents/yocto/build/tmp/w=
ork/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum=
.repos.d --installroot=3D/home/siddhu/Documents/yocto/build/tmp/work/raspbe=
rrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs --setopt=3Dlogdir=
=
=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnu=
eabi/xen-image-minimal/1.0-r0/temp --repofrompath=3Doe-repo,/home/siddhu/Do=
cuments/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-mini=
mal/1.0-r0/oe-rootfs-repo --nogpgcheck install kernel-module-xen-blkback ke=
rnel-module-xen-gntalloc kernel-module-xen-gntdev kernel-module-xen-netback=
 kernel-module-xen-wdt packagegroup-core-boot packagegroup-core-ssh-dropbea=
r packagegroup-core-ssh-openssh qemu run-postinsts xen-base locale-base-en-=
us locale-base-en-gb' returned 1:</div>
<div>DNF version: 4.1.0</div>
<div>cachedir: /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-po=
ky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf</div>
<div>Added oe-repo repo from /home/siddhu/Documents/yocto/build/tmp/work/r=
aspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo</div=
>
<div>repo: using cache for: oe-repo</div>
<div>not found other for:&nbsp;</div>
<div>not found modules for:&nbsp;</div>
<div>not found deltainfo for:&nbsp;</div>
<div>not found updateinfo for:&nbsp;</div>
<div>oe-repo: using metadata from Thu 04 Jun 2020 11:38:41 AM UTC.</div>
<div>Last metadata expiration check: 0:00:01 ago on Thu 04 Jun 2020 11:38:=
42 AM UTC.</div>
<div>No module defaults found</div>
<div>No match for argument: kernel-module-xen-blkback</div>
<div>No match for argument: kernel-module-xen-gntalloc</div>
<div>No match for argument: kernel-module-xen-gntdev</div>
<div>No match for argument: kernel-module-xen-netback</div>
<div>No match for argument: kernel-module-xen-wdt</div>
<div>Error: Unable to find a match</div>
<div>&nbsp;</div>
<div><strong>ERROR: xen-image-minimal-1.0-r0 do_rootfs:&nbsp;</strong></di=
v>
<div><strong>ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: d=
o_rootfs</strong></div>
<div><strong>ERROR: Logfile of failure stored in: /home/siddhu/Documents/y=
octo/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r=
0/temp/log.do_rootfs.31739</strong></div>
<div><strong>ERROR: Task (/home/siddhu/Documents/yocto/sources/meta-virtua=
lization/recipes-extended/images/xen-image-minimal.bb:do_rootfs) failed wit=
h exit code '1'</strong></div>
<div>NOTE: Tasks Summary: Attempted 2605 tasks of which 2604 didn't need t=
o be rerun and 1 failed.</div>
<div>&nbsp;</div>
<div>Summary: 1 task failed:</div>
<div>&nbsp; /home/siddhu/Documents/yocto/sources/meta-virtualization/recip=
es-extended/images/xen-image-minimal.bb:do_rootfs</div>
</blockquote>
<div>&nbsp;</div>
I have tried the same for "cubieboard2" also even there I faced the same i=
ssue.Eagerly waiting for the response.</div>
<p style=3D"color: #24292e; font-family: -apple-system, BlinkMacSystemFont=
, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji';"><br>I have attached the recent log too Please help me on this.&nbs=
p;<br><br><br></p>
Best Regards,<br>Siddhartha V
<div>&lt;log.do_rootfs.31739&gt;</div><span></span><br></div></blockquote>=
</body></html>

--Apple-Mail-72D5111E-92E2-4CEF-814A-D84E84A989AC--
