Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 371D9E00DE5; Sun, 31 Jul 2016 19:54:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D44EE00CAB
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jul 2016 19:54:50 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id s186so4972605qkb.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jul 2016 19:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qhzTe/o68yH53nq/soy2/4hcvOrLVBd/NkDBnwV002o=;
	b=uhJGJ8QExDgrxV/Wexf2eBUyA5Ka5b6Fn1TPL4ee8HYIom5/9W1IF8bqFHNZ/i+qB0
	ctDmrTjftu8VjBiyuhcd0XsBYjyk8hPm36O6NFjm2ETVC6oWwjCMvdlKN4o8U5s/Fw6Z
	NH7z0HnUfWx6X3MBRf4/hDP1nMMc/Fze6LrpIUau/Agu+FIDry6y2iTRZKcBnikJcBvU
	d9jgZEEsNyJkVsTZ9BpI8Fy1sTICBiwHhPyhHnU95cDm1fxJ2vduQeeUMF/e6hto9eX9
	2szjlLcBVD8VhLwfMyYM/BfKLXcC5j8pyhsIMjMLI3XBtisUUjTMGTPN+DtN6MxdOHOU
	PAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qhzTe/o68yH53nq/soy2/4hcvOrLVBd/NkDBnwV002o=;
	b=UHLE/UDN59mlXRsjIsWEye4r3viI664h3/yW+cDY+bCOMUd3IRrXl09UbdaofbbBOb
	lcaqOX1cIzTJIaEmd+r4Mmag1Hh6cFC3u714hGengptiDxmJ2BUp1IvJfJNSGQhxPIqx
	ypM7dcbrWz9dVM4aEBat+d9Bjt7pBSv02grSg5x3dsxqlzOJO/TwuFIl3RLOv+hi5EVd
	Wrqs3IJkg3+SwrhxicvOtvALsgGnxqobhjEz5KCCmmX5zcS0uGY3NP3nLFPiYo5SMa31
	lpQQ4QgE707Ia4Z8kb/crd9Gt9icCf1iMHTq22dijzR96HZXGe6cyfK70bUsjg6oLRZk
	t0aw==
X-Gm-Message-State: AEkoouvG1Q6tTmLzPLkmaC98tGf/8qSXhKFhCDfyXSfnJP4CASVlBsPatSUL2/vDBRlA83kK/mltTJyX9upPrA==
X-Received: by 10.55.25.102 with SMTP id k99mr20530427qkh.119.1470020089595;
	Sun, 31 Jul 2016 19:54:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Sun, 31 Jul 2016 19:54:49 -0700 (PDT)
In-Reply-To: <1469615556-26188-1-git-send-email-catalin.enache@windriver.com>
References: <1469615556-26188-1-git-send-email-catalin.enache@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 31 Jul 2016 22:54:49 -0400
Message-ID: <CADkTA4NXdZROaf6fFL4M3XV0oJT3M+Cx8B44qAGXu13HvVUMLg@mail.gmail.com>
To: Catalin Enache <catalin.enache@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: add missing configuration file
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
X-List-Received-Date: Mon, 01 Aug 2016 02:54:52 -0000
Content-Type: multipart/alternative; boundary=001a11473a4840cd2d0538f9b963

--001a11473a4840cd2d0538f9b963
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Jul 27, 2016 at 6:32 AM, Catalin Enache <
catalin.enache@windriver.com> wrote:

> openvzutilstest.conf file is needed by openvzutilstest test
>
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  .../libvirt/libvirt/install-missing-file.patch     | 44
> ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.3.2.bb          |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644
> recipes-extended/libvirt/libvirt/install-missing-file.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch
> b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> new file mode 100644
> index 0000000..f6f6e25
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> @@ -0,0 +1,44 @@
> +From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001
> +From: Catalin Enache <catalin.enache@windriver.com>
> +Date: Mon, 25 Jul 2016 16:38:51 +0300
> +Subject: [PATCH] Install missing conf file
> +
> +openvzutilstest.conf file is needed by openvzutilstest test.
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + tests/Makefile.am | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 02e0dd8..187fbca 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -155,6 +155,7 @@ EXTRA_DIST =               \
> +       xml2vmxdata
> +
> + test_helpers = commandhelper ssh test_conf
> ++test_misc =
> + test_programs = virshtest sockettest \
> +       nodeinfotest virbuftest \
> +       commandtest seclabeltest \
> +@@ -259,6 +260,7 @@ endif WITH_LXC
> +
> + if WITH_OPENVZ
> + test_programs += openvzutilstest
> ++test_misc += openvzutilstest.conf
> + endif WITH_OPENVZ
> +
> + if WITH_ESX
> +@@ -1293,7 +1295,7 @@ endif ! WITH_CIL
> +
> + buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
> +
> +-PTESTS = $(TESTS) $(test_helpers) test-lib.sh schematestutils.sh
> ++PTESTS = $(TESTS) $(test_helpers) $(test_misc) test-lib.sh
> schematestutils.sh
> +
> + install-ptest:
> +       list='$(TESTS) $(test_helpers) test-lib.sh schematestutils.sh'
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.3.2.bb
> b/recipes-extended/libvirt/libvirt_1.3.2.bb
> index 42066c1..0da768e 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.2.bb
> @@ -33,6 +33,7 @@ SRC_URI = "
> http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://libvirt-use-pkg-config-to-locate-libcap.patch \
>             file://0001-to-fix-build-error.patch \
>             file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
> +           file://install-missing-file.patch \
>            "
>
>  SRC_URI[libvirt.md5sum] = "b48b06bbc7efbe9973ed0f3f223d6da2"
> --
> 2.7.4
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

--001a11473a4840cd2d0538f9b963
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jul 27, 2016 at 6:32 AM=
, Catalin Enache <span dir=3D"ltr">&lt;<a href=3D"mailto:catalin.enache@win=
driver.com" target=3D"_blank">catalin.enache@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">openvzutilstest.conf file is needed=
 by openvzutilstest test<br>
<br>
Signed-off-by: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windrive=
r.com">catalin.enache@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libvirt/libvirt/install-missing-file.patch=C2=A0 =C2=A0 =C2=A0| 4=
4 ++++++++++++++++++++++<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 45 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/libvirt/install-missing-f=
ile.patch<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/=
recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
new file mode 100644<br>
index 0000000..f6f6e25<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
@@ -0,0 +1,44 @@<br>
+From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001<br>
+From: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windriver.com">c=
atalin.enache@windriver.com</a>&gt;<br>
+Date: Mon, 25 Jul 2016 16:38:51 +0300<br>
+Subject: [PATCH] Install missing conf file<br>
+<br>
+openvzutilstest.conf file is needed by openvzutilstest test.<br>
+<br>
+Signed-off-by: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windriv=
er.com">catalin.enache@windriver.com</a>&gt;<br>
+---<br>
+ tests/Makefile.am | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
+index 02e0dd8..187fbca 100644<br>
+--- a/tests/Makefile.am<br>
++++ b/tests/Makefile.am<br>
+@@ -155,6 +155,7 @@ EXTRA_DIST =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xml2vmxdata<br>
+<br>
+ test_helpers =3D commandhelper ssh test_conf<br>
++test_misc =3D<br>
+ test_programs =3D virshtest sockettest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nodeinfotest virbuftest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0commandtest seclabeltest \<br>
+@@ -259,6 +260,7 @@ endif WITH_LXC<br>
+<br>
+ if WITH_OPENVZ<br>
+ test_programs +=3D openvzutilstest<br>
++test_misc +=3D openvzutilstest.conf<br>
+ endif WITH_OPENVZ<br>
+<br>
+ if WITH_ESX<br>
+@@ -1293,7 +1295,7 @@ endif ! WITH_CIL<br>
+<br>
+ buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)<br>
+<br>
+-PTESTS =3D $(TESTS) $(test_helpers) test-lib.sh schematestutils.sh<br>
++PTESTS =3D $(TESTS) $(test_helpers) $(test_misc) test-lib.sh schematestut=
ils.sh<br>
+<br>
+ install-ptest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list=3D&#39;$(TESTS) $(test_helpers) test-lib.s=
h schematestutils.sh&#39;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_1.3.2.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_1.3.2.bb</a><br>
index 42066c1..0da768e 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a><br>
@@ -33,6 +33,7 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-${PV}.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">ht=
tp://libvirt.org/sources/libvirt-${PV}.tar.gz;name=3Dlibvirt</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libvirt-use-pkg-config-to-=
locate-libcap.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-to-fix-build-error.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Revert-build-add-prefix-to=
-SYSTEMD_UNIT_DIR.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://install-missing-file.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libvirt.md5sum] =3D &quot;b48b06bbc7efbe9973ed0f3f223d6da2&qu=
ot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a11473a4840cd2d0538f9b963--
