Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.8501.1617972138121178846
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 05:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rAZ8srFK;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id ba6so6398602edb.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Apr 2021 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+J+aFtznAo8udeWafjVebqW15Tnm+dhieKMD5YoFk6Y=;
        b=rAZ8srFKVmOL42ikPlk2G4FNVbHx8K5oyyTGvuTwxLhEDRLumNt3CodntBbcKmF24X
         RnUr2oR0vgS321MQicV9h0EzwuxTLejZTfE0vEgRgvKzHA90s15nZf/Pr01ehymhaiCD
         Q5clS8PixsoxycDNgAcUuMhmy/Ly9Ue9Cd0wcD3yOTn/T5Gum3Cd329XRZqxFMRG8xXG
         S/QtsK2ko2hI5zbrwAPW+keHiBOcmojCSrBm4o9NomtpPkE95BrJDLU9OPgSFHq8WA8K
         Iedwau7ZQ5+GUa0kc6b0I9Ewr8lcfb42b40YyxPmPRObUidw2gZ9NoquG0B+DXGZM1D8
         F7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+J+aFtznAo8udeWafjVebqW15Tnm+dhieKMD5YoFk6Y=;
        b=WiT62nTLPe3Wy+9sl0Xi9ptGJZUdGEX1yyl2ZxCVJpRrOvPb4ClpYsys/vtpWEpLT9
         SH0UGqItCiUhDy+2ZxqQZ8WPNeiMjyfwEM+zqUBo4Y25tL5e9HvJrEUSanCjaR+Z+loZ
         B593iQ8UvqU+I1FT06wrUvCXrS6j6w7zuRY+AK2KCAlKzW1YP1v3hCCWeTwffKiCmMT8
         OAoTzMw7AI9et7OZh/QXnJCozpyWIFhWBRxt0cON4LQR82vbKQi+/iB8sfLAIa/mM8VJ
         cCsz9Dk8QjLeLB8o5hYses5fDDa55Vmlsk2oGSCoSp6XHbldoMhq4Z8QqnWklhJB+oIr
         O5vw==
X-Gm-Message-State: AOAM530r7EvHwlJFHRZsJdy03z9RbIoJXAh1cjsGsVYM3yxY98pyQRpm
	IfLWxLaJqpZlF9ZgmSFGyEF0NSnZzxzUvwzEduk=
X-Google-Smtp-Source: ABdhPJwYa41MxxeXX9DI4VJ3L+lAasdYkp//LfRKQTvZx5UMyK5zHKXDNA/uT/eAWNnU6CPThYDz/YGhUi6lrw2zLLY=
X-Received: by 2002:a05:6402:3445:: with SMTP id l5mr17466788edc.27.1617972136386;
 Fri, 09 Apr 2021 05:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <1bd674a-eeab-7071-8aa-21cce3e5a7a9@crashcourse.ca>
In-Reply-To: <1bd674a-eeab-7071-8aa-21cce3e5a7a9@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 9 Apr 2021 08:42:05 -0400
Message-ID: <CADkTA4N6ivUPYzJns_uSgkzhcrJBOJ1abJwFvSK4ry=VvNccbQ@mail.gmail.com>
Subject: Re: [meta-virtualization] openvswitch recipe: .bb SRC_URI simply overwrites SRC_URI from .inc file
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 8:04 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   apart from the aforementioned oddity of appending to
> FILESEXTRAPATHS, i just noticed that openvswitch.bb, as its first
> line:
>
>   require openvswitch.inc
>
> which, among other things, does this:
>
> SRC_URI = "\
>         file://openvswitch-switch \
>         file://openvswitch-switch-setup \
>         file://openvswitch-testcontroller \
>         file://openvswitch-testcontroller-setup \
>         "
>
> after which the recipe file itself simply stomps on that SRC_URI
> setting thusly:
>
> SRC_URI = "file://openvswitch-switch \
>            file://openvswitch-switch-setup \
>            file://openvswitch-testcontroller \
>            file://openvswitch-testcontroller-setup \
>            ... etc etc ...
>
>
>
>   i will defer to the meta-virt folks to decide what they want to do
> here (if anything).

We used to have multiple supported versions of openvswitch, and
those were common files, hence in the .include.

Over time, folks have forgotten that it was common and have clobbered
the values.

I'll fix it up this morning :D

Bruce

>
> rday
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
