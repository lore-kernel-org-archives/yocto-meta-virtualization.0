Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.342.1587079545155844113
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 16:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FKbUJJP+;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a2so155505ejx.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2020 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yi0povc6es9h8jySjDoWfcECud4cykprMB1oYsQNgG4=;
        b=FKbUJJP+XR8tW3uq2w8DgVzt3tWpOVd8N0+XRcLJ9Amn68jtZ9DsCKyl2gsJUvalIT
         blR+K+L0p9/KzutuEuxHWBnF7sCrl3fDZFlgTgv8jOFHPj49hBhlEZEhN6pTHqNcQi9v
         zf2jPVoqI/hSluV2NNVEBDxWxyM+koR4jWqW8a9BvjrZyrPiSHnCUBGx6nKSeNZ2DZIx
         M5MDxwPNmGuVjj6FSJGdEOLCFQ2k9D39VlLsBMszAmEvBgvFg+oiFZDW4Q4IizUbrHlP
         YWMLaRmTGq5TttNKsP+zsz53QVaUNGYlpagndUbXZxASGR/jfAw0bkWROVaqeRcmTg5i
         u94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yi0povc6es9h8jySjDoWfcECud4cykprMB1oYsQNgG4=;
        b=Z6nK0OBxO0tblOOvq1SAJV8b1/mzeKgMh+fCidpY0em5Vp98PhOPwcltFNxEcG+6Ko
         ht23o0DF8uwasNn6H84PGcCck8riMTpAwxCHayr40wWLFTN+LzJqVzMHsu1LO/s4LLL3
         gnqtthD4UQQTiCn01ONR+MasffCYGEySt48Yq3SINuKIRSWciuCxLL/T+P9Xzmc1+w7D
         B/tnS8kJ819F6H3R4C5K/uoN2wuEPi/pBjXS3IMCj+kxAIqPwIInc8Ztq7A4kmGALPj7
         2lh6AVqqcmLU5XNErdEMofRb85c4oV4lJe7pxxVFbYBHvHpM8Yyf81aTxDZ/gSHq5hHm
         IZYA==
X-Gm-Message-State: AGi0Puat/PhfPo7PTUGokxAaR+Fpd9ndmasGPeDu7NAzSG0WGqUT4EZM
	nb8mfcymiJE+rqJuR7J1UQJISf0r+TbGVXtB5dQ=
X-Google-Smtp-Source: APiQypLc8MVhS+rQGdyo0OMDrwL+rz+3Uo9W8DVSjA7avvvUo0WgfdBUQJiuDu2I/H8n4xbeyquvW5A/mbVaJQ6z6Fs=
X-Received: by 2002:a17:906:2b96:: with SMTP id m22mr404968ejg.330.1587079543601;
 Thu, 16 Apr 2020 16:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-A5=yzbaHGktARzH4-YgicQHE1fyq0Kjfrk6G27jr1mWg@mail.gmail.com>
In-Reply-To: <CANx9H-A5=yzbaHGktARzH4-YgicQHE1fyq0Kjfrk6G27jr1mWg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 16 Apr 2020 19:25:32 -0400
Message-ID: <CADkTA4PudrkwR8w17CJWk9TkJHp+8O=A1d4XRLxL=Z9CAKrvuA@mail.gmail.com>
Subject: Re: [meta-virtualization] Random find: meta-k3s
To: Tim Orling <ticotimo@gmail.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cool.

I'll compare my source based builds against it!

Bruce

On Thu, Apr 16, 2020 at 6:42 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> This layer packages the binaries built by rancher.
>
> https://github.com/janeczku/meta-k3s
>
> Cheers
>
> =E2=80=94Tim
>
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
