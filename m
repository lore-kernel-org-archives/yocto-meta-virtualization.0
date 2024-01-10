Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4002AC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 08:50:27 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.7834.1704876618309475628
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 00:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XOW79tPX;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: liu.ming50@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bbce1202ebso3702740b6e.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jan 2024 00:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704876617; x=1705481417; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/gE1Hcfen6ot/KFK7Z8XIj5FWBJY+KGzQO4c0hxzLM=;
        b=XOW79tPXiM+dlshCv5LOISw4roPMoprfGq/8qrYI2oMW/V3E7vXAQnjLjtqSkR2KBf
         qKiFgC0oqd3zjDQt+Jqp3Ozti3kIUelSNkE63gLeU6EyIXfngREzWy+zURW+Vv7x+eLy
         0gv0huZg0G/BoS5pTDGQTb6By8KRLWYz/OYsBkhP5TVpm5vO176wCr3BVbEMqGFnAuni
         pyb1vYi33YGHMWoxavgQaMG6VTV8UTx6ynGPZmnIg9JslU5L22q9etoa5QewbPyBVC2H
         t5KtvxfbH1Y5RYr6hfHwyqukZtrmpg6k17beCVPA3CAGoap4JLvuC9A6qvAM/1tnJUhr
         aqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704876617; x=1705481417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/gE1Hcfen6ot/KFK7Z8XIj5FWBJY+KGzQO4c0hxzLM=;
        b=EdB0i5yJUQvYo8nAKVZkny1knFqQGRvvrmdwm82UOChKbC1SVCFZBUBKjN4Y34i9kn
         qdREZAmS7ZWaQG1T4f7NcqjU5h8iSjTeLcit3eo3ayoaw7Nsr/2Gcx0fn+/QVxCiWfN0
         19o9UQNNOcC2H17s6frgUIG5gim+ZGAF27kFf1Tbx1/o/rUWPekZH8enR8hneAuchyg4
         hKFOqXi4V1WaHQWZH/W2ok1vFRW9LHjmwmI/HV/yrT7OmetMGecrrsP3idPV6RnDQ+8f
         +j56dbsvhhlqWSZxTapJauC4EnSCmRZxvb+gdMDF9tekG8Ai8y68jmsmN9jp2rUbJjlH
         7kQA==
X-Gm-Message-State: AOJu0YyreRsWsY4ByE73VLWr7SJ/sx5pvvy56FlJSdcUAwU6lbTMEmpt
	oJN3mhfKztDwUWJjfFseMc6aWligc8WIsFm0I5U=
X-Google-Smtp-Source: AGHT+IGd2PPTb432gP1afLA3eM44TnN9bX/Pbf0tjV6pzbuMCQiFp4ckLd0TkFPX8JeqP60DZdS4aEF6Qw/4AYIll34=
X-Received: by 2002:a05:6808:3007:b0:3bd:26c8:66a5 with SMTP id
 ay7-20020a056808300700b003bd26c866a5mr808507oib.7.1704876617544; Wed, 10 Jan
 2024 00:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20240108180933.2362963-1-liu.ming50@gmail.com>
 <CADkTA4NwrXFJ0b_2x0GDhVNeSUFVGOvWuXRKu+Wj1ckE=CtSEA@mail.gmail.com>
 <CALatG=4-p2tGB_Ke2WzULVQOPN00n5EYYRvAcsgfWi-U2gGo5g@mail.gmail.com> <CADkTA4OeoLqbD_7Zo-96RL3oAoQH-j0xx3phYGuAx_DKJT1WXQ@mail.gmail.com>
In-Reply-To: <CADkTA4OeoLqbD_7Zo-96RL3oAoQH-j0xx3phYGuAx_DKJT1WXQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 10 Jan 2024 09:50:05 +0100
Message-ID: <CALatG=7B5bHVustExrSgUiWsWMGLqFz6Gi9VZ6qyaUzYvomLSg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: support bash completions for podman/docker
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002cb935060e93851f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jan 2024 08:50:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8535

--0000000000002cb935060e93851f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bruce:

Got that, in that case, I will use a bbappend in our meta layers for now,
thanks for the explanation.

About the podman-native recipe you mentioned, do you plan to push it to
meta-virtualization layer? We found it's very useful in some cases, I am
also considering adding native/natiesdk for buildah, it could be used to
provide a fakerooted build env.

the best,
thank you

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2024=E5=B9=B41=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:23=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On Tue, Jan 9, 2024 at 4:19=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wr=
ote:
> >
> > Hi, Bruce:
> >
> > Seems podman manage its shell completions inside the code (see this
> line:
> https://github.com/containers/podman/pull/21095/commits/6c4892c8029fd992b=
4494adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd423c=
162d5b669688416caeR484
> )
> >
> > then it uses "podman completion SHELL-NAME" to get the completion for a
> particular shell, so it's not safe to pre-generate a completion outside o=
f
> podman source? For instance, if we add a CVE fix or some common bug fixes
> to SRC_URI, the completion might be changed and the developers have to be
> aware of that and also update completion file.
> >
>
> That CVE example is quite unlikely .. and I'd suggest we created the
> issue by packaging the completions in the first case.
>
> > And this qemu wrapper way is being used in OE in several recipes, like
> python, the qemu-native would be built in most cases if you build a OE
> image, so would be no much cost on it? Just my personal options.
> >
>
> I'm quite aware of how and where the wrappers are used.  It is still
> too complex for something as trivial
> as bash completion generation.
>
> I'd suggest you can carry the generation and packaging in a bbappend,
> and that I can look into alternate
> ways to generate the completions in the future.
>
> Even generating them on-target, in a first boot scenario is preferable
> (from a maintenance point of view).
>
> I also have a podman-native extension locally that could be useful,
> but doing an emulated arch-specific
> execution of target podman to generate bash completion outputs (that
> should NOT be arch specfic, and
> if they are, we want no part of them) is far too heavy.
>
> Bruce
>
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

--0000000000002cb935060e93851f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>Got that, in that case, I wi=
ll use a bbappend in our meta layers for now, thanks for the explanation.</=
div><div><br></div><div>About the podman-native recipe you mentioned, do yo=
u plan to push it to meta-virtualization layer? We found it&#39;s very usef=
ul in some cases, I am also considering adding native/natiesdk for=C2=A0bui=
ldah, it could be used to provide a fakerooted build env.</div><div><br></d=
iv><div>the best,</div><div>thank you</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; =E6=96=BC 2=
024=E5=B9=B41=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:23=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, Jan 9, 2024 at 4:19=E2=80=AFAM Ming Liu &lt;<a href=3D"=
mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Hi, Bruce:<br>
&gt;<br>
&gt; Seems podman manage its shell completions inside the code (see this li=
ne: <a href=3D"https://github.com/containers/podman/pull/21095/commits/6c48=
92c8029fd992b4494adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec045271=
0af1f4ecd423c162d5b669688416caeR484" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/containers/podman/pull/21095/commits/6c4892c8029fd992b449=
4adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd423c162=
d5b669688416caeR484</a>)<br>
&gt;<br>
&gt; then it uses &quot;podman completion SHELL-NAME&quot; to get the compl=
etion for a particular shell, so it&#39;s not safe to pre-generate a comple=
tion outside of podman source? For instance, if we add a CVE fix or some co=
mmon bug fixes to SRC_URI, the completion might be changed and the develope=
rs have to be aware of that and also update completion file.<br>
&gt;<br>
<br>
That CVE example is quite unlikely .. and I&#39;d suggest we created the<br=
>
issue by packaging the completions in the first case.<br>
<br>
&gt; And this qemu wrapper way is being used in OE in several recipes, like=
 python, the qemu-native would be built in most cases if you build a OE ima=
ge, so would be no much cost on it? Just my personal options.<br>
&gt;<br>
<br>
I&#39;m quite aware of how and where the wrappers are used.=C2=A0 It is sti=
ll<br>
too complex for something as trivial<br>
as bash completion generation.<br>
<br>
I&#39;d suggest you can carry the generation and packaging in a bbappend,<b=
r>
and that I can look into alternate<br>
ways to generate the completions in the future.<br>
<br>
Even generating them on-target, in a first boot scenario is preferable<br>
(from a maintenance point of view).<br>
<br>
I also have a podman-native extension locally that could be useful,<br>
but doing an emulated arch-specific<br>
execution of target podman to generate bash completion outputs (that<br>
should NOT be arch specfic, and<br>
if they are, we want no part of them) is far too heavy.<br>
<br>
Bruce<br>
<br>
&gt; the best,<br>
&gt; thank you<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000002cb935060e93851f--

