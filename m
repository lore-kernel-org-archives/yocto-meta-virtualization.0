Subject: Re: Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: meta-virtualization@lists.yoctoproject.org
From: "Ashish" <ashishm@mvista.com>
X-Originating-Location: Thane, Maharashtra, IN (139.5.45.149)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Jul 2020 21:33:15 -0700
References: <CAEkELtD4H=icOxXrPcqsNCgzpdyQhDtgshvU6Bp6njCNN44SCw@mail.gmail.com>
In-Reply-To: <CAEkELtD4H=icOxXrPcqsNCgzpdyQhDtgshvU6Bp6njCNN44SCw@mail.gmail.com>
Message-ID: <4148.1595392395745845677@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="YLRFWHKS47UvqgH49MV1"

--YLRFWHKS47UvqgH49MV1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddharth ,

1) With inputs from Christopher (@ https://lists.yoctoproject.org/g/meta-v=
irtualization/message/5464 ) ( https://lists.yoctoproject.org/g/meta-virtua=
lization/message/5464 )
we can generate an Xen image with kernel 5.4 following=C2=A0 :
poky: 18b6b2ae819cbf0ef3858944b4cd02ab74df6607
meta-openembedded: 463f9a3ef0935d772a0be0437a8c09df64ed2f07
meta-raspberrypi: 5576a22061864bc451ec4fcacb7d830bf76b7ebd
meta-virtualization: d75bc448866d2b36779251efb1310d0234ece30b

2) On top of meta-virtualization , apply the patches from series Patch[00/=
10] Xen on Raspberry Pi 4 series
You can extract these patches from Christopher's repo @ https://github.com=
/dozylynx/meta-virtualization

3) Configure your local.conf file for rpi-4 architecture
Example from mine :- 271 QEMU_TARGETS =3D"i386 x86_64 aarch64 arm" 272 DIS=
TRO_FEATURES_append =3D " xen virtualization" 273 MACHINE =3D "raspberrypi4=
-64" 274 DL_DIR =3D "/home/ashish/Downloads/poky-tar-files"
4) Generate an image by
$ bitbake -k xen-image-minimal

This should give you an working dom0 image
Hope this helps !

--YLRFWHKS47UvqgH49MV1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddharth ,<br /><br />1) With inputs from&nbsp;<span style=3D"white-spa=
ce: pre-wrap;">Christopher</span>&nbsp;(@&nbsp;<a href=3D"https://lists.yoc=
toproject.org/g/meta-virtualization/message/5464">https://lists.yoctoprojec=
t.org/g/meta-virtualization/message/5464 )&nbsp;</a><br />&nbsp; &nbsp; we =
can generate an Xen image with kernel 5.4 following&nbsp; :<br />&nbsp; &nb=
sp; &nbsp;&nbsp;<span style=3D"white-space: pre-wrap;">poky: 18b6b2ae819cbf=
0ef3858944b4cd02ab74df6607</span><br style=3D"white-space: pre-wrap;" /><sp=
an style=3D"white-space: pre-wrap;"> meta-openembedded: 463f9a3ef0935d772a0=
be0437a8c09df64ed2f07</span><br style=3D"white-space: pre-wrap;" /><span st=
yle=3D"white-space: pre-wrap;"> meta-raspberrypi: 5576a22061864bc451ec4fcac=
b7d830bf76b7ebd</span><br style=3D"white-space: pre-wrap;" /><span style=3D=
"white-space: pre-wrap;"> meta-virtualization: d75bc448866d2b36779251efb131=
0d0234ece30b<br /><br />2) On top of </span><span style=3D"white-space: pre=
-wrap;">meta-virtualization , apply the patches from series Patch[00/10] Xe=
n on Raspberry Pi 4 series<br /></span><span style=3D"white-space: pre-wrap=
;"> You can extract these patches from Christopher's repo @ </span><a href=
=3D"https://github.com/dozylynx/meta-virtualization">https://github.com/do=
zylynx/meta-virtualization</a><span style=3D"white-space: pre-wrap;"><br />=
</span><br /><span style=3D"white-space: pre-wrap;">3) Configure your local=
.conf file for rpi-4 architecture </span><br /><span style=3D"white-space: =
pre-wrap;"> Example from mine :- 271 QEMU_TARGETS =3D"i386 x86_64 aarch64 a=
rm" </span><span style=3D"white-space: pre-wrap;"> </span><span style=3D"wh=
ite-space: pre-wrap;">272 DISTRO_FEATURES_append =3D " xen virtualization" =
</span><span style=3D"white-space: pre-wrap;"> </span><span style=3D"white-=
space: pre-wrap;">273 MACHINE =3D "raspberrypi4-64" </span><span style=3D"w=
hite-space: pre-wrap;"> </span><span style=3D"white-space: pre-wrap;">274 D=
L_DIR =3D "/home/ashish/Downloads/poky-tar-files" </span><br />4) Generate =
an image by&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $ b=
itbake -k xen-image-minimal&nbsp;<br /><br />This should give you an workin=
g dom0 image&nbsp;<br />Hope this helps !

--YLRFWHKS47UvqgH49MV1--
