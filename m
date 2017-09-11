Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51ECCE00C44; Sun, 10 Sep 2017 19:36:34 -0700 (PDT)
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
	*      [209.85.213.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D28B1E00C01
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Sep 2017 19:36:32 -0700 (PDT)
Received: by mail-vk0-f48.google.com with SMTP id x85so8441196vkx.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Sep 2017 19:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4rKO3HyRcbVCEizd3lhuleJuzZCuC9W/vgsD/c2fftM=;
	b=os0flm9G2gJRKIJAEKQQ9ASHsTgH0aRzDC4NBuAJ6GaXwugYbdPUxe6t7Fv+bRZDKq
	ff0OKOechqdD/y1za5iPqxXBnyvz5AUBteYA7aA8E3qd80551nBmNq3YqSbqtj+unZVp
	PJbfET88W5xZJ/0YQSqI28jIIKOrHW5FedZoMADaTPWB9t9TsbcTX965zb3x33U85iK0
	XKFg/0rfI/Qj/lCaibAoGEbsRQUB5prQKq0/DldYKkxHnLGNykNe0tU4BowH/IEG47nu
	+IgpyWWqk2vFJJWPTaC5575pAMLlhwQ2HsrNZEBuw7kkMGPqrM6ZXjWeYGqXpby7/teN
	aqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4rKO3HyRcbVCEizd3lhuleJuzZCuC9W/vgsD/c2fftM=;
	b=P4ah9brGhYRfrtwx79xynzCaq21i9zMc7iqlFPEhVwNsnp/KfUCknfUm/h1yaJWI5D
	U4Cq6mlIMvARVFyhVRG3GgIqX5b1yPLKEbXP1YK/F+0Jt4xchA1WuCnPmp4vI9bNFlfs
	3Ditv5NizpnJjTxjX0XyE7wBYHybxlT7NzzaXSs0BrAVoCYBWLUaapDP5il6UFdHtIgU
	nuXGmxYoM83jhHLnuCcD3UOHJo/sUhKHeZrmsz9eBVABFRRK1gOvH66/0XTwkVrjsa3a
	e7xM9pMl/LPqxlq6R928d2rcmag4y19tbq7SoatfPHSfblpIRiqvYjdGPL8IungIxSJL
	W2Rw==
X-Gm-Message-State: AHPjjUiot6nqezDlMKC6DQs1zHG1+tsPUW9ol0HWVYtIpqJLL6qZYLDC
	1s5GxPLW9wMFlv2ht0+KrYx1CY00FQ==
X-Google-Smtp-Source: AOwi7QBDAb2c0zk8/NvuQlnE7oVWJnJHcYR+Ld2gRiWcKrSjnm0iOenAxa5WkVW6WBjXQNOftHiwcbnieLZGSw8FrPc=
X-Received: by 10.31.69.129 with SMTP id s123mr6190123vka.188.1505097391709;
	Sun, 10 Sep 2017 19:36:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Sun, 10 Sep 2017 19:36:31 -0700 (PDT)
In-Reply-To: <CAPuovE+1JDWEFLE2cegQ3DZq67ViPJdQp5Tv4jP-FytBG7tSyA@mail.gmail.com>
References: <1504079755-13075-1-git-send-email-jianchuan.wang@windriver.com>
	<CADkTA4OZtPHTTCY_WH0sioHcPEe=6_=WEJj9YCvugtdJcx4sLQ@mail.gmail.com>
	<CAPuovE+1JDWEFLE2cegQ3DZq67ViPJdQp5Tv4jP-FytBG7tSyA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Sep 2017 22:36:31 -0400
Message-ID: <CADkTA4P2z8tbEPjisiy4PQ-dHW6MHxDH02-iwARemxtT=jMbSg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
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
X-List-Received-Date: Mon, 11 Sep 2017 02:36:34 -0000
Content-Type: multipart/alternative; boundary="001a114da5c462a3e30558e0cbe3"

--001a114da5c462a3e30558e0cbe3
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 2:17 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Thu, Aug 31, 2017 at 3:24 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > merged
>
>
> Bruce,
>
> Can you please revert this change? This will cause a patch failure for
> the criu package as there is already a change which addresses this
> issue (see commit d3c6004e92bf21f7f2b425d062b6276ff53c8c18 -- criu:
> force python to install in ${libdir}).
>
> Unfortunately Jianchuan's commit log for the commit and the patch
> itself provide no information on what is being fixed. The obvious
> patch conflict leads me to believe this was not actually tested with
> the existing fix.
>

Agreed. This is now reverted and your uprev pushed.

Bruce


>
> Thanks,
> Mark
>
>
> >
> > Bruce
> >
> > On Wed, Aug 30, 2017 at 3:55 AM, <jianchuan.wang@windriver.com> wrote:
> >>
> >> From: Jianchuan Wang <jianchuan.wang@windriver.com>
> >>
> >> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> >> ---
> >>  recipes-containers/criu/criu_git.bb                |  2 ++
> >>  ...t-the-installation-directory-for-python-m.patch | 29
> >> ++++++++++++++++++++++
> >>  2 files changed, 31 insertions(+)
> >>  create mode 100644
> >> recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch
> >>
> >> diff --git a/recipes-containers/criu/criu_git.bb
> >> b/recipes-containers/criu/criu_git.bb
> >> index 849a832..2df203e 100644
> >> --- a/recipes-containers/criu/criu_git.bb
> >> +++ b/recipes-containers/criu/criu_git.bb
> >> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.
> git;protocol=git
> >> \
> >>             file://0001-criu-Fix-toolchain-hardcode.patch \
> >>             file://0002-criu-Skip-documentation-install.patch \
> >>             file://0001-criu-Change-libraries-install-directory.patch \
> >> +
> >> file://0001-criu-Correct-the-installation-directory-for-python-m.patch
> \
> >>             ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '',
> >> 'file://disable-selinux.patch', d)} \
> >>
> >> file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> >>            "
> >> @@ -43,6 +44,7 @@ EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
> >>
> >>  EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir}
> >> INCLUDEDIR=${includedir} PIEGEN=no"
> >>  EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir}
> >> SYSTEMDUNITDIR=${systemd_unitdir}"
> >> +EXTRA_OEMAKE_append +=
> >> "PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}"
> >>
> >>  CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
> >>
> >> diff --git
> >> a/recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch
> >> b/recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch
> >> new file mode 100644
> >> index 0000000..0439b3c
> >> --- /dev/null
> >> +++
> >> b/recipes-containers/criu/files/0001-criu-Correct-the-
> installation-directory-for-python-m.patch
> >> @@ -0,0 +1,29 @@
> >> +From 29865b7e9288a60aca151df323ee89c0952e8158 Mon Sep 17 00:00:00 2001
> >> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> >> +Date: Thu, 3 Nov 2016 01:33:57 -0400
> >> +Subject: [PATCH] criu: Correct the installation directory for python
> >> module
> >> + distributions
> >> +
> >> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> >> +---
> >> + lib/Makefile | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/lib/Makefile b/lib/Makefile
> >> +index f1c0821..c3003a5 100644
> >> +--- a/lib/Makefile
> >> ++++ b/lib/Makefile
> >> +@@ -55,8 +55,8 @@ install: lib-c lib-py ../crit/crit c/criu.pc.in
> >> +       $(Q) mkdir -p $(DESTDIR)$(LIBDIR)/pkgconfig
> >> +       $(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e
> >> 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)),'
> >> c/criu.pc.in > c/criu.pc
> >> +       $(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
> >> +-      $(E) "  INSTALL " crit
> >> +-      $(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR)
> >> --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES)
> >> ++      $(E) "  INSTALL " crit
> >> ++      $(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR)
> >> --prefix=$(PREFIX) --install-lib=$(PYTHON_SITEPACKAGES_DIR) --record
> >> $(CRIT_SETUP_FILES)
> >> + .PHONY: install
> >> +
> >> + uninstall:
> >> +--
> >> +2.8.1
> >> +
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at
> > its end"
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114da5c462a3e30558e0cbe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Sep 8, 2017 at 2:17 PM, Mark Asselstine <span dir=3D"ltr">&lt;<=
a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asse=
lstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On Thu, Aug 31, 2017 at 3:24 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt; merged<br>
<br>
<br>
Bruce,<br>
<br>
Can you please revert this change? This will cause a patch failure for<br>
the criu package as there is already a change which addresses this<br>
issue (see commit d3c6004e92bf21f7f2b425d062b627<wbr>6ff53c8c18 -- criu:<br=
>
force python to install in ${libdir}).<br>
<br>
Unfortunately Jianchuan&#39;s commit log for the commit and the patch<br>
itself provide no information on what is being fixed. The obvious<br>
patch conflict leads me to believe this was not actually tested with<br>
the existing fix.<br></blockquote><div><br></div><div>Agreed. This is now r=
everted and your uprev pushed.</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Mark<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; On Wed, Aug 30, 2017 at 3:55 AM, &lt;<a href=3D"mailto:jianchuan.wang@=
windriver.com">jianchuan.wang@windriver.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windrive=
r.com">jianchuan.wang@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang=
@windriver.com">jianchuan.wang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=
=3D"noreferrer" target=3D"_blank">criu_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;&gt;=C2=A0 ...t-the-installation-<wbr>directory-for-python-m.patch | 29=
<br>
&gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 2 files changed, 31 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; recipes-containers/criu/files/<wbr>0001-criu-Correct-the-<wbr>inst=
allation-directory-for-<wbr>python-m.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb=
" rel=3D"noreferrer" target=3D"_blank">criu<wbr>_git.bb</a><br>
&gt;&gt; b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"no=
referrer" target=3D"_blank">criu<wbr>_git.bb</a><br>
&gt;&gt; index 849a832..2df203e 100644<br>
&gt;&gt; --- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=
=3D"noreferrer" target=3D"_blank">criu<wbr>_git.bb</a><br>
&gt;&gt; +++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=
=3D"noreferrer" target=3D"_blank">criu<wbr>_git.bb</a><br>
&gt;&gt; @@ -21,6 +21,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github=
.com/xemul/criu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/xemul/criu.<wbr>git;protocol=3Dgit</a><br>
&gt;&gt; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-Fi=
x-<wbr>toolchain-hardcode.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-criu-Sk=
ip-<wbr>documentation-install.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-Ch=
ange-<wbr>libraries-install-directory.<wbr>patch \<br>
&gt;&gt; +<br>
&gt;&gt; file://0001-criu-Correct-the-<wbr>installation-directory-for-<wbr>=
python-m.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contain=
s(&#39;<wbr>PACKAGECONFIG&#39;, &#39;selinux&#39;, &#39;&#39;,<br>
&gt;&gt; &#39;file://disable-selinux.patch&#39;<wbr>, d)} \<br>
&gt;&gt;<br>
&gt;&gt; file://lib-Makefile-overwrite-<wbr>install-lib-to-allow-multiarc.<=
wbr>patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; @@ -43,6 +44,7 @@ EXTRA_OEMAKE_aarch64 +=3D &quot;ARCH=3Darm64 WER=
ROR=3D0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 EXTRA_OEMAKE_append +=3D &quot;SBINDIR=3D${sbindir} LIBDIR=
=3D${libdir}<br>
&gt;&gt; INCLUDEDIR=3D${includedir} PIEGEN=3Dno&quot;<br>
&gt;&gt;=C2=A0 EXTRA_OEMAKE_append +=3D &quot;LOGROTATEDIR=3D${sysconfdir}<=
br>
&gt;&gt; SYSTEMDUNITDIR=3D${systemd_<wbr>unitdir}&quot;<br>
&gt;&gt; +EXTRA_OEMAKE_append +=3D<br>
&gt;&gt; &quot;PYTHON_SITEPACKAGES_DIR=3D${<wbr>PYTHON_SITEPACKAGES_DIR}&qu=
ot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 CFLAGS +=3D &quot;-D__USE_GNU -D_GNU_SOURCE &quot;<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/recipes-containers/criu/<wbr>files/0001-criu-Correct-the-<wbr>in=
stallation-directory-for-<wbr>python-m.patch<br>
&gt;&gt; b/recipes-containers/criu/<wbr>files/0001-criu-Correct-the-<wbr>in=
stallation-directory-for-<wbr>python-m.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..0439b3c<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/recipes-containers/criu/<wbr>files/0001-criu-Correct-the-<wbr>in=
stallation-directory-for-<wbr>python-m.patch<br>
&gt;&gt; @@ -0,0 +1,29 @@<br>
&gt;&gt; +From 29865b7e9288a60aca151df323ee89<wbr>c0952e8158 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; +From: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windriv=
er.com">jianchuan.wang@windriver.com</a>&gt;<br>
&gt;&gt; +Date: Thu, 3 Nov 2016 01:33:57 -0400<br>
&gt;&gt; +Subject: [PATCH] criu: Correct the installation directory for pyt=
hon<br>
&gt;&gt; module<br>
&gt;&gt; + distributions<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wan=
g@windriver.com">jianchuan.wang@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + lib/Makefile | 4 ++--<br>
&gt;&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/lib/Makefile b/lib/Makefile<br>
&gt;&gt; +index f1c0821..c3003a5 100644<br>
&gt;&gt; +--- a/lib/Makefile<br>
&gt;&gt; ++++ b/lib/Makefile<br>
&gt;&gt; +@@ -55,8 +55,8 @@ install: lib-c lib-py ../crit/crit c/<a href=3D=
"http://criu.pc.in" rel=3D"noreferrer" target=3D"_blank">criu.pc.in</a><br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) mkdir -p $(DESTDIR)$(LIBDIR)/pkgc=
onfig<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) sed -e &#39;s,@version@,$(CRIU_VE=
RSION),&#39; -e<br>
&gt;&gt; &#39;s,@libdir@,$(LIBDIR),&#39; -e &#39;s,@includedir@,$(dir $(INC=
LUDEDIR)),&#39;<br>
&gt;&gt; c/<a href=3D"http://criu.pc.in" rel=3D"noreferrer" target=3D"_blan=
k">criu.pc.in</a> &gt; c/criu.pc<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q) install -m 644 c/criu.pc $(DESTDI=
R)$(LIBDIR)/pkgconfig<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $(E) &quot;=C2=A0 INSTALL &quot; crit<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $(Q) python ../scripts/crit-setup.py instal=
l --root=3D$(DESTDIR)<br>
&gt;&gt; --prefix=3D$(PREFIX) --record $(CRIT_SETUP_FILES)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $(E) &quot;=C2=A0 INSTALL &quot; crit<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $(Q) python ../scripts/crit-setup.py instal=
l --root=3D$(DESTDIR)<br>
&gt;&gt; --prefix=3D$(PREFIX) --install-lib=3D$(PYTHON_<wbr>SITEPACKAGES_DI=
R) --record<br>
&gt;&gt; $(CRIT_SETUP_FILES)<br>
&gt;&gt; + .PHONY: install<br>
&gt;&gt; +<br>
&gt;&gt; + uninstall:<br>
&gt;&gt; +--<br>
&gt;&gt; +2.8.1<br>
&gt;&gt; +<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@<wbr>yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>=
org/listinfo/meta-<wbr>virtualization</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at<br>
&gt; its end&quot;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a114da5c462a3e30558e0cbe3--
