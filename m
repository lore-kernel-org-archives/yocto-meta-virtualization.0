Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A042E0071F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 09:09:35 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6DG9Y58007429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 09:09:34 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sat, 13 Jul 2013 09:09:34 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Sat, 13 Jul 2013 12:09:26 -0400
Message-ID: <1373731766-7117-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] Revert "kvm: Make lapic hrtimer irq safe"
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
X-List-Received-Date: Sat, 13 Jul 2013 16:09:37 -0000
Content-Type: text/plain

This reverts commit 5345ad1661edb624aeca87f5fb08abccd4414f68.

Conflicts:
	arch/x86/kvm/lapic.c
---
 arch/x86/kvm/lapic.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 671aa5d..8c26c63 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1037,13 +1037,9 @@ static void start_apic_timer(struct kvm_lapic *apic)
 			}
 		}
 
-again:
-		if (hrtimer_start(&apic->lapic_timer.timer,
-				  ktime_add_ns(now, apic->lapic_timer.period),
-				  HRTIMER_MODE_ABS) == -ETIME) {
-			if (apic_timer_fn(&apic->lapic_timer.timer) == HRTIMER_RESTART)
-				goto again;
-		}
+		hrtimer_start(&apic->lapic_timer.timer,
+			      ktime_add_ns(now, apic->lapic_timer.period),
+			      HRTIMER_MODE_ABS);
 
 		apic_debug("%s: bus cycle is %" PRId64 "ns, now 0x%016"
 			   PRIx64 ", "
@@ -1562,7 +1558,6 @@ int kvm_create_lapic(struct kvm_vcpu *vcpu)
 	hrtimer_init(&apic->lapic_timer.timer, CLOCK_MONOTONIC,
 		     HRTIMER_MODE_ABS);
 	apic->lapic_timer.timer.function = apic_timer_fn;
-	apic->lapic_timer.timer.irqsafe = 1;
 	apic->lapic_timer.t_ops = &lapic_timer_ops;
 	apic->lapic_timer.kvm = vcpu->kvm;
 	apic->lapic_timer.vcpu = vcpu;
-- 
1.8.1.2


