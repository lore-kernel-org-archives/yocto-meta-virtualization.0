Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5468BFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:40:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12111.1777380051990912628
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 05:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b32H26ip;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so5369566a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 05:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777380051; cv=none;
        d=google.com; s=arc-20240605;
        b=QqSrex6g8bPR3EHQJjUHwkmR9vxfzrXZidFcAOfpSw/3CeLPgD1MzfOSm40bRZyknQ
         Cgq0akTjgu+k0iqbltlwR2WJyCiJDXVwVgtv3iQ8E6zIHrW8xGoinagnYR+72x6KNYD1
         lHm+i0diJjBwGY0sAAzradR1wuHMlbSJf+PiXLOL0KiQFo92cL8+ny33VnR+bkBou8Ya
         BjAzdj5zjHcTLgkK6xQs5XxeKwk45/iVrLyta03d2zsaDtnzSVtEBEE7dMJoJRQmzdQ5
         tw32hQsRHxauxBe52OHn49pNhVZcbSuAtrnS5AEw+zSHDWUlMB85x7NbRZS+fl2k/F0d
         4RPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NvTgsTsqUv/9RzYzAVD/dYEZVBDQ0UJDQklAtlompZ4=;
        fh=/f0NE6VSAo7yNFwfBabGHuPq2Mc/jecx4SarcXUgbPQ=;
        b=GHaW1yMKhptQK4WlMaqGWQI2ziM84wOMKCpMPJMCG8uUs3ye+h2u09bPULQ5WSC36O
         RR9AXRLvXMOQoMHlSmVzPSxGlsFLbO9L19CjTW/NpvR+ieSrPg9TLpraCS/vRWhRJiu5
         /kECJ6+7e3TydFQzABK5sz0iyue9O/ukb4zDjQ9tuYzTuDg8G8Lv1MDWgdQMN7XM+JTN
         2FcGJORnBrOTDnasJ6QdpBctOBAcA7GfhVC4YV4RquhCeInJR4wsTCc2+LVaADl3b+o3
         gS9o4NOQ/XqjSlFmQaUF8ibyIPWnzaohDMxQ9LnmS/5gZKpqGev4FC2QwrTyxrSMYkJ1
         Tcew==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777380051; x=1777984851; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NvTgsTsqUv/9RzYzAVD/dYEZVBDQ0UJDQklAtlompZ4=;
        b=b32H26ipTUVJNLmL0hUbSUfZeqUgB9TSM3j8yjrVQGzx7e05A3HaVxqchBZEPNa02f
         ScoWmgQvbSgOe4+t4Na4YNgI8bAcMlG7ponz0WxWMS1kG7RSACb8OE9Fz1taf/PcKVH1
         4lYTpS7stZxCpqu4lXg/kfcIpXKmy50/XpiX7wvbgXL52KoraFiEDRyXBHecMA7/ciJi
         m0twtSoO1dPO7beSs5bftxQQ1BjNwH9JlgxRx58bJzD4ub/ryZinL4Y70DodHwg/0vgn
         H8n8jFUJ6PnxABVtvORMnhjq4CFlSybfDrZ1OHaVvvQQlwP9Jvx5tJUYoVapFBXEmOb/
         A+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380051; x=1777984851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvTgsTsqUv/9RzYzAVD/dYEZVBDQ0UJDQklAtlompZ4=;
        b=GS+Zr4RK3M8NqZIWkdDA5I/EMJp3Bzrk90FAVCkiKLjzKDSRsdbyPCJgj2G7T1tyAe
         5MIDZyc/d5XO0/QqeaFEvgt12oLzMVLnlRjgObjZwmD6ywi2+250m6ddCxJU+kYoDsbn
         GBNZrHzdzWxOXXKlPY4O5DTEfy/LU/2GzwgdFDprAlbTudoMMaqPYR+EcMqcn0UY4PLd
         EqJzabk8lq+TO86pDft3L8wE1IZ7+bhVd4XOX7mz5GVEdLKo593uiOQWArJmRAtr8fLr
         bWg85ueMRyNrnZc6osg8k/qGxKx+hJ8tlOhkIsej/EYaqoKTbq/Zhbp8qxFQljpfby5D
         juVg==
X-Forwarded-Encrypted: i=1; AFNElJ9rs6IX1xJ7FpDTrBwQHxEt3fiPZ4CFshrTsiKTizYTug1pE4S4hDZrMCeiCYZ2htKwdpwrPZ7IZo9q97epe2Es0NXv@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw4evFYhvK+GqG9om0b36etFBAqBZKjgHXn9dcEth2VqumOdTPv
	Ti2jMJBY1MOeKlgTKD9jL2fWinQgU5q1JEIs2CZr4l1w1UV8NokNQkkkG7RgfDRv1e5nSIVnqNJ
	zTlF3aOqiJOAHVBc15x4eRCdxTGk0o5E=
X-Gm-Gg: AeBDiesR9BrxJzuB2MQjtYSGFBmN298m2kes8DCKqnvhAdxzczpQ8ahRIa/fhWwGi0t
	kHmJtpQN9jeOFgYlwNFfHg3dx6Frw7452AVtX2yalVvHUU/aN4CcuwkHvuRYpQdvP/1kVTSTXSZ
	dntDp7H8UnzBugWSKBJySEuYFoGqZUXP4hQAPfKYBna1bE8hEMqJScztgBPLck/JteEecZcvInk
	COtVdP09ifvXMcOutEjnaFQqkuO/Ni0DM5FFNWiXwMDyS80PsfOoqGR+AlHHkruKtOULZ046Vzn
	s1uz8Y8P2viF109bvuCg1ICvJL2kV2RdU6hiDC4ot0wymlgPWlM=
X-Received: by 2002:a17:90b:3885:b0:35f:c796:ca5f with SMTP id
 98e67ed59e1d1-3649204993cmr2995272a91.19.1777380051097; Tue, 28 Apr 2026
 05:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <255898079.381409.1777353521045@app.mailbox.org>
 <AS1PR10MB5697C73C24228D7555130AF9FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <18AA811AD1565891.1885982@lists.yoctoproject.org> <CADkTA4OtD2a9yJWxWmU7Y8BFjTXy3rREDLbe19uOLDtwjnZo3g@mail.gmail.com>
 <499640415.413126.1777379044423@app.mailbox.org>
In-Reply-To: <499640415.413126.1777379044423@app.mailbox.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Apr 2026 08:40:37 -0400
X-Gm-Features: AVHnY4I-mj-pi836tPe06MQc4GuWP_nTW-IXVNycpo971xT75ueONK6nqY1iZrw
Message-ID: <CADkTA4MtFW1pTMhzrdXMzasnweoh+JhWGxTv9CYsf9yvC2oimQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Podman version mismatch
To: patrick.vogelaar.dev@mailbox.org
Cc: peter.marko@siemens.com, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000939a5b0650848a24"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 12:40:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9775

--000000000000939a5b0650848a24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 8:24=E2=80=AFAM <patrick.vogelaar.dev@mailbox.org> =
wrote:

>
> > Bruce Ashfield <bruce.ashfield@gmail.com> hat am 28.04.2026 13:23 CEST
> geschrieben:
> >
> >
> >
> >
> >
> > On Tue, Apr 28, 2026 at 7:15=E2=80=AFAM Bruce Ashfield via
> lists.yoctoproject.org (http://lists.yoctoproject.org) <bruce.ashfield=3D
> gmail.com@lists.yoctoproject.org> wrote:
> > >
> > >
> > >
> > > On Tue, Apr 28, 2026 at 2:11=E2=80=AFAM Peter Marko via lists.yoctopr=
oject.org
> (http://lists.yoctoproject.org) <peter.marko=3D
> siemens.com@lists.yoctoproject.org> wrote:
> > > > meta-virtualization has hardly any recipe which fetches exactly git
> tag.
> > > >  So things like this are unfortunately expected.
> > > >  In the past I have sent couple updates to mailing list to use real
> versions, but without success, so I gave up.
> > > >
> > >
> > > Thanks for the encouragement of the 10+ years of
> maintaining meta-virtualization!
> > >
> > > The reason they aren't exact git tags or exact releases is that those
> hashes stay valid
> > > for such a short time that it simply isn't worth it. And there's
> certaining no value in
> > > constantly bouncing the files through _<version>.bb and the _git.bb (
> http://git.bb) every time I
> > > move off an exact release tag.
> > >
> > > Maintaining all this many recipes, that move this quickly by stacking
> patches on to
> > > languages that don't patch all that way would simply be chaos.
> > >
> > > Patrick: there's nothing wrong with script that was intentional on th=
e
> version.
> > >
> >
> > In this case, I looked a bit more closely, upstream is doing something
> different
> > which did in fact make the script report a different version than the
> version in
> > the code:
> >
> > build4 [/home/bruc...git/libpod]> git describe --tags
> > v5.8.2-5-g88c5aaeec6
> > build4 [/home/bruc...git/libpod]> git describe
> > v5.8.2-5-g88c5aaeec6
> >
> >
> > Which is what my script uses to pick up the base version. But the top
> commit
> > on the 5.8 branch:
> >
> > commit 88c5aaeec667af94c4fe3a5c2c7a42f8cf308b93 (from
> 28d04eeb8ec047464c35cc6fbe766ca63b49d338) (HEAD -> v5.8, origin/v5.8)
> > Merge: 28d04eeb8e 7a47175665
> > Author: Paul Holzinger <pholzing@redhat.com>
> > Date: Wed Apr 15 12:01:24 2026 +0200
> >
> >  Merge pull request #28510 from podmanbot/bump-5.8.3-dev
> >
> >  Bump Podman to v5.8.3-dev
> >
> > :100644 100644 9aba2b5c22 39273508b8 M version/rawversion/version.go
> >
> > Which is of course what the build is picking up.
> >
> > I'll have to add a condition to the upgrade tests to pick that up,
> and/or see
> > if I can put it into the scripting logic (it just won't hold across all
> the languages
> > that are used, so it'll be a bit fiddly).
> >
> > For now, I've manually updated the recipe to match the golang version.
> >
> > Thanks for catching that!
> >
> > Bruce
> >
>
> Thanks for having a closer look. I have no opinion on the reporting but
> for me it would be important the version from the recipe matches the
> version from the sources.
>
>
It's updated now. Let me know if I screwed it up again by sending a patch,

The git hashes and discovery are in the end the most important part of
discovery and scanning, so that's the priority. Versions can be manipulated
(or wrong, as we've seen), so they need to be validated against the source.

I've added a basic unit test to the layer to check versions in the recipes,
versus reported versions.

Bruce



> Patrick
>
> >
> > > Which would be easier in your scenario ? (and by your scenario, I mea=
n
> me changing
> > > the version reporting in the recipe.
> >
> >
> > >
> > > - adding the -dev into the PV
> > > - injecting the "base" version into the build via -X (or whatever
> mechanism the
> > > buld needs) ?
> > >
> > > Bruce
> > >
> > >
> > > > Having the coming regulations in mind (requiring accurate sbom and
> cve tracking), I'd recommend everyone using meta-virtualization to just
> copy any used recipe, correct git hash and update crates.inc.
> > >
> > > > Peter
> > > >
> > > >  > -----Original Message-----
> > > >  > From: meta-virtualization@lists.yoctoproject.org <meta-
> > > >  > virtualization@lists.yoctoproject.org> On Behalf Of Patrick
> Vogelaar via
> > > >  > lists.yoctoproject.org (http://lists.yoctoproject.org)
> > > >  > Sent: Tuesday, April 28, 2026 7:19 AM
> > > >  > To: meta-virtualization@lists.yoctoproject.org
> > > >  > Subject: [meta-virtualization] Podman version mismatch
> > > >  >
> > > >  > Hi,
> > > >  >
> > > >  > I gave the newly upgraded podman recipe a try but it seems that
> there is still a
> > > >  > version mismatch.
> > > >  > PV =3D "5.8.2" but: podman -v
> > > >  > podman version 5.8.3-dev
> > > >  >
> > > >  > Do you want me to send a patch or do you want to have a look at
> your update
> > > >  > script?
> > > >  >
> > > >  > Patrick
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > >
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >  Links: You receive all messages sent to this group.
> > >  View/Reply Online (#9756):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9756
> > >  Mute This Topic: https://lists.yoctoproject.org/mt/119043966/1050810
> > >  Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > >  Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> > >  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
> >
> >
> > --
> >
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000939a5b0650848a24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2026 at 8:24=
=E2=80=AFAM &lt;<a href=3D"mailto:patrick.vogelaar.dev@mailbox.org">patrick=
.vogelaar.dev@mailbox.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; hat am 28.04.2026 13:23 CEST g=
eschrieben:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Tue, Apr 28, 2026 at 7:15=E2=80=AFAM Bruce Ashfield via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.y=
octoproject.org</a> (<a href=3D"http://lists.yoctoproject.org" rel=3D"noref=
errer" target=3D"_blank">http://lists.yoctoproject.org</a>) &lt;bruce.ashfi=
eld=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank"=
>gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On Tue, Apr 28, 2026 at 2:11=E2=80=AFAM Peter Marko via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a> (<a href=3D"http://lists.yoctoproject.org" rel=3D"n=
oreferrer" target=3D"_blank">http://lists.yoctoproject.org</a>) &lt;peter.m=
arko=3D<a href=3D"mailto:siemens.com@lists.yoctoproject.org" target=3D"_bla=
nk">siemens.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt; &gt; meta-virtualization has hardly any recipe which fetches exac=
tly git tag.<br>
&gt; &gt; &gt;=C2=A0 So things like this are unfortunately expected.<br>
&gt; &gt; &gt;=C2=A0 In the past I have sent couple updates to mailing list=
 to use real versions, but without success, so I gave up.<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; Thanks for the encouragement of the 10+ years of maintaining=C2=
=A0meta-virtualization!<br>
&gt; &gt; <br>
&gt; &gt; The reason they aren&#39;t exact git tags or exact releases is th=
at those hashes stay valid<br>
&gt; &gt; for such a short time that it simply isn&#39;t worth it. And ther=
e&#39;s certaining no value in<br>
&gt; &gt; constantly bouncing the files through _&lt;version&gt;.bb and the=
 _<a href=3D"http://git.bb" rel=3D"noreferrer" target=3D"_blank">git.bb</a>=
 (<a href=3D"http://git.bb" rel=3D"noreferrer" target=3D"_blank">http://git=
.bb</a>) every time I<br>
&gt; &gt; move off an exact release tag.<br>
&gt; &gt; <br>
&gt; &gt; Maintaining all this many recipes, that move this quickly by stac=
king patches on to<br>
&gt; &gt; languages that don&#39;t patch all that way would simply be chaos=
.<br>
&gt; &gt; <br>
&gt; &gt; Patrick: there&#39;s nothing wrong with script that was intention=
al on the version.<br>
&gt; &gt; <br>
&gt; <br>
&gt; In this case, I looked a bit more closely, upstream is doing something=
 different<br>
&gt; which did in fact make the script report a different version than the =
version in<br>
&gt; the code:<br>
&gt; <br>
&gt; build4 [/home/bruc...git/libpod]&gt; git describe --tags<br>
&gt; v5.8.2-5-g88c5aaeec6<br>
&gt; build4 [/home/bruc...git/libpod]&gt; git describe <br>
&gt; v5.8.2-5-g88c5aaeec6<br>
&gt; <br>
&gt; <br>
&gt; Which is what my script uses to pick up the base version. But the top =
commit<br>
&gt; on the 5.8 branch:<br>
&gt; <br>
&gt; commit 88c5aaeec667af94c4fe3a5c2c7a42f8cf308b93 (from 28d04eeb8ec04746=
4c35cc6fbe766ca63b49d338) (HEAD -&gt; v5.8, origin/v5.8)<br>
&gt; Merge: 28d04eeb8e 7a47175665<br>
&gt; Author: Paul Holzinger &lt;<a href=3D"mailto:pholzing@redhat.com" targ=
et=3D"_blank">pholzing@redhat.com</a>&gt;<br>
&gt; Date: Wed Apr 15 12:01:24 2026 +0200<br>
&gt; <br>
&gt;=C2=A0 Merge pull request #28510 from podmanbot/bump-5.8.3-dev<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Bump Podman to v5.8.3-dev<br>
&gt; <br>
&gt; :100644 100644 9aba2b5c22 39273508b8 M version/rawversion/version.go<b=
r>
&gt; <br>
&gt; Which is of course what the build is picking up.<br>
&gt; <br>
&gt; I&#39;ll have to add a condition to the upgrade tests to pick that up,=
 and/or see<br>
&gt; if I can put it into the scripting logic (it just won&#39;t hold acros=
s all the languages<br>
&gt; that are used, so it&#39;ll be a bit fiddly).<br>
&gt; <br>
&gt; For now, I&#39;ve manually updated the recipe to match the golang vers=
ion.<br>
&gt; <br>
&gt; Thanks for catching that!<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
<br>
Thanks for having a closer look. I have no opinion on the reporting but for=
 me it would be important the version from the recipe matches the version f=
rom the sources.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">It&#39;s updated now. Let me know if I screwed it up again=
 by sending a patch,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">The =
git hashes and discovery are in the end the most important part of discover=
y and scanning, so that&#39;s the priority. Versions can be manipulated (or=
 wrong, as we&#39;ve seen), so they need to be validated against the source=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">I&#39;ve added a basic =
unit test to the layer to check versions in the recipes, versus reported ve=
rsions.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Patrick<br>
<br>
&gt; <br>
&gt; &gt; Which would be easier in your scenario ? (and by your scenario, I=
 mean me changing<br>
&gt; &gt; the version reporting in the recipe.<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; - adding the -dev into the PV<br>
&gt; &gt; - injecting the &quot;base&quot; version into the build via -X (o=
r whatever mechanism the<br>
&gt; &gt; buld needs) ?<br>
&gt; &gt; <br>
&gt; &gt; Bruce<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; Having the coming regulations in mind (requiring accurate sb=
om and cve tracking), I&#39;d recommend everyone using meta-virtualization =
to just copy any used recipe, correct git hash and update crates.inc.<br>
&gt; &gt; <br>
&gt; &gt; &gt; Peter<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 &gt; -----Original Message-----<br>
&gt; &gt; &gt;=C2=A0 &gt; From: <a href=3D"mailto:meta-virtualization@lists=
.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject=
.org</a> &lt;meta-<br>
&gt; &gt; &gt;=C2=A0 &gt; <a href=3D"mailto:virtualization@lists.yoctoproje=
ct.org" target=3D"_blank">virtualization@lists.yoctoproject.org</a>&gt; On =
Behalf Of Patrick Vogelaar via<br>
&gt; &gt; &gt;=C2=A0 &gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"=
noreferrer" target=3D"_blank">lists.yoctoproject.org</a> (<a href=3D"http:/=
/lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">http://lists.=
yoctoproject.org</a>)<br>
&gt; &gt; &gt;=C2=A0 &gt; Sent: Tuesday, April 28, 2026 7:19 AM<br>
&gt; &gt; &gt;=C2=A0 &gt; To: <a href=3D"mailto:meta-virtualization@lists.y=
octoproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.o=
rg</a><br>
&gt; &gt; &gt;=C2=A0 &gt; Subject: [meta-virtualization] Podman version mis=
match<br>
&gt; &gt; &gt;=C2=A0 &gt; <br>
&gt; &gt; &gt;=C2=A0 &gt; Hi,<br>
&gt; &gt; &gt;=C2=A0 &gt; <br>
&gt; &gt; &gt;=C2=A0 &gt; I gave the newly upgraded podman recipe a try but=
 it seems that there is still a<br>
&gt; &gt; &gt;=C2=A0 &gt; version mismatch.<br>
&gt; &gt; &gt;=C2=A0 &gt; PV =3D &quot;5.8.2&quot; but: podman -v<br>
&gt; &gt; &gt;=C2=A0 &gt; podman version 5.8.3-dev<br>
&gt; &gt; &gt;=C2=A0 &gt; <br>
&gt; &gt; &gt;=C2=A0 &gt; Do you want me to send a patch or do you want to =
have a look at your update<br>
&gt; &gt; &gt;=C2=A0 &gt; script?<br>
&gt; &gt; &gt;=C2=A0 &gt; <br>
&gt; &gt; &gt;=C2=A0 &gt; Patrick<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; <br>
&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>
&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;=C2=A0 Links: You receive all messages sent to this group.<br>
&gt; &gt;=C2=A0 View/Reply Online (#9756): <a href=3D"https://lists.yoctopr=
oject.org/g/meta-virtualization/message/9756" rel=3D"noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/message/9756</=
a><br>
&gt; &gt;=C2=A0 Mute This Topic: <a href=3D"https://lists.yoctoproject.org/=
mt/119043966/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yo=
ctoproject.org/mt/119043966/1050810</a><br>
&gt; &gt;=C2=A0 Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.y=
octoproject.org</a><br>
&gt; &gt;=C2=A0 Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/me=
ta-virtualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; &gt;=C2=A0 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000939a5b0650848a24--

