Return-Path: <kev.ferber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DD5CF11F9
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 14:43:30 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.45220.1728571408793240523
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 07:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BjKSvRdH;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: kev.ferber@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cbe700dcc3so6535656d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 07:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728571408; x=1729176208; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e2EGZNX902StzA+gheZ0xAJDR1GW3rtaon92bSlMFgg=;
        b=BjKSvRdH5/r7xx7SM4AerqV18xmjtMNYLGIO2ftyKCdlpVALE799DRpU1rb2e+O5gt
         76qA3k8QtFKpXAO1c+guCn8KBuyrx0nDh2iQDhYDKjeTuOjms28jDEHwlObzbHKTydm0
         0Dq6jMduC9q2phQ1Skg5Uj59NuppLp10SNjQ/k0hGnGj889764FzCWmycqryyvfdspA4
         YvzitzgedKJaGsaQOGV6/8Q3Lu4hAlBqEf26OH5dDbRgz76tEL1uH5MbEFeXOw9En7ED
         sJN+xqmdqGKrkz3wfiXTMVUdET/LDl62n/TdyRjwOUwzAcM6Q8uv9/ryVaNdLdImHmUm
         pumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571408; x=1729176208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2EGZNX902StzA+gheZ0xAJDR1GW3rtaon92bSlMFgg=;
        b=vcdu4nfCIKKRyYI+AjtGcyHRQmSCkhtj875Z2yXNDklGionfrb5lSO3C0lZu2OodRx
         z67Tnxl0/aEvPpuHnCOISNH/ZocCdu29uaH5z9463aoH8TPgoA6octdna6SSapUVsVYq
         97K6+8+tChewmwAyLQ4krlBL83AypA/TA/dlFXOsW7aFr0sk7GjsvyMrfN1XUsnwGzTz
         aus2Z2C57AHVJqnRVv6S1fm42tPBbEEHEhNlnUaXRWOqbCYQSdD6+GxMZvBd4FoOVISN
         zts549uiPNPnMPUwdMXZKQjbUThyBIGLxgvXVHRiLVZDFK0N0id2/6X7YJnghDJroBvF
         eBjA==
X-Gm-Message-State: AOJu0YzU3TjxRk3scg7Fkbmm9WXBqij6jPiLhbWEu3GYRgPi3JDEmXgj
	DxDg785mp8qnFfvC+B/r2WUzv7jpFkt1wVbgQ2zTMctn1GpVvNDSoI/jEMGyQfuPhWptDF9s+Dx
	Pv8iZzEY9glIFfJdq3lfqj8rm57k=
X-Google-Smtp-Source: AGHT+IFebf3qlaPGCF5tf9E1wCrH1KwfN5HSs7A2xpTsexQ0iFg2jlFPQmh5gEpZDH+R8z/tbpCyQQX79my6SRe03L0=
X-Received: by 2002:a05:6214:2c01:b0:6cb:2e7c:a10e with SMTP id
 6a1803df08f44-6cbc9581aa5mr89614276d6.48.1728571407626; Thu, 10 Oct 2024
 07:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAERRtEuXxxZcjs0fGovUhF_dufQeco7dNM=zaU5aFJ9baoszog@mail.gmail.com>
 <CADkTA4N5eTYG8aTbjBfRspdR-25+0a3aFSGnjR_y63d8b+mtxA@mail.gmail.com>
In-Reply-To: <CADkTA4N5eTYG8aTbjBfRspdR-25+0a3aFSGnjR_y63d8b+mtxA@mail.gmail.com>
From: Kevin Ferber <kev.ferber@gmail.com>
Date: Thu, 10 Oct 2024 16:43:17 +0200
Message-ID: <CAERRtEukEAPrG87yduFEk=r1TzdakJqitdiR94Wsd+UUWxu5sQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Canonical LXD on Yocto
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b878a906242064cb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 14:43:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8927

--000000000000b878a906242064cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

it would be really great if you could share the recipe with me, even if it
is only partially finished.

I've only just started working with Yocto, so it would be good to have a
starting point.

Kevin

Am Do., 10. Okt. 2024 um 15:03 Uhr schrieb Bruce Ashfield <
bruce.ashfield@gmail.com>:

> I have some partial work on it that I did about a year ago.
>
> I never did finish the recipe, since there were runtime issues and no
> one was asking for it :)
>
> It is something I'd like to have in meta-virt (the fact that someone
> made an entire separate layer for it .. just makes no sense).
>
> If you do work on it, please contribute it to the layer. Or it is
> something I can pick up in a few weeks and perhaps get some assistance
> in validation.
>
> Bruce
>
>
> On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via
> lists.yoctoproject.org <kev.ferber=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> >
> > Hi all,
> >
> > does anyone worked on a recipe for LXD.
> >
> > We are in the process of moving from Ubuntu to Yocto Scarthgap because
> we wanted to use the OTA functionality of RAUC.
> >
> > Now we are faced with the challenge of successfully compiling LXD, I
> have looked at an old unofficial layer (
> https://github.com/fcuringa/meta-lxd) for reference, which of course no
> longer works with more recent LXD builds.
> >
> > Best regards
> >
> > Kevin
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8921):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8921
> > Mute This Topic: https://lists.yoctoproject.org/mt/108927978/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000b878a906242064cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bruce,<div><br></div><div><div>it woul=
d be really great if you could share the recipe with me, even if it is only=
 partially finished.</div><div><br></div><div>I&#39;ve only just started wo=
rking with Yocto, so it would be good to have a starting point.=C2=A0</div>=
</div><div><br></div><div>Kevin</div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 10. Okt. 2024 um 15:03=
=C2=A0Uhr schrieb Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail=
.com">bruce.ashfield@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">I have some partial work on it that I did about a y=
ear ago.<br>
<br>
I never did finish the recipe, since there were runtime issues and no<br>
one was asking for it :)<br>
<br>
It is something I&#39;d like to have in meta-virt (the fact that someone<br=
>
made an entire separate layer for it .. just makes no sense).<br>
<br>
If you do work on it, please contribute it to the layer. Or it is<br>
something I can pick up in a few weeks and perhaps get some assistance<br>
in validation.<br>
<br>
Bruce<br>
<br>
<br>
On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;kev.ferber=3D<a href=3D"mailto:gmail.com=
@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; does anyone worked on a recipe for LXD.<br>
&gt;<br>
&gt; We are in the process of moving from Ubuntu to Yocto Scarthgap because=
 we wanted to use the OTA functionality of RAUC.<br>
&gt;<br>
&gt; Now we are faced with the challenge of successfully compiling LXD, I h=
ave looked at an old unofficial layer (<a href=3D"https://github.com/fcurin=
ga/meta-lxd" rel=3D"noreferrer" target=3D"_blank">https://github.com/fcurin=
ga/meta-lxd</a>) for reference, which of course no longer works with more r=
ecent LXD builds.<br>
&gt;<br>
&gt; Best regards<br>
&gt;<br>
&gt; Kevin<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8921): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8921" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8921</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10892797=
8/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/108927978/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000b878a906242064cb--

