Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5355.1609855144250512008
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 05:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vbne70M8;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8892738C069F
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 13:59:03 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id w1so41254972ejf.11
        for <meta-virtualization@yoctoproject.org>; Tue, 05 Jan 2021 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPyjKI7BNFTpoEQs3T426pd+5nqkWiZPRU/A4VLX7+s=;
        b=vbne70M8U4TNvjXujvjRmpyoWwHplr21p0kUAZMEckgy0A/8DtIRlrwURSuMlTXMIc
         Gi8k5cY0ohEV4I4X6iVEDoR+B//yzsP0UHHaoQo/DhV7bPAst+MWaqf3XN9mleMGe3iy
         igTzjTmwkXaODV9ZKPdh3THsBWk9W/GkRqye0cjYQWMqaAeVY9NVNPLfQxlwU0xjSG64
         NHt56+Il+E7BjpRBLDhqexcL5nqKtDq10OdqBujUdAvskoIK21gr+suzuTcMhpAFZPnU
         g4YG1aTVUL+4M60u1ATI406scCW4XllDM2jK/ssrTl1tj40brueVas3gUVe7jJQdzXIA
         /x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPyjKI7BNFTpoEQs3T426pd+5nqkWiZPRU/A4VLX7+s=;
        b=DTXc7LHJvIAXm+Rbwp8BNSBJMjIHA4PC/14cJH6ORIVoDZwR27HdIeySbIhYAIvl79
         vtkE54U1021abHO8aZyoHP0Qclsw8cvHUMokRQWl7q+3yZxf82VUvCV6FFTCSZMFJil+
         rK9uzkDaP50l3Tm3R09c6jso7RAtG2H2zfxyOGku7wVnEudaJiJOypP8dWWI2spXS9hA
         ptmV2BgcfnUWpbeB6Op1ZVvnTPq1159nzWsUscJr2i19bQ1L/BK+o06hzIz9LYrd47T9
         ytyN6Ql0jpm+xXUeVpXkY0WxzuRQdEZtCpecJsFf8ZInew55i3M1p7xyCYm8hC2n+z6Q
         LK4w==
X-Gm-Message-State: AOAM5323xBXEevJDHXPX1Q2Ay/28phheTHGyzEuo9Vhet98GufXHaZTS
	3JcvWfB3NXam4Kg4IQEiAxphxIPlkLtSZ2NGoz4=
X-Google-Smtp-Source: ABdhPJwuVRZfPLzvMlwm3JRcFRNresXtpqdZSiZ8Gfz0OSHPDLf6Soxud13tVb4DWvAighSBPI8YA2EwOCjdSmKrG+c=
X-Received: by 2002:a17:906:edc8:: with SMTP id sb8mr70996868ejb.247.1609855141816;
 Tue, 05 Jan 2021 05:59:01 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com> <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com> <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
 <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4OOc_dL_8KVDFShHH5AkQXnpFoUAC7VOPEqnAPGH6qwLQ@mail.gmail.com>
 <24132353-1078-bdbd-5856-3c644d615f1a@axis.com> <CADkTA4Nrekx9LMEQP4ZJ=6T6Vt1tLMeDEgpY9xW4YY3aZEa83w@mail.gmail.com>
 <244150c1-c21d-9339-d189-ed9e80d79a37@axis.com> <16570B29E8680DE8.14857@lists.yoctoproject.org>
In-Reply-To: <16570B29E8680DE8.14857@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 5 Jan 2021 08:58:50 -0500
Message-ID: <CADkTA4NyWVY03JwZfb6HYbJ=SYtobXW9gJ=C1mNQ4CV2vWscjw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 8:41 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Jan 4, 2021 at 2:12 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
> >
> > On 2020-12-22 17:15, Bruce Ashfield wrote:
> > > So that rules out something in the kernel (and its config), the go
> > > version or something in our rootfs being missing.
> >
> > That surely narrows things down.
> >
> > > But as soon as you fetch the rancher binary, restart the services ..
> > > the containers come up just fine.
> >
> > Is this the same thing that happened for the k3s v1.18.9 build too?
> >
>
> Yep. It is consistent with all versions that I've built, including the
> pre-release master branch as well. I was hoping for some "uprev magic"
> to fix it, but that wasn't the case :)
>
> I'm back from the holidays now, and will be back into this shortly.
>

I do have one more thing I'd like to try (I didn't get much debug done
yesterday), do you happen to have a k3s binary that works in your
environment ?

I'd like to toss it into my image and see if it behaves differently
from my builds and the rancher builds of k3s.

Bruce

> Bruce
>
> > > I'm diving deeper to try and sort it out.
> >
> >
> >
> > BR,
> >
> > /Joakim
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


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
