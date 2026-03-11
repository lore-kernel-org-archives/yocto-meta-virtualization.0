Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8183D106289D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:08:14 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20519.1773234492092547670
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 06:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sowo5YSd;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so502563a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 06:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773234491; cv=none;
        d=google.com; s=arc-20240605;
        b=EzjkBmtA8MyHUwpXoDBwoEpTJjEiA5/1PTOggP/5T6XdWAbHGSMpmZseBYOdZZBkGp
         poYdJkibCF3g+NEqQTYv52Nxb4wB2r6KlZr9UJ4xW2zSv3UBohQ11Mnpeiqh35a46YNC
         UIzzPis+I+D9rzB3PaDaL72QUg027aoz1SuS4swVS66k6qpGZvybqCXcwaN5+tEm3wRz
         6ZIn9YeZjp9A4H2jdB+xFIrVBwQEOBE49xB4l8xUSMh8P0bSQ8Tv30g684N5PhAl02WO
         /KlbaI684BZc89nrb1ZlaUL6wAXJfVhZyU/7gY2W8QJi/wGrfxr07v/g4gGE0JimIBle
         ysGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/sEY4tar2z05LPDZSLSuOADi0nsK/uWhc1L++M3jrNY=;
        fh=mqNUjzhwlp71Nj2NaGIsOyLnfEmnK/vKTQnU2KDb4HI=;
        b=EoY4D08vunsoM9/FiWY6i57e3rA1L0gdFSzYQ6ZKH3klmLb4nuNrnCP5o6nVc1iBqV
         0/q+gGadqRQULmjPczbkmr3jme0TJKBPBHREVG9F2y4/fN8rv1rJ4bhlmowFe887Q/5w
         atkKD6tZsEaP24f3eeE5Mf7J8gxy/vsm7yP+3YQRSAYPI7nMtFZ2Fzf0Foim/1XoHYx1
         c1BAvySKIjf3JasFsNNaoFWzzMhFhOOlvOpP0eogaglw8Qa9TtZuTwPfqmzdhVdC9g4c
         D6DRa20geGm2z2oolpm66LNr/OeQVGEoZVA4e898kPfl/f0MI5pwe3UcIS/fJewaXLom
         hdCw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773234491; x=1773839291; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/sEY4tar2z05LPDZSLSuOADi0nsK/uWhc1L++M3jrNY=;
        b=Sowo5YSdTqRi0O6dupNzxwmPchxEDJFkt/3sgUwhRlTAsDJBf5z6j4324uOQZpCw9e
         KZ/ZVDfcvNHD+/v6cZadSubq/oF40X/7D6dHDAgjFA8dh4sQURbGAOZkBeNN0ARRIBp8
         egTxOK7X0YVgUWg/rs8zPTzaFhPP09bkqgVKxlGdWkIZCjKuWATzZJKxLR+tMBB7kRqM
         w6oIMYy+hGexuIirrbH1qQcmgwfIyVfvyEpWjs5cj3/wroH5DFoLSZsJniTLHf6AMT9q
         iwmiFMPhiErCOTGqcWH8xWFdLWqJfu15QSIuVcjCn7D3OREJqKI7rO1Qrj6FLLZUFF32
         fnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234491; x=1773839291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sEY4tar2z05LPDZSLSuOADi0nsK/uWhc1L++M3jrNY=;
        b=hxKSnuc1XyNAfTXHFHBXRSp7gVZIxjRI2f5LGQteGd14UD0Z/Y257YZMMWkdBVpAR2
         TEUsOZifmQJ6fHGJMkUJS5MUXvRCmzA2ReTS9Llx673QA4gNihHApGxs+TNUAgH8U/DA
         9mg0GHoTdvHEkkxZ6hjBLh/y+hN6qJKDRz35RNw1abYQGBICK+f99CKhrC4+mUPRXPsr
         mdYNWfRXQqYPPXYmPahPBTA2yDB94Gs1VeA0oRCVVPJe4D25xaDX0rNnxPQWfADs9Kyh
         Nrvlx02A850/X+vgTmG22esJf4/A1DWtG76EJHeEwRo2PWPdA9ajA9r2GPsUuQkd7CxA
         xv6g==
X-Gm-Message-State: AOJu0Yz4ZABQlJLbspgH4v3STgKITwIRcONclogFrMDRudAG6lmiTw96
	af5UBVn62fccF5CMuJ3WEGaaF5qD2gKpgasLMRYHBFZ40n5Jqav1fyXRPuMrNV0H38C5WmVBUlW
	TCZt6ugg48BfWNgccv919nwkCrkHDTJE=
X-Gm-Gg: ATEYQzxeJSQjms3T/5nsj9wfDVaQf8/ab+3MuNU3GXOnVpMVvBzYqdcb5csorObQNGE
	/XPk+8CsJU7dAGJ88J2puFWm/c+KjzSUIqHqMW5ejmcN5wemego1yPP4HTZ6ElpBOGjQxpn1ih8
	gTey52zLBK/0hchqvziS2aQpfetHhh8JWSPuoHDDakM+VsiWqGTh85piQ9u51ti6rxf30ZN4Fc4
	CWZEA2DC725mvlLPplpJgjdCL3PrYgWhKfUlmO5PVGp+88UukgaG8uS6X++NJN2tD8cwQVDWWHT
	m2zgempcY33N8cofjeULwi5hlyGxPNoOXYoqbKNw
X-Received: by 2002:a17:90a:ec85:b0:354:c602:a573 with SMTP id
 98e67ed59e1d1-35a012cb36cmr2417098a91.27.1773234491323; Wed, 11 Mar 2026
 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310135815.3353144-1-martin.jansa@gmail.com>
 <abCdV-WOM6O4DYfk@gmail.com> <CA+chaQf7Uv8NbP9hzeieTaQ_h+ZPiLMBfQvJugR6g+77Oj4A_A@mail.gmail.com>
In-Reply-To: <CA+chaQf7Uv8NbP9hzeieTaQ_h+ZPiLMBfQvJugR6g+77Oj4A_A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Mar 2026 09:08:01 -0400
X-Gm-Features: AaiRm50Y2MlK3JMB8RzTYOr6vt8yLzP5C32PlfC5CaJFA3t_G14Ya9Yn0Rxwn8A
Message-ID: <CADkTA4NkXon0ZWoSVnh42hKUgY6ZZ+Uk9Y44mV0DF8EhYeZUbw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] cockpit-machines: move to
 dynamic layer for meta-webserver
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f579ac064cbf5381"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 13:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9648

--000000000000f579ac064cbf5381
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 2:21=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> On Tue, Mar 10, 2026 at 11:38=E2=80=AFPM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > In message: [meta-virtualization] [PATCH 1/2] cockpit-machines: move to
> dynamic layer for meta-webserver
> > on 10/03/2026 Martin Jansa via lists.yoctoproject.org wrote:
> >
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > >
> > > it depends on cockpit recipe from there, fixes:
> > > ERROR: Nothing PROVIDES 'cockpit' (but
> meta-virtualization/recipes-extended/cockpit-machines/
> cockpit-machines_346.bb DEPENDS on or otherwise requires it)
> > > in bitbake world builds
> >
> > I guess alternatively, could a skiprecipe be raised if webserver
> > isn't in the collections ?
>
> That would work as well, but dynamic layers looked better to me, your cal=
l.
>

I'll ponder it.

I'm just thinking that I'll forget about ever upgrading it if it isn't
where I can
see it (it is important to recognize one's limitations :)) .. but since it
was
a contribution, hopefully the contributor would send me those updates
anyway.



>
> > Or meta-weberver becomes a dependency (which I do not want).
>
> It's also already listed in LAYERRECOMMENDS_virtualization-layer which
> seems enough for this optional recipe (I don't even know what cockpit
> recipe is, I've seen it for first time in the error message :)).
>
>
Agreed.

Bruce



> Cheers,
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f579ac064cbf5381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2026 at 2:21=
=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, Mar 10, 2026 at 11:38=E2=80=AFPM Bruce Ashfield<b=
r>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; In message: [meta-virtualization] [PATCH 1/2] cockpit-machines: move t=
o dynamic layer for meta-webserver<br>
&gt; on 10/03/2026 Martin Jansa via <a href=3D"http://lists.yoctoproject.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<b=
r>
&gt;<br>
&gt; &gt; From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; it depends on cockpit recipe from there, fixes:<br>
&gt; &gt; ERROR: Nothing PROVIDES &#39;cockpit&#39; (but meta-virtualizatio=
n/recipes-extended/cockpit-machines/<a href=3D"http://cockpit-machines_346.=
bb" rel=3D"noreferrer" target=3D"_blank">cockpit-machines_346.bb</a> DEPEND=
S on or otherwise requires it)<br>
&gt; &gt; in bitbake world builds<br>
&gt;<br>
&gt; I guess alternatively, could a skiprecipe be raised if webserver<br>
&gt; isn&#39;t in the collections ?<br>
<br>
That would work as well, but dynamic layers looked better to me, your call.=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;ll ponder it.<br><br>I&#39;m just thinking that I&#3=
9;ll forget about ever upgrading it if it isn&#39;t where I can</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">see it (it is important to=
 recognize one&#39;s limitations=C2=A0:)) .. but since it was</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">a contribution, hopefully th=
e contributor would send me those updates</div><div class=3D"gmail_default"=
 style=3D"font-size:small">anyway.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; Or meta-weberver becomes a dependency (which I do not want).<br>
<br>
It&#39;s also already listed in LAYERRECOMMENDS_virtualization-layer which<=
br>
seems enough for this optional recipe (I don&#39;t even know what cockpit<b=
r>
recipe is, I&#39;ve seen it for first time in the error message :)).<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Agreed.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Cheers,<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000f579ac064cbf5381--

