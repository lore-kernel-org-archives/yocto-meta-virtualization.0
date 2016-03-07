Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B0F3E0083D; Mon,  7 Mar 2016 08:34:50 -0800 (PST)
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
	*      [209.85.213.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AB65E0073D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Mar 2016 08:34:48 -0800 (PST)
Received: by mail-vk0-f44.google.com with SMTP id e185so123131591vkb.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Mar 2016 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=fVohuRR/q9QU8gMEQD8sBB4l4qndQLHaVp+KZiUvdY4=;
	b=WHJOAPcfx29gEY0mQhy8eMcRFEwTny+d+n38Yp3Uq/plKnl3Zc7ct9qUrt/vw/WwnA
	SW8ZwG+WxXLitYGhu7z8v6RQjriadZLJu0JvSuyZV/QhcKcLE3Elp5Av06l824XeSris
	Oy/T6BBu3P7rV3+RQnABjpNdKRMao/OljyWp1/2q0wNiMCorjzqgjtrrQVbTu3GOg5bk
	fEiHdaoLJe7hMs8K4Y/a+R0igkU09qWtboVL/pZBiMCV7Gkq7N+lHXJqHya2CpPQrfFu
	qN5t4KifbRrHxqLPg4BY+5gH6pgYWIELCemdlqu6rxZHzoah1uM0Nvll5+brt2vKUaiw
	IQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=fVohuRR/q9QU8gMEQD8sBB4l4qndQLHaVp+KZiUvdY4=;
	b=MRQ3TYptYe4fZGAHyCFIIP/n6OTegDRVwxMVHIiXWF07hx6Ee+/oYELrghVK1cdMJC
	KhmK3ZGVn/vemRvlHmyYSGK4e/RmDDATI/QHlgtMVq5Dq/+TWL03hX1tQ2xQgVhgIsnK
	NeLzbo7J84a+j0Ez/KfpAoTupl/dMr0wH+3i5rUP9cXdEd3MvKyca0ayItBLGTTt8WVX
	SI9lIDDr+Y8ptGMRR1yAzPiyqhUR6kCUN1RezxGGd1vN0256nLOzN0qr1BmKUE+tRJ5r
	lHEd4TvXe7fXyrlLZal1sW4iBd9jolyIe3KH48QVL7jpkhmSqkDp991jw33fYG/U12p0
	9nhA==
X-Gm-Message-State: AD7BkJKV4uAGzc20r+jB9qB8Use6vmHbHYlQdOBtI37KE5HPn6DejeWDaDdjrG4cA/zmZK9W51ZLcFTzRYEq+A==
MIME-Version: 1.0
X-Received: by 10.31.6.17 with SMTP id 17mr21405835vkg.75.1457368487864; Mon,
	07 Mar 2016 08:34:47 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Mon, 7 Mar 2016 08:34:47 -0800 (PST)
In-Reply-To: <1457127016-16947-1-git-send-email-mbgrego@tycho.nsa.gov>
References: <1457127016-16947-1-git-send-email-mbgrego@tycho.nsa.gov>
Date: Mon, 7 Mar 2016 11:34:47 -0500
Message-ID: <CADkTA4NU8nbaTeWNdRXa4qUgTw9KBCmTXnrwC7hMMYEroS59UA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Machon Gregory <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fix QA Issues when building for aarch64 machines
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
X-List-Received-Date: Mon, 07 Mar 2016 16:34:50 -0000
Content-Type: multipart/alternative; boundary=001a1143f24a06ac8b052d780b6e

--001a1143f24a06ac8b052d780b6e
Content-Type: text/plain; charset=UTF-8

I merged this by mistake while reviewing the change .. but I have a
question.

On Fri, Mar 4, 2016 at 4:30 PM, Machon Gregory <mbgrego@tycho.nsa.gov>
wrote:

> When building for the aarch64 based machines the following QA Issue is
> produced:
>
> ERROR: QA Issue: xen: Files/directories were installed but not shipped in
> any package:
>   /usr/lib64
>   /usr/lib64/efi
>   /usr/lib64/efi/xen-4.6.efi
>   /usr/lib64/efi/xen-4.6.0.efi
>   /usr/lib64/efi/xen.efi
>   /usr/lib64/efi/xen-4.efi
>
> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> ---
>  recipes-extended/xen/xen.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index d35bc3f..2eba012 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,6 +151,7 @@ PACKAGES = "\
>      ${PN}-dev \
>      ${PN}-devd \
>      ${PN}-doc \
> +    ${PN}-efi \
>      ${PN}-flask \
>      ${PN}-fsimage \
>      ${PN}-gdbsx \
> @@ -303,6 +304,11 @@ FILES_${PN}-hypervisor = "\
>      /boot/xen-syms-* \
>      "
>
> +FILES_${PN}-efi = "\
> +    ${exec_prefix}/lib64 \
> +    ${exec_prefix}/lib64/xen* \
>

This should be ${libdir), which tracks lib or lib64 based on the arch. I
don't have a
Xen build handy to try a quick test. Can you confirm that libdir also fixes
this ?

Bruce


> +    "
> +
>  FILES_${PN}-base = "\
>      ${sysconfdir}/xen/auto \
>      ${sysconfdir}/xen/cpupool \
> --
> 2.1.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143f24a06ac8b052d780b6e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I merged this by mistake while reviewing the change .. but=
 I have a question.<div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Fri, Mar 4, 2016 at 4:30 PM, Machon Gregory <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mbgrego@tycho.nsa.gov" target=3D"_blank">mbgrego@tycho.nsa.go=
v</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">When building for=
 the aarch64 based machines the following QA Issue is<br>
produced:<br>
<br>
ERROR: QA Issue: xen: Files/directories were installed but not shipped in a=
ny package:<br>
=C2=A0 /usr/lib64<br>
=C2=A0 /usr/lib64/efi<br>
=C2=A0 /usr/lib64/efi/xen-4.6.efi<br>
=C2=A0 /usr/lib64/efi/xen-4.6.0.efi<br>
=C2=A0 /usr/lib64/efi/xen.efi<br>
=C2=A0 /usr/lib64/efi/xen-4.efi<br>
<br>
Signed-off-by: Machon Gregory &lt;<a href=3D"mailto:mbgrego@tycho.nsa.gov">=
mbgrego@tycho.nsa.gov</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index d35bc3f..2eba012 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -151,6 +151,7 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-dev \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-devd \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-doc \<br>
+=C2=A0 =C2=A0 ${PN}-efi \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-flask \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-fsimage \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-gdbsx \<br>
@@ -303,6 +304,11 @@ FILES_${PN}-hypervisor =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0/boot/xen-syms-* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+FILES_${PN}-efi =3D &quot;\<br>
+=C2=A0 =C2=A0 ${exec_prefix}/lib64 \<br>
+=C2=A0 =C2=A0 ${exec_prefix}/lib64/xen* \<br></blockquote><div><br></div><=
div>This should be ${libdir), which tracks lib or lib64 based on the arch. =
I don&#39;t have a</div><div>Xen build handy to try a quick test. Can you c=
onfirm that libdir also fixes this ?</div><div><br></div><div>Bruce</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0FILES_${PN}-base =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/auto \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/cpupool \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1143f24a06ac8b052d780b6e--
