Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFB98E00A25; Sat, 18 Aug 2018 18:37:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B79B8E007EE
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:32 -0700 (PDT)
Received: by mail-io0-f169.google.com with SMTP id e12-v6so1518664iok.12
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JOj42/NanXOPgLp31trkOWrHFrbkAzYOOspHCqJLMZ4=;
	b=vEKx7Pre+DFAGZzsc+LIL/Q8h8of55DAohO0VByWzh0Rtu8e/LobwXcCvi/1frqmni
	grmyMI+OjSwklfBpvgKRZxWN06PWjamN+K8yYeZZrdnpZ3sgETksg+vM79lk8+2nhGSn
	6LTa83siJM4G+IezZJSTALh966/If5cAk/NuwsdAdSUwCw05mg2MNPDYhpHl5CuGtprP
	jjh2r3R+lhVDpYe09+1/v4VG7mf9SgfvntFgDO9s0IynMFnlr/0FcSg1n+7kJ+jSJGK1
	L8hwQkRK+7OQEEs5KvNAkaOXf3o+kgZuC/6FmX6+6SRAWM/n8Ajssb9NRYmv/2241ZAX
	+h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JOj42/NanXOPgLp31trkOWrHFrbkAzYOOspHCqJLMZ4=;
	b=IgG7PqJEKMgvF3YquPJqUHkUcl0GZ0wBU5V7Y0uoRdtXfLjzWT3DMntNKyCDT9x5uv
	vPmgydwzA8+k3VSFMdVecGxQsC9+sjEXXgO0FkXG/7HSdgvjLJC4O2mvNduKWUT+4QaO
	cVaxVE7DR9mzDPox9Nc4gQQpwQ/+1pMeSJCiK58ntqK7AYHYwzZXBaZuEGuQaz1aeAaw
	GAhihHal7aoDpkU9uY0LhmVYPPN2ILdKoPWY4Jg2PI5R6QROUYsgeozcBCg9WA+9Ynuu
	75QVrxSCGYTCd3cOBetalTNCjf+JhbVB1KPvzC9Zghb+dKXncG9F8LQbuJyEigrRBPH1
	2a/Q==
X-Gm-Message-State: APzg51Blc2ddwCBoHuxuKgC4rWswQrU+8+lwi2Ncr23zIxXfZfvpnTgA
	pQ8RuLX7kZT96Y4jUx4sLOuP4OSK
X-Google-Smtp-Source: ANB0VdYGPxZqM9scBeIm/BUYTP1ua64I/4sWDwgidoNO9x+Stvcqkz3loGObCczxpwNNIGR5I0zIBg==
X-Received: by 2002:a5e:db43:: with SMTP id
	r3-v6mr5600063iop.215.1534642651788; 
	Sat, 18 Aug 2018 18:37:31 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	i2-v6sm2198418ioh.80.2018.08.18.18.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Aug 2018 18:37:30 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 18 Aug 2018 18:37:13 -0700
Message-Id: <1534642635-18305-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
References: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 1/3] xen: fix build on aarch64 w/ gcc 8.2
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
X-List-Received-Date: Sun, 19 Aug 2018 01:37:33 -0000

Adds patch for compatibility with gcc 8.2, to fix string lengths
for copied values to prevent array-bounds warnings.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../xen-4.11-arm-acpi-fix-string-lengths.patch     | 101 +++++++++++++++++++++
 recipes-extended/xen/xen_4.11.0.bb                 |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch

diff --git a/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch b/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
new file mode 100644
index 0000000..ece6407
--- /dev/null
+++ b/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
@@ -0,0 +1,101 @@
+From 5e1a00969afe98a713bf14d1ba1902403b60e287 Mon Sep 17 00:00:00 2001
+From: Christopher Clark <christopher.w.clark@gmail.com>
+Date: Thu, 16 Aug 2018 13:04:52 -0700
+Subject: [PATCH v2] libxl/arm: Fix build on arm64 + acpi w/ gcc 8.2
+To: xen-devel@lists.xenproject.org
+Cc: wei.liu2@citrix.com,
+    ian.jackson@eu.citrix.com,
+    julien.grall@arm.com,
+    sstabellini@kernel.org
+
+[modified for Xen 4.11 to add required: #include <xen-tools/libs.h>]
+
+Add zero-padding to #defined ACPI table strings that are copied.
+Provides sufficient characters to satisfy the length required to
+fully populate the destination and prevent array-bounds warnings.
+Add BUILD_BUG_ON sizeof checks for compile-time length checking.
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+v2: add BUILD_BUG_ON length checks, requested by Wei.
+
+v1: Please add this patch to the backport list for the next minor
+    4.11 release.
+
+Prior to this: gcc 8.2 objects to memcpy past bounds:
+
+| libxl_arm_acpi.c: In function 'make_acpi_header':
+| libxl_arm_acpi.c:208:5: error: 'memcpy' forming offset [5, 6] is out
+of the bounds [0, 4] [-Werror=array-bounds]
+|      memcpy(h->oem_id, ACPI_OEM_ID, sizeof(h->oem_id));
+|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| libxl_arm_acpi.c:209:5: error: 'memcpy' forming offset [5, 8] is out
+of the bounds [0, 4] [-Werror=array-bounds]
+|      memcpy(h->oem_table_id, ACPI_OEM_TABLE_ID,
+sizeof(h->oem_table_id));
+|
+^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| libxl_arm_acpi.c:211:5: error: 'memcpy' forming offset 4 is out of the
+bounds [0, 3] [-Werror=array-bounds]
+|      memcpy(h->asl_compiler_id, ACPI_ASL_COMPILER_ID,
+|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|             sizeof(h->asl_compiler_id));
+|             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| In function 'make_acpi_rsdp.isra.4',
+|     inlined from 'libxl__prepare_acpi' at libxl_arm_acpi.c:389:5:
+| libxl_arm_acpi.c:193:5: error: 'memcpy' forming offset [5, 6] is out
+of the bounds [0, 4] [-Werror=array-bounds]
+|      memcpy(rsdp->oem_id, ACPI_OEM_ID, sizeof(rsdp->oem_id));
+|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+ tools/libxl/libxl_arm_acpi.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libxl/libxl_arm_acpi.c
+index 636f724..8924396 100644
+--- a/tools/libxl/libxl_arm_acpi.c
++++ b/tools/libxl/libxl_arm_acpi.c
+@@ -29,6 +29,7 @@ typedef int64_t s64;
+ 
+ #include <acpi/acconfig.h>
+ #include <acpi/actbl.h>
++#include <xen-tools/libs.h>
+ 
+ #ifndef BITS_PER_LONG
+ #ifdef _LP64
+@@ -48,9 +49,9 @@ extern const unsigned char dsdt_anycpu_arm[];
+ _hidden
+ extern const int dsdt_anycpu_arm_len;
+ 
+-#define ACPI_OEM_ID "Xen"
+-#define ACPI_OEM_TABLE_ID "ARM"
+-#define ACPI_ASL_COMPILER_ID "XL"
++#define ACPI_OEM_ID "Xen\0\0"
++#define ACPI_OEM_TABLE_ID "ARM\0\0\0\0"
++#define ACPI_ASL_COMPILER_ID "XL\0"
+ 
+ enum {
+     RSDP,
+@@ -190,6 +191,7 @@ static void make_acpi_rsdp(libxl__gc *gc, struct xc_dom_image *dom,
+     struct acpi_table_rsdp *rsdp = (void *)dom->acpi_modules[0].data + offset;
+ 
+     memcpy(rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
++    BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(rsdp->oem_id));
+     memcpy(rsdp->oem_id, ACPI_OEM_ID, sizeof(rsdp->oem_id));
+     rsdp->length = acpitables[RSDP].size;
+     rsdp->revision = 0x02;
+@@ -205,9 +207,12 @@ static void make_acpi_header(struct acpi_table_header *h, const char *sig,
+     memcpy(h->signature, sig, 4);
+     h->length = len;
+     h->revision = rev;
++    BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(h->oem_id));
+     memcpy(h->oem_id, ACPI_OEM_ID, sizeof(h->oem_id));
++    BUILD_BUG_ON(sizeof(ACPI_OEM_TABLE_ID) != sizeof(h->oem_table_id));
+     memcpy(h->oem_table_id, ACPI_OEM_TABLE_ID, sizeof(h->oem_table_id));
+     h->oem_revision = 0;
++    BUILD_BUG_ON(sizeof(ACPI_ASL_COMPILER_ID) != sizeof(h->asl_compiler_id));
+     memcpy(h->asl_compiler_id, ACPI_ASL_COMPILER_ID,
+            sizeof(h->asl_compiler_id));
+     h->asl_compiler_revision = 0;
diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
index 7884194..d7cff32 100644
--- a/recipes-extended/xen/xen_4.11.0.bb
+++ b/recipes-extended/xen/xen_4.11.0.bb
@@ -4,6 +4,7 @@ require xen.inc
 SRC_URI = " \
     https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
     file://tools-xentop-vwprintw.patch \
+    file://xen-4.11-arm-acpi-fix-string-lengths.patch \
     "
 
 SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
-- 
2.7.4


