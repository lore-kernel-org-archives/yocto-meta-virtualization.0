Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE1CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 20:12:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79069.1781295151148297911
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 13:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fskZarN2;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36da8439078so1238320a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295150; x=1781899950; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxsigBDPkb9G5kyNMQCFN71HguSITZu/hJ1aHPJU4N4=;
        b=fskZarN2295E8bgx1VgGvKR5YiQayL7a/5wkV8C1/xlFrEIO/sB+GddxquhacTucTG
         q+wmnhMFoxHvnDinbKpT5lljwpqFH9e9nuFkyY36bAmzHuADeo1hMIdsqDuqjBV+kJzT
         4w4Rxz5q1hYn6d0Eh/g72pALNgWdVJ4IaPRVwQiNF1X+Vko6ethRCULacHBc5kwSHB4Y
         XB+YW3K0wrgd4zd5B0DK2Z5Y3UkQQYedi6G4ZrkS6F/7UKcjDp7bgkn6aWB0hzAK8GeZ
         n3GYMGHBUnxiI9f6266MBIQ6Vriml1/M1f3YCjRnqQK/5bZjiGU8XCEPaVe2+9TQ1TuI
         t2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295150; x=1781899950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxsigBDPkb9G5kyNMQCFN71HguSITZu/hJ1aHPJU4N4=;
        b=Rx3VSQpGEWZ4D5Ihp7RYa+n7hOpVjlCnYlQyhocisRZxRhDXHNB8DU6mf7DqZe4PI+
         x7PGlJYf44tFYCX38RtE87e8SEkff4031jEYMqqskBA00YTLs39gIVPakfo22IQqcS1E
         XEB38fobNrSp/EJRZY1yzolxje/TJWvY9mMmTX3yQFoEe2MaVhyJprQPb6NqFBTn+X2P
         EDwZ2mrBUgqZmagN1fLKgLo1iwrf9YQIkm2d+ozvLQ43HNfFcyJmNlkMhGqCGvxrB3+i
         6brmOneA7tuKnMxYxlHgS6RsJv9Dvesemv4VYyDiDuqeYOBjqFKFaXLkLLvjLScu5wyw
         nKkQ==
X-Gm-Message-State: AOJu0YwnGE93In9qiSzLUOIT/XLnuJyVBHogegl6OGJMKaOhsJInnvGL
	gE+PrODyq+PTdnp2o247OB6RBa023yoHFL9GzPW7OgVpprJqzb6yhk1BK0Kn6w==
X-Gm-Gg: Acq92OHLo4m3mY/vOYijilZnVNQMzh7enLmdQE9XOrW5pZLEK7qcimBb1Krc194hR7X
	0xhm4Fcfm/lrpEqidj23Ambm8olGmDaBt3a8cfKS7IRV9m8DYjdj9PlaeIP8gvNxtZHrSvIRn/C
	+byyxf3aKBhC4NSNNfEbSxWMhycgyKSK2f8paop2ARsiPFrKm7iO16msJmSpu+LZATqzE2+hsqD
	rVk0xOkxrWGEWlgBv1yPn4WE5uqTVH2I5YlVHmr6MB04GtkpcGlFmzBW6GVm6y/a6y8uYSAakvm
	0dJvERt6pJUJqtXLLoyqCHZN6k27Lh4gmGL5dxk+EzZIV1MK1QJo3/tWM+IQgQoVslZgY9NFb0i
	EEvI1vTpk8gHQl4uR9fKoKuH5iyRpoqB9bT/w8x00rE09DeWH0JVbiBmbzTduoX+Rapt8bXJD+V
	fdIlKuV/4NOMkyvPG8S/pZHJcHtcrWLC0+v7HjX4JyFN1wKiCUU6eTiwJv7CTH6hEGGDjMxpQ+h
	iKmxWTMNQJLQY+51bwLPq4=
X-Received: by 2002:a17:90b:3851:b0:36b:a0fa:ff96 with SMTP id 98e67ed59e1d1-37a036ea1aemr4316961a91.12.1781295150360;
        Fri, 12 Jun 2026 13:12:30 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd66fsm3675884a91.12.2026.06.12.13.12.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 12 Jun 2026 13:12:29 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] vcontainer-tarball: unset OECORE_NATIVE_SYSROOT in CI
Date: Fri, 12 Jun 2026 13:11:50 -0700
Message-ID: <20260612201149.67662-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 20:12:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9883

Add 'unset OECORE_NATIVE_SYSROOT' to the end of environment-setup-ci
for the same reasons it needed to be in environment-setup-none.

This fixes issues seen on AutoBuilder workers which use buildtools-tarball
and also usage of oe-run-native (e.g. for skopeo-native or cosign-native).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/vcontainer/vcontainer-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/vcontainer/vcontainer-tarball.bb b/recipes-containers/vcontainer/vcontainer-tarball.bb
index 7e59c77d..f943cfd0 100644
--- a/recipes-containers/vcontainer/vcontainer-tarball.bb
+++ b/recipes-containers/vcontainer/vcontainer-tarball.bb
@@ -451,6 +451,8 @@ ENVEOF
 export VCONTAINER_DIR="${SDKPATH}"
 export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"
 export PATH="${SDKPATH}:${SDKPATHNATIVE}/usr/bin:/usr/bin:/bin:\$PATH"
+# Clean up - unset to avoid confusing other Yocto tools' >> $script
+unset OECORE_NATIVE_SYSROOT
 CISCRIPT
     chmod 755 $ci_script
 
-- 
2.54.0


