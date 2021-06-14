Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.1316.1623693560779760177
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 10:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQlTZ0xu;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id r7so33246251edv.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jun 2021 10:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rYYrCqWdqs2qt73Go4ZC8WClZEZasF7rKGTDVa0Ira4=;
        b=TQlTZ0xu03IWINLuZ7/xJwTjjQRB48quRTyXV9UdOHSrUflYJdUDKy7I2DlgSl2ZoJ
         aPIUMyXVPQZWGSDueIGs/AbiteCfUaGVA7vrBL1gVSkCm0XS7jBguDrxz3pn1Yn7WAEz
         syB67PdiuREkcJuglNeLm4XlhL0ve+HEikjdSemRzaWegNgEgmy7KChHjnLaLc21nJSb
         WUhsllhOfEzrnMFTwy7FxU4XSeUAi8lPQEjYspjF8X5hLmKAqyanCXaboFs5gBqURtGV
         bgJeZj3d1qGS5UqVlg1iHBoMR1lsuNFS2uLkLL4GMZqVW8xOEFXUTYwgOAgJlk1Sy+O1
         91rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rYYrCqWdqs2qt73Go4ZC8WClZEZasF7rKGTDVa0Ira4=;
        b=T0apNbAbZIDK9TOQwECMjTCdMOdsXMjY+AraVc5pV5flQ96Y5Luv9jbIpHBbuk+17P
         hsK/1sxhsP5mrWWvOazWGxB5GCC4MCqtA9PwbrxFrBY2FiCjMxissEOy9u3pTgzXi0EM
         6a4grCxd2MZdihYcDQtn2J/PXe4ynMcjYRtyIIRrOMB7BrQvZtLLtLpU2BAdkn+7bBfs
         8qw/XTRhf4kOR6dEv+RWvGkDn3JpU5TJOJON/YbMJeRX5qBYfTxMF0JN47wu0cH/h/Hz
         wPbRItkZXFd0c2elWp0x7UWtygiJVj+RvEI1jLvwKutgDhfIA321dP/KJ8Dz7o0Abs+J
         wQvQ==
X-Gm-Message-State: AOAM5328cqrKFIgk/Zsha3vniv5Yn3C7mLyRKVzJ6XIV8dGQ7KUdA1r4
	tANy31YiFZNV9Cg93BhhhzZvq6EiWeLrcggVKuE=
X-Google-Smtp-Source: ABdhPJyeDA8DdYLFQp+hDINkO/R49jT1JhdeQV9OYMUConMvpP5yoU9bmp0zVEf+1IiRnyBUXrQDvGXacoDPyIlE8lo=
X-Received: by 2002:a05:6402:28a:: with SMTP id l10mr17942892edv.365.1623693559165;
 Mon, 14 Jun 2021 10:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>
 <CADkTA4PkCG-xJ+hRANh4_tQFRdBGHrvsqkj=_Y_SPyK=Ru-fDg@mail.gmail.com> <AS8PR08MB701191287DFA90A2F8408D7D95319@AS8PR08MB7011.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB701191287DFA90A2F8408D7D95319@AS8PR08MB7011.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Jun 2021 13:59:08 -0400
Message-ID: <CADkTA4Mynf55A2NjnZ0ao2-7S2JWKsyXnwO-mJA5YHQp9psjnA@mail.gmail.com>
Subject: Re: [meta-virtualization] Networking issue with l3s when using systemd
To: Matt Spencer <Matt.Spencer@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:59 AM Matt Spencer <Matt.Spencer@arm.com> wrote:
>
> Hey Bruce,
>
> I understand that changing things can be difficult once launched.
>
> But looking at the systemd documentation here https://wiki.archlinux.org/=
title/systemd-networkd and in the note that says 'Devices can also be match=
ed by their type. E.g. Type=3Dether for Ethernet, Type=3Dwlan for Wi-Fi and=
 Type=3Dwwan for WWAN. Note that Type=3Dether will also match virtual Ether=
net interfaces (veth*), which may be undesirable.'
>
> I have created a patch that modifies poky's meta/recipes-core/systemd/sys=
temd-conf/wired.network to add '+Name=3D!veth*' to the Match clause which t=
he team at Arm are reviewing with a view to upstream.
>
> I feel that this should have been the default behaviour anyway?

Perhaps, but it is probably a good idea to have the default as broad
as possible.  If someone comes up with an alternate requirement, you'd
end up having a harder time keeping them both working in oe-core.

We could also carry a bbappend in meta-virtualization that triggers
when "virtualization" is in the distro features. That way we are
providing an override that makes sense within the context of the layer
that is providing it, and the distro features that are enabled.

Bruce

>
> /Matt
> ________________________________
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org> on behalf of Bruce Ashfield via lists.yoctoproject.org=
 <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org>
> Sent: 14 June 2021 15:24
> To: Matt Spencer <Matt.Spencer@arm.com>
> Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org>
> Subject: Re: [meta-virtualization] Networking issue with l3s when using s=
ystemd
>
> On Mon, Jun 14, 2021 at 6:27 AM Matt Spencer <matt.spencer@arm.com> wrote=
:
> >
> > Hi all
> >
> > There seems to be a networking problem with k3s when using systemd.  Th=
e problem manifests in that none of the kube-system management containers a=
re able to communicate with eachother.
> >
> > The root cause seems to be that systemd-networking is actively managing=
 veth interfaces created by k3s/flannel.  This happens because of '/lib/sys=
temd/network/80-wired.network' added by the systemd recipe, which is matchi=
ng on Type=3Dether.
> >
> > My fix is to modify the 80-wired.network to add 'Name=3Deth*'.  With th=
is in place, k3s works as expected.
> >
> > I am not sure what the correct upstream solution should be for Yocto?  =
Your help would be appreciated.
> >
>
> This particular issue is known, in the sense that we have run into it bef=
ore.
>
> At a minimum, I need to warn about it in the k3s README files.
>
> I created the cni bbclass to manage potentially conflicting networking
> configs on that front, but systemd-networking is yet another variable.
>
> We don't want to globally make it conflict, since someone might have a
> working networkd config that they want to use, and exactly how
> networking is set up, tends to be more of a distro feature. So the
> recipes need to tread carefully.
>
> Which takes me back to the README, and an enhancement to the
> cni-networking bbclass to be more generic and pick up / warn on
> configuration issues like this.
>
> bruce
>
>
> > /Matt
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
