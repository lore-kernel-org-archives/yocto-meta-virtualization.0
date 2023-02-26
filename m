Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D214DC64EC7
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 01:20:21 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.57959.1677374415917454623
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 25 Feb 2023 17:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awMrZOw0;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id a1so2071354iln.9
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 25 Feb 2023 17:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBvHJaQrHmQAJFQu3MfbjZJXCO4zfO6AHWF2VKgAsCs=;
        b=awMrZOw0seP5V3Omn7cSwDoiRRcZkGYGgURoByHPTFP1mpey3Lw83wKRNXkdU6WFgx
         LzbZ+ECKBj/GdXRVy4yTXutykht2YQpJXRqT5A9oYqevekPtcLm1q3VuqpN+KwPaq5Wv
         U6Leommut4VrtLOOUxDtHQ0Pht5sh+fOiPiMzx1Ua3imNPArT3DQpFBX0ZF1NCIRiR4r
         x6N3fu1To4IDp+AmS32/Ucx2wSLMgk2rBPfEvj5Re+vXypSU3H6R+N9qL0yEuckIJm8E
         661n8u/J0iROud8wuliZBylwScPt7T19WHSozQePfqvABkaecukAVS4+UD7FO6oRnqf7
         XlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBvHJaQrHmQAJFQu3MfbjZJXCO4zfO6AHWF2VKgAsCs=;
        b=yZBG//AhdK3AmpTqW8m7N2rz2BiisL25s67hD9b7dxaeRxzG4UP2soGD/OJykwtnc+
         1NNP9Du+r+utvb8E04HYpKmCvOBEFLEEskjnDzGncRnRVJkOovJqFB7ECFAtwUwZEDTB
         G8TjmN6nfDEuavw/M3dB8RT0WhKB0KmuH3Z20y0rPi1aR6IUNgdLnqTPBOE6h4BiZvcS
         7lTPO8I4apFkoHMZ+WUeN4sSnmyUGVa+sIvOWty3FoaGNOo8R4+tAwDGw2vPKbj5TXx1
         WBMlp04EnFfPNuiagWQWm5RVLhCvuroY+EKXRr1uE/TfFYZ79GzTTnpU7d0F+zj6cfig
         pGew==
X-Gm-Message-State: AO0yUKWOuJ53XpmlnHbSSzggkeAnefCrXEo5XtZXdZ8Xqh3n1ypi59Sh
	S85KfVXzJrux77EUODw2QBZefYPiipt9Yfxc+hIcBgsxBbc=
X-Google-Smtp-Source: AK7set+Pa/bKofkHvKQ4oOzrxJ6PsUkqRAB+ihj2cLmu5yfFL2LZhuo39XRdqAcxslUCZaowSfJCbj6RnjsrAYhx5GE=
X-Received: by 2002:a05:6e02:88e:b0:317:b01:245 with SMTP id
 z14-20020a056e02088e00b003170b010245mr3304789ils.0.1677374414842; Sat, 25 Feb
 2023 17:20:14 -0800 (PST)
MIME-Version: 1.0
References: <CAEFUPH37BMyGgmUBi4V18u=VGMuzJ5qGkL4zgqG1+mqtrNd_ag@mail.gmail.com>
 <CADkTA4PFhoRS_eQgc=ckVoJDtWbfHMrRv_88m_+Rc2F3Ab7+PQ@mail.gmail.com>
 <1746F14BF5BC9EDB.18951@lists.yoctoproject.org> <CAEFUPH19PLziKYCHY-5NroPnHZFAhRPgCd3PJspuOF1f=DDTsQ@mail.gmail.com>
In-Reply-To: <CAEFUPH19PLziKYCHY-5NroPnHZFAhRPgCd3PJspuOF1f=DDTsQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 25 Feb 2023 20:20:03 -0500
Message-ID: <CADkTA4MLCRpqYA=OxRe-GdONo_ijpJXFcZdSF=O-tXGHxECgBw@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Feb 2023 01:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7901

On Sat, Feb 25, 2023 at 5:35 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>
> Hi Bruce,
> I also observed that the docker daemon is not starting by default and if =
I launch it manually , it takes a long time to start. Am I missing any kern=
el modules?
>
> Here is the  o/p from  "systemctl status docker.service".
>
> root@imx8mpevk:~# systemctl status docker.service
> * docker.service - Docker Application Container Engine
>      Loaded: loaded (/lib/systemd/system/docker.service; disabled; vendor=
 preset: disabled)
>      Active: active (running) since Sat 2023-02-25 22:19:54 UTC; 4min 10s=
 ago
> TriggeredBy: * docker.socket
>        Docs: https://docs.docker.com
>    Main PID: 423 (dockerd)
>       Tasks: 11 (limit: 5578)
>      Memory: 115.0M
>      CGroup: /system.slice/docker.service
>              `-423 /usr/bin/dockerd -H fd://
>
> Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:53.83773=
8928Z" level=3Dwarning msg=3D"Running modprobe bridge br_netfilter failed w=
ith message: modprobe: WARNING: Module br_netfilter not found in director..=
.ror: exit status 1"

The above error could be a missing module, or a missing iptables module.


> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.07125=
0923Z" level=3Dwarning msg=3D"Could not load necessary modules for IPSEC ru=
les: protocol not supported"
> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.07825=
0217Z" level=3Dwarning msg=3D"Could not load necessary modules for Conntrac=
k: Running modprobe nf_conntrack_netlink failed with message: `modprobe: WA=
RNING: Module nf_...

As does the above one.

so you definitely have missing configuration.

Bruce

> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.08147=
1487Z" level=3Dinfo msg=3D"Default bridge (docker0) is assigned with an IP =
address 172.17.0.0/16. Daemon option --bip can be used to set a preferred I=
P address"
> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.19913=
2980Z" level=3Dinfo msg=3D"Loading containers: done."
> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.29684=
5346Z" level=3Dinfo msg=3D"Docker daemon" commit=3D906f57ff5b-unsupported g=
raphdriver(s)=3Doverlay2 version=3D20.10.12-ce
> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.29723=
6599Z" level=3Dinfo msg=3D"Daemon has completed initialization"
> Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Application Containe=
r Engine.
> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.37235=
4197Z" level=3Dinfo msg=3D"API listen on /run/docker.sock"
> Feb 25 22:23:14 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:23:14.18873=
8979Z" level=3Dinfo msg=3D"ignoring event" container=3Da973c205bf7c0e57450d=
e3241767f39e4983b6b174e231e014159ed8ae220791 module=3Dlibcontainerd namespa=
ce...*events.TaskDelete"
> Hint: Some lines were ellipsized, use -l to show in full.
> root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"2023-02=
-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running modprobe bridge br_=
netfilter failed with message: modprobe: WARNING: Module br_netfilter not f=
ound in director...ror: exit status 1"
>
>
> Regards
> Simon
>
> On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via lists.yoctoproject.org <si=
monkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>> Hello Bruce,
>>
>> Thank you for the inputs.
>>
>>
>> Yes, I use linux-yocto. The target linux version is below.
>>
>>
>>
>> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP PREEMPT_RT Tu=
e Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
>>
>>
>>
>> The layers used are in the link below.
>>
>> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-5.15.32=
-2.0.0.xml?h=3Dimx-linux-kirkstone
>>
>>
>>
>> I tried to add IMAGE_INSTALL:append =3D " kernel-modules" in local.conf =
but it did not make any difference.
>>
>>
>>
>> The docker version I am running on the target is 20.10.12-ce
>>
>>
>>
>> Below is the error I am getting on the target.
>>
>>
>>
>> root@imx8mpevk:~# docker run hello-world
>>
>> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking state
>>
>> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled state
>>
>> [ 1359.005921] device veth4dc9000 entered promiscuous mode
>>
>> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37): dev=3Dveth4d=
c9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D42949=
67295
>>
>> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37): arch=3Dc0000=
0b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d50 a2=3D28 a3=
=3D0 items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D=
0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967=
295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)
>>
>> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37): proctitle=3D=
2F7573722F62696E2F646F636B657264002D480066643A2F2F
>>
>> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled state
>>
>> [ 1359.298263] device veth4dc9000 left promiscuous mode
>>
>> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled state
>>
>> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38): dev=3Dveth4d=
c9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D42949=
67295
>>
>> docker: Error response from daemon: failed to create shim task: OCI runt=
ime create failed: runc create failed: unable to start container process: c=
an't get final child's PID from pipe: EOF: unknown.
>>
>> ERRO[0000] error waiting for container: context canceled
>>
>>
>>
>>
>>
>>
>>
>> Also sending the local.conf and bblayers.conf file
>>
>>
>>
>> local.conf:
>>
>>
>>
>> MACHINE ??=3D 'imx8mpevk'
>>
>> DISTRO ?=3D 'fsl-imx-wayland'
>>
>> PACKAGE_CLASSES ?=3D 'package_rpm'
>>
>> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>>
>> USER_CLASSES ?=3D "buildstats"
>>
>> PATCHRESOLVE =3D "noop"
>>
>> BB_DISKMON_DIRS ??=3D "\
>>
>>     STOPTASKS,${TMPDIR},1G,100K \
>>
>>     STOPTASKS,${DL_DIR},1G,100K \
>>
>>     STOPTASKS,${SSTATE_DIR},1G,100K \
>>
>>    STOPTASKS,/tmp,100M,100K \
>>
>>     HALT,${TMPDIR},100M,1K \
>>
>>     HALT,${DL_DIR},100M,1K \
>>
>>     HALT,${SSTATE_DIR},100M,1K \
>>
>>     HALT,/tmp,10M,1K"
>>
>> PACKAGECONFIG:append:pn-qemu-system-native =3D " sdl"
>>
>> CONF_VERSION =3D "2"
>>
>>
>>
>> DL_DIR ?=3D "${BSPDIR}/downloads/"
>>
>> ACCEPT_FSL_EULA =3D "1"
>>
>>
>>
>> # Switch to Debian packaging and include package-management in the image
>>
>> PACKAGE_CLASSES =3D "package_deb"
>>
>> EXTRA_IMAGE_FEATURES +=3D "package-management"
>>
>> DISTRO_FEATURES:append =3D " virtualization"
>>
>> IMAGE_INSTALL:append =3D " docker-ce"
>>
>> IMAGE_INSTALL:append =3D " kernel-modules"
>>
>>
>>
>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-profile"
>>
>>
>>
>>
>>
>>
>>
>> bblayers.conf
>>
>>
>>
>> LCONF_VERSION =3D "7"
>>
>>
>>
>> BBPATH =3D "${TOPDIR}"
>>
>> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) +=
 '/../..')}
>>
>>
>>
>> BBFILES ?=3D ""
>>
>> BBLAYERS =3D " \
>>
>>   ${BSPDIR}/sources/poky/meta \
>>
>>   ${BSPDIR}/sources/poky/meta-poky \
>>
>>   \
>>
>>   ${BSPDIR}/sources/meta-openembedded/meta-oe \
>>
>>   ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>>
>>   ${BSPDIR}/sources/meta-openembedded/meta-python \
>>
>>   \
>>
>>   ${BSPDIR}/sources/meta-freescale \
>>
>>   ${BSPDIR}/sources/meta-freescale-3rdparty \
>>
>>   ${BSPDIR}/sources/meta-freescale-distro \
>>
>> "
>>
>>
>>
>> # i.MX Yocto Project Release layers
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-bsp"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-sdk"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-ml"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-v2x"
>>
>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-nxp-demo-experience"
>>
>>
>>
>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-browser/meta-chromium"
>>
>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-clang"
>>
>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-gnome"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-teledyne-wapng"
>>
>> BBLAYERS +=3D "${BSPDIR}/sources/meta-aws"
>>
>>
>>
>>  Regards
>>
>> Simon
>>
>>
>> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
>>>
>>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com> wrote=
:
>>> >
>>> > Hello Team,
>>> >
>>> > Can I know what are the changes required in yocto to run docker and i=
ts dependencies  on my target embedded system. I have added the below chang=
es. Do I need more plugins and packages ?
>>> >
>>> > bblayers.conf:
>>> >
>>> >
>>> >
>>> > BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>>> >
>>> > BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>>> >
>>> > BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>>> >
>>> >
>>> >
>>> > local.conf:
>>> >
>>> >
>>> >
>>> > DISTRO_FEATURES:append =3D " virtualization"
>>> >
>>> > IMAGE_INSTALL:append =3D " docker-ce"
>>> >
>>>
>>> You likely are missing kernel configuration values required to run the
>>> containers.
>>>
>>> What kernel are you using (linux-yocto?), and are you on the master
>>> branch of the layers ?
>>>
>>> As you can see, it is working in my latest tests:
>>>
>>> root@qemux86-64:~# docker --version
>>> Docker version 23.0.1, build a5ee5b1dfc
>>> root@qemux86-64:~# docker pull alpine
>>> Using default tag: latest
>>> latest: Pulling from library/alpine
>>> 63b65145d645: Pull complete
>>> Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3=
f0efb90a
>>> Status: Downloaded newer image for alpine:latest
>>> docker.io/library/alpine:latest
>>> root@qemux86-64:~# docker run -it alpine /bin/sh
>>> / #
>>>
>>> Try adding "kernel-modules" to your IMAGE_INSTALL, and see if that
>>> makes a difference.
>>>
>>> Bruce
>>>
>>>
>>> >
>>> >
>>> > WIth the above changes and tested on the target I am getting the belo=
w error when try to run "docker run hello-world"
>>> >
>>> >
>>> > root@imx8mpevk:~# docker run hello-world
>>> > DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
>>> > DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/c=
reate
>>> > DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttachStder=
r=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=E2=80=9CAttachStdout=
=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDomainname=E2=80=9D:=E2=
=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=80=9CEnv=E2=80=9D:nul=
l,=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=E2=80=9D:false,=E2=80=
=9CBinds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=80=9D:null,=E2=80=9CB=
lkioDeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteBps=E2=80=9D:null=
,=E2=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=9CBlkioWeight=E2=80=9D:=
0,=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCapAdd=E2=80=9D:null,=E2=80=
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
>>> > DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking stat=
e
>>> > [25846.681041] docker0: port 1(veth659d267) entered disabled state
>>> > [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 en=
tered promiscuous mode
>>> > container mounted via layerStore:[25846.681392] audit: type=3D1700 au=
dit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=3D4=
294967295 uid=3D0 gid=3D0 ses=3D4294967295
>>> > &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300 aud=
it(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D=
40 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 au=
id=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=
=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=
=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>>> > 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327 au=
dit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D44
>>> > aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} cont=
ainer=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>>> > DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/containers/4=
f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attach?stde=
rr=3D1&stdout=3D1&stream=3D1
>>> > DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
>>> > DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
>>> > DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/containers/4=
f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?condit=
ion=3Dnext-exit
>>> > DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/containers/4=
f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
>>> > DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore=
: &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae=
5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D4f926f=
032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>>> > DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint=
 crazy_bell=E2=80=99s interface on network bridge
>>> > DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/172.=
17.0.0/16, , map)
>>> > DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172.17.0.=
0/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, =
Bits: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046)->(0x=
1, 1)->end Curr:3 Serial:false PrefAddress:
>>> > ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespa=
ce, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns=
 fd -1: bad file descriptor
>>> > DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint=
 crazy_bell=E2=80=99s interface on network bridge
>>> > ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespa=
ce, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns=
 fd -1: bad file descriptor
>>> > DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivit=
y on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe73=
1042007ec0ebd3c)
>>> > ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: p=
ort 1(veth659d267) entered disabled state
>>> > to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no=
 such file or directory, initns fd -1: bad file descriptor
>>> > DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e0566c4db=
dfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
>>> > DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth6=
59d267 left promiscuous mode
>>> > eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(veth6=
59d267) entered disabled state
>>> > [25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dve=
th659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4=
294967295
>>> > 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
>>> > DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=3D/var=
/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.040986]=
 audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D20=
6 success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 p=
pid=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fs=
uid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=
=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(n=
ull)
>>> > [25847.041004] audit: type=3D1327 audit(1677113637.488:206): proctitl=
e=3D2F7573722F62696E2F646F636B657264002D44
>>> > 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby ro=
ot=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994a=
e5b99b3bcb65c33ec2f/merged
>>> > ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from =
a closed fifo
>>> > ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from =
a closed fifo
>>> > DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
>>> > DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
>>> > DEBU[2023-02-23T00:53:57.445349705Z] attach done
>>> > DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity o=
n endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe73104=
2007ec0ebd3c)
>>> > ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespa=
ce, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns=
 fd -1: bad file descriptor
>>> > ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespa=
ce, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns=
 fd -1: bad file descriptor
>>> > ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespa=
ce, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns=
 fd -1: bad file descriptor
>>> > DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint=
 crazy_bell=E2=80=99s interface on network bridge
>>> > DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/172.=
17.0.0/16, 172.17.0.2)
>>> > DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:LocalDef=
ault/172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/data, ID:=
 LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 65532, =
Sequence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
>>> > ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb027787b42e=
6e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container from c=
ontainerd: no such container
>>> > ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/containe=
rs/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start r=
eturned error: failed to create shim task: OCI runtime create failed: runc =
create failed: unable to start container process: can=E2=80=99t get final c=
hild=E2=80=99s PID from pipe: EOF: unknown
>>> > docker: Error response from daemon: failed to create shim task: OCI r=
untime create failed: runc create failed: unable to start container process=
: can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown.
>>> > ERRO[0000] error waiting for container: context canceled
>>> >
>>> >
>>> >
>>> >
>>> > Regards
>>> >
>>> > Simon
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7898): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7898
>> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/4946642
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[simonkbaby@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

