Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 158B0E00C18; Tue,  2 Feb 2016 11:25:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7C90E00838
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 11:25:09 -0800 (PST)
Received: by mail-vk0-f47.google.com with SMTP id n1so104841336vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 02 Feb 2016 11:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iTL7bcDIb8JrQpgvjWDhUGBVurMHGaAI5fABV7Bxrag=;
	b=mvjvIU7Ds0aTFBxfKWppNqbR1BQbvfQ2azxi3SjO8Y89zwZ1YwCTnSY+hWbUdykqfh
	4mVOjD9nCfDJBjTETpwCwc7Bbs+Bf8CO+3RyxGrvwcOLFdcxwxyjVvFresNcezEl6K9/
	WQQ268VovmpiVQjH/MkOhAworeVyOTxcIXfHKkDSYGXKvMEgE9wSJaosZ7KdqzVXMREu
	pM1SCjHzbqXS+DECbA9AshgYdVNkstcMuY4ADhYooXq8jVtBSCNE9BM5Oln5GTaPoeEc
	D5Sldu0FYPtQrU9kcmYDhuzorAp7g/4fhVLA+abye4IidS5WidVPl6qRdgHlGm38hmyF
	LuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=iTL7bcDIb8JrQpgvjWDhUGBVurMHGaAI5fABV7Bxrag=;
	b=bYA7rsVT46kgiiHPm6b4KIKQ8KaMkCOt2gYjdk8hIi6JYSiunvJJ44XVYSC7kpCTHf
	3E3S9p+ZqIpL7TbEYiR2YnplxeGkn+Cz6kpyLS1tuNJYX6bMmY7y/qEkM36+dto3wtvL
	a38qynsihqOm08cKczceDid78LiYWR68KevHd1bNVcVt/DtlYefvMbtSyiw8W8i7nPuT
	KeGiebt5++KUhDP67xH7SoNIvkhj6FgLEgKdwjbacDjauJmOgY2/MuA+U3a6SNkxnk3c
	pZP79C01cv2FPnbVwZQy03le20V7AB6Qff9Yrff5mA4i38gN+0VVXQaNsHJlTJgiPHWl
	KHXg==
X-Gm-Message-State: AG10YOS9Su0AgZz8uIKs9TVyLmugZcmozzHocA1a8orJSaD1DtM5K71KeDuRQEd7pWmS81TpCnc3DqPuGQemSA==
MIME-Version: 1.0
X-Received: by 10.31.10.199 with SMTP id 190mr21558246vkk.51.1454441108951;
	Tue, 02 Feb 2016 11:25:08 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 2 Feb 2016 11:25:08 -0800 (PST)
In-Reply-To: <cccbd7b7fb2291ab6f552c367bdf3577256846ae.1454413132.git.adrian.ratiu@ni.com>
References: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
	<cccbd7b7fb2291ab6f552c367bdf3577256846ae.1454413132.git.adrian.ratiu@ni.com>
Date: Tue, 2 Feb 2016 14:25:08 -0500
Message-ID: <CADkTA4OE0cvvfrP22iCxt8SYqNfUTeWgGeuUqQypF-Uf7B5OgQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 6/6] xterm: remove bbappend
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
X-List-Received-Date: Tue, 02 Feb 2016 19:25:14 -0000
Content-Type: multipart/alternative; boundary=001a11440176a55c62052ace759a

--001a11440176a55c62052ace759a
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 6:40 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> meta-oe has upgraded xterm to 320 which includes a PACKAGECONFIG option
> which adds support for xft fonts. A patch to add freetype-native to the
> PACKAGECONFIG depends has been sent so there is no need to enable it
> unconditionally.
>
> Since this is the only thing in the bbappend, we can remove it entirely.
>


What is the default in meta-oe ? Is the packageconfig enabled by default ?
If it
isn't enabled by default in the packageconfig, and we drop this depends ..
we have
a change in behaviour.

or am I misreading the patch ?

Bruce


>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644
> meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend
>
> diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend
> b/meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend
> deleted file mode 100644
> index bb8c310..0000000
> --- a/meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -DEPENDS += "freetype-native"
> --
> 2.7.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11440176a55c62052ace759a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 2, 2016 at 6:40 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt=
;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">meta-oe has upgr=
aded xterm to 320 which includes a PACKAGECONFIG option<br>
which adds support for xft fonts. A patch to add freetype-native to the<br>
PACKAGECONFIG depends has been sent so there is no need to enable it<br>
unconditionally.<br>
<br>
Since this is the only thing in the bbappend, we can remove it entirely.<br=
></blockquote><div><br><br></div><div>What is the default in meta-oe ? Is t=
he packageconfig enabled by default ? If it<br></div><div>isn&#39;t enabled=
 by default in the packageconfig, and we drop this depends .. we have<br></=
div><div>a change in behaviour.<br><br></div><div>or am I misreading the pa=
tch ?<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-graphics/xorg-app/xterm_303=
.bbappend<br>
<br>
diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend b/=
meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend<br>
deleted file mode 100644<br>
index bb8c310..0000000<br>
--- a/meta-openstack/recipes-graphics/xorg-app/xterm_303.bbappend<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-DEPENDS +=3D &quot;freetype-native&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--001a11440176a55c62052ace759a--
