Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.360.1624568513033684606
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 14:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vFT+FDSH;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id bg14so11565465ejb.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jun 2021 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jizEO8Bhm6hslE/tKfbo99S2hT/nSzMkMPp7yo4k608=;
        b=vFT+FDSHaYXQyCrXJ6xhhRyG32cFD87Knw/o9AcFTqvPzpRqekkEVfm7FSyXhXYyeC
         QFvmutAvmUD/irV/0sJnrURA83livSLdbPQn4loG5dj0gfmkvHbDGpElwvvDogY5kkWv
         smoNm4jzxpazNQ/uzHMTCoZKNdBgr7MFy4Su0u52wkmPLT7RFS3v1sd1BCnDkGs3+T8M
         9pKItCKt5A2UqB2Mst0t+UQixvWYe7w/vSjLrhwKcK40hMxiwD5y8IFHySJ/pX9o+CYc
         XSZeL4/4o7WOHX83OemGJOwF5viq6Qwab0IL4JoH0GB+LYWLi21o8KpBl/1OaIh1pu8u
         E8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jizEO8Bhm6hslE/tKfbo99S2hT/nSzMkMPp7yo4k608=;
        b=Vm24A/vBbttyFESO/r6fWzWcL/xbGWWpn0oS1pU8l1YF+kXsjcsZQoxE9g2uEhBDfm
         /OWhGlA+8DzOfIQJsMQZewy1KTNh/Zfn+854w6bPGYwaJIpt2GSIvEbn7Fd7OuFXFamQ
         99tOPzJtO+7Hiq8t/nQw7TcMWFCsuLcB5sbf/MugC+8mNzYV4WibVwtUgQsoPKAhQpa5
         QOjmP+UN6JAoswb0W5b3Uc3mw7W9NO3JD6P2nHvgLw5QAYYi0C13WQecUJitFKum5dOq
         e7QjXOeWmxYDN/HTKr7DGa2csluVjuhVzXSFiDR5FW5zDnZ7sKMKmU2Gx8Mn77hP1dwJ
         s1cA==
X-Gm-Message-State: AOAM5300/jvZFz0lMAGjO69ErItsSIkf5PaQrajsojowCvyYBHlt3fwM
	7mk+F2mWgvAmDV4No804GGWq9UbwQlRHMXlePuI=
X-Google-Smtp-Source: ABdhPJwqNO2BF5RHJSHMKO46b/djiD4zv0OxwmdxZVTGjlW8DEw1UjaAYbNs6Cp6OE26XU5jZrWVuzhZoTqytJHLPa8=
X-Received: by 2002:a17:906:470c:: with SMTP id y12mr7431330ejq.54.1624568511478;
 Thu, 24 Jun 2021 14:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
In-Reply-To: <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 24 Jun 2021 14:01:40 -0700
Message-ID: <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000000a3f0605c5895529"

--0000000000000a3f0605c5895529
Content-Type: text/plain; charset="UTF-8"

This change is correct, libseccomp still requires seccomp in
DISTRO_FEATURES, so anything depending on it should have the same
restriction.

seccomp is now in default DISTRO_FEATURES, but not through BACKFILL
feature, so many existing DISTROs didn't get it automatically added and
requiring it is the right way to automatically skip such recipes.

On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> What branch are you working with ?
>
> Now that seccomp is in core, we no longer have those restrictions, so
> I assume this is on an older branch ?
>
> Bruce
>
> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
> >
> > The libseccomp package is only available if seccomp is in
> DISTRO_FEATURES.
> >
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  recipes-containers/podman/podman_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> > index 9dcb21c..351f38b 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container engine
> for developing, \
> >      `alias docker=podman`. \
> >      "
> >
> > +inherit features_check
> > +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> > +
> >  DEPENDS = " \
> >      go-metalinter-native \
> >      go-md2man-native \
> > --
> > 2.17.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>
>

--0000000000000a3f0605c5895529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This change is correct, libseccomp still requires seccomp =
in DISTRO_FEATURES, so anything depending on it should have the same restri=
ction.<div><br></div><div>seccomp is now in default DISTRO_FEATURES, but no=
t through BACKFILL feature, so many existing DISTROs didn&#39;t get it auto=
matically added and requiring it is the right way to automatically skip suc=
h recipes.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">What branch a=
re you working with ?<br>
<br>
Now that seccomp is in core, we no longer have those restrictions, so<br>
I assume this is on an older branch ?<br>
<br>
Bruce<br>
<br>
On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro &lt;<a href=3D"mailto:diego.s=
ueiro@arm.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The libseccomp package is only available if seccomp is in DISTRO_FEAT=
URES.<br>
&gt;<br>
&gt; Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.co=
m" target=3D"_blank">diego.sueiro@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.b=
b" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-contain=
ers/podman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">podman_git.bb</a><br>
&gt; index 9dcb21c..351f38b 100644<br>
&gt; --- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; +++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; @@ -6,6 +6,9 @@ DESCRIPTION =3D &quot;Podman is a daemonless containe=
r engine for developing, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 `alias docker=3Dpodman`. \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; +inherit features_check<br>
&gt; +REQUIRED_DISTRO_FEATURES ?=3D &quot;seccomp&quot;<br>
&gt; +<br>
&gt;=C2=A0 DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 go-metalinter-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 go-md2man-native \<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000000a3f0605c5895529--
