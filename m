Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15BBCE7B15
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:44:25 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.35021.1725630259350109355
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 06:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c9P8jCxD;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-717934728adso1408771b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725630258; x=1726235058; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CvATz+0+IsvKiCcQnnYVnimgN/s6+RYyg/8HxtY8uwk=;
        b=c9P8jCxD3PCyZSNYSLDzL89UxzHl/JqOLEdC1qKbFOpCWYN04uy9bo9BSmtrUW4mex
         HlmyiT6SC6hQgrg+MhSp+7Th2IBF7Z8XRhp9/E/Fa8vPyU1wloX8ogPBIX59yD3IxReh
         xucPKQVpH+SyKbgnVI3+lH2PuGF7pEGHlWlW/srlbsA3COwHYfRw6Fc4xg8fwGOY8bwQ
         6NwwDhwEjhBtGll+z45WX4v6tsLkrUPLicmWQc3/1o14TuhTZzPy4EM2mkE+hyuJ1Gt8
         CmdVv0emJEC9FlosZjZDax1YdODGdHXQhmcTykpKmJS/FVlZAVI8iXcbYp+Qyr3NDbaM
         xgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725630258; x=1726235058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvATz+0+IsvKiCcQnnYVnimgN/s6+RYyg/8HxtY8uwk=;
        b=D5N/y1FqzodzZ01fu4GwZTozfcmz51U96gtOLs7kPYIuy7eYfMUC+hXzSa7pf49jQJ
         EjeAnpbwSzyZif48SowYYPKPfOu37A/5MAEGets4B/1XzwqP7vTxWYoYGoFpmut2iVoF
         zFTdRwd4moZwxl0bzajRX0dVQ+VujUrCIwPBdbdy2RZkDmdtYcJdM5yCs1Fe5V5EdfN3
         lfXSqntlXTrj80V+haEfGx4Xsh52aZh0Smm1c1GxQJ997zLWln+mz/arvJ8XWLNpQ1lr
         jYZgWimAq3R3ZQptzvEOsOf+XZomc3tdBlORBI5SET2dmzAhz0M8mG54gLs06T12k2HR
         Zhng==
X-Gm-Message-State: AOJu0Yw3ANw3V7WImxzhhM8YRi7tA14koC0WhU5nW321VhagKNOfgth0
	MFKackHevCDvt7ctSGntIFeiz+Uom0loKJApJOi+nqrUximMiWnUxiEdGkH6Bu2VGZtleWsJ/4l
	EhH+YYUlIH5Tzb6AY8cdx6WMZUIQ=
X-Google-Smtp-Source: AGHT+IE9ge2Ln+B7LVaJ3DYuG1gFOVAB5YVyAYREsIhwqGHtfKsvhKJAi+WDBkp0nb3Eo5fjFtOrJ/+79IjhV369MA8=
X-Received: by 2002:a05:6a20:ce47:b0:1cc:e02e:f2c2 with SMTP id
 adf61e73a8af0-1cce0ff2410mr28667494637.11.1725630258185; Fri, 06 Sep 2024
 06:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <g6fqs7n55g3tl5f3iqq4evfjvdbo3p33eyhmpqkwbtpqnwt6m5@sj4psvs2kglu>
In-Reply-To: <g6fqs7n55g3tl5f3iqq4evfjvdbo3p33eyhmpqkwbtpqnwt6m5@sj4psvs2kglu>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Sep 2024 09:44:05 -0400
Message-ID: <CADkTA4NwyiEzkXuSwV5Uow679-3hq2mh7MpQxT-f4WwSaiS8-Q@mail.gmail.com>
Subject: Re: Backporting Xen 4.19 to scarthgap
To: Amneesh Singh <a-singh21@ti.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008d8d2d0621739ab9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 13:44:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8872

--0000000000008d8d2d0621739ab9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 9:37=E2=80=AFAM Amneesh Singh <a-singh21@ti.com> wro=
te:

> Hello,
>
> Is backporting Xen 4.19+stable to scarthgap a possibility?
>

I don't hold quite as strictly to the "no new major versions in stable
branches"
as OE core does.  In particular for recipes that I carry multiple versions
of.

Xen does fall into that category, if there's a compelling reason (i.e. a
feature we can't backport that is required), then 4.19 could be added, but
not made the default version (that would break policy).

Bruce



>
> Regards
> Amneesh
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008d8d2d0621739ab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 6, 2024 at 9:37=E2=80=AFAM Amneesh Sing=
h &lt;<a href=3D"mailto:a-singh21@ti.com">a-singh21@ti.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Is backporting Xen 4.19+stable to scarthgap a possibility?<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
I don&#39;t hold quite as strictly to the &quot;no new major versions in st=
able branches&quot;</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">as OE core does.=C2=A0 In particular for recipes that I carry multiple=
 versions of.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Xen does fa=
ll into that category, if there&#39;s a compelling reason (i.e. a</div><div=
 class=3D"gmail_default" style=3D"font-size:small">feature we can&#39;t bac=
kport that is required), then 4.19 could be added, but</div><div class=3D"g=
mail_default" style=3D"font-size:small">not made the default version (that =
would break policy).</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Regards<br>
Amneesh<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000008d8d2d0621739ab9--

