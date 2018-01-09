Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16455E00E24; Mon,  8 Jan 2018 23:13:16 -0800 (PST)
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
	*      [209.85.223.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFB87E00E15
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jan 2018 23:13:03 -0800 (PST)
Received: by mail-io0-f195.google.com with SMTP id 87so17436657ior.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jan 2018 23:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y5nsvsKe3STU3Y/ocIgKMS+ZnBAiOe3qqHBfOyrwwUk=;
	b=DTHJkGityQz8kV4EUp1k+Kki+3ggkL2TbsEHEkzjUqYeBcNXyjO7q5fMkhd+bEyQDU
	uQdryXwV9vjCnR17oFVkIsthapSwpWeNr/hElj/AG8TrrZyShbOrhzjTFPLI8MLk7uAj
	WlwMpRjNuMrcB1emqm1OAyadChNXfM5/j00BvFICzJW+SkxbwZ5eFE/sfARoA8M8dxmv
	qIx75COUsNUJWdYVm5U8FJTvAlrDwnA87Aq+uYpvfzuPypDE/3wcRF3cgfjkYpe5DhTd
	flYBDSieu6iegxrE9ay9bBnNnafztdlyo1qzt4GYbKhY/Q0nxQCTyHjmMACpaA962aGg
	mD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y5nsvsKe3STU3Y/ocIgKMS+ZnBAiOe3qqHBfOyrwwUk=;
	b=I7yE5nsauH7ztdvSqttntY++aflfCI7sl4umGHrxvpjS0FtMXNwsPzlzJZ3050KIDS
	P3pV10UFdSi1QjcmfrNTGPTIKqfq/Xl8a25+oWx3pp3Dm+2u4xrGFfBYzsdNBKcidcC1
	Uk0gNkYLExSrmVbxfPTpf2hkIDkuLi8zJ0z80W53yG03JajYvCtigtTXvk9cOpCLkjqA
	x8pP4euqyxe+QVo3W/5/j6LyEJX/knI9eK63M0AaOGROl+ibpiB9mfx1UppHoceIaqTe
	JGo03OPlSKzrTSCtobPT9elxox2vB8uq2iUbPaNOZgqSIIW3HOYiTmEZPh8aLV78t0oB
	WqIg==
X-Gm-Message-State: AKGB3mIknyKIahJd+Ier02lKlewp57TBIOAw/7RycGStiwHFQrkMDgIY
	YxtF1rwRWI1/0r2c7fjTuz7TqCgD
X-Google-Smtp-Source: ACJfBov8F22wQ2BFzkosaVTPGzpHcC6IOL4Z9bjRL12raFM+l8AuVDgahOgHEAQ4RKkSujh1N53z2A==
X-Received: by 10.107.173.143 with SMTP id m15mr13782402ioo.220.1515481983073; 
	Mon, 08 Jan 2018 23:13:03 -0800 (PST)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	y64sm7725921ioy.25.2018.01.08.23.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 23:13:02 -0800 (PST)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  8 Jan 2018 23:12:48 -0800
Message-Id: <1515481968-4085-6-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
References: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 5/5] xen: for 4.10.0: XSA-253 / CVE-2018-5244 patch
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
X-List-Received-Date: Tue, 09 Jan 2018 07:13:16 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Fix a memory leak with MSR emulation on x86.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

This patch is only required for Xen 4.10.0 and not for Xen 4.9.x.

 recipes-extended/xen/files/xsa253.patch | 26 ++++++++++++++++++++++++++
 recipes-extended/xen/xen_4.10.0.bb      |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 recipes-extended/xen/files/xsa253.patch

diff --git a/recipes-extended/xen/files/xsa253.patch b/recipes-extended/xen/files/xsa253.patch
new file mode 100644
index 0000000..19e4269
--- /dev/null
+++ b/recipes-extended/xen/files/xsa253.patch
@@ -0,0 +1,26 @@
+From: Andrew Cooper <andrew.cooper3@citrix.com>
+Subject: x86/msr: Free msr_vcpu_policy during vcpu destruction
+
+c/s 4187f79dc7 "x86/msr: introduce struct msr_vcpu_policy" introduced a
+per-vcpu memory allocation, but failed to free it in the clean vcpu
+destruction case.
+
+This is XSA-253
+
+Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
+Reviewed-by: Jan Beulich <jbeulich@suse.com>
+
+diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
+index b17468c..0ae715d 100644
+--- a/xen/arch/x86/domain.c
++++ b/xen/arch/x86/domain.c
+@@ -382,6 +382,9 @@ void vcpu_destroy(struct vcpu *v)
+ 
+     vcpu_destroy_fpu(v);
+ 
++    xfree(v->arch.msr);
++    v->arch.msr = NULL;
++
+     if ( !is_idle_domain(v->domain) )
+         vpmu_destroy(v);
+ 
diff --git a/recipes-extended/xen/xen_4.10.0.bb b/recipes-extended/xen/xen_4.10.0.bb
index 1e14c86..d314b9b 100644
--- a/recipes-extended/xen/xen_4.10.0.bb
+++ b/recipes-extended/xen/xen_4.10.0.bb
@@ -1,7 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 require xen.inc
 
 SRC_URI = " \
     https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    file://xsa253.patch \
     "
 
 SRC_URI[md5sum] = "ab9d320d02cb40f6b40506aed1a38d58"
-- 
2.7.4


