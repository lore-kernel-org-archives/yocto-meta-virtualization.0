Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38742.1795372176649557113
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2026 10:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PCxtxSKu;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1593186a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 10:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372176; x=1795976976; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42hik3v2Rv4mOtZPsxco9TCIDWiRG0W+cp9hu8ORb44=;
        b=PCxtxSKucv2D5opNgGSq9mSH7pm4pJx6bt3X2K/cTxXWxbe2WIr8GgMeUOX46SqBXn
         TqJMT7SNA7zAT358PIEjA4rdiVAgbkAo0Nz0J83aBgjQ/W0XY4TUzX5wnm/QnZjRqEQR
         666M1i8yzwwsWRaPlF6swyEneX5cCNIxOB36u3Ag6izAjb8pvaAFb7OBPQZMIoMmui2R
         2FrN5NBiWNA4IXxRUAJcBwoCjm6dxZNkWfgFayC/kgvyZXDn3jCEuh5PFGCfQsE66tw8
         K0CzApYunbotyR/GBYCcosEl59HQXC03XG5XZ8KTnpHm48c2wX0U+ej6JzhbhK+mDarN
         mEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372176; x=1795976976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42hik3v2Rv4mOtZPsxco9TCIDWiRG0W+cp9hu8ORb44=;
        b=rnxp6AWP+31i4WiomVhiDCT52bQFX9thyGxB5HcEsePG9anB7kxCtlv8kRHFV9tJv2
         n4tTnrcaBjcra9GWJKZaNgyYrPsJcVkxNob3QSyHf3TR+lKo9zhzMz6ZQhIKu7Sm+tMk
         XaRRrVj1S94mCoorPrBShGmZ/xcHcrcEibK9EnmmcE8Q4sLO7ZFNw09/DX4cAq7oanPR
         q5mSIMx1Uc3aVdLgqLmZeCZURdclDmqs8A95Iy/zGX0UqaEVc05E0uUC3oGNpvMwgUhv
         c9BdsUWNlbDyA8sYBtk2rfVwmaXKiOzybCikrkWbA6T3O1RiW/vP7FOox5/tgVH+moGR
         ItfQ==
X-Gm-Message-State: APuU4Z8IZisyCvQVKDkZrzvd/K2Lof4f+E/zr4ZjfgoR/Kog/PIAPkgX
	NLmssrONA5rYAJFrUCaydw/bjRHZln8SCmPclLfeA0qu7jKP5vWfRAGzKX58O4uA
X-Gm-Gg: AZFdTZfaMQ1cidnDF5wELpGWz68uGXXtevNDBwv5inIE3SyRw1BCCJfnCLd3tQOF2F1
	xNl5Cg2IppI7gzPYZ++QvtWNv3D2sc4bgz8ce7sTdk7OaWLASYA3Of+otNmRwhIDH8qUC0o2Ife
	AybtmkjDOERN2bUzMabqPJvNxVlVMYEerCI50ysehvJMkPsU1WhZWY4JmK7DxQchsHeAXhkS20k
	Law9YlCxwZn1Da9zVBwoODzlWXmJk+HsIQU9VipCUPmay8MT9olZON2mx8SH/Xvp9pGO57uRmi2
	POvRl0uNoR6Mip0PKV7xDWOd41JV0kFz1MeDifNu0YnCbKNAkZIq0ApdKv5yq4jOq7grYihU98F
	vtsRBLm/duMhaAIzNF7FdZYxGfOIqiLwIhTMe3XczSgcO2nw/as35LYDMeJReuoa88G2ZlV6aLq
	34A6UkdHW9B5pjsQv1A0zPYx3OJZTH/YF3nX+CM3QDB4q8/0pKvvu7C7JZVz+3cHuM5cqR/SaiS
	WObx3ZikUriCiY2hZ66DZGU1IIA8s29MxtIsWbv4/x/EkWZ1eERzU9H7WUcgu0hTBxxzmB8E5m/
	Wc8ZYdzuuLJaG78fGzkr1H4Ft4jvSqYHvlybnJnV6SYBbig0bL14D0S/zNgKN9+LBfIVwdt47jL
	VVmGFBsZrdyIzsiK3Naf7kmQQSg==
X-Received: by 2002:a05:6a21:a109:b0:3e9:290d:9774 with SMTP id adf61e73a8af0-4014d25d94cmr8533628637.44.1795372175895;
        Sun, 22 Nov 2026 10:29:35 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm3882952a12.30.2026.11.22.10.29.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 10:29:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 2/3] container-volatile-fixup: run after empty_var_volatile
Date: Sun, 22 Nov 2026 10:29:09 -0800
Message-ID: <20261122182910.35849-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122182910.35849-1-tim.orling@konsulko.com>
References: <20261122182910.35849-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 18:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10177
Content-Type: text/plain; charset="utf-8"

image.bbclass inherits rootfs-postcommands with inherit_defer, so its
"ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile'" is added after the
recipe's own "+= rootfs_fixup_var_volatile". base-files' fstab mounts
tmpfs on /var/volatile, so empty_var_volatile then deletes the
volatile/tmp and volatile/log directories the fixup just created,
leaving /var/log and /var/tmp as dangling symlinks. Multi-layer
directories: layers then warn:

  OCI: Directory not found in IMAGE_ROOTFS: /var/volatile/log
  OCI: Directory not found in IMAGE_ROOTFS: /var/volatile/tmp

Use :append so the fixup runs after empty_var_volatile.

Tested with the containers-library autobuilder target (aarch64 and
x86-64).

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/container-volatile-fixup.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/classes/container-volatile-fixup.bbclass b/classes/container-volatile-fixup.bbclass
index 98c86b97..be3dbdd4 100644
--- a/classes/container-volatile-fixup.bbclass
+++ b/classes/container-volatile-fixup.bbclass
@@ -1,5 +1,12 @@
 # Workaround /var/volatile for now
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile"
+#
+# AI-generated (Claude Code, Claude Opus 5.5).
+# Use :append, not +=: image.bbclass pulls in rootfs-postcommands via
+# inherit_defer, so its "+= empty_var_volatile" lands after anything a
+# recipe adds with +=. empty_var_volatile then deletes everything under
+# /var/volatile (base-files' fstab mounts tmpfs there), undoing this fixup.
+# :append is applied after all += operations, so this runs afterwards.
+ROOTFS_POSTPROCESS_COMMAND:append = " rootfs_fixup_var_volatile"
 rootfs_fixup_var_volatile () {
     install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
     install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
-- 
2.56.1

