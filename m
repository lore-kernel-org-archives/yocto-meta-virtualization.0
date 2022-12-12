Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9905AC4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:48 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.37927.1670831987919476961
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pVJnSBI0;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id x22so25792126ejs.11
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeuloxDrWpvjYyuWna2HKmX83tuXHemFgMJHRYtbHJ4=;
        b=pVJnSBI0F9PCCpx4w9NIODKWtlQdg/HWPd24yIQH62DB0vMEDT7cVktYtWw6uJn7UK
         q3nxBHtqi3HLyZ6sE9qRP5rarMlO3p3cWO+RzpYBP4nKVgC2gm69QL+dFTN9CnX+QBTC
         qW/G/xkFFqySceBq36eEZM5P7MS4cK01QrG4iktgGBCy9RZczpz7dHCgd0T03vn/dkog
         9zca1q0lHobvzk6dWurZXgXJVtxaN5wllyGvub94nHTpqha1gBus7JhVIQBslY58mBKn
         lQzgz+Uvkcnktnsygq/w6bIuVgL6UAqib1PHrg0mvzSLwJQnh5RB5hM2YFLj6kJF1ed6
         mdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeuloxDrWpvjYyuWna2HKmX83tuXHemFgMJHRYtbHJ4=;
        b=xjkbNvYpvhVA/hNr6LzVIoz4PmCnjZeWgkHS8zQEC4NcVOT2pAmcSrt8B/ep7CT85T
         5jmo7YxSu8W08TTgsmDZ5opLTwp96CfzmbrpufcT/YPMRoCUch34AItoc2XpZ7M/k9z7
         CT+Y43cY1wBL+uF9o/V/Xm/KOmTROwWW2dyYbNmfmSKx9oEj+Tm1ezOdi3ELwa+knQtP
         HLTbr9jkcQS8PShguxf7uF9TraDeKzyUPy3+onGmnw7cRu80V9VrBbdzxdzDWynQ7KBA
         OL4vt2DziZC/V0LdrGaH90FiMndN2hLF18HYkSb2bDBsqRoydxP0XcDUlPBvU7mXTRaT
         B8Ug==
X-Gm-Message-State: ANoB5pmPeZUIM5TVwY4i73T8cz9WdF19JyyP0H4NdJYIifLE6YLCZshA
	saeXp0UbnlNQIITtrsnP9kmI3uXD6w4=
X-Google-Smtp-Source: AA0mqf6B3wB0G5pKYsV1aVga4ucVxVn74nS/9GkCSeJf2jgnLXIzvDzK5nHgjLtc9sV300fp4vOnSA==
X-Received: by 2002:a17:906:5213:b0:7c1:3125:9564 with SMTP id g19-20020a170906521300b007c131259564mr11706489ejm.8.1670831986094;
        Sun, 11 Dec 2022 23:59:46 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:45 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 02/21]  docker/moby/libnetwork: update to -latest
Date: Mon, 12 Dec 2022 08:58:38 +0100
Message-Id: <20221212075857.1065221-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7755

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping libnetwork to version v0.7.0-dev.3-1830-g339b972b, which comprises the following commits:

    9db86fb7 Only check if route overlaps routes with scope: LINK
    7b9c2905 fix port forwarding with ipv6.disable=1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-moby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 4685550..f7f0f6f 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -35,7 +35,7 @@ DESCRIPTION = "Linux container runtime \
 #     to a docker.inc recipe
 
 SRCREV_moby = "f756502055d2e36a84f2068e6620bea5ecf09058"
-SRCREV_libnetwork = "64b7a4574d1426139437d20e81c0b6d391130ec8"
+SRCREV_libnetwork = "339b972b464ee3d401b5788b2af9e31d09d6b7da"
 SRCREV_cli = "a224086349269551becacce16e5842ceeb2a98d6"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
-- 
2.38.1


