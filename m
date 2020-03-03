Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.4179.1583244640632413116
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 06:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pl+q4uTi;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id a132so3370940wme.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 06:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mAfgvhmu719zWcfP4zENGZ6eSgNyEHF4uCLTaZNzqHM=;
        b=pl+q4uTiHYc1voy/Wu4hHq89xflCmsOQ9uyfeNxxxwDLtHifmEKip/rHyDgk14l8ME
         l3royTRNEuM+ypu74jI1D3nOcz7twkkmXFUojYjTpzrxeZ4iSHcz5TA6TCK2GXoP0OqC
         8k+yWZ2rFdj1tMElYTKGViJ0vU4FlKfU20Xd8vCKpuOCxVFHhxKZHbEoPZlyZCuB106c
         y6C8sOUA6ofaqiyn4hhDb/O/FkODoiw/IQPE40z9M0T7NEkBAt1ty3FcLto22LaQUWaS
         Ygz5ulLiyMceVX8MR5wkb9InLngsu4qS3lR3kizozDOxbgmd0AKI77OodTj6MVgOsll1
         u/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mAfgvhmu719zWcfP4zENGZ6eSgNyEHF4uCLTaZNzqHM=;
        b=nmEMhJXbFTEkEvArNEoW4C/cC4LUmLK1+ncFDGQXZfoICVgzSz7jlqo6KkB88YEDhn
         Lx6L+lVDnZC2y/Y3WjV+pn2iZ3R3dH7qSf/Sa5i3NvKLco9CWeVlUnw0uvarQwztkSPo
         KjQz0jecZHURhQBo/FbZplVCAxXESIit0ioYB+2JE9S/U9K9GetOPk2tegH52p2GtKpv
         AOTFGae3o0XzDvpPaKIQSyPsF3V7gBwEkfb2tJ02s4riukzxwnnKJ7rvfRr+8C1m0NWt
         JlcGL+GhNf9+jVtjEdLWTHKxTFvqvMySOMM+bR76K38unEOQn6NuiXvliReoEmfAVS3u
         B3Mw==
X-Gm-Message-State: ANhLgQ33RacpQ6u53EBwA7OtjvmL3JzAAUEreQBgxmcAGjdhSyvFLqka
	PykRpDi5mqR5oNHali9DkbvTYoTU
X-Google-Smtp-Source: ADFU+vtbpQfTE/UYPjJWaG1HszFWKcYiZKqTFaeJ8L4UdBMSVuM0N58Y/5sXqxt31wEwSXM6boVSPQ==
X-Received: by 2002:a1c:750e:: with SMTP id o14mr4381750wmc.156.1583244639040;
        Tue, 03 Mar 2020 06:10:39 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e8sm34884286wrr.69.2020.03.03.06.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:10:37 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
Date: Tue,  3 Mar 2020 15:10:35 +0100
Message-Id: <20200303141036.5833-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* let TARGET_VENDOR to be set to something else than the default:
  meta/conf/bitbake.conf:TARGET_VENDOR = "-oe"
  like other architectures use
---
 recipes-extended/xen/xen-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 8bdbfec..8b86f7b 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Xen hypervisor tools"
 DESCRIPTION = "Tools and utility software for the Xen hypervisor"
 
-COMPATIBLE_HOST = 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
 
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
-- 
2.20.1

