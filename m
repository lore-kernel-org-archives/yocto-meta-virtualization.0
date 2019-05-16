Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE150E00B5F; Thu, 16 May 2019 12:49:47 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBAE2E00B3E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2019 12:49:46 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id h21so4157695ljk.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2019 12:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6lKntXNZcF0/CPIPIElSmj9J/ERX9r6ad7aWBc8dwJ0=;
	b=vUI+oSJqd1ZCFake8yu2qdLxUSaDUi/TKC8TVTQ7ogxGaXY6QrMUVMGc5CbcdxSuWc
	OtVctlA6adQFW8qvDI7p2/9FF3oHgtR4/K5vdUxW4LOyyymvNZCZSWOe9cSv/xk8Yehg
	2za/RhL2jDzHYGTp5DTzpgPlI3Ve7yh38g/AzsFruu0Ds8/aXDIHedHTmrb22znB4NVY
	kV3+DdOADeERVuNClgNWPBqF1HtM2PMIxHwJ7sQKvdINH2t6W4TJ4uOsLPnJarA3OuCZ
	1ZL7w6Dsyq5SpVuyPLdXODXtwzWoFhgDvlC0JOi0CyqjSz7VOGjhevo4vwA50Et/HXZX
	7Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6lKntXNZcF0/CPIPIElSmj9J/ERX9r6ad7aWBc8dwJ0=;
	b=ubeBxl9PLnGpebdRUrjxO9v1gGLMancnHL6g7mIDFM+DB224W7FJg9zNW0YO2P4TOo
	3fpQWpb3Te4lP0q0SoOQ/0RZL5Oitgw350xququGsLqA7ON2bU1Ct18tc5wUH6f+X0gg
	TLjeCQdYH7s1pE142JDyYK9NV+6Du9pMktCyVRjnf4X1r9FpcW8Kfego46KNlsqIPevs
	VJmmU9AMWaKq4Yw3242KBJwehpnHSuuiE98mA/RbJ1Z8UDcXVptQMGFSPpnJs8Otov7b
	udsl9jVFxMQQR6uvCzjF65mSPdUwwF8EaJfu3p1G4WEYDrWCErusCoom77ThGAtc7Lo8
	25Gw==
X-Gm-Message-State: APjAAAXVHZoe3w5R/uia8A6lyMhmYmInBxxXtm+pqvSIYhU+ZFdOBuGI
	jPiJL77YATiyGfkseyxRoQYXoai+WAQvEcUOE4g=
X-Google-Smtp-Source: APXvYqxSK9IJeQBBI3+Y73L51cWnBqKxuZ/cKskhlZ8tx/JBu8WJ8AK9TiBlEkdJayoJqI/Dqce3rog/CF61gDtAdWg=
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr25008654lji.28.1558036185777; 
	Thu, 16 May 2019 12:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190515084218.15292-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190515084218.15292-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 May 2019 15:49:34 -0400
Message-ID: <CADkTA4OzXLxkXCLDEoCnnFST7U39LOvxGn8kjYBixbprMfUsUg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-debtcollector:upgrade 1.17.1 -> 1.21.0
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
X-List-Received-Date: Thu, 16 May 2019 19:49:47 -0000
Content-Type: multipart/alternative; boundary="000000000000668f9b058906916f"

--000000000000668f9b058906916f
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, May 15, 2019 at 4:48 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-debtcollector_1.17.1.bb to
> python-debtcollector_1.21.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...debtcollector_1.17.1.bb => python-debtcollector_1.21.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{
> python-debtcollector_1.17.1.bb => python-debtcollector_1.21.0.bb} (81%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-debtcollector_1.17.1.bb b/meta-openstack/recipes-devtools/python/
> python-debtcollector_1.21.0.bb
> similarity index 81%
> rename from meta-openstack/recipes-devtools/python/
> python-debtcollector_1.17.1.bb
> rename to meta-openstack/recipes-devtools/python/
> python-debtcollector_1.21.0.bb
> index 52b1319..18b910b 100644
> --- a/meta-openstack/recipes-devtools/python/
> python-debtcollector_1.17.1.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python-debtcollector_1.21.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> -SRC_URI[md5sum] = "d43a2733f02549628fe9f716363a5b01"
> -SRC_URI[sha256sum] =
> "1f751d74789baa82684f55bececf754ebff1ad40e3fb1bee44fcf5c25a31e92d"
> +SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
> +SRC_URI[sha256sum] =
> "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
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


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000668f9b058906916f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ma=
y 15, 2019 at 4:48 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">-Upgrade from <a href=3D"http://python-=
debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-debtco=
llector_1.17.1.bb</a> to <a href=3D"http://python-debtcollector_1.21.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python-debtcollector_1.21.0.bb</a>.<br=
>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://debtcollector_1.17.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">debtcollector_1.17.1.bb</a> =3D&gt; <a href=3D"http://python-=
debtcollector_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python-debtco=
llector_1.21.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-deb=
tcollector_1.17.1.bb</a> =3D&gt; <a href=3D"http://python-debtcollector_1.2=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-debtcollector_1.21.0.bb=
</a>} (81%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-debt=
collector_1.17.1.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D=
"http://python-debtcollector_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python-debtcollector_1.21.0.bb</a><br>
similarity index 81%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-debtc=
ollector_1.17.1.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-d=
ebtcollector_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python-debtcol=
lector_1.21.0.bb</a><br>
index 52b1319..18b910b 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-debtc=
ollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-debtcollect=
or_1.17.1.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-debtc=
ollector_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python-debtcollect=
or_1.21.0.bb</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D083=
5ade698e0bcf8506ecda2f7b4f302&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;d43a2733f02549628fe9f716363a5b01&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1f751d74789baa82684f55bececf754ebff1ad40e3fb1=
bee44fcf5c25a31e92d&quot;<br>
+SRC_URI[md5sum] =3D &quot;ec899623b37fdee65b888243f0a46735&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f0=
2dbf2b89477ec5e55bc&quot;<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000668f9b058906916f--
