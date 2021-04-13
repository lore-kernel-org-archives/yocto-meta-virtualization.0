Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.5420.1618296241551150859
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 23:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KUvBrodM;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id b139so11466495qkc.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Apr 2021 23:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86hl/mv7wJ6aoLggk2coRcUws0bGNPymtQihHgBDTTM=;
        b=KUvBrodM3Jl1lrm1hXbPrqX9FfOVwMd6h0qtlsKiogQFyeUIGerWh84iQLam/p4pOI
         lHmEbEfdgynM01AYRuPH7L58KM66MZNRAnDgllm42MhtELuVQSwsFZo5E7NFv/1mEUxJ
         c09xqVjjIVqybmo4qTY7lSc0wx72szHWBAzLITx8AayTzlRcM4jo9FNLpzwY8ebxl5G+
         zjZcS/m0RxdK9XOnpI15dws3Nu6oQ8VdXKMR2Rm30JF822A7lW4jAD93bqk1ABok6vlI
         BmRLXe7B16zG/6XCoSrGISMKPqYviUk6LIZvASg0sZj5dtn+hyfNeKxG9mX8oNkhAvaK
         UGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86hl/mv7wJ6aoLggk2coRcUws0bGNPymtQihHgBDTTM=;
        b=Bs3sL1AAOZo5e21H8Je7VAUphj7Lwos7OrXZutudYzLSl9c2rNtZlQB+pXj+ruVlWo
         b0PagTGWTgLA0kNU/HA3Qt6+muFglPDXLOYRbuGn6SggXlvGK3Uk+ij6WDXxYVzxkNH6
         XMm+BKLsFcFQht24btNF390BtkQtb3ASPN3fZFYl0XJ09ESJKZJGuoj3hd+7nVqjFmuk
         UyfLuH++QMWqA9uxPiGewwEqXS0kKZtsWkkzrvM65axgkUkpVm/h8mPvUmySOhTb2oh5
         D8iMf/37Wm+BBMDPrDjO0bDEaO0UdoCXIgfRZIy4Wsx13aqnU/N4KCiPn/GjfZ452hM4
         HEmQ==
X-Gm-Message-State: AOAM531PRTbN0mfKeV/1KXb+r1Abf5E4iqcXsuam17KQcnJDlKQAtakG
	uwN2QZcYKxfnnUtQgsmnFG/LZBzCtgM=
X-Google-Smtp-Source: ABdhPJz49uI8ZYwb9ttQzHq0PUSPcMBp7MMSU03wGFoBstaXDz4F0PsYn9UJkOxjnGcSyDUQ7FWN0A==
X-Received: by 2002:a05:620a:21ce:: with SMTP id h14mr29681169qka.22.1618296240572;
        Mon, 12 Apr 2021 23:44:00 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-187-51.mycingular.net. [166.176.187.51])
        by smtp.gmail.com with ESMTPSA id a19sm9491086qtn.41.2021.04.12.23.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:44:00 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 2/2] xtf-image: add a new image for the Xen Test Framework
Date: Mon, 12 Apr 2021 23:43:32 -0700
Message-Id: <20210413064332.42502-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413064332.42502-1-christopher.w.clark@gmail.com>
References: <20210413064332.42502-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing the Xen hypervisor, with the qemux86-64 MACHINE:
    runqemu xtf-image nographic slirp
        (login as root)
        cd /usr/libexec/xtf
        ./xtf-runner --list pv
        # run an example test:
        ./xtf-runner test-pv64-livepatch-priv-check

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/images/xtf-image.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-extended/images/xtf-image.bb

diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
new file mode 100644
index 0000000..24bf504
--- /dev/null
+++ b/recipes-extended/images/xtf-image.bb
@@ -0,0 +1,14 @@
+require recipes-extended/images/xen-image-minimal.bb
+
+IMAGE_NAME="xtf"
+
+IMAGE_INSTALL_append = " xtf"
+
+WKS_FILE_DEPENDS_remove = "grub-efi"
+
+QB_DEFAULT_FSTYPE = "wic"
+
+# Set the dom0 memory level lower than that assigned to qemu
+# to leave enough free for the XTF microkernels to run.
+QB_MEM = "-m 400"
+SYSLINUX_XEN_ARGS_append = " dom0_mem=256M"
-- 
2.25.1

