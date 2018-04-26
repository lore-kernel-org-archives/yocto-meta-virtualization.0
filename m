Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4682EE00C11; Thu, 26 Apr 2018 13:17:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA237E00994
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 13:16:31 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id j42-v6so5377778qtj.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HJOkBZ/5KpbfWLzZX/1YSfC0LnPtGbkCDy6bLpX3aFw=;
	b=BZHwgq7zUGwyCcZzUok+TE1a5OiEH3W0kPjPZq+DIC4gpI+sOp0TC9nUm59tgC6Ut8
	YxB41fwMmGmMPRgLn5r2rYOzfuQmxxIRnCTurxz4wY2UlDY2u6N2SgYYybif1EbJGKbJ
	Ksc7vO1gkAeAFI+p9VIWQypXMfQiyXZwKTgrwI7UHfUwAYvB3+1EPs0Jpjog+H/ARcmy
	PMALh391h0TgBFv7AiaZzoHKFDLZSNi7rMkPytzuqCzRx/hrFbO13aTiaBeF6+Ku6sjX
	Dzzw9A4Rn/bozTBqZ8WFlz3ths4YU/frVHTS1p+H7B9Vr+mZn0QltAt1kD7JkfYQbh1F
	YXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=HJOkBZ/5KpbfWLzZX/1YSfC0LnPtGbkCDy6bLpX3aFw=;
	b=FMXmNBiq/XARSFWnsGIkAMxKNhbzejAKCPh8VhIg7vNVtk2aPjxbaLgNIwXILLLpAn
	+FQSXS1vm9mZmbZ+LYVcMdhvfFtNBkHhYv92ON/m3uboedpF8cInHbo/S2+WTAelD9H1
	a/mDRFTKZqnTmq5abniu886c0sYCkeaSsTrm7NzWc+w5pToAqfX5POqKDYOg8i6Oca10
	7DbfgZ69WL6GimweNuE2THFbE7MCMJQxbI/TsZzeLW99WxZMWTmdmT6GEZe0ju5NdH3m
	FVw0a11OSTNgKv6trCGW0AtNQIiqFhMtf86Te+MgUGgjkKhtPAwJDg67X5noxTbtXwXA
	4fhA==
X-Gm-Message-State: ALQs6tA8PJ/VUda5gi02hMGJ5G9TYrBbXTq8kqHX7sPNji49/9BNT0Vy
	/Uinesz4OorCzXXSvDgAmG/Xe3jY+Bqr4AVcOm7xZ3iWEMJZ3slgm1gD00t8ff23yxmssN/C757
	jtN3fueyfcpm7BAGkqAxJpSE8Cq99Fs4=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZq5La2nAEkUA62Cc4c5i9+pTvl1NGWP/ZO00vkDLSLDMrvQnR7ERFfwyTWHz17N10P4BZ93cw==
X-Received: by 2002:aed:24d1:: with SMTP id
	u17-v6mr39188124qtc.116.1524773790214; 
	Thu, 26 Apr 2018 13:16:30 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:45bb:d6b2:8a14:4857])
	by smtp.gmail.com with ESMTPSA id
	j66sm15392647qkf.84.2018.04.26.13.16.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 13:16:29 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 26 Apr 2018 16:15:11 -0400
Message-Id: <6da6ddfac34fbf4fda5683ee2739c0308652a678.1524769930.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v3 4/8] xen: Newlib recipe and patches for Xen stubdoms
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
X-List-Received-Date: Thu, 26 Apr 2018 20:17:34 -0000
Content-Type: text/plain; charset="US-ASCII"

Newlib provides a fast, C library optimized for embedded systems. In the
case of Xen stubdomains, we are using MiniOS. This Newlib recipe creates
static libraries that are cross-compiled against MiniOS, Xen, and LWIP
headers and subsequently used during the cross-compilation and linking
of PolarSSL, the stubdom specific GMP, TPM Emulator, and the Xen vTPM
and vTPM Manager stubdomains. The current Xen source code is hardcoded
to fetch a specific version of this package. The patch files originate
from the Xen/stubdom source tree. This recipe provides the flexibility
to change version or modify the patches.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v3:
 - change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
Changes in v2:
 - Multi-line variables formatted to match OE style guide
 - SRC_URI formatted to use SRCREV rather than git tag
 - patches formatted to striplevel=1
---
 recipes-extended/xen/files/newlib-chk.patch        | 155 +++++
 .../newlib-stdint-size_max-fix-from-1.17.0.patch   |  16 +
 recipes-extended/xen/files/newlib.patch            | 727 +++++++++++++++++++++
 recipes-extended/xen/newlib.inc                    |  64 ++
 recipes-extended/xen/newlib_1.16.0.bb              |  21 +
 5 files changed, 983 insertions(+)
 create mode 100644 recipes-extended/xen/files/newlib-chk.patch
 create mode 100644 recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
 create mode 100644 recipes-extended/xen/files/newlib.patch
 create mode 100644 recipes-extended/xen/newlib.inc
 create mode 100644 recipes-extended/xen/newlib_1.16.0.bb

diff --git a/recipes-extended/xen/files/newlib-chk.patch b/recipes-extended/xen/files/newlib-chk.patch
new file mode 100644
index 0000000..b47943d
--- /dev/null
+++ b/recipes-extended/xen/files/newlib-chk.patch
@@ -0,0 +1,155 @@
+--- a/newlib/libc/stdio/fprintf_chk.c	1969-12-31 19:00:00.000000000 -0500
++++ b/newlib/libc/stdio/fprintf_chk.c	2009-02-26 19:02:53.000000000 -0500
+@@ -0,0 +1,21 @@
++#include <stdarg.h>
++#include <stdio.h>
++
++/*
++ * Stub implementation of __fprintf_chk adapted from glibc 2.7.  This
++ * doesn't actually implement any buffer overflow protection.  It just makes
++ * the linker happy :)
++*/
++int
++__fprintf_chk (FILE *fp, int flag, const char *format, ...)
++{
++  va_list ap;
++  int done;
++
++  va_start (ap, format);
++  done = vfprintf (fp, format, ap);
++  va_end (ap);
++
++  return done;
++}
++
+--- a/newlib/libc/stdio/Makefile.am	2007-08-02 16:23:06.000000000 -0400
++++ b/newlib/libc/stdio/Makefile.am	2009-02-26 18:14:53.000000000 -0500
+@@ -20,6 +20,7 @@
+ 	flags.c			\
+ 	fopen.c			\
+ 	fprintf.c			\
++	fprintf_chk.c		\
+ 	fputc.c			\
+ 	fputs.c			\
+ 	fread.c			\
+@@ -65,6 +66,7 @@
+ 	sniprintf.c			\
+ 	snprintf.c			\
+ 	sprintf.c			\
++	sprintf_chk.c			\
+ 	sscanf.c			\
+ 	stdio.c			\
+ 	tmpfile.c			\
+--- a/newlib/libc/stdio/Makefile.in	2007-12-19 17:36:38.000000000 -0500
++++ b/newlib/libc/stdio/Makefile.in	2009-02-26 18:43:52.000000000 -0500
+@@ -63,7 +63,8 @@
+ 	lib_a-fgets.$(OBJEXT) lib_a-fileno.$(OBJEXT) \
+ 	lib_a-findfp.$(OBJEXT) lib_a-fiprintf.$(OBJEXT) \
+ 	lib_a-flags.$(OBJEXT) lib_a-fopen.$(OBJEXT) \
+-	lib_a-fprintf.$(OBJEXT) lib_a-fputc.$(OBJEXT) \
++	lib_a-fprintf.$(OBJEXT) lib_a-fprintf_chk.$(OBJEXT) \
++	lib_a-fputc.$(OBJEXT) \
+ 	lib_a-fputs.$(OBJEXT) lib_a-fread.$(OBJEXT) \
+ 	lib_a-freopen.$(OBJEXT) lib_a-fscanf.$(OBJEXT) \
+ 	lib_a-fiscanf.$(OBJEXT) lib_a-fseek.$(OBJEXT) \
+@@ -86,6 +87,7 @@
+ 	lib_a-setvbuf.$(OBJEXT) lib_a-siprintf.$(OBJEXT) \
+ 	lib_a-siscanf.$(OBJEXT) lib_a-sniprintf.$(OBJEXT) \
+ 	lib_a-snprintf.$(OBJEXT) lib_a-sprintf.$(OBJEXT) \
++	lib_a-sprintf_chk.$(OBJEXT) \
+ 	lib_a-sscanf.$(OBJEXT) lib_a-stdio.$(OBJEXT) \
+ 	lib_a-tmpfile.$(OBJEXT) lib_a-tmpnam.$(OBJEXT) \
+ 	lib_a-ungetc.$(OBJEXT) lib_a-vdiprintf.$(OBJEXT) \
+@@ -122,15 +124,15 @@
+ LTLIBRARIES = $(noinst_LTLIBRARIES)
+ am__objects_4 = clearerr.lo fclose.lo fdopen.lo feof.lo ferror.lo \
+ 	fflush.lo fgetc.lo fgetpos.lo fgets.lo fileno.lo findfp.lo \
+-	fiprintf.lo flags.lo fopen.lo fprintf.lo fputc.lo fputs.lo \
+-	fread.lo freopen.lo fscanf.lo fiscanf.lo fseek.lo fsetpos.lo \
++	fiprintf.lo flags.lo fopen.lo fprintf.lo fprintf_chk.lo fputc.lo \
++	fputs.lo fread.lo freopen.lo fscanf.lo fiscanf.lo fseek.lo fsetpos.lo \
+ 	ftell.lo fvwrite.lo fwalk.lo fwrite.lo getc.lo getchar.lo \
+ 	getc_u.lo getchar_u.lo getdelim.lo getline.lo gets.lo \
+ 	iprintf.lo iscanf.lo makebuf.lo perror.lo printf.lo putc.lo \
+ 	putchar.lo putc_u.lo putchar_u.lo puts.lo refill.lo remove.lo \
+ 	rename.lo rewind.lo rget.lo scanf.lo sccl.lo setbuf.lo \
+ 	setbuffer.lo setlinebuf.lo setvbuf.lo siprintf.lo siscanf.lo \
+-	sniprintf.lo snprintf.lo sprintf.lo sscanf.lo stdio.lo \
++	sniprintf.lo snprintf.lo sprintf.lo sprintf_chk.lo sscanf.lo stdio.lo \
+ 	tmpfile.lo tmpnam.lo ungetc.lo vdiprintf.lo vdprintf.lo \
+ 	viprintf.lo viscanf.lo vprintf.lo vscanf.lo vsiprintf.lo \
+ 	vsiscanf.lo vsnprintf.lo vsniprintf.lo vsprintf.lo vsscanf.lo \
+@@ -344,6 +346,7 @@
+ 	flags.c			\
+ 	fopen.c			\
+ 	fprintf.c			\
++	fprintf_chk.c			\
+ 	fputc.c			\
+ 	fputs.c			\
+ 	fread.c			\
+@@ -389,6 +392,7 @@
+ 	sniprintf.c			\
+ 	snprintf.c			\
+ 	sprintf.c			\
++	sprintf_chk.c			\
+ 	sscanf.c			\
+ 	stdio.c			\
+ 	tmpfile.c			\
+@@ -508,6 +512,7 @@
+ 	siprintf.def		\
+ 	siscanf.def		\
+ 	sprintf.def		\
++	sprintf_chk.def		\
+ 	sscanf.def		\
+ 	tmpfile.def		\
+ 	tmpnam.def		\
+@@ -678,6 +683,12 @@
+ lib_a-fprintf.obj: fprintf.c
+ 	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf.obj `if test -f 'fprintf.c'; then $(CYGPATH_W) 'fprintf.c'; else $(CYGPATH_W) '$(srcdir)/fprintf.c'; fi`
+
++lib_a-fprintf_chk.o: fprintf_chk.c
++	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf_chk.o `test -f 'fprintf_chk.c' || echo '$(srcdir)/'`fprintf_chk.c
++
++lib_a-fprintf_chk.obj: fprintf_chk.c
++	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fprintf_chk.obj `if test -f 'fprintf_chk.c'; then $(CYGPATH_W) 'fprintf_chk.c'; else $(CYGPATH_W) '$(srcdir)/fprintf_chk.c'; fi`
++
+ lib_a-fputc.o: fputc.c
+ 	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-fputc.o `test -f 'fputc.c' || echo '$(srcdir)/'`fputc.c
+
+@@ -948,6 +959,12 @@
+ lib_a-sprintf.obj: sprintf.c
+ 	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf.obj `if test -f 'sprintf.c'; then $(CYGPATH_W) 'sprintf.c'; else $(CYGPATH_W) '$(srcdir)/sprintf.c'; fi`
+
++lib_a-sprintf_chk.o: sprintf_chk.c
++	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf_chk.o `test -f 'sprintf_chk.c' || echo '$(srcdir)/'`sprintf_chk.c
++
++lib_a-sprintf_chk.obj: sprintf_chk.c
++	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sprintf_chk.obj `if test -f 'sprintf_chk.c'; then $(CYGPATH_W) 'sprintf_chk.c'; else $(CYGPATH_W) '$(srcdir)/sprintf_chk.c'; fi`
++
+ lib_a-sscanf.o: sscanf.c
+ 	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-sscanf.o `test -f 'sscanf.c' || echo '$(srcdir)/'`sscanf.c
+
+--- a/newlib/libc/stdio/sprintf_chk.c	1969-12-31 19:00:00.000000000 -0500
++++ b/newlib/libc/stdio/sprintf_chk.c	2009-02-26 19:02:26.000000000 -0500
+@@ -0,0 +1,21 @@
++#include <stdarg.h>
++#include <stdio.h>
++
++/*
++ * Stub implementation of __sprintf_chk adapted from glibc 2.7.  This
++ * doesn't actually implement any buffer overflow protection.  It just makes
++ * the linker happy :)
++*/
++int
++__sprintf_chk (char *s, int flags, size_t slen, const char *format, ...)
++{
++  va_list arg;
++  int done;
++
++  va_start (arg, format);
++  done = vsprintf (s, format, arg);
++  va_end (arg);
++
++  return done;
++}
++
diff --git a/recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch b/recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
new file mode 100644
index 0000000..51c0de0
--- /dev/null
+++ b/recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
@@ -0,0 +1,16 @@
+--- a/newlib/libc/include/stdint.h.orig	2006-08-17 00:39:43.000000000 +0300
++++ b/newlib/libc/include/stdint.h	2009-08-25 17:33:23.000000000 +0300
+@@ -348,8 +348,11 @@
+ #endif
+
+ /* This must match size_t in stddef.h, currently long unsigned int */
+-#define SIZE_MIN (-__STDINT_EXP(LONG_MAX) - 1L)
+-#define SIZE_MAX __STDINT_EXP(LONG_MAX)
++#ifdef __SIZE_MAX__
++#define SIZE_MAX __SIZE_MAX__
++#else
++#define SIZE_MAX (__STDINT_EXP(LONG_MAX) * 2UL + 1)
++#endif
+
+ /* This must match sig_atomic_t in <signal.h> (currently int) */
+ #define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
diff --git a/recipes-extended/xen/files/newlib.patch b/recipes-extended/xen/files/newlib.patch
new file mode 100644
index 0000000..67eb00a
--- /dev/null
+++ b/recipes-extended/xen/files/newlib.patch
@@ -0,0 +1,727 @@
+There is a mix between longs and long longs.
+
+Index: newlib/libc/include/inttypes.h
+===================================================================
+RCS file: /cvs/src/src/newlib/libc/include/inttypes.h,v
+retrieving revision 1.3
+diff -u -p -r1.3 inttypes.h
+--- a/newlib/libc/include/inttypes.h	16 Dec 2005 19:03:12 -0000	1.3
++++ b/newlib/libc/include/inttypes.h	8 Nov 2007 16:32:44 -0000
+@@ -163,12 +163,12 @@
+
+
+ /* 64-bit types */
+-#if __have_longlong64
+-#define __PRI64(x) __STRINGIFY(ll##x)
+-#define __SCN64(x) __STRINGIFY(ll##x)
+-#elif __have_long64
++#if __have_long64
+ #define __PRI64(x) __STRINGIFY(l##x)
+ #define __SCN64(x) __STRINGIFY(l##x)
++#elif __have_longlong64
++#define __PRI64(x) __STRINGIFY(ll##x)
++#define __SCN64(x) __STRINGIFY(ll##x)
+ #else
+ #define __PRI64(x) __STRINGIFY(x)
+ #define __SCN64(x) __STRINGIFY(x)
+@@ -217,12 +217,12 @@
+ #endif
+
+ /* max-bit types */
+-#if __have_longlong64
+-#define __PRIMAX(x) __STRINGIFY(ll##x)
+-#define __SCNMAX(x) __STRINGIFY(ll##x)
+-#elif __have_long64
++#if __have_long64
+ #define __PRIMAX(x) __STRINGIFY(l##x)
+ #define __SCNMAX(x) __STRINGIFY(l##x)
++#elif __have_longlong64
++#define __PRIMAX(x) __STRINGIFY(ll##x)
++#define __SCNMAX(x) __STRINGIFY(ll##x)
+ #else
+ #define __PRIMAX(x) __STRINGIFY(x)
+ #define __SCNMAX(x) __STRINGIFY(x)
+@@ -242,12 +242,12 @@
+ #define SCNxMAX		__SCNMAX(x)
+
+ /* ptr types */
+-#if __have_longlong64
+-#define __PRIPTR(x) __STRINGIFY(ll##x)
+-#define __SCNPTR(x) __STRINGIFY(ll##x)
+-#elif __have_long64
++#if __have_long64
+ #define __PRIPTR(x) __STRINGIFY(l##x)
+ #define __SCNPTR(x) __STRINGIFY(l##x)
++#elif __have_longlong64
++#define __PRIPTR(x) __STRINGIFY(ll##x)
++#define __SCNPTR(x) __STRINGIFY(ll##x)
+ #else
+ #define __PRIPTR(x) __STRINGIFY(x)
+ #define __SCNPTR(x) __STRINGIFY(x)
+
+We don't want u?int32_t to be long as our code assume in a lot of places to be
+int.
+
+Index: newlib/libc/include/stdint.h
+===================================================================
+RCS file: /cvs/src/src/newlib/libc/include/stdint.h,v
+retrieving revision 1.10
+diff -u -p -r1.10 stdint.h
+--- a/newlib/libc/include/stdint.h	16 Aug 2006 21:39:43 -0000	1.10
++++ b/newlib/libc/include/stdint.h	12 Feb 2008 13:07:52 -0000
+@@ -38,7 +38,7 @@ extern "C" {
+ #if __STDINT_EXP(LONG_MAX) > 0x7fffffff
+ #define __have_long64 1
+ #elif __STDINT_EXP(LONG_MAX) == 0x7fffffff && !defined(__SPU__)
+-#define __have_long32 1
++/* #define __have_long32 1 */
+ #endif
+
+ #if __STDINT_EXP(SCHAR_MAX) == 0x7f
+
+Define the basic ia64 jump buffer
+
+Index: newlib/libc/include/sys/config.h
+===================================================================
+RCS file: /cvs/src/src/newlib/libc/include/sys/config.h,v
+retrieving revision 1.47
+diff -u -p -r1.47 config.h
+--- a/newlib/libc/include/sys/config.h	15 Mar 2007 21:32:12 -0000	1.47
++++ b/newlib/libc/include/sys/config.h	8 Nov 2007 16:32:44 -0000
+@@ -71,6 +71,10 @@
+ #endif
+ #endif
+
++#ifndef __DYNAMIC_REENT__
++#define __DYNAMIC_REENT__
++#endif
++
+ #ifdef __mn10200__
+ #define __SMALL_BITFIELDS
+ #endif
+
+Dynamic pointer to our reentrancy zone
+
+Index: newlib/libc/reent/getreent.c
+===================================================================
+RCS file: /cvs/src/src/newlib/libc/reent/getreent.c,v
+retrieving revision 1.2
+diff -u -p -r1.2 getreent.c
+--- a/newlib/libc/reent/getreent.c	7 Sep 2007 00:45:55 -0000	1.2
++++ b/newlib/libc/reent/getreent.c	8 Nov 2007 16:32:44 -0000
+@@ -3,12 +3,20 @@
+ #include <_ansi.h>
+ #include <reent.h>
+
++#define weak_alias(name, aliasname) \
++  extern __typeof (name) aliasname __attribute__ ((weak, alias (#name)));
++
+ #ifdef __getreent
+ #undef __getreent
+ #endif
++#ifdef __libc_getreent
++#undef __libc_getreent
++#endif
+
+ struct _reent *
+-_DEFUN_VOID(__getreent)
++__libc_getreent (void)
+ {
+   return _impure_ptr;
+ }
++weak_alias(__libc_getreent,__getreent)
++
+
+We can't provide a red zone in mini-os.
+
+Index: newlib/libc/machine/x86_64/memcpy.S
+===================================================================
+RCS file: /cvs/src/src/newlib/libc/machine/x86_64/memcpy.S,v
+retrieving revision 1.1
+diff -u -p -r1.1 memcpy.S
+--- a/newlib/libc/machine/x86_64/memcpy.S	28 Aug 2007 21:56:49 -0000	1.1
++++ b/newlib/libc/machine/x86_64/memcpy.S	8 Nov 2007 16:32:44 -0000
+@@ -30,10 +30,18 @@ quadword_aligned:
+   cmpq    $256, rdx
+   jb      quadword_copy
+
++#if 1
++  subq    $32, rsp
++  movq    rax, 24 (rsp)
++  movq    r12, 16 (rsp)
++  movq    r13, 8  (rsp)
++  movq    r14, 0  (rsp)
++#else
+   movq    rax, -8  (rsp)
+   movq    r12, -16 (rsp)
+   movq    r13, -24 (rsp)
+   movq    r14, -32 (rsp)
++#endif
+
+   movq    rdx, rcx                /* Copy 128 bytes at a time with minimum cache polution */
+   shrq    $7, rcx
+@@ -89,10 +97,18 @@ loop:
+   movq    rdx, rcx
+   andq    $127, rcx
+   rep     movsb
++#if 1
++  movq    24 (rsp), rax
++  movq    16 (rsp), r12
++  movq    8  (rsp), r13
++  movq    0  (rsp), r14
++  addq    $32, rsp
++#else
+   movq    -8  (rsp), rax
+   movq    -16 (rsp), r12
+   movq    -24 (rsp), r13
+   movq    -32 (rsp), r14
++#endif
+   ret
+
+
+--- a/newlib/libc/machine/x86_64/x86_64mach.h.orig	2008-07-11 14:57:23.062269000 +0100
++++ b/newlib/libc/machine/x86_64/x86_64mach.h	2008-07-11 14:58:01.262503000 +0100
+@@ -22,81 +22,81 @@
+
+ #define REG(x) CONCAT1(__REG_PREFIX__, x)
+
+-#define rax REG(rax)
+-#define rbx REG(rbx)
+-#define rcx REG(rcx)
+-#define rdx REG(rdx)
+-#define rsi REG(rsi)
+-#define rdi REG(rdi)
+-#define rbp REG(rbp)
+-#define rsp REG(rsp)
+-
+-#define r8  REG(r8)
+-#define r9  REG(r9)
+-#define r10 REG(r10)
+-#define r11 REG(r11)
+-#define r12 REG(r12)
+-#define r13 REG(r13)
+-#define r14 REG(r14)
+-#define r15 REG(r15)
+-
+-#define eax REG(eax)
+-#define ebx REG(ebx)
+-#define ecx REG(ecx)
+-#define edx REG(edx)
+-#define esi REG(esi)
+-#define edi REG(edi)
+-#define ebp REG(ebp)
+-#define esp REG(esp)
+-
+-#define st0 REG(st)
+-#define st1 REG(st(1))
+-#define st2 REG(st(2))
+-#define st3 REG(st(3))
+-#define st4 REG(st(4))
+-#define st5 REG(st(5))
+-#define st6 REG(st(6))
+-#define st7 REG(st(7))
+-
+-#define ax REG(ax)
+-#define bx REG(bx)
+-#define cx REG(cx)
+-#define dx REG(dx)
+-
+-#define ah REG(ah)
+-#define bh REG(bh)
+-#define ch REG(ch)
+-#define dh REG(dh)
+-
+-#define al REG(al)
+-#define bl REG(bl)
+-#define cl REG(cl)
+-#define dl REG(dl)
+-
+-#define sil REG(sil)
+-
+-#define mm1 REG(mm1)
+-#define mm2 REG(mm2)
+-#define mm3 REG(mm3)
+-#define mm4 REG(mm4)
+-#define mm5 REG(mm5)
+-#define mm6 REG(mm6)
+-#define mm7 REG(mm7)
+-
+-#define xmm0 REG(xmm0)
+-#define xmm1 REG(xmm1)
+-#define xmm2 REG(xmm2)
+-#define xmm3 REG(xmm3)
+-#define xmm4 REG(xmm4)
+-#define xmm5 REG(xmm5)
+-#define xmm6 REG(xmm6)
+-#define xmm7 REG(xmm7)
+-
+-#define cr0 REG(cr0)
+-#define cr1 REG(cr1)
+-#define cr2 REG(cr2)
+-#define cr3 REG(cr3)
+-#define cr4 REG(cr4)
++#define rax %rax
++#define rbx %rbx
++#define rcx %rcx
++#define rdx %rdx
++#define rsi %rsi
++#define rdi %rdi
++#define rbp %rbp
++#define rsp %rsp
++
++#define r8  %r8
++#define r9  %r9
++#define r10 %r10
++#define r11 %r11
++#define r12 %r12
++#define r13 %r13
++#define r14 %r14
++#define r15 %r15
++
++#define eax %eax
++#define ebx %ebx
++#define ecx %ecx
++#define edx %edx
++#define esi %esi
++#define edi %edi
++#define ebp %ebp
++#define esp %esp
++
++#define st0 %st
++#define st1 %st(1)
++#define st2 %st(2)
++#define st3 %st(3)
++#define st4 %st(4)
++#define st5 %st(5)
++#define st6 %st(6)
++#define st7 %st(7)
++
++#define ax %ax
++#define bx %bx
++#define cx %cx
++#define dx %dx
++
++#define ah %ah
++#define bh %bh
++#define ch %ch
++#define dh %dh
++
++#define al %al
++#define bl %bl
++#define cl %cl
++#define dl %dl
++
++#define sil %sil
++
++#define mm1 %mm1
++#define mm2 %mm2
++#define mm3 %mm3
++#define mm4 %mm4
++#define mm5 %mm5
++#define mm6 %mm6
++#define mm7 %mm7
++
++#define xmm0 %xmm0
++#define xmm1 %xmm1
++#define xmm2 %xmm2
++#define xmm3 %xmm3
++#define xmm4 %xmm4
++#define xmm5 %xmm5
++#define xmm6 %xmm6
++#define xmm7 %xmm7
++
++#define cr0 %cr0
++#define cr1 %cr1
++#define cr2 %cr2
++#define cr3 %cr3
++#define cr4 %cr4
+
+ #ifdef _I386MACH_NEED_SOTYPE_FUNCTION
+ #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function
+--- a/newlib/libc/machine/x86_64/memcpy.S.orig	2008-07-11 15:12:27.494693000 +0100
++++ b/newlib/libc/machine/x86_64/memcpy.S	2008-07-11 15:12:29.448706000 +0100
+@@ -60,14 +60,14 @@
+   movq    48 (rsi), r13
+   movq    56 (rsi), r14
+
+-  movntiq rax,    (rdi)
+-  movntiq r8 ,  8 (rdi)
+-  movntiq r9 , 16 (rdi)
+-  movntiq r10, 24 (rdi)
+-  movntiq r11, 32 (rdi)
+-  movntiq r12, 40 (rdi)
+-  movntiq r13, 48 (rdi)
+-  movntiq r14, 56 (rdi)
++  movnti rax,    (rdi)
++  movnti r8 ,  8 (rdi)
++  movnti r9 , 16 (rdi)
++  movnti r10, 24 (rdi)
++  movnti r11, 32 (rdi)
++  movnti r12, 40 (rdi)
++  movnti r13, 48 (rdi)
++  movnti r14, 56 (rdi)
+
+   movq     64 (rsi), rax
+   movq     72 (rsi), r8
+@@ -78,14 +78,14 @@
+   movq    112 (rsi), r13
+   movq    120 (rsi), r14
+
+-  movntiq rax,  64 (rdi)
+-  movntiq r8 ,  72 (rdi)
+-  movntiq r9 ,  80 (rdi)
+-  movntiq r10,  88 (rdi)
+-  movntiq r11,  96 (rdi)
+-  movntiq r12, 104 (rdi)
+-  movntiq r13, 112 (rdi)
+-  movntiq r14, 120 (rdi)
++  movnti rax,  64 (rdi)
++  movnti r8 ,  72 (rdi)
++  movnti r9 ,  80 (rdi)
++  movnti r10,  88 (rdi)
++  movnti r11,  96 (rdi)
++  movnti r12, 104 (rdi)
++  movnti r13, 112 (rdi)
++  movnti r14, 120 (rdi)
+
+   leaq    128 (rsi), rsi
+   leaq    128 (rdi), rdi
+--- a/newlib/libc/machine/i386/i386mach.h	2000-08-28 18:50:06.000000000 +0100
++++ b/newlib/libc/machine/i386/i386mach.h	2008-07-11 15:17:13.874409000 +0100
+@@ -27,46 +27,46 @@
+
+ #define REG(x) CONCAT1(__REG_PREFIX__, x)
+
+-#define eax REG(eax)
+-#define ebx REG(ebx)
+-#define ecx REG(ecx)
+-#define edx REG(edx)
+-#define esi REG(esi)
+-#define edi REG(edi)
+-#define ebp REG(ebp)
+-#define esp REG(esp)
+-
+-#define st0 REG(st)
+-#define st1 REG(st(1))
+-#define st2 REG(st(2))
+-#define st3 REG(st(3))
+-#define st4 REG(st(4))
+-#define st5 REG(st(5))
+-#define st6 REG(st(6))
+-#define st7 REG(st(7))
+-
+-#define ax REG(ax)
+-#define bx REG(bx)
+-#define cx REG(cx)
+-#define dx REG(dx)
+-
+-#define ah REG(ah)
+-#define bh REG(bh)
+-#define ch REG(ch)
+-#define dh REG(dh)
+-
+-#define al REG(al)
+-#define bl REG(bl)
+-#define cl REG(cl)
+-#define dl REG(dl)
+-
+-#define mm1 REG(mm1)
+-#define mm2 REG(mm2)
+-#define mm3 REG(mm3)
+-#define mm4 REG(mm4)
+-#define mm5 REG(mm5)
+-#define mm6 REG(mm6)
+-#define mm7 REG(mm7)
++#define eax %eax
++#define ebx %ebx
++#define ecx %ecx
++#define edx %edx
++#define esi %esi
++#define edi %edi
++#define ebp %ebp
++#define esp %esp
++
++#define st0 %st
++#define st1 %st(1)
++#define st2 %st(2)
++#define st3 %st(3)
++#define st4 %st(4)
++#define st5 %st(5)
++#define st6 %st(6)
++#define st7 %st(7)
++
++#define ax %ax
++#define bx %bx
++#define cx %cx
++#define dx %dx
++
++#define ah %ah
++#define bh %bh
++#define ch %ch
++#define dh %dh
++
++#define al %al
++#define bl %bl
++#define cl %cl
++#define dl %dl
++
++#define mm1 %mm1
++#define mm2 %mm2
++#define mm3 %mm3
++#define mm4 %mm4
++#define mm5 %mm5
++#define mm6 %mm6
++#define mm7 %mm7
+
+ #ifdef _I386MACH_NEED_SOTYPE_FUNCTION
+ #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function
+--- a/newlib/libc/machine/x86_64/memset.S	2007-08-28 22:56:49.000000000 +0100
++++ b/newlib/libc/machine/x86_64/memset.S	2008-07-11 15:16:59.098320000 +0100
+@@ -40,22 +40,22 @@
+
+   .p2align 4
+ loop:
+-  movntiq rax,     (rdi)
+-  movntiq rax,   8 (rdi)
+-  movntiq rax,  16 (rdi)
+-  movntiq rax,  24 (rdi)
+-  movntiq rax,  32 (rdi)
+-  movntiq rax,  40 (rdi)
+-  movntiq rax,  48 (rdi)
+-  movntiq rax,  56 (rdi)
+-  movntiq rax,  64 (rdi)
+-  movntiq rax,  72 (rdi)
+-  movntiq rax,  80 (rdi)
+-  movntiq rax,  88 (rdi)
+-  movntiq rax,  96 (rdi)
+-  movntiq rax, 104 (rdi)
+-  movntiq rax, 112 (rdi)
+-  movntiq rax, 120 (rdi)
++  movnti rax,     (rdi)
++  movnti rax,   8 (rdi)
++  movnti rax,  16 (rdi)
++  movnti rax,  24 (rdi)
++  movnti rax,  32 (rdi)
++  movnti rax,  40 (rdi)
++  movnti rax,  48 (rdi)
++  movnti rax,  56 (rdi)
++  movnti rax,  64 (rdi)
++  movnti rax,  72 (rdi)
++  movnti rax,  80 (rdi)
++  movnti rax,  88 (rdi)
++  movnti rax,  96 (rdi)
++  movnti rax, 104 (rdi)
++  movnti rax, 112 (rdi)
++  movnti rax, 120 (rdi)
+
+   leaq    128 (rdi), rdi
+
+--- a/newlib/libm/machine/i386/i386mach.h.orig	2008-07-11 15:30:37.367227000 +0100
++++ b/newlib/libm/machine/i386/i386mach.h	2008-07-11 15:30:55.232337000 +0100
+@@ -27,46 +27,46 @@
+
+ #define REG(x) CONCAT1(__REG_PREFIX__, x)
+
+-#define eax REG(eax)
+-#define ebx REG(ebx)
+-#define ecx REG(ecx)
+-#define edx REG(edx)
+-#define esi REG(esi)
+-#define edi REG(edi)
+-#define ebp REG(ebp)
+-#define esp REG(esp)
+-
+-#define st0 REG(st)
+-#define st1 REG(st(1))
+-#define st2 REG(st(2))
+-#define st3 REG(st(3))
+-#define st4 REG(st(4))
+-#define st5 REG(st(5))
+-#define st6 REG(st(6))
+-#define st7 REG(st(7))
+-
+-#define ax REG(ax)
+-#define bx REG(bx)
+-#define cx REG(cx)
+-#define dx REG(dx)
+-
+-#define ah REG(ah)
+-#define bh REG(bh)
+-#define ch REG(ch)
+-#define dh REG(dh)
+-
+-#define al REG(al)
+-#define bl REG(bl)
+-#define cl REG(cl)
+-#define dl REG(dl)
+-
+-#define mm1 REG(mm1)
+-#define mm2 REG(mm2)
+-#define mm3 REG(mm3)
+-#define mm4 REG(mm4)
+-#define mm5 REG(mm5)
+-#define mm6 REG(mm6)
+-#define mm7 REG(mm7)
++#define eax %eax
++#define ebx %ebx
++#define ecx %ecx
++#define edx %edx
++#define esi %esi
++#define edi %edi
++#define ebp %ebp
++#define esp %esp
++
++#define st0 %st
++#define st1 %st(1)
++#define st2 %st(2)
++#define st3 %st(3)
++#define st4 %st(4)
++#define st5 %st(5)
++#define st6 %st(6)
++#define st7 %st(7)
++
++#define ax %ax
++#define bx %bx
++#define cx %cx
++#define dx %dx
++
++#define ah %ah
++#define bh %bh
++#define ch %ch
++#define dh %dh
++
++#define al %al
++#define bl %bl
++#define cl %cl
++#define dl %dl
++
++#define mm1 %mm1
++#define mm2 %mm2
++#define mm3 %mm3
++#define mm4 %mm4
++#define mm5 %mm5
++#define mm6 %mm6
++#define mm7 %mm7
+
+ #ifdef _I386MACH_NEED_SOTYPE_FUNCTION
+ #define SOTYPE_FUNCTION(sym) .type SYM(sym),@function
+
+
+We want to have a 64bit offsets libc even on 32bit platforms.
+
+--- ./newlib/configure.host.orig	2008-08-07 16:01:17.801946000 +0100
++++ ./newlib/configure.host	2008-08-07 16:01:34.181064000 +0100
+@@ -317,6 +317,8 @@
+     oext=lo
+     lpfx=
+     aext=la ;;
++  i[34567]86-xen-elf)
++    stdio64_dir=stdio64 ;;
+   *) ;; #shared library not supported for ${host}
+ esac
+
+--- a/newlib/libc/include/sys/_types.h.orig	2008-08-07 15:22:44.925008000 +0100
++++ b/newlib/libc/include/sys/_types.h	2008-08-07 15:22:50.824044000 +0100
+@@ -13,8 +13,12 @@
+ #include <sys/lock.h>
+
+ #ifndef __off_t_defined
++#ifdef __MINIOS__
++typedef long long _off_t;
++#else
+ typedef long _off_t;
+ #endif
++#endif
+
+ #if defined(__rtems__)
+ /* device numbers are 32-bit major and and 32-bit minor */
+--- ./newlib/libc/include/sys/config.h.orig	2008-08-07 14:43:25.915866000 +0100
++++ ./newlib/libc/include/sys/config.h	2008-08-07 14:44:13.508154000 +0100
+@@ -69,6 +69,10 @@
+ /* we use some glibc header files so turn on glibc large file feature */
+ #define _LARGEFILE64_SOURCE 1
+ #endif
++#ifdef __MINIOS__
++#define __LARGE64_FILES 1
++#define _LARGEFILE64_SOURCE 1
++#endif
+ #endif
+
+ #ifndef __DYNAMIC_REENT__
+--- ./newlib/libc/include/sys/_default_fcntl.h.orig	2008-08-07 15:08:22.377836000 +0100
++++ ./newlib/libc/include/sys/_default_fcntl.h	2008-08-07 15:08:31.651890000 +0100
+@@ -170,7 +170,11 @@
+ /* Provide _<systemcall> prototypes for functions provided by some versions
+    of newlib.  */
+ #ifdef _COMPILING_NEWLIB
+-extern int _open _PARAMS ((const char *, int, ...));
++extern int _open _PARAMS ((const char *, int, ...))
++#ifdef __MINIOS__
++    asm("open64")
++#endif
++    ;
+ extern int _fcntl _PARAMS ((int, int, ...));
+ #ifdef __LARGE64_FILES
+ extern int _open64 _PARAMS ((const char *, int, ...));
+--- ./newlib/libc/include/sys/unistd.h.orig	2008-08-07 15:09:36.449280000 +0100
++++ ./newlib/libc/include/sys/unistd.h	2008-08-07 15:09:51.210370000 +0100
+@@ -101,7 +101,11 @@
+ int     _EXFUN(link, (const char *__path1, const char *__path2 ));
+ int	_EXFUN(nice, (int __nice_value ));
+ #if !defined(__INSIDE_CYGWIN__)
+-off_t   _EXFUN(lseek, (int __fildes, off_t __offset, int __whence ));
++off_t   _EXFUN(lseek, (int __fildes, off_t __offset, int __whence ))
++#ifdef __MINIOS__
++    asm("lseek64")
++#endif
++    ;
+ #endif
+ #if defined(__SPU__)
+ #define F_ULOCK	0
+--- ./newlib/libc/include/sys/stat.h.orig	2008-08-07 16:08:50.495116000 +0100
++++ ./newlib/libc/include/sys/stat.h	2008-08-07 16:10:21.799753000 +0100
+@@ -49,6 +49,9 @@
+   long	st_spare4[2];
+ #endif
+ };
++#ifdef __MINIOS__
++#define stat64 stat
++#endif
+ #endif
+
+ #define	_IFMT		0170000	/* type of file */
+@@ -132,7 +135,11 @@
+ /* Provide prototypes for most of the _<systemcall> names that are
+    provided in newlib for some compilers.  */
+ #ifdef _COMPILING_NEWLIB
+-int	_EXFUN(_fstat,( int __fd, struct stat *__sbuf ));
++int	_EXFUN(_fstat,( int __fd, struct stat *__sbuf ))
++#ifdef __MINIOS__
++    asm("fstat64")
++#endif
++    ;
+ int	_EXFUN(_stat,( const char *__path, struct stat *__sbuf ));
+ #ifdef __LARGE64_FILES
+ struct stat64;
+--- ./newlib/libc/include/_syslist.h.orig	2008-08-07 16:24:19.122605000 +0100
++++ ./newlib/libc/include/_syslist.h	2008-08-07 16:24:21.548628000 +0100
+@@ -14,6 +14,7 @@
+ #define _kill kill
+ #define _link link
+ #define _lseek lseek
++#define _lseek64 lseek64
+ #define _open open
+ #define _read read
+ #define _sbrk sbrk
+--- a/newlib/libc/include/reent.h.orig	2008-08-07 16:28:49.846502000 +0100
++++ b/newlib/libc/include/reent.h	2008-08-07 16:29:02.096586000 +0100
+@@ -87,6 +87,9 @@
+ #if defined(__CYGWIN__) && defined(_COMPILING_NEWLIB)
+ #define stat64 __stat64
+ #endif
++#if defined(__MINIOS__)
++#define stat64 stat
++#endif
+
+ struct stat64;
+
diff --git a/recipes-extended/xen/newlib.inc b/recipes-extended/xen/newlib.inc
new file mode 100644
index 0000000..32d79aa
--- /dev/null
+++ b/recipes-extended/xen/newlib.inc
@@ -0,0 +1,64 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+CPPFLAGS_INCLUDE_DIR = "-isystem `${HOST_PREFIX}gcc -print-file-name=include`"
+STUBDOM_CFLAGS += "-D_I386MACH_ALLOW_HW_INTERRUPTS"
+
+export ac_cv_path_CC_FOR_TARGET="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}"
+export CC_FOR_TARGET="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}"
+
+export ac_cv_path_CXX_FOR_TARGET="${HOST_PREFIX}g++ --sysroot=${RECIPE_SYSROOT}"
+export CXX_FOR_TARGET="${HOST_PREFIX}g++ --sysroot=${RECIPE_SYSROOT}"
+
+export ac_cv_path_CPP_FOR_TARGET="${HOST_PREFIX}gcc -E --sysroot=${RECIPE_SYSROOT}"
+export CPP_FOR_TARGET="${HOST_PREFIX}gcc -E --sysroot=${RECIPE_SYSROOT}"
+
+export ac_cv_path_LD_FOR_TARGET="${HOST_PREFIX}ld --sysroot=${RECIPE_SYSROOT}"
+export LD_FOR_TARGET="${HOST_PREFIX}ld --sysroot=${RECIPE_SYSROOT}"
+
+export ac_cv_path_AS_FOR_TARGET="${HOST_PREFIX}as"
+export AS_FOR_TARGET="${HOST_PREFIX}as"
+
+export ac_cv_path_AR_FOR_TARGET="${HOST_PREFIX}ar"
+export AR_FOR_TARGET="${HOST_PREFIX}ar"
+
+export ac_cv_path_NM_FOR_TARGET="${HOST_PREFIX}nm"
+export NM_FOR_TARGET="${HOST_PREFIX}nm"
+
+export ac_cv_path_RANLIB_FOR_TARGET="${HOST_PREFIX}ranlib"
+export RANLIB_FOR_TARGET="${HOST_PREFIX}ranlib"
+
+export ac_cv_path_OBJDUMP_FOR_TARGET="${HOST_PREFIX}objdump"
+export OBJDUMP_FOR_TARGET="${HOST_PREFIX}objdump"
+
+export ac_cv_path_OBJCOPY_FOR_TARGET="${HOST_PREFIX}objcopy"
+export OBJCOPY_FOR_TARGET="${HOST_PREFIX}objcopy"
+
+export ac_cv_path_STRIP_FOR_TARGET="${HOST_PREFIX}strip"
+export STRIP_FOR_TARGET="${HOST_PREFIX}strip"
+
+export ac_cv_path_STRINGS_FOR_TARGET="${HOST_PREFIX}strings"
+export STRINGS_FOR_TARGET="${HOST_PREFIX}strings"
+
+export ac_cv_path_READELF_FOR_TARGET="${HOST_PREFIX}readelf"
+export READELF_FOR_TARGET="${HOST_PREFIX}readelf"
+
+do_configure() {
+    ${S}/configure --verbose --prefix=${prefix} --target=${GNU_TARGET_ARCH}-xen-elf --enable-newlib-io-long-long --disable-multilib
+    find ${S} -type f | xargs perl -i.bak -pe 's/\b_(tzname|daylight|timezone)\b/$1/g'
+}
+
+do_compile() {
+    ${MAKE}
+}
+
+do_install() {
+    ${MAKE} DESTDIR=${D} install
+    rm -rf ${D}/cross-root-${GNU_TARGET_ARCH}/share
+    rm -rf ${D}/cross-root-${GNU_TARGET_ARCH}/info
+    install -m 644 `${HOST_PREFIX}gcc -print-file-name=include`/stdarg.h -t ${D}/${includedir}
+    install -m 644 `${HOST_PREFIX}gcc -print-file-name=include`/stddef.h -t ${D}/${includedir}
+    install -m 644 `${HOST_PREFIX}gcc -print-file-name=include`/stdbool.h -t ${D}/${includedir}
+}
diff --git a/recipes-extended/xen/newlib_1.16.0.bb b/recipes-extended/xen/newlib_1.16.0.bb
new file mode 100644
index 0000000..60672be
--- /dev/null
+++ b/recipes-extended/xen/newlib_1.16.0.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Newlib is a C library intended for use on embedded systems."
+HOMEPAGE = "http://sourceware.org/newlib"
+LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.NEWLIB;md5=950f50b290e8fcf7a2d3fff61775de9b"
+
+# this is the hash of version tag 1_16_0
+SRCREV_newlib = "07b4b67a88f386ce4716a14e0ff2c2bce992b985"
+SRC_URI = "\
+    git://sourceware.org/git/newlib-cygwin.git;protocol=git;nobranch=1;destsuffix=newlib;name=newlib \
+    file://newlib.patch \
+    file://newlib-chk.patch \
+    file://newlib-stdint-size_max-fix-from-1.17.0.patch \
+"
+
+S="${WORKDIR}/newlib"
+B="${WORKDIR}/build"
+
+require newlib.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

