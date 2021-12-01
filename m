Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.94830.1638376919789618114
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U+5c5tz9;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id o20so103604978eds.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vbOKSaDzv6OQFx16gYzoOnBEVC6ftotAHIQemIpeeOg=;
        b=U+5c5tz9XXKnzXAtiLOnaqShG+7ChlFGYxbiy6tC+cMPMG09MU8m28w3TiGMvKL4hA
         GyuQdOknClHNNVh8hLs6jLBkqUvqzPufckEqsxvx2KvgRrGviRvgCUUt/a7sMk5k3t1H
         7EWFLfdREvlBowVlOS4ARis35beQLRElnfREAYJU9uo/jjFWK+eLlMq49Zajowjf7Rtp
         5KQodVEw+nblOVl8+Rru3Cfu+IVxF/FfdJwO1uc5HVeyEmeNUxJRRnCY35dJ4hpeUKmT
         z3ebHkgcS6taFCbpetdvpvJ5Dv8Fi0ZNvf8kDSbSD0jA+GAqKC8fBBfhm5I3E0lyY1OZ
         /UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vbOKSaDzv6OQFx16gYzoOnBEVC6ftotAHIQemIpeeOg=;
        b=hVIfomiS3+crzAjzbGqpYAoKpsINJUUzSu9z/ZFv6gIMNYFyog3SnErvcCrsH7g8ix
         Ibk2BTsnOEu1u3cKZ3/Q+WnXWqJqlJx850Vn4BmAdzmt7sqqdMGqGuYtgNHr3escSBAa
         l7KmjQpFBINN98hXEkyBDAq3ZPZRREZU+YC+QHlU2rRhHiiceMHQPyVJULHTd8swHbfP
         X9GvbYVehqQpGTFbqr0c39Cw3MmFr3eol2C0j7VVk/R2onq5bBJKNY6GZdDLib65S4oG
         WmWKq1tKiC9niz45tR2Xz01IOIy8L14uQ7XithXk9fCET4NNHiUHI7Qei7wl6+iwgZhO
         JFnA==
X-Gm-Message-State: AOAM532tdE7uhDZ5urfEj+gBicLBCzPchi2X+tRfuw+r395TQFs19Okp
	bm1QBYRXJCfmQ9SJBr1rpZtaGD8EH24=
X-Google-Smtp-Source: ABdhPJx4X2UjF1ONo5YWOPAeqvGf0nYdZDlU7Dmv0+nizyQboAV7cMbyH7+EvvFdXq5LYinaY1BenQ==
X-Received: by 2002:a17:907:7b98:: with SMTP id ne24mr9167224ejc.14.1638376918353;
        Wed, 01 Dec 2021 08:41:58 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p26sm141820edt.94.2021.12.01.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:57 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 12/13] dev86: work on all hosts, other cleanups
Date: Wed,  1 Dec 2021 17:41:35 +0100
Message-Id: <20211201164136.33802-12-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Remove COMPATIBLE_HOST, whilst this is an x86 assembler there's nothing to stop
you building it on or for arm64 and assembling x86 code.

Override INEXE so that binaries are not stripped and remove INSANE_SKIP.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/dev86/dev86_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index 9488d90..ad7a0df 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 DEPENDS = "gperf-native dev86-native"
 
 BBCLASSEXTEND = "native"
-EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}' INEXE=''"
 
 do_compile() {
 	# always regenerate token1.h, token2.h for deterministic behavior
@@ -45,7 +45,4 @@ do_install_append_class-native() {
         install -v -m 755 ${B}/ifdefg ${D}${bindir}
 }
 
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 FILES_${PN} += "${libdir}/bcc"
-
-INSANE_SKIP_${PN} = "already-stripped"
-- 
2.32.0

