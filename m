Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9D2C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 08:00:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.37933.1670832000206915502
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 00:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nrGs0lCa;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id t17so25853015eju.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNf9iD9CX/6dY3jO59OY2rooA8OdbaJIcig3hGbEAUs=;
        b=nrGs0lCarT0HLul3/CPKfZWYZ39K/Snq4dcOwRNz+bUtnHescmNdVJoLVPYCZ/xaxI
         /9P0uLqTZNLUtarAxoBDH72hOV6zY2vvBIReq49BvXi5nZAjvnvORI96xtRc22H6FPEj
         LshgA10i1PHBzlwUZ4H6gauXjG7xV26T7etnvM+DNop4Wweq6USy/I2JjujMjXObhWiE
         rHFWLv96R0Jn2O7aq3/Rh9KJUwBfWBYx4PhSNDBuN0rRdQhgZLnos9g039hfv6HifmT7
         Wk74vPfH1u6/tZBC7eSaN5J/15NrayXFOzZ6NDy7+nINmkJe0BxMiwfjQTU6ZV1rLFCF
         F4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNf9iD9CX/6dY3jO59OY2rooA8OdbaJIcig3hGbEAUs=;
        b=PUF7Fmy7X8iCJaG74rMvQ796zVO+ZRkyrcFwQadTjEQf6HrENFY63E19nvhenlcsSw
         OvY5GltRCPSD3moTZM/1qR+Jm+YHPOF8t5A/NA33NhRg8oN/pJtY7W5FCyVoVLT40viY
         yl+UprXCmDPwyGyYzFjaM+h8uhdlfKTje0aiqdQmm7fateDi1Wp78XxXzNLeLHi6ygiV
         Ce363ti613M13oYHk5lIvh9TEsM/EHzitwo/3D9Z6rHrh/6kKwnawp/S5cN6bsCU+w7s
         UYsgLscMVmrozMqiIlEZy4CoGkmGYInN0S6Rz7Ta0BK1kN1D308k1o6TOwaaZWvpoJf7
         74PQ==
X-Gm-Message-State: ANoB5pnwmZhuLk5bje3yqOqRpdmDs0znmfY8yv9tEGiqlgzHKk0HZftF
	3cX4oBAH3julv31ydfIBdLclK4+r2sA=
X-Google-Smtp-Source: AA0mqf72YjFi/xUsISsV+LTrvHF7flzMQqVCPSabaX8UAf5qmU5wHunUUBDcQpGBjw6WnsI9h9Cpcw==
X-Received: by 2002:a17:906:1c0c:b0:7c1:e7a:62e6 with SMTP id k12-20020a1709061c0c00b007c10e7a62e6mr12425478ejg.71.1670831998553;
        Sun, 11 Dec 2022 23:59:58 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:58 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 19/21] docker: add seccomp to default packageconfig settings
Date: Mon, 12 Dec 2022 08:58:55 +0100
Message-Id: <20221212075857.1065221-20-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 08:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7773

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Much of meta-virt requires seccomp to function properly, so we
update docker to match that common default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 9708eaf..b74b412 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -41,7 +41,7 @@ RPROVIDES:${PN}-dev += "docker-dev"
 RPROVIDES:${PN}-contrip += "docker-dev"
 
 inherit pkgconfig
-PACKAGECONFIG ??= "docker-init"
+PACKAGECONFIG ??= "docker-init seccomp"
 PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
 PACKAGECONFIG[docker-init] = ",,,docker-init"
 PACKAGECONFIG[transient-config] = "transient-config"
-- 
2.38.1


