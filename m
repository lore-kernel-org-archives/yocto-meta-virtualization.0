Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.34436.1617479498825865541
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 12:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XgmtvlzW;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l4so11643295ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Apr 2021 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EwMUszbf/GodgSKhwHbhvbIPyPboXO8MGqflRa+G3vY=;
        b=XgmtvlzWtORD8FHh+sNmoe6nOb6jjMyUhWdVDipe+xTTeDvCGqb+8FDSTkcIhsG9Uz
         ne8Vyyp1+eBPhXNU3wK7AKWCq0wIHHND8SPXWkSK5YTrDluIxiZ0AUi/Qkc27O/t0Okr
         li8HWAGqqQsx1o9qx9X7XQDQxtbZTg6oW+p6VpgkqNQaQ+VRskuLdLa2/7pF/fpoVnSF
         3WNM/qobKeRjKcDU0OJS18vZtNvNJYOhBySrNT54HZZnx6HDKCC6uA3f/UZkHx8kYRuH
         9DYgw4QmFLjPQ3zznmzvjVd5SNiPKMBMeQBEVXPpxZEwjCDOD6B8w3hqGwwqCxMQ/0Zl
         cECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EwMUszbf/GodgSKhwHbhvbIPyPboXO8MGqflRa+G3vY=;
        b=kiikWGTmgOXqVuJnubWwpoUWW/BYiBoqeQANK3Ue5Sel3OBH2S/z2+MptmJeRWUlra
         BQgfEzXcXwBiASJu7a/WcZLN19tx2BqYIr7MxRHr71CZ31re8MdxugHCojlaFU8yre5b
         YsqcpRMexens4fjCBzXsnNJ2oXH8e6hQnghNNd8eFTEt3y0KPPrnQ4znLENWGjKzhYbW
         x6LIBtGKflIjpR3j4+B/yk4/dwdWEdu6Z5iaaU+vizYkMS0y9eEHrVReyXKZzPqoG4U/
         R2qrGdgAAZ5X2wfCzmKZHfijdEnF48oV72HNSkLKWgX0a5nwtdqfVDZhoEtgJKzRvyfx
         +ctQ==
X-Gm-Message-State: AOAM530n/7OqB+hFU8tGlw7eUwvTCO7pnhZOu0DrRLIfulb8Vp+9A7LX
	Bg4PpMSUdXwbWHY/O6d84sjSLdJfm/I=
X-Google-Smtp-Source: ABdhPJzR4xGky/4DqzoahSNrXVWSPMKAyFk5ebZEzZFa1GLx5QJENcQ+0fDMd7Cw5KAY67AKqt8dAw==
X-Received: by 2002:a17:906:dfcc:: with SMTP id jt12mr20576948ejc.31.1617479497278;
        Sat, 03 Apr 2021 12:51:37 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h22sm5882502eji.80.2021.04.03.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:51:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/5] nagios-*: add conditional PNBLACKLIST, because of the dependency on meta-webserver
Date: Sat,  3 Apr 2021 21:51:29 +0200
Message-Id: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/nagios/nagios-core_4.4.6.bb    | 2 ++
 recipes-extended/nagios/nagios-nrpe_4.0.2.bb    | 2 ++
 recipes-extended/nagios/nagios-nsca_2.9.2.bb    | 2 ++
 recipes-extended/nagios/nagios-plugins_2.2.1.bb | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
index 8bcd6c0..fc3d2c5 100644
--- a/recipes-extended/nagios/nagios-core_4.4.6.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
@@ -38,6 +38,8 @@ RDEPENDS_${PN} += "\
     nagios-base \
 "
 
+PNBLACKLIST[nagios-core] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on apache2 from meta-webserver which is not included', d)}"
+
 acpaths = "-I ${S}/autoconf-macros"
 
 # Set default password for the hardcoded Nagios admin user "nagiosadmin".
diff --git a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
index d9c7b15..7f81172 100644
--- a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
+++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
@@ -26,6 +26,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit autotools-brokensep update-rc.d systemd update-alternatives
 
+PNBLACKLIST[nagios-nrpe] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on nagios-core which depends on apache2 from meta-webserver which is not included', d)}"
+
 # IP address of server which proxy should connect to
 MONITORING_PROXY_SERVER_IP ??= "192.168.7.2"
 
diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
index 66f8da5..1fce198 100644
--- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
+++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
@@ -22,6 +22,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit update-rc.d autotools-brokensep systemd dos2unix
 
+PNBLACKLIST[nagios-nsca] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Rdepends on nagios-base provided by nagios-core which depends on apache2 from meta-webserver which is not included', d)}"
+
 DEPENDS = "libmcrypt"
 
 EXTRA_OECONF += "--with-nsca-user=${NAGIOS_USER} \
diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
index 0793365..b97d80c 100644
--- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
+++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
@@ -18,6 +18,8 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools gettext
 
+PNBLACKLIST[nagios-plugins] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on nagios-core which depends on apache2 from meta-webserver which is not included', d)}"
+
 EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_HOST} \
                  --with-nagios-user=${NAGIOS_USER} \
                  --with-nagios-group=${NAGIOS_GROUP} \
-- 
2.30.2

