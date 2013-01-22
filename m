Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1877E00709
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 06:43:46 -0800 (PST)
Received: by mail-la0-f45.google.com with SMTP id er20so2010946lab.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 06:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=jwBB6DpwZLykfzfDLcV+BOvxZATjVMeFPAhfltYZXYc=;
	b=dzDGWLfQysq1DEeVr5hnn+UWR51eDd9r5AheEXhSSQ4M3IsYI+sQBreWBHVMeHoW1X
	IAI+IK+9LUnGUH7VQY/Ffz0eC5SsmQuNawhWKnuT8IGPGY10b9sTpFBdbECjZKVL2Rlb
	1XV4wk6oWsvZ/BzVZZI9iNo5pEEG0n5MLjQvhUGb86OK83zNwC1oORc0go82BI+JKb0a
	J/J03G6qkqL+43Xf3M/mD43s5bbUGCFWMUNAtZWIAmclkYEyujbH+an9PSB6H76zLzN0
	c66qKnSocyty/wpwhO7q+bToiRB/FvWN0Wqb3z5K64YwkBFr53AMBq7SuLep3mv+Ftbn
	1Dcw==
MIME-Version: 1.0
X-Received: by 10.112.10.232 with SMTP id l8mr9357323lbb.69.1358865824974;
	Tue, 22 Jan 2013 06:43:44 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Tue, 22 Jan 2013 06:43:44 -0800 (PST)
In-Reply-To: <1358858841-13339-5-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
	<1358858841-13339-5-git-send-email-david.nystrom@enea.com>
Date: Tue, 22 Jan 2013 09:43:44 -0500
Message-ID: <CADkTA4OGF8f7FCTsK9roDPaTcCafM01qhq4XM36T8ZT9tdi19w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
X-Mailman-Approved-At: Wed, 23 Jan 2013 00:44:08 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/6] Removed ebtables, since it now recides in meta-networking
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
X-List-Received-Date: Tue, 22 Jan 2013 14:43:47 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe3380cb885e04d3e19aa1

--e0cb4efe3380cb885e04d3e19aa1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Minor 'nit:

s/recides/resides/

Bruce


On Tue, Jan 22, 2013 at 7:47 AM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  .../ebtables-2.0.9-2/01debian_defaultconfig.patch  |   50 ------
>  .../04compensate-for-missing-aligned-u64.patch     |   16 --
>  .../ebtables/ebtables-2.0.9-2/ebtables.init        |  186
> --------------------
>  .../ebtables-2.0.9-2/installcreatedirs.patch       |   25 ---
>  .../ebtables/ebtables-2.0.9-2/installnonroot.patch |   45 -----
>  recipes-extended/ebtables/ebtables_2.0.9-2.bb      |   64 -------
>  6 files changed, 386 deletions(-)
>  delete mode 100644
> recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
>  delete mode 100644
> recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-align=
ed-u64.patch
>  delete mode 100755
> recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
>  delete mode 100644
> recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
>  delete mode 100644
> recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
>  delete mode 100644 recipes-extended/ebtables/ebtables_2.0.9-2.bb
>
> diff --git
> a/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
> b/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
> deleted file mode 100644
> index c260403..0000000
> ---
> a/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -#! /bin/sh /usr/share/dpatch/dpatch-run
> -## debian_defaultconfig.dpatch by  <hesso@pool.math.tu-berlin.de>
> -##
> -## DP: Debian enhancements to the ebtables "sysconfig" default settings.
> -
> -@DPATCH@
> -
> ---- ebtables-2.0.8.1.orig/ebtables-config
> -+++ ebtables-2.0.8.1/ebtables-config
> -@@ -1,17 +1,3 @@
> --# Save (and possibly restore) in text format.
> --#   Value: yes|no,  default: yes
> --# Save the firewall rules in text format to __SYSCONFIG__/ebtables
> --# If EBTABLES_BINARY_FORMAT=3D"no" then restoring the firewall rules
> --# is done using this text format.
> --EBTABLES_TEXT_FORMAT=3D"yes"
> --
> --# Save (and restore) in binary format.
> --#   Value: yes|no,  default: yes
> --# Save (and restore) the firewall rules in binary format to (and from)
> --# __SYSCONFIG__/ebtables.<chain>. Enabling this option will make
> --# firewall initialisation a lot faster.
> --EBTABLES_BINARY_FORMAT=3D"yes"
> --
> - # Unload modules on restart and stop
> - #   Value: yes|no,  default: yes
> - # This option has to be 'yes' to get to a sane state for a firewall
> -@@ -19,6 +5,12 @@
> - # modules.
> - EBTABLES_MODULES_UNLOAD=3D"yes"
> -
> -+# Load firewall rules on system startup.
> -+#   Value: yes|no,  default: no
> -+# Restores the ebtables rulesets from the last saved state when the
> -+# system boots up.
> -+EBTABLES_LOAD_ON_START=3D"no"
> -+
> - # Save current firewall rules on stop.
> - #   Value: yes|no,  default: no
> - # Saves all firewall rules if firewall gets stopped
> -@@ -35,3 +27,9 @@
> - # Save rule counters when saving a kernel table to a file. If the
> - # rule counters were saved, they will be restored when restoring the
> table.
> - EBTABLES_SAVE_COUNTER=3D"no"
> -+
> -+# Backup suffix for ruleset save files.
> -+#   Value: <string>,  default: "~"
> -+# Keep one backup level of saved rules.
> -+# Set this variable to the empty string to disable backups.
> -+EBTABLES_BACKUP_SUFFIX=3D"~"
> diff --git
> a/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-ali=
gned-u64.patch
> b/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-ali=
gned-u64.patch
> deleted file mode 100644
> index aae7f4b..0000000
> ---
> a/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-ali=
gned-u64.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D661449
> -
> ---- ebtables-2.0.9.2.orig/extensions/ebt_pkttype.c     2010-02-03
> 21:17:45.000000000 +0000
> -+++ ebtables-2.0.9.2/extensions/ebt_pkttype.c  2012-03-03
> 15:22:57.000000000 +0000
> -@@ -12,6 +12,11 @@
> - #include <getopt.h>
> - #include <netdb.h>
> - #include "../include/ebtables_u.h"
> -+/* BEGIN: Workaround */
> -+#ifndef __aligned_u64
> -+#define __aligned_u64 __u64 __attribute__((aligned(8)))
> -+#endif
> -+/* END: Workaround */
> - #include <linux/if_packet.h>
> - #include <linux/netfilter_bridge/ebt_pkttype.h>
> -
> diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
> b/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
> deleted file mode 100755
> index 0044e98..0000000
> --- a/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
> +++ /dev/null
> @@ -1,186 +0,0 @@
> -#!/bin/sh
> -#
> -# init script for the Ethernet Bridge filter tables
> -#
> -# Written by Dag Wieers <dag@wieers.com>
> -# Modified by Rok Papez <rok.papez@arnes.si>
> -#           Bart De Schuymer <bdschuym@pandora.be>
> -# Adapted to Debian by Jan Christoph Nordholz <
> hesso@pool.math.tu-berlin.de>
> -# Adapted to OpenEmbedded by Roman I Khimov <khimov@altell.ru>
> -#
> -# chkconfig: - 15 85
> -# description: Ethernet Bridge filtering tables
> -#
> -### BEGIN INIT INFO
> -# Provides:            ebtables
> -# Required-Start:
> -# Required-Stop:
> -# Should-Start:                $local_fs
> -# Should-Stop:         $local_fs
> -# Default-Start:       S
> -# Default-Stop:                0 6
> -# Short-Description:   ebtables ruleset management
> -# Description:         Saves and restores the state of the ebtables
> rulesets.
> -### END INIT INFO
> -
> -[ -x /sbin/ebtables ] || exit 1
> -
> -EBTABLES_DUMPFILE_STEM=3D/etc/ebtables/dump
> -
> -RETVAL=3D0
> -prog=3D"ebtables"
> -desc=3D"Ethernet bridge filtering"
> -umask 0077
> -
> -#default configuration
> -EBTABLES_MODULES_UNLOAD=3D"yes"
> -EBTABLES_LOAD_ON_START=3D"no"
> -EBTABLES_SAVE_ON_STOP=3D"no"
> -EBTABLES_SAVE_ON_RESTART=3D"no"
> -EBTABLES_SAVE_COUNTER=3D"no"
> -EBTABLES_BACKUP_SUFFIX=3D"~"
> -
> -config=3D/etc/default/$prog
> -[ -f "$config" ] && . "$config"
> -
> -function get_supported_tables() {
> -       EBTABLES_SUPPORTED_TABLES=3D
> -       /sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
> -       if [ $? -eq 0 ]; then
> -               echo "Error: insufficient privileges to access the
> ebtables rulesets."
> -               exit 1
> -       fi
> -       for table in filter nat broute; do
> -               /sbin/ebtables -t $table -L &> /dev/null
> -               if [ $? -eq 0 ]; then
> -
> EBTABLES_SUPPORTED_TABLES=3D"${EBTABLES_SUPPORTED_TABLES} $table"
> -               fi
> -       done
> -}
> -
> -function load() {
> -       RETVAL=3D0
> -       get_supported_tables
> -       echo -n "Restoring ebtables rulesets: "
> -       for table in $EBTABLES_SUPPORTED_TABLES; do
> -               echo -n "$table "
> -               if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
> -                       /sbin/ebtables -t $table --atomic-file
> ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
> -                       RET=3D$?
> -                       if [ $RET -ne 0 ]; then
> -                               echo -n "(failed) "
> -                               RETVAL=3D$RET
> -                       fi
> -               else
> -                       echo -n "(no saved state) "
> -               fi
> -       done
> -       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -               echo -n "no kernel support. "
> -       else
> -               echo -n "done. "
> -       fi
> -       if [ $RETVAL -eq 0 ]; then
> -               echo "ok"
> -       else
> -               echo "fail"
> -       fi
> -}
> -
> -function clear() {
> -       RETVAL=3D0
> -       get_supported_tables
> -       echo -n "Clearing ebtables rulesets: "
> -       for table in $EBTABLES_SUPPORTED_TABLES; do
> -               echo -n "$table "
> -               /sbin/ebtables -t $table --init-table
> -       done
> -
> -       if [ "$EBTABLES_MODULES_UNLOAD" =3D "yes" ]; then
> -               for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cu=
t
> -d' ' -f1) ebtables; do
> -                       rmmod $mod 2> /dev/null
> -               done
> -       fi
> -       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -               echo -n "no kernel support. "
> -       else
> -               echo -n "done. "
> -       fi
> -       if [ $RETVAL -eq 0 ]; then
> -               echo "ok"
> -       else
> -               echo "fail"
> -       fi
> -}
> -
> -function save() {
> -       RETVAL=3D0
> -       get_supported_tables
> -       echo -n "Saving ebtables rulesets: "
> -       for table in $EBTABLES_SUPPORTED_TABLES; do
> -               echo -n "$table "
> -               [ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s
> ${EBTABLES_DUMPFILE_STEM}.$table ] && \
> -                 mv ${EBTABLES_DUMPFILE_STEM}.$table
> ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
> -               /sbin/ebtables -t $table --atomic-file
> ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
> -               RET=3D$?
> -               if [ $RET -ne 0 ]; then
> -                       echo -n "(failed) "
> -                       RETVAL=3D$RET
> -               else
> -                       if [ "$EBTABLES_SAVE_COUNTER" =3D "no" ]; then
> -                               /sbin/ebtables -t $table --atomic-file
> ${EBTABLES_DUMPFILE_STEM}.$table -Z
> -                       fi
> -               fi
> -       done
> -       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -               echo -n "no kernel support. "
> -       else
> -               echo -n "done. "
> -       fi
> -       if [ $RETVAL -eq 0 ]; then
> -               echo "ok"
> -       else
> -               echo "fail"
> -       fi
> -}
> -
> -case "$1" in
> -  start)
> -       [ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
> -       ;;
> -  stop)
> -       [ "$EBTABLES_SAVE_ON_STOP" =3D "yes" ] && save
> -       clear
> -       ;;
> -  restart|reload|force-reload)
> -       [ "$EBTABLES_SAVE_ON_RESTART" =3D "yes" ] && save
> -       clear
> -       [ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
> -       ;;
> -  load)
> -       load
> -       ;;
> -  save)
> -       save
> -       ;;
> -  status)
> -       get_supported_tables
> -       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
> -               echo "No kernel support for ebtables."
> -               RETVAL=3D1
> -       else
> -               echo -n "Ebtables support available, number of installed
> rules: "
> -               for table in $EBTABLES_SUPPORTED_TABLES; do
> -                       COUNT=3D$(( $(/sbin/ebtables -t $table -L | sed -=
e
> "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
> -                       echo -n "$table($COUNT) "
> -               done
> -               echo ok
> -               RETVAL=3D0
> -       fi
> -       ;;
> -  *)
> -       echo "Usage: $0
> {start|stop|restart|reload|force-reload|load|save|status}" >&2
> -       RETVAL=3D1
> -esac
> -
> -exit $RETVAL
> diff --git
> a/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
> b/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
> deleted file mode 100644
> index 86bc4f0..0000000
> --- a/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> ---- ebtables-v2.0.6/Makefile~installcreatedirs 2004-06-03
> 13:34:17.000000000 -0500
> -+++ ebtables-v2.0.6/Makefile   2004-06-03 13:35:21.000000000 -0500
> -@@ -47,14 +47,17 @@
> -
> - $(MANDIR)/man8/ebtables.8: ebtables.8
> -       mkdir -p $(@D)
> -+      install -d $(MANDIR)/man8
> -       install -m 0644 $(INSTALLOWN) $< $@
> -
> - $(ETHERTYPESFILE): ethertypes
> -       mkdir -p $(@D)
> -+      install -d $(ETHERTYPESPATH)
> -       install -m 0644 $(INSTALLOWN) $< $@
> -
> - .PHONY: exec
> - exec: ebtables
> -+      install -d $(BINPATH)
> -       install -m 0755 $(INSTALLOWN) $< $(BINFILE)
> -
> - .PHONY: install
> diff --git
> a/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
> b/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
> deleted file mode 100644
> index 4d42cc0..0000000
> --- a/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> -Index: ebtables-v2.0.9-2/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ebtables-v2.0.9-2.orig/Makefile    2010-02-04 00:17:45.000000000 +03=
00
> -+++ ebtables-v2.0.9-2/Makefile 2010-05-24 16:15:35.000000000 +0400
> -@@ -154,28 +154,28 @@
> - .PHONY: scripts
> - scripts: ebtables-save ebtables.sysv ebtables-config
> -       cat ebtables-save | sed 's/__EXEC_PATH__/$(tmp1)/g' >
> ebtables-save_
> --      install -m 0755 -o root -g root ebtables-save_
> $(DESTDIR)$(BINDIR)/ebtables-save
> -+      install -m 0755 ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-save
> -       cat ebtables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed
> 's/__SYSCONFIG__/$(tmp2)/g' > ebtables.sysv_
> --      install -m 0755 -o root -g root ebtables.sysv_
> $(DESTDIR)$(INITDIR)/ebtables
> -+      install -m 0755 ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables
> -       cat ebtables-config | sed 's/__SYSCONFIG__/$(tmp2)/g' >
> ebtables-config_
> --      install -m 0600 -o root -g root ebtables-config_
> $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config
> -+      install -m 0600 ebtables-config_
> $(DESTDIR)$(SYSCONFIGDIR)/ebtables-config
> -       rm -f ebtables-save_ ebtables.sysv_ ebtables-config_
> -
> - $(MANDIR)/man8/ebtables.8: ebtables.8
> -       mkdir -p $(DESTDIR)$(@D)
> -       sed 's/$$(VERSION)/$(PROGVERSION)/' ebtables.8 | sed
> 's/$$(DATE)/$(PROGDATE)/' > ebtables.8_
> --      install -m 0644 -o root -g root ebtables.8_ $(DESTDIR)$@
> -+      install -m 0644 ebtables.8_ $(DESTDIR)$@
> -       rm -f ebtables.8_
> -
> - $(ETHERTYPESFILE): ethertypes
> -       mkdir -p $(DESTDIR)$(@D)
> --      install -m 0644 -o root -g root $< $(DESTDIR)$@
> -+      install -m 0644 $< $(DESTDIR)$@
> -
> - .PHONY: exec
> - exec: ebtables ebtables-restore
> -       mkdir -p $(DESTDIR)$(BINDIR)
> --      install -m 0755 -o root -g root $(PROGNAME)
> $(DESTDIR)$(BINDIR)/$(PROGNAME)
> --      install -m 0755 -o root -g root ebtables-restore
> $(DESTDIR)$(BINDIR)/ebtables-restore
> -+      install -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)
> -+      install -m 0755 ebtables-restore
> $(DESTDIR)$(BINDIR)/ebtables-restore
> -
> - .PHONY: install
> - install: $(MANDIR)/man8/ebtables.8 $(ETHERTYPESFILE) exec scripts
> diff --git a/recipes-extended/ebtables/ebtables_2.0.9-2.bbb/recipes-exten=
ded/ebtables/
> ebtables_2.0.9-2.bb
> deleted file mode 100644
> index 66c7b95..0000000
> --- a/recipes-extended/ebtables/ebtables_2.0.9-2.bb
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -DESCRIPTION =3D "Utility that enables basic Ethernet frame filtering on =
a
> Linux bridge, MAC NAT and brouting."
> -PRIORITY =3D "optional"
> -LICENSE =3D "GPLv2"
> -SECTION =3D "console/network"
> -PR =3D "r2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e=
73e"
> -
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -
> -SRC_URI =3D " \
> -       ${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
> -       file://installnonroot.patch \
> -       file://01debian_defaultconfig.patch \
> -       file://04compensate-for-missing-aligned-u64.patch \
> -       file://ebtables.init \
> -       "
> -
> -SRC_URI[md5sum] =3D "b880429a6424186728eb57ae80ef878a"
> -SRC_URI[sha256sum] =3D
> "98855f644d43c615a8e663197978e49c95642f46f2bbf8e6f3213af87f8ad6a3"
> -
> -S =3D "${WORKDIR}/ebtables-v${PV}"
> -
> -ASNEEDED_pn-${PN} =3D ""
> -
> -#Load the necessary kernel modules
> -RRECOMMENDS_${PN} +=3D "kernel-module-ebtables \
> -                     kernel-module-ebtable-nat \
> -                     kernel-module-ebtable-filter \
> -                     kernel-module-ebtable_broute \
> -                     "
> -
> -EXTRA_OEMAKE =3D " \
> -       BINDIR=3D${base_sbindir} \
> -       MANDIR=3D${mandir} \
> -       ETHERTYPESPATH=3D${sysconfdir} \
> -       INITDIR=3D${sysconfdir}/init.d \
> -       SYSCONFIGDIR=3D${sysconfdir}/default \
> -       LIBDIR=3D${base_libdir}/ebtables \
> -       'CC=3D${CC}' \
> -       'CFLAGS=3D${CFLAGS}' \
> -       'LD=3D${LD}' \
> -       "
> -
> -do_install () {
> -       install -d ${D}${sysconfdir}/init.d
> -       install -d ${D}${sysconfdir}/default
> -       install -d ${D}${sysconfdir}/ebtables
> -       install -d ${D}/sbin
> -       oe_runmake DESTDIR=3D'${D}' install
> -       install -m 0755 ${WORKDIR}/ebtables.init
> ${D}/${sysconfdir}/init.d/ebtables
> -       mv ${D}${sysconfdir}/default/ebtables-config
> ${D}${sysconfdir}/default/ebtables
> -}
> -
> -CONFFILES_${PN} +=3D "${sysconfdir}/default/ebtables"
> -
> -inherit update-rc.d
> -
> -INITSCRIPT_NAME =3D "ebtables"
> -INITSCRIPT_PARAMS =3D "start 41 S . stop 41 6 ."
> -
> -FILES_${PN}-dbg +=3D "${base_libdir}/ebtables/.debug"
> -FILES_${PN} +=3D "${base_libdir}/ebtables/*.so"
> -
> -RDEPENDS_${PN} =3D " perl"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe3380cb885e04d3e19aa1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Minor &#39;nit:<div><br></div><div>s/recides/resides/</div=
><div><br></div><div>Bruce<br><div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">On Tue, Jan 22, 2013 at 7:47 AM, David Nystr=F6m <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_b=
lank">david.c.nystrom@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Signed-off-by: David Nystr=F6m &lt;<a href=3D"mailto:david=
.nystrom@enea.com">david.nystrom@enea.com</a>&gt;<br>

---<br>
=A0.../ebtables-2.0.9-2/01debian_defaultconfig.patch =A0| =A0 50 ------<br>
=A0.../04compensate-for-missing-aligned-u64.patch =A0 =A0 | =A0 16 --<br>
=A0.../ebtables/ebtables-2.0.9-2/ebtables.init =A0 =A0 =A0 =A0| =A0186 ----=
----------------<br>
=A0.../ebtables-2.0.9-2/installcreatedirs.patch =A0 =A0 =A0 | =A0 25 ---<br=
>
=A0.../ebtables/ebtables-2.0.9-2/installnonroot.patch | =A0 45 -----<br>
=A0recipes-extended/ebtables/<a href=3D"http://ebtables_2.0.9-2.bb" target=
=3D"_blank">ebtables_2.0.9-2.bb</a> =A0 =A0 =A0| =A0 64 -------<br>
=A06 files changed, 386 deletions(-)<br>
=A0delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/01debian_d=
efaultconfig.patch<br>
=A0delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/04compensa=
te-for-missing-aligned-u64.patch<br>
=A0delete mode 100755 recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.i=
nit<br>
=A0delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/installcre=
atedirs.patch<br>
=A0delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/installnon=
root.patch<br>
=A0delete mode 100644 recipes-extended/ebtables/<a href=3D"http://ebtables_=
2.0.9-2.bb" target=3D"_blank">ebtables_2.0.9-2.bb</a><br>
<br>
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultcon=
fig.patch b/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconf=
ig.patch<br>
deleted file mode 100644<br>
index c260403..0000000<br>
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.pat=
ch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-#! /bin/sh /usr/share/dpatch/dpatch-run<br>
-## debian_defaultconfig.dpatch by =A0&lt;<a href=3D"mailto:hesso@pool.math=
.tu-berlin.de">hesso@pool.math.tu-berlin.de</a>&gt;<br>
-##<br>
-## DP: Debian enhancements to the ebtables &quot;sysconfig&quot; default s=
ettings.<br>
-<br>
-@DPATCH@<br>
-<br>
---- ebtables-2.0.8.1.orig/ebtables-config<br>
-+++ ebtables-2.0.8.1/ebtables-config<br>
-@@ -1,17 +1,3 @@<br>
--# Save (and possibly restore) in text format.<br>
--# =A0 Value: yes|no, =A0default: yes<br>
--# Save the firewall rules in text format to __SYSCONFIG__/ebtables<br>
--# If EBTABLES_BINARY_FORMAT=3D&quot;no&quot; then restoring the firewall =
rules<br>
--# is done using this text format.<br>
--EBTABLES_TEXT_FORMAT=3D&quot;yes&quot;<br>
--<br>
--# Save (and restore) in binary format.<br>
--# =A0 Value: yes|no, =A0default: yes<br>
--# Save (and restore) the firewall rules in binary format to (and from)<br=
>
--# __SYSCONFIG__/ebtables.&lt;chain&gt;. Enabling this option will make<br=
>
--# firewall initialisation a lot faster.<br>
--EBTABLES_BINARY_FORMAT=3D&quot;yes&quot;<br>
--<br>
- # Unload modules on restart and stop<br>
- # =A0 Value: yes|no, =A0default: yes<br>
- # This option has to be &#39;yes&#39; to get to a sane state for a firewa=
ll<br>
-@@ -19,6 +5,12 @@<br>
- # modules.<br>
- EBTABLES_MODULES_UNLOAD=3D&quot;yes&quot;<br>
-<br>
-+# Load firewall rules on system startup.<br>
-+# =A0 Value: yes|no, =A0default: no<br>
-+# Restores the ebtables rulesets from the last saved state when the<br>
-+# system boots up.<br>
-+EBTABLES_LOAD_ON_START=3D&quot;no&quot;<br>
-+<br>
- # Save current firewall rules on stop.<br>
- # =A0 Value: yes|no, =A0default: no<br>
- # Saves all firewall rules if firewall gets stopped<br>
-@@ -35,3 +27,9 @@<br>
- # Save rule counters when saving a kernel table to a file. If the<br>
- # rule counters were saved, they will be restored when restoring the tabl=
e.<br>
- EBTABLES_SAVE_COUNTER=3D&quot;no&quot;<br>
-+<br>
-+# Backup suffix for ruleset save files.<br>
-+# =A0 Value: &lt;string&gt;, =A0default: &quot;~&quot;<br>
-+# Keep one backup level of saved rules.<br>
-+# Set this variable to the empty string to disable backups.<br>
-+EBTABLES_BACKUP_SUFFIX=3D&quot;~&quot;<br>
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-mi=
ssing-aligned-u64.patch b/recipes-extended/ebtables/ebtables-2.0.9-2/04comp=
ensate-for-missing-aligned-u64.patch<br>
deleted file mode 100644<br>
index aae7f4b..0000000<br>
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-a=
ligned-u64.patch<br>
+++ /dev/null<br>
@@ -1,16 +0,0 @@<br>
-<a href=3D"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D661449" targ=
et=3D"_blank">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D661449</a>=
<br>
-<br>
---- ebtables-2.0.9.2.orig/extensions/ebt_pkttype.c =A0 =A0 2010-02-03 21:1=
7:45.000000000 +0000<br>
-+++ ebtables-2.0.9.2/extensions/ebt_pkttype.c =A02012-03-03 15:22:57.00000=
0000 +0000<br>
-@@ -12,6 +12,11 @@<br>
- #include &lt;getopt.h&gt;<br>
- #include &lt;netdb.h&gt;<br>
- #include &quot;../include/ebtables_u.h&quot;<br>
-+/* BEGIN: Workaround */<br>
-+#ifndef __aligned_u64<br>
-+#define __aligned_u64 __u64 __attribute__((aligned(8)))<br>
-+#endif<br>
-+/* END: Workaround */<br>
- #include &lt;linux/if_packet.h&gt;<br>
- #include &lt;linux/netfilter_bridge/ebt_pkttype.h&gt;<br>
-<br>
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init b/rec=
ipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init<br>
deleted file mode 100755<br>
index 0044e98..0000000<br>
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init<br>
+++ /dev/null<br>
@@ -1,186 +0,0 @@<br>
-#!/bin/sh<br>
-#<br>
-# init script for the Ethernet Bridge filter tables<br>
-#<br>
-# Written by Dag Wieers &lt;<a href=3D"mailto:dag@wieers.com">dag@wieers.c=
om</a>&gt;<br>
-# Modified by Rok Papez &lt;<a href=3D"mailto:rok.papez@arnes.si">rok.pape=
z@arnes.si</a>&gt;<br>
-# =A0 =A0 =A0 =A0 =A0 Bart De Schuymer &lt;<a href=3D"mailto:bdschuym@pand=
ora.be">bdschuym@pandora.be</a>&gt;<br>
-# Adapted to Debian by Jan Christoph Nordholz &lt;<a href=3D"mailto:hesso@=
pool.math.tu-berlin.de">hesso@pool.math.tu-berlin.de</a>&gt;<br>
-# Adapted to OpenEmbedded by Roman I Khimov &lt;<a href=3D"mailto:khimov@a=
ltell.ru">khimov@altell.ru</a>&gt;<br>
-#<br>
-# chkconfig: - 15 85<br>
-# description: Ethernet Bridge filtering tables<br>
-#<br>
-### BEGIN INIT INFO<br>
-# Provides: =A0 =A0 =A0 =A0 =A0 =A0ebtables<br>
-# Required-Start:<br>
-# Required-Stop:<br>
-# Should-Start: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$local_fs<br>
-# Should-Stop: =A0 =A0 =A0 =A0 $local_fs<br>
-# Default-Start: =A0 =A0 =A0 S<br>
-# Default-Stop: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00 6<br>
-# Short-Description: =A0 ebtables ruleset management<br>
-# Description: =A0 =A0 =A0 =A0 Saves and restores the state of the ebtable=
s rulesets.<br>
-### END INIT INFO<br>
-<br>
-[ -x /sbin/ebtables ] || exit 1<br>
-<br>
-EBTABLES_DUMPFILE_STEM=3D/etc/ebtables/dump<br>
-<br>
-RETVAL=3D0<br>
-prog=3D&quot;ebtables&quot;<br>
-desc=3D&quot;Ethernet bridge filtering&quot;<br>
-umask 0077<br>
-<br>
-#default configuration<br>
-EBTABLES_MODULES_UNLOAD=3D&quot;yes&quot;<br>
-EBTABLES_LOAD_ON_START=3D&quot;no&quot;<br>
-EBTABLES_SAVE_ON_STOP=3D&quot;no&quot;<br>
-EBTABLES_SAVE_ON_RESTART=3D&quot;no&quot;<br>
-EBTABLES_SAVE_COUNTER=3D&quot;no&quot;<br>
-EBTABLES_BACKUP_SUFFIX=3D&quot;~&quot;<br>
-<br>
-config=3D/etc/default/$prog<br>
-[ -f &quot;$config&quot; ] &amp;&amp; . &quot;$config&quot;<br>
-<br>
-function get_supported_tables() {<br>
- =A0 =A0 =A0 EBTABLES_SUPPORTED_TABLES=3D<br>
- =A0 =A0 =A0 /sbin/ebtables -t filter -L 2&gt;&amp;1 1&gt;/dev/null | grep=
 -q permission<br>
- =A0 =A0 =A0 if [ $? -eq 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Error: insufficient privileges to =
access the ebtables rulesets.&quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit 1<br>
- =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 for table in filter nat broute; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /sbin/ebtables -t $table -L &amp;&gt; /dev/nu=
ll<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ $? -eq 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EBTABLES_SUPPORTED_TABLES=3D&=
quot;${EBTABLES_SUPPORTED_TABLES} $table&quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 done<br>
-}<br>
-<br>
-function load() {<br>
- =A0 =A0 =A0 RETVAL=3D0<br>
- =A0 =A0 =A0 get_supported_tables<br>
- =A0 =A0 =A0 echo -n &quot;Restoring ebtables rulesets: &quot;<br>
- =A0 =A0 =A0 for table in $EBTABLES_SUPPORTED_TABLES; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;$table &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; t=
hen<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /sbin/ebtables -t $table --at=
omic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RET=3D$?<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ $RET -ne 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot=
;(failed) &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RETVAL=3D$RET=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;(no saved state=
) &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 done<br>
- =A0 =A0 =A0 if [ -z &quot;$EBTABLES_SUPPORTED_TABLES&quot; ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;no kernel support. &quot;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;done. &quot;<br>
- =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 if [ $RETVAL -eq 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;ok&quot;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;fail&quot;<br>
- =A0 =A0 =A0 fi<br>
-}<br>
-<br>
-function clear() {<br>
- =A0 =A0 =A0 RETVAL=3D0<br>
- =A0 =A0 =A0 get_supported_tables<br>
- =A0 =A0 =A0 echo -n &quot;Clearing ebtables rulesets: &quot;<br>
- =A0 =A0 =A0 for table in $EBTABLES_SUPPORTED_TABLES; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;$table &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /sbin/ebtables -t $table --init-table<br>
- =A0 =A0 =A0 done<br>
-<br>
- =A0 =A0 =A0 if [ &quot;$EBTABLES_MODULES_UNLOAD&quot; =3D &quot;yes&quot;=
 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 for mod in $(grep -E &#39;^(ebt|ebtable)_&#39=
; /proc/modules | cut -d&#39; &#39; -f1) ebtables; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rmmod $mod 2&gt; /dev/null<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 done<br>
- =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 if [ -z &quot;$EBTABLES_SUPPORTED_TABLES&quot; ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;no kernel support. &quot;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;done. &quot;<br>
- =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 if [ $RETVAL -eq 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;ok&quot;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;fail&quot;<br>
- =A0 =A0 =A0 fi<br>
-}<br>
-<br>
-function save() {<br>
- =A0 =A0 =A0 RETVAL=3D0<br>
- =A0 =A0 =A0 get_supported_tables<br>
- =A0 =A0 =A0 echo -n &quot;Saving ebtables rulesets: &quot;<br>
- =A0 =A0 =A0 for table in $EBTABLES_SUPPORTED_TABLES; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;$table &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ -n &quot;$EBTABLES_BACKUP_SUFFIX&quot; ] &a=
mp;&amp; [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] &amp;&amp; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBT=
ABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /sbin/ebtables -t $table --atomic-file ${EBTA=
BLES_DUMPFILE_STEM}.$table --atomic-save<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 RET=3D$?<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ $RET -ne 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;(failed) &quot;=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RETVAL=3D$RET<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ &quot;$EBTABLES_SAVE_COU=
NTER&quot; =3D &quot;no&quot; ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /sbin/ebtable=
s -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 done<br>
- =A0 =A0 =A0 if [ -z &quot;$EBTABLES_SUPPORTED_TABLES&quot; ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;no kernel support. &quot;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;done. &quot;<br>
- =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 if [ $RETVAL -eq 0 ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;ok&quot;<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;fail&quot;<br>
- =A0 =A0 =A0 fi<br>
-}<br>
-<br>
-case &quot;$1&quot; in<br>
- =A0start)<br>
- =A0 =A0 =A0 [ &quot;$EBTABLES_LOAD_ON_START&quot; =3D &quot;yes&quot; ] &=
amp;&amp; load<br>
- =A0 =A0 =A0 ;;<br>
- =A0stop)<br>
- =A0 =A0 =A0 [ &quot;$EBTABLES_SAVE_ON_STOP&quot; =3D &quot;yes&quot; ] &a=
mp;&amp; save<br>
- =A0 =A0 =A0 clear<br>
- =A0 =A0 =A0 ;;<br>
- =A0restart|reload|force-reload)<br>
- =A0 =A0 =A0 [ &quot;$EBTABLES_SAVE_ON_RESTART&quot; =3D &quot;yes&quot; ]=
 &amp;&amp; save<br>
- =A0 =A0 =A0 clear<br>
- =A0 =A0 =A0 [ &quot;$EBTABLES_LOAD_ON_START&quot; =3D &quot;yes&quot; ] &=
amp;&amp; load<br>
- =A0 =A0 =A0 ;;<br>
- =A0load)<br>
- =A0 =A0 =A0 load<br>
- =A0 =A0 =A0 ;;<br>
- =A0save)<br>
- =A0 =A0 =A0 save<br>
- =A0 =A0 =A0 ;;<br>
- =A0status)<br>
- =A0 =A0 =A0 get_supported_tables<br>
- =A0 =A0 =A0 if [ -z &quot;$EBTABLES_SUPPORTED_TABLES&quot; ]; then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;No kernel support for ebtables.&qu=
ot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 RETVAL=3D1<br>
- =A0 =A0 =A0 else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;Ebtables support available, num=
ber of installed rules: &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 for table in $EBTABLES_SUPPORTED_TABLES; do<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 COUNT=3D$(( $(/sbin/ebtables =
-t $table -L | sed -e &quot;/^Bridge chain/! d&quot; -e &quot;s/^.*entries:=
 //&quot; -e &quot;s/,.*$/ +/&quot;) 0 ))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;$table($COUNT) =
&quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 done<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo ok<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 RETVAL=3D0<br>
- =A0 =A0 =A0 fi<br>
- =A0 =A0 =A0 ;;<br>
- =A0*)<br>
- =A0 =A0 =A0 echo &quot;Usage: $0 {start|stop|restart|reload|force-reload|=
load|save|status}&quot; &gt;&amp;2<br>
- =A0 =A0 =A0 RETVAL=3D1<br>
-esac<br>
-<br>
-exit $RETVAL<br>
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.p=
atch b/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch<b=
r>
deleted file mode 100644<br>
index 86bc4f0..0000000<br>
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch<br=
>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-<br>
-#<br>
-# Patch managed by <a href=3D"http://www.mn-logistik.de/unsupported/pxa250=
/patcher" target=3D"_blank">http://www.mn-logistik.de/unsupported/pxa250/pa=
tcher</a><br>
-#<br>
-<br>
---- ebtables-v2.0.6/Makefile~installcreatedirs 2004-06-03 13:34:17.0000000=
00 -0500<br>
-+++ ebtables-v2.0.6/Makefile =A0 2004-06-03 13:35:21.000000000 -0500<br>
-@@ -47,14 +47,17 @@<br>
-<br>
- $(MANDIR)/man8/ebtables.8: ebtables.8<br>
- =A0 =A0 =A0 mkdir -p $(@D)<br>
-+ =A0 =A0 =A0install -d $(MANDIR)/man8<br>
- =A0 =A0 =A0 install -m 0644 $(INSTALLOWN) $&lt; $@<br>
-<br>
- $(ETHERTYPESFILE): ethertypes<br>
- =A0 =A0 =A0 mkdir -p $(@D)<br>
-+ =A0 =A0 =A0install -d $(ETHERTYPESPATH)<br>
- =A0 =A0 =A0 install -m 0644 $(INSTALLOWN) $&lt; $@<br>
-<br>
- .PHONY: exec<br>
- exec: ebtables<br>
-+ =A0 =A0 =A0install -d $(BINPATH)<br>
- =A0 =A0 =A0 install -m 0755 $(INSTALLOWN) $&lt; $(BINFILE)<br>
-<br>
- .PHONY: install<br>
diff --git a/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patc=
h b/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch<br>
deleted file mode 100644<br>
index 4d42cc0..0000000<br>
--- a/recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-<br>
-#<br>
-# Patch managed by <a href=3D"http://www.mn-logistik.de/unsupported/pxa250=
/patcher" target=3D"_blank">http://www.mn-logistik.de/unsupported/pxa250/pa=
tcher</a><br>
-#<br>
-<br>
-Index: ebtables-v2.0.9-2/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- ebtables-v2.0.9-2.orig/Makefile =A0 =A02010-02-04 00:17:45.000000000 +=
0300<br>
-+++ ebtables-v2.0.9-2/Makefile 2010-05-24 16:15:35.000000000 +0400<br>
-@@ -154,28 +154,28 @@<br>
- .PHONY: scripts<br>
- scripts: ebtables-save ebtables.sysv ebtables-config<br>
- =A0 =A0 =A0 cat ebtables-save | sed &#39;s/__EXEC_PATH__/$(tmp1)/g&#39; &=
gt; ebtables-save_<br>
-- =A0 =A0 =A0install -m 0755 -o root -g root ebtables-save_ $(DESTDIR)$(BI=
NDIR)/ebtables-save<br>
-+ =A0 =A0 =A0install -m 0755 ebtables-save_ $(DESTDIR)$(BINDIR)/ebtables-s=
ave<br>
- =A0 =A0 =A0 cat ebtables.sysv | sed &#39;s/__EXEC_PATH__/$(tmp1)/g&#39; |=
 sed &#39;s/__SYSCONFIG__/$(tmp2)/g&#39; &gt; ebtables.sysv_<br>
-- =A0 =A0 =A0install -m 0755 -o root -g root ebtables.sysv_ $(DESTDIR)$(IN=
ITDIR)/ebtables<br>
-+ =A0 =A0 =A0install -m 0755 ebtables.sysv_ $(DESTDIR)$(INITDIR)/ebtables<=
br>
- =A0 =A0 =A0 cat ebtables-config | sed &#39;s/__SYSCONFIG__/$(tmp2)/g&#39;=
 &gt; ebtables-config_<br>
-- =A0 =A0 =A0install -m 0600 -o root -g root ebtables-config_ $(DESTDIR)$(=
SYSCONFIGDIR)/ebtables-config<br>
-+ =A0 =A0 =A0install -m 0600 ebtables-config_ $(DESTDIR)$(SYSCONFIGDIR)/eb=
tables-config<br>
- =A0 =A0 =A0 rm -f ebtables-save_ ebtables.sysv_ ebtables-config_<br>
-<br>
- $(MANDIR)/man8/ebtables.8: ebtables.8<br>
- =A0 =A0 =A0 mkdir -p $(DESTDIR)$(@D)<br>
- =A0 =A0 =A0 sed &#39;s/$$(VERSION)/$(PROGVERSION)/&#39; ebtables.8 | sed =
&#39;s/$$(DATE)/$(PROGDATE)/&#39; &gt; ebtables.8_<br>
-- =A0 =A0 =A0install -m 0644 -o root -g root ebtables.8_ $(DESTDIR)$@<br>
-+ =A0 =A0 =A0install -m 0644 ebtables.8_ $(DESTDIR)$@<br>
- =A0 =A0 =A0 rm -f ebtables.8_<br>
-<br>
- $(ETHERTYPESFILE): ethertypes<br>
- =A0 =A0 =A0 mkdir -p $(DESTDIR)$(@D)<br>
-- =A0 =A0 =A0install -m 0644 -o root -g root $&lt; $(DESTDIR)$@<br>
-+ =A0 =A0 =A0install -m 0644 $&lt; $(DESTDIR)$@<br>
-<br>
- .PHONY: exec<br>
- exec: ebtables ebtables-restore<br>
- =A0 =A0 =A0 mkdir -p $(DESTDIR)$(BINDIR)<br>
-- =A0 =A0 =A0install -m 0755 -o root -g root $(PROGNAME) $(DESTDIR)$(BINDI=
R)/$(PROGNAME)<br>
-- =A0 =A0 =A0install -m 0755 -o root -g root ebtables-restore $(DESTDIR)$(=
BINDIR)/ebtables-restore<br>
-+ =A0 =A0 =A0install -m 0755 $(PROGNAME) $(DESTDIR)$(BINDIR)/$(PROGNAME)<b=
r>
-+ =A0 =A0 =A0install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables=
-restore<br>
-<br>
- .PHONY: install<br>
- install: $(MANDIR)/man8/ebtables.8 $(ETHERTYPESFILE) exec scripts<br>
diff --git a/recipes-extended/ebtables/<a href=3D"http://ebtables_2.0.9-2.b=
b" target=3D"_blank">ebtables_2.0.9-2.bb</a> b/recipes-extended/ebtables/<a=
 href=3D"http://ebtables_2.0.9-2.bb" target=3D"_blank">ebtables_2.0.9-2.bb<=
/a><br>

deleted file mode 100644<br>
index 66c7b95..0000000<br>
--- a/recipes-extended/ebtables/<a href=3D"http://ebtables_2.0.9-2.bb" targ=
et=3D"_blank">ebtables_2.0.9-2.bb</a><br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-DESCRIPTION =3D &quot;Utility that enables basic Ethernet frame filtering =
on a Linux bridge, MAC NAT and brouting.&quot;<br>
-PRIORITY =3D &quot;optional&quot;<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
-SECTION =3D &quot;console/network&quot;<br>
-PR =3D &quot;r2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D53b4a999993871a28ab1488fdb=
d2e73e&quot;<br>
-<br>
-TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
- =A0 =A0 =A0 ${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \<br>
- =A0 =A0 =A0 file://installnonroot.patch \<br>
- =A0 =A0 =A0 file://01debian_defaultconfig.patch \<br>
- =A0 =A0 =A0 file://04compensate-for-missing-aligned-u64.patch \<br>
- =A0 =A0 =A0 file://ebtables.init \<br>
- =A0 =A0 =A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;b880429a6424186728eb57ae80ef878a&quot;<br>
-SRC_URI[sha256sum] =3D &quot;98855f644d43c615a8e663197978e49c95642f46f2bbf=
8e6f3213af87f8ad6a3&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/ebtables-v${PV}&quot;<br>
-<br>
-ASNEEDED_pn-${PN} =3D &quot;&quot;<br>
-<br>
-#Load the necessary kernel modules<br>
-RRECOMMENDS_${PN} +=3D &quot;kernel-module-ebtables \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-ebtable-nat \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-ebtable-filter \<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-ebtable_broute \<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
-<br>
-EXTRA_OEMAKE =3D &quot; \<br>
- =A0 =A0 =A0 BINDIR=3D${base_sbindir} \<br>
- =A0 =A0 =A0 MANDIR=3D${mandir} \<br>
- =A0 =A0 =A0 ETHERTYPESPATH=3D${sysconfdir} \<br>
- =A0 =A0 =A0 INITDIR=3D${sysconfdir}/init.d \<br>
- =A0 =A0 =A0 SYSCONFIGDIR=3D${sysconfdir}/default \<br>
- =A0 =A0 =A0 LIBDIR=3D${base_libdir}/ebtables \<br>
- =A0 =A0 =A0 &#39;CC=3D${CC}&#39; \<br>
- =A0 =A0 =A0 &#39;CFLAGS=3D${CFLAGS}&#39; \<br>
- =A0 =A0 =A0 &#39;LD=3D${LD}&#39; \<br>
- =A0 =A0 =A0 &quot;<br>
-<br>
-do_install () {<br>
- =A0 =A0 =A0 install -d ${D}${sysconfdir}/init.d<br>
- =A0 =A0 =A0 install -d ${D}${sysconfdir}/default<br>
- =A0 =A0 =A0 install -d ${D}${sysconfdir}/ebtables<br>
- =A0 =A0 =A0 install -d ${D}/sbin<br>
- =A0 =A0 =A0 oe_runmake DESTDIR=3D&#39;${D}&#39; install<br>
- =A0 =A0 =A0 install -m 0755 ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/i=
nit.d/ebtables<br>
- =A0 =A0 =A0 mv ${D}${sysconfdir}/default/ebtables-config ${D}${sysconfdir=
}/default/ebtables<br>
-}<br>
-<br>
-CONFFILES_${PN} +=3D &quot;${sysconfdir}/default/ebtables&quot;<br>
-<br>
-inherit update-rc.d<br>
-<br>
-INITSCRIPT_NAME =3D &quot;ebtables&quot;<br>
-INITSCRIPT_PARAMS =3D &quot;start 41 S . stop 41 6 .&quot;<br>
-<br>
-FILES_${PN}-dbg +=3D &quot;${base_libdir}/ebtables/.debug&quot;<br>
-FILES_${PN} +=3D &quot;${base_libdir}/ebtables/*.so&quot;<br>
-<br>
-RDEPENDS_${PN} =3D &quot; perl&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div></div></div>

--e0cb4efe3380cb885e04d3e19aa1--
