Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.7833.1593486980062574862
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 20:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eCkSgjtK;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A440DE01DBF; Mon, 29 Jun 2020 20:16:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93801E01DBD
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 20:16:17 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id 80so17342703qko.7
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 20:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=i8i9cWaf/NmJPhrQ0hbMdwne8FDPnTZZ8MlTSfwYA+s=;
        b=eCkSgjtKP43cvf/vtO5a/Ft8gkTYvq+SMWCLOoeRYdt7giskdhc2eEKmz3QXZtwRE3
         dab3EF3PnyOstjA+boQo+3HGz3LKt0jOi4d5yqsBdcvmtoi2y9k0wlMfvVcOpHuOoEdi
         IrNNc+/M05NuElXD5USm+cY82WGilaNeNLuKBD0J0WRRptUHzT+VZqF0zUNagWoe5pBE
         pXHCNnQFrbnwJUda8Iqou224mREYSAVca0DCJpqMxy+GsxHwa+inP1OwFD4WI7yNZ/PC
         yu6JPQD4cTh285R0y364lbaNMDwbS46Cwm3w/MYh03zBWv6Chcl3myXxHgfAxMwCdTxy
         6x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i8i9cWaf/NmJPhrQ0hbMdwne8FDPnTZZ8MlTSfwYA+s=;
        b=NhiMxEP35Ogi5uxNkQOQv31YJTSy8oyL/uZKqDC0rxGzErAb32BgZi6pwbB2q3SO0O
         ZvNmN5thQDUtXSR1GQPXsCWRz1V0qvmnyfEYRgtRtELJ2tvI7ZLAqliI2hN4kTimiAzV
         b3RD2aamL9IuCEe4SR0/syg7+jYsTKbWq9d0U5QktU347WONiAEA/Dt5RJS+k+hql7ey
         bXfhEhwPIjGPrrAKk6903GzwTCHWkAQJ84R207bIel+EHa8vuFG6QwLT2qzyZb3WAJu3
         w0WpENKjL06LtVZ1a7WErMjJ9GpaMAx6zEbWa4TT71c5rfm8BX/SM4prO2Y4jc3/RO+w
         aiWg==
X-Gm-Message-State: AOAM5300Y3zF7U4rvFiaMFT5hwhYATjDoMw9WaxnNMUlE8mJfze3aOnx
	VgpnUw06dd8hkRPhW2VJ32QKw311
X-Google-Smtp-Source: ABdhPJySmKjauCqpO6U7QiE7Q+kY7E375p3cIs7SY9w4T05fHLgMbiS/NsebbZgOn0HURe14y0yyqg==
X-Received: by 2002:a37:a196:: with SMTP id k144mr18935991qke.329.1593486976300;
        Mon, 29 Jun 2020 20:16:16 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t5sm1883784qkh.46.2020.06.29.20.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:16:15 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] ipxe: fix build with gcc 10.1.0
Date: Mon, 29 Jun 2020 20:15:54 -0700
Message-Id: <20200630031554.12946-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

Apply two upstream patches to fix compiler warnings.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
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

