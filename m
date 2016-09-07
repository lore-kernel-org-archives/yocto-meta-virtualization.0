Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BFFDE010D0; Wed,  7 Sep 2016 13:08:20 -0700 (PDT)
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
	*      [209.85.216.194 listed in list.dnswl.org]
	*  2.4 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD8EFE010C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 13:08:18 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id 38so945091qte.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Sep 2016 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Z8cOEBcaJ4f0ylEDP7FbcNnlLka6cXEQImOqp0Io5I=;
	b=CpZEtLibh6m3kIgcD2gWtxBIbsEJZoqdcAIpfo82DppQro6hRgec/uOMWP+tBpbCSr
	Rrm6dNqc8ZzCS+43Mc59gUfHvvKqzelyb7FgmbjUTlhwVlPejiNLlvtP6RJHGKQ5MOf3
	aoSLCTLcYrDsqef98Qd6G7k55IgMJFFVKUKw3UyWU3ajbITYUFKXO8ulCuqs/US569az
	L3rEJB3CXmTM3yCT6UDCqBd/hReWBbsdmWEgSfUmJGmXZb+Axrze+VDOgnXX+LcqyUrf
	Bgh6Vx+MJAprDKUw9NbQq0GLzRiItp06NhqIfJA+Mkk/mNlLL5+WM0aXOpcyMv4qUUYP
	isug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Z8cOEBcaJ4f0ylEDP7FbcNnlLka6cXEQImOqp0Io5I=;
	b=NWy1kC87qzIE6Jwn+44eVeoelLC5OIM5FYgnkQh9kf/7L4hQ362W1zd6E5xsVqQSZB
	J2Y3Rac8ahz7bZywxZ6ocGKP920Z6xbUzAxo6lV7xtGyoxg2jqPIiBJUdCa4y9f5mF9v
	cerQqopef1XY3pW0XToNFpmiNxEk0NIk+YpM63uZIQzh8js9FpgjA9KIGYSchZoitJ4a
	aibAxN2YZjrPGZXalyTCj6B6+I5BVC+NL5aEHNbnLFEcYY64hlRFF8eKp5QhWu2i2JOd
	i44C2Ijq6dDDLbip9EdUOQTpBODjxi4JoPA7k9qPH4+edzKhfduEuEul/5kYpKnUf+j/
	TaQA==
X-Gm-Message-State: AE9vXwOdFQsxEUiAJR5fJ/tz1UlJHbR3RQfD9Eb24MkO2e+R0n4eqlHoPf4EHgyC3i7yzQ/1wiUEyvBLGjiStA==
X-Received: by 10.200.41.71 with SMTP id z7mr21598999qtz.107.1473278898126;
	Wed, 07 Sep 2016 13:08:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Wed, 7 Sep 2016 13:08:17 -0700 (PDT)
In-Reply-To: <1473187900-1335-1-git-send-email-stefan@agner.ch>
References: <1473187900-1335-1-git-send-email-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Sep 2016 16:08:17 -0400
Message-ID: <CADkTA4OeMb4ACKHPjqXxU+Pwo2n-YcUjDa-TaxgMyfkhrVZCrg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] kvmtool: add lightweight hypervisor native Linux KVM tool
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
X-List-Received-Date: Wed, 07 Sep 2016 20:08:20 -0000
Content-Type: multipart/alternative; boundary=001a113f567660e12a053bf0798b

--001a113f567660e12a053bf0798b
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 6, 2016 at 2:51 PM, Stefan Agner <stefan@agner.ch> wrote:

> Add Native Linux KVM tool, a lightweight tool for hosting KVM guests
> maintained by the Linux kernel community.
>
>
A nice addition to the layer. Thanks!

merged.

Bruce


> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../kvmtool/files/external-crosscompiler.patch     | 31
> ++++++++++++++++++++++
>  recipes-extended/kvmtool/kvmtool.bb                | 23 ++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 recipes-extended/kvmtool/files/external-crosscompiler.
> patch
>  create mode 100644 recipes-extended/kvmtool/kvmtool.bb
>
> diff --git a/recipes-extended/kvmtool/files/external-crosscompiler.patch
> b/recipes-extended/kvmtool/files/external-crosscompiler.patch
> new file mode 100644
> index 0000000..75cef3b
> --- /dev/null
> +++ b/recipes-extended/kvmtool/files/external-crosscompiler.patch
> @@ -0,0 +1,31 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +This allows OpenEmbedded to pass in cross compiler configuration using
> +the default envirnment variables. It is required so that kvmtool can
> +be linked against the cross-compiled libfdt library.
> +
> +diff --git a/Makefile b/Makefile
> +index 1f0196f..8bfb068 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -14,11 +14,6 @@ export E Q
> + include config/utilities.mak
> + include config/feature-tests.mak
> +
> +-CC    := $(CROSS_COMPILE)gcc
> +-CFLAGS        :=
> +-LD    := $(CROSS_COMPILE)ld
> +-LDFLAGS       :=
> +-
> + FIND  := find
> + CSCOPE        := cscope
> + TAGS  := ctags
> +@@ -297,7 +292,7 @@ $(warning No static libc found. Skipping guest init)
> + endif
> +
> + ifeq (y,$(ARCH_WANT_LIBFDT))
> +-      ifneq ($(call try-build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y)
> ++      ifneq ($(call try-build,$(SOURCE_LIBFDT),$(CPPFLAGS)
> $(CFLAGS),-lfdt),y)
> +           $(error No libfdt found. Please install libfdt-dev package)
> +       else
> +               CFLAGS_DYNOPT   += -DCONFIG_HAS_LIBFDT
> diff --git a/recipes-extended/kvmtool/kvmtool.bb
> b/recipes-extended/kvmtool/kvmtool.bb
> new file mode 100644
> index 0000000..3f299dd
> --- /dev/null
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Native Linux KVM tool"
> +DESCRIPTION = "kvmtool is a lightweight tool for hosting KVM guests."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
> +
> +DEPENDS = "dtc libaio zlib"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git
> \
> +           file://external-crosscompiler.patch \
> +    "
> +
> +SRCREV = "0093df80d754e1a05b016e5a4ccd4b51a00c562c"
> +PV = "3.18.0+git${SRCREV}"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE='ARCH="${TARGET_ARCH}" V=1'
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/lkvm ${D}${bindir}/
> +}
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

--001a113f567660e12a053bf0798b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 6, 2016 at 2:51 PM, Stefan Agner <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Add Native Linux KVM tool, a =
lightweight tool for hosting KVM guests<br>
maintained by the Linux kernel community.<br>
<br></blockquote><div><br></div><div>A nice addition to the layer. Thanks!<=
/div><div><br></div><div>merged.</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan@agner.ch">stefan@a=
gner.ch</a>&gt;<br>
---<br>
=C2=A0.../kvmtool/files/external-<wbr>crosscompiler.patch=C2=A0 =C2=A0 =C2=
=A0| 31 ++++++++++++++++++++++<br>
=C2=A0recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"norefer=
rer" target=3D"_blank">kvmto<wbr>ol.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++++++++++++++++<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/kvmtool/<wbr>files/external-cross=
compiler.<wbr>patch<br>
=C2=A0create mode 100644 recipes-extended/kvmtool/<a href=3D"http://kvmtool=
.bb" rel=3D"noreferrer" target=3D"_blank">kvmto<wbr>ol.bb</a><br>
<br>
diff --git a/recipes-extended/kvmtool/<wbr>files/external-crosscompiler.<wb=
r>patch b/recipes-extended/kvmtool/<wbr>files/external-crosscompiler.<wbr>p=
atch<br>
new file mode 100644<br>
index 0000000..75cef3b<br>
--- /dev/null<br>
+++ b/recipes-extended/kvmtool/<wbr>files/external-crosscompiler.<wbr>patch=
<br>
@@ -0,0 +1,31 @@<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+This allows OpenEmbedded to pass in cross compiler configuration using<br>
+the default envirnment variables. It is required so that kvmtool can<br>
+be linked against the cross-compiled libfdt library.<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 1f0196f..8bfb068 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -14,11 +14,6 @@ export E Q<br>
+ include config/utilities.mak<br>
+ include config/feature-tests.mak<br>
+<br>
+-CC=C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)gcc<br>
+-CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D<br>
+-LD=C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)ld<br>
+-LDFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D<br>
+-<br>
+ FIND=C2=A0 :=3D find<br>
+ CSCOPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D cscope<br>
+ TAGS=C2=A0 :=3D ctags<br>
+@@ -297,7 +292,7 @@ $(warning No static libc found. Skipping guest init)<b=
r>
+ endif<br>
+<br>
+ ifeq (y,$(ARCH_WANT_LIBFDT))<br>
+-=C2=A0 =C2=A0 =C2=A0 ifneq ($(call try-build,$(SOURCE_LIBFDT),$(<wbr>CFLA=
GS),-lfdt),y)<br>
++=C2=A0 =C2=A0 =C2=A0 ifneq ($(call try-build,$(SOURCE_LIBFDT),$(<wbr>CPPF=
LAGS) $(CFLAGS),-lfdt),y)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(error No libfdt found. Please i=
nstall libfdt-dev package)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS_DYNOPT=C2=A0=
 =C2=A0+=3D -DCONFIG_HAS_LIBFDT<br>
diff --git a/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"=
noreferrer" target=3D"_blank">kvm<wbr>tool.bb</a> b/recipes-extended/kvmtoo=
l/<a href=3D"http://kvmtool.bb" rel=3D"noreferrer" target=3D"_blank">kvm<wb=
r>tool.bb</a><br>
new file mode 100644<br>
index 0000000..3f299dd<br>
--- /dev/null<br>
+++ b/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"norefer=
rer" target=3D"_blank">kvm<wbr>tool.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Native Linux KVM tool&quot;<br>
+DESCRIPTION =3D &quot;kvmtool is a lightweight tool for hosting KVM guests=
.&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>fcb02dc552a041dee27e4=
b85c73960<wbr>67&quot;<br>
+<br>
+DEPENDS =3D &quot;dtc libaio zlib&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linux/ker=
nel/git/will/kvmtool.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.o=
rg/pub/scm/<wbr>linux/kernel/git/will/kvmtool.<wbr>git</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://external-crosscompiler.<wb=
r>patch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+SRCREV =3D &quot;<wbr>0093df80d754e1a05b016e5a4ccd4b<wbr>51a00c562c&quot;<=
br>
+PV =3D &quot;3.18.0+git${SRCREV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+EXTRA_OEMAKE=3D&#39;ARCH=3D&quot;${TARGET_<wbr>ARCH}&quot; V=3D1&#39;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 install -m 0755 ${S}/lkvm ${D}${bindir}/<br>
+}<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a113f567660e12a053bf0798b--
