Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07505E00DC3; Thu, 22 Sep 2016 07:04:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1B2CE006E9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Sep 2016 07:04:42 -0700 (PDT)
Received: by mail-qk0-f169.google.com with SMTP id n185so76864550qke.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Sep 2016 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AwAM3bArkFanAlKBSgQ5GXnbnqZ86/srb6QCd1a8Gac=;
	b=H7GjTMWysIZFN1pNY6b+WC3m8pLdAzNiK4Abwo7k0S5vXmaHSM+58pucLgZrwsYLjO
	TOyhw3Tc1mT7q+Gk41MfdWs2EJdkmGm8ZJ2XyJmAfnRFuqb5qHzFUQuF7CD/KdtTQQGN
	3r1o/3NovI0DSVeUiZo8E3gs54Wq9Ba1VLES07RZ4eVYpsPUbdKNL7hdUwLC1ByNcN5e
	SPvdk1zv9kQCbl4vhO/dwKmOSZ1gt9SnRSSZR1r27keoR9F69zJBZeE9kpoBA6o1MBFX
	V4viy0zfiWz5jkGLFbEeiWYYt3FteWA9RkuUhh2xAJ3ziIzDe954JjZJQUODszLhiLAO
	lx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AwAM3bArkFanAlKBSgQ5GXnbnqZ86/srb6QCd1a8Gac=;
	b=VV1hwhp2ezYw+0tfTsJJDokCRqmy0+lwUx1TzjateyWdC6adfCcBAMo6bFXSS2JVoa
	C/Kaz48Ii4VhIGUBVj/9zEVH2eH3Zd50PJkgn4B5r6ZOeTgb3gMydMqo3X4MRw4g3tXf
	qbH/tjtTyEUkP+NQeWEyaP48c4JWEzflgwBm8s3G9P9ujy0+UWQTlP5lL6oCePk/3MSE
	0cx/4aSfbPmL3GmYXAHg/qk7l2NDZcv7qhBO1n/4xQzeTBajStMztV27faSZ8uweFai9
	ht9o5+QPK/hBh6+1D9hoODMfJpt9IqNbB57i1/gucmDiVvlid8V290mwEfLtG8GNi2nG
	/GyQ==
X-Gm-Message-State: AA6/9RnMQoq9Bco8RFkCAoIh+nWfXq2qQF3OcrUXr0SGS9ixOc5SMhxOhOkW2NpOpBkB7EhSnsU3hwmdTZoSyw==
X-Received: by 10.55.58.65 with SMTP id h62mr1589842qka.85.1474553081686; Thu,
	22 Sep 2016 07:04:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Thu, 22 Sep 2016 07:04:41 -0700 (PDT)
In-Reply-To: <1474378496-24714-1-git-send-email-adrian.dudau@enea.com>
References: <1474378496-24714-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Sep 2016 10:04:41 -0400
Message-ID: <CADkTA4OyHeXHEu7i2CMpuChR2q2Zn6zSBxxe3-yn=mg0S-SRTw@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] multipath-tools: Drop recipe
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
X-List-Received-Date: Thu, 22 Sep 2016 14:04:47 -0000
Content-Type: multipart/alternative; boundary=001a114a14d8a2f53f053d1924fb

--001a114a14d8a2f53f053d1924fb
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 20, 2016 at 9:34 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:

> A newer version of the recipe is maintained in meta-openembedded/meta-oe.
> No reason to keep an older version here.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  .../multipath-tools/multipath-tools_git.bb         | 46
> ----------------------
>  1 file changed, 46 deletions(-)
>  delete mode 100644 recipes-extended/multipath-tools/
> multipath-tools_git.bb
>
> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb
> b/recipes-extended/multipath-tools/multipath-tools_git.bb
> deleted file mode 100644
> index 9ba5cd6..0000000
> --- a/recipes-extended/multipath-tools/multipath-tools_git.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -SUMMARY = "Tools to Manage Multipathed Devices with the device-mapper"
> -DESCRIPTION = "This package provides the tools to manage multipathed
> devices by \
> -instructing the device-mapper multipath module what to do"
> -
> -HOMEPAGE = "http://christophe.varoqui.free.fr/"
> -DEPENDS = "readline libaio lvm2 udev"
> -LICENSE = "GPLv2"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
> -S="${WORKDIR}/git"
> -
> -
> -SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
> -
> -SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
> -PV = "0.4.9+gitr${SRCPV}"
> -
> -inherit autotools-brokensep
> -
> -EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
> -
> -PACKAGES =+ "libmpathpersist mpathpersist kpartx libmultipath multipath
> multipathd libmultipath-dev libmpathpersist-dev"
> -
> -
> -RDEPENDS_${PN} += "libmpathpersist mpathpersist kpartx libmultipath
> multipath multipathd udev"
> -
> -do_install_append () {
> -       ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
> -       ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
> -}
> -
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN}     = ""
> -
> -FILES_libmpathpersist = "${libdir}/libmpathpersist*.so.0"
> -FILES_mpathpersist = "${sbindir}/mpathpersist"
> -FILES_kpartx = "${sbindir}/kpartx ${base_libdir}/udev/"
> -FILES_libmultipath = "${libdir}/libcheck*.so ${libdir}/libpri*.so
> ${libdir}/libmultipath*.so.0"
> -FILES_multipath = "${sbindir}/multipath ${sysconfdir}"
> -FILES_multipathd = "${sbindir}/multipathd ${base_libdir}"
> -
> -#put the symbol link lib in -dev
> -FILES_libmultipath-dev = "${libdir}/libmultipath*.so"
> -FILES_libmpathpersist-dev = "${libdir}/libmpathpersist*.so"
> -
> -
> --
> 1.9.1
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

--001a114a14d8a2f53f053d1924fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Tue, Sep 20, 2016 at 9:34 AM, A=
drian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.com" =
target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">A newer version of the recipe is maintained in meta-op=
enembedded/meta-oe.<br>
No reason to keep an older version here.<br>
<br>
Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com">ad=
rian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0.../multipath-tools/<a href=3D"http://multipath-tools_git.bb" rel=3D"=
noreferrer" target=3D"_blank">multipath-<wbr>tools_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 46 ----------------------<br>
=C2=A01 file changed, 46 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/multipath-<wbr>tools/<a href=3D"h=
ttp://multipath-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">multipat=
h-tools_git.bb</a><br>
<br>
diff --git a/recipes-extended/multipath-<wbr>tools/<a href=3D"http://multip=
ath-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_git.=
bb</a> b/recipes-extended/multipath-<wbr>tools/<a href=3D"http://multipath-=
tools_git.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_git.bb</=
a><br>
deleted file mode 100644<br>
index 9ba5cd6..0000000<br>
--- a/recipes-extended/multipath-<wbr>tools/<a href=3D"http://multipath-too=
ls_git.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_git.bb</a><=
br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-SUMMARY =3D &quot;Tools to Manage Multipathed Devices with the device-mapp=
er&quot;<br>
-DESCRIPTION =3D &quot;This package provides the tools to manage multipathe=
d devices by \<br>
-instructing the device-mapper multipath module what to do&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://christophe.varoqui.free.fr/" rel=3D"n=
oreferrer" target=3D"_blank">http://christophe.varoqui.<wbr>free.fr/</a>&qu=
ot;<br>
-DEPENDS =3D &quot;readline libaio lvm2 udev&quot;<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>7be2873b6270e45abacc5=
03abbe2aa<wbr>3d&quot;<br>
-S=3D&quot;${WORKDIR}/git&quot;<br>
-<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.opensvc.com/multipath-tools/=
.git;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">git.opensvc.com/=
<wbr>multipath-tools/.git;protocol=3D<wbr>http</a>&quot;<br>
-<br>
-SRCREV =3D &quot;<wbr>d3683ab18b386e9b3b54b59a122c68<wbr>9e9ebdf5cf&quot;<=
br>
-PV =3D &quot;0.4.9+gitr${SRCPV}&quot;<br>
-<br>
-inherit autotools-brokensep<br>
-<br>
-EXTRA_OEMAKE=3D&quot;LIB=3D${libdir} exec_prefix=3D${exec_prefix} libdir=
=3D${libdir}&quot;<br>
-<br>
-PACKAGES =3D+ &quot;libmpathpersist mpathpersist kpartx libmultipath multi=
path multipathd libmultipath-dev libmpathpersist-dev&quot;<br>
-<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;libmpathpersist mpathpersist kpartx libmultipath=
 multipath multipathd udev&quot;<br>
-<br>
-do_install_append () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf libmpathpersist.so.0 ${D}${libdir}/libmp=
athpersist.<wbr>so<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf libmultipath.so.0 ${D}${libdir}/libmulti=
path.so<br>
-}<br>
-<br>
-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-FILES_${PN}=C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
-<br>
-FILES_libmpathpersist =3D &quot;${libdir}/libmpathpersist*.<wbr>so.0&quot;=
<br>
-FILES_mpathpersist =3D &quot;${sbindir}/mpathpersist&quot;<br>
-FILES_kpartx =3D &quot;${sbindir}/kpartx ${base_libdir}/udev/&quot;<br>
-FILES_libmultipath =3D &quot;${libdir}/libcheck*.so ${libdir}/libpri*.so $=
{libdir}/libmultipath*.so.0&quot;<br>
-FILES_multipath =3D &quot;${sbindir}/multipath ${sysconfdir}&quot;<br>
-FILES_multipathd =3D &quot;${sbindir}/multipathd ${base_libdir}&quot;<br>
-<br>
-#put the symbol link lib in -dev<br>
-FILES_libmultipath-dev =3D &quot;${libdir}/libmultipath*.so&quot;<br>
-FILES_libmpathpersist-dev =3D &quot;${libdir}/libmpathpersist*.<wbr>so&quo=
t;<br>
-<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a114a14d8a2f53f053d1924fb--
