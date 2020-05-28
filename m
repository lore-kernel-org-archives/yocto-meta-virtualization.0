Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web12.7289.1590649414279100173
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 May 2020 00:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bZ1pY5oA;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id y18so8417470iow.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 May 2020 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XKSfy9ORvfRJbkgQ+Z4maOpzhrEiTiQcSJiRBZpRLSM=;
        b=bZ1pY5oAQnO0oCfHhRT8JHphRFv2OZq3YbhS5TJcCn67S5eR5mHxijz5Mpm0yKP2i9
         2VmKg6qipUp6rtCFJ/PYrl2e7qa5p2rz7UZSNJGWcFgX67ibi7YqaGqr0ENqxjg82Nek
         8rlK8PN1OpIeCv6EyeaKwNlJPBoywQlWkfij71JmDjExC8mcdTQBNpLPlffuEN9mVJ+p
         HGffsKZq9MyyWF77GC8G/NuS2FsqIdXiII12fFKe3+xWoSuzjw1aY2xGChPH6WpiU4ak
         xlPFSa4i865sdoAODmXBu58bsHLdNAQeqNsSMCyO1VfRGB3G0hBtLP24vasxg8ZPrG4Q
         PG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XKSfy9ORvfRJbkgQ+Z4maOpzhrEiTiQcSJiRBZpRLSM=;
        b=YbHUmC0Ai2+8i9KtZtAbs7PDAsqIIuHr3dJaCrjZ6A6huv7GMGlaMIrCHKu36GdoEj
         Bcg3Lgvq8irfSsRLnh8c24zoK5YYOfo6br52FHlM9kJJGZvMISLpgWy0t2utNwNnr1zG
         6C8RmyoJ/0fm0YEMqx4lvHkbos6X+zyIPqiGQG17VzYAl+NcXO4oYV/uFvhQug8U8w+K
         sTZPb0EVIvr5qt5W+l0GcuI6bYrgxEw+c2R08ZFmCKn070Y8p8oWeFNFpsYtL8QPD6QN
         FTMIZx93EvweCnIJhJHMhjpDb31X3BH3yr04TRPBpgik5ldaoRplJPz4AlccPz1X3kHK
         aNvQ==
X-Gm-Message-State: AOAM5301rcbTnepF7EcxkP/aIoQftsDb/Pt/oy4OhoTtsbxMYx2dJ/Vc
	ICtu1zlaZ13zBRwACI2bUsqBGdcRS+Ac0WY5Zyw=
X-Google-Smtp-Source: ABdhPJwrsxHsQXXwb9jeTENadh0+BTwnjqTJ4w3Krm/l+6dYREVkz3yJTB3whoUDkEleSZt1rOftfwv7jTMrNtqKXxI=
X-Received: by 2002:a02:ab94:: with SMTP id t20mr947113jan.13.1590649413481;
 Thu, 28 May 2020 00:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <UK36.1590564847438252986.f6GO@lists.yoctoproject.org> <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
In-Reply-To: <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Thu, 28 May 2020 12:33:21 +0530
Message-ID: <CAEkELtAVEgw4oJMnzCcVBAjbOPyafVxEnCGF1p+5Crp+ma5mJQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Failure to build xen-image-minimal. Yocto bitbake failed @99% while building xen-minimal-image
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000040ba0a05a6afed1e"

--00000000000040ba0a05a6afed1e
Content-Type: text/plain; charset="UTF-8"

hello,

   Thanks for the reply. I searched for what you have suggested, but it
looks like I am missing something here. I didn't see kernel.conf file I
have shared my bblayers.conf details also , please let me know what I am
missing here. I am using the yocto for the first time for kernel build.

Please suggest me if I am doing anything wrong here.

Below is the bblayers.conf file details:


 # POKY_BBLAYERS_CONF_VERSION is increased each time
build/conf/bblayers.conf
 # changes incompatibly
 POKY_BBLAYERS_CONF_VERSION = "2"
 BBPATH = "${TOPDIR}"

 BBFILES ?= ""
 BBLAYERS ?= " \

   /home/siddhu/Documents/yocto/sources/poky/meta \
   /home/siddhu/Documents/yocto/sources/poky/meta-poky \
   /home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia \
   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking \
   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \
   /home/siddhu/Documents/yocto/sources/meta-cloud-services \
   /home/siddhu/Documents/yocto/sources/meta-selinux \
   /home/siddhu/Documents/yocto/sources/meta-virtualization\
   /home/siddhu/Documents/yocto/sources/meta-raspberrypi \
   "

Am I missing any layers here? Please suggest me.


On Wed, May 27, 2020 at 5:53 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Wed, May 27, 2020 at 3:34 AM <Siddhuvgowda.18695@gmail.com> wrote:
> >
> > Hello dear meta-virtualization team,
> >
> > I am building the xen minimal image using yocto warrior ("bitbake
> xen-image-minimal") by giving the target machine as "raspberrypi4". It
> reached 99% but at last I got below error and the whole process terminated
> with error.
> >
> > ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command
> '/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf
> -v --rpmverbosity=info -y -c
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
> --setopt=reposdir=/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum.repos.d
> --installroot=/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs
> --setopt=logdir=/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp
> --repofrompath=oe-repo,/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo
> --nogpgcheck install kernel-module-xen-blkback kernel-module-xen-gntalloc
> kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt
> packagegroup-core-boot packagegroup-core-ssh-dropbear
> packagegroup-core-ssh-openssh qemu run-postinsts xen-base locale-base-en-us
> locale-base-en-gb' returned 1:
> >
> > DNF version: 4.1.0
> >
> > cachedir:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf
> >
> > Added oe-repo repo from
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo
> >
> > repo: using cache for: oe-repo
> >
> > not found other for:
> >
> > not found modules for:
> >
> > not found deltainfo for:
> >
> > not found updateinfo for:
> >
> > oe-repo: using metadata from Wed 27 May 2020 06:15:39 AM UTC.
> >
> > Last metadata expiration check: 0:00:01 ago on Wed 27 May 2020 06:15:45
> AM UTC.
> >
> > No module defaults found
> >
> > No match for argument: kernel-module-xen-blkback
> >
> > No match for argument: kernel-module-xen-gntalloc
> >
> > No match for argument: kernel-module-xen-gntdev
> >
> > No match for argument: kernel-module-xen-netback
> >
> > No match for argument: kernel-module-xen-wdt
>
> Have you checked that these modules are enabled in your kernel config ?
>
> We provide reference fragments in meta-virtualization, but if the
> kernel recipe you are using doesn't support fragment merging (like
> linux-yocto, which is what I test), then you won't have those configs
> enabled simply by using meta-virt.
>
> Cheers,
>
> Bruce
>
> >
> > Error: Unable to find a match
> >
> >
> >
> > ERROR: xen-image-minimal-1.0-r0 do_rootfs:
> >
> > ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> >
> > ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp/log.do_rootfs.14256
> >
> > ERROR: Task
> (/home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_rootfs)
> failed with exit code '1'
> >
> > NOTE: Tasks Summary: Attempted 2605 tasks of which 2152 didn't need to
> be rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >
> >
>  /home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:
> do_rootfs
> >
> > Summary: There were 3 ERROR messages shown, returning a non-zero exit
> code.
> >
> > May I know what mistake I am doing here please. I have attached
> screenshot also.
> >
> >
> > My bblayer.conf file is as below:
> >
> > # POKY_BBLAYERS_CONF_VERSION is increased each time
> build/conf/bblayers.conf
> > # changes incompatibly
> > POKY_BBLAYERS_CONF_VERSION = "2"
> > BBPATH = "${TOPDIR}"
> >
> > BBFILES ?= ""
> > BBLAYERS ?= " \
> >
> >   /home/siddhu/Documents/yocto/sources/poky/meta \
> >   /home/siddhu/Documents/yocto/sources/poky/meta-poky \
> >   /home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
> >   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
> >   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia
> \
> >   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
> >   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking
> \
> >
>  /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \
> >   /home/siddhu/Documents/yocto/sources/meta-cloud-services \
> >   /home/siddhu/Documents/yocto/sources/meta-selinux \
> >   /home/siddhu/Documents/yocto/sources/meta-virtualization\
> >   /home/siddhu/Documents/yocto/sources/meta-raspberrypi \
> >   "
> >
> > My local.conf file I have added the below details:
> >
> > MACHINE ??= "raspberrypi4"
> > DISTRO_FEATURES += "virtualization xen"
> > PACKAGE_CLASSES ?= "package_rpm"
> > CONF_VERSION = "1"
> > IMAGE_FEATURES += "ssh-server-dropbear"
> >
> >
> > I have tried the same for "cubieboard2" also even there I faced the same
> issue.Eagerly waiting for the response.
> >
> > Regards,
> > Siddhartha V
> >
> > 
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


-- 
Thanks and Regards.
Siddhartha V.

--00000000000040ba0a05a6afed1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hello,<div><br></div><div>=C2=A0 =C2=A0Thanks for the repl=
y. I searched for what you have suggested, but it looks like I am missing s=
omething here. I didn&#39;t see kernel.conf file I have shared my bblayers.=
conf details also , please let me know what I am missing here. I am using t=
he yocto for the first time for kernel build.=C2=A0</div><div><br></div><di=
v>Please suggest=C2=A0me if I am doing anything wrong here.</div><div><br><=
/div><div>Below is the bblayers.conf file details:</div><div><br></div><div=
><br>=C2=A0# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/b=
blayers.conf<br>=C2=A0# changes incompatibly<br>=C2=A0POKY_BBLAYERS_CONF_VE=
RSION =3D &quot;2&quot;<br>=C2=A0BBPATH =3D &quot;${TOPDIR}&quot;<br><br>=
=C2=A0BBFILES ?=3D &quot;&quot;<br>=C2=A0BBLAYERS ?=3D &quot; \<br><br>=C2=
=
=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta \<br>=C2=A0 =C2=
=A0/home/siddhu/Documents/yocto/sources/poky/meta-poky \<br>=C2=A0 =C2=A0/=
home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \<br>=C2=A0 =C2=A0/=
home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \<br>=C2=A0 =
=C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimed=
ia \<br>=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded=
/meta-python \<br>=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-op=
enembedded/meta-networking \<br>=C2=A0 =C2=A0/home/siddhu/Documents/yocto/s=
ources/meta-openembedded/meta-filesystems \<br>=C2=A0 =C2=A0/home/siddhu/Do=
cuments/yocto/sources/meta-cloud-services \<br>=C2=A0 =C2=A0/home/siddhu/Do=
cuments/yocto/sources/meta-selinux \<br>=C2=A0 =C2=A0/home/siddhu/Documents=
/yocto/sources/meta-virtualization\<br>=C2=A0 =C2=A0/home/siddhu/Documents/=
yocto/sources/meta-raspberrypi \<br>=C2=A0 =C2=A0&quot;<br></div><div><br><=
/div><div>Am I missing any layers here? Please suggest me.</div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, May 27, 2020 at 5:53 PM Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, May 27, 2020 at 3:3=
4 AM &lt;<a href=3D"mailto:Siddhuvgowda.18695@gmail.com" target=3D"_blank">=
Siddhuvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello dear meta-virtualization team,<br>
&gt;<br>
&gt; I am building the xen minimal image using yocto warrior (&quot;bitbak=
e xen-image-minimal&quot;) by giving the target machine as &quot;raspberryp=
i4&quot;. It reached 99% but at last I got below error and the whole proces=
s terminated with error.<br>
&gt;<br>
&gt; ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Comm=
and &#39;/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linu=
x-gnueabi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf -v --r=
pmverbosity=3Dinfo -y -c /home/siddhu/Documents/yocto/build/tmp/work/raspbe=
rrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf =
--setopt=3Dreposdir=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberry=
pi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum.repos.d --in=
stallroot=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-l=
inux-gnueabi/xen-image-minimal/1.0-r0/rootfs --setopt=3Dlogdir=3D/home/sidd=
hu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image=
-minimal/1.0-r0/temp --repofrompath=3Doe-repo,/home/siddhu/Documents/yocto/=
build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-=
rootfs-repo --nogpgcheck install kernel-module-xen-blkback kernel-module-xe=
n-gntalloc kernel-module-xen-gntdev kernel-module-xen-netback kernel-module=
-xen-wdt packagegroup-core-boot packagegroup-core-ssh-dropbear packagegroup=
-core-ssh-openssh qemu run-postinsts xen-base locale-base-en-us locale-base=
-en-gb&#39; returned 1:<br>
&gt;<br>
&gt; DNF version: 4.1.0<br>
&gt;<br>
&gt; cachedir: /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-po=
ky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf<br>
&gt;<br>
&gt; Added oe-repo repo from /home/siddhu/Documents/yocto/build/tmp/work/r=
aspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo<br>
&gt;<br>
&gt; repo: using cache for: oe-repo<br>
&gt;<br>
&gt; not found other for:<br>
&gt;<br>
&gt; not found modules for:<br>
&gt;<br>
&gt; not found deltainfo for:<br>
&gt;<br>
&gt; not found updateinfo for:<br>
&gt;<br>
&gt; oe-repo: using metadata from Wed 27 May 2020 06:15:39 AM UTC.<br>
&gt;<br>
&gt; Last metadata expiration check: 0:00:01 ago on Wed 27 May 2020 06:15:=
45 AM UTC.<br>
&gt;<br>
&gt; No module defaults found<br>
&gt;<br>
&gt; No match for argument: kernel-module-xen-blkback<br>
&gt;<br>
&gt; No match for argument: kernel-module-xen-gntalloc<br>
&gt;<br>
&gt; No match for argument: kernel-module-xen-gntdev<br>
&gt;<br>
&gt; No match for argument: kernel-module-xen-netback<br>
&gt;<br>
&gt; No match for argument: kernel-module-xen-wdt<br>
<br>
Have you checked that these modules are enabled in your kernel config ?<br=
>
<br>
We provide reference fragments in meta-virtualization, but if the<br>
kernel recipe you are using doesn&#39;t support fragment merging (like<br>
linux-yocto, which is what I test), then you won&#39;t have those configs<=
br>
enabled simply by using meta-virt.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Error: Unable to find a match<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ERROR: xen-image-minimal-1.0-r0 do_rootfs:<br>
&gt;<br>
&gt; ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs=
<br>
&gt;<br>
&gt; ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/bui=
ld/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp/l=
og.do_rootfs.14256<br>
&gt;<br>
&gt; ERROR: Task (/home/siddhu/Documents/yocto/sources/meta-virtualization=
/recipes-extended/images/xen-image-minimal.bb:do_rootfs) failed with exit c=
ode &#39;1&#39;<br>
&gt;<br>
&gt; NOTE: Tasks Summary: Attempted 2605 tasks of which 2152 didn&#39;t ne=
ed to be rerun and 1 failed.<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-virtualization/=
recipes-extended/images/xen-image-minimal.bb:do_rootfs<br>
&gt;<br>
&gt; Summary: There were 3 ERROR messages shown, returning a non-zero exit=
 code.<br>
&gt;<br>
&gt; May I know what mistake I am doing here please. I have attached scree=
nshot also.<br>
&gt;<br>
&gt;<br>
&gt; My bblayer.conf file is as below:<br>
&gt;<br>
&gt; # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblaye=
rs.conf<br>
&gt; # changes incompatibly<br>
&gt; POKY_BBLAYERS_CONF_VERSION =3D &quot;2&quot;<br>
&gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt;<br>
&gt; BBFILES ?=3D &quot;&quot;<br>
&gt; BBLAYERS ?=3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta-poky \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp =
\<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-oe \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-multimedia \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-python \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-networking \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openembedded/me=
ta-filesystems \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-cloud-services =
\<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-selinux \<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-virtualization\=
<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-raspberrypi \<b=
r>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; My local.conf file I have added the below details:<br>
&gt;<br>
&gt; MACHINE ??=3D &quot;raspberrypi4&quot;<br>
&gt; DISTRO_FEATURES +=3D &quot;virtualization xen&quot;<br>
&gt; PACKAGE_CLASSES ?=3D &quot;package_rpm&quot;<br>
&gt; CONF_VERSION =3D &quot;1&quot;<br>
&gt; IMAGE_FEATURES +=3D &quot;ssh-server-dropbear&quot;<br>
&gt;<br>
&gt;<br>
&gt; I have tried the same for &quot;cubieboard2&quot; also even there I f=
aced the same issue.Eagerly waiting for the response.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Siddhartha V<br>
&gt;<br>
&gt; <br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks and Regards.</div>=
Siddhartha V.<div>=C2=A0</div></div></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000040ba0a05a6afed1e--
