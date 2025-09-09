Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EBFCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:07:14 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.14388.1757426831961829962
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 07:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lg7aDtqC;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-772627dd50aso7172469b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Sep 2025 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757426831; x=1758031631; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ETd7fDVBooE9kqFOydTdXaje1/KYSLs8jjzD5M5rqAs=;
        b=Lg7aDtqC7x7rGUfEfaprZC+/ZPrPuWmfJjATi7zBKZ5VQT+WKuoAQKzZfoZvnRZdxg
         9FVtF2vc+t1dD1xhS3uQTa9WdLVo9PrqpPqHP63Y+v+0m38Nk0OWLtQHhTeCns7bbwxE
         WAAULGAzwfpAuKLK1LA2ly6S76kHupqyVzOxozPw16l/rZPkKRDfzLMSyIP06H+5QWJI
         oPY3VgiR3LTVZwcpt9JjhgGOVxj6TY7xmp3OPPwJj8SJ9SR7pN8oKSEiulp9D7NISNZL
         IjK3kJzfgmD9IVzi7DtyrTZ3jKSqyA4vTpg3gLVciHCYb6HWAbcxCIEMe30MIO51CqmU
         pGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426831; x=1758031631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETd7fDVBooE9kqFOydTdXaje1/KYSLs8jjzD5M5rqAs=;
        b=XRlRapV3fipTj9rAvZpl9hCXPIur7kLqiTDnidS3r7xi6zr/6qbUVYlnpbIlEo7jqi
         +uxQkFVVpc0DbDE1gjR6VhAFcfpcUDPfEQ0uocD6R7cGfkMmWdHWvAjA2PfIH6RMcLr9
         hY1YtA3m2yu3cAk/1vdN6O+D82RUsZRdENS1f3M1h7JIc5XtPJBZrdFw0Na4NxhHtTRR
         L+WiRCEttbfHS5OiUgF6wgCu9FjmTC4+yHYIejM8Tc7ZIc0RmewudkHypsLw1/zEX0Zg
         WLh29rfK3MIBziZlxl2SYXwibNgowI+KT+ifuSpwH8H7TYe8Ky7GAQM1h6DL+OpwOwV0
         kNKw==
X-Gm-Message-State: AOJu0YxtNgAR6Rbzp5FNIRoJdOwZANRIn5SfHZDq2zmVnzPQOMyCmxbp
	cyj4epPSFODW3n7Kn0dUm0QyIN8M6OeU4iwg5V7uLR3AkACWLPEiC4D9ZeTkOFRfqTYc8trH50C
	S24dU+RqafTiGrmDpL+s80brBTX2pC3w=
X-Gm-Gg: ASbGncv4PacntXcfVrXHyldTINS831Z+QPa9r15BzyBa53BJC9XnRspBGXMBAJ3q0wQ
	0HUBZ71qA7wG1o+J98+gh8/3LjNByHLfJUJRQcIap7utZPuPO74RiVDo/+loDZfMebJkF46zh9l
	rdnV1THfkpBJSj4FHGhKCC28cZJh9f/MtNKBt4zCjI6n6NrLBq26Z1ocqLBAcBtSVeaa/dHA+nB
	TurnYntGz2H7MwEoY43B8LQSKrSaRWfqwYa0udaCIISti6zhqg=
X-Google-Smtp-Source: AGHT+IF8RAH9jSaPYbFySxPVDRs7+QBq2LzkVFYZNKzrjgknRTni5jxN2nLx9Ks9c1C1TKNinar8wt+VBF9vU/s5nJU=
X-Received: by 2002:a05:6a20:914f:b0:23d:45b2:8e3c with SMTP id
 adf61e73a8af0-253763882b0mr16723200637.6.1757426828804; Tue, 09 Sep 2025
 07:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR02MB10201F2835AE22CCF6F839B2EEF0CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
 <4F668632-EB16-43BA-87EF-E3AD94399AFE@gmail.com>
In-Reply-To: <4F668632-EB16-43BA-87EF-E3AD94399AFE@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Sep 2025 10:06:55 -0400
X-Gm-Features: Ac12FXxY9tA2euM-5D3WRRgF0WZOxnPvsC0i4LC15ouEYWBSDvk9UKkCvlUXAXc
Message-ID: <CADkTA4M++_QOjCmdjxz1ZQxUOyU0HgkeqVB-bFe9tN6OG=o+pg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v" from PV
To: persaur@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, peter.kjellerstedt@axis.com, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d98912063e5ed170"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Sep 2025 14:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9389

--000000000000d98912063e5ed170
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Considering I'm part of the collective, let's just say that the opening
statement is incorrect, no matter what a generative AI may or may not say.

I'm also done with this for now, I have much higher priority items that
need attention.

Bruce

On Tue, Sep 9, 2025 at 9:06=E2=80=AFAM Rich Persaud via lists.yoctoproject.=
org
<persaur=3Dgmail.com@lists.yoctoproject.org> wrote:

> If it was collectively decided that the OE recipe metadata variable PV
> should be numeric or otherwise constrained, to improve interoperability
> with other software identity ecosystems, then future bitbake and YP
> versions could document and enforce a type or syntax constraint.
>
> ChatGPT query: "How many OpenEmbedded and Yocto Project recipes have a PV
> recipe metadata variable that is non-numeric, e.g. include the letter 'v'
> in the value of the variable?"
>
> ChatGPT response excerpt:
> --
> Recipes usually define PV implicitly. Many recipes don=E2=80=99t explicit=
ly
> declare the PV variable in the .bb file; BitBake derives it automatically
> from the recipe filename (e.g., foo_1.2.bb implies PV =3D "1.2").
>
> Variations exist. Some recipes do explicitly set PV, and those may includ=
e
> letters, plus signs (e.g., 1.2+git${SRCPV}), tildes (e.g., 0.8.16~rc1), o=
r
> even incorporate placeholders like AUTOINC when using revisions from SCM
>
> You can compute the counts [locally] by grepping through recipe layers fo=
r
> PV assignments containing letters or symbols.
> --
>
> Rich
>
> On Sep 8, 2025, at 11:45, Peter Kjellerstedt via lists.yoctoproject.org
> <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.org> wrote:
>
> =EF=BB=BF
>
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
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9388):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9388
> Mute This Topic: https://lists.yoctoproject.org/mt/115111597/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d98912063e5ed170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Considering I&#39;m part of the collective, let&#39;s just sa=
y that the opening statement is incorrect, no matter what a generative AI m=
ay or may not say.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;=
m also done with this for now, I have much higher priority items that need =
attention.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Sep 9, 2025 at 9:06=E2=80=AFAM Rich Persaud via =
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;pe=
rsaur=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists=
.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">=
If it was collectively decided that the OE recipe metadata variable PV shou=
ld be numeric or otherwise constrained, to improve interoperability with ot=
her software identity ecosystems, then future bitbake and YP versions could=
 document and enforce a type or syntax constraint.=C2=A0</div><div dir=3D"l=
tr"><br></div><div dir=3D"ltr">ChatGPT query: &quot;<span>How many OpenEmbe=
dded and Yocto Project recipes have a PV recipe metadata variable that is n=
on-numeric, e.g. include the letter &#39;v&#39; in the value of the variabl=
e?&quot;</span></div><div dir=3D"ltr"><span><br></span></div><div dir=3D"lt=
r"><span>ChatGPT response excerpt:=C2=A0</span></div><div dir=3D"ltr"><span=
>--</span></div><div dir=3D"ltr"><div dir=3D"ltr">Recipes usually define PV=
 implicitly. Many recipes don=E2=80=99t explicitly declare the PV variable =
in the .bb file; BitBake derives it automatically from the recipe filename =
(e.g., <a href=3D"http://foo_1.2.bb" target=3D"_blank">foo_1.2.bb</a> impli=
es PV =3D &quot;1.2&quot;).=C2=A0</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">Variations exist. Some recipes do explicitly set PV, and those may=
 include letters, plus signs (e.g., 1.2+git${SRCPV}), tildes (e.g., 0.8.16~=
rc1), or even incorporate placeholders like AUTOINC when using revisions fr=
om SCM</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">You can compute the=
 counts [locally] by grepping through recipe layers for PV assignments cont=
aining letters or symbols.</div><div dir=3D"ltr">--</div></div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr">Rich</div><div dir=3D"ltr"><br><blockquote =
type=3D"cite">On Sep 8, 2025, at 11:45, Peter Kjellerstedt via <a href=3D"h=
ttp://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> =
&lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.yoctoproject.org"=
 target=3D"_blank">axis.com@lists.yoctoproject.org</a>&gt; wrote:<br><br></=
blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF






<div>
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
<p class=3D"MsoNormal"><span>--
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
<p class=3D"MsoNormal"><span>-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>


<span></span><br><span></span><br><span></span><br></div></blockquote></div=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9388): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9388" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9388</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/115111597/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/115111597/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d98912063e5ed170--

