Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74B30E00D83; Mon, 12 Aug 2019 07:57:37 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39B18E00CD5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:57:36 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id e24so1887748ljg.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iAUgxn8t/+2L3Ley5sgDtpLaaFpoPu5HheBnjqG8jzA=;
	b=EZrDg48CbJcFxo4d559ocQ3kpBJ3TQtEZU5Bi/SZww9wOTmVSiokoFfyjcIAOohV71
	Ll3Unz+Z2bcbwh2NQQjeDcEGwQibdLWYc80zrO4+RpGe6v11t39uXoGthiKbmiiqGYMr
	fv4b2Lou+ZkQCGKj9Xz7omNMa5Ox9XVxT6twksmn8bsYHSyggk/z9ACGdQMxbls61oFe
	1TmoyFKsDY2zv1GqAfHN0ayt9bT3M3t4h1grwGYfoTpC3Itv8JE0YndTSG9534a5XV7H
	g5mdFvxMZeApdIDxmBqzME1VNeTn7QYq1vnmkNNQy6ePE/YYIs6VODTFthEbNMziyGqa
	oe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iAUgxn8t/+2L3Ley5sgDtpLaaFpoPu5HheBnjqG8jzA=;
	b=G1q68B6Ilc8PJy4BC1TTR88EE8ILLHJGtPqQnPlVDoZFzC9C5Gfh+gZ3I3Iqs5NPv1
	PJryKml4Wrf9lW4+gP/7160L5PZUXu+qRQeCf80TI9xFBJP7iXvnHRO4EBnnaXMQFj1Q
	VHGQGFvXK6UkyS/41NQNKNHWwHL/GVLN2TLncG1ihpRfc9CLKqUG3/rxCltSO7D1yEfA
	VQEexKF19q5zLNGjEzPSbsXRfhsQZWPRPKEdDFs4W7A60gjKyXMpxSXaB8kIKmYXENOf
	NH9vUYN/r3+DhTerCC+vSh9BPuwwaDyn5eDkGU+UKlfdOpafVUGZ7Rr/5ORhZgA3a960
	vk0g==
X-Gm-Message-State: APjAAAUsaEsUt6bWNFJ8EMskQOZ2YOpj6w3B2YvT12SHltv9uxeC4En8
	7gf07lugyNWkaq5diagRm3/4M9En7qqE/WClYHQu1ZjJHNQ=
X-Google-Smtp-Source: APXvYqxL6YZsq22brTbJ7Nn/i1rWg+9Rgg80HQu25nDmX8TC6Wkid8RAGsXekGoG2QfzQYA10PaWtQEezwYC286UJUw=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr18458551lja.87.1565621855030; 
	Mon, 12 Aug 2019 07:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190808054046.10590-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190808054046.10590-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:57:22 -0400
Message-ID: <CADkTA4MJXuR=GxERCYGhs+8guScQXev8LEMwar0-gFrh5+5uRA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-kombu: upgrade 4.6.0 -> 4.6.3
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
X-List-Received-Date: Mon, 12 Aug 2019 14:57:37 -0000
Content-Type: multipart/alternative; boundary="00000000000085923a058fecbea5"

--00000000000085923a058fecbea5
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 8, 2019 at 1:41 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-kombu.inc               | 4
> ++--
>  .../python/{python-kombu_4.6.0.bb => python-kombu_4.6.3.bb}           | 0
>  .../python/{python3-kombu_4.6.0.bb => python3-kombu_4.6.3.bb}         | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.0.bb =>
> python-kombu_4.6.3.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.0.bb =>
> python3-kombu_4.6.3.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc
> b/meta-openstack/recipes-devtools/python/python-kombu.inc
> index 7f66a4b..722adcd 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu.inc
> +++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
> -SRC_URI[sha256sum] =
> "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
> +SRC_URI[md5sum] = "adc9167ba3571c5465d6f7abe4945a12"
> +SRC_URI[sha256sum] =
> "eb365ea795cd7e629ba2f1f398e0c3ba354b91ef4de225ffdf6ab45fdfc7d581"
>
>  FILES_${PN}-doc += "${datadir}/${SRCNAME}"
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> b/meta-openstack/recipes-devtools/python/python-kombu_4.6.3.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.3.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
> b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.3.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.3.bb
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

--00000000000085923a058fecbea5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Au=
g 8, 2019 at 1:41 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a href=3D"mailto:yu=
anc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt=
;<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/python-kombu.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0.../python/{<a href=3D"http://python-kombu_4.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python-kombu_4.6.0.bb</a> =3D&gt; <a href=3D"http://py=
thon-kombu_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.=
3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../python/{<a href=3D"http://python3-kombu_4.6.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-kombu_4.6.0.bb</a> =3D&gt; <a href=3D"http://=
python3-kombu_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_=
4.6.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A03 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.=
bb</a> =3D&gt; <a href=3D"http://python-kombu_4.6.3.bb" rel=3D"noreferrer" =
target=3D"_blank">python-kombu_4.6.3.bb</a>} (100%)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on3-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.=
0.bb</a> =3D&gt; <a href=3D"http://python3-kombu_4.6.3.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-kombu_4.6.3.bb</a>} (100%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta=
-openstack/recipes-devtools/python/python-kombu.inc<br>
index 7f66a4b..722adcd 100644<br>
--- a/meta-openstack/recipes-devtools/python/python-kombu.inc<br>
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc<br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaea7c168428449fbee05=
e644df929f4&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;3543525c1bfaa74260cbf9a6e47dad2f&quot;<br>
-SRC_URI[sha256sum] =3D &quot;27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e2=
03cecaa0aeca84360be&quot;<br>
+SRC_URI[md5sum] =3D &quot;adc9167ba3571c5465d6f7abe4945a12&quot;<br>
+SRC_URI[sha256sum] =3D &quot;eb365ea795cd7e629ba2f1f398e0c3ba354b91ef4de22=
5ffdf6ab45fdfc7d581&quot;<br>
<br>
=C2=A0FILES_${PN}-doc +=3D &quot;${datadir}/${SRCNAME}&quot;<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.b=
b</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kom=
bu_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.3.bb</a>=
<br>
similarity index 100%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb=
</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-k=
ombu_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.3.bb</=
a><br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.0=
.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-=
kombu_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.3.bb=
</a><br>
similarity index 100%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
3-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.0.=
bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python3-=
kombu_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-kombu_4.6.3.bb=
</a><br>
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

--00000000000085923a058fecbea5--
