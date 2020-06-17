Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.190.1592420420959632642
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 12:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AsQG4HFC;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id q8so4142356iow.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Jun 2020 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IvtkLfsYZd8hk8Esxo0steGhjGh9tq5IvlENa6LNxng=;
        b=AsQG4HFCC2ZK1/8gLn5+t2kEfak1439p2H+6cGUQFA90MuWcr6rSncQN+gY/cURvil
         c2i34HacBVrakHuL7OnCrQwrPNRSpuHNLe6RJ3N47m8FXCoVkKVuICO8ng/9/lIxUYxH
         YII9ehseQybBVxcQiBNqtiQrwXHvrpWbG7j38e6ZhthNzl3mgYwUJsqCfdh44x11iF1G
         pwYXTUX6wPjE4GylqizA2BggD4w/KUWb3b4WcVaX8JEHh9fv+y6Fbw95vJ/4B7JGcYoX
         k0XXLCev/QmTfMan/oJivOB+Gz0Qike4o9QUEk/KBnynaDHW3Qz+T4w2eqgJiYXdRHmd
         mDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvtkLfsYZd8hk8Esxo0steGhjGh9tq5IvlENa6LNxng=;
        b=Iqqf4sosqEJXzt6XSsnPbQnqsiheD8AQ6Ivi9rL24lLkS+6vSWQcTDyE67Uz1lWfGF
         dvu0YhEtJHXhzUxQwtHiNoSZancjL+IlAMSbu3YQH1+X7VUyvN1u4jZQ902SGS4We6+m
         9iyOXPK0XafuT5N1zDHYEl2dwkT6D1/g7HCWC5Lh1JPbSsyFL8iREa+pYbQzLIZfwQR4
         chfhWJQ08upr1TTmGuzS4+td65DRVkGyekR3miUyCYqO0ksgWuatDCkttiw4kUZ03NYH
         XQE8q9ZjzDj4RkLuruTD4Oneo71ZmC8792kMLRjn+6QbglebnSKNHQfDHiMxXxoMaKLC
         IJmA==
X-Gm-Message-State: AOAM533MrTSHGnq/QoW4JhRM7Dm5hmdFAb28M51u/LvIM40AdeECAV9h
	M5tCqfs9XG+CVILkPLPeCJ0OqL6UKIcmVOId8rI=
X-Google-Smtp-Source: ABdhPJxKBqua09NtzNfe++9V4JcTHXoim3FaSakChkAg78qSFidhYvm67oVtMvTLZ1CKrCtkWTRZELlhaSn4YXJKxhE=
X-Received: by 2002:a02:ac01:: with SMTP id a1mr740619jao.33.1592420420090;
 Wed, 17 Jun 2020 12:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtABVciaYgQmp-dOfxPSepSo1Dk5WuLVQ=Ubt9EDACyxKA@mail.gmail.com>
 <CACMJ4GagmpBh8355d2eKqdC9h8asF+SXA8SyVeWfFTba_qFh8w@mail.gmail.com>
In-Reply-To: <CACMJ4GagmpBh8355d2eKqdC9h8asF+SXA8SyVeWfFTba_qFh8w@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Thu, 18 Jun 2020 00:30:07 +0530
Message-ID: <CAEkELtDsu82pRcBeRUUSeTb=VsHRAFnC_Z+14Gwg+0FNVsfWMA@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen On Raspberrypi-4. Not able to build the xen image.
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000079005205a84c4523"

--00000000000079005205a84c4523
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, thank you so much sir. Its really helpful review comments that I
have gotten from you. Being a newbee I am bit confused. I will work on the
points that you have mentioned.

Regards,
Siddhartha V

On Thu, 18 Jun, 2020, 12:16 AM Christopher Clark, <
christopher.w.clark@gmail.com> wrote:

> On Wed, Jun 17, 2020 at 6:53 AM Siddhartha V
> <Siddhuvgowda.18695@gmail.com> wrote:
> >
> > Hello,
> >
> >    Its been two month that I am trying to build the xen image for the
> Raspberrypi board using meta-virtualization. But I am not able to get any
> progress, Is the building Xen is really that difficult?. Can anybody help
> me out what wrong I am doing here. Yes I do agree I am a newbee to the
> yocto but I am totally stuck here. Please sugeest me how can I proceed
> further to get the xen image built.
>
> Let's be clear: at the moment, the Raspberry Pi 4 board is not
> supported for running Xen in any official release of Yocto.
>
> There are in-progress efforts under development to add support for it
> and that entails working with unreleased versions of the software,
> which is a situation that often increases the difficulty of getting to
> a working result. There are multiple reasons evident for the
> difficulties you've been experiencing, and this is one of them.
>
> The good news is that given the level of interest that has been
> expressed both in the Xen and Yocto communities, it is likely that
> improvements to both, in addition to Linux, will make it easier to
> build and run Xen on the Raspberry Pi 4 in the near future.
>
> > I have already created a issue ([meta-virtualization] Xen on Raspberry
> Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs:
> Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs=
:
> Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")) But I a=
m
> not getting the progressive result. So I am asking again. Please help me =
on
> this.
> >
> >  As suggested in the previous issue I did the same what  suggested. I
> started a new build where followed the below steps,
> > 1. I downloaded the master branch of below layers:
> >
> > git clone git://git.yoctoproject.org/poky -b master
> > git clone git://git.openembedded.org/meta-openembedded -b master
> > git clone git://git.yoctoproject.org/meta-raspberrypi -b master
> > git clone https://github.com/dozylynx/meta-virtualization.git
>
> In another thread, you were given specific commit revisions to work
> with and those are important. I advise that you check out those commit
> revisions rather than tracking the tip of the master branch of each
> repository. That will reduce the divergence between your source code
> and the code that has been tested as working elsewhere.
>
> > Later I have changed the local.conf as below:
> >
> > MACHINE =3D "raspberrypi4-64"
> > DISTRO_FEATURES_append =3D " virtualization xen"
> > QEMU_TARGETS =3D "i386 x86_64 aarch64 arm"
> > PACKAGECONFIG_pn-qemu +=3D " xen fdt"
> > PACKAGECONFIG_remove_pn-qemu +=3D " sdl"
> > PREFERRED_VERSION_linux-raspberrypi =3D "4.19.%"
> > IMAGE_FSTYPES =3D "tar.xz tar.bz2 ext3 rpi-sdimg"
> > IMAGE_FEATURES +=3D "ssh-server-dropbear"
> >
> > When started bitbake  "bitbake xen-image-minimal"  initially I got the
> below log:
> >
> >
> > siddhu@siddhu:~/Documents/yocto/build$ bitbake -k xen-image-minimal
> > Loading cache: 100%
> |########################################################################=
##################################|
> Time: 0:00:01
> > Loaded 3545 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.46.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal"
> > TARGET_SYS           =3D "aarch64-poky-linux"
> > MACHINE              =3D "raspberrypi4-64"
> > DISTRO               =3D "poky"
> > DISTRO_VERSION       =3D "3.1+snapshot-20200617"
> > TUNE_FEATURES        =3D "aarch64 cortexa72 crc crypto"
> > TARGET_FPU           =3D ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "master:816a12758bfcb5409accbf636ec58d9fa917cd=
b6"
> > meta-oe
> > meta-multimedia
> > meta-python
> > meta-networking
> > meta-filesystems     =3D "master:06a9209d8fb944dc1e24b00e68886c00135c72=
c0"
> > meta-virtualization  =3D "master:d75bc448866d2b36779251efb1310d0234ece3=
0b"
> > meta-raspberrypi     =3D "master:39cf54c3cb429f2c6e0a000e79f6f06b39e2fa=
8b"
> >
> > Initialising tasks: 100%
> |########################################################################=
#############################|
> Time: 0:00:06
> > Sstate summary: Wanted 1787 Found 0 Missed 1787 Current 187 (0% match,
> 9% complete)
> >
> >
> > but within few minutes building get  terminated with the below error:
> >
> > Task
> (/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devtools/gcc/gcc=
-cross_10.1.bb:do_compile)
> failed with exit code '1'
>
> The error step here is 'do_compile', and the component is 'gcc'. That
> would seem to indicate that there is a problem with the source code
> that you are working with, so I suggest checking out the specific
> source code revisions in your layer repositories that you were given,
> which may resolve this.
>
>
> > Later I used "bitbake -k xen-image-minimal"  (The initial log remained
> same) but even then it reached 50% but later it It gave the below error:
> >
> > ERROR: Task
> (/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devtools/gcc/gcc=
-cross_10.1.bb:do_compile)
> failed with exit code '1'
> > WARNING: mtools-native-4.0.24-r0 do_fetch: Failed to fetch URL
> https://ftp.gnu.org/gnu/mtools/mtools-4.0.24.tar.bz2, attempting MIRRORS
> if available
> > WARNING: bcm2835-bootfiles-20200603-r3 do_fetch: Failed to fetch URL
> https://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d52203=
73fe829b5961c42.tar.gz,
> attempting MIRRORS if available
> > ERROR: bcm2835-bootfiles-20200603-r3 do_fetch: Fetcher failure: Fetch
> command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; exp=
ort
> DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus,guid=3Dae1c3c0=
e8d9c84558dde0a465ee9d9e2";
> export SSH_AGENT_PID=3D"1593"; export
> SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
> PATH=3D"/home/siddhu/Documents/yocto/build/tmp/sysroots-uninative/x86_64-=
linux/usr/bin:/home/siddhu/Documents/yocto/sources1/poky/scripts:/home/sidd=
hu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-bootfi=
les/20200603-r3/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/sidd=
hu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-bootfi=
les/20200603-r3/recipe-sysroot/usr/bin/crossscripts:/home/siddhu/Documents/=
yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-=
r3/recipe-sysroot-native/usr/sbin:/home/siddhu/Documents/yocto/build/tmp/wo=
rk/raspberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot-=
native/usr/bin:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-=
poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot-native/sbin:/home/s=
iddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-boo=
tfiles/20200603-r3/recipe-sysroot-native/bin:/home/siddhu/Documents/yocto/s=
ources1/poky/bitbake/bin:/home/siddhu/Documents/yocto/build/tmp/hosttools";
> export HOME=3D"/home/siddhu"; /usr/bin/env wget -t 2 -T 30 --passive-ftp
> --no-check-certificate -P /home/siddhu/Documents/yocto/build/downloads '
> https://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d52203=
73fe829b5961c42.tar.gz'
> --progress=3Ddot -v failed with exit code 4, output:
> > --2020-06-17 09:34:20--
> https://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d52203=
73fe829b5961c42.tar.gz
> > Resolving github.com (github.com)... 13.234.176.102
> > Connecting to github.com (github.com)|13.234.176.102|:443... connected.
> > HTTP request sent, awaiting response... 302 Found
> > Location:
> https://codeload.github.com/raspberrypi/firmware/tar.gz/23548e550a757d368=
d3d5220373fe829b5961c42
> [following]
> > --2020-06-17 09:34:38--
> https://codeload.github.com/raspberrypi/firmware/tar.gz/23548e550a757d368=
d3d5220373fe829b5961c42
> > Resolving codeload.github.com (codeload.github.com)... 13.233.43.20
> > Connecting to codeload.github.com (codeload.github.com)|13.233.43.20|:4=
43...
> connected.
> > HTTP request sent, awaiting response... 200 OK
> > Length: unspecified [application/x-gzip]
> > Saving to:
> =E2=80=98/home/siddhu/Documents/yocto/build/downloads/23548e550a757d368d3=
d5220373fe829b5961c42.tar.gz=E2=80=99
> >
> >      0K .......... .......... .......... .......... .......... 54.6K
> [snip]
> >   7800K .......... .......... .......... .......... ..........  284K
> >   7850K .......... .......... ...                               312K=3D=
47s
> >
> > 2020-06-17 09:36:01 (168 KB/s) - Read error at byte 8062081
> (Success).Retrying.
> >
> > --2020-06-17 09:36:02--  (try: 2)
> https://codeload.github.com/raspberrypi/firmware/tar.gz/23548e550a757d368=
d3d5220373fe829b5961c42
> > Connecting to codeload.github.com (codeload.github.com)|13.233.43.20|:4=
43...
> failed: Connection timed out.
> > Resolving codeload.github.com (codeload.github.com)... 13.127.152.42
> > Connecting to codeload.github.com (codeload.github.com)|13.127.152.42|:=
443...
> connected.
> > HTTP request sent, awaiting response... 200 OK
> > Length: unspecified [application/x-gzip]
> > Saving to:
> =E2=80=98/home/siddhu/Documents/yocto/build/downloads/23548e550a757d368d3=
d5220373fe829b5961c42.tar.gz=E2=80=99
> >
> >      0K .......... .......... .......... .......... ..........  320K
> [snip]
> >  16200K .......... .......... .......... .......... .......... 61.4M
> >  16250K ........                                                116M=3D=
38s
> >
> > 2020-06-17 09:37:50 (431 KB/s) - Read error at byte 16648248
> (Success).Giving up.
> >
> >
> > ERROR: bcm2835-bootfiles-20200603-r3 do_fetch: Fetcher failure for URL:=
 '
> https://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d52203=
73fe829b5961c42.tar.gz'.
> Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bc=
m2835-bootfiles/20200603-r3/temp/log.do_fetch.17387
>
> The failure step here is 'do_fetch', which usually indicates a problem
> transferring data for the recipe from the source (in this case github)
> to your local development system. It looks like you may have a network
> problem.
>
>
> > But later the whole building process stopped with below error:
> >
> > ERROR: linux-raspberrypi-1_4.19.126+gitAUTOINC+f6b3ac28f0-r0 do_fetch:
> Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset
> _PYTHON_SYSCONFIGDATA_NAME; export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus,guid=3Dae1c3c0=
e8d9c84558dde0a465ee9d9e2";
> export SSH_AGENT_PID=3D"1593"; export
> SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
> PATH=3D"/home/siddhu/Documents/yocto/build/tmp/sysroots-uninative/x86_64-=
linux/usr/bin:/home/siddhu/Documents/yocto/sources1/poky/scripts:/home/sidd=
hu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberr=
ypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot-native/usr/bin/aarch=
64-poky-linux:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-p=
oky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysr=
oot/usr/bin/crossscripts:/home/siddhu/Documents/yocto/build/tmp/work/raspbe=
rrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/=
recipe-sysroot-native/usr/sbin:/home/siddhu/Documents/yocto/build/tmp/work/=
raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28=
f0-r0/recipe-sysroot-native/usr/bin:/home/siddhu/Documents/yocto/build/tmp/=
work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b=
3ac28f0-r0/recipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/build/tm=
p/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f=
6b3ac28f0-r0/recipe-sysroot-native/bin:/home/siddhu/Documents/yocto/sources=
1/poky/bitbake/bin:/home/siddhu/Documents/yocto/build/tmp/hosttools";
> export HOME=3D"/home/siddhu"; LANG=3DC git -c core.fsyncobjectfiles=3D0 c=
lone
> --bare --mirror git://github.com/raspberrypi/linux.git
> /home/siddhu/Documents/yocto/build/downloads/git2/github.com.raspberrypi.=
linux.git
> --progress failed with exit code 128, output:
> > Cloning into bare repository
> '/home/siddhu/Documents/yocto/build/downloads/git2/github.com.raspberrypi=
.linux.git'...
> > remote: Enumerating objects: 61, done.
> > remote: Counting objects: 100% (61/61), done.
> > remote: Compressing objects: 100% (54/54), done.
> > fatal: read error: Connection reset by peer1.86 MiB | 105.00 KiB/s
> > fatal: early EOF
> > fatal: index-pack failed
> >
> > ERROR: linux-raspberrypi-1_4.19.126+gitAUTOINC+f6b3ac28f0-r0 do_fetch:
> Fetcher failure for URL: 'git://
> github.com/raspberrypi/linux.git;branch=3Drpi-4.19.y'. Unable to fetch UR=
L
> from any source.
> > ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/li=
nux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/temp/log.do_fetch.3109
> > ERROR: Task
> (/home/siddhu/Documents/yocto/sources1/meta-raspberrypi/recipes-kernel/li=
nux/linux-raspberrypi_4.19.bb:do_fetch)
> failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3038 tasks of which 2677 didn't need to
> be rerun and 3 failed.
> >
> > Summary: 3 tasks failed:
> >
>  /home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devtools/gcc/gcc=
-cross_10.1.bb:
> do_compile
> >
>  /home/siddhu/Documents/yocto/sources1/meta-raspberrypi/recipes-bsp/bootf=
iles/bcm2835-bootfiles.bb:
> do_fetch
> >
>  /home/siddhu/Documents/yocto/sources1/meta-raspberrypi/recipes-kernel/li=
nux/linux-raspberrypi_4.19.bb:
> do_fetch
> > Summary: There were 3 WARNING messages shown.
> > Summary: There were 6 ERROR messages shown, returning a non-zero exit
> code.
> >
> >
> >
> >   Its been two month that I am trying to build the xen image for the
> Raspberrypi board using meta-virtualization. But I am not able to get any
> progress, Is the building Xen is really that difficult?.
>
> Let's just review: You are:
> - new to Yocto and unfamiliar with diagnosing build issues that arise
> when using it.
> - not using a released version of Yocto, because none of the released
> versions support the software that you need.
> - not using the revisions of the source code that you were recommended to
> use.
> - building a significant quantity of unreleased software - an entire
> Linux distribution and tools to build it - from source.
> - apparently using an unreliable network connection and do not have a
> local mirror of the source code.
> - cross-compiling.
> - building a hypervisor.
> - targetting a board that is not supported for the hypervisor that
> you're building.
> - engaging in multiple different threads on several mailing lists
> regarding the issues you're encountering.
>
> That is not necessarily a simple situation, but despite all of the
> above, I think you're actually getting pretty close to having it
> built. As far as I can tell, your remaining issues are:
> - check out the correct versions of the source code that you need
> (repeated below)
> - find a method of overcoming the do_fetch failures, which may involve
> changes to your network or repeating the build to overcome transient
> connectivity problems.
>
> git://git.yoctoproject.org/poky
>   18b6b2ae819cbf0ef3858944b4cd02ab74df6607
> git://git.openembedded.org/meta-openembedded
>   463f9a3ef0935d772a0be0437a8c09df64ed2f07
> git://git.yoctoproject.org/meta-raspberrypi
>   e589e0f3fda8f15f1093909328605e0bb6516d94
> https://github.com/dozylynx/meta-virtualization
>   0c809ead05224a61a784744240bb9c125990c481
>
> Good luck,
>
> Christopher
>

--00000000000079005205a84c4523
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you, thank you so much sir. Its really helpful revi=
ew comments that I have gotten from you. Being a newbee I am bit confused. =
I will work=C2=A0on the points that you have mentioned.<div dir=3D"auto"><b=
r></div><div dir=3D"auto">Regards,=C2=A0</div><div dir=3D"auto">Siddhartha =
V=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 18 Jun, 2020, 12:16 AM Christopher Clark, &lt;<a href=
=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Jun 17, 2020 a=
t 6:53 AM Siddhartha V<br>
&lt;<a href=3D"mailto:Siddhuvgowda.18695@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">Siddhuvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Its been two month that I am trying to build the xen ima=
ge for the Raspberrypi board using meta-virtualization. But I am not able t=
o get any progress, Is the building Xen is really that difficult?. Can anyb=
ody help me out what wrong I am doing here. Yes I do agree I am a newbee to=
 the yocto but I am totally stuck here. Please sugeest me how can I proceed=
 further to get the xen image built.<br>
<br>
Let&#39;s be clear: at the moment, the Raspberry Pi 4 board is not<br>
supported for running Xen in any official release of Yocto.<br>
<br>
There are in-progress efforts under development to add support for it<br>
and that entails working with unreleased versions of the software,<br>
which is a situation that often increases the difficulty of getting to<br>
a working result. There are multiple reasons evident for the<br>
difficulties you&#39;ve been experiencing, and this is one of them.<br>
<br>
The good news is that given the level of interest that has been<br>
expressed both in the Xen and Yocto communities, it is likely that<br>
improvements to both, in addition to Linux, will make it easier to<br>
build and run Xen on the Raspberry Pi 4 in the near future.<br>
<br>
&gt; I have already created a issue ([meta-virtualization] Xen on Raspberr=
y Pi 4 (was &quot;How to resolve the ERROR: xen-image-minimal-1.0-r0 do_roo=
tfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_roo=
tfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf&quot;))=
 But I am not getting the progressive result. So I am asking again. Please =
help me on this.<br>
&gt;<br>
&gt;=C2=A0 As suggested in the previous issue I did the same what=C2=A0 su=
ggested. I started a new build where followed the below steps,<br>
&gt; 1. I downloaded the master branch of below layers:<br>
&gt;<br>
&gt; git clone git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">git.yoctoproject.org/poky</a> -b ma=
ster<br>
&gt; git clone git://<a href=3D"http://git.openembedded.org/meta-openembed=
ded" rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/m=
eta-openembedded</a> -b master<br>
&gt; git clone git://<a href=3D"http://git.yoctoproject.org/meta-raspberry=
pi" rel=3D"noreferrer noreferrer" target=3D"_blank">git.yoctoproject.org/me=
ta-raspberrypi</a> -b master<br>
&gt; git clone <a href=3D"https://github.com/dozylynx/meta-virtualization.=
git" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/doz=
ylynx/meta-virtualization.git</a><br>
<br>
In another thread, you were given specific commit revisions to work<br>
with and those are important. I advise that you check out those commit<br>
revisions rather than tracking the tip of the master branch of each<br>
repository. That will reduce the divergence between your source code<br>
and the code that has been tested as working elsewhere.<br>
<br>
&gt; Later I have changed the local.conf as below:<br>
&gt;<br>
&gt; MACHINE =3D &quot;raspberrypi4-64&quot;<br>
&gt; DISTRO_FEATURES_append =3D &quot; virtualization xen&quot;<br>
&gt; QEMU_TARGETS =3D &quot;i386 x86_64 aarch64 arm&quot;<br>
&gt; PACKAGECONFIG_pn-qemu +=3D &quot; xen fdt&quot;<br>
&gt; PACKAGECONFIG_remove_pn-qemu +=3D &quot; sdl&quot;<br>
&gt; PREFERRED_VERSION_linux-raspberrypi =3D &quot;4.19.%&quot;<br>
&gt; IMAGE_FSTYPES =3D &quot;tar.xz tar.bz2 ext3 rpi-sdimg&quot;<br>
&gt; IMAGE_FEATURES +=3D &quot;ssh-server-dropbear&quot;<br>
&gt;<br>
&gt; When started bitbake=C2=A0 &quot;bitbake xen-image-minimal&quot;=C2=
=A0 initially I got the below log:<br>
&gt;<br>
&gt;<br>
&gt; siddhu@siddhu:~/Documents/yocto/build$ bitbake -k xen-image-minimal<b=
r>
&gt; Loading cache: 100% |################################################=
##########################################################| Time: 0:00:01<b=
r>
&gt; Loaded 3545 entries from dependency cache.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.46.0&q=
uot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-l=
inux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64-=
poky-linux&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;ras=
pberrypi4-64&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;poky&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.1+snapshot-20200=
617&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 cortexa72 =
crc crypto&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<b=
r>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:816a12758bf=
cb5409accbf636ec58d9fa917cdb6&quot;<br>
&gt; meta-oe<br>
&gt; meta-multimedia<br>
&gt; meta-python<br>
&gt; meta-networking<br>
&gt; meta-filesystems=C2=A0 =C2=A0 =C2=A0=3D &quot;master:06a9209d8fb944dc=
1e24b00e68886c00135c72c0&quot;<br>
&gt; meta-virtualization=C2=A0 =3D &quot;master:d75bc448866d2b36779251efb1=
310d0234ece30b&quot;<br>
&gt; meta-raspberrypi=C2=A0 =C2=A0 =C2=A0=3D &quot;master:39cf54c3cb429f2c=
6e0a000e79f6f06b39e2fa8b&quot;<br>
&gt;<br>
&gt; Initialising tasks: 100% |###########################################=
##########################################################| Time: 0:00:06<b=
r>
&gt; Sstate summary: Wanted 1787 Found 0 Missed 1787 Current 187 (0% match=
, 9% complete)<br>
&gt;<br>
&gt;<br>
&gt; but within few minutes building get=C2=A0 terminated with the below e=
rror:<br>
&gt;<br>
&gt; Task (/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devtool=
s/gcc/gcc-cross_10.1.bb:do_compile) failed with exit code &#39;1&#39;<br>
<br>
The error step here is &#39;do_compile&#39;, and the component is &#39;gcc=
&#39;. That<br>
would seem to indicate that there is a problem with the source code<br>
that you are working with, so I suggest checking out the specific<br>
source code revisions in your layer repositories that you were given,<br>
which may resolve this.<br>
<br>
<br>
&gt; Later I used &quot;bitbake -k xen-image-minimal&quot;=C2=A0 (The init=
ial log remained same) but even then it reached 50% but later it It gave th=
e below error:<br>
&gt;<br>
&gt; ERROR: Task (/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-=
devtools/gcc/gcc-cross_10.1.bb:do_compile) failed with exit code &#39;1&#39=
;<br>
&gt; WARNING: mtools-native-4.0.24-r0 do_fetch: Failed to fetch URL <a hre=
f=3D"https://ftp.gnu.org/gnu/mtools/mtools-4.0.24.tar.bz2" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://ftp.gnu.org/gnu/mtools/mtools-4.0.2=
4.tar.bz2</a>, attempting MIRRORS if available<br>
&gt; WARNING: bcm2835-bootfiles-20200603-r3 do_fetch: Failed to fetch URL =
<a href=3D"https://github.com/raspberrypi/firmware/archive/23548e550a757d36=
8d3d5220373fe829b5961c42.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d5=
220373fe829b5961c42.tar.gz</a>, attempting MIRRORS if available<br>
&gt; ERROR: bcm2835-bootfiles-20200603-r3 do_fetch: Fetcher failure: Fetch=
 command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; expo=
rt DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/1000/bus,guid=3Da=
e1c3c0e8d9c84558dde0a465ee9d9e2&quot;; export SSH_AGENT_PID=3D&quot;1593&qu=
ot;; export SSH_AUTH_SOCK=3D&quot;/run/user/1000/keyring/ssh&quot;; export =
PATH=3D&quot;/home/siddhu/Documents/yocto/build/tmp/sysroots-uninative/x86_=
64-linux/usr/bin:/home/siddhu/Documents/yocto/sources1/poky/scripts:/home/s=
iddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-boo=
tfiles/20200603-r3/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/s=
iddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-boo=
tfiles/20200603-r3/recipe-sysroot/usr/bin/crossscripts:/home/siddhu/Documen=
ts/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-bootfiles/202006=
03-r3/recipe-sysroot-native/usr/sbin:/home/siddhu/Documents/yocto/build/tmp=
/work/raspberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysro=
ot-native/usr/bin:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_=
64-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot-native/sbin:/hom=
e/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-=
bootfiles/20200603-r3/recipe-sysroot-native/bin:/home/siddhu/Documents/yoct=
o/sources1/poky/bitbake/bin:/home/siddhu/Documents/yocto/build/tmp/hosttool=
s&quot;; export HOME=3D&quot;/home/siddhu&quot;; /usr/bin/env wget -t 2 -T =
30 --passive-ftp --no-check-certificate -P /home/siddhu/Documents/yocto/bui=
ld/downloads &#39;<a href=3D"https://github.com/raspberrypi/firmware/archiv=
e/23548e550a757d368d3d5220373fe829b5961c42.tar.gz" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://github.com/raspberrypi/firmware/archive/235=
48e550a757d368d3d5220373fe829b5961c42.tar.gz</a>&#39; --progress=3Ddot -v f=
ailed with exit code 4, output:<br>
&gt; --2020-06-17 09:34:20--=C2=A0 <a href=3D"https://github.com/raspberry=
pi/firmware/archive/23548e550a757d368d3d5220373fe829b5961c42.tar.gz" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/raspberrypi/fi=
rmware/archive/23548e550a757d368d3d5220373fe829b5961c42.tar.gz</a><br>
&gt; Resolving <a href=3D"http://github.com" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">github.com</a> (<a href=3D"http://github.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">github.com</a>)... 13.234.176.102<br>
&gt; Connecting to <a href=3D"http://github.com" rel=3D"noreferrer norefer=
rer" target=3D"_blank">github.com</a> (<a href=3D"http://github.com" rel=3D=
"noreferrer noreferrer" target=3D"_blank">github.com</a>)|13.234.176.102|:4=
43... connected.<br>
&gt; HTTP request sent, awaiting response... 302 Found<br>
&gt; Location: <a href=3D"https://codeload.github.com/raspberrypi/firmware=
/tar.gz/23548e550a757d368d3d5220373fe829b5961c42" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://codeload.github.com/raspberrypi/firmware/tar=
.gz/23548e550a757d368d3d5220373fe829b5961c42</a> [following]<br>
&gt; --2020-06-17 09:34:38--=C2=A0 <a href=3D"https://codeload.github.com/=
raspberrypi/firmware/tar.gz/23548e550a757d368d3d5220373fe829b5961c42" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://codeload.github.com/r=
aspberrypi/firmware/tar.gz/23548e550a757d368d3d5220373fe829b5961c42</a><br>
&gt; Resolving <a href=3D"http://codeload.github.com" rel=3D"noreferrer no=
referrer" target=3D"_blank">codeload.github.com</a> (<a href=3D"http://code=
load.github.com" rel=3D"noreferrer noreferrer" target=3D"_blank">codeload.g=
ithub.com</a>)... 13.233.43.20<br>
&gt; Connecting to <a href=3D"http://codeload.github.com" rel=3D"noreferre=
r noreferrer" target=3D"_blank">codeload.github.com</a> (<a href=3D"http://=
codeload.github.com" rel=3D"noreferrer noreferrer" target=3D"_blank">codelo=
ad.github.com</a>)|13.233.43.20|:443... connected.<br>
&gt; HTTP request sent, awaiting response... 200 OK<br>
&gt; Length: unspecified [application/x-gzip]<br>
&gt; Saving to: =E2=80=98/home/siddhu/Documents/yocto/build/downloads/2354=
8e550a757d368d3d5220373fe829b5961c42.tar.gz=E2=80=99<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0K .......... .......... .......... .......... ..=
........ 54.6K<br>
[snip]<br>
&gt;=C2=A0 =C2=A07800K .......... .......... .......... .......... .......=
...=C2=A0 284K<br>
&gt;=C2=A0 =C2=A07850K .......... .......... ...=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0312K=3D47s<br>
&gt;<br>
&gt; 2020-06-17 09:36:01 (168 KB/s) - Read error at byte 8062081 (Success)=
.Retrying.<br>
&gt;<br>
&gt; --2020-06-17 09:36:02--=C2=A0 (try: 2)=C2=A0 <a href=3D"https://codel=
oad.github.com/raspberrypi/firmware/tar.gz/23548e550a757d368d3d5220373fe829=
b5961c42" rel=3D"noreferrer noreferrer" target=3D"_blank">https://codeload.=
github.com/raspberrypi/firmware/tar.gz/23548e550a757d368d3d5220373fe829b596=
1c42</a><br>
&gt; Connecting to <a href=3D"http://codeload.github.com" rel=3D"noreferre=
r noreferrer" target=3D"_blank">codeload.github.com</a> (<a href=3D"http://=
codeload.github.com" rel=3D"noreferrer noreferrer" target=3D"_blank">codelo=
ad.github.com</a>)|13.233.43.20|:443... failed: Connection timed out.<br>
&gt; Resolving <a href=3D"http://codeload.github.com" rel=3D"noreferrer no=
referrer" target=3D"_blank">codeload.github.com</a> (<a href=3D"http://code=
load.github.com" rel=3D"noreferrer noreferrer" target=3D"_blank">codeload.g=
ithub.com</a>)... 13.127.152.42<br>
&gt; Connecting to <a href=3D"http://codeload.github.com" rel=3D"noreferre=
r noreferrer" target=3D"_blank">codeload.github.com</a> (<a href=3D"http://=
codeload.github.com" rel=3D"noreferrer noreferrer" target=3D"_blank">codelo=
ad.github.com</a>)|13.127.152.42|:443... connected.<br>
&gt; HTTP request sent, awaiting response... 200 OK<br>
&gt; Length: unspecified [application/x-gzip]<br>
&gt; Saving to: =E2=80=98/home/siddhu/Documents/yocto/build/downloads/2354=
8e550a757d368d3d5220373fe829b5961c42.tar.gz=E2=80=99<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0K .......... .......... .......... .......... ..=
........=C2=A0 320K<br>
[snip]<br>
&gt;=C2=A0 16200K .......... .......... .......... .......... .......... 6=
1.4M<br>
&gt;=C2=A0 16250K ........=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 116M=3D38s<br>
&gt;<br>
&gt; 2020-06-17 09:37:50 (431 KB/s) - Read error at byte 16648248 (Success=
).Giving up.<br>
&gt;<br>
&gt;<br>
&gt; ERROR: bcm2835-bootfiles-20200603-r3 do_fetch: Fetcher failure for UR=
L: &#39;<a href=3D"https://github.com/raspberrypi/firmware/archive/23548e55=
0a757d368d3d5220373fe829b5961c42.tar.gz" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/raspberrypi/firmware/archive/23548e550a757=
d368d3d5220373fe829b5961c42.tar.gz</a>&#39;. Unable to fetch URL from any s=
ource.<br>
&gt; ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/bui=
ld/tmp/work/raspberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/temp/l=
og.do_fetch.17387<br>
<br>
The failure step here is &#39;do_fetch&#39;, which usually indicates a pro=
blem<br>
transferring data for the recipe from the source (in this case github)<br>
to your local development system. It looks like you may have a network<br>
problem.<br>
<br>
<br>
&gt; But later the whole building process stopped with below error:<br>
&gt;<br>
&gt; ERROR: linux-raspberrypi-1_4.19.126+gitAUTOINC+f6b3ac28f0-r0 do_fetch=
: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_=
SYSCONFIGDATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/ru=
n/user/1000/bus,guid=3Dae1c3c0e8d9c84558dde0a465ee9d9e2&quot;; export SSH_A=
GENT_PID=3D&quot;1593&quot;; export SSH_AUTH_SOCK=3D&quot;/run/user/1000/ke=
yring/ssh&quot;; export PATH=3D&quot;/home/siddhu/Documents/yocto/build/tmp=
/sysroots-uninative/x86_64-linux/usr/bin:/home/siddhu/Documents/yocto/sourc=
es1/poky/scripts:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_6=
4-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-s=
ysroot-native/usr/bin/aarch64-poky-linux:/home/siddhu/Documents/yocto/build=
/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOIN=
C+f6b3ac28f0-r0/recipe-sysroot/usr/bin/crossscripts:/home/siddhu/Documents/=
yocto/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.12=
6+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot-native/usr/sbin:/home/siddhu/Docu=
ments/yocto/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4=
.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot-native/usr/bin:/home/siddhu=
/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberryp=
i/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot-native/sbin:/home/sidd=
hu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberr=
ypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot-native/bin:/home/sid=
dhu/Documents/yocto/sources1/poky/bitbake/bin:/home/siddhu/Documents/yocto/=
build/tmp/hosttools&quot;; export HOME=3D&quot;/home/siddhu&quot;; LANG=3DC=
 git -c core.fsyncobjectfiles=3D0 clone --bare --mirror git://<a href=3D"ht=
tp://github.com/raspberrypi/linux.git" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">github.com/raspberrypi/linux.git</a> /home/siddhu/Documents/yo=
cto/build/downloads/git2/github.com.raspberrypi.linux.git --progress failed=
 with exit code 128, output:<br>
&gt; Cloning into bare repository &#39;/home/siddhu/Documents/yocto/build/=
downloads/git2/github.com.raspberrypi.linux.git&#39;...<br>
&gt; remote: Enumerating objects: 61, done.<br>
&gt; remote: Counting objects: 100% (61/61), done.<br>
&gt; remote: Compressing objects: 100% (54/54), done.<br>
&gt; fatal: read error: Connection reset by peer1.86 MiB | 105.00 KiB/s<br=
>
&gt; fatal: early EOF<br>
&gt; fatal: index-pack failed<br>
&gt;<br>
&gt; ERROR: linux-raspberrypi-1_4.19.126+gitAUTOINC+f6b3ac28f0-r0 do_fetch=
: Fetcher failure for URL: &#39;git://<a href=3D"http://github.com/raspberr=
ypi/linux.git;branch=3Drpi-4.19.y" rel=3D"noreferrer noreferrer" target=3D"=
_blank">github.com/raspberrypi/linux.git;branch=3Drpi-4.19.y</a>&#39;. Unab=
le to fetch URL from any source.<br>
&gt; ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/bui=
ld/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTO=
INC+f6b3ac28f0-r0/temp/log.do_fetch.3109<br>
&gt; ERROR: Task (/home/siddhu/Documents/yocto/sources1/meta-raspberrypi/r=
ecipes-kernel/linux/linux-raspberrypi_4.19.bb:do_fetch) failed with exit co=
de &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 3038 tasks of which 2677 didn&#39;t ne=
ed to be rerun and 3 failed.<br>
&gt;<br>
&gt; Summary: 3 tasks failed:<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-d=
evtools/gcc/gcc-cross_10.1.bb:do_compile<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources1/meta-raspberrypi/re=
cipes-bsp/bootfiles/bcm2835-bootfiles.bb:do_fetch<br>
&gt;=C2=A0 =C2=A0/home/siddhu/Documents/yocto/sources1/meta-raspberrypi/re=
cipes-kernel/linux/linux-raspberrypi_4.19.bb:do_fetch<br>
&gt; Summary: There were 3 WARNING messages shown.<br>
&gt; Summary: There were 6 ERROR messages shown, returning a non-zero exit=
 code.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Its been two month that I am trying to build the xen imag=
e for the Raspberrypi board using meta-virtualization. But I am not able to=
 get any progress, Is the building Xen is really that difficult?.<br>
<br>
Let&#39;s just review: You are:<br>
- new to Yocto and unfamiliar with diagnosing build issues that arise<br>
when using it.<br>
- not using a released version of Yocto, because none of the released<br>
versions support the software that you need.<br>
- not using the revisions of the source code that you were recommended to =
use.<br>
- building a significant quantity of unreleased software - an entire<br>
Linux distribution and tools to build it - from source.<br>
- apparently using an unreliable network connection and do not have a<br>
local mirror of the source code.<br>
- cross-compiling.<br>
- building a hypervisor.<br>
- targetting a board that is not supported for the hypervisor that<br>
you&#39;re building.<br>
- engaging in multiple different threads on several mailing lists<br>
regarding the issues you&#39;re encountering.<br>
<br>
That is not necessarily a simple situation, but despite all of the<br>
above, I think you&#39;re actually getting pretty close to having it<br>
built. As far as I can tell, your remaining issues are:<br>
- check out the correct versions of the source code that you need<br>
(repeated below)<br>
- find a method of overcoming the do_fetch failures, which may involve<br>
changes to your network or repeating the build to overcome transient<br>
connectivity problems.<br>
<br>
git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"noreferrer noref=
errer" target=3D"_blank">git.yoctoproject.org/poky</a><br>
=C2=A0 18b6b2ae819cbf0ef3858944b4cd02ab74df6607<br>
git://<a href=3D"http://git.openembedded.org/meta-openembedded" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedde=
d</a><br>
=C2=A0 463f9a3ef0935d772a0be0437a8c09df64ed2f07<br>
git://<a href=3D"http://git.yoctoproject.org/meta-raspberrypi" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">git.yoctoproject.org/meta-raspberrypi<=
/a><br>
=C2=A0 e589e0f3fda8f15f1093909328605e0bb6516d94<br>
<a href=3D"https://github.com/dozylynx/meta-virtualization" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://github.com/dozylynx/meta-virtuali=
zation</a><br>
=C2=A0 0c809ead05224a61a784744240bb9c125990c481<br>
<br>
Good luck,<br>
<br>
Christopher<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000079005205a84c4523--
