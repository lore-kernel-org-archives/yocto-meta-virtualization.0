Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6D4C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:03:31 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.743.1677182609011561203
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 12:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gGAIBJkn;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id t129so2363040iof.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Feb 2023 12:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxxVDN8U6CZ62/W2Fc8D2j5zV78bGaKq8EX7+Ldep1A=;
        b=gGAIBJknYNUONuHnPovP7zdslrLmz3lMya+wIEP1Kw7rb+kCMTIlQ7Lt/NN76aPC59
         tYD+VrAM5tF3KmyjtcyYAEz1nHLCYexfpxVmqmJE5cLG3Y/lTHuF4M5YnqCdpJRqlekA
         GWV3NRDcktpkyoPYF7dnEJhtIY1f17Y1KbVFbXPF6NWuVK3A1My37KJy3Ps0uNo1Et7Z
         uxdn6bhQQDNQP7qkPk+CmzqhFTW+2Wm+DNaxM9nDtklwSmk1ue9IvJKJYTFo1DooRSMY
         zlzZCCzpoMLDpIuwziGZS0Kk3mce838/YtU1lW2aPMWZmd3RyKA2D29+Beg8FjiLzRSD
         1Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxxVDN8U6CZ62/W2Fc8D2j5zV78bGaKq8EX7+Ldep1A=;
        b=n5iJ3QfIGoFAZ9L3j5fJ2h4Kd8wdUeh3x9RiqorcZ3tjJkQfbjJEGWMfdNpE280K/z
         DFeJu0Mt1ETR+EoG4oTR4YPo2EgNYN7wZbx09e3boRuocFlgsqZ+n8QAZjTSjphbeb8h
         EaC0M6z2fNhNvwpwPpJYMRBhyRX9GnVBQ0gj+oXSuPY1WZWXoCOp0QyG8qJ1/qrxQoWO
         S1g1xbqpkoAbs3jIagFWiqLnsZK+Mz4y2MeXSP7fhyCQM2Eppmt/zQNCo4CxpOxs3sbe
         JgeAc2x7DHK1jGSJf+1prQ4NyrdHLEi6dVQAGpuzMUhnZIeUTuZ3zff+bHd1ZvO4T8Vz
         9CYg==
X-Gm-Message-State: AO0yUKWHHqvNGy9bdnItRa5dMdgc21HTuj2/C/375fO83yVM5xXNX1IJ
	u57f+hQB7I5EV1/hAUqmqFmiRgUJv7OvcnRQbPU=
X-Google-Smtp-Source: AK7set9JPQiuAgcTXT/wTAlUDpC6AAQnPCTN24eaId3GXf1Rhr4OabcXaA85rirohRa4SPQtFZgJlXnkdm/xE73cnTw=
X-Received: by 2002:a05:6638:216f:b0:3b0:94d5:ec19 with SMTP id
 p15-20020a056638216f00b003b094d5ec19mr4328771jak.0.1677182608100; Thu, 23 Feb
 2023 12:03:28 -0800 (PST)
MIME-Version: 1.0
References: <CAEFUPH37BMyGgmUBi4V18u=VGMuzJ5qGkL4zgqG1+mqtrNd_ag@mail.gmail.com>
In-Reply-To: <CAEFUPH37BMyGgmUBi4V18u=VGMuzJ5qGkL4zgqG1+mqtrNd_ag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Feb 2023 15:04:18 -0500
Message-ID: <CADkTA4PFhoRS_eQgc=ckVoJDtWbfHMrRv_88m_+Rc2F3Ab7+PQ@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Feb 2023 20:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7897

On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>
> Hello Team,
>
> Can I know what are the changes required in yocto to run docker and its d=
ependencies  on my target embedded system. I have added the below changes. =
Do I need more plugins and packages ?
>
> bblayers.conf:
>
>
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>
> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>
>
>
> local.conf:
>
>
>
> DISTRO_FEATURES:append =3D " virtualization"
>
> IMAGE_INSTALL:append =3D " docker-ce"
>

You likely are missing kernel configuration values required to run the
containers.

What kernel are you using (linux-yocto?), and are you on the master
branch of the layers ?

As you can see, it is working in my latest tests:

root@qemux86-64:~# docker --version
Docker version 23.0.1, build a5ee5b1dfc
root@qemux86-64:~# docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
63b65145d645: Pull complete
Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f0ef=
b90a
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
root@qemux86-64:~# docker run -it alpine /bin/sh
/ #

Try adding "kernel-modules" to your IMAGE_INSTALL, and see if that
makes a difference.

Bruce


>
>
> WIth the above changes and tested on the target I am getting the below er=
ror when try to run "docker run hello-world"
>
>
> root@imx8mpevk:~# docker run hello-world
> DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
> DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/creat=
e
> DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttachStderr=E2=
=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=E2=80=9CAttachStdout=E2=80=
=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDomainname=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=80=9CEnv=E2=80=9D:null,=E2=
=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=E2=80=9D:false,=E2=80=9CBind=
s=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=80=9D:null,=E2=80=9CBlkioDev=
iceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteBps=E2=80=9D:null,=E2=80=
=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=9CBlkioWeight=E2=80=9D:0,=E2=
=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCapAdd=E2=80=9D:null,=E2=80=9CCa=
pDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCg=
roupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCgroupnsMode=E2=80=9D:=E2=
=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[0,0],=E2=80=9CContainerIDFil=
e=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=E2=80=9D:0,=E2=80=9CCpuPerc=
ent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=E2=80=9CCpuQuota=E2=80=9D:0,=
=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=9CCpuRealtimeRuntime=E2=80=9D:=
0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpusetCpus=E2=80=9D:=E2=80=9C=E2=
=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CDeviceCgrou=
pRules=E2=80=9D:null,=E2=80=9CDeviceRequests=E2=80=9D:null,=E2=80=9CDevices=
=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CDnsOptions=E2=80=9D:,=E2=80=9CDn=
sSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=9D:null,=E2=80=9CGroupAdd=E2=80=
=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=9D:0,=E2=80=9CIOMaximumIOps=E2=
=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CIsolation=E2=
=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMemory=E2=80=9D:0,=E2=80=9CKernelM=
emoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:null,=E2=80=9CLogConfig=E2=80=
=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=E2=80=9D:=E2=80=9C=E2=80=9D}=
,=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CMemory=E2=80=9D:0,=E2=80=9CMem=
oryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=E2=80=9D:0,=E2=80=9CMemorySwa=
ppiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=9D:0,=E2=80=9CNetworkMode=E2=80=
=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomKillDisable=E2=80=9D:false,=E2=80=
=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=
=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBindings=E2=80=9D:{},=E2=80=9CPrivi=
leged=E2=80=9D:false,=E2=80=9CPublishAllPorts=E2=80=9D:false,=E2=80=9CReado=
nlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRootfs=E2=80=9D:false,=E2=80=9CRest=
artPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCount=E2=80=9D:0,=E2=80=9CName=E2=
=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecurityOpt=E2=80=9D:null,=E2=80=9CSh=
mSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CUlim=
its=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9C=
VolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumesFrom=E2=80=9D:null=
},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CImage=E2=80=9D:=E2=
=80=9Chello-world=E2=80=9D,=E2=80=9CLabels=E2=80=9D:{},=E2=80=9CNetworkingC=
onfig=E2=80=9D:{=E2=80=9CEndpointsConfig=E2=80=9D:{}},=E2=80=9COnBuild=E2=
=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:false,=E2=80=9CPlatform=E2=80=9D:nu=
ll,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=80=9CTty=E2=80=9D:false,=E2=80=9CU=
ser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumes=E2=80=9D:{},=E2=80=9CWorki=
ngDir=E2=80=9D:=E2=80=9C=E2=80=9D}
> DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state
> [25846.681041] docker0: port 1(veth659d267) entered disabled state
> [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 entere=
d promiscuous mode
> container mounted via layerStore:[25846.681392] audit: type=3D1700 audit(=
1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=3D42949=
67295 uid=3D0 gid=3D0 ses=3D4294967295
> &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300 audit(1=
677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40 a=
0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 auid=
=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0=
 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D =
exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
> 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327 audit(=
1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D44
> aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} containe=
r=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
> DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/containers/4f926=
f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attach?stderr=
=3D1&stdout=3D1&stream=3D1
> DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
> DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
> DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/containers/4f926=
f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?condition=
=3Dnext-exit
> DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/containers/4f926=
f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
> DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore: &{=
/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae5b99=
b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D4f926f032e=
0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
> DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint cra=
zy_bell=E2=80=99s interface on network bridge
> DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/172.17.0=
.0/16, , map)
> DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172.17.0.0/16=
 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits=
: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046)->(0x1, 1=
)->end Curr:3 Serial:false PrefAddress:
> ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespace, =
readlink /proc/1551/task/1555/ns/net: no such file or directory, initns fd =
-1: bad file descriptor
> DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint cra=
zy_bell=E2=80=99s interface on network bridge
> ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespace, =
readlink /proc/1551/task/1555/ns/net: no such file or directory, initns fd =
-1: bad file descriptor
> DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity on=
 endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042=
007ec0ebd3c)
> ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: port =
1(veth659d267) entered disabled state
> to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no suc=
h file or directory, initns fd -1: bad file descriptor
> DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e0566c4dbdfbb=
027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
> DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth659d2=
67 left promiscuous mode
> eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(veth659d2=
67) entered disabled state
> [25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dveth65=
9d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D42949=
67295
> 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
> DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=3D/var/run=
/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.040986] aud=
it: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D206 su=
ccess=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 ppid=
=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=
=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=
=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null=
)
> [25847.041004] audit: type=3D1327 audit(1677113637.488:206): proctitle=3D=
2F7573722F62696E2F646F636B657264002D44
> 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby root=
=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae5=
b99b3bcb65c33ec2f/merged
> ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a cl=
osed fifo
> ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from a cl=
osed fifo
> DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
> DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
> DEBU[2023-02-23T00:53:57.445349705Z] attach done
> DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on en=
dpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007=
ec0ebd3c)
> ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespace, =
readlink /proc/1551/task/1558/ns/net: no such file or directory, initns fd =
-1: bad file descriptor
> ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespace, =
readlink /proc/1551/task/1558/ns/net: no such file or directory, initns fd =
-1: bad file descriptor
> ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespace, =
readlink /proc/1551/task/1558/ns/net: no such file or directory, initns fd =
-1: bad file descriptor
> DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint cra=
zy_bell=E2=80=99s interface on network bridge
> DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/172.17.0=
.0/16, 172.17.0.2)
> DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:LocalDefault=
/172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/data, ID: Loc=
alDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 65532, Sequ=
ence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
> ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb027787b42e6e19=
ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container from conta=
inerd: no such container
> ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/containers/4=
f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start retur=
ned error: failed to create shim task: OCI runtime create failed: runc crea=
te failed: unable to start container process: can=E2=80=99t get final child=
=E2=80=99s PID from pipe: EOF: unknown
> docker: Error response from daemon: failed to create shim task: OCI runti=
me create failed: runc create failed: unable to start container process: ca=
n=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown.
> ERRO[0000] error waiting for container: context canceled
>
>
>
>
> Regards
>
> Simon
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7895): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7895
> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

