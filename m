Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.88.1600803947407652844
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ceUTwtwB;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id v54so16598631qtj.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8e1zOGE4YgM5qPpoHqaz2xEmJlqAVmQA5p6lkijW1sM=;
        b=ceUTwtwBjB6mtIxenCS/Zmx3FRvKrYDObA69nkLE79QUWDUVlo6aNgmG948E2gZb1/
         pqbZ/kBeBJj46sAZJed6cUbNXGNyliIa5d8uyxXTcBdIeqwEBoVowedbdN2NyMRKJOU5
         Z6q+cC29D+Sk6AeoSEZzUMBZtcdhHqt4rInVaTgWxMc8OXJZr7ZV7B66Q4Uw8BS602XE
         QBZ77k33zQfSm79VcIayWGWWLfiNgx1z4eBxAbG0IYtxZgeFeRJX2DoG8zqmMDdwA+8f
         Sd3P0PwBjHpgMCAmSOsEiAZY4lnt00qSs4y2+NHvYU5UmfhFuDbBBjlm8UUq8MNnR0/u
         wT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8e1zOGE4YgM5qPpoHqaz2xEmJlqAVmQA5p6lkijW1sM=;
        b=d5c3nL59Mi6iLHYUFBGFIz8tteLtwbKMHk5jisEJ3eoulqiLg/zkId/IFLSxaXOQzO
         E0B/plnWzwKxzxF2rVYUpOagJL4o6zkVNQ0ar1zWrbh5Llhf7o0Iwk4Wyz9cM2sXotld
         wzJSs7IRfhSwMWK0O6F8cG0Ylbf+LO/5qHDDEiiVX1Ua3WksfLhGJCoJrZXqUFR6CAwd
         AqgjXygosfFoGaUymoGS1ZKylinTwA+RGntBWd8sAukznCs1qTJKOw5A+4Z8E9YFnwQf
         wF1OT/y/C8QQ13m+tRIh3QIGjYiP2Ci+ID1THuYrScD9vMHyRZ0es+0yqL/SMldXYRTj
         SMUg==
X-Gm-Message-State: AOAM531EzQeotvemYfkPo8JFJ0nkXv3432ARbkcGwiP8qkA1DGCmTpiK
	9oTz9ix7v4A1NZBY1mWu2sFdBeT3g4ylzb/H
X-Google-Smtp-Source: ABdhPJwJMCvNISDikkivHC7k5/8y8UnGel/b65MXftiiwa/2bGXZXD5pmAXVXBa9ZyBvGf2HxfqTHw==
X-Received: by 2002:ac8:474a:: with SMTP id k10mr6470211qtp.115.1600803946228;
        Tue, 22 Sep 2020 12:45:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t43sm13538513qtc.54.2020.09.22.12.45.45
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:45:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 1/7] runx: add additional dependencies
Date: Tue, 22 Sep 2020 15:45:33 -0400
Message-Id: <20200922194539.51933-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

There are some missing dependencies for a fully functional runx
host. We add them here.

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-core/runx/runx_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
index a260071..bf84b2d 100644
--- a/recipes-core/runx/runx_git.bb
+++ b/recipes-core/runx/runx_git.bb
@@ -39,6 +39,7 @@ DEPENDS += "qemu-native bison-native"
 
 RDEPENDS_${PN} += " jq bash"
 RDEPENDS_${PN} += " xen-tools-xl go-build socat daemonize"
+RDEPENDS_${PN} += " qemu-system-i386 ca-certificates qemu qemu-keymaps"
 
 do_compile() {
     # we'll need this for the initrd later, so lets error if it isn't what
-- 
2.19.1

