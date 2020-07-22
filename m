Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.11506.1595389018545767001
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 20:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIwwWt1V;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id z6so1094438iow.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 20:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=64WWdgSdZy3G1YmvulbOKsLT7+FvHzRy8uc591rz3uI=;
        b=iIwwWt1VirxIuJzXD5p85m/519AM/hrKQSkCeqb0NZ1su4LoFardoE5DDI6nJcrR3c
         GQ/p3G784RPTRyCTjiqxPpWbTrDffyI8MmxZt/1J03Nj/ocgF9VOGv3onsBao6TqbCsc
         /sWDoEuH/TKqZxpD1O1kD4VbNVPWTpIZlt9RjVcfjr9BJfgJT4ZSrOk7PQXubDdmlBkx
         3zAA/3LLTYGLtSIx+mTsPy4Evc/UVdMhPyEK00kfNl+3zPd6+nC80ZvcfOvJGrXzdpb7
         Fqekq0YFQaJkUBreDg1ILp+R93tVGl/UScHfky/hVYCgytRqc0afWxFU/Jq86fvWdGEX
         u+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64WWdgSdZy3G1YmvulbOKsLT7+FvHzRy8uc591rz3uI=;
        b=nwBnQJrS64VA1795ZjLNu/Y+m7V4BeGxlGsCqoYOVaNwy4kVbu2gkioLvYfNDA6OgI
         cNdaAWdYuOsFg+48alz/2jdofShdDQWKHwfNrmEu7PtImll0xXXqIhi39c3THaQk2hO5
         R4Iw0+4hIcMpfShgWkywck8b8+tnSqI4SV/QUPScnXK5ioKnnPpSRGJgJlGMxfbMPFEd
         nkOt//HpfrxqtpFzwe3NFpZSxLARO/qsnNAQAD3CQy87E8CMCEtKHedcAcbdxHhyfbxv
         4kVsVGzx+WW9tdhwf+ZOgLkNazX7NTK8fcOWHzXxgvSGTr6fx6knpEdhTDWLdBhja46E
         +1Zw==
X-Gm-Message-State: AOAM5316Y4dnMj0aTn8aGPsH1U5fjfjPvQgmlZ9Zf4gsdDXfd3In6Crp
	xubc/VHo6KZ6zY/aBUG7/+95q3R/Pmxih6zwu7Q=
X-Google-Smtp-Source: ABdhPJyp364AmyJjpRnw673FoOiNxmAS+YNPHgACcp/osbyUvqTMOwprzrWZGyivA0D9uHhtnz9J7W6g751odMaavho=
X-Received: by 2002:a05:6e02:e05:: with SMTP id a5mr29140407ilk.92.1595389017749;
 Tue, 21 Jul 2020 20:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <X89b.1595249396548095111.cJFu@lists.yoctoproject.org>
 <CACMJ4Ga4Cr=GuCKQvJbkoHch_Msm_FgxVCDL4btVyJchxTkwRA@mail.gmail.com>
 <CAEkELtDWJDE93omLuq3cevYnP7d5m73fTzeqZ-0vjuRHCi3wBA@mail.gmail.com> <CACMJ4GZZqfhe679iaGj3H3SWUjHTnhSEXzJoaj7D4K7BQ0tWmw@mail.gmail.com>
In-Reply-To: <CACMJ4GZZqfhe679iaGj3H3SWUjHTnhSEXzJoaj7D4K7BQ0tWmw@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Wed, 22 Jul 2020 09:06:44 +0530
Message-ID: <CAEkELtD4H=icOxXrPcqsNCgzpdyQhDtgshvU6Bp6njCNN44SCw@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ae7cff05aaff731c"

--000000000000ae7cff05aaff731c
Content-Type: text/plain; charset="UTF-8"

Hi sir,

  Actually i built the image using the below repos which you suggested
earlier :

git://git.yoctoproject.org/poky
  18b6b2ae819cbf0ef3858944b4cd02ab74df6607
git://git.openembedded.org/meta-openembedded
  463f9a3ef0935d772a0be0437a8c09df64ed2f07
git://git.yoctoproject.org/meta-raspberrypi
  e589e0f3fda8f15f1093909328605e0bb6516d94
https://github.com/dozylynx/meta-virtualization
  0c809ead05224a61a784744240bb9c125990c481

Shall I download the new latest version directly and build the image again
now?

And I have below lines in the local.conf file:


MACHINE = "raspberrypi4-64"
DISTRO_FEATURES_append = " virtualization xen"
QEMU_TARGETS = "i386 x86_64 aarch64 arm"
PACKAGECONFIG_pn-qemu += " xen fdt"
PACKAGECONFIG_remove_pn-qemu += " sdl"
PREFERRED_VERSION_linux-raspberrypi = "4.19.%"
IMAGE_FSTYPES = "tar.xz tar.bz2 ext3 rpi-sdimg"


This was built almost 2/3 weeks before. Should I download the
meta-virtualization now and build the new image now? Should I take any
particular commit no. or can I download the recipes directly?

Please suggest me what can be done to build the latest version Image please.

Regards,
Siddhartha V



On Wed, 22 Jul, 2020, 1:47 AM Christopher Clark, <
christopher.w.clark@gmail.com> wrote:

> On Tue, Jul 21, 2020 at 11:46 AM siddhartha v
> <siddhuvgowda.18695@gmail.com> wrote:
> >
> > Yes sir it built using kernel 4.19.
> >
> > How can i upgrade it to 5.4 now. Is there any ways? Please suggest ms
> sir.
>
> If you are building with the latest version of meta-virtualization and
> 'xen' is present in DISTRO_FEATURES in your local.conf file, then your
> build configuration should automatically have set kernel version to
> 5.4 as the preferred version. You should just be able to build with
> the current versions of the source code, and then use a SD card
> populated with the new image and new binaries for your guest VM.
>
> The Raspberry Pi kernel, linux-raspberrypi, is set as the preferred
> kernel in meta-raspberrypi when you select the raspberrypi4-64 as
> MACHINE in local.conf, by this:
> ./include/rpi-default-providers.inc:PREFERRED_PROVIDER_virtual/kernel
> ?= "linux-raspberrypi"
>
> The preferred kernel version for that kernel is set by this line in
> meta-virtualization/conf/distro/include/meta-virt-xen.inc :
> PREFERRED_VERSION_linux-raspberrypi ?= "5.4.%"
>
> and the meta-virt-xen.inc file gets included via meta-virtualization's
> layer.conf:
> META_VIRT_XEN_CONFIG_PATH =
> "${LAYERDIR}/conf/distro/include/meta-virt-xen.inc"
> USER_CLASSES_append = " meta-virt-xen-cfg"
>
> Have you overridden the USER_CLASSES variable, or
> PREFERRED_PROVIDER_virtual/kernel or anything related to the above in
> your build configuration files?
>
> Christopher
>
> >
> >
> > Regards,
> > Siddhartha V
> >
> >
> > On Wed, 22 Jul, 2020, 12:11 AM Christopher Clark, <
> christopher.w.clark@gmail.com> wrote:
> >>
> >> On Mon, Jul 20, 2020 at 5:49 AM Siddhartha V
> >> <Siddhuvgowda.18695@gmail.com> wrote:
> >> >
> >> > Hello @Christopher Sir,
> >> >
> >> >          As you suggested I have created the Xen image for RPI4
> Thank you so much. Later I did the below steps:
> >> >
> >> > 1. I used "sudo dd
> if=tmp/deploy/images/raspberrypi4-64/xen-image-minimal-raspberrypi4-64.rpi-sdimg
> of=/dev/sdb bs=4M" command to write theimage to the SDcard and then the
> RPI4 board booted well. And I used few commands ("Referred the pptx that
> shared during the yocto dev-day") and things went well. Thank you so much.
> >>
> >> Excellent.
> >>
> >> > Now I am trying to start the guest now. But I am facing some issues:
> >> >
> >> > I have built the guest image successfully.
> >>
> >> That is good too.
> >>
> >> > Before going to issue, I have one question sir, What is my
> understanding is this:::
> >> >
> >> >   The two files 1. xen-guest-image-minimal-raspberrypi4-64.ext3 and
> 2. Image should be copied to the /home/root/ directory of the Dom-0. Here
> first I should copy them to the USB pendrive and then connecting that to
> the board I should copy them to the board later should create the .config
> file network related settings to be completed to run the guest.  Is my
> understanding correct sir?
> >>
> >> I'm not quite sure. You have two files from your guest image build,
> >> and you should put a copy of each of those into the /home/root/
> >> directory of your running Raspberry Pi.
> >>
> >> It sounds like you're trying to use a USB pendrive to do that, which
> >> may be OK. An alternative option could be to copy the ext3 and Image
> >> files over a network, using a command line tool such as scp.
> >>
> >> > Now below is the issue that I am facing:
> >> >
> >> > 1. I am trying to copy the
> "xen-guest-image-minimal-raspberrypi4-64.ext3" from
> "../build/tmp/work/raspberrypi4_64-poky-linux/xen-guest-image-minimal/1.0-r0/deploy-xen-guest-image-minimal-image-complete/"
> directory to the USB pendrive but getting "Filesystem does not support
> symbolic links" error.
> >>
> >> Instead of copying the symbolic link (or "shortcut thing"), inspect it
> >> to find which file it is linking to, and copy that file instead.
> >>
> >> You may need to rename it once it has been transferred into /home/root
> >> on the Pi, so that it has the same filename as the link had, to match
> >> the instructions in the presentation.
> >>
> >> > 2. Also next I am trying to copy the "Image" from the
> "../build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/deploy-linux-raspberrypi/
> " directory. But here There is no actual image but I have a shortcut thing
> (as shown in the below screenshot). But another file I have
> "Image-1-4.19.126+git0+f6b3ac28f0-r0-raspberrypi4-64-20200624123806.bin"
> which  I can copy that (not sure if I am doing right).
> >>
> >> Hmm. You seem to have built a 4.19 Linux kernel, which doesn't match
> >> the expected version 5.4 Linux kernel that you should have, so I'm not
> >> sure that you are building with all the correct pieces yet.
> >>
> >> Christopher
> >>
> >> >
> >> > Below is the screenshot for the image that I have in that directory.
> >> >
> >> > Kindly suggest me if I have missed anything or doing anything wrong.
> Please.
> >> >
> >> >
> >> > @Ashish sir, Please suggest me if you have any idea on this.
> >> > --
> >> > --
> >> > Best Regards,
> >> > Siddhartha V
> >> >
> 
>

--000000000000ae7cff05aaff731c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi sir,<div dir=3D"auto"><br></div><div =
dir=3D"auto">=C2=A0 Actually i built the image using the below repos which =
you suggested earlier :</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<span style=3D"font-family:sans-serif;font-size:12.8px">git://</span><a hre=
f=3D"http://git.yoctoproject.org/poky" style=3D"text-decoration-line:none;c=
olor:rgb(66,133,244);font-family:sans-serif;font-size:12.8px" target=3D"_bl=
ank">git.yoctoproject.org/poky</a><br style=3D"font-family:sans-serif;font-=
size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8px">=C2=A0=
 18b6b2ae819cbf0ef3858944b4cd02</span><span style=3D"font-family:sans-serif=
;font-size:12.8px">ab74df6607</span><br style=3D"font-family:sans-serif;fon=
t-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8px">git:=
//</span><a href=3D"http://git.openembedded.org/meta-openembedded" style=3D=
"text-decoration-line:none;color:rgb(66,133,244);font-family:sans-serif;fon=
t-size:12.8px" target=3D"_blank">git.openembedded.org/meta-openembedded</a>=
<br style=3D"font-family:sans-serif;font-size:12.8px"><span style=3D"font-f=
amily:sans-serif;font-size:12.8px">=C2=A0 463f9a3ef0935d772a0be0437a8c09</s=
pan><span style=3D"font-family:sans-serif;font-size:12.8px">df64ed2f07</spa=
n><br style=3D"font-family:sans-serif;font-size:12.8px"><span style=3D"font=
-family:sans-serif;font-size:12.8px">git://</span><a href=3D"http://git.yoc=
toproject.org/meta-raspberrypi" style=3D"text-decoration-line:none;color:rg=
b(66,133,244);font-family:sans-serif;font-size:12.8px" target=3D"_blank">gi=
t.yoctoproject.org/meta-raspberrypi</a><br style=3D"font-family:sans-serif;=
font-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8px">=
=C2=A0 e589e0f3fda8f15f1093909328605e</span><span style=3D"font-family:san=
s-serif;font-size:12.8px">0bb6516d94</span><br style=3D"font-family:sans-se=
rif;font-size:12.8px"><a href=3D"https://github.com/dozylynx/meta-virtualiz=
ation" style=3D"text-decoration-line:none;color:rgb(66,133,244);font-family=
:sans-serif;font-size:12.8px" target=3D"_blank">https://github.com/dozylynx=
/meta-virtualization</a><br style=3D"font-family:sans-serif;font-size:12.8p=
x"><span style=3D"font-family:sans-serif;font-size:12.8px">=C2=A0 0c809ead0=
5224a61a784744240bb9c</span><span style=3D"font-family:sans-serif;font-size=
:12.8px">125990c481</span><br style=3D"font-family:sans-serif;font-size:12.=
8px"></div><div dir=3D"auto"><span style=3D"font-family:sans-serif;font-siz=
e:12.8px"><br></span></div><div dir=3D"auto"><span style=3D"font-family:san=
s-serif;font-size:12.8px">Shall I download the new latest version directly =
and build the image again now?</span></div><div dir=3D"auto"><span style=3D=
"font-family:sans-serif;font-size:12.8px"><br></span></div><div dir=3D"auto=
"><span style=3D"font-family:sans-serif;font-size:12.8px">And I have below =
lines in the local.conf file:</span></div><div dir=3D"auto"><span style=3D"=
font-family:sans-serif;font-size:12.8px"><br></span></div><div dir=3D"auto"=
><br>MACHINE =3D &quot;raspberrypi4-64&quot;<br>DISTRO_FEATURES_append =3D =
&quot; virtualization xen&quot;<br>QEMU_TARGETS =3D &quot;i386 x86_64 aarch=
64 arm&quot;<br>PACKAGECONFIG_pn-qemu +=3D &quot; xen fdt&quot;<br>PACKAGEC=
ONFIG_remove_pn-qemu +=3D &quot; sdl&quot;<br>PREFERRED_VERSION_linux-raspb=
errypi =3D &quot;4.19.%&quot;<br>IMAGE_FSTYPES =3D &quot;tar.xz tar.bz2 ext=
3 rpi-sdimg&quot;<span style=3D"font-family:sans-serif;font-size:12.8px"><b=
r></span></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
>This was built almost 2/3 weeks before. Should I download the meta-virtual=
ization now and build the new image now? Should I take any particular commi=
t no. or can I download the recipes directly?</div><div><br></div><div>Plea=
se suggest me what can be done to build the latest version Image please.</d=
iv><div><br></div><div>Regards,</div><div>Siddhartha V=C2=A0</div><div dir=
=3D"auto"><span style=3D"font-family:sans-serif;font-size:12.8px"><br></sp=
an></div><div dir=3D"auto"><span style=3D"font-family:sans-serif;font-size:=
12.8px"><br></span></div></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 22 Jul, 2020, 1:47 AM Christopher Cl=
ark, &lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank"=
>christopher.w.clark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Tue, Jul 21, 2020 at 11:46 AM siddhartha v=
<br>
&lt;<a href=3D"mailto:siddhuvgowda.18695@gmail.com" rel=3D"noreferrer" tar=
get=3D"_blank">siddhuvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Yes sir it built using kernel 4.19.<br>
&gt;<br>
&gt; How can i upgrade it to 5.4 now. Is there any ways? Please suggest ms=
 sir.<br>
<br>
If you are building with the latest version of meta-virtualization and<br>
&#39;xen&#39; is present in DISTRO_FEATURES in your local.conf file, then =
your<br>
build configuration should automatically have set kernel version to<br>
5.4 as the preferred version. You should just be able to build with<br>
the current versions of the source code, and then use a SD card<br>
populated with the new image and new binaries for your guest VM.<br>
<br>
The Raspberry Pi kernel, linux-raspberrypi, is set as the preferred<br>
kernel in meta-raspberrypi when you select the raspberrypi4-64 as<br>
MACHINE in local.conf, by this:<br>
./include/rpi-default-providers.inc:PREFERRED_PROVIDER_virtual/kernel<br>
?=3D &quot;linux-raspberrypi&quot;<br>
<br>
The preferred kernel version for that kernel is set by this line in<br>
meta-virtualization/conf/distro/include/meta-virt-xen.inc :<br>
PREFERRED_VERSION_linux-raspberrypi ?=3D &quot;5.4.%&quot;<br>
<br>
and the meta-virt-xen.inc file gets included via meta-virtualization&#39;s=
<br>
layer.conf:<br>
META_VIRT_XEN_CONFIG_PATH =3D &quot;${LAYERDIR}/conf/distro/include/meta-v=
irt-xen.inc&quot;<br>
USER_CLASSES_append =3D &quot; meta-virt-xen-cfg&quot;<br>
<br>
Have you overridden the USER_CLASSES variable, or<br>
PREFERRED_PROVIDER_virtual/kernel or anything related to the above in<br>
your build configuration files?<br>
<br>
Christopher<br>
<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Siddhartha V<br>
&gt;<br>
&gt;<br>
&gt; On Wed, 22 Jul, 2020, 12:11 AM Christopher Clark, &lt;<a href=3D"mail=
to:christopher.w.clark@gmail.com" rel=3D"noreferrer" target=3D"_blank">chri=
stopher.w.clark@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jul 20, 2020 at 5:49 AM Siddhartha V<br>
&gt;&gt; &lt;<a href=3D"mailto:Siddhuvgowda.18695@gmail.com" rel=3D"norefe=
rrer" target=3D"_blank">Siddhuvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello @Christopher Sir,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 As you suggested I have cr=
eated the Xen image for RPI4=C2=A0 Thank you so much. Later I did the below=
 steps:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1. I used &quot;sudo dd if=3Dtmp/deploy/images/raspberrypi4-=
64/xen-image-minimal-raspberrypi4-64.rpi-sdimg of=3D/dev/sdb bs=3D4M&quot; =
command to write theimage to the SDcard and then the RPI4 board booted well=
. And I used few commands (&quot;Referred the pptx that shared during the y=
octo dev-day&quot;) and things went well. Thank you so much.<br>
&gt;&gt;<br>
&gt;&gt; Excellent.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Now I am trying to start the guest now. But I am facing some=
 issues:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have built the guest image successfully.<br>
&gt;&gt;<br>
&gt;&gt; That is good too.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Before going to issue, I have one question sir, What is my u=
nderstanding is this:::<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0The two files 1. xen-guest-image-minimal-raspber=
rypi4-64.ext3 and 2. Image should be copied to the /home/root/ directory of=
 the Dom-0. Here first I should copy them to the USB pendrive and then conn=
ecting that to the board I should copy them to the board later should creat=
e the .config file network related settings to be completed to run the gues=
t.=C2=A0 Is my understanding correct sir?<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not quite sure. You have two files from your guest image =
build,<br>
&gt;&gt; and you should put a copy of each of those into the /home/root/<b=
r>
&gt;&gt; directory of your running Raspberry Pi.<br>
&gt;&gt;<br>
&gt;&gt; It sounds like you&#39;re trying to use a USB pendrive to do that=
, which<br>
&gt;&gt; may be OK. An alternative option could be to copy the ext3 and Im=
age<br>
&gt;&gt; files over a network, using a command line tool such as scp.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Now below is the issue that I am facing:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1. I am trying to copy the &quot;xen-guest-image-minimal-ras=
pberrypi4-64.ext3&quot; from &quot;../build/tmp/work/raspberrypi4_64-poky-l=
inux/xen-guest-image-minimal/1.0-r0/deploy-xen-guest-image-minimal-image-co=
mplete/&quot; directory to the USB pendrive but getting &quot;Filesystem do=
es not support symbolic links&quot; error.<br>
&gt;&gt;<br>
&gt;&gt; Instead of copying the symbolic link (or &quot;shortcut thing&quo=
t;), inspect it<br>
&gt;&gt; to find which file it is linking to, and copy that file instead.<=
br>
&gt;&gt;<br>
&gt;&gt; You may need to rename it once it has been transferred into /home=
/root<br>
&gt;&gt; on the Pi, so that it has the same filename as the link had, to m=
atch<br>
&gt;&gt; the instructions in the presentation.<br>
&gt;&gt;<br>
&gt;&gt; &gt; 2. Also next I am trying to copy the &quot;Image&quot; from =
the &quot;../build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_=
4.19.126+gitAUTOINC+f6b3ac28f0-r0/deploy-linux-raspberrypi/ &quot; director=
y. But here There is no actual image but I have a shortcut thing (as shown =
in the below screenshot). But another file I have &quot;Image-1-4.19.126+gi=
t0+f6b3ac28f0-r0-raspberrypi4-64-20200624123806.bin&quot; which=C2=A0 I can=
 copy that (not sure if I am doing right).<br>
&gt;&gt;<br>
&gt;&gt; Hmm. You seem to have built a 4.19 Linux kernel, which doesn&#39;=
t match<br>
&gt;&gt; the expected version 5.4 Linux kernel that you should have, so I&=
#39;m not<br>
&gt;&gt; sure that you are building with all the correct pieces yet.<br>
&gt;&gt;<br>
&gt;&gt; Christopher<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Below is the screenshot for the image that I have in that di=
rectory.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Kindly suggest me if I have missed anything or doing anythin=
g wrong. Please.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @Ashish sir, Please suggest me if you have any idea on this.=
<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Best Regards,<br>
&gt;&gt; &gt; Siddhartha V<br>
&gt;&gt; &gt; <br>
<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--000000000000ae7cff05aaff731c--
