Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50BEC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:31 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156226.1783358067207521825
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kfe6pI2k;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8471013fac2so3594827b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358066; x=1783962866; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HrNvHUklscoabAyYQlb65R58xsKs5DQjfR0pRa3jsU=;
        b=Kfe6pI2kT5xrz+4U42oclhutPUy0N8BPEcaxlY41tViQudF50zWQlp2l5l1Pj2Uf67
         pjhcNDD+jYCKB9++v2+vhohegdQ14xiYjx1L/kQTy+YZitc40LdEvxJ/RUdux2aDDwyn
         z2RU+B6NIueoiLx5bvJNjpMdDXzua+zj3ogQwS3bvq4Z84OUhGwQJ0+qF5ySximh0uLU
         fDlv9cCTyCAwOzU/5+wFKkQ/qGkD/qCdtTkBXYmzl6NGZgcLcwPlHsbBzWC4y5SJmpxh
         BFyJJXWxcDUX8ry4skY16A3ACVMFo4yvxLuaMRwk4lOEfjl1tjVTkiQ79ZoAGW1pnVw9
         0b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358066; x=1783962866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HrNvHUklscoabAyYQlb65R58xsKs5DQjfR0pRa3jsU=;
        b=W5634E+nCGBvhqTWw/TCXMs2PDcr3574bGZ4vxsYPspIM82WEppbt52mnqY7vwKZiC
         mrXeOPbi7jphDDZwSRCf4j9HzhlLnvfZg5Zn7EETFmLuh7c0gPhVCwMOjleevd7sjFUN
         WZSsg/mBo2Zdp1/Ns94R3D0hyGnMX0ls7VPrkP7kozoFgJy9liRW0gGcud6gOIp0NigL
         4v2hUmVc4eLNCT7jHrxHwWHJDqKZSrARbIQW6PLgPDQ/QpymvoRHW8BSwWXCIuWlakTX
         UlMBe7iCMYgrlLYtdkYZ9I7ROGBYokfJWC9uwvyEKF6G4bJea6WuhJtql40zHkVJroNw
         3ahQ==
X-Gm-Message-State: AOJu0YxKAtxiilYQhR80wI+s7017hjoq1dnff4Uxt/V73mCEkmNEcP8Q
	PhRbzD0qbmgi3q4XmionB+C/ANHKpNdS1qz4T1pe6hv/YCpczUIFuZwAS4FY3g==
X-Gm-Gg: AfdE7cnor0mjphb3cL7NJ2UP3wcROm7lWe60ijK6fChXjtrNVCFNss+tzmFlQz6SYCF
	BjURSfti2WskDenrEg8sOqTPFttHTTAlMkZeKoo10oyG/yjV472X59QS3P/Z4tI+MMU9x8pfTWQ
	RdKvAWpcy38XvUwJ1aFmUGy4taTRpx9cZFbiuR2yF06OqpP79i6dXaMO4AxG9KKP7sSHh0cfyjn
	PGp/GadK9dRB9bWfPr3fN8rTqiBBS43WGjWKBIy69qIEoZFhGHJJJJe1fvRRnDSqviMu+UfmU8+
	mUEbdn3HPZuV9pd4/C/AAOifJL4UULCOFut17hxc6cHKbn8kbTw5Dz3rgshIn/EQhdcMmEcyY3Y
	+QIO0zDWFvtH5EB/ck/ErPZWZ/Gj+AUeJLjqOhSXhFpu4xpuBiezwObNJG4j7hZaYDi1METCS3b
	l6DJ9TjXKZ94gWKvDyB6jLLMZm+yTy0Aa08TdHiOQ9nBHiUEd/+doZ9+UabDpBbdmYNpheUqmyb
	4EhkYGhYv0c
X-Received: by 2002:a05:6a00:3d55:b0:847:82dc:452d with SMTP id d2e1a72fcca58-84826d1d859mr1594944b3a.29.1783358066544;
        Mon, 06 Jul 2026 10:14:26 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.14.25
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:14:25 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 12/13] container-image-multiarch: add helper recipe
Date: Mon,  6 Jul 2026 10:12:47 -0700
Message-ID: <a869ef29878d35ab40b4555214e055d8983d66c3.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9936

Similar to core-image-ptest.bb, this recipe uses mcextend to add
multiarch support for any recipe in CONTAINER_IMAGES variable.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/container-image-multiarch.bb       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 recipes-containers/images/container-image-multiarch.bb

diff --git a/recipes-containers/images/container-image-multiarch.bb b/recipes-containers/images/container-image-multiarch.bb
new file mode 100644
index 00000000..13c4ae24
--- /dev/null
+++ b/recipes-containers/images/container-image-multiarch.bb
@@ -0,0 +1,31 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "vcontainer"
+
+
+DESCRIPTION += "Enable building the ${MCNAME} multiarch image."
+SUMMARY ?= "${MCNAME} multiarch image."
+HOMEPAGE ?= "https://www.yoctoproject.org/"
+LICENSE ?= "MIT"
+LIC_FILES_CHKSUM ?= "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+CONTAINER_IMAGES ?= "\
+    container-base \
+    app-container-curl \
+    app-container-mosquitto \
+    app-container-nginx \
+    app-container-python \
+    app-container-valkey \
+"
+
+inherit oci-multiarch
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('CONTAINER_IMAGES').split()])}"
+
+OCI_MULTIARCH_RECIPE = "${MCNAME}"
+OCI_MULTIARCH_PLATFORMS = "aarch64 x86_64"
+
+python () {
+    if not d.getVar("MCNAME"):
+        raise bb.parse.SkipRecipe("No class extension set")
+}
-- 
2.54.0


