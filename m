Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902CEC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 09:12:27 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.3214.1742461940682388836
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 02:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJbRrAvF;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7430e27b2so117765966b.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742461939; x=1743066739; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCDr0//DMIpj7h2+RzEc+8PsoMO3D2pQJODIeYUnekU=;
        b=CJbRrAvFgAWydMwp0G2XGAOS8YPfJ/fd/gwGFNQyC54QILnuvX9CUwDM9/CogvlVY0
         GCoTgMM5dkEShyvN7gErHY9ZtnjP/N/OO3UseuSiuNpggnfoaVSx7Vd94yTRFXSb6Jsv
         ZfqAoQrHGN0QgMin2g56ZuwiFGWyzg4aR92WdDBks7p0SjQ5/RORf1AC3SJjcPYzpg2B
         ap6W1TnppsUjsMKiz11a8yEinC2QMnc6SwaWaf16twR0ovqYd8WxNdNDpRXVlbfb5dId
         a/VtVjQ4ZQMLE/Beu+0DRI9DLImHcirFJsgFZKi4Kb3W88YrLcV20y5PXlT8IglnwhWL
         q05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742461939; x=1743066739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCDr0//DMIpj7h2+RzEc+8PsoMO3D2pQJODIeYUnekU=;
        b=M30aaWRfN2TJVwIVMqUyRR1viZBsRdcICjlUftmGXZcien/vo6M/77A8TUAYCJqJyV
         WOW3ZSO68q8CRd8slE4ilD9xjv408VZco6EGtptJBfeFXp9cLzxRUghierK6yqCtWj1B
         4wDuWsRjOYkfFXRSZvcpjy6qIB6rEYBFDrNfJluwC8iYsYEbNHss6wp32hggAdheOQEi
         GiAI6ZRtp9nbv2lCtqz9ZtHxlOLR6Mp9nKgzDkFoHVTwMe2WhWjmkp+kdQHg/+iQPl+y
         lMSCAzX8et0BqiF2LzV+PxvNO7W3kXRZNzXspo3r+HCGIm2W2mPn5q4iqGip6n/4rKT8
         //HA==
X-Gm-Message-State: AOJu0Yzmgfnn7hroOFPMkrrX+JNxQOFu+RbvwEjWOZemQdsddfVON0s4
	AvRYqF0yrmJvm6WcjNgroPoejirW8Y/xTTj0/ICVS5czAuY5PsUNb9slIQ==
X-Gm-Gg: ASbGncvzMBntOSEj5je3Qtr93QzCg33KzGKsdmdkA/SLoNyuf2A/QLRRBpDtCpPb3a1
	1i2ocM48Nm2qP4Qx6r+urgo2GCasuwwU347zu016rgwXWherDs2TOtLiAwJH70SsUfEfPQjcKyE
	/7W6wYVOl9B0yatu9RdxuH7knZP+/wJsl9/lIkaN+45BxO9p90vDHMQP0UuHA+qSYn7ivq2W2lQ
	bxdAVQy40qxPd1RehSO44jGfGceMBvHw0T1HEVoTGZEl7FEnrEGdu8tg6EcbsGTUNr5lDL98vys
	RUv2i8/uNrTOE5pJAOrQbpE3JbEyaZZUlDEO51+XnDkXR4FjeT0+lL6av1dAVqH5yPYjm2LNNf1
	IKtcHXkREegfY
X-Google-Smtp-Source: AGHT+IEbZkbqC2UnOjLGvdVBIf26tWQJLHCWlm5RxD8t5u0ND0mgk9DfRg/6OV/kUclsfLSkPnAoqg==
X-Received: by 2002:a17:907:7254:b0:abf:749f:f719 with SMTP id a640c23a62f3a-ac3b7c1d421mr582992166b.7.1742461938665;
        Thu, 20 Mar 2025 02:12:18 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3149cfb96sm1117622966b.119.2025.03.20.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 02:12:18 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] oath: fix autotools usage
Date: Thu, 20 Mar 2025 10:12:12 +0100
Message-ID: <20250320091212.2260260-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 09:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9165

From: Martin Jansa <martin.jansa@gmail.com>

* add include for m4 directory to fix:
  http://errors.yoctoproject.org/Errors/Details/848019/
  configure.ac:48: error: possibly undefined macro: AM_PATH_XML2

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/oath/oath_2.6.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/oath/oath_2.6.2.bb b/recipes-extended/oath/oath_2.6.2.bb
index 84d42dff..3d962869 100644
--- a/recipes-extended/oath/oath_2.6.2.bb
+++ b/recipes-extended/oath/oath_2.6.2.bb
@@ -14,6 +14,10 @@ SRC_URI[sha256sum] = "b03446fa4b549af5ebe4d35d7aba51163442d255660558cd861ebce536
 
 inherit autotools pkgconfig
 
+# http://errors.yoctoproject.org/Errors/Details/848019/
+# uses AM_PATH_XML2 from oath-toolkit-2.6.2/m4/libxml2.m4:AC_DEFUN([AM_PATH_XML2],[...
+EXTRA_AUTORECONF += "-I ${S}/m4"
+
 # Specify any options you want to pass to the configure script using EXTRA_OECONF:
 EXTRA_OECONF = ""
 DEPENDS = "gtk-doc-native"

