Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15775C7EE2D
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 22:35:51 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.55022.1677364541820281540
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 25 Feb 2023 14:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fao0eMQ9;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: simonkbaby@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so6500406pjb.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 25 Feb 2023 14:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/JndF3V8jnH00pTbGb+71uE8w6J4gj96Ip5JHYWQjnQ=;
        b=Fao0eMQ9pK60EFF5YlI2HIykGhd2WJc55BAlm5S0ntqMrbr6ndy7g8Tsg7sRpCPSB/
         VL1PCPwULd7Gkt7fSppEpxvqM7NQGObT877OgOz/bOHoiVbN2mm/RHb8hPC8zw/d37em
         tJ9yeiLzVulM4hXYxPxoZEucT5KYbuWybv78+XgDGvTAapAly726ohIyrss19+87V//4
         QH5ZiTOOhEP/2tZ0WJ9yJS84BFdZsuXe051365keUQkJN9VEUoyiLp9Jc1xCt6AkpbXm
         IUbDOYVOfpg3u9IFitmkb5UCxfSlucUy5Yc98EnaDhSNROxyk6vvXfO2pqCA2nkmidba
         cX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JndF3V8jnH00pTbGb+71uE8w6J4gj96Ip5JHYWQjnQ=;
        b=bRdK2Kg64M/dBODQ8JRlXIM6TwbDfMRYOssqzljeKAZlS9BbzM62K+lYpW0rmcPM+I
         zHTHnRxhhylS/+nXMQVquI4WmGQ5dx4PUJZeXkkG9WAQ96n0Nn3eaK5EU2AzJ/SZzTYe
         DQX/GycpywFoCoRbZay+WNsJOcReYubJ0crTeRWOKFy5+N9VOnYqcoQgo36BVNoI/dvZ
         K54RyhtSNl/vyqUucGIzCK1u7UV55ZqcFfhyO4B/jp7fp7vrzd3pISwkDj+ELMeaq94i
         82pMiO+qCOJ/oV4KI1P+68GPeeryNcgz+8XjFPJe/vdP95sI08Qd4kE9mi/G8y0ocRaA
         qHYg==
X-Gm-Message-State: AO0yUKWngBc90NASa3owT+rCE+JIwQt5qzA1RY01A36wjaVHIr+Wewtb
	MavMvz22a6yyiPf4XG6psOZbdAsj7pezWWavt6k=
X-Google-Smtp-Source: AK7set8VvWtN0pHmI+28Wz1oOCQgNJyg24j1QGb7rdDv0iF9pjCGhaKOpWJhuzpHCZCXUCxE8htIMrAogpIP0KdlLoA=
X-Received: by 2002:a17:903:2348:b0:199:6e3:187a with SMTP id
 c8-20020a170903234800b0019906e3187amr2166879plh.6.1677364540635; Sat, 25 Feb
 2023 14:35:40 -0800 (PST)
MIME-Version: 1.0
References: <CAEFUPH37BMyGgmUBi4V18u=VGMuzJ5qGkL4zgqG1+mqtrNd_ag@mail.gmail.com>
 <CADkTA4PFhoRS_eQgc=ckVoJDtWbfHMrRv_88m_+Rc2F3Ab7+PQ@mail.gmail.com> <1746F14BF5BC9EDB.18951@lists.yoctoproject.org>
In-Reply-To: <1746F14BF5BC9EDB.18951@lists.yoctoproject.org>
From: SIMON BABY <simonkbaby@gmail.com>
Date: Sat, 25 Feb 2023 14:35:29 -0800
Message-ID: <CAEFUPH19PLziKYCHY-5NroPnHZFAhRPgCd3PJspuOF1f=DDTsQ@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
To: simonkbaby@gmail.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009a7fce05f58ddda9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 25 Feb 2023 22:35:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7899

--0000000000009a7fce05f58ddda9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
I also observed that the docker daemon is not starting by default and if I
launch it manually , it takes a long time to start. Am I missing any kernel
modules?

Here is the  o/p from  "systemctl status docker.service".

root@imx8mpevk:~# systemctl status docker.service
* docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; *disabled; vendor
preset: disabled*)
     Active: active (running) since Sat 2023-02-25 22:19:54 UTC; 4min 10s
ago
TriggeredBy: * docker.socket
       Docs: https://docs.docker.com
   Main PID: 423 (dockerd)
      Tasks: 11 (limit: 5578)
     Memory: 115.0M
     CGroup: /system.slice/docker.service
             `-423 /usr/bin/dockerd -H fd://

F*eb 25 22:19:53 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running modp=
robe
bridge br_netfilter failed with message: modprobe: WARNING: Module
br_netfilter not found in director...ror: exit status 1"*
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.071250923Z" level=3Dwarning msg=3D"Could not lo=
ad
necessary modules for IPSEC rules: protocol not supported"
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.078250217Z" level=3Dwarning msg=3D"Could not lo=
ad
necessary modules for Conntrack: Running modprobe nf_conntrack_netlink
failed with message: `modprobe: WARNING: Module nf_...
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.081471487Z" level=3Dinfo msg=3D"Default bridge
(docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --bip
can be used to set a preferred IP address"
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.199132980Z" level=3Dinfo msg=3D"Loading contain=
ers:
done."
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.296845346Z" level=3Dinfo msg=3D"Docker daemon"
commit=3D906f57ff5b-unsupported graphdriver(s)=3Doverlay2 version=3D20.10.1=
2-ce
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.297236599Z" level=3Dinfo msg=3D"Daemon has comp=
leted
initialization"
Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Application Container
Engine.
Feb 25 22:19:54 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:54.372354197Z" level=3Dinfo msg=3D"API listen on
/run/docker.sock"
Feb 25 22:23:14 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:23:14.188738979Z" level=3Dinfo msg=3D"ignoring event"
container=3Da973c205bf7c0e57450de3241767f39e4983b6b174e231e014159ed8ae22079=
1
module=3Dlibcontainerd namespace...*events.TaskDelete"
Hint: Some lines were ellipsized, use -l to show in full.
root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]:
time=3D"2023-02-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running modp=
robe
bridge br_netfilter failed with message: modprobe: WARNING: Module
br_netfilter not found in director...ror: exit status 1"


Regards
Simon

On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via lists.yoctoproject.org
<simonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:

> Hello Bruce,
>
> Thank you for the inputs.
>
>
> Yes, I use linux-yocto. The target linux version is below.
>
>
>
> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP PREEMPT_RT Tue
> Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
>
>
>
> The layers used are in the link below.
>
>
> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-5.15.32-=
2.0.0.xml?h=3Dimx-linux-kirkstone
>
>
>
> I tried to add *IMAGE_INSTALL:append =3D " kernel-modules"* in local.conf
> but it did not make any difference.
>
>
>
> The docker version I am running on the target is *20.10.12-ce*
>
>
>
> Below is the error I am getting on the target.
>
>
>
> root@imx8mpevk:~#* docker run hello-world*
>
> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking state
>
> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled state
>
> [ 1359.005921] device veth4dc9000 entered promiscuous mode
>
> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37): dev=3Dveth4dc=
9000
> prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496729=
5
>
> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37): arch=3Dc00000=
b7
> syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d50 a2=3D28 a3=
=3D0 items=3D0
> ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fs=
uid=3D0 egid=3D0
> sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"dockerd"
> exe=3D"/usr/bin/dockerd" key=3D(null)
>
> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37):
> proctitle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
>
> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled state
>
> [ 1359.298263] device veth4dc9000 left promiscuous mode
>
> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled state
>
> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38): dev=3Dveth4dc=
9000
> prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496729=
5
>
> *docker: Error response from daemon: failed to create shim task: OCI
> runtime create failed: runc create failed: unable to start container
> process: can't get final child's PID from pipe: EOF: unknown.*
>
> *ERRO[0000] error waiting for container: context canceled*
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
> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) +
> '/../..')}
> <$%7b@os.path.abspath(os.path.dirname(d.getVar('FILE',%20True))%20+%20'/.=
./..')%7d>
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
> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <bruce.ashfield@gmail.com=
>
> wrote:
>
>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>> >
>> > Hello Team,
>> >
>> > Can I know what are the changes required in yocto to run docker and it=
s
>> dependencies  on my target embedded system. I have added the below chang=
es.
>> Do I need more plugins and packages ?
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
>> Digest:
>> sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f0efb90a
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
>> > WIth the above changes and tested on the target I am getting the below
>> error when try to run "docker run hello-world"
>> >
>> >
>> > root@imx8mpevk:~# docker run hello-world
>> > DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
>> > DEBU[2023-02-23T00:53:57.068355788Z] Calling POST
>> /v1.41/containers/create
>> > DEBU[2023-02-23T00:53:57.069098805Z] form data:
>> {=E2=80=9CAttachStderr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false=
,=E2=80=9CAttachStdout=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDo=
mainname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=
=80=9CEnv=E2=80=9D:null,=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=
=E2=80=9D:false,=E2=80=9CBinds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=
=80=9D:null,=E2=80=9CBlkioDeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDevice=
WriteBps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=
=9CBlkioWeight=E2=80=9D:0,=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCap=
Add=E2=80=9D:null,=E2=80=9CCapDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CCgroupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CCgroupnsMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[=
0,0],=E2=80=9CContainerIDFile=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=
=E2=80=9D:0,=E2=80=9CCpuPercent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=
=E2=80=9CCpuQuota=E2=80=9D:0,=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=
=9CCpuRealtimeRuntime=E2=80=9D:0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpu=
setCpus=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CDeviceCgroupRules=E2=80=9D:null,=E2=80=9CDeviceRequests=
=E2=80=9D:null,=E2=80=9CDevices=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CD=
nsOptions=E2=80=9D:,=E2=80=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=
=9D:null,=E2=80=9CGroupAdd=E2=80=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=
=9D:0,=E2=80=9CIOMaximumIOps=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CIsolation=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMem=
ory=E2=80=9D:0,=E2=80=9CKernelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:=
null,=E2=80=9CLogConfig=E2=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=
=E2=80=9D:=E2=80=9C=E2=80=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CM=
emory=E2=80=9D:0,=E2=80=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=
=E2=80=9D:0,=E2=80=9CMemorySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=
=9D:0,=E2=80=9CNetworkMode=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomK=
illDisable=E2=80=9D:false,=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=
=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBin=
dings=E2=80=9D:{},=E2=80=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPor=
ts=E2=80=9D:false,=E2=80=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRoo=
tfs=E2=80=9D:false,=E2=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCo=
unt=E2=80=9D:0,=E2=80=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecuri=
tyOpt=E2=80=9D:null,=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=
=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CVolumesFrom=E2=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=
=80=9D,=E2=80=9CImage=E2=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabel=
s=E2=80=9D:{},=E2=80=9CNetworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=
=E2=80=9D:{}},=E2=80=9COnBuild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:fa=
lse,=E2=80=9CPlatform=E2=80=9D:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=
=80=9CTty=E2=80=9D:false,=E2=80=9CUser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CVolumes=E2=80=9D:{},=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}
>> > DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state
>> > [25846.681041] docker0: port 1(veth659d267) entered disabled state
>> > [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267
>> entered promiscuous mode
>> > container mounted via layerStore:[25846.681392] audit: type=3D1700
>> audit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0
>> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
>> > &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300
>> audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes e=
xit=3D40
>> a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 au=
id=3D4294967295
>> uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 =
tty=3Dttymxc1
>> ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bi=
n/dockerd=E2=80=9D key=3D(null)
>> > 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327
>> audit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B6572640=
02D44
>> > aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060}
>> container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62=
d190
>> > DEBU[2023-02-23T00:53:57.184741848Z] Calling POST
>> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9e=
dbdb62d190/attach?stderr=3D1&stdout=3D1&stream=3D1
>> > DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
>> > DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
>> > DEBU[2023-02-23T00:53:57.186340258Z] Calling POST
>> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9e=
dbdb62d190/wait?condition=3Dnext-exit
>> > DEBU[2023-02-23T00:53:57.188347802Z] Calling POST
>> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9e=
dbdb62d190/start
>> > DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore:
>> &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994a=
e5b99b3bcb65c33ec2f/merged
>> 0xaaaabdb0b060 0xaaaabdb0b060}
>> container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62=
d190
>> > DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint
>> crazy_bell=E2=80=99s interface on network bridge
>> > DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/
>> 172.17.0.0/16, , map)
>> > DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:
>> 172.17.0.0/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16,
>> DBIndex: 0x0, Bits: 65536, Unselected: 65533, Sequence: (0xc0000000,
>> 1)->(0x0, 2046)->(0x1, 1)->end Curr:3 Serial:false PrefAddress:
>> > ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial
>> namespace, readlink /proc/1551/task/1555/ns/net: no such file or directo=
ry,
>> initns fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint
>> crazy_bell=E2=80=99s interface on network bridge
>> > ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial
>> namespace, readlink /proc/1551/task/1555/ns/net: no such file or directo=
ry,
>> initns fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity
>> on endpoint crazy_bell
>> (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)
>> > ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0:
>> port 1(veth659d267) entered disabled state
>> > to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no
>> such file or directory, initns fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.304933242Z] EnableService
>> 4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
>> > DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device
>> veth659d267 left promiscuous mode
>> > eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port
>> 1(veth659d267) entered disabled state
>> > [25846.996703] audit: type=3D1700 audit(1677113637.488:206):
>> dev=3Dveth659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=
=3D0
>> ses=3D4294967295
>> > 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
>> > DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created
>> bundle=3D/var/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19=
ef[25847.040986]
>> audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D=
206
>> success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 =
ppid=3D409 pid=3D1551
>> auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 s=
gid=3D0 fsgid=3D0
>> tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=
=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>> > [25847.041004] audit: type=3D1327 audit(1677113637.488:206):
>> proctitle=3D2F7573722F62696E2F646F636B657264002D44
>> > 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby
>> root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa=
2994ae5b99b3bcb65c33ec2f/merged
>> > ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a
>> closed fifo
>> > ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from a
>> closed fifo
>> > DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
>> > DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
>> > DEBU[2023-02-23T00:53:57.445349705Z] attach done
>> > DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on
>> endpoint crazy_bell
>> (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)
>> > ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial
>> namespace, readlink /proc/1551/task/1558/ns/net: no such file or directo=
ry,
>> initns fd -1: bad file descriptor
>> > ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial
>> namespace, readlink /proc/1551/task/1558/ns/net: no such file or directo=
ry,
>> initns fd -1: bad file descriptor
>> > ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial
>> namespace, readlink /proc/1551/task/1558/ns/net: no such file or directo=
ry,
>> initns fd -1: bad file descriptor
>> > DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint
>> crazy_bell=E2=80=99s interface on network bridge
>> > DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/
>> 172.17.0.0/16, 172.17.0.2)
>> > DEBU[2023-02-23T00:53:57.619890544Z] Released address
>> PoolID:LocalDefault/172.17.0.0/16, Address:172.17.0.2 Sequence:App:
>> ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits:
>> 65536, Unselected: 65532, Sequence: (0xe0000000, 1)->(0x0, 2046)->(0x1,
>> 1)->end Curr:3
>> > ERRO[2023-02-23T00:53:57.659608292Z]
>> 4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 cleanup=
:
>> failed to delete container from containerd: no such container
>> > ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST
>> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9e=
dbdb62d190/start
>> returned error: failed to create shim task: OCI runtime create failed: r=
unc
>> create failed: unable to start container process: can=E2=80=99t get fina=
l child=E2=80=99s
>> PID from pipe: EOF: unknown
>> > docker: Error response from daemon: failed to create shim task: OCI
>> runtime create failed: runc create failed: unable to start container
>> process: can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unk=
nown.
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
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7898):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7898
> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/4946642
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> simonkbaby@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009a7fce05f58ddda9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<div>I also observed that the docker daemon is=C2=
=A0not starting by default and if I launch it manually , it takes a long ti=
me to start. Am I missing any kernel modules?</div><div><br></div><div>Here=
 is the=C2=A0 o/p from=C2=A0 &quot;systemctl status docker.service&quot;.</=
div><div><br></div><div>root@imx8mpevk:~# systemctl status docker.service<b=
r>* docker.service - Docker Application Container Engine<br>=C2=A0 =C2=A0 =
=C2=A0Loaded: loaded (/lib/systemd/system/docker.service; <b>disabled; vend=
or preset: disabled</b>)<br>=C2=A0 =C2=A0 =C2=A0Active: active (running) si=
nce Sat 2023-02-25 22:19:54 UTC; 4min 10s ago<br>TriggeredBy: * docker.sock=
et<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Docs: <a href=3D"https://docs.docker.com">=
https://docs.docker.com</a><br>=C2=A0 =C2=A0Main PID: 423 (dockerd)<br>=C2=
=A0 =C2=A0 =C2=A0 Tasks: 11 (limit: 5578)<br>=C2=A0 =C2=A0 =C2=A0Memory: 11=
5.0M<br>=C2=A0 =C2=A0 =C2=A0CGroup: /system.slice/docker.service<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-423 /usr/bin/dockerd -H fd://<br=
><br>F<b>eb 25 22:19:53 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:=
19:53.837738928Z&quot; level=3Dwarning msg=3D&quot;Running modprobe bridge =
br_netfilter failed with message: modprobe: WARNING: Module br_netfilter no=
t found in director...ror: exit status 1&quot;</b><br>Feb 25 22:19:54 imx8m=
pevk dockerd[423]: time=3D&quot;2023-02-25T22:19:54.071250923Z&quot; level=
=3Dwarning msg=3D&quot;Could not load necessary modules for IPSEC rules: pr=
otocol not supported&quot;<br>Feb 25 22:19:54 imx8mpevk dockerd[423]: time=
=3D&quot;2023-02-25T22:19:54.078250217Z&quot; level=3Dwarning msg=3D&quot;C=
ould not load necessary modules for Conntrack: Running modprobe nf_conntrac=
k_netlink failed with message: `modprobe: WARNING: Module nf_...<br>Feb 25 =
22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:19:54.081471487=
Z&quot; level=3Dinfo msg=3D&quot;Default bridge (docker0) is assigned with =
an IP address <a href=3D"http://172.17.0.0/16">172.17.0.0/16</a>. Daemon op=
tion --bip can be used to set a preferred IP address&quot;<br>Feb 25 22:19:=
54 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:19:54.199132980Z&quot=
; level=3Dinfo msg=3D&quot;Loading containers: done.&quot;<br>Feb 25 22:19:=
54 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:19:54.296845346Z&quot=
; level=3Dinfo msg=3D&quot;Docker daemon&quot; commit=3D906f57ff5b-unsuppor=
ted graphdriver(s)=3Doverlay2 version=3D20.10.12-ce<br>Feb 25 22:19:54 imx8=
mpevk dockerd[423]: time=3D&quot;2023-02-25T22:19:54.297236599Z&quot; level=
=3Dinfo msg=3D&quot;Daemon has completed initialization&quot;<br>Feb 25 22:=
19:54 imx8mpevk systemd[1]: Started Docker Application Container Engine.<br=
>Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:19:54.3=
72354197Z&quot; level=3Dinfo msg=3D&quot;API listen on /run/docker.sock&quo=
t;<br>Feb 25 22:23:14 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:23=
:14.188738979Z&quot; level=3Dinfo msg=3D&quot;ignoring event&quot; containe=
r=3Da973c205bf7c0e57450de3241767f39e4983b6b174e231e014159ed8ae220791 module=
=3Dlibcontainerd namespace...*events.TaskDelete&quot;<br>Hint: Some lines w=
ere ellipsized, use -l to show in full.<br>root@imx8mpevk:~# Feb 25 22:19:5=
3 imx8mpevk dockerd[423]: time=3D&quot;2023-02-25T22:19:53.837738928Z&quot;=
 level=3Dwarning msg=3D&quot;Running modprobe bridge br_netfilter failed wi=
th message: modprobe: WARNING: Module br_netfilter not found in director...=
ror: exit status 1&quot;<br></div><div><br></div><div><br></div><div>Regard=
s</div><div>Simon</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via <a hr=
ef=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;simonkb=
aby=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.y=
octoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr">Hello Bruce,<div><br></div><div>Thank you f=
or the inputs.</div><div><br></div><div><br></div><div><p class=3D"MsoNorma=
l" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">Yes, =
I use linux-yocto. The target linux version is below.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP
PREEMPT_RT Tue Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux</p=
>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">The layers used are in the link below.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><a href=3D"https://source.codeaurora.org/external/imx/imx-ma=
nifest/tree/imx-5.15.32-2.0.0.xml?h=3Dimx-linux-kirkstone" style=3D"color:r=
gb(5,99,193)" target=3D"_blank">https://source.codeaurora.org/external/imx/=
imx-manifest/tree/imx-5.15.32-2.0.0.xml?h=3Dimx-linux-kirkstone</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">I tried to add <b>IMAGE_INSTALL:append =3D &quot;
kernel-modules&quot;</b> in local.conf but it did not make any difference. =
</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">The docker version I am running on the target is <b>20.10.12=
-ce</b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Below is the error I am getting on the target.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">root@imx8mpevk:~#<b> docker run hello-world</b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.005452] docker0: port 1(veth4dc9000) entered blocking
state</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.005512] docker0: port 1(veth4dc9000) entered disabled
state</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.005921] device veth4dc9000 entered promiscuous mode</=
p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.005994] audit: type=3D1700 audit(1677283528.914:37):
dev=3Dveth4dc9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0=
 ses=3D4294967295</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.013139] audit: type=3D1300 audit(1677283528.914:37):
arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d5=
0 a2=3D28 a3=3D0
items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 sui=
d=3D0 fsuid=3D0 egid=3D0
sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D&quot;dockerd&quot;=
 exe=3D&quot;/usr/bin/dockerd&quot;
key=3D(null)</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.013228] audit: type=3D1327 audit(1677283528.914:37):
proctitle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><span style=3D"color:red">[ 1359.263483] docker0: port
1(veth4dc9000) entered disabled state</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><span style=3D"color:red">[ 1359.298263] device veth4dc9000
left promiscuous mode</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><span style=3D"color:red">[ 1359.298305] docker0: port
1(veth4dc9000) entered disabled state</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">[ 1359.298646] audit: type=3D1700 audit(1677283529.164:38):
dev=3Dveth4dc9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0=
 ses=3D4294967295</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><b><span style=3D"color:red">docker: Error response from
daemon: failed to create shim task: OCI runtime create failed: runc create
failed: unable to start container process: can&#39;t get final child&#39;s =
PID from
pipe: EOF: unknown.</span></b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><b><span style=3D"color:red">ERRO[0000] error waiting for
container: context canceled</span></b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><b>=C2=A0</b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><b>=C2=A0</b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"><b>=C2=A0</b></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Also sending the local.conf and bblayers.conf file</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">local.conf:</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">MACHINE ??=3D &#39;imx8mpevk&#39;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">DISTRO ?=3D &#39;fsl-imx-wayland&#39;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">PACKAGE_CLASSES ?=3D &#39;package_rpm&#39;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">USER_CLASSES ?=3D &quot;buildstats&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">PATCHRESOLVE =3D &quot;noop&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BB_DISKMON_DIRS ??=3D &quot;\</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 STOPTASKS,${TMPDIR},1G,100K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 STOPTASKS,${DL_DIR},1G,100K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 STOPTASKS,${SSTATE_DIR},1G,100K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0STOPTASKS,/tmp,100M,100K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 HALT,${TMPDIR},100M,1K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 HALT,${DL_DIR},100M,1K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 HALT,${SSTATE_DIR},100M,1K \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0=C2=A0=C2=A0 HALT,/tmp,10M,1K&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">PACKAGECONFIG:append:pn-qemu-system-native =3D &quot;
sdl&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">CONF_VERSION =3D &quot;2&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">DL_DIR ?=3D &quot;${BSPDIR}/downloads/&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">ACCEPT_FSL_EULA =3D &quot;1&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"># Switch to Debian packaging and include package-management
in the image</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">PACKAGE_CLASSES =3D &quot;package_deb&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">EXTRA_IMAGE_FEATURES +=3D &quot;package-management&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">DISTRO_FEATURES:append =3D &quot; virtualization&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">IMAGE_INSTALL:append =3D &quot; docker-ce&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">IMAGE_INSTALL:append =3D &quot; kernel-modules&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">EXTRA_IMAGE_FEATURES =3D &quot;debug-tweaks
tools-profile&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">bblayers.conf</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">LCONF_VERSION =3D &quot;7&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBPATH =3D &quot;${TOPDIR}&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BSPDIR :=3D <a href=3D"mailto:$%7b@os.path.abspath(os.path.d=
irname(d.getVar(&#39;FILE&#39;,%20True))%20+%20&#39;/../..&#39;)%7d" style=
=3D"color:rgb(5,99,193)" target=3D"_blank">${@os.path.abspath(os.path.dirna=
me(d.getVar(&#39;FILE&#39;,
True)) + &#39;/../..&#39;)}</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBFILES ?=3D &quot;&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS =3D &quot; \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/poky/meta \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/poky/meta-poky \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/meta-openembedded/meta-oe \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/meta-openembedded/meta-multimedia \=
</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/meta-openembedded/meta-python \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/meta-freescale \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/meta-freescale-3rdparty \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0 ${BSPDIR}/sources/meta-freescale-distro \</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif"># i.MX Yocto Project Release layers</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-bsp&quot=
;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-sdk&quot=
;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-ml&quot;=
</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-v2x&quot=
;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">#BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-nxp-demo-experie=
nce&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">#BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-browser/meta-chromium&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">#BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-clang&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">#BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-openembedded/meta-gnome&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembedded/meta=
-networking&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-openembedded/meta-filesystems&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-virtualization&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-teledyne-wapng&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-aws&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0Regards</p><p class=3D"MsoNormal" style=3D"margin:0in;=
font-size:11pt;font-family:Calibri,sans-serif">Simon</p></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 2=
3, 2023 at 12:03 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Feb 22, 2023 at 9=
:47 PM SIMON BABY &lt;<a href=3D"mailto:simonkbaby@gmail.com" target=3D"_bl=
ank">simonkbaby@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Team,<br>
&gt;<br>
&gt; Can I know what are the changes required in yocto to run docker and it=
s dependencies=C2=A0 on my target embedded system. I have added the below c=
hanges. Do I need more plugins and packages ?<br>
&gt;<br>
&gt; bblayers.conf:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembedded/meta-networkin=
g&quot;<br>
&gt;<br>
&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembedded/meta-filesyste=
ms&quot;<br>
&gt;<br>
&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-virtualization&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; local.conf:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; DISTRO_FEATURES:append =3D &quot; virtualization&quot;<br>
&gt;<br>
&gt; IMAGE_INSTALL:append =3D &quot; docker-ce&quot;<br>
&gt;<br>
<br>
You likely are missing kernel configuration values required to run the<br>
containers.<br>
<br>
What kernel are you using (linux-yocto?), and are you on the master<br>
branch of the layers ?<br>
<br>
As you can see, it is working in my latest tests:<br>
<br>
root@qemux86-64:~# docker --version<br>
Docker version 23.0.1, build a5ee5b1dfc<br>
root@qemux86-64:~# docker pull alpine<br>
Using default tag: latest<br>
latest: Pulling from library/alpine<br>
63b65145d645: Pull complete<br>
Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f0ef=
b90a<br>
Status: Downloaded newer image for alpine:latest<br>
<a href=3D"http://docker.io/library/alpine:latest" rel=3D"noreferrer" targe=
t=3D"_blank">docker.io/library/alpine:latest</a><br>
root@qemux86-64:~# docker run -it alpine /bin/sh<br>
/ #<br>
<br>
Try adding &quot;kernel-modules&quot; to your IMAGE_INSTALL, and see if tha=
t<br>
makes a difference.<br>
<br>
Bruce<br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt; WIth the above changes and tested on the target I am getting the below=
 error when try to run &quot;docker run hello-world&quot;<br>
&gt;<br>
&gt;<br>
&gt; root@imx8mpevk:~# docker run hello-world<br>
&gt; DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping<br>
&gt; DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/cr=
eate<br>
&gt; DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttachStderr=
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
=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}<br>
&gt; DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state=
<br>
&gt; [25846.681041] docker0: port 1(veth659d267) entered disabled state<br>
&gt; [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 ent=
ered promiscuous mode<br>
&gt; container mounted via layerStore:[25846.681392] audit: type=3D1700 aud=
it(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=3D42=
94967295 uid=3D0 gid=3D0 ses=3D4294967295<br>
&gt; &amp;{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300 =
audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=
=3D40 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551=
 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgi=
d=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=
=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)<br>
&gt; 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327 aud=
it(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D44<=
br>
&gt; aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} conta=
iner=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190<br>
&gt; DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attach?stder=
r=3D1&amp;stdout=3D1&amp;stream=3D1<br>
&gt; DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin<br>
&gt; DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin<br>
&gt; DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?conditi=
on=3Dnext-exit<br>
&gt; DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start<br>
&gt; DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore:=
 &amp;{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa299=
4ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D4f9=
26f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190<br>
&gt; DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint =
crazy_bell=E2=80=99s interface on network bridge<br>
&gt; DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/<a hr=
ef=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_blank">172.17.0.0=
/16</a>, , map)<br>
&gt; DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:<a href=3D=
"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_blank">172.17.0.0/16</=
a> App: ipam/default/data, ID: LocalDefault/<a href=3D"http://172.17.0.0/16=
" rel=3D"noreferrer" target=3D"_blank">172.17.0.0/16</a>, DBIndex: 0x0, Bit=
s: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)-&gt;(0x0, 2046)-&gt;=
(0x1, 1)-&gt;end Curr:3 Serial:false PrefAddress:<br>
&gt; ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns =
fd -1: bad file descriptor<br>
&gt; DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint =
crazy_bell=E2=80=99s interface on network bridge<br>
&gt; ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns =
fd -1: bad file descriptor<br>
&gt; DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity=
 on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731=
042007ec0ebd3c)<br>
&gt; ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: po=
rt 1(veth659d267) entered disabled state<br>
&gt; to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no =
such file or directory, initns fd -1: bad file descriptor<br>
&gt; DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e0566c4dbd=
fbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START<br>
&gt; DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth65=
9d267 left promiscuous mode<br>
&gt; eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(veth65=
9d267) entered disabled state<br>
&gt; [25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dvet=
h659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D42=
94967295<br>
&gt; 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE<br>
&gt; DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=3D/var/=
run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.040986] =
audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D206=
 success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 pp=
id=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsu=
id=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=
=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(n=
ull)<br>
&gt; [25847.041004] audit: type=3D1327 audit(1677113637.488:206): proctitle=
=3D2F7573722F62696E2F646F636B657264002D44<br>
&gt; 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby roo=
t=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae=
5b99b3bcb65c33ec2f/merged<br>
&gt; ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a=
 closed fifo<br>
&gt; ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from a=
 closed fifo<br>
&gt; DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end<br>
&gt; DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end<br>
&gt; DEBU[2023-02-23T00:53:57.445349705Z] attach done<br>
&gt; DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on=
 endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042=
007ec0ebd3c)<br>
&gt; ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns =
fd -1: bad file descriptor<br>
&gt; ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns =
fd -1: bad file descriptor<br>
&gt; ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns =
fd -1: bad file descriptor<br>
&gt; DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint =
crazy_bell=E2=80=99s interface on network bridge<br>
&gt; DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/<a hr=
ef=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_blank">172.17.0.0=
/16</a>, 172.17.0.2)<br>
&gt; DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:LocalDefa=
ult/<a href=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_blank">1=
72.17.0.0/16</a>, Address:172.17.0.2 Sequence:App: ipam/default/data, ID: L=
ocalDefault/<a href=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_=
blank">172.17.0.0/16</a>, DBIndex: 0x0, Bits: 65536, Unselected: 65532, Seq=
uence: (0xe0000000, 1)-&gt;(0x0, 2046)-&gt;(0x1, 1)-&gt;end Curr:3<br>
&gt; ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb027787b42e6=
e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container from co=
ntainerd: no such container<br>
&gt; ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/container=
s/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start re=
turned error: failed to create shim task: OCI runtime create failed: runc c=
reate failed: unable to start container process: can=E2=80=99t get final ch=
ild=E2=80=99s PID from pipe: EOF: unknown<br>
&gt; docker: Error response from daemon: failed to create shim task: OCI ru=
ntime create failed: runc create failed: unable to start container process:=
 can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown.<br>
&gt; ERRO[0000] error waiting for container: context canceled<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Regards<br>
&gt;<br>
&gt; Simon<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7898): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7898" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7898</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97175886/4946=
642" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97175886/4946642</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:simonkbaby@gmail.com" =
target=3D"_blank">simonkbaby@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009a7fce05f58ddda9--

