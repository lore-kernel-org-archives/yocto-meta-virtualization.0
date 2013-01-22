Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C97CE00709
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:47 -0800 (PST)
Received: by mail-ee0-f46.google.com with SMTP id e49so3344648eek.19
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=GWuxkDKiZNqOpK2RFNRz8hzy9tRRlmZo+H0brgIjSp8=;
	b=sAjFXjQ9ovMNRbQOATqT+r6VhjSji7Tj6ldMy9Jgh7Lua/HNrjgzBIX8tk/vyOOfP5
	eTln2W165Ja30cCRgX7D1AEPK1ft5hg9taV3NQ4ihf6MGR3o+QZTucNkaxNYb5tLxu5t
	1G06LT1/ZghUTfpn9zDa5sp/GhczzMjQYX+JEoHLFDr4xrrGbSb1ZuQqxScDPYuJLg5g
	yG77/JsMzX8b7S8yCyzM7uuHnLKYb8oqgWrz9gIhT5R8ul4PJfQSZXcg8IFhTdS57cpm
	/VyBc13ySpByTJdBnpXAs9Be7uDptPeGW7o4BmE2RNbGIGhlluk+QIAYiHe51HwhPtW/
	zkKw==
X-Received: by 10.14.224.199 with SMTP id x47mr72011563eep.19.1358858865807;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id f49sm26893930eep.12.2013.01.22.04.47.43
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:44 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id E0BFF400F2E; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:19 +0100
Message-Id: <1358858841-13339-5-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] Removed ebtables, since it now recides in meta-networking
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../ebtables-2.0.9-2/01debian_defaultconfig.patch  |   50 ------
 .../04compensate-for-missing-aligned-u64.patch     |   16 --
 .../ebtables/ebtables-2.0.9-2/ebtables.init        |  186 --------------------
 .../ebtables-2.0.9-2/installcreatedirs.patch       |   25 ---
 .../ebtables/ebtables-2.0.9-2/installnonroot.patch |   45 -----
 recipes-extended/ebtables/ebtables_2.0.9-2.bb      |   64 -------
 6 files changed, 386 deletions(-)
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-aligned-u64.patch
 delete mode 100755 recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
 delete mode 100644 recipes-extended/ebtables/ebtables_2.0.9-2.bb

diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch b/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
deleted file mode 100644
index c260403..0000000
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-#! /bin/sh /usr/share/dpatch/dpatch-run
-## debian_defaultconfig.dpatch by  <hesso@pool.math.tu-berlin.de>
-##
-## DP: Debian enhancements to the ebtables "sysconfig" default settings.
-
-@DPATCH@
-
---- ebtables-2.0.8.1.orig/ebtables-config
-+++ ebtables-2.0.8.1/ebtables-config
-@@ -1,17 +1,3 @@
--# Save (and possibly restore) in text format.
--#   Value: yes|no,  default: yes
--# Save the firewall rules in text format to __SYSCONFIG__/ebtables
--# If EBTABLES_BINARY_FORMAT="no" then restoring the firewall rules
--# is done using this text format.
--EBTABLES_TEXT_FORMAT="yes"
--
--# Save (and restore) in binary format.
--#   Value: yes|no,  default: yes
--# Save (and restore) the firewall rules in binary format to (and from)
--# __SYSCONFIG__/ebtables.<chain>. Enabling this option will make
--# firewall initialisation a lot faster.
--EBTABLES_BINARY_FORMAT="yes"
--
- # Unload modules on restart and stop
- #   Value: yes|no,  default: yes
- # This option has to be 'yes' to get to a sane state for a firewall
-@@ -19,6 +5,12 @@
- # modules.
- EBTABLES_MODULES_UNLOAD="yes"
- 
-+# Load firewall rules on system startup.
-+#   Value: yes|no,  default: no
-+# Restores the ebtables rulesets from the last saved state when the
-+# system boots up.
-+EBTABLES_LOAD_ON_START="no"
-+
- # Save current firewall rules on stop.
- #   Value: yes|no,  default: no
- # Saves all firewall rules if firewall gets stopped
-@@ -35,3 +27,9 @@
- # Save rule counters when saving a kernel table to a file. If the
- # rule counters were saved, they will be restored when restoring the table.
- EBTABLES_SAVE_COUNTER="no"
-+
-+# Backup suffix for ruleset save files.
-+#   Value: <string>,  default: "~"
-+# Keep one backup level of saved rules.
-+# Set this variable to the empty string to disable backups.
-+EBTABLES_BACKUP_SUFFIX="~"
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-aligned-u64.patch b/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-aligned-u64.patch
deleted file mode 100644
index aae7f4b..0000000
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-aligned-u64.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=661449
-
---- ebtables-2.0.9.2.orig/extensions/ebt_pkttype.c	2010-02-03 21:17:45.000000000 +0000
-+++ ebtables-2.0.9.2/extensions/ebt_pkttype.c	2012-03-03 15:22:57.000000000 +0000
-@@ -12,6 +12,11 @@
- #include <getopt.h>
- #include <netdb.h>
- #include "../include/ebtables_u.h"
-+/* BEGIN: Workaround */
-+#ifndef __aligned_u64
-+#define __aligned_u64 __u64 __attribute__((aligned(8)))
-+#endif
-+/* END: Workaround */
- #include <linux/if_packet.h>
- #include <linux/netfilter_bridge/ebt_pkttype.h>
- 
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init b/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
deleted file mode 100755
index 0044e98..0000000
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
+++ /dev/null
@@ -1,186 +0,0 @@
-#!/bin/sh
-#
-# init script for the Ethernet Bridge filter tables
-#
-# Written by Dag Wieers <dag@wieers.com>
-# Modified by Rok Papez <rok.papez@arnes.si>
-#	     Bart De Schuymer <bdschuym@pandora.be>
-# Adapted to Debian by Jan Christoph Nordholz <hesso@pool.math.tu-berlin.de>
-# Adapted to OpenEmbedded by Roman I Khimov <khimov@altell.ru>
-#
-# chkconfig: - 15 85
-# description: Ethernet Bridge filtering tables
-#
-### BEGIN INIT INFO
-# Provides:		ebtables
-# Required-Start:	
-# Required-Stop:	
-# Should-Start:		$local_fs
-# Should-Stop:		$local_fs
-# Default-Start:	S
-# Default-Stop:		0 6
-# Short-Description:	ebtables ruleset management
-# Description:		Saves and restores the state of the ebtables rulesets.
-### END INIT INFO
-
-[ -x /sbin/ebtables ] || exit 1
-
-EBTABLES_DUMPFILE_STEM=/etc/ebtables/dump
-
-RETVAL=0
-prog="ebtables"
-desc="Ethernet bridge filtering"
-umask 0077
-
-#default configuration
-EBTABLES_MODULES_UNLOAD="yes"
-EBTABLES_LOAD_ON_START="no"
-EBTABLES_SAVE_ON_STOP="no"
-EBTABLES_SAVE_ON_RESTART="no"
-EBTABLES_SAVE_COUNTER="no"
-EBTABLES_BACKUP_SUFFIX="~"
-
-config=/etc/default/$prog
-[ -f "$config" ] && . "$config"
-
-function get_supported_tables() {
-	EBTABLES_SUPPORTED_TABLES=
-	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
-	if [ $? -eq 0 ]; then
-		echo "Error: insufficient privileges to access the ebtables rulesets."
-		exit 1
-	fi
-	for table in filter nat broute; do
-		/sbin/ebtables -t $table -L &> /dev/null
-		if [ $? -eq 0 ]; then
-			EBTABLES_SUPPORTED_TABLES="${EBTABLES_SUPPORTED_TABLES} $table"
-		fi
-	done
-}
-
-function load() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Restoring ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
-			/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
-			RET=$?
-			if [ $RET -ne 0 ]; then
-				echo -n "(failed) "
-				RETVAL=$RET
-			fi
-		else
-			echo -n "(no saved state) "
-		fi
-	done
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-function clear() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Clearing ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		/sbin/ebtables -t $table --init-table
-	done
-
-	if [ "$EBTABLES_MODULES_UNLOAD" = "yes" ]; then
-		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) ebtables; do
-			rmmod $mod 2> /dev/null
-		done
-	fi
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-function save() {
-	RETVAL=0
-	get_supported_tables
-	echo -n "Saving ebtables rulesets: "
-	for table in $EBTABLES_SUPPORTED_TABLES; do
-		echo -n "$table "
-		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] && \
-		  mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
-		/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
-		RET=$?
-		if [ $RET -ne 0 ]; then
-			echo -n "(failed) "
-			RETVAL=$RET
-		else
-			if [ "$EBTABLES_SAVE_COUNTER" = "no" ]; then
-				/sbin/ebtables -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z
-			fi
-		fi
-	done
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo -n "no kernel support. "
-	else
-		echo -n "done. "
-	fi
-	if [ $RETVAL -eq 0 ]; then
-		echo "ok"
-	else
-		echo "fail"
-	fi
-}
-
-case "$1" in
-  start)
-	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
-	;;
-  stop)
-	[ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
-	clear
-	;;
-  restart|reload|force-reload)
-	[ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
-	clear
-	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
-	;;
-  load)
-	load
-	;;
-  save)
-	save
-	;;
-  status)
-	get_supported_tables
-	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
-		echo "No kernel support for ebtables."
-		RETVAL=1
-	else
-		echo -n "Ebtables support available, number of installed rules: "
-		for table in $EBTABLES_SUPPORTED_TABLES; do
-			COUNT=$(( $(/sbin/ebtables -t $table -L | sed -e "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
-			echo -n "$table($COUNT) "
-		done
-		echo ok
-		RETVAL=0
-	fi
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status}" >&2
-	RETVAL=1
-esac
-
-exit $RETVAL
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch b/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
deleted file mode 100644
index 86bc4f0..0000000
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- ebtables-v2.0.6/Makefile~installcreatedirs	2004-06-03 13:34:17.000000000 -0500
-+++ ebtables-v2.0.6/Makefile	2004-06-03 13:35:21.000000000 -0500
-@@ -47,14 +47,17 @@
- 
- $(MANDIR)/man8/ebtables.8: ebtables.8
- 	mkdir -p $(@D)
-+	install -d $(MANDIR)/man8
- 	install -m 0644 $(INSTALLOWN) $< $@
- 
- $(ETHERTYPESFILE): ethertypes
- 	mkdir -p $(@D)
-+	install -d $(ETHERTYPESPATH)
- 	install -m 0644 $(INSTALLOWN) $< $@
- 
- .PHONY: exec
- exec: ebtables
-+	install -d $(BINPATH)
- 	install -m 0755 $(INSTALLOWN) $< $(BINFILE)
- 
- .PHONY: install
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch b/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
deleted file mode 100644
index 4d42cc0..0000000
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
-Index: ebtables-v2.0.9-2/Makefile
-===================================================================
---- ebtables-v2.0.9-2.orig/Makefile	2010-02-04 00:17:45.000000000 +0300
-+++ ebtables-v2.0.9-2/Makefile	2010-05-24 16:15:35.000000000 +0400
-@@ -154,28 +154,28 @@
- .PHONY: scripts
- scripts: ebtables-save ebtables.sysv ebtables-config
- 	cat ebtables-save | sed 's/__EXEC_PATH__/$(tmp1)/g' > ebtables-save_
--	install -m 0755 -o root -g root ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
-+	install -m 0755 ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
- 	cat ebtables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > ebtables.sysv_
--	install -m 0755 -o root -g root ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables
-+	install -m 0755 ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables
- 	cat ebtables-config | sed 's/__SYSCONFIG__/$(tmp2)/g' > ebtables-config_
--	install -m 0600 -o root -g root ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config
-+	install -m 0600 ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config
- 	rm -f ebtables-save_ ebtables.sysv_ ebtables-config_
- 
- $(MANDIR)/man8/ebtables.8: ebtables.8
- 	mkdir -p $(DESTDIR)$(@D)
- 	sed 's/$$(VERSION)/$(PROGVERSION)/' ebtables.8 | sed 's/$$(DATE)/$(PROGDATE)/' > ebtables.8_
--	install -m 0644 -o root -g root ebtables.8_ $(DESTDIR)$@
-+	install -m 0644 ebtables.8_ $(DESTDIR)$@
- 	rm -f ebtables.8_
- 
- $(ETHERTYPESFILE): ethertypes
- 	mkdir -p $(DESTDIR)$(@D)
--	install -m 0644 -o root -g root $< $(DESTDIR)$@
-+	install -m 0644 $< $(DESTDIR)$@
- 
- .PHONY: exec
- exec: ebtables ebtables-restore
- 	mkdir -p $(DESTDIR)$(BINDIR)
--	install -m 0755 -o root -g root $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
--	install -m 0755 -o root -g root ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
-+	install -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
-+	install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
- 
- .PHONY: install
- install: $(MANDIR)/man8/ebtables.8 $(ETHERTYPESFILE) exec scripts
diff --git a/recipes-extended/ebtables/ebtables_2.0.9-2.bb b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
deleted file mode 100644
index 66c7b95..0000000
--- a/recipes-extended/ebtables/ebtables_2.0.9-2.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-DESCRIPTION = "Utility that enables basic Ethernet frame filtering on a Linux bridge, MAC NAT and brouting."
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-SECTION = "console/network"
-PR = "r2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-SRC_URI = " \
-	${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
-	file://installnonroot.patch \
-	file://01debian_defaultconfig.patch \
-	file://04compensate-for-missing-aligned-u64.patch \
-	file://ebtables.init \
-	"
-
-SRC_URI[md5sum] = "b880429a6424186728eb57ae80ef878a"
-SRC_URI[sha256sum] = "98855f644d43c615a8e663197978e49c95642f46f2bbf8e6f3213af87f8ad6a3"
-
-S = "${WORKDIR}/ebtables-v${PV}"
-
-ASNEEDED_pn-${PN} = ""
-
-#Load the necessary kernel modules
-RRECOMMENDS_${PN} += "kernel-module-ebtables \
-                     kernel-module-ebtable-nat \
-                     kernel-module-ebtable-filter \
-                     kernel-module-ebtable_broute \
-                     "
-
-EXTRA_OEMAKE = " \
-	BINDIR=${base_sbindir} \
-	MANDIR=${mandir} \
-	ETHERTYPESPATH=${sysconfdir} \
-	INITDIR=${sysconfdir}/init.d \
-	SYSCONFIGDIR=${sysconfdir}/default \
-	LIBDIR=${base_libdir}/ebtables \
-	'CC=${CC}' \
-	'CFLAGS=${CFLAGS}' \
-	'LD=${LD}' \
-	"
-
-do_install () {
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/ebtables
-	install -d ${D}/sbin
-	oe_runmake DESTDIR='${D}' install
-	install -m 0755 ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/init.d/ebtables
-	mv ${D}${sysconfdir}/default/ebtables-config ${D}${sysconfdir}/default/ebtables
-}
-
-CONFFILES_${PN} += "${sysconfdir}/default/ebtables"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "ebtables"
-INITSCRIPT_PARAMS = "start 41 S . stop 41 6 ."
-
-FILES_${PN}-dbg += "${base_libdir}/ebtables/.debug"
-FILES_${PN} += "${base_libdir}/ebtables/*.so"
-
-RDEPENDS_${PN} = " perl"
-- 
1.7.9.5


