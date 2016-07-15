Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F376E00F56; Fri, 15 Jul 2016 08:03:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88E99E00F4F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jul 2016 08:03:26 -0700 (PDT)
Received: by mail-qt0-f171.google.com with SMTP id j35so60767060qtj.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jul 2016 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5arfz2yJuRdbjEfI0HkJMMwTOF5361CqriL5K+ZFv1w=;
	b=nGZbXxmDiMm0Im6CVL7cV+d0Q25wsYSAkrwcdsQ00JIjR7I/H5YRVhMrfbhVnPMQ6q
	TlPxf386uQU85D1RyTUop+Xx4HF397st4ODE3Ak2pD7frR37ctaiOoVvFP0FDbZRH1AE
	gsXBKBIakmUcVyi/EKl+jZDGAhYEM8LXsOI9MmzoWvi3DZJbeH0m8oiP2NuIxPVw4j7s
	SXYKzwUdAvkawdXi6l8AsKR1+dV8tJHBUHGCUxGOupPmrE1NcHHXUmUWemxduoCeRBwP
	cvIPF6EksZgO5FbeI26q6NJRvNd+dMGgd1NUPzC7Dc9PER72kHa9hS+TkmWkV/MeQe42
	SZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5arfz2yJuRdbjEfI0HkJMMwTOF5361CqriL5K+ZFv1w=;
	b=UPuopUevzyjWkjsW99hhcwWm02kBlECl5OsO45kt3M7cJHNZhp2AugMFdu5t+4b1bY
	uK6HDQz9UyIgFGCzKNQTvV7RWJ5FQoGCPIJmbTJO8qq4A2v0hxN6fOdtcFTcrXuEXJSC
	SFIabujBD4oBBuQ05cLKm2h82U4HW2NO3olpfcxba3DmkhQ84p4OFYFkGRMoWH9NvH2A
	FcmOFFLpTzh/xEZN18s3vWvmGLiS8NvGZjfYO1Q9MkUa70S3znsETO1q6LpXUXbw9a21
	0mrc4JNS9zivykGymitfK3v5sNdujdMVdXC3a/PcPWHK0p87c+P4U98dIaC841GqelKF
	WBrA==
X-Gm-Message-State: ALyK8tItHZ5UZhIF3SPyguPScnOiKqglTcFUPbPUgyGTDEp9G6oUnghs9yNQO9tLbjB1NxSWjx75TBdEWi3YNw==
X-Received: by 10.200.48.112 with SMTP id g45mr30777099qte.70.1468595005501;
	Fri, 15 Jul 2016 08:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Fri, 15 Jul 2016 08:03:24 -0700 (PDT)
In-Reply-To: <1468489707-21131-1-git-send-email-mingli.yu@windriver.com>
References: <1468489707-21131-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Jul 2016 11:03:24 -0400
Message-ID: <CADkTA4NWjAVW-=ypJv_46bXRKArim1jMTOpgC07ULXVsCF1CGA@mail.gmail.com>
To: mingli.yu@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2] iasl: Upgrade to 20160527 from 20120215
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
X-List-Received-Date: Fri, 15 Jul 2016 15:03:28 -0000
Content-Type: multipart/alternative; boundary=001a1143c9c49f38610537adebea

--001a1143c9c49f38610537adebea
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Jul 14, 2016 at 5:48 AM, <mingli.yu@windriver.com> wrote:

> * Upgrade iasl from 20120215 to 20160527
> * Fix the dependency as it actually depends on
>   bison-native and flex-native
> * Remove hardcode PR to let PR server handle
>   the version
> * Add (x86_64.*|i.86.*)-linux to COMPATIBLE_HOST
> * Add patch Make-CC-definition-conditional.patch
>   to make CC definition conditional as it makes
>   the package unable to cross-compile when hardcode
>   CC's definition previously.
> * Add iasl command manual file as iasl.1
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../iasl/iasl/Make-CC-definition-conditional.patch |  29 +++++
>  recipes-extended/iasl/iasl/iasl.1                  | 135
> +++++++++++++++++++++
>  .../iasl/{iasl_20120215.bb => iasl_20160527.bb}    |  33 +++--
>  3 files changed, 184 insertions(+), 13 deletions(-)
>  create mode 100644
> recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
>  create mode 100644 recipes-extended/iasl/iasl/iasl.1
>  rename recipes-extended/iasl/{iasl_20120215.bb => iasl_20160527.bb} (23%)
>
> diff --git
> a/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
> b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
> new file mode 100644
> index 0000000..f69a36c
> --- /dev/null
> +++ b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
> @@ -0,0 +1,29 @@
> +[PATCH] Make CC definition conditional
> +
> +Upstream-Status: pending
> +
> +By hardcoding CC's definition to gcc, make this packages unable to
> +cross-compile. the -e options of make can not override the CC since
> +it is not defined in Makefile, but in Makefile.config
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + generate/unix/Makefile.config | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
> +index 8d41399..72d597d 100644
> +--- a/generate/unix/Makefile.config
> ++++ b/generate/unix/Makefile.config
> +@@ -35,7 +35,7 @@
> + .SUFFIXES :
> + PROGS = acpibin acpidump acpiexamples acpiexec acpihelp acpinames
> acpisrc acpixtract iasl
> + HOST ?= _CYGWIN
> +-CC =    gcc
> ++CC ?=    gcc
> +
> + #
> + # Common defines
> +--
> +1.9.1
> +
> diff --git a/recipes-extended/iasl/iasl/iasl.1
> b/recipes-extended/iasl/iasl/iasl.1
> new file mode 100644
> index 0000000..000a3b8
> --- /dev/null
> +++ b/recipes-extended/iasl/iasl/iasl.1
> @@ -0,0 +1,135 @@
> +.\" First parameter, NAME, should be all caps
> +.\" Second parameter, SECTION, should be 1-8, maybe w/ subsection
> +.\" other parameters are allowed: see man(7), man(1)
> +.TH IASL 1 "October 14, 2005"
> +.\" Please adjust this date whenever revising the manpage.
> +.\"
> +.\" Some roff macros, for reference:
> +.\" .nh        disable hyphenation
> +.\" .hy        enable hyphenation
> +.\" .ad l      left justify
> +.\" .ad b      justify to both left and right margins
> +.\" .nf        disable filling
> +.\" .fi        enable filling
> +.\" .br        insert line break
> +.\" .sp <n>    insert n+1 empty lines
> +.\" for manpage-specific macros, see man(7)
> +.SH NAME
> +iasl \- ACPI Source Language compiler/decompiler
> +.SH SYNOPSIS
> +.B iasl
> +.RI [ options ]
> +.RI [ "input file" ]
> +.SH DESCRIPTION
> +This manual page documents briefly the
> +.B iasl
> +command. The option list is taken from the iasl interactive help.
> +.PP
> +.\" TeX users may be more comfortable with the \fB<whatever>\fP and
> +.\" \fI<whatever>\fP escape sequences to invode bold face and italics,
> +.\" respectively.
> +.B iasl
> +is an ASL compiler and decompiler.
> +
> +.SH OPTIONS
> +
> +.PP
> +.SS General Output
> +.TP
> +.B \-p <prefix>
> +Specify filename prefix for all output files (including .aml)
> +.TP
> +.B \-vi
> +Less verbose errors and warnings for use with IDEs
> +.TP
> +.B \-vo
> +Enable optimization comments
> +.TP
> +.B \-vr
> +Disable remarks
> +.TP
> +.B \-vs
> +Disable signon
> +
> +.PP
> +.SS AML Output Files
> +.TP
> +.B \-s<a|c>
> +Create AML in assembler or C source file (*.asm or *.c)
> +.TP
> +.B \-i<a|c>
> +Create assembler or C include file (*.inc or *.h)
> +.TP
> +.B \-t<a|c>
> +Create AML in assembler or C hex table (*.hex)
> +
> +.PP
> +.SS AML Code Generation
> +.TP
> +.B \-oa
> +Disable all optimizations (compatibility mode)
> +.TP
> +.B \-of
> +Disable constant folding
> +.TP
> +.B \-oi
> +Disable integer optimization to Zero/One/Ones
> +.TP
> +.B \-on
> +Disable named reference string optimization
> +.TP
> +.B \-r<Revision>
> +Override table header Revision (1-255)
> +
> +.PP
> +.SS Listings
> +.TP
> +.B \-l
> +Create mixed listing file (ASL source and AML) (*.lst)
> +.TP
> +.B \-ln
> +Create namespace file (*.nsp)
> +.TP
> +.B \-ls
> +Create combined source file (expanded includes) (*.src)
> +
> +.PP
> +.SS AML Disassembler
> +.TP
> +.B \-d  [file]
> +Disassemble AML to ASL source code file (*.dsl)
> +.TP
> +.B \-dc [file]
> +Disassemble AML and immediately compile it
> +.br
> +(Obtain DSDT from current system if no input file)
> +.TP
> +.B \-e
> +Generate External() statements for unresolved symbols
> +.TP
> +.B \-g
> +Get ACPI tables and write to files (*.dat)
> +
> +.PP
> +.SS Miscellaneous
> +.TP
> +.B \-a
> +Verify source file is entirely ASCII text (0x00-0x7F)
> +
> +.PP
> +.SS Help
> +.TP
> +.B \-h
> +Additional help and compiler debug options
> +.TP
> +.B \-hc
> +Display operators allowed in constant expressions
> +.TP
> +.B \-hr
> +Display ACPI reserved method names
> +
> +.SH AUTHOR
> +iasl was written by Robert Moore <robert.moore@intel.com>.
> +.PP
> +This manual page was written by Mattia Dongili <malattia@debian.org>,
> +for the Debian project (but may be used by others).
> diff --git a/recipes-extended/iasl/iasl_20120215.bb
> b/recipes-extended/iasl/iasl_20160527.bb
> similarity index 23%
> rename from recipes-extended/iasl/iasl_20120215.bb
> rename to recipes-extended/iasl/iasl_20160527.bb
> index 5ce0930..62e83c4 100644
> --- a/recipes-extended/iasl/iasl_20120215.bb
> +++ b/recipes-extended/iasl/iasl_20160527.bb
> @@ -1,29 +1,36 @@
> +SUMMARY = "Intel ASL compiler/decompiler"
>  DESCRIPTION = "This is a cross development C compiler, assembler and
> linker environment for the production of 8086 executables (Optionally MSDOS
> COM)"
>  HOMEPAGE = "http://www.acpica.org/"
>  LICENSE = "Intel-ACPI"
> -LIC_FILES_CHKSUM =
> "file://asldefine.h;endline=115;md5=d4d7cf809b8b5e03131327b3f718e8f0"
> +LIC_FILES_CHKSUM =
> "file://source/compiler/aslcompiler.h;beginline=7;endline=114;md5=09f82edcd148ab4c8aa554bc3e9d0676"
>  SECTION = "console/tools"
> -PR="r1"
>
> -DEPENDS="flex bison"
> +DEPENDS = "bison-native flex-native"
>
> -SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
> +SRC_URI = "
> https://www.acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz \
> +           file://iasl.1 \
> +           file://Make-CC-definition-conditional.patch \
> +"
>
> -SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
> -SRC_URI[sha256sum] =
> "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
> +SRC_URI[md5sum] = "be677fc358de9dadc036e1ea678a101b"
> +SRC_URI[sha256sum] =
> "6b681732624de1eb58b2bcf1c7ef0744ba14ed35fcaa534d4421574782fbb848"
>
> -S="${WORKDIR}/acpica-unix-${PV}/source/compiler"
> +S = "${WORKDIR}/acpica-unix-${PV}/"
>
> -NATIVE_INSTALL_WORKS = "1"
>  BBCLASSEXTEND = "native"
> +CFLAGS += "-D_LINUX -DACPI_ASL_COMPILER -I../include -I../compiler"
>
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
> +
> +# By setting NOOPT we suppress forcing -O2 and setting
> _FORTIFY_SOURCE=2.  Let the
> +# optimization and security cflags set them.
> +#
>  do_compile() {
> -       CFLAGS="-Wno-error=redundant-decls" $MAKE
> +        oe_runmake iasl NOOPT=TRUE NOFORTIFY=TRUE
>  }
>
>  do_install() {
> -       mkdir -p ${D}${prefix}/bin
> -       cp ${S}/iasl ${D}${prefix}/bin
> +       install -d ${D}${bindir} ${D}${mandir}/man1
> +       install -m 0755 ${S}/generate/unix/bin/iasl ${D}${bindir}
> +       install -m 0644 ${WORKDIR}/iasl.1 ${D}${mandir}/man1
>  }
> -
> -
> --
> 2.8.1
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

--001a1143c9c49f38610537adebea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, Jul 14, 2016 at 5:48 AM,  =
<span dir=3D"ltr">&lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"=
_blank">mingli.yu@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">* Upgrade iasl from 20120215 to 20160527<br>
* Fix the dependency as it actually depends on<br>
=C2=A0 bison-native and flex-native<br>
* Remove hardcode PR to let PR server handle<br>
=C2=A0 the version<br>
</span>* Add (x86_64.*|i.86.*)-linux to COMPATIBLE_HOST<br>
<span class=3D"">* Add patch Make-CC-definition-conditional.patch<br>
=C2=A0 to make CC definition conditional as it makes<br>
=C2=A0 the package unable to cross-compile when hardcode<br>
=C2=A0 CC&#39;s definition previously.<br>
* Add iasl command manual file as iasl.1<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com">min=
gli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../iasl/iasl/Make-CC-definition-conditional.patch |=C2=A0 29 +++++<b=
r>
=C2=A0recipes-extended/iasl/iasl/iasl.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 135 +++++++++++++++++++++<br>
</span>=C2=A0.../iasl/{<a href=3D"http://iasl_20120215.bb" rel=3D"noreferre=
r" target=3D"_blank">iasl_20120215.bb</a> =3D&gt; <a href=3D"http://iasl_20=
160527.bb" rel=3D"noreferrer" target=3D"_blank">iasl_20160527.bb</a>}=C2=A0=
 =C2=A0 |=C2=A0 33 +++--<br>
=C2=A03 files changed, 184 insertions(+), 13 deletions(-)<br>
<span class=3D"">=C2=A0create mode 100644 recipes-extended/iasl/iasl/Make-C=
C-definition-conditional.patch<br>
=C2=A0create mode 100644 recipes-extended/iasl/iasl/iasl.1<br>
</span>=C2=A0rename recipes-extended/iasl/{<a href=3D"http://iasl_20120215.=
bb" rel=3D"noreferrer" target=3D"_blank">iasl_20120215.bb</a> =3D&gt; <a hr=
ef=3D"http://iasl_20160527.bb" rel=3D"noreferrer" target=3D"_blank">iasl_20=
160527.bb</a>} (23%)<br>
<div><div class=3D"h5"><br>
diff --git a/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patc=
h b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch<br>
new file mode 100644<br>
index 0000000..f69a36c<br>
--- /dev/null<br>
+++ b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch<br>
@@ -0,0 +1,29 @@<br>
+[PATCH] Make CC definition conditional<br>
+<br>
+Upstream-Status: pending<br>
+<br>
+By hardcoding CC&#39;s definition to gcc, make this packages unable to<br>
+cross-compile. the -e options of make can not override the CC since<br>
+it is not defined in Makefile, but in Makefile.config<br>
+<br>
+Signed-off-by: Roy.Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">ron=
gqing.li@windriver.com</a>&gt;<br>
+---<br>
+ generate/unix/Makefile.config | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config=
<br>
+index 8d41399..72d597d 100644<br>
+--- a/generate/unix/Makefile.config<br>
++++ b/generate/unix/Makefile.config<br>
+@@ -35,7 +35,7 @@<br>
+ .SUFFIXES :<br>
+ PROGS =3D acpibin acpidump acpiexamples acpiexec acpihelp acpinames acpis=
rc acpixtract iasl<br>
+ HOST ?=3D _CYGWIN<br>
+-CC =3D=C2=A0 =C2=A0 gcc<br>
++CC ?=3D=C2=A0 =C2=A0 gcc<br>
+<br>
+ #<br>
+ # Common defines<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-extended/iasl/iasl/iasl.1 b/recipes-extended/iasl/iasl=
/iasl.1<br>
new file mode 100644<br>
index 0000000..000a3b8<br>
--- /dev/null<br>
+++ b/recipes-extended/iasl/iasl/iasl.1<br>
@@ -0,0 +1,135 @@<br>
+.\&quot; First parameter, NAME, should be all caps<br>
+.\&quot; Second parameter, SECTION, should be 1-8, maybe w/ subsection<br>
+.\&quot; other parameters are allowed: see man(7), man(1)<br>
+.TH IASL 1 &quot;October 14, 2005&quot;<br>
+.\&quot; Please adjust this date whenever revising the manpage.<br>
+.\&quot;<br>
+.\&quot; Some roff macros, for reference:<br>
+.\&quot; .nh=C2=A0 =C2=A0 =C2=A0 =C2=A0 disable hyphenation<br>
+.\&quot; .hy=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable hyphenation<br>
+.\&quot; .ad l=C2=A0 =C2=A0 =C2=A0 left justify<br>
+.\&quot; .ad b=C2=A0 =C2=A0 =C2=A0 justify to both left and right margins<=
br>
+.\&quot; .nf=C2=A0 =C2=A0 =C2=A0 =C2=A0 disable filling<br>
+.\&quot; .fi=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable filling<br>
+.\&quot; .br=C2=A0 =C2=A0 =C2=A0 =C2=A0 insert line break<br>
+.\&quot; .sp &lt;n&gt;=C2=A0 =C2=A0 insert n+1 empty lines<br>
+.\&quot; for manpage-specific macros, see man(7)<br>
+.SH NAME<br>
+iasl \- ACPI Source Language compiler/decompiler<br>
+.SH SYNOPSIS<br>
+.B iasl<br>
+.RI [ options ]<br>
+.RI [ &quot;input file&quot; ]<br>
+.SH DESCRIPTION<br>
+This manual page documents briefly the<br>
+.B iasl<br>
+command. The option list is taken from the iasl interactive help.<br>
+.PP<br>
+.\&quot; TeX users may be more comfortable with the \fB&lt;whatever&gt;\fP=
 and<br>
+.\&quot; \fI&lt;whatever&gt;\fP escape sequences to invode bold face and i=
talics,<br>
+.\&quot; respectively.<br>
+.B iasl<br>
+is an ASL compiler and decompiler.<br>
+<br>
+.SH OPTIONS<br>
+<br>
+.PP<br>
+.SS General Output<br>
+.TP<br>
+.B \-p &lt;prefix&gt;<br>
+Specify filename prefix for all output files (including .aml)<br>
+.TP<br>
+.B \-vi<br>
+Less verbose errors and warnings for use with IDEs<br>
+.TP<br>
+.B \-vo<br>
+Enable optimization comments<br>
+.TP<br>
+.B \-vr<br>
+Disable remarks<br>
+.TP<br>
+.B \-vs<br>
+Disable signon<br>
+<br>
+.PP<br>
+.SS AML Output Files<br>
+.TP<br>
+.B \-s&lt;a|c&gt;<br>
+Create AML in assembler or C source file (*.asm or *.c)<br>
+.TP<br>
+.B \-i&lt;a|c&gt;<br>
+Create assembler or C include file (*.inc or *.h)<br>
+.TP<br>
+.B \-t&lt;a|c&gt;<br>
+Create AML in assembler or C hex table (*.hex)<br>
+<br>
+.PP<br>
+.SS AML Code Generation<br>
+.TP<br>
+.B \-oa<br>
+Disable all optimizations (compatibility mode)<br>
+.TP<br>
+.B \-of<br>
+Disable constant folding<br>
+.TP<br>
+.B \-oi<br>
+Disable integer optimization to Zero/One/Ones<br>
+.TP<br>
+.B \-on<br>
+Disable named reference string optimization<br>
+.TP<br>
+.B \-r&lt;Revision&gt;<br>
+Override table header Revision (1-255)<br>
+<br>
+.PP<br>
+.SS Listings<br>
+.TP<br>
+.B \-l<br>
+Create mixed listing file (ASL source and AML) (*.lst)<br>
+.TP<br>
+.B \-ln<br>
+Create namespace file (*.nsp)<br>
+.TP<br>
+.B \-ls<br>
+Create combined source file (expanded includes) (*.src)<br>
+<br>
+.PP<br>
+.SS AML Disassembler<br>
+.TP<br>
+.B \-d=C2=A0 [file]<br>
+Disassemble AML to ASL source code file (*.dsl)<br>
+.TP<br>
+.B \-dc [file]<br>
+Disassemble AML and immediately compile it<br>
+.br<br>
+(Obtain DSDT from current system if no input file)<br>
+.TP<br>
+.B \-e<br>
+Generate External() statements for unresolved symbols<br>
+.TP<br>
+.B \-g<br>
+Get ACPI tables and write to files (*.dat)<br>
+<br>
+.PP<br>
+.SS Miscellaneous<br>
+.TP<br>
+.B \-a<br>
+Verify source file is entirely ASCII text (0x00-0x7F)<br>
+<br>
+.PP<br>
+.SS Help<br>
+.TP<br>
+.B \-h<br>
+Additional help and compiler debug options<br>
+.TP<br>
+.B \-hc<br>
+Display operators allowed in constant expressions<br>
+.TP<br>
+.B \-hr<br>
+Display ACPI reserved method names<br>
+<br>
+.SH AUTHOR<br>
+iasl was written by Robert Moore &lt;<a href=3D"mailto:robert.moore@intel.=
com">robert.moore@intel.com</a>&gt;.<br>
+.PP<br>
+This manual page was written by Mattia Dongili &lt;<a href=3D"mailto:malat=
tia@debian.org">malattia@debian.org</a>&gt;,<br>
+for the Debian project (but may be used by others).<br>
</div></div>diff --git a/recipes-extended/iasl/<a href=3D"http://iasl_20120=
215.bb" rel=3D"noreferrer" target=3D"_blank">iasl_20120215.bb</a> b/recipes=
-extended/iasl/<a href=3D"http://iasl_20160527.bb" rel=3D"noreferrer" targe=
t=3D"_blank">iasl_20160527.bb</a><br>
similarity index 23%<br>
rename from recipes-extended/iasl/<a href=3D"http://iasl_20120215.bb" rel=
=3D"noreferrer" target=3D"_blank">iasl_20120215.bb</a><br>
rename to recipes-extended/iasl/<a href=3D"http://iasl_20160527.bb" rel=3D"=
noreferrer" target=3D"_blank">iasl_20160527.bb</a><br>
index 5ce0930..62e83c4 100644<br>
--- a/recipes-extended/iasl/<a href=3D"http://iasl_20120215.bb" rel=3D"nore=
ferrer" target=3D"_blank">iasl_20120215.bb</a><br>
+++ b/recipes-extended/iasl/<a href=3D"http://iasl_20160527.bb" rel=3D"nore=
ferrer" target=3D"_blank">iasl_20160527.bb</a><br>
@@ -1,29 +1,36 @@<br>
<span class=3D"">+SUMMARY =3D &quot;Intel ASL compiler/decompiler&quot;<br>
</span><span class=3D"">=C2=A0DESCRIPTION =3D &quot;This is a cross develop=
ment C compiler, assembler and linker environment for the production of 808=
6 executables (Optionally MSDOS COM)&quot;<br>
</span>=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.acpica.org/" rel=3D"n=
oreferrer" target=3D"_blank">http://www.acpica.org/</a>&quot;<br>
<span class=3D"">=C2=A0LICENSE =3D &quot;Intel-ACPI&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://asldefine.h;endline=3D115;md5=3Dd4d7cf80=
9b8b5e03131327b3f718e8f0&quot;<br>
</span><span class=3D"">+LIC_FILES_CHKSUM =3D &quot;file://source/compiler/=
aslcompiler.h;beginline=3D7;endline=3D114;md5=3D09f82edcd148ab4c8aa554bc3e9=
d0676&quot;<br>
</span>=C2=A0SECTION =3D &quot;console/tools&quot;<br>
-PR=3D&quot;r1&quot;<br>
<br>
-DEPENDS=3D&quot;flex bison&quot;<br>
+DEPENDS =3D &quot;bison-native flex-native&quot;<br>
<span class=3D""><br>
-SRC_URI=3D&quot;<a href=3D"https://acpica.org/sites/acpica/files/acpica-un=
ix-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://acpica.org/si=
tes/acpica/files/acpica-unix-${PV}.tar.gz</a>&quot;<br>
</span><span class=3D"">+SRC_URI =3D &quot;<a href=3D"https://www.acpica.or=
g/sites/acpica/files/acpica-unix-${PV}.tar.gz" rel=3D"noreferrer" target=3D=
"_blank">https://www.acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://iasl.1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Make-CC-definition-conditi=
onal.patch \<br>
+&quot;<br>
<br>
</span><span class=3D"">-SRC_URI[md5sum] =3D &quot;324c89e5bb9002e2711e0494=
290ceacc&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456=
928e4e7da86578e5b8d&quot;<br>
</span><span class=3D"">+SRC_URI[md5sum] =3D &quot;be677fc358de9dadc036e1ea=
678a101b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6b681732624de1eb58b2bcf1c7ef0744ba14ed35fcaa5=
34d4421574782fbb848&quot;<br>
<br>
</span><span class=3D"">-S=3D&quot;${WORKDIR}/acpica-unix-${PV}/source/comp=
iler&quot;<br>
</span><span class=3D"">+S =3D &quot;${WORKDIR}/acpica-unix-${PV}/&quot;<br=
>
<br>
</span>-NATIVE_INSTALL_WORKS =3D &quot;1&quot;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<span class=3D"">+CFLAGS +=3D &quot;-D_LINUX -DACPI_ASL_COMPILER -I../inclu=
de -I../compiler&quot;<br>
<br>
</span><span class=3D"">+COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*)-linux&=
quot;<br>
+<br>
+# By setting NOOPT we suppress forcing -O2 and setting _FORTIFY_SOURCE=3D2=
.=C2=A0 Let the<br>
+# optimization and security cflags set them.<br>
+#<br>
</span>=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;-Wno-error=3Dredundant-decls&quo=
t; $MAKE<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake iasl NOOPT=3DTRUE =
NOFORTIFY=3DTRUE<br>
=C2=A0}<br>
<br>
</span><span class=3D"">=C2=A0do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${prefix}/bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/iasl ${D}${prefix}/bin<br>
</span><span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir=
} ${D}${mandir}/man1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/generate/unix/bin/iasl ${D=
}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/iasl.1 ${D}${mandir}=
/man1<br>
=C2=A0}<br>
</span>-<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--001a1143c9c49f38610537adebea--
