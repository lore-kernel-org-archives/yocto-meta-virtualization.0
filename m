Return-Path: <anthony.t.davies@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474EAC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 03:56:10 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.2474.1669780567900328903
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 19:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bQmlL9ge;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: anthony.t.davies@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id q186so17510034oia.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 19:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJAqCS3jqmvnjX/ela36orLLGqV7SnyxuOcOEhzO9pQ=;
        b=bQmlL9geTExMNoi7RiljnHfmWd9mSW9Q4jEZQ9k+EaRWGzX1S2Z6UWQCmBX2aBR3U6
         9xP/miebhQhFx/s7b+op0Z2wD+q/Jt2cY1nYkruab01GJVMgkwPdD2trAFtCJOnNgm/T
         aBKOOzYh/M+HsA5F8hDhQ/8g8gqAdjTieiQoRNXFaMXv7k/67mQ14BZgnjjYtZKuFl6X
         u76zYpjl//WZG7fNTI0n6XWNpVTuK5qx3m+TvOLXiwoh+rBXYGSuDuIHTai39VfJOajJ
         8Hu6Q1duPcaPSQ6p6+CES6s3fS1RnAQCvYBCfPQnq1Kyn1naQBNH+IPUnc4YyHEh8hrn
         eaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJAqCS3jqmvnjX/ela36orLLGqV7SnyxuOcOEhzO9pQ=;
        b=HhgUp+y2P+O6/f8RtkiRFKzOd1bs5INI/Y6zp4ibiaPUZsPENSO76IlCTW+gmlqMXh
         1uKP+WzyRwU1OsUb/dQkJ84DMZ2FK/sifWxYnJPqknqRnzByqT131HUEos3c6AR4NpTq
         v4GIDz8l+pvI2jg5CNzMDE4HL7dYd3YQKZIkBZ6xKOAkALy3b5QA5pPeKTYEqT1e9mJm
         PmOM0IsNY23YF6ROiw5NTmIzqRnGGr4udDycFiZkiAvQBgwTzktL1EcmaNT+TKKijFs+
         HdbFfnlkaBgOy2JvAKrjImc1rxhhVuU0AKUvy96Neko0VSyhUS/jUJg/7/Ij41vWETst
         /4pg==
X-Gm-Message-State: ANoB5pnOm7OwalBtL5dAa1/F8nZT/+7h3hrMSvNBq8+mwLq4MNaFR4qG
	DmseLk47zW0uABZnaPYU5zNnTrTM9s5uQXywZtQ=
X-Google-Smtp-Source: AA0mqf5h6Ehaz+jzlsz3rnDZTVux0QLmUCtXJ11YZZLD4lx7W0lqq1HRUYyfuFKGaogCSp3EME6eAFpkL8josOK/P8U=
X-Received: by 2002:a05:6808:164a:b0:35a:c270:6df9 with SMTP id
 az10-20020a056808164a00b0035ac2706df9mr32895943oib.276.1669780567111; Tue, 29
 Nov 2022 19:56:07 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+o+wXUrREoX2N10ks3YDMmACex+xYi3d9XewTns==BntSw@mail.gmail.com>
 <CADkTA4MoryRn=OOOQL7j0BHkjrB5Tyd35T+=f9=AA7YOqfd32A@mail.gmail.com>
In-Reply-To: <CADkTA4MoryRn=OOOQL7j0BHkjrB5Tyd35T+=f9=AA7YOqfd32A@mail.gmail.com>
From: Anthony Davies <anthony.t.davies@gmail.com>
Date: Wed, 30 Nov 2022 14:55:55 +1100
Message-ID: <CAL5F+o+VmqasZyrpBpaP2xjdfF+Z8SWGebrJzLLKDNvzo88_Xw@mail.gmail.com>
Subject: Re: [meta-virtualization] Backport Repo branch changes (master=>main)
 to Kirkstone branch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008e3de305eea815ae"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 03:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7710

--0000000000008e3de305eea815ae
Content-Type: text/plain; charset="UTF-8"

Yq is the one I had issues with

On Wed, 30 Nov 2022, 14:21 Bruce Ashfield, <bruce.ashfield@gmail.com> wrote:

> Which recipes ?
>
> I normally port all branch changes as far back as possible, but I may
> have missed some.
>
> Bruce
>
> On Tue, Nov 29, 2022 at 7:19 PM Anthony Davies
> <anthony.t.davies@gmail.com> wrote:
> >
> > Hi,
> >
> > Is it possible to backport these patches from master to kirkstone?
> >
> > I could do it but I am not confident about submitting patches via email.
> >
> > Regards,
> >
> > Tony Davies
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7705):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7705
> > Mute This Topic: https://lists.yoctoproject.org/mt/95348458/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000008e3de305eea815ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yq is the one I had issues with</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Nov 2022, 14:21=
 Bruce Ashfield, &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashf=
ield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Which=
 recipes ?<br>
<br>
I normally port all branch changes as far back as possible, but I may<br>
have missed some.<br>
<br>
Bruce<br>
<br>
On Tue, Nov 29, 2022 at 7:19 PM Anthony Davies<br>
&lt;<a href=3D"mailto:anthony.t.davies@gmail.com" target=3D"_blank" rel=3D"=
noreferrer">anthony.t.davies@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Is it possible to backport these patches from master to kirkstone?<br>
&gt;<br>
&gt; I could do it but I am not confident about submitting patches via emai=
l.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Tony Davies<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7705): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7705" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/message/7705</=
a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95348458=
/1050810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoc=
toproject.org/mt/95348458/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner=
@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gma=
il.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000008e3de305eea815ae--

