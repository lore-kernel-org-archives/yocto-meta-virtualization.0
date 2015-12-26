Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC5DFE00B03; Fri, 25 Dec 2015 19:54:24 -0800 (PST)
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
	*      [209.85.213.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B225E0088C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Dec 2015 19:54:22 -0800 (PST)
Received: by mail-vk0-f51.google.com with SMTP id k1so33981818vkb.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Dec 2015 19:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Nnk2I8BBSOUmZbn3s3sn7VU2t+DmCJiDH6LgjiX1/IM=;
	b=xmhfTsl/bnYk3tuhraBmREwL0niww9LTiC5S4F/BVhARjl0je4emUupWS67/w1IKoH
	j9d/h19pSSpugycn79gK80+oT6ifVbYzsXtRCaW8w+1+mfUdeAWZP9FyvObbuheDnf+s
	QxjoxYqedrpdZNuTLb9o1fMaOA1JFPpzU8MlEFK73F2vITOg5qnbSQzgR4dDb+uQyFfj
	v4NZ4LQEj983ZVXKcMD5QSO+KAUOPecEr6NdN8tVV2Q1MB6KoyevGM9do6EAHw8zjCMH
	AgqO9DTOa+L16qW4PU4oQvBJkaPffgxEP+xi9tTcTvvNnYE2Zzxw7keIvl7aT6mcLW6b
	Esiw==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr7377318vky.11.1451102062289; Fri,
	25 Dec 2015 19:54:22 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Fri, 25 Dec 2015 19:54:22 -0800 (PST)
In-Reply-To: <1450810948-17131-2-git-send-email-cjp256@gmail.com>
References: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
	<1450810948-17131-2-git-send-email-cjp256@gmail.com>
Date: Fri, 25 Dec 2015 22:54:22 -0500
Message-ID: <CADkTA4M7Xq6Ab+19Pt5ScXYr7h4H_f5X0X8-5y0nSL3i0uVJ2A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 2/5] xen: empty out rdepends for xen-dev to lose QA warning
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
X-List-Received-Date: Sat, 26 Dec 2015 03:54:24 -0000
Content-Type: multipart/alternative; boundary=001a1143158af4a81d0527c50622

--001a1143158af4a81d0527c50622
Content-Type: text/plain; charset=UTF-8

I've merged the entire v2 series.

Bruce

On Tue, Dec 22, 2015 at 2:02 PM, Chris Patterson <cjp256@gmail.com> wrote:

> It appears that it defaults to rdepend on xen, causing a QA error:
>   WARNING: QA Issue: xen-dev rdepends on xen,
>   but it isn't a build dependency? [build-deps]
>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 00f1823..d1f5a1b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -78,6 +78,8 @@ RDEPENDS_${PN}-base = "\
>      ${PN}-xl \
>      "
>
> +RDEPENDS_${PN}-dev = ""
> +
>  RRECOMMENDS_${PN}-base = " \
>      ${PN}-libblktap \
>      ${PN}-flask \
> --
> 1.7.10.4
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

--001a1143158af4a81d0527c50622
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve merged the entire v2 series.<div><br></div><div>B=
ruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Tue, Dec 22, 2015 at 2:02 PM, Chris Patterson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">It appears that it defaults =
to rdepend on xen, causing a QA error:<br>
=C2=A0 WARNING: QA Issue: xen-dev rdepends on xen,<br>
=C2=A0 but it isn&#39;t a build dependency? [build-deps]<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp2=
56@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc |=C2=A0 =C2=A0 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 00f1823..d1f5a1b 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -78,6 +78,8 @@ RDEPENDS_${PN}-base =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xl \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
+<br>
=C2=A0RRECOMMENDS_${PN}-base =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-libblktap \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-flask \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
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
</div>

--001a1143158af4a81d0527c50622--
