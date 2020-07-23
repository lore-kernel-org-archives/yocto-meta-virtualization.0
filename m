Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.11070.1595507385072135799
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 05:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qh4o1SDS;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id by13so4356386edb.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2020 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q0DjtHXOj+OrMryxccrX1YyKk4g3ADz/Th4rTPxgwFM=;
        b=qh4o1SDSTtFr33qEBQys863ZeLQtxtbGbl3tGnUHamWHnsfk6VVlC9ElC6nT/LYU9c
         56LKnq+LByEXEl9mgc4WiYll2xVC6D256P/9El9imTuFHYD3Mue01+BvbjB6vYYj86hG
         T/FvRpVwoTOoSwbi+TPmuScHR1BGdm9gZeiYHtQXJu422HdxXrm8NNZWbAHuiJD2pZLu
         LdhgDSHrOduFymaT8CO0EIxlBbF9Ka1wrQVSye9kNZlItJBpv073ZzuDb410wx1Iu9aE
         6G10hU1xfHnU06ADDumScEaSTCM4YG5biWPbtRrY/ZHSP+E90JJZmgr4AtswPzaIJAwF
         cUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q0DjtHXOj+OrMryxccrX1YyKk4g3ADz/Th4rTPxgwFM=;
        b=OOPoetyRznq0Sk5VLjnX19P6aBbi7NvWeK/My686tA56cUFUbS+3imQmRXDbEWHZ7h
         kbQT73+HmTUEy+RMJnHD/P9Du/YjgqqxNjTFhYTJw5H/ertdSBwCGY9IEcL0wV5TgVM4
         uL8d6UgxAinUjGDZQrUhdG3HV9xN1fCF+0aAGP0n4NXEUf4LcUfJ6bnfV5LBtUlqUSQT
         MtMdg8aCxL78kcn68qlvF0j0Lkh1cW83SYRDpmrtiBl2VdpyLaEUhdqSAlfBt6p748XW
         Ce0RuCX/XME+98tDjTAFAudW0P0DkwUEPDVHgX3zNLxGBmezopWoW29cbTfYfIzBHJr4
         PZ6w==
X-Gm-Message-State: AOAM530jpz8Pk2s4l/F5aKLzFg5Hn5yHWW2dxbNlvY+5onhY8qbrxWYt
	WNUCDsYD8vJv717/QcSjVuGxTLbO2B2p3ME/Hz8=
X-Google-Smtp-Source: ABdhPJw/qRWZ5uHvjnsFALvjZ+JmInogWfNOUXNoY/fARIc8TLl/zOJJqWrXEiKNxnz6zj8kk8QhyYnrKsY1VDV/klg=
X-Received: by 2002:a50:cc4c:: with SMTP id n12mr4015690edi.234.1595507383485;
 Thu, 23 Jul 2020 05:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <QMcX.1595504908355333125.079B@lists.yoctoproject.org>
In-Reply-To: <QMcX.1595504908355333125.079B@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 23 Jul 2020 08:29:32 -0400
Message-ID: <CADkTA4Mny9-1d8V5o4=85LVX5soNThjXZ7FxXdX4TDyROb91PQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Comment / Feedback to include RPI-4 patches on DUNFELL branch
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 7:48 AM Ashish <ashishm@mvista.com> wrote:
>
> Hi  Bruce / Christopher ,
>
> - Can you share comments / plan ahead of merging RPI-4 Xen patches on dunfell ?
>   Currently most of patches from Chris are being on master branch .
>    And since Dunfell is an LTS , are there any plan to have Xen on Raspberry Pi4 on Dunfell branch ?
>

Unfortunately no. These are functionality patches, so they aren't
appropriate to backport to dunfell. They are also not being tested
against equivalent dunfell branches from the other repos, so
backporting would be non-trivial.

> - Or we will be having these release patches from "Gatesgarth" release.
>   This can help us to understand in a better way.
>

Since they are in master now, they will be part of gatesgarth.

Bruce

>
>
>
>
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
