Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF606E00BFD; Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (akuster808[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12AD1E00B49
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
Received: by mail-pf0-f193.google.com with SMTP id p6so4384603pfn.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2olrGputfbMD9tntIWgNTE+/Hje352fhKWMlmiA6Bho=;
	b=L39XuS84dgILPQGQ1kYH+Rs4FBOf73/GcQzEYjqU/cDrh6SEtKIOB4p/j22l43IA/O
	CNaRFNVGS46Z/85Qumq5jrY1a++MPtqHLmQivIneIj297LqUrXwG6vMCa8cFPbCyIh2n
	DvkTytZEle1fJn0AwugxQ+ZDObvbmQ9nc1xRWBNU5cw5wEdmhqeD2lLHu4G33GaD9MvG
	VpQqyrpJ5zRopAry3UOGOEGE221ZDrcRp+BqPQwC18QLsr0JPZJf9Z/a+sTnbqu5netg
	ig+8cZVdGbtKOFHbCYsGFJY2f/aUDX+cv+DztNPulJisd8+4bOhQD+5BxcBhzDvWvXTC
	5LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2olrGputfbMD9tntIWgNTE+/Hje352fhKWMlmiA6Bho=;
	b=Bq93n8HqnnQmz4hlb31PQmgcO4vbv5MwevQQ/HAzYwYNVmvKA0Uic/UlQal6SUYAfJ
	2JaOJQLYjGQiYLEF/z4YPHifr6nqoMVcsk+CzPrXEuMY0yFAEqJrjq5YFN61Wzi27u0O
	0CYUuQwnQyCvhrQEmytALyl/SjOUpNf4va/P3Wh/FhCiWWQYjxziuZBPFSnOy+Y+cu2D
	YJIr+4XqfdOGDfdIdnKoBs6QsC5iLbySPhmyaAtp6PUIxuuazwAccgE1MZrQJVpIrzC/
	7bpGJKlOEwsgVzlRv0u4MvV7aKid2FYempeWWuH4VEpb3FAsbR/XIH8crdpl2B3Sr+6b
	NKHw==
X-Gm-Message-State: ALQs6tCq33eQurbsWI2mlRna3A9r/mYnt1G8UTpseNGcv6ZnNpgqqYr8
	TaRt17a00X2LDnx5UGB/M2Cppw==
X-Google-Smtp-Source: AIpwx4+S/PkOpXRNkX9w1UTliFx8RJ+Oq5erxq2q577J5TAbhZ+kE+1CtcbcTbbym0okz07P0+JZfA==
X-Received: by 10.98.84.7 with SMTP id i7mr9909713pfb.174.1524234899806;
	Fri, 20 Apr 2018 07:34:59 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-71-197-71-93.hsd1.ca.comcast.net.
	[71.197.71.93])
	by smtp.gmail.com with ESMTPSA id b3sm2345084pga.7.2018.04.20.07.34.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 07:34:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Fri, 20 Apr 2018 07:34:55 -0700
Message-Id: <20180420143456.31128-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 1/2] Refactor to conform to YP Compat requirements
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
X-List-Received-Date: Fri, 20 Apr 2018 14:35:00 -0000

This prevents the signature from being modified

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 recipes-core/busybox/busybox_%.bbappend              | 11 +----------
 recipes-core/busybox/busybox_virtualization.inc      | 10 ++++++++++
 .../iptables/iptables-meta-virtualization.inc        | 19 +++++++++++++++++++
 recipes-extended/iptables/iptables_1.%.bbappend      | 20 +-------------------
 4 files changed, 31 insertions(+), 29 deletions(-)
 create mode 100644 recipes-core/busybox/busybox_virtualization.inc
 create mode 100644 recipes-extended/iptables/iptables-meta-virtualization.inc

diff --git a/recipes-core/busybox/busybox_%.bbappend b/recipes-core/busybox/busybox_%.bbappend
index 8369a03..617cacc 100644
--- a/recipes-core/busybox/busybox_%.bbappend
+++ b/recipes-core/busybox/busybox_%.bbappend
@@ -1,10 +1 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-	    file://lspci.cfg \
-	    file://lsusb.cfg \
-	    file://mdev.cfg \
-	    file://mount-cifs.cfg \
-	    file://ps-extras.cfg \
-	    file://getopt.cfg \
-           "
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-core/busybox/busybox_virtualization.inc b/recipes-core/busybox/busybox_virtualization.inc
new file mode 100644
index 0000000..d9c4e67
--- /dev/null
+++ b/recipes-core/busybox/busybox_virtualization.inc
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/busybox:"
+
+SRC_URI += " \
+	    file://lspci.cfg \
+	    file://lsusb.cfg \
+	    file://mdev.cfg \
+	    file://mount-cifs.cfg \
+	    file://ps-extras.cfg \
+	    file://getopt.cfg \
+           "
diff --git a/recipes-extended/iptables/iptables-meta-virtualization.inc b/recipes-extended/iptables/iptables-meta-virtualization.inc
new file mode 100644
index 0000000..8fd521c
--- /dev/null
+++ b/recipes-extended/iptables/iptables-meta-virtualization.inc
@@ -0,0 +1,19 @@
+RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
+                      kernel-module-ip-tables \
+                      kernel-module-ip6table-filter \
+                      kernel-module-iptable-filter \
+                      kernel-module-ip6table-raw \
+                      kernel-module-iptable-raw \
+                      kernel-module-ip6table-nat \
+                      kernel-module-iptable-nat \
+                      kernel-module-ip6table-mangle \
+                      kernel-module-iptable-magle \
+                      kernel-module-ip6table-security \
+                      kernel-module-iptable-security \
+                      kernel-module-ipt-reject \
+                      kernel-module-iptable-mangle \
+                      kernel-module-xt-checksum \
+                      kernel-module-xt-conntrack \
+                      kernel-module-xt-state \
+                      kernel-module-xt-tcpudp \
+                      "
diff --git a/recipes-extended/iptables/iptables_1.%.bbappend b/recipes-extended/iptables/iptables_1.%.bbappend
index 8fd521c..9a15e60 100644
--- a/recipes-extended/iptables/iptables_1.%.bbappend
+++ b/recipes-extended/iptables/iptables_1.%.bbappend
@@ -1,19 +1 @@
-RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
-                      kernel-module-ip-tables \
-                      kernel-module-ip6table-filter \
-                      kernel-module-iptable-filter \
-                      kernel-module-ip6table-raw \
-                      kernel-module-iptable-raw \
-                      kernel-module-ip6table-nat \
-                      kernel-module-iptable-nat \
-                      kernel-module-ip6table-mangle \
-                      kernel-module-iptable-magle \
-                      kernel-module-ip6table-security \
-                      kernel-module-iptable-security \
-                      kernel-module-ipt-reject \
-                      kernel-module-iptable-mangle \
-                      kernel-module-xt-checksum \
-                      kernel-module-xt-conntrack \
-                      kernel-module-xt-state \
-                      kernel-module-xt-tcpudp \
-                      "
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}-meta-virtualization.inc', '', d)}
-- 
2.14.1


