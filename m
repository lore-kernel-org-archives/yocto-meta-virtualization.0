Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCE2CA0EC4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 03:34:29 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.92470.1755056058767466364
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Aug 2025 20:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQa1S1J2;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-321c5eb1f4bso924101a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Aug 2025 20:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755056056; x=1755660856; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IqxaFEBoyt6BCoDUr8SryiCSiIU31pU1rcP0Uv9VvaY=;
        b=QQa1S1J2nBlqAjS6WOYN0DodXpnGLYUVHrnUkMkm3/c8sPeltdmh3Tr0Vc3nTshU68
         J5rpiAjpQAf+ITW3FURLqrQABs/D5tuS1UwMWnjo8RlSOR7j/Fvg5maRVbw+3LFYx2y6
         yuI0gM18p4VAd1jVzyJlyoOHGIoifJy/As1e12GzMoZ5wppPlKFyXseonwFX0vbPsv+9
         uoh7qqv/c9/gmHETRA0hhJHk0Y5jWCYQHDl1JDP7XscOZy+h3rlvjbbOFZBaQzv4kL38
         IAbTSyA04XsswBR4igf6MK39fw3u0mjR6Si3yBD1p6NqzxDe7EWjPleRYlyq2CWdb83k
         kGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755056056; x=1755660856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqxaFEBoyt6BCoDUr8SryiCSiIU31pU1rcP0Uv9VvaY=;
        b=QcGioVjCSYeJapu+FNl+wbqJICJ1cLTiJI+TyH1OgN2fuolkycWxUxsLhEG5b2Q6oa
         R8XhQkNuZYe+eYpstq2RXR+OMNs8vZiuvxF1vgBNo9i73p6EGnUgPmUqfES1nsdtekgF
         5C3XGAyaOS5taK075YBV8Pm8Md9deviibYz7u6EGuHri4uunJbWlFgv3n8+leE6zoUmC
         wnP1rp+mQJtULiJZnPBBLZucMfyOWm0Ifg/PyPbrJDyDXUJlSLQtw4ixLWtn/0cvU4wC
         iHqdmBrkKtiZHwUBxzBP0lf9nYK5FRNbmxLBtTbPhkqOUOp6lRyyG7OXPDLE3ddcyT0X
         z0mg==
X-Gm-Message-State: AOJu0YwWO/cCcCHI+xpKA5e5s6mgWBGfkvc2rcXezaTmnSkMOg7nv1vU
	EUkThOdT9NiGwAj3hyNFZ7W5lD7Cf0T7sw/yTk1rhcDsTOE6SYlyX4kzWfuJZPmbQj003I5SKw9
	2/O8UM8OcShm4NioeKjnhanfFuBv2zUs=
X-Gm-Gg: ASbGnctkIp5FTpdD7XQP21T3oMq3Aeo2ZOV82BuL4rRt5+BznfwNA9VP9hhZn0VFP8v
	KIwTcakLe5R2U/36QdJs+2xwMHJkWBwRyF3B9ogweuKNL+yz2gMEmpO9QQCW2pVVheoh0wi6Zj9
	Cnlzze0fdWr/dz/agUynrQjIbkshLegHXLl4T1JYmG2AdB/UjzqdJl/U3oIStGzXRj/Gu9JgxUr
	6djRZI=
X-Google-Smtp-Source: AGHT+IH/sZp+1WMvxLQdKqqtiDawnGpEkDxz/PppTRjyYF6cgDUF7Iej6OE57ZpgtEdSeeyaOWp1T9x3HxjqqUPUykg=
X-Received: by 2002:a17:90b:38c6:b0:321:b975:abe5 with SMTP id
 98e67ed59e1d1-321d0affb78mr2757417a91.0.1755056055469; Tue, 12 Aug 2025
 20:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <18543A11B753F956.534@lists.yoctoproject.org> <d4a4a660-6093-4465-b8bb-0b13c4cf79db@windriver.com>
In-Reply-To: <d4a4a660-6093-4465-b8bb-0b13c4cf79db@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Aug 2025 23:34:04 -0400
X-Gm-Features: Ac12FXz7XTJsTf5Q9dwgvIopnGiY5vdiC9PRqUI96oIjwEaExjrnV0IZwvSrqUk
Message-ID: <CADkTA4O5bQHXp-5stdVqBDUk6be14tc05Q44Rchc8N+tWjN86w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skopeo: avoid overriding
 GOBUILDFLAGS set in go.bbclass
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000bf5ed5063c36d4bf"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Aug 2025 03:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9349

--000000000000bf5ed5063c36d4bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm still considering it.

But all merges are held for a bit as I finalize the M3 package updates and
system level testing.

Generally speaking, I don't really want any of the values from the go
classes as they've caused me more issues than I can count. I prefer to keep
the recipes handling their own flags.  But as I said, I'll consider this
once I'm through updates.

Bruce

On Tue, Aug 12, 2025 at 10:14=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wro=
te:

> ping
>
> On 7/21/25 17:26, Chen Qi via lists.yoctoproject.org wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > When MACHINE is riscv64, skopeo fails to build with the following
> > error message:
> >
> >    ERROR: QA Issue: skopeo: ELF binary /usr/sbin/skopeo has relocations
> in .text [textrel]
> >
> > To reproduce the issue, run the following command:
> > MACHINE=3Dqemuriscv64 bitbake skopeo
> >
> > In go.bbclass, we have:
> > """
> > export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
> > ...
> > python() {
> >      if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in
> d.getVar('TARGET_ARCH'):
> >          d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
> >      else:
> >          d.appendVar('GOBUILDFLAGS', ' -buildmode=3Dpie')
> > }
> > """
> >
> > The '-v -trimpath' and arch depedent '-buildmode=3Dpie' is generally
> reasonable.
> > And we can see we'll need to use anonymous python function to handle
> PIE. So we
> > should avoid overriding it unless necessary.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >   recipes-containers/skopeo/skopeo_git.bb | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/recipes-containers/skopeo/skopeo_git.bb
> b/recipes-containers/skopeo/skopeo_git.bb
> > index c5518cdc..32938108 100644
> > --- a/recipes-containers/skopeo/skopeo_git.bb
> > +++ b/recipes-containers/skopeo/skopeo_git.bb
> > @@ -60,7 +60,6 @@ do_compile() {
> >       export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
> >
> >       export GO111MODULE=3Doff
> > -     export GOBUILDFLAGS=3D"-trimpath"
> >       export EXTRA_LDFLAGS=3D"-s -w"
> >
> >       oe_runmake bin/skopeo
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9326):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9326
> > Mute This Topic: https://lists.yoctoproject.org/mt/114265288/3618072
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [Qi.Chen@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bf5ed5063c36d4bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;m still considering it.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">But all merges are held for a bit as I finalize the M3 package updates an=
d system level testing.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">G=
enerally speaking, I don&#39;t really want any of the values from the go cl=
asses as they&#39;ve caused me more issues than I can count. I prefer to ke=
ep the recipes handling their own flags.=C2=A0 But as I said, I&#39;ll cons=
ider this once I&#39;m through updates.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 12, 2025 at 10:=
14=E2=80=AFPM ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">ping<br>
<br>
On 7/21/25 17:26, Chen Qi via <a href=3D"http://lists.yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;<br>
&gt; When MACHINE is riscv64, skopeo fails to build with the following<br>
&gt; error message:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 ERROR: QA Issue: skopeo: ELF binary /usr/sbin/skopeo has =
relocations in .text [textrel]<br>
&gt;<br>
&gt; To reproduce the issue, run the following command:<br>
&gt; MACHINE=3Dqemuriscv64 bitbake skopeo<br>
&gt;<br>
&gt; In go.bbclass, we have:<br>
&gt; &quot;&quot;&quot;<br>
&gt; export GOBUILDFLAGS ?=3D &quot;-v ${GO_LDFLAGS} -trimpath&quot;<br>
&gt; ...<br>
&gt; python() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if &#39;mips&#39; in d.getVar(&#39;TARGET_ARCH&#39=
;) or &#39;riscv32&#39; in d.getVar(&#39;TARGET_ARCH&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;INSANE_SKIP:%s&#39;=
 % d.getVar(&#39;PN&#39;), &quot; textrel&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;GOBUILDFLAGS&#39;, =
&#39; -buildmode=3Dpie&#39;)<br>
&gt; }<br>
&gt; &quot;&quot;&quot;<br>
&gt;<br>
&gt; The &#39;-v -trimpath&#39; and arch depedent &#39;-buildmode=3Dpie&#39=
; is generally reasonable.<br>
&gt; And we can see we&#39;ll need to use anonymous python function to hand=
le PIE. So we<br>
&gt; should avoid overriding it unless necessary.<br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a> | 1 -<br>
&gt;=C2=A0 =C2=A01 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb=
" rel=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a> b/recipes-containe=
rs/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">skopeo_git.bb</a><br>
&gt; index c5518cdc..32938108 100644<br>
&gt; --- a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a><br>
&gt; +++ b/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a><br>
&gt; @@ -60,7 +60,6 @@ do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}=
&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0export GO111MODULE=3Doff<br>
&gt; -=C2=A0 =C2=A0 =C2=A0export GOBUILDFLAGS=3D&quot;-trimpath&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0export EXTRA_LDFLAGS=3D&quot;-s -w&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake bin/skopeo<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9326): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9326" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9326</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11426528=
8/3618072" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/114265288/3618072</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:Qi.Chen@windriver=
.com" target=3D"_blank">Qi.Chen@windriver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000bf5ed5063c36d4bf--

