Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.5664.1639014115089745139
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 17:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WtdAuF60;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id z6so2776053plk.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Dec 2021 17:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VhQjEcZCWvko9uGkp0gfK3EzwhDehI/6cONUeiNvvHQ=;
        b=WtdAuF60T/P/mKIV/DuI9fPXJm4pjamnUCrPAGOGRh/vuDFV8qkvInMQK5htAMcBxo
         43+bJuP4fJbYeKulfc9sSbGW2sJwiQoB6e5q7SP7piKMcsiBG1FIu3I5WtumOG7LUA2K
         Veg0l1g+x4cOSwYJJtT+rSb3Yk3+N7IftdkxZYyQpq5Nwr6+24X939zoYt3vr94YQZKY
         xnMcYVA7+oH7/2rFbG2z2xC9bur29XvFhGH7IwBtIPygNzUwZ8XZNOl4cLdOxg7p3Cjz
         L43rQd3w6XqaUM65tGnQK4g6P8LIWzqKFT3N17xzaNQHumckPoE9Z8D1N/N8eXc98df1
         uULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VhQjEcZCWvko9uGkp0gfK3EzwhDehI/6cONUeiNvvHQ=;
        b=NZYAozrI+oVY8tF/+BbngMqEtNCafeYeOong76vEK9aWoBWgzDBRPAyBHe60e1qH/e
         KAEeVufGBBUUv19nD4/nKeYN2xz9wFCuhlXwmK6Rq6Hr42DvqIKyItBZpk7FdT9ynml0
         FpCy/qiXPVqdIpSiqBoX2XBXN/eOudm6k/PTp0cmhvajTvWcxm25GoUAh3RGEaU7522t
         GR/eMWHSvqV9Se2E+dkCaU5xRSNnc77/IMyfaUQ+o3+xTCgvOZcYtq82JHtjL3QaPs03
         oUCtrq9dVp2J5EqBow69iMxV4jNHXvp/xhBIuzRfYS3sTG3SsXBp24xaYLeXU8DnTnx+
         reqQ==
X-Gm-Message-State: AOAM533sfUI5QwvsancPiZOuXs8KOg/jjQKqANVuO6nXGgYnNqDZRGOW
	SAdRy7fO63OHy3vLKt9787JOa5auGPM=
X-Google-Smtp-Source: ABdhPJyWjmbz8IrVj3ViUNvCdxPwgjC8RVVGHpXdU86EPoIs19C1eeHHf6OyUV5f12F9CqVHa0VbYQ==
X-Received: by 2002:a17:902:c20d:b0:142:1009:585d with SMTP id 13-20020a170902c20d00b001421009585dmr63144247pll.83.1639014114533;
        Wed, 08 Dec 2021 17:41:54 -0800 (PST)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id x33sm4925759pfh.133.2021.12.08.17.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 17:41:53 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 3/3] MAINTAINERS: add xtf and the raspberry pi dynamic layer for Xen
Date: Wed,  8 Dec 2021 17:41:35 -0800
Message-Id: <20211209014135.9976-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209014135.9976-1-christopher.w.clark@gmail.com>
References: <20211209014135.9976-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the more recent Xen-related recipes to the list.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bb9a24..4b41bad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -32,3 +32,5 @@ M:      Christopher Clark <christopher.w.clark@gmail.com>
 F:      recipes-extended/xen/
 F:      recipes-extended/uxen/
 F:      recipes-extended/images/*xen*.bb
+F:      recipes-extended/images/xtf*.bb
+F:      dynamic-layers/raspberrypi/
-- 
2.25.1

