Subject: #meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: al.smith@fujitsu.com
X-Originating-Location: Garland, Texas, US (204.253.82.210)
X-Originating-Platform: Windows Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 12:01:40 -0800
Message-ID: <muuz.1605816100888058712.uIJV@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="5wmShH9paC5z95cjxP49"

--5wmShH9paC5z95cjxP49
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to get multicast from docker container to =C2=A0interface on th=
e host.=C2=A0 I have tried docker custom bridge and docker macvlan, but nei=
ther options works.

Custom bridge works enough that the multicast pdus reach the br-xxxx inter=
face, but the packets don=E2=80=99t reach the eth0 host interface. =C2=A0=
=C2=A0I also tried macvlan, but following error was reported during config=
uration.

root@fujitsu:~/aiml# docker network create -d macvlan \

>=C2=A0=C2=A0=C2=A0=C2=A0 --subnet=3D 127.1.0.0/16 ( http://127.1.0.0/16 )=
 --gateway=3D127.1.254.253 \

054:09ff:fe12:0506:0000:0000 \09ff:fe12:0506:0000:0000/64=C2=A0 --gateway=
=3Dfe80:0000:5

>=C2=A0=C2=A0=C2=A0=C2=A0 -o parent=3Deth5.2003 \

>=C2=A0=C2=A0=C2=A0=C2=A0 --ipv6 \

>=C2=A0=C2=A0=C2=A0=C2=A0 macvlan0

cf2348298100754191191a1c70ee1b5da1bd56fca3ec08c977e85a701d7c5019

[33809.124168] eth0: renamed from veth8567d91

parent closed synchronisation channel

docker: Error response from daemon: oci runtime error: container_linux.go:=
247: starting container process caused "process_linux.go:334: running prest=
art hook 0 caused \"error running hook: exit status 1, stdout: , stderr: ti=
me=3D\\\"2020-11-19T06:01:21Z\\\" level=3Dfatal msg=3D\\\"failed to add int=
erface veth8567d91 to sandbox: failed to set link up: device or resource bu=
sy\\\" \\n\ ( file://n/ ) "".

root@fujitsu:~# docker network ls

NETWORK ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NAME=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DRIVER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 SCOPE

2fb1ae8f548a=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 local

b47c9cfdcdb0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 local

354f7a8cc8ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 macvlan0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 macvlan=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local

552abbb95b25=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 none=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 null=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0 local

Other readings suggested to use *pipework* , but this isn=E2=80=99t availa=
ble.

Can you suggest the best way to add pipework to Yocto?=C2=A0 Also, do you =
know if pipework is supported on Yocto 2.3?

There isn't a recipe in metavirtualization layer for pipework.=C2=A0 Any s=
uggestions?

root@fujitsu:~# uname -a

Linux fujitsu 4.9.82-yocto-standard #1 SMP PREEMPT Wed Feb 12 13:59:42 CST=
 2020 x86_64 x86_64 x86_64 GNU/Linux

root@fujitsu:~# docker -v

Docker version 1.13.0, build 49bf474-unsupported

--5wmShH9paC5z95cjxP49
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-margi=
n-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0pt=
; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">I am trying t=
o get multicast from docker container to =C2=A0interface on the host.=C2=A0=
 I have tried docker custom bridge and docker macvlan, but neither options =
works.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">=C2=A0</span=
></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">Custom bridg=
e works enough that the multicast pdus reach the br-xxxx interface, but the=
 packets don=E2=80=99t reach the eth0 host interface. =C2=A0=C2=A0I also tr=
ied macvlan, but following error was reported during configuration.</span><=
/p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">=C2=A0</span=
></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">root@fujitsu=
:~/aiml# docker network create -d macvlan \</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">&gt;=C2=A0=
=C2=A0=C2=A0=C2=A0 --subnet=3D<a href=3D"http://127.1.0.0/16" target=3D"_b=
lank" rel=3D"noopener">127.1.0.0/16</a> --gateway=3D127.1.254.253 \</span><=
/p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">054:09ff:fe1=
2:0506:0000:0000 \09ff:fe12:0506:0000:0000/64=C2=A0 --gateway=3Dfe80:0000:5=
 </span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">&gt;=C2=A0=
=C2=A0=C2=A0=C2=A0 -o parent=3Deth5.2003 \</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">&gt;=C2=A0=
=C2=A0=C2=A0=C2=A0 --ipv6 \</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">&gt;=C2=A0=
=C2=A0=C2=A0=C2=A0 macvlan0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">cf2348298100=
754191191a1c70ee1b5da1bd56fca3ec08c977e85a701d7c5019</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: red;">=C2=A0</span></p=
>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: red;">[33809.124168] e=
th0: renamed from veth8567d91</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: red;">parent closed sy=
nchronisation channel</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: red;">docker: Error re=
sponse from daemon: oci runtime error: container_linux.go:247: starting con=
tainer process caused &#34;process_linux.go:334: running prestart hook 0 ca=
used \&#34;error running hook: exit status 1, stdout: , stderr: time=3D\\\&=
#34;2020-11-19T06:01:21Z\\\&#34; level=3Dfatal msg=3D\\\&#34;failed to add =
interface veth8567d91 to sandbox: failed to set link up: device or resource=
 busy\\\&#34; <a href=3D"file://n/">\\n\</a>&#34;&#34;.</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">=C2=A0</span=
></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">root@fujitsu=
:~# docker network ls</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">NETWORK ID=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NAME=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DRIVER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 SCOPE</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">2fb1ae8f548a=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local</=
span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">b47c9cfdcdb0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0host=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 local</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">354f7a8cc8ec=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 macvlan0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 macvlan=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">552abbb95b25=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 none=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 null=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 local</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">=C2=A0</span=
></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">=C2=A0</span=
></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">Other readin=
gs suggested to use <strong>pipework</strong>, but this isn=E2=80=99t avail=
able.=C2=A0=C2=A0 </span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">Can you sugg=
est the best way to add pipework to Yocto?=C2=A0 Also, do you know if pipew=
ork is supported on Yocto 2.3?</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">=C2=A0There =
isn&#39;t a recipe in metavirtualization layer for pipework.=C2=A0 Any sugg=
estions?<br/><br/></span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">root@fujitsu=
:~# uname -a</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">Linux fujits=
u 4.9.82-yocto-standard #1 SMP PREEMPT Wed Feb 12 13:59:42 CST 2020 x86_64 =
x86_64 x86_64 GNU/Linux</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">root@fujitsu=
:~# docker -v</span></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><span style=3D"font-size: 11.0p=
t; font-family: &#39;Calibri&#39;,sans-serif; color: #1f497d;">Docker versi=
on 1.13.0, build 49bf474-unsupported</span></p>

--5wmShH9paC5z95cjxP49--
