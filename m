Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4626DE0174E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 18:36:47 -0800 (PST)
Received: by mail-lb0-f169.google.com with SMTP id p9so5189195lbv.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Nov 2013 18:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aIoRt2G3m+6cJ6WteKKMNYhvP3lfGbFR9CPBw6dtRqc=;
	b=0oITyY8ov977D2oK6NFrB6Eu9UOIRn0b/MPiseSvBFhA1TdSIn/A8wM+DrHGY5n6xu
	uwafZkU2nqDRH/EP4czxrOvm4YOocpu1ro57OLsPSHXz8zWg1qhf+EP5rW4VMXOPcKze
	5U9c/QfdUErKN3/PIkd/TZVYa6MBHgdcSsdInkJeRxomV2Letl8vIXYwaGSUw4mljJOq
	dWqmvX1xYkcm4Gv70jM++Y4lw8Nkm5mQuaD6ofCv4ytFVZf+ttXxTRsj+pXq12f6xbQZ
	ZsgCFEgkNqj6fRyegp9e7lD0qr5cnyFxl0KvUH20qIqgQpQGX0WXGK23N/0oCY1D4u+L
	qzjQ==
MIME-Version: 1.0
X-Received: by 10.152.19.66 with SMTP id c2mr496691lae.27.1383705406226; Tue,
	05 Nov 2013 18:36:46 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Tue, 5 Nov 2013 18:36:46 -0800 (PST)
In-Reply-To: <1383704237-3496-1-git-send-email-flihp@twobit.us>
References: <1383704237-3496-1-git-send-email-flihp@twobit.us>
Date: Tue, 5 Nov 2013 21:36:46 -0500
Message-ID: <CABZSBQcqShF0d4AOy3pxi3uc_d=NchGw7LiEYZS5HmgUoSL4Rw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Wed, 06 Nov 2013 02:36:50 -0000
Content-Type: multipart/alternative; boundary=089e01493e4636450204ea7905e6

--089e01493e4636450204ea7905e6
Content-Type: text/plain; charset=ISO-8859-1

FYI - removing libgl as a dependency exposes another hardcoded
dependency/check/path (in this case adding /usr/include/GL to the include
path for qemu-xen-traditional).  Probably won't hit it unless you have the
opengl or libsdl dev bits on your host (as I do).

WARNING: QA Issue: xen: The compile log indicates that host include and/or
library paths were used.
...
  CC    audio/sdlaudio.o
cc1: warning: include location "/usr/include/GL" is unsafe for
cross-compilation [-Wpoison-system-directories]
....



On Tue, Nov 5, 2013 at 9:17 PM, Philip Tricca <flihp@twobit.us> wrote:

> This patch moves the optional SDL dependency to a PACKAGECONFIG
> entry. It also cleans up dependencies on both the virtual libsdl
> and libsdl. The dependency on libgl is also removed. libGL support
> should be enabled with the 'opengl' distro feature instead. The
> dependency on glib-2.0 is now explicit as well.
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen_4.3.0.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/
> xen_4.3.0.bb
> index 09c25aa..283da28 100644
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
> xz-native glib-2.0"
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

--089e01493e4636450204ea7905e6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FYI - removing libgl as a dependency exposes another =
hardcoded dependency/check/path (in this case adding /usr/include/GL to the=
 include path for qemu-xen-traditional).=A0 Probably won&#39;t hit it unles=
s you have the opengl or libsdl dev bits on your host (as I do).<br>
<br>WARNING: QA Issue: xen: The compile log indicates that host include and=
/or library paths were used.<br>...<br>=A0 CC=A0=A0=A0 audio/sdlaudio.o<br>=
cc1: warning: include location &quot;/usr/include/GL&quot; is unsafe for cr=
oss-compilation [-Wpoison-system-directories]<br>
....<br><br></div><div></div></div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">On Tue, Nov 5, 2013 at 9:17 PM, Philip Tricca <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@t=
wobit.us</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch moves the optional SDL dependency=
 to a PACKAGECONFIG<br>
entry. It also cleans up dependencies on both the virtual libsdl<br>
and libsdl. The dependency on libgl is also removed. libGL support<br>
should be enabled with the &#39;opengl&#39; distro feature instead. The<br>
dependency on glib-2.0 is now explicit as well.<br>
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
index 09c25aa..283da28 100644<br>
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
z-native glib-2.0&quot;<br>

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
</font></span></blockquote></div><br></div>

--089e01493e4636450204ea7905e6--
