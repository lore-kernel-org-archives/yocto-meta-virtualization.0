Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F1FE64A87
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 12:26:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.18103.1733228791367943972
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 04:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hwLZyFc1;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21539e1d09cso50044375ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 04:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1733228790; x=1733833590; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js7SUZ6HhmB4g5YlHsljyhxrV4UccocoiageqA/gwIU=;
        b=hwLZyFc1Iad20p5x7ItvBPPonrg4TSir6V59AEfRnDYFDtHPFe8hQEnDCU2xKyhm6z
         gQW/Ei2Wrq85v7WA7WYk+ijfrlwBv7mTOs4LkOviEfRKORFIfckv8LM/vOpHX/LoGkGj
         INP3qA4Dt63lg5tR8T3DFEbNu3aXFNKqPfwIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228790; x=1733833590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js7SUZ6HhmB4g5YlHsljyhxrV4UccocoiageqA/gwIU=;
        b=I4LdmJ6R4FFwbG9+xi568HZxtih5bkdLbl1jP7brOdZRseuQzPNU58ivkOFW8a7YlK
         Tr05Tft7gldURdzrlNxMNdYBIIIMALuSUcjrFbvs0j9oOqVDjqg+LeyIK68n/H1dWyxo
         sVHSQuJfFdzm0zl3PDzaoQH4ebdjmF+A63/wuVqqDX4hfmtW58ECD7+Bm8KMTwYdfZoY
         nSXCcpuGMF6GOKkd9rVY5hBDI6oOFVv5QvDAIXrE/ol2+3ObKiFrcnNDl0xBqMDQAc4j
         ffcHJjtp2QLDREFDrNyFZij3RWSRKbXqkAiBZuDsWItTBkA5sdFten8L3r/aYinlRLBb
         6iig==
X-Gm-Message-State: AOJu0YyZ0LU9yl44WdB8x3zvaOWLh/VkfJh2zD6HEZppORc8tMzDeB0F
	FPILhzu/ROu390f/spQwwFjmIxTBBfI7hOfTWQkVI0kZWs9gbZCil70t05kAjlF8dHc5ba5nLrI
	D
X-Gm-Gg: ASbGnctpFk3G6bpgb9DtbElL74951LF5jatz+icfuXXLPa9p4UuFRqgMpf1bcw8eAFD
	V0XCiDty3GcmcAPHuRTT1M6iIHmJ8fh66sqRY4UHYNTgFJ7CLpt8oBeAJXSuhjF+UmMWWQbCebv
	Bo2leBVUu7z153Uri9DuRXjWZnnogQ479ioFxV9oXlSwiWZTjdQs/GEdGbW18X4dKiH3eFTJ3cy
	bV7ZYnbX3kyrTiEjgsb6c0vgnRw8sWcZQJ21vjF3Gz88cT8th2aQoFqR5yaKg==
X-Google-Smtp-Source: AGHT+IHL7nAPSNLQ7LAWABruwkso+6Jm/wr9/+fGVx7048CH79i1c0Ah9q6oOxrH7eY0kLKcsNYwNQ==
X-Received: by 2002:a17:902:f652:b0:20b:a6f5:2768 with SMTP id d9443c01a7336-215bd1b438amr26512895ad.10.1733228790266;
        Tue, 03 Dec 2024 04:26:30 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.198.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215964b6b76sm33696485ad.191.2024.12.03.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:26:29 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Anand Je Sypureddy <anandje@mvista.com>
Subject: [meta-virtualization][m-c-s][scarthgap][PATCH] mod-wsgi: upgrade 4.9.0 -> 4.9.1
Date: Tue,  3 Dec 2024 17:56:18 +0530
Message-Id: <20241203122618.3728824-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 12:26:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9034

From: Vijay Anusuri <vanusuri@mvista.com>

mod-wsgi version 4.9.0 doesn't build against python 3.12
update it to 4.9.1 which does build.

Signed-off-by: Anand Je Sypureddy <anandje@mvista.com>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
index b0daf54d..71886624 100644
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/GrahamDumpleton/mod_wsgi"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "df9faf954a1ab6208f45ba6fde90f0b41f605483"
-PV = "4.9.0+git${SRCPV}"
+SRCREV = "0497f0c29e8dd06608378e6fc814a6037e8c6906"
+PV = "4.9.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


