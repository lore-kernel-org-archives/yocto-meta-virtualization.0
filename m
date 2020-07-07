Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.8324.1594088371114084827
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 19:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UK9LGv47;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1ACBE01E16; Mon,  6 Jul 2020 19:19:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.174 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAC90E01E14
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 19:19:29 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id k18so36836031qke.4
        for <meta-virtualization@yoctoproject.org>; Mon, 06 Jul 2020 19:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X1i8Skh7sg9MYZmmcGF0xE9+b/HLWL0qrkVO8WEKTRg=;
        b=UK9LGv47m8m/YCGQdzwYJoGXpItikJsu3PrZ2R7Ajn8GA+4YQqUvgXsZ70TZuIWa1f
         Gzjg0yntfV0uWya5Ms3m81VwJc/aSpUtKVEv40ZfA616dTBqER2IN/dTMemXJ8mxFEL0
         NLXfuYmyB6pKO46VAm0qpW+2jRy4whyy/IXtHZ6rxS3xHnIXlfaASYLb+7opNtpxHbXS
         Ru5p2dYqqzj/EYbf68zWgff0zpsFfClicspnC0vf6WdKFQwzEdxwc4SHSQkStVNuo4rY
         Qc7nCU03WEy8S/gkJqWkHzkFX6/acxCNE9mTKDDbYkp6w3nHTgy3m7VwAjJlhBO9jJCm
         PjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X1i8Skh7sg9MYZmmcGF0xE9+b/HLWL0qrkVO8WEKTRg=;
        b=IGGnhzcrStB6n6yIgwBhgP2nNGd5Pudw8VFaBRgqZJviNUN4u8s5I9vidLk3zRnigy
         gumJcFG99nPCcGUSr91ePvqXiyQXSJNR2fRucqIywKsrKtay8b0Luwon6DxuCzXPW59I
         Ep8/Dsp71zw0adubonxU9txodV0fkWaz+3goJZQcCv2scc1QzAhmol+I8cvUHnKJNbcb
         jE6eqsqlaPyJFHJ5LblXmgWUnPEoUhxwgw20AGYa7HomSZtHUkUWnOU+h3xZQLK0E244
         SSVMItsnT/aBr1SDb3QaV1AiRbTgYcrkpEgBShUe2Hfdn+sdNDbJAjWYwkU4D/C45HoD
         laxQ==
X-Gm-Message-State: AOAM533hyk2WYngXpiHP6esmE5DuE0D9UM4t3cDYg8ycQXEBjfXKxu1Q
	yLj8Fs02Owch8gKEj76UyWswB7FK
X-Google-Smtp-Source: ABdhPJwRQs34krd3WiSK8f7MJxk9V4JLn/lqanBbUuhXzn6panF+aCXclJEkQXsHrKJLaEj3zZWocQ==
X-Received: by 2002:a37:65cc:: with SMTP id z195mr46265130qkb.89.1594088368783;
        Mon, 06 Jul 2020 19:19:28 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-195.mycingular.net. [166.176.184.195])
        by smtp.gmail.com with ESMTPSA id z1sm14042921qkl.74.2020.07.06.19.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 19:19:28 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 2/2] xen, xen-tools: configure: install defconfig to ${S} not ${B}
Date: Mon,  6 Jul 2020 19:18:50 -0700
Message-Id: <20200707021850.9841-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707021850.9841-1-christopher.w.clark@gmail.com>
References: <20200707021850.9841-1-christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2a02805..58b57e5 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -213,7 +213,7 @@ do_configure_common() {
     fi
 
     if [ -f "${WORKDIR}/defconfig" ]; then
-        cp "${WORKDIR}/defconfig" "${B}/xen/.config" || \
+        cp "${WORKDIR}/defconfig" "${S}/xen/.config" || \
         bbfatal "Unable to copy defconfig to .config"
     fi
 
-- 
2.17.1

