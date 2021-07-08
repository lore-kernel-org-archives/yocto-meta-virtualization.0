Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.7805.1625719398568387313
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dXDReQ8a;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id f5so2220555qvu.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lmiygn2GhZBLkF8kxL5mBF/9m1aSXIEAVgLKl1l8g/o=;
        b=dXDReQ8aHYiUrRxQ6L+fuGyY2YVzIYyAFWstux13r0AL3EgXT3cnr/ofJDAOMmzdP3
         /rUgX88oc/aVWX0CAwoBQIe8QvP3/V70RaroKWIdd5SXaDzoe7FDsCOuQ/2+ZhuplV6U
         yfBLv9+hJHj352xhH+GIrKRor6g5ElFtllI39rFwz65OLYLxz99J2UTiKmMkslsN7Wii
         i3SNs5ognglB+K4U+7gmOd6hm4QGn3840B1lHXT6bxqgX1owepBlFGw3+EHwhWgfCw9w
         YtFKh9XkRc39xtjOsgNCOHoSoguGzi4ZfKQBbTwWW6GM/6uDB4rH3VTstkWrVbHQWtBb
         gReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lmiygn2GhZBLkF8kxL5mBF/9m1aSXIEAVgLKl1l8g/o=;
        b=HFBNcLUeMfVNzk1h1qpUjnz2yRmf4738HyFmE/dJHpxAhXF3q0VUeCMYlp5497nqx+
         lacNlDrRBK3E93MEqUINsmatjyLDOva/ed5HiKeztkJ37Bg56Kl1TAjkIaQuSFYPgtQf
         TamW7S7QPYcTzYyRHY/ofWmxC5GYR54Ny5ekX/TKUhw8zor46+8d79j+X4GOgIreDe0A
         6IdjCTNacJAWhCVQZWMR9RqqH1OCW42OjW/ZNrBGOAWj/ck8whImxR8QdXWBcE1F+dDW
         EH9Epz24IvwX8JzcBftIPkwtPHOYKjJYozXoPWoYtbMLPa+Oktx1xGk8H8ZFZiqvinET
         U2Jw==
X-Gm-Message-State: AOAM532NC3s+BBh2dW/rLAt+rYeAHpG+Cm5/VbKupVCKwn2MHpEPLIwp
	dxl2B9uyQp7b7Si++uegCTMQ2VHpzTcLlqKI
X-Google-Smtp-Source: ABdhPJwHqKMOHXRDpIgPjT/hu5tD4rRP03C4XnXJXT2XmBz/SOmloYzgID9+8ZDv1YJ+5qKZJhgVKg==
X-Received: by 2002:a05:6214:13d3:: with SMTP id cg19mr28008613qvb.50.1625719397575;
        Wed, 07 Jul 2021 21:43:17 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id n81sm211614qkn.118.2021.07.07.21.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:43:17 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.clark@starlab.io,
	bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io
Subject: [meta-virtualization][PATCH 0/2] Xen: qemuboot device tree support (Arm 64-bit)
Date: Wed,  7 Jul 2021 21:42:58 -0700
Message-Id: <20210708044300.127016-1-christopher.w.clark@gmail.com>
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

 classes/qemuboot-xen-defaults.bbclass        |  29 +++
 classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
 conf/distro/include/meta-virt-xen.inc        |   3 +
 recipes-extended/images/xen-image-minimal.bb |   6 +-
 recipes-kernel/dtc/python3-dtc_1.6.1.bb      |  26 +++
 recipes-kernel/lopper/lopper.bb              |  45 ++++
 6 files changed, 316 insertions(+), 2 deletions(-)
 create mode 100644 classes/qemuboot-xen-defaults.bbclass
 create mode 100644 classes/qemuboot-xen-dtb.bbclass
 create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
 create mode 100644 recipes-kernel/lopper/lopper.bb

-- 
2.25.1

