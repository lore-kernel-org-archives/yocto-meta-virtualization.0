Return-Path: <hackdef@hack-defender.mx>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E39F9E00C60; Wed, 21 Nov 2018 09:16:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.166.182 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEE93E009AA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 09:16:01 -0800 (PST)
Received: by mail-it1-f182.google.com with SMTP id x124so13276047itd.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 09:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hack-defender-mx.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SR3aAERee9JO0eESxeztUd4uTTCGGA5cXAE07E/NQSU=;
	b=nuo7FQuOBBZiSr9dnGvt486i4FHZiXQXun90DLe1s9r6scF5dt9LeXYACFAIIIuQ1N
	BQyNGYCeHk6KOW0to58b5wIq3+J5gEiOFF9kk/2NRjg9Ssbe1D6QuCPt3J4LgsAmmaPC
	7Zo8WhyFR/BRQpx6TNVrbp449dh7IdnE3Ud1RIXHSlmZ1FlLEvGEEzYW1Bm2Vaw96mNQ
	3o7gO49OuUN8jpPCiV9AqShaLMZoQKmwYQMeab6bKtjPl8rno+Aqs8YqTUz7q6Km4uo6
	qFjuMa71OIXVcGWAFqjPslOsCizyOsbc5vYs80IlpI6Zyuf4AOxcD+K+17OQb+0eYyPn
	hYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SR3aAERee9JO0eESxeztUd4uTTCGGA5cXAE07E/NQSU=;
	b=Yl3hstjeLwhlSvx5YAbNsMnHcOVSg9EcoiSzVf9oZrJapWocwLOPnA5LvF1GDSNyrx
	klYbmxL4WV68zlR2kO8cw7j6Fjrc7lr8kWCJ5UqOpctbfJKPP9B70Ciq9oIDRIeHKPDO
	8fQtAwP1TVteqjRpjwRp1ihdObxnC4z1y5nfGxkaaO2BCYMMj3Xbsqi+lm/GtXIkufI+
	Nt7wtj9keyPr/wyXUmo0G5fD2S9LVLY8kiMyjCAIkZhqwv4/oh8OXRqN/cCRc0JtJdnJ
	L1unAi7LKJRYRDmdQypPHqo77Tt29v7HsXyu02BDXUielDbN4WwLRQDAUiuZq2fQ5H7p
	UU9A==
X-Gm-Message-State: AA+aEWahfJ4WDeeVouoavGNsrXRLX6xaNerQO+xPxShYyNGZvMGkYwTE
	OH384rh2jMYPFy+yog9+MUqN6lZ1X4aCqMdzh4kGSg==
X-Google-Smtp-Source: AFSGD/X8qQLnxqH14b648KVUTM6fySjv8zDZ9jlPSCDQ+rRygBof39y9+9E5Oo6oyFtfdiDKvIixbtpMhD3YCkED/24=
X-Received: by 2002:a02:6242:: with SMTP id
	d63-v6mr5950740jac.103.1542820561046; 
	Wed, 21 Nov 2018 09:16:01 -0800 (PST)
MIME-Version: 1.0
References: <CABOWBEftJQEUAkdHwcSKUq6ZEcOq9zJFNh5C0riFLHrbc4-UBw@mail.gmail.com>
	<CAPuovEKG9j0eYyY7tA=2S==vH_RmkjN1MTPLfNVMt_0sOY0S=Q@mail.gmail.com>
In-Reply-To: <CAPuovEKG9j0eYyY7tA=2S==vH_RmkjN1MTPLfNVMt_0sOY0S=Q@mail.gmail.com>
From: HackDef <hackdef@hack-defender.mx>
Date: Wed, 21 Nov 2018 09:15:50 -0800
Message-ID: <CABOWBEcuj_vcBZC1OWbyZ-NHvO0Jj85hur1YdNK+zN5yV3xOnQ@mail.gmail.com>
To: mark.asselstine@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Request to backport libvmi to krogoth
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 17:16:04 -0000
Content-Type: multipart/alternative; boundary="0000000000007e65db057b2fe7cc"

--0000000000007e65db057b2fe7cc
Content-Type: text/plain; charset="UTF-8"

Thanks Mark for the great recommendation.
Something that I tried so far and worked was to remove the libvirt
dependency in the libvmi recipe (since it is not needed by xen).

But your recommendation is great for other cases that wont be fixed by a
simple dependency removal.

Will check it out. Thanks.

On Wed, Nov 21, 2018 at 6:40 AM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Sat, Nov 17, 2018 at 4:29 AM HackDef <hackdef@hack-defender.mx> wrote:
> >
> > Recently libvmi recipe was added to meta-virtualization on master branch:
> >
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/libvmi/libvmi_git.bb
> >
> > But I use krogoth branch with my current board, so, tried to copy the
> recipe to krogoth branch but throw error on libvirt about: Nothing PROVIDES
> libxl, then added new dependencies found on libvirt from master and now
> throws: Nothing PROVIDES libdevmapper, so I guess the best approach should
> be to request backporting libvmi to krogoth branch.
> >
> > Your help is much appreciated.
>
> Hector,
>
> So what would have happened is krogoth was branched and then at some
> later time a commit was applied to master which added the
> libvmi_git.bb recipe. So start by using git to identify this commit,
> you can do this while on the krogoth branch still
> ie.: git log master -- ./recipes-extended/libvmi/libvmi_git.bb
>
> This will identify commit e2ab59ec3e4b547da635cda725090d42126dcfd2 as
> the commit which brought in the libvmi_git.bb recipe, so cherry-pick
> it
> ie: git cherry-pick e2ab59ec3e4b547da635cda725090d42126dcfd2
>
> Now attempt to build it 'bitbake libvmi', as you have indicated this
> most likely fail as libvirt will require libxl. DO NOT port the
> libvirt recipe from master back to krogoth, libvirt has been around
> for ages in meta-virtualization and libvmi does not have a version
> dependency on libvirt. Instead when you inspect the libvirt recipe
> already present on the krogoth branch you will see that libxl is a
> dependency we can control, we need to ensure we have a suitable
> PACKAGECONFIG for libvirt AND that "xen" is not set in the
> DISTRO_FEATURES. By default neither of these are set so without having
> access to your build I don't know where you are setting either of
> these, you will have to use bitbake -e libvmi or similar to find out
> where your build is setting either of these and mitigate against this.
>
> Try the above and follow up and we can then move on with any other
> bits. It is important that you can prep the backport as you have the
> krogoth build ready to go along with a usecase to test the backport,
> something Bruce will not have.
>
> Regards,
> Mark
>
>
>
> >
> > Please let me know if possible.
> >
> > Thanks
> >
> > --
> > Hector
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--0000000000007e65db057b2fe7cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Mark for the great recommendation.<div>Something th=
at I tried so far and worked was to remove the libvirt dependency in the li=
bvmi recipe (since it is not needed by xen).</div><div><br></div><div>But y=
our recommendation is great for other cases that wont be fixed by a simple =
dependency removal.</div><div><br></div><div>Will check it out. Thanks.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 21, 201=
8 at 6:40 AM Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windrive=
r.com">mark.asselstine@windriver.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Sat, Nov 17, 2018 at 4:29 AM HackDef &lt;<a href=3D"mai=
lto:hackdef@hack-defender.mx" target=3D"_blank">hackdef@hack-defender.mx</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Recently libvmi recipe was added to meta-virtualization on master bran=
ch:<br>
&gt;<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizati=
on/tree/recipes-extended/libvmi/libvmi_git.bb" rel=3D"noreferrer" target=3D=
"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree=
/recipes-extended/libvmi/libvmi_git.bb</a><br>
&gt;<br>
&gt; But I use krogoth branch with my current board, so, tried to copy the =
recipe to krogoth branch but throw error on libvirt about: Nothing PROVIDES=
 libxl, then added new dependencies found on libvirt from master and now th=
rows: Nothing PROVIDES libdevmapper, so I guess the best approach should be=
 to request backporting libvmi to krogoth branch.<br>
&gt;<br>
&gt; Your help is much appreciated.<br>
<br>
Hector,<br>
<br>
So what would have happened is krogoth was branched and then at some<br>
later time a commit was applied to master which added the<br>
<a href=3D"http://libvmi_git.bb" rel=3D"noreferrer" target=3D"_blank">libvm=
i_git.bb</a> recipe. So start by using git to identify this commit,<br>
you can do this while on the krogoth branch still<br>
ie.: git log master -- ./recipes-extended/libvmi/<a href=3D"http://libvmi_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">libvmi_git.bb</a><br>
<br>
This will identify commit e2ab59ec3e4b547da635cda725090d42126dcfd2 as<br>
the commit which brought in the <a href=3D"http://libvmi_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvmi_git.bb</a> recipe, so cherry-pick<br>
it<br>
ie: git cherry-pick e2ab59ec3e4b547da635cda725090d42126dcfd2<br>
<br>
Now attempt to build it &#39;bitbake libvmi&#39;, as you have indicated thi=
s<br>
most likely fail as libvirt will require libxl. DO NOT port the<br>
libvirt recipe from master back to krogoth, libvirt has been around<br>
for ages in meta-virtualization and libvmi does not have a version<br>
dependency on libvirt. Instead when you inspect the libvirt recipe<br>
already present on the krogoth branch you will see that libxl is a<br>
dependency we can control, we need to ensure we have a suitable<br>
PACKAGECONFIG for libvirt AND that &quot;xen&quot; is not set in the<br>
DISTRO_FEATURES. By default neither of these are set so without having<br>
access to your build I don&#39;t know where you are setting either of<br>
these, you will have to use bitbake -e libvmi or similar to find out<br>
where your build is setting either of these and mitigate against this.<br>
<br>
Try the above and follow up and we can then move on with any other<br>
bits. It is important that you can prep the backport as you have the<br>
krogoth build ready to go along with a usecase to test the backport,<br>
something Bruce will not have.<br>
<br>
Regards,<br>
Mark<br>
<br>
<br>
<br>
&gt;<br>
&gt; Please let me know if possible.<br>
&gt;<br>
&gt; Thanks<br>
&gt;<br>
&gt; --<br>
&gt; Hector<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
</blockquote></div>

--0000000000007e65db057b2fe7cc--
