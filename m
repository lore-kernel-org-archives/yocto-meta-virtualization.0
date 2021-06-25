Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.7121.1624625334749789331
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 05:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=poYfxa/t;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id i5so13277026eds.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Jun 2021 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XhNarJttCl1WhTD3uv/fDdtoFNuHRkIA2JWDLsXb/6w=;
        b=poYfxa/tws7u9pMTOWOB5u5IDrjCVsRsJQFYsWqlDLkymKkIRKQcU6G36Pr7iT/KKn
         i5HJZRH1ruxq1qTcbWgOivDNhL7VM7K40jmpiNgJyRRkRJnmJMNyuP8I9ItnQLxUudIG
         VS1cClI4spwg6628rpMDTDwoFr6+weQXiukyPmOynBvOkl1MFYgEnLMi2c+3bYNGw8tT
         pK0EaCF2iShErG29hxIpF3ANulYNSzGR/w1FqPOwtDPn7cClQ1SCWBq2/u9t5fKOl4Z2
         fbS/tPykrMw7Wlv2I7nxgfwXsmjI4+mc58+snG50jhZlrxRgzm6aM8ppfS72qc6kJdYs
         fUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XhNarJttCl1WhTD3uv/fDdtoFNuHRkIA2JWDLsXb/6w=;
        b=Z9lUPLVP5182PdCW2io8rckxCSi+ZASH5ybB3WhvKCqzcUBJOFZ1Xq1AVTDinaN/UI
         yhIFXBizhDC+5Wx+yVW824X/cQ1PTVwhnrPiC7824R3xh8O6bcZaWtVlBe/nphFUExx9
         Zw2ZGwtkRILNlSsn4wMG2dDEopqgj/bSrs87xCxkFPU341vnhpK3nB5bxtV9l/cKdlvL
         QAP/6lImNlrMyKhKDOBQ2pe+HWILBctqfEPKYftLSeo4ogMCsJGlf1ELdvLAyhC8R9ym
         SJaYB4bDw3c1HWuVvcQVQeCGkn4BfgAgkOIbQ2CjdsrFBQD3YJ1mbKDPfij3xUSmDigE
         kTDg==
X-Gm-Message-State: AOAM530gfy6/R09RRLEQVm5S5dVG3YeWdU80+2EMMaMYQ1A090B9LHPp
	nxjDaqAvMdkjiynC3rV0sr7gu5f7o8GWq661ZS0=
X-Google-Smtp-Source: ABdhPJxc/yq0H+N+IEeFBcmqXIg0XBCWKBOZiU9bDDUz6eDgLxWUJ+e1pFA5RU4jIHnKn9kapFwRez9uB6K1lQBVnwc=
X-Received: by 2002:a05:6402:d06:: with SMTP id eb6mr14081536edb.337.1624625333300;
 Fri, 25 Jun 2021 05:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
In-Reply-To: <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 25 Jun 2021 14:48:42 +0200
Message-ID: <CA+chaQeZG57ZxMd+wOc4pUfNJLF61ZK8tOkKPmN6Eph9iiDYHg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000e2775f05c5968f05"

--000000000000e2775f05c5968f05
Content-Type: text/plain; charset="UTF-8"

AB would use the new default DISTRO_FEATURES which already contain seccomp.

On Fri, Jun 25, 2021 at 2:46 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Fri, Jun 25, 2021 at 4:11 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> >
> > >-----Original Message-----
> > >From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >Sent: 25 June 2021 03:49
> > >To: Martin Jansa <martin.jansa@gmail.com>
> > >Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-
> > >virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> > >Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as
> > >REQUIRED_DISTRO_FEATURES
> > >
> > >On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.com>
> > >wrote:
> > >>
> > >> This change is correct, libseccomp still requires seccomp in
> > >DISTRO_FEATURES, so anything depending on it should have the same
> > >restriction.
> > >>
> > >
> > >Right, I understand how/why it works like this .. but it is super
> clunky when we
> > >can't just depend on something that is now in core, without needing to
> > >sprinkle distro checks everywhere.
> > >
> > >As the list of recipes gets larger with that check, it really isn't an
> optional distro
> > >feature for using meta virt at all, and it would be nice if we could
> just do the
> > >check once and be done with it.
> >
> > Just a side note that these patches fix issues with yocto-check-layer.
>
> I've disagreed with check-layer before (and we've changed how it works)
>
> That being said, the layer is checked on the AB, and Richard hasn't
> reported any issues. So clearly there's something wrong with the AB
> test or with something else.
>
> Bruce
>
> >
> > Diego
> >
> > >
> > >Bruce
> > >
> > >> seccomp is now in default DISTRO_FEATURES, but not through BACKFILL
> > >feature, so many existing DISTROs didn't get it automatically added and
> > >requiring it is the right way to automatically skip such recipes.
> > >>
> > >> On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield
> > ><bruce.ashfield@gmail.com> wrote:
> > >>>
> > >>> What branch are you working with ?
> > >>>
> > >>> Now that seccomp is in core, we no longer have those restrictions, so
> > >>> I assume this is on an older branch ?
> > >>>
> > >>> Bruce
> > >>>
> > >>> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com>
> > >wrote:
> > >>> >
> > >>> > The libseccomp package is only available if seccomp is in
> > >DISTRO_FEATURES.
> > >>> >
> > >>> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > >>> > ---
> > >>> >  recipes-containers/podman/podman_git.bb | 3 +++
> > >>> >  1 file changed, 3 insertions(+)
> > >>> >
> > >>> > diff --git a/recipes-containers/podman/podman_git.bb
> > >>> > b/recipes-containers/podman/podman_git.bb
> > >>> > index 9dcb21c..351f38b 100644
> > >>> > --- a/recipes-containers/podman/podman_git.bb
> > >>> > +++ b/recipes-containers/podman/podman_git.bb
> > >>> > @@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container
> > >engine for developing, \
> > >>> >      `alias docker=podman`. \
> > >>> >      "
> > >>> >
> > >>> > +inherit features_check
> > >>> > +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> > >>> > +
> > >>> >  DEPENDS = " \
> > >>> >      go-metalinter-native \
> > >>> >      go-md2man-native \
> > >>> > --
> > >>> > 2.17.1
> > >>> >
> > >>> >
> > >>> >
> > >>> >
> > >>>
> > >>>
> > >>> --
> > >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> > >>> thee at its end
> > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > >>>
> > >>> 
> > >>>
> > >
> > >
> > >--
> > >- Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at
> > >its end
> > >- "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000e2775f05c5968f05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">AB would use the new default DISTRO_FEATURES which already=
 contain seccomp.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Jun 25, 2021 at 2:46 PM Bruce Ashfield &lt;<a href=
=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jun 2=
5, 2021 at 4:11 AM Diego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@arm.com"=
 target=3D"_blank">Diego.Sueiro@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt;-----Original Message-----<br>
&gt; &gt;From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt;Sent: 25 June 2021 03:49<br>
&gt; &gt;To: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; &gt;Cc: Diego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@arm.com" targ=
et=3D"_blank">Diego.Sueiro@arm.com</a>&gt;; meta-<br>
&gt; &gt;<a href=3D"mailto:virtualization@lists.yoctoproject.org" target=
=3D"_blank">virtualization@lists.yoctoproject.org</a>; nd &lt;<a href=3D"m=
ailto:nd@arm.com" target=3D"_blank">nd@arm.com</a>&gt;<br>
&gt; &gt;Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp=
 as<br>
&gt; &gt;REQUIRED_DISTRO_FEATURES<br>
&gt; &gt;<br>
&gt; &gt;On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<=
br>
&gt; &gt;wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This change is correct, libseccomp still requires seccomp in=
<br>
&gt; &gt;DISTRO_FEATURES, so anything depending on it should have the same=
<br>
&gt; &gt;restriction.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;Right, I understand how/why it works like this .. but it is super=
 clunky when we<br>
&gt; &gt;can&#39;t just depend on something that is now in core, without n=
eeding to<br>
&gt; &gt;sprinkle distro checks everywhere.<br>
&gt; &gt;<br>
&gt; &gt;As the list of recipes gets larger with that check, it really isn=
&#39;t an optional distro<br>
&gt; &gt;feature for using meta virt at all, and it would be nice if we co=
uld just do the<br>
&gt; &gt;check once and be done with it.<br>
&gt;<br>
&gt; Just a side note that these patches fix issues with yocto-check-layer=
.<br>
<br>
I&#39;ve disagreed with check-layer before (and we&#39;ve changed how it w=
orks)<br>
<br>
That being said, the layer is checked on the AB, and Richard hasn&#39;t<br=
>
reported any issues. So clearly there&#39;s something wrong with the AB<br=
>
test or with something else.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Diego<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;Bruce<br>
&gt; &gt;<br>
&gt; &gt;&gt; seccomp is now in default DISTRO_FEATURES, but not through B=
ACKFILL<br>
&gt; &gt;feature, so many existing DISTROs didn&#39;t get it automatically=
 added and<br>
&gt; &gt;requiring it is the right way to automatically skip such recipes.=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield<br>
&gt; &gt;&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; What branch are you working with ?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Now that seccomp is in core, we no longer have those res=
trictions, so<br>
&gt; &gt;&gt;&gt; I assume this is on an older branch ?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Bruce<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro &lt;<a href=
=
=3D"mailto:diego.sueiro@arm.com" target=3D"_blank">diego.sueiro@arm.com</a=
>&gt;<br>
&gt; &gt;wrote:<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; The libseccomp package is only available if seccomp=
 is in<br>
&gt; &gt;DISTRO_FEATURES.<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:d=
iego.sueiro@arm.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt;<br>
&gt; &gt;&gt;&gt; &gt; ---<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 recipes-containers/podman/<a href=3D"http://p=
odman_git.bb" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> | 3 ++=
+<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; diff --git a/recipes-containers/podman/<a href=3D"h=
ttp://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a>=
<br>
&gt; &gt;&gt;&gt; &gt; b/recipes-containers/podman/<a href=3D"http://podma=
n_git.bb" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; &gt;&gt;&gt; &gt; index 9dcb21c..351f38b 100644<br>
&gt; &gt;&gt;&gt; &gt; --- a/recipes-containers/podman/<a href=3D"http://p=
odman_git.bb" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; &gt;&gt;&gt; &gt; +++ b/recipes-containers/podman/<a href=3D"http://p=
odman_git.bb" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; &gt;&gt;&gt; &gt; @@ -6,6 +6,9 @@ DESCRIPTION =3D &quot;Podman is a d=
aemonless container<br>
&gt; &gt;engine for developing, \<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 `alias docker=3Dpodman`. \<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; +inherit features_check<br>
&gt; &gt;&gt;&gt; &gt; +REQUIRED_DISTRO_FEATURES ?=3D &quot;seccomp&quot;<=
br>
&gt; &gt;&gt;&gt; &gt; +<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 DEPENDS =3D &quot; \<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 go-metalinter-native \<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 go-md2man-native \<br>
&gt; &gt;&gt;&gt; &gt; --<br>
&gt; &gt;&gt;&gt; &gt; 2.17.1<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and =
madness await<br>
&gt; &gt;&gt;&gt; thee at its end<br>
&gt; &gt;&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek I=
I<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;--<br>
&gt; &gt;- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at<br>
&gt; &gt;its end<br>
&gt; &gt;- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000e2775f05c5968f05--
