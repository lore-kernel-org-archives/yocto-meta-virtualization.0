Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.40137.1578931794269509423
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 08:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uf1G6mDG;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: brendank310@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id y184so2683750vkc.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Jan 2020 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8btBPYihK1xDXEgEP8pDEw+gD5sl6IPmgaIYSX4uKmk=;
        b=uf1G6mDGTHOtcrBKfe6kJ+0vvWOThORWbWwyyr9rxQIsgTe7xh/x9jW7HDBz4eIobe
         fC/lL6nXlwtBdJe3dQviEINdcvAbLEMCcKdlfvm1fMirLXcEzZWBSXNUUxZrxFW/ePLa
         43gZxhyMdMZ7vns9zZMMBiMwFhQqlIqxWaKtBsnVAwXsXDL4IhKVxRBinl6RHhfdzEIF
         jEAaYjy/SgJNMLow8u7wJlx8niphcwrdN5caR0a1BBOgWg3uZ5Jw2JHKgqdENQXNvKMH
         5WdqWp/SNhPL5dVJoqqOlWgIPd/tRs2elW3JYONJE8AcbXZ5AxIJONYPPlrlAubPlaBK
         fofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8btBPYihK1xDXEgEP8pDEw+gD5sl6IPmgaIYSX4uKmk=;
        b=W8EZEcIg4Cpyba3y+ae4yPcCoWB/PXZ5EhAKT1QcTrupKwkcNUm9RjBdMiP3Swyo72
         K970skeSXKh033UzipQ4PS4oEZk2F2RIHqj8oqDGyZiLEb/JddDo4IaZxcZDp1spSHBN
         u9trlNpzXszXv7uqXTBBjRCKRJWE2J5UJjKHyRxqLyELQKBjA8IdnFw79z6IYmDUS/8y
         k6xTHQKcw0SqWF3uO7KNNYCOIN5kXVxLGRAmnm8yj5Svo+Apz7zesbTZi1u5PwJYn/VS
         O0p6ehQQNxBB04YfBrUxets1eaK5oaTFa7mtub8lqGpnbgDI6KAGEQHGSEWhGl5hBXM7
         vAlA==
X-Gm-Message-State: APjAAAVVk9HgoiWoigguRH3ENdt04E9a74jLc5l6hT4fdOEOlvKaWMN5
	W63JiAupbHXv4XGvAO58I4NEJ0Wl0j8=
X-Google-Smtp-Source: APXvYqyP061b0LSLz5jZqxzFnQDocmQsl1jGHD0TxQKryd5+ks00yw8cH5xBcPBz69lj/hYvG1LNdw==
X-Received: by 2002:ad4:450a:: with SMTP id k10mr15253283qvu.136.1578930491376;
        Mon, 13 Jan 2020 07:48:11 -0800 (PST)
Return-Path: <brendank310@gmail.com>
Received: from localhost.localdomain (pool-96-249-236-140.nrflva.fios.verizon.net. [96.249.236.140])
        by smtp.gmail.com with ESMTPSA id r205sm5150459qke.34.2020.01.13.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 07:48:11 -0800 (PST)
From: "Brendan Kerrigan" <brendank310@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Subject: [PATCH 1/3] xen: add flag to ignore warning "address-of-packed-member"
Date: Mon, 13 Jan 2020 10:47:40 -0500
Message-Id: <20200113154742.15509-2-brendank310@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113154742.15509-1-brendank310@gmail.com>
References: <20200113154742.15509-1-brendank310@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 628e52b..a77b0d7 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -925,6 +925,8 @@ CC += "${@['', '-gno-record-gcc-switches -Wno-builtin-macro-redefined -D__FILE__
                '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
           [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
 
+CC += " -Wno-address-of-packed-member "
+
 # check for XSM in package config to allow XSM_ENABLE to be set
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG')
-- 
2.20.1

