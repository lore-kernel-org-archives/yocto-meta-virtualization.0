Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65697E00B81; Thu, 16 May 2019 12:50:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FD5BE00B3E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2019 12:50:03 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id a10so4202315ljf.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2019 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KvwAzm3SKYROvw0BxN7/L4x++WspOkNTo4tC4KHzeUA=;
	b=iBI4PKtFteAm/jzODo9e2jMERXkG4L1IXaAnSjdz5ePSs0gSvopjxcxq0JKAJI8rWR
	0Bw9sDBGqOOVpITkiI9Ul2Ke+NzxLJKf9FmPnl7NyWlQV5VxDJ+A2rj0czWM3YI9ZoD1
	xStMYh+ROBmzVR1b0QsFlS9XxBPRZmRbnY5PhEWI9r+YdApNtSEvIAlQ16zbKaVB/qOq
	rbMn4BSWpsm9qkK251tFJKL57KcnFdZGtVt8GlestHqznx7iJp2RGxhxkENKQYH4IZ9g
	uYklXF0k0sFP5ph1Gv2fXClIqJc7ITeKgTocrLUHV7OFnDFgx5bDFooSoDmuHCpIT1d9
	kV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KvwAzm3SKYROvw0BxN7/L4x++WspOkNTo4tC4KHzeUA=;
	b=XJNSwyKu7SJhH4THC8BuldUKdR260wRnXchbGw6jq/EN4ky5aU4s3rWLiEt55Jvn2w
	Fqq75sMtO3tzDtWE/u7yHsP85JwaHnypjeOqHHxeBY4DHJdUrQGflMnHBQqGYLjzpAEd
	UJ14w43aqfGgiuLd29EICv4zAkpYwF+1v/xV3pLSD45UnIdvv46nT1zVHohdGKLOaJYl
	25hGSTCX+y3zlGQ5/0RgiKCRc9zDUniYIEEh7yENlKIasGMvYa8rJ4w+dShR8Gb/G9O9
	n49Yz5T0VYk8PR6iXxZdAOVk07nqcKyPp8JOtH9kRx5xQsFfaEGdg31kos/YBG843WBo
	NsDg==
X-Gm-Message-State: APjAAAWxzmy0E1xGyS0orBYEBfdrn1NB7oBbbKbdIf/HCyCq+FOOwFQX
	TpDc4A7rFl6Cn1Gi/c0YRMpTGB493POA0lZ+gZw=
X-Google-Smtp-Source: APXvYqyL3MRABRTWqtx0AcsDmFcm8ypXc6YRyh9ve+ee2BvWW0I2nNN96t0dVKMBIfvH2qYwiL351v/uyqerglawu3g=
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr24234062ljj.78.1558036202220; 
	Thu, 16 May 2019 12:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190515082529.10274-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190515082529.10274-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 May 2019 15:49:51 -0400
Message-ID: <CADkTA4PNsTxYbLQaHoUVid7Z=Y2Hig-hcBz8eRxJRN6Ux-_rdQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-contextlib2:upgrade 0.4.0 -> 0.5.5
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
X-List-Received-Date: Thu, 16 May 2019 19:50:04 -0000
Content-Type: multipart/alternative; boundary="0000000000006172c305890692c0"

--0000000000006172c305890692c0
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, May 15, 2019 at 6:53 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-contextlib2_0.4.0.bb to
> python-contextlib2_0.5.5.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...ython-contextlib2_0.4.0.bb => python-contextlib2_0.5.5.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{
> python-contextlib2_0.4.0.bb => python-contextlib2_0.5.5.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-contextlib2_0.4.0.bb b/meta-openstack/recipes-devtools/python/
> python-contextlib2_0.5.5.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/
> python-contextlib2_0.4.0.bb
> rename to meta-openstack/recipes-devtools/python/
> python-contextlib2_0.5.5.bb
> index 960238d..af9270e 100644
> --- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "PSF"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
>
> -SRC_URI[md5sum] = "ea687207db25f65552061db4a2c6727d"
> -SRC_URI[sha256sum] =
> "55a5dc78f7a742a0e756645134ffb39bbe11da0fea2bc0f7070d40dac208b732"
> +SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
> +SRC_URI[sha256sum] =
> "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
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

--0000000000006172c305890692c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ma=
y 15, 2019 at 6:53 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">-Upgrade from <a href=3D"http://python-=
contextlib2_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-contextli=
b2_0.4.0.bb</a> to<br>
<a href=3D"http://python-contextlib2_0.5.5.bb" rel=3D"noreferrer" target=3D=
"_blank">python-contextlib2_0.5.5.bb</a>.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ython-contextlib2_0.4.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ython-contextlib2_0.4.0.bb</a> =3D&gt; <a href=3D"http://p=
ython-contextlib2_0.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python-con=
textlib2_0.5.5.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-contextlib2_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-contex=
tlib2_0.4.0.bb</a> =3D&gt; <a href=3D"http://python-contextlib2_0.5.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python-contextlib2_0.5.5.bb</a>} (70%)<=
br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-contextlib2_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-context=
lib2_0.4.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http:=
//python-contextlib2_0.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python-=
contextlib2_0.5.5.bb</a><br>
similarity index 70%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-contextlib2_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-contextl=
ib2_0.4.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-c=
ontextlib2_0.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python-contextlib=
2_0.5.5.bb</a><br>
index 960238d..af9270e 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-conte=
xtlib2_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-contextlib2_0.=
4.0.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-conte=
xtlib2_0.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python-contextlib2_0.=
5.5.bb</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;PSF&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D43d1c7827e8fad645=
4b553caf0e1d734&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;ea687207db25f65552061db4a2c6727d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;55a5dc78f7a742a0e756645134ffb39bbe11da0fea2bc=
0f7070d40dac208b732&quot;<br>
+SRC_URI[md5sum] =3D &quot;95fe420941ebc64951cd9d89edc41870&quot;<br>
+SRC_URI[sha256sum] =3D &quot;509f9419ee91cdd00ba34443217d5ca51f5a364a404e1=
dce9e8979cea969ca48&quot;<br>
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

--0000000000006172c305890692c0--
