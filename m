Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCEF7E00D55; Mon, 21 Aug 2017 22:08:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.67 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F0F5E00D12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Aug 2017 22:08:41 -0700 (PDT)
Received: by mail-pg0-f67.google.com with SMTP id 83so26489151pgb.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Aug 2017 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E2C6XedPBV9dReqZm8WC+otRRI50LdKpEYVt68cYL5w=;
	b=ZetBuv4Y8978DifXY4LpQqGYQ3lv3qWHOGGz05jhOSqUS8sHCKg4Ln9WLGVY23KqvC
	HIAFlQsUxEkHtsee+GbFI472R2ysOT5o+fRnD28y86dNIYEhu/J4HPLh/3HGa+urlzZa
	S390Rah4KNvDK6BeP6WcEj0f9zrMj1Qwm/+ySA13l+O2UkghPbCK4d0qSsm1xftENZfG
	HUeG88qlBnMEUNEtu9Ryjv1v7UelVUjSXr/kq9yq4TCrHRlBZ1FbJY5FKDsBggcW26gP
	4vRjmmVo+HPH9kDRvJiTe1ZdJMQRf8ObBGeE+tA3mRmGXXNw2kjcYcpOvc1g9AK1+OSh
	LBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E2C6XedPBV9dReqZm8WC+otRRI50LdKpEYVt68cYL5w=;
	b=mIyAFKOH9G6ZXBBtvSmVWbcKNbIwVdej9/bCcMyUi+E5pdwnvXkGnxP59BfOCnI++4
	UmwmpPHJNJoVizCLSYz8p2JVIiK7QBQRrAKJviUynajeMp8g6WZvnmKZkLu1X5YR850H
	hh9E5Gef3ewgHqTpdsemMJmsh/W2Jk4SkCMDQK5wsMKGEdSHBZKWTSv4Dmr2dsUz7WrS
	NyhuaauC252NtwFF1AKoXHPbPfLR9K5+YBVn7VQGG80sbrgL3Z4tWFzkphV9E1AjjfoB
	G5Ur71Ea4MNvTNMS3RTIobINx8FHgF/h6GjI9czQxxrB75lTFrMvj+JJjTNIORKps3Kh
	3Cfg==
X-Gm-Message-State: AHYfb5hrntK+hhZfQ6U+D7zyPXudo5cwg0LajB3xvtzFBsNDxGLtsvNn
	NI7QxJrkL3/Y7zTPaks=
X-Received: by 10.98.220.27 with SMTP id t27mr19735227pfg.32.1503378521217;
	Mon, 21 Aug 2017 22:08:41 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	b81sm10696128pfm.62.2017.08.21.22.08.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Aug 2017 22:08:40 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Aug 2017 22:08:23 -0700
Message-Id: <1503378503-23353-5-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 4/4] xen-image-minimal : change SYSLINUXCFG to SYSLINUX_CFG
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
X-List-Received-Date: Tue, 22 Aug 2017 05:08:43 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Fixes the build for xen-image-minimal.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/images/xen-image-minimal.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index b8c2002..94240f6 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -50,12 +50,12 @@ SYSLINUX_XEN_ARGS ?= "loglvl=all guest_loglvl=all console=com1,vga com1=115200,8
 SYSLINUX_KERNEL_ARGS ?= "ramdisk_size=32768 root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5"
 
 build_syslinux_cfg () {
-	echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
-	echo "DEFAULT boot" >> ${SYSLINUXCFG}
-	echo "TIMEOUT 10" >> ${SYSLINUXCFG}
-	echo "PROMPT 1" >> ${SYSLINUXCFG}
-	echo "LABEL boot" >> ${SYSLINUXCFG}
-	echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
-	echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUXCFG}
+	echo "ALLOWOPTIONS 1" > ${SYSLINUX_CFG}
+	echo "DEFAULT boot" >> ${SYSLINUX_CFG}
+	echo "TIMEOUT 10" >> ${SYSLINUX_CFG}
+	echo "PROMPT 1" >> ${SYSLINUX_CFG}
+	echo "LABEL boot" >> ${SYSLINUX_CFG}
+	echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
+	echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
 }
 
-- 
2.1.4


