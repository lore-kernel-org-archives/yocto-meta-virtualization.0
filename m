Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF3CC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:03:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20971.1785110635231583934
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WU/s6g/X;
 spf=pass (domain: konsulko.com, ip: 209.85.214.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf27856f9cso26697615ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785110635; x=1785715435; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMI1rhc4EkkcMFzvxD94BZfcbZUsz9H4HRMeO3dP6bw=;
        b=WU/s6g/XlY3w7JaB1GYg3d4lJqKDIB5yIaq79qn5TlZiTEYx1HrDAtdelv9qrjJMJO
         PE01VxrR0X9BPe+PQfA2lDziXFgPRKgZ4g8ji/sLHuVpsZ5OtVotOPDW2zQkX/VbSeki
         /DjQp1wJg639xustsSyWitdzFQVeUSG4Hz4q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785110635; x=1785715435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMI1rhc4EkkcMFzvxD94BZfcbZUsz9H4HRMeO3dP6bw=;
        b=B3bkfnHpBF3VblxcvSJBQnnjJAwEDMbcTBSXZ548iG9/q8w7DTDujBlLXKCt8g0FXh
         smXQN3CrDCENO+mfueRMvGDo2ogWTBPu2ZsX9QR/epM9mCkChSU8pkSQAZ/77K8NBAQ3
         7u249990TBZ4fNptkA78TPgMQ5K2j5QMNAczucZxRi0lAbADJ623r98cKxaFoyV51zF6
         1Q5U7NMOTjvF97FkalaW5xQY9cbTWYuv0c7skNbmdx7SyERbDmteIuvzjlRff4+9ERN3
         dcVxkk68mt/L64WwXIym7Z4+HWgeuBAq7DqNyq5P0nA2dTrxRocuzdpQ21p6oMYhm8Tb
         fjZg==
X-Gm-Message-State: AOJu0YyvVkUd2Jby2Yr37yFzMCFxCF5GIC6zQJvgvCFPxstLA8+vDjUQ
	a3O6wjcxvwB380YGV6JOm8FiWkIBs0+OySsOpnxH/oiBtTQHCxJ8ZlQls02L+rAo+3kAcF/3HjU
	vifnD
X-Gm-Gg: AR+sD13OSZxZP8QSurRGtBVaR6rXOp2ngO1p851NMdOnFrXwaE3eVt/S/P7ukMwRObf
	Zc7IF+j+lzkLTFJ2BlqcpoJtY45oYE0UwxyU1dunMRgzB0CNnM8OMjmywrM82WlN5tQuJz+lpGt
	u0adPisok9/0Kk9dKAulZsrnXAxOcJWt4XTF5+YSjWIlaQeBxdcxiTRAM4R526Wy7SBl7G0Pwaz
	B7LvCU/M9yXXJoDiUjgx3s8sevc63mHzf/G3C8UMHejEdtLbgekLKT+in2TLUylBA5eQASw0Syg
	Ay6NDIBeMWSq8YT1SehJwO7ipR0r5vAx0h6pd4X1yiwOrY5aRSiMnhV1gBxVRCVU9M+C3J+bTrn
	7OVS3pAW3Ph4ujRyrsReu4vnw8iv4RSDuqaLKKv6XTKxdUCe5OJjqSTxQL7MsBdBRkLW4O7kVmt
	yW7u77sQ2P5qw80PY5JzO2lh2a6xcG0Q==
X-Received: by 2002:a17:902:cf05:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cfde847406mr57271985ad.25.1785110634592;
        Sun, 26 Jul 2026 17:03:54 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm25048625ad.27.2026.07.26.17.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:03:54 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][RFC][PATCH 3/5] packagegroup-yocto-builder: add additional dependencies
Date: Sun, 26 Jul 2026 17:02:45 -0700
Message-ID: <20260727000247.1623785-7-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:03:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9983

From: Tim Orling <tim.orling@konsulko.com>

During run-time testing of container-yocto-builder, it was
discovered that sanity testing of g++ failed and
glibc-dev, libgcc-dev, libatomic-dev are needed.
It was also discovered that we need ca-certificates for
git cloning with https:// protocol.

During a build, it was discovered that rpmdeps.real needs
libgomp. This would likely be needed for other gcc-runtime
needs, so add it to packagegroup-yocto-builder-toolchain.

In run-time testing of the bitbake-setup workflow, including
with the core/yocto/sstate-mirror-cdn fragment enabled, it
was discovered that:
* bitbake (python itself probably) needs locale-base-en-us
* bitbake-config-build needs util-linux-flock and
  util-linux-getopt
* wss:// protocol for hashequiv server needs python3-websockets
  (for sstate-mirror-cdn fragment)

For more details, see docs/container-yocto-builder.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-core/packagegroups/packagegroup-yocto-builder.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-yocto-builder.bb b/recipes-core/packagegroups/packagegroup-yocto-builder.bb
index 35080cd5..e75e50a4 100644
--- a/recipes-core/packagegroups/packagegroup-yocto-builder.bb
+++ b/recipes-core/packagegroups/packagegroup-yocto-builder.bb
@@ -68,6 +68,7 @@ RDEPENDS:packagegroup-yocto-builder-toolchain = "\
     diffutils \
     git \
     git-perltools \
+    ca-certificates \
     python3 \
     python3-modules \
     perl \
@@ -87,6 +88,10 @@ RDEPENDS:packagegroup-yocto-builder-toolchain = "\
     zstd \
     rpcsvc-proto \
     ${@bb.utils.contains('TCLIBC', 'glibc', 'glibc-utils', '', d)} \
+    ${@bb.utils.contains('TCLIBC', 'glibc', 'glibc-dev', '', d)} \
+    libgcc-dev \
+    libatomic-dev \
+    libgomp \
 "
 
 # Layer 3: Yocto-specific tools + utilities
@@ -124,4 +129,8 @@ RDEPENDS:packagegroup-yocto-builder-extras = "\
     ncurses \
     ncurses-terminfo-base \
     subversion \
+    locale-base-en-us \
+    python3-websockets \
+    util-linux-flock \
+    util-linux-getopt \
 "
-- 
2.47.3


