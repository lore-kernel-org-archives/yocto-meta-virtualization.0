Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B268E00EF9; Tue,  6 Sep 2016 06:36:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	*  2.4 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66C63E00DB1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Sep 2016 06:36:27 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id 11so4480059qtc.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Sep 2016 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HKfdjC7toF2W/qf58cgghl28+xrv9/6Se7a2VVk9hEM=;
	b=ywDVo+t22/GYKpFs72uDdPBiTaX9ASCOKp8raCoOXg8DoWXY0+U01SaRb40fAixwG3
	rh0adGnBglzARKNKHn7mCaJnQ8iiONRN3uBCvjEeUpb0qyfVUNm/5C5EVOU14DCpn2vr
	ubosNZsxawIbPWjhI5LwxloYgkfHszyU3JEuTj+xkd2RUAC9+qzYZuZFukGPTryFYCtN
	M46jB5lDxZdoJ+ct82dtoWsPrsXXOoJ531QWX+UFBHhIiinaukaczqYj6lLrD4sb/a51
	AcDI2MQdyfUGlSgXd3gVK7FcMFlMs9KGWEu0CLXFRk3HoLJjxKsSxJMGCwsQNgIBSbTa
	dC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HKfdjC7toF2W/qf58cgghl28+xrv9/6Se7a2VVk9hEM=;
	b=YDs9ppnWEEoSGPH7l1TH6kHkDV4pxNj5xVVHcnJA7SYmOmJS1dEW3n5GvUISSKwy1Q
	cg30ZGQ+lHBT22iNJs0A06+kWDbB+X2TFhvSUhu2T6dSHORlKBG6hJU6m4A721TFNI6G
	oDQkvoqT+P6EmK05NXthTLb+Oq1hj9tT2CBpJB9/8r5uAoOLi73hZKra3D0NhWmHuIYj
	ODPq75MECi2RQiGQgQ3kL5ZYOeGacrZ7QD1XiflhXpmxJqopcjj5oGAvAN5zU89q0f/F
	pxILntYD5kOOVbTrl4OImVf+Tte2GCKuU4ZQtgXa1gxgc3jo/AyZ2nOKmorh1R3nsnhb
	iXKg==
X-Gm-Message-State: AE9vXwM1tpkzfYI4s40PW0qQUPygQgx0MWNYOvlcUe/pVCv09mdNRx6z9yOUTR3fHBO6voMdwueGkRSSfOhd5A==
X-Received: by 10.237.36.34 with SMTP id r31mr11527604qtc.104.1473168986159;
	Tue, 06 Sep 2016 06:36:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Tue, 6 Sep 2016 06:36:25 -0700 (PDT)
In-Reply-To: <1473058369-7710-1-git-send-email-zhe.he@windriver.com>
References: <1473058369-7710-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Sep 2016 09:36:25 -0400
Message-ID: <CADkTA4M4BaNVkFYpRg4h3itMHhnWhN9kRgQZFVBd6tih+Y18mg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Add missing test helpers and remove windows 1252
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
X-List-Received-Date: Tue, 06 Sep 2016 13:36:47 -0000
Content-Type: multipart/alternative; boundary=001a113d40d41d4bc8053bd6e2d8

--001a113d40d41d4bc8053bd6e2d8
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Sep 5, 2016 at 2:52 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Add missing test helpers
> We don't support windows encoding so remove that case
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...move-Windows-1252-check-from-esxutilstest.patch | 28
> +++++++++++++++++++++
>  .../0001-ptest-add-missing-test_helper-files.patch | 29
> ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.3.5.bb          |  2 ++
>  3 files changed, 59 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-ptest-Remove-
> Windows-1252-check-from-esxutilstest.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-ptest-add-
> missing-test_helper-files.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/0001-ptest-Remove-
> Windows-1252-check-from-esxutilstest.patch b/recipes-extended/libvirt/
> libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> new file mode 100644
> index 0000000..217bdbc
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-ptest-Remove-
> Windows-1252-check-from-esxutilstest.patch
> @@ -0,0 +1,28 @@
> +From ffc71da15c3da068f85d16617b6e0c0175fc0110 Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Tue, 23 Aug 2016 02:28:47 -0400
> +Subject: [PATCH] ptest: Remove Windows-1252 check from esxutilstest
> +
> +Currently we use iconv from glibc-locale and it does not support
> +Windows-1252 and we don't need support windows character encoding.
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + tests/esxutilstest.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/tests/esxutilstest.c b/tests/esxutilstest.c
> +index 44bdc84..3223de3 100644
> +--- a/tests/esxutilstest.c
> ++++ b/tests/esxutilstest.c
> +@@ -258,7 +258,6 @@ mymain(void)
> +     DO_TEST(ParseDatastorePath);
> +     DO_TEST(ConvertDateTimeToCalendarTime);
> +     DO_TEST(EscapeDatastoreItem);
> +-    DO_TEST(ConvertWindows1252ToUTF8);
> +
> +     return result == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
> + }
> +--
> +2.8.1
> +
> diff --git a/recipes-extended/libvirt/libvirt/0001-ptest-add-
> missing-test_helper-files.patch b/recipes-extended/libvirt/
> libvirt/0001-ptest-add-missing-test_helper-files.patch
> new file mode 100644
> index 0000000..b4f1e27
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-ptest-add-
> missing-test_helper-files.patch
> @@ -0,0 +1,29 @@
> +From e625a42caca492fe7d52b70bbbf83ae4d99cb15e Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Tue, 23 Aug 2016 02:16:20 -0400
> +Subject: [PATCH] ptest: add missing test_helper files
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + tests/Makefile.am | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 1c85656..2f8b9eb 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -1422,8 +1422,10 @@ install-ptest:
> +       @(for file in $(PTESTS); do \
> +               if [ -f .libs/$$file ]; then \
> +                       install .libs/$$file $(DEST_DIR)/tests; \
> +-              else \
> ++              elif [ -f $(srcdir)/$$file ]; then \
> +                       install $(srcdir)/$$file $(DEST_DIR)/tests; \
> ++              else \
> ++                      install $(builddir)/$$file $(DEST_DIR)/tests; \
> +               fi; \
> +       done;)
> +       @(if [ -d .libs ]; then install .libs/*.so
> $(DEST_DIR)/tests/.libs; fi;)
> +--
> +2.8.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 7271ebe..3eff58d 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -35,6 +35,8 @@ SRC_URI = "http://libvirt.org/sources/
> libvirt-${PV}.tar.gz;name=libvirt \
>             file://install-missing-file.patch \
>             file://0001-nsslinktest-also-build-virAtomic.h.patch \
>             file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch
> \
> +           file://0001-ptest-add-missing-test_helper-files.patch \
> +           file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> \
>            "
>
>  SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
> --
> 2.8.3
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

--001a113d40d41d4bc8053bd6e2d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Sep 5, 2016 at 2:52 AM,  <=
span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_bla=
nk">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windr=
iver.com</a>&gt;<br>
<br>
Add missing test helpers<br>
We don&#39;t support windows encoding so remove that case<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0...move-Windows-1252-check-<wbr>from-esxutilstest.patch | 28 ++++++++=
+++++++++++++<br>
=C2=A0.../0001-ptest-add-missing-<wbr>test_helper-files.patch | 29 ++++++++=
++++++++++++++<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A03 files changed, 59 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<wbr>libvirt/0001-ptest-R=
emove-<wbr>Windows-1252-check-from-<wbr>esxutilstest.patch<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<wbr>libvirt/0001-ptest-a=
dd-<wbr>missing-test_helper-files.<wbr>patch<br>
<br>
diff --git a/recipes-extended/libvirt/<wbr>libvirt/0001-ptest-Remove-<wbr>W=
indows-1252-check-from-<wbr>esxutilstest.patch b/recipes-extended/libvirt/<=
wbr>libvirt/0001-ptest-Remove-<wbr>Windows-1252-check-from-<wbr>esxutilstes=
t.patch<br>
new file mode 100644<br>
index 0000000..217bdbc<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<wbr>libvirt/0001-ptest-Remove-<wbr>Windows-=
1252-check-from-<wbr>esxutilstest.patch<br>
@@ -0,0 +1,28 @@<br>
+From ffc71da15c3da068f85d16617b6e0c<wbr>0175fc0110 Mon Sep 17 00:00:00 200=
1<br>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.=
com</a>&gt;<br>
+Date: Tue, 23 Aug 2016 02:28:47 -0400<br>
+Subject: [PATCH] ptest: Remove Windows-1252 check from esxutilstest<br>
+<br>
+Currently we use iconv from glibc-locale and it does not support<br>
+Windows-1252 and we don&#39;t need support windows character encoding.<br>
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
+---<br>
+ tests/esxutilstest.c | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/tests/esxutilstest.c b/tests/esxutilstest.c<br>
+index 44bdc84..3223de3 100644<br>
+--- a/tests/esxutilstest.c<br>
++++ b/tests/esxutilstest.c<br>
+@@ -258,7 +258,6 @@ mymain(void)<br>
+=C2=A0 =C2=A0 =C2=A0DO_TEST(ParseDatastorePath);<br>
+=C2=A0 =C2=A0 =C2=A0DO_TEST(<wbr>ConvertDateTimeToCalendarTime)<wbr>;<br>
+=C2=A0 =C2=A0 =C2=A0DO_TEST(EscapeDatastoreItem);<br>
+-=C2=A0 =C2=A0 DO_TEST(<wbr>ConvertWindows1252ToUTF8);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0return result =3D=3D 0 ? EXIT_SUCCESS : EXIT_FAILURE;<=
br>
+ }<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/recipes-extended/libvirt/<wbr>libvirt/0001-ptest-add-<wbr>miss=
ing-test_helper-files.<wbr>patch b/recipes-extended/libvirt/<wbr>libvirt/00=
01-ptest-add-<wbr>missing-test_helper-files.<wbr>patch<br>
new file mode 100644<br>
index 0000000..b4f1e27<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<wbr>libvirt/0001-ptest-add-<wbr>missing-tes=
t_helper-files.<wbr>patch<br>
@@ -0,0 +1,29 @@<br>
+From e625a42caca492fe7d52b70bbbf83a<wbr>e4d99cb15e Mon Sep 17 00:00:00 200=
1<br>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.=
com</a>&gt;<br>
+Date: Tue, 23 Aug 2016 02:16:20 -0400<br>
+Subject: [PATCH] ptest: add missing test_helper files<br>
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
+---<br>
+ tests/Makefile.am | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
+index 1c85656..2f8b9eb 100644<br>
+--- a/tests/Makefile.am<br>
++++ b/tests/Makefile.am<br>
+@@ -1422,8 +1422,10 @@ install-ptest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@(for file in $(PTESTS); do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f .libs/$$fil=
e ]; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install .libs/$$file $(DEST_DIR)/tests; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f $(srcdir)/$$fi=
le ]; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install $(srcdir)/$$file $(DEST_DIR)/tests; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install $(builddir)/$$file $(DEST_DIR)/tests; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@(if [ -d .libs ]; then install .libs/*.so $(DE=
ST_DIR)/tests/.libs; fi;)<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
index 7271ebe..3eff58d 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
@@ -35,6 +35,8 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-${PV}.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">ht=
tp://libvirt.org/sources/<wbr>libvirt-${PV}.tar.gz;name=3D<wbr>libvirt</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://install-missing-file.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-nsslinktest-also-<wbr=
>build-virAtomic.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-qemu-Let-empty-<wbr>d=
efault-VNC-password-work-as-<wbr>document.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ptest-add-missing-<wb=
r>test_helper-files.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ptest-Remove-<wbr>Win=
dows-1252-check-from-<wbr>esxutilstest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libvirt.md5sum] =3D &quot;<wbr>f9dc1e63d559eca50ae0ee798a4c6c=
<wbr>6d&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.3<br>
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

--001a113d40d41d4bc8053bd6e2d8--
