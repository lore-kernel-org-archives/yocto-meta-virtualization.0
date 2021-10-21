Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.588.1634856842139521181
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 15:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jK+b5pPI;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: nicolas.nadell@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso1673113pjb.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Oct 2021 15:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=1fDZP79p3y7C3Hy3VNHPMCtJcpiYIgKzTtCMs4Hy4fc=;
        b=jK+b5pPIE+HIm4nQIVZdIhwHlqnRAZrT9o2j1HGLy4Z7mfnRLgrVHFT5JNPs8/uEM8
         djvJxMipacN+6N7+y5RjdZ3rN3/8wVs7F0eY0kJIKMIhW+q3gAy11NiFfqG2/ofvzV+o
         vfljYRCBSgAyu4TlHWKF1AszvvMX8CtvsGiZXxiG4SIz29bd7ywVxExOrq2E57xL+DPp
         ZfKKX9kjvo3fLk94NJ4UYgNmWNjNI+oo//mghbRQE68fiejLKy3vI7HvxKAIjmK8PR6x
         rjGbmHJB+2qOObm1yLaIfz74AwFw+rznH3m7W/XC7IcTwLNqBk1MSlkH1jXkf7WGkS/5
         9ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=1fDZP79p3y7C3Hy3VNHPMCtJcpiYIgKzTtCMs4Hy4fc=;
        b=MwGGxVcblzZCjFzuAdg6aD796s8rB2UHIcrz/L5Rtyi8LAr4OJdBwZdURyjlTiuX1g
         V8c3xJKLilTiOBLKh6A6KQklLrZ3uCM076vCPdZEutru944bSB+plqXYkPuttSIfR6ox
         bzNEda8TEHkyOUMpoE9ur0vMbquV23fE0jg4MCh/ID1pcGpQ/8vsDQ9nk+s38R4O5/fO
         Yjhpr1gb3f7+XampU9uqMhxe++F7I9HVjoKWvu8fLR/11ahoFCo3X/CD2VmRrQT5lu1R
         004Yph65GOgNtg6vDJzXl460I0xi0QWhEWcwnrYld/SbiTxBjy43rDMnW3LmyLr2d+k5
         5tAA==
X-Gm-Message-State: AOAM53253zLOdPxia+HSnEpLMkFQ080uZ057FkacG43rfAOMGkygNGwQ
	gnPYzEgvoi0d2UDEXnEqSqc7JV11p4KNENeKJ+9YYCbzkc6yAg==
X-Google-Smtp-Source: ABdhPJwkwiakJwaZxF7umKlInkau9L/bQtu7PrcwMqXALkuY0u4eVPJVaUIc6Mf28ihpubdBWFcOrx85emnv9bCzVR4=
X-Received: by 2002:a17:90a:7d11:: with SMTP id g17mr10142390pjl.150.1634856841577;
 Thu, 21 Oct 2021 15:54:01 -0700 (PDT)
MIME-Version: 1.0
From: nicolas.nadell@gmail.com
Date: Fri, 22 Oct 2021 00:53:50 +0200
Message-ID: <CAGDtK5=Arf30eyehNw2RcU0ow24TQBfi1su=-YkPHaj5u7M8Zg@mail.gmail.com>
Subject: [PATCH] rename git branch to "main"
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com
Content-Type: text/plain; charset="UTF-8"

From 6193c0b2415073d2bba106f013ac1ddd3c1ecf4c Mon Sep 17 00:00:00 2001
From: Nicolas Adell <nicolas.nadell@gmail.com>
Date: Thu, 21 Oct 2021 23:49:47 +0200
Subject: [PATCH] umoci: rename git branch to "main"

The upstream project switched from master to main, so we rename
to avoid fetch errors (as the default of master no longer works).

Signed-off-by: Nicolas Adell <nicolas.nadell@gmail.com>
---
 recipes-containers/umoci/umoci_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/umoci/umoci_git.bb
b/recipes-containers/umoci/umoci_git.bb
index 69325d1..3c8b2fb 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "skopeo"
 RDEPENDS:${PN}:class-native = ""

 SRCREV_umoci = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
-SRC_URI = "git://github.com/opencontainers/umoci.git;branch=master;name=umoci;destsuffix=github.com/opencontainers/umoci
\
+SRC_URI = "git://github.com/opencontainers/umoci.git;branch=main;name=umoci;destsuffix=github.com/opencontainers/umoci
\
           "

 PV = "v0.4.7-dev+git${SRCPV}"
-- 
2.32.0
