Return-Path: <bounce+256161.3a5685-meta-virtualization=yoctoproject.org@asterius.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A4ECE009D7; Mon, 28 Mar 2016 06:21:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 854 seconds by postgrey-1.32 at yocto-www;
	Mon, 28 Mar 2016 06:20:58 PDT
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21E16E0090E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Mar 2016 06:20:58 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1459171258; h=Content-Type: Cc: To: From: Subject:
	Message-ID: Date: References: In-Reply-To: MIME-Version: Sender;
	bh=0SuliLvU1ShuDiOuQPmQgGj8fV1ZQEfWVq5zWrDccxI=;
	b=hIaljHqS4M31ii+KdmxjiMR/E2Tnwvl4QqKHXNVfrQYJ0LntjYmleuMpM0RkX4x91JgtnVGa
	FOtK9LbpW4WkOHNGMN7n+NXDvEvbAIi7N+v7HY2z4D6g7Mz4rx2KgJHoMix1zCJ5GmA4owX3
	h6nx7eTFjr9wCGWKPUS+GOgmGcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: Date:
	Message-ID: Subject: From: To: Cc: Content-Type;
	b=wg50foLNdnqFN1ZrMDxrrPsh1TrnnflbbMRlzvSfODDTIuaAUbsM9KiDGNMKBIEzpFDC5R
	5TCXmI8Qj7mYNwkl5XA9oQEOnZXmQtGlZeFUfqpzCOyhSzuSHJsrbZWm349e/Yn5kM3zpdGs
	jTxu1UVGz5PHOLg+dyWlbElPiUd8Q=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIyMjRmYSIsICJtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmciLCAiM2E1Njg1Il0=
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mxa.mailgun.org with ESMTP id 56f92c61.7fc154531770-in3;
	Mon, 28 Mar 2016 13:06:41 -0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l20so54931878igf.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Mar 2016 06:06:41 -0700 (PDT)
X-Gm-Message-State: AD7BkJIxXcoFTn04vch3b83GE1sdaZykHC332dhzTCSlR0EA+tDYhOSAhaf/Jsp4LvcYLbBlAwmtf59kduzQeA==
MIME-Version: 1.0
X-Received: by 10.50.79.162 with SMTP id k2mr9749608igx.90.1459170400720; Mon,
	28 Mar 2016 06:06:40 -0700 (PDT)
Received: by 10.107.11.156 with HTTP; Mon, 28 Mar 2016 06:06:40 -0700 (PDT)
In-Reply-To: <CABZSBQea8AKjtfr+TdpVp9kk4uohFof9wHkLNBHZUXGZS4OKWw@mail.gmail.com>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<1458833491-7717-2-git-send-email-derek@asterius.io>
	<CABZSBQea8AKjtfr+TdpVp9kk4uohFof9wHkLNBHZUXGZS4OKWw@mail.gmail.com>
Date: Mon, 28 Mar 2016 09:06:40 -0400
X-Gmail-Original-Message-ID: <CADNbA1o6dqxSNUYgwggfdacMqx_aRM4RDN3DCi_PXL676TDvtQ@mail.gmail.com>
Message-ID: <CADNbA1o6dqxSNUYgwggfdacMqx_aRM4RDN3DCi_PXL676TDvtQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Mon, 28 Mar 2016 13:21:02 -0000
Content-Type: multipart/alternative; boundary=089e01160a0266e0cf052f1b95d0

--089e01160a0266e0cf052f1b95d0
Content-Type: text/plain; charset=UTF-8

I had the specific file called out for symlinking during do_deploy.  I can
wildcard the policy file here and symlink to the first one if more than one
policy file exists.  Right now I don't know of a case where more than one
policy is created, so it may never be an issue.

On Fri, Mar 25, 2016 at 9:26 PM, Chris Patterson <cjp256@gmail.com> wrote:

> On Thu, Mar 24, 2016 at 11:31 AM, Derek Straka <derek@asterius.io> wrote:
> > When using non-release versions, the policy files may have a different
> name (xenpolicy-${PV}-unstable).  Allow the policy file name to be
> configured by the xen recipe.
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  recipes-extended/xen/xen.inc | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index bc5ff85..77740cf 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -17,6 +17,8 @@ PACKAGECONFIG ??= " \
> >      ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
> >      "
> >
> > +FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
> > +
> >  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
> >  PACKAGECONFIG[xsm] =
> "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
> >  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> > @@ -343,7 +345,7 @@ FILES_${PN}-devd = "\
> >      "
> >
> >  FILES_${PN}-flask = "\
> > -    /boot/xenpolicy-${PV} \
> > +    /boot/${FLASK_POLICY_FILE} \
>
> Looks fine to me, but could this just simply be a wildcard (i.e.
> /boot/xenpolicy-*)?  Is there a case where it would generate multiple
> images and you would want to key off just one?
>

--089e01160a0266e0cf052f1b95d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I had the specific file called out for symlinking during d=
o_deploy.=C2=A0 I can wildcard the policy file here and symlink to the firs=
t one if more than one policy file exists.=C2=A0 Right now I don&#39;t know=
 of a case where more than one policy is created, so it may never be an iss=
ue.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, =
Mar 25, 2016 at 9:26 PM, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Mar 24, 20=
16 at 11:31 AM, Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek=
@asterius.io</a>&gt; wrote:<br>
&gt; When using non-release versions, the policy files may have a different=
 name (xenpolicy-${PV}-unstable).=C2=A0 Allow the policy file name to be co=
nfigured by the xen recipe.<br>
&gt;<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">d=
erek@asterius.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/xen/xen.inc | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index bc5ff85..77740cf 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -17,6 +17,8 @@ PACKAGECONFIG ??=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;XEN_TARGET_ARCH&#39;, &#=
39;x86_64&#39;, &#39;hvm&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; +FLASK_POLICY_FILE ?=3D &quot;xenpolicy-${PV}&quot;<br>
&gt; +<br>
&gt;=C2=A0 PACKAGECONFIG[sdl] =3D &quot;--enable-sdl,--disable-sdl,virtual/=
libsdl,&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[xsm] =3D &quot;--enable-xsmpolicy,--disable-xsmpol=
icy,checkpolicy-native,&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-syst=
emd,systemd,&quot;<br>
&gt; @@ -343,7 +345,7 @@ FILES_${PN}-devd =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 FILES_${PN}-flask =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 /boot/xenpolicy-${PV} \<br>
&gt; +=C2=A0 =C2=A0 /boot/${FLASK_POLICY_FILE} \<br>
<br>
</span>Looks fine to me, but could this just simply be a wildcard (i.e.<br>
/boot/xenpolicy-*)?=C2=A0 Is there a case where it would generate multiple<=
br>
images and you would want to key off just one?<br>
</blockquote></div><br></div>

--089e01160a0266e0cf052f1b95d0--
