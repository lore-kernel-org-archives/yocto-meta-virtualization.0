Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A970E105F7A8
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 13:13:02 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15455.1773407575465412348
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 06:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DABRK9ii;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad21f437eeso17256485ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Mar 2026 06:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773407575; cv=none;
        d=google.com; s=arc-20240605;
        b=KyYgPFkyTBh/cASC8jyPjftdi5LMpt1U1UYhr/tF8SD6r9aZuR7uE/nxyK1dGwnOA+
         F+zVU3kVB5XyzOxTedlgRR59OHqMwP1cPxNw4OWrstmbg19pKQjJZvGupKOBMeCklkEz
         6a9pmN37yk7BTqVVyq7fS6muvIV7sX8x0EjAEQdnu94jCmds3VRvtajAuvA2YdgNEoLg
         +eYtnA+D4E8+VaOq/1buBkxmgjoMKpGdg0gHZio1Bj87HdMbBFjoN8b/Ccv18NnZFZxI
         0UmJFcVzt9avsX8sM0b7krTvaW2gawyxP2wsCq8E1LUtcuE1f457u9bGn549LCXkpQml
         UG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zxn9xLYZnQXKiWxifVlo0C87uNMaL1Yd3jFhLXs97Nw=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=INPiTRAegfpHX0YIco6O8UzCgl7TO1oVir5SUqt3LnSlWmyPO5XHfYShUCeuI4Nqa2
         K4K9uI1otJLDtnTNM3EaTeIHnL94aUFdWcw62UJvY4I50jpO16ylngImDQsdhwMoQq++
         UxNUPe9H8hHHiZajLazPIfuvZPCL2OstMr0DKBNJJ0iGice6uJaS65Z7khSxv2EH4IWl
         YbDYP0qNyiGnuGLNZ42KO4/JU4QJa4PgVzlIYqars1M+RCh2GseYWHr3rmpkshId2IQ3
         Ykrd9BwnPEJ0f/ucq64zLU6ifttQLRfAwkg3yucaBCI9E5Cpv1d4EzhjTDwfxB1xRP0/
         L5eg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407575; x=1774012375; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zxn9xLYZnQXKiWxifVlo0C87uNMaL1Yd3jFhLXs97Nw=;
        b=DABRK9iiG5jil59gAn30UTK1b5O94nDvTIPKSdcQ8T8QdRnSENh5SwL7TB2bPoTrHb
         7/id9StLeBccZbC/TlDOI7obwFILH0eOMis9elQGZztmdQ9LtGlhEaY5IizYDTYA2yi3
         kFbdzWhQAcaL1hfbKwGeQwe/ABjGz90iVwvh5lzZp8LBEWts5lwFuNAkQNFAliy0/4Ht
         b8Wst243wpl2Fzoa2td5A0uCjL7vCVadqjM+7cUnY15Bnb0qWPp22rxXYZG3UX4lqZaz
         cDHE3BfG5XA1EPggnmDmYP3ReXF5XxqfuuvKnbV7mpYSCEhpOqoR8sRsNhTRPnDymFSX
         JLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407575; x=1774012375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zxn9xLYZnQXKiWxifVlo0C87uNMaL1Yd3jFhLXs97Nw=;
        b=JlQK70FhOdrLpgHY4IwAaaAJyioqfk1xLy92/vfNIhqn9Z66Esnp/5eVPzF6w0/t5z
         33DedqP6Ne5JngLKos4iL1OYLXUR3K49jYJunModWJIf0VvVmB+iBFFUjSg6sKpM9LvW
         04viQXHt0RBS84w7GIhHm+Mf2iQykl0e9F5h5DU/4Ofy/YYtz60qLgSV6OUaql7GPfS3
         fMxoiCF9/tKO2zKzNBriShAl9FTvqs6ORwQCFPGt9wF4d3gpQj96Ph4cjNlvjqkNqf6v
         XJ7B0IKGYRPazcQsl04sp+fR7qDWyD2s6naNPcVxJGXkOTuwOclPf+jlvgKtk73/BuK+
         drow==
X-Gm-Message-State: AOJu0YyvClxfpltbybNEVvlst3VoPhiwqRZ1BQpD2yGDKmMduhc8BILr
	Yd0Gbb1dl0LQOOnmuaa2vQ7VR8isyp6MwMSP1AbUHTS69X8ADg9F9QaJ4tND/8onPgR128/ZLCv
	zmcHRx4ia0I94lMnVhn+8JZGyaASGB6s=
X-Gm-Gg: ATEYQzyluMH1r5DuYHXf8OA3xVNJd/RYPf9FIS8QwmPbov7ZjuuIISMD4yfevhb5cYy
	RsfG7TwCzCby+fgdKhgEbQ6rAbVYJef62WXk2PGbWvYZ4lPT7JQtySLaDAixMKc2mum9sQr9I+l
	ujMJ+Qdqqk22Bco1R9C+DRsA8eycB2DHk0z2TF7IQ6GPkcrhdbHTkYS+q8ill375jYQMHr4leq1
	8vvxJ4YjDao0d5xnLui0fNn7c2iOkAc4v3rQk0jnhwCYqJ9XB5YbkJ4ia6VcuAlpVyZ5ZLJ4ugP
	PvNQRGLZnsx+t7rnRQJHRucZEqDTQHhZvZsB02FZ
X-Received: by 2002:a17:903:186:b0:2ae:47b0:dc80 with SMTP id
 d9443c01a7336-2aeba48f0eamr69714555ad.11.1773407574570; Fri, 13 Mar 2026
 06:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <OS7PR01MB14444531B5782AB7319573E0E9B45A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB14444531B5782AB7319573E0E9B45A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Mar 2026 09:12:42 -0400
X-Gm-Features: AaiRm52gQj8pbz5iKRleYMkkHR_tXGvIjVntcAN4LD_u1h5tmpHu3Be1uJebbcQ
Message-ID: <CADkTA4O69wUfBCyg+rwRj4VzEXbfwxi2NcOxZ2t-UxuYioE_5g@mail.gmail.com>
Subject: Re: Question about podman load
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000863b0c064ce7a01c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Mar 2026 13:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9653

--000000000000863b0c064ce7a01c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 4:56=E2=80=AFAM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

> Hi Bruce
>     I tryed to load image build from meta-virtualization as following
> steps.
>
>    1. Set OCI_IMAGE_TAG to a new value
>    OCI_IMAGE_TAG =3D "repo:2.0"
>
>    2. Load the image
>
>         # podman load -i container-base-repo_2.0-oci.tar
>
>         # podman images
>         localhost/repo                             2.0
> 039d39254c04  14 years ago   5.58 MB
>
>     I found OCI_IMAGE_TAG can specify the image.ref.name for oci image
> and loaded by podman,
>     it will have a format like  localhost/repo: 2.0.
>
>     My question is that how to specify the REPOSITORY "localhost" to
> another name?
>     For example
>         # podman images
>         buildmachine/repo                             2.0
> 039d39254c04  14 years ago   5.58 MB
>

The short answer is: there's no build time way you can change that, and it
isn't a limitation of anything we've done in meta-virt.

I ran into this when working through the new mult-layer OCI images and
the cross install features. I opted to leave it as-is in those cases, since
it
is the default behaviour.

Both podman and docker prepend localhost/ when loading images that
don't have a registry-qualified name.

The OCI ref.name annotation in index.json controls the name:tag portion,
but the registry prefix is enforced by the runtime:



Even if ref.name is buildmachine/repo:2.0, podman shows
localhost/buildmachine/repo:2.0 (still prepends localhost because
buildmachine doesn't look like a registry =E2=80=94 no dots)






One workaround is to use a ref that looks like a registry hostname
i.e. contains a dot or colon.

So set:  OCI_IMAGE_TAG =3D "buildmachine.local/repo:2.0"

Which would give buildmachine.local/repo:2.0 in podman.

But for arbitrary names without a DNS-style prefix, the simplest
approach is to retag after load:

  podman load -i container-base-repo_2.0-oci.tar
  podman tag localhost/repo:2.0 buildmachine/repo:2.0

That's what I've planned for some normalization of names, but
I haven't done that work yet. So there may be issues lurking that
I'm not aware of.

Bruce


>
>
> Liu
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000863b0c064ce7a01c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13, 2026 at 4:56=
=E2=80=AFAM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg-7406259663775744806">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Bruce</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 I tryed to load image build from meta-virtualization as follo=
wing steps.</div>
<ol style=3D"margin-top:0px;margin-bottom:0px;list-style-type:decimal" star=
t=3D"1">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<div role=3D"presentation">Set OCI_IMAGE_TAG to a new value</div>
<div role=3D"presentation">OCI_IMAGE_TAG=C2=A0=3D &quot;repo:2.0&quot;</div=
>
<div role=3D"presentation"><br>
</div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<div role=3D"presentation">Load the image</div>
</li></ol>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # podman load -i container-base-repo_2.0-oci.ta=
r</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # podman images</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0localhost/repo =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 039d39254c04 =C2=A014 years ago =C2=A0 5.58 MB<=
/div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 I found OCI_IMAGE_TAG can specify the <a href=3D"http://image=
.ref.name" target=3D"_blank">image.ref.name</a>=C2=A0for oci image and load=
ed by podman,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 it will have a format like =C2=A0localhost/repo: 2.0.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 My question is that how to specify the REPOSITORY &quot;local=
host&quot; to another name?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 For example</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # podman images</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 buildmachine/repo =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 039d39254c04 =C2=A014 years ago =C2=A0 5.58 MB<=
/div></div></div></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">The short answer is: there&#39;s no build tim=
e way you can change that, and it</div><div class=3D"gmail_default" style=
=3D"font-size:small">isn&#39;t a limitation of anything we&#39;ve done in m=
eta-virt.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">I ran into this=
 when working through the new mult-layer OCI images=C2=A0and</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">the cross install features. I=
 opted to leave it as-is in those cases, since it</div><div class=3D"gmail_=
default" style=3D"font-size:small">is the default behaviour.<br><br>Both po=
dman and docker prepend localhost/ when loading images that</div><div class=
=3D"gmail_default" style=3D"font-size:small">don&#39;t have a registry-qual=
ified name.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">The OCI=
 <a href=3D"http://ref.name">ref.name</a> annotation in index.json controls=
 the name:tag portion,=C2=A0</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">but the registry prefix is enforced by the runtime: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>Even if <a href=3D"http://ref.name">ref.name</a> is buildmac=
hine/repo:2.0, podman shows=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small">localhost/buildmachine/repo:2.0 (still prepends localh=
ost because=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">buildmachine doesn&#39;t look like a registry =E2=80=94 no dots) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>One workaround is to use a ref that looks li=
ke a registry hostname</div><div class=3D"gmail_default" style=3D"font-size=
:small">i.e. contains a dot or colon.=C2=A0</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">So set:=C2=A0 OCI_IMAGE_TAG =3D &quot;buildmachine.loc=
al/repo:2.0&quot;<br><br>Which would give buildmachine.local/repo:2.0 in po=
dman.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">But for arbit=
rary names without a DNS-style prefix, the simplest</div><div class=3D"gmai=
l_default" style=3D"font-size:small">approach is to retag after load:<br><b=
r>=C2=A0 podman load -i container-base-repo_2.0-oci.tar<br>=C2=A0 podman ta=
g localhost/repo:2.0 buildmachine/repo:2.0<br><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">That&#39;s what I&#39;ve planned for so=
me normalization of names, but</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I haven&#39;t done that work yet. So there may be issues lu=
rking that</div><div class=3D"gmail_default" style=3D"font-size:small">I&#3=
9;m not aware of.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0</div></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-74062=
59663775744806"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Liu</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000863b0c064ce7a01c--

