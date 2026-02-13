Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB145EF99DF
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 21:30:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82588.1771018243112604267
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 13:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IfADafTT;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a929245b6aso14826905ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 13:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771018242; cv=none;
        d=google.com; s=arc-20240605;
        b=AU1Bt/OTrfFnr3Sn58hUAgHoPr04wqeSI0WR+eRSenkFi3QvpIwmv7ZwuCeAdBQc40
         dhMZqWi3O9MPbD49YxcssLrv2IM/PaRsU6gU2x6x8Zt11UNJaYBHxhu3zJZjapXwQ0Qu
         1SiBnHLAy8dUoQAS+pmRweGZh8bkL6zg0Ims9lqghoKbAVXtvvh116GOWHcsbhfmil3n
         q2m9KHzwnF6ezOwol01cbKt4vCbWBN0Y6IjiUw3Jm4uU7x6H2JTq/oqqd+6GhfbnkPLd
         yhnFWsqb6NadqKEpJSaPwEQUM2NO1jo4+kIOQl/28SJnarlJ9qL869WS+GANbJxNKjJD
         KMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kzEJ/zfa6O7XA78qQJy+/b7jOFJFOs66AFo+U7MRA6Q=;
        fh=Xuw+cKGYoZZmq0J9yQj1zpWTmozy5yJ5384HoHP1TzU=;
        b=RpM7HpXx6vs5nz2fYA+Kat8xeihNA2PmRUrc7Q08XEXUVApv0B6Bwr6A2zhvv37+yA
         7xD7dyTys16SAfhTMdbEe9CNYsyBGtWYqo0+ORaY4SVX2i22PTGKgDQJ80Z9nI8g288J
         CSDrutXZ2uyt2vvsyaZM/v7WXIA74GQm7JOuM1G3wVE4kgKwUADeSVT2ayo3bVOzmeP0
         mK6eib2/n4yi7BXeCBu/a2+lUatz+duBVrSo1mOtoom1v4JPQEEK5cjM9f1taxwO0Tha
         cmzddrIOfDU7riQTIVwDbP9WZ+IJGFW56sTRolM8Iurg0QPm6YRgZW+afGAJ/TfxISml
         uJKQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771018242; x=1771623042; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kzEJ/zfa6O7XA78qQJy+/b7jOFJFOs66AFo+U7MRA6Q=;
        b=IfADafTTZgOMjJ4xHBF1V5g4vO03qbC2yQ7xg1kVAUB9BU8Z5dfH+lUN2p8M2oJ3Y5
         z1YrGF3KfhjYNNZHHg5WxaZmOEm0xXbuqAcf9Ztbh8hEwvJ6vgFqTR2o/oqG/lAzSCoU
         lTlOCp2AGXLlEmVJj4IC6aGhToctgOwsaHgtElk7TLFLGZWSY3fgtTEPG4okRk0Agl5I
         qvIygr2B4j+Fky8rqkrrIwz4KF3FxxlY4x+HuZQhv7UcP3h2XMF05/2NbjBSJYcmIR9n
         kvhwOA3YmkEmRi+0rCeof10nIIptBHBz8CkEpEI7jtdLUQ/CnZ3aedLlcdqdx+VRX9rJ
         8Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771018242; x=1771623042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzEJ/zfa6O7XA78qQJy+/b7jOFJFOs66AFo+U7MRA6Q=;
        b=f2OGNkZNaM6qqjCikOXgnuXOjTSb6+iOpB607IjVV/+XPFuwNiGShZ4MFQN1qsiRmZ
         Kq1UdSJVLQAnSyl+iICbVTwF1h6vq2pj3Yk5M0w16M46Hgez/MtvJkP6jIgnVqUISLSD
         AG6pRqs439ky+jg/LeMGzJxfDR+1uloUqza9uz0GNmKiqTRwivaG923fmLkSgDjCSq9t
         VMUa4FxXNNhANPFEGMn7EV7LlmvRqTCDxKLGzxLHKcsQOyPzLEs99qO1MdcN3FB6+J2L
         wup5VDIZogCn08TuvwT75MbSIt3nKZUcpdkioND80KWz8Am1pk4FM33VHn8DilWvkIQn
         P0RQ==
X-Gm-Message-State: AOJu0YyBqDxHihSiB6WyKmuUuzVyotCS0zBXXOcZVj0Aewq+/iu0oFCH
	RrP7ugOLUkATehOJ3fSE0gRg+exJ4y+N9HmclU6w7A+76JF1TaZuutZ+GytdacIOBduyawz/PUk
	EcpB/NfUacCiXwiK3WctgtyNZH2ttLsI=
X-Gm-Gg: AZuq6aKAozL9op4oUijFUrNJ9BaGFRUagt51rUjNNpOPEzXerNIhJX/EbkBGf4bBku1
	lM07Ol4R6ROYcaMVvNJYD2oIdSHnOGNKwfaMXgoTjon5DVqoe3ZuKIIgVNnxdyGm1owZ/TZGN7T
	oyHQkiWQvQJ5KVtrfRlTTDvdYsnPVxVSQY9pYr3oEEnU7Kkj3McqhjC8zX6liQhwkpayfbEoF/l
	tJ/niKxEpaaJ5gCEOlfsBFng3aITJ+TGcm9m0uyfGBaRR4j12fCLIlANytywuDmrVeQmzywfqTi
	+lM6ltol7/zhtUhVoRlTdKE+j6iSRo3lwpg30Q+1
X-Received: by 2002:a17:902:db0d:b0:2aa:e21e:bfc0 with SMTP id
 d9443c01a7336-2ad1754fcf7mr7690915ad.47.1771018242170; Fri, 13 Feb 2026
 13:30:42 -0800 (PST)
MIME-Version: 1.0
References: <DB5PR02MB102135C5C5638C66FD1EA6545EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102135C5C5638C66FD1EA6545EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Feb 2026 16:30:30 -0500
X-Gm-Features: AZwV_QiKP6uUUP5Kwljt1obpbPHhjncW-KAG0uVH2HlIi2wUeZJ05FJPpvwZmMM
Message-ID: <CADkTA4PJUECh+NcTfirsYGJ5Vb4zieT+We+6fyyPf3cP8xqVnw@mail.gmail.com>
Subject: Re: [meta-virtualization] Message about vcontainer-tarball when
 running devtool modify
To: peter.kjellerstedt@axis.com
Cc: "Meta Virtualization (meta-virtualization@lists.yoctoproject.org)" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000372358064abb5199"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 21:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9588

--000000000000372358064abb5199
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 4:22=E2=80=AFPM Peter Kjellerstedt via
lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.or=
g>
wrote:

> With the latest version of meta-virtualization, I now get this
> message when running devtool modify for any recipe:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> vcontainer-tarball: Building SDK with multiconfig dependencies
>
>   Architectures: x86_64 aarch64
>
>   This will automatically build:
>     - mc:vruntime-x86-64:vdkr-initramfs-create
>     - mc:vruntime-x86-64:vpdmn-initramfs-create
>     - mc:vruntime-aarch64:vdkr-initramfs-create
>     - mc:vruntime-aarch64:vpdmn-initramfs-create
>
>   To build only one architecture, set in local.conf:
>     VCONTAINER_ARCHITECTURES =3D "x86_64"
>     VCONTAINER_ARCHITECTURES =3D "aarch64"
>
>   Incremental builds enabled (default).
>     To force full rebuild, set in local.conf:
>       VCONTAINER_FORCE_BUILD =3D "1"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Since I have no plans to build vcontainer-tarball, this is quite
> annoying.
>

This is a significant evolution of what meta-virt can do, so yes,
there will be a some tweaks that may be needed.

Constructive feedback is welcomed (as are patches).

But are you running the latest ?

https://git.yoctoproject.org/meta-virtualization/commit/?id=3D30c5d74db7489=
b5938453bfcd3ef9151704e2bd0

Bruce



>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9587):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9587
> Mute This Topic: https://lists.yoctoproject.org/mt/117800194/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000372358064abb5199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 13, 2026 at 4:22=
=E2=80=AFPM Peter Kjellerstedt via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axi=
s.com@lists.yoctoproject.org">axis.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">With the lates=
t version of meta-virtualization, I now get this <br>
message when running devtool modify for any recipe:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
vcontainer-tarball: Building SDK with multiconfig dependencies<br>
<br>
=C2=A0 Architectures: x86_64 aarch64<br>
<br>
=C2=A0 This will automatically build:<br>
=C2=A0 =C2=A0 - mc:vruntime-x86-64:vdkr-initramfs-create<br>
=C2=A0 =C2=A0 - mc:vruntime-x86-64:vpdmn-initramfs-create<br>
=C2=A0 =C2=A0 - mc:vruntime-aarch64:vdkr-initramfs-create<br>
=C2=A0 =C2=A0 - mc:vruntime-aarch64:vpdmn-initramfs-create<br>
<br>
=C2=A0 To build only one architecture, set in local.conf:<br>
=C2=A0 =C2=A0 VCONTAINER_ARCHITECTURES =3D &quot;x86_64&quot;<br>
=C2=A0 =C2=A0 VCONTAINER_ARCHITECTURES =3D &quot;aarch64&quot;<br>
<br>
=C2=A0 Incremental builds enabled (default).<br>
=C2=A0 =C2=A0 To force full rebuild, set in local.conf:<br>
=C2=A0 =C2=A0 =C2=A0 VCONTAINER_FORCE_BUILD =3D &quot;1&quot;<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Since I have no plans to build vcontainer-tarball, this is quite <br>
annoying.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">This is a significant evolution of what meta-virt=
 can do, so yes,</div><div class=3D"gmail_default" style=3D"font-size:small=
">there will be a some tweaks that may be needed.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Constructive feedback is welcomed (as are patches)=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">But are you running the=
 latest ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><a href=3D"http=
s://git.yoctoproject.org/meta-virtualization/commit/?id=3D30c5d74db7489b593=
8453bfcd3ef9151704e2bd0">https://git.yoctoproject.org/meta-virtualization/c=
ommit/?id=3D30c5d74db7489b5938453bfcd3ef9151704e2bd0</a></div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9587): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9587" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9587</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117800194/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117800194/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000372358064abb5199--

