Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237ACC83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:42:38 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2504.1751996550287639410
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 10:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7KLpvHc;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b3508961d43so3779986a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751996550; x=1752601350; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F/7G8UJPlv1mRZo0H7fcjOOXr37xe0afbYen+XEEe3M=;
        b=Z7KLpvHcabtYkP4r92X1CMMXdSvmVZiYzlQsYU2Q/y7v/c+VRs7lJU04oXnmFYoJGa
         C9aeeey4YII9RhMSDLtDB/AA0OzCCpUJetkdoUdWu1cIsl4VZ6rAxPdl9NCFN73+RWUf
         6Y1p+8XsSbtvQCnOl5d46X1c79aIfLty8jIbQWgE5gv5X2TpGbv4cperVDj7D7gABC6+
         +n2+huwUymktpbyXp4WP8JtdZVuygHf7KhZprwkwSHFKUsTYrLl1Mj3CuUuPMLl8Kc9a
         CVB/+MB++FXMVB9XvRuibftFK/LnwDCZkKZGsUCIH8bFnLP2rWZ80JNmPmn5+CGcOsPc
         xSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751996550; x=1752601350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/7G8UJPlv1mRZo0H7fcjOOXr37xe0afbYen+XEEe3M=;
        b=GYF9f8uC6QjcVDBm9iAm3n7lhIEYoB3BR7akiEJOxTS3hHMeUTQhEmdOa8IjayC0gx
         PfYUnJ/RYiyHYL5RLYyCK50Oo9BhfTorVFnt0yg8xfS1hc9xoVr8itba70urO1Ftavja
         hW0EL6ydDSOa3pLKXgTJRi13VS8PXMk3j8BTryElfQEuYIw/UPTCUZvf2UCUlX1Tbzuq
         61VIT2wGTzc8ut98gCqiTjmWhXS3DMZYQTergcHxXdfNgp6HdJ99uke9FlQMUAtCqOSP
         ukNoTFZwTrwycPw6VbbV6GzLy7y0G7nyxS7BP9k2wZtAqSqKWo4qhplEr0Ml1PQslax4
         NeEg==
X-Gm-Message-State: AOJu0YwCgy4/4h/qp13TXWQbU/B3jUpWGN/h9AFqqht9kc191QwPIpZD
	aMgKOovVWOqvhvGXm+Q4O/YB3MqOlBH8cyMYTkUZsvh2spL/ON2qIlD9AeWIViIAn6mMjYqQJhX
	zp0VHlP76GHYvE6nauWYKFzrF7IsjLFI=
X-Gm-Gg: ASbGncs4UzZ/tPV4FY0bFZz7HmIqBzoC4iuoDQopYGyn1KUmjW8dtU1EJ9+ZmOt/T3v
	iEBVNV3i1Qpz4VSmAKt5GMNr6Cj8oFqhWY2HjV/X+2/aWWbaA4IcgYJfcYh8Fw4Hyq+hPRQ7yXC
	gzmwrIdeLifrwREmvfj2byC/Y/f5gmqpYudblPXmYZ8V96
X-Google-Smtp-Source: AGHT+IHVmm4DbuXoGaUq+zy0o3+oICbjpK1TwyCRIVw0dvO1xlaH7pC7qfI1frNJc6miolBePgb1tQdGAI0rdB8frxA=
X-Received: by 2002:a05:6a00:2ea8:b0:748:f80c:b398 with SMTP id
 d2e1a72fcca58-74d243ed594mr5297076b3a.15.1751996549533; Tue, 08 Jul 2025
 10:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250708131302.3871609-1-martin.jansa@gmail.com>
 <CADkTA4MLSZNpyGE0-_U09DPMZUVb=rxxGT6Zdc9mwUmRJPZ6fA@mail.gmail.com> <CA+chaQcmFaisAcy=WrsuWcey2LtxjAGx=oa2ZXUVZx+9-1P9Ng@mail.gmail.com>
In-Reply-To: <CA+chaQcmFaisAcy=WrsuWcey2LtxjAGx=oa2ZXUVZx+9-1P9Ng@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Jul 2025 13:42:17 -0400
X-Gm-Features: Ac12FXwgv1B33XUu1MO_CBY9_xK3vj6kZApWlNathcSDm2iVTDqtkckdCTyZFK0
Message-ID: <CADkTA4NY_Vzf7X+UT7jiuX30dOQY05qohD9CTEBcseqT862G_w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xvisor: upgrade to 3.0.2
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fb952c06396e7b68"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 17:42:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9304

--000000000000fb952c06396e7b68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:30=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> On Tue, Jul 8, 2025 at 3:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com>
> wrote:
> >
> >
> >
> > On Tue, Jul 8, 2025 at 9:13=E2=80=AFAM Martin Jansa via lists.yoctoproj=
ect.org
> <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >> From: Martin Jansa <martin.jansa@gmail.com>
> >>
> >> * the old SRCREV 6b23764a1439f9d08b2ed2f363da522460d8a22b doesn't exis=
t
> in any branch
> >>   upgrade to latest 3.0.2 release from Jan 1st 2023
> >
> >
> > I was looking at a similar upgrade just a day or so ago.
> >
> > I can take this patch, but I'll re-work it a bit, as unlike some others=
,
> I really don't
> > like bouncing recipe names to chase versions.
> >
> > So I'd keep this with PV in the recipe and _git as the recipe name.
> >
> > Actually, I'll just fire off my script and do it, and add your name to
> the commit log
> > as prompting me to finish the job.
>
> Fine with me, thanks.
>
> I've realized that I could have added the tag in SRC_URI as well as it
> now matches the tag.
>

Now I remember why I had previously skipped the update. There's a C99 build
error and some new QA errors. I fixed the build issue, and inhibited the QA
check.

It's on master-next while I continue debugging some runtime errors after th=
e
sources changes.

Bruce


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000fb952c06396e7b68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 8, 2025 at 9:30=
=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, Jul 8, 2025 at 3:22=E2=80=AFPM Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfie=
ld@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jul 8, 2025 at 9:13=E2=80=AFAM Martin Jansa via <a href=3D"htt=
p://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoct=
oproject.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.yocto=
project.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; * the old SRCREV 6b23764a1439f9d08b2ed2f363da522460d8a22b doesn&#3=
9;t exist in any branch<br>
&gt;&gt;=C2=A0 =C2=A0upgrade to latest 3.0.2 release from Jan 1st 2023<br>
&gt;<br>
&gt;<br>
&gt; I was looking at a similar upgrade just a day or so ago.<br>
&gt;<br>
&gt; I can take this patch, but I&#39;ll re-work it a bit, as unlike some o=
thers, I really don&#39;t<br>
&gt; like bouncing recipe names to chase versions.<br>
&gt;<br>
&gt; So I&#39;d keep this with PV in the recipe and _git as the recipe name=
.<br>
&gt;<br>
&gt; Actually, I&#39;ll just fire off my script and do it, and add your nam=
e to the commit log<br>
&gt; as prompting me to finish the job.<br>
<br>
Fine with me, thanks.<br>
<br>
I&#39;ve realized that I could have added the tag in SRC_URI as well as it<=
br>
now matches the tag.<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">Now I remember why I had previously sk=
ipped the update. There&#39;s a C99 build</div><div class=3D"gmail_default"=
 style=3D"font-size:small">error and some new QA errors. I fixed the build =
issue, and inhibited the QA check.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">It&#39;s on master-next while I continue debugging some runtime =
errors after the</div><div class=3D"gmail_default" style=3D"font-size:small=
">sources changes.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div></div></div><div><br clear=3D"all"></div><div><br></div><span class=3D=
"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_sign=
ature">- Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek=
 II<br><br></div></div>

--000000000000fb952c06396e7b68--

