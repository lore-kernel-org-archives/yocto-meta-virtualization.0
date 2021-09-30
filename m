Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.9801.1632991795635114119
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 01:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aOuqgCQt;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y35so19281946ede.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Sep 2021 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=heRPDW3QXjwZuoePA7LFSbE7Kl0ReuP1AStmxmdp/E0=;
        b=aOuqgCQt8xQpTt4QzctCgbCKUpIuOwiK0Edlt7eZyAJwewXb9sKVFBATa/631XhEjw
         QQITXCWjG0TN/xmpZ7/bCs+m4crgdYBWOm+bOcbuSa7dEemTV9acdIkTa6hiTXjILjtH
         9jI1YmYt4jF3hJVVzow+NZ6v4NxBJzpewaSeZ1mQBLn7ewigBaGbD96742AjJHNVIrjb
         yRs/2CBys+osXVzqBFgviUnapHnQfnBAx+Xrv2+ophQA5LvRJEC1chCk73QV+wSf4rOh
         xsD0xzAlHkEMQTQ7cNcJ1QScXHWt1QAQ4/WRvkTebnN2WDuOW5wGLhymxHlpRqlDgzNk
         +pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=heRPDW3QXjwZuoePA7LFSbE7Kl0ReuP1AStmxmdp/E0=;
        b=dRfpfkLz5SusNPcf91Vu82bBcN/65dA432ml/tRWvzfbOx1LkaogPUTVf/y2rABSe4
         cWUSvNa1OVKam6HkCaga6W4b0DK03jOScnyJpF4pCKNfkHLHVbz0qiO1NPEcJGBwdXMl
         j2758fCS+ZmDEKRQnPAKpWzc7zWjndwSkLFsgZH5bvOlzrSe8wGLshM70HblEjmF3Ph3
         v2cTufuSoDdUPN/yFDFR0qvQaqfLmJ7miSZWG6YjHdzudojOZ/pW4SCX+zpbEN14svVh
         rCAdtAmygGc/h174a1QxarThssI5N4RKl0q3OIgaeyL7s8MyOlIKTfafCO/rn9X7YHvW
         rBew==
X-Gm-Message-State: AOAM532WyUQEMRSFbaGxOsueFGtUllAkK5ItXDRtMnTb1TctfUux7K5X
	bnnzhDrpha8HyEH3PRlOwlmNPdBWqBA=
X-Google-Smtp-Source: ABdhPJxGqPhGVHqRWCJmHI8uiGXVVkbHwE8HKxok8i3beJSDEYKnH0A+aFymCJIRs1YIAc8RlwIf1g==
X-Received: by 2002:aa7:c741:: with SMTP id c1mr1987368eds.194.1632991793808;
        Thu, 30 Sep 2021 01:49:53 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id la24sm1109128ejb.3.2021.09.30.01.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 01:49:53 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] oath: inherit pkgconfig
Date: Thu, 30 Sep 2021 10:49:50 +0200
Message-Id: <20210930084950.41628-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Newer oe-core doesn't pull many default dependencies anymore:
  https://lists.openembedded.org/g/openembedded-core/message/156185
  add explicit dependency on pkgconfig through pkgconfig.bbclass as
  we're using it here.

* fixes:
  ../../oath-toolkit-2.6.2/liboath/configure: line 30585: PKG_PROG_PKG_CONFIG: command not found
  checking for gtk-doc... ../../oath-toolkit-2.6.2/liboath/configure: line 30595: syntax error near unexpected token `$gtk_doc_requires,have_gtk_doc=yes,have_gtk_doc=no'
  ../../oath-toolkit-2.6.2/liboath/configure: line 30595: `  PKG_CHECK_EXISTS($gtk_doc_requires,have_gtk_doc=yes,have_gtk_doc=no)'
  configure: error: ../../oath-toolkit-2.6.2/liboath/configure failed for liboath

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/oath/oath_2.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/oath/oath_2.6.2.bb b/recipes-extended/oath/oath_2.6.2.bb
index f423044..d568ec0 100644
--- a/recipes-extended/oath/oath_2.6.2.bb
+++ b/recipes-extended/oath/oath_2.6.2.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/${BPN}-toolkit-${PV}"
 SRC_URI[md5sum] = "4a05cd4768764843bd5493609a6bdb17"
 SRC_URI[sha256sum] = "b03446fa4b549af5ebe4d35d7aba51163442d255660558cd861ebce536824aa0"
 
-inherit autotools
+inherit autotools pkgconfig
 
 # Specify any options you want to pass to the configure script using EXTRA_OECONF:
 EXTRA_OECONF = ""
-- 
2.32.0

