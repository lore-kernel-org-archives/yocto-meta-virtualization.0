Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.33582.1598802139426844474
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 30 Aug 2020 08:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ljZGzWGJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id l2so5314030eji.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Aug 2020 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3YiTbDpfCm3113d6U7qrddM1C8Foa0o9JVHuBnUbrS4=;
        b=ljZGzWGJqNpVVL+RdV4gL3Nt8fDXC3EMjgDpei0KYrvz2ipHwquKFMw2dXVTgdc5fo
         SwXwhb2UfAsYB20B92CQI3nwWEc5k52qG7Y3+uy4Pdy9QNuknt5x0NZvlc0NLnXX9fBE
         EGl9qbL7NOh7Th8hufvIbBu36TNlRIp4wSI5Ay9HNRqbUxd5sq/wu52mvx7mlN/z4Okt
         58Z+B9Ev1FczO6xmiEKDibrsB/jOgyAirHvCYThhZuON9TZ5NUIM8ARUW7xkqzVFTM/G
         hfCvEOZEJsWtq00nvQpRQsGdHyDpawTnFTnGwZiKHuZcRiCrrv4cctpW7z0DGh+LUWM4
         S/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3YiTbDpfCm3113d6U7qrddM1C8Foa0o9JVHuBnUbrS4=;
        b=Cdbp1MDJTOaMBJ0GNqtk2DR/KIaDFY0rK/AGhaqembuJUZCS7op0r0xx5VdMhOeB62
         au1E//kUgg02wFKrliXu1vdH8HEn/p7QB9c1dpbPXIuN+qn0I7J2osat2nYVHyAFjHG1
         Nkt2T3xR4TCWt5gxPT1N3fZmkOpguPb4ykA/w7ZNfOjrnGEwh57qabmmVgFhEhjwNe5h
         RYVHIPwRUV/4JhaCnDKS4yZ4UbsNb8flWoOwO/DYvfxCylJ7OBKCp0iX8Q3kIgFX5NkU
         UznadAVtRFEN3o1LhlGjaHL+mljGmWevPHez1bLVISnsdfEOVpfOSroNXOlEOtpdhPlR
         vkKA==
X-Gm-Message-State: AOAM531Jsg6O1HsUKo/qeblGMlqmCUgWkYJCQdlHM8Y9s04rAzvWqBUh
	rRE0qBVXT6RPuMmNynI1pMVuhUIVIDXvsCPnKQk=
X-Google-Smtp-Source: ABdhPJzgWZbC1n8a70ti/3I8i2Tc+iQ87wpl+qteceVClgr1e0CLbjG3jEBNlnkbYLHrFDs1uA0tXlqjEWXFJCLZCtI=
X-Received: by 2002:a17:907:2713:: with SMTP id w19mr7986828ejk.357.1598802137829;
 Sun, 30 Aug 2020 08:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4OfiXvb=9D0NWU8-Oy9qzivgSLA3byvBDN6Ly=yyEc=Tg@mail.gmail.com>
 <18858.1598775427877475112@lists.yoctoproject.org>
In-Reply-To: <18858.1598775427877475112@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 30 Aug 2020 11:40:17 -0400
Message-ID: <CADkTA4O48=2Mwwn4VzZEcHHgtdDDpAL4onZmwrmwa=ye1zAMLA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Adding k3s recipe
To: Robert Berger <robert.berger.yocto.user@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I'm still working through unifying the various flavours, but had to
take a few days to finish getting the 5.8 kernel into oe-core and
fixing some multi layer OCI image issues.

But I'm back on this this coming week, and we'll definitely have
something before the fall release branches.

Bruce

On Sun, Aug 30, 2020 at 4:17 AM Robert Berger
<robert.berger.yocto.user@gmail.com> wrote:
>
> Hi Bruce,
>
> Do you have any news on k3s?
>
> I would be definitely be interested as well in this.
>
> Regards,
>
> Robert 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
