Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.6632.1620985925528503166
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dTPlN3k3;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b17so34066728ede.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 02:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHcFylfmkfiU+S5Y7IY4Na76rystM9SHANlOq9hGPnc=;
        b=dTPlN3k34kT0LNQfTYF6fakHygmANIicdek5VeMba8DhfJm5vRzglsOmkgvqMwAq22
         o/DE51z0U6sokrC+pWZtbzM/yNDW5uqq4YO798+Zhtr1qINbjulvVzkH6sTA2K2EeIdo
         zhTxU+/NWEMlKBjKqkV8euscvOyU07cHyB9+W/tUshYXoiStofwe5zZCaaZc3Y8X9Qn0
         N4sQXO3fSgmNfElz20yYv3GJ10csCjS/ExW1OiHUHY3Wf/O2nEs9tyFmzPpC6tYA1Shf
         hrviQFDsTXE0EYpfbuEoMMv1d0VypLdvjnrdfYJvO2KGT5iNWtfABJQbDFqkpAZ629KN
         U1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHcFylfmkfiU+S5Y7IY4Na76rystM9SHANlOq9hGPnc=;
        b=nGIRIHn1cwQjrYdXHFxp4R8IwqH/z+un+QaMsLP8dR4H0wkKe3Dbt02ZdkTiMz8xbo
         ANyMITpSA63WJhtWBnRe9MuqSST16QxPSMUsqd4go8QXU0tyxihJnQ6YV9VKpMDVw8bx
         BQJ6BNRkk0LZbnRqcb9uisajjX8vwdnQXo6FhEqfeQfwtAWUroZ6Fp7+pQmyLk4hhzw/
         8lwmjrinWI/UtKOvRoktq2aQrt2AfhWDqCEgNite9r4M30njMp6wbKW6wazi5gKMFcUt
         /YvWf0Ok71ynUC7cLixYlV+VkigU6KZtcFFTrsBtSprW/f5Rp76ARazkvfqRaiTnRxO9
         hEvQ==
X-Gm-Message-State: AOAM5302v2wo2HsNmo28ifoSO25BCuOeXaXDfHi4jZHuTb48Q3YAanSO
	YwwG3kNiDJXnJT6mwkMKsTK90/SYXxI=
X-Google-Smtp-Source: ABdhPJxXeVguXo9MPpcHRxYLUZd0duv9xM2Uh9R3nMpAybkd8ZiT1ZrhSASOr+9r7nP2xM25zuzzkQ==
X-Received: by 2002:a05:6402:6d9:: with SMTP id n25mr47286269edy.229.1620985924043;
        Fri, 14 May 2021 02:52:04 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x9sm4243493edv.22.2021.05.14.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:52:03 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] upx: fix build with gcc-11
Date: Fri, 14 May 2021 11:51:52 +0200
Message-Id: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-MyCom.h-fix-build-with-gcc-11.patch  | 31 +++++++++++++++++++
 recipes-extended/upx/upx_git.bb               |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch

diff --git a/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
new file mode 100644
index 0000000..8b07c77
--- /dev/null
+++ b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
@@ -0,0 +1,31 @@
+From 8fe8cd22163fe11b791aac15b642d122ea98b9b5 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@lge.com>
+Date: Fri, 14 May 2021 02:26:13 -0700
+Subject: [PATCH] MyCom.h: fix build with gcc-11
+
+* fixes:
+  ./../src/lzma-sdk/C/7zip/Compress/LZMA/LZMAEncoder.h: In member function 'virtual ULONG NCompress::NLZMA::CEncoder::Release()':
+  ./../src/lzma-sdk/C/7zip/Compress/LZMA/../../../Common/MyCom.h:159:32: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
+    159 | STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0)  \
+        |                                ^~
+
+Upstream-Status: Submitted [https://github.com/upx/upx-lzma-sdk/pull/5]
+Signed-off-by: Martin Jansa <martin.jansa@lge.com>
+---
+ C/Common/MyCom.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/C/Common/MyCom.h b/C/Common/MyCom.h
+index b8dbf38..2e3c54a 100644
+--- a/C/Common/MyCom.h
++++ b/C/Common/MyCom.h
+@@ -156,8 +156,7 @@ public:
+ 
+ #define MY_ADDREF_RELEASE \
+ STDMETHOD_(ULONG, AddRef)() { return ++__m_RefCount; } \
+-STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0)  \
+-  return __m_RefCount; delete this; return 0; }
++STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0) return __m_RefCount; delete this; return 0; }
+ 
+ #define MY_UNKNOWN_IMP_SPEC(i) \
+   MY_QUERYINTERFACE_BEGIN \
diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
index b77e658..96d2e99 100644
--- a/recipes-extended/upx/upx_git.bb
+++ b/recipes-extended/upx/upx_git.bb
@@ -2,7 +2,9 @@ HOMEPAGE = "http://upx.sourceforge.net"
 SUMMARY = "Ultimate executable compressor."
 
 SRCREV = "4e1ae22a1a07be5135c68b25ff05058ae8ae48e1"
-SRC_URI = "gitsm://github.com/upx/upx;branch=devel"
+SRC_URI = "gitsm://github.com/upx/upx;branch=devel \
+    file://0001-MyCom.h-fix-build-with-gcc-11.patch;patchdir=src/lzma-sdk \
+"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
-- 
2.30.2

