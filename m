Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F57C433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.5226.1649421256915708501
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 05:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lZu/3bth;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id k2so9871212edj.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBKa+3ABEHz1fqz3/cqwRCoQXWaWjMaFJ+M5G56V9ME=;
        b=lZu/3bthCg4lzUGbOl6QcIhaL4bl3p4ESLSY6ehP1NsumdKCrtyKE7ABw9eylzdQro
         Rt/DIbP0WBpaJ8epjcO9rxVJqeoF/sP6491V7pb9pyi3KiwjaP/rDdV08eteBp50dfTn
         +mVufjqRtTshxrr7fVITon2Ei4LaDA2kEX89XpjsAIMEBpJS2S1oTmdoP/f1Nr+XNdlX
         vMY92+GXjZ1e++qLjNsEsZuNOLXRt5jS6HO70n6pFBKuY0U7BhZywsovI9jmih9hbz6o
         T0d/DryuTT8yw6Bssf2CtU/c12anGNWz/Kjshlnl4i2vpJgD4K8bnbQUrgeijA9+ViuB
         DAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBKa+3ABEHz1fqz3/cqwRCoQXWaWjMaFJ+M5G56V9ME=;
        b=pxREj9My5aLcRbrn2Bvl6dh984GP5MgEWYEjEmWdx3dEVNQSE1Hw++GWF+IokpMBum
         rmT14mp3l+UGw3EMK5DNEyPlLuSNEqDT3ekz9KPKM7SpmcD3ZeM1YB9J7N8sW+pgVz4G
         sFhbCUfHF0aTURhvAmlLBiuob7zSkN8cQPBAwuHu/uLnapdIxhbJ5wvdFeuTGNOTNlUM
         QhgYv8rby37Tzo0uzNH3wj2nDrI3O6bnbNSy7bgsvAohkE61pGlhgM5p7vGCWNIhDXwQ
         ZxWFL07DahiLRIVLWO4V/GKuSQ3x7yX0SrGLXpgwGHtJIk+/XvICNln3xEAJvvxeojUx
         GRaw==
X-Gm-Message-State: AOAM533mHNyJ0ZOjivOhPWxvuRV+GDmicSzXMj0wyBsfIc3ed4iADO8+
	MPhDXtE/jpBOYsbzRqOO/GyE8TOIlJs=
X-Google-Smtp-Source: 
 ABdhPJzNXzELgRTnwncnQ3pZJrt+MxF+BZdy/06e+5vfBIPmUoYit8DfQYSvvtRVILH278+qbIbHLQ==
X-Received: by 2002:a05:6402:c9b:b0:41c:c215:2cce with SMTP id
 cm27-20020a0564020c9b00b0041cc2152ccemr19407122edb.388.1649421255104;
        Fri, 08 Apr 2022 05:34:15 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 e22-20020a170906505600b006da7d71f25csm8647808ejk.41.2022.04.08.05.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 05:34:14 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH] k3s: do not use a go file as patch
Date: Fri,  8 Apr 2022 14:33:46 +0200
Message-Id: <20220408123346.1493384-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7134

Compiling k3s failed with:
do_patch: Importing patch 'github.com.andreyvit.diff' with striplevel '1'

The problem is that github.com/andreyvit/diff ends up as github.com.andreyvit.diff
in the download folder which than matches the test in patch.py.

Not sure how you create this huge SRC_URI list. Probably it would be the
best to add the apply=no to all urls.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/k3s/k3s_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index e2a3ffc..53a8677 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -219,7 +219,7 @@ SRC_URI += "git://github.com/alexflint/go-filemutex;name=go-filemutex;protocol=h
 # github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883
 # [1] git ls-remote https://github.com/andreyvit/diff c7f18ee00883bfd3b00e0a2bf7607827e0148ad4 
 SRCREV_diff="c7f18ee00883bfd3b00e0a2bf7607827e0148ad4"
-SRC_URI += "git://github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/andreyvit/diff"
+SRC_URI += "git://github.com/andreyvit/diff;name=diff;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/andreyvit/diff;apply=no"
 
 # github.com/andybalholm/cascadia v1.0.0
 # [1] git ls-remote https://github.com/andybalholm/cascadia 901648c87902174f774fac311d7f176f8647bdaa 
-- 
2.35.1


