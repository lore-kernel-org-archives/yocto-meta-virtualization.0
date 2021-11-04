Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.76.1636063849510705557
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 15:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q1eM0tRv;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: crawford.benjamin15@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso5292490wmf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Nov 2021 15:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d78Z4vpFtRk4ZUyoxVj9d00lMR4aHk17D4HG/wecTG0=;
        b=Q1eM0tRv9AIl2S/c05F4t584AvEOoGEDqPe97Xz9Oghx5W1iPwapSW+Qq2bT058zEV
         UdN/6dGCS+PbS6XDOJeq/0NdasTazY+w5PdysAPkNJ8TZ9AbwfOtbCUMy3TR5/ZCiSKA
         mOAwmJrWgHkRAeTzBAnxDwTjYYsZ+p5JM3oTN0GQnoi5pbPjalPRh/KdcRfHhgKexGiX
         sk+8qBduFOR7KtqwR1j8VizRQTaxgf7bFlNTZ637Cg2V3oTAifdnrrEzmi3SAS57l2ue
         orwv3SvSlNjnCuomgJxJFkWncuJimpGjE3SsQn3/sWWxbtn7gPPzTyf23y9u1KV40E4n
         wLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d78Z4vpFtRk4ZUyoxVj9d00lMR4aHk17D4HG/wecTG0=;
        b=ZvmlcoDR+3qd7RSQZP6VwZfU59QcufkjWgcisH6aSTkq74MnoE9tTU/AwvcRS8t2C3
         1swnk1EDt9tbZem722n4f4rfphzUdYOJ0wSJSBaqYybZtDnUF2uAHqpk7ACX9h0sXTrr
         5RZiyHkxXlbNdotE+KtvMjbbo0FR7q0Iv4Dd+WTfLoJzqCscyGFMs8LiW0lWmrUlGExu
         QERRVymByUSFQDvysYFHBLYx7+yD9xOtNG2Zplzsk3qlT6QQhTpItRiXDyk0iREAe/WM
         kYT56+6t/69MTJfWP01riAWtb54raQqcwHKKc0EwKLszNq9qg1pSsOf3vDArJPvgFA1Q
         uaNg==
X-Gm-Message-State: AOAM532lXsVJyGBjl89p7VkXKVP4fMGkV6qxyYhUIulvjvO1AXtabweD
	H+WMRo+pYmPO1sp+rX7ENp8Wc0QrKCXWwQ==
X-Google-Smtp-Source: ABdhPJyJzPg4/XvyxUGCv4/MVUrt7wGYSDarDugR5EBZSyYmZDKnsDGWPztec9BBqXpnRY4oj1WkEA==
X-Received: by 2002:a1c:790d:: with SMTP id l13mr23661200wme.101.1636063847724;
        Thu, 04 Nov 2021 15:10:47 -0700 (PDT)
Return-Path: <crawford.benjamin15@gmail.com>
Received: from C02G44KTML7H.emea.arm.com (cpc92882-cmbg20-2-0-cust452.5-4.cable.virginm.net. [86.31.103.197])
        by smtp.gmail.com with ESMTPSA id o8sm6308908wrm.67.2021.11.04.15.10.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Nov 2021 15:10:47 -0700 (PDT)
From: crawford.benjamin15@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
Subject: [PATCH] docker: add netfilter configuration fragments
Date: Thu,  4 Nov 2021 22:10:06 +0000
Message-Id: <20211104221006.3757-1-crawford.benjamin15@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The docker.cfg file is missing a few netfilter
module requirements. Without these, it is possible
for networking and bridge initialization to fail.

Signed-off-by: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
---
 recipes-kernel/linux/linux-yocto/docker.cfg | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-kernel/linux/linux-yocto/docker.cfg
index 79012a6..9378266 100644
--- a/recipes-kernel/linux/linux-yocto/docker.cfg
+++ b/recipes-kernel/linux/linux-yocto/docker.cfg
@@ -5,7 +5,9 @@ CONFIG_NF_CONNTRACK=y
 
 CONFIG_DM_THIN_PROVISIONING=m
 
-
+CONFIG_NETFILTER_NETLINK=m
+CONFIG_NT_CT_NETLINK=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_TARGET_MASQUERADE=m
 
-- 
2.30.1 (Apple Git-130)

