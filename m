Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2909AE00924; Tue,  3 Jan 2017 07:30:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.177 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A19AE0090C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 07:30:03 -0800 (PST)
Received: by mail-qk0-f177.google.com with SMTP id t184so378444922qkd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jan 2017 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O6gMPkpOjSLrPPeB22JCTPL6RQqhQoYxkoqZUkbFDwM=;
	b=XXWs5CwAGMX3h5DxvTwFrOlSb32TUMhj/x7w+YMKAs6P/EkXbAfyJcPmwFEImjg2J1
	u7uNf/YVbDysxHWDBa4r2v6+HDJhz657B/+GO5AjMm8JHH9wH0jFVGxhTMELtE34kxCP
	Gvw43UjIbwMShFmCFzRDO2uyvmxxexqyrt+jvJZP61Y8gOX52SJkP1j+hcXYHlnbodcn
	dnSBdjr/5gzAlfur6AYyiURBaJeZt+6Egot4ZFUqnSfLB7HAYiA69MMUecllfC1t0szO
	Npo/b98zPTHcucHWystnZutSKmlNGseQ9mTwIYVr6XffoV2LHCa7eS8HBkSPsZprnUbA
	yuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O6gMPkpOjSLrPPeB22JCTPL6RQqhQoYxkoqZUkbFDwM=;
	b=EWhgyBdhbOX1L211Hg/A+ttoDvQrtaiahPgUtzh3UGMwYR4ApEFNEsRytR4/0kFMmF
	UBObdAunLpS04wmhIImVUnIrZcN3h7anJMnGpRjq42GB3z/1m0JzM5EMc+KVQGDfWxFl
	GqN5RXYFNYMJJt5c58spqrwsY1EW0inoUUW1lOins9TFyhVQTCHAJP2Xu1CCWTCAopha
	83ovzt5FJVan3O5iOY5unLVHmrP5GokQdU7O07qH0wCW39NyV2vwNS0I9Cjk4dfJM8yC
	+BgblTwYPExrpUuRqjkhhpxTq4SrKkafQMgCvwUp43PiOpupQscCEab44pXTwdB4xhK5
	npIw==
X-Gm-Message-State: AIkVDXLvYlEnm6eLyUDtjzRZVJkfkw9URhm8mxciPlC0Kqxy3h7OU8YQwjTmsKgZB0/QAFBGd+hMPJf9pm1fFg==
X-Received: by 10.55.77.134 with SMTP id a128mr70339130qkb.157.1483457403446; 
	Tue, 03 Jan 2017 07:30:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Tue, 3 Jan 2017 07:30:03 -0800 (PST)
In-Reply-To: <1483309280-9112-2-git-send-email-paul@paulbarker.me.uk>
References: <1483309280-9112-1-git-send-email-paul@paulbarker.me.uk>
	<1483309280-9112-2-git-send-email-paul@paulbarker.me.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Jan 2017 10:30:03 -0500
Message-ID: <CADkTA4MtR01RLUJGk4FzFzQEb72e=hky0dh1Fx-qUfL1Z4750g@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] Remove True option to getVar calls
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
X-List-Received-Date: Tue, 03 Jan 2017 15:30:07 -0000
Content-Type: multipart/alternative; boundary=001a114884b2926edd0545325724

--001a114884b2926edd0545325724
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Sun, Jan 1, 2017 at 5:21 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> getVar() now defaults to expanding by default.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  classes/go-osarchmap.bbclass                | 18 +++++++++---------
>  recipes-devtools/go-cross/go-cross.inc      |  2 +-
>  recipes-extended/libvirt/libvirt-python.inc |  2 +-
>  recipes-extended/xen/xen-arch.inc           |  2 +-
>  recipes-extended/xen/xen.inc                | 10 +++++-----
>  5 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass
> index 303b30b..058bf64 100644
> --- a/classes/go-osarchmap.bbclass
> +++ b/classes/go-osarchmap.bbclass
> @@ -1,19 +1,19 @@
> -BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
> -BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
> +BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
> +BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
>  BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
> -HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS', True), d)}"
> -HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
> -HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH', True),
> d.getVar('TUNE_FEATURES', True), d)}"
> +HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
> +HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
> +HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
>  HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
> -TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
> -TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
> -TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True),
> d.getVar('TUNE_FEATURES', True), d)}"
> +TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
> +TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
> +TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
>  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','
> bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
>
>  python() {
>      if d.getVar('TARGET_GOARCH') == 'INVALID':
> -        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture'
> % d.getVar('TARGET_ARCH', True))
> +        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture'
> % d.getVar('TARGET_ARCH'))
>  }
>
>  def go_map_arch(a, d):
> diff --git a/recipes-devtools/go-cross/go-cross.inc
> b/recipes-devtools/go-cross/go-cross.inc
> index 3174987..0859fd0 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -17,7 +17,7 @@ export GOROOT_FINAL = "${libdir}/go"
>  export CGO_ENABLED = "1"
>  export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
>  export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
> -CC = "${@d.getVar('BUILD_CC', True).strip()}"
> +CC = "${@d.getVar('BUILD_CC').strip()}"
>
>  do_configure[noexec] = "1"
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index bc2f1de..15aa804 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -32,7 +32,7 @@ LIBVIRT_INSTALL_ARGS = "--root=${D} \
>      --install-data=${datadir}"
>
>  python __anonymous () {
> -    pkgconfig = d.getVar('PACKAGECONFIG', True)
> +    pkgconfig = d.getVar('PACKAGECONFIG')
>      if ('python') in pkgconfig.split():
>          d.setVar('LIBVIRT_PYTHON_ENABLE', '1')
>      else:
> diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-
> arch.inc
> index 844d47d..fb0093e 100644
> --- a/recipes-extended/xen/xen-arch.inc
> +++ b/recipes-extended/xen/xen-arch.inc
> @@ -6,7 +6,7 @@ valid_xen_archs = " \
>
>  def map_xen_arch(a, d):
>      import re
> -    valid_archs = d.getVar('valid_xen_archs', True).split()
> +    valid_archs = d.getVar('valid_xen_archs').split()
>
>      if   re.match("i.86", a):        return "x86_32"
>      elif re.match("x86.64", a):      return "x86_64"
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 429a05a..bc62a5a 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -739,12 +739,12 @@ export STAGING_INCDIR
>  export STAGING_LIBDIR
>
>  # specify xen hypervisor to build/target
> -export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH', True),
> d)}"
> -export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH', True),
> d)}"
> +export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH'), d)}"
> +export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH'), d)}"
>
>  python () {
> -    if d.getVar('XEN_TARGET_ARCH', True) == 'INVALID':
> -        raise bb.parse.SkipPackage('Cannot map `%s` to a xen
> architecture' % d.getVar('TARGET_ARCH', True))
> +    if d.getVar('XEN_TARGET_ARCH') == 'INVALID':
> +        raise bb.parse.SkipPackage('Cannot map `%s` to a xen
> architecture' % d.getVar('TARGET_ARCH'))
>  }
>
>  # Yocto appends ${PN} to libexecdir by default and Xen appends 'xen' as
> well
> @@ -804,7 +804,7 @@ EXTRA_OEMAKE += "GIT=/bin/false"
>
>  # check for XSM in package config to allow XSM_ENABLE to be set
>  python () {
> -    pkgconfig = d.getVar('PACKAGECONFIG', True)
> +    pkgconfig = d.getVar('PACKAGECONFIG')
>      if ('xsm') in pkgconfig.split():
>          d.setVar('XSM_ENABLED', '1')
>      else:
> --
> 2.1.4
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

--001a114884b2926edd0545325724
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged to master.<div><br></div><div>Bruce</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Jan 1, 2017 a=
t 5:21 PM, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mailto:paul@paulbar=
ker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">getVar() now defaults to expanding by defau=
lt.<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pau=
l@paulbarker.me.uk</a>&gt;<br>
---<br>
=C2=A0classes/go-osarchmap.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 18 +++++++++---------<br>
=C2=A0recipes-devtools/go-cross/go-<wbr>cross.inc=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0recipes-extended/libvirt/<wbr>libvirt-python.inc |=C2=A0 2 +-<br>
=C2=A0recipes-extended/xen/xen-arch.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A05 files changed, 17 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass<br=
>
index 303b30b..058bf64 100644<br>
--- a/classes/go-osarchmap.bbclass<br>
+++ b/classes/go-osarchmap.bbclass<br>
@@ -1,19 +1,19 @@<br>
-BUILD_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;BUILD_<wbr>OS&#39;, True),=
 d)}&quot;<br>
-BUILD_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;<wbr>BUILD_ARCH&#39;, =
True), d)}&quot;<br>
+BUILD_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;BUILD_<wbr>OS&#39;), d)}&q=
uot;<br>
+BUILD_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;<wbr>BUILD_ARCH&#39;),=
 d)}&quot;<br>
=C2=A0BUILD_GOTUPLE =3D &quot;${BUILD_GOOS}_${BUILD_GOARCH}<wbr>&quot;<br>
-HOST_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;HOST_<wbr>OS&#39;, True), d=
)}&quot;<br>
-HOST_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;<wbr>HOST_ARCH&#39;, Tr=
ue), d)}&quot;<br>
-HOST_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;HOST_<wbr>ARCH&#39;, True=
), d.getVar(&#39;TUNE_FEATURES&#39;, True), d)}&quot;<br>
+HOST_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;HOST_<wbr>OS&#39;), d)}&quo=
t;<br>
+HOST_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;<wbr>HOST_ARCH&#39;), d=
)}&quot;<br>
+HOST_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;HOST_<wbr>ARCH&#39;), d.g=
etVar(&#39;TUNE_FEATURES&#39;), d)}&quot;<br>
=C2=A0HOST_GOTUPLE =3D &quot;${HOST_GOOS}_${HOST_GOARCH}&quot;<br>
-TARGET_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;<wbr>TARGET_OS&#39;, True=
), d)}&quot;<br>
-TARGET_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;<wbr>TARGET_ARCH&#39;=
, True), d)}&quot;<br>
-TARGET_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;<wbr>TARGET_ARCH&#39;, =
True), d.getVar(&#39;TUNE_FEATURES&#39;, True), d)}&quot;<br>
+TARGET_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;<wbr>TARGET_OS&#39;), d)}=
&quot;<br>
+TARGET_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;<wbr>TARGET_ARCH&#39;=
), d)}&quot;<br>
+TARGET_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;<wbr>TARGET_ARCH&#39;),=
 d.getVar(&#39;TUNE_FEATURES&#39;), d)}&quot;<br>
=C2=A0TARGET_GOTUPLE =3D &quot;${TARGET_GOOS}_${TARGET_<wbr>GOARCH}&quot;<b=
r>
=C2=A0GO_BUILD_BINDIR =3D &quot;${@[&#39;bin/${HOST_GOTUPLE}&#39;,&#39;<wbr=
>bin&#39;][d.getVar(&#39;BUILD_GOTUPLE&#39;<wbr>,True) =3D=3D d.getVar(&#39=
;HOST_GOTUPLE&#39;,True)]<wbr>}&quot;<br>
<br>
=C2=A0python() {<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;TARGET_GOARCH&#39;) =3D=3D &#39;INVALI=
D&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&#39;Cannot map `%s=
` to a go architecture&#39; % d.getVar(&#39;TARGET_ARCH&#39;, True))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&#39;Cannot map `%s=
` to a go architecture&#39; % d.getVar(&#39;TARGET_ARCH&#39;))<br>
=C2=A0}<br>
<br>
=C2=A0def go_map_arch(a, d):<br>
diff --git a/recipes-devtools/go-cross/<wbr>go-cross.inc b/recipes-devtools=
/go-cross/<wbr>go-cross.inc<br>
index 3174987..0859fd0 100644<br>
--- a/recipes-devtools/go-cross/<wbr>go-cross.inc<br>
+++ b/recipes-devtools/go-cross/<wbr>go-cross.inc<br>
@@ -17,7 +17,7 @@ export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
=C2=A0export CGO_ENABLED =3D &quot;1&quot;<br>
=C2=A0export CC_FOR_TARGET=3D&quot;${TARGET_<wbr>PREFIX}gcc ${TARGET_CC_ARC=
H} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0export CXX_FOR_TARGET=3D&quot;${TARGET_<wbr>PREFIX}g++ ${TARGET_CC_AR=
CH} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
-CC =3D &quot;${@d.getVar(&#39;BUILD_CC&#39;, True).strip()}&quot;<br>
+CC =3D &quot;${@d.getVar(&#39;BUILD_CC&#39;).<wbr>strip()}&quot;<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
<br>
diff --git a/recipes-extended/libvirt/<wbr>libvirt-python.inc b/recipes-ext=
ended/libvirt/<wbr>libvirt-python.inc<br>
index bc2f1de..15aa804 100644<br>
--- a/recipes-extended/libvirt/<wbr>libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/<wbr>libvirt-python.inc<br>
@@ -32,7 +32,7 @@ LIBVIRT_INSTALL_ARGS =3D &quot;--root=3D${D} \<br>
=C2=A0 =C2=A0 =C2=A0--install-data=3D${datadir}&quot;<br>
<br>
=C2=A0python __anonymous () {<br>
-=C2=A0 =C2=A0 pkgconfig =3D d.getVar(&#39;PACKAGECONFIG&#39;, True)<br>
+=C2=A0 =C2=A0 pkgconfig =3D d.getVar(&#39;PACKAGECONFIG&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if (&#39;python&#39;) in pkgconfig.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;LIBVIRT_PYTHON_<wbr>ENABLE&=
#39;, &#39;1&#39;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
diff --git a/recipes-extended/xen/xen-<wbr>arch.inc b/recipes-extended/xen/=
xen-<wbr>arch.inc<br>
index 844d47d..fb0093e 100644<br>
--- a/recipes-extended/xen/xen-<wbr>arch.inc<br>
+++ b/recipes-extended/xen/xen-<wbr>arch.inc<br>
@@ -6,7 +6,7 @@ valid_xen_archs =3D &quot; \<br>
<br>
=C2=A0def map_xen_arch(a, d):<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
-=C2=A0 =C2=A0 valid_archs =3D d.getVar(&#39;valid_xen_archs&#39;, True).sp=
lit()<br>
+=C2=A0 =C2=A0 valid_archs =3D d.getVar(&#39;valid_xen_archs&#39;).<wbr>spl=
it()<br>
<br>
=C2=A0 =C2=A0 =C2=A0if=C2=A0 =C2=A0re.match(&quot;i.86&quot;, a):=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return &quot;x86_32&quot;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&quot;x86.64&quot;, a):=C2=A0 =C2=A0 =C2=
=A0 return &quot;x86_64&quot;<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 429a05a..bc62a5a 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -739,12 +739,12 @@ export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
<br>
=C2=A0# specify xen hypervisor to build/target<br>
-export XEN_TARGET_ARCH =3D &quot;${@map_xen_arch(d.getVar(&#39;<wbr>TARGET=
_ARCH&#39;, True), d)}&quot;<br>
-export XEN_COMPILE_ARCH =3D &quot;${@map_xen_arch(d.getVar(&#39;<wbr>BUILD=
_ARCH&#39;, True), d)}&quot;<br>
+export XEN_TARGET_ARCH =3D &quot;${@map_xen_arch(d.getVar(&#39;<wbr>TARGET=
_ARCH&#39;), d)}&quot;<br>
+export XEN_COMPILE_ARCH =3D &quot;${@map_xen_arch(d.getVar(&#39;<wbr>BUILD=
_ARCH&#39;), d)}&quot;<br>
<br>
=C2=A0python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;XEN_TARGET_ARCH&#39;, True) =3D=3D &#39;INV=
ALID&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&#39;Cannot map `%s=
` to a xen architecture&#39; % d.getVar(&#39;TARGET_ARCH&#39;, True))<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;XEN_TARGET_ARCH&#39;) =3D=3D &#39;INVALID&#=
39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&#39;Cannot map `%s=
` to a xen architecture&#39; % d.getVar(&#39;TARGET_ARCH&#39;))<br>
=C2=A0}<br>
<br>
=C2=A0# Yocto appends ${PN} to libexecdir by default and Xen appends &#39;x=
en&#39; as well<br>
@@ -804,7 +804,7 @@ EXTRA_OEMAKE +=3D &quot;GIT=3D/bin/false&quot;<br>
<br>
=C2=A0# check for XSM in package config to allow XSM_ENABLE to be set<br>
=C2=A0python () {<br>
-=C2=A0 =C2=A0 pkgconfig =3D d.getVar(&#39;PACKAGECONFIG&#39;, True)<br>
+=C2=A0 =C2=A0 pkgconfig =3D d.getVar(&#39;PACKAGECONFIG&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if (&#39;xsm&#39;) in pkgconfig.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;XSM_ENABLED&#39;, &#39;1&#3=
9;)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
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

--001a114884b2926edd0545325724--
