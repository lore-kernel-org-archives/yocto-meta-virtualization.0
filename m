Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B43DCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 07:20:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.19829.1694503249019878183
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 00:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NZaeea/6;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so698088866b.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694503247; x=1695108047; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlN0p3tJVqO/RVY77B1a1V90SBIjjsRUGC2QIwVl0Jg=;
        b=NZaeea/6c4miigouunmijZH0pkZdTmY31HLKiiZu/w3bsNRkiDnSxwELkkODsTXBD7
         Fu3Q/nBeEr5ygx+UPAb+H0zKRqH+uQDsYl/7j4yGG/P13pDtZC669wVqnD8+Rr1dcOpJ
         YWTEDcc9jDriZmoX8V4RtzH4UA4/ESpx2ayAaWMGQHEwuX/XEfQiVCxh914MsKHtkFrZ
         AzdIClkrNHlCMtBoKuVnOPaTZy4YV2sfexJG4k4kr7LOBX4QTymQw9X6Sq1nNnE3BNgj
         uwPHVxkMwJG8H7/tfZ2h3Zfx3pEacVUjvFbKZMYjt5dZO8oLsRS29JWBFVUST2+7pnhh
         W2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503247; x=1695108047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlN0p3tJVqO/RVY77B1a1V90SBIjjsRUGC2QIwVl0Jg=;
        b=lQoxnig8m4CeKgbKqkVlOpZojyO27CQ3YxFIRWwi28CA2zDC1vctFVfaBvUT+S/zjz
         oJwbewe85Ha5Jw5CIROZpsLFVn3QuRA+dYeJBBXPrqQJo9Rb9N8UZATR0tVXf/m9+oog
         bNk6j2C00Cmisf+zzVzILMCQ0BTtq2/o8qKr6B+qcu6qL5cZQNFt1LDZuFt+Sz8P22+o
         WauO9sYS2+PthQoBYgZt/YBUz9Iv9lWVN6AjkK5SEljv9agUJ2RMO96gYQDglm4v7lU2
         kMkDNURD/R5rxmImPHpDuLTtlyWfpT6d22HoyxfJLvx8jjo7ST8Fut2tAkFbxOM9Vmp2
         FsTQ==
X-Gm-Message-State: AOJu0YyQWmornwQJ9awOWXW2H+mOQZZ0cQqTuyXdbBwiBo40i56C1D5a
	UprvVVZXwzv+kvJz3vprhw+Ydek96OI=
X-Google-Smtp-Source: AGHT+IG4ZHcDSR50SqRPyDd8GaBOgOSGqxpaDQV/+3NLNG0IIZFC0thNGMQ43XvgKHmP0YQUptAgxg==
X-Received: by 2002:a17:907:2c62:b0:9a5:ed5b:241e with SMTP id ib2-20020a1709072c6200b009a5ed5b241emr9038279ejc.25.1694503247047;
        Tue, 12 Sep 2023 00:20:47 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z17-20020a1709064e1100b009944e955e19sm6371805eju.30.2023.09.12.00.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 00:20:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [kirkstone][PATCH 2/2] go-mux: Switch to main branch
Date: Tue, 12 Sep 2023 09:20:34 +0200
Message-ID: <20230912072034.89009-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912072034.89009-1-martin.jansa@gmail.com>
References: <20230912072034.89009-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 07:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8295

From: Mingli Yu <mingli.yu@windriver.com>

The project has renamed the master branch to main.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-devtools/go/go-mux_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
index 3f939f45..fb4502b6 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 SRCNAME = "mux"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
 
-- 
2.42.0


