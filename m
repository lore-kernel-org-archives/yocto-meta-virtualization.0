Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.242.1612548865654683973
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TA52NVcC;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id f14so13295483ejc.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Feb 2021 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DcaAM5JDCYEIGCfBLQpbTsf0XhwNH/eO/GP1W1oDSWE=;
        b=TA52NVcCPtjEfz/rZNpULMWcWaNZkXB4M+26j0Vr0BRxUr+87kVe7Ythzuai1tEM7M
         lwYF1p/S1Rpe4PZexAOvHzVKgIOepWe4LtH3V7wrc+JXeNfrJ7bRisK75LXlYiePDboG
         8wfPvGd5lBxdKOdxqlO5ff3RNI4Px6Hp+RTsMwun2EwdemQr2/sFzC1fDC4SuKafvuNh
         PvZVseYWnM2Bc1eOexYCGy7rqxJPYphBjXlULRJeEpLFEqp1QtYyGhsdWBnF/XzfyZGp
         g1ALhfuETLJ3krtaN/jTHPTaF4/9hHuJueiYlTVy9HAweiTzNvnuvyJ/EKFKSH5hOTPL
         l8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DcaAM5JDCYEIGCfBLQpbTsf0XhwNH/eO/GP1W1oDSWE=;
        b=eoPE8f6uBz2dWhO98/j4LkWgTzFL/8W7L4SpbRwOMNXnQzU8QWysVqf2nJ5kML3CAi
         h1leqncw8P6pUB5xYhb+z6JEJ/+cGWdmXVhsy31FDpg3BIrfKhSn3unYOCVxsvzcSLHZ
         GnIFJCy5O/sTtJd59PbjBCdgzEsF0u/3SjOVC3fJwS+vrlxqbSuU0DZowfVntZt3DBW/
         rx9Jp5NMs1aYGOb0YwMPAq3AeoHPNqJcd5G0FE2SuAvppGw9/k/a3M1dm+SgYH+zCP8d
         le6lGrHP8QxYUMkfKzT6LZ3t+ZLVkC9V/IKZgvSXvFXZUQCsA5ZF5+nJb+Ee9iY9U1NJ
         RSbg==
X-Gm-Message-State: AOAM5321rt/ODfM2X3sE1DhO5dRPL7xQTjP9YppGo9v4I8c6NUR9wybD
	UD447tfGsejiXPB5d/wItycnUM8hwbMPV+8xBeg=
X-Google-Smtp-Source: ABdhPJwJmMvcVRLhD66Hlqxd7yA/dXpfYjya0bCkV3dmITr/AZBBr+a/E2OLu8A25/4QVy/sz6tom/TJDAwZxMXB3Bw=
X-Received: by 2002:a17:906:b50:: with SMTP id v16mr4922758ejg.298.1612548864002;
 Fri, 05 Feb 2021 10:14:24 -0800 (PST)
MIME-Version: 1.0
References: <f20096a5-96fc-b7d5-6c16-f67eb1e849b0@windriver.com>
In-Reply-To: <f20096a5-96fc-b7d5-6c16-f67eb1e849b0@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 5 Feb 2021 13:14:12 -0500
Message-ID: <CADkTA4P1uEon-koBb+06YKRJ5A+QMu_ipYXNH4wDcS1iN2j4kg@mail.gmail.com>
Subject: Re: nagios-nsca -> libmcrypt: autoconf-2.71 update
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Yi Fan Yu <yifan.yu@windriver.com>, Mark Asselstine <mark.asselstine@windriver.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 5, 2021 at 11:40 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Hi,
>
> oe-core has an update of autoconf-2.71 in master-next and
> there are a few packages in meta-oe, like libmcrypt, that break with
> the new version of autoconf. I looked at the layers that I have on hand
> and only nagios-nsca depends on libmcrypt.
>
> The newer release:
>      https://github.com/NagiosEnterprises/nsca/releases/tag/nsca-2.10.0
> hasn't replaced the libmcrypt dependency with a crypto library that is
> actually maintained:
>    https://en.wikipedia.org/wiki/Mcrypt
>    "The last update to libmcrypt was in 2007,[1] despite years of
>     unmerged patches.[2] These facts have led security experts to
>     declare mcrypt abandonware and discourage its use in
>     new development."
>
> What should we do with nagios-nsca?
> 1. drop the encryption?
>     This is a bad idea but we might have to do it anyway and warn users.
> 2. drop the nagios-nsca and replace it with something else?
> 3. Fix libmcrypt even though it's considered to be abandonware.
>
> There is an issue open to use AES encryption:
>    https://github.com/NagiosEnterprises/nsca/issues/5
> but it doesn't seem to be going anywhere quickly.
>
> Any other ideas?

Nope. We should just drop the nsca portions for now, and if someone
needs it, they'll squawk and we can look for the upstream to have
fixed the issue by then.

Bruce

> --
> # Randy MacLeod
> # Wind River Linux



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
