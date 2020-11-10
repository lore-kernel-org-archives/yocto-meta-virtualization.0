Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.26783.1605010710847175987
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 04:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h2RGZpE3;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id o25so13215628oie.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Nov 2020 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RpFLkfL6ImWCIDnAfD28n0V0p1+V1NFY1e+XpwiU4H8=;
        b=h2RGZpE3vuFe7kQThDCHlKEbeCkxe9OsCRbYVuDD+52XTOSh6PNPQI8/DtqYkrV/fi
         6MV+CkZgAXAUI3X2Sr8lKDmxLwTNhDpvlPsmOoJierpk4//Zwy3TJrK8jG2UKw0yERce
         14RNT8o6eE09BG94eJ3zYDswn/PGs+rYRYK6EvxajR/rIQtQUK7wrYH9xxB+XcLHDb7J
         2ozEpg6Zp8OpELnLpLeCpm5N0K/vxxm/2ekZ+eWIpdWmwAXdBF8KFMZ8yMauiKLon4CW
         q0WbCzoK0TM0UTFEHspcOrWpCrAlHl+kGoLVCzEvhylqXxyi5YT1m+1lOz7x3uIzSr8o
         n1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RpFLkfL6ImWCIDnAfD28n0V0p1+V1NFY1e+XpwiU4H8=;
        b=NtIrFBBOoC5x/YUUGMrBIowgD2YhmJdt0PhK2KHMhMAqZyxtvdr7SUHqby/jeASpeo
         VaHBLTjvlXkja6k9PNtKGesDqQaEsagaYXAfQ/zr2ZHkTFWdpyAc/djqhu5dxn6X31Pg
         OSgmrYr+DYuIhwglDJ2mR9S3kwn/9Wu2e7Nc8OgqNhF9B7daRIM902kbp3NG91UjCEkh
         7x0pJGQdgHK1igaeUD+c+6hcnFQabSuW+mIjEL0c0tFN6fHkO3BZ2jw5zw15jKt4KyF3
         rZA9fG2EMSmK4a2hO7fBXb+CJgeHR9jL6L6GlkAwMHMa5I4pNBDBcPJPcyIl2z6Ublgd
         o/WA==
X-Gm-Message-State: AOAM531JMfrGPFoSQb9M1jyQLxQWZwodZi/MQW3CJ8ftqSiGxKmXBV34
	XRamyihxkAKyJCtTIkPOnxnZjdJmI0IFKWIweLM=
X-Google-Smtp-Source: ABdhPJzjmMRK+vF4MSeRe/aHNfWnQdWjmFzvYqoIm6/RIXcgKs7xgJAB3Cp+eJQlbKZzizLtcgW/zuNtmEGu171t6rE=
X-Received: by 2002:aca:d941:: with SMTP id q62mr2634925oig.33.1605010710167;
 Tue, 10 Nov 2020 04:18:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604933003.git.bertrand.marquis@arm.com>
 <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
 <CACMJ4GYKuB_KVwfuGkcrYF5c8G-LHDKZGgj4+v13FjS+sctXww@mail.gmail.com> <DEB61562-75C4-4C3D-8CFC-EA18B4AD5166@arm.com>
In-Reply-To: <DEB61562-75C4-4C3D-8CFC-EA18B4AD5166@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 10 Nov 2020 04:18:18 -0800
Message-ID: <CACMJ4GaGOSDeAjfu8rZOM8xfey-dx74wDxteTqbz1m_EZY_tZw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen: Fix python libraries installation on multilib
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 12:31 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 10 Nov 2020, at 07:47, Christopher Clark <christopher.w.clark@gmail=
.com> wrote:
> >
> > On Mon, Nov 9, 2020 at 6:49 AM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Fix install path for xen python libraries when multilib configuration=
 is
> >> activated (which is mandatory to compile xen for x86_64).
> >> Depending on the version of Xen, the libraries are installed on lib o=
r
> >> on the nonarch lib directory so add both.
> >
> > Thanks, Bertrand -- I have positive results for this with
> > compile-tests with both Xen 4.14 and 4.15 for x86_64.
>
> I tried on x86_64 and also on arm32 and arm64 and all compile tests are =
now passing.
>
> >
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>

> >> Change-Id: I1f7f81a4e9e1420bce55d1e4bfe03d98ac2c93a3
> >> ---
> >> recipes-extended/xen/xen-tools.inc | 2 ++
> >> 1 file changed, 2 insertions(+)
> >>
> >> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc
> >> index 736a766..0c69fec 100644
> >> --- a/recipes-extended/xen/xen-tools.inc
> >> +++ b/recipes-extended/xen/xen-tools.inc
> >> @@ -496,7 +496,9 @@ FILES_${PN}-pygrub =3D "\
> >>     ${libdir}/xen/bin/pygrub \
> >>     "
> >>
> >> +# Depending on the version of Xen libdir or nonarch libdir is used
> >> FILES_${PN}-python =3D "\
> >> +    ${libdir}/${PYTHON_DIR} \
> >>     ${nonarch_libdir}/${PYTHON_DIR} \
> >>     "
> >
> > Do you know whether a similar change is also needed for the python
> > nonarch_libdir items in the -dbg package, when building older versions
> > of Xen?
>
> No from my tests this is not needed.
> Just after gatesgarth branch is released i will push patches to update X=
en SRCREV
> in both 4.14 and master (which will also allow to remove some patches).
> I will also spend some time checking dunfell but right now i have no res=
ults i can share.

Excellent - thanks.

Christopher

>
> Cheers
> Bertrand
>
> >
> > Christopher
> >
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>=20
>
