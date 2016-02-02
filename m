Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63470E00BE6; Tue,  2 Feb 2016 06:11:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.45 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1882DE00BDA
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 06:11:42 -0800 (PST)
Received: by mail-vk0-f45.google.com with SMTP id e6so97665083vkh.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 02 Feb 2016 06:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=T/nNjx08JuOHkf7wSDVxXlREI6zYUBZq3CWydPdAHFg=;
	b=R+zYkdf+/hangq1Tu7zXfZYTQGHkspC6kwhjc5xvJ8CqkOvKp9YXLGRGRHK+z5Pq6R
	062Wi2yNP+S81F4NFBAshQ98MqYbJSlzoy8J1XUkfJQL1ma+LT7ku2x2hprbaUq5hqZD
	ALLE69qd+3+OFOwLVBOHx0SYQpSWExphEUPv8oeF3zXCEF2o7qS3nv1ygKFB0trMj0eH
	+VCxaeU92CrzsSOkVyPbLvS5l69lYE1mF31GYP/zgOJ769F2qbHP6JAI+wweYmRM8nYf
	LFoR/iUmzoOVzl6badC+YSOlcjvNGvbLvFUvtGbCcz1q672RN3CXvWGQ5Lr0o0SlLOy3
	rUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=T/nNjx08JuOHkf7wSDVxXlREI6zYUBZq3CWydPdAHFg=;
	b=FC1hb3CV416LWJi25dJG+mAAVVRczuw97y7f4vsbFMbJeclo4oFo0NH4aTQwoCYAkR
	T2IKjbl/E7RPgaP1HfrH80e0j8XWYtRAzKdIPjvBlewWP1n19+hbB44JsOFTsQmWHUAK
	aPFBCStnRjFwbrDET2vQ/kRjL5bl48RvUiC/KXNZAYJuc/K0TDnNlwAl3+EzobKITC7D
	ONSP6aiem+IqXfE55IKy1rOeDNxXV/aH5lStBci3GlTfA3hb9t4EiM86Nk0fiRbSFeSQ
	Y1Wy41BdyduWihHIlxExnFVYHyu3zKN4pnGvEjmUAbOevNixZWpu+RD7B0ky97dSYp4h
	c2mw==
X-Gm-Message-State: AG10YOT0pU01OHfVZBfwNItO65Sp8kkL3pNf7lyb9nLpY8fNAT7SJMgGNbZmX/wbQT+FTisZXmECyRAiybAGOg==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr20216121vky.11.1454422301631;
	Tue, 02 Feb 2016 06:11:41 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 2 Feb 2016 06:11:41 -0800 (PST)
In-Reply-To: <c81867b967410ba1b9ae4f80fffcd8707a473caa.1454413132.git.adrian.ratiu@ni.com>
References: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
	<c81867b967410ba1b9ae4f80fffcd8707a473caa.1454413132.git.adrian.ratiu@ni.com>
Message-ID: <CADkTA4NK4gNF9WOFg6XNj_K_d+Cmv0kUNo+2YDer=CjPqLYpvQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 4/6] openldap: remove recipe
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
Date: Tue, 02 Feb 2016 14:11:50 -0000
X-Original-Date: Tue, 2 Feb 2016 09:11:41 -0500
X-List-Received-Date: Tue, 02 Feb 2016 14:11:50 -0000
Content-Type: multipart/alternative; boundary=001a1143158aa46c1c052aca141e

--001a1143158aa46c1c052aca141e
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 6:40 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> meta-oe contains a newer openldap recipe wich provides everything this
> recipe does. Since the meta-cloud-services layers already depend on
> meta-oe, we can remove this openldap recipe and use the more actively
> maintained one from meta-oe.
>


The version is frozen here on purpose. So for now, we'll keep our copy. The
update cadence of meta-oe does not lend itself to working with
meta-cloud-services.

If meta-oe is ever split into smaller repos, I can finally start dropping
and updating
more of these.

Bruce




>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../add-tlscacert-option-to-ldap-conf.patch        |  10 -
>  .../openldap-2.4.39/autogroup-makefile.patch       |  35 ----
>  .../contrib-modules-use-dpkg-buildflags.patch      |  40 ----
>  .../do-not-second-guess-sonames.patch              |  68 -------
>  .../openldap/openldap-2.4.39/evolution-ntlm.patch  | 222
> ---------------------
>  .../openldap-2.4.39/fix-build-top-mk.patch         |  11 -
>  .../openldap-2.4.39/fix-ftbfs-binutils-gold.patch  |  64 ------
>  .../getaddrinfo-is-threadsafe.patch                |  43 ----
>  .../openldap/openldap-2.4.39/heimdal-fix.patch     |  23 ---
>  .../index-files-created-as-root.patch              |  37 ----
>  .../openldap/openldap-2.4.39/install-strip.patch   |  14 --
>  .../openldap-2.4.39/ldap-conf-tls-cacertdir.patch  |  29 ---
>  .../openldap-2.4.39/ldapi-socket-place.patch       |  16 --
>  .../openldap-2.4.39/libldap-symbol-versions.patch  | 161 ---------------
>  .../openldap/openldap-2.4.39/man-slapd.patch       |  60 ------
>  .../openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch      |  25 ---
>  .../no-bdb-ABI-second-guessing.patch               |  42 ----
>  .../openldap-2.4.39/sasl-default-path.patch        |  55 -----
>  recipes-support/openldap/openldap-2.4.39/series    |  21 --
>  .../openldap-2.4.39/slapi-errorlog-file.patch      |  16 --
>  .../openldap-2.4.39/smbk5pwd-makefile.patch        |  53 -----
>  ..._dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch |  40 ----
>  .../openldap-2.4.39/wrong-database-location.patch  |  74 -------
>  recipes-support/openldap/openldap_2.4.39.bb        | 182
> -----------------
>  24 files changed, 1341 deletions(-)
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/install-strip.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/man-slapd.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
>  delete mode 100644 recipes-support/openldap/openldap-2.4.39/series
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
>  delete mode 100644
> recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
>  delete mode 100644 recipes-support/openldap/openldap_2.4.39.bb
>
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
> b/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
> deleted file mode 100644
> index e8e731a..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
> +++ /dev/null
> @@ -1,10 +0,0 @@
> ---- a/libraries/libldap/ldap.conf
> -+++ b/libraries/libldap/ldap.conf
> -@@ -11,3 +11,7 @@
> - #SIZELIMIT    12
> - #TIMELIMIT    15
> - #DEREF                never
> -+
> -+# TLS certificates (needed for GnuTLS)
> -+TLS_CACERT    /etc/ssl/certs/ca-certificates.crt
> -+
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
> b/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
> deleted file mode 100644
> index d3f56c3..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> ---- a/contrib/slapd-modules/autogroup/Makefile
> -+++ b/contrib/slapd-modules/autogroup/Makefile
> -@@ -2,11 +2,11 @@
> -
> - LDAP_SRC = ../../..
> - LDAP_BUILD = ../../..
> --LDAP_INC = -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include
> -I$(LDAP_SRC)/servers/slapd
> --LDAP_LIB = $(LDAP_BUILD)/libraries/libldap_r/libldap_r.la \
> --      $(LDAP_BUILD)/libraries/liblber/liblber.la
> -+LDAP_INC = -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/include
> -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
> -+LDAP_LIB = $(LDAP_BUILD)/debian/build/libraries/libldap_r/libldap_r.la \
> -+      $(LDAP_BUILD)/debian/build/libraries/liblber/liblber.la
> -
> --LIBTOOL = $(LDAP_BUILD)/libtool
> -+LIBTOOL = $(LDAP_BUILD)/debian/build/libtool
> - CC = gcc
> - OPT = -g -O2 -Wall
> - DEFS =
> -@@ -16,13 +16,13 @@ LIBS = $(LDAP_LIB)
> - PROGRAMS = autogroup.la
> - LTVER = 0:0:0
> -
> --prefix=/usr/local
> -+prefix=/usr
> - exec_prefix=$(prefix)
> --ldap_subdir=/openldap
> -+ldap_subdir=/ldap
> -
> - libdir=$(exec_prefix)/lib
> - libexecdir=$(exec_prefix)/libexec
> --moduledir = $(libexecdir)$(ldap_subdir)
> -+moduledir = $(libdir)$(ldap_subdir)
> -
> - .SUFFIXES: .c .o .lo
> -
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
> b/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
> deleted file mode 100644
> index 1b15529..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Description: pass CFLAGS to contrib builds
> - $(CFLAGS) is missing from the compiler invocations for autogroup and
> - smbk5pwd, which means they're not being hardened.
> -Author: Simon Ruderich <simon@ruderich.org>
> -Bug-Debian: http://bugs.debian.org/663724
> -
> ---- a/contrib/slapd-modules/autogroup/Makefile
> -+++ b/contrib/slapd-modules/autogroup/Makefile
> -@@ -27,12 +27,12 @@ moduledir = $(libexecdir)$(ldap_subdir)
> - .SUFFIXES: .c .o .lo
> -
> - .c.lo:
> --      $(LIBTOOL) --mode=compile $(CC) $(OPT) $(DEFS) $(INCS) -c $<
> -+      $(LIBTOOL) --mode=compile $(CC) $(OPT) $(CFLAGS) $(DEFS) $(INCS)
> -c $<
> -
> - all: $(PROGRAMS)
> -
> - autogroup.la: autogroup.lo
> --      $(LIBTOOL) --mode=link $(CC) $(OPT) -version-info $(LTVER) \
> -+      $(LIBTOOL) --mode=link $(CC) $(OPT) $(LDFLAGS) -version-info
> $(LTVER) \
> -       -rpath $(moduledir) -module -o $@ $? $(LIBS)
> -
> - clean:
> ---- a/contrib/slapd-modules/smbk5pwd/Makefile
> -+++ b/contrib/slapd-modules/smbk5pwd/Makefile
> -@@ -46,12 +46,12 @@ moduledir = $(libexecdir)$(ldap_subdir)
> - .SUFFIXES: .c .o .lo
> -
> - .c.lo:
> --      $(LIBTOOL) --mode=compile $(CC) $(OPT) $(DEFS) $(INCS) -c $<
> -+      $(LIBTOOL) --mode=compile $(CC) $(OPT) $(CFLAGS) $(DEFS) $(INCS)
> -c $<
> -
> - all: $(PROGRAMS)
> -
> - smbk5pwd.la:  smbk5pwd.lo
> --      $(LIBTOOL) --mode=link $(CC) $(OPT) -version-info $(LTVER) \
> -+      $(LIBTOOL) --mode=link $(CC) $(OPT) $(LDFLAGS) -version-info
> $(LTVER) \
> -       -rpath $(moduledir) -module -o $@ $? $(LIBS)
> -
> - clean:
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
> b/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
> deleted file mode 100644
> index 31cf652..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -Rip out code that second-guesses the libsasl soname / Debian shlibs.  If
> -cyrus sasl upstream is breaking the ABI, this needs to be fixed upstream
> -there, not kludged around upstream here!
> -
> -Debian bug #546885
> -
> -Upstream ITS #6302 filed.
> -
> ---- a/libraries/libldap/cyrus.c
> -+++ b/libraries/libldap/cyrus.c
> -@@ -74,28 +74,6 @@ int ldap_int_sasl_init( void )
> -       /* XXX not threadsafe */
> -       static int sasl_initialized = 0;
> -
> --#ifdef HAVE_SASL_VERSION
> --      /* stringify the version number, sasl.h doesn't do it for us */
> --#define VSTR0(maj, min, pat)  #maj "." #min "." #pat
> --#define VSTR(maj, min, pat)   VSTR0(maj, min, pat)
> --#define SASL_VERSION_STRING   VSTR(SASL_VERSION_MAJOR,
> SASL_VERSION_MINOR, \
> --                              SASL_VERSION_STEP)
> --      { int rc;
> --      sasl_version( NULL, &rc );
> --      if ( ((rc >> 16) != ((SASL_VERSION_MAJOR <<
> 8)|SASL_VERSION_MINOR)) ||
> --              (rc & 0xffff) < SASL_VERSION_STEP) {
> --              char version[sizeof("xxx.xxx.xxxxx")];
> --              sprintf( version, "%u.%d.%d", (unsigned)rc >> 24, (rc >>
> 16) & 0xff,
> --                      rc & 0xffff );
> --
> --              Debug( LDAP_DEBUG_ANY,
> --              "ldap_int_sasl_init: SASL library version mismatch:"
> --              " expected " SASL_VERSION_STRING ","
> --              " got %s\n", version, 0, 0 );
> --              return -1;
> --      }
> --      }
> --#endif
> -       if ( sasl_initialized ) {
> -               return 0;
> -       }
> ---- a/servers/slapd/sasl.c
> -+++ b/servers/slapd/sasl.c
> -@@ -1145,26 +1145,6 @@ int slap_sasl_init( void )
> - #endif
> -
> - #ifdef HAVE_CYRUS_SASL
> --#ifdef HAVE_SASL_VERSION
> --      /* stringify the version number, sasl.h doesn't do it for us */
> --#define       VSTR0(maj, min, pat)    #maj "." #min "." #pat
> --#define       VSTR(maj, min, pat)     VSTR0(maj, min, pat)
> --#define       SASL_VERSION_STRING     VSTR(SASL_VERSION_MAJOR,
> SASL_VERSION_MINOR, \
> --                              SASL_VERSION_STEP)
> --
> --      sasl_version( NULL, &rc );
> --      if ( ((rc >> 16) != ((SASL_VERSION_MAJOR <<
> 8)|SASL_VERSION_MINOR)) ||
> --              (rc & 0xffff) < SASL_VERSION_STEP)
> --      {
> --              char version[sizeof("xxx.xxx.xxxxx")];
> --              sprintf( version, "%u.%d.%d", (unsigned)rc >> 24, (rc >>
> 16) & 0xff,
> --                      rc & 0xffff );
> --              Debug( LDAP_DEBUG_ANY, "slap_sasl_init: SASL library
> version mismatch:"
> --                      " expected %s, got %s\n",
> --                      SASL_VERSION_STRING, version, 0 );
> --              return -1;
> --      }
> --#endif
> -
> -       sasl_set_mutex(
> -               ldap_pvt_sasl_mutex_new,
> diff --git a/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
> b/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
> deleted file mode 100644
> index cd9bc26..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
> +++ /dev/null
> @@ -1,222 +0,0 @@
> -Patch from evolution-exchange (2.10.3).  The ldap_ntlm_bind function is
> -actually called by evolution-data-server, checked at version 1.12.2.
> -Without this patch, the Exchange addressbook integration uses simple binds
> -with cleartext passwords.
> -
> -Russ checked with openldap-software for upstream's opinion on this patch
> -on 2007-12-21.  Upstream had never received it as a patch submission and
> -given that it's apparently only for older Exchange servers that can't do
> -SASL and DIGEST-MD5, it's not very appealing.
> -
> -Bug#457374 filed against evolution-data-server asking if this support is
> -still required on 2007-12-21.
> -
> ---- a/include/ldap.h
> -+++ b/include/ldap.h
> -@@ -2517,5 +2517,25 @@ ldap_parse_deref_control LDAP_P((
> -       LDAPControl     **ctrls,
> -       LDAPDerefRes    **drp ));
> -
> -+/*
> -+ * hacks for NTLM
> -+ */
> -+#define LDAP_AUTH_NTLM_REQUEST ((ber_tag_t) 0x8aU)
> -+#define LDAP_AUTH_NTLM_RESPONSE  ((ber_tag_t) 0x8bU)
> -+LDAP_F( int )
> -+ldap_ntlm_bind LDAP_P((
> -+      LDAP    *ld,
> -+      LDAP_CONST char *dn,
> -+      ber_tag_t tag,
> -+      struct berval *cred,
> -+      LDAPControl **sctrls,
> -+      LDAPControl **cctrls,
> -+      int   *msgidp ));
> -+LDAP_F( int )
> -+ldap_parse_ntlm_bind_result LDAP_P((
> -+      LDAP    *ld,
> -+      LDAPMessage *res,
> -+      struct berval *challenge));
> -+
> - LDAP_END_DECL
> - #endif /* _LDAP_H */
> ---- /dev/null
> -+++ b/libraries/libldap/ntlm.c
> -@@ -0,0 +1,138 @@
> -+/* $OpenLDAP: pkg/ldap/libraries/libldap/ntlm.c,v 1.1.4.10 2002/01/04
> 20:38:21 kurt Exp $ */
> -+/*
> -+ * Copyright 1998-2002 The OpenLDAP Foundation, All Rights Reserved.
> -+ * COPYING RESTRICTIONS APPLY, see COPYRIGHT file
> -+ */
> -+
> -+/* Mostly copied from sasl.c */
> -+
> -+#include "portable.h"
> -+
> -+#include <stdlib.h>
> -+#include <stdio.h>
> -+
> -+#include <ac/socket.h>
> -+#include <ac/string.h>
> -+#include <ac/time.h>
> -+#include <ac/errno.h>
> -+
> -+#include "ldap-int.h"
> -+
> -+int
> -+ldap_ntlm_bind(
> -+ LDAP    *ld,
> -+ LDAP_CONST char *dn,
> -+ ber_tag_t tag,
> -+ struct berval *cred,
> -+ LDAPControl **sctrls,
> -+ LDAPControl **cctrls,
> -+ int   *msgidp )
> -+{
> -+ BerElement  *ber;
> -+ int rc;
> -+ ber_int_t id;
> -+
> -+ Debug( LDAP_DEBUG_TRACE, "ldap_ntlm_bind\n", 0, 0, 0 );
> -+
> -+ assert( ld != NULL );
> -+ assert( LDAP_VALID( ld ) );
> -+ assert( msgidp != NULL );
> -+
> -+ if( msgidp == NULL ) {
> -+   ld->ld_errno = LDAP_PARAM_ERROR;
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ /* create a message to send */
> -+ if ( (ber = ldap_alloc_ber_with_options( ld )) == NULL ) {
> -+   ld->ld_errno = LDAP_NO_MEMORY;
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ assert( LBER_VALID( ber ) );
> -+
> -+ LDAP_NEXT_MSGID( ld, id );
> -+ rc = ber_printf( ber, "{it{istON}" /*}*/,
> -+      id, LDAP_REQ_BIND,
> -+      ld->ld_version, dn, tag,
> -+      cred );
> -+
> -+ /* Put Server Controls */
> -+ if( ldap_int_put_controls( ld, sctrls, ber ) != LDAP_SUCCESS ) {
> -+   ber_free( ber, 1 );
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ if ( ber_printf( ber, /*{*/ "N}" ) == -1 ) {
> -+   ld->ld_errno = LDAP_ENCODING_ERROR;
> -+   ber_free( ber, 1 );
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ /* send the message */
> -+ *msgidp = ldap_send_initial_request( ld, LDAP_REQ_BIND, dn, ber, id );
> -+
> -+ if(*msgidp < 0)
> -+   return ld->ld_errno;
> -+
> -+ return LDAP_SUCCESS;
> -+}
> -+
> -+int
> -+ldap_parse_ntlm_bind_result(
> -+ LDAP    *ld,
> -+ LDAPMessage *res,
> -+ struct berval *challenge)
> -+{
> -+ ber_int_t errcode;
> -+ ber_tag_t tag;
> -+ BerElement  *ber;
> -+ ber_len_t len;
> -+
> -+ Debug( LDAP_DEBUG_TRACE, "ldap_parse_ntlm_bind_result\n", 0, 0, 0 );
> -+
> -+ assert( ld != NULL );
> -+ assert( LDAP_VALID( ld ) );
> -+ assert( res != NULL );
> -+
> -+ if ( ld == NULL || res == NULL ) {
> -+   return LDAP_PARAM_ERROR;
> -+ }
> -+
> -+ if( res->lm_msgtype != LDAP_RES_BIND ) {
> -+   ld->ld_errno = LDAP_PARAM_ERROR;
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ if ( ld->ld_error ) {
> -+   LDAP_FREE( ld->ld_error );
> -+   ld->ld_error = NULL;
> -+ }
> -+ if ( ld->ld_matched ) {
> -+   LDAP_FREE( ld->ld_matched );
> -+   ld->ld_matched = NULL;
> -+ }
> -+
> -+ /* parse results */
> -+
> -+ ber = ber_dup( res->lm_ber );
> -+
> -+ if( ber == NULL ) {
> -+   ld->ld_errno = LDAP_NO_MEMORY;
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ tag = ber_scanf( ber, "{ioa" /*}*/,
> -+      &errcode, challenge, &ld->ld_error );
> -+ ber_free( ber, 0 );
> -+
> -+ if( tag == LBER_ERROR ) {
> -+   ld->ld_errno = LDAP_DECODING_ERROR;
> -+   return ld->ld_errno;
> -+ }
> -+
> -+ ld->ld_errno = errcode;
> -+
> -+ return( ld->ld_errno );
> -+}
> -+
> ---- a/libraries/libldap/Makefile.in
> -+++ b/libraries/libldap/Makefile.in
> -@@ -27,7 +27,7 @@ SRCS = bind.c open.c result.c error.c co
> -       init.c options.c print.c string.c util-int.c schema.c \
> -       charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
> -       tls2.c tls_o.c tls_g.c tls_m.c \
> --      turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
> -+      turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c ntlm.c \
> -       assertion.c deref.c ldif.c fetch.c
> -
> - OBJS  = bind.lo open.lo result.lo error.lo compare.lo search.lo \
> -@@ -40,7 +40,7 @@ OBJS = bind.lo open.lo result.lo error.l
> -       init.lo options.lo print.lo string.lo util-int.lo schema.lo \
> -       charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
> -       tls2.lo tls_o.lo tls_g.lo tls_m.lo \
> --      turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
> -+      turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo ntlm.lo \
> -       assertion.lo deref.lo ldif.lo fetch.lo
> -
> - LDAP_INCDIR= ../../include
> ---- a/libraries/libldap_r/Makefile.in
> -+++ b/libraries/libldap_r/Makefile.in
> -@@ -29,7 +29,7 @@ XXSRCS    = apitest.c test.c \
> -       init.c options.c print.c string.c util-int.c schema.c \
> -       charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
> -       tls2.c tls_o.c tls_g.c tls_m.c \
> --      turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
> -+      turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c ntlm.c \
> -       assertion.c deref.c ldif.c fetch.c
> - SRCS  = threads.c rdwr.c rmutex.c tpool.c rq.c \
> -       thr_posix.c thr_cthreads.c thr_thr.c thr_nt.c \
> -@@ -47,7 +47,7 @@ OBJS = threads.lo rdwr.lo rmutex.lo tpoo
> -       init.lo options.lo print.lo string.lo util-int.lo schema.lo \
> -       charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
> -       tls2.lo tls_o.lo tls_g.lo tls_m.lo \
> --      turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
> -+      turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo ntlm.lo \
> -       assertion.lo deref.lo ldif.lo fetch.lo
> -
> - LDAP_INCDIR= ../../include
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
> b/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
> deleted file mode 100644
> index 418fe35..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- a/build/top.mk
> -+++ b/build/top.mk
> -@@ -20,7 +20,7 @@
> - RELEASEDATE= @OPENLDAP_RELEASE_DATE@
> -
> - @SET_MAKE@
> --SHELL = /bin/sh
> -+SHELL = @SHELL@
> -
> - top_builddir = @top_builddir@
> -
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
> b/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
> deleted file mode 100644
> index 1f0ca88..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1214,7 +1214,7 @@ if test $ol_link_tls = no ; then
> -                               ol_with_tls=gnutls
> -                               ol_link_tls=yes
> -
> --                              TLS_LIBS="-lgnutls"
> -+                              TLS_LIBS="-lgnutls -lgcrypt"
> -
> -                               AC_DEFINE(HAVE_GNUTLS, 1,
> -                                       [define if you have GNUtls])
> ---- a/libraries/libldap/Makefile.in
> -+++ b/libraries/libldap/Makefile.in
> -@@ -51,21 +51,21 @@ LIB_DEFS = -DLDAP_LIBRARY
> - XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(LDAP_LIBLUTIL_A)
> - XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
> - NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> --UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> -+UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> $(TLS_LIBS)
> - ifneq (,$(VERSION_OPTION))
> -   VERSION_FLAGS = $(VERSION_OPTION)$(srcdir)/libldap.map
> - endif
> -
> - apitest:      $(XLIBS) apitest.o
> --      $(LTLINK) -o $@ apitest.o $(LIBS)
> -+      $(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)
> - dntest:       $(XLIBS) dntest.o
> --      $(LTLINK) -o $@ dntest.o $(LIBS)
> -+      $(LTLINK) -o $@ dntest.o $(LIBS) $(TLS_LIBS)
> - ftest:        $(XLIBS) ftest.o
> --      $(LTLINK) -o $@ ftest.o $(LIBS)
> -+      $(LTLINK) -o $@ ftest.o $(LIBS) $(TLS_LIBS)
> - ltest:        $(XLIBS) test.o
> --      $(LTLINK) -o $@ test.o $(LIBS)
> -+      $(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)
> - urltest: $(XLIBS) urltest.o
> --      $(LTLINK) -o $@ urltest.o $(LIBS)
> -+      $(LTLINK) -o $@ urltest.o $(LIBS) $(TLS_LIBS)
> -
> - CFFILES=ldap.conf
> -
> ---- a/libraries/libldap_r/Makefile.in
> -+++ b/libraries/libldap_r/Makefile.in
> -@@ -60,7 +60,7 @@ XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(
> - XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
> - XXXLIBS = $(LTHREAD_LIBS)
> - NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> --UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> $(LTHREAD_LIBS)
> -+UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> $(LTHREAD_LIBS) $(TLS_LIBS)
> - ifneq (,$(VERSION_OPTION))
> -   VERSION_FLAGS = "$(VERSION_OPTION)$(XXDIR)/libldap.map"
> - endif
> -@@ -80,9 +80,9 @@ clean-local: FORCE
> - depend-common: .links
> -
> - apitest:      $(XLIBS) apitest.o
> --      $(LTLINK) -o $@ apitest.o $(LIBS)
> -+      $(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)
> - ltest:        $(XLIBS) test.o
> --      $(LTLINK) -o $@ test.o $(LIBS)
> -+      $(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)
> -
> - install-local: $(CFFILES) FORCE
> -       -$(MKDIR) $(DESTDIR)$(libdir)
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
> b/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
> deleted file mode 100644
> index ab6e2b7..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Author: Steve Langasek <vorlon@debian.org>
> -
> -OpenLDAP upstream conservatively assumes that certain resolver functions
> -(getaddrinfo, getnameinfo, res_query, dn_expand) are not re-entrant; but
> we
> -know that the glibc implementations of these functions are thread-safe, so
> -we should bypass the use of this mutex.  This fixes a locking problem when
> -an application uses libldap and libnss-ldap is also used for hosts
> -resolution.
> -
> -Closes Debian bug #340601.
> -
> -Not suitable for forwarding upstream; might be made suitable by adding a
> -configure-time check for glibc and disabling the mutex only on known
> -thread-safe implementations.
> -
> ---- a/libraries/libldap/os-ip.c
> -+++ b/libraries/libldap/os-ip.c
> -@@ -602,13 +602,7 @@ ldap_connect_to_host(LDAP *ld, Sockbuf *
> -       hints.ai_socktype = socktype;
> -       snprintf(serv, sizeof serv, "%d", port );
> -
> --      /* most getaddrinfo(3) use non-threadsafe resolver libraries */
> --      LDAP_MUTEX_LOCK(&ldap_int_resolv_mutex);
> --
> -       err = getaddrinfo( host, serv, &hints, &res );
> --
> --      LDAP_MUTEX_UNLOCK(&ldap_int_resolv_mutex);
> --
> -       if ( err != 0 ) {
> -               osip_debug(ld, "ldap_connect_to_host: getaddrinfo failed:
> %s\n",
> -                       AC_GAI_STRERROR(err), 0, 0);
> ---- a/libraries/libldap/util-int.c
> -+++ b/libraries/libldap/util-int.c
> -@@ -431,9 +431,7 @@ int ldap_pvt_get_hname(
> -       int rc;
> - #if defined( HAVE_GETNAMEINFO )
> -
> --      LDAP_MUTEX_LOCK( &ldap_int_resolv_mutex );
> -       rc = getnameinfo( sa, len, name, namelen, NULL, 0, 0 );
> --      LDAP_MUTEX_UNLOCK( &ldap_int_resolv_mutex );
> -       if ( rc ) *err = (char *)AC_GAI_STRERROR( rc );
> -       return rc;
> -
> diff --git a/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
> b/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
> deleted file mode 100644
> index f6fa7ec..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Author: Mattias Ellert <mattias.ellert@fysast.uu.se>
> -Description: adapt parameters of hdb_generate_key_set_password() to
> heimdal 1.6~git20120311
> - .
> - With version heimdal 1.6~git20120311 heimdal schanged the number of
> parameters
> - of function hdb_generate_key_set_password(), implementing a fallback to
> "default"
> - values when NULL-values are passed for these parameters.
> - .
> - This patch does exactly that.
> - .
> -Bug-Debian: 664930
> -Reviewed-by: Peter Marschall <peter@adpm.de>
> -
> ---- a/contrib/slapd-modules/smbk5pwd/smbk5pwd.c
> -+++ b/contrib/slapd-modules/smbk5pwd/smbk5pwd.c
> -@@ -470,7 +470,7 @@ static int smbk5pwd_exop_passwd(
> -               }
> -
> -               ret = hdb_generate_key_set_password(context, ent.principal,
> --                      qpw->rs_new.bv_val, &ent.keys.val, &nkeys);
> -+                      qpw->rs_new.bv_val, NULL, 0, &ent.keys.val,
> &nkeys);
> -               ent.keys.len = nkeys;
> -               hdb_seal_keys(context, db, &ent);
> -               krb5_free_principal( context, ent.principal );
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
> b/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
> deleted file mode 100644
> index 47fc88a..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Document in the man page that slapindex should be run as the same user
> -as slapd, and print a warning if it's run as root (since Debian defaults
> -to running slapd as openldap).
> -
> -Not suitable for upstream in this form.  This patch needs to be reworked
> -to check the BerkeleyDB database ownership and only warn if running as
> -root with a database that's not owned by root.
> -
> -Upstream ITS #5356 filed requesting better handling of this.  Current
> -upstream discussion leans towards putting the check into the database
> -backend and aborting if slapd is run as a different user than the database
> -owner, which is an even better fix.
> -
> ---- a/doc/man/man8/slapindex.8
> -+++ b/doc/man/man8/slapindex.8
> -@@ -148,6 +148,10 @@
> - should not be running (at least, not in read-write
> - mode) when you do this to ensure consistency of the database.
> - .LP
> -+slapindex ought to be run as the user specified for
> -+.BR slapd (8)
> -+to ensure correct database permissions.
> -+.LP
> - This command provides ample opportunity for the user to obtain
> - and drink their favorite beverage.
> - .SH EXAMPLES
> ---- a/servers/slapd/slapindex.c
> -+++ b/servers/slapd/slapindex.c
> -@@ -34,6 +34,8 @@
> - int
> - slapindex( int argc, char **argv )
> - {
> -+    if (geteuid() == 0)
> -+        fprintf( stderr, "\nWARNING!\nRunnig as root!\nThere's a fair
> chance slapd will fail to start.\nCheck file permissions!\n\n");
> -       ID id;
> -       int rc = EXIT_SUCCESS;
> -       const char *progname = "slapindex";
> diff --git a/recipes-support/openldap/openldap-2.4.39/install-strip.patch
> b/recipes-support/openldap/openldap-2.4.39/install-strip.patch
> deleted file mode 100644
> index 2992b70..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/install-strip.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# This patch ensures that the install operations which strip
> -# programs and libraries (LTINSTALL) work in a cross build
> -# environment.
> ---- openldap-2.2.24/.pc/install-strip.patch/build/top.mk
>  2005-01-20 09:00:55.000000000 -0800
> -+++ openldap-2.2.24/build/top.mk       2005-04-16 13:48:20.536710376
> -0700
> -@@ -116,7 +116,7 @@
> - LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
> -       $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
> -
> --LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL)
> -+LTINSTALL = STRIPPROG="" $(LIBTOOL) --mode=install
> $(top_srcdir)/contrib/ldapc++/install-sh -c
> - LTFINISH = $(LIBTOOL) --mode=finish
> -
> - # Misc UNIX commands used in build environment
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
> b/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
> deleted file mode 100644
> index e8aab91..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> ---- a/doc/man/man5/ldap.conf.5
> -+++ b/doc/man/man5/ldap.conf.5
> -@@ -317,7 +317,7 @@ certificates in separate individual file
> - .B TLS_CACERT
> - is always used before
> - .B TLS_CACERTDIR.
> --This parameter is ignored with GnuTLS.
> -+This parameter is ignored with GnuTLS. On Debian openldap is linked
> against GnuTLS.
> -
> - When using Mozilla NSS, <path> may contain a Mozilla NSS cert/key
> - database.  If <path> contains a Mozilla NSS cert/key database and
> -@@ -428,7 +428,7 @@ This parameter is ignored with GnuTLS.
> - Specifies the file to obtain random bits from when /dev/[u]random is
> - not available. Generally set to the name of the EGD/PRNGD socket.
> - The environment variable RANDFILE can also be used to specify the
> filename.
> --This parameter is ignored with GnuTLS and Mozilla NSS.
> -+This parameter is ignored with GnuTLS and Mozilla NSS. On Debian
> openldap is linked against GnuTLS.
> - .TP
> - .B TLS_REQCERT <level>
> - Specifies what checks to perform on server certificates in a TLS session,
> -@@ -461,7 +461,7 @@ Specifies if the Certificate Revocation
> - used to verify if the server certificates have not been revoked. This
> - requires
> - .B TLS_CACERTDIR
> --parameter to be set. This parameter is ignored with GnuTLS and Mozilla
> NSS.
> -+parameter to be set. This parameter is ignored with GnuTLS and Mozilla
> NSS. On Debian openldap is linked against GnuTLS.
> - .B <level>
> - can be specified as one of the following keywords:
> - .RS
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
> b/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
> deleted file mode 100644
> index a482bbf..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Move the ldapi socket to /var/run/slapd from /var/run, since /var/run
> -is only writable by root and slapd runs as openldap.
> -
> -Debian-specific.
> -
> ---- a/include/ldap_defaults.h
> -+++ b/include/ldap_defaults.h
> -@@ -39,7 +39,7 @@
> - #define LDAP_ENV_PREFIX "LDAP"
> -
> - /* default ldapi:// socket */
> --#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"
> -+#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "slapd"
> LDAP_DIRSEP "ldapi"
> -
> - /*
> -  * SLAPD DEFINITIONS
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
> b/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
> deleted file mode 100644
> index fb28f49..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
> +++ /dev/null
> @@ -1,161 +0,0 @@
> -Add symbol versioning to the public LDAP libraries.  This is required for
> -library transitions, such as the current transition from 2.1 to 2.4,
> -since programs will sometimes have both libraries loaded by different
> -dependency chains during the transition.
> -
> -Not yet contributed upstream.
> -
> -Upstream ITS #5365 filed requesting symbol versioning for libldap and
> -libber.
> -
> ---- a/libraries/libldap_r/Makefile.in
> -+++ b/libraries/libldap_r/Makefile.in
> -@@ -61,6 +61,9 @@ XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
> - XXXLIBS = $(LTHREAD_LIBS)
> - NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> - UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> $(LTHREAD_LIBS)
> -+ifneq (,$(VERSION_OPTION))
> -+  VERSION_FLAGS = "$(VERSION_OPTION)$(XXDIR)/libldap.map"
> -+endif
> -
> - .links : Makefile
> -       @for i in $(XXSRCS); do \
> ---- a/build/top.mk
> -+++ b/build/top.mk
> -@@ -104,6 +104,9 @@ LTFLAGS_MOD = $(@PLAT@_LTFLAGS_MOD)
> - # LINK_LIBS referenced in library and module link commands.
> - LINK_LIBS = $(MOD_LIBS) $(@PLAT@_LINK_LIBS)
> -
> -+# option to pass to $(CC) to support library symbol versioning, if any
> -+VERSION_OPTION = @VERSION_OPTION@
> -+
> - LTSTATIC = @LTSTATIC@
> -
> - LTLINK   = $(LIBTOOL) --mode=link \
> -@@ -113,7 +116,7 @@ LTCOMPILE_LIB = $(LIBTOOL) $(LTONLY_LIB)
> -       $(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(LIB_DEFS) -c
> -
> - LTLINK_LIB = $(LIBTOOL) $(LTONLY_LIB) --mode=link \
> --      $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB)
> -+      $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB) $(VERSION_FLAGS)
> -
> - LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
> -       $(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(MOD_DEFS) -c
> ---- a/build/openldap.m4
> -+++ b/build/openldap.m4
> -@@ -1136,3 +1136,54 @@ AC_DEFUN([OL_SSL_COMPAT],
> - #endif
> -       ], [ol_cv_ssl_crl_compat=yes], [ol_cv_ssl_crl_compat=no])])
> - ])
> -+
> -+dnl ====================================================================
> -+dnl check for symbol versioning support
> -+AC_DEFUN([OL_SYMBOL_VERSIONING],
> -+[AC_CACHE_CHECK([for .symver assembler directive],
> -+      [ol_cv_asm_symver_directive],[
> -+cat > conftest.s <<EOF
> -+${libc_cv_dot_text}
> -+_sym:
> -+.symver _sym,sym@VERS
> -+EOF
> -+if ${CC-cc} -c $ASFLAGS conftest.s 1>&AS_MESSAGE_LOG_FD
> 2>&AS_MESSAGE_LOG_FD; then
> -+  ol_cv_asm_symver_directive=yes
> -+else
> -+  ol_cv_asm_symver_directive=no
> -+fi
> -+rm -f conftest*])
> -+AC_CACHE_CHECK([for ld --version-script],
> -+      [ol_cv_ld_version_script_option],[
> -+if test $ol_cv_asm_symver_directive = yes; then
> -+  cat > conftest.s <<EOF
> -+${libc_cv_dot_text}
> -+_sym:
> -+.symver _sym,sym@VERS
> -+EOF
> -+  cat > conftest.map <<EOF
> -+VERS_1 {
> -+      global: sym;
> -+};
> -+
> -+VERS_2 {
> -+      global: sym;
> -+} VERS_1;
> -+EOF
> -+  if ${CC-cc} -c $ASFLAGS conftest.s 1>&AS_MESSAGE_LOG_FD
> 2>&AS_MESSAGE_LOG_FD; then
> -+    if AC_TRY_COMMAND([${CC-cc} $CFLAGS $LDFLAGS -shared
> -+                                                 -o conftest.so
> conftest.o
> -+
>  -Wl,--version-script,conftest.map
> -+                       1>&AS_MESSAGE_LOG_FD]);
> -+    then
> -+      ol_cv_ld_version_script_option=yes
> -+    else
> -+      ol_cv_ld_version_script_option=no
> -+    fi
> -+  else
> -+    ol_cv_ld_version_script_option=no
> -+  fi
> -+else
> -+  ol_cv_ld_version_script_option=no
> -+fi
> -+rm -f conftest*])])
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1909,6 +1909,13 @@ else
> - fi
> - AC_SUBST(LTSTATIC)dnl
> -
> -+VERSION_OPTION=""
> -+OL_SYMBOL_VERSIONING
> -+if test $ol_cv_ld_version_script_option = yes ; then
> -+  VERSION_OPTION="-Wl,--version-script="
> -+fi
> -+AC_SUBST(VERSION_OPTION)
> -+
> - dnl ----------------------------------------------------------------
> - if test $ol_enable_wrappers != no ; then
> -       AC_CHECK_HEADERS(tcpd.h,[
> ---- /dev/null
> -+++ b/libraries/libldap/libldap.map
> -@@ -0,0 +1,7 @@
> -+OPENLDAP_2.4_2 {
> -+  global:
> -+    ldap_*;
> -+    ldif_*;
> -+  local:
> -+    *;
> -+};
> ---- a/libraries/libldap/Makefile.in
> -+++ b/libraries/libldap/Makefile.in
> -@@ -52,6 +52,9 @@ XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(
> - XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
> - NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> - UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
> -+ifneq (,$(VERSION_OPTION))
> -+  VERSION_FLAGS = $(VERSION_OPTION)$(srcdir)/libldap.map
> -+endif
> -
> - apitest:      $(XLIBS) apitest.o
> -       $(LTLINK) -o $@ apitest.o $(LIBS)
> ---- a/libraries/liblber/Makefile.in
> -+++ b/libraries/liblber/Makefile.in
> -@@ -38,6 +38,9 @@ XLIBS = $(LIBRARY) $(LDAP_LIBLUTIL_A)
> - XXLIBS =
> - NT_LINK_LIBS = $(AC_LIBS)
> - UNIX_LINK_LIBS = $(AC_LIBS)
> -+ifneq (,$(VERSION_OPTION))
> -+  VERSION_FLAGS = "$(VERSION_OPTION)$(srcdir)/liblber.map"
> -+endif
> -
> - dtest:    $(XLIBS) dtest.o
> -       $(LTLINK) -o $@ dtest.o $(LIBS)
> ---- /dev/null
> -+++ b/libraries/liblber/liblber.map
> -@@ -0,0 +1,8 @@
> -+OPENLDAP_2.4_2 {
> -+  global:
> -+    ber_*;
> -+    der_alloc;
> -+    lutil_*;
> -+  local:
> -+    *;
> -+};
> diff --git a/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
> b/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
> deleted file mode 100644
> index 5f55137..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Patch the slapd man page to not refer to a header file that isn't
> -installed with the slapd package and to reference the correct path
> -for slapd.
> -
> -Debian-specific.
> -
> ---- a/doc/man/man8/slapd.8
> -+++ b/doc/man/man8/slapd.8
> -@@ -5,7 +5,7 @@
> - .SH NAME
> - slapd \- Stand-alone LDAP Daemon
> - .SH SYNOPSIS
> --.B LIBEXECDIR/slapd
> -+.B /usr/sbin/slapd
> - [\c
> - .BR \-4 | \-6 ]
> - [\c
> -@@ -103,11 +103,10 @@
> - will not fork or disassociate from the invoking terminal.  Some general
> - operation and status messages are printed for any value of
> \fIdebug-level\fP.
> - \fIdebug-level\fP is taken as a bit string, with each bit corresponding
> to a
> --different kind of debugging information.  See <ldap_log.h> for details.
> --Comma-separated arrays of friendly names can be specified to select
> --debugging output of the corresponding debugging information.
> --All the names recognized by the \fIloglevel\fP directive
> --described in \fBslapd.conf\fP(5) are supported.
> -+different kind of debugging information.  Comma-separated arrays of
> friendly
> -+names can be specified to select debugging output of the corresponding
> -+debugging information.  All the names recognized by the \fIloglevel\fP
> -+directive described in \fBslapd.conf\fP(5) are supported.
> - If \fIdebug-level\fP is \fB?\fP, a list of installed debug-levels is
> printed,
> - and slapd exits.
> -
> -@@ -317,7 +316,7 @@
> - .LP
> - .nf
> - .ft tt
> --      LIBEXECDIR/slapd
> -+      /usr/sbin/slapd
> - .ft
> - .fi
> - .LP
> -@@ -328,7 +327,7 @@
> - .LP
> - .nf
> - .ft tt
> --      LIBEXECDIR/slapd \-f /var/tmp/slapd.conf \-d 255
> -+      /usr/sbin/slapd \-f /var/tmp/slapd.conf \-d 255
> - .ft
> - .fi
> - .LP
> -@@ -336,7 +335,7 @@
> - .LP
> - .nf
> - .ft tt
> --      LIBEXECDIR/slapd \-Tt
> -+      /usr/sbin/slapd \-Tt
> - .ft
> - .fi
> - .LP
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
> b/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
> deleted file mode 100644
> index 8e7812d..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Description: don't use AM_INIT_AUTOMAKE macro when we aren't using
> automake
> - Calling AM_INIT_AUTOMAKE() in configure.in serves no purpose if we're
> not
> - using automake, and it confuses autoreconf.  Use AC_INIT() instead.
> -Author: Steve Langasek <vorlon@debian.org>
> -
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -26,7 +26,8 @@ dnl Configure.in for OpenLDAP
> - AC_COPYRIGHT([[Copyright 1998-2014 The OpenLDAP Foundation. All rights
> reserved.
> - Restrictions apply, see COPYRIGHT and LICENSE files.]])
> - AC_REVISION([$Id: 81bd528fb5194c83d688db355737b7715448b958 $])
> --AC_INIT([OpenLDAP],,[http://www.openldap.org/its/])
> -+AC_INIT([OpenLDAP],[$OL_VERSION],[http://www.openldap.org/its/])
> -+AC_PROG_MAKE_SET
> - m4_define([AC_PACKAGE_BUGREPORT],[<http://www.openldap.org/its/>])
> - AC_CONFIG_SRCDIR(build/version.sh)dnl
> - dnl ----------------------------------------------------------------
> -@@ -69,7 +70,6 @@ dnl Determine host platform
> - dnl           we try not to use this for much
> - AC_CANONICAL_TARGET([])
> -
> --AM_INIT_AUTOMAKE([$OL_PACKAGE],[$OL_VERSION], [no defines])dnl
> - AC_SUBST(PACKAGE)dnl
> - AC_SUBST(VERSION)dnl
> - AC_DEFINE_UNQUOTED(OPENLDAP_PACKAGE,"$PACKAGE",Package)
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
> b/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
> deleted file mode 100644
> index db76aa7..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Author: Steve Langasek <vorlon@debian.org>
> -Description: don't second-guess BDB ABI
> - OpenLDAP upstream conservatively assumes that any change to the version
> - number of libdb can result in an API-breaking change that could impact
> - the database.  In Debian, we know that such changes require bumping the
> - library soname and changing the package name, and demand such rigor from
> - our package maintainers even when upstreams don't deliver; so any such
> - check in the source code works against the packaging system by forcing
> - database upgrades when we know none are required.  Disable this check
> - so we rely on the packaging system to do its job.
> -Bug-Debian: http://bugs.debian.org/651333
> -Forwarded: not-needed
> -
> ---- a/servers/slapd/back-bdb/init.c
> -+++ b/servers/slapd/back-bdb/init.c
> -@@ -762,7 +762,7 @@ bdb_back_initialize(
> -       bi->bi_controls = controls;
> -
> -       {       /* version check */
> --              int major, minor, patch, ver;
> -+              int major, minor, patch;
> -               char *version = db_version( &major, &minor, &patch );
> - #ifdef HAVE_EBCDIC
> -               char v2[1024];
> -@@ -776,17 +776,6 @@ bdb_back_initialize(
> -               version = v2;
> - #endif
> -
> --              ver = (major << 24) | (minor << 16) | patch;
> --              if( ver != DB_VERSION_FULL ) {
> --                      /* fail if a versions don't match */
> --                      Debug( LDAP_DEBUG_ANY,
> --                              LDAP_XSTRING(bdb_back_initialize) ": "
> --                              "BDB library version mismatch:"
> --                              " expected " DB_VERSION_STRING ","
> --                              " got %s\n", version, 0, 0 );
> --                      return -1;
> --              }
> --
> -               Debug( LDAP_DEBUG_TRACE, LDAP_XSTRING(bdb_back_initialize)
> -                       ": %s\n", version, 0, 0 );
> -       }
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
> b/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
> deleted file mode 100644
> index 5ea240f..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Add /etc/ldap/sasl2 to the SASL configuration search path.
> -
> -Not submitted upstream.  Somewhat Debian-specific and probably not of
> -interest upstream.
> -
> ---- a/include/ldap_defaults.h
> -+++ b/include/ldap_defaults.h
> -@@ -63,4 +63,6 @@
> -       /* dn of the default "monitor" subentry */
> - #define SLAPD_MONITOR_DN              "cn=Monitor"
> -
> -+#define SASL_CONFIGPATH                        LDAP_SYSCONFDIR
> LDAP_DIRSEP "sasl2"
> -+
> - #endif /* _LDAP_CONFIG_H */
> ---- a/servers/slapd/sasl.c
> -+++ b/servers/slapd/sasl.c
> -@@ -1103,12 +1103,38 @@ static const rewrite_mapper slapd_mapper
> - };
> - #endif
> -
> -+static int
> -+slap_sasl_getconfpath( void * context, char ** path )
> -+{
> -+      char * sasl_default_configpath;
> -+      size_t len;
> -+
> -+#if SASL_VERSION_MAJOR >= 2
> -+      sasl_default_configpath = "/usr/lib/sasl2";
> -+#else
> -+      sasl_default_configpath = "/usr/lib/sasl";
> -+#endif
> -+
> -+      len = strlen(SASL_CONFIGPATH) + 1 /* colon */ +
> -+              strlen(sasl_default_configpath) + 1 /* \0 */;
> -+      *path = malloc( len );
> -+      if ( *path == NULL )
> -+              return SASL_FAIL;
> -+
> -+      if (snprintf( *path, len, "%s:%s", SASL_CONFIGPATH,
> -+                              sasl_default_configpath ) != len-1 )
> -+              return SASL_FAIL;
> -+
> -+      return SASL_OK;
> -+}
> -+
> - int slap_sasl_init( void )
> - {
> - #ifdef HAVE_CYRUS_SASL
> -       int rc;
> -       static sasl_callback_t server_callbacks[] = {
> -               { SASL_CB_LOG, &slap_sasl_log, NULL },
> -+              { SASL_CB_GETCONFPATH, &slap_sasl_getconfpath, NULL },
> -               { SASL_CB_GETOPT, &slap_sasl_getopt, NULL },
> -               { SASL_CB_LIST_END, NULL, NULL }
> -       };
> diff --git a/recipes-support/openldap/openldap-2.4.39/series
> b/recipes-support/openldap/openldap-2.4.39/series
> deleted file mode 100644
> index 2f47de3..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/series
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -man-slapd
> -evolution-ntlm
> -slapi-errorlog-file
> -ldapi-socket-place
> -wrong-database-location
> -index-files-created-as-root
> -sasl-default-path
> -libldap-symbol-versions
> -getaddrinfo-is-threadsafe
> -do-not-second-guess-sonames
> -contrib-modules-use-dpkg-buildflags
> -smbk5pwd-makefile
> -autogroup-makefile
> -ldap-conf-tls-cacertdir
> -add-tlscacert-option-to-ldap-conf
> -fix-ftbfs-binutils-gold
> -fix-build-top-mk
> -no-AM_INIT_AUTOMAKE
> -switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff
> -no-bdb-ABI-second-guessing
> -heimdal-fix
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
> b/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
> deleted file mode 100644
> index 4899451..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -The slapi error log file defaults to /var/errors given our setting
> -of --localstatedir.  Move it to /var/log/slapi-errors instead.
> -
> -Debian-specific.
> -
> ---- a/servers/slapd/slapi/slapi_overlay.c
> -+++ b/servers/slapd/slapi/slapi_overlay.c
> -@@ -930,7 +930,7 @@ int slapi_over_config( BackendDB *be, Co
> -               ldap_pvt_thread_mutex_init( &slapi_printmessage_mutex );
> -
> -               if ( slapi_log_file == NULL )
> --                      slapi_log_file = slapi_ch_strdup( LDAP_RUNDIR
> LDAP_DIRSEP "errors" );
> -+                      slapi_log_file = slapi_ch_strdup( LDAP_RUNDIR
> LDAP_DIRSEP "log" LDAP_DIRSEP "slapi-errors" );
> -
> -               rc = slapi_int_init_object_extensions();
> -               if ( rc != 0 )
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
> b/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
> deleted file mode 100644
> index 17d1b56..0000000
> --- a/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> ---- a/contrib/slapd-modules/smbk5pwd/Makefile
> -+++ b/contrib/slapd-modules/smbk5pwd/Makefile
> -@@ -14,17 +14,17 @@
> -
> - LDAP_SRC = ../../..
> - LDAP_BUILD = ../../..
> --LDAP_INC = -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include
> -I$(LDAP_SRC)/servers/slapd
> --LDAP_LIB = $(LDAP_BUILD)/libraries/libldap_r/libldap_r.la \
> --      $(LDAP_BUILD)/libraries/liblber/liblber.la
> -+LDAP_INC = -I$(LDAP_BUILD)/debian/build/include
> -I$(LDAP_BUILD)/debian/build/servers/slapd -I$(LDAP_BUILD)/include
> -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
> -+LDAP_LIB = $(LDAP_BUILD)/debian/build/libraries/libldap_r/libldap_r.la \
> -+      $(LDAP_BUILD)/debian/build/libraries/liblber/liblber.la
> -
> - SSL_INC =
> --SSL_LIB = -lcrypto
> -+SSL_LIB = -lgcrypt
> -
> --HEIMDAL_INC = -I/usr/heimdal/include
> --HEIMDAL_LIB = -L/usr/heimdal/lib -lkrb5 -lkadm5srv
> -+HEIMDAL_INC = -I/usr/include
> -+HEIMDAL_LIB = -lkrb5 -lkadm5srv
> -
> --LIBTOOL = $(LDAP_BUILD)/libtool
> -+LIBTOOL = $(LDAP_BUILD)/debian/build/libtool
> - CC = gcc
> - OPT = -g -O2 -Wall
> - # Omit DO_KRB5, DO_SAMBA or DO_SHADOW if you don't want to support it.
> -@@ -35,13 +35,13 @@ LIBS = $(LDAP_LIB) $(HEIMDAL_LIB) $(SSL_
> - PROGRAMS = smbk5pwd.la
> - LTVER = 0:0:0
> -
> --prefix=/usr/local
> -+prefix=/usr
> - exec_prefix=$(prefix)
> --ldap_subdir=/openldap
> -+ldap_subdir=/ldap
> -
> - libdir=$(exec_prefix)/lib
> - libexecdir=$(exec_prefix)/libexec
> --moduledir = $(libexecdir)$(ldap_subdir)
> -+moduledir = $(libdir)$(ldap_subdir)
> -
> - .SUFFIXES: .c .o .lo
> -
> -@@ -55,7 +55,7 @@ smbk5pwd.la: smbk5pwd.lo
> -       -rpath $(moduledir) -module -o $@ $? $(LIBS)
> -
> - clean:
> --      rm -rf *.o *.lo *.la .libs
> -+      $(LIBTOOL) --mode=clean rm -f
> -
> - install: $(PROGRAMS)
> -       mkdir -p $(DESTDIR)$(moduledir)
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
> b/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
> deleted file mode 100644
> index df2801f..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From: Jan-Marek Glogowski <jan-marek.glogowski@muenchen.de>
> -Date: Tue, 18 May 2010 17:47:05 +0200
> -Subject: Switch to lt_dlopenadvise() so back_perl can be opened with
> RTLD_GLOBAL.
> - Open all modules with RTLD_GLOBAL, needed so that back_perl can load
> - non-trivial Perl extensions that require symbols from back_perl.so
> itself.
> -Bug-Debian: http://bugs.debian.org/327585
> -
> ----
> ---- a/servers/slapd/module.c
> -+++ b/servers/slapd/module.c
> -@@ -117,6 +117,20 @@ int module_unload( const char *file_name
> -       return -1;      /* not found */
> - }
> -
> -+static lt_dlhandle slapd_lt_dlopenext_global( const char *filename )
> -+{
> -+      lt_dlhandle handle = 0;
> -+      lt_dladvise advise;
> -+
> -+      if (!lt_dladvise_init (&advise) && !lt_dladvise_ext (&advise)
> -+                      && !lt_dladvise_global (&advise))
> -+              handle = lt_dlopenadvise (filename, advise);
> -+
> -+      lt_dladvise_destroy (&advise);
> -+
> -+      return handle;
> -+}
> -+
> - int module_load(const char* file_name, int argc, char *argv[])
> - {
> -       module_loaded_t *module;
> -@@ -180,7 +194,7 @@ int module_load(const char* file_name, i
> -        * to calling Debug. This is because Debug is a macro that expands
> -        * into multiple function calls.
> -        */
> --      if ((module->lib = lt_dlopenext(file)) == NULL) {
> -+      if ((module->lib = slapd_lt_dlopenext_global(file)) == NULL) {
> -               error = lt_dlerror();
> - #ifdef HAVE_EBCDIC
> -               strcpy( ebuf, error );
> diff --git
> a/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
> b/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
> deleted file mode 100644
> index 25d96cb..0000000
> ---
> a/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Move the default slapd database location to /var/lib/ldap instead of
> -/var/openldap-data.
> -
> -Debian-specific.
> -
> ---- a/doc/man/man5/slapd-bdb.5
> -+++ b/doc/man/man5/slapd-bdb.5
> -@@ -131,7 +131,7 @@ Specify the directory where the BDB file
> - associated indexes live.
> - A separate directory must be specified for each database.
> - The default is
> --.BR LOCALSTATEDIR/openldap\-data .
> -+.BR LOCALSTATEDIR/lib/ldap .
> - .TP
> - .B dirtyread
> - Allow reads of modified but not yet committed data.
> ---- a/doc/man/man5/slapd.conf.5
> -+++ b/doc/man/man5/slapd.conf.5
> -@@ -2007,7 +2007,7 @@ suffix    "dc=our\-domain,dc=com"
> - # The database directory MUST exist prior to
> - # running slapd AND should only be accessible
> - # by the slapd/tools. Mode 0700 recommended.
> --directory LOCALSTATEDIR/openldap\-data
> -+directory LOCALSTATEDIR/lib/ldap
> - # Indices to maintain
> - index     objectClass  eq
> - index     cn,sn,mail   pres,eq,approx,sub
> ---- a/include/ldap_defaults.h
> -+++ b/include/ldap_defaults.h
> -@@ -47,7 +47,7 @@
> -       /* location of the default slapd config file */
> - #define SLAPD_DEFAULT_CONFIGFILE      LDAP_SYSCONFDIR LDAP_DIRSEP
> "slapd.conf"
> - #define SLAPD_DEFAULT_CONFIGDIR               LDAP_SYSCONFDIR
> LDAP_DIRSEP "slapd.d"
> --#define SLAPD_DEFAULT_DB_DIR          LDAP_RUNDIR LDAP_DIRSEP
> "openldap-data"
> -+#define SLAPD_DEFAULT_DB_DIR          LDAP_RUNDIR LDAP_DIRSEP "lib"
> LDAP_DIRSEP "ldap"
> - #define SLAPD_DEFAULT_DB_MODE         0600
> - #define SLAPD_DEFAULT_UCDATA          LDAP_DATADIR LDAP_DIRSEP "ucdata"
> -       /* default max deref depth for aliases */
> ---- a/servers/slapd/Makefile.in
> -+++ b/servers/slapd/Makefile.in
> -@@ -445,9 +445,9 @@ install-conf: FORCE
> -
> - install-db-config: FORCE
> -       @-$(MKDIR) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir)
> --      @-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/openldap-data
> -+      @-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/lib/ldap
> -       $(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_CONFIG \
> --              $(DESTDIR)$(localstatedir)/openldap-data/DB_CONFIG.example
> -+              $(DESTDIR)$(localstatedir)/lib/ldap/DB_CONFIG.example
> -       $(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_CONFIG \
> -               $(DESTDIR)$(sysconfdir)/DB_CONFIG.example
> -
> ---- a/doc/man/man5/slapd-config.5
> -+++ b/doc/man/man5/slapd-config.5
> -@@ -2051,7 +2051,7 @@ olcSuffix: "dc=our\-domain,dc=com"
> - # The database directory MUST exist prior to
> - # running slapd AND should only be accessible
> - # by the slapd/tools. Mode 0700 recommended.
> --olcDbDirectory: LOCALSTATEDIR/openldap\-data
> -+olcDbDirectory: LOCALSTATEDIR/lib/ldap
> - # Indices to maintain
> - olcDbIndex:     objectClass  eq
> - olcDbIndex:     cn,sn,mail   pres,eq,approx,sub
> ---- a/doc/man/man5/slapd-mdb.5
> -+++ b/doc/man/man5/slapd-mdb.5
> -@@ -52,7 +52,7 @@ Specify the directory where the LMDB fil
> - associated indexes live.
> - A separate directory must be specified for each database.
> - The default is
> --.BR LOCALSTATEDIR/openldap\-data .
> -+.BR LOCALSTATEDIR/lib/ldap .
> - .TP
> - \fBenvflags
> \fR{\fBnosync\fR,\fBnometasync\fR,\fBwritemap\fR,\fBmapasync\fR,\fBnordahead\fR}
> - Specify flags for finer-grained control of the LMDB library's operation.
> diff --git a/recipes-support/openldap/openldap_2.4.39.bb
> b/recipes-support/openldap/openldap_2.4.39.bb
> deleted file mode 100644
> index 3048c8e..0000000
> --- a/recipes-support/openldap/openldap_2.4.39.bb
> +++ /dev/null
> @@ -1,182 +0,0 @@
> -# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
> -#
> -DESCRIPTION = "OpenLDAP Software is an open source implementation of the
> Lightweight Directory Access Protocol."
> -HOMEPAGE = "http://www.OpenLDAP.org/license.html"
> -# The OpenLDAP Public License - see the HOMEPAGE - defines
> -# the license.  www.openldap.org claims this is Open Source
> -# (see http://www.openldap.org), the license appears to be
> -# basically BSD.  opensource.org does not record this license
> -# at present (so it is apparently not OSI certified).
> -LICENSE = "OpenLDAP"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f2bdbaa4f50199a00b6de2ca7ec1db05"
> -SECTION = "libs"
> -
> -# patches taken from Debian
> -SRC_URI = "\
> -    ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz \
> -    file://man-slapd.patch \
> -    file://evolution-ntlm.patch \
> -    file://slapi-errorlog-file.patch \
> -    file://ldapi-socket-place.patch \
> -    file://wrong-database-location.patch \
> -    file://index-files-created-as-root.patch \
> -    file://sasl-default-path.patch \
> -    file://libldap-symbol-versions.patch \
> -    file://getaddrinfo-is-threadsafe.patch \
> -    file://do-not-second-guess-sonames.patch \
> -    file://contrib-modules-use-dpkg-buildflags.patch \
> -    file://smbk5pwd-makefile.patch \
> -    file://autogroup-makefile.patch \
> -    file://ldap-conf-tls-cacertdir.patch \
> -    file://add-tlscacert-option-to-ldap-conf.patch \
> -    file://fix-ftbfs-binutils-gold.patch \
> -    file://fix-build-top-mk.patch \
> -    file://no-AM_INIT_AUTOMAKE.patch \
> -    file://switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch \
> -    file://no-bdb-ABI-second-guessing.patch \
> -    file://heimdal-fix.patch \
> -"
> -SRC_URI[md5sum] = "b0d5ee4b252c841dec6b332d679cf943"
> -SRC_URI[sha256sum] =
> "8267c87347103fef56b783b24877c0feda1063d3cb85d070e503d076584bf8a7"
> -
> -DEPENDS = "util-linux groff-native db"
> -
> -PR = "r0"
> -# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
> -# installing .so and executables, this fails in cross compilation
> -# environments
> -SRC_URI += "file://install-strip.patch"
> -
> -# inherit autotools
> -inherit autotools-brokensep
> -
> -# CV SETTINGS
> -# Required to work round AC_FUNC_MEMCMP which gets the wrong answer
> -# when cross compiling (should be in site?)
> -EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
> -
> -# CONFIG DEFINITIONS
> -# The following is necessary because it cannot be determined for a
> -# cross compile automagically.  Select should yield fine on all OE
> -# systems...
> -EXTRA_OECONF += "--with-yielding-select=yes"
> -# Shared libraries are nice...
> -EXTRA_OECONF += "--enable-dynamic"
> -
> -PACKAGECONFIG ??= "openssl modules \
> -                   ldap meta monitor null passwd shell proxycache dnssrv \
> -                  bdb hdb mdb sasl \
> -"
> -#--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
> -PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls"
> -PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
> -
> -PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
> -PACKAGECONFIG[modules] = "lt_cv_dlopen_self=yes
> --enable-modules,--disable-modules,libtool"
> -
> -# SLAPD options
> -#
> -# UNIX crypt(3) passwd support:
> -EXTRA_OECONF += "--enable-crypt"
> -
> -EXTRA_OECONF += "--enable-ipv6"
> -
> -# SLAPD BACKEND
> -#
> -# The backend must be set by the configuration.  This controls the
> -# required database, the default database, bdb, is turned off but
> -# can be turned back on again and it *is* below!  The monitor backend
> -# is also disabled.  If you try to change the backends but fail to
> -# enable a single one the build will fail in an obvious way.
> -#
> -# EXTRA_OECONF += "--disable-bdb --disable-hdb --disable-monitor"
> -#
> -# Backends="bdb dnssrv hdb ldap ldbm meta monitor null passwd perl shell
> sql"
> -#
> -# Note that multiple backends can be built.  The ldbm backend requires a
> -# build-time choice of database API.  The bdb backend forces this to be
> -# DB4.  To use the gdbm (or other) API the Berkely database module must
> -# be removed from the build.
> -md = "${libexecdir}/openldap"
> -#
> -#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
> -# The Berkely DB is the standard choice.  This version of OpenLDAP
> requires
> -# the version 4 implementation or better.
> -PACKAGECONFIG[bdb] = "--enable-bdb=mod,--enable-bdb=no,db"
> -
> -#--enable-dnssrv       enable dnssrv backend no|yes|mod no
> -PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
> -
> -#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
> -# This forces ldbm to use Berkeley too, remove to use gdbm
> -PACKAGECONFIG[hdb] = "--enable-hdb=mod,--enable-hdb=no,db"
> -
> -#--enable-ldap         enable ldap backend no|yes|mod no
> -PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
> -
> -#--enable-ldbm         enable ldbm backend no|yes|mod no
> -# ldbm requires further specification of the underlying database API,
> because
> -# bdb is enabled above this must be set to berkeley, however the config
> -# defaults this correctly so --with-ldbm-api is *not* set.  The build will
> -# fail if bdb is removed, but no database is built to provide the
> -# support for ldbm
> -# guide.html:<P>back-ldbm was both slow and unreliable. Its byzantine
> indexing code was prone to spontaneous corruption, as were the underlying
> database libraries that were commonly used (e.g. GDBM or NDBM). back-bdb
> and back-hdb are superior in every aspect, with simplified indexing to
> avoid index corruption, fine-grained locking for greater concurrency,
> hierarchical caching for greater performance, streamlined on-disk format
> for greater efficiency and portability, and full transaction support for
> greater reliability.</P>
> -# configure: WARNING: unrecognized options: --disable-silent-rules,
> --enable-ldbm, --with-ldbm-api
> -#PACKAGECONFIG[ldbm] = "--enable-ldbm=mod
> --with-ldbm-api=gdbm,--enable-ldbm-no,gdbm"
> -
> -#--enable-meta         enable metadirectory backend no|yes|mod no
> -PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
> -
> -#--enable-monitor      enable monitor backend no|yes|mod yes
> -PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
> -
> -#--enable-null         enable null backend no|yes|mod no
> -PACKAGECONFIG[null] = "--enable-null=mod,--enable-null=no,"
> -
> -#--enable-passwd       enable passwd backend no|yes|mod no
> -PACKAGECONFIG[passwd] = "--enable-passwd=mod,--enable-passwd=no,"
> -
> -# disabling perl support - host contamination issues
> -#
> -#--enable-perl         enable perl backend no|yes|mod no
> -#  This requires a loadable perl dynamic library, if enabled without
> -#  doing something appropriate (building perl?) the build will pick
> -#  up the build machine perl - not good (inherit perlnative?)
> -# PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
> -
> -#--enable-shell        enable shell backend no|yes|mod no
> -# configure: WARNING: Use of --without-threads is recommended with
> back-shell
> -PACKAGECONFIG[shell] = "--enable-shell=mod
> --without-threads,--enable-shell=no,"
> -
> -#--enable-sql          enable sql backend no|yes|mod no
> -# sql requires some sql backend which provides sql.h, sqlite* provides
> -# sqlite.h (which may be compatible but hasn't been tried.)
> -PACKAGECONFIG[sql] = "--enable-sql=mod,--enable-sql=no,sqlite3"
> -
> -#--enable-dyngroup     Dynamic Group overlay no|yes|mod no
> -#  This is a demo, Proxy Cache defines init_module which conflicts with
> the
> -#  same symbol in dyngroup
> -PACKAGECONFIG[dyngroup] = "--enable-dyngroup=mod,--enable-dyngroup=no,"
> -
> -#--enable-proxycache   Proxy Cache overlay no|yes|mod no
> -PACKAGECONFIG[proxycache] =
> "--enable-proxycache=mod,--enable-proxycache=no,"
> -
> -#--enable-mdb         enable mdb database backend no|yes|mod no
> -PACKAGECONFIG[mdb] = "--enable-mdb=mod,--enable-mdb=no,"
> -
> -CPPFLAGS_append = " -D_GNU_SOURCE"
> -
> -do_configure() {
> -    cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
> -    rm -f ${S}/libtool
> -    rm -f ${S}/libtool
> -    aclocal
> -    libtoolize --force --copy
> -    gnu-configize
> -    autoconf
> -    oe_runconf
> -}
> -
> -FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la
> ${libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la
> ${libexecdir}/openldap/*.so"
> -FILES_${PN}-dbg += "${libexecdir}/openldap/.debug"
> -
> --
> 2.7.0
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

--001a1143158aa46c1c052aca141e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 2, 2016 at 6:40 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt=
;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">meta-oe contains=
 a newer openldap recipe wich provides everything this<br>
recipe does. Since the meta-cloud-services layers already depend on<br>
meta-oe, we can remove this openldap recipe and use the more actively<br>
maintained one from meta-oe.<br></blockquote><div><br><br></div><div>The ve=
rsion is frozen here on purpose. So for now, we&#39;ll keep our copy. The<b=
r></div><div>update cadence of meta-oe does not lend itself to working with=
 meta-cloud-services.<br></div><div><br></div><div>If meta-oe is ever split=
 into smaller repos, I can finally start dropping and updating<br></div><di=
v>more of these.<br><br></div><div>Bruce<br></div><div><br><br>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0.../add-tlscacert-option-to-ldap-conf.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 10 -<br>
=C2=A0.../openldap-2.4.39/autogroup-makefile.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 35 ----<br>
=C2=A0.../contrib-modules-use-dpkg-buildflags.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 40 ----<br>
=C2=A0.../do-not-second-guess-sonames.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 68 -------<br>
=C2=A0.../openldap/openldap-2.4.39/evolution-ntlm.patch=C2=A0 | 222 -------=
--------------<br>
=C2=A0.../openldap-2.4.39/fix-build-top-mk.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 11 -<br>
=C2=A0.../openldap-2.4.39/fix-ftbfs-binutils-gold.patch=C2=A0 |=C2=A0 64 --=
----<br>
=C2=A0.../getaddrinfo-is-threadsafe.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 43 ----<br>
=C2=A0.../openldap/openldap-2.4.39/heimdal-fix.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 23 ---<br>
=C2=A0.../index-files-created-as-root.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 37 ----<br>
=C2=A0.../openldap/openldap-2.4.39/install-strip.patch=C2=A0 =C2=A0|=C2=A0 =
14 --<br>
=C2=A0.../openldap-2.4.39/ldap-conf-tls-cacertdir.patch=C2=A0 |=C2=A0 29 --=
-<br>
=C2=A0.../openldap-2.4.39/ldapi-socket-place.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 16 --<br>
=C2=A0.../openldap-2.4.39/libldap-symbol-versions.patch=C2=A0 | 161 -------=
--------<br>
=C2=A0.../openldap/openldap-2.4.39/man-slapd.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 60 ------<br>
=C2=A0.../openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 25 ---<br>
=C2=A0.../no-bdb-ABI-second-guessing.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 42 ----<br>
=C2=A0.../openldap-2.4.39/sasl-default-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 55 -----<br>
=C2=A0recipes-support/openldap/openldap-2.4.39/series=C2=A0 =C2=A0 |=C2=A0 =
21 --<br>
=C2=A0.../openldap-2.4.39/slapi-errorlog-file.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 16 --<br>
=C2=A0.../openldap-2.4.39/smbk5pwd-makefile.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 53 -----<br>
=C2=A0..._dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch |=C2=A0 40 ----<br=
>
=C2=A0.../openldap-2.4.39/wrong-database-location.patch=C2=A0 |=C2=A0 74 --=
-----<br>
=C2=A0recipes-support/openldap/<a href=3D"http://openldap_2.4.39.bb" rel=3D=
"noreferrer" target=3D"_blank">openldap_2.4.39.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 182 -----------------<br>
=C2=A024 files changed, 1341 deletions(-)<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/add-tlsca=
cert-option-to-ldap-conf.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/autogroup=
-makefile.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/contrib-m=
odules-use-dpkg-buildflags.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/do-not-se=
cond-guess-sonames.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/evolution=
-ntlm.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/fix-build=
-top-mk.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/fix-ftbfs=
-binutils-gold.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/getaddrin=
fo-is-threadsafe.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/heimdal-f=
ix.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/index-fil=
es-created-as-root.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/install-s=
trip.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/ldap-conf=
-tls-cacertdir.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/ldapi-soc=
ket-place.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/libldap-s=
ymbol-versions.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/man-slapd=
.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/no-AM_INI=
T_AUTOMAKE.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/no-bdb-AB=
I-second-guessing.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/sasl-defa=
ult-path.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/series<br=
>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/slapi-err=
orlog-file.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/smbk5pwd-=
makefile.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/switch-to=
-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/openldap-2.4.39/wrong-dat=
abase-location.patch<br>
=C2=A0delete mode 100644 recipes-support/openldap/<a href=3D"http://openlda=
p_2.4.39.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.39.bb</a><br=
>
<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-=
to-ldap-conf.patch b/recipes-support/openldap/openldap-2.4.39/add-tlscacert=
-option-to-ldap-conf.patch<br>
deleted file mode 100644<br>
index e8e731a..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap=
-conf.patch<br>
+++ /dev/null<br>
@@ -1,10 +0,0 @@<br>
---- a/libraries/libldap/ldap.conf<br>
-+++ b/libraries/libldap/ldap.conf<br>
-@@ -11,3 +11,7 @@<br>
- #SIZELIMIT=C2=A0 =C2=A0 12<br>
- #TIMELIMIT=C2=A0 =C2=A0 15<br>
- #DEREF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 never<br>
-+<br>
-+# TLS certificates (needed for GnuTLS)<br>
-+TLS_CACERT=C2=A0 =C2=A0 /etc/ssl/certs/ca-certificates.crt<br>
-+<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.pa=
tch b/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch<br>
deleted file mode 100644<br>
index d3f56c3..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
---- a/contrib/slapd-modules/autogroup/Makefile<br>
-+++ b/contrib/slapd-modules/autogroup/Makefile<br>
-@@ -2,11 +2,11 @@<br>
-<br>
- LDAP_SRC =3D ../../..<br>
- LDAP_BUILD =3D ../../..<br>
--LDAP_INC =3D -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC)/=
servers/slapd<br>
--LDAP_LIB =3D $(LDAP_BUILD)/libraries/libldap_r/<a href=3D"http://libldap_=
r.la" rel=3D"noreferrer" target=3D"_blank">libldap_r.la</a> \<br>
--=C2=A0 =C2=A0 =C2=A0 $(LDAP_BUILD)/libraries/liblber/<a href=3D"http://li=
blber.la" rel=3D"noreferrer" target=3D"_blank">liblber.la</a><br>
-+LDAP_INC =3D -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/include=
 -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd<br>
-+LDAP_LIB =3D $(LDAP_BUILD)/debian/build/libraries/libldap_r/<a href=3D"ht=
tp://libldap_r.la" rel=3D"noreferrer" target=3D"_blank">libldap_r.la</a> \<=
br>
-+=C2=A0 =C2=A0 =C2=A0 $(LDAP_BUILD)/debian/build/libraries/liblber/<a href=
=3D"http://liblber.la" rel=3D"noreferrer" target=3D"_blank">liblber.la</a><=
br>
-<br>
--LIBTOOL =3D $(LDAP_BUILD)/libtool<br>
-+LIBTOOL =3D $(LDAP_BUILD)/debian/build/libtool<br>
- CC =3D gcc<br>
- OPT =3D -g -O2 -Wall<br>
- DEFS =3D<br>
-@@ -16,13 +16,13 @@ LIBS =3D $(LDAP_LIB)<br>
- PROGRAMS =3D <a href=3D"http://autogroup.la" rel=3D"noreferrer" target=3D=
"_blank">autogroup.la</a><br>
- LTVER =3D 0:0:0<br>
-<br>
--prefix=3D/usr/local<br>
-+prefix=3D/usr<br>
- exec_prefix=3D$(prefix)<br>
--ldap_subdir=3D/openldap<br>
-+ldap_subdir=3D/ldap<br>
-<br>
- libdir=3D$(exec_prefix)/lib<br>
- libexecdir=3D$(exec_prefix)/libexec<br>
--moduledir =3D $(libexecdir)$(ldap_subdir)<br>
-+moduledir =3D $(libdir)$(ldap_subdir)<br>
-<br>
- .SUFFIXES: .c .o .lo<br>
-<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-d=
pkg-buildflags.patch b/recipes-support/openldap/openldap-2.4.39/contrib-mod=
ules-use-dpkg-buildflags.patch<br>
deleted file mode 100644<br>
index 1b15529..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-bui=
ldflags.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-Description: pass CFLAGS to contrib builds<br>
- $(CFLAGS) is missing from the compiler invocations for autogroup and<br>
- smbk5pwd, which means they&#39;re not being hardened.<br>
-Author: Simon Ruderich &lt;<a href=3D"mailto:simon@ruderich.org">simon@rud=
erich.org</a>&gt;<br>
-Bug-Debian: <a href=3D"http://bugs.debian.org/663724" rel=3D"noreferrer" t=
arget=3D"_blank">http://bugs.debian.org/663724</a><br>
-<br>
---- a/contrib/slapd-modules/autogroup/Makefile<br>
-+++ b/contrib/slapd-modules/autogroup/Makefile<br>
-@@ -27,12 +27,12 @@ moduledir =3D $(libexecdir)$(ldap_subdir)<br>
- .SUFFIXES: .c .o .lo<br>
-<br>
- .c.lo:<br>
--=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(DEFS) $(I=
NCS) -c $&lt;<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(CFLAGS) $=
(DEFS) $(INCS) -c $&lt;<br>
-<br>
- all: $(PROGRAMS)<br>
-<br>
- <a href=3D"http://autogroup.la" rel=3D"noreferrer" target=3D"_blank">auto=
group.la</a>: autogroup.lo<br>
--=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dlink $(CC) $(OPT) -version-info =
$(LTVER) \<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dlink $(CC) $(OPT) $(LDFLAGS) -ve=
rsion-info $(LTVER) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-rpath $(moduledir) -module -o $@ $? $(LIBS)<br=
>
-<br>
- clean:<br>
---- a/contrib/slapd-modules/smbk5pwd/Makefile<br>
-+++ b/contrib/slapd-modules/smbk5pwd/Makefile<br>
-@@ -46,12 +46,12 @@ moduledir =3D $(libexecdir)$(ldap_subdir)<br>
- .SUFFIXES: .c .o .lo<br>
-<br>
- .c.lo:<br>
--=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(DEFS) $(I=
NCS) -c $&lt;<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dcompile $(CC) $(OPT) $(CFLAGS) $=
(DEFS) $(INCS) -c $&lt;<br>
-<br>
- all: $(PROGRAMS)<br>
-<br>
- <a href=3D"http://smbk5pwd.la" rel=3D"noreferrer" target=3D"_blank">smbk5=
pwd.la</a>:=C2=A0 smbk5pwd.lo<br>
--=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dlink $(CC) $(OPT) -version-info =
$(LTVER) \<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dlink $(CC) $(OPT) $(LDFLAGS) -ve=
rsion-info $(LTVER) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-rpath $(moduledir) -module -o $@ $? $(LIBS)<br=
>
-<br>
- clean:<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-s=
onames.patch b/recipes-support/openldap/openldap-2.4.39/do-not-second-guess=
-sonames.patch<br>
deleted file mode 100644<br>
index 31cf652..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.=
patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-Rip out code that second-guesses the libsasl soname / Debian shlibs.=C2=A0=
 If<br>
-cyrus sasl upstream is breaking the ABI, this needs to be fixed upstream<b=
r>
-there, not kludged around upstream here!<br>
-<br>
-Debian bug #546885<br>
-<br>
-Upstream ITS #6302 filed.<br>
-<br>
---- a/libraries/libldap/cyrus.c<br>
-+++ b/libraries/libldap/cyrus.c<br>
-@@ -74,28 +74,6 @@ int ldap_int_sasl_init( void )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX not threadsafe */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static int sasl_initialized =3D 0;<br>
-<br>
--#ifdef HAVE_SASL_VERSION<br>
--=C2=A0 =C2=A0 =C2=A0 /* stringify the version number, sasl.h doesn&#39;t =
do it for us */<br>
--#define VSTR0(maj, min, pat)=C2=A0 #maj &quot;.&quot; #min &quot;.&quot; =
#pat<br>
--#define VSTR(maj, min, pat)=C2=A0 =C2=A0VSTR0(maj, min, pat)<br>
--#define SASL_VERSION_STRING=C2=A0 =C2=A0VSTR(SASL_VERSION_MAJOR, SASL_VER=
SION_MINOR, \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SASL_VERSION_STEP)<br>
--=C2=A0 =C2=A0 =C2=A0 { int rc;<br>
--=C2=A0 =C2=A0 =C2=A0 sasl_version( NULL, &amp;rc );<br>
--=C2=A0 =C2=A0 =C2=A0 if ( ((rc &gt;&gt; 16) !=3D ((SASL_VERSION_MAJOR &lt=
;&lt; 8)|SASL_VERSION_MINOR)) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc &amp; 0xffff) &lt; S=
ASL_VERSION_STEP) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char version[sizeof(&quo=
t;xxx.xxx.xxxxx&quot;)];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf( version, &quot;=
%u.%d.%d&quot;, (unsigned)rc &gt;&gt; 24, (rc &gt;&gt; 16) &amp; 0xff,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rc &amp; 0xffff );<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Debug( LDAP_DEBUG_ANY,<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ldap_int_sasl_init=
: SASL library version mismatch:&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; expected &quot; S=
ASL_VERSION_STRING &quot;,&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; got %s\n&quot;, v=
ersion, 0, 0 );<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( sasl_initialized ) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
---- a/servers/slapd/sasl.c<br>
-+++ b/servers/slapd/sasl.c<br>
-@@ -1145,26 +1145,6 @@ int slap_sasl_init( void )<br>
- #endif<br>
-<br>
- #ifdef HAVE_CYRUS_SASL<br>
--#ifdef HAVE_SASL_VERSION<br>
--=C2=A0 =C2=A0 =C2=A0 /* stringify the version number, sasl.h doesn&#39;t =
do it for us */<br>
--#define=C2=A0 =C2=A0 =C2=A0 =C2=A0VSTR0(maj, min, pat)=C2=A0 =C2=A0 #maj =
&quot;.&quot; #min &quot;.&quot; #pat<br>
--#define=C2=A0 =C2=A0 =C2=A0 =C2=A0VSTR(maj, min, pat)=C2=A0 =C2=A0 =C2=A0=
VSTR0(maj, min, pat)<br>
--#define=C2=A0 =C2=A0 =C2=A0 =C2=A0SASL_VERSION_STRING=C2=A0 =C2=A0 =C2=A0=
VSTR(SASL_VERSION_MAJOR, SASL_VERSION_MINOR, \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SASL_VERSION_STEP)<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 sasl_version( NULL, &amp;rc );<br>
--=C2=A0 =C2=A0 =C2=A0 if ( ((rc &gt;&gt; 16) !=3D ((SASL_VERSION_MAJOR &lt=
;&lt; 8)|SASL_VERSION_MINOR)) ||<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rc &amp; 0xffff) &lt; S=
ASL_VERSION_STEP)<br>
--=C2=A0 =C2=A0 =C2=A0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char version[sizeof(&quo=
t;xxx.xxx.xxxxx&quot;)];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf( version, &quot;=
%u.%d.%d&quot;, (unsigned)rc &gt;&gt; 24, (rc &gt;&gt; 16) &amp; 0xff,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rc &amp; 0xffff );<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Debug( LDAP_DEBUG_ANY, &=
quot;slap_sasl_init: SASL library version mismatch:&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot; expected %s, got %s\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SASL_VERSION_STRING, version, 0 );<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--#endif<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sasl_set_mutex(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldap_pvt_sasl_mutex=
_new,<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch =
b/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch<br>
deleted file mode 100644<br>
index cd9bc26..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch<br>
+++ /dev/null<br>
@@ -1,222 +0,0 @@<br>
-Patch from evolution-exchange (2.10.3).=C2=A0 The ldap_ntlm_bind function =
is<br>
-actually called by evolution-data-server, checked at version 1.12.2.<br>
-Without this patch, the Exchange addressbook integration uses simple binds=
<br>
-with cleartext passwords.<br>
-<br>
-Russ checked with openldap-software for upstream&#39;s opinion on this pat=
ch<br>
-on 2007-12-21.=C2=A0 Upstream had never received it as a patch submission =
and<br>
-given that it&#39;s apparently only for older Exchange servers that can&#3=
9;t do<br>
-SASL and DIGEST-MD5, it&#39;s not very appealing.<br>
-<br>
-Bug#457374 filed against evolution-data-server asking if this support is<b=
r>
-still required on 2007-12-21.<br>
-<br>
---- a/include/ldap.h<br>
-+++ b/include/ldap.h<br>
-@@ -2517,5 +2517,25 @@ ldap_parse_deref_control LDAP_P((<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LDAPControl=C2=A0 =C2=A0 =C2=A0**ctrls,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LDAPDerefRes=C2=A0 =C2=A0 **drp ));<br>
-<br>
-+/*<br>
-+ * hacks for NTLM<br>
-+ */<br>
-+#define LDAP_AUTH_NTLM_REQUEST ((ber_tag_t) 0x8aU)<br>
-+#define LDAP_AUTH_NTLM_RESPONSE=C2=A0 ((ber_tag_t) 0x8bU)<br>
-+LDAP_F( int )<br>
-+ldap_ntlm_bind LDAP_P((<br>
-+=C2=A0 =C2=A0 =C2=A0 LDAP=C2=A0 =C2=A0 *ld,<br>
-+=C2=A0 =C2=A0 =C2=A0 LDAP_CONST char *dn,<br>
-+=C2=A0 =C2=A0 =C2=A0 ber_tag_t tag,<br>
-+=C2=A0 =C2=A0 =C2=A0 struct berval *cred,<br>
-+=C2=A0 =C2=A0 =C2=A0 LDAPControl **sctrls,<br>
-+=C2=A0 =C2=A0 =C2=A0 LDAPControl **cctrls,<br>
-+=C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0*msgidp ));<br>
-+LDAP_F( int )<br>
-+ldap_parse_ntlm_bind_result LDAP_P((<br>
-+=C2=A0 =C2=A0 =C2=A0 LDAP=C2=A0 =C2=A0 *ld,<br>
-+=C2=A0 =C2=A0 =C2=A0 LDAPMessage *res,<br>
-+=C2=A0 =C2=A0 =C2=A0 struct berval *challenge));<br>
-+<br>
- LDAP_END_DECL<br>
- #endif /* _LDAP_H */<br>
---- /dev/null<br>
-+++ b/libraries/libldap/ntlm.c<br>
-@@ -0,0 +1,138 @@<br>
-+/* $OpenLDAP: pkg/ldap/libraries/libldap/ntlm.c,v 1.1.4.10 2002/01/04 20:=
38:21 kurt Exp $ */<br>
-+/*<br>
-+ * Copyright 1998-2002 The OpenLDAP Foundation, All Rights Reserved.<br>
-+ * COPYING RESTRICTIONS APPLY, see COPYRIGHT file<br>
-+ */<br>
-+<br>
-+/* Mostly copied from sasl.c */<br>
-+<br>
-+#include &quot;portable.h&quot;<br>
-+<br>
-+#include &lt;stdlib.h&gt;<br>
-+#include &lt;stdio.h&gt;<br>
-+<br>
-+#include &lt;ac/socket.h&gt;<br>
-+#include &lt;ac/string.h&gt;<br>
-+#include &lt;ac/time.h&gt;<br>
-+#include &lt;ac/errno.h&gt;<br>
-+<br>
-+#include &quot;ldap-int.h&quot;<br>
-+<br>
-+int<br>
-+ldap_ntlm_bind(<br>
-+ LDAP=C2=A0 =C2=A0 *ld,<br>
-+ LDAP_CONST char *dn,<br>
-+ ber_tag_t tag,<br>
-+ struct berval *cred,<br>
-+ LDAPControl **sctrls,<br>
-+ LDAPControl **cctrls,<br>
-+ int=C2=A0 =C2=A0*msgidp )<br>
-+{<br>
-+ BerElement=C2=A0 *ber;<br>
-+ int rc;<br>
-+ ber_int_t id;<br>
-+<br>
-+ Debug( LDAP_DEBUG_TRACE, &quot;ldap_ntlm_bind\n&quot;, 0, 0, 0 );<br>
-+<br>
-+ assert( ld !=3D NULL );<br>
-+ assert( LDAP_VALID( ld ) );<br>
-+ assert( msgidp !=3D NULL );<br>
-+<br>
-+ if( msgidp =3D=3D NULL ) {<br>
-+=C2=A0 =C2=A0ld-&gt;ld_errno =3D LDAP_PARAM_ERROR;<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ /* create a message to send */<br>
-+ if ( (ber =3D ldap_alloc_ber_with_options( ld )) =3D=3D NULL ) {<br>
-+=C2=A0 =C2=A0ld-&gt;ld_errno =3D LDAP_NO_MEMORY;<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ assert( LBER_VALID( ber ) );<br>
-+<br>
-+ LDAP_NEXT_MSGID( ld, id );<br>
-+ rc =3D ber_printf( ber, &quot;{it{istON}&quot; /*}*/,<br>
-+=C2=A0 =C2=A0 =C2=A0 id, LDAP_REQ_BIND,<br>
-+=C2=A0 =C2=A0 =C2=A0 ld-&gt;ld_version, dn, tag,<br>
-+=C2=A0 =C2=A0 =C2=A0 cred );<br>
-+<br>
-+ /* Put Server Controls */<br>
-+ if( ldap_int_put_controls( ld, sctrls, ber ) !=3D LDAP_SUCCESS ) {<br>
-+=C2=A0 =C2=A0ber_free( ber, 1 );<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ if ( ber_printf( ber, /*{*/ &quot;N}&quot; ) =3D=3D -1 ) {<br>
-+=C2=A0 =C2=A0ld-&gt;ld_errno =3D LDAP_ENCODING_ERROR;<br>
-+=C2=A0 =C2=A0ber_free( ber, 1 );<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ /* send the message */<br>
-+ *msgidp =3D ldap_send_initial_request( ld, LDAP_REQ_BIND, dn, ber, id );=
<br>
-+<br>
-+ if(*msgidp &lt; 0)<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+<br>
-+ return LDAP_SUCCESS;<br>
-+}<br>
-+<br>
-+int<br>
-+ldap_parse_ntlm_bind_result(<br>
-+ LDAP=C2=A0 =C2=A0 *ld,<br>
-+ LDAPMessage *res,<br>
-+ struct berval *challenge)<br>
-+{<br>
-+ ber_int_t errcode;<br>
-+ ber_tag_t tag;<br>
-+ BerElement=C2=A0 *ber;<br>
-+ ber_len_t len;<br>
-+<br>
-+ Debug( LDAP_DEBUG_TRACE, &quot;ldap_parse_ntlm_bind_result\n&quot;, 0, 0=
, 0 );<br>
-+<br>
-+ assert( ld !=3D NULL );<br>
-+ assert( LDAP_VALID( ld ) );<br>
-+ assert( res !=3D NULL );<br>
-+<br>
-+ if ( ld =3D=3D NULL || res =3D=3D NULL ) {<br>
-+=C2=A0 =C2=A0return LDAP_PARAM_ERROR;<br>
-+ }<br>
-+<br>
-+ if( res-&gt;lm_msgtype !=3D LDAP_RES_BIND ) {<br>
-+=C2=A0 =C2=A0ld-&gt;ld_errno =3D LDAP_PARAM_ERROR;<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ if ( ld-&gt;ld_error ) {<br>
-+=C2=A0 =C2=A0LDAP_FREE( ld-&gt;ld_error );<br>
-+=C2=A0 =C2=A0ld-&gt;ld_error =3D NULL;<br>
-+ }<br>
-+ if ( ld-&gt;ld_matched ) {<br>
-+=C2=A0 =C2=A0LDAP_FREE( ld-&gt;ld_matched );<br>
-+=C2=A0 =C2=A0ld-&gt;ld_matched =3D NULL;<br>
-+ }<br>
-+<br>
-+ /* parse results */<br>
-+<br>
-+ ber =3D ber_dup( res-&gt;lm_ber );<br>
-+<br>
-+ if( ber =3D=3D NULL ) {<br>
-+=C2=A0 =C2=A0ld-&gt;ld_errno =3D LDAP_NO_MEMORY;<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ tag =3D ber_scanf( ber, &quot;{ioa&quot; /*}*/,<br>
-+=C2=A0 =C2=A0 =C2=A0 &amp;errcode, challenge, &amp;ld-&gt;ld_error );<br>
-+ ber_free( ber, 0 );<br>
-+<br>
-+ if( tag =3D=3D LBER_ERROR ) {<br>
-+=C2=A0 =C2=A0ld-&gt;ld_errno =3D LDAP_DECODING_ERROR;<br>
-+=C2=A0 =C2=A0return ld-&gt;ld_errno;<br>
-+ }<br>
-+<br>
-+ ld-&gt;ld_errno =3D errcode;<br>
-+<br>
-+ return( ld-&gt;ld_errno );<br>
-+}<br>
-+<br>
---- a/libraries/libldap/Makefile.in<br>
-+++ b/libraries/libldap/Makefile.in<br>
-@@ -27,7 +27,7 @@ SRCS =3D bind.c open.c result.c error.c co<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0init.c options.c print.c string.c util-int.c sc=
hema.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0charray.c os-local.c dnssrv.c utf-8.c utf-8-con=
v.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tls2.c tls_o.c tls_g.c tls_m.c \<br>
--=C2=A0 =C2=A0 =C2=A0 turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \<=
br>
-+=C2=A0 =C2=A0 =C2=A0 turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c nt=
lm.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assertion.c deref.c ldif.c fetch.c<br>
-<br>
- OBJS=C2=A0 =3D bind.lo open.lo result.lo error.lo compare.lo search.lo \<=
br>
-@@ -40,7 +40,7 @@ OBJS =3D bind.lo open.lo result.lo error.l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0init.lo options.lo print.lo string.lo util-int.=
lo schema.lo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8=
-conv.lo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tls2.lo tls_o.lo tls_g.lo tls_m.lo \<br>
--=C2=A0 =C2=A0 =C2=A0 turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl=
.lo \<br>
-+=C2=A0 =C2=A0 =C2=A0 turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl=
.lo ntlm.lo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assertion.lo deref.lo ldif.lo fetch.lo<br>
-<br>
- LDAP_INCDIR=3D ../../include<br>
---- a/libraries/libldap_r/Makefile.in<br>
-+++ b/libraries/libldap_r/Makefile.in<br>
-@@ -29,7 +29,7 @@ XXSRCS=C2=A0 =C2=A0 =3D apitest.c test.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0init.c options.c print.c string.c util-int.c sc=
hema.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0charray.c os-local.c dnssrv.c utf-8.c utf-8-con=
v.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tls2.c tls_o.c tls_g.c tls_m.c \<br>
--=C2=A0 =C2=A0 =C2=A0 turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \<=
br>
-+=C2=A0 =C2=A0 =C2=A0 turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c nt=
lm.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assertion.c deref.c ldif.c fetch.c<br>
- SRCS=C2=A0 =3D threads.c rdwr.c rmutex.c tpool.c rq.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0thr_posix.c thr_cthreads.c thr_thr.c thr_nt.c \=
<br>
-@@ -47,7 +47,7 @@ OBJS =3D threads.lo rdwr.lo rmutex.lo tpoo<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0init.lo options.lo print.lo string.lo util-int.=
lo schema.lo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8=
-conv.lo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tls2.lo tls_o.lo tls_g.lo tls_m.lo \<br>
--=C2=A0 =C2=A0 =C2=A0 turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl=
.lo \<br>
-+=C2=A0 =C2=A0 =C2=A0 turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl=
.lo ntlm.lo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assertion.lo deref.lo ldif.lo fetch.lo<br>
-<br>
- LDAP_INCDIR=3D ../../include<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patc=
h b/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch<br>
deleted file mode 100644<br>
index 418fe35..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
---- a/build/<a href=3D"http://top.mk" rel=3D"noreferrer" target=3D"_blank"=
>top.mk</a><br>
-+++ b/build/<a href=3D"http://top.mk" rel=3D"noreferrer" target=3D"_blank"=
>top.mk</a><br>
-@@ -20,7 +20,7 @@<br>
- RELEASEDATE=3D @OPENLDAP_RELEASE_DATE@<br>
-<br>
- @SET_MAKE@<br>
--SHELL =3D /bin/sh<br>
-+SHELL =3D @SHELL@<br>
-<br>
- top_builddir =3D @top_builddir@<br>
-<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-go=
ld.patch b/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold=
.patch<br>
deleted file mode 100644<br>
index 1f0ca88..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patc=
h<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -1214,7 +1214,7 @@ if test $ol_link_tls =3D no ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ol_with_tls=3Dgnutls<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ol_link_tls=3Dyes<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TLS_LIBS=3D&quot;-lgnutls&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TLS_LIBS=3D&quot;-lgnutls -lgcrypt&quot;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_GNUTLS, 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[define i=
f you have GNUtls])<br>
---- a/libraries/libldap/Makefile.in<br>
-+++ b/libraries/libldap/Makefile.in<br>
-@@ -51,21 +51,21 @@ LIB_DEFS =3D -DLDAP_LIBRARY<br>
- XLIBS =3D $(LIBRARY) $(LDAP_LIBLBER_LA) $(LDAP_LIBLUTIL_A)<br>
- XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)<br>
- NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)<br>
--UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)<br>
-+UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(TLS_L=
IBS)<br>
- ifneq (,$(VERSION_OPTION))<br>
-=C2=A0 =C2=A0VERSION_FLAGS =3D $(VERSION_OPTION)$(srcdir)/libldap.map<br>
- endif<br>
-<br>
- apitest:=C2=A0 =C2=A0 =C2=A0 $(XLIBS) apitest.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ apitest.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)<br>
- dntest:=C2=A0 =C2=A0 =C2=A0 =C2=A0$(XLIBS) dntest.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ dntest.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ dntest.o $(LIBS) $(TLS_LIBS)<br>
- ftest:=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(XLIBS) ftest.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ ftest.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ ftest.o $(LIBS) $(TLS_LIBS)<br>
- ltest:=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(XLIBS) test.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ test.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)<br>
- urltest: $(XLIBS) urltest.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ urltest.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ urltest.o $(LIBS) $(TLS_LIBS)<br>
-<br>
- CFFILES=3Dldap.conf<br>
-<br>
---- a/libraries/libldap_r/Makefile.in<br>
-+++ b/libraries/libldap_r/Makefile.in<br>
-@@ -60,7 +60,7 @@ XLIBS =3D $(LIBRARY) $(LDAP_LIBLBER_LA) $(<br>
- XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)<br>
- XXXLIBS =3D $(LTHREAD_LIBS)<br>
- NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)<br>
--UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHRE=
AD_LIBS)<br>
-+UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHRE=
AD_LIBS) $(TLS_LIBS)<br>
- ifneq (,$(VERSION_OPTION))<br>
-=C2=A0 =C2=A0VERSION_FLAGS =3D &quot;$(VERSION_OPTION)$(XXDIR)/libldap.map=
&quot;<br>
- endif<br>
-@@ -80,9 +80,9 @@ clean-local: FORCE<br>
- depend-common: .links<br>
-<br>
- apitest:=C2=A0 =C2=A0 =C2=A0 $(XLIBS) apitest.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ apitest.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)<br>
- ltest:=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(XLIBS) test.o<br>
--=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ test.o $(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)<br>
-<br>
- install-local: $(CFFILES) FORCE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-$(MKDIR) $(DESTDIR)$(libdir)<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-thread=
safe.patch b/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-thread=
safe.patch<br>
deleted file mode 100644<br>
index ab6e2b7..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.pa=
tch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-Author: Steve Langasek &lt;<a href=3D"mailto:vorlon@debian.org">vorlon@deb=
ian.org</a>&gt;<br>
-<br>
-OpenLDAP upstream conservatively assumes that certain resolver functions<b=
r>
-(getaddrinfo, getnameinfo, res_query, dn_expand) are not re-entrant; but w=
e<br>
-know that the glibc implementations of these functions are thread-safe, so=
<br>
-we should bypass the use of this mutex.=C2=A0 This fixes a locking problem=
 when<br>
-an application uses libldap and libnss-ldap is also used for hosts<br>
-resolution.<br>
-<br>
-Closes Debian bug #340601.<br>
-<br>
-Not suitable for forwarding upstream; might be made suitable by adding a<b=
r>
-configure-time check for glibc and disabling the mutex only on known<br>
-thread-safe implementations.<br>
-<br>
---- a/libraries/libldap/os-ip.c<br>
-+++ b/libraries/libldap/os-ip.c<br>
-@@ -602,13 +602,7 @@ ldap_connect_to_host(LDAP *ld, Sockbuf *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hints.ai_socktype =3D socktype;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(serv, sizeof serv, &quot;%d&quot;, por=
t );<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 /* most getaddrinfo(3) use non-threadsafe resolver l=
ibraries */<br>
--=C2=A0 =C2=A0 =C2=A0 LDAP_MUTEX_LOCK(&amp;ldap_int_resolv_mutex);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D getaddrinfo( host, serv, &amp;hints, &a=
mp;res );<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 LDAP_MUTEX_UNLOCK(&amp;ldap_int_resolv_mutex);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( err !=3D 0 ) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0osip_debug(ld, &quo=
t;ldap_connect_to_host: getaddrinfo failed: %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AC_GAI_STRERROR(err), 0, 0);<br>
---- a/libraries/libldap/util-int.c<br>
-+++ b/libraries/libldap/util-int.c<br>
-@@ -431,9 +431,7 @@ int ldap_pvt_get_hname(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
- #if defined( HAVE_GETNAMEINFO )<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 LDAP_MUTEX_LOCK( &amp;ldap_int_resolv_mutex );<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D getnameinfo( sa, len, name, namelen, NUL=
L, 0, 0 );<br>
--=C2=A0 =C2=A0 =C2=A0 LDAP_MUTEX_UNLOCK( &amp;ldap_int_resolv_mutex );<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( rc ) *err =3D (char *)AC_GAI_STRERROR( rc =
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
-<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch b/r=
ecipes-support/openldap/openldap-2.4.39/heimdal-fix.patch<br>
deleted file mode 100644<br>
index f6fa7ec..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-Author: Mattias Ellert &lt;<a href=3D"mailto:mattias.ellert@fysast.uu.se">=
mattias.ellert@fysast.uu.se</a>&gt;<br>
-Description: adapt parameters of hdb_generate_key_set_password() to heimda=
l 1.6~git20120311<br>
- .<br>
- With version heimdal 1.6~git20120311 heimdal schanged the number of param=
eters<br>
- of function hdb_generate_key_set_password(), implementing a fallback to &=
quot;default&quot;<br>
- values when NULL-values are passed for these parameters.<br>
- .<br>
- This patch does exactly that.<br>
- .<br>
-Bug-Debian: 664930<br>
-Reviewed-by: Peter Marschall &lt;<a href=3D"mailto:peter@adpm.de">peter@ad=
pm.de</a>&gt;<br>
-<br>
---- a/contrib/slapd-modules/smbk5pwd/smbk5pwd.c<br>
-+++ b/contrib/slapd-modules/smbk5pwd/smbk5pwd.c<br>
-@@ -470,7 +470,7 @@ static int smbk5pwd_exop_passwd(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D hdb_generat=
e_key_set_password(context, ent.principal,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 qpw-&gt;rs_new.bv_val, &amp;ent.keys.val, &amp;nkeys);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 qpw-&gt;rs_new.bv_val, NULL, 0, &amp;ent.keys.val, &amp;nkeys);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ent.keys.len =3D nk=
eys;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdb_seal_keys(conte=
xt, db, &amp;ent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0krb5_free_principal=
( context, ent.principal );<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/index-files-created-a=
s-root.patch b/recipes-support/openldap/openldap-2.4.39/index-files-created=
-as-root.patch<br>
deleted file mode 100644<br>
index 47fc88a..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.=
patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-Document in the man page that slapindex should be run as the same user<br>
-as slapd, and print a warning if it&#39;s run as root (since Debian defaul=
ts<br>
-to running slapd as openldap).<br>
-<br>
-Not suitable for upstream in this form.=C2=A0 This patch needs to be rewor=
ked<br>
-to check the BerkeleyDB database ownership and only warn if running as<br>
-root with a database that&#39;s not owned by root.<br>
-<br>
-Upstream ITS #5356 filed requesting better handling of this.=C2=A0 Current=
<br>
-upstream discussion leans towards putting the check into the database<br>
-backend and aborting if slapd is run as a different user than the database=
<br>
-owner, which is an even better fix.<br>
-<br>
---- a/doc/man/man8/slapindex.8<br>
-+++ b/doc/man/man8/slapindex.8<br>
-@@ -148,6 +148,10 @@<br>
- should not be running (at least, not in read-write<br>
- mode) when you do this to ensure consistency of the database.<br>
- .LP<br>
-+slapindex ought to be run as the user specified for<br>
-+.BR slapd (8)<br>
-+to ensure correct database permissions.<br>
-+.LP<br>
- This command provides ample opportunity for the user to obtain<br>
- and drink their favorite beverage.<br>
- .SH EXAMPLES<br>
---- a/servers/slapd/slapindex.c<br>
-+++ b/servers/slapd/slapindex.c<br>
-@@ -34,6 +34,8 @@<br>
- int<br>
- slapindex( int argc, char **argv )<br>
- {<br>
-+=C2=A0 =C2=A0 if (geteuid() =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf( stderr, &quot;\nWARNING!\nRunnig as =
root!\nThere&#39;s a fair chance slapd will fail to start.\nCheck file perm=
issions!\n\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ID id;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc =3D EXIT_SUCCESS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *progname =3D &quot;slapindex&quot;;=
<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/install-strip.patch b=
/recipes-support/openldap/openldap-2.4.39/install-strip.patch<br>
deleted file mode 100644<br>
index 2992b70..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/install-strip.patch<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-# This patch ensures that the install operations which strip<br>
-# programs and libraries (LTINSTALL) work in a cross build<br>
-# environment.<br>
---- openldap-2.2.24/.pc/install-strip.patch/build/<a href=3D"http://top.mk=
" rel=3D"noreferrer" target=3D"_blank">top.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A02005-01-20 09:00:55.000000000 -0800<br>
-+++ openldap-2.2.24/build/<a href=3D"http://top.mk" rel=3D"noreferrer" tar=
get=3D"_blank">top.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02005-04-16 13:48:20.536=
710376 -0700<br>
-@@ -116,7 +116,7 @@<br>
- LTLINK_MOD =3D $(LIBTOOL) $(LTONLY_MOD) --mode=3Dlink \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)<br=
>
-<br>
--LTINSTALL =3D $(LIBTOOL) --mode=3Dinstall $(INSTALL)<br>
-+LTINSTALL =3D STRIPPROG=3D&quot;&quot; $(LIBTOOL) --mode=3Dinstall $(top_=
srcdir)/contrib/ldapc++/install-sh -c<br>
- LTFINISH =3D $(LIBTOOL) --mode=3Dfinish<br>
-<br>
- # Misc UNIX commands used in build environment<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertd=
ir.patch b/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir=
.patch<br>
deleted file mode 100644<br>
index e8aab91..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patc=
h<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
---- a/doc/man/man5/ldap.conf.5<br>
-+++ b/doc/man/man5/ldap.conf.5<br>
-@@ -317,7 +317,7 @@ certificates in separate individual file<br>
- .B TLS_CACERT<br>
- is always used before<br>
- .B TLS_CACERTDIR.<br>
--This parameter is ignored with GnuTLS.<br>
-+This parameter is ignored with GnuTLS. On Debian openldap is linked again=
st GnuTLS.<br>
-<br>
- When using Mozilla NSS, &lt;path&gt; may contain a Mozilla NSS cert/key<b=
r>
- database.=C2=A0 If &lt;path&gt; contains a Mozilla NSS cert/key database =
and<br>
-@@ -428,7 +428,7 @@ This parameter is ignored with GnuTLS.<br>
- Specifies the file to obtain random bits from when /dev/[u]random is<br>
- not available. Generally set to the name of the EGD/PRNGD socket.<br>
- The environment variable RANDFILE can also be used to specify the filenam=
e.<br>
--This parameter is ignored with GnuTLS and Mozilla NSS.<br>
-+This parameter is ignored with GnuTLS and Mozilla NSS. On Debian openldap=
 is linked against GnuTLS.<br>
- .TP<br>
- .B TLS_REQCERT &lt;level&gt;<br>
- Specifies what checks to perform on server certificates in a TLS session,=
<br>
-@@ -461,7 +461,7 @@ Specifies if the Certificate Revocation<br>
- used to verify if the server certificates have not been revoked. This<br>
- requires<br>
- .B TLS_CACERTDIR<br>
--parameter to be set. This parameter is ignored with GnuTLS and Mozilla NS=
S.<br>
-+parameter to be set. This parameter is ignored with GnuTLS and Mozilla NS=
S. On Debian openldap is linked against GnuTLS.<br>
- .B &lt;level&gt;<br>
- can be specified as one of the following keywords:<br>
- .RS<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.pa=
tch b/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch<br>
deleted file mode 100644<br>
index a482bbf..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-Move the ldapi socket to /var/run/slapd from /var/run, since /var/run<br>
-is only writable by root and slapd runs as openldap.<br>
-<br>
-Debian-specific.<br>
-<br>
---- a/include/ldap_defaults.h<br>
-+++ b/include/ldap_defaults.h<br>
-@@ -39,7 +39,7 @@<br>
- #define LDAP_ENV_PREFIX &quot;LDAP&quot;<br>
-<br>
- /* default ldapi:// socket */<br>
--#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP &quot;run&quot; LDAP_DIRSEP &q=
uot;ldapi&quot;<br>
-+#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP &quot;run&quot; LDAP_DIRSEP &q=
uot;slapd&quot; LDAP_DIRSEP &quot;ldapi&quot;<br>
-<br>
- /*<br>
-=C2=A0 * SLAPD DEFINITIONS<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versio=
ns.patch b/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions=
.patch<br>
deleted file mode 100644<br>
index fb28f49..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patc=
h<br>
+++ /dev/null<br>
@@ -1,161 +0,0 @@<br>
-Add symbol versioning to the public LDAP libraries.=C2=A0 This is required=
 for<br>
-library transitions, such as the current transition from 2.1 to 2.4,<br>
-since programs will sometimes have both libraries loaded by different<br>
-dependency chains during the transition.<br>
-<br>
-Not yet contributed upstream.<br>
-<br>
-Upstream ITS #5365 filed requesting symbol versioning for libldap and<br>
-libber.<br>
-<br>
---- a/libraries/libldap_r/Makefile.in<br>
-+++ b/libraries/libldap_r/Makefile.in<br>
-@@ -61,6 +61,9 @@ XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)<br>
- XXXLIBS =3D $(LTHREAD_LIBS)<br>
- NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)<br>
- UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHRE=
AD_LIBS)<br>
-+ifneq (,$(VERSION_OPTION))<br>
-+=C2=A0 VERSION_FLAGS =3D &quot;$(VERSION_OPTION)$(XXDIR)/libldap.map&quot=
;<br>
-+endif<br>
-<br>
- .links : Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@for i in $(XXSRCS); do \<br>
---- a/build/<a href=3D"http://top.mk" rel=3D"noreferrer" target=3D"_blank"=
>top.mk</a><br>
-+++ b/build/<a href=3D"http://top.mk" rel=3D"noreferrer" target=3D"_blank"=
>top.mk</a><br>
-@@ -104,6 +104,9 @@ LTFLAGS_MOD =3D $(@PLAT@_LTFLAGS_MOD)<br>
- # LINK_LIBS referenced in library and module link commands.<br>
- LINK_LIBS =3D $(MOD_LIBS) $(@PLAT@_LINK_LIBS)<br>
-<br>
-+# option to pass to $(CC) to support library symbol versioning, if any<br=
>
-+VERSION_OPTION =3D @VERSION_OPTION@<br>
-+<br>
- LTSTATIC =3D @LTSTATIC@<br>
-<br>
- LTLINK=C2=A0 =C2=A0=3D $(LIBTOOL) --mode=3Dlink \<br>
-@@ -113,7 +116,7 @@ LTCOMPILE_LIB =3D $(LIBTOOL) $(LTONLY_LIB)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(LIB_DEFS) -=
c<br>
-<br>
- LTLINK_LIB =3D $(LIBTOOL) $(LTONLY_LIB) --mode=3Dlink \<br>
--=C2=A0 =C2=A0 =C2=A0 $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB) $(VERSI=
ON_FLAGS)<br>
-<br>
- LTCOMPILE_MOD =3D $(LIBTOOL) $(LTONLY_MOD) --mode=3Dcompile \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(MOD_DEFS) -=
c<br>
---- a/build/openldap.m4<br>
-+++ b/build/openldap.m4<br>
-@@ -1136,3 +1136,54 @@ AC_DEFUN([OL_SSL_COMPAT],<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0], [ol_cv_ssl_crl_compat=3Dyes], [ol_cv_ssl_crl=
_compat=3Dno])])<br>
- ])<br>
-+<br>
-+dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-+dnl check for symbol versioning support<br>
-+AC_DEFUN([OL_SYMBOL_VERSIONING],<br>
-+[AC_CACHE_CHECK([for .symver assembler directive],<br>
-+=C2=A0 =C2=A0 =C2=A0 [ol_cv_asm_symver_directive],[<br>
-+cat &gt; conftest.s &lt;&lt;EOF<br>
-+${libc_cv_dot_text}<br>
-+_sym:<br>
-+.symver _sym,sym@VERS<br>
-+EOF<br>
-+if ${CC-cc} -c $ASFLAGS conftest.s 1&gt;&amp;AS_MESSAGE_LOG_FD 2&gt;&amp;=
AS_MESSAGE_LOG_FD; then<br>
-+=C2=A0 ol_cv_asm_symver_directive=3Dyes<br>
-+else<br>
-+=C2=A0 ol_cv_asm_symver_directive=3Dno<br>
-+fi<br>
-+rm -f conftest*])<br>
-+AC_CACHE_CHECK([for ld --version-script],<br>
-+=C2=A0 =C2=A0 =C2=A0 [ol_cv_ld_version_script_option],[<br>
-+if test $ol_cv_asm_symver_directive =3D yes; then<br>
-+=C2=A0 cat &gt; conftest.s &lt;&lt;EOF<br>
-+${libc_cv_dot_text}<br>
-+_sym:<br>
-+.symver _sym,sym@VERS<br>
-+EOF<br>
-+=C2=A0 cat &gt; conftest.map &lt;&lt;EOF<br>
-+VERS_1 {<br>
-+=C2=A0 =C2=A0 =C2=A0 global: sym;<br>
-+};<br>
-+<br>
-+VERS_2 {<br>
-+=C2=A0 =C2=A0 =C2=A0 global: sym;<br>
-+} VERS_1;<br>
-+EOF<br>
-+=C2=A0 if ${CC-cc} -c $ASFLAGS conftest.s 1&gt;&amp;AS_MESSAGE_LOG_FD 2&g=
t;&amp;AS_MESSAGE_LOG_FD; then<br>
-+=C2=A0 =C2=A0 if AC_TRY_COMMAND([${CC-cc} $CFLAGS $LDFLAGS -shared<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-o conftest.so conftest.o<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,--version-script,conftest.map<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01&gt;&amp;AS_MESSAGE_LOG_FD]);<br>
-+=C2=A0 =C2=A0 then<br>
-+=C2=A0 =C2=A0 =C2=A0 ol_cv_ld_version_script_option=3Dyes<br>
-+=C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 ol_cv_ld_version_script_option=3Dno<br>
-+=C2=A0 =C2=A0 fi<br>
-+=C2=A0 else<br>
-+=C2=A0 =C2=A0 ol_cv_ld_version_script_option=3Dno<br>
-+=C2=A0 fi<br>
-+else<br>
-+=C2=A0 ol_cv_ld_version_script_option=3Dno<br>
-+fi<br>
-+rm -f conftest*])])<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -1909,6 +1909,13 @@ else<br>
- fi<br>
- AC_SUBST(LTSTATIC)dnl<br>
-<br>
-+VERSION_OPTION=3D&quot;&quot;<br>
-+OL_SYMBOL_VERSIONING<br>
-+if test $ol_cv_ld_version_script_option =3D yes ; then<br>
-+=C2=A0 VERSION_OPTION=3D&quot;-Wl,--version-script=3D&quot;<br>
-+fi<br>
-+AC_SUBST(VERSION_OPTION)<br>
-+<br>
- dnl ----------------------------------------------------------------<br>
- if test $ol_enable_wrappers !=3D no ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_HEADERS(tcpd.h,[<br>
---- /dev/null<br>
-+++ b/libraries/libldap/libldap.map<br>
-@@ -0,0 +1,7 @@<br>
-+OPENLDAP_2.4_2 {<br>
-+=C2=A0 global:<br>
-+=C2=A0 =C2=A0 ldap_*;<br>
-+=C2=A0 =C2=A0 ldif_*;<br>
-+=C2=A0 local:<br>
-+=C2=A0 =C2=A0 *;<br>
-+};<br>
---- a/libraries/libldap/Makefile.in<br>
-+++ b/libraries/libldap/Makefile.in<br>
-@@ -52,6 +52,9 @@ XLIBS =3D $(LIBRARY) $(LDAP_LIBLBER_LA) $(<br>
- XXLIBS =3D $(SECURITY_LIBS) $(LUTIL_LIBS)<br>
- NT_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)<br>
- UNIX_LINK_LIBS =3D $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)<br>
-+ifneq (,$(VERSION_OPTION))<br>
-+=C2=A0 VERSION_FLAGS =3D $(VERSION_OPTION)$(srcdir)/libldap.map<br>
-+endif<br>
-<br>
- apitest:=C2=A0 =C2=A0 =C2=A0 $(XLIBS) apitest.o<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LTLINK) -o $@ apitest.o $(LIBS)<br>
---- a/libraries/liblber/Makefile.in<br>
-+++ b/libraries/liblber/Makefile.in<br>
-@@ -38,6 +38,9 @@ XLIBS =3D $(LIBRARY) $(LDAP_LIBLUTIL_A)<br>
- XXLIBS =3D<br>
- NT_LINK_LIBS =3D $(AC_LIBS)<br>
- UNIX_LINK_LIBS =3D $(AC_LIBS)<br>
-+ifneq (,$(VERSION_OPTION))<br>
-+=C2=A0 VERSION_FLAGS =3D &quot;$(VERSION_OPTION)$(srcdir)/liblber.map&quo=
t;<br>
-+endif<br>
-<br>
- dtest:=C2=A0 =C2=A0 $(XLIBS) dtest.o<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LTLINK) -o $@ dtest.o $(LIBS)<br>
---- /dev/null<br>
-+++ b/libraries/liblber/liblber.map<br>
-@@ -0,0 +1,8 @@<br>
-+OPENLDAP_2.4_2 {<br>
-+=C2=A0 global:<br>
-+=C2=A0 =C2=A0 ber_*;<br>
-+=C2=A0 =C2=A0 der_alloc;<br>
-+=C2=A0 =C2=A0 lutil_*;<br>
-+=C2=A0 local:<br>
-+=C2=A0 =C2=A0 *;<br>
-+};<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/man-slapd.patch b/rec=
ipes-support/openldap/openldap-2.4.39/man-slapd.patch<br>
deleted file mode 100644<br>
index 5f55137..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/man-slapd.patch<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-Patch the slapd man page to not refer to a header file that isn&#39;t<br>
-installed with the slapd package and to reference the correct path<br>
-for slapd.<br>
-<br>
-Debian-specific.<br>
-<br>
---- a/doc/man/man8/slapd.8<br>
-+++ b/doc/man/man8/slapd.8<br>
-@@ -5,7 +5,7 @@<br>
- .SH NAME<br>
- slapd \- Stand-alone LDAP Daemon<br>
- .SH SYNOPSIS<br>
--.B LIBEXECDIR/slapd<br>
-+.B /usr/sbin/slapd<br>
- [\c<br>
- .BR \-4 | \-6 ]<br>
- [\c<br>
-@@ -103,11 +103,10 @@<br>
- will not fork or disassociate from the invoking terminal.=C2=A0 Some gene=
ral<br>
- operation and status messages are printed for any value of \fIdebug-level=
\fP.<br>
- \fIdebug-level\fP is taken as a bit string, with each bit corresponding t=
o a<br>
--different kind of debugging information.=C2=A0 See &lt;ldap_log.h&gt; for=
 details.<br>
--Comma-separated arrays of friendly names can be specified to select<br>
--debugging output of the corresponding debugging information.<br>
--All the names recognized by the \fIloglevel\fP directive<br>
--described in \fBslapd.conf\fP(5) are supported.<br>
-+different kind of debugging information.=C2=A0 Comma-separated arrays of =
friendly<br>
-+names can be specified to select debugging output of the corresponding<br=
>
-+debugging information.=C2=A0 All the names recognized by the \fIloglevel\=
fP<br>
-+directive described in \fBslapd.conf\fP(5) are supported.<br>
- If \fIdebug-level\fP is \fB?\fP, a list of installed debug-levels is prin=
ted,<br>
- and slapd exits.<br>
-<br>
-@@ -317,7 +316,7 @@<br>
- .LP<br>
- .nf<br>
- .ft tt<br>
--=C2=A0 =C2=A0 =C2=A0 LIBEXECDIR/slapd<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/sbin/slapd<br>
- .ft<br>
- .fi<br>
- .LP<br>
-@@ -328,7 +327,7 @@<br>
- .LP<br>
- .nf<br>
- .ft tt<br>
--=C2=A0 =C2=A0 =C2=A0 LIBEXECDIR/slapd \-f /var/tmp/slapd.conf \-d 255<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/sbin/slapd \-f /var/tmp/slapd.conf \-d 255<br>
- .ft<br>
- .fi<br>
- .LP<br>
-@@ -336,7 +335,7 @@<br>
- .LP<br>
- .nf<br>
- .ft tt<br>
--=C2=A0 =C2=A0 =C2=A0 LIBEXECDIR/slapd \-Tt<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/sbin/slapd \-Tt<br>
- .ft<br>
- .fi<br>
- .LP<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.p=
atch b/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch<b=
r>
deleted file mode 100644<br>
index 8e7812d..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch<br=
>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-Description: don&#39;t use AM_INIT_AUTOMAKE macro when we aren&#39;t using=
 automake<br>
- Calling AM_INIT_AUTOMAKE() in <a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a> serves no purpose if we&#39;re n=
ot<br>
- using automake, and it confuses autoreconf.=C2=A0 Use AC_INIT() instead.<=
br>
-Author: Steve Langasek &lt;<a href=3D"mailto:vorlon@debian.org">vorlon@deb=
ian.org</a>&gt;<br>
-<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -26,7 +26,8 @@ dnl Configure.in for OpenLDAP<br>
- AC_COPYRIGHT([[Copyright 1998-2014 The OpenLDAP Foundation. All rights re=
served.<br>
- Restrictions apply, see COPYRIGHT and LICENSE files.]])<br>
- AC_REVISION([$Id: 81bd528fb5194c83d688db355737b7715448b958 $])<br>
--AC_INIT([OpenLDAP],,[<a href=3D"http://www.openldap.org/its/" rel=3D"nore=
ferrer" target=3D"_blank">http://www.openldap.org/its/</a>])<br>
-+AC_INIT([OpenLDAP],[$OL_VERSION],[<a href=3D"http://www.openldap.org/its/=
" rel=3D"noreferrer" target=3D"_blank">http://www.openldap.org/its/</a>])<b=
r>
-+AC_PROG_MAKE_SET<br>
- m4_define([AC_PACKAGE_BUGREPORT],[&lt;<a href=3D"http://www.openldap.org/=
its/" rel=3D"noreferrer" target=3D"_blank">http://www.openldap.org/its/</a>=
&gt;])<br>
- AC_CONFIG_SRCDIR(build/version.sh)dnl<br>
- dnl ----------------------------------------------------------------<br>
-@@ -69,7 +70,6 @@ dnl Determine host platform<br>
- dnl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0we try not to use this for mu=
ch<br>
- AC_CANONICAL_TARGET([])<br>
-<br>
--AM_INIT_AUTOMAKE([$OL_PACKAGE],[$OL_VERSION], [no defines])dnl<br>
- AC_SUBST(PACKAGE)dnl<br>
- AC_SUBST(VERSION)dnl<br>
- AC_DEFINE_UNQUOTED(OPENLDAP_PACKAGE,&quot;$PACKAGE&quot;,Package)<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-gue=
ssing.patch b/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-gu=
essing.patch<br>
deleted file mode 100644<br>
index db76aa7..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.p=
atch<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-Author: Steve Langasek &lt;<a href=3D"mailto:vorlon@debian.org">vorlon@deb=
ian.org</a>&gt;<br>
-Description: don&#39;t second-guess BDB ABI<br>
- OpenLDAP upstream conservatively assumes that any change to the version<b=
r>
- number of libdb can result in an API-breaking change that could impact<br=
>
- the database.=C2=A0 In Debian, we know that such changes require bumping =
the<br>
- library soname and changing the package name, and demand such rigor from<=
br>
- our package maintainers even when upstreams don&#39;t deliver; so any suc=
h<br>
- check in the source code works against the packaging system by forcing<br=
>
- database upgrades when we know none are required.=C2=A0 Disable this chec=
k<br>
- so we rely on the packaging system to do its job.<br>
-Bug-Debian: <a href=3D"http://bugs.debian.org/651333" rel=3D"noreferrer" t=
arget=3D"_blank">http://bugs.debian.org/651333</a><br>
-Forwarded: not-needed<br>
-<br>
---- a/servers/slapd/back-bdb/init.c<br>
-+++ b/servers/slapd/back-bdb/init.c<br>
-@@ -762,7 +762,7 @@ bdb_back_initialize(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bi-&gt;bi_controls =3D controls;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0/* version check */=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int major, minor, patch,=
 ver;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int major, minor, patch;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *version =3D d=
b_version( &amp;major, &amp;minor, &amp;patch );<br>
- #ifdef HAVE_EBCDIC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char v2[1024];<br>
-@@ -776,17 +776,6 @@ bdb_back_initialize(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D v2;<br>
- #endif<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ver =3D (major &lt;&lt; =
24) | (minor &lt;&lt; 16) | patch;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if( ver !=3D DB_VERSION_=
FULL ) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* fail if a versions don&#39;t match */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Debug( LDAP_DEBUG_ANY,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LDAP_XSTRING(bdb_back_initialize) &quot;: &=
quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;BDB library version mismatch:&quot;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; expected &quot; DB_VERSION_STRING &q=
uot;,&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; got %s\n&quot;, version, 0, 0 );<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -1;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Debug( LDAP_DEBUG_T=
RACE, LDAP_XSTRING(bdb_back_initialize)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;: %s\n&quot;, version, 0, 0 );<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/sasl-default-path.pat=
ch b/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch<br>
deleted file mode 100644<br>
index 5ea240f..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch<br>
+++ /dev/null<br>
@@ -1,55 +0,0 @@<br>
-Add /etc/ldap/sasl2 to the SASL configuration search path.<br>
-<br>
-Not submitted upstream.=C2=A0 Somewhat Debian-specific and probably not of=
<br>
-interest upstream.<br>
-<br>
---- a/include/ldap_defaults.h<br>
-+++ b/include/ldap_defaults.h<br>
-@@ -63,4 +63,6 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dn of the default &quot;monitor&quot; subent=
ry */<br>
- #define SLAPD_MONITOR_DN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;cn=3DMonitor&quot;<br>
-<br>
-+#define SASL_CONFIGPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LDAP_SYSCONFDIR LDAP_DIRSEP &quot;sasl2&=
quot;<br>
-+<br>
- #endif /* _LDAP_CONFIG_H */<br>
---- a/servers/slapd/sasl.c<br>
-+++ b/servers/slapd/sasl.c<br>
-@@ -1103,12 +1103,38 @@ static const rewrite_mapper slapd_mapper<br>
- };<br>
- #endif<br>
-<br>
-+static int<br>
-+slap_sasl_getconfpath( void * context, char ** path )<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 char * sasl_default_configpath;<br>
-+=C2=A0 =C2=A0 =C2=A0 size_t len;<br>
-+<br>
-+#if SASL_VERSION_MAJOR &gt;=3D 2<br>
-+=C2=A0 =C2=A0 =C2=A0 sasl_default_configpath =3D &quot;/usr/lib/sasl2&quo=
t;;<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 sasl_default_configpath =3D &quot;/usr/lib/sasl&quot=
;;<br>
-+#endif<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 len =3D strlen(SASL_CONFIGPATH) + 1 /* colon */ +<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlen(sasl_default_conf=
igpath) + 1 /* \0 */;<br>
-+=C2=A0 =C2=A0 =C2=A0 *path =3D malloc( len );<br>
-+=C2=A0 =C2=A0 =C2=A0 if ( *path =3D=3D NULL )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SASL_FAIL;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (snprintf( *path, len, &quot;%s:%s&quot;, SASL_CO=
NFIGPATH,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sasl_default_configpath ) !=3D len-1 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SASL_FAIL;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return SASL_OK;<br>
-+}<br>
-+<br>
- int slap_sasl_init( void )<br>
- {<br>
- #ifdef HAVE_CYRUS_SASL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static sasl_callback_t server_callbacks[] =3D {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ SASL_CB_LOG, &amp=
;slap_sasl_log, NULL },<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { SASL_CB_GETCONFPATH, &=
amp;slap_sasl_getconfpath, NULL },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ SASL_CB_GETOPT, &=
amp;slap_sasl_getopt, NULL },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ SASL_CB_LIST_END,=
 NULL, NULL }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/series b/recipes-supp=
ort/openldap/openldap-2.4.39/series<br>
deleted file mode 100644<br>
index 2f47de3..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/series<br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-man-slapd<br>
-evolution-ntlm<br>
-slapi-errorlog-file<br>
-ldapi-socket-place<br>
-wrong-database-location<br>
-index-files-created-as-root<br>
-sasl-default-path<br>
-libldap-symbol-versions<br>
-getaddrinfo-is-threadsafe<br>
-do-not-second-guess-sonames<br>
-contrib-modules-use-dpkg-buildflags<br>
-smbk5pwd-makefile<br>
-autogroup-makefile<br>
-ldap-conf-tls-cacertdir<br>
-add-tlscacert-option-to-ldap-conf<br>
-fix-ftbfs-binutils-gold<br>
-fix-build-top-mk<br>
-no-AM_INIT_AUTOMAKE<br>
-switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff<br>
-no-bdb-ABI-second-guessing<br>
-heimdal-fix<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.p=
atch b/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch<b=
r>
deleted file mode 100644<br>
index 4899451..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch<br=
>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-The slapi error log file defaults to /var/errors given our setting<br>
-of --localstatedir.=C2=A0 Move it to /var/log/slapi-errors instead.<br>
-<br>
-Debian-specific.<br>
-<br>
---- a/servers/slapd/slapi/slapi_overlay.c<br>
-+++ b/servers/slapd/slapi/slapi_overlay.c<br>
-@@ -930,7 +930,7 @@ int slapi_over_config( BackendDB *be, Co<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldap_pvt_thread_mut=
ex_init( &amp;slapi_printmessage_mutex );<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( slapi_log_file=
 =3D=3D NULL )<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 slapi_log_file =3D slapi_ch_strdup( LDAP_RUNDIR LDAP_DIRSEP &quot;error=
s&quot; );<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 slapi_log_file =3D slapi_ch_strdup( LDAP_RUNDIR LDAP_DIRSEP &quot;log&q=
uot; LDAP_DIRSEP &quot;slapi-errors&quot; );<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D slapi_int_in=
it_object_extensions();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( rc !=3D 0 )<br=
>
diff --git a/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.pat=
ch b/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch<br>
deleted file mode 100644<br>
index 17d1b56..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch<br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
---- a/contrib/slapd-modules/smbk5pwd/Makefile<br>
-+++ b/contrib/slapd-modules/smbk5pwd/Makefile<br>
-@@ -14,17 +14,17 @@<br>
-<br>
- LDAP_SRC =3D ../../..<br>
- LDAP_BUILD =3D ../../..<br>
--LDAP_INC =3D -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC)/=
servers/slapd<br>
--LDAP_LIB =3D $(LDAP_BUILD)/libraries/libldap_r/<a href=3D"http://libldap_=
r.la" rel=3D"noreferrer" target=3D"_blank">libldap_r.la</a> \<br>
--=C2=A0 =C2=A0 =C2=A0 $(LDAP_BUILD)/libraries/liblber/<a href=3D"http://li=
blber.la" rel=3D"noreferrer" target=3D"_blank">liblber.la</a><br>
-+LDAP_INC =3D -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/debian/=
build/servers/slapd -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_=
SRC)/servers/slapd<br>
-+LDAP_LIB =3D $(LDAP_BUILD)/debian/build/libraries/libldap_r/<a href=3D"ht=
tp://libldap_r.la" rel=3D"noreferrer" target=3D"_blank">libldap_r.la</a> \<=
br>
-+=C2=A0 =C2=A0 =C2=A0 $(LDAP_BUILD)/debian/build/libraries/liblber/<a href=
=3D"http://liblber.la" rel=3D"noreferrer" target=3D"_blank">liblber.la</a><=
br>
-<br>
- SSL_INC =3D<br>
--SSL_LIB =3D -lcrypto<br>
-+SSL_LIB =3D -lgcrypt<br>
-<br>
--HEIMDAL_INC =3D -I/usr/heimdal/include<br>
--HEIMDAL_LIB =3D -L/usr/heimdal/lib -lkrb5 -lkadm5srv<br>
-+HEIMDAL_INC =3D -I/usr/include<br>
-+HEIMDAL_LIB =3D -lkrb5 -lkadm5srv<br>
-<br>
--LIBTOOL =3D $(LDAP_BUILD)/libtool<br>
-+LIBTOOL =3D $(LDAP_BUILD)/debian/build/libtool<br>
- CC =3D gcc<br>
- OPT =3D -g -O2 -Wall<br>
- # Omit DO_KRB5, DO_SAMBA or DO_SHADOW if you don&#39;t want to support it=
.<br>
-@@ -35,13 +35,13 @@ LIBS =3D $(LDAP_LIB) $(HEIMDAL_LIB) $(SSL_<br>
- PROGRAMS =3D <a href=3D"http://smbk5pwd.la" rel=3D"noreferrer" target=3D"=
_blank">smbk5pwd.la</a><br>
- LTVER =3D 0:0:0<br>
-<br>
--prefix=3D/usr/local<br>
-+prefix=3D/usr<br>
- exec_prefix=3D$(prefix)<br>
--ldap_subdir=3D/openldap<br>
-+ldap_subdir=3D/ldap<br>
-<br>
- libdir=3D$(exec_prefix)/lib<br>
- libexecdir=3D$(exec_prefix)/libexec<br>
--moduledir =3D $(libexecdir)$(ldap_subdir)<br>
-+moduledir =3D $(libdir)$(ldap_subdir)<br>
-<br>
- .SUFFIXES: .c .o .lo<br>
-<br>
-@@ -55,7 +55,7 @@ <a href=3D"http://smbk5pwd.la" rel=3D"noreferrer" target=
=3D"_blank">smbk5pwd.la</a>: smbk5pwd.lo<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-rpath $(moduledir) -module -o $@ $? $(LIBS)<br=
>
-<br>
- clean:<br>
--=C2=A0 =C2=A0 =C2=A0 rm -rf *.o *.lo *.la .libs<br>
-+=C2=A0 =C2=A0 =C2=A0 $(LIBTOOL) --mode=3Dclean rm -f<br>
-<br>
- install: $(PROGRAMS)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(DESTDIR)$(moduledir)<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenad=
vise-to-get-RTLD_GLOBAL-set.diff.patch b/recipes-support/openldap/openldap-=
2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch<br>
deleted file mode 100644<br>
index df2801f..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to=
-get-RTLD_GLOBAL-set.diff.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From: Jan-Marek Glogowski &lt;<a href=3D"mailto:jan-marek.glogowski@muench=
en.de">jan-marek.glogowski@muenchen.de</a>&gt;<br>
-Date: Tue, 18 May 2010 17:47:05 +0200<br>
-Subject: Switch to lt_dlopenadvise() so back_perl can be opened with RTLD_=
GLOBAL.<br>
- Open all modules with RTLD_GLOBAL, needed so that back_perl can load<br>
- non-trivial Perl extensions that require symbols from back_perl.so itself=
.<br>
-Bug-Debian: <a href=3D"http://bugs.debian.org/327585" rel=3D"noreferrer" t=
arget=3D"_blank">http://bugs.debian.org/327585</a><br>
-<br>
----<br>
---- a/servers/slapd/module.c<br>
-+++ b/servers/slapd/module.c<br>
-@@ -117,6 +117,20 @@ int module_unload( const char *file_name<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;=C2=A0 =C2=A0 =C2=A0 /* not found */<=
br>
- }<br>
-<br>
-+static lt_dlhandle slapd_lt_dlopenext_global( const char *filename )<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 lt_dlhandle handle =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 lt_dladvise advise;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!lt_dladvise_init (&amp;advise) &amp;&amp; !lt_d=
ladvise_ext (&amp;advise)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;&amp; !lt_dladvise_global (&amp;advise))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handle =3D lt_dlopenadvi=
se (filename, advise);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 lt_dladvise_destroy (&amp;advise);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return handle;<br>
-+}<br>
-+<br>
- int module_load(const char* file_name, int argc, char *argv[])<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0module_loaded_t *module;<br>
-@@ -180,7 +194,7 @@ int module_load(const char* file_name, i<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to calling Debug. This is because Debug is a=
 macro that expands<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * into multiple function calls.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 if ((module-&gt;lib =3D lt_dlopenext(file)) =3D=3D N=
ULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((module-&gt;lib =3D slapd_lt_dlopenext_global(fi=
le)) =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D lt_dlerro=
r();<br>
- #ifdef HAVE_EBCDIC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy( ebuf, error=
 );<br>
diff --git a/recipes-support/openldap/openldap-2.4.39/wrong-database-locati=
on.patch b/recipes-support/openldap/openldap-2.4.39/wrong-database-location=
.patch<br>
deleted file mode 100644<br>
index 25d96cb..0000000<br>
--- a/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patc=
h<br>
+++ /dev/null<br>
@@ -1,74 +0,0 @@<br>
-Move the default slapd database location to /var/lib/ldap instead of<br>
-/var/openldap-data.<br>
-<br>
-Debian-specific.<br>
-<br>
---- a/doc/man/man5/slapd-bdb.5<br>
-+++ b/doc/man/man5/slapd-bdb.5<br>
-@@ -131,7 +131,7 @@ Specify the directory where the BDB file<br>
- associated indexes live.<br>
- A separate directory must be specified for each database.<br>
- The default is<br>
--.BR LOCALSTATEDIR/openldap\-data .<br>
-+.BR LOCALSTATEDIR/lib/ldap .<br>
- .TP<br>
- .B dirtyread<br>
- Allow reads of modified but not yet committed data.<br>
---- a/doc/man/man5/slapd.conf.5<br>
-+++ b/doc/man/man5/slapd.conf.5<br>
-@@ -2007,7 +2007,7 @@ suffix=C2=A0 =C2=A0 &quot;dc=3Dour\-domain,dc=3Dcom&=
quot;<br>
- # The database directory MUST exist prior to<br>
- # running slapd AND should only be accessible<br>
- # by the slapd/tools. Mode 0700 recommended.<br>
--directory LOCALSTATEDIR/openldap\-data<br>
-+directory LOCALSTATEDIR/lib/ldap<br>
- # Indices to maintain<br>
- index=C2=A0 =C2=A0 =C2=A0objectClass=C2=A0 eq<br>
- index=C2=A0 =C2=A0 =C2=A0cn,sn,mail=C2=A0 =C2=A0pres,eq,approx,sub<br>
---- a/include/ldap_defaults.h<br>
-+++ b/include/ldap_defaults.h<br>
-@@ -47,7 +47,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* location of the default slapd config file */=
<br>
- #define SLAPD_DEFAULT_CONFIGFILE=C2=A0 =C2=A0 =C2=A0 LDAP_SYSCONFDIR LDAP=
_DIRSEP &quot;slapd.conf&quot;<br>
- #define SLAPD_DEFAULT_CONFIGDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0LDAP_SYSCONFDIR LDAP_DIRSEP &quot;slapd.d&quot;<br>
--#define SLAPD_DEFAULT_DB_DIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LDAP_RUNDI=
R LDAP_DIRSEP &quot;openldap-data&quot;<br>
-+#define SLAPD_DEFAULT_DB_DIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LDAP_RUNDI=
R LDAP_DIRSEP &quot;lib&quot; LDAP_DIRSEP &quot;ldap&quot;<br>
- #define SLAPD_DEFAULT_DB_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00600<br>
- #define SLAPD_DEFAULT_UCDATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LDAP_DATAD=
IR LDAP_DIRSEP &quot;ucdata&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* default max deref depth for aliases */<br>
---- a/servers/slapd/Makefile.in<br>
-+++ b/servers/slapd/Makefile.in<br>
-@@ -445,9 +445,9 @@ install-conf: FORCE<br>
-<br>
- install-db-config: FORCE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@-$(MKDIR) $(DESTDIR)$(localstatedir) $(DESTDIR=
)$(sysconfdir)<br>
--=C2=A0 =C2=A0 =C2=A0 @-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/op=
enldap-data<br>
-+=C2=A0 =C2=A0 =C2=A0 @-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/li=
b/ldap<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_=
CONFIG \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)$(localstatedi=
r)/openldap-data/DB_CONFIG.example<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)$(localstatedi=
r)/lib/ldap/DB_CONFIG.example<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_=
CONFIG \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)$(sysconf=
dir)/DB_CONFIG.example<br>
-<br>
---- a/doc/man/man5/slapd-config.5<br>
-+++ b/doc/man/man5/slapd-config.5<br>
-@@ -2051,7 +2051,7 @@ olcSuffix: &quot;dc=3Dour\-domain,dc=3Dcom&quot;<br>
- # The database directory MUST exist prior to<br>
- # running slapd AND should only be accessible<br>
- # by the slapd/tools. Mode 0700 recommended.<br>
--olcDbDirectory: LOCALSTATEDIR/openldap\-data<br>
-+olcDbDirectory: LOCALSTATEDIR/lib/ldap<br>
- # Indices to maintain<br>
- olcDbIndex:=C2=A0 =C2=A0 =C2=A0objectClass=C2=A0 eq<br>
- olcDbIndex:=C2=A0 =C2=A0 =C2=A0cn,sn,mail=C2=A0 =C2=A0pres,eq,approx,sub<=
br>
---- a/doc/man/man5/slapd-mdb.5<br>
-+++ b/doc/man/man5/slapd-mdb.5<br>
-@@ -52,7 +52,7 @@ Specify the directory where the LMDB fil<br>
- associated indexes live.<br>
- A separate directory must be specified for each database.<br>
- The default is<br>
--.BR LOCALSTATEDIR/openldap\-data .<br>
-+.BR LOCALSTATEDIR/lib/ldap .<br>
- .TP<br>
- \fBenvflags \fR{\fBnosync\fR,\fBnometasync\fR,\fBwritemap\fR,\fBmapasync\=
fR,\fBnordahead\fR}<br>
- Specify flags for finer-grained control of the LMDB library&#39;s operati=
on.<br>
diff --git a/recipes-support/openldap/<a href=3D"http://openldap_2.4.39.bb"=
 rel=3D"noreferrer" target=3D"_blank">openldap_2.4.39.bb</a> b/recipes-supp=
ort/openldap/<a href=3D"http://openldap_2.4.39.bb" rel=3D"noreferrer" targe=
t=3D"_blank">openldap_2.4.39.bb</a><br>
deleted file mode 100644<br>
index 3048c8e..0000000<br>
--- a/recipes-support/openldap/<a href=3D"http://openldap_2.4.39.bb" rel=3D=
"noreferrer" target=3D"_blank">openldap_2.4.39.bb</a><br>
+++ /dev/null<br>
@@ -1,182 +0,0 @@<br>
-# OpenLDAP, a license free (see <a href=3D"http://www.OpenLDAP.org/license=
.html" rel=3D"noreferrer" target=3D"_blank">http://www.OpenLDAP.org/license=
.html</a>)<br>
-#<br>
-DESCRIPTION =3D &quot;OpenLDAP Software is an open source implementation o=
f the Lightweight Directory Access Protocol.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.OpenLDAP.org/license.html" rel=3D=
"noreferrer" target=3D"_blank">http://www.OpenLDAP.org/license.html</a>&quo=
t;<br>
-# The OpenLDAP Public License - see the HOMEPAGE - defines<br>
-# the license.=C2=A0 <a href=3D"http://www.openldap.org" rel=3D"noreferrer=
" target=3D"_blank">www.openldap.org</a> claims this is Open Source<br>
-# (see <a href=3D"http://www.openldap.org" rel=3D"noreferrer" target=3D"_b=
lank">http://www.openldap.org</a>), the license appears to be<br>
-# basically BSD.=C2=A0 <a href=3D"http://opensource.org" rel=3D"noreferrer=
" target=3D"_blank">opensource.org</a> does not record this license<br>
-# at present (so it is apparently not OSI certified).<br>
-LICENSE =3D &quot;OpenLDAP&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Df2bdbaa4f50199a00b6de2ca=
7ec1db05&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-<br>
-# patches taken from Debian<br>
-SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 <a href=3D"ftp://ftp.openldap.org/pub/OpenLDAP/openldap-rele=
ase/${P}.tgz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.openldap.org/p=
ub/OpenLDAP/openldap-release/${P}.tgz</a> \<br>
-=C2=A0 =C2=A0 file://man-slapd.patch \<br>
-=C2=A0 =C2=A0 file://evolution-ntlm.patch \<br>
-=C2=A0 =C2=A0 file://slapi-errorlog-file.patch \<br>
-=C2=A0 =C2=A0 file://ldapi-socket-place.patch \<br>
-=C2=A0 =C2=A0 file://wrong-database-location.patch \<br>
-=C2=A0 =C2=A0 file://index-files-created-as-root.patch \<br>
-=C2=A0 =C2=A0 file://sasl-default-path.patch \<br>
-=C2=A0 =C2=A0 file://libldap-symbol-versions.patch \<br>
-=C2=A0 =C2=A0 file://getaddrinfo-is-threadsafe.patch \<br>
-=C2=A0 =C2=A0 file://do-not-second-guess-sonames.patch \<br>
-=C2=A0 =C2=A0 file://contrib-modules-use-dpkg-buildflags.patch \<br>
-=C2=A0 =C2=A0 file://smbk5pwd-makefile.patch \<br>
-=C2=A0 =C2=A0 file://autogroup-makefile.patch \<br>
-=C2=A0 =C2=A0 file://ldap-conf-tls-cacertdir.patch \<br>
-=C2=A0 =C2=A0 file://add-tlscacert-option-to-ldap-conf.patch \<br>
-=C2=A0 =C2=A0 file://fix-ftbfs-binutils-gold.patch \<br>
-=C2=A0 =C2=A0 file://fix-build-top-mk.patch \<br>
-=C2=A0 =C2=A0 file://no-AM_INIT_AUTOMAKE.patch \<br>
-=C2=A0 =C2=A0 file://switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff=
.patch \<br>
-=C2=A0 =C2=A0 file://no-bdb-ABI-second-guessing.patch \<br>
-=C2=A0 =C2=A0 file://heimdal-fix.patch \<br>
-&quot;<br>
-SRC_URI[md5sum] =3D &quot;b0d5ee4b252c841dec6b332d679cf943&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8267c87347103fef56b783b24877c0feda1063d3cb85d=
070e503d076584bf8a7&quot;<br>
-<br>
-DEPENDS =3D &quot;util-linux groff-native db&quot;<br>
-<br>
-PR =3D &quot;r0&quot;<br>
-# The original <a href=3D"http://top.mk" rel=3D"noreferrer" target=3D"_bla=
nk">top.mk</a> used INSTALL, not INSTALL_STRIP_PROGRAM when<br>
-# installing .so and executables, this fails in cross compilation<br>
-# environments<br>
-SRC_URI +=3D &quot;file://install-strip.patch&quot;<br>
-<br>
-# inherit autotools<br>
-inherit autotools-brokensep<br>
-<br>
-# CV SETTINGS<br>
-# Required to work round AC_FUNC_MEMCMP which gets the wrong answer<br>
-# when cross compiling (should be in site?)<br>
-EXTRA_OECONF +=3D &quot;ac_cv_func_memcmp_working=3Dyes&quot;<br>
-<br>
-# CONFIG DEFINITIONS<br>
-# The following is necessary because it cannot be determined for a<br>
-# cross compile automagically.=C2=A0 Select should yield fine on all OE<br=
>
-# systems...<br>
-EXTRA_OECONF +=3D &quot;--with-yielding-select=3Dyes&quot;<br>
-# Shared libraries are nice...<br>
-EXTRA_OECONF +=3D &quot;--enable-dynamic&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;openssl modules \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldap =
meta monitor null passwd shell proxycache dnssrv \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bdb hdb mdb=
 sasl \<br>
-&quot;<br>
-#--with-tls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with TLS/SSL s=
upport auto|openssl|gnutls [auto]<br>
-PACKAGECONFIG[gnutls] =3D &quot;--with-tls=3Dgnutls,,gnutls&quot;<br>
-PACKAGECONFIG[openssl] =3D &quot;--with-tls=3Dopenssl,,openssl&quot;<br>
-<br>
-PACKAGECONFIG[sasl] =3D &quot;--with-cyrus-sasl,--without-cyrus-sasl,cyrus=
-sasl&quot;<br>
-PACKAGECONFIG[modules] =3D &quot;lt_cv_dlopen_self=3Dyes --enable-modules,=
--disable-modules,libtool&quot;<br>
-<br>
-# SLAPD options<br>
-#<br>
-# UNIX crypt(3) passwd support:<br>
-EXTRA_OECONF +=3D &quot;--enable-crypt&quot;<br>
-<br>
-EXTRA_OECONF +=3D &quot;--enable-ipv6&quot;<br>
-<br>
-# SLAPD BACKEND<br>
-#<br>
-# The backend must be set by the configuration.=C2=A0 This controls the<br=
>
-# required database, the default database, bdb, is turned off but<br>
-# can be turned back on again and it *is* below!=C2=A0 The monitor backend=
<br>
-# is also disabled.=C2=A0 If you try to change the backends but fail to<br=
>
-# enable a single one the build will fail in an obvious way.<br>
-#<br>
-# EXTRA_OECONF +=3D &quot;--disable-bdb --disable-hdb --disable-monitor&qu=
ot;<br>
-#<br>
-# Backends=3D&quot;bdb dnssrv hdb ldap ldbm meta monitor null passwd perl =
shell sql&quot;<br>
-#<br>
-# Note that multiple backends can be built.=C2=A0 The ldbm backend require=
s a<br>
-# build-time choice of database API.=C2=A0 The bdb backend forces this to =
be<br>
-# DB4.=C2=A0 To use the gdbm (or other) API the Berkely database module mu=
st<br>
-# be removed from the build.<br>
-md =3D &quot;${libexecdir}/openldap&quot;<br>
-#<br>
-#--enable-bdb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable Berkeley DB backend=
 no|yes|mod yes<br>
-# The Berkely DB is the standard choice.=C2=A0 This version of OpenLDAP re=
quires<br>
-# the version 4 implementation or better.<br>
-PACKAGECONFIG[bdb] =3D &quot;--enable-bdb=3Dmod,--enable-bdb=3Dno,db&quot;=
<br>
-<br>
-#--enable-dnssrv=C2=A0 =C2=A0 =C2=A0 =C2=A0enable dnssrv backend no|yes|mo=
d no<br>
-PACKAGECONFIG[dnssrv] =3D &quot;--enable-dnssrv=3Dmod,--enable-dnssrv=3Dno=
&quot;<br>
-<br>
-#--enable-hdb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable Hierarchical DB bac=
kend no|yes|mod no<br>
-# This forces ldbm to use Berkeley too, remove to use gdbm<br>
-PACKAGECONFIG[hdb] =3D &quot;--enable-hdb=3Dmod,--enable-hdb=3Dno,db&quot;=
<br>
-<br>
-#--enable-ldap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable ldap backend no|yes=
|mod no<br>
-PACKAGECONFIG[ldap] =3D &quot;--enable-ldap=3Dmod,--enable-ldap=3Dno,&quot=
;<br>
-<br>
-#--enable-ldbm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable ldbm backend no|yes=
|mod no<br>
-# ldbm requires further specification of the underlying database API, beca=
use<br>
-# bdb is enabled above this must be set to berkeley, however the config<br=
>
-# defaults this correctly so --with-ldbm-api is *not* set.=C2=A0 The build=
 will<br>
-# fail if bdb is removed, but no database is built to provide the<br>
-# support for ldbm<br>
-# guide.html:&lt;P&gt;back-ldbm was both slow and unreliable. Its byzantin=
e indexing code was prone to spontaneous corruption, as were the underlying=
 database libraries that were commonly used (e.g. GDBM or NDBM). back-bdb a=
nd back-hdb are superior in every aspect, with simplified indexing to avoid=
 index corruption, fine-grained locking for greater concurrency, hierarchic=
al caching for greater performance, streamlined on-disk format for greater =
efficiency and portability, and full transaction support for greater reliab=
ility.&lt;/P&gt;<br>
-# configure: WARNING: unrecognized options: --disable-silent-rules, --enab=
le-ldbm, --with-ldbm-api<br>
-#PACKAGECONFIG[ldbm] =3D &quot;--enable-ldbm=3Dmod --with-ldbm-api=3Dgdbm,=
--enable-ldbm-no,gdbm&quot;<br>
-<br>
-#--enable-meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable metadirectory backe=
nd no|yes|mod no<br>
-PACKAGECONFIG[meta] =3D &quot;--enable-meta=3Dmod,--enable-meta=3Dno,&quot=
;<br>
-<br>
-#--enable-monitor=C2=A0 =C2=A0 =C2=A0 enable monitor backend no|yes|mod ye=
s<br>
-PACKAGECONFIG[monitor] =3D &quot;--enable-monitor=3Dmod,--enable-monitor=
=3Dno,&quot;<br>
-<br>
-#--enable-null=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable null backend no|yes=
|mod no<br>
-PACKAGECONFIG[null] =3D &quot;--enable-null=3Dmod,--enable-null=3Dno,&quot=
;<br>
-<br>
-#--enable-passwd=C2=A0 =C2=A0 =C2=A0 =C2=A0enable passwd backend no|yes|mo=
d no<br>
-PACKAGECONFIG[passwd] =3D &quot;--enable-passwd=3Dmod,--enable-passwd=3Dno=
,&quot;<br>
-<br>
-# disabling perl support - host contamination issues<br>
-#<br>
-#--enable-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable perl backend no|yes=
|mod no<br>
-#=C2=A0 This requires a loadable perl dynamic library, if enabled without<=
br>
-#=C2=A0 doing something appropriate (building perl?) the build will pick<b=
r>
-#=C2=A0 up the build machine perl - not good (inherit perlnative?)<br>
-# PACKAGECONFIG[perl] =3D &quot;--enable-perl=3Dmod,--enable-perl=3Dno,per=
l&quot;<br>
-<br>
-#--enable-shell=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable shell backend no|yes|mod=
 no<br>
-# configure: WARNING: Use of --without-threads is recommended with back-sh=
ell<br>
-PACKAGECONFIG[shell] =3D &quot;--enable-shell=3Dmod --without-threads,--en=
able-shell=3Dno,&quot;<br>
-<br>
-#--enable-sql=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable sql backend no|yes|=
mod no<br>
-# sql requires some sql backend which provides sql.h, sqlite* provides<br>
-# sqlite.h (which may be compatible but hasn&#39;t been tried.)<br>
-PACKAGECONFIG[sql] =3D &quot;--enable-sql=3Dmod,--enable-sql=3Dno,sqlite3&=
quot;<br>
-<br>
-#--enable-dyngroup=C2=A0 =C2=A0 =C2=A0Dynamic Group overlay no|yes|mod no<=
br>
-#=C2=A0 This is a demo, Proxy Cache defines init_module which conflicts wi=
th the<br>
-#=C2=A0 same symbol in dyngroup<br>
-PACKAGECONFIG[dyngroup] =3D &quot;--enable-dyngroup=3Dmod,--enable-dyngrou=
p=3Dno,&quot;<br>
-<br>
-#--enable-proxycache=C2=A0 =C2=A0Proxy Cache overlay no|yes|mod no<br>
-PACKAGECONFIG[proxycache] =3D &quot;--enable-proxycache=3Dmod,--enable-pro=
xycache=3Dno,&quot;<br>
-<br>
-#--enable-mdb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable mdb database backend=
 no|yes|mod no<br>
-PACKAGECONFIG[mdb] =3D &quot;--enable-mdb=3Dmod,--enable-mdb=3Dno,&quot;<b=
r>
-<br>
-CPPFLAGS_append =3D &quot; -D_GNU_SOURCE&quot;<br>
-<br>
-do_configure() {<br>
-=C2=A0 =C2=A0 cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/b=
uild<br>
-=C2=A0 =C2=A0 rm -f ${S}/libtool<br>
-=C2=A0 =C2=A0 rm -f ${S}/libtool<br>
-=C2=A0 =C2=A0 aclocal<br>
-=C2=A0 =C2=A0 libtoolize --force --copy<br>
-=C2=A0 =C2=A0 gnu-configize<br>
-=C2=A0 =C2=A0 autoconf<br>
-=C2=A0 =C2=A0 oe_runconf<br>
-}<br>
-<br>
-FILES_${PN}-dev =3D &quot;${includedir} ${libdir}/lib*.so ${libdir}/*.la $=
{libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libex=
ecdir}/openldap/*.so&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/openldap/.debug&quot;<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--001a1143158aa46c1c052aca141e--
