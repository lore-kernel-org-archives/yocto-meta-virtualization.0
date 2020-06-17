Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.2632.1592419567254884573
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 11:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y0/MhG6M;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id v13so2481624otp.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Jun 2020 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=txN/oNiXFtCNq7trLR74SS1qIhrE2MPBapEKXPN5eJw=;
        b=Y0/MhG6MPuCzghSxitWVHI9IccXBqTGam6cL/WSyAdnzTdJ3P4QEWCy9bUO2k3HkbP
         jIaJwlT2PSrqhfe+6PffF1cb9JdMva0fBFg+yeV9GBFQcYetnatKr2vXck9JvjGFi7dZ
         dcJk3aFzJH4dlugQ5W8CJdktUctg88iJCIfZd8YulNX7wq8rXG2saxqmdI1YqP9BN1Ex
         FqFtV6SBSkDEp226eIR5PTCoZ81VgqJrgMbsNOms4+CitQ7IM3qfVh8yBC5Cx625GtUP
         pX1+yM2IyoOZWkF21wJuHkes62pApbAK6nI3r9yHz3RC7KTz+pIw+XQjVxEeI9MrC6ao
         +O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=txN/oNiXFtCNq7trLR74SS1qIhrE2MPBapEKXPN5eJw=;
        b=AVmFc9WxWqDQQscJSQtKrjOexiCBz/wh67PayDuiSjMhzGubBsvEpgoyaOw+NIAQCr
         Te01wDldNXD4a/nfFWWcqmVhfM0q48uWOSqPJpGyJHzydfGHASysi5kb+cUD8weWcm3M
         D57NrMthOSSj6cQTDx4o+EVMFlj11velddHJotQrNcYuOJsgHIijJ1FeS9eYD0479JdM
         kemOA3nyqzCxKtgZn6hHp5x5VELcFPcdg2EShtj0CEMxAuDSqkERA2iqomgRMQmT93cx
         oEeu/9AuuaXmdtVVO99fFlJxyKmnzOpWQ1oSI5/QgCyBQgzBiORZTGhUJDReHn+R+zkz
         XunQ==
X-Gm-Message-State: AOAM531bVWpNVfePqiVVtJTsEwHq7alq6yF34OGYzs6zBgVUIq4PZOm+
	AtZUcKO+vgHJRzhSN6LTZtefU+YZ/AilNd8YGl0=
X-Google-Smtp-Source: ABdhPJwJfhlz47S6ZZbV0Ozif+ASxxCQNJzqa1zJO2F7OMRiawLDmQN3L07KRBA8lrXRPtFdnxuDw7imhhR1UfNz3mI=
X-Received: by 2002:a05:6830:3110:: with SMTP id b16mr346752ots.80.1592419566377;
 Wed, 17 Jun 2020 11:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtABVciaYgQmp-dOfxPSepSo1Dk5WuLVQ=Ubt9EDACyxKA@mail.gmail.com>
In-Reply-To: <CAEkELtABVciaYgQmp-dOfxPSepSo1Dk5WuLVQ=Ubt9EDACyxKA@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 17 Jun 2020 11:45:54 -0700
Message-ID: <CACMJ4GagmpBh8355d2eKqdC9h8asF+SXA8SyVeWfFTba_qFh8w@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen On Raspberrypi-4. Not able to build the xen image.
To: Siddhartha V <Siddhuvgowda.18695@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 6:53 AM Siddhartha V
<Siddhuvgowda.18695@gmail.com> wrote:
>
> Hello,
>
>    Its been two month that I am trying to build the xen image for the Ras=
pberrypi board using meta-virtualization. But I am not able to get any prog=
ress, Is the building Xen is really that difficult?. Can anybody help me ou=
t what wrong I am doing here. Yes I do agree I am a newbee to the yocto but=
 I am totally stuck here. Please sugeest me how can I proceed further to ge=
t the xen image built.

Let's be clear: at the moment, the Raspberry Pi 4 board is not
supported for running Xen in any official release of Yocto.

There are in-progress efforts under development to add support for it
and that entails working with unreleased versions of the software,
which is a situation that often increases the difficulty of getting to
a working result. There are multiple reasons evident for the
difficulties you've been experiencing, and this is one of them.

The good news is that given the level of interest that has been
expressed both in the Xen and Yocto communities, it is likely that
improvements to both, in addition to Linux, will make it easier to
build and run Xen on the Raspberry Pi 4 in the near future.

> I have already created a issue ([meta-virtualization] Xen on Raspberry Pi=
 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Func=
tion failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Coul=
d not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")) But I am not =
getting the progressive result. So I am asking again. Please help me on thi=
s.
>
>  As suggested in the previous issue I did the same what  suggested. I sta=
rted a new build where followed the below steps,
> 1. I downloaded the master branch of below layers:
>
> git clone git://git.yoctoproject.org/poky -b master
> git clone git://git.openembedded.org/meta-openembedded -b master
> git clone git://git.yoctoproject.org/meta-raspberrypi -b master
> git clone https://github.com/dozylynx/meta-virtualization.git

In another thread, you were given specific commit revisions to work
with and those are important. I advise that you check out those commit
revisions rather than tracking the tip of the master branch of each
repository. That will reduce the divergence between your source code
and the code that has been tested as working elsewhere.

> Later I have changed the local.conf as below:
>
> MACHINE =3D "raspberrypi4-64"
> DISTRO_FEATURES_append =3D " virtualization xen"
> QEMU_TARGETS =3D "i386 x86_64 aarch64 arm"
> PACKAGECONFIG_pn-qemu +=3D " xen fdt"
> PACKAGECONFIG_remove_pn-qemu +=3D " sdl"
> PREFERRED_VERSION_linux-raspberrypi =3D "4.19.%"
> IMAGE_FSTYPES =3D "tar.xz tar.bz2 ext3 rpi-sdimg"
> IMAGE_FEATURES +=3D "ssh-server-dropbear"
>
> When started bitbake  "bitbake xen-image-minimal"  initially I got the be=
low log:
>
>
> siddhu@siddhu:~/Documents/yocto/build$ bitbake -k xen-image-minimal
> Loading cache: 100% |####################################################=
######################################################| Time: 0:00:01
> Loaded 3545 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.46.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "aarch64-poky-linux"
> MACHINE              =3D "raspberrypi4-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "3.1+snapshot-20200617"
> TUNE_FEATURES        =3D "aarch64 cortexa72 crc crypto"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "master:816a12758bfcb5409accbf636ec58d9fa917cdb6=
"
> meta-oe
> meta-multimedia
> meta-python
> meta-networking
> meta-filesystems     =3D "master:06a9209d8fb944dc1e24b00e68886c00135c72c0=
"
> meta-virtualization  =3D "master:d75bc448866d2b36779251efb1310d0234ece30b=
"
> meta-raspberrypi     =3D "master:39cf54c3cb429f2c6e0a000e79f6f06b39e2fa8b=
"
>
> Initialising tasks: 100% |###############################################=
######################################################| Time: 0:00:06
> Sstate summary: Wanted 1787 Found 0 Missed 1787 Current 187 (0% match, 9%=
 complete)
>
>
> but within few minutes building get  terminated with the below error:
>
> Task (/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devtools/gc=
c/gcc-cross_10.1.bb:do_compile) failed with exit code '1'

The error step here is 'do_compile', and the component is 'gcc'. That
would seem to indicate that there is a problem with the source code
that you are working with, so I suggest checking out the specific
source code revisions in your layer repositories that you were given,
which may resolve this.


> Later I used "bitbake -k xen-image-minimal"  (The initial log remained sa=
me) but even then it reached 50% but later it It gave the below error:
>
> ERROR: Task (/home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devt=
ools/gcc/gcc-cross_10.1.bb:do_compile) failed with exit code '1'
> WARNING: mtools-native-4.0.24-r0 do_fetch: Failed to fetch URL https://ft=
p.gnu.org/gnu/mtools/mtools-4.0.24.tar.bz2, attempting MIRRORS if available
> WARNING: bcm2835-bootfiles-20200603-r3 do_fetch: Failed to fetch URL http=
s://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d5220373fe82=
9b5961c42.tar.gz, attempting MIRRORS if available
> ERROR: bcm2835-bootfiles-20200603-r3 do_fetch: Fetcher failure: Fetch com=
mand export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export D=
BUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus,guid=3Dae1c3c0e8d=
9c84558dde0a465ee9d9e2"; export SSH_AGENT_PID=3D"1593"; export SSH_AUTH_SOC=
K=3D"/run/user/1000/keyring/ssh"; export PATH=3D"/home/siddhu/Documents/yoc=
to/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/siddhu/Documents=
/yocto/sources1/poky/scripts:/home/siddhu/Documents/yocto/build/tmp/work/ra=
spberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot-nativ=
e/usr/bin/aarch64-poky-linux:/home/siddhu/Documents/yocto/build/tmp/work/ra=
spberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot/usr/b=
in/crossscripts:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64=
-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot-native/usr/sbin:/h=
ome/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm283=
5-bootfiles/20200603-r3/recipe-sysroot-native/usr/bin:/home/siddhu/Document=
s/yocto/build/tmp/work/raspberrypi4_64-poky-linux/bcm2835-bootfiles/2020060=
3-r3/recipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/build/tmp/work=
/raspberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/recipe-sysroot-na=
tive/bin:/home/siddhu/Documents/yocto/sources1/poky/bitbake/bin:/home/siddh=
u/Documents/yocto/build/tmp/hosttools"; export HOME=3D"/home/siddhu"; /usr/=
bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -P /home/siddh=
u/Documents/yocto/build/downloads 'https://github.com/raspberrypi/firmware/=
archive/23548e550a757d368d3d5220373fe829b5961c42.tar.gz' --progress=3Ddot -=
v failed with exit code 4, output:
> --2020-06-17 09:34:20--  https://github.com/raspberrypi/firmware/archive/=
23548e550a757d368d3d5220373fe829b5961c42.tar.gz
> Resolving github.com (github.com)... 13.234.176.102
> Connecting to github.com (github.com)|13.234.176.102|:443... connected.
> HTTP request sent, awaiting response... 302 Found
> Location: https://codeload.github.com/raspberrypi/firmware/tar.gz/23548e5=
50a757d368d3d5220373fe829b5961c42 [following]
> --2020-06-17 09:34:38--  https://codeload.github.com/raspberrypi/firmware=
/tar.gz/23548e550a757d368d3d5220373fe829b5961c42
> Resolving codeload.github.com (codeload.github.com)... 13.233.43.20
> Connecting to codeload.github.com (codeload.github.com)|13.233.43.20|:443=
... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: unspecified [application/x-gzip]
> Saving to: =E2=80=98/home/siddhu/Documents/yocto/build/downloads/23548e55=
0a757d368d3d5220373fe829b5961c42.tar.gz=E2=80=99
>
>      0K .......... .......... .......... .......... .......... 54.6K
[snip]
>   7800K .......... .......... .......... .......... ..........  284K
>   7850K .......... .......... ...                               312K=3D47=
s
>
> 2020-06-17 09:36:01 (168 KB/s) - Read error at byte 8062081 (Success).Ret=
rying.
>
> --2020-06-17 09:36:02--  (try: 2)  https://codeload.github.com/raspberryp=
i/firmware/tar.gz/23548e550a757d368d3d5220373fe829b5961c42
> Connecting to codeload.github.com (codeload.github.com)|13.233.43.20|:443=
... failed: Connection timed out.
> Resolving codeload.github.com (codeload.github.com)... 13.127.152.42
> Connecting to codeload.github.com (codeload.github.com)|13.127.152.42|:44=
3... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: unspecified [application/x-gzip]
> Saving to: =E2=80=98/home/siddhu/Documents/yocto/build/downloads/23548e55=
0a757d368d3d5220373fe829b5961c42.tar.gz=E2=80=99
>
>      0K .......... .......... .......... .......... ..........  320K
[snip]
>  16200K .......... .......... .......... .......... .......... 61.4M
>  16250K ........                                                116M=3D38=
s
>
> 2020-06-17 09:37:50 (431 KB/s) - Read error at byte 16648248 (Success).Gi=
ving up.
>
>
> ERROR: bcm2835-bootfiles-20200603-r3 do_fetch: Fetcher failure for URL: '=
https://github.com/raspberrypi/firmware/archive/23548e550a757d368d3d5220373=
fe829b5961c42.tar.gz'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/build/t=
mp/work/raspberrypi4_64-poky-linux/bcm2835-bootfiles/20200603-r3/temp/log.d=
o_fetch.17387

The failure step here is 'do_fetch', which usually indicates a problem
transferring data for the recipe from the source (in this case github)
to your local development system. It looks like you may have a network
problem.


> But later the whole building process stopped with below error:
>
> ERROR: linux-raspberrypi-1_4.19.126+gitAUTOINC+f6b3ac28f0-r0 do_fetch: Fe=
tcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSC=
ONFIGDATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/10=
00/bus,guid=3Dae1c3c0e8d9c84558dde0a465ee9d9e2"; export SSH_AGENT_PID=3D"15=
93"; export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export PATH=3D"/h=
ome/siddhu/Documents/yocto/build/tmp/sysroots-uninative/x86_64-linux/usr/bi=
n:/home/siddhu/Documents/yocto/sources1/poky/scripts:/home/siddhu/Documents=
/yocto/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.1=
26+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linu=
x:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-poky-linux/li=
nux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysroot/usr/bin/=
crossscripts:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4_64-po=
ky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe-sysro=
ot-native/usr/sbin:/home/siddhu/Documents/yocto/build/tmp/work/raspberrypi4=
_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/recipe=
-sysroot-native/usr/bin:/home/siddhu/Documents/yocto/build/tmp/work/raspber=
rypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/r=
ecipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/build/tmp/work/raspb=
errypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0=
/recipe-sysroot-native/bin:/home/siddhu/Documents/yocto/sources1/poky/bitba=
ke/bin:/home/siddhu/Documents/yocto/build/tmp/hosttools"; export HOME=3D"/h=
ome/siddhu"; LANG=3DC git -c core.fsyncobjectfiles=3D0 clone --bare --mirro=
r git://github.com/raspberrypi/linux.git /home/siddhu/Documents/yocto/build=
/downloads/git2/github.com.raspberrypi.linux.git --progress failed with exi=
t code 128, output:
> Cloning into bare repository '/home/siddhu/Documents/yocto/build/download=
s/git2/github.com.raspberrypi.linux.git'...
> remote: Enumerating objects: 61, done.
> remote: Counting objects: 100% (61/61), done.
> remote: Compressing objects: 100% (54/54), done.
> fatal: read error: Connection reset by peer1.86 MiB | 105.00 KiB/s
> fatal: early EOF
> fatal: index-pack failed
>
> ERROR: linux-raspberrypi-1_4.19.126+gitAUTOINC+f6b3ac28f0-r0 do_fetch: Fe=
tcher failure for URL: 'git://github.com/raspberrypi/linux.git;branch=3Drpi=
-4.19.y'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/build/t=
mp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+=
f6b3ac28f0-r0/temp/log.do_fetch.3109
> ERROR: Task (/home/siddhu/Documents/yocto/sources1/meta-raspberrypi/recip=
es-kernel/linux/linux-raspberrypi_4.19.bb:do_fetch) failed with exit code '=
1'
> NOTE: Tasks Summary: Attempted 3038 tasks of which 2677 didn't need to be=
 rerun and 3 failed.
>
> Summary: 3 tasks failed:
>   /home/siddhu/Documents/yocto/sources1/poky/meta/recipes-devtools/gcc/gc=
c-cross_10.1.bb:do_compile
>   /home/siddhu/Documents/yocto/sources1/meta-raspberrypi/recipes-bsp/boot=
files/bcm2835-bootfiles.bb:do_fetch
>   /home/siddhu/Documents/yocto/sources1/meta-raspberrypi/recipes-kernel/l=
inux/linux-raspberrypi_4.19.bb:do_fetch
> Summary: There were 3 WARNING messages shown.
> Summary: There were 6 ERROR messages shown, returning a non-zero exit cod=
e.
>
>
>
>   Its been two month that I am trying to build the xen image for the Rasp=
berrypi board using meta-virtualization. But I am not able to get any progr=
ess, Is the building Xen is really that difficult?.

Let's just review: You are:
- new to Yocto and unfamiliar with diagnosing build issues that arise
when using it.
- not using a released version of Yocto, because none of the released
versions support the software that you need.
- not using the revisions of the source code that you were recommended to u=
se.
- building a significant quantity of unreleased software - an entire
Linux distribution and tools to build it - from source.
- apparently using an unreliable network connection and do not have a
local mirror of the source code.
- cross-compiling.
- building a hypervisor.
- targetting a board that is not supported for the hypervisor that
you're building.
- engaging in multiple different threads on several mailing lists
regarding the issues you're encountering.

That is not necessarily a simple situation, but despite all of the
above, I think you're actually getting pretty close to having it
built. As far as I can tell, your remaining issues are:
- check out the correct versions of the source code that you need
(repeated below)
- find a method of overcoming the do_fetch failures, which may involve
changes to your network or repeating the build to overcome transient
connectivity problems.

git://git.yoctoproject.org/poky
  18b6b2ae819cbf0ef3858944b4cd02ab74df6607
git://git.openembedded.org/meta-openembedded
  463f9a3ef0935d772a0be0437a8c09df64ed2f07
git://git.yoctoproject.org/meta-raspberrypi
  e589e0f3fda8f15f1093909328605e0bb6516d94
https://github.com/dozylynx/meta-virtualization
  0c809ead05224a61a784744240bb9c125990c481

Good luck,

Christopher
