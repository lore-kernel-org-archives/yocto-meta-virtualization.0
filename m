Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.6097.1604766282554678159
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 07 Nov 2020 08:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r6DEqVov;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r17so491258wrw.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 07 Nov 2020 08:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AILe6PHlapViGgFuUpWEccijPJ9nOHdKMXcEWj/DIFk=;
        b=r6DEqVov7AnIIVFthJIFUpR/eUMlr0ky3aEOqFRdNvwujzJyLdCzH/jy1/JDy8h3OP
         FjzhDqcAGgjwDUOl6bpurVw3vUO6pBHmrGYz2rPi3uJ2RXP8ltJ57bkW6UmxUyiGyjbK
         PggPmu+sQ0haW4/Td6V2EbMU64NbH+t3iTCag4U2dcQ4c6Ui5rl9wCOYDjVXn7LyPCdB
         VZQyXNpqhcGxADC8bS7F1a8OoqAQgnPfIHMpFAqdqbaylsaO7pYjVkoPQF10dHZ9qC96
         HLN9O6/j5CklPQBVvHGde6YAgN7z6JXUBK0WbzueETIF1byMUed6PFqYO1QucSyT8evc
         vTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AILe6PHlapViGgFuUpWEccijPJ9nOHdKMXcEWj/DIFk=;
        b=OuhnLY2yvYlzweudFmB74HvWNbXjVWybZGt1E02brX3AZ49RqteFDS6jDqmiJ1Oobn
         XBnReFP912CwRsyg5PCJn8bPKh7uveB4ikMxcAlvbKR8Rr1bvYYhADC0OC3ubAI6s+lr
         89mV9xDwrUdptEZ2CRq/Y5od8ttkAtempE5sN5gWlFRAHtLLDiieIJsjjqGEkXRFJz24
         JryHdyb47/fkmpSwkMC0AGwvcV7/qmkuTrAv7AZSZQh5DxXgHSg7pyUGPQB7KSO0Pnxb
         q6AJtIrRaVfml71FfLP3PPQ1QaQ9iD0klNH0BvaGONUwwy+wnmc9E+8Kui1/iP1MOuIn
         ykvA==
X-Gm-Message-State: AOAM533fNEGP2rYW7HgIEX4ev6p1/fnSlwCvc/UaxaKv/stNTf1T+B2r
	JSKrj1bjkQCLTn45wHRz9SDhXAWc4qU=
X-Google-Smtp-Source: ABdhPJxiEg/MzSXYEbvmbAEPYyyvi1OobtgFSPUaUxAB1409cEnHbdpn+2prg+/jX+pjtiWljhIO3Q==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr8256019wru.232.1604766280633;
        Sat, 07 Nov 2020 08:24:40 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n14sm7112631wrt.8.2020.11.07.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 08:24:39 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] cloud-init: add dependency on systemd to fix installed-vs-shipped QA issue
Date: Sat,  7 Nov 2020 17:24:36 +0100
Message-Id: <20201107162437.1786961-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* without systemd in RSS, setup.py will fail to call:
  "pkg-config systemd --variable=systemdsystemunitdir"
  and then clound-init might fail with:
  ERROR: cloud-init-20.3-r0 do_package: QA Issue: cloud-init: Files/directories were installed but not shipped in any package:
    /lib/systemd
    /lib/systemd/system-generators
    /lib/systemd/system
    /lib/systemd/system-generators/cloud-init-generator
    /lib/systemd/system/cloud-final.service
    /lib/systemd/system/cloud-init.service
    /lib/systemd/system/cloud-config.target
    /lib/systemd/system/cloud-init.target
    /lib/systemd/system/cloud-init-local.service
    /lib/systemd/system/cloud-config.service
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  cloud-init: 10 installed and not shipped files. [installed-vs-shipped]

  when systemd on host or in the systemd fallback uses
  different systemdsystemunitdir value than what OE packages with:
  FILES_${PN}-systemd += "${systemd_unitdir}/*"

  setup.py fallback:
  def pkg_config_read(library, var):
    fallbacks = {
        'systemd': {
            'systemdsystemunitdir': '/lib/systemd/system',
            'systemdsystemgeneratordir': '/lib/systemd/system-generators',
        }
    }
    ..

  ubuntu:
  meta-virtualization$ pkg-config systemd --variable=systemdsystemunitdir
  /lib/systemd/system

  OE (with usrmerge in DISTRO_FEATURES):
  cloud-init/20.3-r0$ pkg-config systemd --variable=systemdsystemunitdir
  /usr/lib/systemd/system

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/cloud-init/cloud-init_20.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/cloud-init/cloud-init_20.3.bb b/recipes-extended/cloud-init/cloud-init_20.3.bb
index 31b4066..53d71a6 100644
--- a/recipes-extended/cloud-init/cloud-init_20.3.bb
+++ b/recipes-extended/cloud-init/cloud-init_20.3.bb
@@ -25,6 +25,9 @@ inherit setuptools3
 inherit update-rc.d
 inherit systemd
 
+# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our systemd
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
 inherit python3native
 
 PACKAGES += "${PN}-systemd"
-- 
2.27.0

