Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.3724.1599613962677518195
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 18:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ew9uIl7V;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: bengampe@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id jw11so494071pjb.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Sep 2020 18:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv13POyWIUuycLGXZlseCekwOdHw3Bov4CXrFcXahpA=;
        b=Ew9uIl7VxTEnRP1dxBR7BWJ56tcwJrRTkFcfP1GZBZA5PisSkwEu3Bq3AC7z1ymfW3
         +XFCs3j6EwBKpqRW5SFvknVZhByTTAW8tlpI5QECciQeH9E6QSl2p5Bu2394ZTC8od7u
         8znI7o/9NB53sZy4DEvzng3QFI/0FoME4wE6HsfrAhdCElCCIWrY/9g12ltFNAfvXJnm
         I2wFn6mPrgZwHbYttDwfhyTuyM7/KsZf4GzNhDbNhV5sgx/FYK1/YP5hd8EXw13bf0Fx
         T6qUParEZccCG6FXdmyFLFMGTNFivA/zPxKsk7zJbzfaaLH2PU9SvMGaDdMD1g4ODtsA
         eOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv13POyWIUuycLGXZlseCekwOdHw3Bov4CXrFcXahpA=;
        b=bgL4Lo8KujSAdkUDq22cJMhEKKtbzP5yMBPD1gkpH3G/f+uZeLIT8oAhMR66Mc1kYH
         PUgvrwM46+12DB/WWFdnVgf0Up8+8L+skfqfdnIivaVzVox+sI0e4P1ZDujbLLFEVT6i
         OCFa7c4kAZ+YJ7bGw5bUukimobgyvzbMVtMPQb2IpLIqgGH2t3atEkOS7PGNnZQOPWxc
         0h5WL2JgIt1xZl8oW5ysedSic6pjGHruzGl9xtybBiZ/68je5vc+YmPe+Ot18wqs4Gok
         aqkSRPWXDzkiI0xeZFysSycgZOi3/AuAOjSlqyd9ozTNEAmPQOlvUzA66MUg+xbI9Bvw
         Mcug==
X-Gm-Message-State: AOAM5317loHhpmdgmmfG2rZ41Xj/VTWtFE8yqNdBtp4G5vX32sSvJtoU
	DzyYxgtVnx7r3DwFBtX8QI/sbvRxA0o=
X-Google-Smtp-Source: ABdhPJyMtCvoOqpSNcuExfBmDfloI9jBlE62eJUcgOaa+OSzDjDUlFspI8tciZ0QtHzVf8GKk8v9Ag==
X-Received: by 2002:a17:90a:de81:: with SMTP id n1mr1387801pjv.92.1599613961919;
        Tue, 08 Sep 2020 18:12:41 -0700 (PDT)
Return-Path: <bengampe@gmail.com>
Received: from beng-dev-laptop.beng.bne.opengear.com ([138.130.51.128])
        by smtp.gmail.com with ESMTPSA id x3sm607055pfq.49.2020.09.08.18.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 18:12:41 -0700 (PDT)
From: "Ben Gampe" <bengampe@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ben Gampe <bengampe@gmail.com>
Subject: [m-c-s][PATCH] python3-distro: include as RDEPEND for salt-master
Date: Wed,  9 Sep 2020 11:12:31 +1000
Message-Id: <20200909011231.14564-1-bengampe@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Required for salt-key with python version > 3.7
---
 meta-openstack/recipes-support/salt/salt_3000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_3000.bb b/meta-openstack/recipes-support/salt/salt_3000.bb
index f80ceb65..5ddb42bb 100644
--- a/meta-openstack/recipes-support/salt/salt_3000.bb
+++ b/meta-openstack/recipes-support/salt/salt_3000.bb
@@ -128,7 +128,7 @@ FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_system_u
 
 SUMMARY_${PN}-master = "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
-RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack"
+RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-distro"
 RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
 RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
 CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
-- 
2.25.1

