Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.7823.1591163578065965547
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 22:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iDkuCP6f;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id a13so1307392ilh.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2020 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=vTLwBc6YmkbXpzwLBdlJ9QnfJaWj3/satQrtuf8wiDQ=;
        b=iDkuCP6fQWsly2yroSBYye2AkNE4PIn8VrlDqVkVY7S7FO3f1S7z0VRMuvQclUIjPv
         Kj4kyCI6nstPMRrjF+de5lg2Hyl3LWZpYK9EyURfIj2qYYUhxB2/D97SNi7fzYCTneyW
         HMtcK3fTmIgfflrsoK17KNMra2Z/a1L9KWYUqVyRTwmqdl/dAIlmCb4Qdz71BPLYKins
         5gXO1YkGdcSwB56gUUWkkLwjFq9TYnqHyoepKGG8hRGuKyB11ugzIKQkSPooyKJRetMJ
         pecmcWVge6IVXXj+M0kaGy6f9wYJvI/e40NYWvyX/1NZzv2KSfw3/kwCsvrnEZ+6Kmqr
         RKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vTLwBc6YmkbXpzwLBdlJ9QnfJaWj3/satQrtuf8wiDQ=;
        b=RXfDGGhWGyHUg8gsqZxJhS6Pg6PsPtN/sUEQdJshVaURDN/SP22eb+XAyotFvazXu6
         7OEupZKsl3b1WHyB4P0UYchsERy630+b93k4pWQJoa1QZkEIGxa4zzbbyngabu9vRPFd
         D1nszjxdtVpEJ0y9+RjRRR9CEmeFUTuQ+8W/HntbWmn04UbRgj8/FAzeY0BftoDnD5Cv
         Zy3wKlBWZzRsO+mTocqn/oKyK7rsIbmC8pgK8AINaZp7sxueciptGUY1sEh51D8PeKOz
         WcSRQ13ghCjQ+TXwYJMW+B/ZS+J6VKppgEojARrStVAAcofA5/fTf91/5tcHEw9SlZTf
         ds2A==
X-Gm-Message-State: AOAM533+0wcU40dB5Of9WhKwnVDimbgORZiTp6TOL6990xC0krui5RMO
	xz0B9+ZAU3r0oVxsIAWXHxZjd50eEipf2w7xzc8=
X-Google-Smtp-Source: ABdhPJzqjA4QteIhWLg84QnrEyew8sCjKTQYpev4yxpk72eaNQ0RFYSaOFo03BLxgzWpMnJ0xnOTQDQnpLygGeWo5B8=
X-Received: by 2002:a92:db0b:: with SMTP id b11mr2369833iln.90.1591163577386;
 Tue, 02 Jun 2020 22:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
 <8542.1590987130301454950@lists.yoctoproject.org> <CA+yZB6ZfxhoQU_PhU=zKu0snF5vLj2xOg3T86sR-YoLq8AmhNg@mail.gmail.com>
In-Reply-To: <CA+yZB6ZfxhoQU_PhU=zKu0snF5vLj2xOg3T86sR-YoLq8AmhNg@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Wed, 3 Jun 2020 11:22:45 +0530
Message-ID: <CAEkELtAEYX35tcSh7U9J57+oPx+mTZ=nGDvDHVzB9QW-w8zeng@mail.gmail.com>
Subject: Re: [meta-virtualization] Failure to build xen-image-minimal. Yocto bitbake failed @99% while building xen-minimal-image
To: Aljoscha Lautenbach <aljoscha.lautenbach@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cf4cd805a727a31a"

--000000000000cf4cd805a727a31a
Content-Type: text/plain; charset=UTF-8

Hello @ Aljoscha Lautenbach sir,

Yes RPI3 doesn't support the xen as there is no GIC. Whereas RPI4 has GIC400 we can run xen. I am actually working RPI4.

This is the first time I am working with yocto and xen. I literally a newbee to this topic. I gone through the thread that you have shared with me thank you so much.

But as I am  seeing many things for the first time here. I will sure work on your inputs. If I found anything new strange issue or any problem i will let you know based on that.

I will go through how to add them mannually and another point i noticed there was that own layer stuff but I really don't know how to do it. But sure i will give my best and will try to achieve it.

Meanwhile may I get any link or reference material so that I can read and learn regarding yocto and xen please.

Any suggestions will be much helpful for me sir.

Regards,
Siddhartha V

On Mon, Jun 1, 2020 at 10:39 PM Aljoscha Lautenbach < aljoscha.lautenbach@gmail.com > wrote:

> 
> Hi Siddhartha,
> 
> I don't know if this is your problem, but it might be. Three months
> ago I had more or less the same question for the Raspberry-Pi 3, you
> might want to read that thread:
> https://lists.yoctoproject.org/g/yocto/topic/71688106#48662
> 
> The problem was that the meta-raspberrypi layer uses an incompatible
> kernel recipe, so you have to manually update it. To quote myself from
> the thread above:
> "If I understand you correctly, I need to add a
> linux-raspberrypi_4.19.bbappend file in my own layer that applies the
> Xen configuration fragments."
> 
> I later found out that the Raspberry-Pi 3 is not supported by XEN
> since it has an incompatible GIC, but that was a different problem. ;)
> 
> Best regards,
> Aljoscha

--
Best Regards,
Siddhartha V

--000000000000cf4cd805a727a31a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello @<a class=3D"Oux49" style=3D"-webkit-tap-highlight-c=
olor: transparent; color: #202124; font-family: 'Google Sans', Roboto, sans=
-serif; font-size: 22px; line-height: 28px; overflow: hidden; white-space: =
nowrap; background-color: #ffffff;"><span data-tooltip=3D"" data-tooltip-po=
sition=3D"top" class=3D"UXkSbf" jsname=3D"BXecsc" style=3D"-webkit-tap-high=
light-color: transparent; font-size: 18px; line-height: 24px;">Aljoscha Lau=
tenbach&nbsp;</span></a>sir,
<div>&nbsp;</div>
<div>Yes RPI3 doesn't support the xen as there is no GIC. Whereas RPI4 has=
 GIC400 we can run xen. I am actually working RPI4.</div>
<div>&nbsp;</div>
<div>&nbsp; This is the first time I am working with yocto and xen. I lite=
rally a newbee to this topic. I gone through the thread that you have share=
d with me thank you so much.</div>
<div>&nbsp;</div>
<div>But as I am&nbsp; seeing many things for the first time here. I will =
sure work on your inputs. If I found anything new strange issue or any prob=
lem i will&nbsp;let you know based on that.</div>
<div>&nbsp;</div>
<div>&nbsp;I will go through how to add them mannually and another point i=
 noticed there was that own layer stuff but I really don't know how to do i=
t. But sure i will give my best and will try to achieve&nbsp;it.&nbsp;</div=
>
<div>&nbsp;</div>
<div>Meanwhile may I get any link or reference material so that I can read=
 and learn regarding yocto and xen please.&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Any suggestions will be much helpful&nbsp;for me sir.&nbsp;</div>
<div>&nbsp;</div>
<div>Regards,&nbsp;</div>
<div>Siddhartha V&nbsp;</div>
</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Mon, Jun 1, 2020 at 10:39 PM Aljo=
scha Lautenbach &lt;<a href=3D"mailto:aljoscha.lautenbach@gmail.com" target=
=
=3D"_blank" rel=3D"nofollow noopener">aljoscha.lautenbach@gmail.com</a>&gt=
; wrote:</div>
<blockquote class=3D"gmail_quote">Hi Siddhartha,<br /><br />I don't know i=
f this is your problem, but it might be. Three months<br />ago I had more o=
r less the same question for the Raspberry-Pi 3, you<br />might want to rea=
d that thread:<br /><a href=3D"https://lists.yoctoproject.org/g/yocto/topic=
/71688106#48662" target=3D"_blank" rel=3D"nofollow noopener">https://lists.=
yoctoproject.org/g/yocto/topic/71688106#48662</a><br /><br />The problem wa=
s that the meta-raspberrypi layer uses an incompatible<br />kernel recipe, =
so you have to manually update it. To quote myself from<br />the thread abo=
ve:<br />"If I understand you correctly, I need to add a<br />linux-raspber=
rypi_4.19.bbappend file in my own layer that applies the<br />Xen configura=
tion fragments."<br /><br />I later found out that the Raspberry-Pi 3 is no=
t supported by XEN<br />since it has an incompatible GIC, but that was a di=
fferent problem. ;)<br /><br />Best regards,<br />Aljoscha</blockquote>
</div>
<div class=3D"gmail_signature" dir=3D"ltr">
<div dir=3D"ltr">
<div>&nbsp;</div>
</div>
</div>
<br />-- <br />Best Regards,<br />Siddhartha V

--000000000000cf4cd805a727a31a--
