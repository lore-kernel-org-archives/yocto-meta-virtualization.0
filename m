Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.34321.1617479499593722097
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 12:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X61Jy/U3;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id u17so5377520ejk.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Apr 2021 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OZHxwsZv7DEzQRpwAeC6AdK8qShRmpbGfKi8NqYJiw=;
        b=X61Jy/U3CIz0s5mh94IdZcIvKNN829Z/MQAlsE245mg8/fWmu0oiKznoeqR3vOYXJS
         +/QYxpz+zcJbUmYy8iNSVpJ/5ROAsMApJLSaZuCd7DSsZe0q4+syUVKY0ZzljBTIghNe
         CHP2YWG30GOmtcEDn5KX9RynDo8o7pNHILURxVSLYwcSrLao7UtuvO34V7pg66x7dkWp
         Hf8Sb8b1hZtWw9U0H+QmNEcF+gc3ZaptBjVndKJLIlD/aIn3Xsb7X9546b+3h/SY/fb6
         6DiTD0C7R0Oge88z6UWzUstxvC2fimPCU0x+giYE1uBsvdN9Nb0qmCdqhvuI2jUPI/Sq
         3NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OZHxwsZv7DEzQRpwAeC6AdK8qShRmpbGfKi8NqYJiw=;
        b=nIi4oWI9aucFO4B4ypR/qIsHMpJ5AfYRFtrtr82V1KlB7NNOn354I7meLyh06ykWfb
         qhwKz9yfhF2GOsuz5P6IedQCexarI894N1PwiGz6TXesQfNf9wAHsMLfq82hOsW1DTb0
         AGUk65sCnekfSJ9IhEnU3DdR90cRaqJ90yubnZ+8c13MTXd6h1IsOumvGnC9q4zaV6VY
         az4k3UDtDIL5IP7HyMYVfhvGLoep/1OvJlsEiEFGGMw3CVJxzqEZ1xEsCGw2/QkrsWgi
         GUHbAhQ7imuruoiAxEy1SprBUqwRIM152v5+E8Z3HrZn2LCHu8TATPaOwdGq/qPMNeVu
         uIQA==
X-Gm-Message-State: AOAM531fl0U0a/AHHNhwe0w83GqUJgSmW994UXMKcNSg+sL5OqJ3Vq0N
	odTUH41WPKM5OhlbTWw+Tun1ILdPmkk=
X-Google-Smtp-Source: ABdhPJwGeoZdpsMe7WO5pqFWLoG1M9QYLwHPfPCiOLIoL4STCeDbv6UHfY8/vKXEm+HuMdIbCfUSnQ==
X-Received: by 2002:a17:906:d9cf:: with SMTP id qk15mr7124735ejb.415.1617479498275;
        Sat, 03 Apr 2021 12:51:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t15sm7598710edw.84.2021.04.03.12.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:51:37 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/5] ipxe: add the same COMPATIBLE_HOST restriction as syslinux
Date: Sat,  3 Apr 2021 21:51:30 +0200
Message-Id: <20210403195133.1401406-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* this depends on syslinux

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index d7c60ab..7b76817 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -4,6 +4,9 @@ LICENSE = "GPLv2"
 DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native xz"
 LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+# syslinux has this restriction
+COMPATIBLE_HOST_class-target = '(x86_64|i.86).*-(linux|freebsd.*)'
+
 SRCREV = "18dc73d27edb55ebe9cb13c58d59af3da3bd374b"
 PV = "gitr${SRCPV}"
 PR = "r0"
-- 
2.30.2

