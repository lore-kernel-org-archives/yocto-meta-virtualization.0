Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.14607.1627867631506779128
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 18:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=inAIhp8z;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id z24so15235018qkz.7
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 18:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p0nq298E3yG3y8V+fh9GR4Tm+QgSgPL5RGFgnCSNUuM=;
        b=inAIhp8z4mFdC9CKZKrG6doF6Twd9EMxLYw39a9YHhMKkTBNLPMvFPuH6tNo4XX9N7
         VPNas6xJIsGcx1BW5V0n34AyrttTtZdLUzFfs1PKUib2snv8NeojRrKFmWsxRb5fbu63
         IIfcS6YEF88k80uF20fp3bzR7C5kewya7NAkVhayJj/addXoBdBUnpF8O6x1xNaJmEsM
         cMoxSJrr4J1tXDhZqhPPmpj8eVxd7WHI8zMPI32iO2a64uw1bLzfaAp1DUK6uhI6DEmn
         1TWZ1i07GFjkFNAxXpNv2D6E4rQYpTx/+KvdY4esC/unzUJGq0X1CAE1CwtFteTo8Xdh
         uhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p0nq298E3yG3y8V+fh9GR4Tm+QgSgPL5RGFgnCSNUuM=;
        b=owVAaLgedzgTyf5RIwsmTd+Aat8pfPghd8RBa2iZ4/XuOL0tYlZ6YjfJrU1EneAlBo
         MEoAAkEJa49lo5S1Z5laJydgnMeP/iPlrXVLorvSyxwNDCcq3P4rxJRXd0JvG1JK+54E
         hr68VA7kfdnMxEvGmg/9wxWnYxIRgs21jMLqHQti7Dxvq+IfQMQqgxVT4U18CnO4vQAo
         ECiRtHEb2+iefjgq8y09gqYFc43b5klOp8Ka7fM9teYCWmP7Flxe42Se17Bzfxt75yDF
         37x30JL4svijuScmiDfAJOnien0zXIZPf6VDODEXp5w0LHKbQ9S95lNyorQe6wDth1Ud
         O8Mw==
X-Gm-Message-State: AOAM533fLN1DJrxLppXGPJoVMUpjF4c0cKOsDCeGSJvgAhHNCs6tXYrS
	v+KbgOIZ+rXOlvHR6JaeO9UUY+Qs+GYxVw==
X-Google-Smtp-Source: ABdhPJynHCOR98q65YT12b096z4X4AHwTVzz5/dbJI1V9QjrsRvYSQh+2knfKt47IE6ww4yEpn68vA==
X-Received: by 2002:ae9:e606:: with SMTP id z6mr13310147qkf.152.1627867630470;
        Sun, 01 Aug 2021 18:27:10 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-137-177-087.mycingular.net. [166.137.177.87])
        by smtp.gmail.com with ESMTPSA id d79sm5185825qke.45.2021.08.01.18.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 18:27:10 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	jdmason@kudzu.us,
	christopher.clark@starlab.io
Subject: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
Date: Sun,  1 Aug 2021 18:26:56 -0700
Message-Id: <20210802012656.40174-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qemuboot device tree generation task in qemuboot-xen-dtb.bbclass
requires the QB_SYSTEM_NAME variable to be set to identify the Qemu
binary to use. Skip the task if it is not set.

Reported-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 classes/qemuboot-xen-dtb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
index 08f9b02..2d37e91 100644
--- a/classes/qemuboot-xen-dtb.bbclass
+++ b/classes/qemuboot-xen-dtb.bbclass
@@ -176,7 +176,7 @@ do_write_xen_qemuboot_dtb() {
     # Not all architectures qemuboot with a device tree binary, so check
     # to see if one is needed. This allows this bbclass file to be used
     # in the same image recipe for multiple architectures.
-    if [ -n "${QB_DTB}" ] ; then
+    if [ -n "${QB_DTB}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
         generate_xen_qemuboot_dtb
     fi
 }
-- 
2.25.1

