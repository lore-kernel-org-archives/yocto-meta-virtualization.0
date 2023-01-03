Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A01C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 16:37:22 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.68274.1672763836173109209
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 08:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DuIRuY79;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id i9so44577308edj.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Jan 2023 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEtHFpIGLowj33Gdxw4K73gtrRNrVE4vrskHtyHtRXM=;
        b=DuIRuY79F6hhWrSWQlIPB9fg40hZ+JRwT91QSAAtHfOyBP1NiLGv7a+EBYvb6Uao/I
         WrXiyiIhhmW756eShCE5dMM6ndChBogxRlbk+nIqRxTeccgSB8y4SO89CHZS4AV7RFwP
         C854dYPTS0TqOlUHD5EP1m5PeLutN/TYMgTV5Fm4fvJ8M8DeFescmg8UNxYj4rTgwdfd
         fCOJ99vtJ5J7L/BtPi1JHOf99074b5Ze/dTP1ETMq9Be9WiQxBLRMKzxEfnx8OTIPevd
         8MJ3Be/0t6S7KBXW/Zf3ezenIsAlF9bab5dV1n3HYNL66vM/kNRLagOiNVuL5wIbYQn3
         Zm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEtHFpIGLowj33Gdxw4K73gtrRNrVE4vrskHtyHtRXM=;
        b=X4Npshvs3CPuvKG0WLeBHLRndASrnAptssCErpveZFJ7QPkRwzvjjjfz9jXvLLtR/g
         wqdScj40cnzA3UVLJFJ1IgsozidLMkss3hO6RKV5aT4won45Qo0Ddfd0Ge4Z884eoawc
         V8AQgSms/cQUn5NZfyNTPASUIJerBi/zldfWNnrnSYql9p14rpU3GyVldyhuhxGdo58x
         yF+PSQexaQaB+J8NwtiVPCB6RJ7mmVqc5v+7CEqNTEse5mvXqVoEMWS1PQ2iHnpCh12/
         5RQzWWFHPqjkv1Iz2goDSbBrvEMYHPyGZFA+M7aOzdHUtMk144mntIv7TUK2GupvAb7K
         ZUYQ==
X-Gm-Message-State: AFqh2kpz370ivGbAdynpq02+DpiVsTrTaluIT6L2SHX5A4EuZTXXuV0t
	wqzhaa8yGoCTbPBxlncFF3y5mtgWtPg=
X-Google-Smtp-Source: AMrXdXuZYgIHIs4i78z8zLIAkQ5j23eoJkGaZkDM6ctvnTm3+VCbiYQFhNyIpjTn1/bPNhW0YEvUnA==
X-Received: by 2002:aa7:c69a:0:b0:46d:e3f8:4ed4 with SMTP id n26-20020aa7c69a000000b0046de3f84ed4mr38920554edq.21.1672763834804;
        Tue, 03 Jan 2023 08:37:14 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906328200b0084ca4bd745esm5139617ejw.35.2023.01.03.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 08:37:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] layer.conf: update LAYERSERIES_COMPAT for mickledore
Date: Tue,  3 Jan 2023 17:37:07 +0100
Message-Id: <20230103163707.551471-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Jan 2023 16:37:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7787

* oe-core switched to mickedore in:
  https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f1feef9..10b457f 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -21,7 +21,7 @@ BBFILES_DYNAMIC += " \
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_virtualization-layer = "1"
-LAYERSERIES_COMPAT_virtualization-layer = "langdale"
+LAYERSERIES_COMPAT_virtualization-layer = "mickledore"
 LAYERDEPENDS_virtualization-layer = " \
     core \
     openembedded-layer \
-- 
2.39.0


