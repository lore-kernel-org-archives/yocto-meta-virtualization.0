Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web09.4249.1615524721507282973
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 20:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=DUUMg8WL;
 spf=pass (domain: flex--rburanyi.bounces.google.com, ip: 209.85.219.201, mailfrom: 3cpnkyagkais6q96p2dxv33v0t.r31@flex--rburanyi.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id f81so28176049yba.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 20:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3m70Seym/wePKwste5cveaqSqTV/TkdLs2cJlqFb3QE=;
        b=DUUMg8WLzwNCFQ4SRNqwET6/8UmyZsWEsuaAt7p+DKjmfUDHFAZKQUPhRcxS+LSIl9
         W8VGrnHjR1dR5t4sPxW+ejlpEVshBLJnKigOdJwwCZogWfevJkLiZUED6TxoX7OebEDh
         iJuCd2Fm4gIraCYFwABZgM1HiGhzdDij9VYR5Y89/xDaX1vkeajFoHIIwwmnEpbskrIG
         pV9kE78HStjC9I12J0RC1Q6Xd0TgtgSaXMku/zmCKWYkG/qigZ/yHcCTiRsgrxA6w6uc
         MgYwLP08pYUnBhE4Rsz1kL6Y8Dwq2YUHRsq16y2Fyf4ESbNDTVk459Tj0szDLfoaC8my
         EY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3m70Seym/wePKwste5cveaqSqTV/TkdLs2cJlqFb3QE=;
        b=hzjISe/noDMCkx5X7ufsvkN8FkYJcSHTP6zL4hSW4WinxeKrrAxINMYvDGIvey9ksO
         AUrTho+fW8gqclmwAVbgrnyuxOyQMtMT/ejtldi3dW3me/kmv5Dt/S8gtPvzA1y7wBUP
         M3+nnkEp4QzOQ3E+z/v2YegksG85INTMb8cR2hCSz5ZGKJEoTHtO8YZhYgj6D2SA3Z9+
         zOJrHYEZNBwFFYiL8way8JVPB3OPReZWS09qtBPqxc6s94q2NgEsgBwNsqlAaMtf+zmX
         gwPr17EhB7E1yLVYNqmKtQ74hgDoVeX9CedDyiniBXlUhlC/CcmDeXHqQqTiMImpsxQR
         cHUQ==
X-Gm-Message-State: AOAM533wnLPbKhS6I9NkJ9VZOtRDQtOF2sImdnzmpJWSkgI4xgPD1jvK
	eKSsoe4Ydhz3RsiNvdxQl06GHydDCS6Zt3MCjJxzs4Nfsm9VPDTnWC+bV8U3Js6ZSKjqabqs+8n
	U/vB7QZ23YKcnmxEQZDDn4BYYxptLR+ai4Bv9JWxo0PaMzv/QtTbHpzoQ7ttVBqTZ2oCLH5fM4L
	0wOwFAhhPoKO24AeewYQ==
X-Google-Smtp-Source: ABdhPJyaH3vaHGU7U/aidXuvr/wd0RCHwX/CcM+Qw/54DCdm9Kp9jAySGY+9eLTKJaxzVy+XB4zofWRNIIldpA==
X-Received: from rburanyi-linux.svl.corp.google.com ([2620:15c:2c5:3:f08b:e781:cc76:369a])
 (user=rburanyi job=sendgmr) by 2002:a25:1883:: with SMTP id
 125mr16116655yby.465.1615524720106; Thu, 11 Mar 2021 20:52:00 -0800 (PST)
Date: Thu, 11 Mar 2021 20:51:55 -0800
Message-Id: <20210312045155.540266-1-rburanyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [meta-virtualization][PATCH] lxc: change download folder
From: "Robi Buranyi" <rburanyi@google.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Robi Buranyi <rburanyi@google.com>
Content-Type: text/plain; charset="UTF-8"

The URI has been changed to 'https://linuxcontainers.org/downloads/lxc'
by the site maintainers recently. Updating the recipe to reflect the new
path.

Signed-off-by: Robi Buranyi <rburanyi@google.com>
---
 recipes-containers/lxc/lxc_4.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.4.bb
index 4ef5fc0..637846e 100644
--- a/recipes-containers/lxc/lxc_4.0.4.bb
+++ b/recipes-containers/lxc/lxc_4.0.4.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.31.0.rc2.261.g7f71774620-goog

