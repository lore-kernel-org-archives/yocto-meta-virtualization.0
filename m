Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.17705.1600956185467536379
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 07:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FHRneeJK;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id u21so4685288eja.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Sep 2020 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KrzqnjVgR+tGzu62kqS+p+xkPsCYIMv/d1XACtANrhc=;
        b=FHRneeJKttYbBAzBqrXFJHzoAe1h/ZJ7ZJE4jf01OtGmiqgnK+upIGt5wSyYVCoD3E
         ZBoznvrrMWUdr3e62+KSb7YqHxVxVf1uxFPAQZ6AxrFzYwDUboM5CzkF0oKLKSdYmOc7
         eOD4gh9D4hGosJVOGG/KfY0Z10WQhOnGstYoFIHvYC51C26nO3c3JiO9hEdz+Sr4ZjWi
         yaj+sRME7QKYCP/5aSms8Rbq3coniHUb3HfnBvo2f4cmRZkiV/nDaqcvqW+BD6Bqunzn
         GwZ2t5gwaRxm3yeW9KGY+CLx+VWDiBpmkpJ86ViJ8WRXERobMNIN1dvkKUgKLCyMbFx9
         TifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KrzqnjVgR+tGzu62kqS+p+xkPsCYIMv/d1XACtANrhc=;
        b=FuBKW0JaZM8HOrYGLlC5SAaxcA+ocKXLOI6b7okNZcbimmTYrAWmVkxJnG5lpENO1G
         iiahTHZs06IffjVB0QqV49+gOG2l1yeQx1ZyQ3expQMV6ziTKKEMoc1VTfW8w4+6cNXN
         X9WyaeZVNVCB9cmamPjIXNGkkGYLxCRXX8dv6lOJdBdK7JFVQ0EobuJXtciUTefSX43R
         ImpbdPSc2NbBPW6kht5niChE1wxfe8TEXbSDISrqGyjP4LtMcMwr67wEfxRgNIblUiK1
         LWZIjKQlIQN/e+CP1TtOaJV0AnzVLrG9eYEkGYTXrqxteWaMkx4mAJFpjmqIgfAv1cGP
         j3jg==
X-Gm-Message-State: AOAM5328S2myi04uuEyPd/65O4niRWzrQ4dbeqWmIN1STINPv6/jBn5x
	F4XmCpykywET1jRd4QNfowdrIo4Dj+VSLTLdGDY=
X-Google-Smtp-Source: ABdhPJxFa8XpEsjmGbEGESamYgsCKP2q8THL5OZ49Liq0LLUhVz7mpQWuCMbtnVI2rWLIYA4d7AW0p8RKW+oLHny1sw=
X-Received: by 2002:a17:906:46d5:: with SMTP id k21mr8462ejs.247.1600956183787;
 Thu, 24 Sep 2020 07:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200821205529.29901-1-erik.jansson@axis.com> <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com> <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
In-Reply-To: <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Sep 2020 10:02:52 -0400
Message-ID: <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 9:22 AM Joakim Roubert <joakim.roubert@axis.com> wr=
ote:
>
> On 2020-09-21 13:11, Bruce Ashfield wrote:
> > It is close. I had to abandon one approach, since it grew more
> > complex than if I just let a chunk of functionality be duplicated.
> >
> > I'm at this again this week
>
> Excellent news!
>
> > and if I can't sort it out, I'll merge the core recipes and start
> > factoring in tree (I'm just worried about people assuming what
> > appears in tree is the final version).
>
> But with those words you have just informed eveybody on the list about
> it, so that should make things clearer for the community!

That I did!

So I've decided to do this in a couple phases, since I keep making the
bbclass more complex that it needs to be.

I've gone back through the patches, and have some questions/comments.
Would you be willing to tweak things basd on those comments ? I
realize it's been quite the delay from submission to this, so I can
work through issues if you don't have the cycles.

Bruce

>
> BR,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
