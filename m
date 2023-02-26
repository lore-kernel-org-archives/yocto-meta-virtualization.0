Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EFAC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 01:18:41 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.57986.1677374319961459742
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 25 Feb 2023 17:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=APKAvcvF;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id g6so1170052iov.13
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 25 Feb 2023 17:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCdy7S1VH1AwqFYREjEuS0MbBLUPCx+KfsWstMpE44g=;
        b=APKAvcvFdbFrmaeMqDpCfAR5q4XXyzgnHSZ/o03aoBHqYmRoUao96thyTsmHroJoWJ
         MqH09Flv4GKF1SS5/y0GlxvdrgeT3qjLSTL1t3ux24goTdSyp8pAP1fAAGb/HT3fzxUT
         jdhzGSo7h4GWxNVo9Hmr/lYX2fyPP3RbQy7OL3rrrC0pNh8CVgC8zLCf95DjeOu/VxhP
         5WZpuZwL0L0MCIC2GCuD2evv1gW9s3hVsb0HY/Iw7ANiHXHK+sxBMaj+tssxtPCoRkvP
         pzXOY0+7FqMwTR+PVW0/mZCOBzEaGnTtolZu7XrdDw8jv4UIgv0pQioz8qPm+ZsnWvVK
         uBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCdy7S1VH1AwqFYREjEuS0MbBLUPCx+KfsWstMpE44g=;
        b=39+yYXXx5JMe5jMVaUyanENz6mACIL+NDtYeUyj9lVf5c9rRjk3m5COgOUY4LpBEep
         f5XWfrbJpYjzqVGLJSTzExG5BvDBs+jPSPbpTZ081B1vKnxMifkF1CwGnv8qE9pZDM7l
         YKCoDm7MtrVIooBPHQXa+ZPE1vEopbUnRaspDF8G1d9jQmNjW8aw4jOj3JM83YU0lQEN
         kaHpQKOnGauJECXqzrgFQh8YPbI3pgf6wqYpulknc9upbxcQI2T93w8t3PdujcoAfHq8
         e+8/puqp+RPp2aiAN1TatTCw3Ej+ItCdSFUPs2GCTsIrH+YmGZcqohjZN5BpE1vhubKa
         svww==
X-Gm-Message-State: AO0yUKXMDLHNHKQjcWT2R/4vUCFQ19DRJ8YY4M2qm0Hb5tywkNSTO4ok
	O3lxCBuZ3CgBTFS2SGVNSrlTWwJzzF7WP6dgfWQ=
X-Google-Smtp-Source: AK7set9EEmrq+TwJ1kvGurOOsnkF90e9ChS6BX6r1oLHDs2hCF0BygHkAOWYCutuCPp1CWkUgL+e5qWAqaYrEmXeUxo=
X-Received: by 2002:a02:85c6:0:b0:3e1:fb3d:4dce with SMTP id
 d64-20020a0285c6000000b003e1fb3d4dcemr6603906jai.0.1677374318924; Sat, 25 Feb
 2023 17:18:38 -0800 (PST)
MIME-Version: 1.0
References: <CAEFUPH37BMyGgmUBi4V18u=VGMuzJ5qGkL4zgqG1+mqtrNd_ag@mail.gmail.com>
 <CADkTA4PFhoRS_eQgc=ckVoJDtWbfHMrRv_88m_+Rc2F3Ab7+PQ@mail.gmail.com> <CAEFUPH1KswG1x1Zs2TqpN=ACPuYwm98edpkeXj43+vJUj-bANA@mail.gmail.com>
In-Reply-To: <CAEFUPH1KswG1x1Zs2TqpN=ACPuYwm98edpkeXj43+vJUj-bANA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 25 Feb 2023 20:18:27 -0500
Message-ID: <CADkTA4Ne9982fcqALKv9UeJsFPbSwhM_ns4DLS-bG4NkhMpfEg@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Feb 2023 01:18:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7900

On Fri, Feb 24, 2023 at 9:46 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>
> Hello Bruce,
>
> Thank you for the inputs.
>
>
> Yes, I use linux-yocto. The target linux version is below.
>
>
>
> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP PREEMPT_RT Tue=
 Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
>

That's a vendor IMX kernel, so I can't guarantee that it has the
required kernel configuration to support docker out of the box. If the
kernel supports linux-yocto fragments, then it could use the
configuration fragments that are in the meta-virt layer, and then we'd
have more confidence that it was properly configured.

One suggestion is to build with qemuarm64 as the MACHINE, and confirm
that you can run docker in that configuration (since I know it works).
If it does work there, you can start looking into differences in the
configuration.

Bruce

>
>
> The layers used are in the link below.
>
> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-5.15.32-=
2.0.0.xml?h=3Dimx-linux-kirkstone
>
>
>
> I tried to add IMAGE_INSTALL:append =3D " kernel-modules" in local.conf b=
ut it did not make any difference.
>
>
>
> The docker version I am running on the target is 20.10.12-ce
>
>
>
> Below is the error I am getting on the target.
>
>
>
> root@imx8mpevk:~# docker run hello-world
>
> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking state
>
> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled state
>
> [ 1359.005921] device veth4dc9000 entered promiscuous mode
>
> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37): dev=3Dveth4dc=
9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496=
7295
>
> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37): arch=3Dc00000=
b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d50 a2=3D28 a3=
=3D0 items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D=
0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967=
295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)
>
> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37): proctitle=3D2=
F7573722F62696E2F646F636B657264002D480066643A2F2F
>
> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled state
>
> [ 1359.298263] device veth4dc9000 left promiscuous mode
>
> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled state
>
> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38): dev=3Dveth4dc=
9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496=
7295
>
> docker: Error response from daemon: failed to create shim task: OCI runti=
me create failed: runc create failed: unable to start container process: ca=
n't get final child's PID from pipe: EOF: unknown.
>
> ERRO[0000] error waiting for container: context canceled
>
>
>
>
>
>
>
> Also sending the local.conf and bblayers.conf file
>
>
>
> local.conf:
>
>
>
> MACHINE ??=3D 'imx8mpevk'
>
> DISTRO ?=3D 'fsl-imx-wayland'
>
> PACKAGE_CLASSES ?=3D 'package_rpm'
>
> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>
> USER_CLASSES ?=3D "buildstats"
>
> PATCHRESOLVE =3D "noop"
>
> BB_DISKMON_DIRS ??=3D "\
>
>     STOPTASKS,${TMPDIR},1G,100K \
>
>     STOPTASKS,${DL_DIR},1G,100K \
>
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>
>    STOPTASKS,/tmp,100M,100K \
>
>     HALT,${TMPDIR},100M,1K \
>
>     HALT,${DL_DIR},100M,1K \
>
>     HALT,${SSTATE_DIR},100M,1K \
>
>     HALT,/tmp,10M,1K"
>
> PACKAGECONFIG:append:pn-qemu-system-native =3D " sdl"
>
> CONF_VERSION =3D "2"
>
>
>
> DL_DIR ?=3D "${BSPDIR}/downloads/"
>
> ACCEPT_FSL_EULA =3D "1"
>
>
>
> # Switch to Debian packaging and include package-management in the image
>
> PACKAGE_CLASSES =3D "package_deb"
>
> EXTRA_IMAGE_FEATURES +=3D "package-management"
>
> DISTRO_FEATURES:append =3D " virtualization"
>
> IMAGE_INSTALL:append =3D " docker-ce"
>
> IMAGE_INSTALL:append =3D " kernel-modules"
>
>
>
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-profile"
>
>
>
>
>
>
>
> bblayers.conf
>
>
>
> LCONF_VERSION =3D "7"
>
>
>
> BBPATH =3D "${TOPDIR}"
>
> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) + =
'/../..')}
>
>
>
> BBFILES ?=3D ""
>
> BBLAYERS =3D " \
>
>   ${BSPDIR}/sources/poky/meta \
>
>   ${BSPDIR}/sources/poky/meta-poky \
>
>   \
>
>   ${BSPDIR}/sources/meta-openembedded/meta-oe \
>
>   ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>
>   ${BSPDIR}/sources/meta-openembedded/meta-python \
>
>   \
>
>   ${BSPDIR}/sources/meta-freescale \
>
>   ${BSPDIR}/sources/meta-freescale-3rdparty \
>
>   ${BSPDIR}/sources/meta-freescale-distro \
>
> "
>
>
>
> # i.MX Yocto Project Release layers
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-bsp"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-sdk"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-ml"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-v2x"
>
> #BBLAYERS +=3D "${BSPDIR}/sources/meta-nxp-demo-experience"
>
>
>
> #BBLAYERS +=3D "${BSPDIR}/sources/meta-browser/meta-chromium"
>
> #BBLAYERS +=3D "${BSPDIR}/sources/meta-clang"
>
> #BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-gnome"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-teledyne-wapng"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-aws"
>
>
>
>  Regards
>
> Simon
>
>
> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>>
>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>> >
>> > Hello Team,
>> >
>> > Can I know what are the changes required in yocto to run docker and it=
s dependencies  on my target embedded system. I have added the below change=
s. Do I need more plugins and packages ?
>> >
>> > bblayers.conf:
>> >
>> >
>> >
>> > BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>> >
>> > BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>> >
>> > BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>> >
>> >
>> >
>> > local.conf:
>> >
>> >
>> >
>> > DISTRO_FEATURES:append =3D " virtualization"
>> >
>> > IMAGE_INSTALL:append =3D " docker-ce"
>> >
>>
>> You likely are missing kernel configuration values required to run the
>> containers.
>>
>> What kernel are you using (linux-yocto?), and are you on the master
>> branch of the layers ?
>>
>> As you can see, it is working in my latest tests:
>>
>> root@qemux86-64:~# docker --version
>> Docker version 23.0.1, build a5ee5b1dfc
>> root@qemux86-64:~# docker pull alpine
>> Using default tag: latest
>> latest: Pulling from library/alpine
>> 63b65145d645: Pull complete
>> Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f=
0efb90a
>> Status: Downloaded newer image for alpine:latest
>> docker.io/library/alpine:latest
>> root@qemux86-64:~# docker run -it alpine /bin/sh
>> / #
>>
>> Try adding "kernel-modules" to your IMAGE_INSTALL, and see if that
>> makes a difference.
>>
>> Bruce
>>
>>
>> >
>> >
>> > WIth the above changes and tested on the target I am getting the below=
 error when try to run "docker run hello-world"
>> >
>> >
>> > root@imx8mpevk:~# docker run hello-world
>> > DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
>> > DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/cr=
eate
>> > DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttachStderr=
=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=E2=80=9CAttachStdout=E2=
=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDomainname=E2=80=9D:=E2=80=
=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=80=9CEnv=E2=80=9D:null,=
=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=E2=80=9D:false,=E2=80=9CB=
inds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=80=9D:null,=E2=80=9CBlkio=
DeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteBps=E2=80=9D:null,=E2=
=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=9CBlkioWeight=E2=80=9D:0,=
=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCapAdd=E2=80=9D:null,=E2=80=
=9CCapDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CCgroupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCgroupnsMode=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[0,0],=E2=80=9CContainerID=
File=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=E2=80=9D:0,=E2=80=9CCpuP=
ercent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=E2=80=9CCpuQuota=E2=80=9D:=
0,=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=9CCpuRealtimeRuntime=E2=80=
=9D:0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpusetCpus=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CDeviceCg=
roupRules=E2=80=9D:null,=E2=80=9CDeviceRequests=E2=80=9D:null,=E2=80=9CDevi=
ces=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CDnsOptions=E2=80=9D:,=E2=80=
=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=9D:null,=E2=80=9CGroupAdd=
=E2=80=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=9D:0,=E2=80=9CIOMaximumIOp=
s=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CIsolatio=
n=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMemory=E2=80=9D:0,=E2=80=9CKer=
nelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:null,=E2=80=9CLogConfig=E2=
=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=E2=80=9D:=E2=80=9C=E2=80=
=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CMemory=E2=80=9D:0,=E2=80=
=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=E2=80=9D:0,=E2=80=9CMem=
orySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=9D:0,=E2=80=9CNetworkMode=
=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomKillDisable=E2=80=9D:false,=
=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=E2=80=9D:=E2=80=9C=E2=80=
=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBindings=E2=80=9D:{},=E2=80=
=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPorts=E2=80=9D:false,=E2=80=
=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRootfs=E2=80=9D:false,=E2=
=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCount=E2=80=9D:0,=E2=80=
=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecurityOpt=E2=80=9D:null,=
=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=9D:=E2=80=9C=E2=80=
=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumesFrom=
=E2=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CImag=
e=E2=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabels=E2=80=9D:{},=E2=80=
=9CNetworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=E2=80=9D:{}},=E2=80=
=9COnBuild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:false,=E2=80=9CPlatfor=
m=E2=80=9D:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=80=9CTty=E2=80=9D:fal=
se,=E2=80=9CUser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumes=E2=80=9D:{},=
=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}
>> > DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state
>> > [25846.681041] docker0: port 1(veth659d267) entered disabled state
>> > [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 ent=
ered promiscuous mode
>> > container mounted via layerStore:[25846.681392] audit: type=3D1700 aud=
it(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=3D42=
94967295 uid=3D0 gid=3D0 ses=3D4294967295
>> > &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300 audi=
t(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D4=
0 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 aui=
d=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D=
0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D=
 exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>> > 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327 aud=
it(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D44
>> > aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} conta=
iner=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>> > DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attach?stder=
r=3D1&stdout=3D1&stream=3D1
>> > DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
>> > DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
>> > DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?conditi=
on=3Dnext-exit
>> > DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
>> > DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore:=
 &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae5=
b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D4f926f0=
32e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>> > DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint =
crazy_bell=E2=80=99s interface on network bridge
>> > DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/172.1=
7.0.0/16, , map)
>> > DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172.17.0.0=
/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, B=
its: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046)->(0x1=
, 1)->end Curr:3 Serial:false PrefAddress:
>> > ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns =
fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint =
crazy_bell=E2=80=99s interface on network bridge
>> > ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns =
fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity=
 on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731=
042007ec0ebd3c)
>> > ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: po=
rt 1(veth659d267) entered disabled state
>> > to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no =
such file or directory, initns fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e0566c4dbd=
fbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
>> > DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth65=
9d267 left promiscuous mode
>> > eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(veth65=
9d267) entered disabled state
>> > [25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dvet=
h659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D42=
94967295
>> > 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
>> > DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=3D/var/=
run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.040986] =
audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D206=
 success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 pp=
id=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsu=
id=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=
=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(n=
ull)
>> > [25847.041004] audit: type=3D1327 audit(1677113637.488:206): proctitle=
=3D2F7573722F62696E2F646F636B657264002D44
>> > 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby roo=
t=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae=
5b99b3bcb65c33ec2f/merged
>> > ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a=
 closed fifo
>> > ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from a=
 closed fifo
>> > DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
>> > DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
>> > DEBU[2023-02-23T00:53:57.445349705Z] attach done
>> > DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on=
 endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042=
007ec0ebd3c)
>> > ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns =
fd -1: bad file descriptor
>> > ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns =
fd -1: bad file descriptor
>> > ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns =
fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint =
crazy_bell=E2=80=99s interface on network bridge
>> > DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/172.1=
7.0.0/16, 172.17.0.2)
>> > DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:LocalDefa=
ult/172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/data, ID: =
LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 65532, S=
equence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
>> > ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb027787b42e6=
e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container from co=
ntainerd: no such container
>> > ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/container=
s/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start re=
turned error: failed to create shim task: OCI runtime create failed: runc c=
reate failed: unable to start container process: can=E2=80=99t get final ch=
ild=E2=80=99s PID from pipe: EOF: unknown
>> > docker: Error response from daemon: failed to create shim task: OCI ru=
ntime create failed: runc create failed: unable to start container process:=
 can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown.
>> > ERRO[0000] error waiting for container: context canceled
>> >
>> >
>> >
>> >
>> > Regards
>> >
>> > Simon
>> >
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#7895): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7895
>> > Mute This Topic: https://lists.yoctoproject.org/mt/97175886/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

