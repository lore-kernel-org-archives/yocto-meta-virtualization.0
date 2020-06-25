Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.4408.1593063666596294820
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 22:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cS+NL5et;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id l9so4191818ilq.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Jun 2020 22:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=8Wv0Zf4FIbW4jDnihapeHDcq7YqU++2UvjTnOg9ijes=;
        b=cS+NL5etiCwKgUjQGsqbNx6ng38TWVI3m0p4B+7GFvdCVrncU8gQTrJIqHgHl9n8z5
         TPRaL+HHHyMgNznHFgWtiGBYnUzdHcxtxn5x7VEdlMBKybl47FQL+HnpGkODlBoPAiwu
         sCEMKfC/kbyCW5yTSY6hkqwQIILdz7NkXa2aKrOcpevSUfLfJLbNRoA76Qu4v6KBmme4
         qDINihW49zQk/vOERw3uOghsmbzz4cX2uzd+sXcOMnNhdJEll3hVDqg3meRqK4VfPq0J
         hm72EDZ8mBVchLszubq0b470Mklf2gJdNexmvZXtWgmNuBtTBMZugoDXRq5/vutGNGdn
         JL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=8Wv0Zf4FIbW4jDnihapeHDcq7YqU++2UvjTnOg9ijes=;
        b=nrqF2aJesNzNiamFDPMLErg0oOmgyV724S//DMELjopqcne5Obn3nnDf2ocnQ6q1VP
         znDAj28AewAED+gwMXjD2l98g5ZWZEmbgnQ6eHgA5kSBV/73pprd3AnvUIHf2v6Dz8aD
         Nzdyenz7JEI6CShGSd1ejj+26H+dB2DgApoS8CpV1f8dl08yY3hibAnTGYpWGBdw1kBe
         F3Di7J1Uj8P0S/cItKHGBmCBQOd8w7MA7oQ1RWRDAISvcyq5UO9T1TcFUhn+bckeT22B
         xrMVLnjuzsNUX+MEhK7FKsSaViu2x7zpV+kR3Chvx/QCHK9SasOwBa2an0u3ruOTKJFx
         5liA==
X-Gm-Message-State: AOAM533jp6RTpntSSFvQOjTIVqc1TA8yNgkOYcBvt1e8JmUfwaZxDk19
	GAeOcZluyUkeXIrgbWF+sTa9JVmUcYH81y22p78=
X-Google-Smtp-Source: ABdhPJwEpVjYUg7EdH3KnpztJAZEzIX0raZG7Z6NZkOse2+iU0nHsHRe6LNSMdexj14Xzgot/6CRGVx7LXdUXvsuOFU=
X-Received: by 2002:a92:6e11:: with SMTP id j17mr31365944ilc.54.1593063666065;
 Wed, 24 Jun 2020 22:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtAmLmnY7iGhu5exxL2xWhmfYKeRxXkaXBTNm3FqutsaMA@mail.gmail.com>
 <11940.1593062254922790709@lists.yoctoproject.org>
In-Reply-To: <11940.1593062254922790709@lists.yoctoproject.org>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Thu, 25 Jun 2020 11:10:54 +0530
Message-ID: <CAEkELtBr_hYSBm+k7ZUpR8AsCdwJqnQd6WJY87NyjWY_PEmcDQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen On Raspberrypi-4. Not able to build the xen image.
To: Ashishx88 <ashish.emailaddress@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000eba92205a8e20991"

--000000000000eba92205a8e20991
Content-Type: text/plain; charset="UTF-8"

yes thanks Ashish.

I wanted to have ssh enabled so added the dropbear. Now it is fine I am
able to build the image. Thank you.

--
Thanks and Regards.
Siddhartha V.



On Thu, Jun 25, 2020 at 10:47 AM Ashishx88 <ashish.emailaddress@gmail.com>
wrote:

> Hi Siddhartha ,
>
> "package openssh-8.1p1-r0.aarch64 conflicts with dropbear provided by
> dropbear-2019.78-r0.aarch64"
> Can you cross check ssh server package .
> By error log it seems that you are trying to install both dropbear &
> openssh & hence the conflict.
> At any time you can have only one of them
>
> Thanks ,
> Ashish. 
>

--000000000000eba92205a8e20991
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yes thanks Ashish.<div><br></div><div>I wanted to have ssh=
 enabled so added the dropbear. Now it is fine I am able to build the image=
. Thank you.</div><div>=C2=A0<br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div>--</div><div>Thanks and Regards.</div>Siddhartha V.<div>=C2=A0</div></d=
iv></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Jun 25, 2020 at 10:47 AM Ashishx88 &lt;<a =
href=3D"mailto:ashish.emailaddress@gmail.com">ashish.emailaddress@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Siddhartha ,=C2=A0<br><br>&quot;<span style=3D"font-weight:bold">package=
 openssh-8.1p1-r0.aarch64 conflicts with dropbear provided by dropbear-2019=
.78-r0.aarch64&quot;<br></span>Can you cross check ssh server package .=C2=
=A0<br>By error log it seems that you are trying to install both dropbear =
&amp; openssh &amp; hence the conflict.=C2=A0<br>At any time you can have o=
nly one of them=C2=A0<br><br>Thanks ,=C2=A0<br>Ashish.
<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--000000000000eba92205a8e20991--
