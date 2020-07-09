Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.3319.1594262548749650604
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 19:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NB1Afe43;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id p20so576498ejd.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2020 19:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jPtThWJ5Gy56cK5kf3JxaPpP6iuETlDouVgGSkA/F1w=;
        b=NB1Afe43PVTP8Imlwbhv7qci3Vrqffwq26Kl7rOKdkdj/cFfGDexW/P/ks580Po64y
         z42yTDn4DiJCUjySyeXlovpK0qI6rYmHlMVu5TAbGi/6CjpfOK3pSAExxU1CFswQTfF4
         X4yOp97rwYLuxi7Qlsvwux0dI+w+ISKOEUM6icMxoJMycxw1Peg85F52pjl3VIPIrc2w
         bkQYw/bBtSmq33TKz+EGIerXOIenIAeX5gUHiyEqxRjqywencGCu6T9fPE1TWuyIcsDa
         h4F7J/pzlO+YMldUwbJVESiopMQE/bKPBhox/OU5v1iR/tZhBOmYqVeJIw1R0dIxwl6C
         SmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPtThWJ5Gy56cK5kf3JxaPpP6iuETlDouVgGSkA/F1w=;
        b=U1x3s1YGaMA2AuuNZ8fvQX0MPIWC8vhC287pCgMXMdTr3nGeVK4OOLKjt4S5u/iQx2
         kLa+/S4zpliuS2PmazQT998H9qyQ4HvbVodhJgEaaItmpjFB5PcSrbQzrD7eON9jn2nn
         KY7R7poFrZuID2OsExLhHEmOHvj9SMh1OyXiOgA20CvHwuLnXbeYVDfVw6oFYTkriBZ8
         hd2rmhaiZX0jdVTxV9frWxmJ+n7dKmA+7L7ZgyHjHDnNs9lm6ZR5UgYRglZzUaPvMLNt
         /e+Om8nvd5ibmgslBOBdAAONLxkx3LJWFjL7N6e3EyDfWFrUVpd/JinJZug16FhScIBJ
         BDsA==
X-Gm-Message-State: AOAM532LbqILNkkPcSr3mtfPNhgeoDwkWSlJyFdovvZ5k29yQ3iXF3Tn
	0Y9ZsXID2la7V8ARydn2AzFb5Tpuzp1lQ/PHz7Zj61eXXnU=
X-Google-Smtp-Source: ABdhPJwM4Csgq6Y5lEoS97w5cnZRp//XxxKWehcpS/hPTq+oVbkhZ5d1LSm44iipnMw2gWIbs7MdYtDe+cBLOpIyuR4=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr53390528ejy.517.1594262547222;
 Wed, 08 Jul 2020 19:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <bt6y.1594192349425584301.iaNZ@lists.yoctoproject.org>
 <161FCB8FD8858AB7.11266@lists.yoctoproject.org> <CACMJ4GZE=oCF8+6Nhw1H2oujDAvZLJvwSgL+y05aUFAfoKRJUg@mail.gmail.com>
In-Reply-To: <CACMJ4GZE=oCF8+6Nhw1H2oujDAvZLJvwSgL+y05aUFAfoKRJUg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 8 Jul 2020 22:42:16 -0400
Message-ID: <CADkTA4PR9nGVh884qpEA06LLhcT+EPgu5zm5hcDUB+NowNbf6g@mail.gmail.com>
Subject: Re: [meta-virtualization] [raspberry-pi4-xen-series] : Console login failure for xen-image-minimal
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Ashishx88 <ashish.emailaddress@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 8, 2020 at 9:00 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Wed, Jul 8, 2020 at 6:56 AM Christopher Clark via
> lists.yoctoproject.org
> <christopher.w.clark=gmail.com@lists.yoctoproject.org> wrote:
> >
> > On Wed, Jul 8, 2020 at 12:12 AM Ashishx88 <ashish.emailaddress@gmail.com> wrote:
> > >
> > > Hi Christopher ,
> > >
> > > - I have created an xen-image-minimal using the commit & repo mentioned
> > >    https://lists.yoctoproject.org/g/meta-virtualization/message/5464
> > >    I am able to compile both core-image-minimal & xen-image-minimal .
> > >
> > > - When the board boots with the compiled image , i am observing below mentioned issue
> > >    Can you provide any inputs or if same issue has been observed with other members :
> > >
> > >    1) At the login prompt , root credentials fails continuously for few time.
> > >        raspberrypi4-64 login: root
> > >        Password: root
> > >        ( I can assure you that there is no typo error )
> > >
> > >    2) After few attempt , i get the  root prompt root@raspberrypi4-64:~#
> > >        After the prompt within few seconds i get Login timed out after 60 seconds.
> > >        and behaviour starts again from point-1 mentioned above.
> > >        -> Attached along is the minicom log for your reference.
> > >
> > >    3) Similar login problem i have seen with core-image-minimal
> > >        Local.conf :
> > >                           DISTRO_FEATURES_append = " xen virtualization"
> > >                           MACHINE = "raspberrypi4-64"
> > >
> > > Hence can you please let me know if similar observation is being reported.
> > > and any pointers to look for the issue .
> >
> > This looks like an unhappy serial device.
> > Please could you confirm: if you connect a local USB keyboard and HDMI
> > display, you do not have a similar problem logging in or using the
> > prompt?
>
> This turns out to be a simpler problem to fix than a device issue:
> there are apparently two getty's running on the serial console device
> (hvc0) and you only want one. If you're using the xen-image-minimal
> image, the immediate workaround is to log in and edit the file
> /etc/inittab to comment out or remove the last line beginning 'X0',
> save it, and poweroff the device. When you start the device up again,
> your serial console command prompt should now work correctly. It's
> probably a similar fix for a core-image-minimal image (- I just don't
> have one immediately to hand to check it).

We've had quite a few hvc0 patches over the years .. we end up
fixing/breaking sysvinit/systemd and someone's use case everytime we
tweak it.

Checking the git history should let us know what to avoid :D

Bruce

>
> I can also look into a patch for fixing this.
>
> Christopher
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
