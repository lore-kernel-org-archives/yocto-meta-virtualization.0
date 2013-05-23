Return-Path: <B28495@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABCBEE01482
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 May 2013 02:57:24 -0700 (PDT)
Received: from mail21-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 May 2013 09:57:23 +0000
Received: from mail21-va3 (localhost [127.0.0.1])	by mail21-va3-R.bigfish.com
	(Postfix) with ESMTP id 099B3401E9	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 23 May 2013 09:57:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1155h)
Received: from mail21-va3 (localhost.localdomain [127.0.0.1]) by mail21-va3
	(MessageSwitch) id 1369303040791280_25413;
	Thu, 23 May 2013 09:57:20 +0000 (UTC)
Received: from VA3EHSMHS005.bigfish.com (unknown [10.7.14.244])	by
	mail21-va3.bigfish.com (Postfix) with ESMTP id BC5B86006F	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 23 May 2013 09:57:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS005.bigfish.com
	(10.7.99.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 May 2013 09:57:19 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 23 May 2013 09:58:02 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r4N9vF0K029230;
	Thu, 23 May 2013 02:57:17 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 23 May 2013 17:57:15 +0800
Message-ID: <1369303035-7326-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b19537@freescale.com
Subject: [PATCH] netcf: fix network driver check issue on opensuse
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
X-List-Received-Date: Thu, 23 May 2013 09:57:25 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...ix-network-driver-check-issue-on-opensuse.patch |   28 ++++++++++++++++++++
 recipes-networking/netcf/netcf_git.bb              |    6 +++-
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch

diff --git a/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch b/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
new file mode 100644
index 0000000..eef5b5c
--- /dev/null
+++ b/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
@@ -0,0 +1,28 @@
+From 285871a2db42727665a2ab7fc16fa2fb8fa830d3 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Thu, 23 May 2013 17:39:35 +0800
+Subject: [PATCH] fix network driver check issue on opensuse
+
+Upstream-Status: Pending
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3f30865..708eb28 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,7 +77,7 @@ fi
+ if test "x$with_driver" = "xcheck" && test -f /etc/ubuntu_version ; then
+   with_driver=debian
+ fi
+-if test "x$with_driver" = "xcheck" && test -f /etc/suse-release ; then
++if test "x$with_driver" = "xcheck" && (test -f /etc/suse-release || test -f /etc/SuSE-release) ; then
+   with_driver=suse
+ fi
+ if test "x$with_driver" = "xcheck" ; then
+-- 
+1.7.3.4
+
diff --git a/recipes-networking/netcf/netcf_git.bb b/recipes-networking/netcf/netcf_git.bb
index 60fc446..d380e95 100644
--- a/recipes-networking/netcf/netcf_git.bb
+++ b/recipes-networking/netcf/netcf_git.bb
@@ -7,10 +7,12 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
 SRCREV = "2b0d9ca226c13d7150382367f62b256bdb2db5ef"
-PR = "r0"
+PR = "r1"
 PV = "0.2.2+git${SRCPV}"
 
-SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git"
+SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
+           file://0001-fix-network-driver-check-issue-on-opensuse.patch \
+"
 
 DEPENDS += "augeas libnl libxslt libxml2"
 
-- 
1.7.3.4



