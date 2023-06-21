Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1465EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 12:39:26 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.9637.1687351163838239655
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 05:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QoM8fsBp;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-98bcc533490so97876866b.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687351162; x=1689943162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKSWREXNMM8YFsExh1MEnK83C5s1mDxmj2phm+0G7y0=;
        b=QoM8fsBpC3Ck7A/KN8W+mEyIX0AXuL3wDXhDnELwQ99XV82hMz0lScffOg1YIdWyr0
         dj92H50lYW3hsN0V4c44HhBhIYVHEg6wa0ajMCa/j0QcnqmzNOu4uC43hMeu+h4/sGX+
         EDWm9Izm9fSKQ/adFmx3KZlaK1v9+UAZZ3Pnpfv1PyrGlvKOWFU4CRaAdxFHpDMaD7Iw
         aSy2ojIAGPnO6IN7zeuvIlS94F20nTq59JwzAdiuqz0T3WXNaVx/UIt3JHhSeAmBXl4p
         O+R/S6gt/Lb9PG7MC5L8F88rZd1uWf8gl0/0A/nXqyYKVrZp8/pB9o6Jik50QF5Ewqgi
         y2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687351162; x=1689943162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKSWREXNMM8YFsExh1MEnK83C5s1mDxmj2phm+0G7y0=;
        b=hQLYfra851vRSyXtXlQAJKOBI98s6/HoCUbk7gPfwXMXv4EUGkmHD5ftirTR9yJCJc
         mtgYFdsNE3/MxR8RGVpKeUk8gHHrxqlgJ48IBuL53ICF5CXyPQgrF0ledZgdDbqzFHQ4
         /o7b91PNc8S90tKPiNUl6FBuE1OZR7vjMi81/d58ES1r1wxq+/4PffKzUW1vRPS4ENzv
         c+YkFJwmOBq5JqWqkRWHBTihAXIzWnWcsr3Aw8GKZVsF97lu2bJt0QOfoEoqoPvXR7GH
         l8o8rYDThOyYhl4Fg/cLDHGf6DTwBnai0cJd/+FJixFVuhgwQ/Eo3JM7y4aqhRRDHgmT
         Wtwg==
X-Gm-Message-State: AC+VfDxwMA3M2K+CPPG2rXJkKBTpdo/Kjr6DNrqcr9jiWpp/4PGNlVXo
	LESjdhuZ4nglajckBJcngWYq7lhlu9k=
X-Google-Smtp-Source: ACHHUZ78KknWWOqb8XJtYw/aejijhrXZu43D0cQMihJvzvFLgIll01qd0BR8VSJd7dt6sBkpVHx5mw==
X-Received: by 2002:a17:907:6ea8:b0:978:8925:7a08 with SMTP id sh40-20020a1709076ea800b0097889257a08mr16996215ejc.72.1687351162273;
        Wed, 21 Jun 2023 05:39:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p16-20020a170906141000b0096f937b0d3esm3061250ejc.3.2023.06.21.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:39:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] ipxe: Fix malformed Upstream-Status
Date: Wed, 21 Jun 2023 14:39:12 +0200
Message-ID: <20230621123912.2889357-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621123912.2889357-1-Martin.Jansa@gmail.com>
References: <20230621123912.2889357-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 12:39:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8101

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../build-be-explicit-about-fcommon-compiler-directive.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch b/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch
index 0118e2e..d4a2c73 100644
--- a/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch
+++ b/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] [build] Be explicit about -fcommon compiler directive
 gcc10 switched default behavior from -fcommon to -fno-common.  Since
 "__shared" relies on the legacy behavior, explicitly specify it.
 
-Upstream-Status: [backport]
+Upstream-Status: Backport
 
 Signed-off-by: Bruce Rogers <brogers@suse.com>
 Modified-by: Michael Brown <mcb30@ipxe.org>
-- 
2.41.0


