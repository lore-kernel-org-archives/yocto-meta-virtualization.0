Subject: Docker 20.10.3 breaks due to iptables v1.8.7 (legacy) incompatibility #meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: "Stephen" <stephibb@amazon.co.uk>
X-Originating-Location: Frankfurt am Main, Hesse, DE (54.239.6.188)
X-Originating-Platform: Mac Chrome 94
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Sep 2021 07:41:37 -0700
Message-ID: <sR4y.1633012897405396850.uLez@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="pNP83mkBTHZn8DeDs2yZ"

--pNP83mkBTHZn8DeDs2yZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all!

The current meta-virtualisation docker is incompatible with the legacy v1.8=
.7 iptables.

Docker version 20.10.3, build 41b3ea7e47 http://layers.openembedded.org/lay=
erindex/recipe/176817/

iptables v1.8.7 (legacy) https://git.yoctoproject.org/cgit.cgi/poky/plain/m=
eta/recipes-extended/iptables/

level=3Dinfo time=3D2021-09-30T08:58:56Z msg=3D"TaskHandler: Sending task c=
hange: TaskChange: [arn:aws:ecs:eu-west-1:116589935960:task/GravitonID-ecs-=
ECSGra viton2DA545608-tzdG3bupgLcn/ef8d9ea15a434c298a9623551d39c6ab -> STOP=
PED, Known Sent: NONE, PullStartedAt: 2021-09-30 08:58:55.809460935 +0000 U=
TC m=3D+5 2315.765706001, PullStoppedAt: 2021-09-30 08:58:55.919351717 +000=
0 UTC m=3D+52315.875596782, ExecutionStoppedAt: 2021-09-30 08:58:56.1593565=
52 +0000 UTC m=3D+52316.115601617, container change: arn:aws:ecs:eu-west-1:=
116589935960:task/GravitonID-ecs-ECSGraviton2DA545608-tzdG3bupgLcn/ef8d9ea1=
5a434c298a9623 551d39c6ab web -> STOPPED, Reason CannotStartContainerError:=
 Error response from daemon: driver failed programming external connectivit=
y on endpoint e cs-GravitonIDecsTaskDefA2CA7A76-4-web-9eb9aba094eccadb1300 =
(db13dc1931d5be70284cac4de6899246035db8e5f9e0cf9ee3773000801a70b0): ( *ipta=
bles failed: ipta bles --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8080 -=
j DNAT --to-destination 172.17.0.2:3000 ! -i docker0: iptables v1.8.7 (lega=
cy): unknown optio n \"--to-destination\"\nTry `iptables -h' or 'iptables -=
-help' for more information.\n (exit status 2))* , Known Sent: NONE] sent: =
false" module=3Dtask_ha ndler_types.go

Possibly linked to this issue and nftables support? https://github.com/moby=
/moby/issues/38099

Any ideas for workarounds would be very much appreciated!

--pNP83mkBTHZn8DeDs2yZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello all!<br /><br />The current meta-virtualisation docker is incompat=
ible with the legacy v1.8.7 iptables.<br /><br />Docker version 20.10.3, bu=
ild 41b3ea7e47&nbsp;<a style=3D"background-color: #ffffff;" href=3D"http://=
layers.openembedded.org/layerindex/recipe/176817/" target=3D"_blank" rel=3D=
"noopener">http://layers.openembedded.org/layerindex/recipe/176817/</a></p>
<p>iptables v1.8.7 (legacy)&nbsp;<a href=3D"https://git.yoctoproject.org/cg=
it.cgi/poky/plain/meta/recipes-extended/iptables/" target=3D"_blank" rel=3D=
"noopener">https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-ex=
tended/iptables/</a>&nbsp;<br /><br />level=3Dinfo time=3D2021-09-30T08:58:=
56Z msg=3D"TaskHandler: Sending task change: TaskChange: [arn:aws:ecs:eu-we=
st-1:116589935960:task/GravitonID-ecs-ECSGra viton2DA545608-tzdG3bupgLcn/ef=
8d9ea15a434c298a9623551d39c6ab -&gt; STOPPED, Known Sent: NONE, PullStarted=
At: 2021-09-30 08:58:55.809460935 +0000 UTC m=3D+5 2315.765706001, PullStop=
pedAt: 2021-09-30 08:58:55.919351717 +0000 UTC m=3D+52315.875596782, Execut=
ionStoppedAt: 2021-09-30 08:58:56.159356552 +0000 UTC m=3D+52316.115601617,=
 container change: arn:aws:ecs:eu-west-1:116589935960:task/GravitonID-ecs-E=
CSGraviton2DA545608-tzdG3bupgLcn/ef8d9ea15a434c298a9623 551d39c6ab web -&gt=
; STOPPED, Reason CannotStartContainerError: Error response from daemon: dr=
iver failed programming external connectivity on endpoint e cs-GravitonIDec=
sTaskDefA2CA7A76-4-web-9eb9aba094eccadb1300 (db13dc1931d5be70284cac4de68992=
46035db8e5f9e0cf9ee3773000801a70b0): (<strong>iptables failed: ipta bles --=
wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8080 -j DNAT --to-destination 1=
72.17.0.2:3000 ! -i docker0: iptables v1.8.7 (legacy): unknown optio n \"--=
to-destination\"\nTry `iptables -h' or 'iptables --help' for more informati=
on.\n (exit status 2))</strong>, Known Sent: NONE] sent: false" module=3Dta=
sk_ha ndler_types.go<br /><br />Possibly linked to this issue and nftables =
support?&nbsp;<a href=3D"https://github.com/moby/moby/issues/38099" target=
=3D"_blank" rel=3D"noopener">https://github.com/moby/moby/issues/38099</a>&=
nbsp;<br /><br />Any ideas for workarounds would be very much appreciated!<=
br /><br /></p>

--pNP83mkBTHZn8DeDs2yZ--
