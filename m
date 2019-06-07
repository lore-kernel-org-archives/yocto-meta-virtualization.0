Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 742A4E00736; Fri,  7 Jun 2019 00:05:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.166.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ticotimo[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBC98E00736
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2019 00:05:30 -0700 (PDT)
Received: by mail-it1-f196.google.com with SMTP id i21so1203986ita.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Jun 2019 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H/Rk90VqgesTUZnVDIHC0uRwETCSLS8pyBd56vDuFhM=;
	b=tJdTRwpLaxWvk69rfJm2nMVCrdpN9Y5Th4PgYFasGlIKoEKbkUxG48kSade8EnkPbF
	lClJDWCHlLfpOkzad46LHNGnlHLmjQf2Q9h24HnSyEgMM40ExiycRoSvjsoCswpnrR7+
	cNxMeBfEf7/WTLd7U8DDh9KbF8FVoGVWgydyM0OgGosz+D7/6xdcsnVJXUWawQ1Ba/l1
	0LlHmiFHDEbCz246sECeSu9tL1mOlBXb+z5D/1/5UeAkwA+9XBIkQF+pxoHcVU8AzBTL
	CLQWDQE3dvNnwhAzy6wtHtHh2jcGiNZq4NQdPkAyw2IHhH6BTxMkGy5MLMb8COcJkFZZ
	E5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H/Rk90VqgesTUZnVDIHC0uRwETCSLS8pyBd56vDuFhM=;
	b=FBjhhsB17S4AgMncJaAg2I1MWMMD5HFljgdT9i121Ov/gJJiQGu84+WFB2+N6zDrKY
	Wv4cO2wgQ0cwVVU+w+Q1+3ZUcD0nB4DwZTVSdVCWNapbKWrx1PO4c2knSUIbp0RdfQTn
	51IRML2F97+iOqUHos1aUpygQoJ0IrffbTj+dr36l5zPtzTKhGYftFN4D9vjn8A2zApV
	dXzwhlHDfLv6L6b6R5PzhyJJaBqIjStgl4JzXZo01sU/9mcbilhhNnjRfEWEHqVxYR9Q
	fCSlszxunAu+wxr3kKKaL85QEuktel6IelTOs+8TBcUtQp1oM2R2LmIM2ByWHkGfbNpJ
	jFow==
X-Gm-Message-State: APjAAAVqG/LoxbsrYOLs+i/eKntDqCZlCJeuqbeTR+jUgViieh1JZcqK
	pd/V1jkuhPm2YTsQ8gTPSPW/HRiaa7lJbJrpQZSWGQ==
X-Google-Smtp-Source: APXvYqx/OGBvrLPVxzuRwtNUqqV3SHZPhx1uoQX83mIrpdax5A+NlYEhkY+GrqMIw+v6Waa1bkhF/Sx+0SlZbtS2mwY=
X-Received: by 2002:a24:1796:: with SMTP id 144mr2995419ith.18.1559891130335; 
	Fri, 07 Jun 2019 00:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190606022424.12634-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606022424.12634-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:05:19 -0700
Message-ID: <CANx9H-DFxJBUwPu4euQoZ8Ug36hdjqrOOrOaTRid1NSwWn08ng@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-osc-lib: upgrade 1.7.0 -> 1.12.1
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
X-List-Received-Date: Fri, 07 Jun 2019 07:05:31 -0000
Content-Type: multipart/alternative; boundary="000000000000b6460a058ab674fd"

--000000000000b6460a058ab674fd
Content-Type: text/plain; charset="UTF-8"

Please consider providing a python3 version as well.

On Wed, Jun 5, 2019 at 7:23 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-osc-lib_1.7.0.bb to python-osc-lib_1.12.1.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python-osc-lib_1.7.0.bb => python-osc-lib_1.12.1.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osc-lib_1.7.0.bb
> => python-osc-lib_1.12.1.bb} (81%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.7.0.bb b/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.12.1.bb
> similarity index 81%
> rename from meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
> rename to meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
> index e3328d7..8b7a4f7 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -SRC_URI[md5sum] = "8bae654318c8c82d341f7228cfa3ec2d"
> -SRC_URI[sha256sum] =
> "7dee72f13e5478f8d3d836267fa019b99ed4d5e478fc08bbcc9e23029d11ec78"
> +SRC_URI[md5sum] = "73c8bd90b8325b2595b814f41d06fdb8"
> +SRC_URI[sha256sum] =
> "26d3e32c8c4eff47240c458cddb6b75db52034d643f01de2841ad9e84904d7aa"
>
>  inherit setuptools pypi
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000b6460a058ab674fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please consider providing a python3 version as well.=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jun 5, 2019 at 7:23 PM Zang Ruochen &lt;<a href=3D"mailt=
o:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">-Upgrade from <a href=3D"http://python=
-osc-lib_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.7.=
0.bb</a> to <a href=3D"http://python-osc-lib_1.12.1.bb" rel=3D"noreferrer" =
target=3D"_blank">python-osc-lib_1.12.1.bb</a>.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python-osc-lib_1.7.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python-osc-lib_1.7.0.bb</a> =3D&gt; <a href=3D"http://pytho=
n-osc-lib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.=
12.1.bb</a>}=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-osc-lib_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.=
7.0.bb</a> =3D&gt; <a href=3D"http://python-osc-lib_1.12.1.bb" rel=3D"noref=
errer" target=3D"_blank">python-osc-lib_1.12.1.bb</a>} (81%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-osc-lib_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.7=
.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-osc-lib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.1=
2.1.bb</a><br>
similarity index 81%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-osc-lib_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.7.=
0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-o=
sc-lib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.12.=
1.bb</a><br>
index e3328d7..8b7a4f7 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-osc-l=
ib_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.7.0.bb</=
a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-osc-l=
ib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.12.1.bb=
</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1dece7821bf3fd70fe130=
9eaa37d52a2&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;8bae654318c8c82d341f7228cfa3ec2d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7dee72f13e5478f8d3d836267fa019b99ed4d5e478fc0=
8bbcc9e23029d11ec78&quot;<br>
+SRC_URI[md5sum] =3D &quot;73c8bd90b8325b2595b814f41d06fdb8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;26d3e32c8c4eff47240c458cddb6b75db52034d643f01=
de2841ad9e84904d7aa&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
-- <br>
2.20.1<br>
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
</blockquote></div></div>

--000000000000b6460a058ab674fd--
