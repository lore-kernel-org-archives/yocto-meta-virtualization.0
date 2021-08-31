Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.657.1630452527882714457
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 16:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bGGBhMIk;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id t190so1182196qke.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Aug 2021 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=68itnh0LU5Sn7KsNck04ruDuZUbKwqtDWPy37YfJZC4=;
        b=bGGBhMIkdbC90XJAOsBDxTcYp9Vcl1YWeNHaAooZvOYDIm5bP7OguUHe+uS0istswF
         byqaELLATtQ43ZxoKLpKaUgacbFaJD9aHLbvKT+5IP/UCLMEWIvm9JwpBbAj62Y4FmGv
         SfkZlqBG2xOqXjCQZ2F92EOFAnSmSL5a7BeKYPEk3nwQsewYgRaMdwW/61OtXAt2bbxE
         TTv+hZ0J363N9HqXpx5AAhjTU4cCxjrIuyDrgEr8jYb/wc88g9nxVaCJ33IdJPR+t95x
         skwTr+Mz00dlzA4f+ntIszECGQyJGD6AyWpiPu9n1310a3hAQfD+YmeeTLAJYCSIRgDd
         bgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=68itnh0LU5Sn7KsNck04ruDuZUbKwqtDWPy37YfJZC4=;
        b=IvbqDF3Cr0i+TaGq/wN/uVweNf/2Ib+4MX35eONJL5Nudc3mXtp7MBWjObwVjMRFHb
         yOHb3Nq/m8rIwstqoP7Gm+yM1uY460roNvf1g7+WvTp2AQ6d0919WMuQaII/Kkys3F/d
         8jYr3PfyV/xRKOY24TyTPD06yEjR54/g4uyjLdbHdvW2OFKPI+VTKNdTEVijgwVG4peX
         pRTkQeDa1xcwDxgEWKzaExxC8LHqzmQwfMX5EjuYkm3fGQLqijuo3dQjtvww3wrClW1H
         qh2P0jL63HtWF9gzXETbH7JViiSqhsYPyp3aTpvEDn8W539Zp/tbdfofFpvQZ53BcKNC
         ZZPg==
X-Gm-Message-State: AOAM533TWlQFyoUSuLi1/sVxuZSd72EYe6zyhcocWSaDS6TqW2B1f6kH
	0N7UZUnoRWvbzCBvJpCnBrA1fa8tpxNe8g==
X-Google-Smtp-Source: ABdhPJy0in8wEgR+g//bni0UAqzPtD830EkdighcCe0FQLGBUlMlMhUQTatoBeobAE2++SxPR27z0Q==
X-Received: by 2002:a37:b606:: with SMTP id g6mr5685400qkf.476.1630452526848;
        Tue, 31 Aug 2021 16:28:46 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-170-39-79.mycingular.net. [166.170.39.79])
        by smtp.gmail.com with ESMTPSA id d20sm14793007qkl.13.2021.08.31.16.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:28:46 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io
Subject: [meta-virtualization][PATCH 1/4] xen-image-minimal: supply bootloader config for qemux86-64 machine
Date: Tue, 31 Aug 2021 16:27:40 -0700
Message-Id: <20210831232743.252498-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831232743.252498-1-christopher.w.clark@gmail.com>
References: <20210831232743.252498-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated bootloader config for the qemux86-64 machine so that the
'pmtmr=0' kernel command line argument can be provided, which removes an
error message that otherwise occurs in syslog during boot which is
detected by an OEQA test case causing it to fail.

A new kickstart file is provided that applies the new bootloader config
and it is supplied as an override to WKS_FILE for this image.

This is work towards enabling the Xen Test Framework (XTF) in the OEQA
testimage framework.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 recipes-extended/images/xen-image-minimal.bb |  1 +
 wic/qemuboot-xen-x86-64.cfg                  |  8 ++++++++
 wic/qemuboot-xen-x86-64.wks                  | 12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 wic/qemuboot-xen-x86-64.cfg
 create mode 100644 wic/qemuboot-xen-x86-64.wks

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index b4ddda2..fbdd007 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -74,6 +74,7 @@ build_syslinux_cfg () {
 
 # Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
 WKS_FILE:x86-64 = "directdisk-xen.wks"
+WKS_FILE:qemux86-64 = "qemuboot-xen-x86-64.wks"
 QB_MEM ?= "-m 400"
 QB_DEFAULT_KERNEL ?= "none"
 QB_DEFAULT_FSTYPE ?= "wic"
diff --git a/wic/qemuboot-xen-x86-64.cfg b/wic/qemuboot-xen-x86-64.cfg
new file mode 100644
index 0000000..297e19b
--- /dev/null
+++ b/wic/qemuboot-xen-x86-64.cfg
@@ -0,0 +1,8 @@
+DEFAULT boot
+TIMEOUT 0
+PROMPT 0
+SERIAL 0 115200
+
+LABEL boot
+  KERNEL mboot.c32
+  APPEND /xen.gz console=com1,vga com1=115200,8n1 loglvl=all guest_loglvl=all --- /vmlinuz console=hvc0 earlyprintk=xen root=/dev/sda2 pmtmr=0
diff --git a/wic/qemuboot-xen-x86-64.wks b/wic/qemuboot-xen-x86-64.wks
new file mode 100644
index 0000000..593e0a6
--- /dev/null
+++ b/wic/qemuboot-xen-x86-64.wks
@@ -0,0 +1,12 @@
+# short-description: Create a 'pcbios' direct disk image with Xen hypervisor and bootloader config
+# long-description: Creates a partitioned legacy BIOS disk image to boot Xen
+# with a bootloader config that the user can directly dd to boot media.
+# Boot files are located on the first vfat partition.
+
+part /boot --source bootimg-biosxen --ondisk sda --label boot --active --align 1024
+
+# For the main partition, it can be useful to add additional space for VMs;
+# eg. increase partition size by appending: --size 10G
+part / --source rootfs --ondisk sda --use-uuid --fstype=ext4 --label root --align 1024
+
+bootloader --configfile="qemuboot-xen-x86-64.cfg"
-- 
2.25.1

