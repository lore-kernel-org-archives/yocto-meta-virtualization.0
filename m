Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1057DCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 03:39:31 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.3869.1757389161365693699
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 20:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCkt79vo;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32b7d165dc6so4636315a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 20:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757389161; x=1757993961; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gDCXQVPt/NFmG8eS+IQVHlF3CvsbcC8HoHwMpYSINGw=;
        b=jCkt79voYaNSIAhXNsL7Pa8YHYI0Dwuhd4LPUv8Y8i3NKyZff5GnTJQ0dP8xOfG+HS
         qk6izQxjgWhB+kAt6LvRGJSWaArMR4CCbAz2rgOx7nMX+n9DqiiUzpJhXirdp/9xjoMi
         1MprYiboMU4OR5gBPgTfLmy1bKQ/oY0uNG36AyhLQUt21EEHfnb5znrRgcnZQ3xX/C9s
         5cj4EhIhpNbZMGvSwT2ezBs93+3GALqGrX8gF4eFZQ+tNGLamoGrJYKQTm1wAsAEeVbq
         UgywoWASqK1tJYltY8/0Ytp0/sYNwtacwLyW39QMi0JF7XE7CXIwywGNsGsu19xYPkyG
         kHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757389161; x=1757993961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDCXQVPt/NFmG8eS+IQVHlF3CvsbcC8HoHwMpYSINGw=;
        b=enBemT6oLWBc3jewrvori17YfHeLUobxCDkCmIDczJECbGz0X1mm3yNEwwHKWvqOsv
         +cbxAS7Q0TfoeDPFXW5te9MDG5k8riaMx3nxJLObaHLU+1E/wprLXmxW+dfGKnthMv9Q
         m+S5IzsDlAuQcVa8KPABuodcPG0g4ZD0u1rrXF7lnlEuFM8o/5+y/Sw+jJ2t0AGBrO6c
         WH8RceL2yuh5Tn0AbM94zdKA0LHGzdFiMwlj+X5kDStgboaeh2RHfJ/6ieOfmHZj1hal
         mD4aex5BmLgMwG8Q46bnmctI8+AVyJJ5QRpIpOEf+ZCCjbqvOd/rxskcFOA5CEQEJR31
         OGBg==
X-Forwarded-Encrypted: i=1; AJvYcCUgHJj/Hou+V5ZuBeIUrZDlTgRqVwUl4DwQuEF4W9GuBI7KZF0OGaeNHO4tGankXNEAAhQAuKFZ2FmZBospDOtXIFpB@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz5KPdYWmBfFDH3JS/vxYRf13zw/vQWTOuEEPlFGoo62M4FmZ7U
	o5mYwlotAFtJrHGPEfZaLXKFdSnSEnLyHb+Bl7qKHwaVNYrC6IOQlWni5wC7UEECkjrwxGTGTKV
	Til1s2iWcjLvGxmgYNJX4ry+mSm0pV4w=
X-Gm-Gg: ASbGncuyrCb/A38mmrqvcZIBl2n8dIyRpoYsv5SHMkdJi9Q8smmbCMtOKhu798ujsZI
	INgUJi/I9itHeOtIQVbdl+nwI9FrSxHVnNNfDb03rpLY74MTdtlOCQrNr8r5VHU2GT53MppA4t+
	UjI76AeyeHerjY1rD6q1+8m50XDiNHUpZpqgs04uDpciijqyB4HZJrp1MH2NXGRQloQLAqWm67W
	EYs7WDPwPiFLKRpnzMch7Bt8eiExZCOZeJKH/5gkRyHbVllPA==
X-Google-Smtp-Source: AGHT+IERKojJedwy7Kk4+7VjqfJY1pLhT7FdAdSKNMATgQWaS1S7hIYfHTKigQj2Weauk7JI1GeJVFcjPXW6nfJ53yo=
X-Received: by 2002:a17:90b:1dc1:b0:32b:5c13:868d with SMTP id
 98e67ed59e1d1-32d43ef6d63mr12674939a91.1.1757389160587; Mon, 08 Sep 2025
 20:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250907105926.1650992-1-pkj@axis.com> <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
 <CADkTA4NKwaetHMUvbRian4m1Po1CYTXb7V+avOW1Fwj-RWLnsw@mail.gmail.com>
 <aL6C3y52Dg1Rmwxa@nuoska> <CADkTA4OVOM-GXK1+asL1gFgk4CJ+LVoKWnHYdLjafzpgkrks=A@mail.gmail.com>
 <AS8PR02MB10201FC339C0BD26B42BF2720EF0CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
 <CADkTA4Pd4scXowowzGVrUL-sH6MXvUus8N2Fru8L3dWJnZ8bkA@mail.gmail.com> <AS8PR02MB10201F2835AE22CCF6F839B2EEF0CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB10201F2835AE22CCF6F839B2EEF0CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Sep 2025 23:39:09 -0400
X-Gm-Features: Ac12FXywzrkP6rapXOF4FyZ4KL6_I8WbOyoShIRWptmgjToDK3BUfckKs1T9bBo
Message-ID: <CADkTA4P51iMo_sm15rNXeVFRoSEL9=D567qqEYtD9BZ71mP-HA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v" from PV
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000a62677063e560c85"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Sep 2025 03:39:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9387

--000000000000a62677063e560c85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

:)

I also get what you are looking for.

I'll get through my M3 package updates and put some extra thought into this=
.

Bruce

On Mon, Sep 8, 2025 at 11:45=E2=80=AFAM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> =E2=80=9CSorry, the leading v was a mistake.=E2=80=9D But seriously, I ge=
t what you are
> saying. Keeping the leading v is of course also a form of consistency. Ev=
en
> though I personally would prefer the consistency in what is being generat=
ed
> rather than what has always been.
>
>
>
> //Peter
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* den 8 september 2025 17:25
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* Mikko Rapeli <mikko.rapeli@linaro.org>;
> meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH] containerd: Remove leading
> "v" from PV
>
>
>
>
>
>
>
> On Mon, Sep 8, 2025 at 11:15=E2=80=AFAM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> Well, from my point of view, the recipes in meta-virtualization that set =
PV
> =3D "v=E2=80=A6" differs from all other recipes in Poky, OpenEmbedded, et=
c where no
> recipes set a PV in that way, but rather all of them set PV to only the
> numeric version (possibly followed by +git) even if the Git tag in many
> cases contains a leading v. Typically this is done by setting the version
> in the recipe name, but even when PV is set explicitly, it is done
> without the leading v.
>
>
>
> Now, the problem for me is that I want consistency, and since all other
> packages that are listed in our SBOM have versions without a leading v, I
> of course want this to apply to the containerd package as well. This is
> of course easily fixed via a bbappend (which is what we are currently
> doing). The drawback is that since the containerd recipe file is not
> versioned, I cannot have a versioned bbappend and thus I will not get a
> build failure when the recipe is updated to a new version, and we risk
> having PV set to something that does not match SRCREV. :(
>
>
>
>
>
> And what would you say to the users that want and expect the leading  "v"=
,
> since it has always been there ?
>
>
>
> Bruce
>
>
>
>
>
> //Peter
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* den 8 september 2025 14:52
> *To:* Mikko Rapeli <mikko.rapeli@linaro.org>
> *Cc:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>;
> meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH] containerd: Remove leading
> "v" from PV
>
>
>
>
>
>
>
> On Mon, Sep 8, 2025 at 3:16=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.=
org>
> wrote:
>
> Hi,
>
> On Sun, Sep 07, 2025 at 04:19:17PM -0400, Bruce Ashfield via
> lists.yoctoproject.org wrote:
> > On Sun, Sep 7, 2025 at 4:17=E2=80=AFPM Bruce Ashfield <bruce.ashfield@g=
mail.com>
> > wrote:
> > > On Sun, Sep 7, 2025 at 6:59=E2=80=AFAM Peter Kjellerstedt via
> > > lists.yoctoproject.org <peter.kjellerstedt=3D
> axis.com@lists.yoctoproject.org>
> > > wrote:
> > >
> > >> The leading "v" in the version otherwise makes its way into, e.g., t=
he
> > >> SBOM.
> > >>
> > >> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > >> ---
> > >>
> > >> There are another 30 recipes in meta-virtualization that have a
> leading
> > >> "v" in their versions, but this is the only one of them that we use.
> > >> I can send patches for the others as well if you want.
> > >>
> > >
> > > No thanks, to any of them.
> > >
> > > The "v" isn't by mistake. I don't see any reason to remove it.
> > >
> >
> > What I mean by this, is that someone needs to tell me why SBOM
> > is broken enough that it can't handle the "v", and what problems it
> > causes in the SBOM.
>
> At least CVE checking tooling can compare PV against version numbers
> outside of yocto build environment which are often without
> "v" prefix used by several projects in git tags. Same for the SW versions
> reported by the tools in logs and/or command line.
>
> I think the tools can handle "v" but different ways of reporting version
> numbers break usecases if "v" is not used in all contexts like in CVE
> reporting.
>
> For example Debian doesn't report containerd versions with leading "v".
>
> That's along the lines of what I thought. (I mean, in the end I doesn't
>
> matter how other distros and build systems have their versions, that
>
> is their choice and why we have the CVE version variable).
>
>
>
> If someone sends me a specific example of breakage (a tool and output),
>
> then I'd definitely be interested in seeing that. So that I can follow up
>
> on it in a bit more detail.
>
>
>
> The policy I have, and have always had (when possible, mistakes
>
> happen) is that PV matches the tag format of the repository. So in
>
> most of the projects that means "v". There's other tooling and processes
>
> that are looking to do that matching and have been around for a while.
>
>
>
> As long as the version doesn't obviously break semver, I've always
>
> just left it alone (and all the sever bits I've suffered say that the
>
> decorations don't make it incompatible..
>
>
>
> Fundamentally I don't worry about merging cosmetic changes, and
>
> when potentially new tools come along and ask the input formats
>
> and source to be changed, that's a problem for me .. since compatibility
>
> is nice, but so is consistency and backwards compatibility.
>
>
>
> Thanks for the follow up. Definitely helpful.
>
>
>
> Bruce
>
>
>
>
> Cheers,
>
> -Mikko
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a62677063e560c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">:)<br><br>I also get what you are looking for.<br><br>I&#39;l=
l get through my M3 package updates and put some extra thought into this.<b=
r><br>Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 8, 2025 at 11:45=E2=80=
=AFAM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com"=
>peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div class=3D"msg1120532754325193188">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1120532754325193188WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">=E2=80=9CSorry, the leading v=
 was a mistake.=E2=80=9D But seriously, I get what you are saying. Keeping =
the leading v is of course also
 a form of consistency. Even though I personally would prefer the consisten=
cy in what is being generated rather than what has always been.<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)"><u></u>=C2=A0<u></u></span></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;
<br>
<b>Sent:</b> den 8 september 2025 17:25<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" targ=
et=3D"_blank">mikko.rapeli@linaro.org</a>&gt;; <a href=3D"mailto:meta-virtu=
alization@lists.yoctoproject.org" target=3D"_blank">meta-virtualization@lis=
ts.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] containerd: Remove leadin=
g &quot;v&quot; from PV<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Sep 8, 2025 at 11:15<span style=3D"font-fami=
ly:Arial,sans-serif">=E2=80=AF</span>AM Peter Kjellerstedt &lt;<a href=3D"m=
ailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axi=
s.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">Well, from my point of view, =
the recipes in meta-virtualization that set
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;co=
lor:rgb(148,54,52)">PV =3D &quot;v=E2=80=A6&quot;</span><span lang=3D"EN-US=
" style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(148,54,5=
2)"> differs from all other recipes in Poky, OpenEmbedded, etc where
 no recipes set a </span><span lang=3D"EN-US" style=3D"font-size:11pt;font-=
family:Consolas;color:rgb(148,54,52)">PV</span><span lang=3D"EN-US" style=
=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(148,54,52)"> in=
 that way, but rather all of them set PV to only the
 numeric version (possibly followed by </span><span lang=3D"EN-US" style=3D=
"font-size:11pt;font-family:Consolas;color:rgb(148,54,52)">+git</span><span=
 lang=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif;colo=
r:rgb(148,54,52)">) even if the Git tag in many
 cases contains a leading v. Typically this is done by setting the version =
in the recipe name, but even when
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;co=
lor:rgb(148,54,52)">PV</span><span lang=3D"EN-US" style=3D"font-size:11pt;f=
ont-family:Calibri,sans-serif;color:rgb(148,54,52)"> is set explicitly, it =
is done without the leading v.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">=C2=A0</span><u></u><u></u></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">Now, the problem for me is th=
at I want consistency, and since all other packages that
 are listed in our SBOM have versions without a leading v, I of course want=
 this to apply to the
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;co=
lor:rgb(148,54,52)">containerd</span><span lang=3D"EN-US" style=3D"font-siz=
e:11pt;font-family:Calibri,sans-serif;color:rgb(148,54,52)"> package as wel=
l. This is of course easily fixed via a bbappend
 (which is what we are currently doing). The drawback is that since the </s=
pan><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;color=
:rgb(148,54,52)">containerd</span><span lang=3D"EN-US" style=3D"font-size:1=
1pt;font-family:Calibri,sans-serif;color:rgb(148,54,52)">
 recipe file is not versioned, I cannot have a versioned bbappend and thus =
I will not get a build failure when the recipe is updated to a new version,=
 and we risk having PV set to something that does not match
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Consolas;co=
lor:rgb(148,54,52)">SRCREV</span><span lang=3D"EN-US" style=3D"font-size:11=
pt;font-family:Calibri,sans-serif;color:rgb(148,54,52)">. :(</span><u></u><=
u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">=C2=A0</span><u></u><u></u></=
p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">And what would you say to the users that want and ex=
pect the leading=C2=A0 &quot;v&quot;, since it has always been there ?<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">//Peter</span><u></u><u></u><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:Calibri,sans-serif;color:rgb(148,54,52)">=C2=A0</span><u></u><u></u></=
p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Bruce
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 8 september 2025 14:52<br>
<b>To:</b> Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" targ=
et=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
<b>Cc:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;;
<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_bl=
ank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] containerd: Remove leadin=
g &quot;v&quot; from PV</span><u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Sep 8, 2025 at 3:16<span style=3D"font-famil=
y:Arial,sans-serif">=E2=80=AF</span>AM Mikko Rapeli &lt;<a href=3D"mailto:m=
ikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;
 wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal">Hi,<br>
<br>
On Sun, Sep 07, 2025 at 04:19:17PM -0400, Bruce Ashfield via <a href=3D"htt=
p://lists.yoctoproject.org" target=3D"_blank">
lists.yoctoproject.org</a> wrote:<br>
&gt; On Sun, Sep 7, 2025 at 4:17<span style=3D"font-family:Arial,sans-serif=
">=E2=80=AF</span>PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Sun, Sep 7, 2025 at 6:59<span style=3D"font-family:Arial,sans-=
serif">=E2=80=AF</span>AM Peter Kjellerstedt via<br>
&gt; &gt; <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists=
.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@l=
ists.yoctoproject.org" target=3D"_blank">axis.com@lists.yoctoproject.org</a=
>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; The leading &quot;v&quot; in the version otherwise makes its =
way into, e.g., the<br>
&gt; &gt;&gt; SBOM.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter=
.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&g=
t;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; There are another 30 recipes in meta-virtualization that have=
 a leading<br>
&gt; &gt;&gt; &quot;v&quot; in their versions, but this is the only one of =
them that we use.<br>
&gt; &gt;&gt; I can send patches for the others as well if you want.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; No thanks, to any of them.<br>
&gt; &gt;<br>
&gt; &gt; The &quot;v&quot; isn&#39;t by mistake. I don&#39;t see any reaso=
n to remove it.<br>
&gt; &gt;<br>
&gt; <br>
&gt; What I mean by this, is that someone needs to tell me why SBOM<br>
&gt; is broken enough that it can&#39;t handle the &quot;v&quot;, and what =
problems it<br>
&gt; causes in the SBOM.<br>
<br>
At least CVE checking tooling can compare PV against version numbers<br>
outside of yocto build environment which are often without<br>
&quot;v&quot; prefix used by several projects in git tags. Same for the SW =
versions<br>
reported by the tools in logs and/or command line.<br>
<br>
I think the tools can handle &quot;v&quot; but different ways of reporting =
version<br>
numbers break usecases if &quot;v&quot; is not used in all contexts like in=
 CVE<br>
reporting.<br>
<br>
For example Debian doesn&#39;t report containerd versions with leading &quo=
t;v&quot;.<u></u><u></u></p>
</blockquote>
<div>
<div>
<p class=3D"MsoNormal">That&#39;s along the lines of what I thought. (I mea=
n, in the end I doesn&#39;t<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">matter how other distros and build systems have thei=
r versions, that<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">is their choice and why we have the CVE version vari=
able).<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">If someone sends me a specific example of breakage (=
a tool and output),<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">then I&#39;d definitely be interested in seeing that=
. So that I can follow up<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">on it in a bit more detail.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The policy I have, and have always had (when possibl=
e, mistakes<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">happen) is that PV matches the tag format of the rep=
ository. So in<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">most of the projects that means &quot;v&quot;. There=
&#39;s other tooling and processes<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">that are looking to do that matching and have been a=
round for a while.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">As long as the version doesn&#39;t obviously break s=
emver, I&#39;ve always<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">just left it alone (and all the sever bits I&#39;ve =
suffered say that the<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">decorations don&#39;t make it incompatible..<u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Fundamentally I don&#39;t worry about merging cosmet=
ic changes, and<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">when potentially new tools come along and ask the in=
put formats=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">and source to be changed, that&#39;s a problem for m=
e .. since compatibility<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">is nice, but so is consistency and backwards compati=
bility.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the follow up. Definitely helpful.<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal"><br>
Cheers,<br>
<br>
-Mikko<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_1120532754325193188m801487703831393=
2796gmailsignatureprefix">--
</span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_1120532754325193188gmailsignaturepr=
efix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000a62677063e560c85--

