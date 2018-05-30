Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 042F9E00C6E; Wed, 30 May 2018 08:47:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	URI_NOVOWEL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 532C9E009BC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 08:47:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4UFlQ1E016714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 08:47:41 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 May 2018 08:47:15 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 30 May 2018 11:47:10 -0400
Message-ID: <1527695230-1460-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openvswitch: uprev to v2.9.2
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
X-List-Received-Date: Wed, 30 May 2018 15:47:57 -0000
Content-Type: text/plain

This brings us up to date with the latest upstream release. I suspect
there will be an upcoming release to add compatibility with DPDK
v18.05 (the DPDK release is due out any day now) but getting this
fairly large release bump out of the way first will facilitate any
upcoming uprev.

We are able to drop they python3 patches as they have been merged
upstream. Some scripts which needed to be updated to use python3
disappeared, new ones appeared so the 'use python3' patches are
updated accordingly. Beyond this the biggest change is related to the
systemd unit files, the ovsdb-server has been updated upstream to be
generated on the fly via the spec file, we mimic this in the
install_prepend. We also add the various configuration files which the
unit files source before launching the services.

As usual this was tested against out typical usecases including usage
in meta-overc. As well the ptests have been run and the results are no
better or worse.

   Previous version:
    ERROR: 2332 tests were run,
    21 failed unexpectedly.
    3 tests were skipped.

   New version:
    ERROR: 2527 tests were run,
    29 failed unexpectedly.
    3 tests were skipped.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...on-make-remaining-scripts-use-usr-bin-env.patch | 298 ++++++++++++++++++---
 ...n-switch-remaining-scripts-to-use-python3.patch |  15 +-
 .../openvswitch-git/disable_m4_check.patch         |   8 +-
 ...-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch | 110 ++++++++
 .../systemd-update-tool-paths.patch                |  45 ++++
 recipes-networking/openvswitch/openvswitch.inc     |  18 ++
 recipes-networking/openvswitch/openvswitch_git.bb  |  22 +-
 7 files changed, 443 insertions(+), 73 deletions(-)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch

diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
index deff10b..0dc6b11 100644
--- a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
+++ b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
@@ -1,4 +1,4 @@
-From f21a0490555d5fe8f5a9ce982defa666a64151c0 Mon Sep 17 00:00:00 2001
+From a0a2d829642e916bd5d1c498a3e6f3641ed717a0 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 13 Jan 2017 16:12:55 -0500
 Subject: [PATCH] python: make remaining scripts use /usr/bin/env
@@ -12,24 +12,43 @@ PYTHON. To make this function smoothly all installed scripts should
 make use of /usr/bin/env to increase the chances of finding python.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
 ---
- build-aux/check-structs                  | 2 +-
- build-aux/extract-ofp-actions            | 2 +-
- build-aux/extract-ofp-errors             | 2 +-
- build-aux/extract-ofp-fields             | 2 +-
- build-aux/extract-ofp-msgs               | 2 +-
- build-aux/xml2nroff                      | 2 +-
- ovn/utilities/ovn-docker-overlay-driver  | 2 +-
- ovn/utilities/ovn-docker-underlay-driver | 2 +-
- ovsdb/ovsdb-doc                          | 2 +-
- ovsdb/ovsdb-dot.in                       | 2 +-
- ovsdb/ovsdb-idlc.in                      | 2 +-
- utilities/bugtool/ovs-bugtool.in         | 2 +-
- 12 files changed, 12 insertions(+), 12 deletions(-)
+ build-aux/check-structs                     | 2 +-
+ build-aux/dpdkstrip.py                      | 2 +-
+ build-aux/extract-ofp-actions               | 2 +-
+ build-aux/extract-ofp-errors                | 2 +-
+ build-aux/extract-ofp-fields                | 2 +-
+ build-aux/extract-ofp-msgs                  | 2 +-
+ build-aux/sodepends.py                      | 2 +-
+ build-aux/soexpand.py                       | 2 +-
+ build-aux/text2c                            | 2 +-
+ build-aux/xml2nroff                         | 2 +-
+ ovn/utilities/ovn-detrace.in                | 2 +-
+ ovn/utilities/ovn-docker-overlay-driver.in  | 2 +-
+ ovn/utilities/ovn-docker-underlay-driver.in | 2 +-
+ ovsdb/dot2pic                               | 2 +-
+ ovsdb/ovsdb-doc                             | 2 +-
+ ovsdb/ovsdb-dot.in                          | 2 +-
+ ovsdb/ovsdb-idlc.in                         | 2 +-
+ python/build/soutil.py                      | 2 +-
+ tests/flowgen.py                            | 2 +-
+ tests/ovsdb-monitor-sort.py                 | 2 +-
+ tests/uuidfilt.py                           | 2 +-
+ utilities/bugtool/ovs-bugtool.in            | 2 +-
+ utilities/ovs-check-dead-ifs.in             | 2 +-
+ utilities/ovs-dpctl-top.in                  | 2 +-
+ utilities/ovs-l3ping.in                     | 2 +-
+ utilities/ovs-parse-backtrace.in            | 2 +-
+ utilities/ovs-pcap.in                       | 2 +-
+ utilities/ovs-tcpdump.in                    | 2 +-
+ utilities/ovs-tcpundump.in                  | 2 +-
+ utilities/ovs-test.in                       | 2 +-
+ utilities/ovs-vlan-test.in                  | 2 +-
+ vtep/ovs-vtep.in                            | 2 +-
+ 32 files changed, 32 insertions(+), 32 deletions(-)
 
 diff --git a/build-aux/check-structs b/build-aux/check-structs
-index f79f235..5129b72 100755
+index 37ffa06..eb44c91 100755
 --- a/build-aux/check-structs
 +++ b/build-aux/check-structs
 @@ -1,4 +1,4 @@
@@ -38,8 +57,18 @@ index f79f235..5129b72 100755
  
  import os.path
  import sys
+diff --git a/build-aux/dpdkstrip.py b/build-aux/dpdkstrip.py
+index 48c7f06..b8b8ba9 100755
+--- a/build-aux/dpdkstrip.py
++++ b/build-aux/dpdkstrip.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ # Copyright (c) 2017 Red Hat, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
 diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
-index 0062ab8..ee8c4ff 100755
+index bd7131f..4d05ef9 100755
 --- a/build-aux/extract-ofp-actions
 +++ b/build-aux/extract-ofp-actions
 @@ -1,4 +1,4 @@
@@ -49,7 +78,7 @@ index 0062ab8..ee8c4ff 100755
  import sys
  import os.path
 diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
-index 2312b76..e36444e 100755
+index 71ae0bd..58ba006 100755
 --- a/build-aux/extract-ofp-errors
 +++ b/build-aux/extract-ofp-errors
 @@ -1,4 +1,4 @@
@@ -59,7 +88,7 @@ index 2312b76..e36444e 100755
  import sys
  import os.path
 diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
-index 498b887..c248e76 100755
+index 184b75e..cf339f8 100755
 --- a/build-aux/extract-ofp-fields
 +++ b/build-aux/extract-ofp-fields
 @@ -1,4 +1,4 @@
@@ -69,7 +98,7 @@ index 498b887..c248e76 100755
  import getopt
  import sys
 diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
-index 1813638..c2a91f9 100755
+index a67e870..92c4bda 100755
 --- a/build-aux/extract-ofp-msgs
 +++ b/build-aux/extract-ofp-msgs
 @@ -1,4 +1,4 @@
@@ -78,6 +107,36 @@ index 1813638..c2a91f9 100755
  
  import sys
  import os.path
+diff --git a/build-aux/sodepends.py b/build-aux/sodepends.py
+index 90cfaa0..45812bc 100755
+--- a/build-aux/sodepends.py
++++ b/build-aux/sodepends.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ # Copyright (c) 2008, 2011, 2017 Nicira, Inc.
+ #
+diff --git a/build-aux/soexpand.py b/build-aux/soexpand.py
+index 53ca640..00adcf4 100755
+--- a/build-aux/soexpand.py
++++ b/build-aux/soexpand.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ # Copyright (c) 2008, 2017 Nicira, Inc.
+ #
+diff --git a/build-aux/text2c b/build-aux/text2c
+index cb1f256..ab7910e 100755
+--- a/build-aux/text2c
++++ b/build-aux/text2c
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python3
+ 
+ import re
+ import sys
 diff --git a/build-aux/xml2nroff b/build-aux/xml2nroff
 index bd4e879..db45c56 100755
 --- a/build-aux/xml2nroff
@@ -88,28 +147,48 @@ index bd4e879..db45c56 100755
  
  # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
  #
-diff --git a/ovn/utilities/ovn-docker-overlay-driver b/ovn/utilities/ovn-docker-overlay-driver
-index 52de3db..3b1fa45 100755
---- a/ovn/utilities/ovn-docker-overlay-driver
-+++ b/ovn/utilities/ovn-docker-overlay-driver
+diff --git a/ovn/utilities/ovn-detrace.in b/ovn/utilities/ovn-detrace.in
+index e2e5b4c..5549219 100755
+--- a/ovn/utilities/ovn-detrace.in
++++ b/ovn/utilities/ovn-detrace.in
 @@ -1,4 +1,4 @@
--#! /usr/bin/python
-+#! /usr/bin/env python3
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2017 eBay Inc.
+ #
+diff --git a/ovn/utilities/ovn-docker-overlay-driver.in b/ovn/utilities/ovn-docker-overlay-driver.in
+index 65edfcd..895426b 100755
+--- a/ovn/utilities/ovn-docker-overlay-driver.in
++++ b/ovn/utilities/ovn-docker-overlay-driver.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
  # Copyright (C) 2015 Nicira, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
-diff --git a/ovn/utilities/ovn-docker-underlay-driver b/ovn/utilities/ovn-docker-underlay-driver
-index 2c9c4b6..551e7a1 100755
---- a/ovn/utilities/ovn-docker-underlay-driver
-+++ b/ovn/utilities/ovn-docker-underlay-driver
+diff --git a/ovn/utilities/ovn-docker-underlay-driver.in b/ovn/utilities/ovn-docker-underlay-driver.in
+index d91ce9f..e0c8db6 100755
+--- a/ovn/utilities/ovn-docker-underlay-driver.in
++++ b/ovn/utilities/ovn-docker-underlay-driver.in
 @@ -1,4 +1,4 @@
--#! /usr/bin/python
-+#! /usr/bin/env python3
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
  # Copyright (C) 2015 Nicira, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/ovsdb/dot2pic b/ovsdb/dot2pic
+index de67261..174e723 100755
+--- a/ovsdb/dot2pic
++++ b/ovsdb/dot2pic
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ # Copyright (c) 2009, 2010, 2011, 2013, 2017 Nicira, Inc.
+ #
 diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
-index 5cf26ee..bdf2dcc 100755
+index 406c293..d55c6e6 100755
 --- a/ovsdb/ovsdb-doc
 +++ b/ovsdb/ovsdb-doc
 @@ -1,4 +1,4 @@
@@ -119,7 +198,7 @@ index 5cf26ee..bdf2dcc 100755
  # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.
  #
 diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
-index 134ce22..893c408 100755
+index 8eea617..38ba33a 100755
 --- a/ovsdb/ovsdb-dot.in
 +++ b/ovsdb/ovsdb-dot.in
 @@ -1,4 +1,4 @@
@@ -129,17 +208,57 @@ index 134ce22..893c408 100755
  from datetime import date
  import ovs.db.error
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index 721ab50..bfbcf23 100755
+index 1ea2115..4ecb2e2 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
-+#! /usr/bin/env @PYTHON@
++#!/usr/bin/env @PYTHON@
  
+ from __future__ import print_function
  import getopt
- import os
+diff --git a/python/build/soutil.py b/python/build/soutil.py
+index b8027af..8f52803 100755
+--- a/python/build/soutil.py
++++ b/python/build/soutil.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ # Copyright (c) 2008, 2017 Nicira, Inc.
+ #
+diff --git a/tests/flowgen.py b/tests/flowgen.py
+index 221a8f2..5d96d76 100755
+--- a/tests/flowgen.py
++++ b/tests/flowgen.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ # Copyright (c) 2009, 2010, 2011, 2012, 2015, 2017 Nicira, Inc.
+ #
+diff --git a/tests/ovsdb-monitor-sort.py b/tests/ovsdb-monitor-sort.py
+index 7d368a7..ab4c38c 100755
+--- a/tests/ovsdb-monitor-sort.py
++++ b/tests/ovsdb-monitor-sort.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ 
+ # Breaks lines read from stdin into groups using blank lines as
+ # group separators, then sorts lines within the groups for
+diff --git a/tests/uuidfilt.py b/tests/uuidfilt.py
+index ea72812..f1a9aff 100755
+--- a/tests/uuidfilt.py
++++ b/tests/uuidfilt.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ import re
+ import sys
 diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
-index 963c50c..c84d7c2 100755
+index 8d220fd..76cedf4 100755
 --- a/utilities/bugtool/ovs-bugtool.in
 +++ b/utilities/bugtool/ovs-bugtool.in
 @@ -1,4 +1,4 @@
@@ -148,3 +267,106 @@ index 963c50c..c84d7c2 100755
  
  # This library is free software; you can redistribute it and/or
  # modify it under the terms of version 2.1 of the GNU Lesser General Public
+diff --git a/utilities/ovs-check-dead-ifs.in b/utilities/ovs-check-dead-ifs.in
+index ac54f6c..13d86b3 100755
+--- a/utilities/ovs-check-dead-ifs.in
++++ b/utilities/ovs-check-dead-ifs.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ 
+ import os
+ import re
+diff --git a/utilities/ovs-dpctl-top.in b/utilities/ovs-dpctl-top.in
+index 7f0f1f8..ece707a 100755
+--- a/utilities/ovs-dpctl-top.in
++++ b/utilities/ovs-dpctl-top.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2013 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-l3ping.in b/utilities/ovs-l3ping.in
+index 1b07972..9852699 100644
+--- a/utilities/ovs-l3ping.in
++++ b/utilities/ovs-l3ping.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+ # you may not use this file except in compliance with the License.
+diff --git a/utilities/ovs-parse-backtrace.in b/utilities/ovs-parse-backtrace.in
+index 350cbd9..1960fb4 100755
+--- a/utilities/ovs-parse-backtrace.in
++++ b/utilities/ovs-parse-backtrace.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2012 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-pcap.in b/utilities/ovs-pcap.in
+index fc15321..bd55a41 100755
+--- a/utilities/ovs-pcap.in
++++ b/utilities/ovs-pcap.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2010 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-tcpdump.in b/utilities/ovs-tcpdump.in
+index 91fa14e..bad67b7 100755
+--- a/utilities/ovs-tcpdump.in
++++ b/utilities/ovs-tcpdump.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2016 Red Hat, Inc.
+ #
+diff --git a/utilities/ovs-tcpundump.in b/utilities/ovs-tcpundump.in
+index c99015b..9a617ce 100755
+--- a/utilities/ovs-tcpundump.in
++++ b/utilities/ovs-tcpundump.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2010 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-test.in b/utilities/ovs-test.in
+index fb1f9ad..4dba169 100644
+--- a/utilities/ovs-test.in
++++ b/utilities/ovs-test.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+ # you may not use this file except in compliance with the License.
+diff --git a/utilities/ovs-vlan-test.in b/utilities/ovs-vlan-test.in
+index e229498..5b70118 100755
+--- a/utilities/ovs-vlan-test.in
++++ b/utilities/ovs-vlan-test.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ #
+ # Copyright (c) 2010 Nicira, Inc.
+ #
+diff --git a/vtep/ovs-vtep.in b/vtep/ovs-vtep.in
+index 98748e4..3f12ae2 100755
+--- a/vtep/ovs-vtep.in
++++ b/vtep/ovs-vtep.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#!/usr/bin/env @PYTHON@
+ # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
index 6a1b832..540bda6 100644
--- a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
+++ b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
@@ -13,11 +13,10 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  utilities/checkpatch.py                               | 2 +-
  utilities/ovs-dev.py                                  | 2 +-
  utilities/ovs-pipegen.py                              | 2 +-
- vtep/ovs-vtep                                         | 2 +-
  xenserver/etc_xapi.d_plugins_openvswitch-cfg-update   | 2 +-
  xenserver/opt_xensource_libexec_interface-reconfigure | 2 +-
  xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
+ 8 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities
 index 0be7199..d2cce42 100755
@@ -46,7 +45,7 @@ index 26eb5c3..2e1932b 100755
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # Copyright (c) 2016 Red Hat, Inc.
+ # Copyright (c) 2016, 2017 Red Hat, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
 diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py
@@ -69,16 +68,6 @@ index 4bf240f..2a8f13e 100755
  # Copyright (c) 2013, 2014, 2015 Nicira, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
-diff --git a/vtep/ovs-vtep b/vtep/ovs-vtep
-index fd652d4..19d63f9 100755
---- a/vtep/ovs-vtep
-+++ b/vtep/ovs-vtep
-@@ -1,4 +1,4 @@
--#! /usr/bin/env python
-+#! /usr/bin/env python3
- # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
- #
- # Licensed under the Apache License, Version 2.0 (the "License");
 diff --git a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update b/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
 index e7404e3..5edad76 100755
 --- a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
diff --git a/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
index 5c86aac..711a148 100644
--- a/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
@@ -13,10 +13,10 @@ diff --git a/Makefile.am b/Makefile.am
 index ff7d70a..2fc1f13 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -189,7 +189,7 @@ CLEAN_LOCAL += clean-pycov
- # Makefile in datapath/linux, needed to get the list of files to
- # distribute, requires GNU make extensions.
- if GNU_MAKE
+@@ -187,7 +187,7 @@ CLEAN_LOCAL += clean-pycov
+ 
+ # If we're checked out from a Git repository, make sure that every
+ # file that is in Git is distributed.
 -ALL_LOCAL += dist-hook-git
 +# ALL_LOCAL += dist-hook-git
  dist-hook-git: distfiles
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
new file mode 100644
index 0000000..5b53f96
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
@@ -0,0 +1,110 @@
+From fb68120ef8aed625b04b2fbd2cb78fc59a7b7432 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 30 Mar 2016 06:23:45 -0400
+Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
+
+Signed-off-by: Radu Patriu <radu.patriu@enea.com>
+
+Fix ptest for v2.5
+ - Copy certain files from srcdir since it has been different from
+   build directory.
+ - Copy more necessary files for new added test cases.
+ - Modify config files for running on target.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+
+---
+ Makefile.am |  1 +
+ test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 73 insertions(+)
+ create mode 100644 test.mk
+
+diff --git a/Makefile.am b/Makefile.am
+index ea63acb..ff7d70a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -429,3 +429,4 @@ include windows/automake.mk
+ include ovn/automake.mk
+ include selinux/automake.mk
+ include build-aux/automake.mk
++include test.mk
+diff --git a/test.mk b/test.mk
+new file mode 100644
+index 0000000..b10a581
+--- /dev/null
++++ b/test.mk
+@@ -0,0 +1,74 @@
++TEST_DEST ?= ${prefix}/lib/openvswitch
++TEST_ROOT ?= ${prefix}/lib/openvswitch
++TEST_DEPEND =
++
++if HAVE_OPENSSL
++TEST_DEPEND += $(TESTPKI_FILES)
++endif
++
++test-install: $(TEST_DEPEND)
++	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
++	install -d $(TEST_DEST)/tests ;\
++	install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
++	install -d $(TEST_DEST)/python ;\
++	install -d $(TEST_DEST)/python/ovs ;\
++	install -d $(TEST_DEST)/python/ovs/db ;\
++	install -d $(TEST_DEST)/python/ovs/compat ;\
++	install -d $(TEST_DEST)/python/ovs/compat/sortedcontainers ;\
++	install -d $(TEST_DEST)/python/ovs/unixctl ;\
++	install -d $(TEST_DEST)/vswitchd ;\
++	install $(srcdir)/vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
++	install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
++	install -d $(TEST_DEST)/debian ;\
++	install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
++	install -d $(TEST_DEST)/build-aux ;\
++	install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux ;\
++	install -d $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
++	install -d $(TEST_DEST)/vtep ;\
++	install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
++	install -d $(TEST_DEST)/ovn ;\
++	install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
++	install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
++	install -d $(TEST_DEST)/utilities ;\
++	install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
++	install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
++	for p in $$list ; do \
++	  echo $$p ;\
++	  p=$${p#../git/} ;\
++	  pre=$${p#tests\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
++	    if test -f $$p ; then \
++	      install $$p $(TEST_DEST)/tests/$$pre ;\
++	    else \
++	      install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
++	    fi ;\
++	    continue ;\
++	  fi ;\
++	  pre=$${p#python\/ovs\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
++	    if test -f $$p ; then \
++	      install $$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    else \
++	      install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    fi ;\
++	    continue ;\
++	  fi; \
++	done ;\
++	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
new file mode 100644
index 0000000..9a792e6
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
@@ -0,0 +1,45 @@
+From f45c0a9d712113417e7b56c199f8576b470695ae Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 29 May 2018 18:57:46 +0000
+Subject: [PATCH] systemd: update tool paths
+
+We are using the rhel files but we install our tools in a slightly
+different path, update accordingly.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ rhel/usr_lib_systemd_system_ovs-vswitchd.service.in | 4 ++--
+ rhel/usr_lib_systemd_system_ovsdb-server.service    | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
+index 11b34c6..94c48f8 100644
+--- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
++++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
+@@ -15,8 +15,8 @@ EnvironmentFile=/etc/openvswitch/default.conf
+ EnvironmentFile=-/etc/sysconfig/openvswitch
+ EnvironmentFile=-/run/openvswitch/useropts
+ @begin_dpdk@
+-ExecStartPre=-/bin/sh -c '/usr/bin/chown :$${OVS_USER_ID##*:} /dev/hugepages'
+-ExecStartPre=-/usr/bin/chmod 0775 /dev/hugepages
++ExecStartPre=-/bin/sh -c '/bin/chown :$${OVS_USER_ID##*:} /dev/hugepages'
++ExecStartPre=-/bin/chmod 0775 /dev/hugepages
+ @end_dpdk@
+ ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
+           --no-ovsdb-server --no-monitor --system-id=random \
+diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
+index 0fa57a9..75c9e02 100644
+--- a/rhel/usr_lib_systemd_system_ovsdb-server.service
++++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
+@@ -10,7 +10,7 @@ Type=forking
+ Restart=on-failure
+ EnvironmentFile=/etc/openvswitch/default.conf
+ EnvironmentFile=-/etc/sysconfig/openvswitch
+-ExecStartPre=/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch
++ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch
+ ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
+ EnvironmentFile=-/run/openvswitch/useropts
+ ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 58e0fcb..70ac5bc 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -63,6 +63,8 @@ FILES_${PN}-switch = "\
 	${systemd_unitdir}/system/ovs-vswitchd.service \
 	${systemd_unitdir}/system/openvswitch.service \
 	${systemd_unitdir}/system/ovsdb-server.service \
+	${sysconfdir}/sysconfig/openvswitch \
+	${sysconfdir}/openvswitch/default.conf \
 	"
 
 # silence a warning
@@ -92,6 +94,14 @@ do_configure_prepend() {
 	CC=`echo '${CC}' | sed 's/-Wa,/-Xassembler /g'`
 }
 
+do_install_prepend() {
+	SERVICE_FILE="${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service"
+	${S}/build-aux/dpdkstrip.py \
+	    ${@bb.utils.contains('PACKAGECONFIG','dpdk','--dpdk','--nodpdk',d)} \
+	    < ${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in \
+	    > ${SERVICE_FILE}
+}
+
 do_install_append() {
 	install -d ${D}/${sysconfdir}/default/
 	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
@@ -103,6 +113,14 @@ do_install_append() {
 	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
 	true || rm -fr ${D}/${datadir}/${PN}/pki
 
+	install -d ${D}/${sysconfdir}/sysconfig
+	install -m 644 ${S}/rhel/usr_share_openvswitch_scripts_systemd_sysconfig.template \
+		${D}/${sysconfdir}/sysconfig/openvswitch
+
+	install -d ${D}/${sysconfdir}/openvswitch
+	install -m 644 ${S}/rhel/etc_openvswitch_default.conf \
+		${D}/${sysconfdir}/openvswitch/default.conf
+
 	install -d ${D}/${systemd_unitdir}/system/
 	install -m 644 ${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service \
 		${D}/${systemd_unitdir}/system/ovs-vswitchd.service
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index c3a8301..9cdd484 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -12,39 +12,26 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.7.3+${SRCREV}"
+PV = "2.9.2+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1"
+SRCREV = "7e614671cba3c4e338d1c5003b74a10047d7a8eb"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
            file://openvswitch-testcontroller-setup \
-           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.7 \
+           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.9 \
            file://openvswitch-add-ptest-${SRCREV}.patch \
            file://run-ptest \
            file://disable_m4_check.patch \
            file://kernel_module.patch \
            file://python-make-remaining-scripts-use-usr-bin-env.patch \
-           file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
            file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
+           file://systemd-update-tool-paths.patch \
            "
 
-# Temporarily backport patches to better support py3. These have been
-# merged upstream but are not part of v2.7.1.
-SRC_URI += " \
-           file://0001-Python3-compatibility-Convert-print-statements.patch \
-           file://0002-Python3-compatibility-exception-cleanup.patch \
-           file://0003-Python3-compatibility-execfile-to-exec.patch \
-           file://0004-Python3-compatibility-iteritems-to-items.patch \
-           file://0005-Python3-compatibility-fix-integer-problems.patch \
-           file://0006-Python3-compatibility-math-error-compatibility.patch \
-           file://0007-Python3-compatibility-unicode-to-str.patch \
-           file://0008-AUTHORS-Add-Jason-Wessel.patch \
-"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
 
 DPDK_INSTALL_DIR ?= "/opt/dpdk"
@@ -71,5 +58,4 @@ do_install_ptest() {
 
 do_install_append() {
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
-	rm -r ${D}/${localstatedir}/run
 }
-- 
2.7.4


