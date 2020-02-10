Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web09.22636.1581345331108282984
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f/IQome3;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id j17so529635edp.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 06:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cD4iw09euZ54mob3c009fII57qAWbAVgFteDeSOp5ag=;
        b=f/IQome3fhVCE9ArTgf5IOoQQMNH9NHuJxPXKpqX4PnIpeKk5RDzGGWMbcJzLKOVaR
         XWWZr6oaut9cmoay5QpUnFDKsZZLeUOsdSY+0VHwj173vr+AVEjeg3/vHN4ILlo5fkLf
         o+sikB37ora4Hq8Dsl6V0Y/B30vSYZU7CjZslN+BHaUSBi7AJHTXRiFDDmgiueYNY8fS
         gATrf7bH8PqpDI9JJgrnxnTxcebJyfenDm/XlkDPsoKAHT/9IeioSISwYAwF1HszPY+y
         dxZk4Zn8o944Ash11bEyNppzgFci2zmyzXL1nO07O7yKSDuVJXkKS/voZMbocpmV5bcL
         jq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cD4iw09euZ54mob3c009fII57qAWbAVgFteDeSOp5ag=;
        b=qA01qtWedRa9ui7VIFzuOzF1FoiBTlOgN9Vu9aUNs4+sz87SRqAbbeWAl7Y2aPYTTW
         RDDrrQeXC0/cKKjcBLNnkZzFlSIrfrhANrrdmzr61H+w519zupLdW059yM379/Bwa46P
         YNzgfrViFFbg37cvGVAfKMda2Klk0+hPYQXa78pLHqnrG2t7IknQy4PewV9KhVeyTh8I
         aAxqRbe+Kqm71cauMoz7KSONMnPIeifIltKoMVIDuQIktcc6Bcu0plL9CdUXph4Shc+J
         bEdwo4aqutGmHycuDzlfLma1rqtiK+VUA66bB0cKKrib3kPFFXWYEytBBfxHUKuHmDm6
         1O7w==
X-Gm-Message-State: APjAAAWV8DlYfnNOiH2bZqaJVYjOBOvaLGeLfZTRZXhMtd1JLegsOFgv
	aO0XmdI8zpvw8OU05Y8UI1y/T4gXULufsvsC9GA=
X-Google-Smtp-Source: APXvYqxYq5J3f6dRTx1VUEX4TKjsOwpeOoqDKRRN/HEp69/JCliWGD8d5FG3ZZdGhcCnDains13o2yl+IeQ7Kf/8Pwk=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr1521983ejj.6.1581345329342;
 Mon, 10 Feb 2020 06:35:29 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com> <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
 <CADkTA4OPCO5SBEN+Ksm+uzA6bthPALaKNmwPLfcsEPtiYNMQCg@mail.gmail.com> <5BDA5F3A-C93B-4AD9-A50C-D48A057F0CC6@arm.com>
In-Reply-To: <5BDA5F3A-C93B-4AD9-A50C-D48A057F0CC6@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2020 09:35:18 -0500
Message-ID: <CADkTA4NcJt86xKT89m369KGHxWScrU=XFFzd8AK+onO5cUabLg@mail.gmail.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Paul Barker <pbarker@konsulko.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 9:23 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> On 10 Feb 2020, at 14:17, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>
> On Mon, Feb 10, 2020 at 3:06 AM Paul Barker <pbarker@konsulko.com> wrote:
>
>
> On Fri, 7 Feb 2020 at 15:42, Bertrand Marquis <bertrand.marquis@arm.com> =
wrote:
>
>
> Hi Everyone,
>
> Trying to design my own layer I used the example of meta-virtualization l=
ayer configuration to try to include a file depending on a DISTRO_FEATURES =
value.
>
> After several tests, I discovered that all the values that I did defined =
in the included file have no effect, in fact I get the feeling that DISTRO_=
FEATURES does not contain the entries I add in local.conf when layer.conf i=
s parsed.
>
>
> This is correct - layer.conf in each layer is parsed before local.conf.
>
>
> Meta-virtualization is using this system to set PREFERRED_VERSION for som=
e packages but it seems that:
> - using require without a full path does not work (maybe the require shou=
ld be changed to conf/distro/include/meta-virt-default-versions.inc)
> - even with the right path using bb.utils.contains does not work if DISTR=
O_FEATURES is set in local.conf
>
> Could anyone confirm or explain me where I am wrong here ?
>
>
> Looking at layer.conf in meta-virtualization on the master branch, it
> does worry me a bit that these lines might not work as expected:
>
>    USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'virtualization', 'meta-virt-cfg', '', d)}"
>    USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'k8s', 'meta-virt-k8s-cfg', '', d)}"
>
>
> They do work as expected. See the post from Mark Hatle (to the mailing
> list) explaining the details of why they are setup as they are.
>
> This is one of the only ways to ensure that something which is
> parsed/expanded early enough can then be used in the layer conf to do
> version pinning like this.
>
> That being said, what part of those lines do you think might not be worki=
ng ?
>
>
> If virtualization is set in local.conf (which is the standard  would say)=
, it will not be set when the layer.conf is parsed.

No, a distro conf is actually what is expected. With sometimes
temporary testing with local.conf

>

That being said, I've run many tests with it in local.conf, and I'm
seeing exactly what I expect. The version files are either included,
or not, based on the distro feature.  I can easily show that by
putting a syntax error in the file, and making it either break the
build, or not, based on the distro feature.

Are you not seeing the file included at all, or just that the
preferred versions aren't kicking in ?

 ... again, check the mailing list archives and you'll see the
technical explanation of how and why it is put together as it is.

Cheers,

Bruce

> This could be solve by doing the test in the class directly (using a pyth=
on function instead).
>
> Bertrand
>
>
>
> Bruce
>
>
> Perhaps these should become unconditional appends to USER_CLASSES and
> the DISTRO_FEATURES checks should be done inside those classes.
>
> Bruce, any thoughts on this one for meta-virtualization?
>
>
> Here are the tests I did to end up with those conclusions:
> - "require meta-virt-default-versions.inc=E2=80=9D directly in layer.conf=
 is ending with a bitbake error
>  So the file is not found here.
> - =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=80=9D build correctly
>  So the file is properly included here.
> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc a=
nd =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=80=9D in layer.conf end up in an error
>  So the file is properly included here.
> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc a=
nd =E2=80=9Crequire ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization=
', 'meta-virt-default-versions.inc', '', d)}=E2=80=9D in layer.conf build c=
orrectly
>  So the file is not included here
>
> Is there a right way to achieve what is want in layer.conf ?
>
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
>
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
