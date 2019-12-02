Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.6341.1575314853494983840
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QTNRGwiO;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id 203so725224lfa.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Dec 2019 11:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d1Nh/wAUu3oEfKXheid/Udk+cwNfTH68fhedVlr/yaQ=;
        b=QTNRGwiOdUDWbavJ4ShnGKEt2hUafL9hLyO4MKBZ41sFaJY0TUtNsGMNDw/4QeqSjb
         dnSDvxGoYEvfAcCikvbWRdiEl27YEkMBEQ6iZahEZ3y5t0LX+jRbCWTidGS8y6saOa44
         /U5JiuoOaMDujus4ozSs++Swhe55WTrtsz089g7RnDlm1uTe3bFw1m+Jrqu5Me+LOZ2c
         hSLerel2XtFUVQjCKUdX5SuyR/TbwYOEqjOUnNm3ySAFEuRrrXf407/sAxkdySkH4xLL
         2D1H7DKhqx79O3j7mCofL8b6HZEG3Y4TP3C3hh9vI9ix1i5ji4LAa0G6NgnOQxKbuUEv
         v/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d1Nh/wAUu3oEfKXheid/Udk+cwNfTH68fhedVlr/yaQ=;
        b=Y7Xy1uzqA5fFLD4E906SwtG1ZJ7zuaooyE8zWAjuCP/e29pXRf23neYr7tSHxSjdEX
         ycD+OwXQ8726KQUnH35Wyvjbk5MnCa2WEL6PDA7CNrrsddHR6D37+SimhgbmR6V+fnNj
         37tiT5yE759KPhdPDmCbq58QcYk5hzNM2W+TSmJPYu5hvsVYHcMidrvBhRcb5AEgWZh2
         vfKJLFx94HONJzPeaszRXpF8UlbuQK9dlr/brfufxskdUOfLAK9pnnAb5UZKDwMfFZpK
         Mt9NFw6pHsRg6jyJSGr+kumFUJ/JeeEkeZ+xE9QASMOEfpgG9ze7wlZLyAfzWWKd3jTR
         F0jA==
X-Gm-Message-State: APjAAAVCiaIZtjRSuqRN6hQR5z8a4OJWOi/g8vLbNr7yvueXtF+eH+0P
	pRQOxqYsBKUiM63gl0Jn3W4Hbf3m2E8=
X-Google-Smtp-Source: APXvYqw+BDmksoNUJBL49u+3jyE4jm0HPFwICXDiROW184vg5EZDk4s+kZTs07TycOgwD1mkNgis0g==
X-Received: by 2002:a19:84d:: with SMTP id 74mr415687lfi.122.1575314851683;
        Mon, 02 Dec 2019 11:27:31 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id z20sm224534ljj.85.2019.12.02.11.27.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 11:27:31 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Qi.Chen@windriver.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 1/3] python-docker-pycreds: uprev to 0.4.0
Date: Mon,  2 Dec 2019 20:27:11 +0100
Message-Id: <1575314833-10994-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-devtools/python/python-docker-pycreds.inc                     | 4 ++--
 ...{python-docker-pycreds_0.3.0.bb => python-docker-pycreds_0.4.0.bb} | 0
 ...ython3-docker-pycreds_0.3.0.bb => python3-docker-pycreds_0.4.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-docker-pycreds_0.3.0.bb => python-docker-pycreds_0.4.0.bb} (100%)
 rename recipes-devtools/python/{python3-docker-pycreds_0.3.0.bb => python3-docker-pycreds_0.4.0.bb} (100%)

diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recipes-devtools/python/python-docker-pycreds.inc
index ca0995f..4bfa05f 100644
--- a/recipes-devtools/python/python-docker-pycreds.inc
+++ b/recipes-devtools/python/python-docker-pycreds.inc
@@ -3,5 +3,5 @@ HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
-SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba2c3bcbacb5a314449c040b0b814355bbff"
+SRC_URI[md5sum] = "322f570cea6b4661c6ac335683988e18"
+SRC_URI[sha256sum] = "6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4"
diff --git a/recipes-devtools/python/python-docker-pycreds_0.3.0.bb b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
similarity index 100%
rename from recipes-devtools/python/python-docker-pycreds_0.3.0.bb
rename to recipes-devtools/python/python-docker-pycreds_0.4.0.bb
diff --git a/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb b/recipes-devtools/python/python3-docker-pycreds_0.4.0.bb
similarity index 100%
rename from recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
rename to recipes-devtools/python/python3-docker-pycreds_0.4.0.bb
-- 
2.7.4

