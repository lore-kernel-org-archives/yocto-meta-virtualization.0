Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7622.1612858161052107930
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 00:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j9x4XMoy;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id y9so29791891ejp.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Feb 2021 00:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6w6iaEaiy4pGe7oN+fDbr99pZSm+CBcCOpKyQMg4hM=;
        b=j9x4XMoy6W11KxMZwm5LSx7FopBNwOBWd78GvBowaylUAksFXI8NjOuMTQDisTHciI
         jiBAFZ7FzMwoplTfpHCbZ25DAT6nVm0fW+GsrI1wwkr5UOdgOL9ZKbB8vux36Uym/VHw
         GqbtK2FDEJGBCqWnvS2mJxwS3OODEv/0WED05lsyvXhs7CYLYr9Ty7uLbyoryP+IQINJ
         Gem7DX2lIeBgWBOJ54oCNjMZHPZIpR1s7hAHQrEOxD23KCF/54TvCJbXtNMKVIUqrMzy
         IaYMhtWEWrOhZ1NPAa533TMxe05JPrRjQ6QnOAY2xLvbDv1uUmgiEc2rIjHM3wI4i/as
         dZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6w6iaEaiy4pGe7oN+fDbr99pZSm+CBcCOpKyQMg4hM=;
        b=O6JNdF9vPkiAeWAOLSibWAPo020AfLuwIos67iri7RlvRkFN6xPJ7zlg0P4KiilIy1
         b7M4iRY40bcyAifUQ8m1hf2Y8zxe83Y8Y1H6phwBbm+dXfr7dN5/AIt/N3F3NhrCkjWt
         AsJvYrDIXVRjRAiBbZzIupTnb+q6Rc2SHb1n/z7wqbGOw2jmPy9FpJN8iqNDeaSy2giT
         hPym4gvZBoKMe45Bb0ZnwwoR+fTZ+j+NiUOiWs8gaCO04r4ee5ojClvcPDGnFT3La0Yp
         ZFlHWAek8recqjyop5hhF2UqcXRp0pb7KusTPSM9Ol4Ig1CrIuWMo0AvEVEqN3tCg5eb
         srpA==
X-Gm-Message-State: AOAM531FSOHZ8s75PPMc05MfPbJZ5xeJRkdseh272akKstuC1Wfkeglu
	RQQlw7aIMFPZQtISM1sr7ZzcNpJ/oppKcg==
X-Google-Smtp-Source: ABdhPJz5HTCJKfbnjHleEJQhyJ8Nklg40xflUB9ahiih4ifTX6/+xmhRkYKGDozV1OPi/hkMhQdKEg==
X-Received: by 2002:a17:907:2a85:: with SMTP id fl5mr20823271ejc.554.1612858159576;
        Tue, 09 Feb 2021 00:09:19 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t16sm12062353edi.60.2021.02.09.00.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 00:09:18 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] Revert "libvirt: fix host gcc can't recognized option -fmacro-prefix-map"
Date: Tue,  9 Feb 2021 09:09:14 +0100
Message-Id: <20210209080915.1149076-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 08b5de42f9216a10bb2f83263b7e6789686b4c3d.

libvirt shouldn't be using host's gcc to build python module, this issue
is caused by missing inherit of python3targetconfig instead added in:
https://git.openembedded.org/openembedded-core/commit/?id=5a118d4e7985fa88f04c3611f8db813f0dafce75

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 819eceb..7b87d5e 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -24,11 +24,6 @@ export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
 export LIBVIRT_LIBS = "-L${B}/src/.libs -lvirt -ldl"
 export LDFLAGS="-L${B}/src/.libs"
-export LDSHARED  = "${CCLD} -shared"
-export LDCXXSHARED  = "${CXX} -shared"
-export CCSHARED  = "-fPIC -DPIC"
-export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
-
 
 LIBVIRT_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.27.0

