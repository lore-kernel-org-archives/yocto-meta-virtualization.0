Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D109DE0078F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 17:28:33 -0800 (PST)
Received: by mail-la0-f52.google.com with SMTP id c6so5459863lan.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 17:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ia3x1ehUWBOgV5i0gsurKeTfxBXGCQgD5qstADRwF1M=;
	b=XmwRGrE6IPSq/PScusZgMSCgfFiBRaGNzBDy3WgTMRRAd+7X5Ornm+CxSjKzRzh2pr
	qJ9vkna6thgxbU3nKQZZ/y1ZK3SY0BFj19soGXkUs4Ym4X0n8X51wArb8NkdE0tOr3pp
	Wv747BQDZO2BuSJjQ4M/xH87fgt+RfunUDKpxiWYtScJ1V03tNC/hFIyPbKb+9X4c4nW
	0+W/wQerP1D3VUapj2Cy1nG2O3PkbLH5xhauuTmEEHKr4uwzqTgaLsaXKZ7xGKQ4Xg08
	hWoP6TYlFVwwea3l0BnQ9p/NJSlG/9q66tsLTGTGt5jCAkQ2IOe9GP9/0rwJJpu0UHc/
	i9Gw==
MIME-Version: 1.0
X-Received: by 10.112.204.104 with SMTP id kx8mr22967610lbc.12.1392082111710; 
	Mon, 10 Feb 2014 17:28:31 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Mon, 10 Feb 2014 17:28:31 -0800 (PST)
In-Reply-To: <1392050160-12297-1-git-send-email-flihp@twobit.us>
References: <CABZSBQe0p6X805ErdNkFS99Yuu-04vki+h50B5U00tcO4EV9hQ@mail.gmail.com>
	<1392050160-12297-1-git-send-email-flihp@twobit.us>
Date: Mon, 10 Feb 2014 20:28:31 -0500
Message-ID: <CABZSBQdi7nw7g4mwHV+pxv23ynLVtkT4vhzp25RgqiLT+kN4ag@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: Replace python-setuptools-native dependency with python-distribute-native.
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
X-List-Received-Date: Tue, 11 Feb 2014 01:28:36 -0000
Content-Type: multipart/alternative; boundary=001a11c3c7f0c44ba504f2175f7b

--001a11c3c7f0c44ba504f2175f7b
Content-Type: text/plain; charset=ISO-8859-1

I believe the 'inherit setuptools' already adds the required
python-distribute-native depends there, so it shouldn't need to added :)


On Mon, Feb 10, 2014 at 11:36 AM, Philip Tricca <flihp@twobit.us> wrote:

> oe-core fixed some overlap between the python-setuptools and
> python-distribute recently. See:
>
> http://patchwork.openembedded.org/patch/66085/.
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index e0d01a5..d671d0f 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -17,7 +17,7 @@ PACKAGECONFIG ??= " \
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
> bridge-utils iproute2 procps yajl pixman python python-distribute-native xz
> xz-native glib-2.0"
>
>  # inherit setuptools adds python to RDEPENDS, override it
>  RDEPENDS_${PN} = ""
> --
> 1.7.10.4
>
>

--001a11c3c7f0c44ba504f2175f7b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I believe the &#39;inherit setuptools&#39; already adds th=
e required=A0<span style=3D"font-family:arial,sans-serif;font-size:13px">py=
thon-distribute-native=A0</span>depends there, so it shouldn&#39;t need to =
added :)</div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Feb 1=
0, 2014 at 11:36 AM, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D"mailto:=
flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
oe-core fixed some overlap between the python-setuptools and<br>
python-distribute recently. See:<br>
<br>
<a href=3D"http://patchwork.openembedded.org/patch/66085/" target=3D"_blank=
">http://patchwork.openembedded.org/patch/66085/</a>.<br>
<br>
Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@t=
wobit.us</a>&gt;<br>
---<br>
=A0recipes-extended/xen/xen.inc | =A0 =A02 +-<br>
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index e0d01a5..d671d0f 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -17,7 +17,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
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
idge-utils iproute2 procps yajl pixman python python-distribute-native xz x=
z-native glib-2.0&quot;<br>

<br>
=A0# inherit setuptools adds python to RDEPENDS, override it<br>
=A0RDEPENDS_${PN} =3D &quot;&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c3c7f0c44ba504f2175f7b--
