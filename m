Return-Path: <dylantdmt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8704C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 22:25:42 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.133258.1669674332827207232
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 14:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=atCRs7G+;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: dylantdmt@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1432a5f6468so14843958fac.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9e+SK+U142rdo6eu6hcnzxRiImDyrvmUMOKB3YNfJmM=;
        b=atCRs7G+s9OwRnAisJ3aWRvM/VpagMoWTasPt07PM0eEQy/A+j5uRBLbNhrZ46OOpm
         cyf6CJwfz3DTvq6xKHJOpD4DsFu3u4zBrFM+srRnJY2H8z5JsJa4S2tPXk2/2kaJN/K3
         Gm0EbXpCWf06z49e41UUI7ytIHqpaR3TWUYEH6T81CpAcrQ4iSHfybj6ivMD3jwbNbtc
         Bi4S5GfM8txOOQY+w14TMcvgw49u5FplTleNPJMWVs5jCDCpHM7Yu8i5v/GmAqYm8c2V
         AAIpZie8hWmVWSJp7YSb7IeJ+bcvnnF1TWeQHTwAKsVV/lWbIv5MKc8fVL9lDvUzSmv3
         YKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9e+SK+U142rdo6eu6hcnzxRiImDyrvmUMOKB3YNfJmM=;
        b=OkhULH+wWRJ0ilK0etznreKV4TSrr86+cJ6ISOoCGzjfdOL8AGdqZCt4mjsdAjHtHW
         ye0T5jErB7fsXzmbP6mHGUAFgCoB1IO4aKHiLMG86+JzMuF7aBDpdUAL0xG+Us6V+CPQ
         OSobq/wpgzxJGWSYzuI+NzGUBUKKxVzqiGNBkVpZDOF3X4oex0XUDfeJLxJ0fk5+skvZ
         9wAi8sD8DD7laiKf/ObFjRqRWKW0BfjgUUVHdJBchOcF5npvEnmpktAJNP3bsJFtqFL4
         /EP1+Mho8lprhfbDjksLpLfyjRdPpfmVSynLPfjg6slv+8tq/v8fq3qtEyUSeevkVMIG
         4o3Q==
X-Gm-Message-State: ANoB5pmrxA8q+VJcjvlThvl2YajtjxTle6MghtWUUGdAGlMlMwXVxtUv
	tPi29ZE1Wg6S/Zg0MFC1m2L3C85ANtg=
X-Google-Smtp-Source: AA0mqf6K7F4YroRYq9oM/5n3K81IG1xI5nY35JlhBRH13jG/cnGVtWMxl6sh2XTH0bue8diy7XaLaQ==
X-Received: by 2002:a05:6871:410e:b0:143:7889:c525 with SMTP id la14-20020a056871410e00b001437889c525mr9320569oab.171.1669674332000;
        Mon, 28 Nov 2022 14:25:32 -0800 (PST)
Received: from dturner-linux-box.ni.corp.natinst.com ([130.164.62.28])
        by smtp.gmail.com with ESMTPSA id f15-20020a056870c10f00b0011bde9f5745sm6497732oad.23.2022.11.28.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 14:25:31 -0800 (PST)
From: dylantdmt@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Dylan Turner <dylan.turner@ni.com>
Subject: [PATCH] qpid-python: switch from distutils3 to setuptools3
Date: Mon, 28 Nov 2022 16:25:27 -0600
Message-Id: <20221128222527.13035-1-dylantdmt@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 22:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7701

From: Dylan Turner <dylan.turner@ni.com>

---
 meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb
index 9db46859..3a486b4f 100644
--- a/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb
+++ b/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb
@@ -12,4 +12,5 @@ SRC_URI[sha256sum] = "3ca55a5aa11fbbd4e26cb4cdafc9658489c159acadceac60c89d4bfb5c
 
 S = "${WORKDIR}/qpid-${PV}/python"
 
-inherit distutils3
+inherit setuptools3
+
-- 
2.38.1


