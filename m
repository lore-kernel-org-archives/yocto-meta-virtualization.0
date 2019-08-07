Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E47BEE00D8B; Tue,  6 Aug 2019 20:12:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.174 listed in list.dnswl.org]
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
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 318C7E00798
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:12:39 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id d24so84010286ljg.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fHb6LHt7R5vjUtlLIO8gPyvacuTJ/gvlVjJ8/9sL4vk=;
	b=MzcTxgsD9ZI3x20jenquEK84WnSfaZnGjMNaSIYc4DrbvmwqN7GLcXonYSrZj2/9Iu
	IBdNKE2Za7iPlWfN/tp3ncemxTQk3NVfiMHt4SFj9lmpCz4qJSh96x9DTOO6sA9nkMta
	riddSaHhbnAaA7kFTbGeXZZCfaWz+u32MYQtWDfsVT24/kMkW/GSpkT3zY00x3+km93d
	WECDzi/fR/SfLn4IVJ34yNpv9hz1o5IWfubwfYNKQ8uVCmAE8dzS6xDmVq7gDd7Omf2P
	yajYi3XmzIxsw9QgcDM1w1z12VlimDLuPiQv2hRzX32GOBUmpeZ7ft2LUA/w78/esIwY
	BJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fHb6LHt7R5vjUtlLIO8gPyvacuTJ/gvlVjJ8/9sL4vk=;
	b=ZsOPI5WGnECNAGNY0L9vAxodPZDIeJZwNWZrZvnt8g2hW4+4fTz+rLphGv6laOoqfz
	xqSALZIoNevO9gEHXT72gCBOgtyo11hSkPsPq3u4VbEFukExX1YWZqQG5jt3xx1d9lPX
	xKJ2n4t7VW4r1YK7lwTrAByt6x2qnRlTSBVyfp3wCyuq4JYxyLwZcCDpxDdMs9kxu6vI
	u+AEy8MuYycrQrLR9E2ug8KPRyUnFrGKpTjeV+P/gf7y/uG1eKkkXqzYvwQtCgp1eHeO
	tBKAbY9a9o690VsCcJ/N8MjMyXPqtp5vx/SjmBkANydD7B/QcXXk1u4euZsQto/LNdOl
	abAQ==
X-Gm-Message-State: APjAAAWHqfxxSshVaqJMlccScIam02zEZxbOfvTJGlY7kmOOsZ2Ty9ao
	9/n5R97Rbgl4IXb3mQxSBMUzNv2zScS2qUoyCJ0=
X-Google-Smtp-Source: APXvYqwD6jZoeWPSGG343nNMXdb+VcRfaXzJqj10+W0WxtnqZe97QU0JkKVL98xI2XtMZoJjZ3vgDcZJfbURKz4xPfI=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr3383028ljj.185.1565147558259; 
	Tue, 06 Aug 2019 20:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <1565090034-14946-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565090034-14946-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:12:27 -0300
Message-ID: <CADkTA4PfezJOWQ8PDsUWO59u6rynwnLgp1X5b9JR2g2Qb8nb_w@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-keystoneauth1:upgrade 3.14.0 -> 3.15.0
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
X-List-Received-Date: Wed, 07 Aug 2019 03:12:39 -0000
Content-Type: multipart/alternative; boundary="0000000000003b3070058f7e5027"

--0000000000003b3070058f7e5027
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 5, 2019 at 11:14 PM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Upgrade from python-keystoneauth1 from 3.14.0 to 3.15.0.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...keystoneauth1_3.14.0.bb => python-keystoneauth1_3.15.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{
> python-keystoneauth1_3.14.0.bb => python-keystoneauth1_3.15.0.bb} (79%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-keystoneauth1_3.14.0.bb b/meta-openstack/recipes-devtools/python/
> python-keystoneauth1_3.15.0.bb
> similarity index 79%
> rename from meta-openstack/recipes-devtools/python/
> python-keystoneauth1_3.14.0.bb
> rename to meta-openstack/recipes-devtools/python/
> python-keystoneauth1_3.15.0.bb
> index e53f922..a584951 100644
> --- a/meta-openstack/recipes-devtools/python/
> python-keystoneauth1_3.14.0.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python-keystoneauth1_3.15.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
>
> -SRC_URI[md5sum] = "ada9836933f5aa6bd35faf01c314e81d"
> -SRC_URI[sha256sum] =
> "b14f363d02142177c968cfffeb9eb37113682c03ac3c65d483424e203dd602c3"
> +SRC_URI[md5sum] = "0f3e21362a74d1fb8959fc2bf7d28882"
> +SRC_URI[sha256sum] =
> "439f7dcf6edde5ea5a16ef90603d198e118a03f529aba0f8a6d19d5f6433de95"
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

--0000000000003b3070058f7e5027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 5, 2019 at 11:14 PM Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fu=
jitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Upgrade from python-keystoneauth1 fro=
m 3.14.0 to 3.15.0.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://keystoneauth1_3.14.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">keystoneauth1_3.14.0.bb</a> =3D&gt; <a href=3D"http://python-=
keystoneauth1_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keysto=
neauth1_3.15.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-keystoneauth1_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python-key=
stoneauth1_3.14.0.bb</a> =3D&gt; <a href=3D"http://python-keystoneauth1_3.1=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keystoneauth1_3.15.0.bb=
</a>} (79%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-keystoneauth1_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keys=
toneauth1_3.14.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D=
"http://python-keystoneauth1_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python-keystoneauth1_3.15.0.bb</a><br>
similarity index 79%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-keystoneauth1_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keyst=
oneauth1_3.14.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-k=
eystoneauth1_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keyston=
eauth1_3.15.0.bb</a><br>
index e53f922..a584951 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-keyst=
oneauth1_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keystoneaut=
h1_3.14.0.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-keyst=
oneauth1_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-keystoneaut=
h1_3.15.0.bb</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D96f840d59b245a1c817fb=
cb901afc574&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;ada9836933f5aa6bd35faf01c314e81d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b14f363d02142177c968cfffeb9eb37113682c03ac3c6=
5d483424e203dd602c3&quot;<br>
+SRC_URI[md5sum] =3D &quot;0f3e21362a74d1fb8959fc2bf7d28882&quot;<br>
+SRC_URI[sha256sum] =3D &quot;439f7dcf6edde5ea5a16ef90603d198e118a03f529aba=
0f8a6d19d5f6433de95&quot;<br>
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

--0000000000003b3070058f7e5027--
