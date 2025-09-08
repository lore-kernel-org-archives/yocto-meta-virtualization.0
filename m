Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA2CCAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 12:52:24 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.12462.1757335943684506940
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 05:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJ4sY2Zv;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-25669596921so7706655ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757335943; x=1757940743; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eUi32ejoW9x/H69W92PGYQ/2C+2rTTMsgSy04P/r2Cc=;
        b=CJ4sY2ZvtXThi2YFprmoKSjPBf88oQSsRCQV7XZ5KVBSSTaieYYoOJrnjCPAG3S1dd
         9nvGAuJHcnyvJI6cKkRF8wT6c7GN3uCXdT9GKNTz39ppukQmsg+4eBJ35Q6EGrPIpC+G
         x/YaGjXTAKS9ZfNu+yGQ3dnw+2wD0m09LjPRZpzIsuslEXbCzu58wxDXUvVrsjWSgwys
         qXwmpI1FodAjru52/zDjQwaZ2vlmoAoATNmMLrZ5h/+BzIzWGtORHzW/pPBQqDp+Q0dG
         6fEmaRTYT4zFBwXwqzajsMDuvlgZmPlfsioLEZXrWQiARhRXYz29t3Y1S3gTGFoP0xJO
         gg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757335943; x=1757940743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUi32ejoW9x/H69W92PGYQ/2C+2rTTMsgSy04P/r2Cc=;
        b=fQdQQWmkx/kvlu1YW7vfDkOVpEniRx5Gvyqylt+0tAl5RK8/9PFgYeV10HyXQGnMeQ
         MzHbPrz2MA4KYPZKYmA7bTxICPGbluiZvI0qv0/KqsfvP3hU3S5fspCxubfUNzzDp5iK
         fee93+KJKt212b1EIFToEjqm0/OBm3M6BF/E56gkK2qzGzo2gVrp/orC5NmhT8INEDbV
         op51udmPkULz43+6jyFbuY/gzaE5NnPN3HfEC2KJ/13TWYxqFqNZLsBeXk9ME2k5G5Ap
         qc49Ok8Gj+6O1uDdclsWubgomVGhXxsDK7hw7ickb0TiG2S+rFON25MZxFpXf3ti9MpO
         QtVw==
X-Forwarded-Encrypted: i=1; AJvYcCWrG0VS2Qo2KB7JBCHgsh6Csj3jr4iYmjcVQSsPPDRTt/YOK0+P6IW8LJK9CqKoVwB98DRdU8SET6FS6LnwD3d4x2ls@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx4BJewj1xcTEuFehf/ugFbd2oX7PSpGwe5pYz4mR9c4w/tJUCZ
	IQs9mV9v1pTrTrf6VopTKTR59WYwXxvPwY0TnfpRYtkWJt1VQdey0GbpERMWKLNYMzz38TCXy9e
	RCbnVYRbio4SSn3VN9SrJLTF1btL5Y3g=
X-Gm-Gg: ASbGncuvN65CjuoRtHGmIh0FrjpKT5uQc5AhWRgk0twW6EeA72g91ajm7hsAnnZIHbV
	H9q9XTAZfnwW74cTLry2GqvKlE+LV9V0CvaSAPydhVSByz8HsJb+yllgEKgDGjpbt7JrBFmKBF6
	cbdoj4VKpNxKKRnUwo9WPbQ1Bs/dOHQy/Y9671DNd7zrg00eg7a2qKYP/8/ZmybczJZmUxwYxhS
	TIbVBkOjOFBD0R/phkLoPS4oX4i7JiCjGpSlenU
X-Google-Smtp-Source: AGHT+IFjysF8JtKL9lVp8VsLzTSO8xD5/gELlWWcR6dbhJ70pqioGVjHnxPPWzbatCIGRfudmYPxfL2Zlp+1IxvU3sw=
X-Received: by 2002:a17:902:d48e:b0:24e:e5c9:ed0c with SMTP id
 d9443c01a7336-25173308a06mr107763195ad.43.1757335942831; Mon, 08 Sep 2025
 05:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250907105926.1650992-1-pkj@axis.com> <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
 <CADkTA4NKwaetHMUvbRian4m1Po1CYTXb7V+avOW1Fwj-RWLnsw@mail.gmail.com> <aL6C3y52Dg1Rmwxa@nuoska>
In-Reply-To: <aL6C3y52Dg1Rmwxa@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Sep 2025 08:52:11 -0400
X-Gm-Features: Ac12FXxAvNgvgwr8CpsFgs8kcnxj0pl1cUzMPSJgF_DqYNcc1K3B9l4fyBo680I
Message-ID: <CADkTA4OVOM-GXK1+asL1gFgk4CJ+LVoKWnHYdLjafzpgkrks=A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v" from PV
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: peter.kjellerstedt@axis.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009fa777063e49a88d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 12:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9382

--0000000000009fa777063e49a88d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:16=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:

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
That's along the lines of what I thought. (I mean, in the end I doesn't
matter how other distros and build systems have their versions, that
is their choice and why we have the CVE version variable).

If someone sends me a specific example of breakage (a tool and output),
then I'd definitely be interested in seeing that. So that I can follow up
on it in a bit more detail.

The policy I have, and have always had (when possible, mistakes
happen) is that PV matches the tag format of the repository. So in
most of the projects that means "v". There's other tooling and processes
that are looking to do that matching and have been around for a while.

As long as the version doesn't obviously break semver, I've always
just left it alone (and all the sever bits I've suffered say that the
decorations don't make it incompatible..

Fundamentally I don't worry about merging cosmetic changes, and
when potentially new tools come along and ask the input formats
and source to be changed, that's a problem for me .. since compatibility
is nice, but so is consistency and backwards compatibility.

Thanks for the follow up. Definitely helpful.

Bruce


>
> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009fa777063e49a88d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 8, 2025 at 3:16=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Sun, Sep 07, 2025 at 04:19:17PM -0400, Bruce Ashfield via <a href=3D"htt=
p://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoct=
oproject.org</a> wrote:<br>
&gt; On Sun, Sep 7, 2025 at 4:17=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com<=
/a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Sun, Sep 7, 2025 at 6:59=E2=80=AFAM Peter Kjellerstedt via<br>
&gt; &gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=
=3D"mailto:axis.com@lists.yoctoproject.org" target=3D"_blank">axis.com@list=
s.yoctoproject.org</a>&gt;<br>
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
t;v&quot;.<br></blockquote><div><div class=3D"gmail_default" style=3D"font-=
size:small"></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
at&#39;s along the lines of what I thought. (I mean, in the end I doesn&#39=
;t</div><div class=3D"gmail_default" style=3D"font-size:small">matter how o=
ther distros and build systems have their versions, that</div><div class=3D=
"gmail_default" style=3D"font-size:small">is their choice and why we have t=
he CVE version variable).</div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">If someone sends me a specific example of breakag=
e (a tool and output),</div><div class=3D"gmail_default" style=3D"font-size=
:small">then I&#39;d definitely be interested in seeing that. So that I can=
 follow up</div><div class=3D"gmail_default" style=3D"font-size:small">on i=
t in a bit more detail.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">T=
he policy I have, and have always had (when possible, mistakes</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">happen) is that PV matches =
the tag format of the repository. So in</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">most of the projects that means &quot;v&quot;. The=
re&#39;s other tooling and processes</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">that are looking to do that matching and have been ar=
ound for a while.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">As long=
 as the version doesn&#39;t obviously break semver, I&#39;ve always</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">just left it alone (an=
d all the sever bits I&#39;ve suffered say that the</div><div class=3D"gmai=
l_default" style=3D"font-size:small">decorations don&#39;t make it incompat=
ible..</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Fundamentally I do=
n&#39;t worry about merging cosmetic changes, and</div></div><div class=3D"=
gmail_default" style=3D"font-size:small">when potentially new tools come al=
ong and ask the input formats=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small">and source to be changed, that&#39;s a problem for me =
.. since compatibility</div><div class=3D"gmail_default" style=3D"font-size=
:small">is nice, but so is consistency and backwards compatibility.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Thanks for the follow up. Defi=
nitely helpful.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009fa777063e49a88d--

