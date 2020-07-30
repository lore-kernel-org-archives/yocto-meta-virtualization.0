Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1549.1596129665619045485
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 10:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kaxz47g3;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BB71E01F52; Thu, 30 Jul 2020 10:21:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51C06E01F50
	for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 10:21:04 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id g26so26361096qka.3
        for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nbNaND1KtfTNCQQ89WCJ8TWSMiB+wBXCzJiW+TK2hTU=;
        b=Kaxz47g3P3hooC5LxAm0Fhubz4SF73Pkrmvm+ESkY702oqS18HJrT/tvkO/xoyEkCM
         /kcpWjUZD4pNq+PrqfZyvLOglk0lfZbqHyRAxVj3WwKdO1XC/TIibshQWRCLXndBI1uI
         ggvH2wJr53/eRvXAeeXxVKV7D6ugNt/ZpsyMj8Vst72GyneuD7NzIZlSNAAzKNAWagUS
         Dy9daK+t9w/fO7dMTBClU+P/KhYOZU6jsAsUmektCsYbw4f32frZ9/3ZM1qvVokxFk9d
         y4KhZ1HQdb5eoRK1fMIYJJSSZvYAU7Fgej9jUj9b2VbZ4VDZ6cDkhBQwmmQk7xrw21Of
         vH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nbNaND1KtfTNCQQ89WCJ8TWSMiB+wBXCzJiW+TK2hTU=;
        b=dHSPT8pOEIN0HUPezzG/VCvkSQ37a4038RRYzzAs0+OG6n7iIbZdGxREPsqDg9t5JE
         AwO5ZmyTJKe3IFbyjJ5qip1HoWsmopC+0jqiCeYM0P3ER3BdtvOGN/gye+u+JTX4SSmg
         9Vyib2CjmKjn23v0hBx23BRYAwJ4uQ/t0w3d6/mdzXK4Sbg9kCLnKGqWR9/OKf9iEZGA
         hjNG/LZTcHbchHIBOfEg8KJ6yWBr/9gdGTqbYQ5ENEpz1lSCPLDVb3VaDiQxRQ/pusR8
         cvWokxOR9AvFSMApQrkvGvEpFd50T9vhia5zWOc/6mb5NB32cg5bHnz/di9rtQ8r0xFg
         rn2g==
X-Gm-Message-State: AOAM533JwQQpZGN2uEEqnfubTMzRdWoxozC169SL/vQBRqH5dAiFphqm
	ZpIcK5XUaBxTpBV+/zFCjahtaC1W
X-Google-Smtp-Source: ABdhPJyvY96NjORmsJv3lO+/BNMYh+1VIZV9UdXyqeCUwyFfxjOGbNvh7yJeRxiOOHWSEkSb4qHMeA==
X-Received: by 2002:a37:b9c4:: with SMTP id j187mr256143qkf.174.1596129663558;
        Thu, 30 Jul 2020 10:21:03 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-187-239.mycingular.net. [166.176.187.239])
        by smtp.gmail.com with ESMTPSA id g3sm1279073qtq.70.2020.07.30.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 10:21:03 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 2/3] ipxe: fix build with gcc 10.1.0
Date: Thu, 30 Jul 2020 10:20:40 -0700
Message-Id: <20200730172041.32126-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730172041.32126-1-christopher.w.clark@gmail.com>
References: <20200730172041.32126-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Apply two upstream patches to fix compiler warnings.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 ...it-type-casts-for-nodnic_queue_pair_.patch | 43 +++++++++
 ...-spurious-compiler-warning-on-GCC-10.patch | 89 +++++++++++++++++++
 recipes-extended/ipxe/ipxe_git.bb             |  2 +
 3 files changed, 134 insertions(+)
 create mode 100644 recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch
 create mode 100644 recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch

diff --git a/recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch b/recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch
new file mode 100644
index 0000000..62e8e9d
--- /dev/null
+++ b/recipes-extended/ipxe/files/ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch
@@ -0,0 +1,43 @@
+From 8a1d66c7aec020f3e90254ed2fa55ecd9494fcc3 Mon Sep 17 00:00:00 2001
+From: Michael Brown <mcb30@ipxe.org>
+Date: Sat, 27 Jun 2020 20:43:32 +0100
+Subject: [PATCH] [golan] Add explicit type casts for nodnic_queue_pair_type
+
+GCC 10 emits warnings for implicit conversions of enumerated types.
+
+The flexboot_nodnic code defines nodnic_queue_pair_type with values
+identical to those of ib_queue_pair_type, and implicitly casts between
+them.  Add an explicit cast to fix the warning.
+
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+---
+ src/drivers/infiniband/flexboot_nodnic.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/drivers/infiniband/flexboot_nodnic.c b/src/drivers/infiniband/flexboot_nodnic.c
+index 93bb0544..7d039fff 100644
+--- a/drivers/infiniband/flexboot_nodnic.c
++++ b/drivers/infiniband/flexboot_nodnic.c
+@@ -365,7 +365,8 @@ static int flexboot_nodnic_create_qp ( struct ib_device *ibdev,
+ 		goto qp_alloc_err;
+ 	}
+ 
+-	status = nodnic_port_create_qp(&port->port_priv, qp->type,
++	status = nodnic_port_create_qp(&port->port_priv,
++			(nodnic_queue_pair_type) qp->type,
+ 			qp->send.num_wqes * sizeof(struct nodnic_send_wqbb),
+ 			qp->send.num_wqes,
+ 			qp->recv.num_wqes * sizeof(struct nodnic_recv_wqe),
+@@ -406,7 +407,8 @@ static void flexboot_nodnic_destroy_qp ( struct ib_device *ibdev,
+ 	struct flexboot_nodnic_port *port = &flexboot_nodnic->port[ibdev->port - 1];
+ 	struct flexboot_nodnic_queue_pair *flexboot_nodnic_qp = ib_qp_get_drvdata ( qp );
+ 
+-	nodnic_port_destroy_qp(&port->port_priv, qp->type,
++	nodnic_port_destroy_qp(&port->port_priv,
++			(nodnic_queue_pair_type) qp->type,
+ 			flexboot_nodnic_qp->nodnic_queue_pair);
+ 
+ 	free(flexboot_nodnic_qp);
+-- 
+2.17.1
+
diff --git a/recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch b/recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch
new file mode 100644
index 0000000..e424d22
--- /dev/null
+++ b/recipes-extended/ipxe/files/ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch
@@ -0,0 +1,89 @@
+From 28cf9806d1632d378485005babec295da0c77fcf Mon Sep 17 00:00:00 2001
+From: Michael Brown <mcb30@ipxe.org>
+Date: Sat, 27 Jun 2020 20:21:11 +0100
+Subject: [PATCH] [intel] Avoid spurious compiler warning on GCC 10
+
+GCC 10 produces a spurious warning about an out-of-bounds array access
+for the unsized raw dword array in union intelvf_msg.
+
+Avoid the warning by embedding the zero-length array within a struct.
+
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+---
+ src/drivers/net/intelvf.c | 18 ++++++++++--------
+ src/drivers/net/intelvf.h |  8 +++++++-
+ 2 files changed, 17 insertions(+), 9 deletions(-)
+
+diff --git a/src/drivers/net/intelvf.c b/src/drivers/net/intelvf.c
+index ac6fea74..0d48b417 100644
+--- a/drivers/net/intelvf.c
++++ b/drivers/net/intelvf.c
+@@ -52,14 +52,15 @@ FILE_LICENCE ( GPL2_OR_LATER_OR_UBDL );
+  */
+ static void intelvf_mbox_write ( struct intel_nic *intel,
+ 				 const union intelvf_msg *msg ) {
++	const struct intelvf_msg_raw *raw = &msg->raw;
+ 	unsigned int i;
+ 
+ 	/* Write message */
+ 	DBGC2 ( intel, "INTEL %p sending message", intel );
+-	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( msg->dword[0] ) ) ; i++){
+-		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), msg->dword[i] );
+-		writel ( msg->dword[i], ( intel->regs + intel->mbox.mem +
+-					  ( i * sizeof ( msg->dword[0] ) ) ) );
++	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( raw->dword[0] ) ) ; i++){
++		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), raw->dword[i] );
++		writel ( raw->dword[i], ( intel->regs + intel->mbox.mem +
++					  ( i * sizeof ( raw->dword[0] ) ) ) );
+ 	}
+ 	DBGC2 ( intel, "\n" );
+ }
+@@ -72,14 +73,15 @@ static void intelvf_mbox_write ( struct intel_nic *intel,
+  */
+ static void intelvf_mbox_read ( struct intel_nic *intel,
+ 				union intelvf_msg *msg ) {
++	struct intelvf_msg_raw *raw = &msg->raw;
+ 	unsigned int i;
+ 
+ 	/* Read message */
+ 	DBGC2 ( intel, "INTEL %p received message", intel );
+-	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( msg->dword[0] ) ) ; i++){
+-		msg->dword[i] = readl ( intel->regs + intel->mbox.mem +
+-					( i * sizeof ( msg->dword[0] ) ) );
+-		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), msg->dword[i] );
++	for ( i = 0 ; i < ( sizeof ( *msg ) / sizeof ( raw->dword[0] ) ) ; i++){
++		raw->dword[i] = readl ( intel->regs + intel->mbox.mem +
++					( i * sizeof ( raw->dword[0] ) ) );
++		DBGC2 ( intel, "%c%08x", ( i ? ':' : ' ' ), raw->dword[i] );
+ 	}
+ 	DBGC2 ( intel, "\n" );
+ }
+diff --git a/src/drivers/net/intelvf.h b/src/drivers/net/intelvf.h
+index ab404698..ffb18e04 100644
+--- a/drivers/net/intelvf.h
++++ b/drivers/net/intelvf.h
+@@ -119,6 +119,12 @@ struct intelvf_msg_queues {
+ 	uint32_t dflt;
+ } __attribute__ (( packed ));
+ 
++/** Raw mailbox message */
++struct intelvf_msg_raw {
++	/** Raw dwords */
++	uint32_t dword[0];
++} __attribute__ (( packed ));
++
+ /** Mailbox message */
+ union intelvf_msg {
+ 	/** Message header */
+@@ -132,7 +138,7 @@ union intelvf_msg {
+ 	/** Queue configuration message */
+ 	struct intelvf_msg_queues queues;
+ 	/** Raw dwords */
+-	uint32_t dword[0];
++	struct intelvf_msg_raw raw;
+ };
+ 
+ /** Maximum time to wait for mailbox message
+-- 
+2.17.1
+
diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 47c5b7a..fbaad30 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -13,6 +13,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI = " \
     git://git.ipxe.org/ipxe.git;protocol=https \
     file://ipxe-fix-hostcc-nopie-cflags.patch \
+    file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
+    file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch \
     "
 
 FILES_${PN} = "/usr/share/firmware/*.rom"
-- 
2.17.1

