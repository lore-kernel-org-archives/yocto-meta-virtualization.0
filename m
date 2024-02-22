Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D0CC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 16:20:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.16860.1708618825332405392
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 08:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RbqEjSJn;
 spf=pass (domain: linaro.org, ip: 209.85.221.41, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3394bec856fso624034f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708618823; x=1709223623; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFOp4YRipqpAopPvz7rUKgnqUQqMPEfjgQFLf/jmo6Q=;
        b=RbqEjSJnmIwpFnHE0DhtUrR7opT6DR2l/oJvS3jRu6/daf3Sgh1AHwOTln/Lgbo5Lt
         1lrEsjSZNCtHhbyBQMjK3kfRkp4pN8zqxrHdg2CnZ9BzgZ8yTXzYHrMEkmpnj8B+k//1
         NhTYZADkJB32j8mlEy1PTtpBfabyzUiOObU83ygt0jEDYhJHVNjec7bOPWv2WX8dPPlZ
         RinnLYDzLJF3uybgLSgH1SjrhH0ewdJROiILHwp51qQWk/vwOXKGVg95gaDsqYAShMe1
         1br3YfGkNKT7oez3hAIatiWuUQM5QjyOM+NbcF0re0VdXRySvhFiU2EL1RQrBhJ2QMd0
         DfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708618823; x=1709223623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFOp4YRipqpAopPvz7rUKgnqUQqMPEfjgQFLf/jmo6Q=;
        b=f6ug98pZU51P2wDTFmgP23BM1SK9pZETZAUGpxDLg5t7ons3DbNhUNSW27Vnf6qOhC
         xL035NxJnygxTaXtnq0gHgbX6nvPB7Yxsi6rPGFaf2RAR7OxRAe7UIiKdfOuEuwp2KsO
         M2VbUKtRvbtqOymjbzTTsn2Qd4RtbDa+aAZTBJUl304t1fTsBhR35BSAIqS6cKMsUTW2
         BMU6B7fCm9l7SyN1bHDij+2an6MW81ZjsOTVo2vutwNWrc4elwWFOnPXlOW4JY+jCMUP
         TRpffE8WLqzo4vDCiSYiMSkmQHO0bgYjeVk1xDXIomoQwcKyh7UNc6RxhCAEzKwfs/Te
         JT2g==
X-Gm-Message-State: AOJu0YzBpED+5vR/EP6RnYM0QefPa1luE0gpruASMFkzdy/483bmo2on
	mAOJcNm1ZwOzYMCATzkeK9blN7ThnV429eBxr/zCsUTOy93NbBppX7jDsQeVnV5r6GnUKqL0SO5
	Eb8U=
X-Google-Smtp-Source: AGHT+IHGKfJB2hnHMlV7Afx8eYwg2VPgXpPtz2CJlkRHb0b/7xfhg4US9rNXLTtqblUQg1m+7hzYUQ==
X-Received: by 2002:a5d:6d85:0:b0:33d:9d51:9942 with SMTP id l5-20020a5d6d85000000b0033d9d519942mr1230908wrs.17.1708618822943;
        Thu, 22 Feb 2024 08:20:22 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id x4-20020adff644000000b0033b792ed609sm20947525wrp.91.2024.02.22.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:20:22 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-virtualization][PATCH] linux-yocto: include: relax the versioned linux-yocto_*_virtualization.inc
Date: Thu, 22 Feb 2024 17:20:19 +0100
Message-ID: <20240222162019.3154833-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 16:20:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8572

The include content hasn't changed since February 2020 and has been only
renamed since to be tightly coupled with oe-core linux-yocto kernel
version.
It's causing unecessary breakage for layers tracking meta-virtualization
master branch layer (for CI purpose for example) and haven't updated to
latest kernel.
This commit relax the strict versioning requirement and allows the users
to have a bit more time to fix thier layers.
e.g. layers still using 6.5 kernel and haven't migrated to 6.6 are
unblocked.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ..._6.6_virtualization.inc => linux-yocto_6.%_virtualization.inc} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/{linux-yocto_6.6_virtualization.inc => linux-yocto_6.%_virtualization.inc} (100%)

diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc b/recipes-kernel/linux/linux-yocto_6.%_virtualization.inc
similarity index 100%
rename from recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
rename to recipes-kernel/linux/linux-yocto_6.%_virtualization.inc
-- 
2.43.0


