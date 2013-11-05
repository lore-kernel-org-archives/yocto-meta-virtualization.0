Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90F8AE0174E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Nov 2013 19:17:11 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id ea20so727717lab.14
	for <meta-virtualization@yoctoproject.org>;
	Mon, 04 Nov 2013 19:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KaBMwDK4TqbX78uJdCy9cV4ym2pbOxDYnbKg3dycevs=;
	b=iE09LQLwiqqDjFmhEFN64t0ZZiS7GC3NFPt77aASywthXglYB3lOIRFrWDP5SL/Bl1
	EegLeG4Zkf/pVb7G+PftYgYBSotd+U0zuGadA6zlaz06vQ/vnbbTGneNxl9NAnpIc9ib
	auokrBGwcoRkbA1Sx1/5b/ga/hz0YRUK8Qgb6fc7k+AcXYiQtuaI6vxxBwHoOYnbgOWl
	LrsehJzfp6tDThulio7OfR5og9DvvYLQzjpVAMxmaldnKgqq2yfMRmlUuGoH45L4YiiZ
	iCVSgS/ezhtExQzDEa2G2tQk62mbSUZDXJIzcZlxASFqqj5Yl3qDUJD72Nzs5gW39SLH
	3L8w==
MIME-Version: 1.0
X-Received: by 10.152.170.133 with SMTP id am5mr14537485lac.9.1383621429816;
	Mon, 04 Nov 2013 19:17:09 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Mon, 4 Nov 2013 19:17:09 -0800 (PST)
In-Reply-To: <1383495029-26728-1-git-send-email-flihp@twobit.us>
References: <1383495029-26728-1-git-send-email-flihp@twobit.us>
Date: Mon, 4 Nov 2013 22:17:09 -0500
Message-ID: <CABZSBQfVAtZkacVcUVfxbu8CN7R605eSzn_dJ1TOkSHQ3eETUg@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Tue, 05 Nov 2013 03:17:16 -0000
Content-Type: multipart/alternative; boundary=089e0117720fd3f21804ea65775d

--089e0117720fd3f21804ea65775d
Content-Type: text/plain; charset=ISO-8859-1

Hey Phil,

I would think that libsdl should be included as a runtime dependency if
enabled...?  Though looking through recipes, it would appear that many
PACKAGECONFIG users ignore the runtime dependencies (presumably assuming
that the image will include them if the functionality is desired - or
perhaps specifying only when the dependency is strictly required as a
result?).

Cheers,
-Chris


On Sun, Nov 3, 2013 at 11:10 AM, Philip Tricca <flihp@twobit.us> wrote:

> This patch moves the optional SDL dependency to a PACKAGECONFIG
> entry. It also cleans up dependencies on both the virtual libsdl
> and libsdl. The dependency on libgl is also removed. libGL support
> should be enabled with the 'opengl' distro feature instead.
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen_4.3.0.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/
> xen_4.3.0.bb
> index 09c25aa..1fad48d 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.0.bb
> @@ -21,17 +21,19 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
>  inherit autotools gettext setuptools update-rc.d
>
>  PACKAGECONFIG ??= " \
> +    sdl \
>      xsm \
>  "
> +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] =
> "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>
> -DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl
> bison-native flex-native gettext dev86-native iasl-native pciutils
> virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman
> python python-setuptools-native xz xz-native libsdl"
> +DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl
> bison-native flex-native gettext dev86-native iasl-native pciutils
> bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz
> xz-native"
>
>  # inherit setuptools adds python to RDEPENDS, override it
>  RDEPENDS_${PN} = ""
>
>  RDEPENDS_${PN}-base = "\
> -    libgcc libsdl udev bash perl xz \
> +    libgcc udev bash perl xz \
>      ${PN}-blktap \
>      ${PN}-console \
>      ${PN}-libblktapctl \
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--089e0117720fd3f21804ea65775d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hey Phil,<br><br>I would think that libsdl shoul=
d be included as a runtime dependency if enabled...?=A0 Though looking thro=
ugh recipes, it would appear that many PACKAGECONFIG users ignore the runti=
me dependencies (presumably assuming that the image will include them if th=
e functionality is desired - or perhaps specifying only when the dependency=
 is strictly required as a result?).<br>
<br></div>Cheers,<br></div>
-Chris<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sun,=
 Nov 3, 2013 at 11:10 AM, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch moves the optional SDL dependency=
 to a PACKAGECONFIG<br>
entry. It also cleans up dependencies on both the virtual libsdl<br>
and libsdl. The dependency on libgl is also removed. libGL support<br>
should be enabled with the &#39;opengl&#39; distro feature instead.<br>
<br>
Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@t=
wobit.us</a>&gt;<br>
---<br>
=A0recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_blank">x=
en_4.3.0.bb</a> | =A0 =A06 ++++--<br>
=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D=
"_blank">xen_4.3.0.bb</a> b/recipes-extended/xen/<a href=3D"http://xen_4.3.=
0.bb" target=3D"_blank">xen_4.3.0.bb</a><br>
index 09c25aa..1fad48d 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_blank=
">xen_4.3.0.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_blank=
">xen_4.3.0.bb</a><br>
@@ -21,17 +21,19 @@ COMPATIBLE_HOST =3D &#39;(x86_64.*).*-linux&#39;<br>
=A0inherit autotools gettext setuptools update-rc.d<br>
<br>
=A0PACKAGECONFIG ??=3D &quot; \<br>
+ =A0 =A0sdl \<br>
=A0 =A0 =A0xsm \<br>
=A0&quot;<br>
+PACKAGECONFIG[sdl] =3D &quot;--enable-sdl,--disable-sdl,virtual/libsdl,&qu=
ot;<br>
=A0PACKAGECONFIG[xsm] =3D &quot;--enable-xsmpolicy,--disable-xsmpolicy,chec=
kpolicy-native,&quot;<br>
<br>
-DEPENDS =3D &quot;util-linux util-linux-native file-native zlib ncurses op=
enssl bison-native flex-native gettext dev86-native iasl-native pciutils vi=
rtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python =
python-setuptools-native xz xz-native libsdl&quot;<br>

+DEPENDS =3D &quot;util-linux util-linux-native file-native zlib ncurses op=
enssl bison-native flex-native gettext dev86-native iasl-native pciutils br=
idge-utils iproute2 procps yajl pixman python python-setuptools-native xz x=
z-native&quot;<br>

<br>
=A0# inherit setuptools adds python to RDEPENDS, override it<br>
=A0RDEPENDS_${PN} =3D &quot;&quot;<br>
<br>
=A0RDEPENDS_${PN}-base =3D &quot;\<br>
- =A0 =A0libgcc libsdl udev bash perl xz \<br>
+ =A0 =A0libgcc udev bash perl xz \<br>
=A0 =A0 =A0${PN}-blktap \<br>
=A0 =A0 =A0${PN}-console \<br>
=A0 =A0 =A0${PN}-libblktapctl \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br></div></div>

--089e0117720fd3f21804ea65775d--
