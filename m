Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED6BC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 06:35:36 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.65381.1673246131183261477
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jan 2023 22:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b3YFFl7Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v30so11072776edb.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jan 2023 22:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=seWzQSlwTxH8W9F5xquXT2hc6lWBHfNzMYqe0XtCPuo=;
        b=b3YFFl7QPQmlZGMP8jqPBuyjXbj3qYgdOXXNuvZbpprv27POIgOWareTau70hQubEV
         Lb0XYtK2KhoDphKlC3kY/HVIDRFjQsEEpZ4ARMv+be+Dj8hY8ASDBopPcir1mOaiRgWT
         1u/73DWvr9p71O1e69VzqcKig5b7cc97gu90GFTGRrjttAWTb3jhkd+wq+V60Esm9YLu
         Ut3MpHR2kgK8f9tHAl6o8vPqf38lBA6vsKKqsWnEITkezE4OXE8fvE+F6Tj5jdcL49F3
         34Ij07JTo+sJhuSDyDoT2AY7gnV5tAIRmfoveeh7o7LP2BmU4jAjUGqdC2A1iXCpiXCh
         pWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seWzQSlwTxH8W9F5xquXT2hc6lWBHfNzMYqe0XtCPuo=;
        b=r3H/0efKXHvKW890D07qkQELI3Qv4AR6Jn2UFJs6FgXlXBtKMej7UiWXMTRp3h7UUq
         9PB++r4fQxQRycFtHrv16TNLrMCEsvh2QpI6YriKdGLKVhIVMrCucWbpHXSnM9vQA+lm
         YpPJ27EQsggSE6a+rlpij3ZUSmCwpBq1ZmxRDLmcHb/kQ626MZQQ+9axLrHGHp9YBGm+
         QYlXLBgeQ4IEtfzmr+JTpU3El5fUMXdugvz2ORPcORywebNl+P7ljyJ3otsnVBrQggOU
         9SFxyysLyDXBzHyM+JoOyLTOjF9cA7uvNkeD1Mi0csL+GoTtyY0eVNgpGNq8khLhY+ea
         oosA==
X-Gm-Message-State: AFqh2krU+gDObxp6anJed0iv9IqEJdjwzIUyWP3IpMPkSsHm0cfizwgn
	j48obuWijTPuB81Pv6lIMW5PRRHnvZYFAuDiDxc=
X-Google-Smtp-Source: AMrXdXtGv0cBbVxvFZ7PlUvpTT/z7YmNGB34vXa1CdnKuNEDzTNBgHxBcNs5/ZN+lUtN4CguSqGBUBp5pOytdfaMoV8=
X-Received: by 2002:a50:ff09:0:b0:490:47c3:3d71 with SMTP id
 a9-20020a50ff09000000b0049047c33d71mr1557570edu.31.1673246129498; Sun, 08 Jan
 2023 22:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20230106144630.23637-1-michal.orzel@amd.com> <20230106144630.23637-2-michal.orzel@amd.com>
In-Reply-To: <20230106144630.23637-2-michal.orzel@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Jan 2023 22:35:17 -0800
Message-ID: <CACMJ4Gbf=sVZfRb6=eipKziXBm7hJ864kwv19rCvjBgF2uTwoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] xen: Bump SRCREV of 4.16 recipes to 4.16.3
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, bertrand.marquis@arm.com, 
	stefano.stabellini@amd.com, stewart.hildebrand@amd.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000002baefa05f1cef96b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jan 2023 06:35:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7803

--0000000000002baefa05f1cef96b
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 6:46 AM Michal Orzel <michal.orzel@amd.com> wrote:

> Update 4.16 recipes to use the latest 4.16.3 release.
> Also, remove the GCC 12 fix patch as it seems to be no longer needed.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

thanks
Christopher



> ---
> Changes in v2:
>  - none
> ---
>  .../files/xen-fix-gcc12-build-issues.patch    | 433 ------------------
>  recipes-extended/xen/xen-tools_4.16.bb        |   5 +-
>  recipes-extended/xen/xen_4.16.bb              |   5 +-
>  3 files changed, 4 insertions(+), 439 deletions(-)
>  delete mode 100644
> recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
>
> diff --git a/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
> b/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
> deleted file mode 100644
> index 6cdd312db110..000000000000
> --- a/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
> +++ /dev/null
> @@ -1,433 +0,0 @@
> -References: bsc#1196545
> -
> -Compiling against gcc12.
> -
> -Many of the failures are -Werror=array-bounds where macros
> -from mm.h are being used. Common Examples are,
> -include/asm/mm.h:528:61: error: array subscript 0 is outside array bounds
> of 'long unsigned int[0]' [-Werror=array-bounds]
> -include/xen/mm.h:287:21: error: array subscript [0, 288230376151711743]
> is outside array bounds of 'struct page_info[0]' [-Werror=array-bounds]
> -
> -There are also several other headers that generate array-bounds macro
> failures.
> -The pragmas to override are mostly in '.c' files with the exception of,
> -xen/arch/x86/mm/shadow/private.h
> -xen/include/asm-x86/paging.h
> -
> -[Upstream-Status: imported from:
> https://build.opensuse.org/package/view_file/openSUSE:Factory/xen/gcc12-fixes.patch?expand=1
> ]
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> -
> -
> -Index: xen-4.16.1-testing/xen/drivers/passthrough/amd/iommu_intr.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/drivers/passthrough/amd/iommu_intr.c
> -+++ xen-4.16.1-testing/xen/drivers/passthrough/amd/iommu_intr.c
> -@@ -23,6 +23,10 @@
> -
> - #include "iommu.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - union irte32 {
> -     uint32_t raw;
> -     struct {
> -Index: xen-4.16.1-testing/xen/drivers/passthrough/x86/hvm.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/drivers/passthrough/x86/hvm.c
> -+++ xen-4.16.1-testing/xen/drivers/passthrough/x86/hvm.c
> -@@ -901,6 +901,9 @@ static void __hvm_dpci_eoi(struct domain
> -     hvm_pirq_eoi(pirq);
> - }
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Waddress"
> -+#endif
> - static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
> - {
> -     struct pirq *pirq = pirq_info(d, gsi);
> -Index: xen-4.16.1-testing/xen/common/domctl.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/common/domctl.c
> -+++ xen-4.16.1-testing/xen/common/domctl.c
> -@@ -32,6 +32,10 @@
> - #include <public/domctl.h>
> - #include <xsm/xsm.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - static DEFINE_SPINLOCK(domctl_lock);
> -
> - static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap
> *xenctl_nodemap,
> -Index: xen-4.16.1-testing/xen/common/efi/boot.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/common/efi/boot.c
> -+++ xen-4.16.1-testing/xen/common/efi/boot.c
> -@@ -31,6 +31,10 @@
> - #undef __ASSEMBLY__
> - #endif
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
> -
> - #define SMBIOS3_TABLE_GUID \
> -Index: xen-4.16.1-testing/xen/common/xmalloc_tlsf.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/common/xmalloc_tlsf.c
> -+++ xen-4.16.1-testing/xen/common/xmalloc_tlsf.c
> -@@ -28,6 +28,10 @@
> - #include <xen/pfn.h>
> - #include <asm/time.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - #define MAX_POOL_NAME_LEN       16
> -
> - /* Some IMPORTANT TLSF parameters */
> -Index: xen-4.16.1-testing/xen/common/memory.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/common/memory.c
> -+++ xen-4.16.1-testing/xen/common/memory.c
> -@@ -35,6 +35,10 @@
> - #include <asm/guest.h>
> - #endif
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - struct memop_args {
> -     /* INPUT */
> -     struct domain *domain;     /* Domain to be affected. */
> -Index: xen-4.16.1-testing/xen/common/page_alloc.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/common/page_alloc.c
> -+++ xen-4.16.1-testing/xen/common/page_alloc.c
> -@@ -155,6 +155,10 @@
> - #define PGC_reserved 0
> - #endif
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /*
> -  * Comma-separated list of hexadecimal page numbers containing bad bytes.
> -  * e.g. 'badpage=0x3f45,0x8a321'.
> -@@ -1529,6 +1533,7 @@ static void free_heap_pages(
> - }
> -
> -
> -+
> - /*
> -  * Following rules applied for page offline:
> -  * Once a page is broken, it can't be assigned anymore
> -Index: xen-4.16.1-testing/xen/common/vmap.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/common/vmap.c
> -+++ xen-4.16.1-testing/xen/common/vmap.c
> -@@ -9,6 +9,10 @@
> - #include <xen/vmap.h>
> - #include <asm/page.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - static DEFINE_SPINLOCK(vm_lock);
> - static void *__read_mostly vm_base[VMAP_REGION_NR];
> - #define vm_bitmap(x) ((unsigned long *)vm_base[x])
> -Index: xen-4.16.1-testing/xen/include/asm-x86/paging.h
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/include/asm-x86/paging.h
> -+++ xen-4.16.1-testing/xen/include/asm-x86/paging.h
> -@@ -32,6 +32,10 @@
> - #include <asm/flushtlb.h>
> - #include <asm/domain.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> -
> /*****************************************************************************
> -  * Macros to tell which paging mode a domain is in */
> -
> -Index: xen-4.16.1-testing/xen/arch/x86/x86_64/traps.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/x86_64/traps.c
> -+++ xen-4.16.1-testing/xen/arch/x86/x86_64/traps.c
> -@@ -25,6 +25,9 @@
> - #include <asm/hvm/hvm.h>
> - #include <asm/hvm/support.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -
> - static void print_xen_info(void)
> - {
> -Index: xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mcaction.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/cpu/mcheck/mcaction.c
> -+++ xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mcaction.c
> -@@ -4,6 +4,10 @@
> - #include "vmce.h"
> - #include "mce.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - static struct mcinfo_recovery *
> - mci_action_add_pageoffline(int bank, struct mc_info *mi,
> -                            mfn_t mfn, uint32_t status)
> -Index: xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mce.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/cpu/mcheck/mce.c
> -+++ xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mce.c
> -@@ -30,6 +30,10 @@
> - #include "util.h"
> - #include "vmce.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - bool __read_mostly opt_mce = true;
> - boolean_param("mce", opt_mce);
> - bool __read_mostly mce_broadcast;
> -Index: xen-4.16.1-testing/xen/arch/x86/hvm/hvm.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/hvm/hvm.c
> -+++ xen-4.16.1-testing/xen/arch/x86/hvm/hvm.c
> -@@ -81,6 +81,10 @@
> -
> - #include <compat/hvm/hvm_op.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - bool_t __read_mostly hvm_enabled;
> -
> - #ifdef DBG_LEVEL_0
> -Index: xen-4.16.1-testing/xen/arch/x86/pv/dom0_build.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/pv/dom0_build.c
> -+++ xen-4.16.1-testing/xen/arch/x86/pv/dom0_build.c
> -@@ -22,6 +22,10 @@
> - #include <asm/pv/mm.h>
> - #include <asm/setup.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
> - #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
> - #define L1_PROT (BASE_PROT|_PAGE_GUEST_KERNEL)
> -Index: xen-4.16.1-testing/xen/arch/x86/pv/ro-page-fault.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/pv/ro-page-fault.c
> -+++ xen-4.16.1-testing/xen/arch/x86/pv/ro-page-fault.c
> -@@ -26,6 +26,10 @@
> - #include "emulate.h"
> - #include "mm.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /*********************
> -  * Writable Pagetables
> -  */
> -Index: xen-4.16.1-testing/xen/arch/x86/pv/emul-priv-op.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/pv/emul-priv-op.c
> -+++ xen-4.16.1-testing/xen/arch/x86/pv/emul-priv-op.c
> -@@ -40,6 +40,10 @@
> - #include "emulate.h"
> - #include "mm.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - struct priv_op_ctxt {
> -     struct x86_emulate_ctxt ctxt;
> -     struct {
> -Index: xen-4.16.1-testing/xen/arch/x86/pv/mm.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/pv/mm.c
> -+++ xen-4.16.1-testing/xen/arch/x86/pv/mm.c
> -@@ -26,6 +26,10 @@
> -
> - #include "mm.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /*
> -  * Get a mapping of a PV guest's l1e for this linear address.  The return
> -  * pointer should be unmapped using unmap_domain_page().
> -Index: xen-4.16.1-testing/xen/arch/x86/domain_page.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/domain_page.c
> -+++ xen-4.16.1-testing/xen/arch/x86/domain_page.c
> -@@ -18,6 +18,10 @@
> - #include <asm/hardirq.h>
> - #include <asm/setup.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - static DEFINE_PER_CPU(struct vcpu *, override);
> -
> - static inline struct vcpu *mapcache_current_vcpu(void)
> -Index: xen-4.16.1-testing/xen/arch/x86/mm/shadow/private.h
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/mm/shadow/private.h
> -+++ xen-4.16.1-testing/xen/arch/x86/mm/shadow/private.h
> -@@ -33,6 +33,10 @@
> -
> - #include "../mm-locks.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> -
> /******************************************************************************
> -  * Levels of self-test and paranoia
> -  */
> -Index: xen-4.16.1-testing/xen/arch/x86/mm/hap/hap.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/mm/hap/hap.c
> -+++ xen-4.16.1-testing/xen/arch/x86/mm/hap/hap.c
> -@@ -42,6 +42,10 @@
> -
> - #include "private.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /************************************************/
> - /*          HAP VRAM TRACKING SUPPORT           */
> - /************************************************/
> -Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m-pod.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m-pod.c
> -+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m-pod.c
> -@@ -31,6 +31,10 @@
> -
> - #include "mm-locks.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - #define superpage_aligned(_x)  (((_x)&(SUPERPAGE_PAGES-1))==0)
> -
> - /* Enforce lock ordering when grabbing the "external" page_alloc lock */
> -Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m-ept.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m-ept.c
> -+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m-ept.c
> -@@ -36,6 +36,10 @@
> -
> - #include "mm-locks.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - #define atomic_read_ept_entry(__pepte)                              \
> -     ( (ept_entry_t) { .epte = read_atomic(&(__pepte)->epte) } )
> -
> -Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m.c
> -+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m.c
> -@@ -44,6 +44,10 @@
> -
> - #include "mm-locks.h"
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /* Override macro from asm/page.h to make work with mfn_t */
> - #undef virt_to_mfn
> - #define virt_to_mfn(v) _mfn(__virt_to_mfn(v))
> -Index: xen-4.16.1-testing/xen/arch/x86/tboot.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/xen/arch/x86/tboot.c
> -+++ xen-4.16.1-testing/xen/arch/x86/tboot.c
> -@@ -16,6 +16,10 @@
> - #include <asm/setup.h>
> - #include <crypto/vmac.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /* tboot=<physical address of shared page> */
> - static unsigned long __initdata opt_tboot_pa;
> - integer_param("tboot", opt_tboot_pa);
> -Index: xen-4.16.1-testing/tools/firmware/hvmloader/ovmf.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/ovmf.c
> -+++ xen-4.16.1-testing/tools/firmware/hvmloader/ovmf.c
> -@@ -34,6 +34,11 @@
> - #include <xen/hvm/ioreq.h>
> - #include <xen/memory.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#pragma GCC diagnostic ignored "-Wstringop-overflow"
> -+#endif
> -+
> - #define OVMF_MAXOFFSET          0x000FFFFFULL
> - #define OVMF_END                0x100000000ULL
> - #define LOWCHUNK_BEGIN          0x000F0000
> -Index: xen-4.16.1-testing/tools/firmware/hvmloader/seabios.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/seabios.c
> -+++ xen-4.16.1-testing/tools/firmware/hvmloader/seabios.c
> -@@ -29,6 +29,11 @@
> - #include <acpi2_0.h>
> - #include <libacpi.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#pragma GCC diagnostic ignored "-Wstringop-overflow"
> -+#endif
> -+
> - struct seabios_info {
> -     char signature[14]; /* XenHVMSeaBIOS\0 */
> -     uint8_t length;     /* Length of this struct */
> -Index: xen-4.16.1-testing/tools/firmware/hvmloader/util.c
> -===================================================================
> ---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/util.c
> -+++ xen-4.16.1-testing/tools/firmware/hvmloader/util.c
> -@@ -31,6 +31,10 @@
> - #include <xen/hvm/hvm_xs_strings.h>
> - #include <xen/hvm/params.h>
> -
> -+#if __GNUC__ >= 12
> -+#pragma GCC diagnostic ignored "-Warray-bounds"
> -+#endif
> -+
> - /*
> -  * Check whether there exists overlap in the specified memory range.
> -  * Returns true if exists, else returns false.
> -
> diff --git a/recipes-extended/xen/xen-tools_4.16.bb
> b/recipes-extended/xen/xen-tools_4.16.bb
> index 2200a5a44abe..b5e555e6eabb 100644
> --- a/recipes-extended/xen/xen-tools_4.16.bb
> +++ b/recipes-extended/xen/xen-tools_4.16.bb
> @@ -1,5 +1,5 @@
> -# xen 4.16.2 release sha
> -SRCREV ?= "cea5ed49bb5716698a11312a3f38bc8865cd1e67"
> +# xen 4.16.3 release sha
> +SRCREV ?= "556c2e817c9cf23b675eb4eaa2dc091f7bb3039f"
>
>  XEN_REL ?= "4.16"
>  XEN_BRANCH ?= "stable-${XEN_REL}"
> @@ -7,7 +7,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=$%7BXEN_BRANCH%7D> \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> -    file://xen-fix-gcc12-build-issues.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen_4.16.bb b/recipes-extended/xen/
> xen_4.16.bb
> index 70e1d70e9c29..14a4fa79c5dd 100644
> --- a/recipes-extended/xen/xen_4.16.bb
> +++ b/recipes-extended/xen/xen_4.16.bb
> @@ -1,5 +1,5 @@
> -# xen 4.16.2 release sha
> -SRCREV ?= "cea5ed49bb5716698a11312a3f38bc8865cd1e67"
> +# xen 4.16.3 release sha
> +SRCREV ?= "556c2e817c9cf23b675eb4eaa2dc091f7bb3039f"
>
>  XEN_REL ?= "4.16"
>  XEN_BRANCH ?= "stable-${XEN_REL}"
> @@ -7,7 +7,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=$%7BXEN_BRANCH%7D> \
>
>  file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> \
> -    file://xen-fix-gcc12-build-issues.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> --
> 2.25.1
>
>

--0000000000002baefa05f1cef96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 6, 2023 at 6:46 AM Michal=
 Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upda=
te 4.16 recipes to use the latest 4.16.3 release.<br>
Also, remove the GCC 12 fix patch as it seems to be no longer needed.<br>
<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.cla=
rk@gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><div><br></div><di=
v>thanks</div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes in v2:<br>
=C2=A0- none<br>
---<br>
=C2=A0.../files/xen-fix-gcc12-build-issues.patch=C2=A0 =C2=A0 | 433 -------=
-----------<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.16.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.16.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A03 files changed, 4 insertions(+), 439 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/xen-fix-gcc12-build-iss=
ues.patch<br>
<br>
diff --git a/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch b/=
recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch<br>
deleted file mode 100644<br>
index 6cdd312db110..000000000000<br>
--- a/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch<br>
+++ /dev/null<br>
@@ -1,433 +0,0 @@<br>
-References: bsc#1196545<br>
-<br>
-Compiling against gcc12.<br>
-<br>
-Many of the failures are -Werror=3Darray-bounds where macros<br>
-from mm.h are being used. Common Examples are,<br>
-include/asm/mm.h:528:61: error: array subscript 0 is outside array bounds =
of &#39;long unsigned int[0]&#39; [-Werror=3Darray-bounds]<br>
-include/xen/mm.h:287:21: error: array subscript [0, 288230376151711743] is=
 outside array bounds of &#39;struct page_info[0]&#39; [-Werror=3Darray-bou=
nds]<br>
-<br>
-There are also several other headers that generate array-bounds macro fail=
ures.<br>
-The pragmas to override are mostly in &#39;.c&#39; files with the exceptio=
n of,<br>
-xen/arch/x86/mm/shadow/private.h<br>
-xen/include/asm-x86/paging.h<br>
-<br>
-[Upstream-Status: imported from: <a href=3D"https://build.opensuse.org/pac=
kage/view_file/openSUSE:Factory/xen/gcc12-fixes.patch?expand=3D1" rel=3D"no=
referrer" target=3D"_blank">https://build.opensuse.org/package/view_file/op=
enSUSE:Factory/xen/gcc12-fixes.patch?expand=3D1</a>]<br>
-<br>
-Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
-<br>
-<br>
-Index: xen-4.16.1-testing/xen/drivers/passthrough/amd/iommu_intr.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/drivers/passthrough/amd/iommu_intr.c<br>
-+++ xen-4.16.1-testing/xen/drivers/passthrough/amd/iommu_intr.c<br>
-@@ -23,6 +23,10 @@<br>
- <br>
- #include &quot;iommu.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- union irte32 {<br>
-=C2=A0 =C2=A0 =C2=A0uint32_t raw;<br>
-=C2=A0 =C2=A0 =C2=A0struct {<br>
-Index: xen-4.16.1-testing/xen/drivers/passthrough/x86/hvm.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/drivers/passthrough/x86/hvm.c<br>
-+++ xen-4.16.1-testing/xen/drivers/passthrough/x86/hvm.c<br>
-@@ -901,6 +901,9 @@ static void __hvm_dpci_eoi(struct domain<br>
-=C2=A0 =C2=A0 =C2=A0hvm_pirq_eoi(pirq);<br>
- }<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Waddress&quot;<br>
-+#endif<br>
- static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0struct pirq *pirq =3D pirq_info(d, gsi);<br>
-Index: xen-4.16.1-testing/xen/common/domctl.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/common/domctl.c<br>
-+++ xen-4.16.1-testing/xen/common/domctl.c<br>
-@@ -32,6 +32,10 @@<br>
- #include &lt;public/domctl.h&gt;<br>
- #include &lt;xsm/xsm.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- static DEFINE_SPINLOCK(domctl_lock);<br>
- <br>
- static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap=
,<br>
-Index: xen-4.16.1-testing/xen/common/efi/boot.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/common/efi/boot.c<br>
-+++ xen-4.16.1-testing/xen/common/efi/boot.c<br>
-@@ -31,6 +31,10 @@<br>
- #undef __ASSEMBLY__<br>
- #endif<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- #define EFI_REVISION(major, minor) (((major) &lt;&lt; 16) | (minor))<br>
- <br>
- #define SMBIOS3_TABLE_GUID \<br>
-Index: xen-4.16.1-testing/xen/common/xmalloc_tlsf.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/common/xmalloc_tlsf.c<br>
-+++ xen-4.16.1-testing/xen/common/xmalloc_tlsf.c<br>
-@@ -28,6 +28,10 @@<br>
- #include &lt;xen/pfn.h&gt;<br>
- #include &lt;asm/time.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- #define MAX_POOL_NAME_LEN=C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
- <br>
- /* Some IMPORTANT TLSF parameters */<br>
-Index: xen-4.16.1-testing/xen/common/memory.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/common/memory.c<br>
-+++ xen-4.16.1-testing/xen/common/memory.c<br>
-@@ -35,6 +35,10 @@<br>
- #include &lt;asm/guest.h&gt;<br>
- #endif<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- struct memop_args {<br>
-=C2=A0 =C2=A0 =C2=A0/* INPUT */<br>
-=C2=A0 =C2=A0 =C2=A0struct domain *domain;=C2=A0 =C2=A0 =C2=A0/* Domain to=
 be affected. */<br>
-Index: xen-4.16.1-testing/xen/common/page_alloc.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/common/page_alloc.c<br>
-+++ xen-4.16.1-testing/xen/common/page_alloc.c<br>
-@@ -155,6 +155,10 @@<br>
- #define PGC_reserved 0<br>
- #endif<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /*<br>
-=C2=A0 * Comma-separated list of hexadecimal page numbers containing bad b=
ytes.<br>
-=C2=A0 * e.g. &#39;badpage=3D0x3f45,0x8a321&#39;.<br>
-@@ -1529,6 +1533,7 @@ static void free_heap_pages(<br>
- }<br>
- <br>
- <br>
-+<br>
- /*<br>
-=C2=A0 * Following rules applied for page offline:<br>
-=C2=A0 * Once a page is broken, it can&#39;t be assigned anymore<br>
-Index: xen-4.16.1-testing/xen/common/vmap.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/common/vmap.c<br>
-+++ xen-4.16.1-testing/xen/common/vmap.c<br>
-@@ -9,6 +9,10 @@<br>
- #include &lt;xen/vmap.h&gt;<br>
- #include &lt;asm/page.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- static DEFINE_SPINLOCK(vm_lock);<br>
- static void *__read_mostly vm_base[VMAP_REGION_NR];<br>
- #define vm_bitmap(x) ((unsigned long *)vm_base[x])<br>
-Index: xen-4.16.1-testing/xen/include/asm-x86/paging.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/include/asm-x86/paging.h<br>
-+++ xen-4.16.1-testing/xen/include/asm-x86/paging.h<br>
-@@ -32,6 +32,10 @@<br>
- #include &lt;asm/flushtlb.h&gt;<br>
- #include &lt;asm/domain.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /************************************************************************=
*****<br>
-=C2=A0 * Macros to tell which paging mode a domain is in */<br>
- <br>
-Index: xen-4.16.1-testing/xen/arch/x86/x86_64/traps.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/x86_64/traps.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/x86_64/traps.c<br>
-@@ -25,6 +25,9 @@<br>
- #include &lt;asm/hvm/hvm.h&gt;<br>
- #include &lt;asm/hvm/support.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
- <br>
- static void print_xen_info(void)<br>
- {<br>
-Index: xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mcaction.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/cpu/mcheck/mcaction.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mcaction.c<br>
-@@ -4,6 +4,10 @@<br>
- #include &quot;vmce.h&quot;<br>
- #include &quot;mce.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- static struct mcinfo_recovery *<br>
- mci_action_add_pageoffline(int bank, struct mc_info *mi,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mfn_t mfn, uint32_t status)<br>
-Index: xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mce.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/cpu/mcheck/mce.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mce.c<br>
-@@ -30,6 +30,10 @@<br>
- #include &quot;util.h&quot;<br>
- #include &quot;vmce.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- bool __read_mostly opt_mce =3D true;<br>
- boolean_param(&quot;mce&quot;, opt_mce);<br>
- bool __read_mostly mce_broadcast;<br>
-Index: xen-4.16.1-testing/xen/arch/x86/hvm/hvm.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/hvm/hvm.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/hvm/hvm.c<br>
-@@ -81,6 +81,10 @@<br>
- <br>
- #include &lt;compat/hvm/hvm_op.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- bool_t __read_mostly hvm_enabled;<br>
- <br>
- #ifdef DBG_LEVEL_0<br>
-Index: xen-4.16.1-testing/xen/arch/x86/pv/dom0_build.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/dom0_build.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/pv/dom0_build.c<br>
-@@ -22,6 +22,10 @@<br>
- #include &lt;asm/pv/mm.h&gt;<br>
- #include &lt;asm/setup.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */<br>
- #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)<br>
- #define L1_PROT (BASE_PROT|_PAGE_GUEST_KERNEL)<br>
-Index: xen-4.16.1-testing/xen/arch/x86/pv/ro-page-fault.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/ro-page-fault.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/pv/ro-page-fault.c<br>
-@@ -26,6 +26,10 @@<br>
- #include &quot;emulate.h&quot;<br>
- #include &quot;mm.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /*********************<br>
-=C2=A0 * Writable Pagetables<br>
-=C2=A0 */<br>
-Index: xen-4.16.1-testing/xen/arch/x86/pv/emul-priv-op.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/emul-priv-op.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/pv/emul-priv-op.c<br>
-@@ -40,6 +40,10 @@<br>
- #include &quot;emulate.h&quot;<br>
- #include &quot;mm.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- struct priv_op_ctxt {<br>
-=C2=A0 =C2=A0 =C2=A0struct x86_emulate_ctxt ctxt;<br>
-=C2=A0 =C2=A0 =C2=A0struct {<br>
-Index: xen-4.16.1-testing/xen/arch/x86/pv/mm.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/mm.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/pv/mm.c<br>
-@@ -26,6 +26,10 @@<br>
- <br>
- #include &quot;mm.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /*<br>
-=C2=A0 * Get a mapping of a PV guest&#39;s l1e for this linear address.=C2=
=A0 The return<br>
-=C2=A0 * pointer should be unmapped using unmap_domain_page().<br>
-Index: xen-4.16.1-testing/xen/arch/x86/domain_page.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/domain_page.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/domain_page.c<br>
-@@ -18,6 +18,10 @@<br>
- #include &lt;asm/hardirq.h&gt;<br>
- #include &lt;asm/setup.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- static DEFINE_PER_CPU(struct vcpu *, override);<br>
- <br>
- static inline struct vcpu *mapcache_current_vcpu(void)<br>
-Index: xen-4.16.1-testing/xen/arch/x86/mm/shadow/private.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/shadow/private.h<br>
-+++ xen-4.16.1-testing/xen/arch/x86/mm/shadow/private.h<br>
-@@ -33,6 +33,10 @@<br>
- <br>
- #include &quot;../mm-locks.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /************************************************************************=
******<br>
-=C2=A0 * Levels of self-test and paranoia<br>
-=C2=A0 */<br>
-Index: xen-4.16.1-testing/xen/arch/x86/mm/hap/hap.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/hap/hap.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/mm/hap/hap.c<br>
-@@ -42,6 +42,10 @@<br>
- <br>
- #include &quot;private.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /************************************************/<br>
- /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HAP VRAM TRACKING SUPPORT=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
- /************************************************/<br>
-Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m-pod.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m-pod.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m-pod.c<br>
-@@ -31,6 +31,10 @@<br>
- <br>
- #include &quot;mm-locks.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- #define superpage_aligned(_x)=C2=A0 (((_x)&amp;(SUPERPAGE_PAGES-1))=3D=3D=
0)<br>
- <br>
- /* Enforce lock ordering when grabbing the &quot;external&quot; page_allo=
c lock */<br>
-Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m-ept.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m-ept.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m-ept.c<br>
-@@ -36,6 +36,10 @@<br>
- <br>
- #include &quot;mm-locks.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- #define atomic_read_ept_entry(__pepte)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0( (ept_entry_t) { .epte =3D read_atomic(&amp;(__pepte)=
-&gt;epte) } )<br>
- <br>
-Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m.c<br>
-@@ -44,6 +44,10 @@<br>
- <br>
- #include &quot;mm-locks.h&quot;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /* Override macro from asm/page.h to make work with mfn_t */<br>
- #undef virt_to_mfn<br>
- #define virt_to_mfn(v) _mfn(__virt_to_mfn(v))<br>
-Index: xen-4.16.1-testing/xen/arch/x86/tboot.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/xen/arch/x86/tboot.c<br>
-+++ xen-4.16.1-testing/xen/arch/x86/tboot.c<br>
-@@ -16,6 +16,10 @@<br>
- #include &lt;asm/setup.h&gt;<br>
- #include &lt;crypto/vmac.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /* tboot=3D&lt;physical address of shared page&gt; */<br>
- static unsigned long __initdata opt_tboot_pa;<br>
- integer_param(&quot;tboot&quot;, opt_tboot_pa);<br>
-Index: xen-4.16.1-testing/tools/firmware/hvmloader/ovmf.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/ovmf.c<br>
-+++ xen-4.16.1-testing/tools/firmware/hvmloader/ovmf.c<br>
-@@ -34,6 +34,11 @@<br>
- #include &lt;xen/hvm/ioreq.h&gt;<br>
- #include &lt;xen/memory.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#pragma GCC diagnostic ignored &quot;-Wstringop-overflow&quot;<br>
-+#endif<br>
-+<br>
- #define OVMF_MAXOFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000FFFFFULL<br=
>
- #define OVMF_END=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x100000000ULL<br>
- #define LOWCHUNK_BEGIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000F0000<br>
-Index: xen-4.16.1-testing/tools/firmware/hvmloader/seabios.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/seabios.c<br>
-+++ xen-4.16.1-testing/tools/firmware/hvmloader/seabios.c<br>
-@@ -29,6 +29,11 @@<br>
- #include &lt;acpi2_0.h&gt;<br>
- #include &lt;libacpi.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#pragma GCC diagnostic ignored &quot;-Wstringop-overflow&quot;<br>
-+#endif<br>
-+<br>
- struct seabios_info {<br>
-=C2=A0 =C2=A0 =C2=A0char signature[14]; /* XenHVMSeaBIOS\0 */<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t length;=C2=A0 =C2=A0 =C2=A0/* Length of this s=
truct */<br>
-Index: xen-4.16.1-testing/tools/firmware/hvmloader/util.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/util.c<br>
-+++ xen-4.16.1-testing/tools/firmware/hvmloader/util.c<br>
-@@ -31,6 +31,10 @@<br>
- #include &lt;xen/hvm/hvm_xs_strings.h&gt;<br>
- #include &lt;xen/hvm/params.h&gt;<br>
- <br>
-+#if __GNUC__ &gt;=3D 12<br>
-+#pragma GCC diagnostic ignored &quot;-Warray-bounds&quot;<br>
-+#endif<br>
-+<br>
- /*<br>
-=C2=A0 * Check whether there exists overlap in the specified memory range.=
<br>
-=C2=A0 * Returns true if exists, else returns false.<br>
-<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_4.16.bb</a> b/recipes-extended/=
xen/<a href=3D"http://xen-tools_4.16.bb" rel=3D"noreferrer" target=3D"_blan=
k">xen-tools_4.16.bb</a><br>
index 2200a5a44abe..b5e555e6eabb 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_4.16.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.16.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_4.16.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.16.bb</a><br>
@@ -1,5 +1,5 @@<br>
-# xen 4.16.2 release sha<br>
-SRCREV ?=3D &quot;cea5ed49bb5716698a11312a3f38bc8865cd1e67&quot;<br>
+# xen 4.16.3 release sha<br>
+SRCREV ?=3D &quot;556c2e817c9cf23b675eb4eaa2dc091f7bb3039f&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.16&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
@@ -7,7 +7,6 @@ XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch=
 \<br>
-=C2=A0 =C2=A0 file://xen-fix-gcc12-build-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen_4.16.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.16.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.16.bb</a=
><br>
index 70e1d70e9c29..14a4fa79c5dd 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.16.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.16.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.16.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.16.bb</a><br>
@@ -1,5 +1,5 @@<br>
-# xen 4.16.2 release sha<br>
-SRCREV ?=3D &quot;cea5ed49bb5716698a11312a3f38bc8865cd1e67&quot;<br>
+# xen 4.16.3 release sha<br>
+SRCREV ?=3D &quot;556c2e817c9cf23b675eb4eaa2dc091f7bb3039f&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.16&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
@@ -7,7 +7,6 @@ XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-menuconfig-mconf-cfg-Allow-specification-of=
-ncurses-location.patch \<br>
-=C2=A0 =C2=A0 file://xen-fix-gcc12-build-issues.patch \ <br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000002baefa05f1cef96b--

