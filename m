Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B10EE49B0
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 13:57:44 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.22317.1726063061977351428
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 06:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbfSVkGJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6d44b6e1aebso15745287b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726063061; x=1726667861; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUt82ZgikVMICzQ5LZ3fcAPznVtUK/dJwD2yWpSJ2jk=;
        b=dbfSVkGJagH62WQP+FwdZsAqMUYfwbANiMlXX43BcbdIu8lka5koCaI5ddYFWuSUhQ
         lx/soTa15Znkt5PA6DdFiwdObwp+L6l05KrEJy92uTdnm2KSn0c5O3JRa0MnBsFwKvt4
         uZ6ZKJ5jt8ByJMEO2Nc+vRAY+ZxAN+ZDLevcwQOIdaEWVdR1DM/BP6ULKZmBPPvsqfEA
         dm7CqTSzNNwjtdlJ8UP/MAOz9a0/vGXv9J6Xuo+HErDVppgY7gYg2SlNpqcHmeOcaN0q
         5yhRTDPAqHRawGrLOUeh408zDkmLVGMvsKigKAYazPI6EenByz7HiciLlCDfkxVtENtS
         BENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726063061; x=1726667861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUt82ZgikVMICzQ5LZ3fcAPznVtUK/dJwD2yWpSJ2jk=;
        b=SR66UmELi23YL9mvNrwmQNqtkOPF79gRJ06dFi1MscIicX1cg3giDozUXy1pjMYQqO
         zZ6XmmK8PrqzDmekt0ln/5/1TxYt9DbvPDleP2gtksjDspyAq31ngLsaRsFkgqCIwkoS
         1AoE97V8j+nfMbfBJqkgy49zoyoURL0v6ApnX0gHHTLDNMrCNGXe0cvYnJ5KOLJ1CGFZ
         v+LFpzyk8wpHwMdcyKc/CbjVeS+Xc3OFhPHtSU1luRoznBgrvJ8oy0h62cwiNWCle9gp
         Cbfgqc/vXLF1nJIXJtaRdQzIDibMnp2yh7n7WGKVSBuICojPLtWHGMxiXbLBKGMb99Ke
         GACw==
X-Gm-Message-State: AOJu0YyQT+z1C64SVoDVmOFHdfdEzjXjTQ+s6xajgY3wYNsGzc1qCRsC
	A+qnhS/pgEjFIL/OWGODXRuHEjARR8JB1xt9687gqbokofNBf1x0oxxTLve+rR5ZIdCMSEu9MCg
	h7QJBZo9d02C68P7QKxQuql5UWRfOnr7/gDYF2w==
X-Google-Smtp-Source: AGHT+IHlEm5PzU5z9dSI26gczE+Fg5Rv3+1olOLl7dGwT+q0lQ0S7aLdS50jry/gYhmNJuPr+/fw1zYF8LcMsIqB6cw=
X-Received: by 2002:a05:690c:6f8b:b0:6b7:a7b3:8da3 with SMTP id
 00721157ae682-6dba6db4428mr29550787b3.19.1726063061006; Wed, 11 Sep 2024
 06:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <g6fqs7n55g3tl5f3iqq4evfjvdbo3p33eyhmpqkwbtpqnwt6m5@sj4psvs2kglu>
 <CADkTA4NwyiEzkXuSwV5Uow679-3hq2mh7MpQxT-f4WwSaiS8-Q@mail.gmail.com> <xgoj4nxhjxlk7xsmaq3yd7w5t5wwbhrgcjhtqziiwuzr3hue26@2oefjdiwaw4k>
In-Reply-To: <xgoj4nxhjxlk7xsmaq3yd7w5t5wwbhrgcjhtqziiwuzr3hue26@2oefjdiwaw4k>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Sep 2024 09:57:18 -0400
Message-ID: <CADkTA4N_QvyhFHHcHot0BOx10ouUjja2f4jq+80Vm_bNBosfqw@mail.gmail.com>
Subject: Re: Backporting Xen 4.19 to scarthgap
To: Amneesh Singh <a-singh21@ti.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009c83680621d85f4b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8880

--0000000000009c83680621d85f4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 9:55=E2=80=AFAM Amneesh Singh <a-singh21@ti.com> wro=
te:

> On 09:44-20240906, Bruce Ashfield wrote:
> > On Fri, Sep 6, 2024 at 9:37=E2=80=AFAM Amneesh Singh <a-singh21@ti.com>=
 wrote:
> >
> > > Hello,
> > >
> > > Is backporting Xen 4.19+stable to scarthgap a possibility?
> > >
> >
> > I don't hold quite as strictly to the "no new major versions in stable
> > branches"
>
> I agree, freezing Xen to 4.18, would limit things in my opinion.
>
>
That's not quite what I meant.

There's very few recipes that we are willing to carry multiple versions
of in main layers, Xen is one of them. If it wasn't for that, this would be
a definite no, since if someone wants new features, we simply point
them at the next release.

It also isn't something that I'd continually do (again, I'm only talking
about the official meta-virt layers/branches) as more Xen releases
arrive through the lifetime of a LTS. The support matrix is too high
at that point, and again, I'd just point to the new releases.



> > as OE core does.  In particular for recipes that I carry multiple
> versions
> > of.
> >
> > Xen does fall into that category, if there's a compelling reason (i.e. =
a
> > feature we can't backport that is required), then 4.19 could be added,
> but
> > not made the default version (that would break policy).
>
> I am mostly interested in dynamic node programming using overlay dtbo.
> Although, I have not tried it with dom0less domains yet.
>
> Other than that, I have a patchset which I'll have to rewrite to make it
> work with 4.18 :p, so I was trying to avoid that.
>
> What do you think? Is it possible to make this work?
>

It should definitely be possible, and something I'm willing to do as it is
an already tested version in master. I also so like to keep things we
want to support in meta-virt itself, versus external mixin layers
(when possible).

Have you tried just taking the recipes from meta-virt master and seeing
how the work on scarthgap ? I'm still doing current release bug fixing
and package updates, so it will be a while before I get a chance to try
that myself.

Bruce



>
> >
> > Bruce
> >
>
> Regards
> Amneesh
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009c83680621d85f4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 6, 2024 at 9:55=E2=80=AFAM Amneesh Sing=
h &lt;<a href=3D"mailto:a-singh21@ti.com">a-singh21@ti.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 09:44-20240906=
, Bruce Ashfield wrote:<br>
&gt; On Fri, Sep 6, 2024 at 9:37=E2=80=AFAM Amneesh Singh &lt;<a href=3D"ma=
ilto:a-singh21@ti.com" target=3D"_blank">a-singh21@ti.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Is backporting Xen 4.19+stable to scarthgap a possibility?<br>
&gt; &gt;<br>
&gt; <br>
&gt; I don&#39;t hold quite as strictly to the &quot;no new major versions =
in stable<br>
&gt; branches&quot;<br>
<br>
I agree, freezing Xen to 4.18, would limit things in my opinion.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">That&#39;s not quite what I meant.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">There&#39;s very few recipes that we are=
 willing to carry multiple versions</div><div class=3D"gmail_default" style=
=3D"font-size:small">of in main layers, Xen is one of them. If it wasn&#39;=
t for that, this would be</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">a definite no, since if someone wants new features, we simply po=
int</div><div class=3D"gmail_default" style=3D"font-size:small">them at the=
 next release.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">It also is=
n&#39;t something that I&#39;d continually do (again, I&#39;m only talking<=
/div><div class=3D"gmail_default" style=3D"font-size:small">about the offic=
ial meta-virt layers/branches) as more=C2=A0Xen releases</div><div class=3D=
"gmail_default" style=3D"font-size:small">arrive through=C2=A0the lifetime =
of a LTS. The support matrix is too high</div><div class=3D"gmail_default" =
style=3D"font-size:small">at that point, and again, I&#39;d just point to t=
he new releases.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt; as OE core does.=C2=A0 In particular for recipes that I carry multiple=
 versions<br>
&gt; of.<br>
&gt; <br>
&gt; Xen does fall into that category, if there&#39;s a compelling reason (=
i.e. a<br>
&gt; feature we can&#39;t backport that is required), then 4.19 could be ad=
ded, but<br>
&gt; not made the default version (that would break policy).<br>
<br>
I am mostly interested in dynamic node programming using overlay dtbo.<br>
Although, I have not tried it with dom0less domains yet.<br>
<br>
Other than that, I have a patchset which I&#39;ll have to rewrite to make i=
t<br>
work with 4.18 :p, so I was trying to avoid that.<br>
<br>
What do you think? Is it possible to make this work?<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">It sho=
uld definitely be possible, and something I&#39;m willing to do as it is</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">an already tested=
 version in master. I also so like to keep things we</div><div class=3D"gma=
il_default" style=3D"font-size:small">want to support in meta-virt itself, =
versus external mixin layers</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">(when possible).</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Have you tried just taking the recipes from meta-virt master and seei=
ng</div><div class=3D"gmail_default" style=3D"font-size:small">how the work=
 on scarthgap=C2=A0? I&#39;m still doing current release bug fixing</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">and package updates, s=
o it will be a while before I get a chance to try</div><div class=3D"gmail_=
default" style=3D"font-size:small">that myself.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
<br>
Regards<br>
Amneesh<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000009c83680621d85f4b--

