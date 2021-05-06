Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.1427.1620316692666504434
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHf0AmJc;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n2so9025354ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 May 2021 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y4ARI1A3JYthzc6hfxGzHY3hAh/og8leWuzxlg3YeRM=;
        b=gHf0AmJcKCT18GHI2Z3O2k7oo7RPgjtyaE7xLEvMGrRhWjCON/JXvK115cj1dg1il5
         7lfR6lZ1ygKoUnjgsx1g/vQ/9S6ncYWYWB2cNNna0nnnScOo4Dxa/GdjDZuZz39UDfrC
         IyXahcf4vueq4hTTZ3Z1IMEvU2RPcj48J0BCiuaNTT9H81CyWso8nrPlFM8jamfbdbyp
         uzAj9UesytKFVITz+kA23iG9BBYTMKCwfyBXIVzvp/hgPBRQ86oGi6UdpCUKdYyoc8Es
         xrAF0a08BnSsYUtS9Qnqu3OqFzEPmI4iORLJVZwnj5VQme+JgFTb8aHZD8ODA10M3244
         fx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y4ARI1A3JYthzc6hfxGzHY3hAh/og8leWuzxlg3YeRM=;
        b=pm/6DtMu2FWXUCuPBBwwByxObcZ9iwFw4tjFNjrWeofxqzXL265Hp4+Bj8Cy9UgUgo
         OTcgUAgd9q5RVP8/5PXloPWV1jSoTQQ8qGnHoOAo05ygOnOygvBKyrByIzy7vPC4dlWn
         ycsgrBCbHVRE4mqAdvu2+kPQe/ZGqXGtUo/iXSQK//V6hod4e0VjcsrxoFb5lIzZZm2Z
         SRBQC5yNQbivd7hLJHUkUUZOc/iQ/vcKa9IknTVzhnWf4hCx9tmPZ4hZZv2NkOULKzBi
         ETRPIwivdxPykRVRmQ3/uj7wUMbgLkaU9F4HPJigfQYFdgSxaAKmXB3BdEXNU0DuSV1u
         /NyA==
X-Gm-Message-State: AOAM5339CFZWbijLX0jQZshBWgbyxH9A2yNQMmW0YDn0Yk4E1dIYQRaC
	3cHWR5s8593eIOVjFhmhhQWN5XwLGroTsENPfXw=
X-Google-Smtp-Source: ABdhPJydCRI4+HLE5i6MUQSICpxja7xniZjNur0swaaui283vIIGkvkUZ7gmArLvgt8+uq6VRtnKiFoW8XlajgQS3LI=
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr5251812eje.517.1620316690957;
 Thu, 06 May 2021 08:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <aa94d0e5d2b32687aeb60654ca22ac0d009fb8d7.1620315173.git.diego.sueiro@arm.com>
 <CADkTA4PBqriL1Dc6ihF7wdf+RhTBJjg4sU2bw9z1oXcRSGFngg@mail.gmail.com> <AM6PR08MB3461DD67AAB435B31A06EC7592589@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3461DD67AAB435B31A06EC7592589@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 May 2021 11:57:59 -0400
Message-ID: <CADkTA4O=qdeijzOsLVPFR1iuFzj3-GLtgNd0cMCifoPH3xBF+Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-tools: Pass -Wno-vla-parameter to workaround when compiling with gcc-11
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 11:48 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> >-----Original Message-----
> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield via
> >lists.yoctoproject.org
> >Sent: 06 May 2021 16:44
> >To: Diego Sueiro <Diego.Sueiro@arm.com>
> >Cc: meta-virtualization@lists.yoctoproject.org; Christopher Clark
> ><christopher.w.clark@gmail.com>; nd <nd@arm.com>
> >Subject: Re: [meta-virtualization][PATCH] xen-tools: Pass -Wno-vla-parameter
> >to workaround when compiling with gcc-11
> >
> >Ross also mentioned on IRC, that fedora is cooking something up:
> >
> >https://src.fedoraproject.org/rpms/xen/blob/rawhide/f/xen.gcc11.fixes.patch
> >
> >But I have no idea about the upstream status, etc.
> >
>
> I'm not comfortable in adding the mentioned patch since tests need to be
> done to ensure that it does not introduce any regressions.

I tend to agree. Until it lands in the Xen repo, we are still
potentially introducing issues and are on our own for fixing them.

Bruce

>
> --
> Diego
>
> >Bruce
> >
> >On Thu, May 6, 2021 at 11:38 AM Diego Sueiro <diego.sueiro@arm.com>
> >wrote:
> >>
> >> When compiling xen-tools (4.14 and 4.15) with gcc-11 the following
> >> kind of errors are produced:
> >>
> >> linux.c:164:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const long
> >unsigned int[]'} declared as an ordinary array [-Werror=vla-parameter]
> >>   164 |                                  const xen_pfn_t arr[/*num*/], int err[/*num*/])
> >>       |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> >>
> >> Workaround it by passing -Wno-vla-parameter to the compiler.
> >>
> >> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >> ---
> >>  recipes-extended/xen/xen-tools.inc | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-extended/xen/xen-tools.inc
> >> b/recipes-extended/xen/xen-tools.inc
> >> index 3560e79..e939c45 100644
> >> --- a/recipes-extended/xen/xen-tools.inc
> >> +++ b/recipes-extended/xen/xen-tools.inc
> >> @@ -725,9 +725,12 @@ do_configure() {
> >>      do_configure_common
> >>  }
> >>
> >> +# Workaround when compiling with gcc-11
> >EXTRA_CFLAGS_XEN_TOOLS_append
> >> += " -Wno-vla-parameter"
> >> +
> >>  do_compile() {
> >>      cd ${S}
> >> -    oe_runmake tools PYTHON="${PYTHON}"
> >> +    oe_runmake tools
> >EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}"
> >PYTHON="${PYTHON}"
> >>  }
> >>
> >>  do_install() {
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >>
> >
> >
> >--
> >- Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> >its end
> >- "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
