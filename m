Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.57.1627430868550262399
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 17:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kxm8xkB1;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id s14so666023qvm.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jul 2021 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GFXNLNZtB/2y22eQH99hPgxbouPN7UW7v3qfu1NBB+c=;
        b=Kxm8xkB1YlByHFRKSLi0YMK0LLp3KUcGNXtqxt3/5cTxAZ2H1KT/xY4ZchCzud5sPE
         mYbSWhuRZiIskikyRfjR8n0y6FWUZY5aswtqcjaDQxkAYEXAbPF61X8ha1LUzkbdj8iV
         DfOREeha6kWoTwCcA5NuvMjcTaJ7qltrj5Rzfz1RHg+/KoRh6Qebqg2QCC7z64sbM9uc
         ePoCc9QmB192fGtvAd/BPGO6DUtNUTbg01PP1pmw9IMlPE2yT0v24NAGT7ZM6RN1wF4O
         pWq1+NdeRkrxgRPb+4FmvCkdIe/xMpC5Zgq+MMnq12z0Ah5jXCTmBK1KiSX5nUnQHLJv
         TLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GFXNLNZtB/2y22eQH99hPgxbouPN7UW7v3qfu1NBB+c=;
        b=kds5KM3oug/J6ICGev2kUjgP4VKTkVnHMxeZp5YmG6XyhAqGDNHUDhRhoEdWiRTGyK
         BLJfEFu4AVTYMde9hoK1/Cs9TpI+48iwxMkEowUbRY3A3qZez/20anh4X50gqlcormvX
         eb76ijWn9g6w4B9hf36shYrZ0sdaPJTU90uwzkQmVRObCrmlMHOEw0AvDLKsqVeIaYJJ
         3HqOw07gTrJKw5BFOPYPisIh9HwzvP8TPdLLKbsmhv/rkfhcD7lzZkt/gS/AthMNorY5
         x2vOzScN4oNvwAgczvzyZbqVmA3DskyBumc393dhGLmerGTCRP8qkRHwEnRDyGrZYcjr
         GTJg==
X-Gm-Message-State: AOAM5332mIphus59xPcZb5iSAeo+pYOINvBrx9j7Xfhyu4hHLlUzS43E
	ey7fZAvPuoFayNVtdNQvqvkgWacemQqQ3Q==
X-Google-Smtp-Source: ABdhPJyiS+1CaLx4imfC+eqw6csO93JTstlWJMeKwn3jcsEU74esNlZuBQl1Db1GYpN8T+ei40czxw==
X-Received: by 2002:a0c:f587:: with SMTP id k7mr15972488qvm.39.1627430867626;
        Tue, 27 Jul 2021 17:07:47 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-171-249-110.mycingular.net. [166.171.249.110])
        by smtp.gmail.com with ESMTPSA id j3sm2409559qka.96.2021.07.27.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 17:07:47 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io
Subject: [meta-virtualization][PATCH v2 0/2] Xen: qemuboot device tree support (Arm 64-bit)
Date: Tue, 27 Jul 2021 17:07:38 -0700
Message-Id: <20210728000740.11070-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces tools and class structure in the layer for
enabling testing Xen system images with Qemu, booting with a device tree
that describes the target system.

A device tree is required for launching Xen systems on Arm platforms and
is part of the Hyperlaunch design for Xen.
  https://wiki.xenproject.org/wiki/Hyperlaunch

This series adds a recipe for Lopper, a device tree tool, and its
dependencies. It provides a class that implements a bitbake task to
generate a device tree for qemuboot, and a set of defaults to enable
'runqemu xen-image-minimal nographic slirp' to boot images compiled for
Arm 64-bit machines.

Christopher Clark (2):
  lopper, python-dtc: add new recipes for device tree tools
  qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images

 classes/qemuboot-xen-defaults.bbclass        |  30 +++
 classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
 conf/distro/include/meta-virt-xen.inc        |   3 +
 recipes-extended/images/xen-image-minimal.bb |   5 +-
 recipes-kernel/dtc/python3-dtc_1.6.1.bb      |  28 +++
 recipes-kernel/lopper/lopper.bb              |  45 ++++
 6 files changed, 318 insertions(+), 2 deletions(-)
 create mode 100644 classes/qemuboot-xen-defaults.bbclass
 create mode 100644 classes/qemuboot-xen-dtb.bbclass
 create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
 create mode 100644 recipes-kernel/lopper/lopper.bb

-- 
2.25.1

