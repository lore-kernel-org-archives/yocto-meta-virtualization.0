Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.824.1605248458080757725
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 22:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=blHVvS1g;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D715D38C08A4
	for <meta-virtualization@yoctoproject.org>; Fri, 13 Nov 2020 06:20:56 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id ay21so9383877edb.2
        for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 22:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1VCzNYb1oFBofCRLMrq+Iw24V2Ndo0IP+tojkzlmBnI=;
        b=blHVvS1gU93Jo0feKD74RJeTKQXftIzJOqBogtXYTQig+FVjVM7cxd9NCyKuqf5a78
         EPqmUSpqRmKYHqlkLLcPg9ZHrz9liGv74chw2he5Z/iGF8rlLyZQlXJEbB+NGry+cLI8
         YbwITyb6LQ+6MljT6c0466jOhwIVkja/Ecuo1irmAwQUlHJsJz6IywLZkBBbcNjrqbtv
         398Fh1FOJoF5wSVyFPKiSHbh++K4EEL/r0apQPTpS0fYZKABQ3STs1TNXHKd9wjwbH+i
         R3eSK29qIclb0gSeBFq+BTob/VVy1hC5tBQRDlHn66TkDP+DexojfvoSyQ72aKjbijNc
         MsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1VCzNYb1oFBofCRLMrq+Iw24V2Ndo0IP+tojkzlmBnI=;
        b=FEKZ4G5N0eI9R9t5X/Darh+mofdB2FlwRaslnzmw6rzvXsorKs1yf9hfo2sUKi9Bqb
         GUlJaD8pqamqtmXB00w6XPbxS74CIHeeDyVAIPL+U6Cf22tvSpiogfqud8JMMS1omutF
         jfGEXSo1d1acCUztL7jpPXjGW1qVs4X7rwLeiWY+zJeqmlt2DtKqeSD9mYGa68reRMOM
         Hmb41YvG/MCrHJtvnM1dmRwJgz8ooSoqrkVp5ur80WvS+DUsHGbFMDMUlnU83rqKuPJA
         MejkjUgJQWMAeWXFM4kRL29PMVCTZ07XDI5I4mw+P/x2ILvJPQ4WFzpaitMDN50SSnB0
         Y9Sw==
X-Gm-Message-State: AOAM530G0VyG488XFi3g49EIlr8GjG6uPS5ZB/DbZ1/MCXbu+y1xkHsZ
	3HXB89I4HmlYefC7L3+qV1TvHfTxDYBPvEMbdnk=
X-Google-Smtp-Source: ABdhPJwKCQUgEllvKFrUUL+DBY65pvc7kG13Jotrpl91lb0ao2PFwFBT60ybMhaPyhogRh3PevpQ+QxzM/Uod/kROsw=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr921700eds.352.1605248455221;
 Thu, 12 Nov 2020 22:20:55 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org> <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
 <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <fc77738c-810e-6e67-7710-573a4610faec@axis.com> <DBBPR08MB472572C4277C1705270EA8D591E60@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB472572C4277C1705270EA8D591E60@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 13 Nov 2020 01:20:43 -0500
Message-ID: <CADkTA4Mrnn_AEVueeYUK5sJJGqU1tHzvQMSC3Jv8QfGvhWbQ_A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Lance Yang <Lance.Yang@arm.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 12:48 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Joakim,
>
> Please see the comments inline.
> > -----Original Message-----
> > From: Joakim Roubert <joakim.roubert@axis.com>
> > Sent: Thursday, November 12, 2020 9:43 PM
> > To: Lance Yang <Lance.Yang@arm.com>
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> >
> > On 2020-11-12 08:30, Lance Yang wrote:
> > >
> > > Problem 1: conflicting requests
> > >    - nothing provides kernel-module-ip-set needed by ipset-6.38-r0
> >
> > Do you have
> >
> > CONFIG_IP_SET=3Dm
>
> [ Uh! That works! I thought I set it but when I double checked the menuco=
nfig, I found I forgot to set it.
>
> As far as I know, ipset is a tool to simplify iptables configurations. (e=
.g. iptables -t nat -A PREROUTING -m set --match-set podnet dst  -j xxx) wh=
ich decreases the number of iptables rules.
>
> Because of my limited knowledge of k3s/k8s, I have a questions about ipse=
t.
>
> Is it a must installed component for k3s/k8s?

Check my reviews on the mailing list, you'll see where it is discussed.

Bruce

> ]
> >
> > in your kernel config?
> >
> > BR,
> >
> > /Joakim
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
