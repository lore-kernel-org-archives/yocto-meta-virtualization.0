Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.3554.1599613736597251852
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 18:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lL4g2FtE;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: bengampe@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id m5so797875pgj.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Sep 2020 18:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nMwLEfqdqH2RDyJXXHd4svSkVa36vSrOoNfyshDVgY=;
        b=lL4g2FtErPqvmw/JFsvKgd1gOV65Ar2e3ceCdGGB2ysw1ozVxmeqLAasHo/5wySBDv
         9VddR8+UjcrEt9LQHw7tKAfrhYUF6wrqLfmd9d3vAD0+63+ZI/kW/W3LzvuEfeLnZGqY
         RPtMyOYoo+8wztLUN7hhR/KxKqu+RHdlkKG+3h9u7/HRfyX62q1bFOPaI/pe5kVBONtL
         QVVj/WIrJlSIX5yjQOsQ13FRHZvPdMgShbXhK+TBJoIVSlMmzudkklpPzfpdlDVII0VK
         7pOT3VmIhW2PGd6Ttz6nfichF6YUNUwnAn1hDJ7Gq84f2rTnsfEwdpNOBDA8zIKZoeGP
         ttPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nMwLEfqdqH2RDyJXXHd4svSkVa36vSrOoNfyshDVgY=;
        b=eY8wz4OmzF6XySyVYT0ZYDQ7WPa/0B917Tv7pHUHUSZJoof9ripp2uX7Fgy14VrrjH
         GJV3oqbQyDq6dXK/FlQeXSgtvo4zX3UO4YOZJR728M8Oxrd/3t9u48kHuwPMwsFSwBZ5
         C/KyZA6KzRCX8xvU4LrV5UeAAxMf3Avz1/wXJt4WbI12TEHpjC79MkH5Z94mWTV+gJBY
         WyTW6M5KwqZN6hsG0LHPpjtmybQgPeKHGDtOyhJ+6gJSF9VnylRN8YvmYO9S5ZmG4eUK
         q/yW5JYDlwTgqaD1wZuiSCA5BK4E34ULSm7Ys6ofFe2/tCiT8kwrbJcHGmtCRwRbE0BS
         WOtQ==
X-Gm-Message-State: AOAM531dk03ZE4k8thnD8p1zrUDIaY4AdshNczY0LiRRAvM2MuD1txhd
	W+YIvGzaBNuJYgUzJX4NfdQCh4ucQ/Y=
X-Google-Smtp-Source: ABdhPJxq/Qc8y3YHBLcBwI68eLvQrv0DsHmzKiRYRX+eIetGjZMYQ1ijU2iQYg6GTOOo/S/1Wtys/w==
X-Received: by 2002:a17:902:a981:: with SMTP id bh1mr1207288plb.157.1599613735697;
        Tue, 08 Sep 2020 18:08:55 -0700 (PDT)
Return-Path: <bengampe@gmail.com>
Received: from beng-dev-laptop.beng.bne.opengear.com ([138.130.51.128])
        by smtp.gmail.com with ESMTPSA id x9sm397572pgi.87.2020.09.08.18.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 18:08:55 -0700 (PDT)
From: bengampe@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ben Gampe <bengampe@gmail.com>
Subject: [m-c-s][PATCH] python3-distro: include as RDEPEND for salt-master
Date: Wed,  9 Sep 2020 11:08:01 +1000
Message-Id: <20200909010801.13579-1-bengampe@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Required for salt-key with python version > 3.7
---
 meta-openstack/recipes-support/salt/salt_3001.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_3001.bb b/meta-openstack/recipes-support/salt/salt_3001.bb
index 4beef5ba..04ef1c7c 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.bb
@@ -127,7 +127,7 @@ FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_system_u
 
 SUMMARY_${PN}-master = "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
-RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack"
+RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-distro"
 RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
 RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
 CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
-- 
2.25.1

