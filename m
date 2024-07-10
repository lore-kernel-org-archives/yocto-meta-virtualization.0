Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5181FC38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 05:37:17 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.7379.1720589829163509950
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 22:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=akDmFi9i;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: badganchipv@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25dfb580d1fso2865616fac.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 22:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720589828; x=1721194628; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Kz42oxNF23W6WJ+MliVekluLicFAL5cF7QZnPawnL0=;
        b=akDmFi9iCFFlSctgDmodEjXIn9DD9tOlJN2B1Z8+7wkIwSTmtrJpL+9JuE22eUgKqy
         zFM7lY4o5g5mRruZRDzEOnPiC2eZtp8cSK7BODusLHRtkcWSYbAPQZNPRdgbVcDYDOq/
         Q+JJ2UDJUVSvNkuOTWubuL6Fvb/yyyQ7kgGx6OvKm6VwR+9SD2SsrUd6g3u5H7YghZsm
         LXj/XQzKzYdmwH6p3cKTRd4crLDWcGOeumPXY0Cpqbgwiu0Mrh+DUA0hICxMtqP3Klqn
         kOZYOrRk1h+evMHCQ20dBPYNseVsKmotfee/yN7b9d/1TITzMhYjaDZvgJb0jb3wXhq3
         SdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720589828; x=1721194628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kz42oxNF23W6WJ+MliVekluLicFAL5cF7QZnPawnL0=;
        b=ezdYVLxKV+KuAPNHwD5Ng5iAyeUcWPVyzEaCw9Ve0v3GFcbW1bxhaqyVKGhVll8vpK
         zktYO+r8CM3Y6eUI0Ia0+hrrh+Euc/uB416B7h2CAStRM1e5+Zh8wjwoviSMeN40VesF
         D04buUWfdUAbol5qw/LaxifMGslpOwVVwOX5g2L/8M9+eMBuF6BU7kHd8jbA3C4VeSHV
         fska4Ig/vxIpxTeRDX/j+duTdxaPoLoF/toLU4BJhB184UdY5XBPVfQtgjHACtT8z7ai
         3qsSPmS21I4kL/Sn0O8r54leaAWztnW/wAgZgq4xRUa796gABX6t8KNPl8eCEeOpTxmz
         zyMA==
X-Gm-Message-State: AOJu0YwoLRWEfdV2b5BLwnBrdG9+5Hr3qGrFA43gT9x2ftXpeDQo2y4Q
	ca8PFRp1NJ2RiVl36wMwtq7BH3CdkM6d2FuL88YzKdImP7E/RhKaqQdxbwMJ
X-Google-Smtp-Source: AGHT+IFky9VNtjqakXHusrIlpVaYmMfH9zGKTAldxquTUO68JULjtfLi9wJBBVVq2EMZQiAjm/qOkQ==
X-Received: by 2002:a05:6870:b30e:b0:255:1819:b458 with SMTP id 586e51a60fabf-25eae759c34mr3624284fac.8.1720589828233;
        Tue, 09 Jul 2024 22:37:08 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.81.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438f5679sm2905186b3a.90.2024.07.09.22.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 22:37:08 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: meta-virtualization@lists.yoctoproject.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-virtualization][scarthgap][PATCH] lxc: Fix meson build issue
Date: Wed, 10 Jul 2024 11:06:55 +0530
Message-Id: <20240710053655.16122-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 05:37:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8829

Build is failing during do_configure stage for lxc as meson
does not support --with-systemdsystemunitdir config parameter.

Error:
meson: error: unrecognized arguments: --with-systemdsystemunitdir=/etc/systemd/system/

Hence, use -Dsystemd-unitdir config parameter instead.

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 recipes-containers/lxc/lxc_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index ee0e442f..75cfe859 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -81,8 +81,7 @@ PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,libselinux"
 PACKAGECONFIG[seccomp] ="-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
-# meson equiv for the unitdir found yet
-# PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[systemd] = "-Dsystemd-unitdir=${sysconfdir}/systemd/system/, -Dsystemd-unitdir=, systemd,"
 PACKAGECONFIG[systemd] = "-Dinit-script=systemd,-Dinit-script=sysvinit,systemd,"
 
 # required by python3 to run setup.py
-- 
2.25.1


