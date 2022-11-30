Return-Path: <anthony.t.davies@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5971CC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:24:30 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.2925.1669782263902316182
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 20:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NNhvsM50;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: anthony.t.davies@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-142faa7a207so19610405fac.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 20:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r0gryJg2GyEdaCCyKN9K/SV+VRNue0OzmpLeSR/t+0Y=;
        b=NNhvsM50XZiQRGg5HNM4PcrvQ5nB2t062DDUHEXlNBuGq6wOcK3uOcmrpfFLBRxfvf
         YOhcGbVunwpRBt9wtKTqovw5KuZfBQ6dUUOYE2mnUK/1nxs5Qm3I3Y1j6/WmvFT71syS
         RPpvSEnodrmyNLuN5O7WGu94JOCr50tspgzjSPcKV9Y2frSt6qylzx6UyrZGn2P/jXYE
         Hzk/fvxCUz3NSbr7SZlpM/DdU1bhKCTJLVMPnRtGTdagje48UTR5eiSvoyTzpJJLmsWS
         NxLT+iqwFTNs2feVzbMvspPLmigqtf8/+/c08F0tN1yBUq0O/nqZI7GOhDMgn/MUN7Lq
         F5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0gryJg2GyEdaCCyKN9K/SV+VRNue0OzmpLeSR/t+0Y=;
        b=sdGftNjpYWTgiFOeCga7LAD/yeIDuYdNQ5HyWUPj/qT95FnnlgP00Mr7HkXRK6XIfK
         JugABWiT2+hbttaXqvAPf7nOOmiFIMFdOXdtnSFFR+CN5Zu/4wC8kQ2e3n0KaLPNizvt
         PaL2x1n1UKZesoDhQmXagZZU+r7P9VWzfawsILdQAK9rDE8mgc6IuYsKtANyzf5e4zz3
         6r/Gk0+VVnR2ZKJBxrPJ3PSX28pQ9c5zrtPGiV1t0NCf7b7ASFXIIvVOyJUIM1dRVKlu
         9q4RqRY6besaF4jWDElTp/t2pCHD6x6oejjyJkhyb66aPRhUSYq/lx/BsH598XEvs+rT
         NrJg==
X-Gm-Message-State: ANoB5pm6xcy5BNk9mrKtyAF1X5n2O84KPIANcOj5qsb4TLjBnz7Hi6Kk
	PJF5r8fhkSDczNcCSauyO5WnJikcsXqFSvjenYw=
X-Google-Smtp-Source: AA0mqf4wG8Ajsb+cnGuGnLwPLaZYn77hoZlylEF3VfzspJmQnClGnHEc7KNwsx6NQrnlJFHqCPRq8ZyJDOdXJBzskpQ=
X-Received: by 2002:a05:6870:bac9:b0:143:2f33:9c25 with SMTP id
 js9-20020a056870bac900b001432f339c25mr18370946oab.278.1669782263136; Tue, 29
 Nov 2022 20:24:23 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+o+wXUrREoX2N10ks3YDMmACex+xYi3d9XewTns==BntSw@mail.gmail.com>
 <CADkTA4MoryRn=OOOQL7j0BHkjrB5Tyd35T+=f9=AA7YOqfd32A@mail.gmail.com>
 <CAL5F+o+VmqasZyrpBpaP2xjdfF+Z8SWGebrJzLLKDNvzo88_Xw@mail.gmail.com> <CADkTA4OV3Gi28DKamNKHaK3veUEM-bvzQH1HSV533XvvkRJtZA@mail.gmail.com>
In-Reply-To: <CADkTA4OV3Gi28DKamNKHaK3veUEM-bvzQH1HSV533XvvkRJtZA@mail.gmail.com>
From: Anthony Davies <anthony.t.davies@gmail.com>
Date: Wed, 30 Nov 2022 15:24:11 +1100
Message-ID: <CAL5F+oKukrU3W-u7+c3pRQu10=4_EYOAL8BCQzkQJSQ0HvzfdQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Backport Repo branch changes (master=>main)
 to Kirkstone branch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a5884905eea87a97"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 04:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7712

--000000000000a5884905eea87a97
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce.

On Wed, 30 Nov 2022, 15:08 Bruce Ashfield, <bruce.ashfield@gmail.com> wrote:

> Cherry-picked.
>
> Hopefully it works now!
>
> Bruce
>
> On Tue, Nov 29, 2022 at 10:56 PM Anthony Davies
> <anthony.t.davies@gmail.com> wrote:
> >
> > Yq is the one I had issues with
> >
> > On Wed, 30 Nov 2022, 14:21 Bruce Ashfield, <bruce.ashfield@gmail.com>
> wrote:
> >>
> >> Which recipes ?
> >>
> >> I normally port all branch changes as far back as possible, but I may
> >> have missed some.
> >>
> >> Bruce
> >>
> >> On Tue, Nov 29, 2022 at 7:19 PM Anthony Davies
> >> <anthony.t.davies@gmail.com> wrote:
> >> >
> >> > Hi,
> >> >
> >> > Is it possible to backport these patches from master to kirkstone?
> >> >
> >> > I could do it but I am not confident about submitting patches via
> email.
> >> >
> >> > Regards,
> >> >
> >> > Tony Davies
> >> >
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#7705):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7705
> >> > Mute This Topic: https://lists.yoctoproject.org/mt/95348458/1050810
> >> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000a5884905eea87a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Bruce.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 30 Nov 2022, 15:08 Bruce Ashfield, &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Cherry-picked.<br>
<br>
Hopefully it works now!<br>
<br>
Bruce<br>
<br>
On Tue, Nov 29, 2022 at 10:56 PM Anthony Davies<br>
&lt;<a href=3D"mailto:anthony.t.davies@gmail.com" target=3D"_blank" rel=3D"=
noreferrer">anthony.t.davies@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Yq is the one I had issues with<br>
&gt;<br>
&gt; On Wed, 30 Nov 2022, 14:21 Bruce Ashfield, &lt;<a href=3D"mailto:bruce=
.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Which recipes ?<br>
&gt;&gt;<br>
&gt;&gt; I normally port all branch changes as far back as possible, but I =
may<br>
&gt;&gt; have missed some.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Nov 29, 2022 at 7:19 PM Anthony Davies<br>
&gt;&gt; &lt;<a href=3D"mailto:anthony.t.davies@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">anthony.t.davies@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is it possible to backport these patches from master to kirks=
tone?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I could do it but I am not confident about submitting patches=
 via email.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Tony Davies<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#7705): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/7705" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualization/messa=
ge/7705</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt=
/95348458/1050810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/mt/95348458/1050810</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualizat=
ion+owner@lists.yoctoproject.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ash=
field@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000a5884905eea87a97--

