Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21E5DE00C1A; Thu, 31 Aug 2017 12:24:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.47 listed in dnsbl.sorbs.net]
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCF0DE00B53
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Aug 2017 12:24:39 -0700 (PDT)
Received: by mail-vk0-f47.google.com with SMTP id x85so1570930vkx.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Aug 2017 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OfvcY24TZINJVEimZUU+r2iNhkzNui3sa/1sFAL6unc=;
	b=WmxlDeAfHsXEbSmcMLn23/gssAiCFnB+D9GNLmzJnBhNv43mdFNnULVxw3QCngzSqE
	LBN0NfuzlFDvavoyLAUNvIwhFIOweHbwRlGHfLmX3zYtO51H6Zbd/7j7Iao9P7qF0/D7
	VwtusH/O01IJV9yc5MkR4AJFmepB8cmoYXomdc0mPKTLWbzo5f2G6ZNtVxfOmipHMM29
	3lsZ4Mfpana7eURIr76FcadzVOGN6BtwdF1nMsgZ9nQKPYLjutpkdpBMYX2TUCjf4lYu
	4P+6VGDT/WPNgeQJl73UcEa6iUIiRIEh2t1NBVClO36SE+X8uzoSAMSjmRK3+1/U/7+0
	tFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OfvcY24TZINJVEimZUU+r2iNhkzNui3sa/1sFAL6unc=;
	b=jtRdxq82s4gT8F7UlOmNjUBRXHH3D/Sg+3WXW4O+H4UfAkQGII1rYkS3HtGjUnoEoV
	goAYKhBUDDj4SUKrsqIqHueYiABeoCBE6enQeTaQWhQeb1IE5Ybso321wGiJBWjpyiR1
	G/hKHoFhgjdHSFb6sPgpHcP3m8EDCQ2rdxLm5EJxMjin6mjb0QzcuQ/WGdcq+321iWNi
	SGugCHBBZr7wh5VjxtL1zcOpCDKlJ/BVsgpxw2T1HiA1uCGc7+ukdcMV9lsc63BwIkyY
	lxJ6arGFUZAh2adlhuRT7wGeOoIhMBi0mJC7FmmIUtuSvlL0btwaiNCm+Gf+azM5GLrv
	pRnw==
X-Gm-Message-State: AHYfb5hpEFXA77VGJGTJz5aUO4th/muzrDmP/D2RtQ6t/1xBHm1hv4hq
	OYERhXPz7/Pmr476arWqY3tWRn1PYQ==
X-Google-Smtp-Source: ADKCNb74+AgjSe5gy+B94QjWroPVV9C/mWU+TrFPspmXvNzTvy87fO7SEFZKTE5mB+YvLTRrdFjqlbXtUuIW57W+Wr4=
X-Received: by 10.31.226.69 with SMTP id z66mr3906947vkg.79.1504207478690;
	Thu, 31 Aug 2017 12:24:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 31 Aug 2017 12:24:37 -0700 (PDT)
In-Reply-To: <1504079755-13075-1-git-send-email-jianchuan.wang@windriver.com>
References: <1504079755-13075-1-git-send-email-jianchuan.wang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Aug 2017 15:24:37 -0400
Message-ID: <CADkTA4OZtPHTTCY_WH0sioHcPEe=6_=WEJj9YCvugtdJcx4sLQ@mail.gmail.com>
To: jianchuan.wang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: Correct the installation directory for python modules
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
X-List-Received-Date: Thu, 31 Aug 2017 19:24:42 -0000
Content-Type: multipart/alternative; boundary="001a114def946f99790558119856"

--001a114def946f99790558119856
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Aug 30, 2017 at 3:55 AM, <jianchuan.wang@windriver.com> wrote:

> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb                |  2 ++
>  ...t-the-installation-directory-for-python-m.patch | 29
> ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 849a832..2df203e 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git
> \
>             file://0001-criu-Fix-toolchain-hardcode.patch \
>             file://0002-criu-Skip-documentation-install.patch \
>             file://0001-criu-Change-libraries-install-directory.patch \
> +           file://0001-criu-Correct-the-installation-directory-for-python-m.patch
> \
>             ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '',
> 'file://disable-selinux.patch', d)} \
>             file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
> \
>            "
> @@ -43,6 +44,7 @@ EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
>
>  EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir}
> INCLUDEDIR=${includedir} PIEGEN=no"
>  EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir}
> SYSTEMDUNITDIR=${systemd_unitdir}"
> +EXTRA_OEMAKE_append += "PYTHON_SITEPACKAGES_DIR=${
> PYTHON_SITEPACKAGES_DIR}"
>
>  CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
>
> diff --git a/recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch b/recipes-containers/criu/
> files/0001-criu-Correct-the-installation-directory-for-python-m.patch
> new file mode 100644
> index 0000000..0439b3c
> --- /dev/null
> +++ b/recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch
> @@ -0,0 +1,29 @@
> +From 29865b7e9288a60aca151df323ee89c0952e8158 Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Thu, 3 Nov 2016 01:33:57 -0400
> +Subject: [PATCH] criu: Correct the installation directory for python
> module
> + distributions
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + lib/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/Makefile b/lib/Makefile
> +index f1c0821..c3003a5 100644
> +--- a/lib/Makefile
> ++++ b/lib/Makefile
> +@@ -55,8 +55,8 @@ install: lib-c lib-py ../crit/crit c/criu.pc.in
> +       $(Q) mkdir -p $(DESTDIR)$(LIBDIR)/pkgconfig
> +       $(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),'
> -e 's,@includedir@,$(dir $(INCLUDEDIR)),' c/criu.pc.in > c/criu.pc
> +       $(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
> +-      $(E) "  INSTALL " crit
> +-      $(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR)
> --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES)
> ++      $(E) "  INSTALL " crit
> ++      $(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR)
> --prefix=$(PREFIX) --install-lib=$(PYTHON_SITEPACKAGES_DIR) --record
> $(CRIT_SETUP_FILES)
> + .PHONY: install
> +
> + uninstall:
> +--
> +2.8.1
> +
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

--001a114def946f99790558119856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 30, 2017 at 3:55 AM,=
  <span dir=3D"ltr">&lt;<a href=3D"mailto:jianchuan.wang@windriver.com" tar=
get=3D"_blank">jianchuan.wang@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">From: Jianchuan Wang &lt;<a href=3D"mailto:jianchu=
an.wang@windriver.com">jianchuan.wang@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windrive=
r.com">jianchuan.wang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0...t-the-installation-<wbr>directory-for-python-m.patch | 29 ++++++++=
++++++++++++++<br>
=C2=A02 files changed, 31 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/criu/files/<wbr>0001-criu-Corre=
ct-the-<wbr>installation-directory-for-<wbr>python-m.patch<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu<wbr>_git.bb</a> b/recipes-containers/cri=
u/<a href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu<=
wbr>_git.bb</a><br>
index 849a832..2df203e 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu<wbr>_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu<wbr>_git.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemu=
l/criu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/=
xemul/criu.<wbr>git;protocol=3Dgit</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-criu-Fix-<wbr>toolcha=
in-hardcode.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-criu-Skip-<wbr>docume=
ntation-install.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-criu-Change-<wbr>libr=
aries-install-directory.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-Correct-the-<wbr=
>installation-directory-for-<wbr>python-m.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PA=
CKAGECONFIG&#39;, &#39;selinux&#39;, &#39;&#39;, &#39;file://disable-selinu=
x.patch&#39;<wbr>, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lib-Makefile-overwrite-<wb=
r>install-lib-to-allow-multiarc.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -43,6 +44,7 @@ EXTRA_OEMAKE_aarch64 +=3D &quot;ARCH=3Darm64 WERROR=3D0&q=
uot;<br>
<br>
=C2=A0EXTRA_OEMAKE_append +=3D &quot;SBINDIR=3D${sbindir} LIBDIR=3D${libdir=
} INCLUDEDIR=3D${includedir} PIEGEN=3Dno&quot;<br>
=C2=A0EXTRA_OEMAKE_append +=3D &quot;LOGROTATEDIR=3D${sysconfdir} SYSTEMDUN=
ITDIR=3D${systemd_<wbr>unitdir}&quot;<br>
+EXTRA_OEMAKE_append +=3D &quot;PYTHON_SITEPACKAGES_DIR=3D${<wbr>PYTHON_SIT=
EPACKAGES_DIR}&quot;<br>
<br>
=C2=A0CFLAGS +=3D &quot;-D__USE_GNU -D_GNU_SOURCE &quot;<br>
<br>
diff --git a/recipes-containers/criu/<wbr>files/0001-criu-Correct-the-<wbr>=
installation-directory-for-<wbr>python-m.patch b/recipes-containers/criu/<w=
br>files/0001-criu-Correct-the-<wbr>installation-directory-for-<wbr>python-=
m.patch<br>
new file mode 100644<br>
index 0000000..0439b3c<br>
--- /dev/null<br>
+++ b/recipes-containers/criu/<wbr>files/0001-criu-Correct-the-<wbr>install=
ation-directory-for-<wbr>python-m.patch<br>
@@ -0,0 +1,29 @@<br>
+From 29865b7e9288a60aca151df323ee89<wbr>c0952e8158 Mon Sep 17 00:00:00 200=
1<br>
+From: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windriver.com">j=
ianchuan.wang@windriver.com</a>&gt;<br>
+Date: Thu, 3 Nov 2016 01:33:57 -0400<br>
+Subject: [PATCH] criu: Correct the installation directory for python modul=
e<br>
+ distributions<br>
+<br>
+Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windriv=
er.com">jianchuan.wang@windriver.com</a>&gt;<br>
+---<br>
+ lib/Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/Makefile b/lib/Makefile<br>
+index f1c0821..c3003a5 100644<br>
+--- a/lib/Makefile<br>
++++ b/lib/Makefile<br>
+@@ -55,8 +55,8 @@ install: lib-c lib-py ../crit/crit c/<a href=3D"http://c=
riu.pc.in" rel=3D"noreferrer" target=3D"_blank">criu.pc.in</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) mkdir -p $(DESTDIR)$(LIBDIR)/pkgconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) sed -e &#39;s,@version@,$(CRIU_VERSION),&#=
39; -e &#39;s,@libdir@,$(LIBDIR),&#39; -e &#39;s,@includedir@,$(dir $(INCLU=
DEDIR)),&#39; c/<a href=3D"http://criu.pc.in" rel=3D"noreferrer" target=3D"=
_blank">criu.pc.in</a> &gt; c/criu.pc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDI=
R)/pkgconfig<br>
+-=C2=A0 =C2=A0 =C2=A0 $(E) &quot;=C2=A0 INSTALL &quot; crit<br>
+-=C2=A0 =C2=A0 =C2=A0 $(Q) python ../scripts/crit-setup.py install --root=
=3D$(DESTDIR) --prefix=3D$(PREFIX) --record $(CRIT_SETUP_FILES)<br>
++=C2=A0 =C2=A0 =C2=A0 $(E) &quot;=C2=A0 INSTALL &quot; crit<br>
++=C2=A0 =C2=A0 =C2=A0 $(Q) python ../scripts/crit-setup.py install --root=
=3D$(DESTDIR) --prefix=3D$(PREFIX) --install-lib=3D$(PYTHON_<wbr>SITEPACKAG=
ES_DIR) --record $(CRIT_SETUP_FILES)<br>
+ .PHONY: install<br>
+<br>
+ uninstall:<br>
+--<br>
+2.8.1<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a114def946f99790558119856--
