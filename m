Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.82920.1597817288432928178
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 23:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rKRE4t7i;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: samuelzeter@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id y6so10322318plt.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Aug 2020 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1JwutDP1vMuR7ROj67uqC6HmziSqhZlnGrzs0hUmn8=;
        b=rKRE4t7iAtCHAEmKHNPX3XSDguannaKJa1E1Xvqaawk+9jalErcwWtpn+9bhmAeGtw
         7pDueQFM0bh7Mg5FMHCb80jOCuAD8JdwaO2SIzH1WpeUcDjdkJFI7xVngMvVK8peLAUU
         aN2TmVh4Z5rOnhVARmDwWsHIdN9DUTAibD4nm9hICcZyBvajupGihxliV22eWD1V33N5
         NQFU1ckE8sOP+KMDdyclATIVCC+KecIDAeyAntEtTSR/bjdrl6WO+t6DCOOWW9xSXrIE
         JAVK0DPVSYvE75ZCV/M2lkCbJrhW1Q8nZfgnZ1z6ZaC/qIetdRSAfWQM4/hOQ4xdAeJE
         0Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1JwutDP1vMuR7ROj67uqC6HmziSqhZlnGrzs0hUmn8=;
        b=ZnjbFyoeYlKSVCGNz3v6uwhBzWcGNfL1yYXCSTMywGainJJkzDxCDUAfE/HUtLTAB+
         RsoryfqXZ88u3+hqc3BYbM07Kyzzw1MkSkj63mEOSjAbpmSv+u3O3Hku7aRsT8X9IzA7
         h8Oal4jNyOfsAIYlFFshQOMrVaQKqhBoIPM6wGLoovA/fBqI/7SKYMdvjXc1c7ifKW8E
         4FfUcDfpFuhZ991njVvRckRXZH7KwXxCWFu+JnEtrVT6lLmbW+s7Ya9Tq1QitdEkEaJU
         o1rlNQLu+Y60/t16T3gWhDJRlyMQFtYs1zro3jR1bDvAnr9kfbNFUTMSTHeX9vbzwLRF
         X1nQ==
X-Gm-Message-State: AOAM530W0jNVCDY+RbAhX3VLc54TmSZnTaiE7dCGFx2xhzvBPqr2HPKg
	S9H2qHS+tpctzWywbZmX+KVRzacQs3w=
X-Google-Smtp-Source: ABdhPJzQcFqp+RuMJbR4sM49FvGlBO/DxwEzaAGxT7dYitIlc4Z5j3lMztILk844qfQZf5W4rAAS7g==
X-Received: by 2002:a17:902:d345:: with SMTP id l5mr16915820plk.276.1597817287626;
        Tue, 18 Aug 2020 23:08:07 -0700 (PDT)
Return-Path: <samuelzeter@gmail.com>
Received: from samz.bne.opengear.com (brisbane.opengear.com. [60.241.24.90])
        by smtp.googlemail.com with ESMTPSA id o66sm10482694pgo.25.2020.08.18.23.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 23:08:07 -0700 (PDT)
From: samuelzeter@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Sam Zeter <samuelzeter@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH] salt: Remove hardcoded Python 3.7 path
Date: Wed, 19 Aug 2020 16:07:59 +1000
Message-Id: <20200819060759.2014410-1-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The salt bitbake file hardcodes the Python 3.7 path as

 ${libdir}/python3.7

In order to ensure compatibility with Dunfell, which uses Python 3.8,
and other future versions of Python, the variable PYTHON_SITEPACKAGES_DIR
should be used.

Signed-off-by: Sam Zeter <samuelzeter@gmail.com>
---
 meta-openstack/recipes-support/salt/salt_3000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_3000.bb b/meta-openstack/recipes-support/salt/salt_3000.bb
index c2bc8da0..f80ceb65 100644
--- a/meta-openstack/recipes-support/salt/salt_3000.bb
+++ b/meta-openstack/recipes-support/salt/salt_3000.bb
@@ -104,7 +104,7 @@ RRECOMMENDS_${PN}-common = "lsb"
 RSUGGESTS_${PN}-common = "python3-mako python3-git"
 RCONFLICTS_${PN}-common = "python3-mako (< 0.7.0)"
 CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}"
-FILES_${PN}-common = "${bindir}/${PN}-call ${libdir}/python3.7/ ${CONFFILES_${PN}-common}"
+FILES_${PN}-common = "${bindir}/${PN}-call ${PYTHON_SITEPACKAGES_DIR}/* ${CONFFILES_${PN}-common}"
 
 SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides the salt ssh controller. It \
-- 
2.25.4

