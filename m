Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4249.1619253090839208662
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UxSKdwtX;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q136so30986927qka.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6XhRRWRrKZvLQPKNW6oL+dJuAak3kw2RUyWC/uZSwmE=;
        b=UxSKdwtX1LE+C97lg9lNNfHZmRuI+BPyqTV+OVPxcl74vMBqfjvq9HVsIgXZR09Uju
         PEFI1fPM3fiaB3jrPFkeiiF9fdbIRrcR0mEkJWeulTZNNCfJFWWhLSBIWr5Iv29SwqrR
         8zdBfvTGxP4QhzaIZaWmZXUWwmNLtuuUDmiD4zPqbjalS9JcFLytnhW66jNyWd6UWlh4
         17Xf8Cz08Lwb6CRI6E89AaOmq/tOanMHH4d3bJo9MgLeMSO0jmGiu5LrwYq+TZNDexS4
         iJuLuUkInZbtTgbZEcJGgHcai3nFAINZ89JfdGsXRtPQQ5ksWLdRCy+pFAk9B5OF7bCC
         5axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XhRRWRrKZvLQPKNW6oL+dJuAak3kw2RUyWC/uZSwmE=;
        b=hRmDqgSngpN7omeqq3LR8YpNN0aA1iaj5jFV7trHwAXyQW1ThaJLuRUMv0g85SBVzo
         Eht4q5V0JnIetAlzc2q+xatMyoUewrjRcjA/WQTAFMDqMXjTQJkk4B2q1u6UNwCItgSB
         nfXz4udmOKhll7dGCCzzxmt4mKMG2/lOB2zJVQl5DRYgKLgDI8SFepHvPAUYgCVfiqRR
         6gx6ngLnm1BY45uGUfYc8sM1HQZUOo7fHfrVeo9t6nKT+wA9PVMgxSdNCz5h662lnV9Q
         uj5LA3YGpbr4rcoNXgHOpoJLHBqh8Z/k07MNwS5qXOl2X+kJmCtcKdEfnZRY50xWuLec
         JC+g==
X-Gm-Message-State: AOAM530uBwKax9WVQQOrA0jqJyzU5NX7Pp+zVVXW3JGoahxwq6ju7vRK
	/AH3A05W/QvL/TRIpGirtk0chL5HAaw=
X-Google-Smtp-Source: ABdhPJwVWoOI1Mfw1cltt+4oxSWbtqfxIkb86Czn4thIQamwaDbNZW1Ro52RpWMcfzxsPXiAkp0UrA==
X-Received: by 2002:a37:6406:: with SMTP id y6mr7716260qkb.368.1619253089874;
        Sat, 24 Apr 2021 01:31:29 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:29 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 4/8] xen, rpi4: switch Xen-on-Rpi4 kernel preference to linux-yocto
Date: Sat, 24 Apr 2021 01:30:59 -0700
Message-Id: <20210424083103.202107-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 5.10 version of the Linux Yocto kernel supports running Xen on the
Raspberry Pi 4, so the previous preference for linux-yocto-dev can be
replaced.

Use the ?= operator to set the kernel preference now since
meta-raspberrypi commit e0b4b8c5d introduced use of the weak default
for kernel preference in that layer to allow this here.

KERNEL_DEVICETREE needs to be set to match the build outputs of the
selected kernel, in this case: "broadcom/bcm2711-rpi-4-b.dtb"

Tested with kernel version:
 SRCREV_machine = "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
 SRCREV_meta="031f6c76e488a3563f35258c72ff1de3e25a512e"

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 44853d9..584cd6e 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -20,4 +20,5 @@ RPI_EXTRA_CONFIG_append_raspberrypi4-64  = "\nenable_gic=1"
 # Increase boot partition for space for kernel and Xen
 BOOT_SPACE_raspberrypi4-64 = "61440"
 # Override the meta-raspberrypi default kernel preference
-PREFERRED_PROVIDER_virtual/kernel_raspberrypi4-64 = "linux-yocto-dev"
+PREFERRED_PROVIDER_virtual/kernel_raspberrypi4-64 ?= "linux-yocto"
+KERNEL_DEVICETREE_raspberrypi4-64 ?= "broadcom/bcm2711-rpi-4-b.dtb"
-- 
2.25.1

