Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5CF8E003C1; Thu, 12 Jan 2017 11:02:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.175 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA5ADE0030B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Jan 2017 11:02:30 -0800 (PST)
Received: by mail-qt0-f175.google.com with SMTP id k15so27002106qtg.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Jan 2017 11:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=76Dx/AiUSECRwfbxrU/r1W+o+/Q6TQDG8XBRtfD4JS0=;
	b=TmqZL4OHZfJFZVBlCoE1hsomqYy1jS+746R0PfvpwVXBW8F0eZm/al5qxGWVu2ArVU
	C7XaFy3y+3JXOH3tuY4E6eVqU2ugThH4TMkm9AARH1YfLQn0vGwDmIaY+0O1EQDBDdyX
	vhvtKEYFN2lWM+vwATXjsT/niBXakm0v4fIyv3b0ys8Qo4M2cuao6lhxdqpuCXvGDa8r
	ZrxE2g3lXhyU+TpzCAyZjvvN7nGIneAanSivpYCsb4tCJfLtJ2FCTWjF28XvXFqO3kgR
	OREzwVD36Ge8K67HXIK+goWQbQd+4akDAGKfZWL04AaIC35XYjJ6d8H5Z1P6W3Ab7DMF
	JyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=76Dx/AiUSECRwfbxrU/r1W+o+/Q6TQDG8XBRtfD4JS0=;
	b=dwrEjhN+05EHFouqfTQvhavYeSqAbFPYnSzw728gmBUGUG0hYaUa0T/I6EFBrHntb9
	4QRiclivzOt7u0Wg4eaT+WnrtZNYMsI2HtUM+c5U0uQgWyVTYMNQ7lOshSeHZTpK5Y4a
	Z/4ZTFBp1ivmjBI0pbQ2r8Gots+guhecwDV8hC/VnzsK790NRNqNc8csK596i+succX7
	7i+lCAG3ggYJ+kRYSmXyvc62DueJwEQWWAxwg+9PXc7f9uPFd9wBEprmSiU/P5U7zEUJ
	T5Nq0CHgZdqYgcQ5q30OibaIpfW6K6k/YTAIHwYpqknLToizbXb1vCdc1P8fv1ujI3+f
	WpyA==
X-Gm-Message-State: AIkVDXLCpKYNR8EkkI8A5u9Iwv4Tk3dd5Ud8UA/NGBmzEmq2j23RfABLTFcZBRa/6TSgaic2UHl2iDPz7RFWjA==
X-Received: by 10.237.40.39 with SMTP id r36mr15256166qtd.282.1484247749968;
	Thu, 12 Jan 2017 11:02:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Thu, 12 Jan 2017 11:02:29 -0800 (PST)
In-Reply-To: <CAPuovELS7iaEp0CTPZ856Bfbx4+6qfHaLK+KAEM3wMOxkDF3fA@mail.gmail.com>
References: <1484172755-31116-1-git-send-email-mark.asselstine@windriver.com>
	<CAPuovELS7iaEp0CTPZ856Bfbx4+6qfHaLK+KAEM3wMOxkDF3fA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Jan 2017 14:02:29 -0500
Message-ID: <CADkTA4M0u4RE4FNk8jVrneSwsA-VsTn+Q4sZ+g4M80d7thAotQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: uprev to 2.6.1
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
X-List-Received-Date: Thu, 12 Jan 2017 19:02:36 -0000
Content-Type: multipart/alternative; boundary=001a11487ff4e54ca60545ea5bf7

--001a11487ff4e54ca60545ea5bf7
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 5:19 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Forgot the -M. Just note that the ptest patch was untouched, just
> renamed. Sorry about that.
>
>
No worries. This is now merged .. we can deal with any issues that the
uprev creates
in subsequent patches.

Bruce


> Mark
>
> On Wed, Jan 11, 2017 at 5:12 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> > Pick up the latest features, including compatability with the latest
> > DPDK as well as bug fixes.
> >
> > The patches for TARGET_PYTHON and TARGET_PERL can be dropped as
> > configure now lets us pass these in the env (which we set).
> >
> > The systemd service files have been shuffled some upstream and we make
> > adjustments in the recipe to accomodate these. The sysvinit scripts
> > remain functional as they are.
> >
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >  .../openvswitch-add-target-perl-handling.patch     |  48 --------
> >  .../openvswitch-add-target-python-handling.patch   | 136
> ---------------------
> >  ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 110
> -----------------
> >  ...-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch | 110
> +++++++++++++++++
> >  recipes-networking/openvswitch/openvswitch.inc     |  23 ++--
> >  recipes-networking/openvswitch/openvswitch_git.bb  |   9 +-
> >  6 files changed, 127 insertions(+), 309 deletions(-)
> >  delete mode 100644 recipes-networking/openvswitch/files/openvswitch-
> add-target-perl-handling.patch
> >  delete mode 100644 recipes-networking/openvswitch/files/openvswitch-
> add-target-python-handling.patch
> >  delete mode 100644 recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
> >  create mode 100644 recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
> >
> > diff --git a/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
> b/recipes-networking/openvswitch/files/openvswitch-
> add-target-perl-handling.patch
> > deleted file mode 100644
> > index 98224b4..0000000
> > --- a/recipes-networking/openvswitch/files/openvswitch-
> add-target-perl-handling.patch
> > +++ /dev/null
> > @@ -1,48 +0,0 @@
> > -From 569ac1066cd3046b8ac899153df9f07908d45145 Mon Sep 17 00:00:00 2001
> > -From: Mark Asselstine <mark.asselstine@windriver.com>
> > -Date: Fri, 21 Jun 2013 11:16:00 -0400
> > -Subject: [PATCH] openvswitch: add target perl handling
> > -
> > -Allow the build to specify a path for the perl instead of reusing
> > -the PERL variable which can lead to inconsistencies if we are cross
> > -compiling. The TARGET_PERL variable will be used for script
> > -substitutions to ensure the scripts will be able to properly execute
> > -if the target system has a different path for the perl.
> > -
> > -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ----
> > - Makefile.am                  | 1 +
> > - configure.ac                 | 7 +++++++
> > - utilities/ovs-parse-leaks.in | 2 +-
> > - 3 files changed, 9 insertions(+), 1 deletion(-)
> > -
> > -Index: openvswitch-2.0.0/Makefile.am
> > -===================================================================
> > ---- openvswitch-2.0.0.orig/Makefile.am
> > -+++ openvswitch-2.0.0/Makefile.am
> > -@@ -114,6 +114,7 @@
> > -                 -e 's,[@]LOGDIR[@],$(LOGDIR),g' \
> > -                 -e 's,[@]DBDIR[@],$(DBDIR),g' \
> > -                 -e 's,[@]PERL[@],$(PERL),g' \
> > -+                -e 's,[@]TARGET_PERL[@],$(TARGET_PERL),g' \
> > -                 -e 's,[@]PYTHON[@],$(PYTHON),g' \
> > -                 -e 's,[@]TARGET_PYTHON[@],$(TARGET_PYTHON),g' \
> > -                 -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
> > -Index: openvswitch-2.0.0/configure.ac
> > -===================================================================
> > ---- openvswitch-2.0.0.orig/configure.ac
> > -+++ openvswitch-2.0.0/configure.ac
> > -@@ -115,6 +115,13 @@
> > - AC_SUBST(KARCH)
> > - OVS_CHECK_LINUX
> > -
> > -+if test "$TARGET_PERL"; then
> > -+    TARGET_PERL=$TARGET_PERL
> > -+else
> > -+    TARGET_PERL=$PERL
> > -+fi
> > -+AC_SUBST(TARGET_PERL)
> > -+
> > - if test "$TARGET_PYTHON"; then
> > -     TARGET_PYTHON=$TARGET_PYTHON
> > - else
> > diff --git a/recipes-networking/openvswitch/files/openvswitch-
> add-target-python-handling.patch b/recipes-networking/
> openvswitch/files/openvswitch-add-target-python-handling.patch
> > deleted file mode 100644
> > index 97b352c..0000000
> > --- a/recipes-networking/openvswitch/files/openvswitch-
> add-target-python-handling.patch
> > +++ /dev/null
> > @@ -1,136 +0,0 @@
> > -From e8a5d34885c5fdba7d951fb1bb85131cbafca432 Mon Sep 17 00:00:00 2001
> > -From: Mark Asselstine <mark.asselstine@windriver.com>
> > -Date: Wed, 19 Jun 2013 17:25:56 -0400
> > -Subject: [PATCH] openvswitch: add target python handling
> > -
> > -Allow the build to specify a path for the python instead of reusing
> > -the PYTHON variable which can lead to inconsistencies if we are cross
> > -compiling. The TARGET_PYTHON variable will be used for script
> > -substitutions to ensure the scripts will be able to properly execute
> > -if the target system has a different path for the python.
> > -
> > -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ----
> > - Makefile.am                        | 1 +
> > - configure.ac                       | 7 +++++++
> > - ovsdb/ovsdbmonitor/ovsdbmonitor.in | 2 +-
> > - utilities/bugtool/ovs-bugtool.in   | 2 +-
> > - utilities/ovs-check-dead-ifs.in    | 2 +-
> > - utilities/ovs-l3ping.in            | 2 +-
> > - utilities/ovs-parse-backtrace.in   | 2 +-
> > - utilities/ovs-pcap.in              | 2 +-
> > - utilities/ovs-tcpundump.in         | 2 +-
> > - utilities/ovs-test.in              | 2 +-
> > - utilities/ovs-vlan-test.in         | 2 +-
> > - 11 files changed, 17 insertions(+), 9 deletions(-)
> > -
> > -Index: openvswitch-2.1.2/Makefile.am
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/Makefile.am
> > -+++ openvswitch-2.1.2/Makefile.am
> > -@@ -125,6 +125,7 @@
> > -                 -e 's,[@]DBDIR[@],$(DBDIR),g' \
> > -                 -e 's,[@]PERL[@],$(PERL),g' \
> > -                 -e 's,[@]PYTHON[@],$(PYTHON),g' \
> > -+                -e 's,[@]TARGET_PYTHON[@],$(TARGET_PYTHON),g' \
> > -                 -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
> > -                 -e 's,[@]VERSION[@],$(VERSION),g' \
> > -                 -e 's,[@]localstatedir[@],$(localstatedir),g' \
> > -Index: openvswitch-2.1.2/configure.ac
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/configure.ac
> > -+++ openvswitch-2.1.2/configure.ac
> > -@@ -118,6 +118,13 @@
> > - AC_SUBST(KARCH)
> > - OVS_CHECK_LINUX
> > -
> > -+if test "$TARGET_PYTHON"; then
> > -+    TARGET_PYTHON=$TARGET_PYTHON
> > -+else
> > -+    TARGET_PYTHON=$PYTHON
> > -+fi
> > -+AC_SUBST(TARGET_PYTHON)
> > -+
> > - AC_CONFIG_FILES(Makefile)
> > - AC_CONFIG_FILES(datapath/Makefile)
> > - AC_CONFIG_FILES(datapath/linux/Kbuild)
> > -Index: openvswitch-2.1.2/utilities/bugtool/ovs-bugtool.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/bugtool/ovs-bugtool.in
> > -+++ openvswitch-2.1.2/utilities/bugtool/ovs-bugtool.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > -
> > - # This library is free software; you can redistribute it and/or
> > - # modify it under the terms of version 2.1 of the GNU Lesser General
> Public
> > -Index: openvswitch-2.1.2/utilities/ovs-check-dead-ifs.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-check-dead-ifs.in
> > -+++ openvswitch-2.1.2/utilities/ovs-check-dead-ifs.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > -
> > - import os
> > - import re
> > -Index: openvswitch-2.1.2/utilities/ovs-l3ping.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-l3ping.in
> > -+++ openvswitch-2.1.2/utilities/ovs-l3ping.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > - #
> > - # Licensed under the Apache License, Version 2.0 (the "License");
> > - # you may not use this file except in compliance with the License.
> > -Index: openvswitch-2.1.2/utilities/ovs-parse-backtrace.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-parse-backtrace.in
> > -+++ openvswitch-2.1.2/utilities/ovs-parse-backtrace.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > - #
> > - # Copyright (c) 2012 Nicira, Inc.
> > - #
> > -Index: openvswitch-2.1.2/utilities/ovs-pcap.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-pcap.in
> > -+++ openvswitch-2.1.2/utilities/ovs-pcap.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > - #
> > - # Copyright (c) 2010 Nicira, Inc.
> > - #
> > -Index: openvswitch-2.1.2/utilities/ovs-tcpundump.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-tcpundump.in
> > -+++ openvswitch-2.1.2/utilities/ovs-tcpundump.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > - #
> > - # Copyright (c) 2010 Nicira, Inc.
> > - #
> > -Index: openvswitch-2.1.2/utilities/ovs-test.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-test.in
> > -+++ openvswitch-2.1.2/utilities/ovs-test.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > - #
> > - # Licensed under the Apache License, Version 2.0 (the "License");
> > - # you may not use this file except in compliance with the License.
> > -Index: openvswitch-2.1.2/utilities/ovs-vlan-test.in
> > -===================================================================
> > ---- openvswitch-2.1.2.orig/utilities/ovs-vlan-test.in
> > -+++ openvswitch-2.1.2/utilities/ovs-vlan-test.in
> > -@@ -1,4 +1,4 @@
> > --#! @PYTHON@
> > -+#! @TARGET_PYTHON@
> > - #
> > - # Copyright (c) 2010 Nicira, Inc.
> > - #
> > diff --git a/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-
> 8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
> > deleted file mode 100644
> > index 7e74044..0000000
> > --- a/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
> > +++ /dev/null
> > @@ -1,110 +0,0 @@
> > -From e20556d7cf0fc8258db77c1f3e0a160cf9fd4514 Mon Sep 17 00:00:00 2001
> > -From: He Zhe <zhe.he@windriver.com>
> > -Date: Wed, 30 Mar 2016 06:23:45 -0400
> > -Subject: [PATCH] openvswitch: Add test-install rule to support ptest
> execution
> > -
> > -Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> > -
> > -Fix ptest for v2.5
> > - - Copy certain files from srcdir since it has been different from
> > -   build directory.
> > - - Copy more necessary files for new added test cases.
> > - - Modify config files for running on target.
> > -
> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ----
> > - Makefile.am |  1 +
> > - test.mk     | 72 ++++++++++++++++++++++++++++++
> +++++++++++++++++++++++++++++++
> > - 2 files changed, 73 insertions(+)
> > - create mode 100644 test.mk
> > -
> > -diff --git a/Makefile.am b/Makefile.am
> > -index ed43c2f..f38d278 100644
> > ---- a/Makefile.am
> > -+++ b/Makefile.am
> > -@@ -401,3 +401,4 @@ include datapath-windows/include/automake.mk
> > - include windows/automake.mk
> > - include ovn/automake.mk
> > - include selinux/automake.mk
> > -+include test.mk
> > -diff --git a/test.mk b/test.mk
> > -new file mode 100644
> > -index 0000000..b10a581
> > ---- /dev/null
> > -+++ b/test.mk
> > -@@ -0,0 +1,72 @@
> > -+TEST_DEST ?= ${prefix}/lib/openvswitch
> > -+TEST_ROOT ?= ${prefix}/lib/openvswitch
> > -+TEST_DEPEND =
> > -+
> > -+if HAVE_OPENSSL
> > -+TEST_DEPEND += $(TESTPKI_FILES)
> > -+endif
> > -+
> > -+test-install: $(TEST_DEPEND)
> > -+      @list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS)
> $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> > -+      install -d $(TEST_DEST)/tests ;\
> > -+      install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
> > -+      install -d $(TEST_DEST)/python ;\
> > -+      install -d $(TEST_DEST)/python/ovs ;\
> > -+      install -d $(TEST_DEST)/python/ovs/db ;\
> > -+      install -d $(TEST_DEST)/python/ovs/unixctl ;\
> > -+      install -d $(TEST_DEST)/vswitchd ;\
> > -+      install $(srcdir)/vswitchd/vswitch.ovsschema
> $(TEST_DEST)/vswitchd ;\
> > -+      install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
> > -+      install -d $(TEST_DEST)/debian ;\
> > -+      install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian
> ;\
> > -+      install -d $(TEST_DEST)/build-aux ;\
> > -+      install $(srcdir)/build-aux/check-structs
> $(TEST_DEST)/build-aux ;\
> > -+      install -d $(TEST_DEST)/xenserver ;\
> > -+      install $(srcdir)/xenserver/usr_share_
> openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> > -+      install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure
> $(TEST_DEST)/xenserver ;\
> > -+      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py
> $(TEST_DEST)/xenserver ;\
> > -+      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py
> $(TEST_DEST)/xenserver ;\
> > -+      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py
> $(TEST_DEST)/xenserver ;\
> > -+      install -d $(TEST_DEST)/vtep ;\
> > -+      install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> > -+      install -d $(TEST_DEST)/ovn ;\
> > -+      install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
> > -+      install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
> > -+      install -d $(TEST_DEST)/utilities ;\
> > -+      install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities
> ;\
> > -+      install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
> > -+      for p in $$list ; do \
> > -+        echo $$p ;\
> > -+        p=$${p#../git/} ;\
> > -+        pre=$${p#tests\/} ;\
> > -+        if test $$pre != $$p ; then \
> > -+          echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> > -+          if test -f $$p ; then \
> > -+            install $$p $(TEST_DEST)/tests/$$pre ;\
> > -+          else \
> > -+            install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
> > -+          fi ;\
> > -+          continue ;\
> > -+        fi ;\
> > -+        pre=$${p#python\/ovs\/} ;\
> > -+        if test $$pre != $$p ; then \
> > -+          echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> > -+          if test -f $$p ; then \
> > -+            install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> > -+          else \
> > -+            install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
> > -+          fi ;\
> > -+          continue ;\
> > -+        fi; \
> > -+      done ;\
> > -+      sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|abs_top_srcdir=.*|abs_top_
> srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|at_top_build_prefix=.*|at_
> top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
> > -+      sed -i 's|^\(.*config\.log.*\)|#\1|g'
> $(TEST_DEST)/tests/testsuite
> > -+      sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
> > -+      sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g'
> $(TEST_DEST)/tests/testsuite
> > -+      sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g'
> $(TEST_DEST)/tests/testsuite
> > ---
> > -1.9.1
> > -
> > diff --git a/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-
> f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
> > new file mode 100644
> > index 0000000..7e74044
> > --- /dev/null
> > +++ b/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
> > @@ -0,0 +1,110 @@
> > +From e20556d7cf0fc8258db77c1f3e0a160cf9fd4514 Mon Sep 17 00:00:00 2001
> > +From: He Zhe <zhe.he@windriver.com>
> > +Date: Wed, 30 Mar 2016 06:23:45 -0400
> > +Subject: [PATCH] openvswitch: Add test-install rule to support ptest
> execution
> > +
> > +Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> > +
> > +Fix ptest for v2.5
> > + - Copy certain files from srcdir since it has been different from
> > +   build directory.
> > + - Copy more necessary files for new added test cases.
> > + - Modify config files for running on target.
> > +
> > +Signed-off-by: He Zhe <zhe.he@windriver.com>
> > +---
> > + Makefile.am |  1 +
> > + test.mk     | 72 ++++++++++++++++++++++++++++++
> +++++++++++++++++++++++++++++++
> > + 2 files changed, 73 insertions(+)
> > + create mode 100644 test.mk
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index ed43c2f..f38d278 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -401,3 +401,4 @@ include datapath-windows/include/automake.mk
> > + include windows/automake.mk
> > + include ovn/automake.mk
> > + include selinux/automake.mk
> > ++include test.mk
> > +diff --git a/test.mk b/test.mk
> > +new file mode 100644
> > +index 0000000..b10a581
> > +--- /dev/null
> > ++++ b/test.mk
> > +@@ -0,0 +1,72 @@
> > ++TEST_DEST ?= ${prefix}/lib/openvswitch
> > ++TEST_ROOT ?= ${prefix}/lib/openvswitch
> > ++TEST_DEPEND =
> > ++
> > ++if HAVE_OPENSSL
> > ++TEST_DEPEND += $(TESTPKI_FILES)
> > ++endif
> > ++
> > ++test-install: $(TEST_DEPEND)
> > ++      @list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS)
> $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> > ++      install -d $(TEST_DEST)/tests ;\
> > ++      install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
> > ++      install -d $(TEST_DEST)/python ;\
> > ++      install -d $(TEST_DEST)/python/ovs ;\
> > ++      install -d $(TEST_DEST)/python/ovs/db ;\
> > ++      install -d $(TEST_DEST)/python/ovs/unixctl ;\
> > ++      install -d $(TEST_DEST)/vswitchd ;\
> > ++      install $(srcdir)/vswitchd/vswitch.ovsschema
> $(TEST_DEST)/vswitchd ;\
> > ++      install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
> > ++      install -d $(TEST_DEST)/debian ;\
> > ++      install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian
> ;\
> > ++      install -d $(TEST_DEST)/build-aux ;\
> > ++      install $(srcdir)/build-aux/check-structs
> $(TEST_DEST)/build-aux ;\
> > ++      install -d $(TEST_DEST)/xenserver ;\
> > ++      install $(srcdir)/xenserver/usr_share_
> openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> > ++      install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure
> $(TEST_DEST)/xenserver ;\
> > ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py
> $(TEST_DEST)/xenserver ;\
> > ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py
> $(TEST_DEST)/xenserver ;\
> > ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py
> $(TEST_DEST)/xenserver ;\
> > ++      install -d $(TEST_DEST)/vtep ;\
> > ++      install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> > ++      install -d $(TEST_DEST)/ovn ;\
> > ++      install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
> > ++      install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
> > ++      install -d $(TEST_DEST)/utilities ;\
> > ++      install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities
> ;\
> > ++      install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
> > ++      for p in $$list ; do \
> > ++        echo $$p ;\
> > ++        p=$${p#../git/} ;\
> > ++        pre=$${p#tests\/} ;\
> > ++        if test $$pre != $$p ; then \
> > ++          echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> > ++          if test -f $$p ; then \
> > ++            install $$p $(TEST_DEST)/tests/$$pre ;\
> > ++          else \
> > ++            install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
> > ++          fi ;\
> > ++          continue ;\
> > ++        fi ;\
> > ++        pre=$${p#python\/ovs\/} ;\
> > ++        if test $$pre != $$p ; then \
> > ++          echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> > ++          if test -f $$p ; then \
> > ++            install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> > ++          else \
> > ++            install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
> > ++          fi ;\
> > ++          continue ;\
> > ++        fi; \
> > ++      done ;\
> > ++      sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|abs_top_srcdir=.*|abs_top_
> srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|at_top_build_prefix=.*|at_
> top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
> > ++      sed -i 's|^\(.*config\.log.*\)|#\1|g'
> $(TEST_DEST)/tests/testsuite
> > ++      sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
> > ++      sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g'
> $(TEST_DEST)/tests/testsuite
> > ++      sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g'
> $(TEST_DEST)/tests/testsuite
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> > index 3c70703..ab1f8fe 100644
> > --- a/recipes-networking/openvswitch/openvswitch.inc
> > +++ b/recipes-networking/openvswitch/openvswitch.inc
> > @@ -31,13 +31,12 @@ SRC_URI = "\
> >         file://openvswitch-switch-setup \
> >         file://openvswitch-testcontroller \
> >         file://openvswitch-testcontroller-setup \
> > -       file://openvswitch-add-target-python-handling.patch \
> > -       file://openvswitch-add-target-perl-handling.patch \
> >         "
> >
> >  EXTRA_OECONF += "\
> > -       TARGET_PYTHON=${bindir}/python \
> > -       TARGET_PERL=${bindir}/perl \
> > +       PYTHON=${bindir}/python \
> > +       PYTHON3=${bindir}/python3 \
> > +       PERL=${bindir}/perl \
> >         "
> >  CONFIGUREOPT_DEPTRACK = ""
> >
> > @@ -61,8 +60,9 @@ FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
> >  FILES_${PN}-switch = "\
> >         ${sysconfdir}/init.d/openvswitch-switch \
> >         ${sysconfdir}/default/openvswitch-switch \
> > +       ${systemd_unitdir}/system/ovs-vswitchd.service \
> >         ${systemd_unitdir}/system/openvswitch.service \
> > -       ${systemd_unitdir}/system/openvswitch-nonetwork.service \
> > +       ${systemd_unitdir}/system/ovsdb-server.service \
> >         "
> >
> >  # silence a warning
> > @@ -74,8 +74,9 @@ inherit autotools update-rc.d systemd python-dir
> >
> >  SYSTEMD_PACKAGES = "${PN}-switch"
> >  SYSTEMD_SERVICE_${PN}-switch = " \
> > -    openvswitch-nonetwork.service \
> > -    openvswitch-switch.service \
> > +    ovsdb-server.service \
> > +    ovs-vswitchd.service \
> > +    openvswitch.service \
> >  "
> >
> >  INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-testcontroller"
> > @@ -97,10 +98,12 @@ do_install_append() {
> >         true || rm -fr ${D}/${datadir}/${PN}/pki
> >
> >         install -d ${D}/${systemd_unitdir}/system/
> > +       install -m 644 ${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service
> \
> > +               ${D}/${systemd_unitdir}/system/ovs-vswitchd.service
> >         install -m 644 ${S}/rhel/usr_lib_systemd_system_openvswitch.service
> \
> > -               ${D}/${systemd_unitdir}/system/openvswitch-switch.
> service
> > -       install -m 644 ${S}/rhel/usr_lib_systemd_
> system_openvswitch-nonetwork.service \
> > -               ${D}/${systemd_unitdir}/system/openvswitch-nonetwork.
> service
> > +               ${D}/${systemd_unitdir}/system/openvswitch.service
> > +       install -m 644 ${S}/rhel/usr_lib_systemd_system_ovsdb-server.service
> \
> > +               ${D}/${systemd_unitdir}/system/ovsdb-server.service
> >
> >         oe_runmake modules_install INSTALL_MOD_PATH=${D}
> >         install -d ${D}${libdir}/python${PYTHON_
> BASEVERSION}/site-packages
> > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> > index 1c6252a..55e3a9a 100644
> > --- a/recipes-networking/openvswitch/openvswitch_git.bb
> > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> > @@ -12,14 +12,13 @@ RDEPENDS_${PN}-ptest += "\
> >         "
> >
> >  S = "${WORKDIR}/git"
> > -PV = "2.5.0+${SRCREV}"
> > +PV = "2.6.1+${SRCREV}"
> >
> >  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> >
> > -SRCREV = "8c0b419a0b9ac0141d6973dcc80306dfc6a83d31"
> > +SRCREV = "f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3"
> >  SRC_URI += "\
> > -       git://github.com/openvswitch/ovs.git;protocol=git;branch=
> branch-2.5 \
> > -       file://openvswitch-add-more-target-python-substitutions.patch \
> > +       git://github.com/openvswitch/ovs.git;protocol=git;branch=
> branch-2.6 \
> >         file://openvswitch-add-ptest-${SRCREV}.patch \
> >         file://run-ptest \
> >         file://disable_m4_check.patch \
> > @@ -27,7 +26,7 @@ SRC_URI += "\
> >         file://openvswitch-ptest-Fix-python-path.patch \
> >         "
> >
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea9
> 94"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b
> 35"
> >
> >  PACKAGECONFIG ?= ""
> >  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_
> TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11487ff4e54ca60545ea5bf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jan 11, 2017 at 5:19 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Forgot the -M. Just note that the ptest patch was untouched, just<br>
renamed. Sorry about that.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>No worries. This is now merged .. we can deal with a=
ny issues that the uprev creates<br></div><div>in subsequent patches.<br><b=
r></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"HOEnZb"><font color=3D"#888888">
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Jan 11, 2017 at 5:12 PM, Mark Asselstine<br>
&lt;<a href=3D"mailto:mark.asselstine@windriver.com">mark.asselstine@windri=
ver.com</a><wbr>&gt; wrote:<br>
&gt; Pick up the latest features, including compatability with the latest<b=
r>
&gt; DPDK as well as bug fixes.<br>
&gt;<br>
&gt; The patches for TARGET_PYTHON and TARGET_PERL can be dropped as<br>
&gt; configure now lets us pass these in the env (which we set).<br>
&gt;<br>
&gt; The systemd service files have been shuffled some upstream and we make=
<br>
&gt; adjustments in the recipe to accomodate these. The sysvinit scripts<br=
>
&gt; remain functional as they are.<br>
&gt;<br>
&gt; Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../openvswitch-add-target-<wbr>perl-handling.patch=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 48 --------<br>
&gt;=C2=A0 .../openvswitch-add-target-<wbr>python-handling.patch=C2=A0 =C2=
=A0| 136 ---------------------<br>
&gt;=C2=A0 ...-<wbr>8c0b419a0b9ac0141d6973dcc80306<wbr>dfc6a83d31.patch | 1=
10 -----------------<br>
&gt;=C2=A0 ...-<wbr>f4b0e64cffb4777ff03d48621c3ead<wbr>cf1d8c19f3.patch | 1=
10 +++++++++++++++++<br>
&gt;=C2=A0 recipes-networking/<wbr>openvswitch/openvswitch.inc=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 23 ++--<br>
&gt;=C2=A0 recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0=
 |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 6 files changed, 127 insertions(+), 309 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 recipes-networking/<wbr>openvswitch/files/ope=
nvswitch-<wbr>add-target-perl-handling.patch<br>
&gt;=C2=A0 delete mode 100644 recipes-networking/<wbr>openvswitch/files/ope=
nvswitch-<wbr>add-target-python-handling.<wbr>patch<br>
&gt;=C2=A0 delete mode 100644 recipes-networking/<wbr>openvswitch/openvswit=
ch-git/<wbr>openvswitch-add-ptest-<wbr>8c0b419a0b9ac0141d6973dcc80306<wbr>d=
fc6a83d31.patch<br>
&gt;=C2=A0 create mode 100644 recipes-networking/<wbr>openvswitch/openvswit=
ch-git/<wbr>openvswitch-add-ptest-<wbr>f4b0e64cffb4777ff03d48621c3ead<wbr>c=
f1d8c19f3.patch<br>
&gt;<br>
&gt; diff --git a/recipes-networking/<wbr>openvswitch/files/openvswitch-<wb=
r>add-target-perl-handling.patch b/recipes-networking/<wbr>openvswitch/file=
s/openvswitch-<wbr>add-target-perl-handling.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 98224b4..0000000<br>
&gt; --- a/recipes-networking/<wbr>openvswitch/files/openvswitch-<wbr>add-t=
arget-perl-handling.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,48 +0,0 @@<br>
&gt; -From 569ac1066cd3046b8ac899153df9f0<wbr>7908d45145 Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver=
.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; -Date: Fri, 21 Jun 2013 11:16:00 -0400<br>
&gt; -Subject: [PATCH] openvswitch: add target perl handling<br>
&gt; -<br>
&gt; -Allow the build to specify a path for the perl instead of reusing<br>
&gt; -the PERL variable which can lead to inconsistencies if we are cross<b=
r>
&gt; -compiling. The TARGET_PERL variable will be used for script<br>
&gt; -substitutions to ensure the scripts will be able to properly execute<=
br>
&gt; -if the target system has a different path for the perl.<br>
&gt; -<br>
&gt; -Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; ----<br>
&gt; - Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 +<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 7 +++++++<br>
&gt; - utilities/<a href=3D"http://ovs-parse-leaks.in" rel=3D"noreferrer" t=
arget=3D"_blank">ovs-parse-leaks.in</a> | 2 +-<br>
&gt; - 3 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -Index: openvswitch-2.0.0/Makefile.am<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.0.0.orig/<wbr>Makefile.am<br>
&gt; -+++ openvswitch-2.0.0/Makefile.am<br>
&gt; -@@ -114,6 +114,7 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]LOGDIR[@],$(LOGDIR),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]DBDIR[@],$(DBDIR),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]PERL[@],$(PERL),g&#39; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,[@=
]TARGET_PERL[@],$(TARGET_<wbr>PERL),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]PYTHON[@],$(PYTHON),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]TARGET_PYTHON[@],$(<wbr>TARGET_PYTHON),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]RUNDIR[@],$(RUNDIR),g&#39; \<br>
&gt; -Index: openvswitch-2.0.0/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.0.0.orig/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configu<wbr>re.ac</a><br>
&gt; -+++ openvswitch-2.0.0/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; -@@ -115,6 +115,13 @@<br>
&gt; - AC_SUBST(KARCH)<br>
&gt; - OVS_CHECK_LINUX<br>
&gt; -<br>
&gt; -+if test &quot;$TARGET_PERL&quot;; then<br>
&gt; -+=C2=A0 =C2=A0 TARGET_PERL=3D$TARGET_PERL<br>
&gt; -+else<br>
&gt; -+=C2=A0 =C2=A0 TARGET_PERL=3D$PERL<br>
&gt; -+fi<br>
&gt; -+AC_SUBST(TARGET_PERL)<br>
&gt; -+<br>
&gt; - if test &quot;$TARGET_PYTHON&quot;; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0TARGET_PYTHON=3D$TARGET_PYTHON<br>
&gt; - else<br>
&gt; diff --git a/recipes-networking/<wbr>openvswitch/files/openvswitch-<wb=
r>add-target-python-handling.<wbr>patch b/recipes-networking/<wbr>openvswit=
ch/files/openvswitch-<wbr>add-target-python-handling.<wbr>patch<br>
&gt; deleted file mode 100644<br>
&gt; index 97b352c..0000000<br>
&gt; --- a/recipes-networking/<wbr>openvswitch/files/openvswitch-<wbr>add-t=
arget-python-handling.<wbr>patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,136 +0,0 @@<br>
&gt; -From e8a5d34885c5fdba7d951fb1bb8513<wbr>1cbafca432 Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver=
.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; -Date: Wed, 19 Jun 2013 17:25:56 -0400<br>
&gt; -Subject: [PATCH] openvswitch: add target python handling<br>
&gt; -<br>
&gt; -Allow the build to specify a path for the python instead of reusing<b=
r>
&gt; -the PYTHON variable which can lead to inconsistencies if we are cross=
<br>
&gt; -compiling. The TARGET_PYTHON variable will be used for script<br>
&gt; -substitutions to ensure the scripts will be able to properly execute<=
br>
&gt; -if the target system has a different path for the python.<br>
&gt; -<br>
&gt; -Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; ----<br>
&gt; - Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt; - ovsdb/ovsdbmonitor/<a href=3D"http://ovsdbmonitor.in" rel=3D"norefer=
rer" target=3D"_blank">ovsdbmonito<wbr>r.in</a> | 2 +-<br>
&gt; - utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferre=
r" target=3D"_blank">ovs-bugtool.<wbr>in</a>=C2=A0 =C2=A0| 2 +-<br>
&gt; - utilities/<a href=3D"http://ovs-check-dead-ifs.in" rel=3D"noreferrer=
" target=3D"_blank">ovs-check-dead-ifs.<wbr>in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt; - utilities/<a href=3D"http://ovs-l3ping.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-l3ping.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 =
+-<br>
&gt; - utilities/<a href=3D"http://ovs-parse-backtrace.in" rel=3D"noreferre=
r" target=3D"_blank">ovs-parse-backtrace.<wbr>in</a>=C2=A0 =C2=A0| 2 +-<br>
&gt; - utilities/<a href=3D"http://ovs-pcap.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-pcap.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 2 +-<br>
&gt; - utilities/<a href=3D"http://ovs-tcpundump.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-tcpundump.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt; - utilities/<a href=3D"http://ovs-test.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-test.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 2 +-<br>
&gt; - utilities/<a href=3D"http://ovs-vlan-test.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-vlan-test.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt; - 11 files changed, 17 insertions(+), 9 deletions(-)<br>
&gt; -<br>
&gt; -Index: openvswitch-2.1.2/Makefile.am<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>Makefile.am<br>
&gt; -+++ openvswitch-2.1.2/Makefile.am<br>
&gt; -@@ -125,6 +125,7 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]DBDIR[@],$(DBDIR),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]PERL[@],$(PERL),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]PYTHON[@],$(PYTHON),g&#39; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,[@=
]TARGET_PYTHON[@],$(<wbr>TARGET_PYTHON),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]RUNDIR[@],$(RUNDIR),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]VERSION[@],$(VERSION),g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39=
;s,[@]localstatedir[@],$(<wbr>localstatedir),g&#39; \<br>
&gt; -Index: openvswitch-2.1.2/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configu<wbr>re.ac</a><br>
&gt; -+++ openvswitch-2.1.2/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; -@@ -118,6 +118,13 @@<br>
&gt; - AC_SUBST(KARCH)<br>
&gt; - OVS_CHECK_LINUX<br>
&gt; -<br>
&gt; -+if test &quot;$TARGET_PYTHON&quot;; then<br>
&gt; -+=C2=A0 =C2=A0 TARGET_PYTHON=3D$TARGET_PYTHON<br>
&gt; -+else<br>
&gt; -+=C2=A0 =C2=A0 TARGET_PYTHON=3D$PYTHON<br>
&gt; -+fi<br>
&gt; -+AC_SUBST(TARGET_PYTHON)<br>
&gt; -+<br>
&gt; - AC_CONFIG_FILES(Makefile)<br>
&gt; - AC_CONFIG_FILES(datapath/<wbr>Makefile)<br>
&gt; - AC_CONFIG_FILES(datapath/<wbr>linux/Kbuild)<br>
&gt; -Index: openvswitch-2.1.2/utilities/<wbr>bugtool/<a href=3D"http://ovs=
-bugtool.in" rel=3D"noreferrer" target=3D"_blank">ovs-bugtool.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/bugtool/<a href=3D"http://o=
vs-bugtool.in" rel=3D"noreferrer" target=3D"_blank">ovs-bugtool.<wbr>in</a>=
<br>
&gt; -+++ openvswitch-2.1.2/utilities/<wbr>bugtool/<a href=3D"http://ovs-bu=
gtool.in" rel=3D"noreferrer" target=3D"_blank">ovs-bugtool.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; -<br>
&gt; - # This library is free software; you can redistribute it and/or<br>
&gt; - # modify it under the terms of version 2.1 of the GNU Lesser General=
 Public<br>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-check-dead-i=
fs.in" rel=3D"noreferrer" target=3D"_blank">ov<wbr>s-check-dead-ifs.in</a><=
br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-check=
-dead-ifs.in" rel=3D"noreferrer" target=3D"_blank">ovs-check-dead-ifs.<wbr>=
in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-check-dead-ifs.=
in" rel=3D"noreferrer" target=3D"_blank">ov<wbr>s-check-dead-ifs.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; -<br>
&gt; - import os<br>
&gt; - import re<br>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-l3ping.in" r=
el=3D"noreferrer" target=3D"_blank">ov<wbr>s-l3ping.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-l3pin=
g.in" rel=3D"noreferrer" target=3D"_blank">ovs-l3ping.in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-l3ping.in" rel=
=3D"noreferrer" target=3D"_blank">ov<wbr>s-l3ping.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; - #<br>
&gt; - # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
&gt; - # you may not use this file except in compliance with the License.<b=
r>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-parse-backtr=
ace.in" rel=3D"noreferrer" target=3D"_blank">ov<wbr>s-parse-backtrace.in</a=
><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-parse=
-backtrace.in" rel=3D"noreferrer" target=3D"_blank">ovs-parse-backtrace.<wb=
r>in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-parse-backtrace=
.in" rel=3D"noreferrer" target=3D"_blank">ov<wbr>s-parse-backtrace.in</a><b=
r>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; - #<br>
&gt; - # Copyright (c) 2012 Nicira, Inc.<br>
&gt; - #<br>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-pcap.in" rel=
=3D"noreferrer" target=3D"_blank">ov<wbr>s-pcap.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-pcap.=
in" rel=3D"noreferrer" target=3D"_blank">ovs-pcap.in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-pcap.in" rel=3D=
"noreferrer" target=3D"_blank">ov<wbr>s-pcap.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; - #<br>
&gt; - # Copyright (c) 2010 Nicira, Inc.<br>
&gt; - #<br>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-tcpundump.in=
" rel=3D"noreferrer" target=3D"_blank">ov<wbr>s-tcpundump.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-tcpun=
dump.in" rel=3D"noreferrer" target=3D"_blank">ovs-tcpundump.in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-tcpundump.in" r=
el=3D"noreferrer" target=3D"_blank">ov<wbr>s-tcpundump.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; - #<br>
&gt; - # Copyright (c) 2010 Nicira, Inc.<br>
&gt; - #<br>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-test.in" rel=
=3D"noreferrer" target=3D"_blank">ov<wbr>s-test.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-test.=
in" rel=3D"noreferrer" target=3D"_blank">ovs-test.in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-test.in" rel=3D=
"noreferrer" target=3D"_blank">ov<wbr>s-test.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; - #<br>
&gt; - # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
&gt; - # you may not use this file except in compliance with the License.<b=
r>
&gt; -Index: openvswitch-2.1.2/utilities/<a href=3D"http://ovs-vlan-test.in=
" rel=3D"noreferrer" target=3D"_blank">ov<wbr>s-vlan-test.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- openvswitch-2.1.2.orig/<wbr>utilities/<a href=3D"http://ovs-vlan-=
test.in" rel=3D"noreferrer" target=3D"_blank">ovs-vlan-test.in</a><br>
&gt; -+++ openvswitch-2.1.2/utilities/<a href=3D"http://ovs-vlan-test.in" r=
el=3D"noreferrer" target=3D"_blank">ov<wbr>s-vlan-test.in</a><br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#! @PYTHON@<br>
&gt; -+#! @TARGET_PYTHON@<br>
&gt; - #<br>
&gt; - # Copyright (c) 2010 Nicira, Inc.<br>
&gt; - #<br>
&gt; diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>=
openvswitch-add-ptest-<wbr>8c0b419a0b9ac0141d6973dcc80306<wbr>dfc6a83d31.pa=
tch b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvswitch-=
add-ptest-<wbr>8c0b419a0b9ac0141d6973dcc80306<wbr>dfc6a83d31.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 7e74044..0000000<br>
&gt; --- a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvsw=
itch-add-ptest-<wbr>8c0b419a0b9ac0141d6973dcc80306<wbr>dfc6a83d31.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,110 +0,0 @@<br>
&gt; -From e20556d7cf0fc8258db77c1f3e0a16<wbr>0cf9fd4514 Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windr=
iver.com</a>&gt;<br>
&gt; -Date: Wed, 30 Mar 2016 06:23:45 -0400<br>
&gt; -Subject: [PATCH] openvswitch: Add test-install rule to support ptest =
execution<br>
&gt; -<br>
&gt; -Signed-off-by: Radu Patriu &lt;<a href=3D"mailto:radu.patriu@enea.com=
">radu.patriu@enea.com</a>&gt;<br>
&gt; -<br>
&gt; -Fix ptest for v2.5<br>
&gt; - - Copy certain files from srcdir since it has been different from<br=
>
&gt; -=C2=A0 =C2=A0build directory.<br>
&gt; - - Copy more necessary files for new added test cases.<br>
&gt; - - Modify config files for running on target.<br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe=
.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - Makefile.am |=C2=A0 1 +<br>
&gt; - <a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank">test=
.mk</a>=C2=A0 =C2=A0 =C2=A0| 72 ++++++++++++++++++++++++++++++<wbr>++++++++=
++++++++++++++++++++++<wbr>+<br>
&gt; - 2 files changed, 73 insertions(+)<br>
&gt; - create mode 100644 <a href=3D"http://test.mk" rel=3D"noreferrer" tar=
get=3D"_blank">test.mk</a><br>
&gt; -<br>
&gt; -diff --git a/Makefile.am b/Makefile.am<br>
&gt; -index ed43c2f..f38d278 100644<br>
&gt; ---- a/Makefile.am<br>
&gt; -+++ b/Makefile.am<br>
&gt; -@@ -401,3 +401,4 @@ include datapath-windows/include/<a href=3D"http:=
//automake.mk" rel=3D"noreferrer" target=3D"_blank">autom<wbr>ake.mk</a><br=
>
&gt; - include windows/<a href=3D"http://automake.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">automake.mk</a><br>
&gt; - include ovn/<a href=3D"http://automake.mk" rel=3D"noreferrer" target=
=3D"_blank">automake.mk</a><br>
&gt; - include selinux/<a href=3D"http://automake.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">automake.mk</a><br>
&gt; -+include <a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_bla=
nk">test.mk</a><br>
&gt; -diff --git a/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"=
_blank">test.mk</a> b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=
=3D"_blank">test.mk</a><br>
&gt; -new file mode 100644<br>
&gt; -index 0000000..b10a581<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank"=
>test.mk</a><br>
&gt; -@@ -0,0 +1,72 @@<br>
&gt; -+TEST_DEST ?=3D ${prefix}/lib/openvswitch<br>
&gt; -+TEST_ROOT ?=3D ${prefix}/lib/openvswitch<br>
&gt; -+TEST_DEPEND =3D<br>
&gt; -+<br>
&gt; -+if HAVE_OPENSSL<br>
&gt; -+TEST_DEPEND +=3D $(TESTPKI_FILES)<br>
&gt; -+endif<br>
&gt; -+<br>
&gt; -+test-install: $(TEST_DEPEND)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @list=3D&#39;$(noinst_PROGRAMS) $(EXTRA_DIST) $=
(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig&#39; ;\<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/tests ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/te=
sts ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/db ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/<wbr>unixctl=
 ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/vswitchd ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vswitchd/vswitch.<wbr>ovssche=
ma $(TEST_DEST)/vswitchd ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install vswitchd/ovs-vswitchd $(TEST_DEST)/vswi=
tchd ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/debian ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/debian/ovs-monitor-<wbr>ipsec=
 $(TEST_DEST)/debian ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/build-aux ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/build-aux/check-<wbr>structs =
$(TEST_DEST)/build-aux ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/xenserver ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/usr_share_<wbr>open=
vswitch_scripts_ovs-xapi-<wbr>sync $(TEST_DEST)/xenserver ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_interface-<wbr>reconfigure $(TEST_DEST)/xenserver ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_<wbr>InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_<wbr>InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_<wbr>InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/vtep ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vtep/vtep.ovsschema $(TEST_DE=
ST)/vtep ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/ovn ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_D=
EST)/ovn ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_D=
EST)/ovn ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/utilities ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/utilities/<a href=3D"http://o=
vs-pcap.in" rel=3D"noreferrer" target=3D"_blank">ovs-pcap.<wbr>in</a> $(TES=
T_DEST)/utilities ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/utilities/<a href=3D"http://o=
vs-pki.in" rel=3D"noreferrer" target=3D"_blank">ovs-pki.in</a> $(TEST_DEST)=
/utilities ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 for p in $$list ; do \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$p ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p=3D$${p#../git/} ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=3D$${p#tests\/} ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $$pre !=3D $$p ; then \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo installing $$p to $(TEST_DES=
T)/tests/$$pre ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f $$p ; then \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $$p $(TEST_DEST)/t=
ests/$$pre ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/$$p $(TE=
ST_DEST)/tests/$$pre ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=3D$${p#python\/ovs\/} ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $$pre !=3D $$p ; then \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo installing $$p to $(TEST_DES=
T)/python/ovs/$$pre ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f $$p ; then \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $$p $(TEST_DEST)/p=
ython/ovs/$$pre ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/$$p $(TE=
ST_DEST)/python/ovs/$$pre ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 done ;\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_builddir=3D.*|abs_<wbr>buildd=
ir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)/<wbr>tests&#39;&quot;&#39;&quo=
t;&#39;|g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_srcdir=3D.*|abs_srcdir=3D&#39=
;&quot;<wbr>&#39;&quot;&#39;$(TEST_ROOT)/tests&#39;&quot;&#39;&quot;&#39;|g=
&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_top_srcdir=3D.*|abs_top_<wbr>=
srcdir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)&#39;&quot;&#39;&quot;&#39;=
|<wbr>g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_top_builddir=3D.*|abs_<wbr>to=
p_builddir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)<wbr>&#39;&quot;&#39;&q=
uot;&#39;|g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_srcdir=3D.*|at_srcdir=3D&#39;&=
quot;&#39;&quot;<wbr>&#39;.&#39;&quot;&#39;&quot;&#39;|g&#39; $(TEST_DEST)/=
tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_top_srcdir=3D.*|at_top_<wbr>sr=
cdir=3D&#39;&quot;&#39;&quot;&#39;..&#39;&quot;&#39;&quot;&#39;|g&#39; $(TE=
ST_DEST)/tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_top_build_prefix=3D.*|at_<wbr>=
top_build_prefix=3D&#39;&quot;&#39;&quot;&#39;../&#39;&quot;&#39;&quot;&#39=
;<wbr>|g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|^\(.*config\.log.*\)|#\1|g&#39; $=
(TEST_DEST)/tests/testsuite<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|$$srcdir|$$abs_srcdir|g&#39; $(TE=
ST_DEST)/tests/testsuite<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-appctl-bashcomp\.bash|/<wbr>e=
tc/bash_completion.d/ovs-<wbr>appctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tes=
ts/testsuite<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-vsctl-bashcomp\.bash|/<wbr>et=
c/bash_completion.d/ovs-<wbr>vsctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tests=
/testsuite<br>
&gt; ---<br>
&gt; -1.9.1<br>
&gt; -<br>
&gt; diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>=
openvswitch-add-ptest-<wbr>f4b0e64cffb4777ff03d48621c3ead<wbr>cf1d8c19f3.pa=
tch b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvswitch-=
add-ptest-<wbr>f4b0e64cffb4777ff03d48621c3ead<wbr>cf1d8c19f3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7e74044<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvsw=
itch-add-ptest-<wbr>f4b0e64cffb4777ff03d48621c3ead<wbr>cf1d8c19f3.patch<br>
&gt; @@ -0,0 +1,110 @@<br>
&gt; +From e20556d7cf0fc8258db77c1f3e0a16<wbr>0cf9fd4514 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windr=
iver.com</a>&gt;<br>
&gt; +Date: Wed, 30 Mar 2016 06:23:45 -0400<br>
&gt; +Subject: [PATCH] openvswitch: Add test-install rule to support ptest =
execution<br>
&gt; +<br>
&gt; +Signed-off-by: Radu Patriu &lt;<a href=3D"mailto:radu.patriu@enea.com=
">radu.patriu@enea.com</a>&gt;<br>
&gt; +<br>
&gt; +Fix ptest for v2.5<br>
&gt; + - Copy certain files from srcdir since it has been different from<br=
>
&gt; +=C2=A0 =C2=A0build directory.<br>
&gt; + - Copy more necessary files for new added test cases.<br>
&gt; + - Modify config files for running on target.<br>
&gt; +<br>
&gt; +Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe=
.he@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile.am |=C2=A0 1 +<br>
&gt; + <a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank">test=
.mk</a>=C2=A0 =C2=A0 =C2=A0| 72 ++++++++++++++++++++++++++++++<wbr>++++++++=
++++++++++++++++++++++<wbr>+<br>
&gt; + 2 files changed, 73 insertions(+)<br>
&gt; + create mode 100644 <a href=3D"http://test.mk" rel=3D"noreferrer" tar=
get=3D"_blank">test.mk</a><br>
&gt; +<br>
&gt; +diff --git a/Makefile.am b/Makefile.am<br>
&gt; +index ed43c2f..f38d278 100644<br>
&gt; +--- a/Makefile.am<br>
&gt; ++++ b/Makefile.am<br>
&gt; +@@ -401,3 +401,4 @@ include datapath-windows/include/<a href=3D"http:=
//automake.mk" rel=3D"noreferrer" target=3D"_blank">autom<wbr>ake.mk</a><br=
>
&gt; + include windows/<a href=3D"http://automake.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">automake.mk</a><br>
&gt; + include ovn/<a href=3D"http://automake.mk" rel=3D"noreferrer" target=
=3D"_blank">automake.mk</a><br>
&gt; + include selinux/<a href=3D"http://automake.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">automake.mk</a><br>
&gt; ++include <a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_bla=
nk">test.mk</a><br>
&gt; +diff --git a/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"=
_blank">test.mk</a> b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=
=3D"_blank">test.mk</a><br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..b10a581<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank"=
>test.mk</a><br>
&gt; +@@ -0,0 +1,72 @@<br>
&gt; ++TEST_DEST ?=3D ${prefix}/lib/openvswitch<br>
&gt; ++TEST_ROOT ?=3D ${prefix}/lib/openvswitch<br>
&gt; ++TEST_DEPEND =3D<br>
&gt; ++<br>
&gt; ++if HAVE_OPENSSL<br>
&gt; ++TEST_DEPEND +=3D $(TESTPKI_FILES)<br>
&gt; ++endif<br>
&gt; ++<br>
&gt; ++test-install: $(TEST_DEPEND)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @list=3D&#39;$(noinst_PROGRAMS) $(EXTRA_DIST) $=
(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig&#39; ;\<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/tests ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/te=
sts ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/db ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/<wbr>unixctl=
 ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/vswitchd ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vswitchd/vswitch.<wbr>ovssche=
ma $(TEST_DEST)/vswitchd ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install vswitchd/ovs-vswitchd $(TEST_DEST)/vswi=
tchd ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/debian ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/debian/ovs-monitor-<wbr>ipsec=
 $(TEST_DEST)/debian ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/build-aux ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/build-aux/check-<wbr>structs =
$(TEST_DEST)/build-aux ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/xenserver ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/usr_share_<wbr>open=
vswitch_scripts_ovs-xapi-<wbr>sync $(TEST_DEST)/xenserver ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_interface-<wbr>reconfigure $(TEST_DEST)/xenserver ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_<wbr>InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_<wbr>InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_=
libexec_<wbr>InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/vtep ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vtep/vtep.ovsschema $(TEST_DE=
ST)/vtep ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/ovn ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_D=
EST)/ovn ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_D=
EST)/ovn ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/utilities ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/utilities/<a href=3D"http://o=
vs-pcap.in" rel=3D"noreferrer" target=3D"_blank">ovs-pcap.<wbr>in</a> $(TES=
T_DEST)/utilities ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/utilities/<a href=3D"http://o=
vs-pki.in" rel=3D"noreferrer" target=3D"_blank">ovs-pki.in</a> $(TEST_DEST)=
/utilities ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for p in $$list ; do \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$p ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 p=3D$${p#../git/} ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=3D$${p#tests\/} ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $$pre !=3D $$p ; then \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo installing $$p to $(TEST_DES=
T)/tests/$$pre ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f $$p ; then \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $$p $(TEST_DEST)/t=
ests/$$pre ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/$$p $(TE=
ST_DEST)/tests/$$pre ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=3D$${p#python\/ovs\/} ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $$pre !=3D $$p ; then \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo installing $$p to $(TEST_DES=
T)/python/ovs/$$pre ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f $$p ; then \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $$p $(TEST_DEST)/p=
ython/ovs/$$pre ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/$$p $(TE=
ST_DEST)/python/ovs/$$pre ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi; \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 done ;\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_builddir=3D.*|abs_<wbr>buildd=
ir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)/<wbr>tests&#39;&quot;&#39;&quo=
t;&#39;|g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_srcdir=3D.*|abs_srcdir=3D&#39=
;&quot;<wbr>&#39;&quot;&#39;$(TEST_ROOT)/tests&#39;&quot;&#39;&quot;&#39;|g=
&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_top_srcdir=3D.*|abs_top_<wbr>=
srcdir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)&#39;&quot;&#39;&quot;&#39;=
|<wbr>g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_top_builddir=3D.*|abs_<wbr>to=
p_builddir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)<wbr>&#39;&quot;&#39;&q=
uot;&#39;|g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_srcdir=3D.*|at_srcdir=3D&#39;&=
quot;&#39;&quot;<wbr>&#39;.&#39;&quot;&#39;&quot;&#39;|g&#39; $(TEST_DEST)/=
tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_top_srcdir=3D.*|at_top_<wbr>sr=
cdir=3D&#39;&quot;&#39;&quot;&#39;..&#39;&quot;&#39;&quot;&#39;|g&#39; $(TE=
ST_DEST)/tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_top_build_prefix=3D.*|at_<wbr>=
top_build_prefix=3D&#39;&quot;&#39;&quot;&#39;../&#39;&quot;&#39;&quot;&#39=
;<wbr>|g&#39; $(TEST_DEST)/tests/atconfig<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|^\(.*config\.log.*\)|#\1|g&#39; $=
(TEST_DEST)/tests/testsuite<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|$$srcdir|$$abs_srcdir|g&#39; $(TE=
ST_DEST)/tests/testsuite<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-appctl-bashcomp\.bash|/<wbr>e=
tc/bash_completion.d/ovs-<wbr>appctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tes=
ts/testsuite<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-vsctl-bashcomp\.bash|/<wbr>et=
c/bash_completion.d/ovs-<wbr>vsctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tests=
/testsuite<br>
&gt; +--<br>
&gt; +1.9.1<br>
&gt; +<br>
&gt; diff --git a/recipes-networking/<wbr>openvswitch/openvswitch.inc b/rec=
ipes-networking/<wbr>openvswitch/openvswitch.inc<br>
&gt; index 3c70703..ab1f8fe 100644<br>
&gt; --- a/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
&gt; +++ b/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
&gt; @@ -31,13 +31,12 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-switch-<wbr>setup =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-<wbr>testcontrolle=
r \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-<wbr>testcontrolle=
r-setup \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-add-target-<wbr>python-=
handling.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-add-target-<wbr>perl-ha=
ndling.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PYTHON=3D${bindir}/python \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_PERL=3D${bindir}/perl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHON=3D${bindir}/python \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHON3=3D${bindir}/python3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0PERL=3D${bindir}/perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 CONFIGUREOPT_DEPTRACK =3D &quot;&quot;<br>
&gt;<br>
&gt; @@ -61,8 +60,9 @@ FILES_${PN}-brcompat =3D &quot;${sbindir}/ovs-brcomp=
atd&quot;<br>
&gt;=C2=A0 FILES_${PN}-switch =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/<wbr>openvswitch=
-switch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/<wbr>openvswitc=
h-switch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/ovs-<wbr>vswitch=
d.service \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>openvs=
witch.service \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>openvswitch=
-nonetwork.service \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>ovsdb-serve=
r.service \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 # silence a warning<br>
&gt; @@ -74,8 +74,9 @@ inherit autotools update-rc.d systemd python-dir<br>
&gt;<br>
&gt;=C2=A0 SYSTEMD_PACKAGES =3D &quot;${PN}-switch&quot;<br>
&gt;=C2=A0 SYSTEMD_SERVICE_${PN}-switch =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 openvswitch-nonetwork.service \<br>
&gt; -=C2=A0 =C2=A0 openvswitch-switch.service \<br>
&gt; +=C2=A0 =C2=A0 ovsdb-server.service \<br>
&gt; +=C2=A0 =C2=A0 ovs-vswitchd.service \<br>
&gt; +=C2=A0 =C2=A0 openvswitch.service \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 INITSCRIPT_PACKAGES =3D &quot;${PN}-switch ${PN}-testcontroller&=
quot;<br>
&gt; @@ -97,10 +98,12 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true || rm -fr ${D}/${datadir}/${PN}/=
pki<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${systemd_unitdir}/<w=
br>system/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/rhel/usr_lib_systemd_<=
wbr>system_ovs-vswitchd.service \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${systemd=
_unitdir}/<wbr>system/ovs-vswitchd.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/rhel/usr_lib_syst=
emd_<wbr>system_openvswitch.service \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${systemd=
_unitdir}/<wbr>system/openvswitch-switch.<wbr>service<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/rhel/usr_lib_systemd_<=
wbr>system_openvswitch-nonetwork.<wbr>service \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${systemd=
_unitdir}/<wbr>system/openvswitch-nonetwork.<wbr>service<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${systemd=
_unitdir}/<wbr>system/openvswitch.service<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/rhel/usr_lib_systemd_<=
wbr>system_ovsdb-server.service \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${systemd=
_unitdir}/<wbr>system/ovsdb-server.service<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake modules_install INSTALL_MO=
D_PATH=3D${D}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/python${PYTH=
ON_<wbr>BASEVERSION}/site-packages<br>
&gt; diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://ope=
nvswitch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a=
> b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.b=
b" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
&gt; index 1c6252a..55e3a9a 100644<br>
&gt; --- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
&gt; +++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
&gt; @@ -12,14 +12,13 @@ RDEPENDS_${PN}-ptest +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;2.5.0+${SRCREV}&quot;<br>
&gt; +PV =3D &quot;2.6.1+${SRCREV}&quot;<br>
&gt;<br>
&gt;=C2=A0 FILESEXTRAPATHS_append :=3D &quot;${THISDIR}/${PN}-git:&quot;<br=
>
&gt;<br>
&gt; -SRCREV =3D &quot;<wbr>8c0b419a0b9ac0141d6973dcc80306<wbr>dfc6a83d31&q=
uot;<br>
&gt; +SRCREV =3D &quot;<wbr>f4b0e64cffb4777ff03d48621c3ead<wbr>cf1d8c19f3&q=
uot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/openvsw=
itch/ovs.git;protocol=3Dgit;branch=3Dbranch-2.5" rel=3D"noreferrer" target=
=3D"_blank">github.com/openvswitch/<wbr>ovs.git;protocol=3Dgit;branch=3D<wb=
r>branch-2.5</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-add-more-<wbr>target-py=
thon-substitutions.<wbr>patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/openvsw=
itch/ovs.git;protocol=3Dgit;branch=3Dbranch-2.6" rel=3D"noreferrer" target=
=3D"_blank">github.com/openvswitch/<wbr>ovs.git;protocol=3Dgit;branch=3D<wb=
r>branch-2.6</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-add-ptest-$<wbr>{S=
RCREV}.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_m4_check.patch \<br>
&gt; @@ -27,7 +26,7 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-ptest-Fix-<wbr>pyt=
hon-path.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>247d8817aece26b2=
1a8cd6791b3ea9<wbr>94&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a0=
9c0e143137754b<wbr>35&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[dpdk] =3D &quot;--with-dpdk=3D${STAGING_DIR_<wbr>T=
ARGET}/opt/dpdk/${TARGET_<wbr>ARCH}-native-linuxapp-gcc,,<wbr>dpdk,&quot;<b=
r>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a11487ff4e54ca60545ea5bf7--
