Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.28323.1620007583480452783
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 02 May 2021 19:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E/hWYIEy;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id u21so5528252ejo.13
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 02 May 2021 19:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NV+0tM7XPkQD1tjoRNoEgj/TU9XeJj9wCOL7+fu9/fQ=;
        b=E/hWYIEyRTPerWAESA8AFiyr8Ba+HQ9B1sxgZ5FK0w2VcXiNG4GMc4FVcfqFCLQwjy
         jfc9TfuNq6XIoB87Ob6KZcPWWntKmMWWFVG9W/NtNQh/XlMjQPMsdpcdReXV/16klk8a
         vscAIWTjSZbk7358jEjHJ9rg9xB/ixtkI4GF2gFjMUmEJ3uDuSUHg3zdwAOeir0HuaB8
         Jb5zZ/wwaoiPoWNrgTtJZeTIW/4pZFTG0N70Iiyz6hN3W0+CzOG9G/gqARCh/khd1yyM
         tncpUM6lyJ4Ie8WfHp8VMgwz6f2GrLcyC5awbe5d7mGP3Nl1cUAIMMAAf2mPtxXCl5BF
         upkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NV+0tM7XPkQD1tjoRNoEgj/TU9XeJj9wCOL7+fu9/fQ=;
        b=uHiMykYyaLqt480x3xDh47dLIBlpWCiBB/JiU4FwLcx7WaFVfmFykiR+UdO2Majyes
         9+olAPKku3xI5WV+qW8rfxlZSOq/AH53L0Kn4KPs7NhZuF1BG5MiZnFG9jjbmMGh3Sz1
         4Ray66JqIuQmvBsh1BizBkC8LkHmnKmNwhUtfKtE74EwM0m5CpoLQvcyGVD0KGmn9U/O
         B78cFXwhMEqNtEKcFF2HEbME0ZEUadZmVua7O9XluykM/K2xLruKdgLvcdlJ9PEimx77
         pHhXpLpbQZf7AdZO8+jnZRhNbyukOx5MkOOLtfzKAA4NfjBFNtpC8uy46n7PLnNvjtMQ
         /v+Q==
X-Gm-Message-State: AOAM530hxxffqrreLIndzMhCeDPCG2vjpx42i4WzSq2nmwm+GR8436T6
	6uMlsItjL1hJKWGK7ADrq9HXEaSKKr8G0XTsuLg=
X-Google-Smtp-Source: ABdhPJwllNzL5cwrfksmZf4Z7ZguA0i1qcsSy8fW2YErbn/NFv01m6mEBrWFb1il9K2+5K9waD7rs7v3uwyQeFdIv1Q=
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr14671806eje.517.1620007581910;
 Sun, 02 May 2021 19:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210430010311.29911-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20210430010311.29911-1-mark.hatle@kernel.crashing.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 2 May 2021 22:06:11 -0400
Message-ID: <CADkTA4N4hyJe34UD7OTu2jaSsOVxGM78ef5uW3P-nxX+LYbtCg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] Fix for xilinx bbappend
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 29, 2021 at 9:03 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> This change applies to gatesgarth, hardknott and master.  The same patch
> applied to all three branches.
>
> Without this change, it's not possible to build an eSDK w/ Xen enabled.
>

Merged  to the appropriate branches.

Bruce

> Mark Hatle (1):
>   xen: Remove deltask for setscene
>
>  dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
