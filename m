Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5170.1795654081924675781
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 16:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UV9lgfwz;
 spf=pass (domain: konsulko.com, ip: 209.85.216.46, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso2871036a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 16:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795654081; x=1796258881; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdobr/GV0cx+MeV5R7mmSYxRgKogZcCtkY5KHPSpshQ=;
        b=UV9lgfwzDV0kWAQH0gIjOyUxn6qPs6qIiT9aGDWsVdtbom3/Vl/PNLxYYz1+VJ9JD6
         TSVr7xDTnoRsW4eHo48sQjLnO1WqnI5RmMhLmccK9gzJ82I8bJbt3oR/ZUT3+ejvvORn
         BTuSgw3+HMb4V3TmNtSrYD8Y2kA8IjS1Hai1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654081; x=1796258881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdobr/GV0cx+MeV5R7mmSYxRgKogZcCtkY5KHPSpshQ=;
        b=uA9Jxjg90YGTnW0PWfLnx1crSMVy9IGJVqYddeRuCOPGZ1OIo1WUHlqM7vGwPy69Uk
         t9NHSpcFieL0RZ1ffm5R85oS1QhK4M3v+Iy8lDH54Y9Yxbvx8RIDR0WZdo3L0UnjbvKC
         zFZ+TUnd81gkbVXfL7rcgQAFUz6PW/yg/v1yyZMtFh3BCPrJD997oek8hkobdlH9f9al
         2deaqXLIDcX7pSLqdRM/hMizOQV397d1qVn7qvDGUwOEzDOPixblCHg4RHvmTJIQZVbs
         Ed9kyPoRjDvJQ03zs5LrMgR9Rfmig+CsxBBEdIg2Wf4X0Kf5DrCI7c8YgLF1CW+HxaK4
         7RLg==
X-Gm-Message-State: APuU4Z/t5UHu+SIVCXGU5UUPFbDNl/Bb8jDj5JhXd6h6AqkMt423KeJb
	ahGwh3FO16mn8UcAFSAmccFeU523ryT1g321QWoBMZMj/gs4FEoOqAXfk2leEQ3C2cQ2y9mMOxT
	zP8MkHtg=
X-Gm-Gg: AZFdTZeRTvshUEPQ6PXioboX8hG8lz81Ofm4LWho0I/hJCF0fmtadZZ9Ey+uVIinupe
	rwkBpBCnjfaSAU/q/JKk3qW5tRVjE4YQE+b1wd14v8PgBi7RoUOAO5w/UHq+uamu3huEhOPO53s
	EcoB61AUFsf8RB6EXW2nyghKXbVONAHPscOUl94QDq/Xhqf6mrpkRAKReHmInu4aTrwJyWmF8VB
	RszzdpN0tZw70XFzC/aCYnqOpgyklFbA8D3jclpd8es9/KhIuJ6MjIeJcOLDM3pFqxIOiR8RMI5
	Wb7UpB8QLduhblObFIdB4o+SpL0jAKYxX9izcYPrmjUHYf46ZLu264ZUgu6pHv0/7YzN8aW8kU9
	wo5r1qCAjbroYgoX8uscO2IOY63zsbdgJx1juShQ6IEKIzYDDmxfKD+VVwu/UHLqDxoZtClU6Fy
	RaklpthmPzis4ll5BO0+pZM/pKY5geACEX3hFmDNABIK5sNWH8TRTDj+SAJmUpPlOjFFGeCKBdn
	N6jOV5HBwbaHT9hkiRqssM1EeUClQs8RXiqPFgHFsotxr0xaPcL3JmlwbU6tqh5sdnttGTpOER6
	v6NWNBkhxWRxoEWyVB4AGfDsFkQQpxd5tlJwfaK/EL92asV3k7H7YYalH2asq/iw+OftI8T0qkP
	HseCdZbHu6ZwZEWrG9Z8kcudjFyNZWmegoiY81xZH1yWW6K98EKTs6AvEkA1yL3IuAw==
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr18912384a91.23.1795654081072;
        Wed, 25 Nov 2026 16:48:01 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm29533176a91.0.2026.11.25.16.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:48:00 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH v2 0/3] OCI multi-layer fixes for dnf5 and nginx
Date: Wed, 25 Nov 2026 16:47:53 -0800
Message-ID: <20261126004756.89781-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Nov 2026 00:48:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10188
Content-Type: text/plain; charset="utf-8"

Since oe-core moved to dnf 5.4.7.0, every OCI_LAYER_MODE = "multi"
image fails to install its packages: layers, because the layer rootfs
under ${WORKDIR}/oci-layer-rootfs is not tracked by pseudo. Patch 1
fixes that.

Patches 2 and 3 fix the long-standing "OCI: Directory not found in
IMAGE_ROOTFS" warnings from app-container-nginx: empty_var_volatile
was wiping the container-volatile-fixup directories, and nginx's /run
and /var/log directories are never created outside of boot-time
tmpfiles.d.

Tested with the containers-library autobuilder target (aarch64 and
x86-64): all containers build with no warnings.

[YOCTO #16531]

Changes in v2:
- Patch 1: the commit message now explains the root cause. Under
  pseudo, rpm sees uid 0 and chowns the rpmdb directory it creates to
  0:0. The layer rootfs is not tracked, so that chown is real, and
  bitbake's network-isolation user namespace has no mapping for uid 0,
  so it fails with EINVAL. dnf4 ignored that failure; dnf5 does not.
- Patch 1: also explains why the layer install cannot run with pseudo
  disabled instead: rpm still chroots into the install root for every
  transaction. That was tried on the autobuilder, and every package
  layer came out empty with "Rpm transaction failed".
- All patches: no AI attribution in the code, comments cut to one line,
  steps to reproduce added to the commit messages.
- Sent with the konsulko.com address in the From: header, so the
  author survives the list.

Tim Orling (3):
  image-oci: track multi-layer rootfs directories with pseudo
  container-volatile-fixup: run after empty_var_volatile
  app-container-nginx: create /run/nginx and /var/log/nginx in rootfs

 classes/container-volatile-fixup.bbclass         | 3 ++-
 classes/image-oci.bbclass                        | 2 ++
 recipes-containers/images/app-container-nginx.bb | 6 ++++++
 3 files changed, 10 insertions(+), 1 deletion(-)


base-commit: 89b00d096a432000766729cd721ae647af500112
-- 
2.56.1

