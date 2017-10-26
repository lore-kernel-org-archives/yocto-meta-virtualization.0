Return-Path: <armccurdy@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EA63E00D0B; Wed, 25 Oct 2017 21:24:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (armccurdy[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.195 listed in dnsbl.sorbs.net]
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BDBAE00D03
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Oct 2017 21:24:06 -0700 (PDT)
Received: by mail-pf0-f195.google.com with SMTP id a8so1606166pfc.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Oct 2017 21:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kxOYnwCYQioCRr5vuXO9p9p6j8EYRLDgIITwO9JRLEE=;
	b=RNczyT/uNZdvk1eenkAnjy+mbQC5YdDeF5TR1t0lIb+D/XbQd5eqq9H+EzfKtN5WNS
	LmLTE9q8gs/nrtwZpAZ9RJ+pMjvM3Aa47FnNLkhzpyj0W134RK9EwHcnLvz6VfoFITfC
	E5ylJj2Oi4KiRdEiaWZuW9u7jGsAX+hNo7wWaoYyj/w7aTkQCP56A8yEnDhODb+HsSsp
	Hk5fNBvjsb9rqf811zYvJlau53xzUJOQBTzmL7u4QMrWtyI0jslAmQfTdjboCk5/XTrF
	YPJgGWyNSzj9vtCpTZ2vklPhEJd4bpVLJnutQ4XP803xZxZvzM/ASE49YaNFmV+2ZKDT
	Ercw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kxOYnwCYQioCRr5vuXO9p9p6j8EYRLDgIITwO9JRLEE=;
	b=VGm/pFlU16ZiXhsB16OPW/GbSFodioukey79BjNPkokjmdqe+7Nlc2HizF7WsZ4V0i
	/x8zQ/t/Zq6H5AMwx/0bRBbjmhJj/tulLqgUj8R1NB76X7G9/IRti5HvYCdVKhAAvYaR
	kHlEzFNnPLRb4ZGN1iMEGFoy+Q4JQxblS9qM33o/C5j7klB6uxxt4VKP4ttP8jjTebNd
	Yb1+Z48NFV1N4Vksji+Ge50N30dKLYKOuubYQxBt3s7oTEb6bTcoNUIcYq3ZOJTew1GP
	YZQ6KXk4RrbUYIvaQ6hM+soI5rhJJwai83dKsYdpWQOIIILTTy9detSOPo4uDUpuCHeE
	GJHQ==
X-Gm-Message-State: AMCzsaX0xk9sCBgupebnIlQvp1oPC2GoE5TSTq2qWG8WwmBcY/xa82VJ
	7o3+aIy++IiqNKyDFxorDTTR6w==
X-Google-Smtp-Source: ABhQp+R220pOwbCOm78C7rKHNaU5DG3Z7369rRrmF1RlOOeUeBns6ITCUDwA5tx7ks8HBC3ILCB4Og==
X-Received: by 10.84.232.138 with SMTP id i10mr3487868plk.104.1508991845920;
	Wed, 25 Oct 2017 21:24:05 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	j1sm7360070pfc.169.2017.10.25.21.24.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 21:24:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 25 Oct 2017 21:24:00 -0700
Message-Id: <1508991840-24869-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Subject: [morty][PATCH] openvswitch: Fix build with musl libc
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
X-List-Received-Date: Thu, 26 Oct 2017 04:24:09 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 1b83c21436b2aec10e7b604ee5e3905441d1bb8a)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...-the-linux-if_packet.h-Interface-directly.patch | 35 ++++++++++++++++++++++
 ...Define-WAIT_ANY-if-not-provided-by-system.patch | 31 +++++++++++++++++++
 recipes-networking/openvswitch/openvswitch_git.bb  |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch b/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
new file mode 100644
index 0000000..3571245
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
@@ -0,0 +1,35 @@
+From 1cec65e45f011c3f52eed5e27d3d816502e36610 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2017 12:12:51 -0700
+Subject: [PATCH 1/2] use the linux if_packet.h Interface directly
+
+Helps compiling with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/netdev-linux.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/netdev-linux.c b/lib/netdev-linux.c
+index a5a9ec1ab..9dd40acdd 100644
+--- a/lib/netdev-linux.c
++++ b/lib/netdev-linux.c
+@@ -33,14 +33,13 @@
+ #include <linux/pkt_sched.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/sockios.h>
++#include <linux/if_packet.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ #include <sys/utsname.h>
+-#include <netpacket/packet.h>
+ #include <net/if.h>
+ #include <net/if_arp.h>
+-#include <net/if_packet.h>
+ #include <net/route.h>
+ #include <netinet/in.h>
+ #include <poll.h>
+-- 
+2.12.0
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
new file mode 100644
index 0000000..e44ffda
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
@@ -0,0 +1,31 @@
+From 803bde12d32d16eefeae03422a0ac682e0601c43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2017 12:13:30 -0700
+Subject: [PATCH 2/2] Define WAIT_ANY if not provided by system
+
+POSIX does not define it and uses -1 directly
+some libc do not have this definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-ovn.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/test-ovn.c b/tests/test-ovn.c
+index 2e82a6f0d..76e7db9fb 100644
+--- a/tests/test-ovn.c
++++ b/tests/test-ovn.c
+@@ -37,6 +37,10 @@
+ #include "simap.h"
+ #include "util.h"
+ 
++#ifndef WAIT_ANY
++# define WAIT_ANY (-1) /* Any process.  */
++#endif
++
+ /* --relops: Bitmap of the relational operators to test, in exhaustive test. */
+ static unsigned int test_relops;
+ 
+-- 
+2.12.0
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 1c6252a..5ecb29a 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -25,6 +25,8 @@ SRC_URI += "\
 	file://disable_m4_check.patch \
 	file://kernel_module.patch \
 	file://openvswitch-ptest-Fix-python-path.patch \
+	file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
+	file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
 	"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
-- 
1.9.1


