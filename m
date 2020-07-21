Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.2292.1595357186530953065
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 11:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hxVMncpV;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id l1so22513789ioh.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJUp4XKTNhIhYuQ89SrDoLMCjLWynwX2thn2bmHdi+Q=;
        b=hxVMncpVRXnzNvV988YXxR645MRwzHs9p0lsvWXIlPWchBFWZsxkTGjQ/Dk0Fmt5YS
         +ENmhnK/jPIk5iQnWLZzFiDooetslzWRMO+ex5dhx7sVRaZtH44nw+TRvOD+4cEDRCBK
         HbL+D72GYDULZXa8Wy/2tewkulZXKTKBlZOYpv12p9LR9w8fgEJ2h7e5ohiZq/8ozCPn
         dcKLJRBEL7/G9s5YrdD7YzXwgMaVmpu5aGAE9klU0TIIFdVI5wzTAERCxknteGIBSUGP
         VGAkVMc/2GRlxqYzJ6CbXofIUUrR25xlqcrf34fOyg6bjISajESz9sjPjVpLXMwj2oFL
         y+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJUp4XKTNhIhYuQ89SrDoLMCjLWynwX2thn2bmHdi+Q=;
        b=B1JbqY3QaSd3z019MNCfDg086aMnWwnSAdCY6dkoZnYrszSV5dSaUEz5ekaOMPqKjn
         G1lfQID0OBK1uUXSGqn54yE/nW/k6sPRl15CvO0krUU1Fg3kCfFrfHwLvX7bje63sdvv
         9V8VgM9Ir2C5jeQmOUk58p2BYrg+DqezRIEodfdi0FwNKgxho54a76LkT/aJ2UmbQ/hr
         uyemgXH6buxnYkpL+Afz+gigVxDxdpFMA8rsV5g7vyc24iVEPyfx/APN+eX//UHtr0Zm
         hDJNtwVqdtDVBU4p/3UqXtv24/ZBPB3kIxs0qoZZcErcpFkds1e52Iz4e7NRhBC4Z3lL
         aKrw==
X-Gm-Message-State: AOAM53046j8r9Oly0JFCKTFqwFK+PqBQpNQG/t+bJ0jUPEUy6jkBhc5Z
	Y8XWMCq9hFne7MZ0audsdLuRXSSwc40yk4zQURc=
X-Google-Smtp-Source: ABdhPJwQAq4Z+ErUxSmvwnMo7E9k75iV7eElfvRBQKteARZTsiOHy7EYLPGhxc+5Tz9lC2Z7ejlwOw1YDiswq2fgA6Q=
X-Received: by 2002:a02:cc53:: with SMTP id i19mr4294863jaq.33.1595357185835;
 Tue, 21 Jul 2020 11:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <X89b.1595249396548095111.cJFu@lists.yoctoproject.org> <CACMJ4Ga4Cr=GuCKQvJbkoHch_Msm_FgxVCDL4btVyJchxTkwRA@mail.gmail.com>
In-Reply-To: <CACMJ4Ga4Cr=GuCKQvJbkoHch_Msm_FgxVCDL4btVyJchxTkwRA@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Wed, 22 Jul 2020 00:16:14 +0530
Message-ID: <CAEkELtDWJDE93omLuq3cevYnP7d5m73fTzeqZ-0vjuRHCi3wBA@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005a072405aaf80a48"

--0000000000005a072405aaf80a48
Content-Type: text/plain; charset="UTF-8"

Yes sir it built using kernel 4.19.

How can i upgrade it to 5.4 now. Is there any ways? Please suggest ms sir.


Regards,
Siddhartha V


On Wed, 22 Jul, 2020, 12:11 AM Christopher Clark, <
christopher.w.clark@gmail.com> wrote:

> On Mon, Jul 20, 2020 at 5:49 AM Siddhartha V
> <Siddhuvgowda.18695@gmail.com> wrote:
> >
> > Hello @Christopher Sir,
> >
> >          As you suggested I have created the Xen image for RPI4  Thank
> you so much. Later I did the below steps:
> >
> > 1. I used "sudo dd
> if=tmp/deploy/images/raspberrypi4-64/xen-image-minimal-raspberrypi4-64.rpi-sdimg
> of=/dev/sdb bs=4M" command to write theimage to the SDcard and then the
> RPI4 board booted well. And I used few commands ("Referred the pptx that
> shared during the yocto dev-day") and things went well. Thank you so much.
>
> Excellent.
>
> > Now I am trying to start the guest now. But I am facing some issues:
> >
> > I have built the guest image successfully.
>
> That is good too.
>
> > Before going to issue, I have one question sir, What is my understanding
> is this:::
> >
> >   The two files 1. xen-guest-image-minimal-raspberrypi4-64.ext3 and 2.
> Image should be copied to the /home/root/ directory of the Dom-0. Here
> first I should copy them to the USB pendrive and then connecting that to
> the board I should copy them to the board later should create the .config
> file network related settings to be completed to run the guest.  Is my
> understanding correct sir?
>
> I'm not quite sure. You have two files from your guest image build,
> and you should put a copy of each of those into the /home/root/
> directory of your running Raspberry Pi.
>
> It sounds like you're trying to use a USB pendrive to do that, which
> may be OK. An alternative option could be to copy the ext3 and Image
> files over a network, using a command line tool such as scp.
>
> > Now below is the issue that I am facing:
> >
> > 1. I am trying to copy the
> "xen-guest-image-minimal-raspberrypi4-64.ext3" from
> "../build/tmp/work/raspberrypi4_64-poky-linux/xen-guest-image-minimal/1.0-r0/deploy-xen-guest-image-minimal-image-complete/"
> directory to the USB pendrive but getting "Filesystem does not support
> symbolic links" error.
>
> Instead of copying the symbolic link (or "shortcut thing"), inspect it
> to find which file it is linking to, and copy that file instead.
>
> You may need to rename it once it has been transferred into /home/root
> on the Pi, so that it has the same filename as the link had, to match
> the instructions in the presentation.
>
> > 2. Also next I am trying to copy the "Image" from the
> "../build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+gitAUTOINC+f6b3ac28f0-r0/deploy-linux-raspberrypi/
> " directory. But here There is no actual image but I have a shortcut thing
> (as shown in the below screenshot). But another file I have
> "Image-1-4.19.126+git0+f6b3ac28f0-r0-raspberrypi4-64-20200624123806.bin"
> which  I can copy that (not sure if I am doing right).
>
> Hmm. You seem to have built a 4.19 Linux kernel, which doesn't match
> the expected version 5.4 Linux kernel that you should have, so I'm not
> sure that you are building with all the correct pieces yet.
>
> Christopher
>
> >
> > Below is the screenshot for the image that I have in that directory.
> >
> > Kindly suggest me if I have missed anything or doing anything wrong.
> Please.
> >
> >
> > @Ashish sir, Please suggest me if you have any idea on this.
> > --
> > --
> > Best Regards,
> > Siddhartha V
> > 
>

--0000000000005a072405aaf80a48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yes sir it built using kernel 4.19.<div dir=3D"auto"=
><br></div><div dir=3D"auto">How can i upgrade=C2=A0it to 5.4 now. Is there=
 any ways? Please suggest ms sir.=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Regards,=C2=A0</div><div dir=3D=
"auto">Siddhartha V=C2=A0</div><br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 22 Jul, 2020, 12:11 AM Christopher C=
lark, &lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.cl=
ark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon=
, Jul 20, 2020 at 5:49 AM Siddhartha V<br>
&lt;<a href=3D"mailto:Siddhuvgowda.18695@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">Siddhuvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello @Christopher Sir,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 As you suggested I have created the=
 Xen image for RPI4=C2=A0 Thank you so much. Later I did the below steps:<b=
r>
&gt;<br>
&gt; 1. I used &quot;sudo dd if=3Dtmp/deploy/images/raspberrypi4-64/xen-im=
age-minimal-raspberrypi4-64.rpi-sdimg of=3D/dev/sdb bs=3D4M&quot; command t=
o write theimage to the SDcard and then the RPI4 board booted well. And I u=
sed few commands (&quot;Referred the pptx that shared during the yocto dev-=
day&quot;) and things went well. Thank you so much.<br>
<br>
Excellent.<br>
<br>
&gt; Now I am trying to start the guest now. But I am facing some issues:<=
br>
&gt;<br>
&gt; I have built the guest image successfully.<br>
<br>
That is good too.<br>
<br>
&gt; Before going to issue, I have one question sir, What is my understand=
ing is this:::<br>
&gt;<br>
&gt;=C2=A0 =C2=A0The two files 1. xen-guest-image-minimal-raspberrypi4-64.=
ext3 and 2. Image should be copied to the /home/root/ directory of the Dom-=
0. Here first I should copy them to the USB pendrive and then connecting th=
at to the board I should copy them to the board later should create the .co=
nfig file network related settings to be completed to run the guest.=C2=A0 =
Is my understanding correct sir?<br>
<br>
I&#39;m not quite sure. You have two files from your guest image build,<br=
>
and you should put a copy of each of those into the /home/root/<br>
directory of your running Raspberry Pi.<br>
<br>
It sounds like you&#39;re trying to use a USB pendrive to do that, which<b=
r>
may be OK. An alternative option could be to copy the ext3 and Image<br>
files over a network, using a command line tool such as scp.<br>
<br>
&gt; Now below is the issue that I am facing:<br>
&gt;<br>
&gt; 1. I am trying to copy the &quot;xen-guest-image-minimal-raspberrypi4=
-64.ext3&quot; from &quot;../build/tmp/work/raspberrypi4_64-poky-linux/xen-=
guest-image-minimal/1.0-r0/deploy-xen-guest-image-minimal-image-complete/&q=
uot; directory to the USB pendrive but getting &quot;Filesystem does not su=
pport symbolic links&quot; error.<br>
<br>
Instead of copying the symbolic link (or &quot;shortcut thing&quot;), insp=
ect it<br>
to find which file it is linking to, and copy that file instead.<br>
<br>
You may need to rename it once it has been transferred into /home/root<br>
on the Pi, so that it has the same filename as the link had, to match<br>
the instructions in the presentation.<br>
<br>
&gt; 2. Also next I am trying to copy the &quot;Image&quot; from the &quot=
;../build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_4.19.126+=
gitAUTOINC+f6b3ac28f0-r0/deploy-linux-raspberrypi/ &quot; directory. But he=
re There is no actual image but I have a shortcut thing (as shown in the be=
low screenshot). But another file I have &quot;Image-1-4.19.126+git0+f6b3ac=
28f0-r0-raspberrypi4-64-20200624123806.bin&quot; which=C2=A0 I can copy tha=
t (not sure if I am doing right).<br>
<br>
Hmm. You seem to have built a 4.19 Linux kernel, which doesn&#39;t match<b=
r>
the expected version 5.4 Linux kernel that you should have, so I&#39;m not=
<br>
sure that you are building with all the correct pieces yet.<br>
<br>
Christopher<br>
<br>
&gt;<br>
&gt; Below is the screenshot for the image that I have in that directory.<=
br>
&gt;<br>
&gt; Kindly suggest me if I have missed anything or doing anything wrong. =
Please.<br>
&gt;<br>
&gt;<br>
&gt; @Ashish sir, Please suggest me if you have any idea on this.<br>
&gt; --<br>
&gt; --<br>
&gt; Best Regards,<br>
&gt; Siddhartha V<br>
&gt; <br>
</blockquote></div></div></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--0000000000005a072405aaf80a48--
