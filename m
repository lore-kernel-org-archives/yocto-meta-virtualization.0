Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5564BE00BC2; Mon, 10 Jul 2017 08:48:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.52 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75F7EE00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:48:13 -0700 (PDT)
Received: by mail-lf0-f52.google.com with SMTP id t72so65529044lff.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+u2+oEkcwOwIX7b+i8e6VwK146m1c9D3GlFjBZ34TbE=;
	b=F6nBDl3l9AIShqbgY4KKfZ5fkXvIj+POONJnrgO4uHS+0oAdGlKMTzonTnR9Crz8tV
	02C/BLe2cskzP/cMI60ZJ+SWCzMcO37dhKcWm1xYwzbdYZ//KBsyokTVzLn9JjPkaCf8
	xCf/4ioGfKkbSGZrUfor9K418OwN7rXTr6zmmTS9iw9LDauVmnC/wD8MgbDl53WkusvJ
	xUrZ+Lj3g9uPXEoSB6h4A+o3SOguKC4TUZ74v2XYZNTAzKwbcjCMzEzaeNrYyMVMYXLL
	4BOt9ZssYsbZl/RDOkEzroLYbSZNDpcpu0PVL20jbKB3TkkfqxHt8YZn4biqUdul4qSF
	38lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+u2+oEkcwOwIX7b+i8e6VwK146m1c9D3GlFjBZ34TbE=;
	b=lv6NnIcTMBb7w1MV8jUOx9HVfwh9JOm+/vDkpbD3jPIN6ISOKLAu3PTaLbSJn49155
	il5yl4HYEPUKfL5RGDaqMgA2rGZgOuNSyVyMxrmrzbNlGp7aJA3LRmVvr1TPXpY5dXre
	lnM88e6M9q7BlEAytrx8JXLwAIsoma5vDBV7M9/dRwW9ogUNEVcEyoGG1bLwzu6U6fXS
	q177q4lBRUcMo0/gh3oimFXJv+8Nl2ctpYLVsKBtkiFmcPBhgEh7Z+xMjfZWjoH4+sy+
	QZOg4Kcd8zoYLTFJSJknEYZ0zNKrQacHyLbhD1JRgupFpbYdV30no5GmVL4idfNksHHI
	FmAA==
X-Gm-Message-State: AIVw1125KtSa87yI0IEdAMogR2v4ZuhbMKkW/BDz+anQuNDO/UmjLRLU
	tZsGttNJnBplpzx5eP5YHwpWv5dEzg==
X-Received: by 10.46.78.9 with SMTP id c9mr4561976ljb.52.1499701691986; Mon,
	10 Jul 2017 08:48:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 08:48:11 -0700 (PDT)
In-Reply-To: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
References: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 11:48:11 -0400
Message-ID: <CADkTA4NLjzm6Lt4CMPwGv+QkbW332X_UFjfPUfzeeN9UZs6LvQ@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-requests: Drop recipe
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
X-List-Received-Date: Mon, 10 Jul 2017 15:48:15 -0000
Content-Type: multipart/alternative; boundary="f403045ec3069eb7d90553f882a5"

--f403045ec3069eb7d90553f882a5
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jul 5, 2017 at 9:27 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:

> There's a newer recipe (v2.13) maintained in meta-python. meta-openstack
> explicitly prefers that version over this one, so no point in keeping
> this recipe since nobody else is using this version.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  recipes-devtools/python/python-requests_2.8.1.bb | 28
> ------------------------
>  1 file changed, 28 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-requests_2.8.1.bb
>
> diff --git a/recipes-devtools/python/python-requests_2.8.1.bb
> b/recipes-devtools/python/python-requests_2.8.1.bb
> deleted file mode 100644
> index 187f97a..0000000
> --- a/recipes-devtools/python/python-requests_2.8.1.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -HOMEPAGE = "http://python-requests.org"
> -SUMMARY = "Python HTTP for Humans."
> -DESCRIPTION = "\
> -  Requests is an Apache2 Licensed HTTP library, written in Python, \
> -  for human beings. \
> -  .      \
> -  Most existing Python modules for sending HTTP requests are extremely \
> -  verbose and cumbersome. Python's builtin urllib2 module provides most \
> -  of the HTTP capabilities you should need, but the api is thoroughly \
> -  broken.  It requires an enormous amount of work (even method overrides)
> \
> -  to perform the simplest of tasks. \
> -  .      \
> -  Things shouldn't be this way. Not in Python \
> -  "
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
> -
> -SRCNAME = "requests"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/r/requests/${
> SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
> -SRC_URI[sha256sum] = "84fe8d5bf4dcdcc49002446c47a146
> d17ac10facf00d9086659064ac43b6c25b"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
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

--f403045ec3069eb7d90553f882a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jul 5, 2017 at 9:27 AM,=
 Adrian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.com=
" target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">There&#39;s a newer recipe (v2.13) maintained in met=
a-python. meta-openstack<br>
explicitly prefers that version over this one, so no point in keeping<br>
this recipe since nobody else is using this version.<br>
<br>
Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com">ad=
rian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python<wbr>-requests_2.8.1.bb</a> | 28 =
------------------------<br>
=C2=A01 file changed, 28 deletions(-)<br>
=C2=A0delete mode 100644 recipes-devtools/python/<a href=3D"http://python-r=
equests_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-requests=
_2.8.1.bb</a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-requests_2.8.=
1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a=
> b/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
deleted file mode 100644<br>
index 187f97a..0000000<br>
--- a/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-HOMEPAGE =3D &quot;<a href=3D"http://python-requests.org" rel=3D"noreferre=
r" target=3D"_blank">http://python-requests.org</a>&quot;<br>
-SUMMARY =3D &quot;Python HTTP for Humans.&quot;<br>
-DESCRIPTION =3D &quot;\<br>
-=C2=A0 Requests is an Apache2 Licensed HTTP library, written in Python, \<=
br>
-=C2=A0 for human beings. \<br>
-=C2=A0 .=C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 Most existing Python modules for sending HTTP requests are extremel=
y \<br>
-=C2=A0 verbose and cumbersome. Python&#39;s builtin urllib2 module provide=
s most \<br>
-=C2=A0 of the HTTP capabilities you should need, but the api is thoroughly=
 \<br>
-=C2=A0 broken.=C2=A0 It requires an enormous amount of work (even method o=
verrides) \<br>
-=C2=A0 to perform the simplest of tasks. \<br>
-=C2=A0 .=C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 Things shouldn&#39;t be this way. Not in Python \<br>
-=C2=A0 &quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>58c7e163c9f8ee037246d=
a101c6afd<wbr>1e&quot;<br>
-<br>
-SRCNAME =3D &quot;requests&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/r/requ=
ests/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://p=
ypi.python.org/<wbr>packages/source/r/requests/${<wbr>SRCNAME}-${PV}.tar.gz=
</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>a27ea3d72d7822906ddce5e252d6ad<wbr>d9&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>84fe8d5bf4dcdcc49002446c47a146<wbr>d17ac=
10facf00d9086659064ac43b6<wbr>c25b&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
-<br>
-inherit setuptools<br>
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

--f403045ec3069eb7d90553f882a5--
