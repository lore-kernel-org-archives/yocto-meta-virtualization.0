Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.12495.1635425630660218891
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 05:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzfyvJtf;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id g8so24765179edb.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Oct 2021 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8I+HWxtmtysHwTMAIImcEXfvSKz2bMeCMb8SxjqsAI=;
        b=mzfyvJtfPahcPhOemZLNaMJ8Gq9Gr/faL4y3taqQ/kiuyCuvm+3Tb+pbjuXzeGuJpC
         dwdTrsFncLqnqYUc8bjXxyqk5z0t22uwCTTuWbIId38gUoYsK0uM8R0W+BJuIF2bhHec
         AMqEMeLpBZfBmZa7FRN1hA+Try9kUpzcoOZQNtOlTet6sNuS8hSLWwE8P50LI2pPn7Wh
         Vi0s0FXs2WttuMG9E31645a60QX50ISlNGLbY2s+UZZfLiOsG+vat611GIYL7Nsu9B0W
         5CmgyDVhPLs45UMLyANAk2LCtmji7celBPosFveRgtrygyColZkr9W+ODSsyB8gBdYoh
         cxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8I+HWxtmtysHwTMAIImcEXfvSKz2bMeCMb8SxjqsAI=;
        b=wU4fprZu3Ev0XGEelQ133fCiXl/gjRMOg3PUPyJj2eI2I9iJCY1QZ1qmQq10XEqJ/C
         pkAGmqxFI2ZAm8fgb6Xkyz7BTaZcpaNGA0egTe18j/WNOUsHAJImBKbD3AK6yL3ZS0St
         aMsx5AtHBcXLYzdsyM/B0+EvKSIyrdAUT2ZnRdq7WI3CROcyrs2NOYxwXyq5Muqp8iYc
         8wFe7ek7pkCnf4vK6BLf7ACQqIxFP2Z/4pQWSLTtzs815rDuVSafnGeTSsTMa9/UviRp
         9PTlZKM4QnY6SUXmIohldNCEkK5Bq9wfsw9D5AzaFxMv+HbV3Jrf/b2+bbQcsXyMEd3+
         lNdw==
X-Gm-Message-State: AOAM531yDsTogfLKSZfxEtPwOiPkw1HW+tJxLg96SGF+OCNfYM3BDph9
	wvEwht5SyYR6dLaH083Joa3aP44IwnUrAtVlRXk=
X-Google-Smtp-Source: ABdhPJza0PHWwNE5VXSfmdgOk4vBzlZotucEihAQ0phdj3PzPfrm/BKolwFwqiNHLXuOnbzT2KoXLzZmRq/ys7Lu8Q0=
X-Received: by 2002:a17:906:9bf9:: with SMTP id de57mr5160725ejc.35.1635425628641;
 Thu, 28 Oct 2021 05:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4Ppi=7SLtd4hbDPZT1WARmaxs_7dwKMqa33wPuxz9aGLA@mail.gmail.com>
 <29697.1634888278709637812@lists.yoctoproject.org> <AM6PR08MB346139074D6A33370A78A2DB92869@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB346139074D6A33370A78A2DB92869@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 28 Oct 2021 08:53:34 -0400
Message-ID: <CADkTA4OCgCGfqu+xS3=bAAKO_ZAU0mLRw-dy0m+sMmzux4jNyw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service configuration
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	=?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 4:36 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
>
> Hi Bruce,
>
> Any expectations to have this patch chain backported to honister?
>

I've tagged them for backport, I was just busy trying to figure out
why python 3.10 is breaking master.

I expect to get to them shortly.

Bruce


> If it helps, we can send the patches targeting honister to the mailing list.
>
> Regards,
> Diego Sueiro
>
> ________________________________
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> on behalf of Kamil Dziezyk via lists.yoctoproject.org <kamil.dziezyk=arm.com@lists.yoctoproject.org>
> Sent: 22 October 2021 08:37
> To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org>
> Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service configuration
>
>
> Hello Bruce,
>
> Can you backport these two k3s patches to honister branch?
>
> Thanks,
>
> Kamil



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
