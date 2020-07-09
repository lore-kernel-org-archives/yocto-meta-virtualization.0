Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.9011.1594308026785375811
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 08:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rvm80Lps;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g20so2153924edm.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jul 2020 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LGNrMHenGjuvuHxcrHQo5Yup4OJURYbXqQqMGkkrH9k=;
        b=Rvm80LpsRNCEbcZ8QsbBmE80Eu7u88Psv9kOKZfK5niYJLR4mQnIWLjeNbh/E8iZzr
         qxA4KXPKUr7PLcpPCymtjI19W3eyNU3itUwHkt76ynW3PvVqMT/+yXRGOUBdhPekhn5K
         Kp7xXJXI8RArV7wUPPpFM3o+t0Hs9mExbtJ2NGFD6K+ZiMGoIGsU7x4WN4IbIqHScsd6
         dcZQR1Ng9X9K/NHJZBypN7rRtFgVlL9f0S4K9/XF6Z199sAglYYQ/un0gPqGzGOWMKlx
         6zXdFPDh3wBjqh1xezH+glXoMMo8p7B0eUDxqEmuyh8iwzJlIYsf09fCYFPvC9YMQDox
         +Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGNrMHenGjuvuHxcrHQo5Yup4OJURYbXqQqMGkkrH9k=;
        b=AMRrHcQv0eJckusvCYwaKWNxKyKnJ3lpPAME+u0XuYCIE58Kd5dCIAA35TPJ+Pz+5D
         Imo/eKjSNeQ+mf41/O4pGW/wqkpSGaEdrcMGo0zMSsT9QHhMjJZe+Dzh3lBDQed63TlF
         2cM3pnQ8I1OmcbNBIGNyIngppO85DIpRm1mVaA3Z71qa25lZfhsSaqU1B80EHv7BD+73
         0S23Pt/U1AVsrXhmqFNuCA50zl/mfJK25b3khf6t7EINUKaFve/42jiYReZ+qwX9uZBr
         ye/FM0rP9dteyg9bHj2vJOQ7ytCAw54Hdn9XVgIapUouITw8a64XIUCCN4HoaaqWAIWS
         VmQA==
X-Gm-Message-State: AOAM530OvJI9GOT4BiRhQiBSB48SOkPnRWvtN1r6WHY4Q4cP9r9a8cXW
	1TWxaatKgWA/Yre/7rn/RwwxHUqboep2SUdbJf0=
X-Google-Smtp-Source: ABdhPJxXqfBEHJlmZuBcy+47J79EmOgNG0jjBv/ys4WNxJdDDlmOin9Yb10/IjDbZk8txlroVdjTpAu7PUdVIsXFCkM=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr34608285edb.352.1594308025286;
 Thu, 09 Jul 2020 08:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4P65T3DgutJLAXe0c+15i8Jze-nWGgGeMUt5h9nYU5GwQ@mail.gmail.com>
 <18345.1594307829900176542@lists.yoctoproject.org>
In-Reply-To: <18345.1594307829900176542@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 9 Jul 2020 11:20:14 -0400
Message-ID: <CADkTA4Mr24hMoRyuT+vey1e=Y_Sd5T44W5w1UWv1u0o4zvWccQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [m-c-s][PATCH] salt: bump 3000 -> 3001
To: "Fagundes, Paulo" <paulohefagundes@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 9, 2020 at 11:17 AM Fagundes, Paulo
<paulohefagundes@gmail.com> wrote:
>
> hmm, that's weird. I've deleted the `set_python_location_hashbang.patch` from the recipe because it no longer applies in 3001 see [1].
> I'm not sure why it tried to apply it on your build
>

The actual low-level patch error is that the file cannot be deleted
since some parts remain .. which means the removal doesn't match the
exact contents in the layer. But since no one else has touched the
package, that shouldn't happen.

Bruce

> [1]: https://github.com/saltstack/salt/commit/bb03f4a0ee071982d69fec574a3aea29714aa5e8 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
