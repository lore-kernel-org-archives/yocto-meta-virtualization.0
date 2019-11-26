Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.14322.1574786430303164861
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Nov 2019 08:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XdeDQkK7;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a21so16933898edj.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Nov 2019 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zg/5wZcd2IyQ/e4hK9h0X8MXhqoeEFgwlrWIahqegQI=;
        b=XdeDQkK7ozq2wzXshoGvXG0LyLR5Fspj1y1OOzv2yyk6NpMKtOmm9n2s2VTUADCWio
         WkE801mCJAMqnXGaNA1qLpTfPYr+HLYx6KWWMjQ04J6B6KseYFL6pdE0Ab6aR3NoKkDq
         d9etIlhc79vVSI27Ra9JOHT0ypt62A6vBw1s9G3aNQ3b2uByTMXT3DwgCrxvK9QY4miU
         rbtz3y4TWDi+xegqbjje9tIdOJdlgKntH9iXJq76v9SegqzqoRKxeC8wINrM186q4zPU
         0nGqk56mnG04jL+cM5bDzREX/eEGZ4qNZ1jIfUeTUMHX6GyqbE7TWxBXO03dOcNhq5rw
         7Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zg/5wZcd2IyQ/e4hK9h0X8MXhqoeEFgwlrWIahqegQI=;
        b=J8gdQS2A3Qo1kPu0uTntawSp1SzWis/aHsHglD4DAhHckVLDAlatWXg/m5t5KVIP0H
         C/sXkYxqWGLNB9nBQw1KDpzZuWTqjgGaQYz/QI5LICU8e/xIsMIMUJZifARHLvYqPIuH
         vfVod22zbun74e9KMasZyE1gU4vtJec8vpSDgryTSvArJi4FcQbhAqUWXSlD/G50RcJA
         On81jxwki2x9skyfX7Pgs+8nRKZSke4j+sI7FllIyNNyRz7r+lhLPtmr0sgEk6MnxAaF
         IXe10ndp68ptHlzqcAXID9ADA3euERmpmVoQkJX7TlkFI6LDJR/ZngMeVDEaj2g9WkaV
         pQKA==
X-Gm-Message-State: APjAAAUDHAuEu6nY3lmL9g9KBzvSObtt8cvfES//T36/obX2MgAjjxfN
	4MSVqZydG4DEy+T3ymh5k68pS22ft8llu/p2h1M0Ulji
X-Google-Smtp-Source: APXvYqxAUFudORQpbDyAPQOA/l0w6UUewDHdELu++96gV1Gr1zi80gzkdA2F2MaZjkPKU8h9Gxtt3J/BjTSiCuI8m3U=
X-Received: by 2002:a05:6402:1250:: with SMTP id l16mr26345972edw.219.1574786428314;
 Tue, 26 Nov 2019 08:40:28 -0800 (PST)
MIME-Version: 1.0
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 26 Nov 2019 11:40:17 -0500
Message-ID: <CADkTA4N5=fsC-gZ4W8TYExqjXiKtQCH7Sr1SiERDZvVd-j-h7w@mail.gmail.com>
Subject: python2 removal
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a8262e0598428971"

--000000000000a8262e0598428971
Content-Type: text/plain; charset="UTF-8"

Hi all,

Just a heads up that we have to (collectively) remove python2 dependencies
from the layer. oe-core will soon be python2, and the host tools
underpinnings will also be removed. meta-python will go python3 only, etc.

So I'll start looking at the remaining python2 dependencies and see about
what can be dropped, upgraded or blacklisted.

If anyone is already working on a particular recipe, let me know
(preferably by replying to this email) and we can avoid duplicated efforts.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a8262e0598428971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Just a heads up that=
 we have to (collectively) remove python2 dependencies from the layer. oe-c=
ore will soon be python2, and the host tools underpinnings will also be rem=
oved. meta-python will go python3 only, etc.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">So I&#39;ll start looking at the remaining python2 dep=
endencies and see about what can be dropped, upgraded=C2=A0or blacklisted.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">If anyone is already work=
ing on a particular recipe, let me know (preferably by replying to this ema=
il) and we can avoid duplicated efforts.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>- &quot;U=
se the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--000000000000a8262e0598428971--
