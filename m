Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.19036.1581321960584808698
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 00:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NCFX1zTe;
 spf=pass (domain: konsulko.com, ip: 209.85.210.44, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f44.google.com with SMTP id h9so5422300otj.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 00:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5HEOTBf9pBYH3xNAbk6abTu3Pv/OeWHyKRaHjgr+GM8=;
        b=NCFX1zTeIGFX9yayALBnJzxiNzlzMk1pzEfjsnaRL0bEC8I3LeF+thKWEdVO/cFxmB
         s3C40GST27bnSJWbsyt33R8rKKdqfB8jhvBN50wD3C2fHyBguw2Damnc3MSZVQhdqyoZ
         pAqgzClpTaZ7Kq9au+Bts7PcQ9F4n5kDoHFns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5HEOTBf9pBYH3xNAbk6abTu3Pv/OeWHyKRaHjgr+GM8=;
        b=GOCI03HGS/21OcHG9zhbaapw8bzDgAkHjW7xGqoa+XFnaZS5y0TYfhRnljk+1BoKen
         kz9XA7s1eRb818XVfC92H3zSgH6lJu6Jv96e1tRSLEmG+fz8Ur251DHdp/Pkk5X2VBvZ
         5/lVWGYCrFMrBHhF6KZmXthxKLFb29hsLnRinvcijir49QqZLLPjG7RQ2RYTSj1o1Kp6
         /Btfk2XflONGREoN5jAARWNChbBqOqaDkdFA8hvlZYyHE5o3OmAvDR2T/uXhXou8BXWG
         AXerH7i2RpqAHyXKxWaFaGrJTaz2ULeOg/n8vyqzmFiiPv46aJDJa9Jgi2fXCKOLaj0+
         mRIQ==
X-Gm-Message-State: APjAAAVrgzfOhuabdd90TiUh7gcqkdZe1jUGA8tuYzh6XPlvKm4uMaPI
	7m9Ew5BsamPBXrVgJmpbXpPCp58yzLOb6zdqr7Lsxg==
X-Google-Smtp-Source: APXvYqyDi/L4bk4XTWlH6f1Ps2ZoWE+jB3/LxXAE21MrUU5NmSCSu7D9d99KQyL4g/40h3fvaCKD9GM/EFw211KS31o=
X-Received: by 2002:a9d:6283:: with SMTP id x3mr164873otk.367.1581321959905;
 Mon, 10 Feb 2020 00:05:59 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com>
In-Reply-To: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 10 Feb 2020 08:05:49 +0000
Message-ID: <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	bruce.ashfield@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Feb 2020 at 15:42, Bertrand Marquis <bertrand.marquis@arm.com> wr=
ote:
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

This is correct - layer.conf in each layer is parsed before local.conf.

>
> Meta-virtualization is using this system to set PREFERRED_VERSION for som=
e packages but it seems that:
> - using require without a full path does not work (maybe the require shou=
ld be changed to conf/distro/include/meta-virt-default-versions.inc)
> - even with the right path using bb.utils.contains does not work if DISTR=
O_FEATURES is set in local.conf
>
> Could anyone confirm or explain me where I am wrong here ?

Looking at layer.conf in meta-virtualization on the master branch, it
does worry me a bit that these lines might not work as expected:

    USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
'virtualization', 'meta-virt-cfg', '', d)}"
    USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
'k8s', 'meta-virt-k8s-cfg', '', d)}"

Perhaps these should become unconditional appends to USER_CLASSES and
the DISTRO_FEATURES checks should be done inside those classes.

Bruce, any thoughts on this one for meta-virtualization?

>
> Here are the tests I did to end up with those conclusions:
> - "require meta-virt-default-versions.inc=E2=80=9D directly in layer.conf=
 is ending with a bitbake error
>   So the file is not found here.
> - =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=80=9D build correctly
>   So the file is properly included here.
> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc a=
nd =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=E2=
=80=9D in layer.conf end up in an error
>   So the file is properly included here.
> - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.inc a=
nd =E2=80=9Crequire ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization=
', 'meta-virt-default-versions.inc', '', d)}=E2=80=9D in layer.conf build c=
orrectly
>   So the file is not included here
>
> Is there a right way to achieve what is want in layer.conf ?

You need to delay parsing of your variable until after bitbake.conf is
parsed (which includes local.conf and other related files). The
simplest way to do this is to place the logic in a bbclass and add
this to the INHERIT variable in your layer.conf. The classes in
INHERIT are picked up as if they were at the start of each recipe that
is parsed.

Thanks,
Paul
