Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.40120.1584274800602971370
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 05:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4LZGret;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id g12so15501013ljj.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QHTAU6A+mSIDz88NoJTBN+eKE4SCGyMHJnwQY3YB5zA=;
        b=j4LZGret1yJkcnRCACb3kobyhx8QQgo0h9U6CCuJNRxE4FWjphSKNR2gufCR9z4ZJy
         w6uYMtB9xlOg4Yd/LsEpwxbvLVvAz2AXH5my02SSYR/mYbtVLbRSZU73oVW570V+myGK
         Vz5DVxCWbPE/ts1bMd0AoMeeh8YV09cN2h+mqQYJXG6gZ1YQCuaa7VAlXGUcpbTXsZB+
         28cqFWKyKVTsK33XNr70L6sTrhmlUkngyzmbwinA6QG9UDirr0gfldXHbMskwHCLSpif
         frK6I997hG3QX7Ashvlglu2FWZ4r8HxvbeTi/2AFVdUsb+YNEnEYmRVwJLJAAHdL+WPG
         7l+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QHTAU6A+mSIDz88NoJTBN+eKE4SCGyMHJnwQY3YB5zA=;
        b=GYgYx98qrAP6PY7WKDOpbqY8xHEa8VcjUDQkKySScwIwvGZmZIbaoCM4mR2IojRy2S
         7afR7+J6G0XRG/BM8CRz4Zbk7IDSr8db7IQBGwVbEZyy4JDNgrK3Z0ElSc6F6b4aEUuJ
         POplNtsZ3ywAO4KyDflJFZCGcYlwQBiOu5KHslDTjHZVxJClbWkgIs2nz34GpEhkm3hF
         1LF/1T/Lj9l5kIuRDKYEAH2RmYWsV+oT4hKaWpS1kZdq8aAzMxE0wGoGRLAjSFORSIL6
         Gp9ll6edzbejIfvlMPjLPHFEElEf/hMrjWgovqdlyTn+5IQh5QkwQYafLcla++bfIMN7
         AwWg==
X-Gm-Message-State: ANhLgQ23HEF02rXe3WGOcSUkVR/zfh/ylWB8Gty48hidOKJGdOvGdZHl
	FqGmnDeUlaO8sgJOt/BP6KF6wnGlC2w=
X-Google-Smtp-Source: ADFU+vurhwJFDIDeGQPT2eDksjvDD0vbwBy7oX48F/nSKcXxU5M366Ecqy+5C7yvC5Cv23Dfx/Gohg==
X-Received: by 2002:a2e:240e:: with SMTP id k14mr14238826ljk.178.1584274798808;
        Sun, 15 Mar 2020 05:19:58 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id q4sm22393707lfp.18.2020.03.15.05.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 15 Mar 2020 05:19:58 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH 2/3] libxcrypt: add % to match recipe version string
Date: Sun, 15 Mar 2020 13:20:07 +0100
Message-Id: <20200315122008.22161-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200315122008.22161-1-liu.ming50@gmail.com>
References: <20200315122008.22161-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Or else the changes in libxcrypt bbappend would not be applied.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../libxcrypt/{libxcrypt.bbappend => libxcrypt_%.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/libxcrypt/{libxcrypt.bbappend => libxcrypt_%.bbappend} (100%)

diff --git a/recipes-core/libxcrypt/libxcrypt.bbappend b/recipes-core/libxcrypt/libxcrypt_%.bbappend
similarity index 100%
rename from recipes-core/libxcrypt/libxcrypt.bbappend
rename to recipes-core/libxcrypt/libxcrypt_%.bbappend
-- 
2.25.1

