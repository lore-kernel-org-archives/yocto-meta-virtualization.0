Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.2750.1593155677420519505
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 00:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kqKeDYpW;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id q21so187809otc.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 00:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ki/hzlPVAODSZ05tsrxSx7RoZqzqdRSYglLSH4+cl0=;
        b=kqKeDYpWYFORQQFh8ZWdvXYYXCK3XrBty9lDU7PvM4Fik21eMZoI8q6uMm4Wv+T5tp
         j+CLWS4g0z7umcWHgHazk3pNxDLQfVrdU9VO5reJgeuHHbbJnJKMaGAp8KDk0xZBYZai
         7dREPcy/NL3LEgVBuj7jO3DHPXK0C0KhVwZhT5rtEGXcE2YR58PZKrqULVDtMJSen66I
         vsrZ5MyDbDrR86sSBfvRZnvhA/lJflMUaGuEdnPk5pOjppmsxBIyQvJNLgLksatRiPfC
         0cRdZLlrXJnO0NM0LILEO0/lxl5kBHiybo887qOXEY7CY1bZr5yZLY2rz9DEXRNDFo2h
         i0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ki/hzlPVAODSZ05tsrxSx7RoZqzqdRSYglLSH4+cl0=;
        b=WiWxsl0EHM5KRqcTtMQ1rqkFZgSbysPkDl2L227Qj5ReiXAtRy7annTCyhar/Gs2KI
         DoPm8Si8RTk+zTMtlPn9LRRpDsX9h6XkZYnLU4tDVatd3pmvmuCjIdSMYXz9TK85k0Dv
         2xsKwZweVQ1vfaAl4iswef61U06pBtrL6oX8VhwEQeqJh/wBnp98eNQ+D5Ne2VcbGz52
         U6R/GSH0jIg/8o2Kn1QfAjHG/FqhFkYzdXba1Kl3qWS0f6abJL4pBvtTZZE5IpT2Unvm
         1PtiNAPJHuiMU3OJaNbiWoN/KKAk5aOjTDcTUHhd2oQ7JzXN/zgajg3wyANxbXapUKBX
         7IDQ==
X-Gm-Message-State: AOAM5320Q9jQFFQo+KWzz2BEfDEK+cXufcGuRmysLoxV1IXS5k5IHR4A
	hE5BISov0QJJtDmRdTt4KxJLiNJa1gAOAN+Qeo0=
X-Google-Smtp-Source: ABdhPJxA0KHGkz/C/xPZjtF8JjfmPR6qVn1mzFpTWmoCkJsY35XhhCnjVk6jIGsI67uTiAk+8hsE4eueG1a4v857geY=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr1297687ots.192.1593155676783;
 Fri, 26 Jun 2020 00:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4Mt2z0czzJXuk7-S3XnGpCSwmMwG78fO3xV0KxrJWd_jQ@mail.gmail.com>
 <23596.1593145500118149399@lists.yoctoproject.org>
In-Reply-To: <23596.1593145500118149399@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Fri, 26 Jun 2020 00:14:25 -0700
Message-ID: <CACMJ4GZO22Cu1QbLrNdBrZdf7pguopmvsOPTpmPnbygXytOGgQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 00/10] Xen on Raspberry Pi 4
To: Ashishx88 <ashish.emailaddress@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 9:25 PM Ashishx88 <ashish.emailaddress@gmail.com> wrote:
>
>  Hi Christopher / Bruce ,
>
> I have rpi-4 setup & would like to do an smoke test.
> I am starting with meta-virtualization & if you help me with below query :-
> 1) Should i try with (dunfell) branch for repo of poky , meta-openembedded , meta-virtualization , meta-raspberrypi

I've been working with local checkouts from the main development
branch of each repo, ie. a copy of master, not from a release branch
such as dunfell. I suggest testing with these revisions:

poky: 18b6b2ae819cbf0ef3858944b4cd02ab74df6607
meta-openembedded: 463f9a3ef0935d772a0be0437a8c09df64ed2f07
meta-raspberrypi: 5576a22061864bc451ec4fcacb7d830bf76b7ebd
meta-virtualization: d75bc448866d2b36779251efb1310d0234ece30b, plus
this patch series applied on top, or clone the
raspberry-pi4-xen-series branch from my repository (link below).

Unfortunately, I've just noticed that the versions of poky and
meta-openembedded I've been working with above could do with being
brought more up to date. I've just run a build with the tip of master
of each, and that build is failing in both xen and xen-tools due to
some interactions with the newer compiler (gcc 10.1.0-r0). I'll need
to work out what's going on there.
Bruce: Sorry for missing that before posting this series.

> 2) w.r.t series of 11 patches ( 00/10 to 10/10 ) shared by Christopher ,
>     is there any git from where i can clone the patches ( or is there any other way to clone the patches)

Yes - I've just pushed a copy to my repository at github here:
https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-xen-series

> Apologies if i am missing any aspect here .

Not at all - good questions.
thanks,

Christopher

>
> Thanks ,
> Ashish
>
>   
