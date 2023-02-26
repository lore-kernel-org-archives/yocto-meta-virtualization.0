Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5DCC64EC7
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 01:27:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.58152.1677374832908248015
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 25 Feb 2023 17:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TyCCbv5h;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: simonkbaby@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id kb15so2791166pjb.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 25 Feb 2023 17:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMDz1JdAjNQD654h53XNZ38RH7ptmOom1oo6gKx48yk=;
        b=TyCCbv5hlKe15iuUpfBGfVCYqAjvomJva/A1LUuuObiGXcnmCpS+JhY0fA5f4iF52O
         aU8p2e+MWoWjeR5ldQpkVlQYsq1L1oiZ4gQ/Sr/wtLf1/a6JJ6/G/14A0SOJ4V106rYh
         uPAOu/pxoJJ5PSJvAU3562BLVxG5bBYDa0VymbQebICKztKiZ2ExbEN/I3fyT80Cxd1/
         B0GT9ym7WIQMJh1OUSWTJO3JxlmUBE+O1stIjo+d1KDRbDZc308u0Lw/Z7g5S9DwPchn
         wsGq2DOPHx+gohz8aTJn28PCyXdysSmY7wORsF8KDVaXgxBJLKyvV2vE3lMct6zDe0Nc
         B2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMDz1JdAjNQD654h53XNZ38RH7ptmOom1oo6gKx48yk=;
        b=NFiS4pfFs3vPNB4Ib9kFmbjoxuclaltnhma+K/zt9O5XFmkkJjLmmAyW2OtSbdVBK/
         7O5T+TDn0IT4RvGVs3UCxoyaSFC7goAC5XAOtrfRh+ItQZrs8O9kK0F/cfKGb4oGkVGl
         AhGi6kFB675jMrKWW1bg4LOWSzZScNNVIb2LvQKl/FQnrMZd0wKsP0Mp55c1BPDKVNvG
         wg52Zp+vfErTxrJ4ZfhQoPInPiTd8tuhW8pKNw3brvjoCGTfyc1eDWP4aOyS1DOuv887
         1Wcm4BQdJ92NVVwajdtjZaxIEHJaeCBbyr7jvMtwz3s3qnUUmgjTwOC9aKQpY23KspyA
         cQ9A==
X-Gm-Message-State: AO0yUKXXLFlQQdZCalx37P5C0L/+soCEaNDnyxLL5mZ90hTUfW0KAw4q
	Vw/FT+DtpcB6PzKzx2uQZLo=
X-Google-Smtp-Source: AK7set/ixzpSyhK9snyInUHRLBl8RB1bZe0hPIXTz8dC0uWQ0Ob2btwImxhWtFltMm7WaVEC2jy+Dg==
X-Received: by 2002:a17:902:d2c3:b0:19a:80c9:2cd7 with SMTP id n3-20020a170902d2c300b0019a80c92cd7mr23995688plc.47.1677374831774;
        Sat, 25 Feb 2023 17:27:11 -0800 (PST)
Received: from ?IPv6:2603:8000:7f00:5ab0:5902:2b5d:849e:5735? (2603-8000-7f00-5ab0-5902-2b5d-849e-5735.res6.spectrum.com. [2603:8000:7f00:5ab0:5902:2b5d:849e:5735])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709029f8800b0019ca7b7a684sm1822385plq.161.2023.02.25.17.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 17:27:11 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: SIMON BABY <simonkbaby@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-virtualization] query on docker support changes in yocto
Date: Sat, 25 Feb 2023 17:27:10 -0800
Message-Id: <861A9C92-9C49-44CC-A4E3-413169784F84@gmail.com>
References: <CADkTA4MLCRpqYA=OxRe-GdONo_ijpJXFcZdSF=O-tXGHxECgBw@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
In-Reply-To: <CADkTA4MLCRpqYA=OxRe-GdONo_ijpJXFcZdSF=O-tXGHxECgBw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: iPhone Mail (17F80)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Feb 2023 01:27:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7902

Thank you Bruce . I will do more research in that direction ( kernel configu=
ration)

Regards
Simon



Sent from my iPhone

> On Feb 25, 2023, at 5:20 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>=20
> =EF=BB=BFOn Sat, Feb 25, 2023 at 5:35 PM SIMON BABY <simonkbaby@gmail.com>=
 wrote:
>>=20
>> Hi Bruce,
>> I also observed that the docker daemon is not starting by default and if I=
 launch it manually , it takes a long time to start. Am I missing any kernel=
 modules?
>>=20
>> Here is the  o/p from  "systemctl status docker.service".
>>=20
>> root@imx8mpevk:~# systemctl status docker.service
>> * docker.service - Docker Application Container Engine
>>     Loaded: loaded (/lib/systemd/system/docker.service; disabled; vendor p=
reset: disabled)
>>     Active: active (running) since Sat 2023-02-25 22:19:54 UTC; 4min 10s a=
go
>> TriggeredBy: * docker.socket
>>       Docs: https://docs.docker.com
>>   Main PID: 423 (dockerd)
>>      Tasks: 11 (limit: 5578)
>>     Memory: 115.0M
>>     CGroup: /system.slice/docker.service
>>             `-423 /usr/bin/dockerd -H fd://
>>=20
>> Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:53.83773=
8928Z" level=3Dwarning msg=3D"Running modprobe bridge br_netfilter failed wi=
th message: modprobe: WARNING: Module br_netfilter not found in director...r=
or: exit status 1"
>=20
> The above error could be a missing module, or a missing iptables module.
>=20
>=20
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.07125=
0923Z" level=3Dwarning msg=3D"Could not load necessary modules for IPSEC rul=
es: protocol not supported"
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.07825=
0217Z" level=3Dwarning msg=3D"Could not load necessary modules for Conntrack=
: Running modprobe nf_conntrack_netlink failed with message: `modprobe: WARN=
ING: Module nf_...
>=20
> As does the above one.
>=20
> so you definitely have missing configuration.
>=20
> Bruce
>=20
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.08147=
1487Z" level=3Dinfo msg=3D"Default bridge (docker0) is assigned with an IP a=
ddress 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP a=
ddress"
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.19913=
2980Z" level=3Dinfo msg=3D"Loading containers: done."
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.29684=
5346Z" level=3Dinfo msg=3D"Docker daemon" commit=3D906f57ff5b-unsupported gr=
aphdriver(s)=3Doverlay2 version=3D20.10.12-ce
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.29723=
6599Z" level=3Dinfo msg=3D"Daemon has completed initialization"
>> Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Application Containe=
r Engine.
>> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.37235=
4197Z" level=3Dinfo msg=3D"API listen on /run/docker.sock"
>> Feb 25 22:23:14 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:23:14.18873=
8979Z" level=3Dinfo msg=3D"ignoring event" container=3Da973c205bf7c0e57450de=
3241767f39e4983b6b174e231e014159ed8ae220791 module=3Dlibcontainerd namespace=
...*events.TaskDelete"
>> Hint: Some lines were ellipsized, use -l to show in full.
>> root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"2023-02=
-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running modprobe bridge br_n=
etfilter failed with message: modprobe: WARNING: Module br_netfilter not fou=
nd in director...ror: exit status 1"
>>=20
>>=20
>> Regards
>> Simon
>>=20
>>> On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via lists.yoctoproject.org <s=
imonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>=20
>>> Hello Bruce,
>>>=20
>>> Thank you for the inputs.
>>>=20
>>>=20
>>> Yes, I use linux-yocto. The target linux version is below.
>>>=20
>>>=20
>>>=20
>>> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP PREEMPT_RT Tu=
e Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
>>>=20
>>>=20
>>>=20
>>> The layers used are in the link below.
>>>=20
>>> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-5.15.32=
-2.0.0.xml?h=3Dimx-linux-kirkstone
>>>=20
>>>=20
>>>=20
>>> I tried to add IMAGE_INSTALL:append =3D " kernel-modules" in local.conf b=
ut it did not make any difference.
>>>=20
>>>=20
>>>=20
>>> The docker version I am running on the target is 20.10.12-ce
>>>=20
>>>=20
>>>=20
>>> Below is the error I am getting on the target.
>>>=20
>>>=20
>>>=20
>>> root@imx8mpevk:~# docker run hello-world
>>>=20
>>> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking state
>>>=20
>>> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled state
>>>=20
>>> [ 1359.005921] device veth4dc9000 entered promiscuous mode
>>>=20
>>> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37): dev=3Dveth4d=
c9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496=
7295
>>>=20
>>> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37): arch=3Dc0000=
0b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d50 a2=3D28 a3=3D=
0 items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 su=
id=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 c=
omm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)
>>>=20
>>> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37): proctitle=3D=
2F7573722F62696E2F646F636B657264002D480066643A2F2F
>>>=20
>>> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled state
>>>=20
>>> [ 1359.298263] device veth4dc9000 left promiscuous mode
>>>=20
>>> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled state
>>>=20
>>> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38): dev=3Dveth4d=
c9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496=
7295
>>>=20
>>> docker: Error response from daemon: failed to create shim task: OCI runt=
ime create failed: runc create failed: unable to start container process: ca=
n't get final child's PID from pipe: EOF: unknown.
>>>=20
>>> ERRO[0000] error waiting for container: context canceled
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>> Also sending the local.conf and bblayers.conf file
>>>=20
>>>=20
>>>=20
>>> local.conf:
>>>=20
>>>=20
>>>=20
>>> MACHINE ??=3D 'imx8mpevk'
>>>=20
>>> DISTRO ?=3D 'fsl-imx-wayland'
>>>=20
>>> PACKAGE_CLASSES ?=3D 'package_rpm'
>>>=20
>>> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>>>=20
>>> USER_CLASSES ?=3D "buildstats"
>>>=20
>>> PATCHRESOLVE =3D "noop"
>>>=20
>>> BB_DISKMON_DIRS ??=3D "\
>>>=20
>>>    STOPTASKS,${TMPDIR},1G,100K \
>>>=20
>>>    STOPTASKS,${DL_DIR},1G,100K \
>>>=20
>>>    STOPTASKS,${SSTATE_DIR},1G,100K \
>>>=20
>>>   STOPTASKS,/tmp,100M,100K \
>>>=20
>>>    HALT,${TMPDIR},100M,1K \
>>>=20
>>>    HALT,${DL_DIR},100M,1K \
>>>=20
>>>    HALT,${SSTATE_DIR},100M,1K \
>>>=20
>>>    HALT,/tmp,10M,1K"
>>>=20
>>> PACKAGECONFIG:append:pn-qemu-system-native =3D " sdl"
>>>=20
>>> CONF_VERSION =3D "2"
>>>=20
>>>=20
>>>=20
>>> DL_DIR ?=3D "${BSPDIR}/downloads/"
>>>=20
>>> ACCEPT_FSL_EULA =3D "1"
>>>=20
>>>=20
>>>=20
>>> # Switch to Debian packaging and include package-management in the image=

>>>=20
>>> PACKAGE_CLASSES =3D "package_deb"
>>>=20
>>> EXTRA_IMAGE_FEATURES +=3D "package-management"
>>>=20
>>> DISTRO_FEATURES:append =3D " virtualization"
>>>=20
>>> IMAGE_INSTALL:append =3D " docker-ce"
>>>=20
>>> IMAGE_INSTALL:append =3D " kernel-modules"
>>>=20
>>>=20
>>>=20
>>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-profile"
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>> bblayers.conf
>>>=20
>>>=20
>>>=20
>>> LCONF_VERSION =3D "7"
>>>=20
>>>=20
>>>=20
>>> BBPATH =3D "${TOPDIR}"
>>>=20
>>> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) +=
 '/../..')}
>>>=20
>>>=20
>>>=20
>>> BBFILES ?=3D ""
>>>=20
>>> BBLAYERS =3D " \
>>>=20
>>>  ${BSPDIR}/sources/poky/meta \
>>>=20
>>>  ${BSPDIR}/sources/poky/meta-poky \
>>>=20
>>>  \
>>>=20
>>>  ${BSPDIR}/sources/meta-openembedded/meta-oe \
>>>=20
>>>  ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>>>=20
>>>  ${BSPDIR}/sources/meta-openembedded/meta-python \
>>>=20
>>>  \
>>>=20
>>>  ${BSPDIR}/sources/meta-freescale \
>>>=20
>>>  ${BSPDIR}/sources/meta-freescale-3rdparty \
>>>=20
>>>  ${BSPDIR}/sources/meta-freescale-distro \
>>>=20
>>> "
>>>=20
>>>=20
>>>=20
>>> # i.MX Yocto Project Release layers
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-bsp"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-sdk"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-ml"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-v2x"
>>>=20
>>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-nxp-demo-experience"
>>>=20
>>>=20
>>>=20
>>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-browser/meta-chromium"
>>>=20
>>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-clang"
>>>=20
>>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-gnome"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-teledyne-wapng"
>>>=20
>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-aws"
>>>=20
>>>=20
>>>=20
>>> Regards
>>>=20
>>> Simon
>>>=20
>>>=20
>>> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
>>>>=20
>>>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com> wrote=
:
>>>>>=20
>>>>> Hello Team,
>>>>>=20
>>>>> Can I know what are the changes required in yocto to run docker and it=
s dependencies  on my target embedded system. I have added the below changes=
. Do I need more plugins and packages ?
>>>>>=20
>>>>> bblayers.conf:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>>>>>=20
>>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>>>>>=20
>>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> local.conf:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> DISTRO_FEATURES:append =3D " virtualization"
>>>>>=20
>>>>> IMAGE_INSTALL:append =3D " docker-ce"
>>>>>=20
>>>>=20
>>>> You likely are missing kernel configuration values required to run the
>>>> containers.
>>>>=20
>>>> What kernel are you using (linux-yocto?), and are you on the master
>>>> branch of the layers ?
>>>>=20
>>>> As you can see, it is working in my latest tests:
>>>>=20
>>>> root@qemux86-64:~# docker --version
>>>> Docker version 23.0.1, build a5ee5b1dfc
>>>> root@qemux86-64:~# docker pull alpine
>>>> Using default tag: latest
>>>> latest: Pulling from library/alpine
>>>> 63b65145d645: Pull complete
>>>> Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3=
f0efb90a
>>>> Status: Downloaded newer image for alpine:latest
>>>> docker.io/library/alpine:latest
>>>> root@qemux86-64:~# docker run -it alpine /bin/sh
>>>> / #
>>>>=20
>>>> Try adding "kernel-modules" to your IMAGE_INSTALL, and see if that
>>>> makes a difference.
>>>>=20
>>>> Bruce
>>>>=20
>>>>=20
>>>>>=20
>>>>>=20
>>>>> WIth the above changes and tested on the target I am getting the below=
 error when try to run "docker run hello-world"
>>>>>=20
>>>>>=20
>>>>> root@imx8mpevk:~# docker run hello-world
>>>>> DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
>>>>> DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/cr=
eate
>>>>> DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttachStderr=
=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=E2=80=9CAttachStdout=E2=80=
=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDomainname=E2=80=9D:=E2=80=9C=E2=
=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=80=9CEnv=E2=80=9D:null,=E2=80=9C=
HostConfig=E2=80=9D:{=E2=80=9CAutoRemove=E2=80=9D:false,=E2=80=9CBinds=E2=80=
=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=80=9D:null,=E2=80=9CBlkioDeviceReadI=
Ops=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteBps=E2=80=9D:null,=E2=80=9CBlkioD=
eviceWriteIOps=E2=80=9D:null,=E2=80=9CBlkioWeight=E2=80=9D:0,=E2=80=9CBlkioW=
eightDevice=E2=80=9D:,=E2=80=9CCapAdd=E2=80=9D:null,=E2=80=9CCapDrop=E2=80=9D=
:null,=E2=80=9CCgroup=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCgroupParent=E2=80=
=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCgroupnsMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=
=80=9CConsoleSize=E2=80=9D:[0,0],=E2=80=9CContainerIDFile=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CCpuCount=E2=80=9D:0,=E2=80=9CCpuPercent=E2=80=9D:0,=E2=80=
=9CCpuPeriod=E2=80=9D:0,=E2=80=9CCpuQuota=E2=80=9D:0,=E2=80=9CCpuRealtimePer=
iod=E2=80=9D:0,=E2=80=9CCpuRealtimeRuntime=E2=80=9D:0,=E2=80=9CCpuShares=E2=80=
=9D:0,=E2=80=9CCpusetCpus=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpusetMems=E2=
=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CDeviceCgroupRules=E2=80=9D:null,=E2=80=9C=
DeviceRequests=E2=80=9D:null,=E2=80=9CDevices=E2=80=9D:,=E2=80=9CDns=E2=80=9D=
:,=E2=80=9CDnsOptions=E2=80=9D:,=E2=80=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraH=
osts=E2=80=9D:null,=E2=80=9CGroupAdd=E2=80=9D:null,=E2=80=9CIOMaximumBandwid=
th=E2=80=9D:0,=E2=80=9CIOMaximumIOps=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=
=80=9C=E2=80=9D,=E2=80=9CIsolation=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKern=
elMemory=E2=80=9D:0,=E2=80=9CKernelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=
=9D:null,=E2=80=9CLogConfig=E2=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CT=
ype=E2=80=9D:=E2=80=9C=E2=80=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9C=
Memory=E2=80=9D:0,=E2=80=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=E2=
=80=9D:0,=E2=80=9CMemorySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=9D:0,=
=E2=80=9CNetworkMode=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomKillDisa=
ble=E2=80=9D:false,=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=E2=80=9D=
:=E2=80=9C=E2=80=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBindings=E2=80=
=9D:{},=E2=80=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPorts=E2=80=9D:=
false,=E2=80=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRootfs=E2=80=9D:=
false,=E2=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCount=E2=80=9D:0=
,=E2=80=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecurityOpt=E2=80=9D:=
null,=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=E2=80=9C=E2=80=9D=
,=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=9D:=E2=80=9C=E2=80=
=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumesFrom=E2=
=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CImage=E2=
=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabels=E2=80=9D:{},=E2=80=9CNe=
tworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=E2=80=9D:{}},=E2=80=9COnBu=
ild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:false,=E2=80=9CPlatform=E2=80=9D=
:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=80=9CTty=E2=80=9D:false,=E2=80=9C=
User=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumes=E2=80=9D:{},=E2=80=9CWorki=
ngDir=E2=80=9D:=E2=80=9C=E2=80=9D}
>>>>> DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state=

>>>>> [25846.681041] docker0: port 1(veth659d267) entered disabled state
>>>>> [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 ent=
ered promiscuous mode
>>>>> container mounted via layerStore:[25846.681392] audit: type=3D1700 aud=
it(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=3D429=
4967295 uid=3D0 gid=3D0 ses=3D4294967295
>>>>> &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300 audi=
t(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40=
 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 auid=3D=
4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsg=
id=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=
=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>>>>> 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327 aud=
it(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D44
>>>>> aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} conta=
iner=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>>>>> DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attach?stderr=
=3D1&stdout=3D1&stream=3D1
>>>>> DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
>>>>> DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
>>>>> DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?conditio=
n=3Dnext-exit
>>>>> DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/containers/4f=
926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
>>>>> DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore:=
 &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae5b=
99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D4f926f032=
e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>>>>> DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint c=
razy_bell=E2=80=99s interface on network bridge
>>>>> DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/172.1=
7.0.0/16, , map)
>>>>> DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172.17.0.0=
/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bi=
ts: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046)->(0x1, 1=
)->end Curr:3 Serial:false PrefAddress:
>>>>> ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns f=
d -1: bad file descriptor
>>>>> DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint c=
razy_bell=E2=80=99s interface on network bridge
>>>>> ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1555/ns/net: no such file or directory, initns f=
d -1: bad file descriptor
>>>>> DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity=
 on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe7310=
42007ec0ebd3c)
>>>>> ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: po=
rt 1(veth659d267) entered disabled state
>>>>> to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no s=
uch file or directory, initns fd -1: bad file descriptor
>>>>> DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e0566c4dbd=
fbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
>>>>> DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth65=
9d267 left promiscuous mode
>>>>> eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(veth65=
9d267) entered disabled state
>>>>> [25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dvet=
h659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429=
4967295
>>>>> 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
>>>>> DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=3D/var/=
run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.040986] a=
udit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D206 s=
uccess=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 ppid=3D=
409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0=
 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9C=
dockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>>>>> [25847.041004] audit: type=3D1327 audit(1677113637.488:206): proctitle=
=3D2F7573722F62696E2F646F636B657264002D44
>>>>> 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby roo=
t=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae5=
b99b3bcb65c33ec2f/merged
>>>>> ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a=
 closed fifo
>>>>> ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from a=
 closed fifo
>>>>> DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
>>>>> DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
>>>>> DEBU[2023-02-23T00:53:57.445349705Z] attach done
>>>>> DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on=
 endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe7310420=
07ec0ebd3c)
>>>>> ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns f=
d -1: bad file descriptor
>>>>> ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns f=
d -1: bad file descriptor
>>>>> ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespac=
e, readlink /proc/1551/task/1558/ns/net: no such file or directory, initns f=
d -1: bad file descriptor
>>>>> DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint c=
razy_bell=E2=80=99s interface on network bridge
>>>>> DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/172.1=
7.0.0/16, 172.17.0.2)
>>>>> DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:LocalDefa=
ult/172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/data, ID: L=
ocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 65532, Seq=
uence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
>>>>> ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb027787b42e6=
e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container from con=
tainerd: no such container
>>>>> ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/container=
s/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start ret=
urned error: failed to create shim task: OCI runtime create failed: runc cre=
ate failed: unable to start container process: can=E2=80=99t get final child=
=E2=80=99s PID from pipe: EOF: unknown
>>>>> docker: Error response from daemon: failed to create shim task: OCI ru=
ntime create failed: runc create failed: unable to start container process: c=
an=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown.
>>>>> ERRO[0000] error waiting for container: context canceled
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> Regards
>>>>>=20
>>>>> Simon
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>=20
>>>>=20
>>>>=20
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>=20
>>>=20
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#7898): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7898
>>> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/4946642
>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
simonkbaby@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

