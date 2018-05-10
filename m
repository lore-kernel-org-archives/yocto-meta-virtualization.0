Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AEB8E00C25; Thu, 10 May 2018 13:44:06 -0700 (PDT)
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
	*      [209.85.215.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E94FEE00831
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 May 2018 13:44:02 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id x7-v6so4808493lff.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 May 2018 13:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wxn5PuL1y7ZlM6BcsK4ureMJez//hqO/UoN0c9InQRw=;
	b=pw/B8/1FVsbRKY5UA5KzJlErOAMJbI/+tMPwAqxqUeiZNfvXFyYTq0THxiSzatKCnZ
	KpDadOuntHtRgffLRiDssGFM7rr1sQQ/N3edrV6D8CjcWVgyYUqwG3zSxMplwIqZCuZE
	K4kl+9Ab6ybxePzww/N97zFw6fIAWfRvYSI+ZfKNnebZL9myfcWZUfhZb4aUSaxr8ONv
	+zfx/yTUhhu92hzHuoZdk0xn9hBMv+yZ2c+HwEX6CW78/RZYThQSfJ8P+kiCsBcFORWg
	owUffZoFKgPB1ePbbxhwC7ufyPsJha8aqrwrFDHDSnTGwXvKfIq3aLLb9oWwyAZCtrGb
	c9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wxn5PuL1y7ZlM6BcsK4ureMJez//hqO/UoN0c9InQRw=;
	b=Pk+xDzDJfnMerIuSVryns7pcfcLYCHym063PVKdI087ljk/pTMlh5CUMhTN0xqb4SO
	z7365wLp4Z1EjohDy96PbL9mORjLMzBIzzwuRpoBh2o7jLXyZRj9dOxcdNJbSNndEAWp
	RPC5LKbTXvv9DhcTzPzlwImQuWEp/LugAvUaaUXc/zT9j5vkbtHDHoCNhplpXNMabvXq
	tq7p0tzfeC2jkKHsh11bijq5Nkb3AmfTvwEr9RRIVB3bobysW93mhY/AYUvcWTynZbO0
	n1ThRCbS21Cjc/OZNN3JtvGb8I0WHx20ixoeC53Q8F2IQkiqCPY5Dz9m5d05I+mt2UU4
	k6iA==
X-Gm-Message-State: ALKqPwc9kVXwxIWTJQx33xlJ14CsIlKSOQivJVf9PuhoXsrGYhsNFszY
	zjgD//pArgjUMff/q7+FyqdH1bEVoQWoS5ag+HTB5A==
X-Google-Smtp-Source: AB8JxZp5Q10zJoyU1IkWPo/4DdoGXF2Y2v7VxTKP+jK5Mdiig87IjGrPMWaClvHcEx/NzAOke4QzVcxRXHP13CxxYIc=
X-Received: by 2002:a19:f4d:: with SMTP id e74-v6mr1796548lfi.39.1525985040473;
	Thu, 10 May 2018 13:44:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 10 May 2018 13:43:59 -0700 (PDT)
In-Reply-To: <1525974662-32260-1-git-send-email-mark.asselstine@windriver.com>
References: <1525974662-32260-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 May 2018 16:43:59 -0400
Message-ID: <CADkTA4N5xESd=Rk-yX+vCbGpzfj8zippyvvH8aObeaPhz6_FUQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: fixups for glibc 2.27 - with Sun RPC Interfaces removed
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
X-List-Received-Date: Thu, 10 May 2018 20:44:06 -0000
Content-Type: multipart/alternative; boundary="00000000000045254b056be014d5"

--00000000000045254b056be014d5
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, May 10, 2018 at 1:51 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> With Sun RPC Interfaces removed from libc we need to use an external
> provider for rpc. Polling other distros there seems to be consensus to
> use libtirpc so we follow this trend.
>
> Unfortunately this should only require the DEPENDS addition to the
> recipe but the upstream project has a few flaws in their Makefiles and
> configure which we need to work around so we add 2 new patches to
> address these to allow for the use of a sysroot and to use the
> $XDR_CFLAGS in a few more places.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../Makefiles-Add-more-XDR_CFLAGS-as-needed.patch  | 62
> ++++++++++++++++++++++
>  ...re.ac-search-for-rpc-rpc.h-in-the-sysroot.patch | 36 +++++++++++++
>  recipes-extended/libvirt/libvirt_1.3.5.bb          |  4 +-
>  3 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-
> more-XDR_CFLAGS-as-needed.patch
>  create mode 100644 recipes-extended/libvirt/libvirt-1.3.5/configure.ac-
> search-for-rpc-rpc.h-in-the-sysroot.patch
>
> diff --git a/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-
> more-XDR_CFLAGS-as-needed.patch b/recipes-extended/libvirt/
> libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
> new file mode 100644
> index 0000000..826cdd0
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-
> more-XDR_CFLAGS-as-needed.patch
> @@ -0,0 +1,62 @@
> +From dcfc263db9e69e5381cb511c51836271dec577a3 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 10 May 2018 13:27:47 -0400
> +Subject: [PATCH] Makefiles: Add more $XDR_CFLAGS as needed
> +
> +When building with libtirpc instead of libc-xdr the include search
> +path needs to be used. In several places this was missing and it was
> +only looking in /usr/include and failing.
> +
> +Upstream-Status: Inappropriate [old release]
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + src/Makefile.am   | 5 +++--
> + tests/Makefile.am | 1 +
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index e9ce941..38114b7 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -1157,7 +1157,7 @@ libvirt_la_BUILT_LIBADD += libvirt_driver.la
> + libvirt_driver_la_SOURCES = $(DRIVER_SOURCES)
> +
> + libvirt_driver_la_CFLAGS = \
> +-              $(GNUTLS_CFLAGS) $(CURL_CFLAGS) \
> ++              $(GNUTLS_CFLAGS) $(CURL_CFLAGS) $(XDR_CFLAGS) \
> +               -I$(srcdir)/conf $(AM_CFLAGS)
> + libvirt_driver_la_LIBADD = \
> +               $(GNUTLS_LIBS) $(CURL_LIBS) $(DLOPEN_LIBS)
> +@@ -1348,6 +1348,7 @@ endif ! WITH_DRIVER_MODULES
> +
> + libvirt_driver_qemu_impl_la_CFLAGS = \
> +               $(GNUTLS_CFLAGS) \
> ++              $(XDR_CFLAGS) \
> +               $(LIBNL_CFLAGS) \
> +               -I$(srcdir)/access \
> +               -I$(srcdir)/conf \
> +@@ -2306,7 +2307,7 @@ libvirt_lxc_la_LDFLAGS = \
> +               $(CYGWIN_EXTRA_LDFLAGS) \
> +               $(MINGW_EXTRA_LDFLAGS) \
> +               $(NULL)
> +-libvirt_lxc_la_CFLAGS = $(AM_CFLAGS)
> ++libvirt_lxc_la_CFLAGS = $(AM_CFLAGS) $(XDR_CFLAGS)
> + libvirt_lxc_la_LIBADD = libvirt.la $(CYGWIN_EXTRA_LIBADD)
> +
> + # Since virt-login-shell will be setuid, we must do everything
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 2f8b9eb..aec9a3e 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -48,6 +48,7 @@ AM_CFLAGS = \
> +       $(APPARMOR_CFLAGS) \
> +       $(YAJL_CFLAGS) \
> +       $(COVERAGE_CFLAGS) \
> ++      $(XDR_CFLAGS) \
> +       $(WARN_CFLAGS)
> +
> + AM_LDFLAGS = \
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-
> search-for-rpc-rpc.h-in-the-sysroot.patch b/recipes-extended/libvirt/
> libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
> new file mode 100644
> index 0000000..edbadb6
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-
> search-for-rpc-rpc.h-in-the-sysroot.patch
> @@ -0,0 +1,36 @@
> +From f10477f0fe5e4b7487a4a41faa216d10cd2bc7c3 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 10 May 2018 12:05:04 -0400
> +Subject: [PATCH] configure.ac: search for rpc/rpc.h in the sysroot
> +
> +We want to avoid host contamination and use the sysroot as the base
> +directory for our search so add the '=' the the '-I' when searching
> +for libtirpc's rpc.h header.
> +
> +Upstream-Status: Inappropriate [old release]
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5a6408c..6c19f6d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -705,10 +705,10 @@ if test x"$with_remote" = x"yes" || test
> x"$with_libvirtd" = x"yes"; then
> +     dnl check for cygwin's variation in xdr function names
> +     AC_CHECK_FUNCS([xdr_u_int64_t],[],[],[#include <rpc/xdr.h>])
> +
> +-    dnl Cygwin/recent glibc requires -I/usr/include/tirpc for <rpc/rpc.h>
> ++    dnl Cygwin/recent glibc requires -I=/usr/include/tirpc for
> <rpc/rpc.h>
> +     old_CFLAGS=$CFLAGS
> +     AC_CACHE_CHECK([where to find <rpc/rpc.h>], [lv_cv_xdr_cflags], [
> +-      for add_CFLAGS in '' '-I/usr/include/tirpc' 'missing'; do
> ++      for add_CFLAGS in '' '-I=/usr/include/tirpc' 'missing'; do
> +         if test x"$add_CFLAGS" = xmissing; then
> +           lv_cv_xdr_cflags=missing; break
> +         fi
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index e7a2b23..35fd577 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> b234ee4d69f5fce4486a80fdaf4a4263 \
>  SECTION = "console/tools"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
> util-linux e2fsprogs pm-utils \
> -          iptables dnsmasq readline libtasn1 libxslt-native acl
> libdevmapper \
> +          iptables dnsmasq readline libtasn1 libxslt-native acl
> libdevmapper libtirpc \
>            ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> 'shadow-native', '', d)}"
>
>  # libvirt-guests.sh needs gettext.sh
> @@ -40,6 +40,8 @@ SRC_URI = "http://libvirt.org/sources/
> libvirt-${PV}.tar.gz;name=libvirt \
>             file://0001-ptest-add-missing-test_helper-files.patch \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> \
>            file://0001-Added-configure-variable-for-placing-systemd-untis-l.patch
> \
> +          file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
> +          file://Makefiles-Add-more-XDR_CFLAGS-as-needed.patch \
>            "
>
>  SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
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

--00000000000045254b056be014d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 10, 2018 at 1:51 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">With Sun RPC Interfaces removed =
from libc we need to use an external<br>
provider for rpc. Polling other distros there seems to be consensus to<br>
use libtirpc so we follow this trend.<br>
<br>
Unfortunately this should only require the DEPENDS addition to the<br>
recipe but the upstream project has a few flaws in their Makefiles and<br>
configure which we need to work around so we add 2 new patches to<br>
address these to allow for the use of a sysroot and to use the<br>
$XDR_CFLAGS in a few more places.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../Makefiles-Add-more-XDR_<wbr>CFLAGS-as-needed.patch=C2=A0 | 62 +++=
+++++++++++++++++++<br>
=C2=A0...re.ac-search-for-rpc-rpc.h-<wbr>in-the-sysroot.patch | 36 ++++++++=
+++++<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A03 files changed, 101 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<wbr>libvirt-1.3.5/Makefi=
les-Add-<wbr>more-XDR_CFLAGS-as-needed.<wbr>patch<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<wbr>libvirt-1.3.5/config=
ure.ac-<wbr>search-for-rpc-rpc.h-in-the-<wbr>sysroot.patch<br>
<br>
diff --git a/recipes-extended/libvirt/<wbr>libvirt-1.3.5/Makefiles-Add-<wbr=
>more-XDR_CFLAGS-as-needed.<wbr>patch b/recipes-extended/libvirt/<wbr>libvi=
rt-1.3.5/Makefiles-Add-<wbr>more-XDR_CFLAGS-as-needed.<wbr>patch<br>
new file mode 100644<br>
index 0000000..826cdd0<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<wbr>libvirt-1.3.5/Makefiles-Add-<wbr>more-X=
DR_CFLAGS-as-needed.<wbr>patch<br>
@@ -0,0 +1,62 @@<br>
+From dcfc263db9e69e5381cb511c518362<wbr>71dec577a3 Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Thu, 10 May 2018 13:27:47 -0400<br>
+Subject: [PATCH] Makefiles: Add more $XDR_CFLAGS as needed<br>
+<br>
+When building with libtirpc instead of libc-xdr the include search<br>
+path needs to be used. In several places this was missing and it was<br>
+only looking in /usr/include and failing.<br>
+<br>
+Upstream-Status: Inappropriate [old release]<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ src/Makefile.am=C2=A0 =C2=A0| 5 +++--<br>
+ tests/Makefile.am | 1 +<br>
+ 2 files changed, 4 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/Makefile.am b/src/Makefile.am<br>
+index e9ce941..38114b7 100644<br>
+--- a/src/Makefile.am<br>
++++ b/src/Makefile.am<br>
+@@ -1157,7 +1157,7 @@ libvirt_la_BUILT_LIBADD +=3D <a href=3D"http://libvi=
rt_driver.la" rel=3D"noreferrer" target=3D"_blank">libvirt_driver.la</a><br=
>
+ libvirt_driver_la_SOURCES =3D $(DRIVER_SOURCES)<br>
+ <br>
+ libvirt_driver_la_CFLAGS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GNUTLS_CFLAGS) $(CURL_=
CFLAGS) \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GNUTLS_CFLAGS) $(CURL_=
CFLAGS) $(XDR_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(srcdir)/conf $(=
AM_CFLAGS)<br>
+ libvirt_driver_la_LIBADD =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(GNUTLS_LIBS) $(CU=
RL_LIBS) $(DLOPEN_LIBS)<br>
+@@ -1348,6 +1348,7 @@ endif ! WITH_DRIVER_MODULES<br>
+ <br>
+ libvirt_driver_qemu_impl_la_<wbr>CFLAGS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(GNUTLS_CFLAGS) \<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(XDR_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBNL_CFLAGS) \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(srcdir)/access =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(srcdir)/conf \<=
br>
+@@ -2306,7 +2307,7 @@ libvirt_lxc_la_LDFLAGS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(CYGWIN_EXTRA_LDFL=
AGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MINGW_EXTRA_LDFLA=
GS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
+-libvirt_lxc_la_CFLAGS =3D $(AM_CFLAGS)<br>
++libvirt_lxc_la_CFLAGS =3D $(AM_CFLAGS) $(XDR_CFLAGS)<br>
+ libvirt_lxc_la_LIBADD =3D <a href=3D"http://libvirt.la" rel=3D"noreferrer=
" target=3D"_blank">libvirt.la</a> $(CYGWIN_EXTRA_LIBADD)<br>
+ <br>
+ # Since virt-login-shell will be setuid, we must do everything<br>
+diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
+index 2f8b9eb..aec9a3e 100644<br>
+--- a/tests/Makefile.am<br>
++++ b/tests/Makefile.am<br>
+@@ -48,6 +48,7 @@ AM_CFLAGS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(APPARMOR_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(YAJL_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(COVERAGE_CFLAGS) \<br>
++=C2=A0 =C2=A0 =C2=A0 $(XDR_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(WARN_CFLAGS)<br>
+ <br>
+ AM_LDFLAGS =3D \<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/recipes-extended/libvirt/<wbr>libvirt-1.3.5/configure.ac-<wbr>=
search-for-rpc-rpc.h-in-the-<wbr>sysroot.patch b/recipes-extended/libvirt/<=
wbr>libvirt-1.3.5/configure.ac-<wbr>search-for-rpc-rpc.h-in-the-<wbr>sysroo=
t.patch<br>
new file mode 100644<br>
index 0000000..edbadb6<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<wbr>libvirt-1.3.5/configure.ac-<wbr>search-=
for-rpc-rpc.h-in-the-<wbr>sysroot.patch<br>
@@ -0,0 +1,36 @@<br>
+From f10477f0fe5e4b7487a4a41faa216d<wbr>10cd2bc7c3 Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Thu, 10 May 2018 12:05:04 -0400<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: search for rpc/rpc.h in the sysroot<br>
+<br>
+We want to avoid host contamination and use the sysroot as the base<br>
+directory for our search so add the &#39;=3D&#39; the the &#39;-I&#39; whe=
n searching<br>
+for libtirpc&#39;s rpc.h header.<br>
+<br>
+Upstream-Status: Inappropriate [old release]<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 5a6408c..6c19f6d 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -705,10 +705,10 @@ if test x&quot;$with_remote&quot; =3D x&quot;yes&quo=
t; || test x&quot;$with_libvirtd&quot; =3D x&quot;yes&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0dnl check for cygwin&#39;s variation in xdr function n=
ames<br>
+=C2=A0 =C2=A0 =C2=A0AC_CHECK_FUNCS([xdr_u_int64_t]<wbr>,[],[],[#include &l=
t;rpc/xdr.h&gt;])<br>
+ <br>
+-=C2=A0 =C2=A0 dnl Cygwin/recent glibc requires -I/usr/include/tirpc for &=
lt;rpc/rpc.h&gt;<br>
++=C2=A0 =C2=A0 dnl Cygwin/recent glibc requires -I=3D/usr/include/tirpc fo=
r &lt;rpc/rpc.h&gt;<br>
+=C2=A0 =C2=A0 =C2=A0old_CFLAGS=3D$CFLAGS<br>
+=C2=A0 =C2=A0 =C2=A0AC_CACHE_CHECK([where to find &lt;rpc/rpc.h&gt;], [lv_=
cv_xdr_cflags], [<br>
+-=C2=A0 =C2=A0 =C2=A0 for add_CFLAGS in &#39;&#39; &#39;-I/usr/include/tir=
pc&#39; &#39;missing&#39;; do<br>
++=C2=A0 =C2=A0 =C2=A0 for add_CFLAGS in &#39;&#39; &#39;-I=3D/usr/include/=
tirpc&#39; &#39;missing&#39;; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test x&quot;$add_CFLAGS&quot; =3D xmi=
ssing; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lv_cv_xdr_cflags=3Dmissing; break=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
index e7a2b23..35fd577 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>b234ee=
4d69f5fce4486a80fdaf4a42<wbr>63 \<br>
=C2=A0SECTION =3D &quot;console/tools&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi parted curl =
libpcap util-linux e2fsprogs pm-utils \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptables dnsmasq readline libtasn1 libx=
slt-native acl libdevmapper \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptables dnsmasq readline libtasn1 libx=
slt-native acl libdevmapper libtirpc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;<wbr>PAC=
KAGECONFIG&#39;, &#39;polkit&#39;, &#39;shadow-native&#39;, &#39;&#39;, d)}=
&quot;<br>
<br>
=C2=A0# libvirt-guests.sh needs gettext.sh<br>
@@ -40,6 +40,8 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-${PV}.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">ht=
tp://libvirt.org/sources/<wbr>libvirt-${PV}.tar.gz;name=3D<wbr>libvirt</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ptest-add-missing-<wb=
r>test_helper-files.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ptest-Remove-<wbr>Win=
dows-1252-check-from-<wbr>esxutilstest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Added-configure-<wbr>v=
ariable-for-placing-systemd-<wbr>untis-l.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.ac-search-<wbr>for-rpc=
-rpc.h-in-the-sysroot.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefiles-Add-more-XDR_<wbr>CFLA=
GS-as-needed.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libvirt.md5sum] =3D &quot;<wbr>f9dc1e63d559eca50ae0ee798a4c6c=
<wbr>6d&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--00000000000045254b056be014d5--
