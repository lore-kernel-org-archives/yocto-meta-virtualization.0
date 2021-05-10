Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30964.1620648650368180088
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 May 2021 05:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovyqH1W3;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 10F3E38C056B
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 12:10:49 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id n2so24129588ejy.7
        for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bJW2tZ5APA1+Cl983F+8fkQ18JZDEn8AWDe7yP/L9Ok=;
        b=ovyqH1W3sA4g0FwVxCmTEpW3+RnerHki016q8c9nYchf9Gvuvaa0MlHVA6RJPJ9Yvl
         rVy9PXma/GgianhlYOyKIsukPMr3tc8Jw723a7VAXPS4aswNLkqhus21k5n3MA/kShhQ
         R1/k2pV1+l47QLoojnOuTvMn+TaGS50g+LDqLR2zDLjKZIPl0eA6v3OfJEPtOflTIRsV
         tezw+GZnxKkZbp+/MUS9bYf5AOm1APAOcp99y00zi2/ulZmIdGOasA30TDaxNRrikXVz
         fclP8gFkqBkShWQkPYXcRFqv98ZhSg0YFsGjidkfe69KhEhA+BbVKdxH1ohIQ6KpSgZq
         eScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bJW2tZ5APA1+Cl983F+8fkQ18JZDEn8AWDe7yP/L9Ok=;
        b=AkrpRJ4DV39bY2/+H4j17RQJ9n6GFR9FxJHCVyz5HuDVw8K4zSzXGzXQ3rrgAEfuUJ
         5ZbdRSgTJ6LofsnxBmjeVTdRR/4jQ6y8Nx5Y71tVIolPOSDXx5f+eXAYkCn0sP80bGIJ
         yW4azW7zuG0KIB88AXaZdsnrwvgPi8IO6H0kdonMKPSuuGlgDPnL8SL7M6UPdxw3ReMQ
         iHgtWl0VvJWACpSx+2nKayeQx+ZFaaoDvhmw6x/8AjGJGXf5J/rKnniL/kxw7QibdU/2
         u+mZjyjvP5e0qVfjFAvfsxD3DAHzTG8KbNtmVf2AXYc8rzv0sirCrJXKr9HU114pjLvI
         kWPg==
X-Gm-Message-State: AOAM531DLHq+OPAlXch/Hjycr8T/6GL1WbTdbSzS4bJAlpNBl/0Mu1Em
	UKV02SeD06vsL/960pUQ9DzxHZMRkKPa19Pfgmg=
X-Google-Smtp-Source: ABdhPJzSSHpSjWiI/gBLc0U2RJDwQ4VLMEJWi1Hau+pxfgwKlAew0JwKt4oEwwAUdo1BApe4NFcWEsGEL8wGNDiTxyM=
X-Received: by 2002:a17:907:2662:: with SMTP id ci2mr25607041ejc.459.1620648646185;
 Mon, 10 May 2021 05:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
In-Reply-To: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 May 2021 08:10:35 -0400
Message-ID: <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 3:34 AM Joakim Roubert <joakim.roubert@axis.com> wr=
ote:
>
> Hi!
>
> On KubeCon Europe, there was a lot of talk about nerdctl (https://github=
.com/containerd/nerdctl) in various places, and it indeed seems like a nice=
 tool when working in containerd-only environments (yes, I am one of those =
who find crictl a bit cumbersome to cooperate with). Is nerdctl something t=
hat would be interesting to get into meta-virtualization? Perhaps somebody =
is already working on this?

I'm actually already working on it, and have been for about a month.

There's a few build issues remaining, but I expect to have it done in
the not to distant future.

Bruce

>
> BR,
>
> /Joakim
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
