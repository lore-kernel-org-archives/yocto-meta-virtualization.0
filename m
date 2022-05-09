Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B05C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:01:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.48.1652115666646130207
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ghsbuuXD;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so13186829pji.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+NCRedJIF242RxgPQn2vfn6/1tdLJYooeFHnnWNhpKo=;
        b=ghsbuuXD9d2cDPrXJKF+zREIR+hgGgoEO5YiXju8pnonYgH5QKZJfuPfvnW81lrfCB
         JwqXWC7augX3cwE+H8A6/tABJnubtaCI23Al3cUq5s16v2sFjqk9KumEnj2/iGZzYp6b
         KXS3XztZzPQz7xV8mfxLbb7oCUEA3pNTGAv/oLBcyROiOPjpdXKMWGL6H58tQ4hV67b/
         kEbz4hvx+PQU2Psg7FdWRzA/TkCZySUOK4HCivogpQj1Y+SJ+Vd1OaNhSEFwV5KRct5j
         23j853+jsiZ4aw4G00OtePBpAXILJbYLLVvtT1s/8uCg8gE3XOYxv+b7Xv/i7usomsJq
         d5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+NCRedJIF242RxgPQn2vfn6/1tdLJYooeFHnnWNhpKo=;
        b=PXl0yIdHrVLLyB+tQky1xwRrhCzL9ZV99WvtDySztKAoUhgMFyoOEq2ZQ+nUJ/cohl
         R00MRvWtpQMX1/lX0xCU5sgo2S+HjFSjZZc2VsDbyGRbYS/yLImJjCyo05Ob2GjQsjA9
         CGoiv+IPhOt438ZCpQ5uiU+26ue7PZJnCRliazvTK0fcOhjE38O+RpdiRagKC9J4/5Yl
         tvJA/To13bOJxvtM7ORqe/eNZSXZS/lq8SWyRDryAXNcZWUS7g+foWvCLwGw/DMoH6jU
         Y0IHNTaoqPhQAkI/SCH2XS+H6VionL72IJVwOF9VmO4QC7a0H9OzQM97PXCksJXJzH96
         0itA==
X-Gm-Message-State: AOAM533DWzPg2EJ9c46bhmdWv8uN7g/nOxVLWUq+d2fCg1Au3XfML3SI
	GGXTfN/kckAqG/MzYSTirqtl8WjYCganJA==
X-Google-Smtp-Source: 
 ABdhPJwDTaZcuE4BIgw1XAtnu5SbFsucuILhp6n1ge34TIqVXlTR4hfH4bn/XWqqcgtCewk+/c5I4w==
X-Received: by 2002:a17:902:ea46:b0:15d:dbc:34f2 with SMTP id
 r6-20020a170902ea4600b0015d0dbc34f2mr16729192plg.60.1652115665775;
        Mon, 09 May 2022 10:01:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 h9-20020a170902704900b0015e8d4eb216sm110193plt.96.2022.05.09.10.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 10:01:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] seabios: Upgrade to 1.16 release
Date: Mon,  9 May 2022 10:00:59 -0700
Message-Id: <20220509170059.2751954-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220509170059.2751954-1-raj.khem@gmail.com>
References: <20220509170059.2751954-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 17:01:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7265

Pin to use gcc as compiler always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../seabios/{seabios_1.14.0.bb => seabios_1.16.0.bb}       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename recipes-extended/seabios/{seabios_1.14.0.bb => seabios_1.16.0.bb} (87%)

diff --git a/recipes-extended/seabios/seabios_1.14.0.bb b/recipes-extended/seabios/seabios_1.16.0.bb
similarity index 87%
rename from recipes-extended/seabios/seabios_1.14.0.bb
rename to recipes-extended/seabios/seabios_1.16.0.bb
index a090756..ebab54b 100644
--- a/recipes-extended/seabios/seabios_1.14.0.bb
+++ b/recipes-extended/seabios/seabios_1.16.0.bb
@@ -15,9 +15,7 @@ S = "${WORKDIR}/${PN}-${PV}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
                     "
-
-SRC_URI[md5sum] = "9df3b7de6376850d09161137e7a9b61f"
-SRC_URI[sha256sum] = "eb70cc62b29aa83e10a653233acebf4bb154d00d0c87dc2a2c6e2da75e5e81fd"
+SRC_URI[sha256sum] = "d44d8e97ad56f3fd23ed3076077a770d37a5e7bae22daa59656ff41c3334fb34"
 
 FILES:${PN} = "/usr/share/firmware"
 
@@ -27,6 +25,9 @@ TUNE_CCARGS = ""
 EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
 EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
 
+# Can not yet compile with clang e.g.
+TOOLCHAIN = "gcc"
+
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
 do_configure() {
-- 
2.36.1


