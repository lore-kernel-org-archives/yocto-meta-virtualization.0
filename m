Return-Path: <supritisingh08@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B239DE00B5A; Wed, 17 Feb 2016 06:53:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (supritisingh08[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1E7DE00B3D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Feb 2016 06:53:04 -0800 (PST)
Received: by mail-lf0-f43.google.com with SMTP id j78so12418532lfb.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Feb 2016 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hgNQHP8D0fFdU+jcByht2N4pBVyUijbZNMgvLyBO1Zg=;
	b=eiA2NGFDJE0e34ykXQqLTao098YFPHimfxezaQ5tFKRhcYSTIN4R85U8liiAiTsGxk
	pLE+5zOfVYj/pQEEA7XKskmGyKsoeei5D+mIQOjMV2ZXmg5hXuSru8hLmsHvpeksgnqa
	a59+vpe31dI33kisf37ku5TcZDfylbvOaZmETLGk/8puFhMYL/MVgnXMyiCn8v+Yrdty
	dZp4M4Oom8D+zrRpEXAa75i+J4mnpi/x+W3eC4o/W3S6NFKR77GClv91h7VpcrxlFut9
	lhX3KUuA11tn3EJEMVc4SfDe/zWQYDx4YmwEtRiOncwjmUYvFfNuA2A1Z8bwcEFsfBU1
	gaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hgNQHP8D0fFdU+jcByht2N4pBVyUijbZNMgvLyBO1Zg=;
	b=W0vjqP5+xfs3L0xA3BqMicfvwToznnYKsreJ9qyOZc/uduMjTWlS/xzhrgz92qTGYe
	lp0kv4wAnffv16bBn6oFCjqOvf4DgruLlT8IgLQGPsOWpGTaHGY/NSZncA9ttGazsTZ6
	FmNkzHdaiS0wMLa5pqnmPWB96pMHeKcJP+YkVoL0Le2dGhJzBcWjOfo1fwyVoEm0OHFp
	mkbHjEV8MA0o73IzuMeP6aji9lO5azxzYHvo3+1O8FehPzQARgV/ojGy1DZouDKSgy1O
	o9Y5lJBY1MRh52T4qvtdGBWnc1GBYg7rshEdSkJeTA6JAatD520pH01vITqTtWzPGGlJ
	AQWA==
X-Gm-Message-State: AG10YOQYtGTsd7IDt7M8/pd2cj+oYqF5GO2QfQaBIkzjNMjoRbWgH5CO+8QNa2xngSe8AL10lgNlT+5A0BrEaw==
MIME-Version: 1.0
X-Received: by 10.25.209.80 with SMTP id i77mr968282lfg.33.1455720783399; Wed,
	17 Feb 2016 06:53:03 -0800 (PST)
Received: by 10.114.78.195 with HTTP; Wed, 17 Feb 2016 06:53:03 -0800 (PST)
In-Reply-To: <CAPuovEL=ugK+1VpVcNk3go=rQssAsowVqt_bOXBfc5b6MRt5sQ@mail.gmail.com>
References: <CAO1oV+fmmzZ4XdV2BkgqH+Xoy-jdMRZ1msEfGaAOe-jOtQEjPg@mail.gmail.com>
	<CAPuovEL=ugK+1VpVcNk3go=rQssAsowVqt_bOXBfc5b6MRt5sQ@mail.gmail.com>
Date: Wed, 17 Feb 2016 15:53:03 +0100
Message-ID: <CAO1oV+df4nC1S_MT2DayDoHZOZDvvDS8nhZ5pf9yxhUQ9iSTAw@mail.gmail.com>
From: Supriti Singh <supritisingh08@gmail.com>
To: Mark Asselstine <asselsm@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Getting virtualization running on mbmax yocto
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
X-List-Received-Date: Wed, 17 Feb 2016 14:53:06 -0000
Content-Type: multipart/alternative; boundary=001a11412ca42fd22e052bf86871

--001a11412ca42fd22e052bf86871
Content-Type: text/plain; charset=UTF-8

Thanks

I just used the latest version and it compiled.

On Sat, Feb 13, 2016 at 4:37 AM, Mark Asselstine <asselsm@gmail.com> wrote:

> On Tue, Feb 9, 2016 at 4:22 AM, Supriti Singh <supritisingh08@gmail.com>
> wrote:
> > Hello,
> >
> > I have a Minnowboard Max.
> > I followed the instructions http://wiki.minnowboard.org/Yocto_Project
> from
> > here to get a yocto kernel running on the board.
>
> These instructions detail the use of the 'fido' release/branch.
>
> >
> > I want to enable virtualization with kvm.
> >
> > My source hierarchy is :
> > $HOME/source/poky/"all the layers".
> >
> > To add the meta-virtualization layer, I added the following into the
> > bblayers.conf
> > BBLAYERS += "/local/source/poky/meta-openembedded/meta-networking"
> > BBLAYERS += "/local/source/poky/meta-openembedded/meta-python"
> > BBLAYERS += "/local/source/poky/meta-openembedded/meta-oe"
> > BBLAYERS += "/local/source/poky/meta-openembedded/meta-filesystems"
> > BBLAYERS += "/local/source/poky/meta-virtualization"
> >
> >
> > When I do a build, I get the following errror:
> > ERROR: ParseError at
> > /local/source/poky/meta-virtualization/recipes-extended/images/
> cloud-image-controller.bb:29:
> > Could not inherit file classes/image-vm.bbclass
>
> This bbclass wasn't added until *after* fido was released.
>
>
> >
> > Is there something else that I need to do?
>
> You can attempt to 'rewind' meta-virtualization to match what existed
> when fido was
> released. Try to reset meta-virtualization prior to
> commit e50e36cfa3898b1defcbffe9f3fd0a20403c8de3
>
> No guarantees this will work but worth a try.
>
> Regards,
> Mark
>
>
> >
> >
> > Thanks,
> > Supriti
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>

--001a11412ca42fd22e052bf86871
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks<div><br></div><div>I just used the latest version a=
nd it compiled.=C2=A0</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sat, Feb 13, 2016 at 4:37 AM, Mark Asselstine <span dir=
=3D"ltr">&lt;<a href=3D"mailto:asselsm@gmail.com" target=3D"_blank">asselsm=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Tue, Feb 9, 2016 at 4:22 AM, Supriti Singh &lt;<a href=3D"mailt=
o:supritisingh08@gmail.com">supritisingh08@gmail.com</a>&gt; wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I have a Minnowboard Max.<br>
&gt; I followed the instructions <a href=3D"http://wiki.minnowboard.org/Yoc=
to_Project" rel=3D"noreferrer" target=3D"_blank">http://wiki.minnowboard.or=
g/Yocto_Project</a> from<br>
&gt; here to get a yocto kernel running on the board.<br>
<br>
</span>These instructions detail the use of the &#39;fido&#39; release/bran=
ch.<br>
<span class=3D""><br>
&gt;<br>
&gt; I want to enable virtualization with kvm.<br>
&gt;<br>
&gt; My source hierarchy is :<br>
&gt; $HOME/source/poky/&quot;all the layers&quot;.<br>
&gt;<br>
&gt; To add the meta-virtualization layer, I added the following into the<b=
r>
&gt; bblayers.conf<br>
&gt; BBLAYERS +=3D &quot;/local/source/poky/meta-openembedded/meta-networki=
ng&quot;<br>
&gt; BBLAYERS +=3D &quot;/local/source/poky/meta-openembedded/meta-python&q=
uot;<br>
&gt; BBLAYERS +=3D &quot;/local/source/poky/meta-openembedded/meta-oe&quot;=
<br>
&gt; BBLAYERS +=3D &quot;/local/source/poky/meta-openembedded/meta-filesyst=
ems&quot;<br>
&gt; BBLAYERS +=3D &quot;/local/source/poky/meta-virtualization&quot;<br>
&gt;<br>
&gt;<br>
&gt; When I do a build, I get the following errror:<br>
&gt; ERROR: ParseError at<br>
&gt; /local/source/poky/meta-virtualization/recipes-extended/images/<a href=
=3D"http://cloud-image-controller.bb:29" rel=3D"noreferrer" target=3D"_blan=
k">cloud-image-controller.bb:29</a>:<br>
&gt; Could not inherit file classes/image-vm.bbclass<br>
<br>
</span>This bbclass wasn&#39;t added until *after* fido was released.<br>
<span class=3D""><br>
<br>
&gt;<br>
&gt; Is there something else that I need to do?<br>
<br>
</span>You can attempt to &#39;rewind&#39; meta-virtualization to match wha=
t existed<br>
when fido was<br>
released. Try to reset meta-virtualization prior to<br>
commit e50e36cfa3898b1defcbffe9f3fd0a20403c8de3<br>
<br>
No guarantees this will work but worth a try.<br>
<br>
Regards,<br>
Mark<br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Supriti<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a11412ca42fd22e052bf86871--
