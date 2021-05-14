Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.4097.1620961759913695645
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 May 2021 20:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AqeHW53y;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id c20so7263357ejm.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 May 2021 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+fAvmiZhyLYOicok/ycJUb/3aCo5eMayX7RIbXMOSw=;
        b=AqeHW53ypmg9FIRdX/IUJXa/NCjhEmt21JnpzC0OsTbSNRTbC4h4ivGemBEc66PEdT
         TfpGUyHa0xRmT8bBExywkqteVWk/YrcHvL19HgWKfnTDE1U7rypqAA33EL9XXveQnI+V
         NSu1Yh96Yc2HrgNTvBc1LO/f9+e0Q0MAK4uzMMTzrLwiRuKGYKKA2VsP2G+LvRWLcZCR
         4fD70VM5Z8xZUQn8mNmspDGFM77rkQnP1TJ/4FnQ5wsiZROh4NncvHwN2MXcf7ulQLkv
         ltG+6yKYzTD6ApU/DmTykSUOv9buhU7ti1BigWW2EPzo45xVQa7hDbWmLc+BUofp5sM2
         S38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+fAvmiZhyLYOicok/ycJUb/3aCo5eMayX7RIbXMOSw=;
        b=b0DULxlWWGploweRz10NDCF7oY42cxBQw/imWmPBnlE6AcyBtRtZOmVLoTX5h25wzq
         XAE3PF+iPfY+xTSmcrOfko+u0zLsvFul68MgmeXYCM9AH6EnlJc5NMAZ8F7NzmqP/uKo
         tue2H9qkTrD7M7L3xRoYQbrEgAX37A6KZMZraTp2tHHdkEszgO4hr0ams6LTkDH0BSt2
         M6MDKHy4oExfGlIlK7qn8PkVfSWaqlQaHYJrmgmCwtd8YKmbJpyr88HaXf7OuB8h564J
         X9Zx6PVOipPR0cEKmBXr9s6/gyoZ2WaKlkN8w+/2YShgJpUny9sQjPAuW5xQZJqPPw7P
         YfiA==
X-Gm-Message-State: AOAM532vhU3JXJbPFMh1igGDW509/q+lQXNhCiCHLqZCyGblS9+cN6vP
	suqC7QjfW5ttjwJvCQizHVBMQMduZuUmvf2ZMYktA7DWdXM=
X-Google-Smtp-Source: ABdhPJxUvslzE9jY5qKMMOZ56cSARiRjwYpCrRtlP1tb5GGfOPffghy27mNSjYUy+48m5cri0T6Fl1sCiVQpeGv2uKk=
X-Received: by 2002:a17:906:5617:: with SMTP id f23mr14519627ejq.298.1620961758377;
 Thu, 13 May 2021 20:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210513155812.3905140-1-richard.neill@arm.com> <CACMJ4GYdOzumXJQ5kTAGcMPpdYpfRtiQSzz=qqw5DKEUjkBpZg@mail.gmail.com>
In-Reply-To: <CACMJ4GYdOzumXJQ5kTAGcMPpdYpfRtiQSzz=qqw5DKEUjkBpZg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 May 2021 23:09:07 -0400
Message-ID: <CADkTA4OTa+AS=Qh5ayGR21PGDHJEPdzCUjVQrZHnYFBrC5P3wQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen, rpi4: fix typo in raspberrypi dynamic-layers inclusion
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Richard Neill <richard.neill@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 1:12 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Thu, May 13, 2021 at 8:57 AM Richard Neill <richard.neill@arm.com> wrote:
> >
> > Signed-off-by: Richard Neill <richard.neill@arm.com>
>
> Thanks, Richard - I appreciate the find and fix.
>
> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
>

and merged.

Bruce

> Christopher
>
> > ---
> >  conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index f1f468b..b3e5283 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -13,7 +13,7 @@ LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
> >
> >  BBFILES_DYNAMIC += " \
> >      raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bb \
> > -    raspberrypi:${LAYERDIR}/dynamic-layers/rasbperrypi/*/*/*.bbappend \
> > +    raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bbappend \
> >      xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bb \
> >      xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bbappend \
> >  "
> > --
> > 2.25.1
> >
> >
> >
> >
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
