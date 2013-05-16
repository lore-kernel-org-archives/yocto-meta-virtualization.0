Return-Path: <b43198@az84smr01.freescale.net>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe002.messaging.microsoft.com [65.55.88.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94725E014F7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 02:09:56 -0700 (PDT)
Received: from mail45-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Thu, 16 May 2013 09:09:54 +0000
Received: from mail45-tx2 (localhost [127.0.0.1])	by mail45-tx2-R.bigfish.com
	(Postfix) with ESMTP id DB9014A0A74	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 09:09:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail45-tx2 (localhost.localdomain [127.0.0.1]) by mail45-tx2
	(MessageSwitch) id 1368695392208226_19265;
	Thu, 16 May 2013 09:09:52 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.232])	by
	mail45-tx2.bigfish.com (Postfix) with ESMTP id 268C72A0060	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 09:09:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 16 May 2013 09:09:48 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 16 May 2013 09:10:15 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r4G99lae011506;	Thu, 16 May 2013 02:09:47 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r4G99jw1023169;
	Thu, 16 May 2013 12:09:45 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 May 2013 12:09:44 +0300
Message-ID: <1368695384-23136-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH] busybox awk: make -F STR interpret escape sequences
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
X-List-Received-Date: Thu, 16 May 2013 09:09:56 -0000
Content-Type: text/plain

Patch implements functionality mentioned in the title and has
been applied to busybox 1.21.0. This patch is included into the
meta-virtualization layer since it provides awk functionality to
the lxc-clone command in the lxc containers package.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 recipes-core/busybox/busybox_1.20.2.bbappend       |  4 +-
 .../busybox-awk-make--F-STR-interpret-escape.patch | 90 ++++++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch

diff --git a/recipes-core/busybox/busybox_1.20.2.bbappend b/recipes-core/busybox/busybox_1.20.2.bbappend
index 43b3524..b04339a 100644
--- a/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}/${MACHINE}:${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${PN}-${PV}:${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}_${PV}:${THISDIR}/${PN}-${PV}/${MACHINE}:${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${PN}-${PV}:${THISDIR}/${PN}:"
+
+SRC_URI += "file://busybox-awk-make--F-STR-interpret-escape.patch"
diff --git a/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch b/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch
new file mode 100644
index 0000000..e6a9d7a
--- /dev/null
+++ b/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch
@@ -0,0 +1,90 @@
+From ea664dde87d8e52df7d4003d988352a66562a945 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 22 Jun 2012 16:41:01 +0000
+Subject: awk: make -F STR interpret escape sequences. Closes 5126
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+diff --git a/editors/awk.c b/editors/awk.c
+index 71abca2..d69720d 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -696,6 +696,10 @@ static char nextchar(char **s)
+ 	pps = *s;
+ 	if (c == '\\')
+ 		c = bb_process_escape_sequence((const char**)s);
++	/* Example awk statement:
++	 * s = "abc\"def"
++	 * we must treat \" as "
++	 */
+ 	if (c == '\\' && *s == pps) { /* unrecognized \z? */
+ 		c = *(*s); /* yes, fetch z */
+ 		if (c)
+@@ -704,6 +708,15 @@ static char nextchar(char **s)
+ 	return c;
+ }
+ 
++/* TODO: merge with strcpy_and_process_escape_sequences()?
++ */
++static void unescape_string_in_place(char *s1)
++{
++	char *s = s1;
++	while ((*s1 = nextchar(&s)) != '\0')
++		s1++;
++}
++
+ static ALWAYS_INLINE int isalnum_(int c)
+ {
+ 	return (isalnum(c) || c == '_');
+@@ -2992,7 +3005,7 @@ static int awk_exit(int r)
+  * otherwise return 0 */
+ static int is_assignment(const char *expr)
+ {
+-	char *exprc, *val, *s, *s1;
++	char *exprc, *val;
+ 
+ 	if (!isalnum_(*expr) || (val = strchr(expr, '=')) == NULL) {
+ 		return FALSE;
+@@ -3002,10 +3015,7 @@ static int is_assignment(const char *expr)
+ 	val = exprc + (val - expr);
+ 	*val++ = '\0';
+ 
+-	s = s1 = val;
+-	while ((*s1 = nextchar(&s)) != '\0')
+-		s1++;
+-
++	unescape_string_in_place(val);
+ 	setvar_u(newvar(exprc), val);
+ 	free(exprc);
+ 	return TRUE;
+@@ -3118,8 +3128,10 @@ int awk_main(int argc, char **argv)
+ 	opt = getopt32(argv, "F:v:f:W:", &opt_F, &list_v, &list_f, NULL);
+ 	argv += optind;
+ 	argc -= optind;
+-	if (opt & 0x1)
+-		setvar_s(intvar[FS], opt_F); // -F
++	if (opt & 0x1) { /* -F */
++		unescape_string_in_place(opt_F);
++		setvar_s(intvar[FS], opt_F);
++	}
+ 	while (list_v) { /* -v */
+ 		if (!is_assignment(llist_pop(&list_v)))
+ 			bb_show_usage();
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index e671907..d4c390d 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -43,6 +43,11 @@ testing "awk long field sep" "awk -F-- '{ print NF, length(\$NF), \$NF }'" \
+ 	"" \
+ 	"a--\na--b--\na--b--c--\na--b--c--d--"
+ 
++testing "awk -F handles escapes" "awk -F'\\x21' '{print \$1}'" \
++	"a\n" \
++	"" \
++	"a!b\n"
++
+ # '@(samp|code|file)\{' is an invalid extended regex (unmatched '{'),
+ # but gawk 3.1.5 does not bail out on it.
+ testing "awk gsub falls back to non-extended-regex" \
+--
+cgit v0.9.1
-- 
1.7.11.7



