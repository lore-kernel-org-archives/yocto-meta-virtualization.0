Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC157E0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:15:13 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id m13so5598941lah.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=peBs87EWCcamt0DOJbDqa68v9H1Ad4UANYqR6k+C4pA=;
	b=udsMg5kOQcPwiA/XAY3zsiBXPzXs2nN01Gai3Yc41N5uSCYohEx2UkczAdv1Sz+c3d
	lwwG0zekW7B6zccQ82OILW5LvI+b4EtKd5Gk6qOYXFYaN+4PQMclHxqr0em8QlbV2YaZ
	gS5qMzG0Ty6q5thfJFANj12Qd9FwaJNcymW0WHJhrf4rcdxnGSovcgYxW4eer5ibQxG4
	ImoKaVmkPq5tGLT7Hm9rg5jYBxM6FhcrqlgfhxIAz28TGGzC/chT4ozDmNd9i0YH5myg
	GJjZI3+MQ4XHjuAAyrl0TdnRn1/FUQd0U93pVxjIPnHo/XCI9NaMChCY5WeKlGiZggrh
	SfAA==
MIME-Version: 1.0
Received: by 10.152.124.68 with SMTP id mg4mr1720598lab.51.1354803312622; Thu,
	06 Dec 2012 06:15:12 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 06:15:12 -0800 (PST)
In-Reply-To: <1354802601-10840-5-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-5-git-send-email-david.c.nystrom@gmail.com>
Date: Thu, 6 Dec 2012 09:15:12 -0500
Message-ID: <CADkTA4O_Bj7+DjSgEKK=9TTc-=FNFkyJnVBz3CaoVNKgT8WN=Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv3 04/14] Added lxc recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 14:15:14 -0000
Content-Type: multipart/alternative; boundary=f46d043bd8fe307d8a04d02fbacc

--f46d043bd8fe307d8a04d02fbacc
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:

> From: David Nystr=F6m <david.nystrom@enea.com>
>
> ---
>  recipes-containers/lxc/files/libmounts.patch  |   48
> +++++++++++++++++++++++++
>  recipes-containers/lxc/files/noldconfig.patch |   29 +++++++++++++++
>  recipes-containers/lxc/lxc_0.8.0.bb           |   39 +++++++++++++++++++=
+
>  3 files changed, 116 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/libmounts.patch
>  create mode 100644 recipes-containers/lxc/files/noldconfig.patch
>  create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
>
> diff --git a/recipes-containers/lxc/files/libmounts.patch
> b/recipes-containers/lxc/files/libmounts.patch
> new file mode 100644
> index 0000000..7e092f1
> --- /dev/null
> +++ b/recipes-containers/lxc/files/libmounts.patch
> @@ -0,0 +1,48 @@
> +From dfef62f0334c65397254215f809a8f25364ea6ef Mon Sep 17 00:00:00 2001
> +From: Stuart Yoder <stuart.yoder@freescale.com>
> +Date: Wed, 12 Sep 2012 11:05:07 -0500
> +Subject: [PATCH] create lib mounts only if the host directories exist
> +
>

Is the source of the lxc recipe the meta-fsl layers ? If so, it's always a
good idea
to provide a reference to the original recipe (or layer) in the commit
message or
even in the patch itself. It serves to give credit and help people trace
the history
of a particular recipe.

Cheers,

Bruce


> +Signed-off-by: Stuart Yoder <stuart.yoder@freescale.com>
> +---
> + templates/lxc-busybox.in |   24 +++++++++++-------------
> + 1 file changed, 11 insertions(+), 13 deletions(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index 720ceef..f6cb1ba 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -235,19 +235,17 @@ lxc.pts =3D 1
> + lxc.rootfs =3D $rootfs
> + EOF
> +
> +-if [ -d "$rootfs/lib" ]; then
> +-cat <<EOF >> $path/config
> +-lxc.mount.entry=3D/lib $rootfs/lib none ro,bind 0 0
> +-lxc.mount.entry=3D/usr/lib $rootfs/usr/lib none ro,bind 0 0
> +-EOF
> +-fi
> +-
> +-if [ -d "/lib64" ] && [ -d "$rootfs/lib64" ]; then
> +-cat <<EOF >> $path/config
> +-lxc.mount.entry=3D/lib64 $rootfs/lib64 none ro,bind 0 0
> +-lxc.mount.entry=3D/usr/lib64 $rootfs/usr/lib64 none ro,bind 0 0
> +-EOF
> +-fi
> ++    libdirs=3D"\
> ++        /lib \
> ++        /usr/lib \
> ++        /lib64 \
> ++        /usr/lib64"
> ++
> ++    for dir in $libdirs; do
> ++        if [ -d $dir ]; then
> ++            echo "lxc.mount.entry=3D$dir $rootfs$dir none ro,bind 0 0" =
>>
> $path/config
> ++        fi
> ++    done
> + }
> +
> + usage()
> +--
> +1.7.9.7
> +
> diff --git a/recipes-containers/lxc/files/noldconfig.patch
> b/recipes-containers/lxc/files/noldconfig.patch
> new file mode 100644
> index 0000000..5edff46
> --- /dev/null
> +++ b/recipes-containers/lxc/files/noldconfig.patch
> @@ -0,0 +1,29 @@
> +From a8aa8d131a7140d5625c24c9f4c28c605213552c Mon Sep 17 00:00:00 2001
> +From: Andrey Mazo <ahippo@yandex.ru>
> +Date: Fri, 18 May 2012 21:11:22 +0400
> +Subject: [PATCH] Avoid ldconfig due to cross-compilation problems.
> +
> +Make required symlinks manually.
> +Otherwise, it cases problems on cbuild endianness !=3D ctarget endiannes=
s
> +setups because /sbin/ldconfig expects elf header in the wrong endianness=
.
> +---
> + src/lxc/Makefile.am |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
> +index 1c26952..3b84c1a 100644
> +--- a/src/lxc/Makefile.am
> ++++ b/src/lxc/Makefile.am
> +@@ -125,8 +125,8 @@ lxc_kill_SOURCES =3D lxc_kill.c
> +
> + install-exec-local: install-soPROGRAMS
> +       mv $(DESTDIR)$(libdir)/liblxc.so
> $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
> +-      /sbin/ldconfig -l $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
> +       cd $(DESTDIR)$(libdir); \
> ++      ln -sf liblxc.so.$(VERSION) liblxc.so.$(firstword $(subst .,
> ,$(VERSION))); \
> +       ln -sf liblxc.so.$(firstword $(subst ., ,$(VERSION))) liblxc.so
> +
> + uninstall-local:
> +--
> +1.7.3.4
> +
> diff --git a/recipes-containers/lxc/lxc_0.8.0.bb b/recipes-containers/lxc=
/
> lxc_0.8.0.bb
> new file mode 100644
> index 0000000..c662cb1
> --- /dev/null
> +++ b/recipes-containers/lxc/lxc_0.8.0.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "lxc aims to use these new functionnalities to provide a=
n
> userspace container object"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +PRIORITY =3D "optional"
> +PR =3D "r2"
> +DEPENDS =3D "libxml2 libcap"
> +RDEPENDS_${PN} =3D " \
> +               rsync \
> +               gzip \
> +               libcap-bin \
> +               bridge-utils \
> +               dnsmasq \
> +               perl-module-strict \
> +               perl-module-getopt-long \
> +               perl-module-vars \
> +               perl-module-warnings-register \
> +               perl-module-exporter \
> +               perl-module-constant \
> +               perl-module-overload \
> +               perl-module-exporter-heavy \
> +"
> +
> +SRC_URI =3D "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz =
\
> +       file://noldconfig.patch \
> +       "
> +SRC_URI[md5sum] =3D "7304fa57146ce687f749b5df876bb20d"
> +SRC_URI[sha256sum] =3D
> "eac833730b94e423d4bef6834bc4a716437d2abd6ab8b24334c506aaaa08692c"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[doc] =3D "--enable-doc,--disable-doc"
> +PACKAGECONFIG[rpath] =3D "--enable-rpath,--disable-rpath"
> +PACKAGECONFIG[apparmour] =3D
> "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> +
> +inherit autotools
> +
> +FILES_${PN}-dbg +=3D "${libexecdir}/lxc/.debug"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d043bd8fe307d8a04d02fbacc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 9:03 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:david.c.nys=
trom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">From=
: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom@enea.com">david.nystr=
om@enea.com</a>&gt;<br>

<br>
---<br>
=A0recipes-containers/lxc/files/libmounts.patch =A0| =A0 48 +++++++++++++++=
++++++++++<br>
=A0recipes-containers/lxc/files/noldconfig.patch | =A0 29 +++++++++++++++<b=
r>
=A0recipes-containers/lxc/<a href=3D"http://lxc_0.8.0.bb" target=3D"_blank"=
>lxc_0.8.0.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 39 ++++++++++++++++++++<br>
=A03 files changed, 116 insertions(+)<br>
=A0create mode 100644 recipes-containers/lxc/files/libmounts.patch<br>
=A0create mode 100644 recipes-containers/lxc/files/noldconfig.patch<br>
=A0create mode 100644 recipes-containers/lxc/<a href=3D"http://lxc_0.8.0.bb=
" target=3D"_blank">lxc_0.8.0.bb</a><br>
<br>
diff --git a/recipes-containers/lxc/files/libmounts.patch b/recipes-contain=
ers/lxc/files/libmounts.patch<br>
new file mode 100644<br>
index 0000000..7e092f1<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/libmounts.patch<br>
@@ -0,0 +1,48 @@<br>
+From dfef62f0334c65397254215f809a8f25364ea6ef Mon Sep 17 00:00:00 2001<br>
+From: Stuart Yoder &lt;<a href=3D"mailto:stuart.yoder@freescale.com">stuar=
t.yoder@freescale.com</a>&gt;<br>
+Date: Wed, 12 Sep 2012 11:05:07 -0500<br>
+Subject: [PATCH] create lib mounts only if the host directories exist<br>
+<br></div></div></blockquote><div><br></div><div>Is the source of the lxc =
recipe the meta-fsl layers ? If so, it&#39;s always a good idea</div><div>t=
o provide a reference to the original recipe (or layer) in the commit messa=
ge or</div>
<div>even in the patch itself. It serves to give credit and help people tra=
ce the history</div><div>of a particular recipe.</div><div><br></div><div>C=
heers,</div><div><br></div><div>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">
+Signed-off-by: Stuart Yoder &lt;<a href=3D"mailto:stuart.yoder@freescale.c=
om">stuart.yoder@freescale.com</a>&gt;<br>
+---<br>
+ templates/<a href=3D"http://lxc-busybox.in" target=3D"_blank">lxc-busybox=
.in</a> | =A0 24 +++++++++++-------------<br>
+ 1 file changed, 11 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/templates/<a href=3D"http://lxc-busybox.in" target=3D"_blank"=
>lxc-busybox.in</a> b/templates/<a href=3D"http://lxc-busybox.in" target=3D=
"_blank">lxc-busybox.in</a><br>
+index 720ceef..f6cb1ba 100644<br>
+--- a/templates/<a href=3D"http://lxc-busybox.in" target=3D"_blank">lxc-bu=
sybox.in</a><br>
++++ b/templates/<a href=3D"http://lxc-busybox.in" target=3D"_blank">lxc-bu=
sybox.in</a><br>
+@@ -235,19 +235,17 @@ lxc.pts =3D 1<br>
+ lxc.rootfs =3D $rootfs<br>
+ EOF<br>
+<br>
+-if [ -d &quot;$rootfs/lib&quot; ]; then<br>
+-cat &lt;&lt;EOF &gt;&gt; $path/config<br>
+-lxc.mount.entry=3D/lib $rootfs/lib none ro,bind 0 0<br>
+-lxc.mount.entry=3D/usr/lib $rootfs/usr/lib none ro,bind 0 0<br>
+-EOF<br>
+-fi<br>
+-<br>
+-if [ -d &quot;/lib64&quot; ] &amp;&amp; [ -d &quot;$rootfs/lib64&quot; ];=
 then<br>
+-cat &lt;&lt;EOF &gt;&gt; $path/config<br>
+-lxc.mount.entry=3D/lib64 $rootfs/lib64 none ro,bind 0 0<br>
+-lxc.mount.entry=3D/usr/lib64 $rootfs/usr/lib64 none ro,bind 0 0<br>
+-EOF<br>
+-fi<br>
++ =A0 =A0libdirs=3D&quot;\<br>
++ =A0 =A0 =A0 =A0/lib \<br>
++ =A0 =A0 =A0 =A0/usr/lib \<br>
++ =A0 =A0 =A0 =A0/lib64 \<br>
++ =A0 =A0 =A0 =A0/usr/lib64&quot;<br>
++<br>
++ =A0 =A0for dir in $libdirs; do<br>
++ =A0 =A0 =A0 =A0if [ -d $dir ]; then<br>
++ =A0 =A0 =A0 =A0 =A0 =A0echo &quot;lxc.mount.entry=3D$dir $rootfs$dir non=
e ro,bind 0 0&quot; &gt;&gt; $path/config<br>
++ =A0 =A0 =A0 =A0fi<br>
++ =A0 =A0done<br>
+ }<br>
+<br>
+ usage()<br>
+--<br>
+1.7.9.7<br>
+<br>
diff --git a/recipes-containers/lxc/files/noldconfig.patch b/recipes-contai=
ners/lxc/files/noldconfig.patch<br>
new file mode 100644<br>
index 0000000..5edff46<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/noldconfig.patch<br>
@@ -0,0 +1,29 @@<br>
+From a8aa8d131a7140d5625c24c9f4c28c605213552c Mon Sep 17 00:00:00 2001<br>
+From: Andrey Mazo &lt;<a href=3D"mailto:ahippo@yandex.ru">ahippo@yandex.ru=
</a>&gt;<br>
+Date: Fri, 18 May 2012 21:11:22 +0400<br>
+Subject: [PATCH] Avoid ldconfig due to cross-compilation problems.<br>
+<br>
+Make required symlinks manually.<br>
+Otherwise, it cases problems on cbuild endianness !=3D ctarget endianness<=
br>
+setups because /sbin/ldconfig expects elf header in the wrong endianness.<=
br>
+---<br>
+ src/lxc/Makefile.am | =A0 =A02 +-<br>
+ 1 files changed, 1 insertions(+), 1 deletions(-)<br>
+<br>
+diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am<br>
+index 1c26952..3b84c1a 100644<br>
+--- a/src/lxc/Makefile.am<br>
++++ b/src/lxc/Makefile.am<br>
+@@ -125,8 +125,8 @@ lxc_kill_SOURCES =3D lxc_kill.c<br>
+<br>
+ install-exec-local: install-soPROGRAMS<br>
+ =A0 =A0 =A0 mv $(DESTDIR)$(libdir)/liblxc.so $(DESTDIR)$(libdir)/liblxc.s=
o.$(VERSION)<br>
+- =A0 =A0 =A0/sbin/ldconfig -l $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)<br=
>
+ =A0 =A0 =A0 cd $(DESTDIR)$(libdir); \<br>
++ =A0 =A0 =A0ln -sf liblxc.so.$(VERSION) liblxc.so.$(firstword $(subst ., =
,$(VERSION))); \<br>
+ =A0 =A0 =A0 ln -sf liblxc.so.$(firstword $(subst ., ,$(VERSION))) liblxc.=
so<br>
+<br>
+ uninstall-local:<br>
+--<br>
+1.7.3.4<br>
+<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_0.8.0.bb" target=
=3D"_blank">lxc_0.8.0.bb</a> b/recipes-containers/lxc/<a href=3D"http://lxc=
_0.8.0.bb" target=3D"_blank">lxc_0.8.0.bb</a><br>
new file mode 100644<br>
index 0000000..c662cb1<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_0.8.0.bb" target=3D"_bla=
nk">lxc_0.8.0.bb</a><br>
@@ -0,0 +1,39 @@<br>
+DESCRIPTION =3D &quot;lxc aims to use these new functionnalities to provid=
e an userspace container object&quot;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901857fcd118f065f900=
982c24&quot;<br>
+PRIORITY =3D &quot;optional&quot;<br>
+PR =3D &quot;r2&quot;<br>
+DEPENDS =3D &quot;libxml2 libcap&quot;<br>
+RDEPENDS_${PN} =3D &quot; \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rsync \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 gzip \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 libcap-bin \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 bridge-utils \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnsmasq \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-strict \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-getopt-long \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-vars \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-warnings-register \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-exporter \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-constant \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-overload \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 perl-module-exporter-heavy \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://lxc.sourceforge.net/download/lxc/${PN}=
-${PV}.tar.gz" target=3D"_blank">http://lxc.sourceforge.net/download/lxc/${=
PN}-${PV}.tar.gz</a> \<br>
+ =A0 =A0 =A0 file://noldconfig.patch \<br>
+ =A0 =A0 =A0 &quot;<br>
+SRC_URI[md5sum] =3D &quot;7304fa57146ce687f749b5df876bb20d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;eac833730b94e423d4bef6834bc4a716437d2abd6ab8b=
24334c506aaaa08692c&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/${PN}-${PV}&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[doc] =3D &quot;--enable-doc,--disable-doc&quot;<br>
+PACKAGECONFIG[rpath] =3D &quot;--enable-rpath,--disable-rpath&quot;<br>
+PACKAGECONFIG[apparmour] =3D &quot;--enable-apparmor,--disable-apparmor,ap=
parmor,apparmor&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug&quot;<br>
--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--f46d043bd8fe307d8a04d02fbacc--
