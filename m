Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.48672.1600715121293433958
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 12:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=w8ZW+Tub;
 spf=softfail (domain: foundries.io, ip: 209.85.219.52, mailfrom: ricardo@foundries.io)
Received: by mail-qv1-f52.google.com with SMTP id cr8so8036104qvb.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Sep 2020 12:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eHfQn+lCAY1iXg5PY+gOZwYAfkiweYHFfD51w/5mcQk=;
        b=w8ZW+TubxM5iMd0e89XRDpFcXpFD716f7Q3IxT3eR3HlbahDwMjR/5MwD3kSxBwkgf
         LZtdPxOUadcC1b5v7Az+TlHs4WpzeclgqQab9Y5i28T2BJc7PQkI9+dGqvQlu5JkjaS3
         F1XhI342fTk5ppoNRoP0o8OunZS36nn5fVc1jATSlh0W5JK2sHz91WorGfJTzyHCLeFG
         Jo27tjHAEyZQeQ8wBilLxbTjN8zhoPdzF0qvLpU4sNQc10GjvEMZOKVqJZqt3AKZvDrX
         0YXHmrtIpRBWXPhdqNcQo8g5yQzJMis2Ab8yGsF6D+r8wkyIMQs9Yg+FiKIacpqVBgvb
         TGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eHfQn+lCAY1iXg5PY+gOZwYAfkiweYHFfD51w/5mcQk=;
        b=ilKY8tS6/zryE0WfH2v50L7q31LB+skF/yynErAiWmjtztHc4IpdDq4BTJm5rz2W8p
         ogQFaA+j626aPkaQ6vI1jyJsO9h65HEVg1DIUQZF+qXaRzkH76AiI39ZVD14fcVf8AxA
         +0ICvZvwn37ksz0PzV913GfuM7YmTdRAkgwmDgZbhnvet+sckxKeoD0fiad/hFPvy38d
         yCTCSuc0KvydGrZf/jPNu85J8QbsOoaWxfLHhu7QKvjW2DUSmaIhLjK3k6WBFCH2P9kq
         SGZLrwMH4xTYquIrrt3U3zIrSbRj5OEPT2u82ywvNRcPzoXcnshzUngVDuoRr3NoD35+
         m0PQ==
X-Gm-Message-State: AOAM5305oFeQjnfrRMY9Cu1gazjahN95DMhRQQ4L2kIb5waYvllgzYb2
	OisqlijQU38nFt3ppe3bRmtqVLLELIQr
X-Google-Smtp-Source: ABdhPJxuvvbcLTnOOKAHy97vMBlKM7EH/KPRwQCFGVuc0JvNsRtSk3VGYWosDz8Pe76BPjTzxAKBfQ==
X-Received: by 2002:a0c:efd2:: with SMTP id a18mr1599307qvt.54.1600715120136;
        Mon, 21 Sep 2020 12:05:20 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:5fec:886c:4f96:30b8:57fa])
        by smtp.gmail.com with ESMTPSA id g14sm9902936qkk.38.2020.09.21.12.05.18
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 12:05:19 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-texttable: remove recipe
Date: Mon, 21 Sep 2020 16:04:48 -0300
Message-Id: <20200921190448.20625-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer version now available via meta-oe/meta-python:
- meta-python/recipes-devtools/python/python3-texttable_1.6.3.bb

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 recipes-devtools/python/python3-texttable_0.9.1.bb | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 recipes-devtools/python/python3-texttable_0.9.1.bb

diff --git a/recipes-devtools/python/python3-texttable_0.9.1.bb b/recipes-devtools/python/python3-texttable_0.9.1.bb
deleted file mode 100644
index 25e402f..0000000
--- a/recipes-devtools/python/python3-texttable_0.9.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "module for creating simple ASCII tables"
-HOMEPAGE = "https://github.com/foutaise/texttable/"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "a712b5a5464d51c5fc43c64d9d2cd0de"
-SRC_URI[sha256sum] = "119041773ff03596b56392532f9315cb3a3116e404fd6f36e76a7dc088d95c79"
-- 
2.28.0

