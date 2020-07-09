Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
 by mx.groups.io with SMTP id smtpd.web11.1944.1594256453417627029
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 18:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oWERN6lZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.65, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oo1-f65.google.com with SMTP id k47so47777ool.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2020 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nPbUt0yS+I6hjjesDkvSoFUFD46wL8Y0f0Q5iQ5qmZ4=;
        b=oWERN6lZVf52w2wSm4QQ5ivDDXOPok9AmNNuW36iWdfyldeJzRh3xwufrsctsobgzp
         JC8FOIiFj4REVPNJzG19PC9tBtEQuH4GeM3h0aPxQeaakkB+ABo4MFsjyY9agoj286S1
         Fj7YPpecAJtRWOpWMrxSiBKfsduVfTv6h0EgUj9mpBL0acIwbx8iNjTwW3ZB/wfjd/pS
         o930gkm3g4AV9LnMaFavN7ePwWClh5QNGCVI5MHi8Wa7W+bhNeYbM+KFNfBsD0h11neu
         ZOpY4BEpODNBf1TlJwdbx+4DsiIEL2Hjg2xlNgcGlB7Yxwgi8vSKu7nQ5VE7YRQEr2Pw
         NK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nPbUt0yS+I6hjjesDkvSoFUFD46wL8Y0f0Q5iQ5qmZ4=;
        b=NG9qjQ/CQQI9XCS6w3tT8i5JCQcqNAW3KRKOidzoqVFj/vmey+eVTW8urU8ZPZXdLi
         mC0JlLR+sdFzIY80Q/dtq07ysdLYU2hP919obwlR3Ohvrs4A/ltljA1tEdnFrPH5nfyx
         Udz+TzQPjBWspP8JU4ZF/nLPckTsR6HXGS8HKPj8jXbifgGnnbFAKK3MSdK58Ucw6qHu
         sqQDxMR3k/CyCW0E8NcwAc3Uk+yEaSpPi5pcdffjtm3ygovTEG3HQDoQWwYZMF3Jk4yn
         s/aP4oDzjM+kr4WfTQjpAWHtwULfYPfZbabLDDP5gaONGpHB1Du0bW1nJQNRWAqe1uXw
         Og5Q==
X-Gm-Message-State: AOAM532B3rHVP9cO2UjTyKwNt/BGp4oNsztYc9HUD9gpIKpzi+s+21E7
	wNnycCXvWzaRAD4AODsq3rmJhe5CAgZ6qbP3kTk=
X-Google-Smtp-Source: ABdhPJwxmTQhNCRCrOKpQx1V0mAi8z02eoRQ90nDeq3wEhYhF3G0/xwJnrBDRKvlIcNfqqFM/ZdAxPkNh8LPIYE6Snk=
X-Received: by 2002:a4a:e702:: with SMTP id y2mr53215501oou.36.1594256452608;
 Wed, 08 Jul 2020 18:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <bt6y.1594192349425584301.iaNZ@lists.yoctoproject.org> <161FCB8FD8858AB7.11266@lists.yoctoproject.org>
In-Reply-To: <161FCB8FD8858AB7.11266@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 8 Jul 2020 18:00:32 -0700
Message-ID: <CACMJ4GZE=oCF8+6Nhw1H2oujDAvZLJvwSgL+y05aUFAfoKRJUg@mail.gmail.com>
Subject: Re: [meta-virtualization] [raspberry-pi4-xen-series] : Console login failure for xen-image-minimal
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 8, 2020 at 6:56 AM Christopher Clark via
lists.yoctoproject.org
<christopher.w.clark=gmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Jul 8, 2020 at 12:12 AM Ashishx88 <ashish.emailaddress@gmail.com> wrote:
> >
> > Hi Christopher ,
> >
> > - I have created an xen-image-minimal using the commit & repo mentioned
> >    https://lists.yoctoproject.org/g/meta-virtualization/message/5464
> >    I am able to compile both core-image-minimal & xen-image-minimal .
> >
> > - When the board boots with the compiled image , i am observing below mentioned issue
> >    Can you provide any inputs or if same issue has been observed with other members :
> >
> >    1) At the login prompt , root credentials fails continuously for few time.
> >        raspberrypi4-64 login: root
> >        Password: root
> >        ( I can assure you that there is no typo error )
> >
> >    2) After few attempt , i get the  root prompt root@raspberrypi4-64:~#
> >        After the prompt within few seconds i get Login timed out after 60 seconds.
> >        and behaviour starts again from point-1 mentioned above.
> >        -> Attached along is the minicom log for your reference.
> >
> >    3) Similar login problem i have seen with core-image-minimal
> >        Local.conf :
> >                           DISTRO_FEATURES_append = " xen virtualization"
> >                           MACHINE = "raspberrypi4-64"
> >
> > Hence can you please let me know if similar observation is being reported.
> > and any pointers to look for the issue .
>
> This looks like an unhappy serial device.
> Please could you confirm: if you connect a local USB keyboard and HDMI
> display, you do not have a similar problem logging in or using the
> prompt?

This turns out to be a simpler problem to fix than a device issue:
there are apparently two getty's running on the serial console device
(hvc0) and you only want one. If you're using the xen-image-minimal
image, the immediate workaround is to log in and edit the file
/etc/inittab to comment out or remove the last line beginning 'X0',
save it, and poweroff the device. When you start the device up again,
your serial console command prompt should now work correctly. It's
probably a similar fix for a core-image-minimal image (- I just don't
have one immediately to hand to check it).

I can also look into a patch for fixing this.

Christopher
