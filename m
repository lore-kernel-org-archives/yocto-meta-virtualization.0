Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C22FC4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:18:41 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.10679.1648127919738202121
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EH3bVR9y;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id o10so9139346ejd.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LO912urLNZD+KEuG/OHlraNoarHKP8pjWLkTfFhdOh0=;
        b=EH3bVR9yQefbU2zjJiR2OnmpXIUVb0B+17pOjwlbmXil5XZaB8qVYbvEcdf1d32DYW
         0HlSBhepfSWDKAjIi8zWpaGFn+iftw0VQaR02NdTkIObcnzqe97PqOf6wYQhwPkpkK4x
         Lr8LAhfonDWdxoJJUFLRqQADJp+iXjYJt+foo+cx2RZbfUwxPmF5JKB4qeoMTDv8dnAs
         R8xbqmEPPUiYS4XVyd81Ij0mXwgV4/WsJ0ohXT/VVxI42klcF5O1GasQ+Z8aUJ0ciYig
         rrtIS/N2UQHij+epcVizAfUJZdZNOw83+bwAJsuZL7Cy+282k2uvudZ3JzR9/wEMbeHu
         B18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LO912urLNZD+KEuG/OHlraNoarHKP8pjWLkTfFhdOh0=;
        b=zuK6snNRxIgUDMGOnM2KpoMXpv8WN5elwE8XlDkue4ZXi8/kju2wNRDY41CQmOZbfE
         s3x3fU2K7WFjrRg3w96JSFNd1OeQoeX5MxQaZoHmGfKrBl8ssPWbYMXguxnrjgIBQUib
         RFhjw1N7ofNuw9f95IoXC5NWNvCsUBsI973iL5IYV/0O3N+w2wQm0qSeeGfUqkNi+LIf
         OOYCfrzxROCLeHS7humWbVZtSZirhws2RT40tiebBIf+rkuEmBYQVcHJ+5b8+fVgcECf
         Z38J9vtSigvPSSCbO4zxfV9AQqyq55HW1uvRvxD2WeAwOMRJLPs1ypzUkrveF1jK+3vu
         o4Hw==
X-Gm-Message-State: AOAM531w1XPQJNBg7dewvv+Gq6sMZSy8cwTMjsmBJKLEAHgiJBGpJ0P1
	HFw/LGMyUe+DHAibK7ZGIL87mCnhd7WtxuV2u3o=
X-Google-Smtp-Source: 
 ABdhPJw8fh/hmJiHesUnLIO7H1n5/uKZKNpcjtr669i2Xcoqc/Hmp8CnivbwWmJPgAcZyLWokj2utVdboJmGWYYVS2I=
X-Received: by 2002:a17:907:3da5:b0:6e0:ee1:653b with SMTP id
 he37-20020a1709073da500b006e00ee1653bmr5734288ejc.532.1648127918020; Thu, 24
 Mar 2022 06:18:38 -0700 (PDT)
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
 <CADkTA4P-MtN55u3Jh5Q_sDFwcpHEgB_HKB=R-d3Esm-N5AXJRA@mail.gmail.com>
 <6FE2E73D-4BAA-4344-8AD3-A1E70D974483@arm.com>
In-Reply-To: <6FE2E73D-4BAA-4344-8AD3-A1E70D974483@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Mar 2022 09:18:26 -0400
Message-ID: 
 <CADkTA4P+Co4LO=pp3mcEM2SFfYUU7KLGjU+bb4_MgSzoNQz0wg@mail.gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paulo Sherring <pauloasherring@gmail.com>,
 Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000191bb705daf6affd"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:18:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7117

--000000000000191bb705daf6affd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 9:03 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Bruce,
>
> > On 24 Mar 2022, at 13:06, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> >
> >
> > On Thu, Mar 24, 2022 at 4:42 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > Hi,
> >
> > > On 23 Mar 2022, at 22:17, Bruce Ashfield via lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > >
> > >
> > > On Wed, Mar 23, 2022 at 6:30 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:
> > > > Hi Paulo
> > > >
> > > > > On 22 Mar 2022, at 16:52, Paulo Sherring via
> lists.yoctoproject.org <pauloasherring=3Dgmail.com@lists.yoctoproject.org=
>
> wrote:
> > > > >
> > > > > Hello Diego, Bertrand,
> > > > > Just confirmed that by bringing these changes into hardknott, the
> > > > > modules get correctly probed on bootup.
> > > >
> > > > Great thanks for the info.
> > > >
> > > > @Bruce: Maybe it would make sense to backport this as hardknott is
> LTS ?
> > > > If yes, please ping me if you need support to do it.
> > >
> > > hardknott is not LTS, it is about to go EOL.
> > >
> > >
> > > Agreed. I don't like to leave things broken either .. but we really
> shouldn't encourage people to keep using the branches that are going out =
of
> support. If I fix this one, there will be other issues that aren't
> fixed/patched in the future (and potentially security issues) .. so I'm
> leaning towards leaving this not backported.
> >
> > The branch is still supported at the moment and is broken.
> > I do not think it is right to say =E2=80=9Cwe will stop fixing issues a=
 bit
> before the branch is out of support=E2=80=9D as this is equivalent to red=
ucing the
> support time.
> > Out of support is more something which should be works but does not get
> any update or security fixes, here we have something broken while under
> support.
> >
> >
> > Broken is a far too dramatic description of this issue.
> >
> > Also, when talking about support, we are talking about OEcore / Yocto
> Project support. The rest of the layers in the ecosystem do this sort of
> support as best effort. So a gentle reminder that we should all be carefu=
l
> with expectations and the tone of our communications.
> >
>
> Sorry if my tone did not sound right, that was not my intention.
> I just wanted to understand what we should expect and hence what we shoul=
d
> do in stable branches.
>
> >
> > Anyway the fix is simple and the person is unblocked so it will be easy
> for the next one to solve it, so my argumentation is more in general arou=
nd
> what should the end of support date mean for users.
> >
> > I have queued the change, but my reminder about expectations stands.
>
> Thanks.
>
> I think that would be good to be clear on what can be expected in a stabl=
e
> branch after the release for meta-virtualization.
> That could also help me to know what I should consider critical ornate an=
d
> fix in stable releases.
>

Fundamentally, the same criteria that apply to OEcore apply to meta-virt
(bugfixes, CVEs), except perhaps with a less well defined turn around time
if other things are going on in master.  There's more flexibility around
some new features or additions that don't impact existing behaviour, since
the stack of software on top isn't nearly as broad as OEcore's user base.
Generally speaking, those are case-by-case.

It is fine to propose most any fix to be backported, I was just setting
expectations about limitations on the amount of cycles that are typically
available for the released branches. i.e. I don't have runtime's available
for every old release, so I rely on the users of those branches to report
runtime issues after a change is merged.

Bruce



>
> Kind regards
> Bertrand
>
> >
> > Bruce
> >
> >
> >
> > Cheers
> > Bertrand
> >
> > >
> > > Bruce
> > >
> > >
> > > https://wiki.yoctoproject.org/wiki/Releases
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#7112):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7112
> > > Mute This Topic: https://lists.yoctoproject.org/mt/89949013/3619089
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bertrand.marquis@arm.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000191bb705daf6affd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 24, 2022 at 9:03 AM Bertrand Marquis &l=
t;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Br=
uce,<br>
<br>
&gt; On 24 Mar 2022, at 13:06, Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Thu, Mar 24, 2022 at 4:42 AM Bertrand Marquis &lt;<a href=3D"mailto=
:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com</a>&g=
t; wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; &gt; On 23 Mar 2022, at 22:17, Bruce Ashfield via <a href=3D"http://li=
sts.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproje=
ct.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproj=
ect.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<=
br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On Wed, Mar 23, 2022 at 6:30 AM Richard Purdie &lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:<br>
&gt; &gt; &gt; Hi Paulo<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 22 Mar 2022, at 16:52, Paulo Sherring via <a href=3D=
"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.=
yoctoproject.org</a> &lt;pauloasherring=3D<a href=3D"mailto:gmail.com@lists=
.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&g=
t; wrote:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Hello Diego, Bertrand,<br>
&gt; &gt; &gt; &gt; Just confirmed that by bringing these changes into hard=
knott, the<br>
&gt; &gt; &gt; &gt; modules get correctly probed on bootup.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Great thanks for the info.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @Bruce: Maybe it would make sense to backport this as hardkn=
ott is LTS ?<br>
&gt; &gt; &gt; If yes, please ping me if you need support to do it.<br>
&gt; &gt; <br>
&gt; &gt; hardknott is not LTS, it is about to go EOL.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Agreed. I don&#39;t like to leave things broken either .. but we =
really shouldn&#39;t encourage people to keep using the branches that are g=
oing out of support. If I fix this one, there will be other issues that are=
n&#39;t fixed/patched in the future (and potentially security issues) .. so=
 I&#39;m leaning towards leaving this not backported. <br>
&gt; <br>
&gt; The branch is still supported at the moment and is broken.<br>
&gt; I do not think it is right to say =E2=80=9Cwe will stop fixing issues =
a bit before the branch is out of support=E2=80=9D as this is equivalent to=
 reducing the support time.<br>
&gt; Out of support is more something which should be works but does not ge=
t any update or security fixes, here we have something broken while under s=
upport.<br>
&gt; <br>
&gt; <br>
&gt; Broken is a far too dramatic description of this issue. <br>
&gt; <br>
&gt; Also, when talking about support, we are talking about OEcore / Yocto =
Project support. The rest of the layers in the ecosystem do this sort of su=
pport as best effort. So a gentle reminder that we should all be careful wi=
th expectations and the tone of our communications.<br>
&gt; <br>
<br>
Sorry if my tone did not sound right, that was not my intention.<br>
I just wanted to understand what we should expect and hence what we should =
do in stable branches.<br>
<br>
&gt;=C2=A0 <br>
&gt; Anyway the fix is simple and the person is unblocked so it will be eas=
y for the next one to solve it, so my argumentation is more in general arou=
nd what should the end of support date mean for users.<br>
&gt; <br>
&gt; I have queued the change, but my reminder about expectations stands.<b=
r>
<br>
Thanks.<br>
<br>
I think that would be good to be clear on what can be expected in a stable =
branch after the release for meta-virtualization.<br>
That could also help me to know what I should consider critical ornate and =
fix in stable releases.<br></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">Fundamentally, the same criteria th=
at apply to OEcore apply to meta-virt (bugfixes, CVEs), except perhaps with=
 a less well defined turn around time if other things are going on in maste=
r.=C2=A0 There&#39;s more flexibility=C2=A0around some new features or addi=
tions that don&#39;t impact existing behaviour, since the stack of software=
 on top isn&#39;t nearly as broad as OEcore&#39;s user base. Generally spea=
king, those are case-by-case.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">It is fine to propose most any fix to be backported, I was just =
setting expectations about limitations on the amount of cycles that are typ=
ically available for the released branches. i.e. I don&#39;t have runtime&#=
39;s available for every old release, so I rely on the users of those branc=
hes to report runtime issues after a change is merged.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards<br>
Bertrand<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; Cheers<br>
&gt; Bertrand<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Bruce<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Releases" rel=3D"no=
referrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Releases</a>=
<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; <br>
&gt; &gt; Richard<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>
&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#7112): <a href=3D"https://lists.yoctoproject.=
org/g/meta-virtualization/message/7112" rel=3D"noreferrer" target=3D"_blank=
">https://lists.yoctoproject.org/g/meta-virtualization/message/7112</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/899=
49013/3619089" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/89949013/3619089</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.=
yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopr=
oject.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-vir=
tualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bertrand.mar=
quis@arm.com" target=3D"_blank">bertrand.marquis@arm.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000191bb705daf6affd--

