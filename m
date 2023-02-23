Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF63C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 02:47:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.2386.1677120466939857879
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 18:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Els2iTTb;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: simonkbaby@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id x34so7868581pjj.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Feb 2023 18:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gDb4IN3DQN+rlOEl2Vpb42WMV0xqBDITHMRfAwc5n+o=;
        b=Els2iTTb8Bo5vMNmrMFBb4zxlOAUPgXmoqaGS5mh6BYYp30WvnEQXYwDCpZosHRNpJ
         sjM6feHzsgbkqgYOGqHrz83wJqjmdMVTc++lPR14TljjEg9ANI5Y+0Srk8g9loKul9Sq
         XGwOrh0NGlk9T6ugQkx2vESiCZ5Jfgh93DgnX4w2ScVeJ7PMDXjyHFcCdc3pRSG7syZn
         OFu87SeTnOR2td2qsZqc2oxcWZcZjamHvmSImE80hVniKwVhZ1ePPySKXjY0a8DTcQGl
         PP8S9TRm8qtmq5qJWKJ+V0olUwQBkfR+2hR1Vp6iONFH1PLkNw1vE+BNn9rDLPudBwC0
         k2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gDb4IN3DQN+rlOEl2Vpb42WMV0xqBDITHMRfAwc5n+o=;
        b=DaLkysvXLdrPfItta+BYt2YBs46OnamWhfu2rI8Um/BCSaWzCAa5RoPon1f7tKxHk0
         WCJtQdzns53o2TG3DxjUtgXpID7QZ2NiwA21myLVadNuIoq3oIXb7HMBr4l0aCFa6lZm
         +2oZLuayuiKIpE24QkQxaCQPAorpYomSZgDSw3w7Pg8k3JclTslT6bJ96NWxebNtpSDX
         GeYrgzm8aoXKwtkwzCzES250pPZTkxOaoM46zwnKVsusIS9WqwGfE4/0qpYrwAMMfQzO
         ns5yYo4PkCHOc9Rx+zKLDyUfUUDd9FG56XE41P6+td3gbULMrsp+BJMx0ttwg4F3svKb
         eU/Q==
X-Gm-Message-State: AO0yUKVF7AAGLngkngxDh/cZEKfTQThWFOe1DO1O+X1LoZqDvBLVEY+/
	VQaaH3EqK0j0jZwvrbANqNVtBc+fVcgE/bi5YfFuf2+Wd/U=
X-Google-Smtp-Source: AK7set+0MYZYe+DNoGjkQYqVoRqdtO6f2IVXwIq+SDTRjzQQOPu5UP62/tebURecFZpM0xYrbJWGPmWoqkD0O1khc24=
X-Received: by 2002:a17:902:dad0:b0:19b:456:6400 with SMTP id
 q16-20020a170902dad000b0019b04566400mr1481058plx.7.1677120465608; Wed, 22 Feb
 2023 18:47:45 -0800 (PST)
MIME-Version: 1.0
From: SIMON BABY <simonkbaby@gmail.com>
Date: Wed, 22 Feb 2023 18:47:34 -0800
Message-ID: <CAEFUPH37BMyGgmUBi4V18u=VGMuzJ5qGkL4zgqG1+mqtrNd_ag@mail.gmail.com>
Subject: query on docker support changes in yocto
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000099257605f5550980"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Feb 2023 02:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7895

--00000000000099257605f5550980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Team,

Can I know what are the changes required in yocto to run docker and
its dependencies  on my target embedded system. I have added the below
changes. Do I need more plugins and packages ?

bblayers.conf:



BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"

BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"

BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"



local.conf:



DISTRO_FEATURES:append =3D " virtualization"

IMAGE_INSTALL:append =3D " docker-ce"



WIth the above changes and tested on the target I am getting the
below error when try to run "docker run hello-world"


root@imx8mpevk:~#* docker run hello-world*
DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/create
DEBU[2023-02-23T00:53:57.069098805Z] form data:
{=E2=80=9CAttachStderr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=
=E2=80=9CAttachStdout=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDom=
ainname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=
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
DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state
[25846.681041] docker0: port 1(veth659d267) entered disabled state
[2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 entered
promiscuous mode
container mounted via layerStore:[25846.681392] audit: type=3D1700
audit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
&{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300
audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=
=3D40
a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 auid=
=3D4294967295
uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=
=3Dttymxc1
ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/d=
ockerd=E2=80=9D key=3D(null)
7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327
audit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D=
44
aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060}
container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d19=
0
DEBU[2023-02-23T00:53:57.184741848Z] Calling POST
/v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbd=
b62d190/attach?stderr=3D1&stdout=3D1&stream=3D1
DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
DEBU[2023-02-23T00:53:57.186340258Z] Calling POST
/v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbd=
b62d190/wait?condition=3Dnext-exit
DEBU[2023-02-23T00:53:57.188347802Z] Calling POST
/v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbd=
b62d190/start
DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore:
&{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae5b=
99b3bcb65c33ec2f/merged
0xaaaabdb0b060 0xaaaabdb0b060}
container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d19=
0
DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint
crazy_bell=E2=80=99s interface on network bridge
DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/
172.17.0.0/16, , map)
DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172.17.0.0/16
App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits:
65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046)->(0x1,
1)->end Curr:3 Serial:false PrefAddress:
* ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespace,
readlink /proc/1551/task/1555/ns/net: no such file or directory, initns fd
-1: bad file descriptor*
DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint
crazy_bell=E2=80=99s interface on network bridge
ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespace,
readlink /proc/1551/task/1555/ns/net: no such file or directory, initns fd
-1: bad file descriptor
DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity on
endpoint crazy_bell
(1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)
ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: port
1(veth659d267) entered disabled state
to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no such
file or directory, initns fd -1: bad file descriptor
DEBU[2023-02-23T00:53:57.304933242Z] EnableService
4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth659d267
left promiscuous mode
eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port
1(veth659d267) entered disabled state
[25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dveth659d=
267
prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created
bundle=3D/var/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[=
25847.040986]
audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D206
success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 ppi=
d=3D409 pid=3D1551
auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=
=3D0 fsgid=3D0
tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=
=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
[25847.041004] audit: type=3D1327 audit(1677113637.488:206):
proctitle=3D2F7573722F62696E2F646F636B657264002D44
6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby
root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa299=
4ae5b99b3bcb65c33ec2f/merged

* ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a
closed fifo ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading
from a closed fifo*
DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
DEBU[2023-02-23T00:53:57.445349705Z] attach done
DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on
endpoint crazy_bell
(1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)
ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespace,
readlink */proc/1551/task/1558/ns/net: no such file or directory, initns fd
-1: bad file descriptor*
*ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespace,
readlink* /proc/1551/task/1558/ns/net: no such file or directory, initns fd
-1: bad file descriptor
ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespace,
readlink /proc/1551/task/1558/ns/net: no such file or directory, initns fd
-1: bad file descriptor
DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint
crazy_bell=E2=80=99s interface on network bridge
DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/
172.17.0.0/16, 172.17.0.2)
DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:LocalDefault/
172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/data, ID:
LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 65532,
Sequence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
* ERRO[2023-02-23T00:53:57.659608292Z]
4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 cleanup:
failed to delete container from containerd: no such container*
*ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST
/v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbd=
b62d190/start
returned error: failed to create shim task: OCI runtime create failed: runc
create failed: unable to start container process: can=E2=80=99t get final c=
hild=E2=80=99s
PID from pipe: EOF: unknown*
*docker: Error response from daemon: failed to create shim task: OCI
runtime create failed: runc create failed: unable to start container
process: can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknow=
n.*
*ERRO[0000] error waiting for container: context canceled*




Regards

Simon

--00000000000099257605f5550980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Team,<div><br></div><div>Can I know what are the cha=
nges required in yocto to run docker and its=C2=A0dependencies=C2=A0 on my =
target embedded system. I have added the below changes. Do I need more plug=
ins and packages ?</div><div><br></div><div><p class=3D"MsoNormal" style=3D=
"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">bblayers.conf:</=
p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-openembedded/meta-networking&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembedded/meta=
-filesystems&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">BBLAYERS +=3D
&quot;${BSPDIR}/sources/meta-virtualization&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">local.conf:</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">DISTRO_FEATURES:append =3D &quot; virtualization&quot;</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">IMAGE_INSTALL:append =3D &quot; docker-ce&quot;</p><p class=
=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-=
serif"><br></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;fo=
nt-family:Calibri,sans-serif"><br></p><p class=3D"MsoNormal" style=3D"margi=
n:0in;font-size:11pt;font-family:Calibri,sans-serif">WIth the above changes=
 and tested on the target I am getting the below=C2=A0error when try to run=
 &quot;docker run hello-world&quot;</p><p class=3D"MsoNormal" style=3D"marg=
in:0in;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"M=
soNormal" style=3D"margin:0in 0in 7.5pt;line-height:18pt;background-image:i=
nitial;background-position:initial;background-size:initial;background-repea=
t:initial;background-origin:initial;background-clip:initial;font-size:11pt;=
font-family:Calibri,sans-serif"><span style=3D"font-size:11.5pt;font-family=
:&quot;Open Sans&quot;,sans-serif;color:rgb(68,93,110)">root@imx8mpevk:~#<b=
> docker run hello-world</b><br>
DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping<br>
DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/containers/create<=
br>
DEBU[2023-02-23T00:53:57.069098805Z] form data:
{=E2=80=9CAttachStderr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=
=E2=80=9CAttachStdout=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDom=
ainname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=
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
=9CVolumes=E2=80=9D:{},=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}<br>
DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking state<br>
[25846.681041] docker0: port 1(veth659d267) entered disabled state<br>
[2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267 entered
promiscuous mode<br>
container mounted via layerStore:[25846.681392] audit: type=3D1700
audit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=
=3D4294967295
uid=3D0 gid=3D0 ses=3D4294967295<br>
&amp;{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300
audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=
=3D40 a0=3Dd
a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 auid=3D42949=
67295 uid=3D0 gid=3D0
euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=
=3D4294967295
comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D k=
ey=3D(null)<br>
7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327
audit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002D=
44<br>
aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060}
container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d19=
0<br>
DEBU[2023-02-23T00:53:57.184741848Z] Calling POST
/v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbd=
b62d190/attach?stderr=3D1&amp;stdout=3D1&amp;stream=3D1<br>
DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin<br>
DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin<br>
DEBU[2023-02-23T00:53:57.186340258Z] Calling POST
/v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbd=
b62d190/wait?condition=3Dnext-exit<br>
DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/containers/4f926f0=
32e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start<br>
DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerStore:
&amp;{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994=
ae5b99b3bcb65c33ec2f/merged
0xaaaabdb0b060 0xaaaabdb0b060}
container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d19=
0<br>
DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpoint
crazy_bell=E2=80=99s interface on network bridge<br>
DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/<a href=3D=
"http://172.17.0.0/16">172.17.0.0/16</a>,
, map)<br>
DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:<a href=3D"http=
://172.17.0.0/16">172.17.0.0/16</a> App:
ipam/default/data, ID: LocalDefault/<a href=3D"http://172.17.0.0/16">172.17=
.0.0/16</a>, DBIndex: 0x0, Bits: 65536,
Unselected: 65533, Sequence: (0xc0000000, 1)-&gt;(0x0, 2046)-&gt;(0x1,
1)-&gt;end Curr:3 Serial:false PrefAddress:<br><b>
ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial namespace,
readlink /proc/1551/task/1555/ns/net: no such file or directory, initns fd =
-1:
bad file descriptor</b><br>
DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpoint
crazy_bell=E2=80=99s interface on network bridge<br>
ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial namespace,
readlink /proc/1551/task/1555/ns/net: no such file or directory, initns fd =
-1:
bad file descriptor<br>
DEBU[2023-02-23T00:53:57.294111754Z] Programming external connectivity on
endpoint crazy_bell
(1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)<br>
ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0: port
1(veth659d267) entered disabled state<br>
to set to initial namespace, readlink /proc/1551/task/1555/ns/net: no such =
file
or directory, initns fd -1: bad file descriptor<br>
DEBU[2023-02-23T00:53:57.304933242Z] EnableService
4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START<br>
DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device veth659d267
left promiscuous mode<br>
eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(veth659d267=
)
entered disabled state<br>
[25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=3Dveth659d=
267
prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295<=
br>
7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE<br>
DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created
bundle=3D/var/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[=
25847.040986]
audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D206
success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 ppi=
d=3D409 pid=3D1551
auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=
=3D0 fsgid=3D0
tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=
=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)<br>
[25847.041004] audit: type=3D1327 audit(1677113637.488:206):
proctitle=3D2F7573722F62696E2F646F636B657264002D44<br>
6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby
root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa299=
4ae5b99b3bcb65c33ec2f/merged<br><b>
ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading from a clos=
ed
fifo<br>
ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading from a clos=
ed
fifo</b><br>
DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end<br>
DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end<br>
DEBU[2023-02-23T00:53:57.445349705Z] attach done<br>
DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivity on endp=
oint
crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3=
c)<br>
ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial namespace,
readlink=C2=A0<b>/proc/1551/task/1558/ns/net: no such file or directory, in=
itns
fd -1: bad file descriptor</b><br>
<b>ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial namespace,
readlink</b>=C2=A0/proc/1551/task/1558/ns/net: no such file or directory,
initns fd -1: bad file descriptor<br>
ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial namespace,
readlink /proc/1551/task/1558/ns/net: no such file or directory, initns fd =
-1:
bad file descriptor<br>
DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpoint
crazy_bell=E2=80=99s interface on network bridge<br>
DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/<a href=3D=
"http://172.17.0.0/16">172.17.0.0/16</a>,
172.17.0.2)<br>
DEBU[2023-02-23T00:53:57.619890544Z] Released address
PoolID:LocalDefault/<a href=3D"http://172.17.0.0/16">172.17.0.0/16</a>, Add=
ress:172.17.0.2 Sequence:App:
ipam/default/data, ID: LocalDefault/<a href=3D"http://172.17.0.0/16">172.17=
.0.0/16</a>, DBIndex: 0x0, Bits: 65536,
Unselected: 65532, Sequence: (0xe0000000, 1)-&gt;(0x0, 2046)-&gt;(0x1,
1)-&gt;end Curr:3<br><b>
ERRO[2023-02-23T00:53:57.659608292Z]
4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 cleanup:
failed to delete container from containerd: no such container</b><br>
<b>ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/containers/=
4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
returned error: failed to create shim task: OCI runtime create failed: runc
create failed: unable to start container process: can=E2=80=99t get final c=
hild=E2=80=99s PID
from pipe: EOF: unknown</b><br>
<b>docker: Error response from daemon: failed to create shim task: OCI runt=
ime
create failed: runc create failed: unable to start container process: can=
=E2=80=99t get
final child=E2=80=99s PID from pipe: EOF: unknown.</b><br>
<b>ERRO[0000] error waiting for container: context canceled</b></span></p><=
p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibr=
i,sans-serif">

</p><p class=3D"MsoNormal" style=3D"margin:0in 0in 12pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p><p class=3D"MsoNormal" style=3D"margi=
n:0in 0in 12pt;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p cl=
ass=3D"MsoNormal" style=3D"margin:0in 0in 12pt;font-size:11pt;font-family:C=
alibri,sans-serif">Regards</p><p class=3D"MsoNormal" style=3D"margin:0in 0i=
n 12pt;font-size:11pt;font-family:Calibri,sans-serif">Simon</p><p class=3D"=
MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-seri=
f"><br></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-f=
amily:Calibri,sans-serif"><br></p></div></div>

--00000000000099257605f5550980--

