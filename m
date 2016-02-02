Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59F5CE00B66; Tue,  2 Feb 2016 04:37:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1966BE00AD8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 04:37:43 -0800 (PST)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12BfJdC023843 for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Feb 2016 05:41:19 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020205411846-550094 ;
	Tue, 2 Feb 2016 05:41:18 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 2 Feb 2016 13:40:54 +0200
Message-Id: <c81867b967410ba1b9ae4f80fffcd8707a473caa.1454413132.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
References: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 05:41:19 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 05:41:19 AM,
	Serialize complete at 02/02/2016 05:41:19 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_08:, , signatures=0
Subject: [meta-cloud-services][PATCH 4/6] openldap: remove recipe
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
X-List-Received-Date: Tue, 02 Feb 2016 12:37:47 -0000

meta-oe contains a newer openldap recipe wich provides everything this
recipe does. Since the meta-cloud-services layers already depend on
meta-oe, we can remove this openldap recipe and use the more actively
maintained one from meta-oe.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../add-tlscacert-option-to-ldap-conf.patch        |  10 -
 .../openldap-2.4.39/autogroup-makefile.patch       |  35 ----
 .../contrib-modules-use-dpkg-buildflags.patch      |  40 ----
 .../do-not-second-guess-sonames.patch              |  68 -------
 .../openldap/openldap-2.4.39/evolution-ntlm.patch  | 222 ---------------------
 .../openldap-2.4.39/fix-build-top-mk.patch         |  11 -
 .../openldap-2.4.39/fix-ftbfs-binutils-gold.patch  |  64 ------
 .../getaddrinfo-is-threadsafe.patch                |  43 ----
 .../openldap/openldap-2.4.39/heimdal-fix.patch     |  23 ---
 .../index-files-created-as-root.patch              |  37 ----
 .../openldap/openldap-2.4.39/install-strip.patch   |  14 --
 .../openldap-2.4.39/ldap-conf-tls-cacertdir.patch  |  29 ---
 .../openldap-2.4.39/ldapi-socket-place.patch       |  16 --
 .../openldap-2.4.39/libldap-symbol-versions.patch  | 161 ---------------
 .../openldap/openldap-2.4.39/man-slapd.patch       |  60 ------
 .../openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch      |  25 ---
 .../no-bdb-ABI-second-guessing.patch               |  42 ----
 .../openldap-2.4.39/sasl-default-path.patch        |  55 -----
 recipes-support/openldap/openldap-2.4.39/series    |  21 --
 .../openldap-2.4.39/slapi-errorlog-file.patch      |  16 --
 .../openldap-2.4.39/smbk5pwd-makefile.patch        |  53 -----
 ..._dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch |  40 ----
 .../openldap-2.4.39/wrong-database-location.patch  |  74 -------
 recipes-support/openldap/openldap_2.4.39.bb        | 182 -----------------
 24 files changed, 1341 deletions(-)
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/install-strip.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/man-slapd.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/series
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
 delete mode 100644 recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
 delete mode 100644 recipes-support/openldap/openldap_2.4.39.bb

diff --git a/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch b/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
deleted file mode 100644
index e8e731a..0000000
--- a/recipes-support/openldap/openldap-2.4.39/add-tlscacert-option-to-ldap-conf.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/libraries/libldap/ldap.conf
-+++ b/libraries/libldap/ldap.conf
-@@ -11,3 +11,7 @@
- #SIZELIMIT	12
- #TIMELIMIT	15
- #DEREF		never
-+
-+# TLS certificates (needed for GnuTLS)
-+TLS_CACERT	/etc/ssl/certs/ca-certificates.crt
-+
diff --git a/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch b/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
deleted file mode 100644
index d3f56c3..0000000
--- a/recipes-support/openldap/openldap-2.4.39/autogroup-makefile.patch
+++ /dev/null
@@ -1,35 +0,0 @@
---- a/contrib/slapd-modules/autogroup/Makefile
-+++ b/contrib/slapd-modules/autogroup/Makefile
-@@ -2,11 +2,11 @@
- 
- LDAP_SRC = ../../..
- LDAP_BUILD = ../../..
--LDAP_INC = -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
--LDAP_LIB = $(LDAP_BUILD)/libraries/libldap_r/libldap_r.la \
--	$(LDAP_BUILD)/libraries/liblber/liblber.la
-+LDAP_INC = -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
-+LDAP_LIB = $(LDAP_BUILD)/debian/build/libraries/libldap_r/libldap_r.la \
-+	$(LDAP_BUILD)/debian/build/libraries/liblber/liblber.la
- 
--LIBTOOL = $(LDAP_BUILD)/libtool
-+LIBTOOL = $(LDAP_BUILD)/debian/build/libtool
- CC = gcc
- OPT = -g -O2 -Wall
- DEFS = 
-@@ -16,13 +16,13 @@ LIBS = $(LDAP_LIB)
- PROGRAMS = autogroup.la
- LTVER = 0:0:0
- 
--prefix=/usr/local
-+prefix=/usr
- exec_prefix=$(prefix)
--ldap_subdir=/openldap
-+ldap_subdir=/ldap
- 
- libdir=$(exec_prefix)/lib
- libexecdir=$(exec_prefix)/libexec
--moduledir = $(libexecdir)$(ldap_subdir)
-+moduledir = $(libdir)$(ldap_subdir)
- 
- .SUFFIXES: .c .o .lo
- 
diff --git a/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch b/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
deleted file mode 100644
index 1b15529..0000000
--- a/recipes-support/openldap/openldap-2.4.39/contrib-modules-use-dpkg-buildflags.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Description: pass CFLAGS to contrib builds
- $(CFLAGS) is missing from the compiler invocations for autogroup and
- smbk5pwd, which means they're not being hardened.
-Author: Simon Ruderich <simon@ruderich.org>
-Bug-Debian: http://bugs.debian.org/663724
-
---- a/contrib/slapd-modules/autogroup/Makefile
-+++ b/contrib/slapd-modules/autogroup/Makefile
-@@ -27,12 +27,12 @@ moduledir = $(libexecdir)$(ldap_subdir)
- .SUFFIXES: .c .o .lo
- 
- .c.lo:
--	$(LIBTOOL) --mode=compile $(CC) $(OPT) $(DEFS) $(INCS) -c $<
-+	$(LIBTOOL) --mode=compile $(CC) $(OPT) $(CFLAGS) $(DEFS) $(INCS) -c $<
- 
- all: $(PROGRAMS)
- 
- autogroup.la: autogroup.lo
--	$(LIBTOOL) --mode=link $(CC) $(OPT) -version-info $(LTVER) \
-+	$(LIBTOOL) --mode=link $(CC) $(OPT) $(LDFLAGS) -version-info $(LTVER) \
- 	-rpath $(moduledir) -module -o $@ $? $(LIBS)
- 
- clean:
---- a/contrib/slapd-modules/smbk5pwd/Makefile
-+++ b/contrib/slapd-modules/smbk5pwd/Makefile
-@@ -46,12 +46,12 @@ moduledir = $(libexecdir)$(ldap_subdir)
- .SUFFIXES: .c .o .lo
- 
- .c.lo:
--	$(LIBTOOL) --mode=compile $(CC) $(OPT) $(DEFS) $(INCS) -c $<
-+	$(LIBTOOL) --mode=compile $(CC) $(OPT) $(CFLAGS) $(DEFS) $(INCS) -c $<
- 
- all: $(PROGRAMS)
- 
- smbk5pwd.la:	smbk5pwd.lo
--	$(LIBTOOL) --mode=link $(CC) $(OPT) -version-info $(LTVER) \
-+	$(LIBTOOL) --mode=link $(CC) $(OPT) $(LDFLAGS) -version-info $(LTVER) \
- 	-rpath $(moduledir) -module -o $@ $? $(LIBS)
- 
- clean:
diff --git a/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch b/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
deleted file mode 100644
index 31cf652..0000000
--- a/recipes-support/openldap/openldap-2.4.39/do-not-second-guess-sonames.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Rip out code that second-guesses the libsasl soname / Debian shlibs.  If
-cyrus sasl upstream is breaking the ABI, this needs to be fixed upstream
-there, not kludged around upstream here!
-
-Debian bug #546885
-
-Upstream ITS #6302 filed.
-
---- a/libraries/libldap/cyrus.c
-+++ b/libraries/libldap/cyrus.c
-@@ -74,28 +74,6 @@ int ldap_int_sasl_init( void )
- 	/* XXX not threadsafe */
- 	static int sasl_initialized = 0;
- 
--#ifdef HAVE_SASL_VERSION
--	/* stringify the version number, sasl.h doesn't do it for us */
--#define VSTR0(maj, min, pat)	#maj "." #min "." #pat
--#define VSTR(maj, min, pat)	VSTR0(maj, min, pat)
--#define SASL_VERSION_STRING	VSTR(SASL_VERSION_MAJOR, SASL_VERSION_MINOR, \
--				SASL_VERSION_STEP)
--	{ int rc;
--	sasl_version( NULL, &rc );
--	if ( ((rc >> 16) != ((SASL_VERSION_MAJOR << 8)|SASL_VERSION_MINOR)) ||
--		(rc & 0xffff) < SASL_VERSION_STEP) {
--		char version[sizeof("xxx.xxx.xxxxx")];
--		sprintf( version, "%u.%d.%d", (unsigned)rc >> 24, (rc >> 16) & 0xff,
--			rc & 0xffff );
--
--		Debug( LDAP_DEBUG_ANY,
--		"ldap_int_sasl_init: SASL library version mismatch:"
--		" expected " SASL_VERSION_STRING ","
--		" got %s\n", version, 0, 0 );
--		return -1;
--	}
--	}
--#endif
- 	if ( sasl_initialized ) {
- 		return 0;
- 	}
---- a/servers/slapd/sasl.c
-+++ b/servers/slapd/sasl.c
-@@ -1145,26 +1145,6 @@ int slap_sasl_init( void )
- #endif
- 
- #ifdef HAVE_CYRUS_SASL
--#ifdef HAVE_SASL_VERSION
--	/* stringify the version number, sasl.h doesn't do it for us */
--#define	VSTR0(maj, min, pat)	#maj "." #min "." #pat
--#define	VSTR(maj, min, pat)	VSTR0(maj, min, pat)
--#define	SASL_VERSION_STRING	VSTR(SASL_VERSION_MAJOR, SASL_VERSION_MINOR, \
--				SASL_VERSION_STEP)
--
--	sasl_version( NULL, &rc );
--	if ( ((rc >> 16) != ((SASL_VERSION_MAJOR << 8)|SASL_VERSION_MINOR)) ||
--		(rc & 0xffff) < SASL_VERSION_STEP)
--	{
--		char version[sizeof("xxx.xxx.xxxxx")];
--		sprintf( version, "%u.%d.%d", (unsigned)rc >> 24, (rc >> 16) & 0xff,
--			rc & 0xffff );
--		Debug( LDAP_DEBUG_ANY, "slap_sasl_init: SASL library version mismatch:"
--			" expected %s, got %s\n",
--			SASL_VERSION_STRING, version, 0 );
--		return -1;
--	}
--#endif
- 
- 	sasl_set_mutex(
- 		ldap_pvt_sasl_mutex_new,
diff --git a/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch b/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
deleted file mode 100644
index cd9bc26..0000000
--- a/recipes-support/openldap/openldap-2.4.39/evolution-ntlm.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Patch from evolution-exchange (2.10.3).  The ldap_ntlm_bind function is
-actually called by evolution-data-server, checked at version 1.12.2.
-Without this patch, the Exchange addressbook integration uses simple binds
-with cleartext passwords.
-
-Russ checked with openldap-software for upstream's opinion on this patch
-on 2007-12-21.  Upstream had never received it as a patch submission and
-given that it's apparently only for older Exchange servers that can't do
-SASL and DIGEST-MD5, it's not very appealing.
-
-Bug#457374 filed against evolution-data-server asking if this support is
-still required on 2007-12-21.
-
---- a/include/ldap.h
-+++ b/include/ldap.h
-@@ -2517,5 +2517,25 @@ ldap_parse_deref_control LDAP_P((
- 	LDAPControl	**ctrls,
- 	LDAPDerefRes	**drp ));
- 
-+/*
-+ * hacks for NTLM
-+ */
-+#define LDAP_AUTH_NTLM_REQUEST ((ber_tag_t) 0x8aU)
-+#define LDAP_AUTH_NTLM_RESPONSE  ((ber_tag_t) 0x8bU)
-+LDAP_F( int )
-+ldap_ntlm_bind LDAP_P((
-+      LDAP    *ld,
-+      LDAP_CONST char *dn,
-+      ber_tag_t tag,
-+      struct berval *cred,
-+      LDAPControl **sctrls,
-+      LDAPControl **cctrls,
-+      int   *msgidp ));
-+LDAP_F( int )
-+ldap_parse_ntlm_bind_result LDAP_P((
-+      LDAP    *ld,
-+      LDAPMessage *res,
-+      struct berval *challenge));
-+
- LDAP_END_DECL
- #endif /* _LDAP_H */
---- /dev/null
-+++ b/libraries/libldap/ntlm.c
-@@ -0,0 +1,138 @@
-+/* $OpenLDAP: pkg/ldap/libraries/libldap/ntlm.c,v 1.1.4.10 2002/01/04 20:38:21 kurt Exp $ */
-+/*
-+ * Copyright 1998-2002 The OpenLDAP Foundation, All Rights Reserved.
-+ * COPYING RESTRICTIONS APPLY, see COPYRIGHT file
-+ */
-+
-+/* Mostly copied from sasl.c */
-+
-+#include "portable.h"
-+
-+#include <stdlib.h>
-+#include <stdio.h>
-+
-+#include <ac/socket.h>
-+#include <ac/string.h>
-+#include <ac/time.h>
-+#include <ac/errno.h>
-+
-+#include "ldap-int.h"
-+
-+int
-+ldap_ntlm_bind(
-+ LDAP    *ld,
-+ LDAP_CONST char *dn,
-+ ber_tag_t tag,
-+ struct berval *cred,
-+ LDAPControl **sctrls,
-+ LDAPControl **cctrls,
-+ int   *msgidp )
-+{
-+ BerElement  *ber;
-+ int rc;
-+ ber_int_t id;
-+
-+ Debug( LDAP_DEBUG_TRACE, "ldap_ntlm_bind\n", 0, 0, 0 );
-+
-+ assert( ld != NULL );
-+ assert( LDAP_VALID( ld ) );
-+ assert( msgidp != NULL );
-+
-+ if( msgidp == NULL ) {
-+   ld->ld_errno = LDAP_PARAM_ERROR;
-+   return ld->ld_errno;
-+ }
-+
-+ /* create a message to send */
-+ if ( (ber = ldap_alloc_ber_with_options( ld )) == NULL ) {
-+   ld->ld_errno = LDAP_NO_MEMORY;
-+   return ld->ld_errno;
-+ }
-+
-+ assert( LBER_VALID( ber ) );
-+
-+ LDAP_NEXT_MSGID( ld, id );
-+ rc = ber_printf( ber, "{it{istON}" /*}*/,
-+      id, LDAP_REQ_BIND,
-+      ld->ld_version, dn, tag,
-+      cred );
-+
-+ /* Put Server Controls */
-+ if( ldap_int_put_controls( ld, sctrls, ber ) != LDAP_SUCCESS ) {
-+   ber_free( ber, 1 );
-+   return ld->ld_errno;
-+ }
-+
-+ if ( ber_printf( ber, /*{*/ "N}" ) == -1 ) {
-+   ld->ld_errno = LDAP_ENCODING_ERROR;
-+   ber_free( ber, 1 );
-+   return ld->ld_errno;
-+ }
-+
-+ /* send the message */
-+ *msgidp = ldap_send_initial_request( ld, LDAP_REQ_BIND, dn, ber, id );
-+
-+ if(*msgidp < 0)
-+   return ld->ld_errno;
-+
-+ return LDAP_SUCCESS;
-+}
-+
-+int
-+ldap_parse_ntlm_bind_result(
-+ LDAP    *ld,
-+ LDAPMessage *res,
-+ struct berval *challenge)
-+{
-+ ber_int_t errcode;
-+ ber_tag_t tag;
-+ BerElement  *ber;
-+ ber_len_t len;
-+
-+ Debug( LDAP_DEBUG_TRACE, "ldap_parse_ntlm_bind_result\n", 0, 0, 0 );
-+
-+ assert( ld != NULL );
-+ assert( LDAP_VALID( ld ) );
-+ assert( res != NULL );
-+
-+ if ( ld == NULL || res == NULL ) {
-+   return LDAP_PARAM_ERROR;
-+ }
-+
-+ if( res->lm_msgtype != LDAP_RES_BIND ) {
-+   ld->ld_errno = LDAP_PARAM_ERROR;
-+   return ld->ld_errno;
-+ }
-+
-+ if ( ld->ld_error ) {
-+   LDAP_FREE( ld->ld_error );
-+   ld->ld_error = NULL;
-+ }
-+ if ( ld->ld_matched ) {
-+   LDAP_FREE( ld->ld_matched );
-+   ld->ld_matched = NULL;
-+ }
-+
-+ /* parse results */
-+
-+ ber = ber_dup( res->lm_ber );
-+
-+ if( ber == NULL ) {
-+   ld->ld_errno = LDAP_NO_MEMORY;
-+   return ld->ld_errno;
-+ }
-+
-+ tag = ber_scanf( ber, "{ioa" /*}*/,
-+      &errcode, challenge, &ld->ld_error );
-+ ber_free( ber, 0 );
-+
-+ if( tag == LBER_ERROR ) {
-+   ld->ld_errno = LDAP_DECODING_ERROR;
-+   return ld->ld_errno;
-+ }
-+
-+ ld->ld_errno = errcode;
-+
-+ return( ld->ld_errno );
-+}
-+
---- a/libraries/libldap/Makefile.in
-+++ b/libraries/libldap/Makefile.in
-@@ -27,7 +27,7 @@ SRCS	= bind.c open.c result.c error.c co
- 	init.c options.c print.c string.c util-int.c schema.c \
- 	charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
- 	tls2.c tls_o.c tls_g.c tls_m.c \
--	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
-+	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c ntlm.c \
- 	assertion.c deref.c ldif.c fetch.c
- 
- OBJS	= bind.lo open.lo result.lo error.lo compare.lo search.lo \
-@@ -40,7 +40,7 @@ OBJS	= bind.lo open.lo result.lo error.l
- 	init.lo options.lo print.lo string.lo util-int.lo schema.lo \
- 	charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
- 	tls2.lo tls_o.lo tls_g.lo tls_m.lo \
--	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
-+	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo ntlm.lo \
- 	assertion.lo deref.lo ldif.lo fetch.lo
- 
- LDAP_INCDIR= ../../include       
---- a/libraries/libldap_r/Makefile.in
-+++ b/libraries/libldap_r/Makefile.in
-@@ -29,7 +29,7 @@ XXSRCS    = apitest.c test.c \
- 	init.c options.c print.c string.c util-int.c schema.c \
- 	charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
- 	tls2.c tls_o.c tls_g.c tls_m.c \
--	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
-+	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c ntlm.c \
- 	assertion.c deref.c ldif.c fetch.c
- SRCS	= threads.c rdwr.c rmutex.c tpool.c rq.c \
- 	thr_posix.c thr_cthreads.c thr_thr.c thr_nt.c \
-@@ -47,7 +47,7 @@ OBJS	= threads.lo rdwr.lo rmutex.lo tpoo
- 	init.lo options.lo print.lo string.lo util-int.lo schema.lo \
- 	charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
- 	tls2.lo tls_o.lo tls_g.lo tls_m.lo \
--	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
-+	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo ntlm.lo \
- 	assertion.lo deref.lo ldif.lo fetch.lo
- 
- LDAP_INCDIR= ../../include       
diff --git a/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch b/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
deleted file mode 100644
index 418fe35..0000000
--- a/recipes-support/openldap/openldap-2.4.39/fix-build-top-mk.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/build/top.mk
-+++ b/build/top.mk
-@@ -20,7 +20,7 @@
- RELEASEDATE= @OPENLDAP_RELEASE_DATE@
- 
- @SET_MAKE@
--SHELL = /bin/sh
-+SHELL = @SHELL@
- 
- top_builddir = @top_builddir@
- 
diff --git a/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch b/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
deleted file mode 100644
index 1f0ca88..0000000
--- a/recipes-support/openldap/openldap-2.4.39/fix-ftbfs-binutils-gold.patch
+++ /dev/null
@@ -1,64 +0,0 @@
---- a/configure.in
-+++ b/configure.in
-@@ -1214,7 +1214,7 @@ if test $ol_link_tls = no ; then
- 				ol_with_tls=gnutls
- 				ol_link_tls=yes
- 
--				TLS_LIBS="-lgnutls"
-+				TLS_LIBS="-lgnutls -lgcrypt"
- 
- 				AC_DEFINE(HAVE_GNUTLS, 1, 
- 					[define if you have GNUtls])
---- a/libraries/libldap/Makefile.in
-+++ b/libraries/libldap/Makefile.in
-@@ -51,21 +51,21 @@ LIB_DEFS = -DLDAP_LIBRARY
- XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(LDAP_LIBLUTIL_A)
- XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
- NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
--UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
-+UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(TLS_LIBS)
- ifneq (,$(VERSION_OPTION))
-   VERSION_FLAGS = $(VERSION_OPTION)$(srcdir)/libldap.map
- endif
- 
- apitest:	$(XLIBS) apitest.o
--	$(LTLINK) -o $@ apitest.o $(LIBS)
-+	$(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)
- dntest:	$(XLIBS) dntest.o
--	$(LTLINK) -o $@ dntest.o $(LIBS)
-+	$(LTLINK) -o $@ dntest.o $(LIBS) $(TLS_LIBS)
- ftest:	$(XLIBS) ftest.o
--	$(LTLINK) -o $@ ftest.o $(LIBS)
-+	$(LTLINK) -o $@ ftest.o $(LIBS) $(TLS_LIBS)
- ltest:	$(XLIBS) test.o
--	$(LTLINK) -o $@ test.o $(LIBS)
-+	$(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)
- urltest: $(XLIBS) urltest.o
--	$(LTLINK) -o $@ urltest.o $(LIBS)
-+	$(LTLINK) -o $@ urltest.o $(LIBS) $(TLS_LIBS)
- 
- CFFILES=ldap.conf
- 
---- a/libraries/libldap_r/Makefile.in
-+++ b/libraries/libldap_r/Makefile.in
-@@ -60,7 +60,7 @@ XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(
- XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
- XXXLIBS = $(LTHREAD_LIBS)
- NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
--UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHREAD_LIBS)
-+UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHREAD_LIBS) $(TLS_LIBS)
- ifneq (,$(VERSION_OPTION))
-   VERSION_FLAGS = "$(VERSION_OPTION)$(XXDIR)/libldap.map"
- endif
-@@ -80,9 +80,9 @@ clean-local: FORCE
- depend-common: .links
- 
- apitest:	$(XLIBS) apitest.o
--	$(LTLINK) -o $@ apitest.o $(LIBS)
-+	$(LTLINK) -o $@ apitest.o $(LIBS) $(TLS_LIBS)
- ltest:	$(XLIBS) test.o
--	$(LTLINK) -o $@ test.o $(LIBS)
-+	$(LTLINK) -o $@ test.o $(LIBS) $(TLS_LIBS)
- 
- install-local: $(CFFILES) FORCE
- 	-$(MKDIR) $(DESTDIR)$(libdir)
diff --git a/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch b/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
deleted file mode 100644
index ab6e2b7..0000000
--- a/recipes-support/openldap/openldap-2.4.39/getaddrinfo-is-threadsafe.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Author: Steve Langasek <vorlon@debian.org>
-
-OpenLDAP upstream conservatively assumes that certain resolver functions
-(getaddrinfo, getnameinfo, res_query, dn_expand) are not re-entrant; but we
-know that the glibc implementations of these functions are thread-safe, so
-we should bypass the use of this mutex.  This fixes a locking problem when
-an application uses libldap and libnss-ldap is also used for hosts
-resolution.
-
-Closes Debian bug #340601.
-
-Not suitable for forwarding upstream; might be made suitable by adding a
-configure-time check for glibc and disabling the mutex only on known
-thread-safe implementations.
-
---- a/libraries/libldap/os-ip.c
-+++ b/libraries/libldap/os-ip.c
-@@ -602,13 +602,7 @@ ldap_connect_to_host(LDAP *ld, Sockbuf *
- 	hints.ai_socktype = socktype;
- 	snprintf(serv, sizeof serv, "%d", port );
- 
--	/* most getaddrinfo(3) use non-threadsafe resolver libraries */
--	LDAP_MUTEX_LOCK(&ldap_int_resolv_mutex);
--
- 	err = getaddrinfo( host, serv, &hints, &res );
--
--	LDAP_MUTEX_UNLOCK(&ldap_int_resolv_mutex);
--
- 	if ( err != 0 ) {
- 		osip_debug(ld, "ldap_connect_to_host: getaddrinfo failed: %s\n",
- 			AC_GAI_STRERROR(err), 0, 0);
---- a/libraries/libldap/util-int.c
-+++ b/libraries/libldap/util-int.c
-@@ -431,9 +431,7 @@ int ldap_pvt_get_hname(
- 	int rc;
- #if defined( HAVE_GETNAMEINFO )
- 
--	LDAP_MUTEX_LOCK( &ldap_int_resolv_mutex );
- 	rc = getnameinfo( sa, len, name, namelen, NULL, 0, 0 );
--	LDAP_MUTEX_UNLOCK( &ldap_int_resolv_mutex );
- 	if ( rc ) *err = (char *)AC_GAI_STRERROR( rc );
- 	return rc;
- 
diff --git a/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch b/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
deleted file mode 100644
index f6fa7ec..0000000
--- a/recipes-support/openldap/openldap-2.4.39/heimdal-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Author: Mattias Ellert <mattias.ellert@fysast.uu.se>
-Description: adapt parameters of hdb_generate_key_set_password() to heimdal 1.6~git20120311
- .
- With version heimdal 1.6~git20120311 heimdal schanged the number of parameters
- of function hdb_generate_key_set_password(), implementing a fallback to "default"
- values when NULL-values are passed for these parameters.
- .
- This patch does exactly that.
- .
-Bug-Debian: 664930
-Reviewed-by: Peter Marschall <peter@adpm.de>
-
---- a/contrib/slapd-modules/smbk5pwd/smbk5pwd.c
-+++ b/contrib/slapd-modules/smbk5pwd/smbk5pwd.c
-@@ -470,7 +470,7 @@ static int smbk5pwd_exop_passwd(
- 		}
- 
- 		ret = hdb_generate_key_set_password(context, ent.principal,
--			qpw->rs_new.bv_val, &ent.keys.val, &nkeys);
-+			qpw->rs_new.bv_val, NULL, 0, &ent.keys.val, &nkeys);
- 		ent.keys.len = nkeys;
- 		hdb_seal_keys(context, db, &ent);
- 		krb5_free_principal( context, ent.principal );
diff --git a/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch b/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
deleted file mode 100644
index 47fc88a..0000000
--- a/recipes-support/openldap/openldap-2.4.39/index-files-created-as-root.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Document in the man page that slapindex should be run as the same user
-as slapd, and print a warning if it's run as root (since Debian defaults
-to running slapd as openldap).
-
-Not suitable for upstream in this form.  This patch needs to be reworked
-to check the BerkeleyDB database ownership and only warn if running as
-root with a database that's not owned by root.
-
-Upstream ITS #5356 filed requesting better handling of this.  Current
-upstream discussion leans towards putting the check into the database
-backend and aborting if slapd is run as a different user than the database
-owner, which is an even better fix.
-
---- a/doc/man/man8/slapindex.8
-+++ b/doc/man/man8/slapindex.8
-@@ -148,6 +148,10 @@
- should not be running (at least, not in read-write
- mode) when you do this to ensure consistency of the database.
- .LP
-+slapindex ought to be run as the user specified for
-+.BR slapd (8)
-+to ensure correct database permissions.
-+.LP
- This command provides ample opportunity for the user to obtain
- and drink their favorite beverage.
- .SH EXAMPLES
---- a/servers/slapd/slapindex.c
-+++ b/servers/slapd/slapindex.c
-@@ -34,6 +34,8 @@
- int
- slapindex( int argc, char **argv )
- {
-+    if (geteuid() == 0)
-+        fprintf( stderr, "\nWARNING!\nRunnig as root!\nThere's a fair chance slapd will fail to start.\nCheck file permissions!\n\n");
- 	ID id;
- 	int rc = EXIT_SUCCESS;
- 	const char *progname = "slapindex";
diff --git a/recipes-support/openldap/openldap-2.4.39/install-strip.patch b/recipes-support/openldap/openldap-2.4.39/install-strip.patch
deleted file mode 100644
index 2992b70..0000000
--- a/recipes-support/openldap/openldap-2.4.39/install-strip.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-# This patch ensures that the install operations which strip
-# programs and libraries (LTINSTALL) work in a cross build
-# environment.
---- openldap-2.2.24/.pc/install-strip.patch/build/top.mk	2005-01-20 09:00:55.000000000 -0800
-+++ openldap-2.2.24/build/top.mk	2005-04-16 13:48:20.536710376 -0700
-@@ -116,7 +116,7 @@
- LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
- 	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
- 
--LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL) 
-+LTINSTALL = STRIPPROG="" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
- LTFINISH = $(LIBTOOL) --mode=finish
- 
- # Misc UNIX commands used in build environment
diff --git a/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch b/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
deleted file mode 100644
index e8aab91..0000000
--- a/recipes-support/openldap/openldap-2.4.39/ldap-conf-tls-cacertdir.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- a/doc/man/man5/ldap.conf.5
-+++ b/doc/man/man5/ldap.conf.5
-@@ -317,7 +317,7 @@ certificates in separate individual file
- .B TLS_CACERT
- is always used before
- .B TLS_CACERTDIR.
--This parameter is ignored with GnuTLS.
-+This parameter is ignored with GnuTLS. On Debian openldap is linked against GnuTLS.
- 
- When using Mozilla NSS, <path> may contain a Mozilla NSS cert/key
- database.  If <path> contains a Mozilla NSS cert/key database and
-@@ -428,7 +428,7 @@ This parameter is ignored with GnuTLS.
- Specifies the file to obtain random bits from when /dev/[u]random is
- not available. Generally set to the name of the EGD/PRNGD socket.
- The environment variable RANDFILE can also be used to specify the filename.
--This parameter is ignored with GnuTLS and Mozilla NSS.
-+This parameter is ignored with GnuTLS and Mozilla NSS. On Debian openldap is linked against GnuTLS.
- .TP
- .B TLS_REQCERT <level>
- Specifies what checks to perform on server certificates in a TLS session,
-@@ -461,7 +461,7 @@ Specifies if the Certificate Revocation
- used to verify if the server certificates have not been revoked. This
- requires
- .B TLS_CACERTDIR
--parameter to be set. This parameter is ignored with GnuTLS and Mozilla NSS.
-+parameter to be set. This parameter is ignored with GnuTLS and Mozilla NSS. On Debian openldap is linked against GnuTLS.
- .B <level>
- can be specified as one of the following keywords:
- .RS
diff --git a/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch b/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
deleted file mode 100644
index a482bbf..0000000
--- a/recipes-support/openldap/openldap-2.4.39/ldapi-socket-place.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Move the ldapi socket to /var/run/slapd from /var/run, since /var/run
-is only writable by root and slapd runs as openldap.
-
-Debian-specific.
-
---- a/include/ldap_defaults.h
-+++ b/include/ldap_defaults.h
-@@ -39,7 +39,7 @@
- #define LDAP_ENV_PREFIX "LDAP"
- 
- /* default ldapi:// socket */
--#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"
-+#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "slapd" LDAP_DIRSEP "ldapi"
- 
- /*
-  * SLAPD DEFINITIONS
diff --git a/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch b/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
deleted file mode 100644
index fb28f49..0000000
--- a/recipes-support/openldap/openldap-2.4.39/libldap-symbol-versions.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-Add symbol versioning to the public LDAP libraries.  This is required for
-library transitions, such as the current transition from 2.1 to 2.4,
-since programs will sometimes have both libraries loaded by different
-dependency chains during the transition.
-
-Not yet contributed upstream.
-
-Upstream ITS #5365 filed requesting symbol versioning for libldap and
-libber.
-
---- a/libraries/libldap_r/Makefile.in
-+++ b/libraries/libldap_r/Makefile.in
-@@ -61,6 +61,9 @@ XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
- XXXLIBS = $(LTHREAD_LIBS)
- NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
- UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHREAD_LIBS)
-+ifneq (,$(VERSION_OPTION))
-+  VERSION_FLAGS = "$(VERSION_OPTION)$(XXDIR)/libldap.map"
-+endif
- 
- .links : Makefile
- 	@for i in $(XXSRCS); do \
---- a/build/top.mk
-+++ b/build/top.mk
-@@ -104,6 +104,9 @@ LTFLAGS_MOD = $(@PLAT@_LTFLAGS_MOD)
- # LINK_LIBS referenced in library and module link commands.
- LINK_LIBS = $(MOD_LIBS) $(@PLAT@_LINK_LIBS)
- 
-+# option to pass to $(CC) to support library symbol versioning, if any
-+VERSION_OPTION = @VERSION_OPTION@
-+
- LTSTATIC = @LTSTATIC@
- 
- LTLINK   = $(LIBTOOL) --mode=link \
-@@ -113,7 +116,7 @@ LTCOMPILE_LIB = $(LIBTOOL) $(LTONLY_LIB)
- 	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(LIB_DEFS) -c
- 
- LTLINK_LIB = $(LIBTOOL) $(LTONLY_LIB) --mode=link \
--	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB)
-+	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB) $(VERSION_FLAGS)
- 
- LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
- 	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(MOD_DEFS) -c
---- a/build/openldap.m4
-+++ b/build/openldap.m4
-@@ -1136,3 +1136,54 @@ AC_DEFUN([OL_SSL_COMPAT],
- #endif
- 	], [ol_cv_ssl_crl_compat=yes], [ol_cv_ssl_crl_compat=no])])
- ])
-+
-+dnl ====================================================================
-+dnl check for symbol versioning support
-+AC_DEFUN([OL_SYMBOL_VERSIONING],
-+[AC_CACHE_CHECK([for .symver assembler directive],
-+	[ol_cv_asm_symver_directive],[
-+cat > conftest.s <<EOF
-+${libc_cv_dot_text}
-+_sym:
-+.symver _sym,sym@VERS
-+EOF
-+if ${CC-cc} -c $ASFLAGS conftest.s 1>&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD; then
-+  ol_cv_asm_symver_directive=yes
-+else
-+  ol_cv_asm_symver_directive=no
-+fi
-+rm -f conftest*])
-+AC_CACHE_CHECK([for ld --version-script],
-+	[ol_cv_ld_version_script_option],[
-+if test $ol_cv_asm_symver_directive = yes; then
-+  cat > conftest.s <<EOF
-+${libc_cv_dot_text}
-+_sym:
-+.symver _sym,sym@VERS
-+EOF
-+  cat > conftest.map <<EOF
-+VERS_1 {
-+	global: sym;
-+};
-+
-+VERS_2 {
-+	global: sym;
-+} VERS_1;
-+EOF
-+  if ${CC-cc} -c $ASFLAGS conftest.s 1>&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD; then
-+    if AC_TRY_COMMAND([${CC-cc} $CFLAGS $LDFLAGS -shared
-+                                                 -o conftest.so conftest.o
-+                                                 -Wl,--version-script,conftest.map
-+                       1>&AS_MESSAGE_LOG_FD]);
-+    then
-+      ol_cv_ld_version_script_option=yes
-+    else
-+      ol_cv_ld_version_script_option=no
-+    fi
-+  else
-+    ol_cv_ld_version_script_option=no
-+  fi
-+else
-+  ol_cv_ld_version_script_option=no
-+fi
-+rm -f conftest*])])
---- a/configure.in
-+++ b/configure.in
-@@ -1909,6 +1909,13 @@ else
- fi
- AC_SUBST(LTSTATIC)dnl
- 
-+VERSION_OPTION=""
-+OL_SYMBOL_VERSIONING
-+if test $ol_cv_ld_version_script_option = yes ; then
-+  VERSION_OPTION="-Wl,--version-script="
-+fi
-+AC_SUBST(VERSION_OPTION)
-+
- dnl ----------------------------------------------------------------
- if test $ol_enable_wrappers != no ; then
- 	AC_CHECK_HEADERS(tcpd.h,[
---- /dev/null
-+++ b/libraries/libldap/libldap.map
-@@ -0,0 +1,7 @@
-+OPENLDAP_2.4_2 {
-+  global:
-+    ldap_*;
-+    ldif_*;
-+  local:
-+    *;
-+};
---- a/libraries/libldap/Makefile.in
-+++ b/libraries/libldap/Makefile.in
-@@ -52,6 +52,9 @@ XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(
- XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
- NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
- UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
-+ifneq (,$(VERSION_OPTION))
-+  VERSION_FLAGS = $(VERSION_OPTION)$(srcdir)/libldap.map
-+endif
- 
- apitest:	$(XLIBS) apitest.o
- 	$(LTLINK) -o $@ apitest.o $(LIBS)
---- a/libraries/liblber/Makefile.in
-+++ b/libraries/liblber/Makefile.in
-@@ -38,6 +38,9 @@ XLIBS = $(LIBRARY) $(LDAP_LIBLUTIL_A)
- XXLIBS = 
- NT_LINK_LIBS = $(AC_LIBS)
- UNIX_LINK_LIBS = $(AC_LIBS)
-+ifneq (,$(VERSION_OPTION))
-+  VERSION_FLAGS = "$(VERSION_OPTION)$(srcdir)/liblber.map"
-+endif
- 
- dtest:    $(XLIBS) dtest.o
- 	$(LTLINK) -o $@ dtest.o $(LIBS)
---- /dev/null
-+++ b/libraries/liblber/liblber.map
-@@ -0,0 +1,8 @@
-+OPENLDAP_2.4_2 {
-+  global:
-+    ber_*;
-+    der_alloc;
-+    lutil_*;
-+  local:
-+    *;
-+};
diff --git a/recipes-support/openldap/openldap-2.4.39/man-slapd.patch b/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
deleted file mode 100644
index 5f55137..0000000
--- a/recipes-support/openldap/openldap-2.4.39/man-slapd.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Patch the slapd man page to not refer to a header file that isn't
-installed with the slapd package and to reference the correct path
-for slapd.
-
-Debian-specific.
-
---- a/doc/man/man8/slapd.8
-+++ b/doc/man/man8/slapd.8
-@@ -5,7 +5,7 @@
- .SH NAME
- slapd \- Stand-alone LDAP Daemon
- .SH SYNOPSIS
--.B LIBEXECDIR/slapd 
-+.B /usr/sbin/slapd 
- [\c
- .BR \-4 | \-6 ]
- [\c
-@@ -103,11 +103,10 @@
- will not fork or disassociate from the invoking terminal.  Some general
- operation and status messages are printed for any value of \fIdebug-level\fP.
- \fIdebug-level\fP is taken as a bit string, with each bit corresponding to a
--different kind of debugging information.  See <ldap_log.h> for details.
--Comma-separated arrays of friendly names can be specified to select
--debugging output of the corresponding debugging information.
--All the names recognized by the \fIloglevel\fP directive 
--described in \fBslapd.conf\fP(5) are supported.
-+different kind of debugging information.  Comma-separated arrays of friendly
-+names can be specified to select debugging output of the corresponding
-+debugging information.  All the names recognized by the \fIloglevel\fP
-+directive described in \fBslapd.conf\fP(5) are supported.
- If \fIdebug-level\fP is \fB?\fP, a list of installed debug-levels is printed,
- and slapd exits.
- 
-@@ -317,7 +316,7 @@
- .LP
- .nf
- .ft tt
--	LIBEXECDIR/slapd
-+	/usr/sbin/slapd
- .ft
- .fi
- .LP
-@@ -328,7 +327,7 @@
- .LP
- .nf
- .ft tt
--	LIBEXECDIR/slapd \-f /var/tmp/slapd.conf \-d 255
-+	/usr/sbin/slapd \-f /var/tmp/slapd.conf \-d 255
- .ft
- .fi
- .LP
-@@ -336,7 +335,7 @@
- .LP
- .nf
- .ft tt
--	LIBEXECDIR/slapd \-Tt
-+	/usr/sbin/slapd \-Tt
- .ft
- .fi
- .LP
diff --git a/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch b/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
deleted file mode 100644
index 8e7812d..0000000
--- a/recipes-support/openldap/openldap-2.4.39/no-AM_INIT_AUTOMAKE.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Description: don't use AM_INIT_AUTOMAKE macro when we aren't using automake
- Calling AM_INIT_AUTOMAKE() in configure.in serves no purpose if we're not
- using automake, and it confuses autoreconf.  Use AC_INIT() instead.
-Author: Steve Langasek <vorlon@debian.org>
-
---- a/configure.in
-+++ b/configure.in
-@@ -26,7 +26,8 @@ dnl Configure.in for OpenLDAP
- AC_COPYRIGHT([[Copyright 1998-2014 The OpenLDAP Foundation. All rights reserved.
- Restrictions apply, see COPYRIGHT and LICENSE files.]])
- AC_REVISION([$Id: 81bd528fb5194c83d688db355737b7715448b958 $])
--AC_INIT([OpenLDAP],,[http://www.openldap.org/its/])
-+AC_INIT([OpenLDAP],[$OL_VERSION],[http://www.openldap.org/its/])
-+AC_PROG_MAKE_SET
- m4_define([AC_PACKAGE_BUGREPORT],[<http://www.openldap.org/its/>])
- AC_CONFIG_SRCDIR(build/version.sh)dnl
- dnl ----------------------------------------------------------------
-@@ -69,7 +70,6 @@ dnl Determine host platform
- dnl		we try not to use this for much
- AC_CANONICAL_TARGET([])
- 
--AM_INIT_AUTOMAKE([$OL_PACKAGE],[$OL_VERSION], [no defines])dnl
- AC_SUBST(PACKAGE)dnl
- AC_SUBST(VERSION)dnl
- AC_DEFINE_UNQUOTED(OPENLDAP_PACKAGE,"$PACKAGE",Package)
diff --git a/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch b/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
deleted file mode 100644
index db76aa7..0000000
--- a/recipes-support/openldap/openldap-2.4.39/no-bdb-ABI-second-guessing.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Author: Steve Langasek <vorlon@debian.org>
-Description: don't second-guess BDB ABI
- OpenLDAP upstream conservatively assumes that any change to the version
- number of libdb can result in an API-breaking change that could impact
- the database.  In Debian, we know that such changes require bumping the
- library soname and changing the package name, and demand such rigor from
- our package maintainers even when upstreams don't deliver; so any such
- check in the source code works against the packaging system by forcing
- database upgrades when we know none are required.  Disable this check
- so we rely on the packaging system to do its job.
-Bug-Debian: http://bugs.debian.org/651333
-Forwarded: not-needed
-
---- a/servers/slapd/back-bdb/init.c
-+++ b/servers/slapd/back-bdb/init.c
-@@ -762,7 +762,7 @@ bdb_back_initialize(
- 	bi->bi_controls = controls;
- 
- 	{	/* version check */
--		int major, minor, patch, ver;
-+		int major, minor, patch;
- 		char *version = db_version( &major, &minor, &patch );
- #ifdef HAVE_EBCDIC
- 		char v2[1024];
-@@ -776,17 +776,6 @@ bdb_back_initialize(
- 		version = v2;
- #endif
- 
--		ver = (major << 24) | (minor << 16) | patch;
--		if( ver != DB_VERSION_FULL ) {
--			/* fail if a versions don't match */
--			Debug( LDAP_DEBUG_ANY,
--				LDAP_XSTRING(bdb_back_initialize) ": "
--				"BDB library version mismatch:"
--				" expected " DB_VERSION_STRING ","
--				" got %s\n", version, 0, 0 );
--			return -1;
--		}
--
- 		Debug( LDAP_DEBUG_TRACE, LDAP_XSTRING(bdb_back_initialize)
- 			": %s\n", version, 0, 0 );
- 	}
diff --git a/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch b/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
deleted file mode 100644
index 5ea240f..0000000
--- a/recipes-support/openldap/openldap-2.4.39/sasl-default-path.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Add /etc/ldap/sasl2 to the SASL configuration search path.
-
-Not submitted upstream.  Somewhat Debian-specific and probably not of
-interest upstream.
-
---- a/include/ldap_defaults.h
-+++ b/include/ldap_defaults.h
-@@ -63,4 +63,6 @@
- 	/* dn of the default "monitor" subentry */
- #define SLAPD_MONITOR_DN		"cn=Monitor"
- 
-+#define SASL_CONFIGPATH                        LDAP_SYSCONFDIR LDAP_DIRSEP "sasl2"
-+
- #endif /* _LDAP_CONFIG_H */
---- a/servers/slapd/sasl.c
-+++ b/servers/slapd/sasl.c
-@@ -1103,12 +1103,38 @@ static const rewrite_mapper slapd_mapper
- };
- #endif
- 
-+static int
-+slap_sasl_getconfpath( void * context, char ** path )
-+{
-+	char * sasl_default_configpath;
-+	size_t len;
-+
-+#if SASL_VERSION_MAJOR >= 2
-+	sasl_default_configpath = "/usr/lib/sasl2";
-+#else
-+	sasl_default_configpath = "/usr/lib/sasl";
-+#endif
-+
-+	len = strlen(SASL_CONFIGPATH) + 1 /* colon */ +
-+		strlen(sasl_default_configpath) + 1 /* \0 */;
-+	*path = malloc( len );
-+	if ( *path == NULL )
-+		return SASL_FAIL;
-+
-+	if (snprintf( *path, len, "%s:%s", SASL_CONFIGPATH,
-+				sasl_default_configpath ) != len-1 )
-+		return SASL_FAIL;
-+
-+	return SASL_OK;
-+}
-+
- int slap_sasl_init( void )
- {
- #ifdef HAVE_CYRUS_SASL
- 	int rc;
- 	static sasl_callback_t server_callbacks[] = {
- 		{ SASL_CB_LOG, &slap_sasl_log, NULL },
-+		{ SASL_CB_GETCONFPATH, &slap_sasl_getconfpath, NULL },
- 		{ SASL_CB_GETOPT, &slap_sasl_getopt, NULL },
- 		{ SASL_CB_LIST_END, NULL, NULL }
- 	};
diff --git a/recipes-support/openldap/openldap-2.4.39/series b/recipes-support/openldap/openldap-2.4.39/series
deleted file mode 100644
index 2f47de3..0000000
--- a/recipes-support/openldap/openldap-2.4.39/series
+++ /dev/null
@@ -1,21 +0,0 @@
-man-slapd 
-evolution-ntlm
-slapi-errorlog-file 
-ldapi-socket-place 
-wrong-database-location 
-index-files-created-as-root 
-sasl-default-path 
-libldap-symbol-versions
-getaddrinfo-is-threadsafe
-do-not-second-guess-sonames
-contrib-modules-use-dpkg-buildflags
-smbk5pwd-makefile
-autogroup-makefile
-ldap-conf-tls-cacertdir
-add-tlscacert-option-to-ldap-conf
-fix-ftbfs-binutils-gold
-fix-build-top-mk
-no-AM_INIT_AUTOMAKE
-switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff
-no-bdb-ABI-second-guessing
-heimdal-fix
diff --git a/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch b/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
deleted file mode 100644
index 4899451..0000000
--- a/recipes-support/openldap/openldap-2.4.39/slapi-errorlog-file.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-The slapi error log file defaults to /var/errors given our setting
-of --localstatedir.  Move it to /var/log/slapi-errors instead.
-
-Debian-specific.
-
---- a/servers/slapd/slapi/slapi_overlay.c
-+++ b/servers/slapd/slapi/slapi_overlay.c
-@@ -930,7 +930,7 @@ int slapi_over_config( BackendDB *be, Co
- 		ldap_pvt_thread_mutex_init( &slapi_printmessage_mutex );
- 
- 		if ( slapi_log_file == NULL )
--			slapi_log_file = slapi_ch_strdup( LDAP_RUNDIR LDAP_DIRSEP "errors" );
-+			slapi_log_file = slapi_ch_strdup( LDAP_RUNDIR LDAP_DIRSEP "log" LDAP_DIRSEP "slapi-errors" );
- 
- 		rc = slapi_int_init_object_extensions();
- 		if ( rc != 0 )
diff --git a/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch b/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
deleted file mode 100644
index 17d1b56..0000000
--- a/recipes-support/openldap/openldap-2.4.39/smbk5pwd-makefile.patch
+++ /dev/null
@@ -1,53 +0,0 @@
---- a/contrib/slapd-modules/smbk5pwd/Makefile
-+++ b/contrib/slapd-modules/smbk5pwd/Makefile
-@@ -14,17 +14,17 @@
- 
- LDAP_SRC = ../../..
- LDAP_BUILD = ../../..
--LDAP_INC = -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
--LDAP_LIB = $(LDAP_BUILD)/libraries/libldap_r/libldap_r.la \
--	$(LDAP_BUILD)/libraries/liblber/liblber.la
-+LDAP_INC = -I$(LDAP_BUILD)/debian/build/include -I$(LDAP_BUILD)/debian/build/servers/slapd -I$(LDAP_BUILD)/include -I$(LDAP_SRC)/include -I$(LDAP_SRC)/servers/slapd
-+LDAP_LIB = $(LDAP_BUILD)/debian/build/libraries/libldap_r/libldap_r.la \
-+	$(LDAP_BUILD)/debian/build/libraries/liblber/liblber.la
- 
- SSL_INC = 
--SSL_LIB = -lcrypto
-+SSL_LIB = -lgcrypt
- 
--HEIMDAL_INC = -I/usr/heimdal/include
--HEIMDAL_LIB = -L/usr/heimdal/lib -lkrb5 -lkadm5srv
-+HEIMDAL_INC = -I/usr/include
-+HEIMDAL_LIB = -lkrb5 -lkadm5srv
- 
--LIBTOOL = $(LDAP_BUILD)/libtool
-+LIBTOOL = $(LDAP_BUILD)/debian/build/libtool
- CC = gcc
- OPT = -g -O2 -Wall
- # Omit DO_KRB5, DO_SAMBA or DO_SHADOW if you don't want to support it.
-@@ -35,13 +35,13 @@ LIBS = $(LDAP_LIB) $(HEIMDAL_LIB) $(SSL_
- PROGRAMS = smbk5pwd.la
- LTVER = 0:0:0
- 
--prefix=/usr/local
-+prefix=/usr
- exec_prefix=$(prefix)
--ldap_subdir=/openldap
-+ldap_subdir=/ldap
- 
- libdir=$(exec_prefix)/lib
- libexecdir=$(exec_prefix)/libexec
--moduledir = $(libexecdir)$(ldap_subdir)
-+moduledir = $(libdir)$(ldap_subdir)
- 
- .SUFFIXES: .c .o .lo
- 
-@@ -55,7 +55,7 @@ smbk5pwd.la:	smbk5pwd.lo
- 	-rpath $(moduledir) -module -o $@ $? $(LIBS)
- 
- clean:
--	rm -rf *.o *.lo *.la .libs
-+	$(LIBTOOL) --mode=clean rm -f
- 
- install: $(PROGRAMS)
- 	mkdir -p $(DESTDIR)$(moduledir)
diff --git a/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch b/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
deleted file mode 100644
index df2801f..0000000
--- a/recipes-support/openldap/openldap-2.4.39/switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From: Jan-Marek Glogowski <jan-marek.glogowski@muenchen.de>
-Date: Tue, 18 May 2010 17:47:05 +0200
-Subject: Switch to lt_dlopenadvise() so back_perl can be opened with RTLD_GLOBAL.    
- Open all modules with RTLD_GLOBAL, needed so that back_perl can load
- non-trivial Perl extensions that require symbols from back_perl.so itself.
-Bug-Debian: http://bugs.debian.org/327585
-
----
---- a/servers/slapd/module.c
-+++ b/servers/slapd/module.c
-@@ -117,6 +117,20 @@ int module_unload( const char *file_name
- 	return -1;	/* not found */
- }
- 
-+static lt_dlhandle slapd_lt_dlopenext_global( const char *filename )
-+{
-+	lt_dlhandle handle = 0;
-+	lt_dladvise advise;
-+
-+	if (!lt_dladvise_init (&advise) && !lt_dladvise_ext (&advise)
-+			&& !lt_dladvise_global (&advise))
-+		handle = lt_dlopenadvise (filename, advise);
-+
-+	lt_dladvise_destroy (&advise);
-+
-+	return handle;
-+}
-+
- int module_load(const char* file_name, int argc, char *argv[])
- {
- 	module_loaded_t *module;
-@@ -180,7 +194,7 @@ int module_load(const char* file_name, i
- 	 * to calling Debug. This is because Debug is a macro that expands
- 	 * into multiple function calls.
- 	 */
--	if ((module->lib = lt_dlopenext(file)) == NULL) {
-+	if ((module->lib = slapd_lt_dlopenext_global(file)) == NULL) {
- 		error = lt_dlerror();
- #ifdef HAVE_EBCDIC
- 		strcpy( ebuf, error );
diff --git a/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch b/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
deleted file mode 100644
index 25d96cb..0000000
--- a/recipes-support/openldap/openldap-2.4.39/wrong-database-location.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Move the default slapd database location to /var/lib/ldap instead of
-/var/openldap-data.
-
-Debian-specific.
-
---- a/doc/man/man5/slapd-bdb.5
-+++ b/doc/man/man5/slapd-bdb.5
-@@ -131,7 +131,7 @@ Specify the directory where the BDB file
- associated indexes live.
- A separate directory must be specified for each database.
- The default is
--.BR LOCALSTATEDIR/openldap\-data .
-+.BR LOCALSTATEDIR/lib/ldap .
- .TP
- .B dirtyread
- Allow reads of modified but not yet committed data.
---- a/doc/man/man5/slapd.conf.5
-+++ b/doc/man/man5/slapd.conf.5
-@@ -2007,7 +2007,7 @@ suffix    "dc=our\-domain,dc=com"
- # The database directory MUST exist prior to
- # running slapd AND should only be accessible
- # by the slapd/tools. Mode 0700 recommended.
--directory LOCALSTATEDIR/openldap\-data
-+directory LOCALSTATEDIR/lib/ldap
- # Indices to maintain
- index     objectClass  eq
- index     cn,sn,mail   pres,eq,approx,sub
---- a/include/ldap_defaults.h
-+++ b/include/ldap_defaults.h
-@@ -47,7 +47,7 @@
- 	/* location of the default slapd config file */
- #define SLAPD_DEFAULT_CONFIGFILE	LDAP_SYSCONFDIR LDAP_DIRSEP "slapd.conf"
- #define SLAPD_DEFAULT_CONFIGDIR		LDAP_SYSCONFDIR LDAP_DIRSEP "slapd.d"
--#define SLAPD_DEFAULT_DB_DIR		LDAP_RUNDIR LDAP_DIRSEP "openldap-data"
-+#define SLAPD_DEFAULT_DB_DIR		LDAP_RUNDIR LDAP_DIRSEP "lib" LDAP_DIRSEP "ldap"
- #define SLAPD_DEFAULT_DB_MODE		0600
- #define SLAPD_DEFAULT_UCDATA		LDAP_DATADIR LDAP_DIRSEP "ucdata"
- 	/* default max deref depth for aliases */
---- a/servers/slapd/Makefile.in
-+++ b/servers/slapd/Makefile.in
-@@ -445,9 +445,9 @@ install-conf: FORCE
- 
- install-db-config: FORCE
- 	@-$(MKDIR) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir)
--	@-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/openldap-data
-+	@-$(INSTALL) -m 700 -d $(DESTDIR)$(localstatedir)/lib/ldap
- 	$(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_CONFIG \
--		$(DESTDIR)$(localstatedir)/openldap-data/DB_CONFIG.example
-+		$(DESTDIR)$(localstatedir)/lib/ldap/DB_CONFIG.example
- 	$(INSTALL) $(INSTALLFLAGS) -m 600 $(srcdir)/DB_CONFIG \
- 		$(DESTDIR)$(sysconfdir)/DB_CONFIG.example
- 
---- a/doc/man/man5/slapd-config.5
-+++ b/doc/man/man5/slapd-config.5
-@@ -2051,7 +2051,7 @@ olcSuffix: "dc=our\-domain,dc=com"
- # The database directory MUST exist prior to
- # running slapd AND should only be accessible
- # by the slapd/tools. Mode 0700 recommended.
--olcDbDirectory: LOCALSTATEDIR/openldap\-data
-+olcDbDirectory: LOCALSTATEDIR/lib/ldap
- # Indices to maintain
- olcDbIndex:     objectClass  eq
- olcDbIndex:     cn,sn,mail   pres,eq,approx,sub
---- a/doc/man/man5/slapd-mdb.5
-+++ b/doc/man/man5/slapd-mdb.5
-@@ -52,7 +52,7 @@ Specify the directory where the LMDB fil
- associated indexes live.
- A separate directory must be specified for each database.
- The default is
--.BR LOCALSTATEDIR/openldap\-data .
-+.BR LOCALSTATEDIR/lib/ldap .
- .TP
- \fBenvflags \fR{\fBnosync\fR,\fBnometasync\fR,\fBwritemap\fR,\fBmapasync\fR,\fBnordahead\fR}
- Specify flags for finer-grained control of the LMDB library's operation.
diff --git a/recipes-support/openldap/openldap_2.4.39.bb b/recipes-support/openldap/openldap_2.4.39.bb
deleted file mode 100644
index 3048c8e..0000000
--- a/recipes-support/openldap/openldap_2.4.39.bb
+++ /dev/null
@@ -1,182 +0,0 @@
-# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
-#
-DESCRIPTION = "OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol."
-HOMEPAGE = "http://www.OpenLDAP.org/license.html"
-# The OpenLDAP Public License - see the HOMEPAGE - defines
-# the license.  www.openldap.org claims this is Open Source
-# (see http://www.openldap.org), the license appears to be
-# basically BSD.  opensource.org does not record this license
-# at present (so it is apparently not OSI certified).
-LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f2bdbaa4f50199a00b6de2ca7ec1db05"
-SECTION = "libs"
-
-# patches taken from Debian
-SRC_URI = "\
-    ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz \
-    file://man-slapd.patch \
-    file://evolution-ntlm.patch \
-    file://slapi-errorlog-file.patch \
-    file://ldapi-socket-place.patch \
-    file://wrong-database-location.patch \
-    file://index-files-created-as-root.patch \
-    file://sasl-default-path.patch \
-    file://libldap-symbol-versions.patch \
-    file://getaddrinfo-is-threadsafe.patch \
-    file://do-not-second-guess-sonames.patch \
-    file://contrib-modules-use-dpkg-buildflags.patch \
-    file://smbk5pwd-makefile.patch \
-    file://autogroup-makefile.patch \
-    file://ldap-conf-tls-cacertdir.patch \
-    file://add-tlscacert-option-to-ldap-conf.patch \
-    file://fix-ftbfs-binutils-gold.patch \
-    file://fix-build-top-mk.patch \
-    file://no-AM_INIT_AUTOMAKE.patch \
-    file://switch-to-lt_dlopenadvise-to-get-RTLD_GLOBAL-set.diff.patch \
-    file://no-bdb-ABI-second-guessing.patch \
-    file://heimdal-fix.patch \
-"
-SRC_URI[md5sum] = "b0d5ee4b252c841dec6b332d679cf943"
-SRC_URI[sha256sum] = "8267c87347103fef56b783b24877c0feda1063d3cb85d070e503d076584bf8a7"
-
-DEPENDS = "util-linux groff-native db"
-
-PR = "r0"
-# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
-# installing .so and executables, this fails in cross compilation
-# environments
-SRC_URI += "file://install-strip.patch"
-
-# inherit autotools
-inherit autotools-brokensep
-
-# CV SETTINGS
-# Required to work round AC_FUNC_MEMCMP which gets the wrong answer
-# when cross compiling (should be in site?)
-EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
-
-# CONFIG DEFINITIONS
-# The following is necessary because it cannot be determined for a
-# cross compile automagically.  Select should yield fine on all OE
-# systems...
-EXTRA_OECONF += "--with-yielding-select=yes"
-# Shared libraries are nice...
-EXTRA_OECONF += "--enable-dynamic"
-
-PACKAGECONFIG ??= "openssl modules \
-                   ldap meta monitor null passwd shell proxycache dnssrv \
-		   bdb hdb mdb sasl \
-"
-#--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
-PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls"
-PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
-
-PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
-PACKAGECONFIG[modules] = "lt_cv_dlopen_self=yes --enable-modules,--disable-modules,libtool"
-
-# SLAPD options
-#
-# UNIX crypt(3) passwd support:
-EXTRA_OECONF += "--enable-crypt"
-
-EXTRA_OECONF += "--enable-ipv6"
-
-# SLAPD BACKEND
-#
-# The backend must be set by the configuration.  This controls the
-# required database, the default database, bdb, is turned off but
-# can be turned back on again and it *is* below!  The monitor backend
-# is also disabled.  If you try to change the backends but fail to
-# enable a single one the build will fail in an obvious way.
-#
-# EXTRA_OECONF += "--disable-bdb --disable-hdb --disable-monitor"
-#
-# Backends="bdb dnssrv hdb ldap ldbm meta monitor null passwd perl shell sql"
-#
-# Note that multiple backends can be built.  The ldbm backend requires a
-# build-time choice of database API.  The bdb backend forces this to be
-# DB4.  To use the gdbm (or other) API the Berkely database module must
-# be removed from the build.
-md = "${libexecdir}/openldap"
-#
-#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
-# The Berkely DB is the standard choice.  This version of OpenLDAP requires
-# the version 4 implementation or better.
-PACKAGECONFIG[bdb] = "--enable-bdb=mod,--enable-bdb=no,db"
-
-#--enable-dnssrv       enable dnssrv backend no|yes|mod no
-PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
-
-#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
-# This forces ldbm to use Berkeley too, remove to use gdbm
-PACKAGECONFIG[hdb] = "--enable-hdb=mod,--enable-hdb=no,db"
-
-#--enable-ldap         enable ldap backend no|yes|mod no
-PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
-
-#--enable-ldbm         enable ldbm backend no|yes|mod no
-# ldbm requires further specification of the underlying database API, because
-# bdb is enabled above this must be set to berkeley, however the config
-# defaults this correctly so --with-ldbm-api is *not* set.  The build will
-# fail if bdb is removed, but no database is built to provide the
-# support for ldbm
-# guide.html:<P>back-ldbm was both slow and unreliable. Its byzantine indexing code was prone to spontaneous corruption, as were the underlying database libraries that were commonly used (e.g. GDBM or NDBM). back-bdb and back-hdb are superior in every aspect, with simplified indexing to avoid index corruption, fine-grained locking for greater concurrency, hierarchical caching for greater performance, streamlined on-disk format for greater efficiency and portability, and full transaction support for greater reliability.</P>
-# configure: WARNING: unrecognized options: --disable-silent-rules, --enable-ldbm, --with-ldbm-api
-#PACKAGECONFIG[ldbm] = "--enable-ldbm=mod --with-ldbm-api=gdbm,--enable-ldbm-no,gdbm"
-
-#--enable-meta         enable metadirectory backend no|yes|mod no
-PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
-
-#--enable-monitor      enable monitor backend no|yes|mod yes
-PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
-
-#--enable-null         enable null backend no|yes|mod no
-PACKAGECONFIG[null] = "--enable-null=mod,--enable-null=no,"
-
-#--enable-passwd       enable passwd backend no|yes|mod no
-PACKAGECONFIG[passwd] = "--enable-passwd=mod,--enable-passwd=no,"
-
-# disabling perl support - host contamination issues
-#
-#--enable-perl         enable perl backend no|yes|mod no
-#  This requires a loadable perl dynamic library, if enabled without
-#  doing something appropriate (building perl?) the build will pick
-#  up the build machine perl - not good (inherit perlnative?)
-# PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
-
-#--enable-shell        enable shell backend no|yes|mod no
-# configure: WARNING: Use of --without-threads is recommended with back-shell
-PACKAGECONFIG[shell] = "--enable-shell=mod --without-threads,--enable-shell=no,"
-
-#--enable-sql          enable sql backend no|yes|mod no
-# sql requires some sql backend which provides sql.h, sqlite* provides
-# sqlite.h (which may be compatible but hasn't been tried.)
-PACKAGECONFIG[sql] = "--enable-sql=mod,--enable-sql=no,sqlite3"
-
-#--enable-dyngroup     Dynamic Group overlay no|yes|mod no
-#  This is a demo, Proxy Cache defines init_module which conflicts with the
-#  same symbol in dyngroup
-PACKAGECONFIG[dyngroup] = "--enable-dyngroup=mod,--enable-dyngroup=no,"
-
-#--enable-proxycache   Proxy Cache overlay no|yes|mod no
-PACKAGECONFIG[proxycache] = "--enable-proxycache=mod,--enable-proxycache=no,"
-
-#--enable-mdb         enable mdb database backend no|yes|mod no
-PACKAGECONFIG[mdb] = "--enable-mdb=mod,--enable-mdb=no,"
-
-CPPFLAGS_append = " -D_GNU_SOURCE"
-
-do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
-    rm -f ${S}/libtool
-    rm -f ${S}/libtool
-    aclocal
-    libtoolize --force --copy
-    gnu-configize
-    autoconf
-    oe_runconf
-}
-
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
-FILES_${PN}-dbg += "${libexecdir}/openldap/.debug"
-
-- 
2.7.0


