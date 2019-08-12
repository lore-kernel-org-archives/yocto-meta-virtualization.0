Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F8A7E00D88; Mon, 12 Aug 2019 07:58:04 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0F60E00D83
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:58:01 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id j17so20413537lfp.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eZcKl+jVd9UiKGDIqtnhgtgXe2SLmGW81OaGG3JCuZA=;
	b=PIMpmgNeSNTNliiOFphuSLy9vr8nBqnkTVkEWnRQZgc4BuKNbFcGBATqzGkjxZUHMN
	iId0HiuJZFN6YbPZaw+SatWw0DdZBN7s9w7rdLYt5p7V7hvLABJYg96Ti5qYlN9MAONd
	h3xVNKdi7EG6rQ/6udLQo7A/aqsXG7T2AxWWWmUfyOgimknA+Xr7sbbpDEH3q1+Lr6IH
	AgottXJCHU91rAf8EOTy0Nrmtu2ThQCC6Q4t79jnF39E3qx0GrJakrGQLD2t6kRziS1s
	3yRUJybgdhcWihM17gSFGo7m2WtFy144iTNcNt3pDDrPjPURrMoyj+5BPJe0WGtC/sIo
	PqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eZcKl+jVd9UiKGDIqtnhgtgXe2SLmGW81OaGG3JCuZA=;
	b=EwV2daB9ebZLB2U1nfXMdVg68llBgfpaX8O+AAvKHupk6zhzJWLEZkPlcFEaM1K4gj
	XrlMUNXvJdTjkxN3tj9OPKf3zMv02hOrgJbvuxPyyOVgxD4yrqbZUEDhGNQzRVI2e7RX
	mpQDVZu9syJfQJ3IilqDTNtnpbTdGQ/eu6Z1Ds7Tg7fmEmiTWfgeKBmFeTaogNrpIroH
	wVPMjPQZqrxtWxvLYmVuItvR7cIv/0gSq6o6lJYW1BBK5DaFN/+X3ERENMpwbh6n9tOu
	TBuppYKgTPnAkH1vQ7es1xQXF6HvZVrklDU9p/OleH5I8JZdUfKrTX8sh59i5c9vhbcS
	Yj7Q==
X-Gm-Message-State: APjAAAUt0NlMB3rg0CytLeF6n3nGwX5uH+cOi7fUdb/w9l0WuycwamUX
	TGrP31V8wS7CFLi8HaZPLRI7XXfls46x8caiGIHjUvX7vig=
X-Google-Smtp-Source: APXvYqzFSzMXK7hBgbnoYWhJxyjg5hKJwVUFpBizAeRdpydUXMMprjR/JOn7oPDv046JxsFTiYv7kMZSEj7t4wlyOKI=
X-Received: by 2002:ac2:59dd:: with SMTP id x29mr19976065lfn.140.1565621880785;
	Mon, 12 Aug 2019 07:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085102.12604-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190808085102.12604-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:57:48 -0400
Message-ID: <CADkTA4NvbS3CL7nFScEcdDmD_J_R1_sWMRLwkytUH8jzSVtSnQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-futures: upgrade 3.0.3 -> 3.3.0
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
X-List-Received-Date: Mon, 12 Aug 2019 14:58:04 -0000
Content-Type: multipart/alternative; boundary="0000000000000e8f93058fecc0fa"

--0000000000000e8f93058fecc0fa
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 8, 2019 at 4:51 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-futures_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-futures_git.bb
> b/meta-openstack/recipes-devtools/python/python-futures_git.bb
> index f26be9a..015ae5f 100644
> --- a/meta-openstack/recipes-devtools/python/python-futures_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-futures_git.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dd6708d05936d3f6c4e20ed14c87b5e3"
>
> -PV = "3.0.3+git${SRCPV}"
> -SRCREV = "6532a7449d8102c172ea5011f1552fcc163c09f1"
> +PV = "3.3.0+git${SRCPV}"
> +SRCREV = "ec78e222ece60721fc92a6c650df3116cb15d24e"
>
>  SRCNAME = "futures"
>  SRC_URI = "git://github.com/agronholm/python${SRCNAME}.git
> <http://github.com/agronholm/python$%7BSRCNAME%7D.git>"
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

--0000000000000e8f93058fecc0fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Au=
g 8, 2019 at 4:51 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fuj=
itsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-futur=
es_git.bb" rel=3D"noreferrer" target=3D"_blank">python-futures_git.bb</a> |=
 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-futures_git.bb" rel=3D"noreferrer" target=3D"_blank">python-futures_git.b=
b</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-fut=
ures_git.bb" rel=3D"noreferrer" target=3D"_blank">python-futures_git.bb</a>=
<br>
index f26be9a..015ae5f 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-futur=
es_git.bb" rel=3D"noreferrer" target=3D"_blank">python-futures_git.bb</a><b=
r>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-futur=
es_git.bb" rel=3D"noreferrer" target=3D"_blank">python-futures_git.bb</a><b=
r>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddd6708d05936d3f6c4e20=
ed14c87b5e3&quot;<br>
<br>
-PV =3D &quot;3.0.3+git${SRCPV}&quot;<br>
-SRCREV =3D &quot;6532a7449d8102c172ea5011f1552fcc163c09f1&quot;<br>
+PV =3D &quot;3.3.0+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;ec78e222ece60721fc92a6c650df3116cb15d24e&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;futures&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/agronholm/python=
$%7BSRCNAME%7D.git" rel=3D"noreferrer" target=3D"_blank">github.com/agronho=
lm/python${SRCNAME}.git</a>&quot;<br>
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

--0000000000000e8f93058fecc0fa--
