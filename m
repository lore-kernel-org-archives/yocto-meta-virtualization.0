Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF52C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 17:46:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.68574.1753984007739788911
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 10:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I1c9ez00;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso1117888a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 10:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753984007; x=1754588807; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G3HnFLAVRzsAT4lgA0ddrcUdVZa7SnN+Bs2nrzCMg5w=;
        b=I1c9ez00PqTa+qSLNwCO3dDXmUwk1nQLR1q6QUpFvcvtT2bUdtzTbhPRNrSmX7KXMy
         doTKVvwZ9SFA4OfRAti+ire8/eqXYPI2yGCfB3lJ0X+K4UcaQmsPrFP1K4NKBLyMOefo
         1cScsloiKesLgi4fZdL5hVCQ8UkjSSPMgS2b8NuAZbPpkWYQ73sLWoTgmS0/tzCmXImw
         VaVo6BXxyhwQgNFCZrCY0GQT5bHK1gfZ4FlWJAGU7LT9IhsA2SNIpqzg9bT06Pghhe74
         ZFhQmuSOV6bRQT4SuLySlDybvIZz++sGlRqgbUNu4lELfLTzBwOTfS1huts/sHnssFnA
         EYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753984007; x=1754588807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3HnFLAVRzsAT4lgA0ddrcUdVZa7SnN+Bs2nrzCMg5w=;
        b=Gwnz2XOx0QomJ7cOlexaJ3iDA6VcIsFiH0YYatVwR3eAQysk2ipNw+hC/M/5/YWkoq
         G/YwXc/CYG1mWwU9UWAmNsYGWrVYWA1yRHEsZk1xeiO6mbblk+wfojkH6UTMhvTOLcZD
         ce4Ky4GsKaQ0aIG7ip7QPCKrBbXpTjWnjm6tdxtrhL/MD+4KzNeSujcJGd0cqWcDhfXU
         eawozh+mR+0Q6fa/jEiEEe5ed7RKSkpxLBkBweEvtFcOTHR4aMqJZ/AOtskz6t2xBb9Z
         Ooo9R69f8z9IktDQuzNuMIWni6370wVOnylpczkcSaCt6NhJHyBHMC7dgg6pPAa5vjJ4
         uz+g==
X-Gm-Message-State: AOJu0YyLfTfMwLYWfTIvM2+zbQDL49S0n7mvADxh/FE8xphZwzQb81vg
	zsdl43+y1vG4BUY14/k6oypzsB9ZfBiLAxoNKe2N+pQ9BH8EEoHLmVY+ozz58JVUVV5VY8tIOtU
	Q8/PzjdeHeXMyxqxrocqBAorkhPYYayk=
X-Gm-Gg: ASbGncu7cVBbbQbcMNS0M5+PKLFKqXZvaIhY6zrpuriFSVGWKHQ87Pa4hKNBIQ/C2Bf
	jvTwnfEjifCN+0BKLWOHIsiyjACbc59J9kzP2YkENUhHWmhBJzD5dCJ189ZkBf6z183C+s4svXn
	D87b84och69bvQ81FnFgiDwnUfCbNqPDJSVadJXcOGcSNnO+9x1G4pOCjlb35kXkHkGsKwSIf5G
	Jrn9TlifH/I40Q7CQ==
X-Google-Smtp-Source: AGHT+IFQEAlDHgl2bjEDnvr3APSEpvzrlIjjTGxoDOW1LNOgglAI3OM70v4Z+SZ0OdByXZY4ipE138oW471wa0T60/o=
X-Received: by 2002:a17:90b:4cc3:b0:31c:15da:2175 with SMTP id
 98e67ed59e1d1-31f5dd9bad8mr10190304a91.9.1753984006871; Thu, 31 Jul 2025
 10:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <184E5D3D5E8ABBD0.8638@lists.yoctoproject.org> <67D35863-DE1B-4D6D-B3DD-7F877B57856D@oss.qualcomm.com>
In-Reply-To: <67D35863-DE1B-4D6D-B3DD-7F877B57856D@oss.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Jul 2025 13:46:31 -0400
X-Gm-Features: Ac12FXx344RGefioh_sUEniMJfJtrNb8geWCYz5aUwXgk4KU0PPc0lOcFTlqZIg
Message-ID: <CADkTA4OG0CkHYYkG1sDAYwarO-DT1s5SHk-op1LdUO+QOJ-aZg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] Docker: add more required kernel
 modules as RRECOMMENDS:${PN}
To: koen.kooi@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000abdfc2063b3d3977"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 17:46:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9337

--000000000000abdfc2063b3d3977
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A well used ping!

I was busy upreving packages and testing for M3 and hadn't gotten to many
merges.

Thanks for the change, this is now merged.

Bruce

On Thu, Jul 31, 2025 at 10:41=E2=80=AFAM Koen Kooi via lists.yoctoproject.o=
rg
<koen.kooi=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:

> Ping
>
> > Op 2 jul 2025, om 09:03 heeft Koen Kooi via lists.yoctoproject.org
> <koen.kooi=3Doss.qualcomm.com@lists.yoctoproject.org> het volgende
> geschreven:
> >
> > With a very minimal image recipe that just pulls in docker, the daemon
> > won't start due to missing modules, so add the missing ones.
> >
> > The list of new modules was created by diffing the output of `lsmod`
> > before installing all kernel-modules and the output  after launching
> > docker with all modules installed.
> >
> > Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> > ---
> >
> > Changes since v1:
> > * Add kernel-module-veth, the docker daemon starts up just fine
> >  with the v1 patch, but launching an actual container fails due
> >          to missing veth.ko.
> >
> > recipes-containers/docker/docker.inc | 13 ++++++++++++-
> > 1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-containers/docker/docker.inc
> b/recipes-containers/docker/docker.inc
> > index 05a14f97..3a9d6865 100644
> > --- a/recipes-containers/docker/docker.inc
> > +++ b/recipes-containers/docker/docker.inc
> > @@ -14,7 +14,18 @@ RDEPENDS:${PN} =3D "util-linux util-linux-unshare
> iptables \
> >                  "
> > RDEPENDS:${PN} +=3D "virtual-containerd
> ${VIRTUAL-RUNTIME_container_runtime}"
> >
> > -RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat
> kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype
> kernel-module-xt-masquerade"
> > +RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool \
> > +                     kernel-module-nf-conntrack \
> > +                     kernel-module-nf-conntrack-netlink \
> > +                     kernel-module-nf-nat \
> > +                     kernel-module-nfnetlink \
> > +                     kernel-module-overlay \
> > +                     kernel-module-veth \
> > +                     kernel-module-x-tables \
> > +                     kernel-module-xt-addrtype \
> > +                     kernel-module-xt-conntrack \
> > +                     kernel-module-xt-masquerade \
> > +                    "
> >
> > PROVIDES +=3D "virtual/docker"
> >
> > --
> > 2.48.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9333):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9333
> Mute This Topic: https://lists.yoctoproject.org/mt/113944045/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000abdfc2063b3d3977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">A w=
ell used ping!</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I was busy=
 upreving packages and testing for M3 and hadn&#39;t gotten to many merges.=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Thanks for the cha=
nge, this is now merged.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 31, 2025 at 10:41=E2=80=AFAM K=
oen Kooi via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.o=
rg</a> &lt;koen.kooi=3D<a href=3D"mailto:oss.qualcomm.com@lists.yoctoprojec=
t.org">oss.qualcomm.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Ping<br>
<br>
&gt; Op 2 jul 2025, om 09:03 heeft Koen Kooi via <a href=3D"http://lists.yo=
ctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org=
</a> &lt;koen.kooi=3D<a href=3D"mailto:oss.qualcomm.com@lists.yoctoproject.=
org" target=3D"_blank">oss.qualcomm.com@lists.yoctoproject.org</a>&gt; het =
volgende geschreven:<br>
&gt; <br>
&gt; With a very minimal image recipe that just pulls in docker, the daemon=
<br>
&gt; won&#39;t start due to missing modules, so add the missing ones.<br>
&gt; <br>
&gt; The list of new modules was created by diffing the output of `lsmod`<b=
r>
&gt; before installing all kernel-modules and the output=C2=A0 after launch=
ing <br>
&gt; docker with all modules installed.<br>
&gt; <br>
&gt; Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@oss.qualcomm.=
com" target=3D"_blank">koen.kooi@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes since v1:<br>
&gt; * Add kernel-module-veth, the docker daemon starts up just fine<br>
&gt;=C2=A0 with the v1 patch, but launching an actual container fails due<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to missing veth.ko.<br>
&gt; <br>
&gt; recipes-containers/docker/docker.inc | 13 ++++++++++++-<br>
&gt; 1 file changed, 12 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/docker/docker.inc b/recipes-containers=
/docker/docker.inc<br>
&gt; index 05a14f97..3a9d6865 100644<br>
&gt; --- a/recipes-containers/docker/docker.inc<br>
&gt; +++ b/recipes-containers/docker/docker.inc<br>
&gt; @@ -14,7 +14,18 @@ RDEPENDS:${PN} =3D &quot;util-linux util-linux-unsh=
are iptables \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<b=
r>
&gt; RDEPENDS:${PN} +=3D &quot;virtual-containerd ${VIRTUAL-RUNTIME_contain=
er_runtime}&quot;<br>
&gt; <br>
&gt; -RRECOMMENDS:${PN} =3D &quot;kernel-module-dm-thin-pool kernel-module-=
nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-=
module-xt-masquerade&quot;<br>
&gt; +RRECOMMENDS:${PN} =3D &quot;kernel-module-dm-thin-pool \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-nf-conntrack \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-nf-conntrack-netlink \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-nf-nat \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-nfnetlink \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-overlay \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-veth \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-x-tables \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-xt-addrtype \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-xt-conntrack \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel-module-xt-masquerade \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;<br>
&gt; <br>
&gt; PROVIDES +=3D &quot;virtual/docker&quot;<br>
&gt; <br>
&gt; -- <br>
&gt; 2.48.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9333): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9333" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9333</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113944045/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113944045/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000abdfc2063b3d3977--

