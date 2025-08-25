Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7E4CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 10:59:28 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.36481.1756119562020873448
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Aug 2025 03:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdbDcJ0w;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3256986ca60so1734735a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Aug 2025 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756119561; x=1756724361; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obLDxZULwZZY++ffYG2Udeh0kWrkDOOT7TbTdEIQSG0=;
        b=bdbDcJ0wLDhtCCUL9H5Tuj+85/ewyKsLVnLqC08BoiG59yq+RUXB5CZsKi/T9Fuhrf
         Gx8qy6AqSSqXEg8mTbIwoLjjmVQ4mOvyQzAugjwg3NKJLWboaRGQPNDOQEou7ELsB4dL
         9yqLON70Ghc7GNQuUe/RJytFxdLt56DOq6vvt9aE5dB0yupGSF8AH0l2sapMNmGiaYUY
         rAAlZoZPmaLD5c6CIuYPSGpZt1wetbK1HuOxYXRAlnsHp+5dui3clwUBibhuHcPHE/kO
         GUQMBVrlo2U26EX8k4Q1NLgf0yAyHr5zHFwrWGV4z4+u6ia8H5M4RDK95muvsorbRz+N
         2W/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756119561; x=1756724361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obLDxZULwZZY++ffYG2Udeh0kWrkDOOT7TbTdEIQSG0=;
        b=Qe/GJBNcmMXXdnXzJWwXDSz78Apt8GPkTT2G+idJK60PWjo6mjv3ZzlebXlrgszBM6
         kJ7048fvhF+ls7ERXqfDKmzA50xXN0q2kbxmSSEj3o2YyC5JIcW/Hj2KuzrSQ4KkxU/5
         m7mnAJ8iVJLzNbaBFxgRh5ABs8m028yWmZodL9VASUXN1JsVluOaMUVrvJXbWHv3trOm
         h7lbuf9ayS9T9LD23eiBgHkHnW+3lPT9h2LnmirDCcnaa4gDNLaMhStsXMG1O33odwp7
         PFRcJlHRt8ZDwxkXPzkIjjaAold4JZHmDQkKqFLYMTD98uJaKtmX2UiXODOPvwxlLUb2
         HoNw==
X-Gm-Message-State: AOJu0YwKYabVSTysILwpvqVOqqHHshUNlgo1NfMBZyDQrVp3cn3PxxKo
	MABlL9dYovYmUQat1KbJ7IluwKPy1POjKMWJU+olgajfXcGl0oZMy9UuBrVxE+OnyDh9416LlXp
	KdInJ6Ot9ysrGOwt+Tn7BVaqIZw87jIc=
X-Gm-Gg: ASbGncvG1lUKpNNyg2poskBTscKT8xcOgzpu7K2wRuS650arvwNWYb/6We87O8MnUna
	ViIbrMS/FcHN3O/tnNUu5NNN6csTYZ0muOu20JcrrU27Yfuqnt6v7HxeZANG5StEzJDXsO/AZ4F
	WG87bhZ0VQzKKYwb+I7N6tSAxALmk+zYM5f8UFIdJZawKnQd5lhkcsFVv3KL760wK1fiBvs2DAa
	1oLKu9aaILo9vwqQD45jTC9Hota3jNsqk8Vq7crWQ==
X-Google-Smtp-Source: AGHT+IEYbqBNt1Q+2Kv5Oa94wpXVQk2rnNbqdDJrTfPvMV3Gpntf076WMCKXG4veoXVbE+izeBXID/RweGpD7vXFNGA=
X-Received: by 2002:a17:90b:3c47:b0:31f:3c3:947c with SMTP id
 98e67ed59e1d1-32515e412bdmr15481997a91.10.1756119561230; Mon, 25 Aug 2025
 03:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250804130449.324152-1-sudumbha@cisco.com> <20250825105720.228263-1-sudumbha@cisco.com>
In-Reply-To: <20250825105720.228263-1-sudumbha@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Aug 2025 07:59:11 -0300
X-Gm-Features: Ac12FXxFmLDjgI4x6utgR5tcPo0MwU_to3Fvj5zM8BgO5oUKWLGrA1_mx1Q0pqI
Message-ID: <CADkTA4P0tazAxhxkWU-yQjb5PufzgwC32MwN7+meSFOZSvqMoQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
To: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>, 
	"Viral Chavda (vchavda)" <vchavda@cisco.com>, deeratho@cisco.com
Content-Type: multipart/alternative; boundary="000000000000a15dc6063d2e72e9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Aug 2025 10:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9359

--000000000000a15dc6063d2e72e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patches are still mangled by the list.

I'm on holidays this week, but will see if I can make better suggestions to
fix it when I get back.

Bruce

- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II


On Mon, Aug 25, 2025, 7:57=E2=80=AFAM Sudhir Dumbhare -X (sudumbha - E INFO=
CHIPS
PRIVATE LIMITED at Cisco) via lists.yoctoproject.org <sudumbha=3D
cisco.com@lists.yoctoproject.org> wrote:

> ping
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9358):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9358
> Mute This Topic: https://lists.yoctoproject.org/mt/114208293/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a15dc6063d2e72e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>The patches are still mangled by the list.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m on holidays this week, bu=
t will see if I can make better suggestions to fix it when=C2=A0I get back.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Bruce=C2=A0</div><div><=
br></div><div data-smartmail=3D"gmail_signature">- Thou shalt not follow th=
e NULL pointer, for chaos and madness await thee at its end<br>- &quot;Use =
the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Aug 25, 2025, 7:57=E2=80=AFAM Sudhir Dumbhare -X (sudumbha - =
E INFOCHIPS PRIVATE LIMITED at Cisco) via <a href=3D"http://lists.yoctoproj=
ect.org">lists.yoctoproject.org</a> &lt;sudumbha=3D<a href=3D"mailto:cisco.=
com@lists.yoctoproject.org">cisco.com@lists.yoctoproject.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">ping<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9358): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9358" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/message/9358</a><br=
>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114208293/105=
0810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/114208293/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner@list=
s.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a15dc6063d2e72e9--

