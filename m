Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.992.1618598519941861845
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 11:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dgcZp9GG;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id x11so29825312qkp.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Apr 2021 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLBpF81rNKiy2LCiypWUhxiDrtvex82Mm/jmeA0Zw20=;
        b=dgcZp9GGPjHrFM9QqyoOtt+Muxl19xu6mN0oLgMcNglOYrp4P34qgDa2snxnFtIcqj
         +SvzDGMerm/UrMXQX5B8RzL/6r4ExKcaA7Cazqq7YIzVkZlPTufj9Dgld3ak+pnX73Xp
         AMJKh+szWWQQifv2FZLbMp+zTBr+hAfLRbZiAIPau+OFSCl+OaPxQzCrO8RcygRU83U0
         OXkMgCxr2riQaHm8L7EtlUp7fWqHe5OeOsUQ1iF/mbc9tA7+9s/+Nj0igLXCP5yVuegJ
         NKevE2jfDkYyro/A+fyAMaixXgb+jfsLydIO2d92pg2nZ4iKvk2GpmMUwygI3Aq2fFXA
         CTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLBpF81rNKiy2LCiypWUhxiDrtvex82Mm/jmeA0Zw20=;
        b=tS9//NDgDApIuGiu73hqzgrrmd83mETkv1r3DeNHR9jE0MBHg4waG6B21KD7ME+ggK
         E3WfBANFJMpNa2/5NSG8StlH7vMiD0XGeQq/jynZAwUjDh3/fgBVW6EccK4Brttbe4Yr
         EwzlzW9jF9pW7qgYDYkePo8+locFgBNUMhahulOD6WCBDAEh2dM2WIUa/jcvMu5MFbo+
         Kg7AkSNl2iPagtm2SuamU+9bF4FKU+NhukBJ9JTVlJPpcYc2qgzeqS0SNdx59CqpwG+Z
         f64WqRRixZIuer7058zT/rQIm1bUsBG3bjIlsnRrYEC1y7427am7wQB9rgE8lhNfUQNf
         qmiw==
X-Gm-Message-State: AOAM533ZRmx/hjiMcNsm0bLbHlQfdehZS5Rn0CFtlhfWK8T74MgYXK8w
	iY8hxeBNaQRzsdCAfEzmArD+rey/hufUyA==
X-Google-Smtp-Source: ABdhPJxOfxCwaQAe3Xn1gazuJJaHxBq1aRkhEK0m4uZ5+16FSfnEKXWC1kLZe5NvR4HClnQrzgb2Vg==
X-Received: by 2002:a37:7985:: with SMTP id u127mr603857qkc.333.1618598518935;
        Fri, 16 Apr 2021 11:41:58 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org ([166.176.185.178])
        by smtp.gmail.com with ESMTPSA id m10sm3922238qtp.43.2021.04.16.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:41:58 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com,
	martin.jansa@gmail.com
Subject: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
Date: Fri, 16 Apr 2021 11:41:31 -0700
Message-Id: <20210416184136.71992-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable building the PV shim for x86_64 only.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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

