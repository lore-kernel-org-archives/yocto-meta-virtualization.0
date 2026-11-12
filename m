Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35.1794497139824045436
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 07:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hTG+dLTB;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-706113e92f9so2497892eaf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Nov 2026 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497139; x=1795101939; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/lQhtU5xdhOkBOY3+0AUCOb7vxzpQ3ggRr9W6Bsgt4=;
        b=hTG+dLTBZkWkNFyLDkinT6ktBSms1tLGMnU8KNsyc7qBYHUW/n/fknH791E1cz90v5
         gaQRnsDVzKjKUe4BuZrnbGJod2B90fy1Qbu5qHAl7A2rBr8I6kFtn6c5EafRzZnjkhYU
         B/hASjwikE6SgU6XDFBPoERwcW3Bq2QDbbrrW80WuHd/bcr7RQg0xYJMqOMsTvAS3qgu
         nBSBqgNBebsT/Kfc/0/aS95Sruzsoafo7ZeDOlOeeUEPNlUg8/Qsg5OwRnSduCcg5fBY
         AMnaiGJ1hc05+rhlsf6hmGlymoJih5GqBy2LLDayKdNP0y2bRDp8QNAjm8muO/vO1egW
         j3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497139; x=1795101939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/lQhtU5xdhOkBOY3+0AUCOb7vxzpQ3ggRr9W6Bsgt4=;
        b=oOMh8mcWXATktEzpB5+vClhbpr/SU8rHaWESnHnIrzlVHEVWIPek4HiO/vV4CzV4+y
         HIsW1b4fh4nFXBtcNDMxpIzalYRauZIAb4oenYmXWK6yj21tsAPIWEUtPNm7Ze/AmFhV
         Uo3TeO4aoBRdu/Em1RTwrapDRZZgqoSEzdufj9shSU47uqJt/RkF+T4xYWO/nVOGc6SP
         dn0phSfPXBQmsT7Nqa9pPkIzzqdiisPvFx0MWgnABTvydVar8oKEDnaU5WVgRNwS+mJy
         NRNwzgDWxJ+L5aRPToOZ8kRKiEEkRjfMIXuXlQUV1G2m+iTW7NNFLHOhJc+3+WdafSQx
         +Djw==
X-Gm-Message-State: APuU4Z9OIKdIU2uWw6dVYxBHDO0W2vBVh7EQaHGw3FZ0wlw44QT/ZLWs
	SmBxIKyTNTtkT40DHjpgU+RvKxTvwiUHDZaaWMTqgTuONMoHhd9tyWfdoYZJ8g==
X-Gm-Gg: AYBFou10aW9GXi893aBRy6a3YHgXNBh3cEAe4v1Kn+EEOn8EKpdB33iMSjMIIswXBIw
	QvlvLh8SJhQKa7ZJGv7ACuKge4SLWV3wweVnC/mRHvxny1EnpRXfUxCvjEz96TzLwkkLcuAjfNJ
	7mphBoqUqcpIYfsvtYO/2qCwiGGFDF6SvcXUEShV1cWDClLujFw3xotKQDvLLWs0ME3mGNxPSfx
	qfcuBZkFJSwGYlY9GJ60LJipLbpV7anWAeTMhhhPssJ59mKj/MDyxBud2YTid6xWyk2O+m+Zx53
	7uj9+Nz6vmpwZEsrV2GP+0osV/L5JtD+Fkdmz7hLF4mIlhEv1DF+OrrGQjodLuFCzDtdW07EmER
	+tKKX/tk7xaGhzJts9urCCv02xrFJpO8JM72THiNDN84WsPc1Lkt7CI0k89mbzyVs+LAT4+2Jb2
	sKk5tAucgQRYwceVqb8l1K5V6YusZrDLt2dE64Z2KnmKGQcqweL1MnDUdp2rA7XsGzjwggzuxO5
	e6RE/UBTpoKjw8S0gnY0uPcWuQtJ0m69H0QTArjB3GElzcdcHTtXkV8nQ9h4fyzCSsJO3HHXxUi
	5kz9HjRHuYWWNmJh1etMmkYHjlg=
X-Received: by 2002:a05:6820:a28b:20b0:6dc:e1c3:b2c1 with SMTP id 006d021491bc7-7191796b410mr2878613eaf.56.1794497138573;
        Thu, 12 Nov 2026 07:25:38 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::caf9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab0e7e573sm128913eaf.6.2026.11.12.07.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:25:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] Fix up SPDX deploy errors
Date: Thu, 12 Nov 2026 08:25:10 -0700
Message-ID: <20261112152510.1116302-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Nov 2026 15:25:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10166
Content-Type: text/plain; charset="utf-8"

do_deploy tasks now generate SPDX output for files that are placed in
the deploy directory; however SPDX must be told if it is expected that
do_deploy will not produce any files by setting
SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"

Several recipes in meta-virtualization have do_deploy tasks that may not
produce any output, so mark these tasks to prevent them from generating
errors.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/container-bundle.bbclass   | 1 +
 classes/oci-multiarch.bbclass      | 1 +
 recipes-extended/xen/xen-tools.inc | 1 +
 3 files changed, 3 insertions(+)

diff --git a/classes/container-bundle.bbclass b/classes/container-bundle.bbclass
index 25f1a1e2..7377f0fb 100644
--- a/classes/container-bundle.bbclass
+++ b/classes/container-bundle.bbclass
@@ -637,3 +637,4 @@ do_deploy[dirs] = "${DEPLOYDIR}"
 
 # Only add sstate for deploy when enabled
 SSTATE_SKIP_CREATION:task-deploy = "${@'' if d.getVar('CONTAINER_BUNDLE_DEPLOY') == '1' else '1'}"
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
diff --git a/classes/oci-multiarch.bbclass b/classes/oci-multiarch.bbclass
index 43944afc..b92e13d8 100644
--- a/classes/oci-multiarch.bbclass
+++ b/classes/oci-multiarch.bbclass
@@ -272,5 +272,6 @@ python do_deploy() {
 }
 
 addtask do_deploy after do_create_multiarch_index before do_build
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index f38cabc2..0e46f289 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -954,3 +954,4 @@ do_deploy() {
 # - add the task before do_build to ensure that deployment has completed when
 #   the recipe build done stamp is written
 addtask deploy after do_install do_populate_sysroot before do_build
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
-- 
2.56.1

