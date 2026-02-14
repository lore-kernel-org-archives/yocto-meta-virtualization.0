Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4B8EDF142
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 05:19:41 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1180.1771046375021517860
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 21:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dup0AM3U;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a95de4b5cbso14840925ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 21:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771046374; cv=none;
        d=google.com; s=arc-20240605;
        b=f8lghRcy4u+WS7W2zd3G1DizlXzm+Jsz/M2f9HnbhsMjMWrY2H+dYS2358+4OlXX5g
         bsM3mzu8uDv8a541eMSmuEaPneIXltwfJ7ufYoiX7AnVpjfQuOG4uNFvxrZqtbMRtx0g
         FZnuFgAFLNLyffOoMlrO5C7uaPDp02BqBahb/8rPoOPabZaB8TA3dtJ5bes/U3VDK1DO
         I3BrioN1AiPCbijKJ1rhn9mDY0fHw/4Vape2W2ctVltFnUrB1agvDjaRFY25Qx+T6D2E
         NUzSFeZ+BkTpKmKLjxOVxHchEU/w83AuvV/XK1ESQrSv9PY4UiP4Z4h9jo0rxljC7yYa
         t4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4M5lx0yVyE/u5zGo1QIY1sp4SQZCbIsWLor2OPSsyZw=;
        fh=fzXpmb+dGhl1hlkCwq9f9CtVrOZjINnk0TppoVscIzI=;
        b=kIXHWZWwuDP1sRcFWo0xTcNoQwp5uflaX0CTSVj0JHo7tRwJVorcNA4t2gs7CO6c9R
         xVKbiMjSlK6DAviUmVVhlUzvvga+jd8G589EDzexcZsbXVHJfogJE3AB/LrhnVspfqE/
         2Zn4Hi5CWC1J/F7QVhM7lZ5O2QFK4sY3JgsHz0/8rznHP7/rR83zIzF/MBnvOt6HkmcA
         6cxWYmjDrBD5cOz7yPn51qelrMiXtbVt4yNq8n7AXx0eFlNaTu6ovvMVBcGaj9Bp087C
         mt6sfd/bVuz28G44ybKh8Mn/g1BynyINHuDsGBUfKRXtfPO2N6tdf9iN6zE6vYAVG/cE
         F9SA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771046374; x=1771651174; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4M5lx0yVyE/u5zGo1QIY1sp4SQZCbIsWLor2OPSsyZw=;
        b=Dup0AM3U3O+rYOnM993ago29bDdAxF4WBAfkaD5JP/UMcOXocFPxfDhg9Jy2a8wWBs
         opNBGqr8QL8zRjMn5eOrUVCQuIrnMpaV2UxFNoCg8HlNEETGutrHjRKx3VShXQZ8Q3T/
         HJV9fHRo9vH3XEs6JcaehMpdNb6u841euml2qmmitr8HQl99N++lXEI9qrBBf3FVDGMd
         HTlmqHSq6prji1pyMpEgx4MAY1ff75MT2aI2ZxjhZztdP77uumCCEXipqXmKj3DWc9Od
         gZ9HDbhKTrfahTDU1vNNu6o3OGJzoQG6BnqmQJB+Ps99/yv0WQGFYKg4HsDhYSadswxN
         9fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771046374; x=1771651174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4M5lx0yVyE/u5zGo1QIY1sp4SQZCbIsWLor2OPSsyZw=;
        b=mBoWDX/MgOAq2BQDKeL/qE6KrZfvghwfQLHhlzrM5WIYZ9dUd8GMyWfBbiKjS7qZKe
         mxn+/WDE+rTfmw2g6LmDtzW4f2ZyQDbWKEccgscB0W5fEdi076Fqp21C79tADaLocX8u
         GVUAP2ijrh0s3LlZqLQPdJYrQw5S0iQY8T03e7iF8JB0GkT1xdQGJr37j8FPpXtfMdeE
         sO/RwWlcA+QInBOTttMjOwBw03BlTy+XcRvHaL+NKndZ83pDYRpajIo0qBxaIgI+iYtt
         72CoyYFupYwNyrcAobG1beXw8Osc/B3jBqD5wWY+aO4DKRtufty9nqbppTi1kHsI2m81
         6jQw==
X-Gm-Message-State: AOJu0YycFjs9eZLTogJfSvG153uVHNaAP/s4Ll0fs6ao4zsSwa3ug9jL
	RsujGwU6yOAkxiwKg0i7vkVy8jWxmKl7FoQqWlHR5n+b67oivmBOHXH+jaacGxpTrWbYCMF9HQ6
	ky4S4N2WsEcvIX4QYO7DODOpWikApic4=
X-Gm-Gg: AZuq6aJ24tsAyQMCH18kEcuS0hMMruGDmkukD60DMRBppsKJWa5gSxEJe54J1qlbhHO
	m4JnyYpJoPzb3x8B39plBYaXmoMvbxGndBFE+JufeVS9R3bUPJWCN3/4lTczm8w/CHSag9DKNmE
	o9o7LDZsmabS40TUzh895PX6rOJUAyfOROI62+3iZZ0Mes7qOGVoMVoskt7NaBUX3LkU4n7TJii
	nuocrtA6nmYdKwY+6MFvhV8mpSHDKTeWh3f5kUG0CtiJI8EIXxBY2UWQSMDIqjXhx/Z1d1Ohspf
	gwV4WVu+oviAv/igxnUgBuKhaoA+57AcTNFWGfWg
X-Received: by 2002:a17:902:e74f:b0:2a8:2c4a:3570 with SMTP id
 d9443c01a7336-2ab4d080a3amr54779775ad.49.1771046374207; Fri, 13 Feb 2026
 21:19:34 -0800 (PST)
MIME-Version: 1.0
References: <DB5PR02MB102135C5C5638C66FD1EA6545EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CADkTA4PJUECh+NcTfirsYGJ5Vb4zieT+We+6fyyPf3cP8xqVnw@mail.gmail.com> <DB5PR02MB10213C6BD4BF582B8215D1E92EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213C6BD4BF582B8215D1E92EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Feb 2026 00:19:22 -0500
X-Gm-Features: AZwV_Qic_j_jY7JF9abDHZ1ySnSRxQLYfQ-4HpraXF423nzp9kLxXHfecHQ92MI
Message-ID: <CADkTA4O8HGxtv2SQ2F8wveTTmRiACEnG8b9ahVthE8p42BDbvA@mail.gmail.com>
Subject: Re: [meta-virtualization] Message about vcontainer-tarball when
 running devtool modify
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "Meta Virtualization (meta-virtualization@lists.yoctoproject.org)" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000003f24d064ac1de58"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Feb 2026 05:19:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9590

--00000000000003f24d064ac1de58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 6:58=E2=80=AFPM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Well, I thought I was using the latest version of meta-virtualization, bu=
t
> apparently I was missing the last two commits. And of course the last one
> solved the problem below.
>
> Sorry for the noise.
>

There's other things lurking I'm sure, it annoyed me as well, I just got to
it slightly before you found it :)

Bruce



>
>
> //Peter
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* den 13 februari 2026 22:31
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* Meta Virtualization (meta-virtualization@lists.yoctoproject.org) <
> meta-virtualization@lists.yoctoproject.org>
> *Subject:* Re: [meta-virtualization] Message about vcontainer-tarball
> when running devtool modify
>
>
>
>
>
>
>
> On Fri, Feb 13, 2026 at 4:22=E2=80=AFPM Peter Kjellerstedt via
> lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.=
org>
> wrote:
>
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
>
>
> This is a significant evolution of what meta-virt can do, so yes,
>
> there will be a some tweaks that may be needed.
>
>
>
> Constructive feedback is welcomed (as are patches).
>
>
>
> But are you running the latest ?
>
>
>
>
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3D30c5d74db74=
89b5938453bfcd3ef9151704e2bd0
>
>
>
> Bruce
>
>
>
>
>
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
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000003f24d064ac1de58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 13, 2026 at 6:58=
=E2=80=AFPM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axi=
s.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div class=3D"msg4280338224638064511">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_4280338224638064511WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">Well, I thought I was using t=
he latest version of meta-virtualization, but apparently I was missing the =
last two commits.
 And of course the last one solved the problem below.<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">Sorry for the noise.</span></=
p></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">There&#39;s other things lurking I&#39;m s=
ure, it annoyed me as well, I just got to it slightly before you found it :=
)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg4280338224638064511"><div lang=3D"SV" style=3D"overflow-wrap: break-=
word;"><div class=3D"m_4280338224638064511WordSection1"><p class=3D"MsoNorm=
al"><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-s=
erif;color:rgb(148,54,52)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;
<br>
<b>Sent:</b> den 13 februari 2026 22:31<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> Meta Virtualization (<a href=3D"mailto:meta-virtualization@lists=
.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject=
.org</a>) &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org"=
 target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] Message about vcontainer-tarball =
when running devtool modify<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Feb 13, 2026 at 4:22<span style=3D"font-fami=
ly:Arial,sans-serif">=E2=80=AF</span>PM Peter Kjellerstedt via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproj=
ect.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.yocto=
project.org" target=3D"_blank">axis.com@lists.yoctoproject.org</a>&gt; wrot=
e:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">With the latest version of meta-virtualization, I no=
w get this
<br>
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
annoying.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">This is a significant evolution of what meta-virt ca=
n do, so yes,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">there will be a some tweaks that may be needed.<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Constructive feedback is welcomed (as are patches).<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But are you running the latest ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://git.yoctoproject.org/meta-virtual=
ization/commit/?id=3D30c5d74db7489b5938453bfcd3ef9151704e2bd0" target=3D"_b=
lank">https://git.yoctoproject.org/meta-virtualization/commit/?id=3D30c5d74=
db7489b5938453bfcd3ef9151704e2bd0</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9587): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9587" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9587</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117800194/105=
0810" target=3D"_blank">
https://lists.yoctoproject.org/mt/117800194/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_4280338224638064511gmailsignaturepr=
efix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--00000000000003f24d064ac1de58--

