Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.7882.1625718795803647323
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hd5EXH5n;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id cn9so2230617qvb.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T3vEvpIzvNM8t6fAx0kqhcSdcP4g0foZQTyIxVptFzI=;
        b=Hd5EXH5n4rc++XD6OnDpvTf+/XgkRd2vuLbZTqWgeaLcEFESzi08oOHAC1CUbkgkQZ
         0Q7oJipFUfUmwxynULskr369oU7Mht0px2I+ETFUrhATxHds4RTlxOIvcuKgTgXtwnVz
         F3eeKRxZkLeka/YYB7QnM86rn0EdotmP0Xtj0fFfzqv/k0mzbidBnWwM2KIS2XnL0WFN
         zFMB1v3WMFEgYKArFSjsoEvzVd4vN77ja4kudzkQIt7k70H6TzemaBbGeA27iS3iXjUV
         zJE1oyJutKOrsy/FKuQG9V0WFNlKudbR+6s+XH9YMODrDIilz9+o7v1JDz17is93Egrv
         5/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T3vEvpIzvNM8t6fAx0kqhcSdcP4g0foZQTyIxVptFzI=;
        b=Le+YrszqxBONmHh1R2pP1MoaU2447zQhZqSP8CnTfQcag61oNKJI0vn0YRADweal0n
         XAU+5iojP5eN7LKC2kDdZw2Or1iVYBAlPpfPBp+RFCoIoBnwJApRREsYzgtQtc0jpbHX
         9rjOA0tvslaK0HgtRCRqfUPJGGW0qDCoYhwPtbvOqg6nqdy5d80lW9SvtDJdSaKBlEGo
         e4Loe1krPmaT9IKmaz+dy9rxTF3i6RoQKnDwJkEidDgcr5h53/PbQk0sV6//++BQPNwU
         XX/eZxrYQ6pMMQSUJX1cEQ5gwzs7XMw19l74P3QhJhXrcI0X3WuchBvupjk9MzymDlWZ
         2Y+A==
X-Gm-Message-State: AOAM532UkXRabMq4jHJ93CetWVgwP2nnBc+bXd/gCnXfv/aTyafyreTu
	SZwna+dXbbf6ovXYCl3jGq3rJwb+317WV284
X-Google-Smtp-Source: ABdhPJwG69hdWCB9lSBkaBuEXdG0T+niVvPuNCt8qdG/Yn46dfhu9tdYNhlnmYtBEFjrZWzZxsF68w==
X-Received: by 2002:a05:6214:140c:: with SMTP id n12mr27495422qvx.11.1625718794904;
        Wed, 07 Jul 2021 21:33:14 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id p9sm517908qtw.88.2021.07.07.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:33:14 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH v2 4/4] xen-tools: remove Arm 32-bit compiler flags override
Date: Wed,  7 Jul 2021 21:32:46 -0700
Message-Id: <20210708043246.126719-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708043246.126719-1-christopher.w.clark@gmail.com>
References: <20210708043246.126719-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SECURITY_FLAGS are already passed into the tools build in
HOST_CC_ARCH so this separate case override is not needed.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 5aa2d5a..3438034 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -116,7 +116,6 @@ EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
 # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
 # in CC to ensure that configure can compile binaries for the right arch.
 CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
-EXTRA_CFLAGS_XEN_TOOLS_arm="${SECURITY_CFLAGS} ${CFLAGS}"
 
 # There are no Xen-provided variables for C++, so append to the tool variables:
 CPP_append = " ${CPPFLAGS}"
-- 
2.25.1

