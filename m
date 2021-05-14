Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.6478.1620985926484985793
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oeSQdfd9;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i13so4100896edb.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjGAhw/iZc4Z68LKEmFsksamTn65UGlZxw+E0jP8h8I=;
        b=oeSQdfd9+lY9alv+dVD7rZvTc3k3OdEzRZbZu0946kxoFmNi/gtbg3k5mcLr/cXg2E
         b0GJ+0r2kKBP1+Pj+5GL5yNAugyZ/Gthhf1/fxRUX8JFP6J8TdBSMSvSX4E+XgCa0qJ/
         5bhSeM+QMjMWHSFSBD3epBg4CczkyAsk4KKSty0BpnLFzOSroFr95++WqT4oLUvgMI4R
         I4qU3JD8Z8iIN4bORpzLECW2Doue71e7rQZoCoZ5LJWErho07CeFfGq2JPPWi02GmUsR
         RJ0NTZU6WBjYOHGq0qtTfRLzPuVXr/M74OXSodQaBbRdVHAwIT1ehyW275Susa8hfBjC
         YuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjGAhw/iZc4Z68LKEmFsksamTn65UGlZxw+E0jP8h8I=;
        b=WaNpDBRlJ/c/O4T+fkOHibxAuLEv34f9zbFc5KCMASmHJllmiOU0u7Kw67TNzKoa02
         Uc/tsnKtt5LmNQ7vsTIhorjxKA+k+cC3JRT2/ETBUol7gtr/F3f8n16nQWbXTCEWVble
         /scn/IugQD8iu29e0eS0FiiHQsyMrT05oDYWpbBCU067m7zvRuWwDRt23fdJEPoFXIKt
         yCNRlLEIVi+r2adt94+0qa8zDlp3SvkQmmPdnKCwplEOnuLR71an99RGAZAEUjOgg6mV
         mkfGzvlmTUODb+l61XDdHDbewss3/jF+nUBKMKK6SafLN+bTUO0JCjKey6GRdQrPBn65
         LFzw==
X-Gm-Message-State: AOAM531LF9kz5dCR8Bi4CnN67mDtNg9LbXXHCBAgr4yrSW3yBfw12fD+
	mQEBWsdto3BKJ7Vw1I2M44ep6rFiQdM=
X-Google-Smtp-Source: ABdhPJyENiyNO9j35sRSxFq5LA5cY9XAeHm6fC+ygqBihaZLie10UPv1DwJNYzHk0h/OHMAeo+EoIg==
X-Received: by 2002:a05:6402:1d28:: with SMTP id dh8mr24274257edb.303.1620985925172;
        Fri, 14 May 2021 02:52:05 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r10sm3275892ejd.112.2021.05.14.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:52:04 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] ipxe: Inhibit -Werror to fix build with gcc-11
Date: Fri, 14 May 2021 11:51:53 +0200
Message-Id: <20210514095156.1562532-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* with gcc-11 it fails with:
  drivers/net/ath/ath5k/ath5k_eeprom.c:437:65: error: 'val' may be used uninitialized [-Werror=maybe-uninitialized]
    437 |                 ee->ee_switch_settling_turbo[mode] = (val >> 8) & 0x7f;
        |                                                      ~~~~~~~~~~~^~~~~~

  tests/bigint_test.c: In function 'bigint_test_exec':
  tests/bigint_test.c:232:14: error: 'result_raw' may be used uninitialized [-Werror=maybe-uninitialized]
    232 |         ok ( memcmp ( result_raw, expected_raw,                         \
        |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    233 |                       sizeof ( result_raw ) ) == 0 );                   \
        |                       ~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 43c8f0e..9e98495 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -28,6 +28,7 @@ EXTRA_OEMAKE = " \
     CROSS_COMPILE="${TARGET_PREFIX}" \
     EXTRA_HOST_CFLAGS="${BUILD_CFLAGS}" \
     EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}" \
+    NO_WERROR="1" \
 "
 
 S = "${WORKDIR}/git/src"
-- 
2.30.2

