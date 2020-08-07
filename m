Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1418.1596783932251068754
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 00:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UKPi9AKG;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21E64E01FA4; Fri,  7 Aug 2020 00:05:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BCB5E01FA4
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 00:05:29 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id 77so894910qkm.5
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 00:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yt4rZvqdjH2IoiN/oxrErZcHX5goqhSgn7MJ953e6Ts=;
        b=UKPi9AKGOIWkJfawFjByt4Wfsfrsz2+6fDTrn9FiOJOFWZomzPcZgq5wr2fZUBvyTi
         OuvX/D1cs1xMOTDcxnZERrITqiS0mxfYbF1eO7EaaRFZCgjPs89hNoaOEiodOhHL0x5M
         3gts/PvZSd1VOx2ZnHhvIZjWP2YprFoDF/Fp6T89MylfGQ0v36qkcpCHvp37zPgXdJL5
         NKs1wbx7LbcWnpmtYnV9wE+3dydZ9hcUwKmR8fHsX+ityiFlKL4URGu0qEOKSdFp4f0K
         Ben9DuNv9aGzOUQ9OpCEvgWziFM+9lwxeyNF08U5t2+9mNj7Q5wrz32tFKaza7bPeVDZ
         8OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yt4rZvqdjH2IoiN/oxrErZcHX5goqhSgn7MJ953e6Ts=;
        b=YWz2ark+zmJjDxvrUW6ZanZYMJ7p8wt7UJSSsU2GwEsspHGWcU7FMQlsDxxnF/Ca1G
         NCA2Bgi3TwjMAgnD6BUkcFwMXCnJAaI+MEPT2/MbdJ4vlg2KUKl2ocpZwBkLZS8uekFT
         8FDUbSmj7V8EQ1OHBy8ydqxmFkXYNvSH31ZUrSHk0Ul9sl1T+nUokZ6QYDdy9Zznkpz8
         aucELqBS/9NJbJkLmybXKwqEy66myAfvuc9kArG2gV83dGW0Zcwxn1WRvvhADX8CPwht
         A/U9LEJhmcrza6OT4Z2BZE0YybXY3xPjRifIgL1k30GigXVRq4h2dsVE9iMR6ggf1Y2F
         rt6Q==
X-Gm-Message-State: AOAM530jLK2ZbSjWiVZk6e2x4ttuT8Sayr1NA50/QxvaVf4pqOFtrfDk
	acFf7WXa+j1DELSVC4RxM37ESFrkFj4=
X-Google-Smtp-Source: ABdhPJwXHsYZvap2XSfpJt3reiu32v5mSUtSjNRizsR2xY73oEOR0E4Gg4xZldFcifg1VUpmWOD7KA==
X-Received: by 2002:a05:620a:12c7:: with SMTP id e7mr11720733qkl.433.1596783928382;
        Fri, 07 Aug 2020 00:05:28 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-185-85.mycingular.net. [166.176.185.85])
        by smtp.gmail.com with ESMTPSA id v45sm6992275qtc.42.2020.08.07.00.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:05:26 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 4/5] xen, linux-raspberrypi4: remove linux-raspberrypi bbappends and patches
Date: Fri,  7 Aug 2020 00:05:02 -0700
Message-Id: <20200807070503.30777-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807070503.30777-1-christopher.w.clark@gmail.com>
References: <20200807070503.30777-1-christopher.w.clark@gmail.com>

Retiring use of the downstream vendor kernel for use with Xen.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc         |  2 -
 ...vmalloc_to_page-on-vmalloc-virt-addr.patch | 44 ----------
 ...02-swiotlb-xen-remove-start_dma_addr.patch | 47 ----------
 ...struct-device-parameter-to-xen_phys_.patch | 78 ----------------
 ...struct-device-parameter-to-xen_bus_t.patch | 66 --------------
 ...struct-device-parameter-to-is_xen_sw.patch | 57 ------------
 ...oduce-phys_to_dma-dma_to_phys-transl.patch | 88 -------------------
 ...translations-in-xen_dma_s_kernel_5.4.patch | 68 --------------
 ..._to_phys-on-the-dma_addr_t-parameter.patch | 75 ----------------
 .../0011-adding-page-coherent-patch.patch     | 39 --------
 .../linux/linux-raspberrypi_%.bbappend        |  5 --
 .../linux/linux-raspberrypi_5.4.bbappend      | 19 ----
 12 files changed, 588 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index fe3fd22..0a91ef9 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -17,5 +17,3 @@ RPI_SDIMG_EXTRA_DEPENDS_append_raspberrypi4-64 = " xen:do_deploy"
 DEPLOYPAYLOAD_raspberrypi4-64 = "xen-${MACHINE}:xen"
 # We need the GIC enabled for Xen to work
 RPI_EXTRA_CONFIG_append_raspberrypi4-64  = "\nenable_gic=1"
-# Align kernel version with current meta-virtualization kernel version
-PREFERRED_VERSION_linux-raspberrypi ?= "5.4.%"
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
deleted file mode 100644
index 09144ce..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f5f4de59377afdd9a80e0f47df109eacf427c203 Mon Sep 17 00:00:00 2001
-From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
-Date: Wed, 20 May 2020 16:42:06 -0700
-Subject: [PATCH 01/10] swiotlb-xen: use vmalloc_to_page on vmalloc virt
- addresses
-
-Don't just assume that virt_to_page works on all virtual addresses.
-Instead add a is_vmalloc_addr check and use vmalloc_to_page on vmalloc
-virt addresses.
-
-Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- drivers/xen/swiotlb-xen.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
-index b6d27762c6f8..a42129cba36e 100644
---- a/drivers/xen/swiotlb-xen.c
-+++ b/drivers/xen/swiotlb-xen.c
-@@ -335,6 +335,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
- 	int order = get_order(size);
- 	phys_addr_t phys;
- 	u64 dma_mask = DMA_BIT_MASK(32);
-+	struct page *pg;
- 
- 	if (hwdev && hwdev->coherent_dma_mask)
- 		dma_mask = hwdev->coherent_dma_mask;
-@@ -346,9 +347,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
- 	/* Convert the size to actually allocated. */
- 	size = 1UL << (order + XEN_PAGE_SHIFT);
- 
-+	pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
-+				      virt_to_page(vaddr);
- 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
- 		     range_straddles_page_boundary(phys, size)) &&
--	    TestClearPageXenRemapped(virt_to_page(vaddr)))
-+	    TestClearPageXenRemapped(pg))
- 		xen_destroy_contiguous_region(phys, order);
- 
- 	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
deleted file mode 100644
index 9c572a1..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d078eac368946990c27b86198d2a37416ea02002 Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:42:11 -0700
-Subject: [PATCH 02/10] swiotlb-xen: remove start_dma_addr
-
-It is not strictly needed. Call virt_to_phys on xen_io_tlb_start
-instead. It will be useful not to have a start_dma_addr around with the
-next patches.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- drivers/xen/swiotlb-xen.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
-index a42129cba36e..b5e0492b07b9 100644
---- a/drivers/xen/swiotlb-xen.c
-+++ b/drivers/xen/swiotlb-xen.c
-@@ -52,8 +52,6 @@ static unsigned long xen_io_tlb_nslabs;
-  * Quick lookup value of the bus address of the IOTLB.
-  */
- 
--static u64 start_dma_addr;
--
- /*
-  * Both of these functions should avoid XEN_PFN_PHYS because phys_addr_t
-  * can be 32bit when dma_addr_t is 64bit leading to a loss in
-@@ -241,7 +239,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
- 		m_ret = XEN_SWIOTLB_EFIXUP;
- 		goto error;
- 	}
--	start_dma_addr = xen_virt_to_bus(xen_io_tlb_start);
- 	if (early) {
- 		if (swiotlb_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs,
- 			 verbose))
-@@ -389,7 +386,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
- 	 */
- 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
- 
--	map = swiotlb_tbl_map_single(dev, start_dma_addr, phys,
-+	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start), phys,
- 				     size, size, dir, attrs);
- 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
- 		return DMA_MAPPING_ERROR;
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
deleted file mode 100644
index d90701b..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 5ef503632a8df9be70f3c1ff828780e4348a03dc Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:42:11 -0700
-Subject: [PATCH 03/10] swiotlb-xen: add struct device* parameter to
- xen_phys_to_bus
-
-The parameter is unused in this patch.
-No functional changes.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- drivers/xen/swiotlb-xen.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
-index b5e0492b07b9..958ee5517e0b 100644
---- a/drivers/xen/swiotlb-xen.c
-+++ b/drivers/xen/swiotlb-xen.c
-@@ -57,7 +57,7 @@ static unsigned long xen_io_tlb_nslabs;
-  * can be 32bit when dma_addr_t is 64bit leading to a loss in
-  * information if the shift is done before casting to 64bit.
-  */
--static inline dma_addr_t xen_phys_to_bus(phys_addr_t paddr)
-+static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
- {
- 	unsigned long bfn = pfn_to_bfn(XEN_PFN_DOWN(paddr));
- 	dma_addr_t dma = (dma_addr_t)bfn << XEN_PAGE_SHIFT;
-@@ -78,9 +78,9 @@ static inline phys_addr_t xen_bus_to_phys(dma_addr_t baddr)
- 	return paddr;
- }
- 
--static inline dma_addr_t xen_virt_to_bus(void *address)
-+static inline dma_addr_t xen_virt_to_bus(struct device *dev, void *address)
- {
--	return xen_phys_to_bus(virt_to_phys(address));
-+	return xen_phys_to_bus(dev, virt_to_phys(address));
- }
- 
- static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
-@@ -309,7 +309,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
- 	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
- 	 * to *dma_handle. */
- 	phys = *dma_handle;
--	dev_addr = xen_phys_to_bus(phys);
-+	dev_addr = xen_phys_to_bus(hwdev, phys);
- 	if (((dev_addr + size - 1 <= dma_mask)) &&
- 	    !range_straddles_page_boundary(phys, size))
- 		*dma_handle = dev_addr;
-@@ -367,7 +367,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
- 				unsigned long attrs)
- {
- 	phys_addr_t map, phys = page_to_phys(page) + offset;
--	dma_addr_t dev_addr = xen_phys_to_bus(phys);
-+	dma_addr_t dev_addr = xen_phys_to_bus(dev, phys);
- 
- 	BUG_ON(dir == DMA_NONE);
- 	/*
-@@ -392,7 +392,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
- 		return DMA_MAPPING_ERROR;
- 
- 	phys = map;
--	dev_addr = xen_phys_to_bus(map);
-+	dev_addr = xen_phys_to_bus(dev, map);
- 
- 	/*
- 	 * Ensure that the address returned is DMA'ble
-@@ -536,7 +536,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
- static int
- xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
- {
--	return xen_virt_to_bus(xen_io_tlb_end - 1) <= mask;
-+	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
- }
- 
- const struct dma_map_ops xen_swiotlb_dma_ops = {
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
deleted file mode 100644
index ccd03f1..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From ed2cec0f196028f4eaed0951f1f82efd9e6b1b67 Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:42:12 -0700
-Subject: [PATCH 04/10] swiotlb-xen: add struct device* parameter to
- xen_bus_to_phys
-
-The parameter is unused in this patch.
-No functional changes.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- drivers/xen/swiotlb-xen.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
-index 958ee5517e0b..9b4306a56feb 100644
---- a/drivers/xen/swiotlb-xen.c
-+++ b/drivers/xen/swiotlb-xen.c
-@@ -67,7 +67,7 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
- 	return dma;
- }
- 
--static inline phys_addr_t xen_bus_to_phys(dma_addr_t baddr)
-+static inline phys_addr_t xen_bus_to_phys(struct device *dev, dma_addr_t baddr)
- {
- 	unsigned long xen_pfn = bfn_to_pfn(XEN_PFN_DOWN(baddr));
- 	dma_addr_t dma = (dma_addr_t)xen_pfn << XEN_PAGE_SHIFT;
-@@ -339,7 +339,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
- 
- 	/* do not use virt_to_phys because on ARM it doesn't return you the
- 	 * physical address */
--	phys = xen_bus_to_phys(dev_addr);
-+	phys = xen_bus_to_phys(hwdev, dev_addr);
- 
- 	/* Convert the size to actually allocated. */
- 	size = 1UL << (order + XEN_PAGE_SHIFT);
-@@ -420,7 +420,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
- static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
- 		size_t size, enum dma_data_direction dir, unsigned long attrs)
- {
--	phys_addr_t paddr = xen_bus_to_phys(dev_addr);
-+	phys_addr_t paddr = xen_bus_to_phys(hwdev, dev_addr);
- 
- 	BUG_ON(dir == DMA_NONE);
- 
-@@ -436,7 +436,7 @@ static void
- xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
- 		size_t size, enum dma_data_direction dir)
- {
--	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
-+	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
- 
- 	if (!dev_is_dma_coherent(dev))
- 		xen_dma_sync_for_cpu(dma_addr, paddr, size, dir);
-@@ -449,7 +449,7 @@ static void
- xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
- 		size_t size, enum dma_data_direction dir)
- {
--	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
-+	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
- 
- 	if (is_xen_swiotlb_buffer(dma_addr))
- 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
deleted file mode 100644
index 9ef4059..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From f19187658bc7625f5e3ef89f56d599552b37a497 Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:42:15 -0700
-Subject: [PATCH 07/10] swiotlb-xen: add struct device* parameter to
- is_xen_swiotlb_buffer
-
-The parameter is unused in this patch.
-No functional changes.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- drivers/xen/swiotlb-xen.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
-index ef58f05ae445..c50448fd9b75 100644
---- a/drivers/xen/swiotlb-xen.c
-+++ b/drivers/xen/swiotlb-xen.c
-@@ -97,7 +97,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
- 	return 0;
- }
- 
--static int is_xen_swiotlb_buffer(dma_addr_t dma_addr)
-+static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
- {
- 	unsigned long bfn = XEN_PFN_DOWN(dma_addr);
- 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
-@@ -428,7 +428,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
- 		xen_dma_sync_for_cpu(hwdev, dev_addr, paddr, size, dir);
- 
- 	/* NOTE: We use dev_addr here, not paddr! */
--	if (is_xen_swiotlb_buffer(dev_addr))
-+	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
- 		swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
- }
- 
-@@ -441,7 +441,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
- 	if (!dev_is_dma_coherent(dev))
- 		xen_dma_sync_for_cpu(dev, dma_addr, paddr, size, dir);
- 
--	if (is_xen_swiotlb_buffer(dma_addr))
-+	if (is_xen_swiotlb_buffer(dev, dma_addr))
- 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
- }
- 
-@@ -451,7 +451,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
- {
- 	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
- 
--	if (is_xen_swiotlb_buffer(dma_addr))
-+	if (is_xen_swiotlb_buffer(dev, dma_addr))
- 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
- 
- 	if (!dev_is_dma_coherent(dev))
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
deleted file mode 100644
index 2b59e18..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 9838cc0b60a4287034ac3bc94a3adf08bc1c3858 Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:42:57 -0700
-Subject: [PATCH 08/10] swiotlb-xen: introduce phys_to_dma/dma_to_phys
- translations
-
-Call dma_to_phys in is_xen_swiotlb_buffer.
-Call phys_to_dma in xen_phys_to_bus.
-Call dma_to_phys in xen_bus_to_phys.
-
-Everything is taken care of by these changes except for
-xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent, which need a
-few explicit phys_to_dma/dma_to_phys calls.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- drivers/xen/swiotlb-xen.c | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
-index c50448fd9b75..d011c4c7aa72 100644
---- a/drivers/xen/swiotlb-xen.c
-+++ b/drivers/xen/swiotlb-xen.c
-@@ -64,14 +64,16 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
- 
- 	dma |= paddr & ~XEN_PAGE_MASK;
- 
--	return dma;
-+	return phys_to_dma(dev, dma);
- }
- 
--static inline phys_addr_t xen_bus_to_phys(struct device *dev, dma_addr_t baddr)
-+static inline phys_addr_t xen_bus_to_phys(struct device *dev,
-+					  dma_addr_t dma_addr)
- {
-+	phys_addr_t baddr = dma_to_phys(dev, dma_addr);
- 	unsigned long xen_pfn = bfn_to_pfn(XEN_PFN_DOWN(baddr));
--	dma_addr_t dma = (dma_addr_t)xen_pfn << XEN_PAGE_SHIFT;
--	phys_addr_t paddr = dma;
-+	phys_addr_t paddr = (xen_pfn << XEN_PAGE_SHIFT) |
-+			    (baddr & ~XEN_PAGE_MASK);
- 
- 	paddr |= baddr & ~XEN_PAGE_MASK;
- 
-@@ -99,7 +101,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
- 
- static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
- {
--	unsigned long bfn = XEN_PFN_DOWN(dma_addr);
-+	unsigned long bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
- 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
- 	phys_addr_t paddr = XEN_PFN_PHYS(xen_pfn);
- 
-@@ -304,11 +306,11 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
- 	if (hwdev && hwdev->coherent_dma_mask)
- 		dma_mask = hwdev->coherent_dma_mask;
- 
--	/* At this point dma_handle is the physical address, next we are
-+	/* At this point dma_handle is the dma address, next we are
- 	 * going to set it to the machine address.
- 	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
- 	 * to *dma_handle. */
--	phys = *dma_handle;
-+	phys = dma_to_phys(hwdev, *dma_handle);
- 	dev_addr = xen_phys_to_bus(hwdev, phys);
- 	if (((dev_addr + size - 1 <= dma_mask)) &&
- 	    !range_straddles_page_boundary(phys, size))
-@@ -319,6 +321,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
- 			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
- 			return NULL;
- 		}
-+		*dma_handle = phys_to_dma(hwdev, *dma_handle);
- 		SetPageXenRemapped(virt_to_page(ret));
- 	}
- 	memset(ret, 0, size);
-@@ -351,7 +354,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
- 	    TestClearPageXenRemapped(pg))
- 		xen_destroy_contiguous_region(phys, order);
- 
--	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
-+	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
-+				attrs);
- }
- 
- /*
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
deleted file mode 100644
index 9676698..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 9749386d4ba0adb545cfad494b312894909cc7a4 Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:43:07 -0700
-Subject: [PATCH 09/10] xen/arm: introduce phys/dma translations in
- xen_dma_sync_for_*
-
-Add phys_to_dma/dma_to_phys calls to
-xen_dma_sync_for_cpu, xen_dma_sync_for_device, and
-xen_arch_need_swiotlb.
-
-In xen_arch_need_swiotlb, take the opportunity to switch to the simpler
-pfn_valid check we use everywhere else.
-
-dma_cache_maint is fixed by the next patch.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Rebased onto 5.4 by: Christoher Clark <christopher.w.clark@gmail.com>
----
- arch/arm/xen/mm.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
-index 38fa917c8585..dc1fb57d2e12 100644
---- a/arch/arm/xen/mm.c
-+++ b/arch/arm/xen/mm.c
-@@ -1,5 +1,6 @@
- // SPDX-License-Identifier: GPL-2.0-only
- #include <linux/cpu.h>
-+#include <linux/dma-direct.h>
- #include <linux/dma-noncoherent.h>
- #include <linux/gfp.h>
- #include <linux/highmem.h>
-@@ -73,7 +74,7 @@ static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
- void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
- 		phys_addr_t paddr, size_t size, enum dma_data_direction dir)
- {
--	if (pfn_valid(PFN_DOWN(handle)))
-+	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
- 		arch_sync_dma_for_cpu(dev, paddr, size, dir);
- 	else if (dir != DMA_TO_DEVICE)
- 		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
-@@ -82,7 +83,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
- void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
- 		phys_addr_t paddr, size_t size, enum dma_data_direction dir)
- {
--	if (pfn_valid(PFN_DOWN(handle)))
-+	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
- 		arch_sync_dma_for_device(dev, paddr, size, dir);
- 	else if (dir == DMA_FROM_DEVICE)
- 		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
-@@ -95,7 +96,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
- 			   dma_addr_t dev_addr)
- {
- 	unsigned int xen_pfn = XEN_PFN_DOWN(phys);
--	unsigned int bfn = XEN_PFN_DOWN(dev_addr);
-+	unsigned int bfn = XEN_PFN_DOWN(dma_to_phys(dev, dev_addr));
- 
- 	/*
- 	 * The swiotlb buffer should be used if
-@@ -112,7 +113,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
- 	 * require a bounce buffer because the device doesn't support coherent
- 	 * memory and we are not able to flush the cache.
- 	 */
--	return (!hypercall_cflush && (xen_pfn != bfn) &&
-+	return (!hypercall_cflush && !pfn_valid(bfn) &&
- 		!dev_is_dma_coherent(dev));
- }
- 
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
deleted file mode 100644
index 8e2dc3c..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 1f1182bf84ec7a6d1ec74c56fccd66ff013077af Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:43:08 -0700
-Subject: [PATCH 10/10] xen/arm: call dma_to_phys on the dma_addr_t parameter
- of dma_cache_maint
-
-Add a struct device* parameter to dma_cache_maint.
-
-Translate the dma_addr_t parameter of dma_cache_maint by calling
-dma_to_phys. Do it for the first page and all the following pages, in
-case of multipage handling.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- arch/arm/xen/mm.c | 15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
-index 7639251bcc79..6ddf3b3c1ab5 100644
---- a/arch/arm/xen/mm.c
-+++ b/arch/arm/xen/mm.c
-@@ -43,15 +43,18 @@ unsigned long xen_get_swiotlb_free_pages(unsigned int order)
- static bool hypercall_cflush = false;
- 
- /* buffers in highmem or foreign pages cannot cross page boundaries */
--static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
-+static void dma_cache_maint(struct device *dev, dma_addr_t handle,
-+			    size_t size, u32 op)
- {
- 	struct gnttab_cache_flush cflush;
- 
--	cflush.a.dev_bus_addr = handle & XEN_PAGE_MASK;
- 	cflush.offset = xen_offset_in_page(handle);
- 	cflush.op = op;
-+	handle &= XEN_PAGE_MASK;
- 
- 	do {
-+		cflush.a.dev_bus_addr = dma_to_phys(dev, handle);
-+
- 		if (size + cflush.offset > XEN_PAGE_SIZE)
- 			cflush.length = XEN_PAGE_SIZE - cflush.offset;
- 		else
-@@ -60,7 +63,7 @@ static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
- 		HYPERVISOR_grant_table_op(GNTTABOP_cache_flush, &cflush, 1);
- 
- 		cflush.offset = 0;
--		cflush.a.dev_bus_addr += cflush.length;
-+		handle += cflush.length;
- 		size -= cflush.length;
- 	} while (size);
- }
-@@ -79,7 +82,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
- 	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
- 		arch_sync_dma_for_cpu(paddr, size, dir);
- 	else if (dir != DMA_TO_DEVICE)
--		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
-+		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
- }
- 
- void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
-@@ -89,9 +92,9 @@ void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
- 	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
- 		arch_sync_dma_for_device(paddr, size, dir);
- 	else if (dir == DMA_FROM_DEVICE)
--		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
-+		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
- 	else
--		dma_cache_maint(handle, size, GNTTAB_CACHE_CLEAN);
-+		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_CLEAN);
- }
- 
- bool xen_arch_need_swiotlb(struct device *dev,
--- 
-2.15.4
-
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch b/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
deleted file mode 100644
index a84ae74..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1f1182bf84ec7a6d1ec74c56fccd66ff013077af Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <stefano.stabellini@xilinx.com>
-Date: Wed, 20 May 2020 16:43:08 -0700
-Subject: [PATCH 11/11] xen/arm: call dma_to_phys on the dma_addr_t parameter
- of dma_cache_maint
-
-Add a struct device* parameter to dma_cache_maint.
-
-Translate the dma_addr_t parameter of dma_cache_maint by calling
-dma_to_phys. Do it for the first page and all the following pages, in
-case of multipage handling.
-
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
----
- include/xen/arm/page-coherent.h | 15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
-index 7639251bcc79..6ddf3b3c1ab5 100644
---- a/include/xen/arm/page-coherent.h	2020-05-20 06:22:38.000000000 +0000
-+++ b/include/xen/arm/page-coherent.h	2020-05-29 00:37:15.604981421 +0000
-@@ -8,12 +8,17 @@
- static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t size,
- 		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
- {
-+	void *cpu_addr;
-+        if (dma_alloc_from_dev_coherent(hwdev, size, dma_handle, &cpu_addr))
-+            return cpu_addr;
- 	return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
- }
- 
- static inline void xen_free_coherent_pages(struct device *hwdev, size_t size,
- 		void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
- {
-+	if (dma_release_from_dev_coherent(hwdev, get_order(size), cpu_addr))
-+            return;
- 	dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
- }
- 
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
deleted file mode 100644
index bead4aa..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# For a Xen-enabled distro, override the contents of cmdline.txt
-
-DEFAULT_CMDLINE := "${CMDLINE}"
-XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
-CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend
deleted file mode 100644
index ec8d677..0000000
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += " \
-    file://0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch \
-    file://0002-swiotlb-xen-remove-start_dma_addr.patch \
-    file://0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch \
-    file://0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch \
-    file://0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch \
-    file://0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch \
-    file://0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch \
-    file://0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch \
-    file://0011-adding-page-coherent-patch.patch \
-    "
-
-# Add support for virtio.scc which linux-yocto_virtualization adds
-SRCREV_meta = "aafb8f095e97013d6e55b09ed150369cbe0c6476"
-SRC_URI_append += " \
-    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=kernel-meta \
-    "
-- 
2.17.1

