Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.16779.1582521587073487820
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MqL40uLU;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E995AE01483; Sun, 23 Feb 2020 21:19:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.216.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C20CE00D33
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:46 -0800 (PST)
Received: by mail-pj1-f68.google.com with SMTP id fa20so3642666pjb.1
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VxHUmxvuaQLqtuYQyZjXKu3Mvx+UeLWan2zlywtsZ/g=;
        b=MqL40uLUAVQ86N4MBMH0smEIwhXz1OhI7TL32VRaBPP48Dm/9VDhA0JwuHmu343Hr0
         b7gURH7eqfHrL8NjtvpP8AVFcnehcbq61PpOmwvscwC7zzZgiCM9C65npzHK0GqzNHMG
         JWJ4Kx3+2tcW//oJCV/yU/11S7VxAuNKZoR++KZhXmAUEoGYUVatxcEY6KIfF+XMIuQ/
         piCwCmI/jRr1v1Me+suaX7gGohr4Z0mvLEQrja/iQWieaLb64bAuHAthCMKKnUPC8tZx
         17G/FvaDYbL5j8GdFLpthlwTV86I6+OtkCGj97ju+WTsniTK/61tWu67HxiiwwALYgxI
         bWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VxHUmxvuaQLqtuYQyZjXKu3Mvx+UeLWan2zlywtsZ/g=;
        b=T7vPZp23ZL6yPIzKe9KacnoPL5Dw8RAszpApfZjaW1dL+qPYASsryRuDFZAFKRVdMi
         VC9TJo9FCLZFIb9bEAMm9MCJPO8JoKOxU37CjwG28neSFjSD1MqVZjU/HSujOaCwtDGf
         SdmdBtD2KDXk2aXqJFTSsOO1qXPc+dit1gRTaNvCE2wGQFOVxMaJh0aIoYV2OA3gvCsL
         ydDRUnJsN/vVLdK8M53Upag2RrKV7cmmiQ5Aa4WzGSvtlAr2JL/0HEF/ZphQ6//tDgQf
         S0Rry1sU+Zw29MPRlE3x+x41txDtF8PHWqAN5itPi+dwgQeMOZPihTJ9RY6dEYsM/drs
         EEBw==
X-Gm-Message-State: APjAAAW0sYLJhUju8CJnddGt/XznSj3EbMtXj8NcigUA4aHJX78gBSEa
	NugVItXlmHFXACDzGA6r85IfRLeC
X-Google-Smtp-Source: APXvYqy5xjZ4ZEACtyiHNQKTP7cYmbJ8+xG4nHtP+2PLTWmGw+qODKC5ozGXy9wahVb1oOg1HGjTYA==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr48875011plo.193.1582521585877;
        Sun, 23 Feb 2020 21:19:45 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:45 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 21/22] xen: add menuconfig instructions to the README
Date: Sun, 23 Feb 2020 21:18:51 -0800
Message-Id: <20200224051852.21933-22-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

    bitbake xen -c menuconfig

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/README | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index 5592b48..34e7977 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -16,6 +16,15 @@ copy it to your Yocto layer as 'defconfig' inside of
 'recipes-extended/xen/files/' and then create a bbappend adding
 'file://defconfig' to your SRC_URI.
 
+To generate your own .config file for Xen, you can use the interactive
+menuconfig via bitbake:
+
+    bitbake xen -c menuconfig
+
+Select the config settings that you want and Save the file. If you save it to
+the default ".config" file when prompted by menuconfig, you can find it in the
+'xen' subdirectory of the build tree.
+
 security patches
 ----------------
 
-- 
2.17.1

