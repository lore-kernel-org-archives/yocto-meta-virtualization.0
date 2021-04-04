Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.40981.1617528362140241481
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Apr 2021 02:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RrjvQFBX;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n2so6779381ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Apr 2021 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY8KQS4Q1NFBKnOU1L/jTzI2YL0UbjtNY77lvtaKN7Y=;
        b=RrjvQFBXaXHtc+tqSEErmOY8UcbnYDo2cF7k5pYX7Sjp7tM8PpwHvTeDq8wiCsq8Ng
         piBV0C06nxhQNS1YL5Jhx7lY9t7V5+i/WacrMS/LTmtEbNvCHFc+1Q5EV3aiEhdFrOOx
         bXEX+6ptp0xo0nORc9kFwThZw+Sp1/hwPBo5g1SmSy/hv/469ueMUz2+b/YDem/koANW
         WLIA+DX6L7RUql7rrgaDKY7qHlVp13NI8WYvVl4yn1YdfoPKwq395n4EZA0Di/DbrEsG
         eT1cy/E9r/zAC4gNntxob1Eu+iEnoNYEmEwYkl5JX/TPd+/wX9fbH+0ioyAjO4JbiOAA
         jcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY8KQS4Q1NFBKnOU1L/jTzI2YL0UbjtNY77lvtaKN7Y=;
        b=n77FvXrJZhKU7Kgo9w7RtCR+NTrQ9cM3X0b0NYJwhAubLx1SGzvc7F64US6vZT07/y
         aET8yqOemeI9Fej0OE+dMG1o9MwMRS59Fo8cN2THwXDEcL19MKAb1usKZfy022VpKxxB
         BqJhmc1my/nNeUJd225Dj2x8GEVmeYXneHuq1fZcg6TODYtPmdVD5fluyziOaX863Y7u
         Dc9RAJ+kOLT8YIbokuXAu4/pbnTwC7MHwmIAGI1E8Op/7Pmjgigqdk6oMVGBKjdtkSxh
         ++5xTEBuj50ZXDpR6zocd4Id2VL0YJf9FRXIk3+ygsyx4UExzVqCW8zgbUuQg4kVG+H8
         WB3A==
X-Gm-Message-State: AOAM532Mf8VuCkqFSAx1wPVIU55GqO4nliS25WzyJgSB6iwjKxn32k68
	KFWB2yXqUw7Kf6bZNmG3WHB21F/1ZoA=
X-Google-Smtp-Source: ABdhPJziSdNyRxHTjW8CtDsEz6WDndiXPYR2h4SiLnyTe+sQyY1W95SbO/wyc0cuOqkr5shkBA6eaQ==
X-Received: by 2002:a17:906:90c5:: with SMTP id v5mr22990285ejw.466.1617528360638;
        Sun, 04 Apr 2021 02:26:00 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d19sm8316173edr.45.2021.04.04.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 02:25:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] dev86: upgrade to 0.16.21 and fix SRC_URI
Date: Sun,  4 Apr 2021 11:25:57 +0200
Message-Id: <20210404092558.2059318-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* don't use github archives
* upgrade to fix build with security-flags.inc enabled, fixed upstream in:
  https://github.com/lkundrak/dev86/commit/537e806f8c62b26c5d5fa912f383f4a7d558574d

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dev86/{dev86_0.16.20.bb => dev86_0.16.21.bb}         | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename recipes-extended/dev86/{dev86_0.16.20.bb => dev86_0.16.21.bb} (76%)

diff --git a/recipes-extended/dev86/dev86_0.16.20.bb b/recipes-extended/dev86/dev86_0.16.21.bb
similarity index 76%
rename from recipes-extended/dev86/dev86_0.16.20.bb
rename to recipes-extended/dev86/dev86_0.16.21.bb
index d93e487..d38f7bd 100644
--- a/recipes-extended/dev86/dev86_0.16.20.bb
+++ b/recipes-extended/dev86/dev86_0.16.21.bb
@@ -3,14 +3,11 @@ HOMEPAGE = "http://www.debath.co.uk/dev86/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
-PR="r0"
 
-SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.tar.gz"
+SRCREV = "c6f36cbafa979710b809f117562773dbd6825918"
+SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
 
-SRC_URI[md5sum] = "288af53f256300777efc91d97c082fda"
-SRC_URI[sha256sum] = "533f2a0d2ed61223040f27e5cd007a11d969aaf34f6b709ece122b1e6fc50580"
-
-S = "${WORKDIR}/dev86-${PV}"
+S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
 EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D}"
-- 
2.30.2

