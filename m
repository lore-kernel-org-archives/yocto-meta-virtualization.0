Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C787E00D3A; Tue, 21 May 2019 07:42:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BE93E00C46
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 May 2019 07:42:41 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id f1so13322082lfl.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 May 2019 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8apxssVUzmOc8XmoR8gVv8ffIf89R4FUOckP1YsfqIs=;
	b=pegggm8rMqkLedl9fciTNzhaWhNCptk2aZ3+ftd5Oz+GCH6ymAAV5CN8LQFvA2/tWq
	Qlv6aDQoKke6O9XqLdd0ZeFz4lvu8QGqVDajlvURYfFjiJAzEDnp1CqMQ0lGYSF1mcif
	B1oSYBB7xMJ47yIKkN5gZJROoON7tH9Gk8fX8yoz8ti4ft/ZjMBgxmWl6DZEWtmreOqP
	MjF2l46+6Q+DO15j1ZcbpjHo2kndqLCmsCGSh7vuPVKGeI+xY62euK65jLJT7eVAy2WJ
	Ys/rJNfgOuvKltX+NDmWoIJWFzQMI3i+vz/tzMt740DHQPQNA9fziXTKtCARYwuBQQy/
	aYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8apxssVUzmOc8XmoR8gVv8ffIf89R4FUOckP1YsfqIs=;
	b=WP5reY1YRS1yHWi6fh0Z2vhZkWOOevcFO18QjRELasMG29KLTFOc0/hKzO6oyU0bR4
	RtDnfSYtSQ08D+13ph4/TpPrgCuLJQRLW396X0p2oa3YSZ+Ig0OGBCwrMGu1mDIW9s1T
	Rl4w2qI7fU50xP4d3YFmxUb4Aq2nV6BqEnBHlPJ67LhsxeHwz2AgQQUcPpxKgb0yXdsT
	bf8Ct5xZERV7tNqAeQl35sreuwL1qmdzjK6gL3ZpX4bAxwxoLo9IR6ZNQvfpZToiH0ZU
	/GTVKlugcVWqBqk+9zOPPiziPA8DPWZ0MSXBubgWKdUz0Bz535V7tiaYyKx3eVlBXsqz
	tI7A==
X-Gm-Message-State: APjAAAVinahgrFD7AYrY97ntmnIFcjW8b/YIYNaPoX80ob/J4e3E9IaB
	cR/ec/w/qqS1EYtpqA1yFRrGDSgt0fzYrTuKf8o=
X-Google-Smtp-Source: APXvYqwFGFKKZjukdUWH/oiT+WtjPOfdR1SCPsgr+QliH4PXatZrgfVRvfUWkeZfsyxWTvKiEhmo35SDiPsOWPXjzyM=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr29720719lfh.76.1558449760485; 
	Tue, 21 May 2019 07:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190517230102.32009-1-christopher.w.clark@gmail.com>
In-Reply-To: <20190517230102.32009-1-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 May 2019 10:42:29 -0400
Message-ID: <CADkTA4PPXjuTp4oWU1LDSzm=KHwu+GV2Ah1Ffw-e+JhKV8GCjg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] xen: update packaging for pkgconfig files in libdir
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
X-List-Received-Date: Tue, 21 May 2019 14:42:43 -0000
Content-Type: multipart/alternative; boundary="0000000000005fc6f4058966dcb0"

--0000000000005fc6f4058966dcb0
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, May 17, 2019 at 7:01 PM <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Xen commit a0f98145 changed the installation directory for pkgconfig
> files, so update recipe to include the .pc files at their new location.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen.inc | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 52780d6..628e52b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -285,101 +285,118 @@ FILES_${PN}-staticdev += "\
>  FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
>  FILES_${PN}-libblktapctl-dev = " \
>      ${libdir}/libblktapctl.so \
> +    ${libdir}/pkgconfig/xenblktapctl.pc \
>      ${datadir}/pkgconfig/xenblktapctl.pc \
>      "
>
>  FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
>  FILES_${PN}-libxencall-dev = " \
>      ${libdir}/libxencall.so \
> +    ${libdir}/pkgconfig/xencall.pc \
>      ${datadir}/pkgconfig/xencall.pc \
>      "
>
>  FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
>  FILES_${PN}-libxenctrl-dev = " \
>      ${libdir}/libxenctrl.so \
> +    ${libdir}/pkgconfig/xencontrol.pc \
>      ${datadir}/pkgconfig/xencontrol.pc \
>      "
>
>  FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
>  FILES_${PN}-libxendevicemodel-dev = " \
>      ${libdir}/libxendevicemodel.so \
> +    ${libdir}/pkgconfig/xendevicemodel.pc \
>      ${datadir}/pkgconfig/xendevicemodel.pc \
>      "
>
>  FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
>  FILES_${PN}-libxenevtchn-dev = " \
>      ${libdir}/libxenevtchn.so \
> +    ${libdir}/pkgconfig/xenevtchn.pc \
>      ${datadir}/pkgconfig/xenevtchn.pc \
>      "
>
>  FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
>  FILES_${PN}-libxenforeignmemory-dev = " \
>      ${libdir}/libxenforeignmemory.so \
> +    ${libdir}/pkgconfig/xenforeignmemory.pc \
>      ${datadir}/pkgconfig/xenforeignmemory.pc \
>      "
>
>  FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
>  FILES_${PN}-libxengnttab-dev = " \
>      ${libdir}/libxengnttab.so \
> +    ${libdir}/pkgconfig/xengnttab.pc \
>      ${datadir}/pkgconfig/xengnttab.pc \
>      "
>
>  FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
>  FILES_${PN}-libxenguest-dev = " \
>      ${libdir}/libxenguest.so \
> +    ${libdir}/pkgconfig/xenguest.pc \
>      ${datadir}/pkgconfig/xenguest.pc \
>      "
>
>  FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
>  FILES_${PN}-libxenlight-dev = " \
>      ${libdir}/libxenlight.so \
> +    ${libdir}/pkgconfig/xenlight.pc \
>      ${datadir}/pkgconfig/xenlight.pc \
>      "
>
>  FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
>  FILES_${PN}-libxenstat-dev = " \
>      ${libdir}/libxenstat.so \
> +    ${libdir}/pkgconfig/xenstat.pc \
>      ${datadir}/pkgconfig/xenstat.pc \
>      "
>
>  FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
>  FILES_${PN}-libxenstore-dev = " \
>      ${libdir}/libxenstore.so \
> +    ${libdir}/pkgconfig/xenstore.pc \
>      ${datadir}/pkgconfig/xenstore.pc \
>      "
>
>  FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
>  FILES_${PN}-libxentoolcore-dev = " \
>      ${libdir}/libxentoolcore.so \
> +    ${libdir}/pkgconfig/xentoolcore.pc \
>      ${datadir}/pkgconfig/xentoolcore.pc \
>      "
>
>  FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
>  FILES_${PN}-libxentoollog-dev = " \
>      ${libdir}/libxentoollog.so \
> +    ${libdir}/pkgconfig/xentoollog.pc \
>      ${datadir}/pkgconfig/xentoollog.pc \
>      "
>
>  FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
>  FILES_${PN}-libxenvchan-dev = " \
>      ${libdir}/libxenvchan.so \
> +    ${libdir}/pkgconfig/xenvchan.pc \
>      ${datadir}/pkgconfig/xenvchan.pc \
>      "
>
>  FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
>  FILES_${PN}-libxlutil-dev = " \
>      ${libdir}/libxlutil.so \
> +    ${libdir}/pkgconfig/xlutil.pc \
>      ${datadir}/pkgconfig/xlutil.pc \
>      "
>  FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
>  FILES_${PN}-libvhd-dev = " \
>      ${libdir}/libvhd.so \
> +    ${libdir}/pkgconfig/vhd.pc \
>      ${datadir}/pkgconfig/vhd.pc \
>      "
>
>  FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
>  FILES_${PN}-libblktap-dev = " \
>      ${libdir}/libblktap.so \
> +    ${libdir}/pkgconfig/blktap.pc \
>      ${datadir}/pkgconfig/blktap.pc \
>      "
>
> @@ -390,7 +407,9 @@ FILES_${PN}-libfsimage = " \
>  FILES_${PN}-libfsimage-dev = " \
>      ${libdir}/libfsimage.so \
>      ${libdir}/libxenfsimage.so \
> +    ${libdir}/pkgconfig/fsimage.pc \
>      ${datadir}/pkgconfig/fsimage.pc \
> +    ${libdir}/pkgconfig/xenfsimage.pc \
>      ${datadir}/pkgconfig/xenfsimage.pc \
>      "
>
> --
> 2.17.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005fc6f4058966dcb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, M=
ay 17, 2019 at 7:01 PM &lt;<a href=3D"mailto:christopher.w.clark@gmail.com"=
>christopher.w.clark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">From: Christopher Clark &lt;<a href=3D"mailto=
:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail=
.com</a>&gt;<br>
<br>
Xen commit a0f98145 changed the installation directory for pkgconfig<br>
files, so update recipe to include the .pc files at their new location.<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;<=
br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 52780d6..628e52b 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -285,101 +285,118 @@ FILES_${PN}-staticdev +=3D &quot;\<br>
=C2=A0FILES_${PN}-libblktapctl =3D &quot;${libdir}/libblktapctl.so.*&quot;<=
br>
=C2=A0FILES_${PN}-libblktapctl-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libblktapctl.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenblktapctl.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenblktapctl.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxencall =3D &quot;${libdir}/libxencall.so.*&quot;<br>
=C2=A0FILES_${PN}-libxencall-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxencall.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xencall.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xencall.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenctrl =3D &quot;${libdir}/libxenctrl.so.*&quot;<br>
=C2=A0FILES_${PN}-libxenctrl-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenctrl.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xencontrol.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xencontrol.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxendevicemodel =3D &quot;${libdir}/libxendevicemodel.s=
o.*&quot;<br>
=C2=A0FILES_${PN}-libxendevicemodel-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxendevicemodel.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xendevicemodel.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xendevicemodel.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenevtchn =3D &quot;${libdir}/libxenevtchn.so.*&quot;<=
br>
=C2=A0FILES_${PN}-libxenevtchn-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenevtchn.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenevtchn.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenevtchn.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenforeignmemory =3D &quot;${libdir}/libxenforeignmemo=
ry.so.*&quot;<br>
=C2=A0FILES_${PN}-libxenforeignmemory-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenforeignmemory.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenforeignmemory.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenforeignmemory.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxengnttab =3D &quot;${libdir}/libxengnttab.so.*&quot;<=
br>
=C2=A0FILES_${PN}-libxengnttab-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxengnttab.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xengnttab.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xengnttab.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenguest =3D &quot;${libdir}/libxenguest.so.*&quot;<br=
>
=C2=A0FILES_${PN}-libxenguest-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenguest.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenguest.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenguest.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenlight =3D &quot;${libdir}/libxenlight.so.*&quot;<br=
>
=C2=A0FILES_${PN}-libxenlight-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenlight.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenlight.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenlight.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenstat =3D &quot;${libdir}/libxenstat.so.*&quot;<br>
=C2=A0FILES_${PN}-libxenstat-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenstat.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenstat.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenstat.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenstore =3D &quot;${libdir}/libxenstore.so.*&quot;<br=
>
=C2=A0FILES_${PN}-libxenstore-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenstore.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenstore.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenstore.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxentoolcore =3D &quot;${libdir}/libxentoolcore.so.*&qu=
ot;<br>
=C2=A0FILES_${PN}-libxentoolcore-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxentoolcore.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xentoolcore.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xentoolcore.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxentoollog =3D &quot;${libdir}/libxentoollog.so.*&quot=
;<br>
=C2=A0FILES_${PN}-libxentoollog-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxentoollog.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xentoollog.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xentoollog.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxenvchan =3D &quot;${libdir}/libxenvchan.so.*&quot;<br=
>
=C2=A0FILES_${PN}-libxenvchan-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenvchan.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenvchan.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenvchan.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libxlutil =3D &quot;${libdir}/libxlutil.so.*&quot;<br>
=C2=A0FILES_${PN}-libxlutil-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxlutil.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xlutil.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xlutil.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0FILES_${PN}-libvhd =3D &quot;${libdir}/libvhd.so.*&quot;<br>
=C2=A0FILES_${PN}-libvhd-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libvhd.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/vhd.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/vhd.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-libblktap =3D &quot;${libdir}/libblktap.so.*&quot;<br>
=C2=A0FILES_${PN}-libblktap-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libblktap.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/blktap.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/blktap.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
@@ -390,7 +407,9 @@ FILES_${PN}-libfsimage =3D &quot; \<br>
=C2=A0FILES_${PN}-libfsimage-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libfsimage.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenfsimage.so \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/fsimage.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/fsimage.pc \<br>
+=C2=A0 =C2=A0 ${libdir}/pkgconfig/xenfsimage.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenfsimage.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000005fc6f4058966dcb0--
