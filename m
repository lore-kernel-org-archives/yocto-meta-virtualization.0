Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EA53E01716
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Nov 2013 18:55:12 -0800 (PST)
Received: by mail-lb0-f171.google.com with SMTP id x18so6201749lbi.30
	for <meta-virtualization@yoctoproject.org>;
	Mon, 04 Nov 2013 18:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+FXrFeFlhmJzSjtrGxrBzo5tpu/q+IME42dTTeOSiUo=;
	b=rqeszN+pBFXAvND9R69EeukPYFX4b+vE+zWSBHCXGmnwLM5wX7bRkso3DdWFFP57Ru
	84pmu5ZD80BwAS5fGuzICbVA1MKUOOwRlWOM4dZgbe5usQJf5QzowRKMWnMgRZGSsSOp
	YkN6cnzM/gkLLTNwxR3mz0ET+f1A9M1t7808ccQ9ASH0jRRfz4yJH6BMWa62qtdmNGmO
	6W3PX92EFCJHeVCOk9KQWyb+/e6B+BhgmHdSzWsIXmvXy8ivzyAkE4oAHkrtcAFZtDVj
	mijIZXkuZ1zg+PE73zOkY3nVCyi1efZyh4YkEmcMq8lOU3WMFHobsngO6gE6nuWxbmNi
	5oHQ==
MIME-Version: 1.0
X-Received: by 10.112.205.164 with SMTP id lh4mr12997958lbc.15.1383620111019; 
	Mon, 04 Nov 2013 18:55:11 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Mon, 4 Nov 2013 18:55:10 -0800 (PST)
In-Reply-To: <CADkTA4Nsa=Qd3V=9JrV_Xr++4rE-ia9+=1DPSdHReaNwrJctQA@mail.gmail.com>
References: <1382998249-3028-1-git-send-email-flihp@twobit.us>
	<CADkTA4Nsa=Qd3V=9JrV_Xr++4rE-ia9+=1DPSdHReaNwrJctQA@mail.gmail.com>
Date: Mon, 4 Nov 2013 21:55:10 -0500
Message-ID: <CABZSBQfuwRW6rKgT3eYeSi76F9di2E5aoGaULOeV6HszPoqjcQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] Xen: start using PACKAGECONFIG
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
X-List-Received-Date: Tue, 05 Nov 2013 02:55:20 -0000
Content-Type: multipart/alternative; boundary=001a11c3c87e38b22a04ea6529ad

--001a11c3c87e38b22a04ea6529ad
Content-Type: text/plain; charset=ISO-8859-1

I would remove xsm from the default PACKAGECONFIG list.  As it stands with
the defaults, the recipe now requires checkpolicy-native (in meta-selinux)
to build.

Cheers,
-Chris

On Tue, Oct 29, 2013 at 2:20 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Mon, Oct 28, 2013 at 6:10 PM, Philip Tricca <flihp@twobit.us> wrote:
> > This is a first pass at cleaning up the DEPENDS and do_configure in
> > the xen_4.3.0 recipe. Adding XSM stuff made it clear that directly
> > interacting with DISTRO_FEATURES was the wrong way to do it. That and
> > when Chris and I ment up at LinuxCon he told me I should have used
> > PACKAGECONFIG in the first place :P
>
> :)
>
> >
> > This small patch series is the first step to handling features (like
> > sdl) using PACKAGECONFIG.
>
> Agreed. Small steps are good. This looks fine to me. I grabbed the series,
> since no one has offered an objection!
>
> Bruce
>
> >
> > Philip Tricca (2):
> >   Convert direct call to ./configure with oe_runconf and EXTRA_OECONF.
> >   Use PACKAGECONFIG to deal with XSM policy.
> >
> >  recipes-extended/xen/xen_4.3.0.bb |   19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > --
> > 1.7.10.4
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--001a11c3c87e38b22a04ea6529ad
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>I would remove xsm from the default PACKAGE=
CONFIG list.=A0=20
As it stands with the defaults, the recipe now requires=20
checkpolicy-native (in meta-selinux) to build.<br></div><br></div>Cheers,<b=
r></div>
-Chris<div><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 29, 2013 at 2:20 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div>On Mon, Oct 28, 2013=
 at 6:10 PM, Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us" target=3D=
"_blank">flihp@twobit.us</a>&gt; wrote:<br>


&gt; This is a first pass at cleaning up the DEPENDS and do_configure in<br=
>
&gt; the xen_4.3.0 recipe. Adding XSM stuff made it clear that directly<br>
&gt; interacting with DISTRO_FEATURES was the wrong way to do it. That and<=
br>
&gt; when Chris and I ment up at LinuxCon he told me I should have used<br>
&gt; PACKAGECONFIG in the first place :P<br>
<br>
</div>:)<br>
<div><br>
&gt;<br>
&gt; This small patch series is the first step to handling features (like<b=
r>
&gt; sdl) using PACKAGECONFIG.<br>
<br>
</div>Agreed. Small steps are good. This looks fine to me. I grabbed the se=
ries,<br>
since no one has offered an objection!<br>
<br>
Bruce<br>
<div><br>
&gt;<br>
&gt; Philip Tricca (2):<br>
&gt; =A0 Convert direct call to ./configure with oe_runconf and EXTRA_OECON=
F.<br>
&gt; =A0 Use PACKAGECONFIG to deal with XSM policy.<br>
&gt;<br>
&gt; =A0recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_bla=
nk">xen_4.3.0.bb</a> | =A0 19 +++++++++++++++++--<br>
&gt; =A01 file changed, 17 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<br>
<br>
<br>
</div><span><font color=3D"#888888">--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span><div><div>_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br></div></div></div></div></div>

--001a11c3c87e38b22a04ea6529ad--
