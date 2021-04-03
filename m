Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.34884.1617479502165427383
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 12:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NDVqPlLW;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id o19so8663685edc.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Apr 2021 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTGM8JpqRjL0Q7PoB3W/W080+Nq/Xd0DE1DmeSUDcNQ=;
        b=NDVqPlLWuH+u1Bh6V+gNFWzYojJo8WZfk/L4U9vsQZgshCLNkJ321tclUBdye9KWNZ
         QT1lFV75295pINaYOxts+ep0aaJgd5G8eo1zMDIR4HuNEUxVOU7GY4RvradhZKEAGvOl
         x7/7STJBzRAAQm9+cJ2JuA3cNkBQdc3JZ9Ceqmq2TnBv2c/T+BVRm/8V5zmqvwWZY6Cv
         /u7frdJ13YD2Oze/xv3RDduq6AhDxP0f5oo2ydvR5ut1srLrpy+oEX5kDahaPjXe3rQk
         fgZ3On0V+EQ9ub263Y0MNWTnp/BbgFWgmyMvXjo/N8e58g0VqmygCHKchgw8wDn0bkkD
         7Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTGM8JpqRjL0Q7PoB3W/W080+Nq/Xd0DE1DmeSUDcNQ=;
        b=bwI3drJ4T1FqbTRv72Mr6NfRJL2j2xMI70j1arzxw9wtYqsUcN8JNZfJyPsxEzQWh0
         mE0jnoCYMQuRBHmPzNNY3np4gKyEPsb4NpZIv2Ke/pWdafVGZFBFTOTPnjXQJAjea3x1
         F2dfGlLUCExMw2trMtMkPe+EAELU5oZ0jqOZodBKOevP2ffcDVBWVayuYNVv2Wg/6neN
         2/KotXtVFvCDOVmagPwyYDscdD7oilnB2XrjVEMii6cHYAfxeNXgYRB49wxRoAIbPOj9
         EoG7U/eF0XMUbAwnwOzLCIfSJ60m1IU+bzRzVB3A5vw+wpD53K3QJlZzy0RGD5OP1rzO
         uT3Q==
X-Gm-Message-State: AOAM531uMi5z9Fnx1enRrCLN2PjIGUsk5AFmNiJw+tSljm6aKNa8Zbqn
	tl3AUiDDDhu5+V+RyrHM7dx7Qj2b0ZE=
X-Google-Smtp-Source: ABdhPJyCTrBESzHp/iRwlYgzENfcVaw0BebihiTzzg1l+kbLlKPwzUhYDID8PJ90SrMxrQgysT2MUA==
X-Received: by 2002:a50:fd16:: with SMTP id i22mr7599964eds.239.1617479500515;
        Sat, 03 Apr 2021 12:51:40 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rk1sm1632173ejb.88.2021.04.03.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:51:40 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 5/5] ipxe: force using ld.bfd even when ld-is-gold is in DISTRO_FEATURES
Date: Sat,  3 Apr 2021 21:51:33 +0200
Message-Id: <20210403195133.1401406-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 448087e..43c8f0e 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -27,12 +27,16 @@ EXTRA_OEMAKE = " \
     ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" \
     CROSS_COMPILE="${TARGET_PREFIX}" \
     EXTRA_HOST_CFLAGS="${BUILD_CFLAGS}" \
-    EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}""
+    EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}" \
+"
 
 S = "${WORKDIR}/git/src"
 
 do_compile() {
-   oe_runmake
+    # Makefile.housekeeping:111: GNU gold is unsuitable for building iPXE
+    # Makefile.housekeeping:112: Use GNU ld instead
+    sed -i 's#\(^LD.*$(CROSS_COMPILE)ld\)$#\1.bfd#g' -i ${S}/Makefile
+    oe_runmake
 }
 
 do_install() {
-- 
2.30.2

