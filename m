Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5173.1795654086735574225
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 16:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GL9FDgPA;
 spf=pass (domain: konsulko.com, ip: 209.85.210.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso2648166b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 16:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795654086; x=1796258886; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Et3/ifv3n1NYBH6wJ/hL3VtlFL5MxzGlialxCCIv9Eg=;
        b=GL9FDgPANEuLVQ0iqBdfr5FsA9UMJH2l8Z2WyAgp+nDU1Jn7xvuAOZFsKzQw3+/73k
         VX09j2eqYm3p4uHc0a0v2Xi6AHDFEnCWenCTiMtcjy4mIbfKJ2OW7uvCUT9ifaeMFlIH
         j2SPfQsd+X8cdPeyitUL4uZAjYGjSC9lHnZiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654086; x=1796258886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Et3/ifv3n1NYBH6wJ/hL3VtlFL5MxzGlialxCCIv9Eg=;
        b=NwP6Pb9OnO8vodRr3EysYiJ+XU6wGzu1jTem3/yngvBGwIdZi+PVutFU3Awoubtkrq
         iqv2o/a7GS+TX6RPRkuti3xiIx3WKvv67585EPdhIPx3ORmGqT5FT1dS9jEavOin+KRq
         X3HtERdkeRXTWZKFESWgC/baD4OV9IEcmhaPWhIxy0vmq7pCx6NbmirynEscNY7S9Bm/
         QNSb8duo3+T0WvYXbrrWgJ6TdJiOFZ0lKdahxnWOd9dkMY/6/R9fe+oF5GH4CMVSkLvU
         yaYoYheQgiJzgimz7xM2RM8DbBWOX+tsRHtL1mepk0ISnuKskQNsc0D1T4xmQFBukiqO
         yMKg==
X-Gm-Message-State: APuU4Z+TzZoLN03DxEliN5wZP/1RsMYcdsODwxpciHLu2WD9D2IB1S5a
	pPRSQuLY8NYK4X9O6zbMNfPReZg4L6b3uawYlHRtc+ad1DHUUBIHsvpwPxIjxgTAyVXgBsJWhqe
	nj4pdpFI=
X-Gm-Gg: AZFdTZc4w3Uc4riWI+Cpzjo0H65yHOer1w21H4lKbLVGvNLh+0GmVLHdOfWwLWQPTsG
	efbmf/pDX5kx81wJz68kdGlx11lCTthxgUSp10xBpO8zSaanbPbC52VJVcSpJrqHMQDjnD3+lI3
	E87mQ96FaXmG/Blek10Nvl4K1KHlEpq2Ej/ayRWhNm1h1Yx7wnpslMi9J7Qm1PdQ+bioazcxFIk
	/abgi37+3P/e0/71uwfgN1nwJGBxQ7SV6+XhlbQgpf1cW6LHU0HktdDRqCFjQ7W91kINrEvXD88
	NUFtS8K/eebnBjML+T5KaexsZmi1ZkOskEzlnEEOR08jQq/cUTDrXVMgv1IoqtHBYABbNVX75KU
	DwHDGOcXJT3znzj6ySq04sEUTwc+lzuA2l6CEgum+/1RkO3GdNlEgqQPeub7HYzu0XNcQLoBrHl
	Dd5HYwjDOZ6CgqqR0IueSVP6y4pNeBRvw6q49eswHa5CLtljradoSTDmF22ObzIbc/Ud3HMJIOg
	dr0pgQbbr6Duz+bTORkn34tMieo/aqGHnSxe5qSq+uiitGXB71hW6yggGry7VpHI5Rz5+KNMKi6
	3AFQru4JCATN6mjW3aDgtii+N01uWsFp44yQkrte0Zoa7dUIzXVs92BngT1PifyLJCn8mGJOQWS
	eDHOlURap2ybdBZxY/fQp0EJ9mRBgRg8KgYGPB3ctTZhVUDXfqcYfvc+JRR6N1mbEkag=
X-Received: by 2002:a05:6a21:3b8b:b0:3de:b120:bb8f with SMTP id adf61e73a8af0-4014e5560ecmr19807874637.50.1795654086075;
        Wed, 25 Nov 2026 16:48:06 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm1028481a12.20.2026.11.25.16.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:48:05 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH v2 2/3] container-volatile-fixup: run after empty_var_volatile
Date: Wed, 25 Nov 2026 16:47:55 -0800
Message-ID: <20261126004756.89781-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126004756.89781-1-tim.orling@konsulko.com>
References: <20261126004756.89781-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Nov 2026 00:48:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10190
Content-Type: text/plain; charset="utf-8"

image.bbclass inherits rootfs-postcommands with inherit_defer, so its
"ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile'" is added after the
recipe's own "+= rootfs_fixup_var_volatile". base-files' fstab mounts
tmpfs on /var/volatile, so empty_var_volatile then deletes the
volatile/tmp and volatile/log directories the fixup just created,
leaving /var/log and /var/tmp as dangling symlinks. Multi-layer
directories: layers then warn:

  OCI: Directory not found in IMAGE_ROOTFS: /var/volatile/log
  OCI: Directory not found in IMAGE_ROOTFS: /var/volatile/tmp

Use :append so the fixup runs after empty_var_volatile.

To reproduce, build app-container-nginx (OCI_LAYER_MODE = "multi",
inherits container-volatile-fixup) and check log.do_image_oci for the
warnings above; ${IMAGE_ROOTFS}/var/volatile is empty.

Tested with the containers-library autobuilder target (aarch64 and
x86-64).

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/container-volatile-fixup.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/classes/container-volatile-fixup.bbclass b/classes/container-volatile-fixup.bbclass
index 98c86b97..cd186b97 100644
--- a/classes/container-volatile-fixup.bbclass
+++ b/classes/container-volatile-fixup.bbclass
@@ -1,5 +1,6 @@
 # Workaround /var/volatile for now
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile"
+# :append: run after empty_var_volatile (rootfs-postcommands, inherit_defer)
+ROOTFS_POSTPROCESS_COMMAND:append = " rootfs_fixup_var_volatile"
 rootfs_fixup_var_volatile () {
     install -m 1777 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/tmp
     install -m 755 -d ${IMAGE_ROOTFS}/${localstatedir}/volatile/log
-- 
2.56.1

