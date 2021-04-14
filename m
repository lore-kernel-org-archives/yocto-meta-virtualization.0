Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.805.1618443591492853324
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 16:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NwwL2mqa;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 30so10819509qva.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Apr 2021 16:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IwV4G3cEcF9YiiB5wJ4x7AB4McpGVBQvNaYjsgsbcdY=;
        b=NwwL2mqa7QOeBOvEPR4JDrJczXHjEfj7mh9W8pFyJG+TJQgQZKFSNnxwmzLXzDhled
         QTCqffoC/QEzGZpspEllFFUlpAZbVdXy5fo0FOGCrEsCIQwP1L0q6xN5dnKnj7H8kgGF
         fQBC+z5S7r2aPdoOGgQrXVPIEYdaZGVQwsNc3qZjtesyH+joQCgk8EP076+qGU/rLlZr
         h9stKDg+NT7NZ5CEVfnUV0OtfwfIAoXKaHywchr6PmVGPBZl/KoVeAb3TV4tTSavEGbG
         TUdOoq1kd1YHc6holWUyU6Ds39Uk6qLNNNriYP4pp58yVlfavJ034k52rKMI3UiK0k34
         rPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IwV4G3cEcF9YiiB5wJ4x7AB4McpGVBQvNaYjsgsbcdY=;
        b=ru6CAB7kuzIMqY2EDRidwWXDPOne842pn6rBEVjuvhC2R/qdJgSkGKYecVSoJvmhUX
         FqKoOfO90jgtxIipV+glivfkjKveqJo/yWeAp/J6TvaOeOx4J2uF0ti+MOTPLclA0gip
         H9C9bmUrBcbpmRd/OjSRxxcKBZke7A9yiYvKjfLz58gyz33BeXICtXXqzOGizaxRz8it
         cVmF6FmG4LsSjBg8XahLrxTvThP6tG59+CrCLrgBBeMPsUKOFfmc9UaVduxcjW2TKx3K
         IQ52YSlIIwy4seEbVE80rm93EZxmc1KY22bHzvxw0keaHN0RiJbPXAVxnMXn6ypmRxw4
         NFDQ==
X-Gm-Message-State: AOAM530dYeNuhFU1IwlXl3mYaTwruq2ciRWwYWi2oDtWy/xskb8lSDZQ
	C1iVHZdmHyBXitOoufHmwvZRcGFCUW8=
X-Google-Smtp-Source: ABdhPJyDC3BuvJs8oNBCHUKYfP/F2LCwvNZbSQhsFTN6gM6qTsxK9AaIBKkK9CKH1y2bv+RogRWa8A==
X-Received: by 2002:ad4:4052:: with SMTP id r18mr837575qvp.8.1618443590576;
        Wed, 14 Apr 2021 16:39:50 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-52.mycingular.net. [166.176.184.52])
        by smtp.gmail.com with ESMTPSA id q28sm736010qkm.15.2021.04.14.16.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 16:39:50 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com,
	martin.jansa@gmail.com
Subject: [meta-virtualization][PATCH v2 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
Date: Wed, 14 Apr 2021 16:39:19 -0700
Message-Id: <20210414233924.55589-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable building the PV shim for x86_64 only.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9e8fcad..2fbdb3a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -125,6 +125,7 @@ EXTRA_OECONF += " \
     --disable-rombios \
     --disable-ocamltools \
     --disable-qemu-traditional \
+    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim', '--disable-pvshim', d)} \
     "
 
 EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
-- 
2.25.1

