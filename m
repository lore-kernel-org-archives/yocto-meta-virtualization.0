Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.2568.1581360674559494129
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 10:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ij5JI/Uj;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id v28so1533267edw.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 10:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LhItBSmQYA/PqwB6VtDSjX6mT9NOaunn/0idDsD5yWI=;
        b=Ij5JI/UjUtTn4jjNUmL9/j0TClGWygK7rwDiaPpdWGrbSE3kqyycPrH1MIoqlZ4Ixw
         b7gRhZNeLFcZ8pTPGFiNpkmch0uLVAyzUDhIo9+PIW6uVfAMFIQk21JAv6uwkFzucjPM
         +Arn/tUpv8BX+jjYW46+0BgJb/QgvuaIg0b6UyrRPoNAuWZKW3BoGraEH2I7Y/wAXRjc
         h+j437LpH/dzXgB8cOgAcJH5HgfEnXWO8be1yg4Ke/ZhwzkQ0b/+Jx+/rHprhcU5mKG0
         9BRzQYB2cZrSuRSaSnjELRTGZ3lZ6toe91u05MpEYMgJRpfvEDCjfEwHL7iavYAebRW8
         lnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LhItBSmQYA/PqwB6VtDSjX6mT9NOaunn/0idDsD5yWI=;
        b=C6CvyP+hU9eMRqUgID081UpSWRwDO0vwcBAd9u6qapbWeWB3TDaueaDtKI7R/F+Ek7
         AcwM1RSVsczT0grF2xa2fcwuUPqlpciPfT4A/D2GKFFghNgsA7y6BcvsA2RzkVVCMPcX
         4laM9vGGe1tEuy7iAHUhEApUv4nLvbmPLvZkhEEZ1ciNcWhnathSWEvZ5nRZpq2RUEEF
         UIcaUb1q2HXNpYwXUXQBQmMquiH8Zlxh0fEwW6SaAg8kHsoliQKTzzTuc0srQA9nQw2V
         +70/b8asPSo2D7hW5SjV2m8/Ya+oRkG8C8rta87+Ht8Myr1hGJkiLi6B/t8sqoqOLZ8w
         9Y3g==
X-Gm-Message-State: APjAAAVgvcZAlIoJJWo+fQYcxaHSw3cDTwMudIK71znM93sCclo9wmE7
	KpfZs/EmEHYbiISv8296eIqqJq3l9mV2+bYASzo=
X-Google-Smtp-Source: APXvYqwM/TP1j1bjkHBQU4LVxV9VmmETMlYTIl1KU6+R++BXK12q+TP2mO/sLZROdkYIPxOowsXFLcv+JLNkBgRIfDk=
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr2522292edx.234.1581360672963;
 Mon, 10 Feb 2020 10:51:12 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com> <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
 <CADkTA4OPCO5SBEN+Ksm+uzA6bthPALaKNmwPLfcsEPtiYNMQCg@mail.gmail.com>
 <5BDA5F3A-C93B-4AD9-A50C-D48A057F0CC6@arm.com> <CADkTA4NcJt86xKT89m369KGHxWScrU=XFFzd8AK+onO5cUabLg@mail.gmail.com>
 <03340364-6665-44CC-9053-62B564ED0D85@arm.com> <15F211E71CA8CDBB.3625@lists.yoctoproject.org>
 <CADkTA4OoCqA0XLt1gCjOfn2gAcE2zYNX67qMcCzL-ojAB4R1Fw@mail.gmail.com> <CCF63321-0303-4741-8B33-E8520932DBD6@arm.com>
In-Reply-To: <CCF63321-0303-4741-8B33-E8520932DBD6@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2020 13:51:01 -0500
Message-ID: <CADkTA4NgnQ3h3SNRVAjSJ4BSF2gz24nhK0tMzBPCPZ_egitfcg@mail.gmail.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 10:59 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> On 10 Feb 2020, at 15:33, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>
> Attached is a (lightly) tested patch, which defers the distro feature
> check to the
> bbclasses, versus the .conf file.
>
> This worked on master, and hopefully it works on Zeus as well (I'll
> test Zeus later today, but can't switch at the moment).
>
>
> Your patch does not apply on Zeus.
> For internal reasons I cannot push one myself right now but if you wait =
the end of this week I can handle this an push a patch to fix this on the m=
ailing list.
>

I'll do the port to Zeus eventually, everything just lands in master
first, hence why I sent that variant.

Bruce

> Bertrand
>
>
> Bruce
>
> On Mon, Feb 10, 2020 at 9:48 AM Bruce Ashfield via
> Lists.Yoctoproject.Org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>
> On Mon, Feb 10, 2020 at 9:45 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>
>
>
>
> On 10 Feb 2020, at 14:35, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>
> On Mon, Feb 10, 2020 at 9:23 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>
>
>
>
> On 10 Feb 2020, at 14:17, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>
> On Mon, Feb 10, 2020 at 3:06 AM Paul Barker <pbarker@konsulko.com> wrote=
:
>
>
> On Fri, 7 Feb 2020 at 15:42, Bertrand Marquis <bertrand.marquis@arm.com>=
 wrote:
>
>
> Hi Everyone,
>
> Trying to design my own layer I used the example of meta-virtualization =
layer configuration to try to include a file depending on a DISTRO_FEATURES=
 value.
>
> After several tests, I discovered that all the values that I did defined=
 in the included file have no effect, in fact I get the feeling that DISTRO=
_FEATURES does not contain the entries I add in local.conf when layer.conf =
is parsed.
>
>
> This is correct - layer.conf in each layer is parsed before local.conf.
>
>
> Meta-virtualization is using this system to set PREFERRED_VERSION for so=
me packages but it seems that:
> - using require without a full path does not work (maybe the require sho=
uld be changed to conf/distro/include/meta-virt-default-versions.inc)
> - even with the right path using bb.utils.contains does not work if DIST=
RO_FEATURES is set in local.conf
>
> Could anyone confirm or explain me where I am wrong here ?
>
>
> Looking at layer.conf in meta-virtualization on the master branch, it
> does worry me a bit that these lines might not work as expected:
>
>  USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'virtualization', 'meta-virt-cfg', '', d)}"
>  USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
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
> That being said, what part of those lines do you think might not be work=
ing ?
>
>
> If virtualization is set in local.conf (which is the standard  would say=
), it will not be set when the layer.conf is parsed.
>
>
> No, a distro conf is actually what is expected. With sometimes
> temporary testing with local.conf
>
>
>
> That being said, I've run many tests with it in local.conf, and I'm
> seeing exactly what I expect. The version files are either included,
> or not, based on the distro feature.  I can easily show that by
> putting a syntax error in the file, and making it either break the
> build, or not, based on the distro feature.
>
> Are you not seeing the file included at all, or just that the
> preferred versions aren't kicking in ?
>
>
> In Zeus definitely not, whatever I put as error in the .inc file everyth=
ing goes well.
>
> On master that works (adding an error in one inc file creates an error i=
f virtualization is activated in local.conf)
>
>
>
> ... again, check the mailing list archives and you'll see the
> technical explanation of how and why it is put together as it is.
>
>
> I did and I agree that current behaviour in master is what is wanted. Wa=
s only not in my current development in Zeus.
>
>
> Aha. So that's the difference,
>
> I'll spin a patch for Zeus that moves the distro check to the included
> file, versus the .conf.
>
> Bruce
>
>
> Cheers,
> Bertrand
>
>
> Cheers,
>
> Bruce
>
> This could be solve by doing the test in the class directly (using a pyt=
hon function instead).
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
> - "require meta-virt-default-versions.inc=E2=80=9D directly in layer.con=
f is ending with a bitbake error
> So the file is not found here.
> - =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=
=80=9D build correctly
> So the file is properly included here.
> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc =
and =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=80=9D in layer.conf end up in an error
> So the file is properly included here.
> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc =
and =E2=80=9Crequire ${@bb.utils.contains('DISTRO_FEATURES', 'virtualizatio=
n', 'meta-virt-default-versions.inc', '', d)}=E2=80=9D in layer.conf build =
correctly
> So the file is not included here
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
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> <0001-conf-defer-DISTRO_FEATURE-check-to-bbclass-processin.patch>
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
