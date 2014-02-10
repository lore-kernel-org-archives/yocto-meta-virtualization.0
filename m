Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5602E00524
	for <meta-virtualization@yoctoproject.org>;
	Sun,  9 Feb 2014 18:59:12 -0800 (PST)
Received: by mail-lb0-f177.google.com with SMTP id 10so2802846lbg.22
	for <meta-virtualization@yoctoproject.org>;
	Sun, 09 Feb 2014 18:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nqn/cmjGDjjHYkuxkMG6QXq8IdBu3jLvtrmgnh65mY8=;
	b=Ip33lt+n7NoGeYdUhzbqAHnacO3fqStXYnMSid07/qDrkEAc9HH0rF9uFaKWwvs9X0
	c3spl7zFGA53iERRdi97X/oRKDhBr5O/N7fPx2SI42uoIQn0eywzc1xrFAh41MO3tPjS
	VZYVXMCUX66Nm0qal0itgUVB9tOX8mSN/8cxKl6RKU6a80ypBZIF5FtV14Q0CleepPv8
	enwPxch/05HerK8YKKMZgLRFBaO8d+pkI7YyMfPrISNpxGpb+5VXpTlCGbEFjp/f+M99
	NuUxQIHSM9lb6iQj7F0xvFKQxEUU2YrhvoF5bU/Ap8yEJouH9ag5IiiwwjK+qi3mmtxy
	jh8A==
MIME-Version: 1.0
X-Received: by 10.112.173.6 with SMTP id bg6mr18874431lbc.17.1392001150694;
	Sun, 09 Feb 2014 18:59:10 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Sun, 9 Feb 2014 18:59:10 -0800 (PST)
In-Reply-To: <1391996719-14419-2-git-send-email-flihp@twobit.us>
References: <1391996719-14419-1-git-send-email-flihp@twobit.us>
	<1391996719-14419-2-git-send-email-flihp@twobit.us>
Date: Sun, 9 Feb 2014 21:59:10 -0500
Message-ID: <CABZSBQe0p6X805ErdNkFS99Yuu-04vki+h50B5U00tcO4EV9hQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] xen: Replace python-setuptools-native with python-distutils-native to keep pace with upstream.
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
X-List-Received-Date: Mon, 10 Feb 2014 02:59:13 -0000
Content-Type: multipart/alternative; boundary=001a11c239be1d3af404f2048652

--001a11c239be1d3af404f2048652
Content-Type: text/plain; charset=ISO-8859-1

Hey Phil, why does xen need to RDEPENDS python-distutils-native?

Cheers,
-Chris


On Sun, Feb 9, 2014 at 8:45 PM, Philip Tricca <flihp@twobit.us> wrote:

> python-native RPROVIDES python-distutils-native so this changes the
> dependency around a bit.
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index e0d01a5..bd2fc74 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -17,10 +17,10 @@ PACKAGECONFIG ??= " \
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] =
> "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>
> -DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl
> bison-native flex-native gettext dev86-native iasl-native pciutils
> bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz
> xz-native glib-2.0"
> +DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl
> bison-native flex-native gettext dev86-native iasl-native pciutils
> bridge-utils iproute2 procps yajl pixman python xz xz-native glib-2.0"
>
>  # inherit setuptools adds python to RDEPENDS, override it
> -RDEPENDS_${PN} = ""
> +RDEPENDS_${PN} = "python-distutils-native"
>
>  RDEPENDS_${PN}-base = "\
>      libgcc udev bash perl xz \
> --
> 1.7.10.4
>
>

--001a11c239be1d3af404f2048652
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Phil, why does xen need to RDEPENDS python-distutils-n=
ative?<div><br></div><div>Cheers,<br></div><div>-Chris</div></div><div clas=
s=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sun, Feb 9, 2014 at=
 8:45 PM, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D"mailto:flihp@twobi=
t.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">python-native RPROVIDES python-distutils-nat=
ive so this changes the<br>
dependency around a bit.<br>
<br>
Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@t=
wobit.us</a>&gt;<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index e0d01a5..bd2fc74 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -17,10 +17,10 @@ PACKAGECONFIG ??=3D &quot; \<br>
=A0PACKAGECONFIG[sdl] =3D &quot;--enable-sdl,--disable-sdl,virtual/libsdl,&=
quot;<br>
=A0PACKAGECONFIG[xsm] =3D &quot;--enable-xsmpolicy,--disable-xsmpolicy,chec=
kpolicy-native,&quot;<br>
<br>
-DEPENDS =3D &quot;util-linux util-linux-native file-native zlib ncurses op=
enssl bison-native flex-native gettext dev86-native iasl-native pciutils br=
idge-utils iproute2 procps yajl pixman python python-setuptools-native xz x=
z-native glib-2.0&quot;<br>

+DEPENDS =3D &quot;util-linux util-linux-native file-native zlib ncurses op=
enssl bison-native flex-native gettext dev86-native iasl-native pciutils br=
idge-utils iproute2 procps yajl pixman python xz xz-native glib-2.0&quot;<b=
r>

<br>
=A0# inherit setuptools adds python to RDEPENDS, override it<br>
-RDEPENDS_${PN} =3D &quot;&quot;<br>
+RDEPENDS_${PN} =3D &quot;python-distutils-native&quot;<br>
<br>
=A0RDEPENDS_${PN}-base =3D &quot;\<br>
=A0 =A0 =A0libgcc udev bash perl xz \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c239be1d3af404f2048652--
