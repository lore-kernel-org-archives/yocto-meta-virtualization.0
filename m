Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.22460.1581344394412476727
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KwUHVmjR;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id r18so475769edl.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 06:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u8xJNleTB6ueLNRKEMHTbYspQ7p5aLGdJ/Z2Wf59MEg=;
        b=KwUHVmjRinhrOAPDg9f09ky9NNQhZtb5/6klUSCua+ZjF8vazntfOEYYewyo4ZlZid
         l1d/naaKfLgZBbpbDkNaJCJvbiFy1KK7rIvQP12mHXlDVqw0Ttq9ljORZ1q9FO4ffNoP
         d/KLaUB9HRTgvq8aFf2TOvCY88dqjqZW33hbPu4VV0MvJFOsrJKM2hrk4x1lQoohyLEw
         6tekdz+tGWsweTg+01xFf8KnbwCeZZ/0nX1PAU6KzcmIghcMW4kYpm44TA0z2etwdXIt
         6uTNjVl9AFi+M/lp1hndRnSy0QQ55OAb0wO0aMrLGGquu+bosaY71Rns9R7w/nRdaYnS
         ziTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u8xJNleTB6ueLNRKEMHTbYspQ7p5aLGdJ/Z2Wf59MEg=;
        b=J4KXvGYVioWsY8mGzOxqSZjsYRwLKwDqqqx3OoRCK4HjXnBMW90o8cgjROoCNivr8B
         YNmgt3VN7WCPm+IQm+KlWX9BNArBDXkygI5Tj568sDRNRBc5EjIIzBok6knHgsN+Xfcm
         2iRsXF6hxbhd8WXw60QlnJY4WlpT1hK2WqGTSqYWW9ZISt24Jyn7IYuCn0fRhqpo04J7
         k7UudH1pv5FEEfgehr4LwsKh7XGb8AInNPt/mkw1Nl4UvrbrQm0EAYrY8fB1ILrSH6fl
         KiGTa7rpZ/DGMHB1Oy23WP4GnU5A+EyxGwk40seTFi5HTlaQwpEhzrmuMa0pPOYHuunM
         Y62w==
X-Gm-Message-State: APjAAAUEWUJWYQUV9/KpCM1T3PlRkbFjj7VbGpbSBJVaopId5hJ9W3kU
	NwdLn2CMAsulByCErJX4dgD/cmg9qZ+DdRLzBJY=
X-Google-Smtp-Source: APXvYqyXus7JGUdnRn9NaowoC6L2ZGcSOoaeyvDvC4ZDXiIzw00TaMVTqVEA8spmdCs1749sb6egI69y3h+3z5KR0uc=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr1310922edr.347.1581344392777;
 Mon, 10 Feb 2020 06:19:52 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com> <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
 <87461434-6571-431A-996A-0236271C6F1B@arm.com>
In-Reply-To: <87461434-6571-431A-996A-0236271C6F1B@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2020 09:19:41 -0500
Message-ID: <CADkTA4MEmWROuHkQRqUO+j6HnUVVHTKPVhnCnch2ObiyqUKVRA@mail.gmail.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 6:12 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 10 Feb 2020, at 08:05, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Fri, 7 Feb 2020 at 15:42, Bertrand Marquis <bertrand.marquis@arm.com=
> wrote:
> >>
> >> Hi Everyone,
> >>
> >> Trying to design my own layer I used the example of meta-virtualizatio=
n layer configuration to try to include a file depending on a DISTRO_FEATUR=
ES value.
> >>
> >> After several tests, I discovered that all the values that I did defin=
ed in the included file have no effect, in fact I get the feeling that DIST=
RO_FEATURES does not contain the entries I add in local.conf when layer.con=
f is parsed.
> >
> > This is correct - layer.conf in each layer is parsed before local.conf.
> >
> >>
> >> Meta-virtualization is using this system to set PREFERRED_VERSION for =
some packages but it seems that:
> >> - using require without a full path does not work (maybe the require s=
hould be changed to conf/distro/include/meta-virt-default-versions.inc)
> >> - even with the right path using bb.utils.contains does not work if DI=
STRO_FEATURES is set in local.conf
> >>
> >> Could anyone confirm or explain me where I am wrong here ?
> >
> > Looking at layer.conf in meta-virtualization on the master branch, it
> > does worry me a bit that these lines might not work as expected:
> >
> >    USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> > 'virtualization', 'meta-virt-cfg', '', d)}"
> >    USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> > 'k8s', 'meta-virt-k8s-cfg', '', d)}"
> >
> > Perhaps these should become unconditional appends to USER_CLASSES and
> > the DISTRO_FEATURES checks should be done inside those classes.
> >
> > Bruce, any thoughts on this one for meta-virtualization?
> >
> >>
> >> Here are the tests I did to end up with those conclusions:
> >> - "require meta-virt-default-versions.inc=E2=80=9D directly in layer.c=
onf is ending with a bitbake error
> >>  So the file is not found here.
> >> - =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=
=E2=80=9D build correctly
> >>  So the file is properly included here.
> >> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.in=
c and =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=
=E2=80=9D in layer.conf end up in an error
> >>  So the file is properly included here.
> >> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.in=
c and =E2=80=9Crequire ${@bb.utils.contains('DISTRO_FEATURES', 'virtualizat=
ion', 'meta-virt-default-versions.inc', '', d)}=E2=80=9D in layer.conf buil=
d correctly
> >>  So the file is not included here
> >>
> >> Is there a right way to achieve what is want in layer.conf ?
> >
> > You need to delay parsing of your variable until after bitbake.conf is
> > parsed (which includes local.conf and other related files). The
> > simplest way to do this is to place the logic in a bbclass and add
> > this to the INHERIT variable in your layer.conf. The classes in
> > INHERIT are picked up as if they were at the start of each recipe that
> > is parsed.
> >
>
> Thanks a lot, I will give this a look but enforcing PREFERRED_VERSION in =
a bbclass does not really seem to be something standard.
>
> Does someone knows meta-virtualization tries to enforce versions on pytho=
n ?

git history and the mailing list archives have all the details, but
the summary is that some of the major packages have very specific
version dependencies (which change over time), so we have to pin those
versions.

> It seems that meta-virt-default-versions.inc is in fact never included (i=
n Zeus or in master at least) so I am wondering if the content should not b=
e removed all together ?

No, it has been used for quite some time (on and off), it stays as a
placeholder for when it will be used again. See the comments in both
git history and in the file itself.

> The file was introduced in case an other layer is providing a different v=
ersion of some packages to enforce the ones provided by meta-virtualization=
 but in fact in master the file is empty.
>
> A the end the complete system with a class to include meta-virt-default-v=
ersions.inc if virtualization is in DISTRO_FEATURES could be removed.
>

definitely not.

Bruce

> Thanks,
> Bertrand
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
