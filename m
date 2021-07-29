Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.10563.1627570506426850833
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 07:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YfBWmarY;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id yk17so3493648ejb.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=x7w5n/j96JMbvQhn3BKQvHf0tVB5iYkQ/6KlxN3n3/M=;
        b=YfBWmarY7eu7Z68WnjGbyvmb/eMyCzZaaOMRrAcxz8hIWgPett47l3ao8ig1lFcwq4
         aArtGNGTfb1Qj0pULR+kUr/hHbfdgl4jBCT+YNlDjshLYYwMWv5RupR4gx9Its1fbTMy
         Z60RSw5DHMIb3WvrEk/jFf624VjhoB/4ZlmCJnw/cqyssAUtm8ToE+p2R01lN+53Jt+Q
         lP/fgq/J984eTWE8qdWM7DVW+048nJS8lBiNXvDK/kDeKPXpZleL1xrDGbZqAlSSpFxl
         6UebXHKsRpceTmaGGNZEBWJZMUHjF7a41IZUPP0eGJ7TR2fU6xApbuaTaKIaA5VopzsZ
         R2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=x7w5n/j96JMbvQhn3BKQvHf0tVB5iYkQ/6KlxN3n3/M=;
        b=cakEB8GmYn4ItISo2wvNIJd3gaGWP0Z5MAg5aNmvlcWaX7i117+rUuomLTgPY3u9cY
         +C5UYN/6RsBBU9DvP5yVd1IqcmVSP8LACe4Pb2k+8namjdybuBzbQng360S9Tv1PP147
         Z6syio+fMuPLRZ0eEPXGYGaQjksE1fidlpixpECyKL417/HDHON38brpDORAobNMXOyE
         bKTmAhyqbxuc6xqG4TkuzPWClFLw10yx898WU1akE+Hz54LaS02ejRhHC4rHNWgyySAq
         UoPJxvE/0jO6Syymr0GvAaebgKWNyfOedNB2tFdrapXhZILOAcCIPy1HmSYNvvIPUkMr
         IW5g==
X-Gm-Message-State: AOAM530m9Zi8aOPCgTJexGLkaJ96JLiXuTKDeekeOLYMLELeM7zhqCVV
	Na2KyhH+/GyWkbSaKF54HZYW2YcPZj2lFP/iZaT5+syh8sSaDJiD
X-Google-Smtp-Source: ABdhPJwvlPk7voOMr1NfF+J2i7AyPQtSD/SHAd5x7SDXx+GxnE1ccLJiIUtj7qmHnafwMOy90lQz3DUGpWwfSBIYhQs=
X-Received: by 2002:a17:906:481b:: with SMTP id w27mr5007892ejq.517.1627570504422;
 Thu, 29 Jul 2021 07:55:04 -0700 (PDT)
MIME-Version: 1.0
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 29 Jul 2021 10:54:53 -0400
Message-ID: <CADkTA4MJVSo4CkEVSw7+oz=hoe=CNB4Q_mm24Q5Tbv0qUiRL7g@mail.gmail.com>
Subject: Overrides syntax conversion
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c3605c05c84449d3"

--000000000000c3605c05c84449d3
Content-Type: text/plain; charset="UTF-8"

Hi all,

Just a heads up that I've started the overrides conversion to the new
bitbake syntax. I won't be pushing this for a few more weeks, but I wanted
to let everyone know.

The details are here:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-next&id=d8493d7091dbfa402b3c25d51c5d5417bac6d617

If you have any cycles, feel free to build/runtime test your components and
send incremental patches to the one I have on master-next.

Cheers,

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c3605c05c84449d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Just a heads up that=
 I&#39;ve started the overrides conversion to the new bitbake syntax. I won=
&#39;t be pushing this for a few more weeks, but I wanted to let everyone k=
now.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">The details are here=
: <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization=
/commit/?h=3Dmaster-next&amp;id=3Dd8493d7091dbfa402b3c25d51c5d5417bac6d617"=
>https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=
=3Dmaster-next&amp;id=3Dd8493d7091dbfa402b3c25d51c5d5417bac6d617</a></div><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
f you have any cycles, feel free to build/runtime test your components and =
send incremental patches to the one I have on master-next. </div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature">- Thou shalt not follow th=
e NULL pointer, for chaos and madness await thee at its end<br>- &quot;Use =
the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--000000000000c3605c05c84449d3--
