Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8CF6E00C87; Thu, 25 Jul 2019 19:41:49 -0700 (PDT)
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
	*      [209.85.221.47 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FB40E00961
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:41:49 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id z1so52701547wru.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Yhx992OZHAG+ynJKEN3gBFdf++SM7c210j/BggMSw18=;
	b=lpuzj0MRTBaX26cYpeOGtcTkpd+HvzLsnUw3ruO+yP6ZbhipM+nbSmCMLANhfwxD12
	u1yTmUTNLcBDkue2hOcGIe8AtN0VBBOIeCKOo7wat28AEdW4xWlZJ40L7BI0Kne11HVq
	SfS0Yw7wDK7UEpHrDofcWJUnxVb48ydZLY1REQykdgX6vhBcKzOiIAfIQZXtBJUzRk7h
	6XU2NKkE9RDkdiVUa/1/zDJYOQWjgfa2PA44kVOeHtieAkxiuwVUWhqtYbUb6LG3ORSt
	EMcsdnkAaNz3qcjkGW8wBptzk/1x1OfxQ+/FymQJx6Q58g5BUktrh8FF89G6DC5+Pigj
	jLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yhx992OZHAG+ynJKEN3gBFdf++SM7c210j/BggMSw18=;
	b=t+BTswMs8pkQrQRXZXWPNPYQjLvg7NlrtnK7dv0JNvMw/hDOAwQszVL898bG94eJwH
	XtuAwa9v+SiG5k5KaJb4PNE2Hz1+RtUMsg1Exf3ZYJk9sXEzZ5OSWgRBS3pXrSmHn3LE
	fcT6LFdjkr49Ma4Jz2qYsLFjJJc6Orw2i72Jsvm6ZTgmX/xQf67/4r6AHF2ayiTNiYAz
	wmzgObPhvCfP21LYTdIa9KSij+c+D3vlNLVdfBLIYkRI6urgU+JPEfRQQ6jCW8h/PATy
	rmlF866/sGW/MS8mspPrLsCZWxTiY6b2oKEE97KljhQ9RcfvS+UqbkB8F+PnX31jOguM
	OObQ==
X-Gm-Message-State: APjAAAU9ifW3VRZZeb3L16LXn+cpwR6TjYfHCjvlsj40RHd6RUlXSPRX
	RNQyqXyDP3++ZvxGMKw+g29SnGTOFB3dAFlO6F8=
X-Google-Smtp-Source: APXvYqx87FHRB/gKI8RDjB8vt4k3j9M5SIdt0OpvU8x1YcYpe3KXb3h9CYb72tG/OsO0k3ThT9fI6Dc0aQ62kaA7Aks=
X-Received: by 2002:a5d:408c:: with SMTP id o12mr2717939wrp.176.1564108908249; 
	Thu, 25 Jul 2019 19:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190726010520.12925-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190726010520.12925-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:41:36 -0400
Message-ID: <CADkTA4MeWdj4b=V-BtVWVE05wstTkRYP95XjJL5meW=CQzCaDA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-paramiko: upgrade 2.4.2 -> 2.6.0
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
X-List-Received-Date: Fri, 26 Jul 2019 02:41:50 -0000
Content-Type: multipart/alternative; boundary="000000000000ddc5fe058e8c7b53"

--000000000000ddc5fe058e8c7b53
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jul 25, 2019 at 9:09 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-paramiko_2.4.2.bb => python-paramiko_2.6.0.bb}     |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-paramiko_2.4.2.bb
> => python-paramiko_2.6.0.bb} (65%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-paramiko_2.4.2.bb b/meta-openstack/recipes-devtools/python/
> python-paramiko_2.6.0.bb
> similarity index 65%
> rename from meta-openstack/recipes-devtools/python/
> python-paramiko_2.4.2.bb
> rename to meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
> index a570c32..2b2c8e8 100644
> --- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>
> -SRC_URI[md5sum] = "a476ea106177fe22e797428d54811aed"
> -SRC_URI[sha256sum] =
> "a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca5445ce7df409f900fcb"
> +SRC_URI[md5sum] = "f729a45c9122bf975b9177ec5aaa3791"
> +SRC_URI[sha256sum] =
> "f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041"
>
>  inherit setuptools pypi
>
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

--000000000000ddc5fe058e8c7b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
l 25, 2019 at 9:09 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fuj=
itsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-paramiko_2.4.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-paramiko_2.4.2.bb</a> =3D&gt; <a href=3D"htt=
p://python-paramiko_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-p=
aramiko_2.6.0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-paramiko_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_=
2.4.2.bb</a> =3D&gt; <a href=3D"http://python-paramiko_2.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-paramiko_2.6.0.bb</a>} (65%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-paramiko_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_2=
.4.2.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-paramiko_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_=
2.6.0.bb</a><br>
similarity index 65%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-paramiko_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_2.=
4.2.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-p=
aramiko_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_2.6.=
0.bb</a><br>
index a570c32..2b2c8e8 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-param=
iko_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_2.4.2.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-param=
iko_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-paramiko_2.6.0.bb=
</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dfd0120fc2e9f841c73ac7=
07a30389af5&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;a476ea106177fe22e797428d54811aed&quot;<br>
-SRC_URI[sha256sum] =3D &quot;a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca=
5445ce7df409f900fcb&quot;<br>
+SRC_URI[md5sum] =3D &quot;f729a45c9122bf975b9177ec5aaa3791&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f4b2edfa0d226b70bd4ca31ea7e389325990283da2346=
5d572ed1f70a7583041&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
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

--000000000000ddc5fe058e8c7b53--
