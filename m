Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6858BE00CAA; Tue,  5 Jan 2016 08:48:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA389E0033E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 08:48:56 -0800 (PST)
Received: by mail-vk0-f53.google.com with SMTP id f2so230236439vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 08:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QWNtKrVleszxeeuKnLWfyfZJS5PVbUzD5XF6j7buFno=;
	b=sRDU4O+KfeuzYg54SQwHSgKZzW5nqaonSbIZqxPfxClDE2u4ZcYxkvo++rXpVqU3bE
	WU6PM5P/t5fDJ+fxyxMTya5XEPq7yz1uusf1QMeW+wgPs4szOTh/RaocsO2XuEZ7IZIO
	uwS1MT0ZLp4oclf7LfaHvE7YCXVO4q2cCa3ruXPBbRxKWShepuud1kuWSvugg3hSBZpj
	7HuIcFTarXdHA8C0yslnnHv62UEST85FRTVlCXZ2w7zT1/INHtxOtJ5zXFTfM7mtzI2/
	Oef09KNok0tNeEeNeqrJrLZBYRoL5u0mOAsJ2MJErbawBNTw9T/DQ8N1BJvD4NmBGHov
	YH6A==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr45033655vky.11.1452012535985;
	Tue, 05 Jan 2016 08:48:55 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 5 Jan 2016 08:48:55 -0800 (PST)
In-Reply-To: <568835A6.5060504@cardoe.com>
References: <1451663667-25116-1-git-send-email-cjp256@gmail.com>
	<568835A6.5060504@cardoe.com>
Date: Tue, 5 Jan 2016 11:48:55 -0500
Message-ID: <CADkTA4N_GO-DMBPmQNxKsOx9j8vmjOwdPOEwr=djcx7K4u4FVw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: package remus-netbuf-setup into xen-remus
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
X-List-Received-Date: Tue, 05 Jan 2016 16:48:58 -0000
Content-Type: multipart/alternative; boundary=001a1143158a6ab98505289903c1

--001a1143158a6ab98505289903c1
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Sat, Jan 2, 2016 at 3:40 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/1/16 9:54 AM, Chris Patterson wrote:
> > Package remus-netbuf-setup script which does not ship with
> > any existing package (throwing up a QA warning).
> >
> > Signed-off-by: Chris Patterson <cjp256@gmail.com>
> > ---
> >  recipes-extended/xen/xen.inc |    6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index d3a8b10..ac9796b 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -100,7 +100,10 @@ RDEPENDS_${PN}-misc = " \
> >      python \
> >      "
> >
> > -RDEPENDS_${PN}-remus = "python"
> > +RDEPENDS_${PN}-remus = " \
> > +    bash \
> > +    python \
> > +    "
> >
> >  RDEPENDS_${PN}-scripts-block = "\
> >      bash \
> > @@ -478,6 +481,7 @@ FILES_${PN}-qemu = " \
> >
> >  FILES_${PN}-remus = "\
> >      ${bindir}/remus \
> > +    ${sysconfdir}/xen/scripts/remus-netbuf-setup \
> >      "
> >
> >  FILES_${PN}-scripts-network = " \
> >
>
> Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
>
> --
> Doug Goldstein
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143158a6ab98505289903c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Sat, Jan 2, 2016 at 3:40 PM, Do=
ug Goldstein <span dir=3D"ltr">&lt;<a href=3D"mailto:cardoe@cardoe.com" tar=
get=3D"_blank">cardoe@cardoe.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 1/1/16 9:54 AM, Ch=
ris Patterson wrote:<br>
&gt; Package remus-netbuf-setup script which does not ship with<br>
&gt; any existing package (throwing up a QA warning).<br>
&gt;<br>
&gt; Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com"=
>cjp256@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/xen/xen.inc |=C2=A0 =C2=A0 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index d3a8b10..ac9796b 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -100,7 +100,10 @@ RDEPENDS_${PN}-misc =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -RDEPENDS_${PN}-remus =3D &quot;python&quot;<br>
&gt; +RDEPENDS_${PN}-remus =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 bash \<br>
&gt; +=C2=A0 =C2=A0 python \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS_${PN}-scripts-block =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bash \<br>
&gt; @@ -478,6 +481,7 @@ FILES_${PN}-qemu =3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 FILES_${PN}-remus =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${bindir}/remus \<br>
&gt; +=C2=A0 =C2=A0 ${sysconfdir}/xen/scripts/remus-netbuf-setup \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 FILES_${PN}-scripts-network =3D &quot; \<br>
&gt;<br>
<br>
</div></div>Reviewed-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe=
.com">cardoe@cardoe.com</a>&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span><br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail=
_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end&quot;</div>
</div>

--001a1143158a6ab98505289903c1--
