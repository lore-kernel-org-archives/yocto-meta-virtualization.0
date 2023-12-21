Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE3BC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:35:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.117.1703180091520162094
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 09:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R2LiBhNu;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so7483425ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Dec 2023 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703180089; x=1703784889; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcN0Tmiv8G0LQtvo2cPwS8xNbe861FfWTxeU8VIJG2M=;
        b=R2LiBhNuHlbMMi3tNznIvg0lFPia2sgMK5/cexB5QlcNJxq/x6k6MUaGeVAJdJz2Go
         DjrqvyM3iP89S9nq8AytpmHMYjU78vFfwaudm8iM98E5xFt3nCAQo2EnM9OujrqLJ5ng
         vR7xPCOlQH5cUprctUOpO1kyz1vhB3CjUES2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180089; x=1703784889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcN0Tmiv8G0LQtvo2cPwS8xNbe861FfWTxeU8VIJG2M=;
        b=DVmuxKIdll5c57a13HcgxFULKbM40oasFFFrhSJh/jCEKTQKWihvhabXcTsKk0pIgF
         VnuscckonXmh68KnJcRuEtN7OFp1ZDsRKaw2bLpRxlIVSiv0i15+jAX9C9pKQgIRacck
         OJ5OrKyt1GrvzXYgTG6giUDg6TM9Sbqu/FiKy4h5RbqArwweVQDU7N/BmUw09QG2249c
         Qkyq9DEcVsHrY0dSKmFfBOW+wUfzgbV39qIdD5u99ljirkmjXoaG/0MzQSgBpuz6CtQ3
         ltN18CEMGgsQvFOQS01mhxVIkQyrQnX7FEiQwew7v4hF+beAa/ivwynBK/VfvwzjIb+c
         aGWA==
X-Gm-Message-State: AOJu0YyfsEe+fXOV4zwVtyWGCs2mDRL5T4P3+bfXtGNwOljFq/EfS3FQ
	cN4UR1WiGD9MK4eYGrEuFFqYTb+PQi7zgpgiO00=
X-Google-Smtp-Source: AGHT+IEXkpzBtTFOyaIFS/X7SmzIR8z9QrNmEhuGmu5g1HYZy4twjkW+HeD9TVi7Y0QG1ceYP9R3yw==
X-Received: by 2002:a17:903:647:b0:1d3:f8c9:f301 with SMTP id kh7-20020a170903064700b001d3f8c9f301mr1719007plb.47.1703180089403;
        Thu, 21 Dec 2023 09:34:49 -0800 (PST)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d30d00b001d349fcb70dsm1904477plc.202.2023.12.21.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:34:47 -0800 (PST)
Received: by brown (sSMTP sendmail emulation); Thu, 21 Dec 2023 09:34:40 -0800
From: jpuhlman@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][PATCH] cloud-init: replace sysvinit/redhat with sysvinit/debian
Date: Thu, 21 Dec 2023 09:34:38 -0800
Message-Id: <20231221173438.3684990-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Dec 2023 17:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8523

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

sysvinit/redhat no longer exists in the sources, move to using
debian sysvinit scripts if sysvinit is enabled in distro features.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/cloud-init/cloud-init_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
index 9d84f47e..edc6372f 100644
--- a/recipes-extended/cloud-init/cloud-init_git.bb
+++ b/recipes-extended/cloud-init/cloud-init_git.bb
@@ -25,7 +25,7 @@ do_install:append() {
     ln -s ${libdir}/${BPN}/write-ssh-key-fingerprints ${D}${sysconfdir}/cloud/write-ssh-key-fingerprints
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
        install -m 755 -d ${D}${sysconfdir}/init.d/
-       install -m 755 ${S}/sysvinit/redhat/* ${D}${sysconfdir}/init.d/
+       install -m 755 ${S}/sysvinit/debian/* ${D}${sysconfdir}/init.d/
     fi
 
 }
-- 
2.31.1


