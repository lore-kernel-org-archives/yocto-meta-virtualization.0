Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.22405.1581344250276194005
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bHxTHwV2;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id j17so455076edp.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hL61t1TH+u93qroZe/fzAgaEjw5ZVtUGl9/b9vcRPPo=;
        b=bHxTHwV28vt4toVJqZ6FfOs0Ucsefr7TXkOnlcfX/pagNCyu0StkLWyG3DjO16wxQ7
         14RRE3kz5sUi5ae9TEt4HLmrP1Ai2u5qPtIhqqa/+5fGwLHMbzHo35omghWxscfPyX5O
         smZ6AgM1Ma448m262qH5LlgF8VTefIhYfu6fiatrbTiMtuWytZEve0lX/oJ2n3xcv1uO
         z1i4YJX+nSBC6CERLB3o3XIcuGSA0k8d3fYoxXCX+REN5M67sVNZj4ysJRjvKkFoKsV0
         WxF1AjLeX3++YyaXQPITBIQnI0J/8dFJdaWtl1CRCKmaXu1UxeL4orv4GFS2zaZZxy1l
         fgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hL61t1TH+u93qroZe/fzAgaEjw5ZVtUGl9/b9vcRPPo=;
        b=IpNLvX0GgFgi7JmXpxNhMsOnkR9agI1cU48iRLWIVglrARAfcT8IZXcoaWqBYyESAh
         UlzG6iX59g8ICdqihfYERGVaHZEwGAM2WjdaOdtxB1oBtCuJLTbwPi1N90P7Gbgsb/PH
         r/RWi1keANKR23hjToIj0aGFfn9NTQ8lqJP7eF5Zo/OIuQtb303h6lJCiHdimwwteJno
         wlDnnnrHl/QjBwmkL7/tdxN657J7kmvoboixN7Bl9Nk6cSEz4VL+CTjA5ahZ9v/b445L
         BSIdlVId/R546foppjlkklLqRNvk0O5LGcFfV53pJai8fbt6+ns/4JJeKHWYAG/valo4
         T06w==
X-Gm-Message-State: APjAAAX7sL29MvmCZ+BCb6mZTZ/yV1JH/wVBpblb52vsngu4YWxVL3mt
	BqSMiwt/IMqV7gj4hQmp3Pbqvp9+TV3DkCjCnxo=
X-Google-Smtp-Source: APXvYqz3wXGmJq3Y+5RhEDBCrfHZViwEOr+rng581s3VLdR/2pDxz5vH2aaddtYia5AVF+kin4ZLdfQgBdlkgFbOWbY=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr1300457edr.347.1581344248719;
 Mon, 10 Feb 2020 06:17:28 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com> <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
In-Reply-To: <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2020 09:17:17 -0500
Message-ID: <CADkTA4OPCO5SBEN+Ksm+uzA6bthPALaKNmwPLfcsEPtiYNMQCg@mail.gmail.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
To: Paul Barker <pbarker@konsulko.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 3:06 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Fri, 7 Feb 2020 at 15:42, Bertrand Marquis <bertrand.marquis@arm.com> =
wrote:
> >
> > Hi Everyone,
> >
> > Trying to design my own layer I used the example of meta-virtualization=
 layer configuration to try to include a file depending on a DISTRO_FEATURE=
S value.
> >
> > After several tests, I discovered that all the values that I did define=
d in the included file have no effect, in fact I get the feeling that DISTR=
O_FEATURES does not contain the entries I add in local.conf when layer.conf=
 is parsed.
>
> This is correct - layer.conf in each layer is parsed before local.conf.
>
> >
> > Meta-virtualization is using this system to set PREFERRED_VERSION for s=
ome packages but it seems that:
> > - using require without a full path does not work (maybe the require sh=
ould be changed to conf/distro/include/meta-virt-default-versions.inc)
> > - even with the right path using bb.utils.contains does not work if DIS=
TRO_FEATURES is set in local.conf
> >
> > Could anyone confirm or explain me where I am wrong here ?
>
> Looking at layer.conf in meta-virtualization on the master branch, it
> does worry me a bit that these lines might not work as expected:
>
>     USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'virtualization', 'meta-virt-cfg', '', d)}"
>     USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'k8s', 'meta-virt-k8s-cfg', '', d)}"

They do work as expected. See the post from Mark Hatle (to the mailing
list) explaining the details of why they are setup as they are.

This is one of the only ways to ensure that something which is
parsed/expanded early enough can then be used in the layer conf to do
version pinning like this.

That being said, what part of those lines do you think might not be working=
 ?

Bruce

>
> Perhaps these should become unconditional appends to USER_CLASSES and
> the DISTRO_FEATURES checks should be done inside those classes.
>
> Bruce, any thoughts on this one for meta-virtualization?
>
> >
> > Here are the tests I did to end up with those conclusions:
> > - "require meta-virt-default-versions.inc=E2=80=9D directly in layer.co=
nf is ending with a bitbake error
> >   So the file is not found here.
> > - =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=
=E2=80=9D build correctly
> >   So the file is properly included here.
> > - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc=
 and =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=80=9D in layer.conf end up in an error
> >   So the file is properly included here.
> > - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc=
 and =E2=80=9Crequire ${@bb.utils.contains('DISTRO_FEATURES', 'virtualizati=
on', 'meta-virt-default-versions.inc', '', d)}=E2=80=9D in layer.conf build=
 correctly
> >   So the file is not included here
> >
> > Is there a right way to achieve what is want in layer.conf ?
>
> You need to delay parsing of your variable until after bitbake.conf is
> parsed (which includes local.conf and other related files). The
> simplest way to do this is to place the logic in a bbclass and add
> this to the INHERIT variable in your layer.conf. The classes in
> INHERIT are picked up as if they were at the start of each recipe that
> is parsed.
>
> Thanks,
> Paul



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
