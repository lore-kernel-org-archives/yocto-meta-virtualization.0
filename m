Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE6CC636CC
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 00:51:11 +0000 (UTC)
Subject: Re: query on container demo
To: meta-virtualization@lists.yoctoproject.org
From: "SIMON BABY" <simonkbaby@gmail.com>
X-Originating-Location: San Diego, California, US (130.50.200.1)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Feb 2023 16:51:10 -0800
References: <CADkTA4PKZpAkN=vtAdEkjWr+udfSHEg7NfyeOKcj8qQz27+yww@mail.gmail.com>
In-Reply-To: <CADkTA4PKZpAkN=vtAdEkjWr+udfSHEg7NfyeOKcj8qQz27+yww@mail.gmail.com>
Message-ID: <21754.1676335870049801294@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="VhhvFpHt84RMHeshGKYQ"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 00:51:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7851

--VhhvFpHt84RMHeshGKYQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi bruce,
I was able to build the container image in .tar.bz2 format and able to down=
load into the target as part of root file system. When I tried to=C2=A0 run=
 the image on the target, am getting the bloew error. I used docker import =
command to get the image from .tar.bz2 file. Below is the error. Is this so=
mething related wth permission issue?

[=C2=A0 790.575751] docker0: port 1(veth092c057) entered blocking state

[=C2=A0 790.575813] docker0: port 1(veth092c057) entered disabled state

[=C2=A0 790.576071] device veth092c057 entered promiscuous mode

[=C2=A0 790.576258] audit: type=3D1700 audit(1676334388.308:51): dev=3Dveth=
092c057 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429=
4967295

[=C2=A0 790.578895] audit: type=3D1300 audit(1676334388.308:51): arch=3Dc00=
000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D40004cdef0 a2=3D28 =
a3=3D0 items=3D0 ppid=3D1 pid=3D435 auid=3D4294967295 uid=3D0 gid=3D0 euid=
=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294=
967295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)

[=C2=A0 790.579931] audit: type=3D1327 audit(1676334388.308:51): proctitle=
=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F

[=C2=A0 790.818439] docker0: port 1(veth092c057) entered disabled state

[=C2=A0 790.850282] device veth092c057 left promiscuous mode

[=C2=A0 790.850331] docker0: port 1(veth092c057) entered disabled state

[=C2=A0 790.850350] audit: type=3D1700 audit(1676334388.544:52): dev=3Dveth=
092c057 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429=
4967295

[=C2=A0 790.881294] audit: type=3D1300 audit(1676334388.544:52): arch=3Dc00=
000b7 syscall=3D206 success=3Dyes exit=3D32 a0=3De a1=3D400014da20 a2=3D20 =
a3=3D0 items=3D0 ppid=3D1 pid=3D435 auid=3D4294967295 uid=3D0 gid=3D0 euid=
=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294=
967295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)

[=C2=A0 790.881312] audit: type=3D1327 audit(1676334388.544:52): proctitle=
=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F

*docker: Error response from daemon: failed to create shim task: OCI runtim=
e create failed: runc create failed: unable to start container process: can=
't get final child's PID from pipe: EOF: unknown.*

ERRO[0000] error waiting for container: context canceled

I notice that when I run docker load command, i got the below error. But do=
cker import command was success.

docker load < /usr/bin/container-test-imx8mpevk.tar.bz2

open /var/lib/docker/tmp/docker-import-1198093330/etc/json: no such file or=
 directory

Regards
Simon

--VhhvFpHt84RMHeshGKYQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi bruce,<br/>I was able to build the container image in .tar.bz2 format an=
d able to download into the target as part of root file system. When I trie=
d to=C2=A0 run the image on the target, am getting the bloew error. I used =
docker import command to get the image from .tar.bz2 file. Below is the err=
or. Is this something related wth permission issue?<br/><br/>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.575751] do=
cker0: port 1(veth092c057) entered blocking state</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.575813] do=
cker0: port 1(veth092c057) entered disabled state</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.576071] de=
vice veth092c057 entered promiscuous mode</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.576258] au=
dit: type=3D1700 audit(1676334388.308:51): dev=3Dveth092c057 prom=3D256 old=
_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.578895] au=
dit: type=3D1300 audit(1676334388.308:51): arch=3Dc00000b7 syscall=3D206 su=
ccess=3Dyes exit=3D40 a0=3De a1=3D40004cdef0 a2=3D28 a3=3D0 items=3D0 ppid=
=3D1 pid=3D435 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D=
0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D&#34;doc=
kerd&#34; exe=3D&#34;/usr/bin/dockerd&#34; key=3D(null)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.579931] au=
dit: type=3D1327 audit(1676334388.308:51): proctitle=3D2F7573722F62696E2F64=
6F636B657264002D480066643A2F2F</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.818439] do=
cker0: port 1(veth092c057) entered disabled state</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.850282] de=
vice veth092c057 left promiscuous mode</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.850331] do=
cker0: port 1(veth092c057) entered disabled state</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.850350] au=
dit: type=3D1700 audit(1676334388.544:52): dev=3Dveth092c057 prom=3D0 old_p=
rom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.881294] au=
dit: type=3D1300 audit(1676334388.544:52): arch=3Dc00000b7 syscall=3D206 su=
ccess=3Dyes exit=3D32 a0=3De a1=3D400014da20 a2=3D20 a3=3D0 items=3D0 ppid=
=3D1 pid=3D435 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D=
0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D&#34;doc=
kerd&#34; exe=3D&#34;/usr/bin/dockerd&#34; key=3D(null)</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">[=C2=A0 790.881312] au=
dit: type=3D1327 audit(1676334388.544:52): proctitle=3D2F7573722F62696E2F64=
6F636B657264002D480066643A2F2F</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><strong><span style=3D=
"color: red;">docker: Error response from daemon: failed to create shim tas=
k: OCI runtime create failed: runc create failed: unable to start container=
 process: can&#39;t get final child&#39;s PID from pipe: EOF: unknown.</spa=
n></strong></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">ERRO[0000] error waiti=
ng for container: context canceled<br/><br/>I notice that when I run docker=
 load command, i got the below error. But docker import command was success=
.<br/><br/></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">docker load &lt; /usr/=
bin/container-test-imx8mpevk.tar.bz2</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">open /var/lib/docker/t=
mp/docker-import-1198093330/etc/json: no such file or directory</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><br/>Regards<br/>Simon=
</p>

--VhhvFpHt84RMHeshGKYQ--

