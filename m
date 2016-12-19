Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E40EE00CF2; Sun, 18 Dec 2016 19:43:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE663E00AAB
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:43:13 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id n204so3837597qke.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1tp4+m33iIgBS7CZ7Rv4+GvmA+yClak1WjmOR9vmayA=;
	b=UeK6Jbv+9ThZp8yeez2vlxanf6IqkNWyrqJUGkpeZyK+XfZMWmmZl0KBAJzHrAAvVT
	PdNjNrIhpMc7SoLo16FO4ut0xDqT/I2me2j2lCCG5890Jp1X2hZO8jNB3oqoF4rc9ydy
	7Dw9OR9xoZv7hNs89F3qJUpQVgdnDjxjBZwHkhCFBOkoDxhfv23Qyc147mYhP5ILiDfr
	zDig0qlZ7evD5oC445Pg38/PIqID1sroFNH2fg/ElYKguds6tbwXYmYKD6awvtEB30Me
	cFitI6Ub32vwxSWFko9FB/I/IARHZKny8slkkyAT2ei/b/qd/KuihXkkrxfRqqrRpyUm
	3JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1tp4+m33iIgBS7CZ7Rv4+GvmA+yClak1WjmOR9vmayA=;
	b=Wmyb3tHU6mlAOawXbWQ/VTrnCIqvV89vma9e9allVE2gFHogeoiiMS/NJK4B7y8sUs
	2GT6glDMGgkWHvXw1fmMxJFv625wFxHRaoBzDoTxYt+68QkpA0Af5CUx7kAiIb7EB8lN
	NMRHeYJtkW8ilx2L3RBstE1qKOG4qlWvmfIO6BtLh48NKNV6eGDfxmO1Ul96yBBWQUuX
	ndI9r5oE0/nOakv5E4MgrWXgt+UlewOcQxslSOu9TfF0skRWtrFslcNCrZ9Flsu8gtc+
	nPrsifzJGgb5s58RThk+g4g/aw6ktp7y2ScAtWn9Uw+OWhDOIOtDB8hprU5q8xTIP9YT
	TRGg==
X-Gm-Message-State: AIkVDXL1A1Z4c5y994b9H1ojR1afMAkxnEbeq20jEWR283nIeTaLkt2gTrmH8riaFPDKK31qH1XRYUilaU4OBg==
X-Received: by 10.55.68.80 with SMTP id r77mr1208241qka.318.1482118993102;
	Sun, 18 Dec 2016 19:43:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Sun, 18 Dec 2016 19:43:12 -0800 (PST)
In-Reply-To: <38074716-dc39-3395-baee-04d2a8cd1aa4@cardoe.com>
References: <1453525067-2109-1-git-send-email-cardoe@cardoe.com>
	<38074716-dc39-3395-baee-04d2a8cd1aa4@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Dec 2016 22:43:12 -0500
Message-ID: <CADkTA4N8k-6ggON1L+3qPqLzd70v322Br1O3=n3abRCRfHnknw@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen-image-minimal: if DISTRO_FEATURES is missing xen error
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
X-List-Received-Date: Mon, 19 Dec 2016 03:43:16 -0000
Content-Type: multipart/alternative; boundary=001a11489cfc19643b0543fab849

--001a11489cfc19643b0543fab849
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 16, 2016 at 12:27 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/22/16 10:57 PM, Doug Goldstein wrote:
> > It can be confusing to users why things are failing with missing kernel
> > dependencies when you don't have 'xen' in your DISTRO_FEATURES. This
> > should provide them with some better info.
> >
> > Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> > ---
> >
> > The result of this change is the following output:
> >
> > | DEBUG: Executing shell function do_check_xen_state
> > | ERROR: DISTRO_FEATURES does not contain 'xen'
> > | WARNING: exit code 1 from a shell command.
> >
> > ---
> >  recipes-extended/images/xen-image-minimal.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/recipes-extended/images/xen-image-minimal.bb
> b/recipes-extended/images/xen-image-minimal.bb
> > index 26b6d06..b8c2002 100644
> > --- a/recipes-extended/images/xen-image-minimal.bb
> > +++ b/recipes-extended/images/xen-image-minimal.bb
> > @@ -20,6 +20,14 @@ LICENSE = "MIT"
> >
> >  inherit core-image
> >
> > +do_check_xen_state() {
> > +    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no',
> d)}" = "no" ]; then
> > +        die "DISTRO_FEATURES does not contain 'xen'"
> > +    fi
> > +}
> > +
> > +addtask check_xen_state before do_rootfs
> > +
> >  syslinux_iso_populate_append() {
> >       install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32
> ${ISODIR}${ISOLINUXDIR}
> >       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32
> ${ISODIR}${ISOLINUXDIR}
> >
>
> Ping? This would have solved Andrew Stuart's thread from 11/11/16.
>

Yep, looks fine .. again, I'm not sure how this was missed. I'll merge it
shortly.

Bruce


>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11489cfc19643b0543fab849
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Dec 16, 2016 at 12:27 PM, Doug Goldstein <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"=
><div class=3D"h5">On 1/22/16 10:57 PM, Doug Goldstein wrote:<br>
&gt; It can be confusing to users why things are failing with missing kerne=
l<br>
&gt; dependencies when you don&#39;t have &#39;xen&#39; in your DISTRO_FEAT=
URES. This<br>
&gt; should provide them with some better info.<br>
&gt;<br>
&gt; Signed-off-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com"=
>cardoe@cardoe.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; The result of this change is the following output:<br>
&gt;<br>
&gt; | DEBUG: Executing shell function do_check_xen_state<br>
&gt; | ERROR: DISTRO_FEATURES does not contain &#39;xen&#39;<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" =
rel=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a> | 8 ++++=
++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/images/<a href=3D"http://xen-image-minim=
al.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a> b=
/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a><br>
&gt; index 26b6d06..b8c2002 100644<br>
&gt; --- a/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" =
rel=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a><br>
&gt; +++ b/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" =
rel=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a><br>
&gt; @@ -20,6 +20,14 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit core-image<br>
&gt;<br>
&gt; +do_check_xen_state() {<br>
&gt; +=C2=A0 =C2=A0 if [ &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;, &#39;xen&#39;, &#39; yes&#39;, &#39;no&#39;, d)}&quot; =3D &quot;n=
o&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 die &quot;DISTRO_FEATURES does not contai=
n &#39;xen&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +addtask check_xen_state before do_rootfs<br>
&gt; +<br>
&gt;=C2=A0 syslinux_iso_populate_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0444 ${STAGING_DATADIR}/syslinux/=
<wbr>libcom32.c32 ${ISODIR}${ISOLINUXDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0444 ${STAGING_DATADIR}/syslinux/=
<wbr>mboot.c32 ${ISODIR}${ISOLINUXDIR}<br>
&gt;<br>
<br>
</div></div>Ping? This would have solved Andrew Stuart&#39;s thread from 11=
/11/16.<br></blockquote><div><br></div><div>Yep, looks fine .. again, I&#39=
;m not sure how this was missed. I&#39;ll merge it shortly.</div><div><br><=
/div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a11489cfc19643b0543fab849--
