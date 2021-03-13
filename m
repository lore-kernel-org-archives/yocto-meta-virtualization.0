Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3313.1615663851678823623
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 13 Mar 2021 11:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kq5H3YdV;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2D3B738C06DF
	for <meta-virtualization@yoctoproject.org>; Sat, 13 Mar 2021 19:30:49 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bm21so59718903ejb.4
        for <meta-virtualization@yoctoproject.org>; Sat, 13 Mar 2021 11:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Na77YGSgOoqOCfP30YqUIxYyno5By534vs1ks8v990Y=;
        b=Kq5H3YdVcCEhLPAbijpiB2+JwTVkyQisgFHszud+NqcRBWpzaXfTWdVFrwPQVUxwxV
         S31MNdwvfK8DcwZyhJt5Pi5sN814DJJhGjtEUXfRb6jcsAMRcRD8NnVz6LLsr1/Fez/R
         cuGgjumy7zdl7Eyl2RrJSOMGNlWlgnvepY1fX7kIjpELQ5vahdOnymCGtoIhV9V4CSiI
         lxdS7vFl7QtFW+RzajVNt+78SkeVnBnR4rE2CAMeCh2QNZBJBdPpSw9nHgZz7HlU746H
         4ZNdioo9fQJg6nTnIDxffsClVHOae2rg1UqtWsh8k4di02LFdXkFQgQNc79Nj9jhzaU8
         CBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Na77YGSgOoqOCfP30YqUIxYyno5By534vs1ks8v990Y=;
        b=mBGLHmbge7OlsF/5x27EfDmqUZZLt8Teq30Vmd6gyF37h6ENC67EFCferK3POj6cVY
         GpUXv8NVAlCg43S6YtWmoe/JXMBF+gPv+grGoLzUNQVaeObspKaQ0SA5CedPoFkKhLdn
         bpo7WQqwtDfihHVAhat9oXF6wDLyUtb24xiwfo33bi10VWTeRJc1JvcsxFY6PaNIs87p
         Y/LzmwF277E2ENXrR2yYnzv6RPqA8TZtZROOntk8lpb/7yC/2puQf2mjrN+WX3I5MIB0
         w2qd/f8LiOcsUnOI6Tx7DIYVydVCv5jN7UOnXF2QtPOfijhmAegS8RdlM8LnZFeF/WiX
         D8/A==
X-Gm-Message-State: AOAM533RrMOOQwamxm7qpnSXkL0PILoP2rpq7E5jzPp+0mfKKuirRPQM
	a00tgOW5OaEIVrhnaavBlt0HwhNAheSlxFEGNlTxVbVMfEM69w==
X-Google-Smtp-Source: ABdhPJzSZ3ARgptfd82APL3/saeWrOAwPXEw2L9T4BBuLzZw25xWBGB5eqL8dlwpjHm8C8Xm2LEZMjGwGo58o+joEWk=
X-Received: by 2002:a17:906:110d:: with SMTP id h13mr15597388eja.357.1615663847686;
 Sat, 13 Mar 2021 11:30:47 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org> <164627F27D18DB55.10479@lists.yoctoproject.org>
 <CADkTA4MKnhDuf85C3X=CxqrMkCKy1ka3fWxVNfSN9U=m2cJWaw@mail.gmail.com>
 <DBBPR08MB4725AF4604F11A7DF0A83E0491E80@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4PgwD1OwPa4kjAGHANjHYG7fbgmZAvGSw6nEt1x1Mvh3Q@mail.gmail.com>
 <DBBPR08MB4725692B5248F6A8064C6CEC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <2a18b921-a876-5880-2f7a-43b1600695c8@axis.com>
In-Reply-To: <2a18b921-a876-5880-2f7a-43b1600695c8@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 13 Mar 2021 14:30:36 -0500
Message-ID: <CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 9:14 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-11-12 08:04, Lance Yang wrote:
> >
> > I started k3s server without agent and confirmed the node is ready. Then
> > I copied the node_token and then ran k3s agent with that token and
> > specified the server url.
>
> Did you do this on the same device?
> I always run the k3s master on one device and the k3s agents on other
> machines (and thought that was how it is supposed to work).
>

FYI: after literally 5 months of on and off (most off) debugging and
integration, I have finally gotten to the bottom of this, and now can
bring up my all in one node out of the box!

I can now pull k3s into lots of little bits and am confident that I
can support it, given my recent findings and debug.

I'm cleaning up changes, and will push a fully updated k3s to
meta-virt master in the coming week.

Cheers,

Bruce


> BR,
>
> /Joakim
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
