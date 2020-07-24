Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.4378.1595591020943758446
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 04:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iPXTmF+P;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: ashish.emailaddress@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id b14so6582193qkn.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Jul 2020 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BolHzPBxzk2NB1Eg2CNbA3oPycicNyQCr3CEMzKipQU=;
        b=iPXTmF+PIZUr6G/+Qwm3EuH0Q5b6ZvJf5jpEgceuFCVTPgEbr+McstZd3UpdnBKEYS
         JSRUpAb7AznZpn6asxj7arjW/kDMREVdG7IPLLCJYVH98TNFgJx2LbkHlBWoPHAaVVGx
         o9GCrrc84Nt5N//95mkcKeR06AcN6GtIhkOa1HHcGHUozgPJkFt/oFtL4hnTco9ZoQ+T
         536djXLMsHovy4p9RkDTNzidF8N3jPSmGKMeHniq8BUbUJ++/q02vL04ZXerd4gquXNb
         y2pF0NJ9sxXzSZRZzSlYEUZ0BRbhxlJOpmoOMuAUCjXrhbygkmNEL8QWeL/iAf5hSkbj
         MZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BolHzPBxzk2NB1Eg2CNbA3oPycicNyQCr3CEMzKipQU=;
        b=N5Jk1dKUUTXmlhgDi9tKFFA0NRo3qwqyZkjv7bitEeaDgE5B5g+H+4NTKZyrdWkFBQ
         UanfMLFPOXe8OWb8YXt54OTKaYCYLZoSHAtg9tYBr/V1K+JO5LGhpSaa0+vu1xDgSna9
         te1AsgpVxHOxncNa/xL91q0L9SGepL7vp1PilODb0SeUbdHT96i4dV8+eufLF21grJgg
         +grjWDYC4rAYqvpEYfcEA4W/ToiRYHorOpakgv9iQP/ajy6nYupyBVoV7NyRdOVUvrIE
         xVgP2PbNdNo2HQRbKcd32MgjT7okwIYytt0o/8Gs7f/NEN2Koo/Tblu7z7lKorc1YzKW
         50/w==
X-Gm-Message-State: AOAM532ih/i9TnLDmik9DNmaC34M9TvhTYsJQDihSTxFz6NPAP6bwsoZ
	26r6c5MfVnyk41Vwcf+TymO09k+2K6Ouf2vPj58=
X-Google-Smtp-Source: ABdhPJwf6Kl7QUx8ubWt+hHC1P6JmHYLP8RuUUAs+1S8d1hjwN0te3jtnOJesQpjJMMlAANV2JMnMWK7W2wrzrmd6/c=
X-Received: by 2002:a37:4753:: with SMTP id u80mr10428052qka.317.1595591020112;
 Fri, 24 Jul 2020 04:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtCLCEar4fLH=jp7kJTarUb-h_Fkceyi7F2jd6y6U1891A@mail.gmail.com>
 <27576.1595505436667253209@lists.yoctoproject.org> <CAEkELtBMJ1z1rujwx-60-J0RFo3RXJRDbTFyfX_rxbJoPNG2AQ@mail.gmail.com>
In-Reply-To: <CAEkELtBMJ1z1rujwx-60-J0RFo3RXJRDbTFyfX_rxbJoPNG2AQ@mail.gmail.com>
From: "Ashishx88" <ashish.emailaddress@gmail.com>
Date: Fri, 24 Jul 2020 17:13:28 +0530
Message-ID: <CAOe0dAXrkJ2ztg491yNK1+YtNEfNCG83oYUL8hNukxor0efH_Q@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Siddhartha V <Siddhuvgowda.18695@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f5ef9905ab2e7b1f"

--000000000000f5ef9905ab2e7b1f
Content-Type: text/plain; charset="UTF-8"

For an quick check , can you try to build at "dunfell" branch for all the
layer
 ( poky / meta-openembedded / met-rasberrypie & meta-virtualization )

@dunfell expectation is it should be able to fetch kernel
as the rpi4 patches doesn't come into picture.

--000000000000f5ef9905ab2e7b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">For an quick check , can you try to build at &quot;dunfel=
l&quot; branch for all the layer<div dir=3D"auto"><div dir=3D"auto">=C2=A0(=
 poky / meta-openembedded / met-rasberrypie &amp; meta-virtualization )</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">@dunfell expectation is it =
should be able to fetch kernel</div><div dir=3D"auto">as the rpi4 patches d=
oesn&#39;t come into picture.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></d=
iv></div>

--000000000000f5ef9905ab2e7b1f--
