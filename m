Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.11156.1593187981645671570
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 09:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oLEqOu0v;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 9so10929209ljv.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCAbT5uSP/tWoZfwvsZZ2LK34Eu3lW/z+CFWH15RkIc=;
        b=oLEqOu0vccA+jKmy8+Q44yKirMO8lY9owgpnvnDqk/s/EDyaHiOkeGVBZzwjonEJnE
         6HEKqvn5dx5MEu5/S4xCEEjwtd8NQwTnp8o6loM1NlZczoscUXPBLdm3q9MQvXpZUwwV
         AoUENesY17vkgRxn70xMQv/O3R8gtlGygwjNOak8ZJd/ecwxc/JzhggdOq4ZEMKCvG+T
         +0a9tFOPSwL2e+TCHcdRHAD1KlnFHlt/iQmt4wwIzzIS3fF/fJVbVSVm4rtztKecH2B3
         IEMzY1XRYQW13BguRLHeQAVa6oputsMflafC8ZbJEMhnz53AM2s8Y5Nhz/pf80+SQZcU
         L+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCAbT5uSP/tWoZfwvsZZ2LK34Eu3lW/z+CFWH15RkIc=;
        b=HfW6/xI0e7NQQ6rO3k7C/OBt5md2qaAJ6hI+xQGrNd/Oxk/JSQXLxO9dAEo/uFiGaT
         u58i1iSi99Xf/NclQeD6prjd01GO0W+gXbtsMjFW+5FyVkxdYCNcMfN9g0Qt1ZhaRqZw
         Btz7plBTGDAedWQIUSjkeiAVez0VtaqDR9QGzZYcoDlilRfyHK3hf2gdeZHu8eswuRC6
         JF9tbU6ivsWNNwohONQxpRhd2WZE3UN7TiwN8i6pvGm7xbVSNhcpZ07xk19IoKCU+e99
         Tn7Nj/EOiUsL8IMlEvBktI8SeAOOj9o91+W1MijIUiaa/c+H0XmuaKcYaqev3e+tr1qH
         eoOA==
X-Gm-Message-State: AOAM532zH47qrL/j4AfVrrwatlTyjdo/GSwwrj7kI2zVgImq7FRQPerM
	40D1T+/98FUfqJqS0qNtAnAhLmzR
X-Google-Smtp-Source: ABdhPJw0aRbobz+TvMA619kvafbCqUc138usgEVLh7aygG31BgZOD6vOZOe3MNCU1O4YHtBGvLFtEw==
X-Received: by 2002:a2e:998c:: with SMTP id w12mr1943338lji.143.1593187979459;
        Fri, 26 Jun 2020 09:12:59 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id v11sm5558161ljc.137.2020.06.26.09.12.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:12:58 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-dotenv: add recipe
Date: Fri, 26 Jun 2020 18:14:31 +0200
Message-Id: <20200626161431.32254-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Shell Command and Library to write and read .env like files, it's being
required by python3-docker-compose upper than 1.26.0.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-devtools/python/python3-dotenv_0.13.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-devtools/python/python3-dotenv_0.13.0.bb

diff --git a/recipes-devtools/python/python3-dotenv_0.13.0.bb b/recipes-devtools/python/python3-dotenv_0.13.0.bb
new file mode 100644
index 0000000..e7644cb
--- /dev/null
+++ b/recipes-devtools/python/python3-dotenv_0.13.0.bb
@@ -0,0 +1,13 @@
+HOMEPAGE = "https://github.com/pedroburon/dotenv"
+SUMMARY = "Python Dot Env Handler"
+DESCRIPTION = "Shell Command and Library to write and read .env like files."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55ee2c3471d386636a719c8ccac40b31"
+
+PYPI_PACKAGE = "python-dotenv"
+
+SRC_URI[md5sum] = "3dfde58c6a5fbd41292c4039a68f70f4"
+SRC_URI[sha256sum] = "3b9909bc96b0edc6b01586e1eed05e71174ef4e04c71da5786370cebea53ad74"
+
+inherit pypi setuptools3
-- 
2.27.0

