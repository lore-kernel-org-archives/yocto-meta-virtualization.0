Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 654CBE00B2E; Tue, 20 Jun 2017 13:26:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E00BBE00AF0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Jun 2017 13:26:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5KKQ0tx018497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Jun 2017 13:26:00 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Jun 2017 13:26:00 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 20 Jun 2017 16:25:54 -0400
Message-ID: <1497990354-21086-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] openvswitch: switch to depending on python3
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
X-List-Received-Date: Tue, 20 Jun 2017 20:26:04 -0000
Content-Type: text/plain

As far as I can tell openvswitch has been updated to work with python3
as well as with python(2). Switch to depend on python3 and use python3
for associated scripts. For the most part openvswitch will bind at
runtime to either py2 or py3 regardless of these changes, with these
changes we just do a better job of setting up the dependencies to
facilitate py3 bindings. The openvswitch autotests results are mostly
identical before and after this switch (failures move from python3 to
python(2) test cases as expected, with some exceptions see below).

When running the autotests/ptest with python(2) vs python3 we see a
slightly higher failure rate (334 failures vs. 284 failures). I do not
believe this higher fail rate reflects actual errors in the runtime,
rather the tests are not adapted to python3. At any rate like the rest
of openvswitch it is fairly straightforward to hack the logic for
autotests to be run using py2 as long as it is available in the image,
so these changes don't prevent falling back to py2 for autotests. This
should facilitate any debugging we need to do based on us switching to
favor py3.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...on-make-remaining-scripts-use-usr-bin-env.patch |  18 ++--
 ...n-switch-remaining-scripts-to-use-python3.patch | 113 +++++++++++++++++++++
 recipes-networking/openvswitch/openvswitch.inc     |   8 +-
 recipes-networking/openvswitch/openvswitch_git.bb  |  11 +-
 4 files changed, 132 insertions(+), 18 deletions(-)
 create mode 100644 recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch

diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
index 68f46ff..4441c1e 100644
--- a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
+++ b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
@@ -33,7 +33,7 @@ index f79f235..c7b8730 100755
 +++ b/build-aux/check-structs
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  import os.path
  import sys
@@ -43,7 +43,7 @@ index 184447b..92ea18d 100755
 +++ b/build-aux/extract-ofp-actions
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  import sys
  import os.path
@@ -53,7 +53,7 @@ index 9642593..11e6de7 100755
 +++ b/build-aux/extract-ofp-errors
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  import sys
  import os.path
@@ -63,7 +63,7 @@ index 498b887..5d6bcec 100755
 +++ b/build-aux/extract-ofp-fields
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  import getopt
  import sys
@@ -73,7 +73,7 @@ index 1813638..e9e3c25 100755
 +++ b/build-aux/extract-ofp-msgs
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  import sys
  import os.path
@@ -83,7 +83,7 @@ index bd4e879..9d81503 100755
 +++ b/build-aux/xml2nroff
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
  #
@@ -93,7 +93,7 @@ index 52de3db..c90f02b 100755
 +++ b/ovn/utilities/ovn-docker-overlay-driver
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  # Copyright (C) 2015 Nicira, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
@@ -103,7 +103,7 @@ index 2c9c4b6..89b804c 100755
 +++ b/ovn/utilities/ovn-docker-underlay-driver
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  # Copyright (C) 2015 Nicira, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
@@ -113,7 +113,7 @@ index 5cf26ee..f76f4bd 100755
 +++ b/ovsdb/ovsdb-doc
 @@ -1,4 +1,4 @@
 -#! /usr/bin/python
-+#! /usr/bin/env python
++#! /usr/bin/env python3
  
  # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.
  #
diff --git a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
new file mode 100644
index 0000000..a02b2a4
--- /dev/null
+++ b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
@@ -0,0 +1,113 @@
+From 176528ca3a8b76c9d0bb71b1e56eeebccc655c71 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Wed, 3 May 2017 10:39:12 -0400
+Subject: [PATCH] python: switch remaining scripts to use python3
+
+Work to remove the main openvswitch package's dependency on python 2.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ ofproto/ipfix-gen-entities                            | 2 +-
+ tests/test-l7.py                                      | 2 +-
+ utilities/checkpatch.py                               | 2 +-
+ utilities/ovs-dev.py                                  | 2 +-
+ utilities/ovs-pipegen.py                              | 2 +-
+ vtep/ovs-vtep                                         | 2 +-
+ xenserver/etc_xapi.d_plugins_openvswitch-cfg-update   | 2 +-
+ xenserver/opt_xensource_libexec_interface-reconfigure | 2 +-
+ xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities
+index 0be7199..d2cce42 100755
+--- a/ofproto/ipfix-gen-entities
++++ b/ofproto/ipfix-gen-entities
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # Copyright (C) 2012 Nicira, Inc.
+ #
+diff --git a/tests/test-l7.py b/tests/test-l7.py
+index d7854a1..f09defb 100755
+--- a/tests/test-l7.py
++++ b/tests/test-l7.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # Copyright (c) 2015, 2016 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/utilities/checkpatch.py b/utilities/checkpatch.py
+index 26eb5c3..2e1932b 100755
+--- a/utilities/checkpatch.py
++++ b/utilities/checkpatch.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # Copyright (c) 2016 Red Hat, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py
+index 9ce0f04..839e13e 100755
+--- a/utilities/ovs-dev.py
++++ b/utilities/ovs-dev.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # Copyright (c) 2013, 2014, 2015, 2016 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/utilities/ovs-pipegen.py b/utilities/ovs-pipegen.py
+index 4bf240f..2a8f13e 100755
+--- a/utilities/ovs-pipegen.py
++++ b/utilities/ovs-pipegen.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ # Copyright (c) 2013, 2014, 2015 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/vtep/ovs-vtep b/vtep/ovs-vtep
+index fd652d4..19d63f9 100755
+--- a/vtep/ovs-vtep
++++ b/vtep/ovs-vtep
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update b/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
+index e7404e3..5edad76 100755
+--- a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
++++ b/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # xapi plugin script to update the cache of configuration items in the
+ # ovs-vswitchd configuration that are managed in the xapi database when
+diff --git a/xenserver/opt_xensource_libexec_interface-reconfigure b/xenserver/opt_xensource_libexec_interface-reconfigure
+index ea4a742..c6745ee 100755
+--- a/xenserver/opt_xensource_libexec_interface-reconfigure
++++ b/xenserver/opt_xensource_libexec_interface-reconfigure
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # Copyright (c) 2008,2009 Citrix Systems, Inc.
+ #
+diff --git a/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync b/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
+index a776c00..d5ff8af 100755
+--- a/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
++++ b/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ # Copyright (c) 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 1f0b52b..0e2e67f 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -11,11 +11,11 @@ HOMEPAGE = "http://openvswitch.org/"
 SECTION = "networking"
 LICENSE = "Apache-2"
 
-DEPENDS += "bridge-utils openssl python perl python-six-native coreutils-native"
+DEPENDS += "bridge-utils openssl python3 perl python3-six-native coreutils-native"
 
 RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
-	python perl perl-module-strict ${PN}-switch \
-        bash python-twisted python-six"
+        python3 perl perl-module-strict ${PN}-switch \
+        bash python3-twisted python3-six"
 RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
 RDEPENDS_${PN}-pki = "${PN}"
@@ -70,7 +70,7 @@ FILES_${PN} += "${datadir}/ovsdbmonitor"
 FILES_${PN} += "/run"
 
 FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
-inherit autotools update-rc.d systemd pythonnative
+inherit autotools update-rc.d systemd python3native
 
 SYSTEMD_PACKAGES = "${PN}-switch"
 SYSTEMD_SERVICE_${PN}-switch = " \
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index a17c273..a2893e9 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -3,12 +3,12 @@ require openvswitch.inc
 DEPENDS += "virtual/kernel"
 
 RDEPENDS_${PN}-ptest += "\
-	python-logging python-syslog python-argparse python-io \
-	python-fcntl python-shell python-lang python-xml python-math \
-	python-datetime python-netclient python sed \
+	python3-logging python3-syslog python3-argparse python3-io \
+	python3-fcntl python3-shell python3-lang python3-xml python3-math \
+	python3-datetime python3-netclient python3 sed \
 	ldd perl-module-socket perl-module-carp perl-module-exporter \
-	perl-module-xsloader python-netserver python-threading \
-	python-resource python-subprocess findutils which \
+	perl-module-xsloader python3-netserver python3-threading \
+	python3-resource python3-subprocess findutils which \
 	"
 
 S = "${WORKDIR}/git"
@@ -30,6 +30,7 @@ SRC_URI = "file://openvswitch-switch \
            file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
            file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
            file://CVE-2017-9263.patch \
+           file://python-switch-remaining-scripts-to-use-python3.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
-- 
2.7.4


