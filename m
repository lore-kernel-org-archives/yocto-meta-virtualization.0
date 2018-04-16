Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE23EE00C27; Mon, 16 Apr 2018 00:40:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,HEXHASH_WORD,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  3.0 HEXHASH_WORD Multiple instances of word + hexadecimal hash
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E908DE00C19
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 00:40:16 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3G7eFt9013035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 00:40:15 -0700
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 16 Apr 2018 00:40:14 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Mon, 16 Apr 2018 15:40:12 +0800
Message-ID: <1523864412-20930-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH] openvswitch: refresh patches to fix QA warning
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
X-List-Received-Date: Mon, 16 Apr 2018 07:40:20 -0000
Content-Type: text/plain

Refresh patches with devtool command to fix do_patch warning.
Drop CVE-2017-9263.patch since it had been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...on-make-remaining-scripts-use-usr-bin-env.patch | 24 ++++++++----------
 ...n-switch-remaining-scripts-to-use-python3.patch |  6 ++---
 ...n3-compatibility-Convert-print-statements.patch | 24 ++++++++----------
 ...-the-linux-if_packet.h-Interface-directly.patch | 10 +++-----
 ...Define-WAIT_ANY-if-not-provided-by-system.patch | 12 ++++-----
 ...2-Python3-compatibility-exception-cleanup.patch | 14 +++++------
 ...03-Python3-compatibility-execfile-to-exec.patch | 10 +++-----
 ...-Python3-compatibility-iteritems-to-items.patch | 16 ++++++------
 ...ython3-compatibility-fix-integer-problems.patch | 10 +++-----
 ...n3-compatibility-math-error-compatibility.patch | 10 +++-----
 ...0007-Python3-compatibility-unicode-to-str.patch | 10 +++-----
 .../0008-AUTHORS-Add-Jason-Wessel.patch            |  8 +++---
 .../openvswitch-git/CVE-2017-9263.patch            | 29 ----------------------
 .../openvswitch-git/disable_m4_check.patch         | 14 ++++++++---
 .../openvswitch-git/kernel_module.patch            | 14 ++++++++---
 ...-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch |  8 +++---
 recipes-networking/openvswitch/openvswitch_git.bb  |  1 -
 17 files changed, 88 insertions(+), 132 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch

diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
index 4441c1e..deff10b 100644
--- a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
+++ b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
@@ -1,4 +1,4 @@
-From 04ad1c3d9f47cfdf4ad9b5d685e953ec094326ff Mon Sep 17 00:00:00 2001
+From f21a0490555d5fe8f5a9ce982defa666a64151c0 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 13 Jan 2017 16:12:55 -0500
 Subject: [PATCH] python: make remaining scripts use /usr/bin/env
@@ -12,6 +12,7 @@ PYTHON. To make this function smoothly all installed scripts should
 make use of /usr/bin/env to increase the chances of finding python.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
 ---
  build-aux/check-structs                  | 2 +-
  build-aux/extract-ofp-actions            | 2 +-
@@ -28,7 +29,7 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  12 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/build-aux/check-structs b/build-aux/check-structs
-index f79f235..c7b8730 100755
+index f79f235..5129b72 100755
 --- a/build-aux/check-structs
 +++ b/build-aux/check-structs
 @@ -1,4 +1,4 @@
@@ -38,7 +39,7 @@ index f79f235..c7b8730 100755
  import os.path
  import sys
 diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
-index 184447b..92ea18d 100755
+index 0062ab8..ee8c4ff 100755
 --- a/build-aux/extract-ofp-actions
 +++ b/build-aux/extract-ofp-actions
 @@ -1,4 +1,4 @@
@@ -48,7 +49,7 @@ index 184447b..92ea18d 100755
  import sys
  import os.path
 diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
-index 9642593..11e6de7 100755
+index 2312b76..e36444e 100755
 --- a/build-aux/extract-ofp-errors
 +++ b/build-aux/extract-ofp-errors
 @@ -1,4 +1,4 @@
@@ -58,7 +59,7 @@ index 9642593..11e6de7 100755
  import sys
  import os.path
 diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
-index 498b887..5d6bcec 100755
+index 498b887..c248e76 100755
 --- a/build-aux/extract-ofp-fields
 +++ b/build-aux/extract-ofp-fields
 @@ -1,4 +1,4 @@
@@ -68,7 +69,7 @@ index 498b887..5d6bcec 100755
  import getopt
  import sys
 diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
-index 1813638..e9e3c25 100755
+index 1813638..c2a91f9 100755
 --- a/build-aux/extract-ofp-msgs
 +++ b/build-aux/extract-ofp-msgs
 @@ -1,4 +1,4 @@
@@ -78,7 +79,7 @@ index 1813638..e9e3c25 100755
  import sys
  import os.path
 diff --git a/build-aux/xml2nroff b/build-aux/xml2nroff
-index bd4e879..9d81503 100755
+index bd4e879..db45c56 100755
 --- a/build-aux/xml2nroff
 +++ b/build-aux/xml2nroff
 @@ -1,4 +1,4 @@
@@ -88,7 +89,7 @@ index bd4e879..9d81503 100755
  # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
  #
 diff --git a/ovn/utilities/ovn-docker-overlay-driver b/ovn/utilities/ovn-docker-overlay-driver
-index 52de3db..c90f02b 100755
+index 52de3db..3b1fa45 100755
 --- a/ovn/utilities/ovn-docker-overlay-driver
 +++ b/ovn/utilities/ovn-docker-overlay-driver
 @@ -1,4 +1,4 @@
@@ -98,7 +99,7 @@ index 52de3db..c90f02b 100755
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
 diff --git a/ovn/utilities/ovn-docker-underlay-driver b/ovn/utilities/ovn-docker-underlay-driver
-index 2c9c4b6..89b804c 100755
+index 2c9c4b6..551e7a1 100755
 --- a/ovn/utilities/ovn-docker-underlay-driver
 +++ b/ovn/utilities/ovn-docker-underlay-driver
 @@ -1,4 +1,4 @@
@@ -108,7 +109,7 @@ index 2c9c4b6..89b804c 100755
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
 diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
-index 5cf26ee..f76f4bd 100755
+index 5cf26ee..bdf2dcc 100755
 --- a/ovsdb/ovsdb-doc
 +++ b/ovsdb/ovsdb-doc
 @@ -1,4 +1,4 @@
@@ -147,6 +148,3 @@ index 963c50c..c84d7c2 100755
  
  # This library is free software; you can redistribute it and/or
  # modify it under the terms of version 2.1 of the GNU Lesser General Public
--- 
-2.7.4
-
diff --git a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
index a02b2a4..6a1b832 100644
--- a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
+++ b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
@@ -1,4 +1,4 @@
-From 176528ca3a8b76c9d0bb71b1e56eeebccc655c71 Mon Sep 17 00:00:00 2001
+From 39d1af836d844c89e625cfc908545e93977af8be Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Wed, 3 May 2017 10:39:12 -0400
 Subject: [PATCH] python: switch remaining scripts to use python3
@@ -6,6 +6,7 @@ Subject: [PATCH] python: switch remaining scripts to use python3
 Work to remove the main openvswitch package's dependency on python 2.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
 ---
  ofproto/ipfix-gen-entities                            | 2 +-
  tests/test-l7.py                                      | 2 +-
@@ -108,6 +109,3 @@ index a776c00..d5ff8af 100755
  # Copyright (c) 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
--- 
-2.7.4
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch b/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
index d619758..7bdcc00 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
@@ -1,7 +1,7 @@
-From c5c18f9c5f1b7217d43af43be9736c1762c7ebba Mon Sep 17 00:00:00 2001
+From 3658d861c3c83caab9040bec04b195be3f86d4ce Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 1/8] Python3 compatibility: Convert print statements
+Subject: [PATCH] Python3 compatibility: Convert print statements
 
 Commit d34a1cc02536f9a812517a71accec3fbd3c6c98b from
 https://github.com/openvswitch/ovs.git
@@ -11,6 +11,7 @@ python2.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  build-aux/check-structs       |   4 +-
  build-aux/extract-ofp-actions |  68 +++---
@@ -22,7 +23,7 @@ Signed-off-by: Ben Pfaff <blp@ovn.org>
  7 files changed, 306 insertions(+), 305 deletions(-)
 
 diff --git a/build-aux/check-structs b/build-aux/check-structs
-index f79f235..bae511f 100755
+index 5129b72..cbb19b6 100755
 --- a/build-aux/check-structs
 +++ b/build-aux/check-structs
 @@ -211,7 +211,7 @@ def checkStructs():
@@ -44,7 +45,7 @@ index f79f235..bae511f 100755
  
      global fileName
 diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
-index 0062ab8..874e6b4 100755
+index ee8c4ff..67e3848 100755
 --- a/build-aux/extract-ofp-actions
 +++ b/build-aux/extract-ofp-actions
 @@ -67,7 +67,7 @@ def fatal(msg):
@@ -187,7 +188,7 @@ index 0062ab8..874e6b4 100755
  if __name__ == '__main__':
      if '--help' in sys.argv:
 diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
-index 2312b76..336a240 100755
+index e36444e..97d62d2 100755
 --- a/build-aux/extract-ofp-errors
 +++ b/build-aux/extract-ofp-errors
 @@ -426,7 +426,7 @@ static const struct ofperr_domain %s = {
@@ -200,7 +201,7 @@ index 2312b76..336a240 100755
                  print ("        {       -1, -1,  -1 }, /* %s */" % enum)
          print ("""\
 diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
-index 498b887..425a85f 100755
+index c248e76..80c7d35 100755
 --- a/build-aux/extract-ofp-fields
 +++ b/build-aux/extract-ofp-fields
 @@ -728,7 +728,7 @@ def make_ovs_fields(meta_flow_h, meta_flow_xml):
@@ -213,7 +214,7 @@ index 498b887..425a85f 100755
      recursively_replace(doc, 'oxm_classes', make_oxm_classes_xml(document))
  
 diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
-index 1813638..a67e870 100755
+index c2a91f9..92c4bda 100755
 --- a/build-aux/extract-ofp-msgs
 +++ b/build-aux/extract-ofp-msgs
 @@ -56,14 +56,14 @@ def fatal(msg):
@@ -241,7 +242,7 @@ index 1813638..a67e870 100755
 +            print(line)
          
 diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
-index 5cf26ee..b34fb11 100755
+index bdf2dcc..e82ad59 100755
 --- a/ovsdb/ovsdb-doc
 +++ b/ovsdb/ovsdb-doc
 @@ -258,7 +258,7 @@ represent strong references; thin lines represent weak references.
@@ -272,11 +273,11 @@ index 5cf26ee..b34fb11 100755
      except error.Error, e:
          sys.stderr.write("%s: %s\n" % (argv0, e.msg))
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index 721ab50..1064448 100755
+index bfbcf23..62442ee 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -1,5 +1,6 @@
- #! @PYTHON@
+ #! /usr/bin/env @PYTHON@
  
 +from __future__ import print_function
  import getopt
@@ -1259,6 +1260,3 @@ index 721ab50..1064448 100755
              elif key in ['-C', '--directory']:
                  os.chdir(value)
              else:
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch b/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
index 3571245..f1f9bef 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
@@ -1,17 +1,18 @@
-From 1cec65e45f011c3f52eed5e27d3d816502e36610 Mon Sep 17 00:00:00 2001
+From 28b2d17de9414161d5edd67766bd4b452cd809ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 20 Mar 2017 12:12:51 -0700
-Subject: [PATCH 1/2] use the linux if_packet.h Interface directly
+Subject: [PATCH] use the linux if_packet.h Interface directly
 
 Helps compiling with musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  lib/netdev-linux.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/lib/netdev-linux.c b/lib/netdev-linux.c
-index a5a9ec1ab..9dd40acdd 100644
+index fccf88f..b703156 100644
 --- a/lib/netdev-linux.c
 +++ b/lib/netdev-linux.c
 @@ -33,14 +33,13 @@
@@ -30,6 +31,3 @@ index a5a9ec1ab..9dd40acdd 100644
  #include <net/route.h>
  #include <netinet/in.h>
  #include <poll.h>
--- 
-2.12.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
index e44ffda..f997bbf 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
@@ -1,21 +1,22 @@
-From 803bde12d32d16eefeae03422a0ac682e0601c43 Mon Sep 17 00:00:00 2001
+From 801023e72b31e7c49cbccedd76ade33a17fcbe45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 20 Mar 2017 12:13:30 -0700
-Subject: [PATCH 2/2] Define WAIT_ANY if not provided by system
+Subject: [PATCH] Define WAIT_ANY if not provided by system
 
 POSIX does not define it and uses -1 directly
 some libc do not have this definitions
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  tests/test-ovn.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/tests/test-ovn.c b/tests/test-ovn.c
-index 2e82a6f0d..76e7db9fb 100644
+index 84adf81..2bc6bdf 100644
 --- a/tests/test-ovn.c
 +++ b/tests/test-ovn.c
-@@ -37,6 +37,10 @@
+@@ -38,6 +38,10 @@
  #include "simap.h"
  #include "util.h"
  
@@ -26,6 +27,3 @@ index 2e82a6f0d..76e7db9fb 100644
  /* --relops: Bitmap of the relational operators to test, in exhaustive test. */
  static unsigned int test_relops;
  
--- 
-2.12.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch b/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
index 59c0f3e..70abd26 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
@@ -1,7 +1,7 @@
-From c98fee41d130cb946aa4e60fefaa6cbf203f6790 Mon Sep 17 00:00:00 2001
+From c0ba116eab401431b4f11b66bd7d1b42741b03c3 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 2/8] Python3 compatibility: exception cleanup
+Subject: [PATCH] Python3 compatibility: exception cleanup
 
 Commit 52e4a477f0b3c0a0ece7adeede6e06e07814f8b9 from
 https://github.com/openvswitch/ovs.git
@@ -11,6 +11,7 @@ to use the "as" form for "except:".
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  build-aux/extract-ofp-fields | 2 +-
  ovsdb/ovsdb-doc              | 4 ++--
@@ -18,7 +19,7 @@ Signed-off-by: Ben Pfaff <blp@ovn.org>
  3 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
-index 425a85f..61e752b 100755
+index 80c7d35..6286c9c 100755
 --- a/build-aux/extract-ofp-fields
 +++ b/build-aux/extract-ofp-fields
 @@ -784,7 +784,7 @@ if __name__ == "__main__":
@@ -31,7 +32,7 @@ index 425a85f..61e752b 100755
          sys.exit(1)
  
 diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
-index b34fb11..918e88a 100755
+index e82ad59..9448713 100755
 --- a/ovsdb/ovsdb-doc
 +++ b/ovsdb/ovsdb-doc
 @@ -278,7 +278,7 @@ if __name__ == "__main__":
@@ -53,7 +54,7 @@ index b34fb11..918e88a 100755
          sys.exit(1)
  
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index 1064448..8b85f0d 100755
+index 62442ee..e7e1c6b 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -1098,7 +1098,7 @@ if __name__ == "__main__":
@@ -74,6 +75,3 @@ index 1064448..8b85f0d 100755
          sys.stderr.write("%s: %s\n" % (argv0, e))
          sys.exit(1)
  
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch b/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
index a85980e..98d77c8 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
@@ -1,7 +1,7 @@
-From 9cbae86be03756df76560c15720756f9ac088144 Mon Sep 17 00:00:00 2001
+From 8557d51e8c7325a17219911e9a65eeb3946e869f Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 3/8] Python3 compatibility: execfile to exec
+Subject: [PATCH] Python3 compatibility: execfile to exec
 
 Commit a4d10a7ca937d73873f6f98619d88682e69f5dbe from
 https://github.com/openvswitch/ovs.git
@@ -11,12 +11,13 @@ exec().
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  ovsdb/ovsdb-idlc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index 8b85f0d..3fa1a0f 100755
+index e7e1c6b..e1551f9 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -17,7 +17,7 @@ def parseSchema(filename):
@@ -28,6 +29,3 @@ index 8b85f0d..3fa1a0f 100755
      ovs.json.to_stream(schemaJson, sys.stdout)
      sys.stdout.write('\n')
  
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch b/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
index ddc86db..092c42d 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
@@ -1,7 +1,7 @@
-From 0f318e472d9897d99395adcfb17cbeaff05677ba Mon Sep 17 00:00:00 2001
+From 7e4bd5c2af85b1293be0a92b18f7930bda2ab41a Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 4/8] Python3 compatibility: iteritems to items
+Subject: [PATCH] Python3 compatibility: iteritems to items
 
 Commit 4ab665623cbb4c6506e48b82e0c9fe8585f42e13 from
 https://github.com/openvswitch/ovs.git
@@ -11,6 +11,7 @@ items().
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  build-aux/extract-ofp-actions | 2 +-
  build-aux/extract-ofp-errors  | 2 +-
@@ -19,7 +20,7 @@ Signed-off-by: Ben Pfaff <blp@ovn.org>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
-index 874e6b4..c11297c 100755
+index 67e3848..c7858bd 100755
 --- a/build-aux/extract-ofp-actions
 +++ b/build-aux/extract-ofp-actions
 @@ -13,7 +13,7 @@ version_map = {"1.0": 0x01,
@@ -32,7 +33,7 @@ index 874e6b4..c11297c 100755
  # Map from vendor name to the length of the action header.
  vendor_map = {"OF": (0x00000000,  4),
 diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
-index 336a240..71ae0bd 100755
+index 97d62d2..58ba006 100755
 --- a/build-aux/extract-ofp-errors
 +++ b/build-aux/extract-ofp-errors
 @@ -14,7 +14,7 @@ version_map = {"1.0": 0x01,
@@ -45,7 +46,7 @@ index 336a240..71ae0bd 100755
  token = None
  line = ""
 diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
-index 61e752b..ef997dd 100755
+index 6286c9c..f624728 100755
 --- a/build-aux/extract-ofp-fields
 +++ b/build-aux/extract-ofp-fields
 @@ -16,7 +16,7 @@ VERSION = {"1.0": 0x01,
@@ -58,7 +59,7 @@ index 61e752b..ef997dd 100755
  TYPES = {"u8":       (1,   False),
           "be16":     (2,   False),
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index 3fa1a0f..615548f 100755
+index e1551f9..b70a599 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -138,7 +138,7 @@ def printCIDLHeader(schemaFile):
@@ -97,6 +98,3 @@ index 3fa1a0f..615548f 100755
          structName = "%s%s" % (prefix, tableName.lower())
          if table.is_root:
              is_root = "true"
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch b/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
index 717a97d..d6f9364 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
@@ -1,7 +1,7 @@
-From bc29f98f0137fa1083a4cacf832d52f740d150a8 Mon Sep 17 00:00:00 2001
+From d22c7f1c6ade82a0cd646cfcd8df9adda6cd1ad6 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 5/8] Python3 compatibility: fix integer problems
+Subject: [PATCH] Python3 compatibility: fix integer problems
 
 Commit fa145f1a53943243f94a32ce98525db8494b0052 from
 https://github.com/openvswitch/ovs.git
@@ -15,13 +15,14 @@ The simple answer is to convert it with int() and move on.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  ovsdb/ovsdb-idlc.in   | 2 +-
  python/build/nroff.py | 2 ++
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index 615548f..7cbcbf5 100755
+index b70a599..3645275 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -358,7 +358,7 @@ static void
@@ -46,6 +47,3 @@ index c23837f..401f699 100644
      extend = x + len(s) - len(text[y])
      if extend > 0:
          text[y] += ' ' * extend
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch b/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
index 54905cd..c53502b 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
@@ -1,7 +1,7 @@
-From 3a9fcf1c8f60c160c282c9755ee1c7f9f7e113c3 Mon Sep 17 00:00:00 2001
+From 7f542122d62b20d11198bfdb0f2c6a460261b5e7 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 6/8] Python3 compatibility: math error compatibility
+Subject: [PATCH] Python3 compatibility: math error compatibility
 
 Commit 3fa5aa4294377e0f35267936d0c5caea3e61db48 from
 https://github.com/openvswitch/ovs.git
@@ -34,12 +34,13 @@ EOF
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  build-aux/extract-ofp-actions | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
-index c11297c..bd7131f 100755
+index c7858bd..4d05ef9 100755
 --- a/build-aux/extract-ofp-actions
 +++ b/build-aux/extract-ofp-actions
 @@ -35,7 +35,7 @@ line = ""
@@ -51,6 +52,3 @@ index c11297c..bd7131f 100755
  
  def open_file(fn):
      global file_name
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch b/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
index faa32b7..753490f 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
@@ -1,7 +1,7 @@
-From 2fe58f87b00d0ec24d6997930d0bcdb130c84396 Mon Sep 17 00:00:00 2001
+From c78b39ae9ba6337210d6a9e4ccc4753cb1c3b48f Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Thu, 29 Jun 2017 20:33:23 -0700
-Subject: [PATCH 7/8] Python3 compatibility: unicode to str
+Subject: [PATCH] Python3 compatibility: unicode to str
 
 Commit 7430959d4ad17db89b8387c3aef58c8b230cad10 from
 https://github.com/openvswitch/ovs.git
@@ -19,12 +19,13 @@ type because it doesn't exist.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  ovsdb/ovsdb-doc | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
-index 918e88a..406c293 100755
+index 9448713..d55c6e6 100755
 --- a/ovsdb/ovsdb-doc
 +++ b/ovsdb/ovsdb-doc
 @@ -65,9 +65,15 @@ def columnGroupToNroff(table, groupXml, documented_columns):
@@ -46,6 +47,3 @@ index 918e88a..406c293 100755
                      type_ = ovs.db.types.BaseType.from_json(type_json)
                  else:
                      type_ = column.type.value
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch b/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch
index d2c2be7..f55a5ca 100644
--- a/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch
@@ -1,12 +1,13 @@
-From a3289add8368e0c970ae1c1c84f5df1f817ed43c Mon Sep 17 00:00:00 2001
+From f8491645416952b31000f42777ff79486a7b0511 Mon Sep 17 00:00:00 2001
 From: Ben Pfaff <blp@ovn.org>
 Date: Thu, 6 Jul 2017 14:01:27 -0700
-Subject: [PATCH 8/8] AUTHORS: Add Jason Wessel.
+Subject: [PATCH] AUTHORS: Add Jason Wessel.
 
 Commit a91c4cfaf863718bc94fb9c88939bd0b0385a6fe from
 https://github.com/openvswitch/ovs.git
 
 Signed-off-by: Ben Pfaff <blp@ovn.org>
+
 ---
  AUTHORS.rst | 1 +
  1 file changed, 1 insertion(+)
@@ -23,6 +24,3 @@ index 63e6a8d..d0dc70d 100644
  Jasper Capel                    jasper@capel.tv
  Jean Tourrilhes                 jt@hpl.hp.com
  Jeremy Stribling                strib@nicira.com
--- 
-2.5.0
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch b/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
deleted file mode 100644
index 0fc3aa1..0000000
--- a/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-A buggy or malicious switch could send a role status message with a bad
-reason code, which if printed by OVS would cause it to abort.  This fixes
-the problem.
-
-CVE: CVE-2017-9263
-Upstream-Status: Submitted
-
-Reported-by: Bhargava Shastry <bshastry at sec.t-labs.tu-berlin.de>
-Signed-off-by: Ben Pfaff <blp at ovn.org>
----
- lib/ofp-print.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/ofp-print.c b/lib/ofp-print.c
-index 7ca953100539..1932baf4871f 100644
---- a/lib/ofp-print.c
-+++ b/lib/ofp-print.c
-@@ -2147,7 +2147,8 @@ ofp_print_role_status_message(struct ds *string, const struct ofp_header *oh)
-         break;
-     case OFPCRR_N_REASONS:
-     default:
--        OVS_NOT_REACHED();
-+        ds_put_cstr(string, "(unknown)");
-+        break;
-     }
- }
- 
--- 
-2.10.2
diff --git a/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
index 1ad5d6f..5c86aac 100644
--- a/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
@@ -1,13 +1,19 @@
-Disable m4 file test where sources are built from git.
+From f675d7209f999ce80cb4249c4ebb216697387b71 Mon Sep 17 00:00:00 2001
+From: Amy Fong <amy.fong@windriver.com>
+Date: Thu, 29 Jan 2015 09:56:03 -0500
+Subject: [PATCH] Disable m4 file test where sources are built from git.
 
 Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
 ---
- Makefile.am |    2 +-
+ Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/Makefile.am b/Makefile.am
+index ff7d70a..2fc1f13 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -185,7 +185,7 @@
+@@ -189,7 +189,7 @@ CLEAN_LOCAL += clean-pycov
  # Makefile in datapath/linux, needed to get the list of files to
  # distribute, requires GNU make extensions.
  if GNU_MAKE
@@ -15,4 +21,4 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
 +# ALL_LOCAL += dist-hook-git
  dist-hook-git: distfiles
  	@if test -e $(srcdir)/.git && (git --version) >/dev/null 2>&1; then \
- 	  (cd datapath && $(MAKE) distfiles);				    \
+ 	  (cd datapath && $(MAKE) distfiles); \
diff --git a/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch b/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
index 033cfb8..c177202 100644
--- a/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
@@ -1,13 +1,19 @@
-Specify install path for kernel module
+From adfd2380d71dff1a31efaf63cf7ac97470466ec9 Mon Sep 17 00:00:00 2001
+From: Amy Fong <amy.fong@windriver.com>
+Date: Thu, 29 Jan 2015 09:56:03 -0500
+Subject: [PATCH] Specify install path for kernel module
 
 Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
 ---
- datapath/linux/Makefile.main.in |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ datapath/linux/Makefile.main.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/datapath/linux/Makefile.main.in b/datapath/linux/Makefile.main.in
+index 7d18253..63c520f 100644
 --- a/datapath/linux/Makefile.main.in
 +++ b/datapath/linux/Makefile.main.in
-@@ -71,8 +71,8 @@
+@@ -71,8 +71,8 @@ default:
  	$(MAKE) -C $(KSRC) M=$(builddir) modules
  
  modules_install:
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
index 47c81dd..4ae86c3 100644
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
@@ -1,4 +1,4 @@
-From a2a656e6976a60e5df3ade0d17a40b4ebdc2b41a Mon Sep 17 00:00:00 2001
+From fb68120ef8aed625b04b2fbd2cb78fc59a7b7432 Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 30 Mar 2016 06:23:45 -0400
 Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
@@ -12,6 +12,7 @@ Fix ptest for v2.5
  - Modify config files for running on target.
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
+
 ---
  Makefile.am |  1 +
  test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ -19,7 +20,7 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  create mode 100644 test.mk
 
 diff --git a/Makefile.am b/Makefile.am
-index a4dd7b8..0bd32c7 100644
+index ea63acb..ff7d70a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -429,3 +429,4 @@ include windows/automake.mk
@@ -105,6 +106,3 @@ index 0000000..b10a581
 +	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
 +	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
 +	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
--- 
-2.7.4
-
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 662d5b0..c3a8301 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -29,7 +29,6 @@ SRC_URI = "file://openvswitch-switch \
            file://python-make-remaining-scripts-use-usr-bin-env.patch \
            file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
            file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
-           file://CVE-2017-9263.patch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            "
 
-- 
2.7.4


