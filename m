Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.92.1600803951752373207
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qb+ZLnYG;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id g3so16610977qtq.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oy+IlrqmiH9cw05i7wfyG35IU0cS/B4zFIdJaNGBlNw=;
        b=Qb+ZLnYG11AMqJ+ZTtJorFijm6lMNNvQwiJUcCg5x59uA6w3on1pPxKiygQOCgbTfi
         t/iR1e2Yp0oMQB1B1LSVOnW/Jxl7uAktNLBLpVMGvj5dePAKIaen+D9F9M6+Ni2D0gK8
         /BH5TMB6Q6hyldglC2Fbrncq0QhMLI1RM9CKSVYQSJ46tSIz8VM2s+/jsXqhbwnJnWmw
         HoqBVXt482xkb/tRHgc3FqBB7j873UtP7QuO8lvOKfJNBkJG0UE+RfvOrcN67/FfGVz2
         ze3mew4FjrmarJmIMq51z8jB9iAX13spnAe0qCq4UAaYezl7/mDCETi7Crs+eV8K0Of5
         x4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oy+IlrqmiH9cw05i7wfyG35IU0cS/B4zFIdJaNGBlNw=;
        b=Ul5qrc3kzdKQ6/m1Anqvnq/59rz82tlhmXL5sE4ka9USu54804ykv2AHKBfPQwa+rH
         PbASeTle68hyDp4G07E2S0r4b3t8ftxEWaud+kJaqnlziQrC9CmKd0WZuJ90bj18vWjZ
         YIk+noTSeW9fafW5NK3uGnT4rvmz4fxnvwx1AbQ950JvhGl31VkCgoSkQxvB9cxR8q0u
         G0rZHEXSOvbwPoWaCLjDmbgLU5dJMOIRQI7a2EaMEzKUol+Iv8qH2VjnzYFd9MyJUt9G
         /0NoW2kxHo2a1iy8iRXQmSnjA1Vj9QoHBmna91BB+iMST5EU0Ggr3ihXFz6s0znZFLh2
         +jBw==
X-Gm-Message-State: AOAM533TsdevrqkLOqZcC+HEOvvx+1jfTaYXENkyKnEooiqDbYf6yKDh
	gQm162FaK5GNO11hkVWxVF4qPttcD5RTuvXq
X-Google-Smtp-Source: ABdhPJxDAssGxQZWQ3jkqUogbIV3jp1IM4QwaPHhGeTvAi5IK0mQss0+WWU2qgPFo2Q420MiNy28yQ==
X-Received: by 2002:ac8:140b:: with SMTP id k11mr6258721qtj.287.1600803950614;
        Tue, 22 Sep 2020 12:45:50 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t43sm13538513qtc.54.2020.09.22.12.45.49
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:45:49 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 5/7] dynamic-layers: add xilinx dynamic layer for Xen support
Date: Tue, 22 Sep 2020 15:45:37 -0400
Message-Id: <20200922194539.51933-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200922194539.51933-1-bruce.ashfield@gmail.com>
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

Although this dynamic layer currently only adds Xen support, it will
eventually hold other board and platform specific tweaks to core
meta-virt recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../xilinx/recipes-extended/xen/xen-xilinx.inc     | 14 ++++++++++++++
 .../xilinx/recipes-extended/xen/xen_4.14.bbappend  |  1 +
 .../xilinx/recipes-extended/xen/xen_git.bbappend   |  1 +
 3 files changed, 16 insertions(+)
 create mode 100644 dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc
 create mode 100644 dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
 create mode 100644 dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend

diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc b/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc
new file mode 100644
index 0000000..344061a
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+DEPENDS += "u-boot-mkimage-native"
+DEPENDS += "dtc-native"
+
+XENIMAGE_KERNEL_LOADADDRESS ?= "0x6000000"
+do_deploy_append() {
+       if [ -f ${DEPLOYDIR}/xen-${MACHINE} ]; then
+           uboot-mkimage -A arm64 -T kernel -a ${XENIMAGE_KERNEL_LOADADDRESS} -e ${XENIMAGE_KERNEL_LOADADDRESS} -C none -d ${DEPLOYDIR}/xen-${MACHINE} ${DEPLOYDIR}/xen.ub
+       fi
+}
+
+deltask do_deploy_setscene
+deltask do_populate_sysroot_setscene
diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
new file mode 100644
index 0000000..54edd1b
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
@@ -0,0 +1 @@
+include xen-xilinx.inc
diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
new file mode 100644
index 0000000..54edd1b
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
@@ -0,0 +1 @@
+include xen-xilinx.inc
-- 
2.19.1

