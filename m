Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF96CE00D61; Tue, 22 Aug 2017 19:48:48 -0700 (PDT)
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
	*      [209.85.217.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.178 listed in dnsbl.sorbs.net]
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DDE3E00C14
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:48:47 -0700 (PDT)
Received: by mail-ua0-f178.google.com with SMTP id g11so1625801uah.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uRfbvXEfAjUiuwQDviE13PhI+Fy1nu/NGcqiH6z8zt0=;
	b=BNGbMeDV3DYKPT1I/BusdXzUelHBNOo93gcjRDqW3bvECRqoJvOHHfTDm8Cp+TX5bA
	/9EDrApvQZTCyhfYa1aHsdmBxO9pHuyqg7uKfniAC7JWKC2PSMiADcJ+hp2mw42tNZ5M
	F/mcjmc9hppkiJQ1Qs4Xx8fqrpETM3h3Eb+BLvWiyDkv9CHMYT5AOvsbxa5ZPy5pF33z
	wfK+AVxXxwafVv5r3De3cgTiaaURFJPRGcZ+85ffF2fDaVsB1sc8rT09Z1ZS5HEbQU1y
	7VZFYL/Temi4I0wBC75UwHZK7YKA1o3uNCFZmhSnW5rkrooD5g2jlX104SU3EMoRLCFr
	HXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uRfbvXEfAjUiuwQDviE13PhI+Fy1nu/NGcqiH6z8zt0=;
	b=WHmGA4/UzTTLs3qsmuzTv7e8viwiuWq361/GOCdmNfSVAPwn+JCu0y55PpZxF1UqKI
	/1E7g9HHOPd3PadUGilEU96VP9NHimJS0zfNrT6W/zeI65Ipq2ZKdndnVJ1BFNFgN2Vb
	CnvzI6B9Rq6Fm18ulvM4mZlwzx4BVkQnkHvpqFHvWa+hrLtfSCnCZ0/TFxz7lTnIujIp
	0uGjB6kexSjg0rY+b1iqox48eF5A8mXVUMHuRhi72Re3CbuFjqBGjkKH1cqRlU4fwk3p
	QR6TH9DReSDqnAE8clj2Qfp307bNg1EkorgAdKYd8N/8LCuYa8AqcTgS6EBY5clH0NRw
	d+AQ==
X-Gm-Message-State: AHYfb5gLcU0BJYdHxYZ6deW2sEj1h84BhysDFlU6yL/x/8JDktrA0Yy8
	NyGBGJzpAv+29HgoWYhJ7CV4A9EKYw==
X-Received: by 10.176.7.42 with SMTP id h39mr863374uah.71.1503456526643; Tue,
	22 Aug 2017 19:48:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 22 Aug 2017 19:48:46 -0700 (PDT)
In-Reply-To: <1503421431-23274-1-git-send-email-mark.asselstine@windriver.com>
References: <1503421431-23274-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2017 22:48:46 -0400
Message-ID: <CADkTA4Mqr5LN6Rf40cGL=PSosxYC8+M63zw5fpgymFLcQb0w3Q@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH v2] python-positional: use archived tarball
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
X-List-Received-Date: Wed, 23 Aug 2017 02:48:48 -0000
Content-Type: multipart/alternative; boundary="94eb2c12417834b84f055762c09c"

--94eb2c12417834b84f055762c09c
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Aug 22, 2017 at 1:03 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The upstream project has been discontinued as you can see from the
> comment from the developer in response to another pkg which used
> positional:
> https://github.com/conda-forge/positional-feedstock/issues/7
>
> In addition to discontinuing the project the developer removed the
> repository, so we need to use the version archived via pypi. We can't
> simply drop the package as it is used by python-nova and other
> openstack components.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> v2: sending with -M to allow this to be reviewed more
>     easily
>
>
>  .../{python-positional_git.bb => python-positional_1.1.1.bb}      | 8
> ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-positional_git.bb
> => python-positional_1.1.1.bb} (57%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> positional_git.bb b/meta-openstack/recipes-devtools/python/python-
> positional_1.1.1.bb
> similarity index 57%
> rename from meta-openstack/recipes-devtools/python/python-
> positional_git.bb
> rename to meta-openstack/recipes-devtools/python/python-
> positional_1.1.1.bb
> index 821d704..c2dc44c 100644
> --- a/meta-openstack/recipes-devtools/python/python-positional_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> @@ -5,13 +5,13 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
>
>  SRCNAME = "positional"
> -SRC_URI = "git://github.com/morganfainberg/positional \
> +SRC_URI = "https://pypi.io/packages/source/p/${SRCNAME}/${SRCNAME}
> -${PV}.tar.gz \
>  "
>
> -PV = "1.1.1+git${SRCPV}"
> -SRCREV = "1f5e9fc0f50e9e774fc4db27f97f9acae5f0c29f"
> +SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
> +SRC_URI[sha256sum] = "ef845fa46ee5a11564750aaa09dd7d
> b059aaf39c44c901b37181e5ffa67034b0"
>
> -S = "${WORKDIR}/git"
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
>
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

--94eb2c12417834b84f055762c09c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 22, 2017 at 1:03 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">The upstream pr=
oject has been discontinued as you can see from the<br>
comment from the developer in response to another pkg which used<br>
positional:<br>
<a href=3D"https://github.com/conda-forge/positional-feedstock/issues/7" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/conda-<wbr>forge/posi=
tional-feedstock/<wbr>issues/7</a><br>
<br>
In addition to discontinuing the project the developer removed the<br>
repository, so we need to use the version archived via pypi. We can&#39;t<b=
r>
simply drop the package as it is used by python-nova and other<br>
openstack components.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
<br>
</span>v2: sending with -M to allow this to be reviewed more<br>
=C2=A0 =C2=A0 easily<br>
<br>
<br>
=C2=A0.../{<a href=3D"http://python-positional_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-positional_git.bb</a> =3D&gt; <a href=3D"http://pyt=
hon-positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-positi=
onal_1.1.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"http:/=
/python-positional_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>positional_git.bb</a> =3D&gt; <a href=3D"http://python-positional_1.1.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python-positional_1.1.1.bb</a>} (57%=
)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-positional_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
positional_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>python-<wbr>positional_1.1.1.bb</a><br>
similarity index 57%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-positional_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>p=
ositional_git.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>p=
ositional_1.1.1.bb</a><br>
index 821d704..c2dc44c 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
positional_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>positio=
nal_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>posit=
ional_1.1.1.bb</a><br>
@@ -5,13 +5,13 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>5335066555b14d83=
2335aa4660d6c3<wbr>76&quot;<br>
<span class=3D""><br>
=C2=A0SRCNAME =3D &quot;positional&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/morganfainberg/positi=
onal" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>morganfainberg/p=
ositional</a> \<br>
</span><span class=3D"">+SRC_URI =3D &quot;<a href=3D"https://pypi.io/packa=
ges/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://pypi.io/packages/<wbr>source/p/${SRCNAME}/${SRCNAME}<wb=
r>-${PV}.tar.gz</a> \<br>
=C2=A0&quot;<br>
<br>
</span><span class=3D"">-PV =3D &quot;1.1.1+git${SRCPV}&quot;<br>
-SRCREV =3D &quot;<wbr>1f5e9fc0f50e9e774fc4db27f97f9a<wbr>cae5f0c29f&quot;<=
br>
</span><span class=3D"">+SRC_URI[md5sum] =3D &quot;<wbr>c82903c32c1aec1ac0f=
0f6e166ef4e<wbr>2e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>ef845fa46ee5a11564750aaa09dd7d<wbr>b059a=
af39c44c901b37181e5ffa670<wbr>34b0&quot;<br>
<br>
</span><span class=3D"">-S =3D &quot;${WORKDIR}/git&quot;<br>
</span><span class=3D"">+S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
</span>=C2=A0inherit setuptools<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
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
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--94eb2c12417834b84f055762c09c--
