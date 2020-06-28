Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web12.29339.1593355021654772960
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 07:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Neug6kbo;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id i25so14594149iog.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Jun 2020 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=itFKrvpFUnzfXQYFz5676eLmA/iN1dMtmMAiEOAeBPU=;
        b=Neug6kbofyJ3yttGbXcrgQUhY+L3p1+gmDQN+6WCLunc50MnGMvaX9466lzezfPOWa
         LsTTSPtmixrfjAqAL1lUCwhTSKmJ7mP/Ubux151n83KPpUBHPSyX9H9qW1K7HZksRo1K
         d396lq2+7saIhDDDezEEIr4+heAPdXUPuUp/kZBdMnTGxxycU6tE+YtJDOY389nPU+gX
         qe29hbETLd4slbvMHoN6Gn3RhcrvKZKCOhDjIlP4Nwda2eOz96dPdxf6I8VlSXBW9b20
         laqaim8C7wUcz2UbEMpEwnGRIdCUM+CI/+3VrfHpwi0N64xMmuzH6heBtGIr3Q3+cRB2
         +z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=itFKrvpFUnzfXQYFz5676eLmA/iN1dMtmMAiEOAeBPU=;
        b=L2PVVhsb1KXcz0DaBh1TRipAeeJaMUuIiGbcjf33oLvmBBv0HQ+oX4KVHKYA3X0EKg
         IpuKUDzYfHw7OIb/HJVeeTHmhmWsz1MYJpoiK++LLAIGsbMC6LmFZB1q2Nfr2E1GRgfD
         f3lbVKbL8oUCyaGvDo4XUbOSYiI3zoM1MLo2wVBdc98k1yH7fmMf7Z6DEe8goy3yjm0E
         mJdKq0Bu348+5TBOLv6FX4TszLH62ONYbs6ggHU7fG0jOKYRDkam67/nEAfa7ufpVIqK
         lWthL2gVpCBvBcej2h3U/qzE/o/71Oog5E6w2FTxOe3mQPKvN8Lv6fq1qmcuev+9x6l0
         7QlQ==
X-Gm-Message-State: AOAM532cNxKM3u8E7dpVrnUKNQK3L2H0OBRQGiZiAHXzW0WJwx4MI0xP
	MWADCrRf7hQRoHE9Y2LgMz+bXKJl2uY67xgDtJA=
X-Google-Smtp-Source: ABdhPJyckGLtRpfiQytcLgXlJAIldRjFXbhsGHPttwuqRxDeQ30/JwM42xRK6sGxryehNRX63u4ot3Ux4iTP0lt5YWw=
X-Received: by 2002:a02:5d49:: with SMTP id w70mr13553087jaa.16.1593355020955;
 Sun, 28 Jun 2020 07:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtAmLmnY7iGhu5exxL2xWhmfYKeRxXkaXBTNm3FqutsaMA@mail.gmail.com>
 <11940.1593062254922790709@lists.yoctoproject.org>
In-Reply-To: <11940.1593062254922790709@lists.yoctoproject.org>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Sun, 28 Jun 2020 20:06:50 +0530
Message-ID: <CAEkELtBqC_LGqP_cqYmKmkn=psKfm2_iaDecDMGN1+7ovwVR=A@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen On Raspberrypi-4. Not able to build the xen image.
To: Ashishx88 <ashish.emailaddress@gmail.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000006736505a925e0f7"

--00000000000006736505a925e0f7
Content-Type: text/plain; charset="UTF-8"

Hi Christopher sir,


Thank you so much for the suggestions and help. I am able to build to the
xen image. Thank you so much.

But I have one more question. Can test the image on quemu by giving target
as "quemux86-64" is it possible because due to covid-19 lockdown I am not
able to get the board right now suddenly.

So please help me on this kind request sir.



Regards,
Siddhartha V

On Thu, 25 Jun, 2020, 10:47 AM Ashishx88, <ashish.emailaddress@gmail.com>
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

--00000000000006736505a925e0f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Christopher sir,<div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Thank you so much for the suggesti=
ons and help. I am able to build to the xen image. Thank you so much.=C2=A0=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">But I have one=C2=A0mor=
e question. Can test the image on quemu by giving target as &quot;quemux86-=
64&quot; is it possible because due to covid-19 lockdown I am not able to g=
et the board right=C2=A0now suddenly.=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">So please=C2=A0help me on this kind request sir.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Regards,=C2=A0</div><div dir=3D"auto">Siddhartha =
V=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 25 Jun, 2020, 10:47 AM Ashishx88, &lt;<a href=3D"mailt=
o:ashish.emailaddress@gmail.com">ashish.emailaddress@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi Siddhartha ,=C2=A0<br><br>&qu=
ot;<span style=3D"font-weight:bold">package openssh-8.1p1-r0.aarch64 confli=
cts with dropbear provided by dropbear-2019.78-r0.aarch64&quot;<br></span>C=
an you cross check ssh server package .=C2=A0<br>By error log it seems that=
 you are trying to install both dropbear &amp; openssh &amp; hence the conf=
lict.=C2=A0<br>At any time you can have only one of them=C2=A0<br><br>Thank=
s ,=C2=A0<br>Ashish.
<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000006736505a925e0f7--
