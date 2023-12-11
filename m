Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29602C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:40:54 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.9941.1702305644999558652
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 06:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTKFgZ8Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: liu.ming50@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ceb27ec331so2799677b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 06:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305644; x=1702910444; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=86AVpO3yCjpVReoxfwk0YJQhUaPszNTDb7RoAfXST+M=;
        b=LTKFgZ8YSrvYK4VRTdVNN4jDAco+vTC5Zbvr3YiIAYI2/X4aKUhsCBYLAUmDLAX+OM
         FVIFtPsiS1j/LBvVCaQ0hRXdT8c/bBNgmz5jIdMWMLqTIFVSo98OspHIT5ihcNMk7Th4
         BWtNJIdqQK8XKQL0yv1U2HpHKH3ffLh1wA+JxuLTOnJYqBYi+tCwT800EYzmWgisgAxj
         JSirhfxwquzjfj3K2qhBN9/t1LVgx1fSSBFMcbjVgFTXry0e9/0Sa2O/dNRGMveJURgk
         Gp1Hum3H8K0Yqwd9HTD5o1NyFWYZfolWyhp1L322biZzANDF/A0Lgtr8se3szH8D3VFD
         +u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305644; x=1702910444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86AVpO3yCjpVReoxfwk0YJQhUaPszNTDb7RoAfXST+M=;
        b=VsYSMXA+TGRwyUcn32kzAP6/9haC7CK3nMEwcUz5xqDSxoqR1L1IfV/K588+5bA6n/
         cJYez63Awx+OOLQZUMgxGZsrkf4LMmeDx8+AmGl8efqQS3I01bhdHbUQ0HXCkXOqjUIF
         Nqo1MIIS+pbH4UOU8B5iaQMzzYbKWGFu4QIouuZoPV5nMLf3u0pCa4MY3SDVB/IdLMXa
         dqc3woXR+yD7nkZFZBeYDiI/yOJGPIKN+NYQDIVTCsSLxlwh9k2Vr/Z0Vmj/iY6Kn/jI
         ZwXMQ1yhpcRS5gb7dj2Y1riWirFvHSYCjqgoFann6EU4t0aADOkMOVY2RqQ/HPO3pab8
         LN/Q==
X-Gm-Message-State: AOJu0Yz7Jyi3I9Anhod55HEf5Rv7BgoRKMuLimK2zV1Sz6YHLjk4JiW4
	8/DiT488ZyyUNeFDVga4lL677N11EL6f28HOXPo=
X-Google-Smtp-Source: AGHT+IGlIQ99hU7bv5CuMqNR8sLuYlnUWF9+gUFASmUdCgofFTiDclo/2MOleAfv3MvZDYGua4UFrGWKYK+o5bMMCXE=
X-Received: by 2002:aa7:8557:0:b0:6ce:2732:1e01 with SMTP id
 y23-20020aa78557000000b006ce27321e01mr2037539pfn.59.1702305644422; Mon, 11
 Dec 2023 06:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20231211120914.1631095-1-liu.ming50@gmail.com>
 <20231211120914.1631095-3-liu.ming50@gmail.com> <CADkTA4N3qHZAULhP_=C7LhBnnYpTBCF7PctQdDRq4SKqxVR_MQ@mail.gmail.com>
 <CALatG=6B+J9KehOEH9CJWSxRdkbEO1tbUJUU_xp4f5uebZ+akg@mail.gmail.com> <CADkTA4Mr8Y=h+vT2849n9d+RWGjCscDh4EL62gk53FgqCYzG=A@mail.gmail.com>
In-Reply-To: <CADkTA4Mr8Y=h+vT2849n9d+RWGjCscDh4EL62gk53FgqCYzG=A@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 11 Dec 2023 15:40:32 +0100
Message-ID: <CALatG=5N+_2JoG_RWtx=TGCf8ym37iVbZiLjGbAv7V6Vk5DM5A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] podman: add alternative link
 for docker
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003c32b9060c3ceb92"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 14:40:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8505

--0000000000003c32b9060c3ceb92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, understood, thanks for the explanation.

the best,
thank you


On Mon, Dec 11, 2023 at 9:20=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wro=
te:
> >
> > Hi, Bruce:
> >
> > They are both being added in packagegroup-container? If I install that
> packagegroup from the current code base, I will get a conflict error?
>
> That packagegroup is used as a build test, versus something that is
> installed (and that distinction isn't clear, I've been meaning to
> improve it for quite some time).
>
> We can split the packagegroup to make it more useful, that's
> definitely a patch that I would accept.
>
> Bruce
>
> >
> > the best,
> > thank you
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000003c32b9060c3ceb92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">OK, understood, thanks for the explanation.=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">the best,</div><div dir=3D"auto=
">thank you</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">On Mon, Dec 11, 2023 at 9:20=E2=
=80=AFAM Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_bl=
ank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi, Bruce:<br>
&gt;<br>
&gt; They are both being added in packagegroup-container? If I install that=
 packagegroup from the current code base, I will get a conflict error?<br>
<br>
That packagegroup is used as a build test, versus something that is<br>
installed (and that distinction isn&#39;t clear, I&#39;ve been meaning to<b=
r>
improve it for quite some time).<br>
<br>
We can split the packagegroup to make it more useful, that&#39;s<br>
definitely a patch that I would accept.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; the best,<br>
&gt; thank you<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--0000000000003c32b9060c3ceb92--

