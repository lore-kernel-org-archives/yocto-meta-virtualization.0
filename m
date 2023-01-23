Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55001C54E94
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 15:45:00 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.45870.1674488697211830646
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 07:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=rUf3mn7d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id a25so9923823qto.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MoMF3iK+f3k2xupC+CnFJkWGMWQPHcdCUJxs1MknGX4=;
        b=rUf3mn7d7ll/EVOxALdwdXZe0e9NGqbTqajS4nAWTrReE0tzbf2Ims54B4W/E3x9j0
         bX855uJJ7yNt0+91xt/N0QrBdiVCTE5rAPccAAv5wTPl9MJE57BKZzs2TxLnY3PtIu0/
         UAaus9baEEqmLwrNEk0s9Hdm40dd7AsX/ryLCY261VqWMxa8tataqDKqlT1Oe76Ch4mq
         vpZAYIeI3aZwKRRn7xmQljvrMw+lN9lq0Wq58P64bnCWwWjMszPIA4GK6BBJDrwx7jgo
         6mmSoiyZBqZtCvdPvJ/mdhbw33eMD4xbZBiZ5/bAcdH8tbZdONNQVTVuNmXaNXWta8Pw
         Bwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoMF3iK+f3k2xupC+CnFJkWGMWQPHcdCUJxs1MknGX4=;
        b=fiK0QEQGgEYGJWyJ/jtA/5Fkvzo2RyfQXFWq89xC/RUQSIwWm1JvoHpZmPcAjQ5JGC
         gRRwb6Bh34vFZiu2xBCTmPDn1Lib2E57Kg07Knli9ne6YRKxQHOeq/9AMtL9u1PvIFNo
         jYOvbf2DK7HG6xyiY3qdSjfNqhlCE8+wv+PPOSra391BK7h/o/nOcBH72RZ/9Nvu0rno
         iGhwDKqw9hs2ce0/A9NJMWwC/kWKSZ+lACEGJ5BaSbOHA4oPHdX1W3upwwKggrOHns+w
         6kbDZR+8JvFXlDxR4tpl/QVFKtcvhHEFRNZCiaWcB3SprfhXVJwzGzGwb+Nx95oAF2Uc
         Fb7A==
X-Gm-Message-State: AFqh2kpT/yjx+YpaJ0q5mWGKCKn1Mmr+pu4vslT8ZKg1kGrb+Tiy/uDF
	yGThBbpYrMyX3HTYDhr3N6FTKMObjzavK8aG
X-Google-Smtp-Source: AMrXdXtqjX/QbcHyFU/e5ublXNjv6UExnuIeb+MJ4ntWiEPTSVL2cBWbl/zfWYmiVDJWw74hF1sGPQ==
X-Received: by 2002:ac8:4c84:0:b0:3a6:a89d:9ee with SMTP id j4-20020ac84c84000000b003a6a89d09eemr33669812qtv.33.1674488695836;
        Mon, 23 Jan 2023 07:44:55 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id bn10-20020a05622a1dca00b0039cc0fbdb61sm11198916qtb.53.2023.01.23.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:44:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: meta-virtualization@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] xen: force usage of gcc
Date: Mon, 23 Jan 2023 10:44:54 -0500
Message-Id: <20230123154454.1514564-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7829

xen-tools and xen (and possibly others) fail to compile with clang, with the following error:
 configure: error: in `/builder/meta-arm/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xen-tools/4.17+stableAUTOINC+11560248ff-r0/git/tools':
 configure: error: C compiler cannot create executables
 See `config.log' for more details
 configure: error: ./configure failed for tools

Force all of xen to use gcc until this issue can be resolved.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 recipes-extended/xen/xen.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 5937763a7ddf..dcd281b5a21b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -2,6 +2,8 @@ HOMEPAGE = "http://xen.org"
 LICENSE = "GPL-2.0-only"
 SECTION = "console/tools"
 
+TOOLCHAIN = "gcc"
+
 inherit autotools-brokensep pkgconfig
 
 require xen-arch.inc
-- 
2.30.2


