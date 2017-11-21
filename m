Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A63A2E00A9C; Tue, 21 Nov 2017 12:08:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4D10E006CA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:08:35 -0800 (PST)
Received: by mail-qk0-f196.google.com with SMTP id c123so3385555qkf.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DOfHTfcOpEQe5u6Agjob9eF2JIz9vfQad2Fq0dYktoo=;
	b=Ml5p53O1sWg/6XbpE5/372fSaB2sSB666MPOz3wyyvIY5pmw116iZwkjux1f48ROmk
	hWNnVGE1FOe+rg2dfeGyTuFJCaxXdeTZkEWDuaf2ds2XV5iVCs6gFE/e8P4Ym7RsI1z4
	7GobcbRVGjpA6eakiyOLK7UbVAvavOBd7rzDL3rHGZECS87CvKJRHkhwCmCnCNAlCQLS
	9I+SJOHSZk4IuGuIeKZ6vw80Q2AlzvUB/u8+L2PHpKy5mLVxDttDYg0fhbPJIhdQUIGM
	YzJu1//+sYjzhmuLW5YykEVQV6Tcw9+S/jc89FEnRgvoc9mHc4g013vWCk8gD2LS9JmE
	9ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DOfHTfcOpEQe5u6Agjob9eF2JIz9vfQad2Fq0dYktoo=;
	b=BwrdWaOdPjNpI1T0uZIKWN3nC/3P9UtRnMMaWiA987D5r6YdhBGZ8TP2mUl93Ei+GJ
	O7YRIbvyPTzvgBbKyYFaWfoROEgGPUvMwI8J7A/IwJTilqPGI8FYaaFnSissuKW+U9wc
	MRyk6KgJLYDYjOfN3EhcyU7iAsObb2ITYknmZCDDHwkyH0DeGEyQKhUybPT1nofUjxsK
	3XGCh2BvxUjO2WkOk3x5gHNOfodovNRHOXxHNRGt8fn78TWS/NyZnQ1nluErp76hJKM0
	V/vtGqdLODRZ5CT5bRhzW1gt40gnORgqlElqzdzgJvIwA931NBtfb1lQHubnT4iouX4V
	aFEg==
X-Gm-Message-State: AJaThX4zx7Ku0Pil4tIs2LYMdkiGZ5M6Fe240k4luWRgeiW07ldctASE
	R8nLs7teJIRv/VUjmmB0p27Atn/ww1X0RtQGGpZu6w==
X-Google-Smtp-Source: AGs4zMZCtb4DYSZQ5L2nqzVrfxRCzRzdDngnSY93gZmVGzAtdZImfhQQZTkxYgmBCqRL1I1EfJ8S6+jm6FD8KUnP4Pg=
X-Received: by 10.55.159.215 with SMTP id i206mr26462048qke.265.1511294914717; 
	Tue, 21 Nov 2017 12:08:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Tue, 21 Nov 2017 12:08:34 -0800 (PST)
In-Reply-To: <1511194667-32126-1-git-send-email-mark.asselstine@windriver.com>
References: <1511194667-32126-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Nov 2017 15:08:34 -0500
Message-ID: <CADkTA4OfDP35Wzc7piMQpCrKgj07UF0iqf+AymdEQUzN_23-Uw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-eventlet: add RDEPENDS for enum-compat
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
X-List-Received-Date: Tue, 21 Nov 2017 20:08:38 -0000
Content-Type: multipart/alternative; boundary="001a114fd31a8af066055e83c4ff"

--001a114fd31a8af066055e83c4ff
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Nov 20, 2017 at 11:17 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The true dependency is for 'enum34' but if the system is checking
> against the requirements.txt it might complain if 'enum-compat' is not
> present.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> eventlet_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-
> eventlet_0.20.0.bb
> index f52d5af..1d51f1a 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> @@ -11,5 +11,6 @@ inherit setuptools pypi pypi
>
>  RDEPENDS_${PN} += " \
>      python-enum34 \
> +    python-enum-compat \
>      python-greenlet \
>      "
> --
> 2.7.4
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

--001a114fd31a8af066055e83c4ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Mon, Nov 20, 2017 at 11:17 AM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The true dependency is for &#39;=
enum34&#39; but if the system is checking<br>
against the requirements.txt it might complain if &#39;enum-compat&#39; is =
not<br>
present.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
eventlet_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>eventl=
et_0.20.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-eventlet_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>eventlet_0.20.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a hr=
ef=3D"http://python-eventlet_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python-<wbr>eventlet_0.20.0.bb</a><br>
index f52d5af..1d51f1a 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
eventlet_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>eventl=
et_0.20.0.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
eventlet_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>eventl=
et_0.20.0.bb</a><br>
@@ -11,5 +11,6 @@ inherit setuptools pypi pypi<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python-enum34 \<br>
+=C2=A0 =C2=A0 python-enum-compat \<br>
=C2=A0 =C2=A0 =C2=A0python-greenlet \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a114fd31a8af066055e83c4ff--
