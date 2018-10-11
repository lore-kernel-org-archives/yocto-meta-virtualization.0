Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 417A3E00A9B; Thu, 11 Oct 2018 11:39:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 360E0E0090C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:39:23 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id v6-v6so9129751ljc.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IWpZUeerBvPFID1DhKYaczvv81KaCSghb1TG8JSNem4=;
	b=fOMMOHKvd95My4tlqeucyuMV33L77LCcT1Cro+bF5oUiuH/MP+1zdyYffHNMC1mkRA
	Kv1EzsyJ9vwTU55If6F/y2SleIFM8zeRu6xo3HPwLs1rJz+nXU3mVE7jFo/rCeTqu9BD
	/6KKCHJ4ZxTIfvyK2YqDArzf2uem/wWQymIXV5zHY6yDyszR+OXz4jHbOdaM9lJqvO2b
	FJX/29Q04Hc4N2KvLjaCrHcu48akzneRg1cIpuI8kpXLNWx4OmNkWh/CfRFnXuPRhP29
	C//2bDG/tnhpZGuQekIYetZgrJzGAzVP5e8RW0cWgi1CwTyx4tpX5Y7ss+Ihgyxv+Li4
	StCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IWpZUeerBvPFID1DhKYaczvv81KaCSghb1TG8JSNem4=;
	b=LiV70uM+HwFu5rTKG5jSuHzPBo4SY+VgVtNhO8hVuMFo02EuhxqIJ0mRnZgqkoeuvB
	HXIzwLcIkFr436L1hT1/cw9RUP6wa8Lo9GsxMQ/sBj4yVgLnUapMLk6xuVDf435yOolr
	m6TO7e/zKeLkqZEzYZk7ZZVZhjJn39iW1SApkpgejI2eh1lZJOO//wn9SsbGk3SjK7xq
	EdG8KhQkP6ax3YUPR+gg2gZ9V+qLJp49geEMXsFa/ir9EYi1z9OR++B7EFtmieIyU/BF
	eHnO3o4CQtVWb9DW9f7/4gdsOroJ0E0EJmEMHpP82lUjIPGF6pESmrUYVn6vzaAGTNyS
	jhVA==
X-Gm-Message-State: ABuFfogBCIK2uXitNZK1zG70w6fFgOf9EVKwiYJzm9frD3wY2yafw1Ey
	hmvIWlugQ5PTZ+FphIh/fs0fl+zNx7aXxspPH7sdfg==
X-Google-Smtp-Source: ACcGV63dOs6Gq/Kc/Fby3JdVHV4tJ3aejlveNBf1LVGzvsFa0FgrphQ894g0SoCHD73KSuDzf2vRNUKjK1T4RTSUuI4=
X-Received: by 2002:a2e:8589:: with SMTP id
	b9-v6mr1999108lji.122.1539283162129; 
	Thu, 11 Oct 2018 11:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <1539270939-18200-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1539270939-18200-1-git-send-email-cjp256@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:39:08 -0400
Message-ID: <CADkTA4NwBnU2AKvitOjAqe3RWPb3TWfo_-ipVBwX57k8AxX+kg@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] iasl: remove iasl in favor of acpica in openembedded-core
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
X-List-Received-Date: Thu, 11 Oct 2018 18:39:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Thu, Oct 11, 2018 at 11:15 AM Chris Patterson <cjp256@gmail.com> wrote:
>
> From: Chris Patterson <pattersonc@ainfosec.com>
>
> It is out of date, causes compilation errors, and is replacable
> with acpica.  This commit removes the iasl recipe as well
> as updating references within seabios and xen, even though
> acpcica PROVIDES iasl.
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  .../iasl/iasl/Make-CC-definition-conditional.patch |  29 -----
>  recipes-extended/iasl/iasl/iasl.1                  | 135 ---------------------
>  recipes-extended/iasl/iasl_20160527.bb             |  36 ------
>  recipes-extended/seabios/seabios_1.11.2.bb         |   2 +-
>  recipes-extended/xen/xen.inc                       |   2 +-
>  5 files changed, 2 insertions(+), 202 deletions(-)
>  delete mode 100644 recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
>  delete mode 100644 recipes-extended/iasl/iasl/iasl.1
>  delete mode 100644 recipes-extended/iasl/iasl_20160527.bb
>
> diff --git a/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
> deleted file mode 100644
> index f69a36c..0000000
> --- a/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -[PATCH] Make CC definition conditional
> -
> -Upstream-Status: pending
> -
> -By hardcoding CC's definition to gcc, make this packages unable to
> -cross-compile. the -e options of make can not override the CC since
> -it is not defined in Makefile, but in Makefile.config
> -
> -Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ----
> - generate/unix/Makefile.config | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
> -index 8d41399..72d597d 100644
> ---- a/generate/unix/Makefile.config
> -+++ b/generate/unix/Makefile.config
> -@@ -35,7 +35,7 @@
> - .SUFFIXES :
> - PROGS = acpibin acpidump acpiexamples acpiexec acpihelp acpinames acpisrc acpixtract iasl
> - HOST ?= _CYGWIN
> --CC =    gcc
> -+CC ?=    gcc
> -
> - #
> - # Common defines
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/iasl/iasl/iasl.1 b/recipes-extended/iasl/iasl/iasl.1
> deleted file mode 100644
> index 000a3b8..0000000
> --- a/recipes-extended/iasl/iasl/iasl.1
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -.\" First parameter, NAME, should be all caps
> -.\" Second parameter, SECTION, should be 1-8, maybe w/ subsection
> -.\" other parameters are allowed: see man(7), man(1)
> -.TH IASL 1 "October 14, 2005"
> -.\" Please adjust this date whenever revising the manpage.
> -.\"
> -.\" Some roff macros, for reference:
> -.\" .nh        disable hyphenation
> -.\" .hy        enable hyphenation
> -.\" .ad l      left justify
> -.\" .ad b      justify to both left and right margins
> -.\" .nf        disable filling
> -.\" .fi        enable filling
> -.\" .br        insert line break
> -.\" .sp <n>    insert n+1 empty lines
> -.\" for manpage-specific macros, see man(7)
> -.SH NAME
> -iasl \- ACPI Source Language compiler/decompiler
> -.SH SYNOPSIS
> -.B iasl
> -.RI [ options ]
> -.RI [ "input file" ]
> -.SH DESCRIPTION
> -This manual page documents briefly the
> -.B iasl
> -command. The option list is taken from the iasl interactive help.
> -.PP
> -.\" TeX users may be more comfortable with the \fB<whatever>\fP and
> -.\" \fI<whatever>\fP escape sequences to invode bold face and italics,
> -.\" respectively.
> -.B iasl
> -is an ASL compiler and decompiler.
> -
> -.SH OPTIONS
> -
> -.PP
> -.SS General Output
> -.TP
> -.B \-p <prefix>
> -Specify filename prefix for all output files (including .aml)
> -.TP
> -.B \-vi
> -Less verbose errors and warnings for use with IDEs
> -.TP
> -.B \-vo
> -Enable optimization comments
> -.TP
> -.B \-vr
> -Disable remarks
> -.TP
> -.B \-vs
> -Disable signon
> -
> -.PP
> -.SS AML Output Files
> -.TP
> -.B \-s<a|c>
> -Create AML in assembler or C source file (*.asm or *.c)
> -.TP
> -.B \-i<a|c>
> -Create assembler or C include file (*.inc or *.h)
> -.TP
> -.B \-t<a|c>
> -Create AML in assembler or C hex table (*.hex)
> -
> -.PP
> -.SS AML Code Generation
> -.TP
> -.B \-oa
> -Disable all optimizations (compatibility mode)
> -.TP
> -.B \-of
> -Disable constant folding
> -.TP
> -.B \-oi
> -Disable integer optimization to Zero/One/Ones
> -.TP
> -.B \-on
> -Disable named reference string optimization
> -.TP
> -.B \-r<Revision>
> -Override table header Revision (1-255)
> -
> -.PP
> -.SS Listings
> -.TP
> -.B \-l
> -Create mixed listing file (ASL source and AML) (*.lst)
> -.TP
> -.B \-ln
> -Create namespace file (*.nsp)
> -.TP
> -.B \-ls
> -Create combined source file (expanded includes) (*.src)
> -
> -.PP
> -.SS AML Disassembler
> -.TP
> -.B \-d  [file]
> -Disassemble AML to ASL source code file (*.dsl)
> -.TP
> -.B \-dc [file]
> -Disassemble AML and immediately compile it
> -.br
> -(Obtain DSDT from current system if no input file)
> -.TP
> -.B \-e
> -Generate External() statements for unresolved symbols
> -.TP
> -.B \-g
> -Get ACPI tables and write to files (*.dat)
> -
> -.PP
> -.SS Miscellaneous
> -.TP
> -.B \-a
> -Verify source file is entirely ASCII text (0x00-0x7F)
> -
> -.PP
> -.SS Help
> -.TP
> -.B \-h
> -Additional help and compiler debug options
> -.TP
> -.B \-hc
> -Display operators allowed in constant expressions
> -.TP
> -.B \-hr
> -Display ACPI reserved method names
> -
> -.SH AUTHOR
> -iasl was written by Robert Moore <robert.moore@intel.com>.
> -.PP
> -This manual page was written by Mattia Dongili <malattia@debian.org>,
> -for the Debian project (but may be used by others).
> diff --git a/recipes-extended/iasl/iasl_20160527.bb b/recipes-extended/iasl/iasl_20160527.bb
> deleted file mode 100644
> index 62e83c4..0000000
> --- a/recipes-extended/iasl/iasl_20160527.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY = "Intel ASL compiler/decompiler"
> -DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
> -HOMEPAGE = "http://www.acpica.org/"
> -LICENSE = "Intel-ACPI"
> -LIC_FILES_CHKSUM = "file://source/compiler/aslcompiler.h;beginline=7;endline=114;md5=09f82edcd148ab4c8aa554bc3e9d0676"
> -SECTION = "console/tools"
> -
> -DEPENDS = "bison-native flex-native"
> -
> -SRC_URI = "https://www.acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz \
> -           file://iasl.1 \
> -           file://Make-CC-definition-conditional.patch \
> -"
> -
> -SRC_URI[md5sum] = "be677fc358de9dadc036e1ea678a101b"
> -SRC_URI[sha256sum] = "6b681732624de1eb58b2bcf1c7ef0744ba14ed35fcaa534d4421574782fbb848"
> -
> -S = "${WORKDIR}/acpica-unix-${PV}/"
> -
> -BBCLASSEXTEND = "native"
> -CFLAGS += "-D_LINUX -DACPI_ASL_COMPILER -I../include -I../compiler"
> -
> -COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
> -
> -# By setting NOOPT we suppress forcing -O2 and setting _FORTIFY_SOURCE=2.  Let the
> -# optimization and security cflags set them.
> -#
> -do_compile() {
> -        oe_runmake iasl NOOPT=TRUE NOFORTIFY=TRUE
> -}
> -
> -do_install() {
> -       install -d ${D}${bindir} ${D}${mandir}/man1
> -       install -m 0755 ${S}/generate/unix/bin/iasl ${D}${bindir}
> -       install -m 0644 ${WORKDIR}/iasl.1 ${D}${mandir}/man1
> -}
> diff --git a/recipes-extended/seabios/seabios_1.11.2.bb b/recipes-extended/seabios/seabios_1.11.2.bb
> index 4ea9eb7..81eaec9 100644
> --- a/recipes-extended/seabios/seabios_1.11.2.bb
> +++ b/recipes-extended/seabios/seabios_1.11.2.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "73e73c8e406d97265782f6c942b3c1d178ed4f4afc9f381b22336c3968
>
>  FILES_${PN} = "/usr/share/firmware"
>
> -DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
> +DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native acpica-native python-native"
>
>  TUNE_CCARGS = ""
>  EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 365f71d..7efc8df 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -30,7 +30,7 @@ DEPENDS = " \
>      flex-native \
>      file-native \
>      gettext-native \
> -    iasl-native \
> +    acpica-native \
>      ncurses-native \
>      util-linux-native \
>      xz-native \
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

