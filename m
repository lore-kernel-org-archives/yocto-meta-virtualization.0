Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.40982.1617528362855738872
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Apr 2021 02:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5jf92eT;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id u17so6750462ejk.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Apr 2021 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQmdF2x2f+Rr8yuXD4mxV+ADmBSMuv67bQH2oRQq2k0=;
        b=Z5jf92eT+9LYVXKkRCg9fwA9M0Gellr6Ruxzc5MDhVUkf6KmEzSuzrF1X0tigtaVHQ
         w4UBGhPYk7beKb5ZqpqtxA0VfgBudtrPgYfpnvhsZd6B3uWJ9P8uBtMLhqAs9+KVEuha
         y3dnI1wirBgM/RX1+zfnUw19WYXMaZUmq3RQ6iKhXM5AjI2xdSS6ELSCin80ANBqz/qf
         prwop3jjG7t8YSSPqrCz4oB6FqFBbGAokdiaFqmrGqFFEX5KweTXCarn2mdyNcrmS6v9
         Zz8pJ7ZBhpGaYKRWF+Pe3jvUEcPpX9nV9oxXpz6L6xjdeARHxSpxIyGeeyK/aMsO7eTy
         SDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQmdF2x2f+Rr8yuXD4mxV+ADmBSMuv67bQH2oRQq2k0=;
        b=ewqfAW1Pv4sJnUq3XbOD0wVyWT6JobRbirBRh597P10S7OZPgCc2XZ8naVa9kJ/oBH
         iXnaVkxs0myLG49Xk4Xw9L+ZmVBd2vmUlfOc+2/44oK2emKtorA2ixRMCocCkhXcwE9b
         EArV8KoLbRHRWtDybL2ArPdW1/sWUA9P8kp+4MjD4c+IubE23n2QN/oKr8Yz9m/s7NiF
         7xRSSXU1yBuIlq9Wm4Ilj53dYw7TtdL2TvTnxC9AkYv6N+fI5R8oSIk88YruqrJ164Rc
         iD/jXHMCDdjIwJyYIpzlyQvCDMFviJNc3jzn2wAA6av8k5f6W76b6zKMJH0/VBK1wo3C
         hYDg==
X-Gm-Message-State: AOAM532l6p3Lz8488ylu1Ow/W6UIbfNQUrgBOViEx2GfwX8jT+xag2UP
	kJIkE8ueJpgkRiJi6kj1SMqg5JEtDYw=
X-Google-Smtp-Source: ABdhPJwrGjQd9c14U06x4mg41eVJ0Twujskm0OO5NXq6A6fvhJlhsLVsZqZ5kPu+PYpcrUOJ4w5LHg==
X-Received: by 2002:a17:906:c058:: with SMTP id bm24mr23015641ejb.335.1617528361527;
        Sun, 04 Apr 2021 02:26:01 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g20sm8098143edb.7.2021.04.04.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 02:26:01 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] dev86: fix ldflags QA issue by passing LDFLAGS
Date: Sun,  4 Apr 2021 11:25:58 +0200
Message-Id: <20210404092558.2059318-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210404092558.2059318-1-Martin.Jansa@gmail.com>
References: <20210404092558.2059318-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ERROR: dev86-0.16.21-r0 do_package_qa: QA Issue: File /usr/lib/bcc/unproto in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/bcc/bcc-cpp in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/bcc/copt in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/bcc/bcc-cc1 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/ld86 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/ar86 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/size86 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/nm86 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/as86 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/objdump86 in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?)
File /usr/bin/bcc in package dev86 doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
ERROR: dev86-0.16.21-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/dev86/dev86_0.16.21.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/dev86/dev86_0.16.21.bb b/recipes-extended/dev86/dev86_0.16.21.bb
index d38f7bd..cf64a9d 100644
--- a/recipes-extended/dev86/dev86_0.16.21.bb
+++ b/recipes-extended/dev86/dev86_0.16.21.bb
@@ -10,10 +10,11 @@ SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D}"
+EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
 
 do_compile() {
-
+	# ${S}/Makefile does respect LDFLAGS, but ${S}/cpp/Makefile doesn't when building bcc-cpp
+	sed -i 's#$(CC) $(CFLAGS) -o bcc-cpp#$(CC) $(CFLAGS) $(LDFLAGS) -o bcc-cpp#g' ${S}/cpp/Makefile
 	oe_runmake make.fil
 	oe_runmake -f make.fil bcc86 as86 ld86
 
-- 
2.30.2

