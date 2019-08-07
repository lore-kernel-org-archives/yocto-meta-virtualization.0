Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90AADE00798; Tue,  6 Aug 2019 20:13:10 -0700 (PDT)
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
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.50 listed in list.dnswl.org]
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DA06E00798
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:13:09 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id x3so62964884lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jAtuWpiC4e+Od4Tiz/nz5zBeINwB/Py/xoDaC47n+vQ=;
	b=d/dQqhfNJC/HZzAm1IjbWyuJFH6Es6xz4Nv513U+xjxCqgYA3x5S/rg1ae8jus5l0B
	Kk3s9tpzw64yDPmphrfFr/YT7KU/CJTQPpPjZVVQvuTjgidSG+e7tr3v56NKYkDrWWBx
	3gry6/FfCpTPqX3pCZjXPQvzNUiFCZLBlINEhG9+BlOU1rK/X4kj7+HwvN/REjtuc/WW
	4U/7BU7z8kZ2vTJgY4iIKBwGsz4xdnYM5nkQ9N8kvVs/8M0bSv5jtcle0t3lxbjo+Rxb
	mitViLTHa354KkufSUGjjAbrA37uHy4crUTAredDndq1OIZVNy8Hcp4cFQHhsL8F/BTT
	EYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jAtuWpiC4e+Od4Tiz/nz5zBeINwB/Py/xoDaC47n+vQ=;
	b=fYEbKxZaITBWs3+ZecUXyaf/7Yg2v4WUjlMt5BAWw3jYLPtw9pqSClD8kJo1b/F9aC
	9axmtcuJAPUPcrrUNLwND32MRKUawsTZ+4L/d7OrNAv+3dk/9lLmbmQH1mPwnvdoqTCF
	FbsbJdq4ToxAoNcMcm+6QYHN8snA59r4E6Lp4MR6UMgJeaYWm2baf8lNKuS9OpH5+ooH
	g07inL0Ye2+c3eBa6e+9V6FRufiHF7BPor/ksj+NK2wH2aMMXL1uMiSyaSDkXQxW44zU
	Bgnvnr3GgXl8c8k0TFWlyWo8lFcDx89ytBaRJLPfbd4nOfzK9+yJG+PofogJ5GnYgdrL
	bO5w==
X-Gm-Message-State: APjAAAX4+aJpqx6Syb7Ps7X3VfGMZFrjJGs9N0ejoXyMnv6Si7Pae4gx
	arZvcM/jzCbqrvBkWDlR4nHUaVEkH1xEbHJNcWA=
X-Google-Smtp-Source: APXvYqyR1KUhO33TTc2faGz0hHpoO1AZS3vRvWzBkfl4R3Dfn07yLfpndcxKowh1RdHRfb6j+KwLcuH5zD/f/mYq5zs=
X-Received: by 2002:a19:491d:: with SMTP id w29mr4551457lfa.149.1565147588172; 
	Tue, 06 Aug 2019 20:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1565091321-15298-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565091321-15298-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:12:57 -0300
Message-ID: <CADkTA4NpuR_SZXHyGnxt8mxbrPyu_cXCQBR0T0DChDL7tjMm5g@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-kombu: Add python3 version
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
X-List-Received-Date: Wed, 07 Aug 2019 03:13:10 -0000
Content-Type: multipart/alternative; boundary="00000000000003a107058f7e5248"

--00000000000003a107058f7e5248
Content-Type: text/plain; charset="UTF-8"

Merged.

We should also consider deleting the py2 variant.

Bruce

On Mon, Aug 5, 2019 at 11:35 PM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Providing a python3 version of python-kombu.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-kombu.inc      | 14 ++++++++++++++
>  .../recipes-devtools/python/python-kombu_4.6.0.bb | 15 +--------------
>  .../python/python3-kombu_4.6.0.bb                 |  2 ++
>  3 files changed, 17 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-kombu.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python3-kombu_4.6.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc
> b/meta-openstack/recipes-devtools/python/python-kombu.inc
> new file mode 100644
> index 0000000..7f66a4b
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "A messaging framework for Python"
> +HOMEPAGE = "http://kombu.readthedocs.org"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
> +
> +SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
> +SRC_URI[sha256sum] =
> "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
> +
> +FILES_${PN}-doc += "${datadir}/${SRCNAME}"
> +
> +RDEPENDS_${PN} = " \
> +        python-amqp \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> index 8cd6825..28b6258 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> @@ -1,16 +1,3 @@
> -DESCRIPTION = "A messaging framework for Python"
> -HOMEPAGE = "http://kombu.readthedocs.org"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
> -
> -SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
> -SRC_URI[sha256sum] =
> "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
> -
>  inherit setuptools pypi
> +require python-kombu.inc
>
> -FILES_${PN}-doc += "${datadir}/${SRCNAME}"
> -
> -RDEPENDS_${PN} = " \
> -        python-amqp \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
> b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
> new file mode 100644
> index 0000000..fc752d9
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3 pypi
> +require python-kombu.inc
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000003a107058f7e5248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">We should also consi=
der deleting the py2 variant.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Aug 5, 2019 at 11:35 PM Zheng Ruoqin &lt;<a href=3D=
"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Providing a=
 python3 version of python-kombu.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-kombu.inc=C2=A0 =C2=A0 =C2=A0 | 14=
 ++++++++++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-kombu_4.6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</a> | 15 +------=
--------<br>
=C2=A0.../python/<a href=3D"http://python3-kombu_4.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-kombu_4.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A03 files changed, 17 insertions(+), 14 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-komb=
u.inc<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python3-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-kombu_4.6.0.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta=
-openstack/recipes-devtools/python/python-kombu.inc<br>
new file mode 100644<br>
index 0000000..7f66a4b<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc<br>
@@ -0,0 +1,14 @@<br>
+DESCRIPTION =3D &quot;A messaging framework for Python&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://kombu.readthedocs.org" rel=3D"norefer=
rer" target=3D"_blank">http://kombu.readthedocs.org</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaea7c168428449fbee05e644d=
f929f4&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;3543525c1bfaa74260cbf9a6e47dad2f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e2=
03cecaa0aeca84360be&quot;<br>
+<br>
+FILES_${PN}-doc +=3D &quot;${datadir}/${SRCNAME}&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-amqp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.b=
b</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kom=
bu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</a>=
<br>
index 8cd6825..28b6258 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kombu=
_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</a><b=
r>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kombu=
_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</a><b=
r>
@@ -1,16 +1,3 @@<br>
-DESCRIPTION =3D &quot;A messaging framework for Python&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://kombu.readthedocs.org" rel=3D"norefer=
rer" target=3D"_blank">http://kombu.readthedocs.org</a>&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaea7c168428449fbee05e644d=
f929f4&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;3543525c1bfaa74260cbf9a6e47dad2f&quot;<br>
-SRC_URI[sha256sum] =3D &quot;27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e2=
03cecaa0aeca84360be&quot;<br>
-<br>
=C2=A0inherit setuptools pypi<br>
+require python-kombu.inc<br>
<br>
-FILES_${PN}-doc +=3D &quot;${datadir}/${SRCNAME}&quot;<br>
-<br>
-RDEPENDS_${PN} =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-amqp \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.0=
.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-=
kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.0.bb=
</a><br>
new file mode 100644<br>
index 0000000..fc752d9<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-komb=
u_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.0.bb</a>=
<br>
@@ -0,0 +1,2 @@<br>
+inherit setuptools3 pypi<br>
+require python-kombu.inc<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000003a107058f7e5248--
