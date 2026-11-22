Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38199.1795372172148175437
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2026 10:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dRDBJcqf;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1401311a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 10:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372171; x=1795976971; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtAREggWko4Q8yQRoeXwhMSYkzuONFJu0tGhUX9MtoA=;
        b=dRDBJcqfjXXLqBztX4mf6Rep7lpUGyhdIr9b45cPk5rZ+yn4+Ol5uUBi72pt7BxzWE
         gcss8lRyGXLeDkuz3hRJuNSvnqNUHnkNaQHysIjUdao0ACbiK13/1BBpf/Cmbg65vhPA
         6fcXccCy4n4n5vcbku7rkXfh0hNHPNpCt59NLD3Z+B2b+yZNPmjyXSMlkjJ9Q0A3H3DQ
         bURAyYK28G6S32PeVrzb0U1H/d/jsCSieruP1or1A2xGtGTtQCFrfyweeBZTDagbJtHU
         45KVSpuKdwag4MioDLP+Di5s/ki6hjm3DuSAvWbion98eP0HQag9t2I01kkQuQku3icJ
         WObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372171; x=1795976971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PtAREggWko4Q8yQRoeXwhMSYkzuONFJu0tGhUX9MtoA=;
        b=OpL87VsnxwRC5mVGfmQbh8uPPQPFTZ9eN5KKIBCtl56CbtP7Wu4QWROPPUspGzB/cb
         FJbmm95iVQG/SZuaqxDsd+zKZft4Lfi9hg5UjK/b4yYEV6EhuDOYGMf5LiNME0ZI4FHa
         kq+hlsc0GhBdgpF2PxvgxsGx9MPs26lwrAFwCz/C75y8hhiAECdjy2oZYEvjMlj6yeOH
         JV/6MqDkBiWkPnqe6ca399LeIRLurwdFyvPGf0czDeNGcpeu/pbnzHgw/iRoJhNin13T
         /GBytg73vmLhiAB40nFUMESdo1c/d6QFuS9S/MoCQY6982xuOhBEyhxdYPiYDiEvodUc
         nFLA==
X-Gm-Message-State: APuU4Z+rqHCvXgl7mrxe74SpBxH7VjOwvEz7pvTKZPwtrL5FnRUosQKD
	rxsjOQjincnVhKHrbBxlT/WrPrKfsSudjZVoyiYNITM9P0fCpW30VpV8FJwXJOK1
X-Gm-Gg: AZFdTZeZjFenGtDOgBfMjtH5xKLB0n54gyYsugdFf02lDjngHs+9O9fI2af2fhbDNWP
	jR31H3/0hAehGPtYjG92CKOiVMrZVRESAhFzgx/PaPzeNv8lkl/b9XUT7Yhc1f1hJmGQ+EnVZEO
	I07lnYnA3RkB10WRAWT85amNqzrte7coK7pELCudtRSE5f+DqcSg7Q7wlCV2cNaxgYrTrPwb/0Z
	+EJstDn2lXRnW8XWNymwo8ARdQZFxunrgUYwoeHt2FZGQGjBFi+li2Ce9liWRXxgZN8zkqwt1tu
	62CMqthT+SqPPXAPImUkbId4oqDpzNuPPIWi/TUjLwHpybrdNzn5wJt7YzvZh4uxXIh20NVp9PE
	BCiwf4/AiiAkHBk+Cbw+7gIFV1c69cdMWQDJQS7M9cV58IHVxMxVaCkPo+dfemyA+uRcyLBSKkr
	rS08wb4nB1kZ8AkxLl09mQ9zqR3jaNd55jLNQ8EnL6f30vKde1kxQ1GUxkLvd8AHn6xmgSn2uET
	E7vNPP+t2u4rk4hH/5SSfOiCKWnwn4tqFkbcFJ5pJiM80Hp+JoUsClHZBE8qcuAGJfnFjw8RKmc
	BOvP1WuaBzCrI/akHWmfbMFMJujsR+tf580Xs09niYmKNcsErjct/xtTE1hi5rpuVT1cHPKwSUt
	lpj6j4YACRirPxRdS9+RmTWzeP6HspSKZZXvKP+opuRsKk3k=
X-Received: by 2002:a05:6a21:8903:b0:3e1:549d:eedb with SMTP id adf61e73a8af0-40145f2bd15mr7520973637.0.1795372171227;
        Sun, 22 Nov 2026 10:29:31 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm3882952a12.30.2026.11.22.10.29.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 10:29:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 1/3] image-oci: track multi-layer rootfs directories with pseudo
Date: Sun, 22 Nov 2026 10:29:08 -0800
Message-ID: <20261122182910.35849-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122182910.35849-1-tim.orling@konsulko.com>
References: <20261122182910.35849-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 18:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10176
Content-Type: text/plain; charset="utf-8"

oci_multilayer_install_packages() installs each packages: layer into
${WORKDIR}/oci-layer-rootfs/layer-N-<name> from the do_image_oci
prefunc, which runs under pseudo. That directory is not in
PSEUDO_INCLUDE_PATHS, whereas ${WORKDIR}/rootfs used by do_rootfs is.

Since oe-core moved to dnf 5.4.7.0, every layer install fails:

  error: cannot open Packages database in
  Failed to load system repo from root ".../oci-layer-rootfs/layer-1-base":
  rpmtsOpenDB failed: Invalid argument

dnf creates var/lib/rpm in the layer rootfs but the rpmdb is never
created, while do_rootfs of the same recipe installs the same packages
successfully. The rpm macros (%_dbpath=/var/lib/rpm) and the
RPM_CONFIGDIR/RPM_ETCCONFIGDIR environment are identical in both tasks;
the only difference found is pseudo coverage of the install root.

Add the layer rootfs base to PSEUDO_INCLUDE_PATHS, the same way
image.bbclass does for MULTILIB_TEMP_ROOTFS.

Tested with the containers-library autobuilder target (aarch64 and
x86-64).

[YOCTO #16531]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/image-oci.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 141cd2a8..5c9ef0e6 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -69,6 +69,14 @@ do_image_oci[depends] += "jq-native:do_populate_sysroot"
 # Package manager native tools for multi-layer mode with package installation
 OCI_PM_DEPENDS = "${@oci_get_pm_depends(d)}"
 do_image_oci[depends] += "${OCI_PM_DEPENDS}"
+# AI-generated (Claude Code, Claude Opus 5.5).
+# Multi-layer package layers are installed by RpmPM/OpkgPM into
+# ${WORKDIR}/oci-layer-rootfs/layer-N-<name> from do_image_oci, which runs
+# under pseudo. Like ${WORKDIR}/rootfs for do_rootfs, the layer rootfs must
+# be tracked by pseudo or dnf5/rpm6 cannot open the rpmdb in the installroot
+# ("rpmtsOpenDB failed: Invalid argument"). Same approach as image.bbclass
+# uses for MULTILIB_TEMP_ROOTFS.
+PSEUDO_INCLUDE_PATHS .= ",${WORKDIR}/oci-layer-rootfs"
 
 def oci_pkg_type(d):
     """Resolve IMAGE_PKGTYPE with a single, documented default.
-- 
2.56.1

