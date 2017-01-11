Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3A27E00524; Wed, 11 Jan 2017 14:19:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BE1DE0033D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Jan 2017 14:19:10 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id 17so133956ywk.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Jan 2017 14:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iBtgo2Hj2+sDgfSEECwp4XVt9+L3Qkg8e+bIQrCu3qE=;
	b=cZnxRpS0NwnAZnBSnhL/UVVUW41ZtoYQsDO3vEavj6Ea2W9rfvLRx26NDB1xh1Wbr5
	SYOND3ZaX1L+NdhHACoZLtXyHcQ2eV2awaqVahUoXwbpmh44hwHj1hMHkADuKHOa/WGI
	Niie6G2z5NrqDAB2BVFf0t3rqkosHAU4jk7WxWzjatEgttnfqh0KnxHpefHbwz1ZE+2w
	ESaAD2xaOvC4z5sNb3nVSQ/NE4sHpC/A3faiTJopODmKPoF8fFAxCw3HZjNPTej1pnLO
	oQCmmTV3dSymstBCQUMQxyExL3VbDfetvIpzi6wfi6AgD+Gl8dbpmmlqVgBRa2Alj8C+
	DITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=iBtgo2Hj2+sDgfSEECwp4XVt9+L3Qkg8e+bIQrCu3qE=;
	b=fO8ksTSYhLAjBGG4Qut4eRveR+qQJS4UOmogPctkVflSPrH2uvWi7V23uqBlIuWmhp
	Bc4ooC8iRIN8SQtlv9tRmQdxlaeMF6SiJmPtWLq1EE9PCwC+DtRThBM8qbiJlH1tpSuA
	TYpVlvM3UdB4ilrhnfVPC00GJw1B80C/BlnSt02KMRsb7r2AMKLr9/K46YE9/BNI9VOM
	RiEP7WdeqnzETg3Kubd9DNVcTPFmDeEOadFoBlxqnSSS7gXYHXKI80EwL3PrjQe/z3H/
	3stebi32TPZJz32+l2bcr1msysJbLTMozNV7VBeJ02A4FK7ITF68ThqukSFyp1Lye8hU
	YIpA==
X-Gm-Message-State: AIkVDXLOF+Vt8byc551kldAkfFW9Vo4aim4gZqiJn7Crfvez+4Vxyz6Ell3FSl+c3mFSUu7qvIFGez4BNPcNaw==
X-Received: by 10.13.197.68 with SMTP id h65mr8933260ywd.84.1484173149017;
	Wed, 11 Jan 2017 14:19:09 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Wed, 11 Jan 2017 14:19:08 -0800 (PST)
In-Reply-To: <1484172755-31116-1-git-send-email-mark.asselstine@windriver.com>
References: <1484172755-31116-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 11 Jan 2017 17:19:08 -0500
X-Google-Sender-Auth: WNLzWtAKVYZimKVWsUWxDpcr6lU
Message-ID: <CAPuovELS7iaEp0CTPZ856Bfbx4+6qfHaLK+KAEM3wMOxkDF3fA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: uprev to 2.6.1
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2017 22:19:14 -0000
Content-Type: text/plain; charset=UTF-8

Forgot the -M. Just note that the ptest patch was untouched, just
renamed. Sorry about that.

Mark

On Wed, Jan 11, 2017 at 5:12 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Pick up the latest features, including compatability with the latest
> DPDK as well as bug fixes.
>
> The patches for TARGET_PYTHON and TARGET_PERL can be dropped as
> configure now lets us pass these in the env (which we set).
>
> The systemd service files have been shuffled some upstream and we make
> adjustments in the recipe to accomodate these. The sysvinit scripts
> remain functional as they are.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../openvswitch-add-target-perl-handling.patch     |  48 --------
>  .../openvswitch-add-target-python-handling.patch   | 136 ---------------------
>  ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 110 -----------------
>  ...-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch | 110 +++++++++++++++++
>  recipes-networking/openvswitch/openvswitch.inc     |  23 ++--
>  recipes-networking/openvswitch/openvswitch_git.bb  |   9 +-
>  6 files changed, 127 insertions(+), 309 deletions(-)
>  delete mode 100644 recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
>  delete mode 100644 recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
>  delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
>
> diff --git a/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch b/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
> deleted file mode 100644
> index 98224b4..0000000
> --- a/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 569ac1066cd3046b8ac899153df9f07908d45145 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Fri, 21 Jun 2013 11:16:00 -0400
> -Subject: [PATCH] openvswitch: add target perl handling
> -
> -Allow the build to specify a path for the perl instead of reusing
> -the PERL variable which can lead to inconsistencies if we are cross
> -compiling. The TARGET_PERL variable will be used for script
> -substitutions to ensure the scripts will be able to properly execute
> -if the target system has a different path for the perl.
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> - Makefile.am                  | 1 +
> - configure.ac                 | 7 +++++++
> - utilities/ovs-parse-leaks.in | 2 +-
> - 3 files changed, 9 insertions(+), 1 deletion(-)
> -
> -Index: openvswitch-2.0.0/Makefile.am
> -===================================================================
> ---- openvswitch-2.0.0.orig/Makefile.am
> -+++ openvswitch-2.0.0/Makefile.am
> -@@ -114,6 +114,7 @@
> -                 -e 's,[@]LOGDIR[@],$(LOGDIR),g' \
> -                 -e 's,[@]DBDIR[@],$(DBDIR),g' \
> -                 -e 's,[@]PERL[@],$(PERL),g' \
> -+                -e 's,[@]TARGET_PERL[@],$(TARGET_PERL),g' \
> -                 -e 's,[@]PYTHON[@],$(PYTHON),g' \
> -                 -e 's,[@]TARGET_PYTHON[@],$(TARGET_PYTHON),g' \
> -                 -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
> -Index: openvswitch-2.0.0/configure.ac
> -===================================================================
> ---- openvswitch-2.0.0.orig/configure.ac
> -+++ openvswitch-2.0.0/configure.ac
> -@@ -115,6 +115,13 @@
> - AC_SUBST(KARCH)
> - OVS_CHECK_LINUX
> -
> -+if test "$TARGET_PERL"; then
> -+    TARGET_PERL=$TARGET_PERL
> -+else
> -+    TARGET_PERL=$PERL
> -+fi
> -+AC_SUBST(TARGET_PERL)
> -+
> - if test "$TARGET_PYTHON"; then
> -     TARGET_PYTHON=$TARGET_PYTHON
> - else
> diff --git a/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch b/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
> deleted file mode 100644
> index 97b352c..0000000
> --- a/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
> +++ /dev/null
> @@ -1,136 +0,0 @@
> -From e8a5d34885c5fdba7d951fb1bb85131cbafca432 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Wed, 19 Jun 2013 17:25:56 -0400
> -Subject: [PATCH] openvswitch: add target python handling
> -
> -Allow the build to specify a path for the python instead of reusing
> -the PYTHON variable which can lead to inconsistencies if we are cross
> -compiling. The TARGET_PYTHON variable will be used for script
> -substitutions to ensure the scripts will be able to properly execute
> -if the target system has a different path for the python.
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> - Makefile.am                        | 1 +
> - configure.ac                       | 7 +++++++
> - ovsdb/ovsdbmonitor/ovsdbmonitor.in | 2 +-
> - utilities/bugtool/ovs-bugtool.in   | 2 +-
> - utilities/ovs-check-dead-ifs.in    | 2 +-
> - utilities/ovs-l3ping.in            | 2 +-
> - utilities/ovs-parse-backtrace.in   | 2 +-
> - utilities/ovs-pcap.in              | 2 +-
> - utilities/ovs-tcpundump.in         | 2 +-
> - utilities/ovs-test.in              | 2 +-
> - utilities/ovs-vlan-test.in         | 2 +-
> - 11 files changed, 17 insertions(+), 9 deletions(-)
> -
> -Index: openvswitch-2.1.2/Makefile.am
> -===================================================================
> ---- openvswitch-2.1.2.orig/Makefile.am
> -+++ openvswitch-2.1.2/Makefile.am
> -@@ -125,6 +125,7 @@
> -                 -e 's,[@]DBDIR[@],$(DBDIR),g' \
> -                 -e 's,[@]PERL[@],$(PERL),g' \
> -                 -e 's,[@]PYTHON[@],$(PYTHON),g' \
> -+                -e 's,[@]TARGET_PYTHON[@],$(TARGET_PYTHON),g' \
> -                 -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
> -                 -e 's,[@]VERSION[@],$(VERSION),g' \
> -                 -e 's,[@]localstatedir[@],$(localstatedir),g' \
> -Index: openvswitch-2.1.2/configure.ac
> -===================================================================
> ---- openvswitch-2.1.2.orig/configure.ac
> -+++ openvswitch-2.1.2/configure.ac
> -@@ -118,6 +118,13 @@
> - AC_SUBST(KARCH)
> - OVS_CHECK_LINUX
> -
> -+if test "$TARGET_PYTHON"; then
> -+    TARGET_PYTHON=$TARGET_PYTHON
> -+else
> -+    TARGET_PYTHON=$PYTHON
> -+fi
> -+AC_SUBST(TARGET_PYTHON)
> -+
> - AC_CONFIG_FILES(Makefile)
> - AC_CONFIG_FILES(datapath/Makefile)
> - AC_CONFIG_FILES(datapath/linux/Kbuild)
> -Index: openvswitch-2.1.2/utilities/bugtool/ovs-bugtool.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/bugtool/ovs-bugtool.in
> -+++ openvswitch-2.1.2/utilities/bugtool/ovs-bugtool.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> -
> - # This library is free software; you can redistribute it and/or
> - # modify it under the terms of version 2.1 of the GNU Lesser General Public
> -Index: openvswitch-2.1.2/utilities/ovs-check-dead-ifs.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-check-dead-ifs.in
> -+++ openvswitch-2.1.2/utilities/ovs-check-dead-ifs.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> -
> - import os
> - import re
> -Index: openvswitch-2.1.2/utilities/ovs-l3ping.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-l3ping.in
> -+++ openvswitch-2.1.2/utilities/ovs-l3ping.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> - # you may not use this file except in compliance with the License.
> -Index: openvswitch-2.1.2/utilities/ovs-parse-backtrace.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-parse-backtrace.in
> -+++ openvswitch-2.1.2/utilities/ovs-parse-backtrace.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> - #
> - # Copyright (c) 2012 Nicira, Inc.
> - #
> -Index: openvswitch-2.1.2/utilities/ovs-pcap.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-pcap.in
> -+++ openvswitch-2.1.2/utilities/ovs-pcap.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> - #
> - # Copyright (c) 2010 Nicira, Inc.
> - #
> -Index: openvswitch-2.1.2/utilities/ovs-tcpundump.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-tcpundump.in
> -+++ openvswitch-2.1.2/utilities/ovs-tcpundump.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> - #
> - # Copyright (c) 2010 Nicira, Inc.
> - #
> -Index: openvswitch-2.1.2/utilities/ovs-test.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-test.in
> -+++ openvswitch-2.1.2/utilities/ovs-test.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> - # you may not use this file except in compliance with the License.
> -Index: openvswitch-2.1.2/utilities/ovs-vlan-test.in
> -===================================================================
> ---- openvswitch-2.1.2.orig/utilities/ovs-vlan-test.in
> -+++ openvswitch-2.1.2/utilities/ovs-vlan-test.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! @TARGET_PYTHON@
> - #
> - # Copyright (c) 2010 Nicira, Inc.
> - #
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
> deleted file mode 100644
> index 7e74044..0000000
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From e20556d7cf0fc8258db77c1f3e0a160cf9fd4514 Mon Sep 17 00:00:00 2001
> -From: He Zhe <zhe.he@windriver.com>
> -Date: Wed, 30 Mar 2016 06:23:45 -0400
> -Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
> -
> -Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> -
> -Fix ptest for v2.5
> - - Copy certain files from srcdir since it has been different from
> -   build directory.
> - - Copy more necessary files for new added test cases.
> - - Modify config files for running on target.
> -
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - Makefile.am |  1 +
> - test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 73 insertions(+)
> - create mode 100644 test.mk
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index ed43c2f..f38d278 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -401,3 +401,4 @@ include datapath-windows/include/automake.mk
> - include windows/automake.mk
> - include ovn/automake.mk
> - include selinux/automake.mk
> -+include test.mk
> -diff --git a/test.mk b/test.mk
> -new file mode 100644
> -index 0000000..b10a581
> ---- /dev/null
> -+++ b/test.mk
> -@@ -0,0 +1,72 @@
> -+TEST_DEST ?= ${prefix}/lib/openvswitch
> -+TEST_ROOT ?= ${prefix}/lib/openvswitch
> -+TEST_DEPEND =
> -+
> -+if HAVE_OPENSSL
> -+TEST_DEPEND += $(TESTPKI_FILES)
> -+endif
> -+
> -+test-install: $(TEST_DEPEND)
> -+      @list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> -+      install -d $(TEST_DEST)/tests ;\
> -+      install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
> -+      install -d $(TEST_DEST)/python ;\
> -+      install -d $(TEST_DEST)/python/ovs ;\
> -+      install -d $(TEST_DEST)/python/ovs/db ;\
> -+      install -d $(TEST_DEST)/python/ovs/unixctl ;\
> -+      install -d $(TEST_DEST)/vswitchd ;\
> -+      install $(srcdir)/vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
> -+      install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
> -+      install -d $(TEST_DEST)/debian ;\
> -+      install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
> -+      install -d $(TEST_DEST)/build-aux ;\
> -+      install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux ;\
> -+      install -d $(TEST_DEST)/xenserver ;\
> -+      install $(srcdir)/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> -+      install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
> -+      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
> -+      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
> -+      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
> -+      install -d $(TEST_DEST)/vtep ;\
> -+      install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> -+      install -d $(TEST_DEST)/ovn ;\
> -+      install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
> -+      install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
> -+      install -d $(TEST_DEST)/utilities ;\
> -+      install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
> -+      install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
> -+      for p in $$list ; do \
> -+        echo $$p ;\
> -+        p=$${p#../git/} ;\
> -+        pre=$${p#tests\/} ;\
> -+        if test $$pre != $$p ; then \
> -+          echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> -+          if test -f $$p ; then \
> -+            install $$p $(TEST_DEST)/tests/$$pre ;\
> -+          else \
> -+            install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
> -+          fi ;\
> -+          continue ;\
> -+        fi ;\
> -+        pre=$${p#python\/ovs\/} ;\
> -+        if test $$pre != $$p ; then \
> -+          echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> -+          if test -f $$p ; then \
> -+            install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> -+          else \
> -+            install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
> -+          fi ;\
> -+          continue ;\
> -+        fi; \
> -+      done ;\
> -+      sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+      sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
> -+      sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
> -+      sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
> -+      sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
> ---
> -1.9.1
> -
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
> new file mode 100644
> index 0000000..7e74044
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
> @@ -0,0 +1,110 @@
> +From e20556d7cf0fc8258db77c1f3e0a160cf9fd4514 Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Wed, 30 Mar 2016 06:23:45 -0400
> +Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
> +
> +Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> +
> +Fix ptest for v2.5
> + - Copy certain files from srcdir since it has been different from
> +   build directory.
> + - Copy more necessary files for new added test cases.
> + - Modify config files for running on target.
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + Makefile.am |  1 +
> + test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 73 insertions(+)
> + create mode 100644 test.mk
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ed43c2f..f38d278 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -401,3 +401,4 @@ include datapath-windows/include/automake.mk
> + include windows/automake.mk
> + include ovn/automake.mk
> + include selinux/automake.mk
> ++include test.mk
> +diff --git a/test.mk b/test.mk
> +new file mode 100644
> +index 0000000..b10a581
> +--- /dev/null
> ++++ b/test.mk
> +@@ -0,0 +1,72 @@
> ++TEST_DEST ?= ${prefix}/lib/openvswitch
> ++TEST_ROOT ?= ${prefix}/lib/openvswitch
> ++TEST_DEPEND =
> ++
> ++if HAVE_OPENSSL
> ++TEST_DEPEND += $(TESTPKI_FILES)
> ++endif
> ++
> ++test-install: $(TEST_DEPEND)
> ++      @list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> ++      install -d $(TEST_DEST)/tests ;\
> ++      install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
> ++      install -d $(TEST_DEST)/python ;\
> ++      install -d $(TEST_DEST)/python/ovs ;\
> ++      install -d $(TEST_DEST)/python/ovs/db ;\
> ++      install -d $(TEST_DEST)/python/ovs/unixctl ;\
> ++      install -d $(TEST_DEST)/vswitchd ;\
> ++      install $(srcdir)/vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
> ++      install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
> ++      install -d $(TEST_DEST)/debian ;\
> ++      install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
> ++      install -d $(TEST_DEST)/build-aux ;\
> ++      install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux ;\
> ++      install -d $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
> ++      install -d $(TEST_DEST)/vtep ;\
> ++      install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> ++      install -d $(TEST_DEST)/ovn ;\
> ++      install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
> ++      install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
> ++      install -d $(TEST_DEST)/utilities ;\
> ++      install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
> ++      install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
> ++      for p in $$list ; do \
> ++        echo $$p ;\
> ++        p=$${p#../git/} ;\
> ++        pre=$${p#tests\/} ;\
> ++        if test $$pre != $$p ; then \
> ++          echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> ++          if test -f $$p ; then \
> ++            install $$p $(TEST_DEST)/tests/$$pre ;\
> ++          else \
> ++            install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
> ++          fi ;\
> ++          continue ;\
> ++        fi ;\
> ++        pre=$${p#python\/ovs\/} ;\
> ++        if test $$pre != $$p ; then \
> ++          echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> ++          if test -f $$p ; then \
> ++            install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> ++          else \
> ++            install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
> ++          fi ;\
> ++          continue ;\
> ++        fi; \
> ++      done ;\
> ++      sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
> +--
> +1.9.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 3c70703..ab1f8fe 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -31,13 +31,12 @@ SRC_URI = "\
>         file://openvswitch-switch-setup \
>         file://openvswitch-testcontroller \
>         file://openvswitch-testcontroller-setup \
> -       file://openvswitch-add-target-python-handling.patch \
> -       file://openvswitch-add-target-perl-handling.patch \
>         "
>
>  EXTRA_OECONF += "\
> -       TARGET_PYTHON=${bindir}/python \
> -       TARGET_PERL=${bindir}/perl \
> +       PYTHON=${bindir}/python \
> +       PYTHON3=${bindir}/python3 \
> +       PERL=${bindir}/perl \
>         "
>  CONFIGUREOPT_DEPTRACK = ""
>
> @@ -61,8 +60,9 @@ FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
>  FILES_${PN}-switch = "\
>         ${sysconfdir}/init.d/openvswitch-switch \
>         ${sysconfdir}/default/openvswitch-switch \
> +       ${systemd_unitdir}/system/ovs-vswitchd.service \
>         ${systemd_unitdir}/system/openvswitch.service \
> -       ${systemd_unitdir}/system/openvswitch-nonetwork.service \
> +       ${systemd_unitdir}/system/ovsdb-server.service \
>         "
>
>  # silence a warning
> @@ -74,8 +74,9 @@ inherit autotools update-rc.d systemd python-dir
>
>  SYSTEMD_PACKAGES = "${PN}-switch"
>  SYSTEMD_SERVICE_${PN}-switch = " \
> -    openvswitch-nonetwork.service \
> -    openvswitch-switch.service \
> +    ovsdb-server.service \
> +    ovs-vswitchd.service \
> +    openvswitch.service \
>  "
>
>  INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-testcontroller"
> @@ -97,10 +98,12 @@ do_install_append() {
>         true || rm -fr ${D}/${datadir}/${PN}/pki
>
>         install -d ${D}/${systemd_unitdir}/system/
> +       install -m 644 ${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service \
> +               ${D}/${systemd_unitdir}/system/ovs-vswitchd.service
>         install -m 644 ${S}/rhel/usr_lib_systemd_system_openvswitch.service \
> -               ${D}/${systemd_unitdir}/system/openvswitch-switch.service
> -       install -m 644 ${S}/rhel/usr_lib_systemd_system_openvswitch-nonetwork.service \
> -               ${D}/${systemd_unitdir}/system/openvswitch-nonetwork.service
> +               ${D}/${systemd_unitdir}/system/openvswitch.service
> +       install -m 644 ${S}/rhel/usr_lib_systemd_system_ovsdb-server.service \
> +               ${D}/${systemd_unitdir}/system/ovsdb-server.service
>
>         oe_runmake modules_install INSTALL_MOD_PATH=${D}
>         install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 1c6252a..55e3a9a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -12,14 +12,13 @@ RDEPENDS_${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.5.0+${SRCREV}"
> +PV = "2.6.1+${SRCREV}"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "8c0b419a0b9ac0141d6973dcc80306dfc6a83d31"
> +SRCREV = "f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3"
>  SRC_URI += "\
> -       git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.5 \
> -       file://openvswitch-add-more-target-python-substitutions.patch \
> +       git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.6 \
>         file://openvswitch-add-ptest-${SRCREV}.patch \
>         file://run-ptest \
>         file://disable_m4_check.patch \
> @@ -27,7 +26,7 @@ SRC_URI += "\
>         file://openvswitch-ptest-Fix-python-path.patch \
>         "
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

