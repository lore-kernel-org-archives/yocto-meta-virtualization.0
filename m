Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.4338.1623725166617832035
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 19:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZqEJDv8g;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t7so3843734edd.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jun 2021 19:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fdLM+33pI7tNRvZiNLkzomnM2japun8j4i4sYRTm5OM=;
        b=ZqEJDv8gvtS6Gs5/mLmNb/q2c8txmPypD4YxBjXEOqOM8tvD58oJwR/ejkTUlb5uni
         sOrNxnAkQZ/SzBBGq/SkgNWXNIE1pWg6pf2bTEzzefmiOjSwR+aSUsoVdU+C+eQIvqHC
         ELyIThrogO1pXgfyLvPpIla+fwqD/0u3fz4fQygjM2Fc3PWBLUlgRjak3MlWNeNt3WVO
         9MtPRyPGHLKRWpct3k18wrwjlpEYWr2mhR2/KSahI1fK8PLqgUUlv3Vft4qmIisMCEmo
         IdLsTEtiD1SaaOcGEEZAE/4xYxQrUS3nclP1po9YVeWJqrFhdJmmiKiU87oBuEMoIZOQ
         mZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fdLM+33pI7tNRvZiNLkzomnM2japun8j4i4sYRTm5OM=;
        b=dylNs56Y0yoD5kWQKj48idamcOloU7W4rnsKhJFeKoo1Mn2hwmAm+aWEGvZfdbZo+K
         rWMn70/lYDdr1z1adv0mrSDiLjygYN3F7mo8hE40Ohe0E+dfbJIFFTlxSzXOm4ViswEc
         BisX9kIZOL+JlwgoVXbc503+LRgtwSdxqRH7dc2HDrOPFjmtnPcoR/36qZbeM07K3sfH
         atCO7pEXABS4DHbJRw/DQm73MfuxIxVlVBmTCZuFT6uVWhf7lfOuWt8FLe1YPYCHGtlt
         OVU3Nnz1K/oMsLX6ohhwL3kJ+91A1mvOgoJ1t4+23PhtZ7QE3A5/5i8e+ApHR6dxVEng
         D44w==
X-Gm-Message-State: AOAM530Tkg92gHZ28Oot15r2VthCnbKXoEBYKTaQd/xEaF6fcUKbyu6T
	Kswvd4XvUNKp61/2iEWlj0Vmw4G0LFO8PwxhjLI=
X-Google-Smtp-Source: ABdhPJz2GXjFouwIYfSb12t3d45izMytdYMxRWzIj1tGOOjB+n+p7+14GcJ64aBvZWgI+81GHtcnY/FLAf2v1YXjgqw=
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr21507158edd.234.1623725165172;
 Mon, 14 Jun 2021 19:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>
 <CADkTA4PkCG-xJ+hRANh4_tQFRdBGHrvsqkj=_Y_SPyK=Ru-fDg@mail.gmail.com>
 <AS8PR08MB701191287DFA90A2F8408D7D95319@AS8PR08MB7011.eurprd08.prod.outlook.com>
 <CADkTA4Mynf55A2NjnZ0ao2-7S2JWKsyXnwO-mJA5YHQp9psjnA@mail.gmail.com> <254de5b76e238bfae14c0b3d2376c99af068a5c9.camel@linuxfoundation.org>
In-Reply-To: <254de5b76e238bfae14c0b3d2376c99af068a5c9.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Jun 2021 22:45:54 -0400
Message-ID: <CADkTA4PzxKq59J7sxU79CDF5m3Ar91-VHH=tisGqV0r8do4tvw@mail.gmail.com>
Subject: Re: [meta-virtualization] Networking issue with l3s when using systemd
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Matt Spencer <Matt.Spencer@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 4:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-06-14 at 13:59 -0400, Bruce Ashfield wrote:
> > On Mon, Jun 14, 2021 at 10:59 AM Matt Spencer <Matt.Spencer@arm.com> wr=
ote:
> > >
> > > Hey Bruce,
> > >
> > > I understand that changing things can be difficult once launched.
> > >
> > > But looking at the systemd documentation here https://wiki.archlinux.=
org/title/systemd-networkd and in the note that says 'Devices can also be m=
atched by their type. E.g. Type=3Dether for Ethernet, Type=3Dwlan for Wi-Fi=
 and Type=3Dwwan for WWAN. Note that Type=3Dether will also match virtual E=
thernet interfaces (veth*), which may be undesirable.'
> > >
> > > I have created a patch that modifies poky's meta/recipes-core/systemd=
/systemd-conf/wired.network to add '+Name=3D!veth*' to the Match clause whi=
ch the team at Arm are reviewing with a view to upstream.
> > >
> > > I feel that this should have been the default behaviour anyway?
> >
> > Perhaps, but it is probably a good idea to have the default as broad
> > as possible.  If someone comes up with an alternate requirement, you'd
> > end up having a harder time keeping them both working in oe-core.
> >
> > We could also carry a bbappend in meta-virtualization that triggers
> > when "virtualization" is in the distro features. That way we are
> > providing an override that makes sense within the context of the layer
> > that is providing it, and the distro features that are enabled.
>
> FWIW I suspect the veth change should be ok for OE-Core if I understand
> things correctly.

I'm sure we'll hear if someone is expecting networkd to manage their
veth devices :D

Either way works for me, I just lean towards keeping core very general
and not tailored to any particular use case.

If you are doing virtualization, and in particular kubernetes based,
you need to have a close look at your networking regardless.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
