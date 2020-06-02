Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.10406.1591104010513688241
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 06:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LBIM+dwa;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id y5so10714825iob.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2020 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=wbjSPEtHVwAxADyDrZl0bcJd5uk1nScx/DiaCr2y4Ho=;
        b=LBIM+dwapLTuEKNOIyq4+l0nWhVE5Ek7YYI2ToTPWs5mI9xdWaFnpz0k4ex+/z5qR4
         YiVEeKCkJ8+YZzoq78PtjZDqr7vyxPTn6zDSzwvB8fkHvhotdMiI8+ppmwrNXbmvM2eZ
         8lp/E4ccMKs/rVl00qVWbAYWRPuSTDyMwtqs+80jLhPnQLki3cSUTY1yvBT3TGa0brWe
         U2DgfXsEQAFKUL8g25aNGW0Q5SyhtEvRSSa4rZGvlKyfm0UAzybB6q6YfkEiZA/AebKG
         Ev/bfvtECUQHITrGrExOgSrr4qQw1d5Y7KVHE9wCtCNilUxltrUUhRczIk4P07p+jid7
         l14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=wbjSPEtHVwAxADyDrZl0bcJd5uk1nScx/DiaCr2y4Ho=;
        b=IMQ3TKfRE+msn68KjICVqI+ysFc3/HwbculNt+FHZM73oZAhG82+CmDU/CTLM53i14
         43d7YDj81UbWM+wrgfavy9KoNTVMZ4SwOMv0XDvM2w6aoiJL9IE0nKMCQl8FlbUK51sv
         pbf5EmwPraRKBmS+4+evq1rSUrBaWJ9rvXO9Mm2moRbxeqpWJ0t+52XdnGqq5EVOGX1T
         WPB2kgEa4yRCFh8bnOyYy6/S+VJHv4z9iFu8VCASDZU/vsQanJPlfNhNs/tY7JLRZzWn
         xO4zhTcJxlS0M0s7vkWEEXyRaCpe/lVJV7cSkvPHJrf7uRDJGHjmuCrNE/moMFRImxyn
         xCaA==
X-Gm-Message-State: AOAM532bmVi6AhUQgmSjra+j90c//xM79L4SieF3faAdYZCNLELXjwxb
	iUOiX9/aB7vafWhLrWOXE6zok08aJSLmoQaeIDE=
X-Google-Smtp-Source: ABdhPJwgucOvMAjHdLv4/43Jq5/P7fydL12+RbOLohuBvZ/itWRWhBRiXMe8srp/XF5/sI2ovG1tuP/4TV8iki1xkXg=
X-Received: by 2002:a5d:9242:: with SMTP id e2mr22327473iol.85.1591104009789;
 Tue, 02 Jun 2020 06:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <UK36.1590564847438252986.f6GO@lists.yoctoproject.org>
 <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
 <CAEkELtD1DUvhGaQpDTLwrTgUx_wFqPFDHcLVn1XWpxFmFeDCeQ@mail.gmail.com> <CADkTA4NZ2TZ-i9WmoK-6MuJzZA2tzOcqie1rDk0NuPVgac-NGQ@mail.gmail.com>
In-Reply-To: <CADkTA4NZ2TZ-i9WmoK-6MuJzZA2tzOcqie1rDk0NuPVgac-NGQ@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Tue, 2 Jun 2020 18:49:56 +0530
Message-ID: <CAEkELtD8hpR-1F-km6DK2q-f6o5z-q=eF6ouyGRsMzWLpZ+QaA@mail.gmail.com>
Subject: Re: [meta-virtualization] Failure to build xen-image-minimal. Yocto bitbake failed @99% while building xen-minimal-image
To: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004de58005a719c506"

--0000000000004de58005a719c506
Content-Type: text/plain; charset="UTF-8"

Hello sir,

  As you suggested I serached for the kernel config file.  In my case the
location is
"home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/rpi-kernel-misc.cfg"
I found this rpi-kernel-misc.cfg config file but inside this file I have
only one line:

CONFIG_SENSORS_RPI_POE_FAN=m

Should I add the Xen related modules that I am getting in the error here?


Thanks ,
Siddhartha V

On Mon, Jun 1, 2020 at 6:18 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Mon, Jun 1, 2020 at 12:55 AM siddhartha v
> <siddhuvgowda.18695@gmail.com> wrote:
> >
> > Hello  sir,
> >
> >       I have searched for what you have suggested. But, I couldn't find
> the kernel.config file anywhere actually I thibk I am mising something
> important. MAy I know what mistake I am doing please. Can I get any  link
> or info how to proceed with this  issue please.
> >
>
> The Yocto mega manual should have the details on where to find it. But
> it is found in the build/tmp/work/<your machine>/<your kernel
> version>/<your machine>-build/.config, if you are using linux-yocto.
>
> Other kernels will put it in a similar directory structure.
>
> Bruce
>
> > My bblayer.conf file is as below: (Am I missing any layers here?)
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
> > /home/siddhu/Documents/yocto/sources/poky/meta \
> > /home/siddhu/Documents/yocto/sources/poky/meta-poky \
> > /home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
> > /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
> > /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia \
> > /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
> > /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking \
> > /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \
> > /home/siddhu/Documents/yocto/sources/meta-cloud-services \
> > /home/siddhu/Documents/yocto/sources/meta-selinux \
> > /home/siddhu/Documents/yocto/sources/meta-virtualization\
> > /home/siddhu/Documents/yocto/sources/meta-raspberrypi \
> > "
> >
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
> >
> > Thanks,
> > Siddhartha V
> >
> > On Wed, May 27, 2020 at 5:53 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >>
> >> On Wed, May 27, 2020 at 3:34 AM <Siddhuvgowda.18695@gmail.com> wrote:
> >> >
> >> > Hello dear meta-virtualization team,
> >> >
> >> > I am building the xen minimal image using yocto warrior ("bitbake
> xen-image-minimal") by giving the target machine as "raspberrypi4". It
> reached 99% but at last I got below error and the whole process terminated
> with error.
> >> >
> >> > ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
> Command
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
> >> >
> >> > DNF version: 4.1.0
> >> >
> >> > cachedir:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf
> >> >
> >> > Added oe-repo repo from
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-repo
> >> >
> >> > repo: using cache for: oe-repo
> >> >
> >> > not found other for:
> >> >
> >> > not found modules for:
> >> >
> >> > not found deltainfo for:
> >> >
> >> > not found updateinfo for:
> >> >
> >> > oe-repo: using metadata from Wed 27 May 2020 06:15:39 AM UTC.
> >> >
> >> > Last metadata expiration check: 0:00:01 ago on Wed 27 May 2020
> 06:15:45 AM UTC.
> >> >
> >> > No module defaults found
> >> >
> >> > No match for argument: kernel-module-xen-blkback
> >> >
> >> > No match for argument: kernel-module-xen-gntalloc
> >> >
> >> > No match for argument: kernel-module-xen-gntdev
> >> >
> >> > No match for argument: kernel-module-xen-netback
> >> >
> >> > No match for argument: kernel-module-xen-wdt
> >>
> >> Have you checked that these modules are enabled in your kernel config ?
> >>
> >> We provide reference fragments in meta-virtualization, but if the
> >> kernel recipe you are using doesn't support fragment merging (like
> >> linux-yocto, which is what I test), then you won't have those configs
> >> enabled simply by using meta-virt.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >
> >> > Error: Unable to find a match
> >> >
> >> >
> >> >
> >> > ERROR: xen-image-minimal-1.0-r0 do_rootfs:
> >> >
> >> > ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> >> >
> >> > ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/temp/log.do_rootfs.14256
> >> >
> >> > ERROR: Task
> (/home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_rootfs)
> failed with exit code '1'
> >> >
> >> > NOTE: Tasks Summary: Attempted 2605 tasks of which 2152 didn't need
> to be rerun and 1 failed.
> >> >
> >> > Summary: 1 task failed:
> >> >
> >> >
>  /home/siddhu/Documents/yocto/sources/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:
> do_rootfs
> >> >
> >> > Summary: There were 3 ERROR messages shown, returning a non-zero exit
> code.
> >> >
> >> > May I know what mistake I am doing here please. I have attached
> screenshot also.
> >> >
> >> >
> >> > My bblayer.conf file is as below:
> >> >
> >> > # POKY_BBLAYERS_CONF_VERSION is increased each time
> build/conf/bblayers.conf
> >> > # changes incompatibly
> >> > POKY_BBLAYERS_CONF_VERSION = "2"
> >> > BBPATH = "${TOPDIR}"
> >> >
> >> > BBFILES ?= ""
> >> > BBLAYERS ?= " \
> >> >
> >> >   /home/siddhu/Documents/yocto/sources/poky/meta \
> >> >   /home/siddhu/Documents/yocto/sources/poky/meta-poky \
> >> >   /home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \
> >> >   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \
> >> >
>  /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedia \
> >> >   /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \
> >> >
>  /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networking \
> >> >
>  /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesystems \
> >> >   /home/siddhu/Documents/yocto/sources/meta-cloud-services \
> >> >   /home/siddhu/Documents/yocto/sources/meta-selinux \
> >> >   /home/siddhu/Documents/yocto/sources/meta-virtualization\
> >> >   /home/siddhu/Documents/yocto/sources/meta-raspberrypi \
> >> >   "
> >> >
> >> > My local.conf file I have added the below details:
> >> >
> >> > MACHINE ??= "raspberrypi4"
> >> > DISTRO_FEATURES += "virtualization xen"
> >> > PACKAGE_CLASSES ?= "package_rpm"
> >> > CONF_VERSION = "1"
> >> > IMAGE_FEATURES += "ssh-server-dropbear"
> >> >
> >> >
> >> > I have tried the same for "cubieboard2" also even there I faced the
> same issue.Eagerly waiting for the response.
> >> >
> >> > Regards,
> >> > Siddhartha V
> >> >
> >> > 
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Thanks and Regards.
> > Siddhartha V.
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

--0000000000004de58005a719c506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello sir,<div><br></div><div>=C2=A0 As you suggested I se=
rached for the kernel config file.=C2=A0 In my case the location is &quot;h=
ome/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/l=
inux-raspberrypi/rpi-kernel-misc.cfg&quot;</div><div>I found this=C2=A0rpi-=
kernel-misc.cfg config file but inside this file I have=C2=A0 only one line=
:</div><div><br></div><div>CONFIG_SENSORS_RPI_POE_FAN=3Dm<br></div><div><br=
></div><div>Should I add the Xen related modules that I am getting in the e=
rror here?</div><div><br></div><div><br></div><div>Thanks ,</div><div>Siddh=
artha V</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Jun 1, 2020 at 6:18 PM Bruce Ashfield &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jun 1, 2020=
 at 12:55 AM siddhartha v<br>
&lt;<a href=3D"mailto:siddhuvgowda.18695@gmail.com" target=3D"_blank">sidd=
huvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello=C2=A0 sir,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I have searched for what you have suggested=
. But, I couldn&#39;t find the kernel.config file anywhere actually I thibk=
 I am mising something important. MAy I know what mistake I am doing please=
. Can I get any=C2=A0 link or info how to proceed with this=C2=A0 issue ple=
ase.<br>
&gt;<br>
<br>
The Yocto mega manual should have the details on where to find it. But<br>
it is found in the build/tmp/work/&lt;your machine&gt;/&lt;your kernel<br>
version&gt;/&lt;your machine&gt;-build/.config, if you are using linux-yoc=
to.<br>
<br>
Other kernels will put it in a similar directory structure.<br>
<br>
Bruce<br>
<br>
&gt; My bblayer.conf file is as below: (Am I missing any layers here?)<br>
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
&gt; /home/siddhu/Documents/yocto/sources/poky/meta \<br>
&gt; /home/siddhu/Documents/yocto/sources/poky/meta-poky \<br>
&gt; /home/siddhu/Documents/yocto/sources/poky/meta-yocto-bsp \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-oe \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-multimedi=
a \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-python \<=
br>
&gt; /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-networkin=
g \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-openembedded/meta-filesyste=
ms \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-cloud-services \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-selinux \<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-virtualization\<br>
&gt; /home/siddhu/Documents/yocto/sources/meta-raspberrypi \<br>
&gt; &quot;<br>
&gt;<br>
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
&gt;<br>
&gt; Thanks,<br>
&gt; Siddhartha V<br>
&gt;<br>
&gt; On Wed, May 27, 2020 at 5:53 PM Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 27, 2020 at 3:34 AM &lt;<a href=3D"mailto:Siddhuvgowd=
a.18695@gmail.com" target=3D"_blank">Siddhuvgowda.18695@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello dear meta-virtualization team,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am building the xen minimal image using yocto warrior (&qu=
ot;bitbake xen-image-minimal&quot;) by giving the target machine as &quot;r=
aspberrypi4&quot;. It reached 99% but at last I got below error and the who=
le process terminated with error.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke =
dnf. Command &#39;/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-=
poky-linux-gnueabi/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/d=
nf -v --rpmverbosity=3Dinfo -y -c /home/siddhu/Documents/yocto/build/tmp/wo=
rk/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/dnf/=
dnf.conf --setopt=3Dreposdir=3D/home/siddhu/Documents/yocto/build/tmp/work/=
raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/etc/yum.rep=
os.d --installroot=3D/home/siddhu/Documents/yocto/build/tmp/work/raspberryp=
i4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs --setopt=3Dlogdir=3D/=
home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/=
xen-image-minimal/1.0-r0/temp --repofrompath=3Doe-repo,/home/siddhu/Documen=
ts/yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1=
.0-r0/oe-rootfs-repo --nogpgcheck install kernel-module-xen-blkback kernel-=
module-xen-gntalloc kernel-module-xen-gntdev kernel-module-xen-netback kern=
el-module-xen-wdt packagegroup-core-boot packagegroup-core-ssh-dropbear pac=
kagegroup-core-ssh-openssh qemu run-postinsts xen-base locale-base-en-us lo=
cale-base-en-gb&#39; returned 1:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; DNF version: 4.1.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; cachedir: /home/siddhu/Documents/yocto/build/tmp/work/raspbe=
rrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/rootfs/var/cache/dnf<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Added oe-repo repo from /home/siddhu/Documents/yocto/build/t=
mp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-r0/oe-rootfs-=
repo<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; repo: using cache for: oe-repo<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; not found other for:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; not found modules for:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; not found deltainfo for:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; not found updateinfo for:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; oe-repo: using metadata from Wed 27 May 2020 06:15:39 AM UTC=
.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Last metadata expiration check: 0:00:01 ago on Wed 27 May 20=
20 06:15:45 AM UTC.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No module defaults found<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No match for argument: kernel-module-xen-blkback<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No match for argument: kernel-module-xen-gntalloc<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No match for argument: kernel-module-xen-gntdev<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No match for argument: kernel-module-xen-netback<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No match for argument: kernel-module-xen-wdt<br>
&gt;&gt;<br>
&gt;&gt; Have you checked that these modules are enabled in your kernel co=
nfig ?<br>
&gt;&gt;<br>
&gt;&gt; We provide reference fragments in meta-virtualization, but if the=
<br>
&gt;&gt; kernel recipe you are using doesn&#39;t support fragment merging =
(like<br>
&gt;&gt; linux-yocto, which is what I test), then you won&#39;t have those=
 configs<br>
&gt;&gt; enabled simply by using meta-virt.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Error: Unable to find a match<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: xen-image-minimal-1.0-r0 do_rootfs:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: =
do_rootfs<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: Logfile of failure stored in: /home/siddhu/Documents/=
yocto/build/tmp/work/raspberrypi4-poky-linux-gnueabi/xen-image-minimal/1.0-=
r0/temp/log.do_rootfs.14256<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: Task (/home/siddhu/Documents/yocto/sources/meta-virtu=
alization/recipes-extended/images/xen-image-minimal.bb:do_rootfs) failed wi=
th exit code &#39;1&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; NOTE: Tasks Summary: Attempted 2605 tasks of which 2152 didn=
&#39;t need to be rerun and 1 failed.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Summary: 1 task failed:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-virtua=
lization/recipes-extended/images/xen-image-minimal.bb:do_rootfs<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Summary: There were 3 ERROR messages shown, returning a non-=
zero exit code.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; May I know what mistake I am doing here please. I have attac=
hed screenshot also.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; My bblayer.conf file is as below:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # POKY_BBLAYERS_CONF_VERSION is increased each time build/co=
nf/bblayers.conf<br>
&gt;&gt; &gt; # changes incompatibly<br>
&gt;&gt; &gt; POKY_BBLAYERS_CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt; &gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; BBFILES ?=3D &quot;&quot;<br>
&gt;&gt; &gt; BBLAYERS ?=3D &quot; \<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta \=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta-p=
oky \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/poky/meta-y=
octo-bsp \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openem=
bedded/meta-oe \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openem=
bedded/meta-multimedia \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openem=
bedded/meta-python \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openem=
bedded/meta-networking \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-openem=
bedded/meta-filesystems \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-cloud-=
services \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-selinu=
x \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-virtua=
lization\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources/meta-raspbe=
rrypi \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; My local.conf file I have added the below details:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; MACHINE ??=3D &quot;raspberrypi4&quot;<br>
&gt;&gt; &gt; DISTRO_FEATURES +=3D &quot;virtualization xen&quot;<br>
&gt;&gt; &gt; PACKAGE_CLASSES ?=3D &quot;package_rpm&quot;<br>
&gt;&gt; &gt; CONF_VERSION =3D &quot;1&quot;<br>
&gt;&gt; &gt; IMAGE_FEATURES +=3D &quot;ssh-server-dropbear&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have tried the same for &quot;cubieboard2&quot; also even =
there I faced the same issue.Eagerly waiting for the response.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Siddhartha V<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Thanks and Regards.<br>
&gt; Siddhartha V.<br>
&gt;<br>
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

--0000000000004de58005a719c506--
