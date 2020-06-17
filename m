Subject: [ Linux 5.4 ] Input file "cfg/virtio.scc" does not exist
To: meta-virtualization@lists.yoctoproject.org
From: "Ashishx88" <ashish.emailaddress@gmail.com>
X-Originating-Location: Alibag, Maharashtra, IN (103.39.247.26)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jun 2020 08:46:00 -0700
Message-ID: <1hYs.1592408760508374105.4D7p@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="in17tccJpWZj2z6gUWA2"

--in17tccJpWZj2z6gUWA2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All ,

Good Evening .
I have been working with poky for some time & started with virtualization =
shortly.
and hence seeked some inputs to understand the layer .

- I am trying to compile linux for version 5.4 with virtualization ( dunfe=
ll branch )
The error being reported is "=C2=A0ERROR. input file "cfg/virtio.scc" does=
 not exist "

- Evaluating further , i was able to check that error was due to *"linux-y=
octo_virtualization.inc"*
which had *KERNEL_FEATURES_append =3D " cfg/virtio.scc"
*
Can member please provide any input or let me know if i have mis-understoo=
d any aspect
of meta-virtualization

a) Why we have=C2=A0=C2=A0linux-yocto_5.4_virtualization.inc specifically =
only for linux-5.4 only.
I was assuming to have similar file for linux-4.19 also , which is not the=
re in layer ?
*[ linux-yocto_5.4_virtualization.inc ] =3D>=C2=A0 [linux-yocto_virtualiza=
tion.inc] =3D> [KERNEL_FEATURES_append =3D " cfg/virtio.scc" ]=3D> [error* =
*"cfg/virtio.scc" ]
*
b) Looking for the file , i found the required file at http://git.yoctopro=
ject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/cfg
But now , i am not sure where is the *"cfg"* folder where i can store the =
file as per KERNEL_FEATURES_append =3D " cfg/virtio.scc"

Can team members please provide any debugging info or let me know if i am =
missing something completely here.

Thanks ,
Ashish

--in17tccJpWZj2z6gUWA2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All ,&nbsp;<br /><br />Good Evening .<br />I have been working with poky=
 for some time &amp; started with virtualization shortly.&nbsp;<br />and he=
nce seeked some inputs to understand the layer .&nbsp;<br />&nbsp;<br />- I=
 am trying to compile linux for version 5.4 with virtualization ( dunfell b=
ranch )<br />&nbsp; The error being reported is "&nbsp;ERROR. input file "c=
fg/virtio.scc" does not exist "&nbsp;&nbsp;<br />&nbsp;<br />- Evaluating f=
urther , i was able to check that error was due to &nbsp;<strong>"linux-yoc=
to_virtualization.inc"</strong>&nbsp; &nbsp;<br />&nbsp; &nbsp;which had&nb=
sp;<strong>KERNEL_FEATURES_append =3D " cfg/virtio.scc"&nbsp;<br /></strong=
><br />Can member please provide any input or let me know if i have mis-und=
erstood any aspect&nbsp;<br />
<div>of meta-virtualization&nbsp;<br /><br />a) Why we have&nbsp;&nbsp;lin=
ux-yocto_5.4_virtualization.inc specifically only for linux-5.4 only.&nbsp;=
<br />&nbsp; &nbsp; I was assuming to have similar file for linux-4.19 also=
 , which is not there in layer ?<br /><strong>[ linux-yocto_5.4_virtualizat=
ion.inc ] =3D&gt;&nbsp; [linux-yocto_virtualization.inc] =3D&gt; [KERNEL_FE=
ATURES_append =3D " cfg/virtio.scc" ]=3D&gt; [error&nbsp;</strong><strong>&=
nbsp;"cfg/virtio.scc" ]<br /></strong><br />b) Looking for the file , i fou=
nd the required file at&nbsp;<a href=3D"http://git.yoctoproject.org/cgit/cg=
it.cgi/yocto-kernel-cache/tree/cfg">http://git.yoctoproject.org/cgit/cgit.c=
gi/yocto-kernel-cache/tree/cfg</a><br />&nbsp; &nbsp; But now , i am not su=
re where is the <strong>"cfg"</strong>&nbsp; folder where i can store the f=
ile as per&nbsp;<span style=3D"font-weight: bold;">KERNEL_FEATURES_append =
=3D " cfg/virtio.scc"&nbsp;<br /></span><br />Can team members please prov=
ide any debugging info or let me know if i am missing something completely =
here.&nbsp;<br /><br />Thanks ,<br />Ashish&nbsp;<br /><br />&nbsp; &nbsp; =
&nbsp;&nbsp;<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br=
 /><br /><br /><br /><br /></div>

--in17tccJpWZj2z6gUWA2--
