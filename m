Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.22818.1581345720552631725
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I+SKV/97;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id f8so566927edv.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NP4zE9NjuIAafzV2It4zSd1USaJsu4pGbIYxz0P0g4A=;
        b=I+SKV/97ZcsVwFiwn/RWvsIBlVS6wiXiFQbUXVBy/LVGph5nqSCNWDiL2NKeh1VYWE
         MoICxy7iMWVBL5XqFCX4HRpjcWdpk2TYskEaHBEWHUT7aCBW2FX7ZZ9SoH5ck3fooUn4
         C7NCQUYCL5WkqJ7SQ0XqkFbifm6wmCoMOilHfafarmV/ro3pYzppSgi1rZaDR/9JX8AQ
         yxNKYUcQlo5HwoFXpeI5jsmPqlc4R/ydmr2+71E8mW9sIi5gNRs6+VyMgE3IjzoVVu29
         N03D/G192LvWvJcYv3TVZyEyB96diTXc8OOitQUeN4+9kLO0kNj0xgLnrKnc6I30N3bE
         v1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NP4zE9NjuIAafzV2It4zSd1USaJsu4pGbIYxz0P0g4A=;
        b=haRZGrFi1FEILETkxnD6ahlGG3k+Q+RjHC3Zp3CghA3u59R7Syb9PAqTVuKjX0rVqn
         fk03/h0BauY/9iLf+1DNdxaXCWvYXiRpYn4s6IziDxA0Kp09fG56DftOz1jvYslbJ1oX
         DaIXX0DPMiIahkZ4e1UBXWEeArwpODCUWTJZDPBlNa3tryMiF5oysPSg8LmpUYn2OKjH
         uSEhec392s33rIvlztYE0+iO2cbspn6WsGqQ5BpQSoP7+8r6Gw8qhGISSEf1WpE6PqL/
         PO6m/R8eCo5GHuX4bSrUm2h6Fez8msYRROYoY+sCSkiI+LZs0naWWsg1yScUJ8tya8qW
         F6kw==
X-Gm-Message-State: APjAAAU26ksD8NambTpcFvkvJSmxZoXGMqRBntBykWc/9AfFL19b6Q9G
	vTC14LGk83kgDAehgd04M0JxKu3JAXHOOOoSM/s=
X-Google-Smtp-Source: APXvYqxWb5HCVD+FbL47SAqq7jMZ6eDFZxxEL/xOU3O/f+ls0wvAcFCZagRPMSJ93sij6utbQM8mOBYGgpzpE+A+nUM=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr1549776ejj.6.1581345718975;
 Mon, 10 Feb 2020 06:41:58 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com> <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
In-Reply-To: <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2020 09:41:47 -0500
Message-ID: <CADkTA4N+i-S3Q6RoB6m7mvfBEVuiekjq5_VN2A+APu+EioNEow@mail.gmail.com>
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
>
> Perhaps these should become unconditional appends to USER_CLASSES and
> the DISTRO_FEATURES checks should be done inside those classes.

FWIW: that does work as well, just when we were testing this about a
year ago, it wasn't required to hide the include in the class. That is
the design, use the USER_CLASS loading, to defer the distro feature
check to a point where it is resolved.

If I can reproduce the bad behaviour here, I can definitely shuffle
things to the included file themselves.

Bruce

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



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
