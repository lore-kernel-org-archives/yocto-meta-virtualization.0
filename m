Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2604E015FE; Wed, 18 Jul 2018 15:04:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8994EE00AC5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:08 -0700 (PDT)
Received: by mail-pl0-f67.google.com with SMTP id z7-v6so862842plo.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vI+B3Zur3wWkg2qEyceEQPpI2l11GWdv5CcuUVPCDWA=;
	b=nNQVVC0opheFMBIRVELRQ4m+sRDoDriGXHBbZo1KD151qQjE44CheB8xunSLqjTmct
	CqI+2sSKH1PkEpYSVoeYs1Uja0N+DZeKhJY5ckdDAtNkCD8Ig8E6SRZBonrmmwNHXDGA
	6W9mFYs+xph1c5UTlu4DNhqUBoWvWqytmlrhIXvHtoi8bQUAq6Tp0U7lHru3nTkUm2um
	YO35Dc2kpbs4VZAKEDAIG+omBDQwtJRNc6Ii5+kIKguga62Ryv7Nab0RblAfs4PrcA9A
	ON54JqZrMpopASYi/S4V17MZm5lvug1tgql8tYTeaYME1xBCBx/EMaLX115ZYf5lK1HF
	AiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vI+B3Zur3wWkg2qEyceEQPpI2l11GWdv5CcuUVPCDWA=;
	b=K462WVx9pHYwDD91ANyTHNr3HpEn+AlR2f574VXYd8uaKGfaIJXIfqrrrJ70lqdxNG
	8WQSY5RYXo2zgbpSlCjGDHl1tfJtlBF+97ZOvsf5tNf50kjbQ0Gq3MaQbniQb8h6LeT2
	W94jJuWB3pMAFaAF+nxFniavaU16VeFqZ1r7NK4d/r7KzCXurabQV/0u8g2ncAUDWNyc
	Lbomp2PqdRt5ChEdXPW2ZOLQdwp5IIGIEYJPNxTbAf7rXeDP+l0/eGqt0TVjwRsz8lTG
	DvqNd0gLbULrI1QzB+XMhrdXUOs66lEoKxWKvywPgy+b3R+c6R/bSe8FqLPpLNNW3of2
	AU7w==
X-Gm-Message-State: AOUpUlGAC9Foi953Gxa4uKceQJJ9Eicz77ej28j99M9u0TPX8YfSdFLS
	aTi6nMRVuYKP2xxIggNxNjqiR6ZY
X-Google-Smtp-Source: AAOMgpflxDERhq8dc7n3sBMUNJ4htwMaw+cuATYaSss+SqRNYi1JvJBOeXvd4aKIB7VMq7Si8CVS6g==
X-Received: by 2002:a17:902:8a4:: with SMTP id
	33-v6mr7450651pll.343.1531951447152; 
	Wed, 18 Jul 2018 15:04:07 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm19341965pfd.155.2018.07.18.15.04.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 15:03:47 -0700
Message-Id: <1531951428-28983-7-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 6/7] xen: remove 4.9.1 recipe and patches
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
X-List-Received-Date: Wed, 18 Jul 2018 22:04:10 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Please use my gmail address for any correspondence to me.

 ...check-to-see-if-removing-a-p2m-entry-actu.patch | 176 ---------------------
 ...eturn-value-of-p2m_set_entry-when-decreas.patch | 109 -------------
 recipes-extended/xen/files/xsa246-4.9.patch        |  74 ---------
 recipes-extended/xen/files/xsa248.patch            | 164 -------------------
 recipes-extended/xen/files/xsa249.patch            |  42 -----
 recipes-extended/xen/files/xsa250.patch            |  67 --------
 recipes-extended/xen/files/xsa251.patch            |  21 ---
 recipes-extended/xen/xen_4.9.1.bb                  |  18 ---
 8 files changed, 671 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
 delete mode 100644 recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
 delete mode 100644 recipes-extended/xen/files/xsa246-4.9.patch
 delete mode 100644 recipes-extended/xen/files/xsa248.patch
 delete mode 100644 recipes-extended/xen/files/xsa249.patch
 delete mode 100644 recipes-extended/xen/files/xsa250.patch
 delete mode 100644 recipes-extended/xen/files/xsa251.patch
 delete mode 100644 recipes-extended/xen/xen_4.9.1.bb

diff --git a/recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch b/recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
deleted file mode 100644
index ad9524a..0000000
--- a/recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From ad208b8b7e45fb2b7c572b86c61c26412609e82d Mon Sep 17 00:00:00 2001
-From: George Dunlap <george.dunlap@citrix.com>
-Date: Fri, 10 Nov 2017 16:53:54 +0000
-Subject: [PATCH 1/2] p2m: Always check to see if removing a p2m entry actually
- worked
-
-The PoD zero-check functions speculatively remove memory from the p2m,
-then check to see if it's completely zeroed, before putting it in the
-cache.
-
-Unfortunately, the p2m_set_entry() calls may fail if the underlying
-pagetable structure needs to change and the domain has exhausted its
-p2m memory pool: for instance, if we're removing a 2MiB region out of
-a 1GiB entry (in the p2m_pod_zero_check_superpage() case), or a 4k
-region out of a 2MiB or larger entry (in the p2m_pod_zero_check()
-case); and the return value is not checked.
-
-The underlying mfn will then be added into the PoD cache, and at some
-point mapped into another location in the p2m.  If the guest
-afterwards ballons out this memory, it will be freed to the hypervisor
-and potentially reused by another domain, in spite of the fact that
-the original domain still has writable mappings to it.
-
-There are several places where p2m_set_entry() shouldn't be able to
-fail, as it is guaranteed to write an entry of the same order that
-succeeded before.  Add a backstop of crashing the domain just in case,
-and an ASSERT_UNREACHABLE() to flag up the broken assumption on debug
-builds.
-
-While we're here, use PAGE_ORDER_2M rather than a magic constant.
-
-This is part of XSA-247.
-
-Reported-by: George Dunlap <george.dunlap.com>
-Signed-off-by: George Dunlap <george.dunlap@citrix.com>
-Reviewed-by: Jan Beulich <jbeulich@suse.com>
----
-v4:
-- Removed some training whitespace
-v3:
-- Reformat reset clause to be more compact
-- Make sure to set map[i] = NULL when unmapping in case we need to bail
-v2:
-- Crash a domain if a p2m_set_entry we think cannot fail fails anyway.
----
- xen/arch/x86/mm/p2m-pod.c | 77 +++++++++++++++++++++++++++++++++++++----------
- 1 file changed, 61 insertions(+), 16 deletions(-)
-
-diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
-index 730a48f928..f2ed751892 100644
---- a/xen/arch/x86/mm/p2m-pod.c
-+++ b/xen/arch/x86/mm/p2m-pod.c
-@@ -752,8 +752,10 @@ p2m_pod_zero_check_superpage(struct p2m_domain *p2m, unsigned long gfn)
-     }
- 
-     /* Try to remove the page, restoring old mapping if it fails. */
--    p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_2M,
--                  p2m_populate_on_demand, p2m->default_access);
-+    if ( p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_2M,
-+                       p2m_populate_on_demand, p2m->default_access) )
-+        goto out;
-+
-     p2m_tlb_flush_sync(p2m);
- 
-     /* Make none of the MFNs are used elsewhere... for example, mapped
-@@ -810,9 +812,18 @@ p2m_pod_zero_check_superpage(struct p2m_domain *p2m, unsigned long gfn)
-     ret = SUPERPAGE_PAGES;
- 
- out_reset:
--    if ( reset )
--        p2m_set_entry(p2m, gfn, mfn0, 9, type0, p2m->default_access);
--    
-+    /*
-+     * This p2m_set_entry() call shouldn't be able to fail, since the same order
-+     * on the same gfn succeeded above.  If that turns out to be false, crashing
-+     * the domain should be the safest way of making sure we don't leak memory.
-+     */
-+    if ( reset && p2m_set_entry(p2m, gfn, mfn0, PAGE_ORDER_2M,
-+                                type0, p2m->default_access) )
-+    {
-+        ASSERT_UNREACHABLE();
-+        domain_crash(d);
-+    }
-+
- out:
-     gfn_unlock(p2m, gfn, SUPERPAGE_ORDER);
-     return ret;
-@@ -869,19 +880,30 @@ p2m_pod_zero_check(struct p2m_domain *p2m, unsigned long *gfns, int count)
-         }
- 
-         /* Try to remove the page, restoring old mapping if it fails. */
--        p2m_set_entry(p2m, gfns[i], INVALID_MFN, PAGE_ORDER_4K,
--                      p2m_populate_on_demand, p2m->default_access);
-+        if ( p2m_set_entry(p2m, gfns[i], INVALID_MFN, PAGE_ORDER_4K,
-+                           p2m_populate_on_demand, p2m->default_access) )
-+            goto skip;
- 
-         /* See if the page was successfully unmapped.  (Allow one refcount
-          * for being allocated to a domain.) */
-         if ( (mfn_to_page(mfns[i])->count_info & PGC_count_mask) > 1 )
-         {
-+            /*
-+             * If the previous p2m_set_entry call succeeded, this one shouldn't
-+             * be able to fail.  If it does, crashing the domain should be safe.
-+             */
-+            if ( p2m_set_entry(p2m, gfns[i], mfns[i], PAGE_ORDER_4K,
-+                               types[i], p2m->default_access) )
-+            {
-+                ASSERT_UNREACHABLE();
-+                domain_crash(d);
-+                goto out_unmap;
-+            }
-+
-+        skip:
-             unmap_domain_page(map[i]);
-             map[i] = NULL;
- 
--            p2m_set_entry(p2m, gfns[i], mfns[i], PAGE_ORDER_4K,
--                types[i], p2m->default_access);
--
-             continue;
-         }
-     }
-@@ -900,12 +922,25 @@ p2m_pod_zero_check(struct p2m_domain *p2m, unsigned long *gfns, int count)
- 
-         unmap_domain_page(map[i]);
- 
--        /* See comment in p2m_pod_zero_check_superpage() re gnttab
--         * check timing.  */
--        if ( j < PAGE_SIZE/sizeof(*map[i]) )
-+        map[i] = NULL;
-+
-+        /*
-+         * See comment in p2m_pod_zero_check_superpage() re gnttab
-+         * check timing.
-+         */
-+        if ( j < (PAGE_SIZE / sizeof(*map[i])) )
-         {
--            p2m_set_entry(p2m, gfns[i], mfns[i], PAGE_ORDER_4K,
--                types[i], p2m->default_access);
-+            /*
-+             * If the previous p2m_set_entry call succeeded, this one shouldn't
-+             * be able to fail.  If it does, crashing the domain should be safe.
-+             */
-+            if ( p2m_set_entry(p2m, gfns[i], mfns[i], PAGE_ORDER_4K,
-+                               types[i], p2m->default_access) )
-+            {
-+                ASSERT_UNREACHABLE();
-+                domain_crash(d);
-+                goto out_unmap;
-+            }
-         }
-         else
-         {
-@@ -929,7 +964,17 @@ p2m_pod_zero_check(struct p2m_domain *p2m, unsigned long *gfns, int count)
-             p2m->pod.entry_count++;
-         }
-     }
--    
-+
-+    return;
-+
-+out_unmap:
-+    /*
-+     * Something went wrong, probably crashing the domain.  Unmap
-+     * everything and return.
-+     */
-+    for ( i = 0; i < count; i++ )
-+        if ( map[i] )
-+            unmap_domain_page(map[i]);
- }
- 
- #define POD_SWEEP_LIMIT 1024
--- 
-2.15.0
-
diff --git a/recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch b/recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
deleted file mode 100644
index 8c850bd..0000000
--- a/recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From d4bc7833707351a5341a6bdf04c752a028d9560d Mon Sep 17 00:00:00 2001
-From: George Dunlap <george.dunlap@citrix.com>
-Date: Fri, 10 Nov 2017 16:53:55 +0000
-Subject: [PATCH 2/2] p2m: Check return value of p2m_set_entry() when
- decreasing reservation
-
-If the entire range specified to p2m_pod_decrease_reservation() is marked
-populate-on-demand, then it will make a single p2m_set_entry() call,
-reducing its PoD entry count.
-
-Unfortunately, in the right circumstances, this p2m_set_entry() call
-may fail.  It that case, repeated calls to decrease_reservation() may
-cause p2m->pod.entry_count to fall below zero, potentially tripping
-over BUG_ON()s to the contrary.
-
-Instead, check to see if the entry succeeded, and return false if not.
-The caller will then call guest_remove_page() on the gfns, which will
-return -EINVAL upon finding no valid memory there to return.
-
-Unfortunately if the order > 0, the entry may have partially changed.
-A domain_crash() is probably the safest thing in that case.
-
-Other p2m_set_entry() calls in the same function should be fine,
-because they are writing the entry at its current order.  Nonetheless,
-check the return value and crash if our assumption turns otu to be
-wrong.
-
-This is part of XSA-247.
-
-Reported-by: George Dunlap <george.dunlap.com>
-Signed-off-by: George Dunlap <george.dunlap@citrix.com>
-Reviewed-by: Jan Beulich <jbeulich@suse.com>
----
-v2: Crash the domain if we're not sure it's safe (or if we think it
-can't happen)
----
- xen/arch/x86/mm/p2m-pod.c | 42 +++++++++++++++++++++++++++++++++---------
- 1 file changed, 33 insertions(+), 9 deletions(-)
-
-diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
-index f2ed751892..473d6a6dbf 100644
---- a/xen/arch/x86/mm/p2m-pod.c
-+++ b/xen/arch/x86/mm/p2m-pod.c
-@@ -555,11 +555,23 @@ p2m_pod_decrease_reservation(struct domain *d,
- 
-     if ( !nonpod )
-     {
--        /* All PoD: Mark the whole region invalid and tell caller
--         * we're done. */
--        p2m_set_entry(p2m, gpfn, INVALID_MFN, order, p2m_invalid,
--                      p2m->default_access);
--        p2m->pod.entry_count-=(1<<order);
-+        /*
-+         * All PoD: Mark the whole region invalid and tell caller
-+         * we're done.
-+         */
-+        if ( p2m_set_entry(p2m, gpfn, INVALID_MFN, order, p2m_invalid,
-+                           p2m->default_access) )
-+        {
-+            /*
-+             * If this fails, we can't tell how much of the range was changed.
-+             * Best to crash the domain unless we're sure a partial change is
-+             * impossible.
-+             */
-+            if ( order != 0 )
-+                domain_crash(d);
-+            goto out_unlock;
-+        }
-+        p2m->pod.entry_count -= 1UL << order;
-         BUG_ON(p2m->pod.entry_count < 0);
-         ret = 1;
-         goto out_entry_check;
-@@ -600,8 +612,14 @@ p2m_pod_decrease_reservation(struct domain *d,
-         n = 1UL << cur_order;
-         if ( t == p2m_populate_on_demand )
-         {
--            p2m_set_entry(p2m, gpfn + i, INVALID_MFN, cur_order,
--                          p2m_invalid, p2m->default_access);
-+            /* This shouldn't be able to fail */
-+            if ( p2m_set_entry(p2m, gpfn + i, INVALID_MFN, cur_order,
-+                               p2m_invalid, p2m->default_access) )
-+            {
-+                ASSERT_UNREACHABLE();
-+                domain_crash(d);
-+                goto out_unlock;
-+            }
-             p2m->pod.entry_count -= n;
-             BUG_ON(p2m->pod.entry_count < 0);
-             pod -= n;
-@@ -622,8 +640,14 @@ p2m_pod_decrease_reservation(struct domain *d,
- 
-             page = mfn_to_page(mfn);
- 
--            p2m_set_entry(p2m, gpfn + i, INVALID_MFN, cur_order,
--                          p2m_invalid, p2m->default_access);
-+            /* This shouldn't be able to fail */
-+            if ( p2m_set_entry(p2m, gpfn + i, INVALID_MFN, cur_order,
-+                               p2m_invalid, p2m->default_access) )
-+            {
-+                ASSERT_UNREACHABLE();
-+                domain_crash(d);
-+                goto out_unlock;
-+            }
-             p2m_tlb_flush_sync(p2m);
-             for ( j = 0; j < n; ++j )
-                 set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
--- 
-2.15.0
-
diff --git a/recipes-extended/xen/files/xsa246-4.9.patch b/recipes-extended/xen/files/xsa246-4.9.patch
deleted file mode 100644
index 6370a10..0000000
--- a/recipes-extended/xen/files/xsa246-4.9.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From: Julien Grall <julien.grall@linaro.org>
-Subject: x86/pod: prevent infinite loop when shattering large pages
-
-When populating pages, the PoD may need to split large ones using
-p2m_set_entry and request the caller to retry (see ept_get_entry for
-instance).
-
-p2m_set_entry may fail to shatter if it is not possible to allocate
-memory for the new page table. However, the error is not propagated
-resulting to the callers to retry infinitely the PoD.
-
-Prevent the infinite loop by return false when it is not possible to
-shatter the large mapping.
-
-This is XSA-246.
-
-Signed-off-by: Julien Grall <julien.grall@linaro.org>
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: George Dunlap <george.dunlap@citrix.com>
-
---- a/xen/arch/x86/mm/p2m-pod.c
-+++ b/xen/arch/x86/mm/p2m-pod.c
-@@ -1071,9 +1071,8 @@ p2m_pod_demand_populate(struct p2m_domai
-          * NOTE: In a fine-grained p2m locking scenario this operation
-          * may need to promote its locking from gfn->1g superpage
-          */
--        p2m_set_entry(p2m, gfn_aligned, INVALID_MFN, PAGE_ORDER_2M,
--                      p2m_populate_on_demand, p2m->default_access);
--        return 0;
-+        return p2m_set_entry(p2m, gfn_aligned, INVALID_MFN, PAGE_ORDER_2M,
-+                             p2m_populate_on_demand, p2m->default_access);
-     }
- 
-     /* Only reclaim if we're in actual need of more cache. */
-@@ -1104,8 +1103,12 @@ p2m_pod_demand_populate(struct p2m_domai
- 
-     gfn_aligned = (gfn >> order) << order;
- 
--    p2m_set_entry(p2m, gfn_aligned, mfn, order, p2m_ram_rw,
--                  p2m->default_access);
-+    if ( p2m_set_entry(p2m, gfn_aligned, mfn, order, p2m_ram_rw,
-+                       p2m->default_access) )
-+    {
-+        p2m_pod_cache_add(p2m, p, order);
-+        goto out_fail;
-+    }
- 
-     for( i = 0; i < (1UL << order); i++ )
-     {
-@@ -1150,13 +1153,18 @@ remap_and_retry:
-     BUG_ON(order != PAGE_ORDER_2M);
-     pod_unlock(p2m);
- 
--    /* Remap this 2-meg region in singleton chunks */
--    /* NOTE: In a p2m fine-grained lock scenario this might
--     * need promoting the gfn lock from gfn->2M superpage */
-+    /*
-+     * Remap this 2-meg region in singleton chunks. See the comment on the
-+     * 1G page splitting path above for why a single call suffices.
-+     *
-+     * NOTE: In a p2m fine-grained lock scenario this might
-+     * need promoting the gfn lock from gfn->2M superpage.
-+     */
-     gfn_aligned = (gfn>>order)<<order;
--    for(i=0; i<(1<<order); i++)
--        p2m_set_entry(p2m, gfn_aligned + i, INVALID_MFN, PAGE_ORDER_4K,
--                      p2m_populate_on_demand, p2m->default_access);
-+    if ( p2m_set_entry(p2m, gfn_aligned, INVALID_MFN, PAGE_ORDER_4K,
-+                       p2m_populate_on_demand, p2m->default_access) )
-+        return -1;
-+
-     if ( tb_init_done )
-     {
-         struct {
diff --git a/recipes-extended/xen/files/xsa248.patch b/recipes-extended/xen/files/xsa248.patch
deleted file mode 100644
index 966c16e..0000000
--- a/recipes-extended/xen/files/xsa248.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From: Jan Beulich <jbeulich@suse.com>
-Subject: x86/mm: don't wrongly set page ownership
-
-PV domains can obtain mappings of any pages owned by the correct domain,
-including ones that aren't actually assigned as "normal" RAM, but used
-by Xen internally.  At the moment such "internal" pages marked as owned
-by a guest include pages used to track logdirty bits, as well as p2m
-pages and the "unpaged pagetable" for HVM guests. Since the PV memory
-management and shadow code conflict in their use of struct page_info
-fields, and since shadow code is being used for log-dirty handling for
-PV domains, pages coming from the shadow pool must, for PV domains, not
-have the domain set as their owner.
-
-While the change could be done conditionally for just the PV case in
-shadow code, do it unconditionally (and for consistency also for HAP),
-just to be on the safe side.
-
-There's one special case though for shadow code: The page table used for
-running a HVM guest in unpaged mode is subject to get_page() (in
-set_shadow_status()) and hence must have its owner set.
-
-This is XSA-248.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: Tim Deegan <tim@xen.org>
-Reviewed-by: George Dunlap <george.dunlap@citrix.com>
----
-v2: Drop PGC_page_table related pieces.
-
---- a/xen/arch/x86/mm/hap/hap.c
-+++ b/xen/arch/x86/mm/hap/hap.c
-@@ -286,8 +286,7 @@ static struct page_info *hap_alloc_p2m_p
-     {
-         d->arch.paging.hap.total_pages--;
-         d->arch.paging.hap.p2m_pages++;
--        page_set_owner(pg, d);
--        pg->count_info |= 1;
-+        ASSERT(!page_get_owner(pg) && !(pg->count_info & PGC_count_mask));
-     }
-     else if ( !d->arch.paging.p2m_alloc_failed )
-     {
-@@ -302,21 +301,23 @@ static struct page_info *hap_alloc_p2m_p
- 
- static void hap_free_p2m_page(struct domain *d, struct page_info *pg)
- {
-+    struct domain *owner = page_get_owner(pg);
-+
-     /* This is called both from the p2m code (which never holds the 
-      * paging lock) and the log-dirty code (which always does). */
-     paging_lock_recursive(d);
- 
--    ASSERT(page_get_owner(pg) == d);
--    /* Should have just the one ref we gave it in alloc_p2m_page() */
--    if ( (pg->count_info & PGC_count_mask) != 1 ) {
--        HAP_ERROR("Odd p2m page %p count c=%#lx t=%"PRtype_info"\n",
--                     pg, pg->count_info, pg->u.inuse.type_info);
-+    /* Should still have no owner and count zero. */
-+    if ( owner || (pg->count_info & PGC_count_mask) )
-+    {
-+        HAP_ERROR("d%d: Odd p2m page %"PRI_mfn" d=%d c=%lx t=%"PRtype_info"\n",
-+                  d->domain_id, mfn_x(page_to_mfn(pg)),
-+                  owner ? owner->domain_id : DOMID_INVALID,
-+                  pg->count_info, pg->u.inuse.type_info);
-         WARN();
-+        pg->count_info &= ~PGC_count_mask;
-+        page_set_owner(pg, NULL);
-     }
--    pg->count_info &= ~PGC_count_mask;
--    /* Free should not decrement domain's total allocation, since
--     * these pages were allocated without an owner. */
--    page_set_owner(pg, NULL);
-     d->arch.paging.hap.p2m_pages--;
-     d->arch.paging.hap.total_pages++;
-     hap_free(d, page_to_mfn(pg));
---- a/xen/arch/x86/mm/shadow/common.c
-+++ b/xen/arch/x86/mm/shadow/common.c
-@@ -1503,32 +1503,29 @@ shadow_alloc_p2m_page(struct domain *d)
-     pg = mfn_to_page(shadow_alloc(d, SH_type_p2m_table, 0));
-     d->arch.paging.shadow.p2m_pages++;
-     d->arch.paging.shadow.total_pages--;
-+    ASSERT(!page_get_owner(pg) && !(pg->count_info & PGC_count_mask));
- 
-     paging_unlock(d);
- 
--    /* Unlike shadow pages, mark p2m pages as owned by the domain.
--     * Marking the domain as the owner would normally allow the guest to
--     * create mappings of these pages, but these p2m pages will never be
--     * in the domain's guest-physical address space, and so that is not
--     * believed to be a concern. */
--    page_set_owner(pg, d);
--    pg->count_info |= 1;
-     return pg;
- }
- 
- static void
- shadow_free_p2m_page(struct domain *d, struct page_info *pg)
- {
--    ASSERT(page_get_owner(pg) == d);
--    /* Should have just the one ref we gave it in alloc_p2m_page() */
--    if ( (pg->count_info & PGC_count_mask) != 1 )
-+    struct domain *owner = page_get_owner(pg);
-+
-+    /* Should still have no owner and count zero. */
-+    if ( owner || (pg->count_info & PGC_count_mask) )
-     {
--        SHADOW_ERROR("Odd p2m page count c=%#lx t=%"PRtype_info"\n",
-+        SHADOW_ERROR("d%d: Odd p2m page %"PRI_mfn" d=%d c=%lx t=%"PRtype_info"\n",
-+                     d->domain_id, mfn_x(page_to_mfn(pg)),
-+                     owner ? owner->domain_id : DOMID_INVALID,
-                      pg->count_info, pg->u.inuse.type_info);
-+        pg->count_info &= ~PGC_count_mask;
-+        page_set_owner(pg, NULL);
-     }
--    pg->count_info &= ~PGC_count_mask;
-     pg->u.sh.type = SH_type_p2m_table; /* p2m code reuses type-info */
--    page_set_owner(pg, NULL);
- 
-     /* This is called both from the p2m code (which never holds the
-      * paging lock) and the log-dirty code (which always does). */
-@@ -3132,7 +3129,9 @@ int shadow_enable(struct domain *d, u32
-         e = __map_domain_page(pg);
-         write_32bit_pse_identmap(e);
-         unmap_domain_page(e);
-+        pg->count_info = 1;
-         pg->u.inuse.type_info = PGT_l2_page_table | 1 | PGT_validated;
-+        page_set_owner(pg, d);
-     }
- 
-     paging_lock(d);
-@@ -3170,7 +3169,11 @@ int shadow_enable(struct domain *d, u32
-     if ( rv != 0 && !pagetable_is_null(p2m_get_pagetable(p2m)) )
-         p2m_teardown(p2m);
-     if ( rv != 0 && pg != NULL )
-+    {
-+        pg->count_info &= ~PGC_count_mask;
-+        page_set_owner(pg, NULL);
-         shadow_free_p2m_page(d, pg);
-+    }
-     domain_unpause(d);
-     return rv;
- }
-@@ -3279,7 +3282,22 @@ out:
- 
-     /* Must be called outside the lock */
-     if ( unpaged_pagetable )
-+    {
-+        if ( page_get_owner(unpaged_pagetable) == d &&
-+             (unpaged_pagetable->count_info & PGC_count_mask) == 1 )
-+        {
-+            unpaged_pagetable->count_info &= ~PGC_count_mask;
-+            page_set_owner(unpaged_pagetable, NULL);
-+        }
-+        /* Complain here in cases where shadow_free_p2m_page() won't. */
-+        else if ( !page_get_owner(unpaged_pagetable) &&
-+                  !(unpaged_pagetable->count_info & PGC_count_mask) )
-+            SHADOW_ERROR("d%d: Odd unpaged pt %"PRI_mfn" c=%lx t=%"PRtype_info"\n",
-+                         d->domain_id, mfn_x(page_to_mfn(unpaged_pagetable)),
-+                         unpaged_pagetable->count_info,
-+                         unpaged_pagetable->u.inuse.type_info);
-         shadow_free_p2m_page(d, unpaged_pagetable);
-+    }
- }
- 
- void shadow_final_teardown(struct domain *d)
diff --git a/recipes-extended/xen/files/xsa249.patch b/recipes-extended/xen/files/xsa249.patch
deleted file mode 100644
index ecfa430..0000000
--- a/recipes-extended/xen/files/xsa249.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From: Jan Beulich <jbeulich@suse.com>
-Subject: x86/shadow: fix refcount overflow check
-
-Commit c385d27079 ("x86 shadow: for multi-page shadows, explicitly track
-the first page") reduced the refcount width to 25, without adjusting the
-overflow check. Eliminate the disconnect by using a manifest constant.
-
-Interestingly, up to commit 047782fa01 ("Out-of-sync L1 shadows: OOS
-snapshot") the refcount was 27 bits wide, yet the check was already
-using 26.
-
-This is XSA-249.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: George Dunlap <george.dunlap@citrix.com>
-Reviewed-by: Tim Deegan <tim@xen.org>
----
-v2: Simplify expression back to the style it was.
-
---- a/xen/arch/x86/mm/shadow/private.h
-+++ b/xen/arch/x86/mm/shadow/private.h
-@@ -529,7 +529,7 @@ static inline int sh_get_ref(struct doma
-     x = sp->u.sh.count;
-     nx = x + 1;
- 
--    if ( unlikely(nx >= 1U<<26) )
-+    if ( unlikely(nx >= (1U << PAGE_SH_REFCOUNT_WIDTH)) )
-     {
-         SHADOW_PRINTK("shadow ref overflow, gmfn=%lx smfn=%lx\n",
-                        __backpointer(sp), mfn_x(smfn));
---- a/xen/include/asm-x86/mm.h
-+++ b/xen/include/asm-x86/mm.h
-@@ -82,7 +82,8 @@ struct page_info
-             unsigned long type:5;   /* What kind of shadow is this? */
-             unsigned long pinned:1; /* Is the shadow pinned? */
-             unsigned long head:1;   /* Is this the first page of the shadow? */
--            unsigned long count:25; /* Reference count */
-+#define PAGE_SH_REFCOUNT_WIDTH 25
-+            unsigned long count:PAGE_SH_REFCOUNT_WIDTH; /* Reference count */
-         } sh;
- 
-         /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
diff --git a/recipes-extended/xen/files/xsa250.patch b/recipes-extended/xen/files/xsa250.patch
deleted file mode 100644
index 26aeb33..0000000
--- a/recipes-extended/xen/files/xsa250.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From: Jan Beulich <jbeulich@suse.com>
-Subject: x86/shadow: fix ref-counting error handling
-
-The old-Linux handling in shadow_set_l4e() mistakenly ORed together the
-results of sh_get_ref() and sh_pin(). As the latter failing is not a
-correctness problem, simply ignore its return value.
-
-In sh_set_toplevel_shadow() a failing sh_get_ref() must not be
-accompanied by installing the entry, despite the domain being crashed.
-
-This is XSA-250.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: Tim Deegan <tim@xen.org>
-
---- a/xen/arch/x86/mm/shadow/multi.c
-+++ b/xen/arch/x86/mm/shadow/multi.c
-@@ -923,7 +923,7 @@ static int shadow_set_l4e(struct domain
-                           shadow_l4e_t new_sl4e,
-                           mfn_t sl4mfn)
- {
--    int flags = 0, ok;
-+    int flags = 0;
-     shadow_l4e_t old_sl4e;
-     paddr_t paddr;
-     ASSERT(sl4e != NULL);
-@@ -938,15 +938,16 @@ static int shadow_set_l4e(struct domain
-     {
-         /* About to install a new reference */
-         mfn_t sl3mfn = shadow_l4e_get_mfn(new_sl4e);
--        ok = sh_get_ref(d, sl3mfn, paddr);
--        /* Are we pinning l3 shadows to handle wierd linux behaviour? */
--        if ( sh_type_is_pinnable(d, SH_type_l3_64_shadow) )
--            ok |= sh_pin(d, sl3mfn);
--        if ( !ok )
-+
-+        if ( !sh_get_ref(d, sl3mfn, paddr) )
-         {
-             domain_crash(d);
-             return SHADOW_SET_ERROR;
-         }
-+
-+        /* Are we pinning l3 shadows to handle weird Linux behaviour? */
-+        if ( sh_type_is_pinnable(d, SH_type_l3_64_shadow) )
-+            sh_pin(d, sl3mfn);
-     }
- 
-     /* Write the new entry */
-@@ -3965,14 +3966,15 @@ sh_set_toplevel_shadow(struct vcpu *v,
- 
-     /* Take a ref to this page: it will be released in sh_detach_old_tables()
-      * or the next call to set_toplevel_shadow() */
--    if ( !sh_get_ref(d, smfn, 0) )
-+    if ( sh_get_ref(d, smfn, 0) )
-+        new_entry = pagetable_from_mfn(smfn);
-+    else
-     {
-         SHADOW_ERROR("can't install %#lx as toplevel shadow\n", mfn_x(smfn));
-         domain_crash(d);
-+        new_entry = pagetable_null();
-     }
- 
--    new_entry = pagetable_from_mfn(smfn);
--
-  install_new_entry:
-     /* Done.  Install it */
-     SHADOW_PRINTK("%u/%u [%u] gmfn %#"PRI_mfn" smfn %#"PRI_mfn"\n",
diff --git a/recipes-extended/xen/files/xsa251.patch b/recipes-extended/xen/files/xsa251.patch
deleted file mode 100644
index 582ef62..0000000
--- a/recipes-extended/xen/files/xsa251.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From: Jan Beulich <jbeulich@suse.com>
-Subject: x86/paging: don't unconditionally BUG() on finding SHARED_M2P_ENTRY
-
-PV guests can fully control the values written into the P2M.
-
-This is XSA-251.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
-
---- a/xen/arch/x86/mm/paging.c
-+++ b/xen/arch/x86/mm/paging.c
-@@ -274,7 +274,7 @@ void paging_mark_pfn_dirty(struct domain
-         return;
- 
-     /* Shared MFNs should NEVER be marked dirty */
--    BUG_ON(SHARED_M2P(pfn_x(pfn)));
-+    BUG_ON(paging_mode_translate(d) && SHARED_M2P(pfn_x(pfn)));
- 
-     /*
-      * Values with the MSB set denote MFNs that aren't really part of the
diff --git a/recipes-extended/xen/xen_4.9.1.bb b/recipes-extended/xen/xen_4.9.1.bb
deleted file mode 100644
index 5c18bb0..0000000
--- a/recipes-extended/xen/xen_4.9.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-require xen.inc
-
-SRC_URI = " \
-    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
-    file://xsa246-4.9.patch \
-    file://0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch \
-    file://0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch \
-    file://xsa248.patch \
-    file://xsa249.patch \
-    file://xsa250.patch \
-    file://xsa251.patch \
-    "
-
-SRC_URI[md5sum] = "8b9d6104694b164d54334194135f7217"
-SRC_URI[sha256sum] = "ecf88b01f44cd8f4ef208af3f999dceb69bdd2a316d88dd9a9535ea7b49ed356"
-
-S = "${WORKDIR}/xen-${PV}"
-- 
2.7.4


