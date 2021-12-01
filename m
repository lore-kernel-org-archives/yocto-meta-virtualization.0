Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.94490.1638376910991867020
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d2hX9v0g;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id o20so103603366eds.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OAJCHKEECDKufWAUvcJZUNIayJgVGKKJyjdUztv4nBc=;
        b=d2hX9v0gQSL8Oh51j+qtXveOV2HxAs3yHJYoSkYhnqCYjCc3N2XL7VSlKhfCgd9K2p
         rHx0WggyDq6l95Nu2lgYl3QAXuP2ve58SZYzHi8xgZsr2JRt5VpnktfNUl+1jhmfZ/di
         afLpSTwyA6qCVkUBPttiy3VtEWW0DNSjD9SPSwz6yDFsbsrKVFEEEip3w/NA2nQQINXK
         UUaAlSzJvkMXJ7ew/rECHwr+qQ4tvLVUbKXUEPjGdvYKyHb+VP8FAv2OudU8EVUm3Izz
         AB6aPx40/tGlNzh9iDXujsomcTWk54+DlEzcjuJ2jklK+aZuWCxBLIfYN71putBQDr+r
         Wc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OAJCHKEECDKufWAUvcJZUNIayJgVGKKJyjdUztv4nBc=;
        b=Fsowxm+P8M7s97c8YGsw24Y2/dl0H/7cbatv+HZ3lc8F+o1OctHTZ7XgTKqdYpYAKi
         N6kTmZfDjzYqc6VSvauNfVDLaILvkYpi+GYNgbF4UHB4K/8xhru3hAE3Uptxb7wZigvz
         v+4p8AeMMtbjw/VA+dUK3PeC5lcUrmG7MmUTcWvJCoWuhtVlh6dbt2L324bsFMwQnYjU
         KeoW2zLmS7eWFUY7IpttK0z06OCmEiTRkSDUrbpdOVwFcadbaJKaWGMQ/29XimL9Iqh0
         b9RrU30nLpgyLMwmkKsTgIMQwwyTtu2BPjL8dZcwZT2cVYR3RPEWEabZk61FRe1wBZYH
         I6Aw==
X-Gm-Message-State: AOAM5322QSk744vAqzTLyiffI0Tta91arkkakkZvAPHdeNlWDCIqBjop
	txjJt254uvIa+lJftj/9o/dIEubx4AI=
X-Google-Smtp-Source: ABdhPJzk99voN626f4GWsrhBESvr118I7ZX7uRU3yZOMPu5h7GXqlfHFo7axA3EGesJ4JUOgNEeBjQ==
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr10259035edt.402.1638376909479;
        Wed, 01 Dec 2021 08:41:49 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hs20sm151325ejc.26.2021.12.01.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:48 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 07/13] dev86: add dependency on gperf-native
Date: Wed,  1 Dec 2021 17:41:30 +0100
Message-Id: <20211201164136.33802-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fails to build on hosts without gperf:
  /bin/sh: gperf: command not found
  Makefile:27: recipe for target 'token2.h' failed

* normally this isn't triggered, because token[12].h
  are included in git repo, but regenerating them fails:
  tmp-glibc/work/x86_64-linux/dev86-native/0.16.21-r0/git/cpp$ touch token1.tok
  tmp-glibc/work/x86_64-linux/dev86-native/0.16.21-r0/git/cpp$ make bcc-cpp
  gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
  /bin/sh: gperf: command not found
  Makefile:23: recipe for target 'token1.h' failed
  make: *** [token1.h] Error 127

* unfortunately this isn't enough, because new gperf 3.1 from oe-core
  isn't compatible, we need to upgrade to different dev86 fork which
  contains:
  https://github.com/jbruchon/dev86/pull/19

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/dev86/dev86_0.16.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/dev86/dev86_0.16.21.bb b/recipes-extended/dev86/dev86_0.16.21.bb
index cf64a9d..def7c5c 100644
--- a/recipes-extended/dev86/dev86_0.16.21.bb
+++ b/recipes-extended/dev86/dev86_0.16.21.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
+DEPENDS = "gperf-native"
+
 BBCLASSEXTEND = "native"
 EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
 
-- 
2.32.0

