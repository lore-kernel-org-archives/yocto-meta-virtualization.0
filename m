Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67E6C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 12:06:22 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.9978.1648123581445190993
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 05:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzMVvleB;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id bi12so8737576ejb.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7/HTZBG5C10IYaEJQgqWHjWzUKfC7ZlIAg8eaaX+H4=;
        b=mzMVvleBXRhVAH8JTJGhdFFJgx9tJvpw5kXmaqxuc4DynW97nq6wkFAXh1b0AjZp2s
         iuaRBkLBAw0/1r0Zj3iJmA8ZVscuXbXgs+qBO1JiFDU25z00lWzkcbKjBM1nKgB+jskd
         2+mkCDcUck6/U6+fobIhsmwpAm1ZxqTd+6pEkJyRgJPIZgKDcFWxhsvY2PyxiWnBkvSH
         8HUDHhBAfYa6HacxvOseznvB/vtsPvpGpX2Th+njtL0PckAEJVywYsVCOKuKNVur4XW5
         /x/iXYa+EX8tyAYNWenqjEuql/dX/XBs3y271829EXFbwQBbG9d1V5oYQ1vFnPXNDk4O
         F8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7/HTZBG5C10IYaEJQgqWHjWzUKfC7ZlIAg8eaaX+H4=;
        b=NUEclB2Pdssv2OICrWzlKSYbBAhlUvELW+WyHIgvsoFzk9mS543QQyD4fIG6bqz9V2
         ulgJi34UkSm61I8Y9Zkg1AVoBPNNBbhB2HcvoF4tfX42lkTU8jgMdBf3QaWk7YnLqVxA
         MVz3D16u50XSnc4vPtgQPKgL3s9vyPWmNkjyjcC5VqDb+kcuZdZGFYhsdvGYFyRbdwZ5
         UNMI81aeaXb4X9m+Wl+COFV8/mEAxo1vtptYd5ohQFEBS2L+SPb3S53bYC3D0AIPMdQ3
         4/K+DkgoyrdE/C/DwOrPQPfmMfEnp3KdQHtIVyBDVYKCcj6mPLGbuiROMYf/SGjRT0Pb
         S5Tg==
X-Gm-Message-State: AOAM533kRLzbJSZ/8QQkGp0gtAyIkl8+mf3orEO/Y+kBudFFCziEj6XB
	nPEm0ILWKYeiM63FALNGqOqMtMFEihC8lOu1CjI=
X-Google-Smtp-Source: 
 ABdhPJzxyGNvAXRos73O9yTCkwQV44/u/puBAuInntgtnKhs/OeCm80DfNKxHXIKONK4zI9XA+zk9k2D+jc9UMlc5hg=
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr5375123ejg.413.1648123579684; Thu, 24
 Mar 2022 05:06:19 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
 <7ABFA491-0F02-43BD-A187-1EBD36E6DB97@arm.com>
 <7c3e09f6d8b36e7e8573384f4dac48f93f5f40ff.camel@linuxfoundation.org>
 <CADkTA4OWyu3qpbUqtjVCGAmsAaZcMMsitX+R8J_X_tSa3vY01Q@mail.gmail.com>
 <C276A488-48A1-4FB1-9B84-945F91881588@arm.com>
In-Reply-To: <C276A488-48A1-4FB1-9B84-945F91881588@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Mar 2022 08:06:08 -0400
Message-ID: 
 <CADkTA4P-MtN55u3Jh5Q_sDFwcpHEgB_HKB=R-d3Esm-N5AXJRA@mail.gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paulo Sherring <pauloasherring@gmail.com>,
 Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000835a7605daf5acca"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Mar 2022 12:06:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7114

--000000000000835a7605daf5acca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 4:42 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi,
>
> > On 23 Mar 2022, at 22:17, Bruce Ashfield via lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> >
> >
> > On Wed, Mar 23, 2022 at 6:30 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:
> > > Hi Paulo
> > >
> > > > On 22 Mar 2022, at 16:52, Paulo Sherring via lists.yoctoproject.org
> <pauloasherring=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > Hello Diego, Bertrand,
> > > > Just confirmed that by bringing these changes into hardknott, the
> > > > modules get correctly probed on bootup.
> > >
> > > Great thanks for the info.
> > >
> > > @Bruce: Maybe it would make sense to backport this as hardknott is LT=
S
> ?
> > > If yes, please ping me if you need support to do it.
> >
> > hardknott is not LTS, it is about to go EOL.
> >
> >
> > Agreed. I don't like to leave things broken either .. but we really
> shouldn't encourage people to keep using the branches that are going out =
of
> support. If I fix this one, there will be other issues that aren't
> fixed/patched in the future (and potentially security issues) .. so I'm
> leaning towards leaving this not backported.
>
> The branch is still supported at the moment and is broken.
> I do not think it is right to say =E2=80=9Cwe will stop fixing issues a b=
it before
> the branch is out of support=E2=80=9D as this is equivalent to reducing t=
he support
> time.
> Out of support is more something which should be works but does not get
> any update or security fixes, here we have something broken while under
> support.
>
>
Broken is a far too dramatic description of this issue.

Also, when talking about support, we are talking about OEcore / Yocto
Project support. The rest of the layers in the ecosystem do this sort of
support as best effort. So a gentle reminder that we should all be careful
with expectations and the tone of our communications.



> Anyway the fix is simple and the person is unblocked so it will be easy
> for the next one to solve it, so my argumentation is more in general arou=
nd
> what should the end of support date mean for users.
>

I have queued the change, but my reminder about expectations stands.

Bruce



>
> Cheers
> Bertrand
>
> >
> > Bruce
> >
> >
> > https://wiki.yoctoproject.org/wiki/Releases
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7112):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7112
> > Mute This Topic: https://lists.yoctoproject.org/mt/89949013/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bertrand.marquis@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000835a7605daf5acca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 24, 2022 at 4:42 AM Bertrand Marquis &l=
t;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<b=
r>
<br>
&gt; On 23 Mar 2022, at 22:17, Bruce Ashfield via <a href=3D"http://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.or=
g</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.o=
rg" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, Mar 23, 2022 at 6:30 AM Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br>
&gt; On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:<br>
&gt; &gt; Hi Paulo<br>
&gt; &gt; <br>
&gt; &gt; &gt; On 22 Mar 2022, at 16:52, Paulo Sherring via <a href=3D"http=
://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yocto=
project.org</a> &lt;pauloasherring=3D<a href=3D"mailto:gmail.com@lists.yoct=
oproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wr=
ote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hello Diego, Bertrand,<br>
&gt; &gt; &gt; Just confirmed that by bringing these changes into hardknott=
, the<br>
&gt; &gt; &gt; modules get correctly probed on bootup.<br>
&gt; &gt; <br>
&gt; &gt; Great thanks for the info.<br>
&gt; &gt; <br>
&gt; &gt; @Bruce: Maybe it would make sense to backport this as hardknott i=
s LTS ?<br>
&gt; &gt; If yes, please ping me if you need support to do it.<br>
&gt; <br>
&gt; hardknott is not LTS, it is about to go EOL.<br>
&gt; <br>
&gt; <br>
&gt; Agreed. I don&#39;t like to leave things broken either .. but we reall=
y shouldn&#39;t encourage people to keep using the branches that are going =
out of support. If I fix this one, there will be other issues that aren&#39=
;t fixed/patched in the future (and potentially security issues) .. so I&#3=
9;m leaning towards leaving this not backported. <br>
<br>
The branch is still supported at the moment and is broken.<br>
I do not think it is right to say =E2=80=9Cwe will stop fixing issues a bit=
 before the branch is out of support=E2=80=9D as this is equivalent to redu=
cing the support time.<br>
Out of support is more something which should be works but does not get any=
 update or security fixes, here we have something broken while under suppor=
t.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Broken is a far too dramatic description of this issue. </=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">A=
lso, when talking about support, we are talking about OEcore / Yocto Projec=
t support. The rest of the layers in the ecosystem do this sort of support =
as best effort. So a gentle reminder that we should all be careful with exp=
ectations and the tone of our communications.</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Anyway the fix is simple and the person is unblocked so it will be easy for=
 the next one to solve it, so my argumentation is more in general around wh=
at should the end of support date mean for users.<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">I have qu=
eued the change, but my reminder about expectations stands.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Releases" rel=3D"norefer=
rer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Releases</a><br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7112): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7112" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7112</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89949013=
/3619089" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/89949013/3619089</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bertrand.marquis@=
arm.com" target=3D"_blank">bertrand.marquis@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000835a7605daf5acca--

