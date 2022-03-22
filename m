Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97A8C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:57:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.118.1647979071312436529
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fDlmTu3m;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id dr20so37967745ejc.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mKcD/+xAVsszxK1T0eXD7BMdmHIQhOpWfwiOmi/+9hw=;
        b=fDlmTu3mtcyTuddXGpx/z6tyfg4oEYCVilNOz9hbox8ivTZjF+TDT4WfD7R0ombqmX
         s1B0h1UigpG6jPwW0rswyYx/uN9iV2KYSqsB9S0HblU2TEpqE5EAoncALgh8oxgbu4fj
         ZGcVVqAjQWj8nKY6359X3AKFjqpxVzKOoivR18DGGm4V+MdAx8thRvcCMKnHR9MNkpb5
         cCSQz2irF+rydc2pci5RoKEZx9QF51XygbFrwdRCo2y1YM05wNWHq0NgX9r3+Z9pJnSz
         zfDlAqLncRO6bZFe7iRaZM/1fIkELwWj1K7uP0REt/TCIziiyILH9g5oR5emQuA7Egc4
         b4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKcD/+xAVsszxK1T0eXD7BMdmHIQhOpWfwiOmi/+9hw=;
        b=VgpWyhKIwdaDflOMgx+Uy4Qty/X7GRa1ESf32SdSckt6dEbpBSKNHm4SLnMHEmeX3P
         g/EYDQm4Q4H9ntWuqAoELSXcdtX+gMCs/9LnPQ/LgQAaw8ZW1lUy34FjrOOrd5pqc0cx
         RZ+7yWjWMvgb6QRTWIfqWXkJbiUD3SGLMkhYqtxM6gNqM3G30qL0EVp6yzez/lCqx8/M
         KBn71c0X5zeWZnztjP6D5fE8nRrUEMMvy8Vnqwrjkulp0JkBBcCmIfdf2iekosdTmKfk
         KHX7q6McoRgW2V7g/LrrhtF0a5GeIkWIYlwHkozOOrm6QBZaaMaLr/id1f1I/dntUIcd
         wkYQ==
X-Gm-Message-State: AOAM532VwX8Kcjqvw88TCVxvQ78NALUeuWYKuXWQcE0C10b4s15qVsSF
	NoaW01gfgpJeIJ3/HTK3bdgg1O3k+eg/f31pTqY=
X-Google-Smtp-Source: 
 ABdhPJxDSAXAuWDgZ3g4fzjIyB9evMUrAXx/WrCuOAWKNWa3sZIhLIccOSTarGn13H1+5gQuTqiyv3Q9s/2HGGOm+f8=
X-Received: by 2002:a17:907:d23:b0:6db:6c6:8558 with SMTP id
 gn35-20020a1709070d2300b006db06c68558mr27827424ejc.141.1647979069357; Tue, 22
 Mar 2022 12:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220316152020.29113-1-sakib.sajal@windriver.com>
 <9708c3c0-532f-97ba-6c1a-4511766ad2b2@windriver.com>
In-Reply-To: <9708c3c0-532f-97ba-6c1a-4511766ad2b2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Mar 2022 15:57:38 -0400
Message-ID: 
 <CADkTA4OJ5qK+hya39jfao8t7dQ-71-erihDBAA9mtxz87E-=iQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] ceph: set CXXFLAGS and CFLAGS
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000006c23d05dad40716"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 19:57:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7104

--00000000000006c23d05dad40716
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 12:22 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2022-03-16 11:20, sakib.sajal@windriver.com wrote:
> > commit a83623a54a375d3ae9198a135b94379881a2b7a5 was added
> > to oe-core which removes
>
> The phrase:
>     "was added ... which removes"
> is awkward. As a student of Strunk and White, I suggest:
>
> ---
> In oe-core, the commit:
>     a83623a54a Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"
>
> drops compiler flags overrides for all cmake-based recipes,
> causing the ceph compile to fail with the error:
>    ld: cannot find crtn.o: No such file or directory
>
>    collect2: error: ld returned 1 exit status
>
>
> Add the override back for ceph to fix the build error.
>
> ---
>
> It's always good to include the key parts of the error log
> so that someone can search the commit logs for help given
> a keyword.
>
> Bruce,
>
> Did/does this error show up in your meta-virt testing?
>

I'm seeing it now as well. I've been working on a few things, so my testing
against oe-core was at an older commit.

So the change is likely good, but I'm waiting for a v2 with Randy's
suggested re-wording.

Bruce


>
> > CXXFLAGS and CFLAGS causing
> > compilation for ceph to fail.
> >
> > Set CXXFLAGS and CFLAGS to resolve the issue.
> >
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > ---
> >   recipes-extended/ceph/ceph_15.2.15.bb | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/recipes-extended/ceph/ceph_15.2.15.bb
> b/recipes-extended/ceph/ceph_15.2.15.bb
> > index c72953a..17dbcf3 100644
> > --- a/recipes-extended/ceph/ceph_15.2.15.bb
> > +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> > @@ -66,6 +66,9 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
> >                    -DWITH_REENTRANT_STRSIGNAL=ON \
> >   "
> >
> > +CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> > +CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>
> Does ceph need both of the _ARCH and _OPTIONS to be set?
> Since the error is at link time, try adding only TOOLCHAIN_OPTIONS
> as is done for:
>
> recipes-core/runx/runx_git.bb
>
> 97:        export CFLAGS="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${CFLAGS}"
>
> 98:        export LDFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH} ${LDFLAGS}"
>
>
>
>
> ../Randy
>
> > +
> >   export STAGING_DIR_HOST
> >
> >   do_configure:prepend () {
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7093):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7093
> > Mute This Topic: https://lists.yoctoproject.org/mt/89824093/3616765
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [randy.macleod@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000006c23d05dad40716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 12:22 PM Randy MacLeod &lt;=
<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 2022-03-16 11:20, <a href=3D"mailto:sakib.sajal@windriver.com" target=3D"=
_blank">sakib.sajal@windriver.com</a> wrote:<br>
&gt; commit a83623a54a375d3ae9198a135b94379881a2b7a5 was added<br>
&gt; to oe-core which removes <br>
<br>
The phrase:<br>
=C2=A0 =C2=A0 &quot;was added ... which removes&quot;<br>
is awkward. As a student of Strunk and White, I suggest:<br>
<br>
---<br>
In oe-core, the commit:<br>
=C2=A0 =C2=A0 a83623a54a Revert &quot;cmake.bbclass: Set CXXFLAGS and CFLAG=
S&quot;<br>
<br>
drops compiler flags overrides for all cmake-based recipes,<br>
causing the ceph compile to fail with the error:<br>
=C2=A0 =C2=A0ld: cannot find crtn.o: No such file or directory<br>
<br>
=C2=A0 =C2=A0collect2: error: ld returned 1 exit status<br>
<br>
<br>
Add the override back for ceph to fix the build error.<br>
<br>
---<br>
<br>
It&#39;s always good to include the key parts of the error log<br>
so that someone can search the commit logs for help given<br>
a keyword.<br>
<br>
Bruce,<br>
<br>
Did/does this error show up in your meta-virt testing?<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#3=
9;m seeing it now as well. I&#39;ve been working on a few things, so my tes=
ting against oe-core was at an older commit.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">So the change is likely good, but I&#39;m waiting for =
a v2 with Randy&#39;s suggested re-wording.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
<br>
&gt; CXXFLAGS and CFLAGS causing<br>
&gt; compilation for ceph to fail.<br>
&gt; <br>
&gt; Set CXXFLAGS and CFLAGS to resolve the issue.<br>
&gt; <br>
&gt; Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver=
.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0recipes-extended/ceph/<a href=3D"http://ceph_15.2.15.bb" r=
el=3D"noreferrer" target=3D"_blank">ceph_15.2.15.bb</a> | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/recipes-extended/ceph/<a href=3D"http://ceph_15.2.15.bb" =
rel=3D"noreferrer" target=3D"_blank">ceph_15.2.15.bb</a> b/recipes-extended=
/ceph/<a href=3D"http://ceph_15.2.15.bb" rel=3D"noreferrer" target=3D"_blan=
k">ceph_15.2.15.bb</a><br>
&gt; index c72953a..17dbcf3 100644<br>
&gt; --- a/recipes-extended/ceph/<a href=3D"http://ceph_15.2.15.bb" rel=3D"=
noreferrer" target=3D"_blank">ceph_15.2.15.bb</a><br>
&gt; +++ b/recipes-extended/ceph/<a href=3D"http://ceph_15.2.15.bb" rel=3D"=
noreferrer" target=3D"_blank">ceph_15.2.15.bb</a><br>
&gt; @@ -66,6 +66,9 @@ EXTRA_OECMAKE =3D &quot;-DWITH_MANPAGE=3DOFF \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
DWITH_REENTRANT_STRSIGNAL=3DON \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +CXXFLAGS +=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}&quot;<br>
&gt; +CFLAGS +=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}&quot;<br>
<br>
Does ceph need both of the _ARCH and _OPTIONS to be set?<br>
Since the error is at link time, try adding only TOOLCHAIN_OPTIONS<br>
as is done for:<br>
<br>
recipes-core/runx/<a href=3D"http://runx_git.bb" rel=3D"noreferrer" target=
=3D"_blank">runx_git.bb</a><br>
<br>
97:=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;${HOST_CC_ARCH}${TOOLC=
HAIN_OPTIONS} ${CFLAGS}&quot;<br>
<br>
98:=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;${TOOLCHAIN_OPTIONS} =
${HOST_LD_ARCH} ${LDFLAGS}&quot;<br>
<br>
<br>
<br>
<br>
../Randy<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0export STAGING_DIR_HOST<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_configure:prepend () {<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7093): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7093" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7093</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89824093=
/3616765" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/89824093/3616765</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:randy.macleod@win=
driver.com" target=3D"_blank">randy.macleod@windriver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000006c23d05dad40716--

