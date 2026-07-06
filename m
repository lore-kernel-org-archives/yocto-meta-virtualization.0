Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7679C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155216.1783358072524429631
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kHGcc7fN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847a483e344so57239b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358072; x=1783962872; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7piAGxXaV9RiAXtfZiqqIBSOzPE07jFuoaWGh0Afqns=;
        b=kHGcc7fNVHCELNGW7647UE5TNSIO2lCUjVdqumWyIVQJfpIA/CdJIb7anoxeKg1e0u
         nz9bMgrLj2VZp0sY1/mLGLTADJ0KZeoAeu1oZakoPuo0LD2+nBzHW+bdRK6vfmOuLMKC
         yai6ZkI2u8Mk6yHOqU33OM8V+jWW7AVUeJ+DqnZ3hYSQTIvxGKW95Ltkny7KsGUqAb64
         rrerI8ovc7a+a064V1yTYgarJtLBFUtwUZ8s5sQmjO3KEYN8eGX4sTEGLCQZkobqOnZq
         Teyp7Zco0dKfRGXFmxlEAiKkspswiReJsaIuwL3sFqkYAZQtZ3Vic4Cu2NpGJdgcy/Da
         wI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358072; x=1783962872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7piAGxXaV9RiAXtfZiqqIBSOzPE07jFuoaWGh0Afqns=;
        b=E71wNs5+y3bhbINMjxSMYUZIPbadRDzHyqKJOelpYAYdTFeXh4Knk2K8UPiTtif7lp
         nSai2Ip+Ep/Ny9XzXuem0oHgORS+E9SDDxU2YCkDVrUPzve6GtutQRAhkhp8hepnYTFv
         Tea37kleDmx4YYuww9a3N2VT6OWxiD2/kWqcxF1TiOvX4O7kTMOiEvWLSxKpM7S/OBxk
         Xiq33cJXy2nC49y5bE98ducpQrrmZNabzH4nRwZI2yfQHleYhkIqZoZY/07gGAniaG0C
         moy2VHuT+rpOHnR+DDcQIy8+FnoPaBZ47N4j3B+JH7ZU36ptR2Ol0TKNd729MYfKrErM
         3WQA==
X-Gm-Message-State: AOJu0YzVz3BcPTh2mHA010s4nxQUaDOqHlYVapwzJBITbpJDRnTluosS
	J9g1Wfp9tGLF/rPFqCIkA+PzWpToVz2YPH6AaD9asINsjD7oqbFot2bJrmDe0Q==
X-Gm-Gg: AfdE7cl2C1T/HBbJwUrwO3RrEIp1CpRrNQKkZcsVS2DFvr0McErBVBNg0jELyUtIz82
	6chtIZtbUhPMKAoa5m/M4El1OLi8/hqwK8R+5JDbhIkZDw+ZpwrDwx6T9sQhtXra7ZnFbf7CtxE
	WRs68Anm8ftmmpkzNz4d4uJl/qwVEG1HzzW/Awclp67JRqsh9PX4thjOMXa/OlYtf8QWhNfGeHj
	HX4f3VxpWWkRRezGme9nJx1g1hOrRm7BTB6I+DQ6i+grbuCwwS9LRc742PFsv7v2dhlAO9QeJif
	cKB0EJvSqAlUjuMbWUu34A7Z6aD/Dx/5ce/VyLPWtgu3BbBMd9TK16bRmrsmzCEpga398KaB9Eu
	O/Yim2Exx/omN5pMKLBsKlnwoC839IyKLxdB/sXPN03MbV8JLbm/yBgKS7+i7r1uq178sdXmbHH
	rpGkr9B2c8lpKgPjOAQlcLuaOOkHwjSbH9olbBVP5kajr9pG15wlZfVr6m4XYkjsNyj/wu7kF/6
	CK3eh87Bjcp
X-Received: by 2002:a05:6a00:2d23:b0:845:34a4:2599 with SMTP id d2e1a72fcca58-847e186e28cmr12398354b3a.16.1783358071748;
        Mon, 06 Jul 2026 10:14:31 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.14.29
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:14:29 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 13/13] vcontainer-tarball: fix buildbot-venv shadowing
Date: Mon,  6 Jul 2026 10:12:48 -0700
Message-ID: <96fe8c169f4ac67e3fd821fb04bfd584f192585e.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9937

Prepend the SDK dirs (vdkr/vpdmn wrappers + native qemu) but keep \$PATH
ahead of the host /usr/bin:/bin. The CI parser sources this into the
push-containers step where bitbake also runs, and the worker's buildbot-venv
is activated via \$PATH; putting /usr/bin first shadowed the venv python and
made bitbake pick up the host websockets 9.1 (< 10) -> hashserv failure.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/vcontainer/vcontainer-tarball.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/vcontainer/vcontainer-tarball.bb b/recipes-containers/vcontainer/vcontainer-tarball.bb
index f943cfd0..522cb0ba 100644
--- a/recipes-containers/vcontainer/vcontainer-tarball.bb
+++ b/recipes-containers/vcontainer/vcontainer-tarball.bb
@@ -450,8 +450,8 @@ ENVEOF
 # SDK relocation rewrites these paths at install time.
 export VCONTAINER_DIR="${SDKPATH}"
 export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"
-export PATH="${SDKPATH}:${SDKPATHNATIVE}/usr/bin:/usr/bin:/bin:\$PATH"
-# Clean up - unset to avoid confusing other Yocto tools' >> $script
+export PATH="${SDKPATH}:${SDKPATHNATIVE}/usr/bin:\$PATH"
+# Clean up - unset to avoid confusing other Yocto tools'
 unset OECORE_NATIVE_SYSROOT
 CISCRIPT
     chmod 755 $ci_script
-- 
2.54.0


