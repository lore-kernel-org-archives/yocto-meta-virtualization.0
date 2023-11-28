Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E452C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 03:11:43 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.24193.1701141098276676089
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 19:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glYMlzhO;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54b18dbf148so3702563a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 19:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701141096; x=1701745896; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HaT1yTkxFNXiBRvoibXtW5NEbdwt0F8aBBOrwgyTjcY=;
        b=glYMlzhOMY7sETCkr7BSLeYIwGrTRHqW2iKkke1gQRpqp99z/DAjOitMC4eQz3YSJC
         D3Nur+hep3CvngyFFrlCan+EkKbW0WMNNTgoQz3lbmP/WylIjvQCvRqvpb9yWW3Nj+6G
         OtE+uGZvt+hoUC2ATpOU9uphmYLp/gA1UL92qZi2KeLY6rJS4oxWdJY7lH5cO9bFA58O
         jtFwdoosJVHxhMyF80ScZdO2dk5H8Vw3yBt4WB9F0ya1JoP9+n3YHiAKM31a4bbpwDl9
         nmEKSyaGtcRaee8eCtFhmOcpKj754PoddtRmHV2ShHAXyU72iRCj2+vcQyEJEeqmqtWP
         jH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701141096; x=1701745896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaT1yTkxFNXiBRvoibXtW5NEbdwt0F8aBBOrwgyTjcY=;
        b=jGQVFoFC8W6J0mSjDjDqEbtzOW8EVg6Aq/kp6yYkJa5NGhG6GY/8VblESmzke0npgv
         kMsV0D8/pdCJjnYfMizmf1eQXjqi2VpLBSME/jNKAR9wFTRNJgxm5/KSNUM+evPKE8zF
         G/i268bzmGeHUqVkzRqyCohNQWp//ZadUdoiDKnTAgkaKcFQBulqvgvch+0+rQw7MwNS
         cGQhU40uB+JMQWwsNS1Mj3d2BD3ghg4JgT0yc4KLIxvw1hQtP1mIwO5/pqg41p1F+ybQ
         YeLd8C3yjH0vHr1WRQqv4ytJkpsuYwiw/KlWXAQ5ku4y3yvWsOaJOC3C1g/tkVzL9icb
         bvnw==
X-Gm-Message-State: AOJu0YyFFXfjWyb44lAQcMKOML2ApntWzdcA0qvtWQUzuTa2+nW5i+xE
	y0f36v2H+NY9Q0j9UCPBxg/5fugBoIS+X0goaTM=
X-Google-Smtp-Source: AGHT+IEjmsQQGipImBxENaNxlr2TJpCuxYhe0a9cw/92KqC74pt5upO7NpAIA3YV1KV/PlaZlQaAv373IxTS9O9UHN8=
X-Received: by 2002:a50:fa83:0:b0:54a:f4cd:5fab with SMTP id
 w3-20020a50fa83000000b0054af4cd5fabmr9657384edr.16.1701141096406; Mon, 27 Nov
 2023 19:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20231127103811.319149-1-michal.orzel@amd.com> <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
 <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com>
In-Reply-To: <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 27 Nov 2023 19:11:24 -0800
Message-ID: <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
To: Michal Orzel <michal.orzel@amd.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c3a3bf060b2dc6ed"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 03:11:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8474

--000000000000c3a3bf060b2dc6ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:

> Hi Bruce,
>
> On 27/11/2023 14:55, Bruce Ashfield wrote:
> >
> >
> > On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal.orzel@amd.=
com>
> wrote:
> >>
> >> Some follow-up patches after a recent Xen recipes update.
> >>
> >> Open question:
> >> Shouldn't we set 4.18 as a default version?
> >
> > Not yet (and definitely not for nanbield). Perhaps once it has been und=
er
> > test for a few weeks. I did the updates to get them some extra soak tim=
e
> > and make them available in both the upcoming release (nanbield) and
> > master for those that want to use the latest, without making it a defau=
lt
> > version jump so late in the cycle.
> Ok.
>

Thanks, Bruce.


>
> >
> > As for the changes in master, the 4.18 version on the _git recipes is
> > intentional, as there's been no 4.19 tag that I can find and I don't bu=
mp
> > versions until I see that in the repo .. so for now, it is just the +gi=
t
> > and +stable that is the difference between the 4.18 and _git versions.
> You won't see any 4.19 tag until the next release. The version is
> advertised in
> the main Makefile [1] and this is what user can see in the system
> (e.g. in the boot log, xl info, xen_version hypercall).
> Bumping the XEN_REL of master recipes


I think it could be helpful for the context of this thread to describe them
as the "git recipes" rather than using the term "master recipe", because
the latter unfortunately seems to convey that they are somehow superior to
the other, versioned, Xen recipes, when in practice they are not -- they
are deliberately not the default version of Xen that is built since, as you
note, they are defined:


> to reflect the current development version
>

of Xen. ie. The git recipes are present alongside the other recipes that
provide the stable release version(s) of Xen.

As Michal has noted above, putting 4.19 for XEN_REL into the git recipe
does look right from a Xen source tree perspective for that SRCREV, even
though there is not a 4.19 Xen release, but the proposed commit message
should be updated to avoid the term "master recipe".

Thanks Michal for the update to bring the tools recipe up to the same
revision as the hypervisor.

Christopher



> is what I've been doing for the last 2 cycles [2], [3]:
>
> [1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/Makefile=
#l8
> [2]
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3D3581dd56aa9=
7ae17b480692aeb733ca0d1fa0eec
> [3]
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3D265518e6899=
726a47bb150f248a18d56dfbbffdf
> >
> > I've grabbed the 4.17 version bump from the series.
> + master tools recipe SHA update
>
> ~Michal
>
>

--000000000000c3a3bf060b2dc6ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 27, 2023 at 6:08=E2=80=AF=
AM Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@am=
d.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Bruce,<br>
<br>
On 27/11/2023 14:55, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel &lt;<a href=3D"ma=
ilto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Some follow-up patches after a recent Xen recipes update.<br>
&gt;&gt;<br>
&gt;&gt; Open question:<br>
&gt;&gt; Shouldn&#39;t we set 4.18 as a default version?<br>
&gt; <br>
&gt; Not yet (and definitely not for nanbield). Perhaps once it has been un=
der<br>
&gt; test for a few weeks. I did the updates to get them some extra soak ti=
me<br>
&gt; and make them available in both the upcoming release (nanbield) and<br=
>
&gt; master for those that want to use the latest, without making it a defa=
ult<br>
&gt; version jump so late in the cycle.<br>
Ok.<br></blockquote><div><br></div><div>Thanks, Bruce.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; As for the changes in master, the 4.18 version on the _git recipes is<=
br>
&gt; intentional, as there&#39;s been no 4.19 tag that I can find and I don=
&#39;t bump<br>
&gt; versions until I see that in the repo .. so for now, it is just the +g=
it<br>
&gt; and +stable that is the difference between the 4.18 and _git versions.=
<br>
You won&#39;t see any 4.19 tag until the next release. The version is adver=
tised in<br>
the main Makefile [1] and this is what user can see in the system<br>
(e.g. in the boot log, xl info, xen_version hypercall).<br>
Bumping the XEN_REL of master recipes </blockquote><div><br></div><div>I th=
ink it could be helpful for the=C2=A0context of this thread to describe the=
m as the &quot;git recipes&quot; rather than using the term &quot;master re=
cipe&quot;, because the latter unfortunately seems to convey that they are =
somehow superior to the other, versioned, Xen recipes, when in practice the=
y are not -- they are deliberately not the default version of Xen that is b=
uilt since, as you note, they are defined:</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">to reflect the current development =
version<br></blockquote><div><br></div><div>of Xen. ie. The git recipes are=
 present alongside the other recipes that provide the stable release versio=
n(s) of Xen.</div><div><br></div><div>As Michal has noted above, putting 4.=
19 for XEN_REL into the git recipe does look right from a Xen source tree p=
erspective for that SRCREV, even though there is not a 4.19 Xen release, bu=
t the proposed commit message should be updated to avoid the term &quot;mas=
ter recipe&quot;.</div><div><br></div><div>Thanks Michal for the update to =
bring the tools recipe up to the same revision as the hypervisor.</div><div=
><br></div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
is what I&#39;ve been doing for the last 2 cycles [2], [3]:<br>
<br>
[1] <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen=
/Makefile#l8" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/=
gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/Makefile#l8</a><br>
[2] <a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?id=
=3D3581dd56aa97ae17b480692aeb733ca0d1fa0eec" rel=3D"noreferrer" target=3D"_=
blank">https://git.yoctoproject.org/meta-virtualization/commit/?id=3D3581dd=
56aa97ae17b480692aeb733ca0d1fa0eec</a><br>
[3] <a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?id=
=3D265518e6899726a47bb150f248a18d56dfbbffdf" rel=3D"noreferrer" target=3D"_=
blank">https://git.yoctoproject.org/meta-virtualization/commit/?id=3D265518=
e6899726a47bb150f248a18d56dfbbffdf</a><br>
&gt; <br>
&gt; I&#39;ve grabbed the 4.17 version bump from the series.<br>
+ master tools recipe SHA update<br>
<br>
~Michal<br>
<br>
</blockquote></div></div>

--000000000000c3a3bf060b2dc6ed--

