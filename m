Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F006E00D8A; Tue,  6 Aug 2019 20:11:58 -0700 (PDT)
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
	*      [209.85.167.42 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6331E00C22
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:11:57 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id x3so62963252lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5rYNW50aC80go08LcDqzXVFrrD0BHvuASc3Z4J7TEW4=;
	b=u/OIsB6jLSTLFux4+vDDcektT3Lvx7PI7bWXoGbzeqPGAZd3VBhBVZOxY/Asu7NrQ7
	CF7iBowOtbtKG0lkf/RwtEHxZlgmLLAUmhZk4CC0UqT41OmBar5KwhQ80HvLBimTeyaS
	g04Y6t2cDQM8VD5ZIHAiw+y4lRLhvRhMR1VJ4ujGFsh7gt+3f2MjQwhDln/C//Hocsl2
	H5WfA/Qv/lD0gq/3+rRk/N3p2AiXL4oZFYVzL6CLVePLEEZIaq7iHHRBINqtGRirZakw
	9adB8Yq/Xvt+T1XiEmDTkeugoObwl4N3y5q+Z6yovWt0/oG1Ehht7HV5De6GZsr3gH6B
	omLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5rYNW50aC80go08LcDqzXVFrrD0BHvuASc3Z4J7TEW4=;
	b=qEygF41ti72Oo4rvfmzYi0FMHkizvGPEJsLDQT+Lo603vA/SHJ485FG5FwKjnXTZSu
	/YDLppPJBtRb8uaLLQsBvigS6LLqTwfMGdLy3yHnfeD4UxxgXJCRrmsx1gJqfHRV1Uxs
	BYE7LVpqP2A3QvjKTCBcPiMSHIvitJe01bq+r1zStdZSfF2yV7gUDWbbt9MZVB5rtWSv
	YXoKd32NXSmkLph7s1RjC66eZC0S5+G8Wm7mJuocCuuuIe3XYftewV5pOvwxj0XQQHGx
	xro/n9UgQzFQh45iItop824OmwRernjruPGyujEuoRkZ1VxwILlQolpKvfQ8ZOaWwJGf
	AzZA==
X-Gm-Message-State: APjAAAXlBCsfQQovigQ65aoO7SrmJOHiZarRWZVwknPjctyOJtYhljEz
	57PCBlvKez7mQYISQA8GjkJelGl4qPd4IriVSILGyA==
X-Google-Smtp-Source: APXvYqweq+9jxt40AdvDKjZWVjOW/nOohkgSSiT56AzbAgHOEh/MPMnp4ZL70wIt0qmXELAtByZGOCzlawGfKD6TzRg=
X-Received: by 2002:ac2:545b:: with SMTP id d27mr4642844lfn.36.1565147516637; 
	Tue, 06 Aug 2019 20:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190805074322.31099-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190805074322.31099-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:11:46 -0300
Message-ID: <CADkTA4P5vYZ4qKTTfLGy83i1SOCED3k578rq_Mm-vUvyXKY3Ww@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-httplib2: upgrade 0.13.0 -> 0.13.1
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
X-List-Received-Date: Wed, 07 Aug 2019 03:11:58 -0000
Content-Type: multipart/alternative; boundary="000000000000c01546058f7e4dda"

--000000000000c01546058f7e4dda
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 5, 2019 at 4:44 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> -License-Update: Version in PKG-INFO file updated to 0.13.1
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-httplib2.inc          | 6
> +++---
>  .../python/{python-httplib2_0.13.0.bb => python-httplib2_0.13.1.bb} | 0
>  .../{python3-httplib2_0.13.0.bb => python3-httplib2_0.13.1.bb}      | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httplib2_0.13.0.bb
> => python-httplib2_0.13.1.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-httplib2_0.13.0.bb
> => python3-httplib2_0.13.1.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2.inc
> b/meta-openstack/recipes-devtools/python/python-httplib2.inc
> index 95890cc..75473ab 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2.inc
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2.inc
> @@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
>  HOMEPAGE = "https://code.google.com/p/httplib2/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=341f12f35eee133c8ce15c04a042fb72"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e199474a42f8d1baba57f39b790a557e"
>
> -SRC_URI[md5sum] = "c0c3b1c1a1c51fa40f46271d95f74fdc"
> -SRC_URI[sha256sum] =
> "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
> +SRC_URI[md5sum] = "ff90c595c6a58a954a65088b6a470999"
> +SRC_URI[sha256sum] =
> "6901c8c0ffcf721f9ce270ad86da37bc2b4d32b8802d4a9cec38274898a64044"
>
>  inherit pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/
> python-httplib2_0.13.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/
> python-httplib2_0.13.0.bb
> rename to meta-openstack/recipes-devtools/python/python-httplib2_0.13.1.bb
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/
> python3-httplib2_0.13.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/
> python3-httplib2_0.13.0.bb
> rename to meta-openstack/recipes-devtools/python/
> python3-httplib2_0.13.1.bb
> --
> 2.7.4
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

--000000000000c01546058f7e4dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 5, 2019 at 4:44 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a href=3D"mailto:yu=
anc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt=
;<br>
<br>
-License-Update: Version in PKG-INFO file updated to 0.13.1<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/python-httplib2.inc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A0.../python/{<a href=3D"http://python-httplib2_0.13.0.bb" rel=3D"noref=
errer" target=3D"_blank">python-httplib2_0.13.0.bb</a> =3D&gt; <a href=3D"h=
ttp://python-httplib2_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-httplib2_0.13.1.bb</a>} | 0<br>
=C2=A0.../{<a href=3D"http://python3-httplib2_0.13.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-httplib2_0.13.0.bb</a> =3D&gt; <a href=3D"http:/=
/python3-httplib2_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-h=
ttplib2_0.13.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-httplib2_0.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-httplib2=
_0.13.0.bb</a> =3D&gt; <a href=3D"http://python-httplib2_0.13.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python-httplib2_0.13.1.bb</a>} (100%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on3-httplib2_0.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-httpli=
b2_0.13.0.bb</a> =3D&gt; <a href=3D"http://python3-httplib2_0.13.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-httplib2_0.13.1.bb</a>} (100%)<br=
>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-httplib2.inc b/m=
eta-openstack/recipes-devtools/python/python-httplib2.inc<br>
index 95890cc..75473ab 100644<br>
--- a/meta-openstack/recipes-devtools/python/python-httplib2.inc<br>
+++ b/meta-openstack/recipes-devtools/python/python-httplib2.inc<br>
@@ -2,10 +2,10 @@ DESCRIPTION =3D &quot;A comprehensive HTTP client library=
&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://code.google.com/p/httplib2/" re=
l=3D"noreferrer" target=3D"_blank">https://code.google.com/p/httplib2/</a>&=
quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D341f12f35eee133c8ce15c04a=
042fb72&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3De199474a42f8d1baba57f39b7=
90a557e&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c0c3b1c1a1c51fa40f46271d95f74fdc&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca44=
8582bb1e180aeb4c6b2&quot;<br>
+SRC_URI[md5sum] =3D &quot;ff90c595c6a58a954a65088b6a470999&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6901c8c0ffcf721f9ce270ad86da37bc2b4d32b8802d4=
a9cec38274898a64044&quot;<br>
<br>
=C2=A0inherit pypi<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-httplib2_0.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-httplib2_=
0.13.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://py=
thon-httplib2_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python-httpli=
b2_0.13.1.bb</a><br>
similarity index 100%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-httplib2_0.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-httplib2_0=
.13.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-h=
ttplib2_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python-httplib2_0.1=
3.1.bb</a><br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-httplib2_0.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-httplib=
2_0.13.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python3-httplib2_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ht=
tplib2_0.13.1.bb</a><br>
similarity index 100%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
3-httplib2_0.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-httplib2=
_0.13.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python3-=
httplib2_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-httplib2_0=
.13.1.bb</a><br>
-- <br>
2.7.4<br>
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

--000000000000c01546058f7e4dda--
