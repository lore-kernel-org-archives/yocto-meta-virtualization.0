Return-Path: <anthony.t.davies@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030C8C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 03:23:29 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.1900.1669778605420777988
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 19:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SSuQB2t5;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: anthony.t.davies@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-14286d5ebc3so19568568fac.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 19:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yJUOnBkjYnINyMChFE2KMpMhBVUrSMtPpPlKm0JANbU=;
        b=SSuQB2t5kW+X7hiQn/yQWE2Yr9w3Icr4x0QONkxW37ln1ActNpHFepRTAszb2gquGG
         SOIAqss0roap0Mn0xFnttlLYPAmdmrpUyApY1eLMwO2kf+hzJ8QCXWJUINt//qg1vrOh
         MrAxjHXUnhgZFushhhzdNGykjrtOFCDKdmIAvk7apgOOacJqsU4RFQQqu9WRi3HRKZ2J
         qI2wd5GC5seyiPMsRzWA6LAf4qTy7BnIxBDMD63uFwoHb8PxenxEpn78Y21WKHMdRJVr
         aVi6q2g15e9piRhPRQe6SeR//G5DeNwFdtMw6xsgiab0OBzINNftdQKCczPk/SxfWl0M
         ZO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJUOnBkjYnINyMChFE2KMpMhBVUrSMtPpPlKm0JANbU=;
        b=co5TYhbHzEZs6uwDFyveOsfoK0blygw028VoGQXwII0RwEsz6RHAQInR0HWm5As3L5
         62AzPhZH2p8LGIT+bCu2BwLa1JqnMSNBo/q+gE8STT3OXqOxJaGuK/F6xeYU89eKfhgA
         MgFa9NE+c1UYKmTzcLwpfi5WX3AN1zoKDS34bDL1xBm7VHrNdW6lIRqz8XEaf2KzKKtJ
         IKhKWoQmrJYyZTU/BXt8lOmeoVTS2kG5DhjtSL4oLGsQnY7aN3L1G5EfybCScSSbW7jW
         gxPH4cTpwHr+PeuUeizsxwM99+/3srq9X44KECcQD6M0TTC676Jk19bo2A+XrGsQIErT
         CmKg==
X-Gm-Message-State: ANoB5plAEDlFt0DHKvsnqZONS3S7vlKq6Ptws4fkKe2NARalvhxk6SUO
	v9Tp4Lzrp7fM+vwSrzD0LvOeSzn+PSL/OcI8Xgc=
X-Google-Smtp-Source: AA0mqf4bilmqB5U5ikspXPJGWeHgvZlranpW4A19Xgo+bqCUXIgStPyXYmdY92bNxyL+9UKtFLFzllGjDo/Sl91gLJY=
X-Received: by 2002:a05:6870:bac9:b0:143:2f33:9c25 with SMTP id
 js9-20020a056870bac900b001432f339c25mr18301758oab.278.1669778604694; Tue, 29
 Nov 2022 19:23:24 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+oJ78-LCD44FjQrJzrjrVcN2m1bCqUv746HFVdMFuUvPgw@mail.gmail.com>
 <CADkTA4OBu7UNq_mHWf8WCzW0Sev8Y2b6yGag5maCJfqzy3b_iQ@mail.gmail.com>
In-Reply-To: <CADkTA4OBu7UNq_mHWf8WCzW0Sev8Y2b6yGag5maCJfqzy3b_iQ@mail.gmail.com>
From: Anthony Davies <anthony.t.davies@gmail.com>
Date: Wed, 30 Nov 2022 14:23:12 +1100
Message-ID: <CAL5F+oJtEOEDVSnnXD+r9GjRZy=c0ig1U_190sw-TcsY2NRKZA@mail.gmail.com>
Subject: Re: [meta-virtualization] k3s (kirkstone) segfaults when run on hardware
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000096226e05eea7a002"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 03:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7709

--00000000000096226e05eea7a002
Content-Type: text/plain; charset="UTF-8"

Hi Bruce,

The board that is having problems is a Radxa Rock 3A
https://wiki.radxa.com/Rock3/3a

Regards,

Tony

On Wed, 30 Nov 2022, 14:21 Bruce Ashfield, <bruce.ashfield@gmail.com> wrote:

> On Tue, Nov 29, 2022 at 7:28 PM Anthony Davies
> <anthony.t.davies@gmail.com> wrote:
> >
> > Hi,
> >
> > I have created an image that includes k3s. When my hardware boots and I
> attempt to execute k3s straight out segfaults, output from "k3s --debug"
> and no logs are created.
> >
>
> What are the details of your hardware ? k3s is running fine for me on
> everything that I have available. So we'll need to try and figure out
> some differences.
>
> Bruce
>
> > On #meta-virt it was suggested to try another go program on my image, I
> installed "go-helloworld" which runs successfully.
> >
> > Regards,
> >
> > Tony Davies
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7706):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7706
> > Mute This Topic: https://lists.yoctoproject.org/mt/95348603/1050810
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

--00000000000096226e05eea7a002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Bruce,<div dir=3D"auto"><br></div><div dir=3D"auto">Th=
e board that is having problems is a Radxa Rock 3A <a href=3D"https://wiki.=
radxa.com/Rock3/3a">https://wiki.radxa.com/Rock3/3a</a></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Tony=C2=A0</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Nov 2022, 14:21 Bruce Ashfield,=
 &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Nov 29, 2022 =
at 7:28 PM Anthony Davies<br>
&lt;<a href=3D"mailto:anthony.t.davies@gmail.com" target=3D"_blank" rel=3D"=
noreferrer">anthony.t.davies@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have created an image that includes k3s. When my hardware boots and =
I attempt to execute k3s straight out segfaults, output from &quot;k3s --de=
bug&quot; and no logs are created.<br>
&gt;<br>
<br>
What are the details of your hardware ? k3s is running fine for me on<br>
everything that I have available. So we&#39;ll need to try and figure out<b=
r>
some differences.<br>
<br>
Bruce<br>
<br>
&gt; On #meta-virt it was suggested to try another go program on my image, =
I installed &quot;go-helloworld&quot; which runs successfully.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Tony Davies<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7706): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7706" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/message/7706</=
a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95348603=
/1050810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoc=
toproject.org/mt/95348603/1050810</a><br>
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

--00000000000096226e05eea7a002--

