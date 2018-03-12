Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D5C0E00EFB; Mon, 12 Mar 2018 11:12:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7737E00A54
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Mar 2018 11:12:41 -0700 (PDT)
Received: by mail-it0-f46.google.com with SMTP id n136so12332899itg.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Mar 2018 11:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tUoDTiCWhLL+5TJHVujekz7sZvDm5ECalYCmKIZnnEA=;
	b=aHlIiNsKSqPE0xHHRrPhvKQua6e28LP2MWqorOI1dP+pnYEwVhhS6/8YX0tnW1egaD
	dipOeY6/bPSOiDQ/cbiBHVPjyO7nlMUMCzgNTAczm3uYzvUFhi2P2esWXZQxAqJLmHZa
	zjRCBIxlS12JQvgt+p3nFlBlhvJV6HByzk1vqw6yL2j6Pa6PgMt2b/9g1YE1ufYtpNxC
	jvpOLklfLrvbvq5yKaYWCwb8xxYAxA3F3gWvw0+nsKHUDDXJdjBscG+AqjCiJQKtRkCn
	B87077iDTq+ASg2mNLh8qQnji/3VibF1RBcUAdkcEtkNQ+kDiRh/TPg6EFaOrcwc270H
	3Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tUoDTiCWhLL+5TJHVujekz7sZvDm5ECalYCmKIZnnEA=;
	b=tcGctsQK4wOlDhBmfC1gpV9SDAKoaKi7Ws88m1lZBIL0QXhxWvkgSK93E6S9soUQIQ
	ZBnWs3E4W0bhF8+/ZCeQi0/s+tkiBIeNDI31uz71cf+/Bwxr7ssedwCCrfiLwe7EN3Je
	cvEiQVEIbS7fYE0f8a7z9TaDxglUtIQwg8nPvyM/ebkYj0H3fg1tsYQ6XRF9Ct3swDZb
	3XIdnSe2GwH8HFpUKQPmhAiNuns6Ylx4/LXrTnKYEzbOM0pZuExc3/5oTGV9thdQzqLI
	w2Hylj+kT7bSP6Is05w+vQ2dJdtaMY/F3nEkJPQkCw8/25c1rA1uYzQGB3sbRM3kJRoH
	qkuQ==
X-Gm-Message-State: AElRT7EbnYTbihUr+UhhaxsxipogI/6cHVQaUVMDcbxx1G6WK1rgIHYC
	QBIkIssqzetpBd7yB4WmgJ1dW8XK6MiK6xBLZkKSGZRPxY39R9JiscVriLKisxFB5CsHAAWtSWq
	MiKFUxF7e6eb9yVGITd2WlrA5Y2dz76DRo1gPzPrAbs/C
X-Google-Smtp-Source: AG47ELsTsXbd/deoa5MDDECiUGjMU/4Rs+jhE7U494cy6WL6RYfgw9KPnAT5XzZjQi6p92qIwfnIoHsVUdiIuxbLCtA=
X-Received: by 10.36.163.193 with SMTP id p184mr10454497ite.9.1520878360586;
	Mon, 12 Mar 2018 11:12:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.147.86 with HTTP; Mon, 12 Mar 2018 11:12:40 -0700 (PDT)
In-Reply-To: <78ccf336-eec3-356d-4cd3-da7f37a48b63@mvista.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<2c6f6e8ead9e8a7d00a42a009bdce3bf3731759e.1519915283.git.kurt.bodiker@braintrust-us.com>
	<CADkTA4O=yPBsrPS5sTS_=qWtRjefKSHACqqdNwp=CNmMAp_sUw@mail.gmail.com>
	<78ccf336-eec3-356d-4cd3-da7f37a48b63@mvista.com>
From: "Bodiker, Kurt" <kurt.bodiker@braintrust-us.com>
Date: Mon, 12 Mar 2018 14:12:40 -0400
Message-ID: <CAGfCXKHqAO0-FaWL98w8LFr4-HLjhfWXhVeEjm8vdufb4kH4pw@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 3/7] xen: Newlib recipe and patches for Xen stubdoms
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
X-List-Received-Date: Mon, 12 Mar 2018 18:12:45 -0000
Content-Type: multipart/alternative; boundary="94eb2c1125346df75c05673b1612"

--94eb2c1125346df75c05673b1612
Content-Type: text/plain; charset="UTF-8"

The Xen source tree is hardcoded to pull old versions of the necessary
dependencies for building various stubdomains. Stubdomains have not been
tested using any newer versions of this or any other dependency. I suppose
that is work for us to do once the initial baseline for vTPMs has been set.

Kurt

On Thu, Mar 8, 2018 at 7:37 PM, akuster <akuster@mvista.com> wrote:

>
>
> On 03/08/2018 01:05 PM, Bruce Ashfield wrote:
> > On Mon, Mar 5, 2018 at 10:35 AM, Kurt Bodiker
> > <kurt.bodiker@braintrust-us.com> wrote:
> >> From: kebodiker <kurt.bodiker@braintrust-us.com>
> >>
> >> Newlib provides a fast, C library optimized for embedded systems. In the
> >> case of Xen stubdomains, we are using MiniOS. This Newlib recipe creates
> >> static libraries that are cross-compiled against MiniOS, Xen, and LWIP
> >> headers and subsequently used during the cross-compilation and linking
> >> of PolarSSL, the stubdom specific GMP, TPM Emulator, and the Xen vTPM
> >> and vTPM Manager stubdomains.
> >>
> >> The current Xen source code is hardcoded to fetch a specific version of
> >> this package.  The patch files originate from the Xen/stubdom source
> >> tree. This recipe provides the flexibility to change version or modify
> >> the patches.
> >>
> >> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> >> ---
> >>  recipes-extended/xen/files/newlib-chk.patch        | 155 +++++
> >>  .../newlib-stdint-size_max-fix-from-1.17.0.patch   |  16 +
> >>  recipes-extended/xen/files/newlib.patch            | 727
> +++++++++++++++++++++
> >>  recipes-extended/xen/newlib.inc                    |  64 ++
> >>  recipes-extended/xen/newlib_1.16.0.bb              |  19 +
> >>  5 files changed, 981 insertions(+)
> >>  create mode 100644 recipes-extended/xen/files/newlib-chk.patch
> >>  create mode 100644 recipes-extended/xen/files/
> newlib-stdint-size_max-fix-from-1.17.0.patch
> >>  create mode 100644 recipes-extended/xen/files/newlib.patch
> >>  create mode 100644 recipes-extended/xen/newlib.inc
> >>  create mode 100644 recipes-extended/xen/newlib_1.16.0.bb
> >>
> >> diff --git a/recipes-extended/xen/files/newlib-chk.patch
> b/recipes-extended/xen/files/newlib-chk.patch
> >> new file mode 100644
> >> index 0000000..848dbd5
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/files/newlib-chk.patch
> >> @@ -0,0 +1,155 @@
> >> +--- newlib/libc/stdio/fprintf_chk.c    1969-12-31 19:00:00.000000000
> -0500
> >> ++++ newlib/libc/stdio/fprintf_chk.c    2009-02-26 19:02:53.000000000
> -0500
> >> +@@ -0,0 +1,21 @@
> >> ++#include <stdarg.h>
> >> ++#include <stdio.h>
> >> ++
> >> ++/*
> >> ++ * Stub implementation of __fprintf_chk adapted from glibc 2.7.  This
> >> ++ * doesn't actually implement any buffer overflow protection.  It
> just makes
> >> ++ * the linker happy :)
> >> ++*/
> >> ++int
> >> ++__fprintf_chk (FILE *fp, int flag, const char *format, ...)
> >> ++{
> >> ++  va_list ap;
> >> ++  int done;
> >> ++
> >> ++  va_start (ap, format);
> >> ++  done = vfprintf (fp, format, ap);
> >> ++  va_end (ap);
> >> ++
> >> ++  return done;
> >> ++}
> >> ++
> >> +--- newlib/libc/stdio/Makefile.am      2007-08-02 16:23:06.000000000
> -0400
> >> ++++ newlib/libc/stdio/Makefile.am      2009-02-26 18:14:53.000000000
> -0500
> >> +@@ -20,6 +20,7 @@
> >> +       flags.c                 \
> >> +       fopen.c                 \
> >> +       fprintf.c                       \
> >> ++      fprintf_chk.c           \
> >> +       fputc.c                 \
> >> +       fputs.c                 \
> >> +       fread.c                 \
> >> +@@ -65,6 +66,7 @@
> >> +       sniprintf.c                     \
> >> +       snprintf.c                      \
> >> +       sprintf.c                       \
> >> ++      sprintf_chk.c                   \
> >> +       sscanf.c                        \
> >> +       stdio.c                 \
> >> +       tmpfile.c                       \
> >> +--- newlib/libc/stdio/Makefile.in      2007-12-19 17:36:38.000000000
> -0500
> >> ++++ newlib/libc/stdio/Makefile.in      2009-02-26 18:43:52.000000000
> -0500
> >> +@@ -63,7 +63,8 @@
> >> +       lib_a-fgets.$(OBJEXT) lib_a-fileno.$(OBJEXT) \
> >> +       lib_a-findfp.$(OBJEXT) lib_a-fiprintf.$(OBJEXT) \
> >> +       lib_a-flags.$(OBJEXT) lib_a-fopen.$(OBJEXT) \
> >> +-      lib_a-fprintf.$(OBJEXT) lib_a-fputc.$(OBJEXT) \
> >> ++      lib_a-fprintf.$(OBJEXT) lib_a-fprintf_chk.$(OBJEXT) \
> >> ++      lib_a-fputc.$(OBJEXT) \
> >> +       lib_a-fputs.$(OBJEXT) lib_a-fread.$(OBJEXT) \
> >> +       lib_a-freopen.$(OBJEXT) lib_a-fscanf.$(OBJEXT) \
> >> +       lib_a-fiscanf.$(OBJEXT) lib_a-fseek.$(OBJEXT) \
> >> +@@ -86,6 +87,7 @@
> >> +       lib_a-setvbuf.$(OBJEXT) lib_a-siprintf.$(OBJEXT) \
> >> +       lib_a-siscanf.$(OBJEXT) lib_a-sniprintf.$(OBJEXT) \
> >> +       lib_a-snprintf.$(OBJEXT) lib_a-sprintf.$(OBJEXT) \
> >> ++      lib_a-sprintf_chk.$(OBJEXT) \
> >> +       lib_a-sscanf.$(OBJEXT) lib_a-stdio.$(OBJEXT) \
> >> +       lib_a-tmpfile.$(OBJEXT) lib_a-tmpnam.$(OBJEXT) \
> >> +       lib_a-ungetc.$(OBJEXT) lib_a-vdiprintf.$(OBJEXT) \
> >> +@@ -122,15 +124,15 @@
> >> + LTLIBRARIES = $(noinst_LTLIBRARIES)
> >> + am__objects_4 = clearerr.lo fclose.lo fdopen.lo feof.lo ferror.lo \
> >> +       fflush.lo fgetc.lo fgetpos.lo fgets.lo fileno.lo findfp.lo \
> >> +-      fiprintf.lo flags.lo fopen.lo fprintf.lo fputc.lo fputs.lo \
> >> +-      fread.lo freopen.lo fscanf.lo fiscanf.lo fseek.lo fsetpos.lo \
> >> ++      fiprintf.lo flags.lo fopen.lo fprintf.lo fprintf_chk.lo
> fputc.lo \
> >> ++      fputs.lo fread.lo freopen.lo fscanf.lo fiscanf.lo fseek.lo
> fsetpos.lo \
> >> +       ftell.lo fvwrite.lo fwalk.lo fwrite.lo getc.lo getchar.lo \
> >> +       getc_u.lo getchar_u.lo getdelim.lo getline.lo gets.lo \
> >> +       iprintf.lo iscanf.lo makebuf.lo perror.lo printf.lo putc.lo \
> >> +       putchar.lo putc_u.lo putchar_u.lo puts.lo refill.lo remove.lo \
> >> +       rename.lo rewind.lo rget.lo scanf.lo sccl.lo setbuf.lo \
> >> +       setbuffer.lo setlinebuf.lo setvbuf.lo siprintf.lo siscanf.lo \
> >> +-      sniprintf.lo snprintf.lo sprintf.lo sscanf.lo stdio.lo \
> >> ++      sniprintf.lo snprintf.lo sprintf.lo sprintf_chk.lo sscanf.lo
> stdio.lo \
> >> +       tmpfile.lo tmpnam.lo ungetc.lo vdiprintf.lo vdprintf.lo \
> >> +       viprintf.lo viscanf.lo vprintf.lo vscanf.lo vsiprintf.lo \
> >> +       vsiscanf.lo vsnprintf.lo vsniprintf.lo vsprintf.lo vsscanf.lo \
> >> +@@ -344,6 +346,7 @@
> >> +       flags.c                 \
> >> +       fopen.c                 \
> >> +       fprintf.c                       \
> >> ++      fprintf_chk.c                   \
> >> +       fputc.c                 \
> >> +       fputs.c                 \
> >> +       fread.c                 \
> >> +@@ -389,6 +392,7 @@
> >> +       sniprintf.c                     \
> >> +       snprintf.c                      \
> >> +       sprintf.c                       \
> >> ++      sprintf_chk.c                   \
> >> +       sscanf.c                        \
> >> +       stdio.c                 \
> >> +       tmpfile.c                       \
> >> +@@ -508,6 +512,7 @@
> >> +       siprintf.def            \
> >> +       siscanf.def             \
> >> +       sprintf.def             \
> >> ++      sprintf_chk.def         \
> >> +       sscanf.def              \
> >> +       tmpfile.def             \
> >> +       tmpnam.def              \
> >> +@@ -678,6 +683,12 @@
> >> + lib_a-fprintf.obj: fprintf.c
> >> +       $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf.obj `if test -f
> 'fprintf.c'; then $(CYGPATH_W) 'fprintf.c'; else $(CYGPATH_W)
> '$(srcdir)/fprintf.c'; fi`
> >> +
> >> ++lib_a-fprintf_chk.o: fprintf_chk.c
> >> ++      $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf_chk.o `test -f
> 'fprintf_chk.c' || echo '$(srcdir)/'`fprintf_chk.c
> >> ++
> >> ++lib_a-fprintf_chk.obj: fprintf_chk.c
> >> ++      $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf_chk.obj `if test
> -f 'fprintf_chk.c'; then $(CYGPATH_W) 'fprintf_chk.c'; else $(CYGPATH_W)
> '$(srcdir)/fprintf_chk.c'; fi`
> >> ++
> >> + lib_a-fputc.o: fputc.c
> >> +       $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fputc.o `test -f
> 'fputc.c' || echo '$(srcdir)/'`fputc.c
> >> +
> >> +@@ -948,6 +959,12 @@
> >> + lib_a-sprintf.obj: sprintf.c
> >> +       $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf.obj `if test -f
> 'sprintf.c'; then $(CYGPATH_W) 'sprintf.c'; else $(CYGPATH_W)
> '$(srcdir)/sprintf.c'; fi`
> >> +
> >> ++lib_a-sprintf_chk.o: sprintf_chk.c
> >> ++      $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf_chk.o `test -f
> 'sprintf_chk.c' || echo '$(srcdir)/'`sprintf_chk.c
> >> ++
> >> ++lib_a-sprintf_chk.obj: sprintf_chk.c
> >> ++      $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf_chk.obj `if test
> -f 'sprintf_chk.c'; then $(CYGPATH_W) 'sprintf_chk.c'; else $(CYGPATH_W)
> '$(srcdir)/sprintf_chk.c'; fi`
> >> ++
> >> + lib_a-sscanf.o: sscanf.c
> >> +       $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS)
> $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sscanf.o `test -f
> 'sscanf.c' || echo '$(srcdir)/'`sscanf.c
> >> +
> >> +--- newlib/libc/stdio/sprintf_chk.c    1969-12-31 19:00:00.000000000
> -0500
> >> ++++ newlib/libc/stdio/sprintf_chk.c    2009-02-26 19:02:26.000000000
> -0500
> >> +@@ -0,0 +1,21 @@
> >> ++#include <stdarg.h>
> >> ++#include <stdio.h>
> >> ++
> >> ++/*
> >> ++ * Stub implementation of __sprintf_chk adapted from glibc 2.7.  This
> >> ++ * doesn't actually implement any buffer overflow protection.  It
> just makes
> >> ++ * the linker happy :)
> >> ++*/
> >> ++int
> >> ++__sprintf_chk (char *s, int flags, size_t slen, const char *format,
> ...)
> >> ++{
> >> ++  va_list arg;
> >> ++  int done;
> >> ++
> >> ++  va_start (arg, format);
> >> ++  done = vsprintf (s, format, arg);
> >> ++  va_end (arg);
> >> ++
> >> ++  return done;
> >> ++}
> >> ++
> >> diff --git a/recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
> b/recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
> >> new file mode 100644
> >> index 0000000..1054a07
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/files/newlib-stdint-size_max-fix-
> from-1.17.0.patch
> >> @@ -0,0 +1,16 @@
> >> +--- newlib-1.16.0/newlib/libc/include/stdint.h.orig    2006-08-17
> 00:39:43.000000000 +0300
> >> ++++ newlib-1.16.0/newlib/libc/include/stdint.h 2009-08-25
> 17:33:23.000000000 +0300
> >> +@@ -348,8 +348,11 @@
> >> + #endif
> >> +
> >> + /* This must match size_t in stddef.h, currently long unsigned int */
> >> +-#define SIZE_MIN (-__STDINT_EXP(LONG_MAX) - 1L)
> >> +-#define SIZE_MAX __STDINT_EXP(LONG_MAX)
> >> ++#ifdef __SIZE_MAX__
> >> ++#define SIZE_MAX __SIZE_MAX__
> >> ++#else
> >> ++#define SIZE_MAX (__STDINT_EXP(LONG_MAX) * 2UL + 1)
> >> ++#endif
> >> +
> >> + /* This must match sig_atomic_t in <signal.h> (currently int) */
> >> + #define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
> >> diff --git a/recipes-extended/xen/files/newlib.patch
> b/recipes-extended/xen/files/newlib.patch
> >> new file mode 100644
> >> index 0000000..ee9b6f2
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/files/newlib.patch
> >> @@ -0,0 +1,727 @@
> >> +There is a mix between longs and long longs.
> >> +
> >> +Index: newlib/libc/include/inttypes.h
> >> +===================================================================
> >> +RCS file: /cvs/src/src/newlib/libc/include/inttypes.h,v
> >> +retrieving revision 1.3
> >> +diff -u -p -r1.3 inttypes.h
> >> +--- newlib/libc/include/inttypes.h     16 Dec 2005 19:03:12 -0000
> 1.3
> >> ++++ newlib/libc/include/inttypes.h     8 Nov 2007 16:32:44 -0000
> >> +@@ -163,12 +163,12 @@
> >> +
> >> +
> >> + /* 64-bit types */
> >> +-#if __have_longlong64
> >> +-#define __PRI64(x) __STRINGIFY(ll##x)
> >> +-#define __SCN64(x) __STRINGIFY(ll##x)
> >> +-#elif __have_long64
> >> ++#if __have_long64
> >> + #define __PRI64(x) __STRINGIFY(l##x)
> >> + #define __SCN64(x) __STRINGIFY(l##x)
> >> ++#elif __have_longlong64
> >> ++#define __PRI64(x) __STRINGIFY(ll##x)
> >> ++#define __SCN64(x) __STRINGIFY(ll##x)
> >> + #else
> >> + #define __PRI64(x) __STRINGIFY(x)
> >> + #define __SCN64(x) __STRINGIFY(x)
> >> +@@ -217,12 +217,12 @@
> >> + #endif
> >> +
> >> + /* max-bit types */
> >> +-#if __have_longlong64
> >> +-#define __PRIMAX(x) __STRINGIFY(ll##x)
> >> +-#define __SCNMAX(x) __STRINGIFY(ll##x)
> >> +-#elif __have_long64
> >> ++#if __have_long64
> >> + #define __PRIMAX(x) __STRINGIFY(l##x)
> >> + #define __SCNMAX(x) __STRINGIFY(l##x)
> >> ++#elif __have_longlong64
> >> ++#define __PRIMAX(x) __STRINGIFY(ll##x)
> >> ++#define __SCNMAX(x) __STRINGIFY(ll##x)
> >> + #else
> >> + #define __PRIMAX(x) __STRINGIFY(x)
> >> + #define __SCNMAX(x) __STRINGIFY(x)
> >> +@@ -242,12 +242,12 @@
> >> + #define SCNxMAX               __SCNMAX(x)
> >> +
> >> + /* ptr types */
> >> +-#if __have_longlong64
> >> +-#define __PRIPTR(x) __STRINGIFY(ll##x)
> >> +-#define __SCNPTR(x) __STRINGIFY(ll##x)
> >> +-#elif __have_long64
> >> ++#if __have_long64
> >> + #define __PRIPTR(x) __STRINGIFY(l##x)
> >> + #define __SCNPTR(x) __STRINGIFY(l##x)
> >> ++#elif __have_longlong64
> >> ++#define __PRIPTR(x) __STRINGIFY(ll##x)
> >> ++#define __SCNPTR(x) __STRINGIFY(ll##x)
> >> + #else
> >> + #define __PRIPTR(x) __STRINGIFY(x)
> >> + #define __SCNPTR(x) __STRINGIFY(x)
> >> +
> >> +We don't want u?int32_t to be long as our code assume in a lot of
> places to be
> >> +int.
> >> +
> >> +Index: newlib/libc/include/stdint.h
> >> +===================================================================
> >> +RCS file: /cvs/src/src/newlib/libc/include/stdint.h,v
> >> +retrieving revision 1.10
> >> +diff -u -p -r1.10 stdint.h
> >> +--- newlib/libc/include/stdint.h       16 Aug 2006 21:39:43 -0000
> 1.10
> >> ++++ newlib/libc/include/stdint.h       12 Feb 2008 13:07:52 -0000
> >> +@@ -38,7 +38,7 @@ extern "C" {
> >> + #if __STDINT_EXP(LONG_MAX) > 0x7fffffff
> >> + #define __have_long64 1
> >> + #elif __STDINT_EXP(LONG_MAX) == 0x7fffffff && !defined(__SPU__)
> >> +-#define __have_long32 1
> >> ++/* #define __have_long32 1 */
> >> + #endif
> >> +
> >> + #if __STDINT_EXP(SCHAR_MAX) == 0x7f
> >> +
> >> +Define the basic ia64 jump buffer
> >> +
> >> +Index: newlib/libc/include/sys/config.h
> >> +===================================================================
> >> +RCS file: /cvs/src/src/newlib/libc/include/sys/config.h,v
> >> +retrieving revision 1.47
> >> +diff -u -p -r1.47 config.h
> >> +--- newlib/libc/include/sys/config.h   15 Mar 2007 21:32:12 -0000
>   1.47
> >> ++++ newlib/libc/include/sys/config.h   8 Nov 2007 16:32:44 -0000
> >> +@@ -71,6 +71,10 @@
> >> + #endif
> >> + #endif
> >> +
> >> ++#ifndef __DYNAMIC_REENT__
> >> ++#define __DYNAMIC_REENT__
> >> ++#endif
> >> ++
> >> + #ifdef __mn10200__
> >> + #define __SMALL_BITFIELDS
> >> + #endif
> >> +
> >> +Dynamic pointer to our reentrancy zone
> >> +
> >> +Index: newlib/libc/reent/getreent.c
> >> +===================================================================
> >> +RCS file: /cvs/src/src/newlib/libc/reent/getreent.c,v
> >> +retrieving revision 1.2
> >> +diff -u -p -r1.2 getreent.c
> >> +--- newlib/libc/reent/getreent.c       7 Sep 2007 00:45:55 -0000
>  1.2
> >> ++++ newlib/libc/reent/getreent.c       8 Nov 2007 16:32:44 -0000
> >> +@@ -3,12 +3,20 @@
> >> + #include <_ansi.h>
> >> + #include <reent.h>
> >> +
> >> ++#define weak_alias(name, aliasname) \
> >> ++  extern __typeof (name) aliasname __attribute__ ((weak, alias
> (#name)));
> >> ++
> >> + #ifdef __getreent
> >> + #undef __getreent
> >> + #endif
> >> ++#ifdef __libc_getreent
> >> ++#undef __libc_getreent
> >> ++#endif
> >> +
> >> + struct _reent *
> >> +-_DEFUN_VOID(__getreent)
> >> ++__libc_getreent (void)
> >> + {
> >> +   return _impure_ptr;
> >> + }
> >> ++weak_alias(__libc_getreent,__getreent)
> >> ++
> >> +
> >> +We can't provide a red zone in mini-os.
> >> +
> >> +Index: newlib/libc/machine/x86_64/memcpy.S
> >> +===================================================================
> >> +RCS file: /cvs/src/src/newlib/libc/machine/x86_64/memcpy.S,v
> >> +retrieving revision 1.1
> >> +diff -u -p -r1.1 memcpy.S
> >> +--- newlib/libc/machine/x86_64/memcpy.S        28 Aug 2007 21:56:49
> -0000      1.1
> >> ++++ newlib/libc/machine/x86_64/memcpy.S        8 Nov 2007 16:32:44
> -0000
> >> +@@ -30,10 +30,18 @@ quadword_aligned:
> >> +   cmpq    $256, rdx
> >> +   jb      quadword_copy
> >> +
> >> ++#if 1
> >> ++  subq    $32, rsp
> >> ++  movq    rax, 24 (rsp)
> >> ++  movq    r12, 16 (rsp)
> >> ++  movq    r13, 8  (rsp)
> >> ++  movq    r14, 0  (rsp)
> >> ++#else
> >> +   movq    rax, -8  (rsp)
> >> +   movq    r12, -16 (rsp)
> >> +   movq    r13, -24 (rsp)
> >> +   movq    r14, -32 (rsp)
> >> ++#endif
> >> +
> >> +   movq    rdx, rcx                /* Copy 128 bytes at a time with
> minimum cache polution */
> >> +   shrq    $7, rcx
> >> +@@ -89,10 +97,18 @@ loop:
> >> +   movq    rdx, rcx
> >> +   andq    $127, rcx
> >> +   rep     movsb
> >> ++#if 1
> >> ++  movq    24 (rsp), rax
> >> ++  movq    16 (rsp), r12
> >> ++  movq    8  (rsp), r13
> >> ++  movq    0  (rsp), r14
> >> ++  addq    $32, rsp
> >> ++#else
> >> +   movq    -8  (rsp), rax
> >> +   movq    -16 (rsp), r12
> >> +   movq    -24 (rsp), r13
> >> +   movq    -32 (rsp), r14
> >> ++#endif
> >> +   ret
> >> +
> >> +
> >> +--- newlib/libc/machine/x86_64/x86_64mach.h.orig       2008-07-11
> 14:57:23.062269000 +0100
> >> ++++ newlib/libc/machine/x86_64/x86_64mach.h    2008-07-11
> 14:58:01.262503000 +0100
> >> +@@ -22,81 +22,81 @@
> >> +
> >> + #define REG(x) CONCAT1(__REG_PREFIX__, x)
> >> +
> >> +-#define rax REG(rax)
> >> +-#define rbx REG(rbx)
> >> +-#define rcx REG(rcx)
> >> +-#define rdx REG(rdx)
> >> +-#define rsi REG(rsi)
> >> +-#define rdi REG(rdi)
> >> +-#define rbp REG(rbp)
> >> +-#define rsp REG(rsp)
> >> +-
> >> +-#define r8  REG(r8)
> >> +-#define r9  REG(r9)
> >> +-#define r10 REG(r10)
> >> +-#define r11 REG(r11)
> >> +-#define r12 REG(r12)
> >> +-#define r13 REG(r13)
> >> +-#define r14 REG(r14)
> >> +-#define r15 REG(r15)
> >> +-
> >> +-#define eax REG(eax)
> >> +-#define ebx REG(ebx)
> >> +-#define ecx REG(ecx)
> >> +-#define edx REG(edx)
> >> +-#define esi REG(esi)
> >> +-#define edi REG(edi)
> >> +-#define ebp REG(ebp)
> >> +-#define esp REG(esp)
> >> +-
> >> +-#define st0 REG(st)
> >> +-#define st1 REG(st(1))
> >> +-#define st2 REG(st(2))
> >> +-#define st3 REG(st(3))
> >> +-#define st4 REG(st(4))
> >> +-#define st5 REG(st(5))
> >> +-#define st6 REG(st(6))
> >> +-#define st7 REG(st(7))
> >> +-
> >> +-#define ax REG(ax)
> >> +-#define bx REG(bx)
> >> +-#define cx REG(cx)
> >> +-#define dx REG(dx)
> >> +-
> >> +-#define ah REG(ah)
> >> +-#define bh REG(bh)
> >> +-#define ch REG(ch)
> >> +-#define dh REG(dh)
> >> +-
> >> +-#define al REG(al)
> >> +-#define bl REG(bl)
> >> +-#define cl REG(cl)
> >> +-#define dl REG(dl)
> >> +-
> >> +-#define sil REG(sil)
> >> +-
> >> +-#define mm1 REG(mm1)
> >> +-#define mm2 REG(mm2)
> >> +-#define mm3 REG(mm3)
> >> +-#define mm4 REG(mm4)
> >> +-#define mm5 REG(mm5)
> >> +-#define mm6 REG(mm6)
> >> +-#define mm7 REG(mm7)
> >> +-
> >> +-#define xmm0 REG(xmm0)
> >> +-#define xmm1 REG(xmm1)
> >> +-#define xmm2 REG(xmm2)
> >> +-#define xmm3 REG(xmm3)
> >> +-#define xmm4 REG(xmm4)
> >> +-#define xmm5 REG(xmm5)
> >> +-#define xmm6 REG(xmm6)
> >> +-#define xmm7 REG(xmm7)
> >> +-
> >> +-#define cr0 REG(cr0)
> >> +-#define cr1 REG(cr1)
> >> +-#define cr2 REG(cr2)
> >> +-#define cr3 REG(cr3)
> >> +-#define cr4 REG(cr4)
> >> ++#define rax %rax
> >> ++#define rbx %rbx
> >> ++#define rcx %rcx
> >> ++#define rdx %rdx
> >> ++#define rsi %rsi
> >> ++#define rdi %rdi
> >> ++#define rbp %rbp
> >> ++#define rsp %rsp
> >> ++
> >> ++#define r8  %r8
> >> ++#define r9  %r9
> >> ++#define r10 %r10
> >> ++#define r11 %r11
> >> ++#define r12 %r12
> >> ++#define r13 %r13
> >> ++#define r14 %r14
> >> ++#define r15 %r15
> >> ++
> >> ++#define eax %eax
> >> ++#define ebx %ebx
> >> ++#define ecx %ecx
> >> ++#define edx %edx
> >> ++#define esi %esi
> >> ++#define edi %edi
> >> ++#define ebp %ebp
> >> ++#define esp %esp
> >> ++
> >> ++#define st0 %st
> >> ++#define st1 %st(1)
> >> ++#define st2 %st(2)
> >> ++#define st3 %st(3)
> >> ++#define st4 %st(4)
> >> ++#define st5 %st(5)
> >> ++#define st6 %st(6)
> >> ++#define st7 %st(7)
> >> ++
> >> ++#define ax %ax
> >> ++#define bx %bx
> >> ++#define cx %cx
> >> ++#define dx %dx
> >> ++
> >> ++#define ah %ah
> >> ++#define bh %bh
> >> ++#define ch %ch
> >> ++#define dh %dh
> >> ++
> >> ++#define al %al
> >> ++#define bl %bl
> >> ++#define cl %cl
> >> ++#define dl %dl
> >> ++
> >> ++#define sil %sil
> >> ++
> >> ++#define mm1 %mm1
> >> ++#define mm2 %mm2
> >> ++#define mm3 %mm3
> >> ++#define mm4 %mm4
> >> ++#define mm5 %mm5
> >> ++#define mm6 %mm6
> >> ++#define mm7 %mm7
> >> ++
> >> ++#define xmm0 %xmm0
> >> ++#define xmm1 %xmm1
> >> ++#define xmm2 %xmm2
> >> ++#define xmm3 %xmm3
> >> ++#define xmm4 %xmm4
> >> ++#define xmm5 %xmm5
> >> ++#define xmm6 %xmm6
> >> ++#define xmm7 %xmm7
> >> ++
> >> ++#define cr0 %cr0
> >> ++#define cr1 %cr1
> >> ++#define cr2 %cr2
> >> ++#define cr3 %cr3
> >> ++#define cr4 %cr4
> >> +
> >> + #ifdef _I386MACH_NEED_SOTYPE_FUNCTION
> >> + #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function
> >> +--- newlib/libc/machine/x86_64/memcpy.S.orig   2008-07-11
> 15:12:27.494693000 +0100
> >> ++++ newlib/libc/machine/x86_64/memcpy.S        2008-07-11
> 15:12:29.448706000 +0100
> >> +@@ -60,14 +60,14 @@
> >> +   movq    48 (rsi), r13
> >> +   movq    56 (rsi), r14
> >> +
> >> +-  movntiq rax,    (rdi)
> >> +-  movntiq r8 ,  8 (rdi)
> >> +-  movntiq r9 , 16 (rdi)
> >> +-  movntiq r10, 24 (rdi)
> >> +-  movntiq r11, 32 (rdi)
> >> +-  movntiq r12, 40 (rdi)
> >> +-  movntiq r13, 48 (rdi)
> >> +-  movntiq r14, 56 (rdi)
> >> ++  movnti rax,    (rdi)
> >> ++  movnti r8 ,  8 (rdi)
> >> ++  movnti r9 , 16 (rdi)
> >> ++  movnti r10, 24 (rdi)
> >> ++  movnti r11, 32 (rdi)
> >> ++  movnti r12, 40 (rdi)
> >> ++  movnti r13, 48 (rdi)
> >> ++  movnti r14, 56 (rdi)
> >> +
> >> +   movq     64 (rsi), rax
> >> +   movq     72 (rsi), r8
> >> +@@ -78,14 +78,14 @@
> >> +   movq    112 (rsi), r13
> >> +   movq    120 (rsi), r14
> >> +
> >> +-  movntiq rax,  64 (rdi)
> >> +-  movntiq r8 ,  72 (rdi)
> >> +-  movntiq r9 ,  80 (rdi)
> >> +-  movntiq r10,  88 (rdi)
> >> +-  movntiq r11,  96 (rdi)
> >> +-  movntiq r12, 104 (rdi)
> >> +-  movntiq r13, 112 (rdi)
> >> +-  movntiq r14, 120 (rdi)
> >> ++  movnti rax,  64 (rdi)
> >> ++  movnti r8 ,  72 (rdi)
> >> ++  movnti r9 ,  80 (rdi)
> >> ++  movnti r10,  88 (rdi)
> >> ++  movnti r11,  96 (rdi)
> >> ++  movnti r12, 104 (rdi)
> >> ++  movnti r13, 112 (rdi)
> >> ++  movnti r14, 120 (rdi)
> >> +
> >> +   leaq    128 (rsi), rsi
> >> +   leaq    128 (rdi), rdi
> >> +--- newlib/libc/machine/i386/i386mach.h        2000-08-28
> 18:50:06.000000000 +0100
> >> ++++ newlib/libc/machine/i386/i386mach.h        2008-07-11
> 15:17:13.874409000 +0100
> >> +@@ -27,46 +27,46 @@
> >> +
> >> + #define REG(x) CONCAT1(__REG_PREFIX__, x)
> >> +
> >> +-#define eax REG(eax)
> >> +-#define ebx REG(ebx)
> >> +-#define ecx REG(ecx)
> >> +-#define edx REG(edx)
> >> +-#define esi REG(esi)
> >> +-#define edi REG(edi)
> >> +-#define ebp REG(ebp)
> >> +-#define esp REG(esp)
> >> +-
> >> +-#define st0 REG(st)
> >> +-#define st1 REG(st(1))
> >> +-#define st2 REG(st(2))
> >> +-#define st3 REG(st(3))
> >> +-#define st4 REG(st(4))
> >> +-#define st5 REG(st(5))
> >> +-#define st6 REG(st(6))
> >> +-#define st7 REG(st(7))
> >> +-
> >> +-#define ax REG(ax)
> >> +-#define bx REG(bx)
> >> +-#define cx REG(cx)
> >> +-#define dx REG(dx)
> >> +-
> >> +-#define ah REG(ah)
> >> +-#define bh REG(bh)
> >> +-#define ch REG(ch)
> >> +-#define dh REG(dh)
> >> +-
> >> +-#define al REG(al)
> >> +-#define bl REG(bl)
> >> +-#define cl REG(cl)
> >> +-#define dl REG(dl)
> >> +-
> >> +-#define mm1 REG(mm1)
> >> +-#define mm2 REG(mm2)
> >> +-#define mm3 REG(mm3)
> >> +-#define mm4 REG(mm4)
> >> +-#define mm5 REG(mm5)
> >> +-#define mm6 REG(mm6)
> >> +-#define mm7 REG(mm7)
> >> ++#define eax %eax
> >> ++#define ebx %ebx
> >> ++#define ecx %ecx
> >> ++#define edx %edx
> >> ++#define esi %esi
> >> ++#define edi %edi
> >> ++#define ebp %ebp
> >> ++#define esp %esp
> >> ++
> >> ++#define st0 %st
> >> ++#define st1 %st(1)
> >> ++#define st2 %st(2)
> >> ++#define st3 %st(3)
> >> ++#define st4 %st(4)
> >> ++#define st5 %st(5)
> >> ++#define st6 %st(6)
> >> ++#define st7 %st(7)
> >> ++
> >> ++#define ax %ax
> >> ++#define bx %bx
> >> ++#define cx %cx
> >> ++#define dx %dx
> >> ++
> >> ++#define ah %ah
> >> ++#define bh %bh
> >> ++#define ch %ch
> >> ++#define dh %dh
> >> ++
> >> ++#define al %al
> >> ++#define bl %bl
> >> ++#define cl %cl
> >> ++#define dl %dl
> >> ++
> >> ++#define mm1 %mm1
> >> ++#define mm2 %mm2
> >> ++#define mm3 %mm3
> >> ++#define mm4 %mm4
> >> ++#define mm5 %mm5
> >> ++#define mm6 %mm6
> >> ++#define mm7 %mm7
> >> +
> >> + #ifdef _I386MACH_NEED_SOTYPE_FUNCTION
> >> + #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function
> >> +--- newlib/libc/machine/x86_64/memset.S        2007-08-28
> 22:56:49.000000000 +0100
> >> ++++ newlib/libc/machine/x86_64/memset.S        2008-07-11
> 15:16:59.098320000 +0100
> >> +@@ -40,22 +40,22 @@
> >> +
> >> +   .p2align 4
> >> + loop:
> >> +-  movntiq rax,     (rdi)
> >> +-  movntiq rax,   8 (rdi)
> >> +-  movntiq rax,  16 (rdi)
> >> +-  movntiq rax,  24 (rdi)
> >> +-  movntiq rax,  32 (rdi)
> >> +-  movntiq rax,  40 (rdi)
> >> +-  movntiq rax,  48 (rdi)
> >> +-  movntiq rax,  56 (rdi)
> >> +-  movntiq rax,  64 (rdi)
> >> +-  movntiq rax,  72 (rdi)
> >> +-  movntiq rax,  80 (rdi)
> >> +-  movntiq rax,  88 (rdi)
> >> +-  movntiq rax,  96 (rdi)
> >> +-  movntiq rax, 104 (rdi)
> >> +-  movntiq rax, 112 (rdi)
> >> +-  movntiq rax, 120 (rdi)
> >> ++  movnti rax,     (rdi)
> >> ++  movnti rax,   8 (rdi)
> >> ++  movnti rax,  16 (rdi)
> >> ++  movnti rax,  24 (rdi)
> >> ++  movnti rax,  32 (rdi)
> >> ++  movnti rax,  40 (rdi)
> >> ++  movnti rax,  48 (rdi)
> >> ++  movnti rax,  56 (rdi)
> >> ++  movnti rax,  64 (rdi)
> >> ++  movnti rax,  72 (rdi)
> >> ++  movnti rax,  80 (rdi)
> >> ++  movnti rax,  88 (rdi)
> >> ++  movnti rax,  96 (rdi)
> >> ++  movnti rax, 104 (rdi)
> >> ++  movnti rax, 112 (rdi)
> >> ++  movnti rax, 120 (rdi)
> >> +
> >> +   leaq    128 (rdi), rdi
> >> +
> >> +--- newlib/libm/machine/i386/i386mach.h.orig   2008-07-11
> 15:30:37.367227000 +0100
> >> ++++ newlib/libm/machine/i386/i386mach.h        2008-07-11
> 15:30:55.232337000 +0100
> >> +@@ -27,46 +27,46 @@
> >> +
> >> + #define REG(x) CONCAT1(__REG_PREFIX__, x)
> >> +
> >> +-#define eax REG(eax)
> >> +-#define ebx REG(ebx)
> >> +-#define ecx REG(ecx)
> >> +-#define edx REG(edx)
> >> +-#define esi REG(esi)
> >> +-#define edi REG(edi)
> >> +-#define ebp REG(ebp)
> >> +-#define esp REG(esp)
> >> +-
> >> +-#define st0 REG(st)
> >> +-#define st1 REG(st(1))
> >> +-#define st2 REG(st(2))
> >> +-#define st3 REG(st(3))
> >> +-#define st4 REG(st(4))
> >> +-#define st5 REG(st(5))
> >> +-#define st6 REG(st(6))
> >> +-#define st7 REG(st(7))
> >> +-
> >> +-#define ax REG(ax)
> >> +-#define bx REG(bx)
> >> +-#define cx REG(cx)
> >> +-#define dx REG(dx)
> >> +-
> >> +-#define ah REG(ah)
> >> +-#define bh REG(bh)
> >> +-#define ch REG(ch)
> >> +-#define dh REG(dh)
> >> +-
> >> +-#define al REG(al)
> >> +-#define bl REG(bl)
> >> +-#define cl REG(cl)
> >> +-#define dl REG(dl)
> >> +-
> >> +-#define mm1 REG(mm1)
> >> +-#define mm2 REG(mm2)
> >> +-#define mm3 REG(mm3)
> >> +-#define mm4 REG(mm4)
> >> +-#define mm5 REG(mm5)
> >> +-#define mm6 REG(mm6)
> >> +-#define mm7 REG(mm7)
> >> ++#define eax %eax
> >> ++#define ebx %ebx
> >> ++#define ecx %ecx
> >> ++#define edx %edx
> >> ++#define esi %esi
> >> ++#define edi %edi
> >> ++#define ebp %ebp
> >> ++#define esp %esp
> >> ++
> >> ++#define st0 %st
> >> ++#define st1 %st(1)
> >> ++#define st2 %st(2)
> >> ++#define st3 %st(3)
> >> ++#define st4 %st(4)
> >> ++#define st5 %st(5)
> >> ++#define st6 %st(6)
> >> ++#define st7 %st(7)
> >> ++
> >> ++#define ax %ax
> >> ++#define bx %bx
> >> ++#define cx %cx
> >> ++#define dx %dx
> >> ++
> >> ++#define ah %ah
> >> ++#define bh %bh
> >> ++#define ch %ch
> >> ++#define dh %dh
> >> ++
> >> ++#define al %al
> >> ++#define bl %bl
> >> ++#define cl %cl
> >> ++#define dl %dl
> >> ++
> >> ++#define mm1 %mm1
> >> ++#define mm2 %mm2
> >> ++#define mm3 %mm3
> >> ++#define mm4 %mm4
> >> ++#define mm5 %mm5
> >> ++#define mm6 %mm6
> >> ++#define mm7 %mm7
> >> +
> >> + #ifdef _I386MACH_NEED_SOTYPE_FUNCTION
> >> + #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function
> >> +
> >> +
> >> +We want to have a 64bit offsets libc even on 32bit platforms.
> >> +
> >> +--- ./newlib/configure.host.orig       2008-08-07 16:01:17.801946000
> +0100
> >> ++++ ./newlib/configure.host    2008-08-07 16:01:34.181064000 +0100
> >> +@@ -317,6 +317,8 @@
> >> +     oext=lo
> >> +     lpfx=
> >> +     aext=la ;;
> >> ++  i[34567]86-xen-elf)
> >> ++    stdio64_dir=stdio64 ;;
> >> +   *) ;; #shared library not supported for ${host}
> >> + esac
> >> +
> >> +--- newlib/libc/include/sys/_types.h.orig      2008-08-07
> 15:22:44.925008000 +0100
> >> ++++ newlib/libc/include/sys/_types.h   2008-08-07 15:22:50.824044000
> +0100
> >> +@@ -13,8 +13,12 @@
> >> + #include <sys/lock.h>
> >> +
> >> + #ifndef __off_t_defined
> >> ++#ifdef __MINIOS__
> >> ++typedef long long _off_t;
> >> ++#else
> >> + typedef long _off_t;
> >> + #endif
> >> ++#endif
> >> +
> >> + #if defined(__rtems__)
> >> + /* device numbers are 32-bit major and and 32-bit minor */
> >> +--- ./newlib/libc/include/sys/config.h.orig    2008-08-07
> 14:43:25.915866000 +0100
> >> ++++ ./newlib/libc/include/sys/config.h 2008-08-07 14:44:13.508154000
> +0100
> >> +@@ -69,6 +69,10 @@
> >> + /* we use some glibc header files so turn on glibc large file feature
> */
> >> + #define _LARGEFILE64_SOURCE 1
> >> + #endif
> >> ++#ifdef __MINIOS__
> >> ++#define __LARGE64_FILES 1
> >> ++#define _LARGEFILE64_SOURCE 1
> >> ++#endif
> >> + #endif
> >> +
> >> + #ifndef __DYNAMIC_REENT__
> >> +--- ./newlib/libc/include/sys/_default_fcntl.h.orig    2008-08-07
> 15:08:22.377836000 +0100
> >> ++++ ./newlib/libc/include/sys/_default_fcntl.h 2008-08-07
> 15:08:31.651890000 +0100
> >> +@@ -170,7 +170,11 @@
> >> + /* Provide _<systemcall> prototypes for functions provided by some
> versions
> >> +    of newlib.  */
> >> + #ifdef _COMPILING_NEWLIB
> >> +-extern int _open _PARAMS ((const char *, int, ...));
> >> ++extern int _open _PARAMS ((const char *, int, ...))
> >> ++#ifdef __MINIOS__
> >> ++    asm("open64")
> >> ++#endif
> >> ++    ;
> >> + extern int _fcntl _PARAMS ((int, int, ...));
> >> + #ifdef __LARGE64_FILES
> >> + extern int _open64 _PARAMS ((const char *, int, ...));
> >> +--- ./newlib/libc/include/sys/unistd.h.orig    2008-08-07
> 15:09:36.449280000 +0100
> >> ++++ ./newlib/libc/include/sys/unistd.h 2008-08-07 15:09:51.210370000
> +0100
> >> +@@ -101,7 +101,11 @@
> >> + int     _EXFUN(link, (const char *__path1, const char *__path2 ));
> >> + int   _EXFUN(nice, (int __nice_value ));
> >> + #if !defined(__INSIDE_CYGWIN__)
> >> +-off_t   _EXFUN(lseek, (int __fildes, off_t __offset, int __whence ));
> >> ++off_t   _EXFUN(lseek, (int __fildes, off_t __offset, int __whence ))
> >> ++#ifdef __MINIOS__
> >> ++    asm("lseek64")
> >> ++#endif
> >> ++    ;
> >> + #endif
> >> + #if defined(__SPU__)
> >> + #define F_ULOCK       0
> >> +--- ./newlib/libc/include/sys/stat.h.orig      2008-08-07
> 16:08:50.495116000 +0100
> >> ++++ ./newlib/libc/include/sys/stat.h   2008-08-07 16:10:21.799753000
> +0100
> >> +@@ -49,6 +49,9 @@
> >> +   long        st_spare4[2];
> >> + #endif
> >> + };
> >> ++#ifdef __MINIOS__
> >> ++#define stat64 stat
> >> ++#endif
> >> + #endif
> >> +
> >> + #define       _IFMT           0170000 /* type of file */
> >> +@@ -132,7 +135,11 @@
> >> + /* Provide prototypes for most of the _<systemcall> names that are
> >> +    provided in newlib for some compilers.  */
> >> + #ifdef _COMPILING_NEWLIB
> >> +-int   _EXFUN(_fstat,( int __fd, struct stat *__sbuf ));
> >> ++int   _EXFUN(_fstat,( int __fd, struct stat *__sbuf ))
> >> ++#ifdef __MINIOS__
> >> ++    asm("fstat64")
> >> ++#endif
> >> ++    ;
> >> + int   _EXFUN(_stat,( const char *__path, struct stat *__sbuf ));
> >> + #ifdef __LARGE64_FILES
> >> + struct stat64;
> >> +--- ./newlib/libc/include/_syslist.h.orig      2008-08-07
> 16:24:19.122605000 +0100
> >> ++++ ./newlib/libc/include/_syslist.h   2008-08-07 16:24:21.548628000
> +0100
> >> +@@ -14,6 +14,7 @@
> >> + #define _kill kill
> >> + #define _link link
> >> + #define _lseek lseek
> >> ++#define _lseek64 lseek64
> >> + #define _open open
> >> + #define _read read
> >> + #define _sbrk sbrk
> >> +--- newlib/libc/include/reent.h.orig   2008-08-07 16:28:49.846502000
> +0100
> >> ++++ newlib/libc/include/reent.h        2008-08-07 16:29:02.096586000
> +0100
> >> +@@ -87,6 +87,9 @@
> >> + #if defined(__CYGWIN__) && defined(_COMPILING_NEWLIB)
> >> + #define stat64 __stat64
> >> + #endif
> >> ++#if defined(__MINIOS__)
> >> ++#define stat64 stat
> >> ++#endif
> >> +
> >> + struct stat64;
> >> +
> >> diff --git a/recipes-extended/xen/newlib.inc
> b/recipes-extended/xen/newlib.inc
> >> new file mode 100644
> >> index 0000000..32d79aa
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/newlib.inc
> >> @@ -0,0 +1,64 @@
> >> +# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> >> +# Released under the MIT license (see COPYING.MIT for the terms)
> >> +
> >> +require stubdom.inc
> >> +
> >> +CPPFLAGS_INCLUDE_DIR = "-isystem `${HOST_PREFIX}gcc
> -print-file-name=include`"
> >> +STUBDOM_CFLAGS += "-D_I386MACH_ALLOW_HW_INTERRUPTS"
> >> +
> >> +export ac_cv_path_CC_FOR_TARGET="${HOST_PREFIX}gcc
> --sysroot=${RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}"
> >> +export CC_FOR_TARGET="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT}
> ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}"
> >> +
> >> +export ac_cv_path_CXX_FOR_TARGET="${HOST_PREFIX}g++
> --sysroot=${RECIPE_SYSROOT}"
> >> +export CXX_FOR_TARGET="${HOST_PREFIX}g++ --sysroot=${RECIPE_SYSROOT}"
> >> +
> >> +export ac_cv_path_CPP_FOR_TARGET="${HOST_PREFIX}gcc -E
> --sysroot=${RECIPE_SYSROOT}"
> >> +export CPP_FOR_TARGET="${HOST_PREFIX}gcc -E
> --sysroot=${RECIPE_SYSROOT}"
> >> +
> >> +export ac_cv_path_LD_FOR_TARGET="${HOST_PREFIX}ld
> --sysroot=${RECIPE_SYSROOT}"
> >> +export LD_FOR_TARGET="${HOST_PREFIX}ld --sysroot=${RECIPE_SYSROOT}"
> >> +
> >> +export ac_cv_path_AS_FOR_TARGET="${HOST_PREFIX}as"
> >> +export AS_FOR_TARGET="${HOST_PREFIX}as"
> >> +
> >> +export ac_cv_path_AR_FOR_TARGET="${HOST_PREFIX}ar"
> >> +export AR_FOR_TARGET="${HOST_PREFIX}ar"
> >> +
> >> +export ac_cv_path_NM_FOR_TARGET="${HOST_PREFIX}nm"
> >> +export NM_FOR_TARGET="${HOST_PREFIX}nm"
> >> +
> >> +export ac_cv_path_RANLIB_FOR_TARGET="${HOST_PREFIX}ranlib"
> >> +export RANLIB_FOR_TARGET="${HOST_PREFIX}ranlib"
> >> +
> >> +export ac_cv_path_OBJDUMP_FOR_TARGET="${HOST_PREFIX}objdump"
> >> +export OBJDUMP_FOR_TARGET="${HOST_PREFIX}objdump"
> >> +
> >> +export ac_cv_path_OBJCOPY_FOR_TARGET="${HOST_PREFIX}objcopy"
> >> +export OBJCOPY_FOR_TARGET="${HOST_PREFIX}objcopy"
> >> +
> >> +export ac_cv_path_STRIP_FOR_TARGET="${HOST_PREFIX}strip"
> >> +export STRIP_FOR_TARGET="${HOST_PREFIX}strip"
> >> +
> >> +export ac_cv_path_STRINGS_FOR_TARGET="${HOST_PREFIX}strings"
> >> +export STRINGS_FOR_TARGET="${HOST_PREFIX}strings"
> >> +
> >> +export ac_cv_path_READELF_FOR_TARGET="${HOST_PREFIX}readelf"
> >> +export READELF_FOR_TARGET="${HOST_PREFIX}readelf"
> >> +
> >> +do_configure() {
> >> +    ${S}/configure --verbose --prefix=${prefix}
> --target=${GNU_TARGET_ARCH}-xen-elf --enable-newlib-io-long-long
> --disable-multilib
> >> +    find ${S} -type f | xargs perl -i.bak -pe 's/\b_(tzname|daylight|
> timezone)\b/$1/g'
> >> +}
> >> +
> >> +do_compile() {
> >> +    ${MAKE}
> >> +}
> >> +
> >> +do_install() {
> >> +    ${MAKE} DESTDIR=${D} install
> >> +    rm -rf ${D}/cross-root-${XEN_TARGET_ARCH}/share
> >> +    rm -rf ${D}/cross-root-${XEN_TARGET_ARCH}/info
> >> +    install -m 644 `${HOST_PREFIX}gcc -print-file-name=include`/stdarg.h
> -t ${D}/${includedir}
> >> +    install -m 644 `${HOST_PREFIX}gcc -print-file-name=include`/stddef.h
> -t ${D}/${includedir}
> >> +    install -m 644 `${HOST_PREFIX}gcc -print-file-name=include`/stdbool.h
> -t ${D}/${includedir}
> >> +}
> >> diff --git a/recipes-extended/xen/newlib_1.16.0.bb
> b/recipes-extended/xen/newlib_1.16.0.bb
> >> new file mode 100644
> >> index 0000000..ea80271
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/newlib_1.16.0.bb
> >> @@ -0,0 +1,19 @@
> >> +# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> >> +# Released under the MIT license (see COPYING.MIT for the terms)
> >> +
> >> +DESCRIPTION = "Newlib is a C library intended for use on embedded
> systems."
> >> +HOMEPAGE = "http://sourceware.org/newlib"
> >> +LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2"
> >> +LIC_FILES_CHKSUM = "file://COPYING.NEWLIB;md5=
> 950f50b290e8fcf7a2d3fff61775de9b"
> >> +
> > I see newlib in a few other oe layers, but nothing that looks to be
> > common. For my
> > own understanding (and when someone asks me about this), is there any
> > significant
> > difference in this newlib implementation/build than you'd find in
> > other newlib use cases ?
>
> This version is old 2008, the latest is 3.0 but not sure if this Xen
> solution needs 1.7.
>
>
> - armin
>
> >
> >> +S="${WORKDIR}/newlib"
> >> +B="${WORKDIR}/build"
> >> +
> >> +SRC_URI += "\
> >> +    git://sourceware.org/git/newlib-cygwin.git;protocol=
> git;rev=newlib-${TRANSLATED_PV};destsuffix=newlib;nobranch=1;name=newlib \
> > Using tags for SRCREVs is generally frowned upon. Is that what this is
> > doing ? Even if you want to
> > use the convenience variable you created, it would still be better to
> > explicitly set SRCREV in the
> > recipes for easier maintenance and to make things more obvious.
> >
> >> +    file://newlib.patch;striplevel=0 \
> >> +    file://newlib-chk.patch;striplevel=0 \
> > We really shouldn't be specifying striplevel on the patches.  Why
> > aren't the patches being
> > generated in a way that makes then consistent, and that can be applied
> > with the defaults ?
> >
> > Bruce
> >
> >> +    file://newlib-stdint-size_max-fix-from-1.17.0.patch;striplevel=1 \
> >> +"
> >> +
> >> +require newlib.inc
> >> --
> >> 2.14.2
> >>
> >>
> >> --
> >>
> >> *This email and all attachments are considered confidential and the
> >> proprietary information of BrainTrust Holdings.  Unauthorized
> disclosure is
> >> prohibited.  *
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
>
>
>


-- 
Kurt Bodiker
BrainTrust Holdings
www.braintrust-us.com
443-296-2186 office
410-750-2119 fax

-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

--94eb2c1125346df75c05673b1612
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The Xen source tree is hardcoded to pull old versions=
 of the necessary dependencies for building various stubdomains. Stubdomain=
s have not been tested using any newer versions of this or any other depend=
ency. I suppose that is work for us to do once the initial baseline for vTP=
Ms has been set.<br><br></div>Kurt<br></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Thu, Mar 8, 2018 at 7:37 PM, akuster <span di=
r=3D"ltr">&lt;<a href=3D"mailto:akuster@mvista.com" target=3D"_blank">akust=
er@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 03/08/2018 01:05 PM, Bruce Ashfield wrote:<br>
&gt; On Mon, Mar 5, 2018 at 10:35 AM, Kurt Bodiker<br>
&gt; &lt;<a href=3D"mailto:kurt.bodiker@braintrust-us.com">kurt.bodiker@bra=
intrust-us.<wbr>com</a>&gt; wrote:<br>
&gt;&gt; From: kebodiker &lt;<a href=3D"mailto:kurt.bodiker@braintrust-us.c=
om">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Newlib provides a fast, C library optimized for embedded systems. =
In the<br>
&gt;&gt; case of Xen stubdomains, we are using MiniOS. This Newlib recipe c=
reates<br>
&gt;&gt; static libraries that are cross-compiled against MiniOS, Xen, and =
LWIP<br>
&gt;&gt; headers and subsequently used during the cross-compilation and lin=
king<br>
&gt;&gt; of PolarSSL, the stubdom specific GMP, TPM Emulator, and the Xen v=
TPM<br>
&gt;&gt; and vTPM Manager stubdomains.<br>
&gt;&gt;<br>
&gt;&gt; The current Xen source code is hardcoded to fetch a specific versi=
on of<br>
&gt;&gt; this package.=C2=A0 The patch files originate from the Xen/stubdom=
 source<br>
&gt;&gt; tree. This recipe provides the flexibility to change version or mo=
dify<br>
&gt;&gt; the patches.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodiker@bra=
intrust-us.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 recipes-extended/xen/files/<wbr>newlib-chk.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 155 +++++<br>
&gt;&gt;=C2=A0 .../newlib-stdint-size_max-<wbr>fix-from-1.17.0.patch=C2=A0 =
=C2=A0|=C2=A0 16 +<br>
&gt;&gt;=C2=A0 recipes-extended/xen/files/<wbr>newlib.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 727 +++++++++++++++++++++<br>
&gt;&gt;=C2=A0 recipes-extended/xen/newlib.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 64 ++<br>
&gt;&gt;=C2=A0 recipes-extended/xen/<a href=3D"http://newlib_1.16.0.bb" rel=
=3D"noreferrer" target=3D"_blank">newlib_1.<wbr>16.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +<br>
&gt;&gt;=C2=A0 5 files changed, 981 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 recipes-extended/xen/files/<wbr>newlib-ch=
k.patch<br>
&gt;&gt;=C2=A0 create mode 100644 recipes-extended/xen/files/<wbr>newlib-st=
dint-size_max-fix-<wbr>from-1.17.0.patch<br>
&gt;&gt;=C2=A0 create mode 100644 recipes-extended/xen/files/<wbr>newlib.pa=
tch<br>
&gt;&gt;=C2=A0 create mode 100644 recipes-extended/xen/newlib.<wbr>inc<br>
&gt;&gt;=C2=A0 create mode 100644 recipes-extended/xen/<a href=3D"http://ne=
wlib_1.16.0.bb" rel=3D"noreferrer" target=3D"_blank">newlib_1.<wbr>16.0.bb<=
/a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-extended/xen/files/<wbr>newlib-chk.patch b/re=
cipes-extended/xen/files/<wbr>newlib-chk.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..848dbd5<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/xen/files/<wbr>newlib-chk.patch<br>
&gt;&gt; @@ -0,0 +1,155 @@<br>
&gt;&gt; +--- newlib/libc/stdio/fprintf_chk.<wbr>c=C2=A0 =C2=A0 1969-12-31 =
19:00:00.000000000 -0500<br>
&gt;&gt; ++++ newlib/libc/stdio/fprintf_chk.<wbr>c=C2=A0 =C2=A0 2009-02-26 =
19:02:53.000000000 -0500<br>
&gt;&gt; +@@ -0,0 +1,21 @@<br>
&gt;&gt; ++#include &lt;stdarg.h&gt;<br>
&gt;&gt; ++#include &lt;stdio.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++/*<br>
&gt;&gt; ++ * Stub implementation of __fprintf_chk adapted from glibc 2.7.=
=C2=A0 This<br>
&gt;&gt; ++ * doesn&#39;t actually implement any buffer overflow protection=
.=C2=A0 It just makes<br>
&gt;&gt; ++ * the linker happy :)<br>
&gt;&gt; ++*/<br>
&gt;&gt; ++int<br>
&gt;&gt; ++__fprintf_chk (FILE *fp, int flag, const char *format, ...)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 va_list ap;<br>
&gt;&gt; ++=C2=A0 int done;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 va_start (ap, format);<br>
&gt;&gt; ++=C2=A0 done =3D vfprintf (fp, format, ap);<br>
&gt;&gt; ++=C2=A0 va_end (ap);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 return done;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; +--- newlib/libc/stdio/Makefile.am=C2=A0 =C2=A0 =C2=A0 2007-08-02 =
16:23:06.000000000 -0400<br>
&gt;&gt; ++++ newlib/libc/stdio/Makefile.am=C2=A0 =C2=A0 =C2=A0 2009-02-26 =
18:14:53.000000000 -0500<br>
&gt;&gt; +@@ -20,6 +20,7 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0flags.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fopen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 fprintf_chk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fputc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fputs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fread.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +@@ -65,6 +66,7 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sniprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sprintf_chk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sscanf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stdio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfile.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +--- newlib/libc/stdio/Makefile.in=C2=A0 =C2=A0 =C2=A0 2007-12-19 =
17:36:38.000000000 -0500<br>
&gt;&gt; ++++ newlib/libc/stdio/Makefile.in=C2=A0 =C2=A0 =C2=A0 2009-02-26 =
18:43:52.000000000 -0500<br>
&gt;&gt; +@@ -63,7 +63,8 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-fgets.$(OBJEXT) lib_a-fileno.$(O=
BJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-findfp.$(OBJEXT) lib_a-fiprintf.=
$(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-flags.$(OBJEXT) lib_a-fopen.$(OB=
JEXT) \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 lib_a-fprintf.$(OBJEXT) lib_a-fputc.$(OBJEX=
T) \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lib_a-fprintf.$(OBJEXT) lib_a-fprintf_chk.$=
(OBJEXT) \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lib_a-fputc.$(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-fputs.$(OBJEXT) lib_a-fread.$(OB=
JEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-freopen.$(OBJEXT) lib_a-fscanf.$=
(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-fiscanf.$(OBJEXT) lib_a-fseek.$(=
OBJEXT) \<br>
&gt;&gt; +@@ -86,6 +87,7 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-setvbuf.$(OBJEXT) lib_a-siprintf=
.$(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-siscanf.$(OBJEXT) lib_a-sniprint=
f.$(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-snprintf.$(OBJEXT) lib_a-sprintf=
.$(OBJEXT) \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lib_a-sprintf_chk.$(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-sscanf.$(OBJEXT) lib_a-stdio.$(O=
BJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-tmpfile.$(OBJEXT) lib_a-tmpnam.$=
(OBJEXT) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lib_a-ungetc.$(OBJEXT) lib_a-vdiprintf=
.$(OBJEXT) \<br>
&gt;&gt; +@@ -122,15 +124,15 @@<br>
&gt;&gt; + LTLIBRARIES =3D $(noinst_LTLIBRARIES)<br>
&gt;&gt; + am__objects_4 =3D clearerr.lo fclose.lo fdopen.lo feof.lo ferror=
.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fflush.lo fgetc.lo fgetpos.lo fgets.lo=
 fileno.lo findfp.lo \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 fiprintf.lo flags.lo fopen.lo fprintf.lo fp=
utc.lo fputs.lo \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 fread.lo freopen.lo fscanf.lo fiscanf.lo fs=
eek.lo fsetpos.lo \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 fiprintf.lo flags.lo fopen.lo fprintf.lo fp=
rintf_chk.lo fputc.lo \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 fputs.lo fread.lo freopen.lo fscanf.lo fisc=
anf.lo fseek.lo fsetpos.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ftell.lo fvwrite.lo fwalk.lo fwrite.lo=
 getc.lo getchar.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0getc_u.lo getchar_u.lo getdelim.lo get=
line.lo gets.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0iprintf.lo iscanf.lo makebuf.lo perror=
.lo printf.lo putc.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0putchar.lo putc_u.lo putchar_u.lo puts=
.lo refill.lo remove.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rename.lo rewind.lo rget.lo scanf.lo s=
ccl.lo setbuf.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0setbuffer.lo setlinebuf.lo setvbuf.lo =
siprintf.lo siscanf.lo \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 sniprintf.lo snprintf.lo sprintf.lo sscanf.=
lo stdio.lo \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sniprintf.lo snprintf.lo sprintf.lo sprintf=
_chk.lo sscanf.lo stdio.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfile.lo tmpnam.lo ungetc.lo vdiprin=
tf.lo vdprintf.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0viprintf.lo viscanf.lo vprintf.lo vsca=
nf.lo vsiprintf.lo \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vsiscanf.lo vsnprintf.lo vsniprintf.lo=
 vsprintf.lo vsscanf.lo \<br>
&gt;&gt; +@@ -344,6 +346,7 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0flags.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fopen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 fprintf_chk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fputc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fputs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fread.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +@@ -389,6 +392,7 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sniprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sprintf_chk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sscanf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stdio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfile.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +@@ -508,6 +512,7 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0siprintf.def=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0siscanf.def=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf.def=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sprintf_chk.def=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sscanf.def=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfile.def=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpnam.def=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +@@ -678,6 +683,12 @@<br>
&gt;&gt; + lib_a-fprintf.obj: fprintf.c<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(IN=
CLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fp=
rintf.obj `if test -f &#39;fprintf.c&#39;; then $(CYGPATH_W) &#39;fprintf.c=
&#39;; else $(CYGPATH_W) &#39;$(srcdir)/fprintf.c&#39;; fi`<br>
&gt;&gt; +<br>
&gt;&gt; ++lib_a-fprintf_chk.o: fprintf_chk.c<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDE=
S) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf=
_chk.o `test -f &#39;fprintf_chk.c&#39; || echo &#39;$(srcdir)/&#39;`fprint=
f_chk.c<br>
&gt;&gt; ++<br>
&gt;&gt; ++lib_a-fprintf_chk.obj: fprintf_chk.c<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDE=
S) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf=
_chk.obj `if test -f &#39;fprintf_chk.c&#39;; then $(CYGPATH_W) &#39;fprint=
f_chk.c&#39;; else $(CYGPATH_W) &#39;$(srcdir)/fprintf_chk.c&#39;; fi`<br>
&gt;&gt; ++<br>
&gt;&gt; + lib_a-fputc.o: fputc.c<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(IN=
CLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fp=
utc.o `test -f &#39;fputc.c&#39; || echo &#39;$(srcdir)/&#39;`fputc.c<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -948,6 +959,12 @@<br>
&gt;&gt; + lib_a-sprintf.obj: sprintf.c<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(IN=
CLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sp=
rintf.obj `if test -f &#39;sprintf.c&#39;; then $(CYGPATH_W) &#39;sprintf.c=
&#39;; else $(CYGPATH_W) &#39;$(srcdir)/sprintf.c&#39;; fi`<br>
&gt;&gt; +<br>
&gt;&gt; ++lib_a-sprintf_chk.o: sprintf_chk.c<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDE=
S) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf=
_chk.o `test -f &#39;sprintf_chk.c&#39; || echo &#39;$(srcdir)/&#39;`sprint=
f_chk.c<br>
&gt;&gt; ++<br>
&gt;&gt; ++lib_a-sprintf_chk.obj: sprintf_chk.c<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDE=
S) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf=
_chk.obj `if test -f &#39;sprintf_chk.c&#39;; then $(CYGPATH_W) &#39;sprint=
f_chk.c&#39;; else $(CYGPATH_W) &#39;$(srcdir)/sprintf_chk.c&#39;; fi`<br>
&gt;&gt; ++<br>
&gt;&gt; + lib_a-sscanf.o: sscanf.c<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(IN=
CLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-ss=
canf.o `test -f &#39;sscanf.c&#39; || echo &#39;$(srcdir)/&#39;`sscanf.c<br=
>
&gt;&gt; +<br>
&gt;&gt; +--- newlib/libc/stdio/sprintf_chk.<wbr>c=C2=A0 =C2=A0 1969-12-31 =
19:00:00.000000000 -0500<br>
&gt;&gt; ++++ newlib/libc/stdio/sprintf_chk.<wbr>c=C2=A0 =C2=A0 2009-02-26 =
19:02:26.000000000 -0500<br>
&gt;&gt; +@@ -0,0 +1,21 @@<br>
&gt;&gt; ++#include &lt;stdarg.h&gt;<br>
&gt;&gt; ++#include &lt;stdio.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++/*<br>
&gt;&gt; ++ * Stub implementation of __sprintf_chk adapted from glibc 2.7.=
=C2=A0 This<br>
&gt;&gt; ++ * doesn&#39;t actually implement any buffer overflow protection=
.=C2=A0 It just makes<br>
&gt;&gt; ++ * the linker happy :)<br>
&gt;&gt; ++*/<br>
&gt;&gt; ++int<br>
&gt;&gt; ++__sprintf_chk (char *s, int flags, size_t slen, const char *form=
at, ...)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 va_list arg;<br>
&gt;&gt; ++=C2=A0 int done;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 va_start (arg, format);<br>
&gt;&gt; ++=C2=A0 done =3D vsprintf (s, format, arg);<br>
&gt;&gt; ++=C2=A0 va_end (arg);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 return done;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; diff --git a/recipes-extended/xen/files/<wbr>newlib-stdint-size_ma=
x-fix-<wbr>from-1.17.0.patch b/recipes-extended/xen/files/<wbr>newlib-stdin=
t-size_max-fix-<wbr>from-1.17.0.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..1054a07<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/xen/files/<wbr>newlib-stdint-size_max-fix-<=
wbr>from-1.17.0.patch<br>
&gt;&gt; @@ -0,0 +1,16 @@<br>
&gt;&gt; +--- newlib-1.16.0/newlib/libc/<wbr>include/stdint.h.orig=C2=A0 =
=C2=A0 2006-08-17 00:39:43.000000000 +0300<br>
&gt;&gt; ++++ newlib-1.16.0/newlib/libc/<wbr>include/stdint.h 2009-08-25 17=
:33:23.000000000 +0300<br>
&gt;&gt; +@@ -348,8 +348,11 @@<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; + /* This must match size_t in stddef.h, currently long unsigned i=
nt */<br>
&gt;&gt; +-#define SIZE_MIN (-__STDINT_EXP(LONG_MAX) - 1L)<br>
&gt;&gt; +-#define SIZE_MAX __STDINT_EXP(LONG_MAX)<br>
&gt;&gt; ++#ifdef __SIZE_MAX__<br>
&gt;&gt; ++#define SIZE_MAX __SIZE_MAX__<br>
&gt;&gt; ++#else<br>
&gt;&gt; ++#define SIZE_MAX (__STDINT_EXP(LONG_MAX) * 2UL + 1)<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +<br>
&gt;&gt; + /* This must match sig_atomic_t in &lt;signal.h&gt; (currently i=
nt) */<br>
&gt;&gt; + #define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)<br>
&gt;&gt; diff --git a/recipes-extended/xen/files/<wbr>newlib.patch b/recipe=
s-extended/xen/files/<wbr>newlib.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..ee9b6f2<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/xen/files/<wbr>newlib.patch<br>
&gt;&gt; @@ -0,0 +1,727 @@<br>
&gt;&gt; +There is a mix between longs and long longs.<br>
&gt;&gt; +<br>
&gt;&gt; +Index: newlib/libc/include/inttypes.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
&gt;&gt; +RCS file: /cvs/src/src/newlib/libc/<wbr>include/inttypes.h,v<br>
&gt;&gt; +retrieving revision 1.3<br>
&gt;&gt; +diff -u -p -r1.3 inttypes.h<br>
&gt;&gt; +--- newlib/libc/include/inttypes.h=C2=A0 =C2=A0 =C2=A016 Dec 2005=
 19:03:12 -0000=C2=A0 =C2=A0 =C2=A0 1.3<br>
&gt;&gt; ++++ newlib/libc/include/inttypes.h=C2=A0 =C2=A0 =C2=A08 Nov 2007 =
16:32:44 -0000<br>
&gt;&gt; +@@ -163,12 +163,12 @@<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; + /* 64-bit types */<br>
&gt;&gt; +-#if __have_longlong64<br>
&gt;&gt; +-#define __PRI64(x) __STRINGIFY(ll##x)<br>
&gt;&gt; +-#define __SCN64(x) __STRINGIFY(ll##x)<br>
&gt;&gt; +-#elif __have_long64<br>
&gt;&gt; ++#if __have_long64<br>
&gt;&gt; + #define __PRI64(x) __STRINGIFY(l##x)<br>
&gt;&gt; + #define __SCN64(x) __STRINGIFY(l##x)<br>
&gt;&gt; ++#elif __have_longlong64<br>
&gt;&gt; ++#define __PRI64(x) __STRINGIFY(ll##x)<br>
&gt;&gt; ++#define __SCN64(x) __STRINGIFY(ll##x)<br>
&gt;&gt; + #else<br>
&gt;&gt; + #define __PRI64(x) __STRINGIFY(x)<br>
&gt;&gt; + #define __SCN64(x) __STRINGIFY(x)<br>
&gt;&gt; +@@ -217,12 +217,12 @@<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; + /* max-bit types */<br>
&gt;&gt; +-#if __have_longlong64<br>
&gt;&gt; +-#define __PRIMAX(x) __STRINGIFY(ll##x)<br>
&gt;&gt; +-#define __SCNMAX(x) __STRINGIFY(ll##x)<br>
&gt;&gt; +-#elif __have_long64<br>
&gt;&gt; ++#if __have_long64<br>
&gt;&gt; + #define __PRIMAX(x) __STRINGIFY(l##x)<br>
&gt;&gt; + #define __SCNMAX(x) __STRINGIFY(l##x)<br>
&gt;&gt; ++#elif __have_longlong64<br>
&gt;&gt; ++#define __PRIMAX(x) __STRINGIFY(ll##x)<br>
&gt;&gt; ++#define __SCNMAX(x) __STRINGIFY(ll##x)<br>
&gt;&gt; + #else<br>
&gt;&gt; + #define __PRIMAX(x) __STRINGIFY(x)<br>
&gt;&gt; + #define __SCNMAX(x) __STRINGIFY(x)<br>
&gt;&gt; +@@ -242,12 +242,12 @@<br>
&gt;&gt; + #define SCNxMAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__SCNMAX(x)<br>
&gt;&gt; +<br>
&gt;&gt; + /* ptr types */<br>
&gt;&gt; +-#if __have_longlong64<br>
&gt;&gt; +-#define __PRIPTR(x) __STRINGIFY(ll##x)<br>
&gt;&gt; +-#define __SCNPTR(x) __STRINGIFY(ll##x)<br>
&gt;&gt; +-#elif __have_long64<br>
&gt;&gt; ++#if __have_long64<br>
&gt;&gt; + #define __PRIPTR(x) __STRINGIFY(l##x)<br>
&gt;&gt; + #define __SCNPTR(x) __STRINGIFY(l##x)<br>
&gt;&gt; ++#elif __have_longlong64<br>
&gt;&gt; ++#define __PRIPTR(x) __STRINGIFY(ll##x)<br>
&gt;&gt; ++#define __SCNPTR(x) __STRINGIFY(ll##x)<br>
&gt;&gt; + #else<br>
&gt;&gt; + #define __PRIPTR(x) __STRINGIFY(x)<br>
&gt;&gt; + #define __SCNPTR(x) __STRINGIFY(x)<br>
&gt;&gt; +<br>
&gt;&gt; +We don&#39;t want u?int32_t to be long as our code assume in a lo=
t of places to be<br>
&gt;&gt; +int.<br>
&gt;&gt; +<br>
&gt;&gt; +Index: newlib/libc/include/stdint.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
&gt;&gt; +RCS file: /cvs/src/src/newlib/libc/<wbr>include/stdint.h,v<br>
&gt;&gt; +retrieving revision 1.10<br>
&gt;&gt; +diff -u -p -r1.10 stdint.h<br>
&gt;&gt; +--- newlib/libc/include/stdint.h=C2=A0 =C2=A0 =C2=A0 =C2=A016 Aug=
 2006 21:39:43 -0000=C2=A0 =C2=A0 =C2=A0 1.10<br>
&gt;&gt; ++++ newlib/libc/include/stdint.h=C2=A0 =C2=A0 =C2=A0 =C2=A012 Feb=
 2008 13:07:52 -0000<br>
&gt;&gt; +@@ -38,7 +38,7 @@ extern &quot;C&quot; {<br>
&gt;&gt; + #if __STDINT_EXP(LONG_MAX) &gt; 0x7fffffff<br>
&gt;&gt; + #define __have_long64 1<br>
&gt;&gt; + #elif __STDINT_EXP(LONG_MAX) =3D=3D 0x7fffffff &amp;&amp; !defin=
ed(__SPU__)<br>
&gt;&gt; +-#define __have_long32 1<br>
&gt;&gt; ++/* #define __have_long32 1 */<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; + #if __STDINT_EXP(SCHAR_MAX) =3D=3D 0x7f<br>
&gt;&gt; +<br>
&gt;&gt; +Define the basic ia64 jump buffer<br>
&gt;&gt; +<br>
&gt;&gt; +Index: newlib/libc/include/sys/<wbr>config.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
&gt;&gt; +RCS file: /cvs/src/src/newlib/libc/<wbr>include/sys/config.h,v<br=
>
&gt;&gt; +retrieving revision 1.47<br>
&gt;&gt; +diff -u -p -r1.47 config.h<br>
&gt;&gt; +--- newlib/libc/include/sys/<wbr>config.h=C2=A0 =C2=A015 Mar 2007=
 21:32:12 -0000=C2=A0 =C2=A0 =C2=A0 1.47<br>
&gt;&gt; ++++ newlib/libc/include/sys/<wbr>config.h=C2=A0 =C2=A08 Nov 2007 =
16:32:44 -0000<br>
&gt;&gt; +@@ -71,6 +71,10 @@<br>
&gt;&gt; + #endif<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; ++#ifndef __DYNAMIC_REENT__<br>
&gt;&gt; ++#define __DYNAMIC_REENT__<br>
&gt;&gt; ++#endif<br>
&gt;&gt; ++<br>
&gt;&gt; + #ifdef __mn10200__<br>
&gt;&gt; + #define __SMALL_BITFIELDS<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; +Dynamic pointer to our reentrancy zone<br>
&gt;&gt; +<br>
&gt;&gt; +Index: newlib/libc/reent/getreent.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
&gt;&gt; +RCS file: /cvs/src/src/newlib/libc/<wbr>reent/getreent.c,v<br>
&gt;&gt; +retrieving revision 1.2<br>
&gt;&gt; +diff -u -p -r1.2 getreent.c<br>
&gt;&gt; +--- newlib/libc/reent/getreent.c=C2=A0 =C2=A0 =C2=A0 =C2=A07 Sep =
2007 00:45:55 -0000=C2=A0 =C2=A0 =C2=A0 =C2=A01.2<br>
&gt;&gt; ++++ newlib/libc/reent/getreent.c=C2=A0 =C2=A0 =C2=A0 =C2=A08 Nov =
2007 16:32:44 -0000<br>
&gt;&gt; +@@ -3,12 +3,20 @@<br>
&gt;&gt; + #include &lt;_ansi.h&gt;<br>
&gt;&gt; + #include &lt;reent.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; ++#define weak_alias(name, aliasname) \<br>
&gt;&gt; ++=C2=A0 extern __typeof (name) aliasname __attribute__ ((weak, al=
ias (#name)));<br>
&gt;&gt; ++<br>
&gt;&gt; + #ifdef __getreent<br>
&gt;&gt; + #undef __getreent<br>
&gt;&gt; + #endif<br>
&gt;&gt; ++#ifdef __libc_getreent<br>
&gt;&gt; ++#undef __libc_getreent<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +<br>
&gt;&gt; + struct _reent *<br>
&gt;&gt; +-_DEFUN_VOID(__getreent)<br>
&gt;&gt; ++__libc_getreent (void)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0return _impure_ptr;<br>
&gt;&gt; + }<br>
&gt;&gt; ++weak_alias(__libc_getreent,_<wbr>_getreent)<br>
&gt;&gt; ++<br>
&gt;&gt; +<br>
&gt;&gt; +We can&#39;t provide a red zone in mini-os.<br>
&gt;&gt; +<br>
&gt;&gt; +Index: newlib/libc/machine/x86_64/<wbr>memcpy.S<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
&gt;&gt; +RCS file: /cvs/src/src/newlib/libc/<wbr>machine/x86_64/memcpy.S,v=
<br>
&gt;&gt; +retrieving revision 1.1<br>
&gt;&gt; +diff -u -p -r1.1 memcpy.S<br>
&gt;&gt; +--- newlib/libc/machine/x86_64/<wbr>memcpy.S=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 28 Aug 2007 21:56:49 -0000=C2=A0 =C2=A0 =C2=A0 1.1<br>
&gt;&gt; ++++ newlib/libc/machine/x86_64/<wbr>memcpy.S=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 8 Nov 2007 16:32:44 -0000<br>
&gt;&gt; +@@ -30,10 +30,18 @@ quadword_aligned:<br>
&gt;&gt; +=C2=A0 =C2=A0cmpq=C2=A0 =C2=A0 $256, rdx<br>
&gt;&gt; +=C2=A0 =C2=A0jb=C2=A0 =C2=A0 =C2=A0 quadword_copy<br>
&gt;&gt; +<br>
&gt;&gt; ++#if 1<br>
&gt;&gt; ++=C2=A0 subq=C2=A0 =C2=A0 $32, rsp<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 rax, 24 (rsp)<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 r12, 16 (rsp)<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 r13, 8=C2=A0 (rsp)<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 r14, 0=C2=A0 (rsp)<br>
&gt;&gt; ++#else<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 rax, -8=C2=A0 (rsp)<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 r12, -16 (rsp)<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 r13, -24 (rsp)<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 r14, -32 (rsp)<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 rdx, rcx=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Copy 128 bytes at a time with minimum ca=
che polution */<br>
&gt;&gt; +=C2=A0 =C2=A0shrq=C2=A0 =C2=A0 $7, rcx<br>
&gt;&gt; +@@ -89,10 +97,18 @@ loop:<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 rdx, rcx<br>
&gt;&gt; +=C2=A0 =C2=A0andq=C2=A0 =C2=A0 $127, rcx<br>
&gt;&gt; +=C2=A0 =C2=A0rep=C2=A0 =C2=A0 =C2=A0movsb<br>
&gt;&gt; ++#if 1<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 24 (rsp), rax<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 16 (rsp), r12<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 8=C2=A0 (rsp), r13<br>
&gt;&gt; ++=C2=A0 movq=C2=A0 =C2=A0 0=C2=A0 (rsp), r14<br>
&gt;&gt; ++=C2=A0 addq=C2=A0 =C2=A0 $32, rsp<br>
&gt;&gt; ++#else<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 -8=C2=A0 (rsp), rax<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 -16 (rsp), r12<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 -24 (rsp), r13<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 -32 (rsp), r14<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +=C2=A0 =C2=A0ret<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +--- newlib/libc/machine/x86_64/<wbr>x86_64mach.h.orig=C2=A0 =C2=
=A0 =C2=A0 =C2=A02008-07-11 14:57:23.062269000 +0100<br>
&gt;&gt; ++++ newlib/libc/machine/x86_64/<wbr>x86_64mach.h=C2=A0 =C2=A0 200=
8-07-11 14:58:01.262503000 +0100<br>
&gt;&gt; +@@ -22,81 +22,81 @@<br>
&gt;&gt; +<br>
&gt;&gt; + #define REG(x) CONCAT1(__REG_PREFIX__, x)<br>
&gt;&gt; +<br>
&gt;&gt; +-#define rax REG(rax)<br>
&gt;&gt; +-#define rbx REG(rbx)<br>
&gt;&gt; +-#define rcx REG(rcx)<br>
&gt;&gt; +-#define rdx REG(rdx)<br>
&gt;&gt; +-#define rsi REG(rsi)<br>
&gt;&gt; +-#define rdi REG(rdi)<br>
&gt;&gt; +-#define rbp REG(rbp)<br>
&gt;&gt; +-#define rsp REG(rsp)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define r8=C2=A0 REG(r8)<br>
&gt;&gt; +-#define r9=C2=A0 REG(r9)<br>
&gt;&gt; +-#define r10 REG(r10)<br>
&gt;&gt; +-#define r11 REG(r11)<br>
&gt;&gt; +-#define r12 REG(r12)<br>
&gt;&gt; +-#define r13 REG(r13)<br>
&gt;&gt; +-#define r14 REG(r14)<br>
&gt;&gt; +-#define r15 REG(r15)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define eax REG(eax)<br>
&gt;&gt; +-#define ebx REG(ebx)<br>
&gt;&gt; +-#define ecx REG(ecx)<br>
&gt;&gt; +-#define edx REG(edx)<br>
&gt;&gt; +-#define esi REG(esi)<br>
&gt;&gt; +-#define edi REG(edi)<br>
&gt;&gt; +-#define ebp REG(ebp)<br>
&gt;&gt; +-#define esp REG(esp)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define st0 REG(st)<br>
&gt;&gt; +-#define st1 REG(st(1))<br>
&gt;&gt; +-#define st2 REG(st(2))<br>
&gt;&gt; +-#define st3 REG(st(3))<br>
&gt;&gt; +-#define st4 REG(st(4))<br>
&gt;&gt; +-#define st5 REG(st(5))<br>
&gt;&gt; +-#define st6 REG(st(6))<br>
&gt;&gt; +-#define st7 REG(st(7))<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define ax REG(ax)<br>
&gt;&gt; +-#define bx REG(bx)<br>
&gt;&gt; +-#define cx REG(cx)<br>
&gt;&gt; +-#define dx REG(dx)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define ah REG(ah)<br>
&gt;&gt; +-#define bh REG(bh)<br>
&gt;&gt; +-#define ch REG(ch)<br>
&gt;&gt; +-#define dh REG(dh)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define al REG(al)<br>
&gt;&gt; +-#define bl REG(bl)<br>
&gt;&gt; +-#define cl REG(cl)<br>
&gt;&gt; +-#define dl REG(dl)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define sil REG(sil)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define mm1 REG(mm1)<br>
&gt;&gt; +-#define mm2 REG(mm2)<br>
&gt;&gt; +-#define mm3 REG(mm3)<br>
&gt;&gt; +-#define mm4 REG(mm4)<br>
&gt;&gt; +-#define mm5 REG(mm5)<br>
&gt;&gt; +-#define mm6 REG(mm6)<br>
&gt;&gt; +-#define mm7 REG(mm7)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define xmm0 REG(xmm0)<br>
&gt;&gt; +-#define xmm1 REG(xmm1)<br>
&gt;&gt; +-#define xmm2 REG(xmm2)<br>
&gt;&gt; +-#define xmm3 REG(xmm3)<br>
&gt;&gt; +-#define xmm4 REG(xmm4)<br>
&gt;&gt; +-#define xmm5 REG(xmm5)<br>
&gt;&gt; +-#define xmm6 REG(xmm6)<br>
&gt;&gt; +-#define xmm7 REG(xmm7)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define cr0 REG(cr0)<br>
&gt;&gt; +-#define cr1 REG(cr1)<br>
&gt;&gt; +-#define cr2 REG(cr2)<br>
&gt;&gt; +-#define cr3 REG(cr3)<br>
&gt;&gt; +-#define cr4 REG(cr4)<br>
&gt;&gt; ++#define rax %rax<br>
&gt;&gt; ++#define rbx %rbx<br>
&gt;&gt; ++#define rcx %rcx<br>
&gt;&gt; ++#define rdx %rdx<br>
&gt;&gt; ++#define rsi %rsi<br>
&gt;&gt; ++#define rdi %rdi<br>
&gt;&gt; ++#define rbp %rbp<br>
&gt;&gt; ++#define rsp %rsp<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define r8=C2=A0 %r8<br>
&gt;&gt; ++#define r9=C2=A0 %r9<br>
&gt;&gt; ++#define r10 %r10<br>
&gt;&gt; ++#define r11 %r11<br>
&gt;&gt; ++#define r12 %r12<br>
&gt;&gt; ++#define r13 %r13<br>
&gt;&gt; ++#define r14 %r14<br>
&gt;&gt; ++#define r15 %r15<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define eax %eax<br>
&gt;&gt; ++#define ebx %ebx<br>
&gt;&gt; ++#define ecx %ecx<br>
&gt;&gt; ++#define edx %edx<br>
&gt;&gt; ++#define esi %esi<br>
&gt;&gt; ++#define edi %edi<br>
&gt;&gt; ++#define ebp %ebp<br>
&gt;&gt; ++#define esp %esp<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define st0 %st<br>
&gt;&gt; ++#define st1 %st(1)<br>
&gt;&gt; ++#define st2 %st(2)<br>
&gt;&gt; ++#define st3 %st(3)<br>
&gt;&gt; ++#define st4 %st(4)<br>
&gt;&gt; ++#define st5 %st(5)<br>
&gt;&gt; ++#define st6 %st(6)<br>
&gt;&gt; ++#define st7 %st(7)<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define ax %ax<br>
&gt;&gt; ++#define bx %bx<br>
&gt;&gt; ++#define cx %cx<br>
&gt;&gt; ++#define dx %dx<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define ah %ah<br>
&gt;&gt; ++#define bh %bh<br>
&gt;&gt; ++#define ch %ch<br>
&gt;&gt; ++#define dh %dh<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define al %al<br>
&gt;&gt; ++#define bl %bl<br>
&gt;&gt; ++#define cl %cl<br>
&gt;&gt; ++#define dl %dl<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define sil %sil<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define mm1 %mm1<br>
&gt;&gt; ++#define mm2 %mm2<br>
&gt;&gt; ++#define mm3 %mm3<br>
&gt;&gt; ++#define mm4 %mm4<br>
&gt;&gt; ++#define mm5 %mm5<br>
&gt;&gt; ++#define mm6 %mm6<br>
&gt;&gt; ++#define mm7 %mm7<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define xmm0 %xmm0<br>
&gt;&gt; ++#define xmm1 %xmm1<br>
&gt;&gt; ++#define xmm2 %xmm2<br>
&gt;&gt; ++#define xmm3 %xmm3<br>
&gt;&gt; ++#define xmm4 %xmm4<br>
&gt;&gt; ++#define xmm5 %xmm5<br>
&gt;&gt; ++#define xmm6 %xmm6<br>
&gt;&gt; ++#define xmm7 %xmm7<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define cr0 %cr0<br>
&gt;&gt; ++#define cr1 %cr1<br>
&gt;&gt; ++#define cr2 %cr2<br>
&gt;&gt; ++#define cr3 %cr3<br>
&gt;&gt; ++#define cr4 %cr4<br>
&gt;&gt; +<br>
&gt;&gt; + #ifdef _I386MACH_NEED_SOTYPE_FUNCTION<br>
&gt;&gt; + #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function<br>
&gt;&gt; +--- newlib/libc/machine/x86_64/<wbr>memcpy.S.orig=C2=A0 =C2=A0200=
8-07-11 15:12:27.494693000 +0100<br>
&gt;&gt; ++++ newlib/libc/machine/x86_64/<wbr>memcpy.S=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2008-07-11 15:12:29.448706000 +0100<br>
&gt;&gt; +@@ -60,14 +60,14 @@<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 48 (rsi), r13<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 56 (rsi), r14<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 =C2=A0 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r8 ,=C2=A0 8 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r9 , 16 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r10, 24 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r11, 32 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r12, 40 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r13, 48 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r14, 56 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 =C2=A0 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r8 ,=C2=A0 8 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r9 , 16 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r10, 24 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r11, 32 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r12, 40 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r13, 48 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r14, 56 (rdi)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 =C2=A064 (rsi), rax<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 =C2=A072 (rsi), r8<br>
&gt;&gt; +@@ -78,14 +78,14 @@<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 112 (rsi), r13<br>
&gt;&gt; +=C2=A0 =C2=A0movq=C2=A0 =C2=A0 120 (rsi), r14<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 64 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r8 ,=C2=A0 72 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r9 ,=C2=A0 80 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r10,=C2=A0 88 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r11,=C2=A0 96 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r12, 104 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r13, 112 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq r14, 120 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 64 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r8 ,=C2=A0 72 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r9 ,=C2=A0 80 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r10,=C2=A0 88 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r11,=C2=A0 96 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r12, 104 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r13, 112 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti r14, 120 (rdi)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0leaq=C2=A0 =C2=A0 128 (rsi), rsi<br>
&gt;&gt; +=C2=A0 =C2=A0leaq=C2=A0 =C2=A0 128 (rdi), rdi<br>
&gt;&gt; +--- newlib/libc/machine/i386/<wbr>i386mach.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2000-08-28 18:50:06.000000000 +0100<br>
&gt;&gt; ++++ newlib/libc/machine/i386/<wbr>i386mach.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2008-07-11 15:17:13.874409000 +0100<br>
&gt;&gt; +@@ -27,46 +27,46 @@<br>
&gt;&gt; +<br>
&gt;&gt; + #define REG(x) CONCAT1(__REG_PREFIX__, x)<br>
&gt;&gt; +<br>
&gt;&gt; +-#define eax REG(eax)<br>
&gt;&gt; +-#define ebx REG(ebx)<br>
&gt;&gt; +-#define ecx REG(ecx)<br>
&gt;&gt; +-#define edx REG(edx)<br>
&gt;&gt; +-#define esi REG(esi)<br>
&gt;&gt; +-#define edi REG(edi)<br>
&gt;&gt; +-#define ebp REG(ebp)<br>
&gt;&gt; +-#define esp REG(esp)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define st0 REG(st)<br>
&gt;&gt; +-#define st1 REG(st(1))<br>
&gt;&gt; +-#define st2 REG(st(2))<br>
&gt;&gt; +-#define st3 REG(st(3))<br>
&gt;&gt; +-#define st4 REG(st(4))<br>
&gt;&gt; +-#define st5 REG(st(5))<br>
&gt;&gt; +-#define st6 REG(st(6))<br>
&gt;&gt; +-#define st7 REG(st(7))<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define ax REG(ax)<br>
&gt;&gt; +-#define bx REG(bx)<br>
&gt;&gt; +-#define cx REG(cx)<br>
&gt;&gt; +-#define dx REG(dx)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define ah REG(ah)<br>
&gt;&gt; +-#define bh REG(bh)<br>
&gt;&gt; +-#define ch REG(ch)<br>
&gt;&gt; +-#define dh REG(dh)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define al REG(al)<br>
&gt;&gt; +-#define bl REG(bl)<br>
&gt;&gt; +-#define cl REG(cl)<br>
&gt;&gt; +-#define dl REG(dl)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define mm1 REG(mm1)<br>
&gt;&gt; +-#define mm2 REG(mm2)<br>
&gt;&gt; +-#define mm3 REG(mm3)<br>
&gt;&gt; +-#define mm4 REG(mm4)<br>
&gt;&gt; +-#define mm5 REG(mm5)<br>
&gt;&gt; +-#define mm6 REG(mm6)<br>
&gt;&gt; +-#define mm7 REG(mm7)<br>
&gt;&gt; ++#define eax %eax<br>
&gt;&gt; ++#define ebx %ebx<br>
&gt;&gt; ++#define ecx %ecx<br>
&gt;&gt; ++#define edx %edx<br>
&gt;&gt; ++#define esi %esi<br>
&gt;&gt; ++#define edi %edi<br>
&gt;&gt; ++#define ebp %ebp<br>
&gt;&gt; ++#define esp %esp<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define st0 %st<br>
&gt;&gt; ++#define st1 %st(1)<br>
&gt;&gt; ++#define st2 %st(2)<br>
&gt;&gt; ++#define st3 %st(3)<br>
&gt;&gt; ++#define st4 %st(4)<br>
&gt;&gt; ++#define st5 %st(5)<br>
&gt;&gt; ++#define st6 %st(6)<br>
&gt;&gt; ++#define st7 %st(7)<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define ax %ax<br>
&gt;&gt; ++#define bx %bx<br>
&gt;&gt; ++#define cx %cx<br>
&gt;&gt; ++#define dx %dx<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define ah %ah<br>
&gt;&gt; ++#define bh %bh<br>
&gt;&gt; ++#define ch %ch<br>
&gt;&gt; ++#define dh %dh<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define al %al<br>
&gt;&gt; ++#define bl %bl<br>
&gt;&gt; ++#define cl %cl<br>
&gt;&gt; ++#define dl %dl<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define mm1 %mm1<br>
&gt;&gt; ++#define mm2 %mm2<br>
&gt;&gt; ++#define mm3 %mm3<br>
&gt;&gt; ++#define mm4 %mm4<br>
&gt;&gt; ++#define mm5 %mm5<br>
&gt;&gt; ++#define mm6 %mm6<br>
&gt;&gt; ++#define mm7 %mm7<br>
&gt;&gt; +<br>
&gt;&gt; + #ifdef _I386MACH_NEED_SOTYPE_FUNCTION<br>
&gt;&gt; + #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function<br>
&gt;&gt; +--- newlib/libc/machine/x86_64/<wbr>memset.S=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2007-08-28 22:56:49.000000000 +0100<br>
&gt;&gt; ++++ newlib/libc/machine/x86_64/<wbr>memset.S=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2008-07-11 15:16:59.098320000 +0100<br>
&gt;&gt; +@@ -40,22 +40,22 @@<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0.p2align 4<br>
&gt;&gt; + loop:<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 =C2=A0 =C2=A0(rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 =C2=A08 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 16 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 24 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 32 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 40 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 48 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 56 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 64 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 72 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 80 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 88 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax,=C2=A0 96 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax, 104 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax, 112 (rdi)<br>
&gt;&gt; +-=C2=A0 movntiq rax, 120 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 =C2=A0 =C2=A0(rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 =C2=A08 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 16 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 24 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 32 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 40 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 48 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 56 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 64 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 72 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 80 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 88 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax,=C2=A0 96 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax, 104 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax, 112 (rdi)<br>
&gt;&gt; ++=C2=A0 movnti rax, 120 (rdi)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0leaq=C2=A0 =C2=A0 128 (rdi), rdi<br>
&gt;&gt; +<br>
&gt;&gt; +--- newlib/libm/machine/i386/<wbr>i386mach.h.orig=C2=A0 =C2=A0200=
8-07-11 15:30:37.367227000 +0100<br>
&gt;&gt; ++++ newlib/libm/machine/i386/<wbr>i386mach.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2008-07-11 15:30:55.232337000 +0100<br>
&gt;&gt; +@@ -27,46 +27,46 @@<br>
&gt;&gt; +<br>
&gt;&gt; + #define REG(x) CONCAT1(__REG_PREFIX__, x)<br>
&gt;&gt; +<br>
&gt;&gt; +-#define eax REG(eax)<br>
&gt;&gt; +-#define ebx REG(ebx)<br>
&gt;&gt; +-#define ecx REG(ecx)<br>
&gt;&gt; +-#define edx REG(edx)<br>
&gt;&gt; +-#define esi REG(esi)<br>
&gt;&gt; +-#define edi REG(edi)<br>
&gt;&gt; +-#define ebp REG(ebp)<br>
&gt;&gt; +-#define esp REG(esp)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define st0 REG(st)<br>
&gt;&gt; +-#define st1 REG(st(1))<br>
&gt;&gt; +-#define st2 REG(st(2))<br>
&gt;&gt; +-#define st3 REG(st(3))<br>
&gt;&gt; +-#define st4 REG(st(4))<br>
&gt;&gt; +-#define st5 REG(st(5))<br>
&gt;&gt; +-#define st6 REG(st(6))<br>
&gt;&gt; +-#define st7 REG(st(7))<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define ax REG(ax)<br>
&gt;&gt; +-#define bx REG(bx)<br>
&gt;&gt; +-#define cx REG(cx)<br>
&gt;&gt; +-#define dx REG(dx)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define ah REG(ah)<br>
&gt;&gt; +-#define bh REG(bh)<br>
&gt;&gt; +-#define ch REG(ch)<br>
&gt;&gt; +-#define dh REG(dh)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define al REG(al)<br>
&gt;&gt; +-#define bl REG(bl)<br>
&gt;&gt; +-#define cl REG(cl)<br>
&gt;&gt; +-#define dl REG(dl)<br>
&gt;&gt; +-<br>
&gt;&gt; +-#define mm1 REG(mm1)<br>
&gt;&gt; +-#define mm2 REG(mm2)<br>
&gt;&gt; +-#define mm3 REG(mm3)<br>
&gt;&gt; +-#define mm4 REG(mm4)<br>
&gt;&gt; +-#define mm5 REG(mm5)<br>
&gt;&gt; +-#define mm6 REG(mm6)<br>
&gt;&gt; +-#define mm7 REG(mm7)<br>
&gt;&gt; ++#define eax %eax<br>
&gt;&gt; ++#define ebx %ebx<br>
&gt;&gt; ++#define ecx %ecx<br>
&gt;&gt; ++#define edx %edx<br>
&gt;&gt; ++#define esi %esi<br>
&gt;&gt; ++#define edi %edi<br>
&gt;&gt; ++#define ebp %ebp<br>
&gt;&gt; ++#define esp %esp<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define st0 %st<br>
&gt;&gt; ++#define st1 %st(1)<br>
&gt;&gt; ++#define st2 %st(2)<br>
&gt;&gt; ++#define st3 %st(3)<br>
&gt;&gt; ++#define st4 %st(4)<br>
&gt;&gt; ++#define st5 %st(5)<br>
&gt;&gt; ++#define st6 %st(6)<br>
&gt;&gt; ++#define st7 %st(7)<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define ax %ax<br>
&gt;&gt; ++#define bx %bx<br>
&gt;&gt; ++#define cx %cx<br>
&gt;&gt; ++#define dx %dx<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define ah %ah<br>
&gt;&gt; ++#define bh %bh<br>
&gt;&gt; ++#define ch %ch<br>
&gt;&gt; ++#define dh %dh<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define al %al<br>
&gt;&gt; ++#define bl %bl<br>
&gt;&gt; ++#define cl %cl<br>
&gt;&gt; ++#define dl %dl<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define mm1 %mm1<br>
&gt;&gt; ++#define mm2 %mm2<br>
&gt;&gt; ++#define mm3 %mm3<br>
&gt;&gt; ++#define mm4 %mm4<br>
&gt;&gt; ++#define mm5 %mm5<br>
&gt;&gt; ++#define mm6 %mm6<br>
&gt;&gt; ++#define mm7 %mm7<br>
&gt;&gt; +<br>
&gt;&gt; + #ifdef _I386MACH_NEED_SOTYPE_FUNCTION<br>
&gt;&gt; + #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +We want to have a 64bit offsets libc even on 32bit platforms.<br>
&gt;&gt; +<br>
&gt;&gt; +--- ./newlib/configure.host.orig=C2=A0 =C2=A0 =C2=A0 =C2=A02008-0=
8-07 16:01:17.801946000 +0100<br>
&gt;&gt; ++++ ./newlib/configure.host=C2=A0 =C2=A0 2008-08-07 16:01:34.1810=
64000 +0100<br>
&gt;&gt; +@@ -317,6 +317,8 @@<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0oext=3Dlo<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0lpfx=3D<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0aext=3Dla ;;<br>
&gt;&gt; ++=C2=A0 i[34567]86-xen-elf)<br>
&gt;&gt; ++=C2=A0 =C2=A0 stdio64_dir=3Dstdio64 ;;<br>
&gt;&gt; +=C2=A0 =C2=A0*) ;; #shared library not supported for ${host}<br>
&gt;&gt; + esac<br>
&gt;&gt; +<br>
&gt;&gt; +--- newlib/libc/include/sys/_<wbr>types.h.orig=C2=A0 =C2=A0 =C2=
=A0 2008-08-07 15:22:44.925008000 +0100<br>
&gt;&gt; ++++ newlib/libc/include/sys/_<wbr>types.h=C2=A0 =C2=A02008-08-07 =
15:22:50.824044000 +0100<br>
&gt;&gt; +@@ -13,8 +13,12 @@<br>
&gt;&gt; + #include &lt;sys/lock.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; + #ifndef __off_t_defined<br>
&gt;&gt; ++#ifdef __MINIOS__<br>
&gt;&gt; ++typedef long long _off_t;<br>
&gt;&gt; ++#else<br>
&gt;&gt; + typedef long _off_t;<br>
&gt;&gt; + #endif<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +<br>
&gt;&gt; + #if defined(__rtems__)<br>
&gt;&gt; + /* device numbers are 32-bit major and and 32-bit minor */<br>
&gt;&gt; +--- ./newlib/libc/include/sys/<wbr>config.h.orig=C2=A0 =C2=A0 200=
8-08-07 14:43:25.915866000 +0100<br>
&gt;&gt; ++++ ./newlib/libc/include/sys/<wbr>config.h 2008-08-07 14:44:13.5=
08154000 +0100<br>
&gt;&gt; +@@ -69,6 +69,10 @@<br>
&gt;&gt; + /* we use some glibc header files so turn on glibc large file fe=
ature */<br>
&gt;&gt; + #define _LARGEFILE64_SOURCE 1<br>
&gt;&gt; + #endif<br>
&gt;&gt; ++#ifdef __MINIOS__<br>
&gt;&gt; ++#define __LARGE64_FILES 1<br>
&gt;&gt; ++#define _LARGEFILE64_SOURCE 1<br>
&gt;&gt; ++#endif<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; + #ifndef __DYNAMIC_REENT__<br>
&gt;&gt; +--- ./newlib/libc/include/sys/_<wbr>default_fcntl.h.orig=C2=A0 =
=C2=A0 2008-08-07 15:08:22.377836000 +0100<br>
&gt;&gt; ++++ ./newlib/libc/include/sys/_<wbr>default_fcntl.h 2008-08-07 15=
:08:31.651890000 +0100<br>
&gt;&gt; +@@ -170,7 +170,11 @@<br>
&gt;&gt; + /* Provide _&lt;systemcall&gt; prototypes for functions provided=
 by some versions<br>
&gt;&gt; +=C2=A0 =C2=A0 of newlib.=C2=A0 */<br>
&gt;&gt; + #ifdef _COMPILING_NEWLIB<br>
&gt;&gt; +-extern int _open _PARAMS ((const char *, int, ...));<br>
&gt;&gt; ++extern int _open _PARAMS ((const char *, int, ...))<br>
&gt;&gt; ++#ifdef __MINIOS__<br>
&gt;&gt; ++=C2=A0 =C2=A0 asm(&quot;open64&quot;)<br>
&gt;&gt; ++#endif<br>
&gt;&gt; ++=C2=A0 =C2=A0 ;<br>
&gt;&gt; + extern int _fcntl _PARAMS ((int, int, ...));<br>
&gt;&gt; + #ifdef __LARGE64_FILES<br>
&gt;&gt; + extern int _open64 _PARAMS ((const char *, int, ...));<br>
&gt;&gt; +--- ./newlib/libc/include/sys/<wbr>unistd.h.orig=C2=A0 =C2=A0 200=
8-08-07 15:09:36.449280000 +0100<br>
&gt;&gt; ++++ ./newlib/libc/include/sys/<wbr>unistd.h 2008-08-07 15:09:51.2=
10370000 +0100<br>
&gt;&gt; +@@ -101,7 +101,11 @@<br>
&gt;&gt; + int=C2=A0 =C2=A0 =C2=A0_EXFUN(link, (const char *__path1, const =
char *__path2 ));<br>
&gt;&gt; + int=C2=A0 =C2=A0_EXFUN(nice, (int __nice_value ));<br>
&gt;&gt; + #if !defined(__INSIDE_CYGWIN__)<br>
&gt;&gt; +-off_t=C2=A0 =C2=A0_EXFUN(lseek, (int __fildes, off_t __offset, i=
nt __whence ));<br>
&gt;&gt; ++off_t=C2=A0 =C2=A0_EXFUN(lseek, (int __fildes, off_t __offset, i=
nt __whence ))<br>
&gt;&gt; ++#ifdef __MINIOS__<br>
&gt;&gt; ++=C2=A0 =C2=A0 asm(&quot;lseek64&quot;)<br>
&gt;&gt; ++#endif<br>
&gt;&gt; ++=C2=A0 =C2=A0 ;<br>
&gt;&gt; + #endif<br>
&gt;&gt; + #if defined(__SPU__)<br>
&gt;&gt; + #define F_ULOCK=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;&gt; +--- ./newlib/libc/include/sys/<wbr>stat.h.orig=C2=A0 =C2=A0 =C2=
=A0 2008-08-07 16:08:50.495116000 +0100<br>
&gt;&gt; ++++ ./newlib/libc/include/sys/<wbr>stat.h=C2=A0 =C2=A02008-08-07 =
16:10:21.799753000 +0100<br>
&gt;&gt; +@@ -49,6 +49,9 @@<br>
&gt;&gt; +=C2=A0 =C2=A0long=C2=A0 =C2=A0 =C2=A0 =C2=A0 st_spare4[2];<br>
&gt;&gt; + #endif<br>
&gt;&gt; + };<br>
&gt;&gt; ++#ifdef __MINIOS__<br>
&gt;&gt; ++#define stat64 stat<br>
&gt;&gt; ++#endif<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; + #define=C2=A0 =C2=A0 =C2=A0 =C2=A0_IFMT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00170000 /* type of file */<br>
&gt;&gt; +@@ -132,7 +135,11 @@<br>
&gt;&gt; + /* Provide prototypes for most of the _&lt;systemcall&gt; names =
that are<br>
&gt;&gt; +=C2=A0 =C2=A0 provided in newlib for some compilers.=C2=A0 */<br>
&gt;&gt; + #ifdef _COMPILING_NEWLIB<br>
&gt;&gt; +-int=C2=A0 =C2=A0_EXFUN(_fstat,( int __fd, struct stat *__sbuf ))=
;<br>
&gt;&gt; ++int=C2=A0 =C2=A0_EXFUN(_fstat,( int __fd, struct stat *__sbuf ))=
<br>
&gt;&gt; ++#ifdef __MINIOS__<br>
&gt;&gt; ++=C2=A0 =C2=A0 asm(&quot;fstat64&quot;)<br>
&gt;&gt; ++#endif<br>
&gt;&gt; ++=C2=A0 =C2=A0 ;<br>
&gt;&gt; + int=C2=A0 =C2=A0_EXFUN(_stat,( const char *__path, struct stat *=
__sbuf ));<br>
&gt;&gt; + #ifdef __LARGE64_FILES<br>
&gt;&gt; + struct stat64;<br>
&gt;&gt; +--- ./newlib/libc/include/_<wbr>syslist.h.orig=C2=A0 =C2=A0 =C2=
=A0 2008-08-07 16:24:19.122605000 +0100<br>
&gt;&gt; ++++ ./newlib/libc/include/_<wbr>syslist.h=C2=A0 =C2=A02008-08-07 =
16:24:21.548628000 +0100<br>
&gt;&gt; +@@ -14,6 +14,7 @@<br>
&gt;&gt; + #define _kill kill<br>
&gt;&gt; + #define _link link<br>
&gt;&gt; + #define _lseek lseek<br>
&gt;&gt; ++#define _lseek64 lseek64<br>
&gt;&gt; + #define _open open<br>
&gt;&gt; + #define _read read<br>
&gt;&gt; + #define _sbrk sbrk<br>
&gt;&gt; +--- newlib/libc/include/reent.h.<wbr>orig=C2=A0 =C2=A02008-08-07 =
16:28:49.846502000 +0100<br>
&gt;&gt; ++++ newlib/libc/include/reent.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 2008-0=
8-07 16:29:02.096586000 +0100<br>
&gt;&gt; +@@ -87,6 +87,9 @@<br>
&gt;&gt; + #if defined(__CYGWIN__) &amp;&amp; defined(_COMPILING_NEWLIB)<br=
>
&gt;&gt; + #define stat64 __stat64<br>
&gt;&gt; + #endif<br>
&gt;&gt; ++#if defined(__MINIOS__)<br>
&gt;&gt; ++#define stat64 stat<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +<br>
&gt;&gt; + struct stat64;<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/recipes-extended/xen/newlib.<wbr>inc b/recipes-extend=
ed/xen/newlib.<wbr>inc<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..32d79aa<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/xen/newlib.<wbr>inc<br>
&gt;&gt; @@ -0,0 +1,64 @@<br>
&gt;&gt; +# Copyright (C) 2017 Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodi=
ker@braintrust-us.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
&gt;&gt; +# Released under the MIT license (see COPYING.MIT for the terms)<=
br>
&gt;&gt; +<br>
&gt;&gt; +require stubdom.inc<br>
&gt;&gt; +<br>
&gt;&gt; +CPPFLAGS_INCLUDE_DIR =3D &quot;-isystem `${HOST_PREFIX}gcc -print=
-file-name=3Dinclude`&quot;<br>
&gt;&gt; +STUBDOM_CFLAGS +=3D &quot;-D_I386MACH_ALLOW_HW_<wbr>INTERRUPTS&qu=
ot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_CC_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}gcc --=
sysroot=3D${RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}&quot;<br>
&gt;&gt; +export CC_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>gcc --sysroot=3D$=
{RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_CXX_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}g++ -=
-sysroot=3D${RECIPE_SYSROOT}&quot;<br>
&gt;&gt; +export CXX_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>g++ --sysroot=3D=
${RECIPE_SYSROOT}&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_CPP_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}gcc -=
E --sysroot=3D${RECIPE_SYSROOT}&quot;<br>
&gt;&gt; +export CPP_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>gcc -E --sysroot=
=3D${RECIPE_SYSROOT}&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_LD_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}ld --s=
ysroot=3D${RECIPE_SYSROOT}&quot;<br>
&gt;&gt; +export LD_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>ld --sysroot=3D${=
RECIPE_SYSROOT}&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_AS_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}as&quo=
t;<br>
&gt;&gt; +export AS_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>as&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_AR_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}ar&quo=
t;<br>
&gt;&gt; +export AR_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>ar&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_NM_FOR_TARGET=3D&quot;${<wbr>HOST_PREFIX}nm&quo=
t;<br>
&gt;&gt; +export NM_FOR_TARGET=3D&quot;${HOST_PREFIX}<wbr>nm&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_RANLIB_FOR_TARGET=3D&quot;<wbr>${HOST_PREFIX}ra=
nlib&quot;<br>
&gt;&gt; +export RANLIB_FOR_TARGET=3D&quot;${HOST_<wbr>PREFIX}ranlib&quot;<=
br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_OBJDUMP_FOR_TARGET=3D<wbr>&quot;${HOST_PREFIX}o=
bjdump&quot;<br>
&gt;&gt; +export OBJDUMP_FOR_TARGET=3D&quot;${HOST_<wbr>PREFIX}objdump&quot=
;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_OBJCOPY_FOR_TARGET=3D<wbr>&quot;${HOST_PREFIX}o=
bjcopy&quot;<br>
&gt;&gt; +export OBJCOPY_FOR_TARGET=3D&quot;${HOST_<wbr>PREFIX}objcopy&quot=
;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_STRIP_FOR_TARGET=3D&quot;$<wbr>{HOST_PREFIX}str=
ip&quot;<br>
&gt;&gt; +export STRIP_FOR_TARGET=3D&quot;${HOST_<wbr>PREFIX}strip&quot;<br=
>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_STRINGS_FOR_TARGET=3D<wbr>&quot;${HOST_PREFIX}s=
trings&quot;<br>
&gt;&gt; +export STRINGS_FOR_TARGET=3D&quot;${HOST_<wbr>PREFIX}strings&quot=
;<br>
&gt;&gt; +<br>
&gt;&gt; +export ac_cv_path_READELF_FOR_TARGET=3D<wbr>&quot;${HOST_PREFIX}r=
eadelf&quot;<br>
&gt;&gt; +export READELF_FOR_TARGET=3D&quot;${HOST_<wbr>PREFIX}readelf&quot=
;<br>
&gt;&gt; +<br>
&gt;&gt; +do_configure() {<br>
&gt;&gt; +=C2=A0 =C2=A0 ${S}/configure --verbose --prefix=3D${prefix} --tar=
get=3D${GNU_TARGET_ARCH}-<wbr>xen-elf --enable-newlib-io-long-long --disabl=
e-multilib<br>
&gt;&gt; +=C2=A0 =C2=A0 find ${S} -type f | xargs perl -i.bak -pe &#39;s/\b=
_(tzname|daylight|<wbr>timezone)\b/$1/g&#39;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +do_compile() {<br>
&gt;&gt; +=C2=A0 =C2=A0 ${MAKE}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +do_install() {<br>
&gt;&gt; +=C2=A0 =C2=A0 ${MAKE} DESTDIR=3D${D} install<br>
&gt;&gt; +=C2=A0 =C2=A0 rm -rf ${D}/cross-root-${XEN_TARGET_<wbr>ARCH}/shar=
e<br>
&gt;&gt; +=C2=A0 =C2=A0 rm -rf ${D}/cross-root-${XEN_TARGET_<wbr>ARCH}/info=
<br>
&gt;&gt; +=C2=A0 =C2=A0 install -m 644 `${HOST_PREFIX}gcc -print-file-name=
=3Dinclude`/<wbr>stdarg.h -t ${D}/${includedir}<br>
&gt;&gt; +=C2=A0 =C2=A0 install -m 644 `${HOST_PREFIX}gcc -print-file-name=
=3Dinclude`/<wbr>stddef.h -t ${D}/${includedir}<br>
&gt;&gt; +=C2=A0 =C2=A0 install -m 644 `${HOST_PREFIX}gcc -print-file-name=
=3Dinclude`/<wbr>stdbool.h -t ${D}/${includedir}<br>
&gt;&gt; +}<br>
&gt;&gt; diff --git a/recipes-extended/xen/<a href=3D"http://newlib_1.16.0.=
bb" rel=3D"noreferrer" target=3D"_blank">newlib_<wbr>1.16.0.bb</a> b/recipe=
s-extended/xen/<a href=3D"http://newlib_1.16.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">newlib_<wbr>1.16.0.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..ea80271<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/xen/<a href=3D"http://newlib_1.16.0.bb" rel=
=3D"noreferrer" target=3D"_blank">newlib_<wbr>1.16.0.bb</a><br>
&gt;&gt; @@ -0,0 +1,19 @@<br>
&gt;&gt; +# Copyright (C) 2017 Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodi=
ker@braintrust-us.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
&gt;&gt; +# Released under the MIT license (see COPYING.MIT for the terms)<=
br>
&gt;&gt; +<br>
&gt;&gt; +DESCRIPTION =3D &quot;Newlib is a C library intended for use on e=
mbedded systems.&quot;<br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"http://sourceware.org/newlib" rel=
=3D"noreferrer" target=3D"_blank">http://sourceware.org/newlib</a>&quot;<br=
>
&gt;&gt; +LICENSE =3D &quot;GPLv2 &amp; LGPLv3 &amp; GPLv3 &amp; LGPLv2&quo=
t;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING.NEWLIB;md5=3D<wbr>950f5=
0b290e8fcf7a2d3fff61775de<wbr>9b&quot;<br>
&gt;&gt; +<br>
&gt; I see newlib in a few other oe layers, but nothing that looks to be<br=
>
&gt; common. For my<br>
&gt; own understanding (and when someone asks me about this), is there any<=
br>
&gt; significant<br>
&gt; difference in this newlib implementation/build than you&#39;d find in<=
br>
&gt; other newlib use cases ?<br>
<br>
</div></div>This version is old 2008, the latest is 3.0 but not sure if thi=
s Xen<br>
solution needs 1.7.<br>
<br>
<br>
- armin<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;&gt; +S=3D&quot;${WORKDIR}/newlib&quot;<br>
&gt;&gt; +B=3D&quot;${WORKDIR}/build&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI +=3D &quot;\<br>
&gt;&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://sourceware.org/git/newlib-c=
ygwin.git;protocol=3Dgit;rev=3Dnewlib-${TRANSLATED_PV};destsuffix=3Dnewlib;=
nobranch=3D1;name=3Dnewlib" rel=3D"noreferrer" target=3D"_blank">sourceware=
.org/git/<wbr>newlib-cygwin.git;protocol=3D<wbr>git;rev=3Dnewlib-${TRANSLAT=
ED_<wbr>PV};destsuffix=3Dnewlib;<wbr>nobranch=3D1;name=3Dnewlib</a> \<br>
&gt; Using tags for SRCREVs is generally frowned upon. Is that what this is=
<br>
&gt; doing ? Even if you want to<br>
&gt; use the convenience variable you created, it would still be better to<=
br>
&gt; explicitly set SRCREV in the<br>
&gt; recipes for easier maintenance and to make things more obvious.<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 file://newlib.patch;<wbr>striplevel=3D0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://newlib-chk.patch;<wbr>striplevel=3D0 \<br>
&gt; We really shouldn&#39;t be specifying striplevel on the patches.=C2=A0=
 Why<br>
&gt; aren&#39;t the patches being<br>
&gt; generated in a way that makes then consistent, and that can be applied=
<br>
&gt; with the defaults ?<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 file://newlib-stdint-size_max-<wbr>fix-from-1.17.0.=
patch;<wbr>striplevel=3D1 \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +require newlib.inc<br>
&gt;&gt; --<br>
&gt;&gt; 2.14.2<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt;<br>
&gt;&gt; *This email and all attachments are considered confidential and th=
e<br>
&gt;&gt; proprietary information of BrainTrust Holdings.=C2=A0 Unauthorized=
 disclosure is<br>
&gt;&gt; prohibited.=C2=A0 *<br>
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
<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Ku=
rt Bodiker<br>BrainTrust Holdings<br><a href=3D"http://www.braintrust-us.co=
m" target=3D"_blank">www.braintrust-us.com</a><br><a value=3D"+14434208007"=
>443-296-2186</a> office<br><a value=3D"+14107502119">410-750-2119</a> fax<=
/div></div>
</div>

<br>
<br><font size=3D"1"><i>This email and all attachments are considered confi=
dential and the proprietary information of BrainTrust Holdings.=C2=A0 Unaut=
horized disclosure is prohibited.=C2=A0 </i></font><br>

--94eb2c1125346df75c05673b1612--
