Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.3845.1618283422737528579
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 20:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ky9C1nvl;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 30so7421323qva.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Apr 2021 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IwV4G3cEcF9YiiB5wJ4x7AB4McpGVBQvNaYjsgsbcdY=;
        b=Ky9C1nvlvnGrPt3h3zPaCQFtoo+BT8iFxuu41IenxpdIjGswE+0IubdbiKpqy/tepP
         6jRednIw3LO3E7Khtebk3Uxi5nR+aIe7GCu8M6T6ULaaoaEPylm99lxeNYuYCGhc9Mff
         1dITNP4OCMg6FORuqyVfUpESIqzw01QY2EP476HMXE5+fD5/158uvuAFPcnXiVF4oO7o
         zK3jwAY9N6W4aLnxogh6rh6I4JkT2PrtLNcnA8qfQCaT4rRUPoc6Azi+yh7LURdDNMzR
         dcn4TJRjqAH9dVwWaH2LDWL/CylsIg/nMZ4iGEz8L9wOixLvuDDnsF1lUrzBLCreK1A0
         AdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IwV4G3cEcF9YiiB5wJ4x7AB4McpGVBQvNaYjsgsbcdY=;
        b=uRErD7qcLlbOlAh9g6MJ76C6uTMHGbNobCl9uVbtkwyiLeS9Mb4HvYRRhwH68itutt
         e1X87adMRM2TpwnSg52h2iTsvJtb89/Q9omhY4k4c/7reOce9Hy/s7rPLdIrgzdsUxGZ
         M4iNuexL8Z0iYnbn/J++GY8Sl/NJa78VLPKHm6yPXNa2C0WIAlY8DM5COfXQ4zMQe8Ru
         gvsV4mbolru4upT5YHNiS24ShmkJKGYKqJYYODC3EyDzAkcRjwlLPn7RFP+elVelYizb
         AnaAJzH1pkGhdktgykne87rcLFiy5A1Loni/vWIiZ/dGLtAviX20xlmU4FEBoE7GT6+r
         exPw==
X-Gm-Message-State: AOAM530inFr51aNZ1aTuCXziZq7wVpXNADN+vciiOO8lXABJvp1rlvUK
	THvFkFHMtQMZsx7ZU1BmMVTHBVv1pF0=
X-Google-Smtp-Source: ABdhPJxgauqBRtyRLyoG385nzCxi4jDny7poflCoxI/dpK4fdNxQqWnc/j4zQDh+3GDiT8Rwby9PtQ==
X-Received: by 2002:a0c:ed2c:: with SMTP id u12mr31079681qvq.30.1618283421819;
        Mon, 12 Apr 2021 20:10:21 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-187-62.mycingular.net. [166.176.187.62])
        by smtp.gmail.com with ESMTPSA id i21sm561873qtr.94.2021.04.12.20.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:10:21 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Martin.Jansa@gmail.com
Subject: [meta-virtualization][PATCH 1/2] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
Date: Mon, 12 Apr 2021 20:09:50 -0700
Message-Id: <20210413030951.40543-1-christopher.w.clark@gmail.com>
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

