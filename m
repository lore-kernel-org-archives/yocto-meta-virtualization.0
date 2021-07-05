Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.8099.1625473639009157152
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 01:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vJTfBoDL;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m1so22691277edq.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Jul 2021 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtJkf+r8/OjheUvgjNgXT/dw2hmKxlu1a2jBNsv/oJs=;
        b=vJTfBoDL9U6rbUjrjrSE3zwDwdKdOjwkdmm4lBuoduQaSDAD9mZqzuB4Z2/lYfpFJl
         OQtLLSF7gxGa4xp9iU9BteHshvddaqVqzas/M0I2KqfNC+yk5I4rCRjpsuCKe10yE4ZG
         E9j9bsZlVbecOcRKAkfCl3EI0EjY7V8/6JYoEDLqUalX86pNA+9q8sL2iLTSFzB1twra
         zSLyg1f1vou2tiGw2qBKyn2zaY/7QqHWHKOlh9FRAMJP+bQV+kusqjlfJG7g7KLN4qvC
         9gKOLNrrG4nVVpajQ3Znn8m5Dq1iPnO2Qy9u8it+w6RR+tmDDy6dGbwrbvbSj2rzg0t4
         PGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtJkf+r8/OjheUvgjNgXT/dw2hmKxlu1a2jBNsv/oJs=;
        b=SASoODctUqVUIOPN2FlHVw47zc+o8rzSv26yxquj5VCd5HnSggvDCpzSW5gxtpyQkd
         ZF49xATrUYBmuMCN04/WiWddizbwsWmrJYtaF8cO/hG7TMr2yDeoUW1q0eOWkrezJnvm
         m048vGMipyOxagR+y1l4zSIZy/B8piUs9hQHBDr1lSfG6bEubc9alVf4/X/w9DSiAR/X
         5gUs6huTQYKIVncy8k73qtu4jMRRFP8tzT+0Os3v+gIKWnz1Q+7dE845h7yenTx9oqs4
         fJLZtsIsZsEWKmRMY3fBtn1AerFCodDMNjWMti/9Lz3aU5eOI6VqprjzV/rY8UGkTrGS
         J7CQ==
X-Gm-Message-State: AOAM533gQLGXwWDlMXenmIx5Bb2FhYSWwzSJFJsmYxuMH0GrK43eCuEA
	Y/zCJP5OlmQIH2Q0xjmmYbbAY1BayU3f4dzYVEc=
X-Google-Smtp-Source: ABdhPJxW7Dgulj2l9u7jc15WXN7sghHbackDc5IkwcMc6O77Y+M6oa+gkN/N/ephTTTnbfGwOHsxpyvoNqYQm7p/Hlg=
X-Received: by 2002:a05:6402:cb1:: with SMTP id cn17mr14591782edb.76.1625473637596;
 Mon, 05 Jul 2021 01:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210621054046.15518-1-mingli.yu@windriver.com>
 <CADkTA4ONqYOzDL2qJZDR0Wt3o6U+VZAzPEUew9sVX9wz+XtXWg@mail.gmail.com> <71ba6591-ee91-45e7-e145-8567204bcdc5@windriver.com>
In-Reply-To: <71ba6591-ee91-45e7-e145-8567204bcdc5@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 5 Jul 2021 01:27:07 -0700
Message-ID: <CA+chaQc3jrrYerGhv8fEe7QjjqXbtVs02pDwanpWHTAxZWdEnA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] conmon: switch to main branch
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c2c32705c65c129f"

--000000000000c2c32705c65c129f
Content-Type: text/plain; charset="UTF-8"

Yes, I see it in:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=950b24b2d5fe454c9d3a9eab5691753067e4b7d0

On Mon, Jul 5, 2021 at 1:25 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

>
>
> On 6/21/21 8:58 PM, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Thanks for the change.
> >
> > I had done the same myself over the weekend, but was still doing a few
> tests.
> >
> > I pushed the change this morning, and have also cherry picked it to
> > older releases.
>
> Thanks Bruce!
> BTW is this change merged?
>
> Thanks,
>
> >
> > Bruce
> >
> > On Mon, Jun 21, 2021 at 1:41 AM Yu, Mingli <mingli.yu@windriver.com>
> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Switch to main branch to fix do_fetch error.
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   recipes-containers/conmon/conmon_git.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-containers/conmon/conmon_git.bb
> b/recipes-containers/conmon/conmon_git.bb
> >> index 74f5bfa..974eb07 100644
> >> --- a/recipes-containers/conmon/conmon_git.bb
> >> +++ b/recipes-containers/conmon/conmon_git.bb
> >> @@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 go-md2man-native"
> >>
> >>   SRCREV = "31614525ebc5fd9668a6e084b5638d71b903bf6d"
> >>   SRC_URI = "\
> >> -    git://github.com/containers/conmon.git \
> >> +    git://github.com/containers/conmon.git;branch=main \
> >>   "
> >>
> >>   PV = "2.0.28+git${SRCPV}"
> >> --
> >> 2.29.2
> >>
> >>
> >>
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
> 
>
>

--000000000000c2c32705c65c129f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, I see it in:</div><a href=3D"https://git.yoctopr=
oject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=3D950b24b2d5fe454c9d=
3a9eab5691753067e4b7d0">https://git.yoctoproject.org/cgit/cgit.cgi/meta-vir=
tualization/commit/?id=3D950b24b2d5fe454c9d3a9eab5691753067e4b7d0</a><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Jul 5, 2021 at 1:25 AM Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@win=
driver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
<br>
On 6/21/21 8:58 PM, Bruce Ashfield wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt; <br>
&gt; Thanks for the change.<br>
&gt; <br>
&gt; I had done the same myself over the weekend, but was still doing a fe=
w tests.<br>
&gt; <br>
&gt; I pushed the change this morning, and have also cherry picked it to<b=
r>
&gt; older releases.<br>
<br>
Thanks Bruce!<br>
BTW is this change merged?<br>
<br>
Thanks,<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; On Mon, Jun 21, 2021 at 1:41 AM Yu, Mingli &lt;<a href=3D"mailto:ming=
li.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Switch to main branch to fix do_fetch error.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windrive=
r.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0recipes-containers/conmon/<a href=3D"http://conmon_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">conmon_git.bb</a> | 2 +-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/conmon/<a href=3D"http://conmon_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">conmon_git.bb</a> b/recipes-con=
tainers/conmon/<a href=3D"http://conmon_git.bb" rel=3D"noreferrer" target=
=3D"_blank">conmon_git.bb</a><br>
&gt;&gt; index 74f5bfa..974eb07 100644<br>
&gt;&gt; --- a/recipes-containers/conmon/<a href=3D"http://conmon_git.bb" =
rel=3D"noreferrer" target=3D"_blank">conmon_git.bb</a><br>
&gt;&gt; +++ b/recipes-containers/conmon/<a href=3D"http://conmon_git.bb" =
rel=3D"noreferrer" target=3D"_blank">conmon_git.bb</a><br>
&gt;&gt; @@ -8,7 +8,7 @@ DEPENDS =3D &quot;glib-2.0 go-md2man-native&quot;=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRCREV =3D &quot;31614525ebc5fd9668a6e084b5638d71b903=
bf6d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;\<br>
&gt;&gt; -=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/conm=
on.git" rel=3D"noreferrer" target=3D"_blank">github.com/containers/conmon.g=
it</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/conm=
on.git;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">github.com/conta=
iners/conmon.git;branch=3Dmain</a> \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0PV =3D &quot;2.0.28+git${SRCPV}&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.29.2<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c2c32705c65c129f--
