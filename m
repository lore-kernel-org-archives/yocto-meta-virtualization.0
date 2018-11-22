Return-Path: <hackdef@hack-defender.mx>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2417CE00C95; Wed, 21 Nov 2018 18:43:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.166.50 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6E96E00C7C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 18:43:14 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id a3so5579588ioc.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 18:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hack-defender-mx.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9mFML3DyPCgd+RTiMwUnY6NxczOc5xkIf/Hf9L7L9G8=;
	b=fdSxVbXqItwFFs0czRtuGynYafqFKpQrm30iQcx9n002csmmEw+KWwhmzytMASgmx0
	Dj+OHUVXnqHTv4StKR/qMpcbm/UrjXWQwJlY7UQPywGZAfHgWpAxWM+/4wgHL3qEmLQ1
	vmeccG58yF0FmQG5F4SLZ7LkmWM3jmaZ4OqlRSuxBusl3dDJYyHFWBFgLt2a6bVuHaDp
	+T52E7BgO4Wc5xXRGqKp7IGAYA00GZy+3sStpViXkiAmbnE4EUHYwIfq0Q2UV0fZO0HL
	nSCcpjdvwZBgWTNvYMqKTdZUOLopKqBrzHwO3sHQDA2cRQgb4pk8dC3u0pZFNvsX6k6d
	bOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9mFML3DyPCgd+RTiMwUnY6NxczOc5xkIf/Hf9L7L9G8=;
	b=RJwSa7M9szEFyqzvg9NVld0ZWps7s04t9I0oGqptI4ZVeYLmWm3SUthxfarbZlv5hM
	9y61GsIiG0wEGL6ER0dwKjXpAwRc8ds4jyKbleBj1x5S3IrYhBryJDaTSmVAWPPJJHR7
	v+IFn/uOMRl+MGFuzAybiZ4csexVwx4GXEUof5tbTFo0/wXyfGnn5aw+axS0t9hD0wbS
	MDwjauEOXywDnmDFsNjsNzjVhixIJghush2eKbGy0+0uL2vEA82Da6+pexaUJYUIq7j3
	9bK9DyFKhjWpWKXH+sMwfHquzbScIahABqxEek37bCyW+7ZrDwO9JLwKus43zRVjdwYB
	m7rg==
X-Gm-Message-State: AA+aEWa3FNPYYPeaJGhjTDYV9qXUskTSPr5URnamOiL6NN9qqDhRiJWu
	xlmmdNAkCnKfCktAs1CtmC2RtVdRNlmv9NRB7ay9Fw==
X-Google-Smtp-Source: AFSGD/XMJ8GFgrUFzRwLDjeDtbP/xBlKGGViupyZfo3mwCe/1qKwhkvzmmbOVqvN3P1Ph55VkvsSWFFU77TIeyClDI0=
X-Received: by 2002:a6b:640e:: with SMTP id
	t14-v6mr6397837iog.213.1542854594034; 
	Wed, 21 Nov 2018 18:43:14 -0800 (PST)
MIME-Version: 1.0
References: <CABOWBEftJQEUAkdHwcSKUq6ZEcOq9zJFNh5C0riFLHrbc4-UBw@mail.gmail.com>
	<CAPuovEKG9j0eYyY7tA=2S==vH_RmkjN1MTPLfNVMt_0sOY0S=Q@mail.gmail.com>
	<CABOWBEcuj_vcBZC1OWbyZ-NHvO0Jj85hur1YdNK+zN5yV3xOnQ@mail.gmail.com>
	<CAPuovEJssvZu4u+dWcVu9R-5cvU=1Ee7h8OwrMHA9xRNc9bgYg@mail.gmail.com>
In-Reply-To: <CAPuovEJssvZu4u+dWcVu9R-5cvU=1Ee7h8OwrMHA9xRNc9bgYg@mail.gmail.com>
From: HackDef <hackdef@hack-defender.mx>
Date: Wed, 21 Nov 2018 18:43:03 -0800
Message-ID: <CABOWBEcrwtmK5n2d29EAsJtAPQtDEcBC7JPQhAGmXHWd6dCrQw@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Nov 2018 02:43:16 -0000
Content-Type: multipart/alternative; boundary="000000000000049774057b37d4d7"

--000000000000049774057b37d4d7
Content-Type: text/plain; charset="UTF-8"

Will do Mark, thanks!

On Wed, Nov 21, 2018 at 9:56 AM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Wed, Nov 21, 2018 at 12:16 PM HackDef <hackdef@hack-defender.mx> wrote:
> >
> > Thanks Mark for the great recommendation.
> > Something that I tried so far and worked was to remove the libvirt
> dependency in the libvmi recipe (since it is not needed by xen).
> >
> > But your recommendation is great for other cases that wont be fixed by a
> simple dependency removal.
> >
> > Will check it out. Thanks.
>
> To be honest I would have to go look at the origin of the 'libxl'
> dependency, I don't believe there is a recipe for this or any recipe
> which provides this in the 'master' branch of any of the main Yocto
> repos. At least nothing that is found in the index
> (https://layers.openembedded.org/layerindex/branch/master/recipes/).
>
> At any rate at this point you should be able to follow up to the list
> to ask Bruce to cherry pick the libvmi commit to krogoth.
>
> Mark
>
>
> >
> > On Wed, Nov 21, 2018 at 6:40 AM Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
> >>
> >> On Sat, Nov 17, 2018 at 4:29 AM HackDef <hackdef@hack-defender.mx>
> wrote:
> >> >
> >> > Recently libvmi recipe was added to meta-virtualization on master
> branch:
> >> >
> >> >
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/libvmi/libvmi_git.bb
> >> >
> >> > But I use krogoth branch with my current board, so, tried to copy the
> recipe to krogoth branch but throw error on libvirt about: Nothing PROVIDES
> libxl, then added new dependencies found on libvirt from master and now
> throws: Nothing PROVIDES libdevmapper, so I guess the best approach should
> be to request backporting libvmi to krogoth branch.
> >> >
> >> > Your help is much appreciated.
> >>
> >> Hector,
> >>
> >> So what would have happened is krogoth was branched and then at some
> >> later time a commit was applied to master which added the
> >> libvmi_git.bb recipe. So start by using git to identify this commit,
> >> you can do this while on the krogoth branch still
> >> ie.: git log master -- ./recipes-extended/libvmi/libvmi_git.bb
> >>
> >> This will identify commit e2ab59ec3e4b547da635cda725090d42126dcfd2 as
> >> the commit which brought in the libvmi_git.bb recipe, so cherry-pick
> >> it
> >> ie: git cherry-pick e2ab59ec3e4b547da635cda725090d42126dcfd2
> >>
> >> Now attempt to build it 'bitbake libvmi', as you have indicated this
> >> most likely fail as libvirt will require libxl. DO NOT port the
> >> libvirt recipe from master back to krogoth, libvirt has been around
> >> for ages in meta-virtualization and libvmi does not have a version
> >> dependency on libvirt. Instead when you inspect the libvirt recipe
> >> already present on the krogoth branch you will see that libxl is a
> >> dependency we can control, we need to ensure we have a suitable
> >> PACKAGECONFIG for libvirt AND that "xen" is not set in the
> >> DISTRO_FEATURES. By default neither of these are set so without having
> >> access to your build I don't know where you are setting either of
> >> these, you will have to use bitbake -e libvmi or similar to find out
> >> where your build is setting either of these and mitigate against this.
> >>
> >> Try the above and follow up and we can then move on with any other
> >> bits. It is important that you can prep the backport as you have the
> >> krogoth build ready to go along with a usecase to test the backport,
> >> something Bruce will not have.
> >>
> >> Regards,
> >> Mark
> >>
> >>
> >>
> >> >
> >> > Please let me know if possible.
> >> >
> >> > Thanks
> >> >
> >> > --
> >> > Hector
> >> > --
> >> > _______________________________________________
> >> > meta-virtualization mailing list
> >> > meta-virtualization@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000049774057b37d4d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do Mark, thanks!</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Wed, Nov 21, 2018 at 9:56 AM Mark Asselstine &lt;<a hre=
f=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstin=
e@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On W=
ed, Nov 21, 2018 at 12:16 PM HackDef &lt;<a href=3D"mailto:hackdef@hack-def=
ender.mx" target=3D"_blank">hackdef@hack-defender.mx</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks Mark for the great recommendation.<br>
&gt; Something that I tried so far and worked was to remove the libvirt dep=
endency in the libvmi recipe (since it is not needed by xen).<br>
&gt;<br>
&gt; But your recommendation is great for other cases that wont be fixed by=
 a simple dependency removal.<br>
&gt;<br>
&gt; Will check it out. Thanks.<br>
<br>
To be honest I would have to go look at the origin of the &#39;libxl&#39;<b=
r>
dependency, I don&#39;t believe there is a recipe for this or any recipe<br=
>
which provides this in the &#39;master&#39; branch of any of the main Yocto=
<br>
repos. At least nothing that is found in the index<br>
(<a href=3D"https://layers.openembedded.org/layerindex/branch/master/recipe=
s/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedded.org/la=
yerindex/branch/master/recipes/</a>).<br>
<br>
At any rate at this point you should be able to follow up to the list<br>
to ask Bruce to cherry pick the libvmi commit to krogoth.<br>
<br>
Mark<br>
<br>
<br>
&gt;<br>
&gt; On Wed, Nov 21, 2018 at 6:40 AM Mark Asselstine &lt;<a href=3D"mailto:=
mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.=
com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Nov 17, 2018 at 4:29 AM HackDef &lt;<a href=3D"mailto:hack=
def@hack-defender.mx" target=3D"_blank">hackdef@hack-defender.mx</a>&gt; wr=
ote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Recently libvmi recipe was added to meta-virtualization on ma=
ster branch:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-vir=
tualization/tree/recipes-extended/libvmi/libvmi_git.bb" rel=3D"noreferrer" =
target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualiza=
tion/tree/recipes-extended/libvmi/libvmi_git.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; But I use krogoth branch with my current board, so, tried to =
copy the recipe to krogoth branch but throw error on libvirt about: Nothing=
 PROVIDES libxl, then added new dependencies found on libvirt from master a=
nd now throws: Nothing PROVIDES libdevmapper, so I guess the best approach =
should be to request backporting libvmi to krogoth branch.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Your help is much appreciated.<br>
&gt;&gt;<br>
&gt;&gt; Hector,<br>
&gt;&gt;<br>
&gt;&gt; So what would have happened is krogoth was branched and then at so=
me<br>
&gt;&gt; later time a commit was applied to master which added the<br>
&gt;&gt; <a href=3D"http://libvmi_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libvmi_git.bb</a> recipe. So start by using git to identify this commit=
,<br>
&gt;&gt; you can do this while on the krogoth branch still<br>
&gt;&gt; ie.: git log master -- ./recipes-extended/libvmi/<a href=3D"http:/=
/libvmi_git.bb" rel=3D"noreferrer" target=3D"_blank">libvmi_git.bb</a><br>
&gt;&gt;<br>
&gt;&gt; This will identify commit e2ab59ec3e4b547da635cda725090d42126dcfd2=
 as<br>
&gt;&gt; the commit which brought in the <a href=3D"http://libvmi_git.bb" r=
el=3D"noreferrer" target=3D"_blank">libvmi_git.bb</a> recipe, so cherry-pic=
k<br>
&gt;&gt; it<br>
&gt;&gt; ie: git cherry-pick e2ab59ec3e4b547da635cda725090d42126dcfd2<br>
&gt;&gt;<br>
&gt;&gt; Now attempt to build it &#39;bitbake libvmi&#39;, as you have indi=
cated this<br>
&gt;&gt; most likely fail as libvirt will require libxl. DO NOT port the<br=
>
&gt;&gt; libvirt recipe from master back to krogoth, libvirt has been aroun=
d<br>
&gt;&gt; for ages in meta-virtualization and libvmi does not have a version=
<br>
&gt;&gt; dependency on libvirt. Instead when you inspect the libvirt recipe=
<br>
&gt;&gt; already present on the krogoth branch you will see that libxl is a=
<br>
&gt;&gt; dependency we can control, we need to ensure we have a suitable<br=
>
&gt;&gt; PACKAGECONFIG for libvirt AND that &quot;xen&quot; is not set in t=
he<br>
&gt;&gt; DISTRO_FEATURES. By default neither of these are set so without ha=
ving<br>
&gt;&gt; access to your build I don&#39;t know where you are setting either=
 of<br>
&gt;&gt; these, you will have to use bitbake -e libvmi or similar to find o=
ut<br>
&gt;&gt; where your build is setting either of these and mitigate against t=
his.<br>
&gt;&gt;<br>
&gt;&gt; Try the above and follow up and we can then move on with any other=
<br>
&gt;&gt; bits. It is important that you can prep the backport as you have t=
he<br>
&gt;&gt; krogoth build ready to go along with a usecase to test the backpor=
t,<br>
&gt;&gt; something Bruce will not have.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Mark<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please let me know if possible.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Hector<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; meta-virtualization mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/listinfo/meta-virtualization</a><br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
</blockquote></div>

--000000000000049774057b37d4d7--
