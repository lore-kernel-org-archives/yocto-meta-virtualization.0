Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web12.18605.1587076920315295283
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 15:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lNUM2qZr;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id u11so243474iow.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2020 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=n1deicHCZU5uxP1ckS+qo9NyHu4DIbNcoE+52/VUOoU=;
        b=lNUM2qZrpIFeOh6iHVe849YEk8Gh1NX3DYa53csB6i2zEI7kiJVt/nVhgFZY0Tr2FK
         n9MaLqrI5A93Xb1a6mUVrk1kZrJLsVlNnrS/W9r0BngTbFZ3ZZrp4PZpkPyxJh+NV2he
         l8IHhhsz5thRqmJeAabGORbwx2FUZiL28+EdVMxhwg0ep3Akn1ChWHxiPugGtRkntYsE
         7m9WGd0ggLS0dMTKwEfrVN7chrpyaLYUKh0g+pdjPEQP6X0a2l0Y2feKQJM8ymg6RL6o
         KmGVICP+Iv8+VTEb1clemMxjL1ebkRXCjUUEahVlFVWTCd3B5BcbjYk1I1XJa6FShF9O
         QNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=n1deicHCZU5uxP1ckS+qo9NyHu4DIbNcoE+52/VUOoU=;
        b=duDfSyx+b2E9KMyDNIwA8Nnwa1KLQPWGnd6UoYd7hpq0B8uhUeeL/7b3z2wdfXbC9F
         n9fMVfSpp7cRWeLCm2pazsowajC4hXzz7M/m80Wtw8rEdE7HNrwxLNWYPBAI/teXeZV7
         lVJ+TOMjtAbJKACwaYOBvNkFdrZenmupsczA2EZMFValoz1JVVoXP9VBcOosaRMYElgH
         ZYttJZF1VWUkjbk+youO6rt5Z/KR/nn/FXy0i9BTfakqvRRd2u84RKflRXO8UG5JofwN
         1jyAQneXG+Ho7qjsgRgEkJPQd4RkH2YAwFATvEj9t820rpbXpmRhZKrj4pAAmKO7hzcw
         27Bg==
X-Gm-Message-State: AGi0PuaXr6dR9Q4Ae9aJ6T8TCq80sZ38YVTMDIx1eiEUMg+VaaGKjIDa
	L82adcRHdRfkHn1RB73bsMkXnqSgtWUrEo0nnC/QTnRj
X-Google-Smtp-Source: APiQypI2HQoXZFTbgu4B+nZW/efG6Vat6GkIXd/xMraxhAMzjz3g+5F1gB5noznDSiFaqHo7kLu1rhshsuQ+TGLtjPI=
X-Received: by 2002:a5d:8407:: with SMTP id i7mr213638ion.210.1587076919540;
 Thu, 16 Apr 2020 15:41:59 -0700 (PDT)
MIME-Version: 1.0
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 16 Apr 2020 15:41:48 -0700
Message-ID: <CANx9H-A5=yzbaHGktARzH4-YgicQHE1fyq0Kjfrk6G27jr1mWg@mail.gmail.com>
Subject: Random find: meta-k3s
To: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000005408705a370248a"

--00000000000005408705a370248a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This layer packages the binaries built by rancher.

https://github.com/janeczku/meta-k3s

Cheers

=E2=80=94Tim

--00000000000005408705a370248a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This layer packages the binaries built by rancher.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"https://github=
.com/janeczku/meta-k3s">https://github.com/janeczku/meta-k3s</a></div><br><=
/div><div dir=3D"auto">Cheers</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">=E2=80=94Tim</div><div dir=3D"auto"><br></div>

--00000000000005408705a370248a--
