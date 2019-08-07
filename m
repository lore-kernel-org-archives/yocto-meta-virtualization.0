Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2BFFE003C1; Tue,  6 Aug 2019 20:13:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA22CE003C1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:13:25 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id v24so84179895ljg.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJjNixyCiOgVzx9oYB7hkTuomyNxSqqRvxJKJJVOJpQ=;
	b=j9o57rEPSap6Ds4jX9Yx4H4rT3JBGiEl1LR5D7fAHM5CqtNQhbRU8Z8SAoqYCS7/ND
	SjMHHfQBG4SAxTPEs62gFR2TZaUznq1Gsags4FezD4sUbuzdXGoAZbTGJmnD//fakUxr
	oCRpv/2f62/Krwoq8EFu5kkIAmDS8LbXssR3684LKpT94TD5NRjW+gMvehdf6hBEEyQG
	r0MoYzPcKx2xDwJXpuC/5VlZc6Ac04FQjF6cZZbTSriOETj3UAeNKmt5N2gYj2DNNPMC
	H6WKdaaTR7soQ0VGB6zxJv3uHpzvD2lWh5rrihKIxxIqWSMvkHsKXGH6tzN8T/86vn9d
	qG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJjNixyCiOgVzx9oYB7hkTuomyNxSqqRvxJKJJVOJpQ=;
	b=TUTy9rjYevGePMb+qx1/QqLd2Bh9vuQe9gE4a7R8H6xTdyic3YkF2GIQy5W15+kyXW
	UTaQmCZaqjMIMzLySc54tM827BryPwAWeJXnwYt8lWSCWoc+BB0O/83mbZvsKiJg7g5Y
	UCWbL0zITLHUdEr1o/wZP/HGQ+CaYsRdDEt8mlt0Q+D/jira48FJCMVDvS08wTVtWxUb
	IHHQkFCgSHhZ0R3nP5l3BfB7+H0wOsfM0ylESn64lKi1DEcGMHJzZVki7onidnuuwgWw
	wG3v9sbD7tKzZcQ9W8G5uy28ciyEkfMS3FOIjXYYAxq90l4cYDO5K184LzDFc7Q+dEQ3
	mF+g==
X-Gm-Message-State: APjAAAUO5ECBFApDK1/qEjFilQ64a1P+GtHTYUdE+pbSXqYCQt7FLeU4
	DI1OBxPOFoWbTc4tLXlw232BxAnspEM6keXHMl9GYw==
X-Google-Smtp-Source: APXvYqxFZmSvauwXGbRo3G8TPEAaHYPT1Rc17TCq35eNFbXqbQpug9QCS5OQYQ5OqpsJ7PtLoPEBSRZkNtXDtXWI9rQ=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr3482955ljj.78.1565147604594;
	Tue, 06 Aug 2019 20:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <1565096941-16553-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565096941-16553-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:13:14 -0300
Message-ID: <CADkTA4MOrOWHi5Jama6-VEtvmyjSxt3Qtn-jfYJTO0zhAv4gqg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-osc-lib: upgrade 1.12.1 -> 1.13.0.
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
X-List-Received-Date: Wed, 07 Aug 2019 03:13:26 -0000
Content-Type: multipart/alternative; boundary="000000000000fe332d058f7e52bd"

--000000000000fe332d058f7e52bd
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 6, 2019 at 1:09 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python-osc-lib_1.12.1.bb => python-osc-lib_1.13.0.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osc-lib_1.12.1.bb
> => python-osc-lib_1.13.0.bb} (81%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.12.1.bb b/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.13.0.bb
> similarity index 81%
> rename from meta-openstack/recipes-devtools/python/
> python-osc-lib_1.12.1.bb
> rename to meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> index 8b7a4f7..7540e79 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -SRC_URI[md5sum] = "73c8bd90b8325b2595b814f41d06fdb8"
> -SRC_URI[sha256sum] =
> "26d3e32c8c4eff47240c458cddb6b75db52034d643f01de2841ad9e84904d7aa"
> +SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
> +SRC_URI[sha256sum] =
> "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
>
>  inherit setuptools pypi
>
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

--000000000000fe332d058f7e52bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Au=
g 6, 2019 at 1:09 AM Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fuj=
itsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Signed-off-by: Zheng Ruoqin &lt;<a hre=
f=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.=
fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python-osc-lib_1.12.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-osc-lib_1.12.1.bb</a> =3D&gt; <a href=3D"http://pyt=
hon-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_=
1.13.0.bb</a>}=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-osc-lib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1=
.12.1.bb</a> =3D&gt; <a href=3D"http://python-osc-lib_1.13.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-osc-lib_1.13.0.bb</a>} (81%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-osc-lib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.=
12.1.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1=
.13.0.bb</a><br>
similarity index 81%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-osc-lib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.1=
2.1.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-o=
sc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.13.=
0.bb</a><br>
index 8b7a4f7..7540e79 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-osc-l=
ib_1.12.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.12.1.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-osc-l=
ib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.13.0.bb=
</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1dece7821bf3fd70fe130=
9eaa37d52a2&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;73c8bd90b8325b2595b814f41d06fdb8&quot;<br>
-SRC_URI[sha256sum] =3D &quot;26d3e32c8c4eff47240c458cddb6b75db52034d643f01=
de2841ad9e84904d7aa&quot;<br>
+SRC_URI[md5sum] =3D &quot;5e91028524b50a72f9913ccd2994cf77&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707=
950dc1c6f0b286cce77&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
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

--000000000000fe332d058f7e52bd--
