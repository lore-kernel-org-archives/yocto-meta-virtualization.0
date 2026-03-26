Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF78410A62C8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:00:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46760.1774530008157948018
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 06:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QDpKBomb;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ab39b111b9so4053715ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Mar 2026 06:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774530007; cv=none;
        d=google.com; s=arc-20240605;
        b=eLot1Vbvb8pF3oBI8DWfTlgm52RRjX+fioGtqquxZSYEjpN1XCr4suxH6stKzBL3DF
         zFl9ySPg+kvP3cAqxTBqQiJ6RKzPacxgtAU8whU6suBrfeNicq6ADRybC/DdVvXQmd0l
         tFDbkIUE7vsPLD4dtubU2BVSYO+9wNR/rrscmin21T1cuPowJf/hPfZxmROcC93a1VGO
         jAKeBrj7PJ3Wz4wPKlBcdGBQ8S4OQka06WtLTdAgJ7Q/hp3TgBlhW9lVQCEGqbGooX8w
         8C8G/8ZSD8aUq6p/lhLgfD3iCdh8AYil8ukwQ73c27TtiuuSvYV1LGWG8LTTTl80uRmE
         hWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L53byefiCnVgMPyv2GeSKcq+b+NQ9tWQIWD1yiQZIJs=;
        fh=hlLEK3pItE2LGIEGxbjUKXm7mi5I2ht885vnwqeyEsA=;
        b=jrsSnC30z3razrDQOPuIAMaTHiQelg6JMgyUq3RCZdqEG+pjYsAaRdirFeNpQa2Hf1
         qaLJmM2P19XBZx0lZLIyx24tMeCgV3FNxcuwxDwsFFh0LwJktYqW93oooN8z+xAW1MCj
         MWNxe88L5x6l/iiaeoco1XFLUixoafrBQpobWelGDzk8UNsHr+f2AbRw2sf2AHL1H2oa
         zyktvOb6IgzAiNJQ41lKHuDr3pmeZGqkZiZl6o5PYedSP+vry6sLOkLAaNnZod2FMu9y
         i47oRiLT0UWdo1OvHDeP7US05JU/mIO/UtKLM+D5/ljbWj8QrmCmkyxHDj10rwXHRbWb
         tbZw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774530007; x=1775134807; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L53byefiCnVgMPyv2GeSKcq+b+NQ9tWQIWD1yiQZIJs=;
        b=QDpKBomb67dkWp/iuyKJ908LTnPcWs09F3QKdJoZnZZeXLWux11HksXPTo/TfjdCda
         zmxV8lfvK+pB8rewYnmZhutIGB5BWz3XyXnC+XpGA4XsXXn3b7M+ya9CUyeZgv0Yy3T8
         5A6IQrVAKp8lIzHrjGrLDuSnHv2VgeAY5F5RVPCOeVgf6FZnJeIeZ7raHhplrNB+4tQo
         g6o71Ibz+92ycrLZeD8TIw06ibIOVDSwzfqGwiQdROhTgWvpThsEnDxNS0Lm5ub682PW
         AdF3hkuS6ra5m17H/0aI0xNwTsXI+yP2ocen4OfKDzgv7etIgu+TZgHG0kAF15urF86p
         zIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530007; x=1775134807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L53byefiCnVgMPyv2GeSKcq+b+NQ9tWQIWD1yiQZIJs=;
        b=AxnDx6RP9PD2XcSyPSDACn536HvubzIAdnUbI9ped6qXWYeCBVbUaAU5KZpuMKD1cn
         ecoHMZhjqaS/eL+1aws/nF+4afU+wMcJgOfqPevC9dzfcG7QRbPLtRPaNjkXu4E7ayzY
         EMYBNilsdjrLZsyUag7x2QntnLkTcondKbWra3z+usQvfBi/kMMgb/OPYedvpNDpYfIT
         czR14UOcmnL4KVDt2pB0FIfL+UVYNQh6cpIcGL0uCrNPTQR7FSqPgv2GyyU98s1JFN61
         sr3PggFsN8pC9bxF3FSN5oos6LUlqUbZysZpyPq+fGVmmSdr/R4mrrP8fAzfsu+Lkz78
         jDkg==
X-Gm-Message-State: AOJu0YysaeGgjppMQbMWvl2mlVnVdOtlvKChRh5wKVqO0+fCHbDH0ZLY
	TcEf4BG0iJ7OMB+/5MD3FBZRABTWwlfw1HOUwStSbuc8b1+9Ai76cOs69PdwaKqKD3M2dhfuVx+
	7O97Cip+kKS8D6GT19CFykjOJi3Xe01DQ5Gd+
X-Gm-Gg: ATEYQzy8cw1aDFALd1u5EcVyU2Bz2UrrOy8NlzpU78wAZkFvyuGgq+QdtGcq3Tq6B1b
	rAOYePbDCgvFNCGes7QEYc42o89GfTG0FCxqqF3rG0BTVLCqfEZ14ckIg6QcSCv9guxspOJwVvp
	5YKav67uXEVYrHLSKX7Y1JUap6UqBtKAMJcCA49562f84yFrUPXbWlKo+c8H+q3ABleiNli8Drr
	RnUaPvYScUrA1pXmBGLjG+ublaxIll1WQ1fJ+9hOL+KOUdI1+/9WaV3MBGPyEeLV4U9GdsMW0aQ
	ZzCe2Hv/y5CZXVkzaUK/lqUwhkuBRNgfHDflLzNsjRz/EUrPhXM=
X-Received: by 2002:a17:902:ec8c:b0:2b0:5738:9817 with SMTP id
 d9443c01a7336-2b0b0aad876mr84302865ad.31.1774530006429; Thu, 26 Mar 2026
 06:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260323181103.10030-1-peter.marko@siemens.com> <AS1PR10MB56978B8D8BB9EDAC5E9DACCCFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978B8D8BB9EDAC5E9DACCCFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Mar 2026 08:59:53 -0400
X-Gm-Features: AQROBzDrMDkSmMUAWyihh6M1dGTkJ-DK9Pl6Z2SwgX08_9s2F_CD8r019bHPdp0
Message-ID: <CADkTA4M2dAA4u_2PfE7EM3nYtemW4gL+PFVAbpq9wAp5-LkFhQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -> 1.3.3
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ad353e064decf6e1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Mar 2026 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9675

--000000000000ad353e064decf6e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm working my way through networking recipes now.

There's no risk of branching before I'm happy and all the upgrades are
tested, so we are safe.

Bruce

On Thu, Mar 26, 2026 at 7:46=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Hello Bruce,
>
> I see that you have made your own update of aardvark-dns, but slirp4netns
> is not done master next.
> Could you please take this commit, so we have the latest version when
> branching-off wrynose?
>
> Thanks,
>   Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Monday, March 23, 2026 7:11 PM
> > To: meta-virtualization@lists.yoctoproject.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -> 1.3.3
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > $ git log --oneline
> > ee1542e1532e6a7f266b8b6118973ab3b10a8bb5..944fa94090e1fd1312232cbc0e6b4=
3
> > 585553d824
> > 944fa94 (tag: v1.3.3) v1.3.3
> > 0422b01 CI: bump up deps
> > 019cd5a bump libslirp to v4.9.1
> > 1bdd0db Merge pull request #355 from
> takumin/ci-build-provenance-attestations
> > bf1c767 CI: Enable actions/attest-build-provenance@v2
> > 9996a4e Merge pull request #353 from AkihiroSuda/dev
> > 4523924 v1.3.2+dev
> > 0f13345 (tag: v1.3.2) v1.3.2
> > 6c9d461 Merge pull request #352 from AkihiroSuda/dev
> > ead6f78 CI: update deps
> > d6b8b5f Merge pull request #351 from AkihiroSuda/dev
> > e859823 bump libslirp to v4.9.0
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  recipes-networking/slirp4netns/slirp4netns_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb
> b/recipes-
> > networking/slirp4netns/slirp4netns_git.bb
> > index d245324c..62b14a2c 100644
> > --- a/recipes-networking/slirp4netns/slirp4netns_git.bb
> > +++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
> > @@ -6,10 +6,10 @@ network namespace to the usermode TCP/IP stack
> ("slirp")."
> >  LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D1e2efd29c201480c6be2744d9edade26"
> >
> > -SRCREV =3D "ee1542e1532e6a7f266b8b6118973ab3b10a8bb5"
> > -SRC_URI =3D "git://github.com/rootless-
> > containers/slirp4netns.git;nobranch=3D1;protocol=3Dhttps"
> > +SRCREV =3D "944fa94090e1fd1312232cbc0e6b43585553d824"
> > +SRC_URI =3D "git://github.com/rootless-
> > containers/slirp4netns.git;nobranch=3D1;protocol=3Dhttps;tag=3Dv${PV}"
> >
> > -PV =3D "1.3.1+git"
> > +PV =3D "1.3.3"
> >
> >  inherit features_check
> >  REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ad353e064decf6e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;m working my way through networking recipes now.=C2=A0<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">There&#39;s no risk of br=
anching before I&#39;m happy and all the upgrades are tested, so we are saf=
e.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Mar 26, 2026 at 7:46=E2=80=AFAM Marko, Peter &lt;<a href=
=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Bruce,<br>
<br>
I see that you have made your own update of aardvark-dns, but slirp4netns i=
s not done master next.<br>
Could you please take this commit, so we have the latest version when branc=
hing-off wrynose?<br>
<br>
Thanks,<br>
=C2=A0 Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Sent: Monday, March 23, 2026 7:11 PM<br>
&gt; To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
&gt; Cc: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Subject: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -&gt; 1.3.3<br>
&gt; <br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; <br>
&gt; $ git log --oneline<br>
&gt; ee1542e1532e6a7f266b8b6118973ab3b10a8bb5..944fa94090e1fd1312232cbc0e6b=
43<br>
&gt; 585553d824<br>
&gt; 944fa94 (tag: v1.3.3) v1.3.3<br>
&gt; 0422b01 CI: bump up deps<br>
&gt; 019cd5a bump libslirp to v4.9.1<br>
&gt; 1bdd0db Merge pull request #355 from takumin/ci-build-provenance-attes=
tations<br>
&gt; bf1c767 CI: Enable actions/attest-build-provenance@v2<br>
&gt; 9996a4e Merge pull request #353 from AkihiroSuda/dev<br>
&gt; 4523924 v1.3.2+dev<br>
&gt; 0f13345 (tag: v1.3.2) v1.3.2<br>
&gt; 6c9d461 Merge pull request #352 from AkihiroSuda/dev<br>
&gt; ead6f78 CI: update deps<br>
&gt; d6b8b5f Merge pull request #351 from AkihiroSuda/dev<br>
&gt; e859823 bump libslirp to v4.9.0<br>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-networking/slirp4netns/<a href=3D"http://slirp4netns_git=
.bb" rel=3D"noreferrer" target=3D"_blank">slirp4netns_git.bb</a> | 6 +++---=
<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-networking/slirp4netns/<a href=3D"http://slirp4ne=
tns_git.bb" rel=3D"noreferrer" target=3D"_blank">slirp4netns_git.bb</a> b/r=
ecipes-<br>
&gt; networking/slirp4netns/<a href=3D"http://slirp4netns_git.bb" rel=3D"no=
referrer" target=3D"_blank">slirp4netns_git.bb</a><br>
&gt; index d245324c..62b14a2c 100644<br>
&gt; --- a/recipes-networking/slirp4netns/<a href=3D"http://slirp4netns_git=
.bb" rel=3D"noreferrer" target=3D"_blank">slirp4netns_git.bb</a><br>
&gt; +++ b/recipes-networking/slirp4netns/<a href=3D"http://slirp4netns_git=
.bb" rel=3D"noreferrer" target=3D"_blank">slirp4netns_git.bb</a><br>
&gt; @@ -6,10 +6,10 @@ network namespace to the usermode TCP/IP stack (&quo=
t;slirp&quot;).&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D1e2efd29c201480c6be2744d9edade26&quot;<br>
&gt; <br>
&gt; -SRCREV =3D &quot;ee1542e1532e6a7f266b8b6118973ab3b10a8bb5&quot;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/rootless-" rel=
=3D"noreferrer" target=3D"_blank">github.com/rootless-</a><br>
&gt; containers/slirp4netns.git;nobranch=3D1;protocol=3Dhttps&quot;<br>
&gt; +SRCREV =3D &quot;944fa94090e1fd1312232cbc0e6b43585553d824&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/rootless-" rel=
=3D"noreferrer" target=3D"_blank">github.com/rootless-</a><br>
&gt; containers/slirp4netns.git;nobranch=3D1;protocol=3Dhttps;tag=3Dv${PV}&=
quot;<br>
&gt; <br>
&gt; -PV =3D &quot;1.3.1+git&quot;<br>
&gt; +PV =3D &quot;1.3.3&quot;<br>
&gt; <br>
&gt;=C2=A0 inherit features_check<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES ?=3D &quot;seccomp&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000ad353e064decf6e1--

