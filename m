Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F37EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 11:21:53 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.105278.1692012112149283316
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 04:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=T3jWPnZe;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-523d0fab783so3549292a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692012110; x=1692616910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV2xSMlReGvlc2Pn0F75bEn0djcC1TNBJaYXhWWMFe4=;
        b=T3jWPnZegt/mDgLrAU3dYQuEJkM7mbPySuGL9jnyUi8h0up+CgUJDBxsliR0aP8gG1
         S9Xzy6Fevp7f0pF4yefG0Zb5hAVE0et+KZz/H6wfgcxRQLcwqFED84M3Tei+DzDalSDr
         G7I5pkUSQ3X99/puKgmb0I4E/YNITtOscPuzRkp65ayRzbhZhSGobWpc7+m+mDHyvJxR
         m22c7avk3EN9iTP0PfwZOmnJGRTovLOboQrbg88BgpA4qEZzwQCrePkMSUeYnLM8hQvm
         bV0aazljsbKARXGnEen45PznW61BWrWHcaTRCFlQJFmkXhufRNkeyWmuxXT24GsHaRkW
         pmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692012110; x=1692616910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UV2xSMlReGvlc2Pn0F75bEn0djcC1TNBJaYXhWWMFe4=;
        b=ag4XC9AKvtJpKgZswI1B6uqn8q49oMGLufHSl0GBgbKEahwgvOGHSMdHck9YsPVddb
         EwGUyOnmcNMs3PDrkTu6QWIroiZYGr6Uwm9kx8AgYPOPdvWws/8mOlYb9EoM1rkg6Wza
         q4es37criYn2LQn8GnXm7PeF7N25PMN205dXQgEXr3YapFOHzQ7MhGSgV0TAu2VdJYxY
         +W2nSuYLVWd6Lqkje+UJ0QUYHiU00fhGKhM2xmQQuDzx3wpEFvOX9hIrH8ckyuWQ/qV0
         nfbiVEkGFaqYRuq1QvKvPAQSYAK7b2tkpL0uusEEusCFR3ONxU2a14M4YUVYAjAff0mr
         jvxA==
X-Gm-Message-State: AOJu0YzQtQ30MaaNFPDBIrmdemk/2kU7Fx22QjtmvGdVmYQf1qjImjQH
	+cFj2NA+q7zJDwoRNABb5CeTV785iIA=
X-Google-Smtp-Source: AGHT+IGxVYv0sDnk21FJtPA620fSVUKQpzZtyzY3/LK2tihSJnXdNP1xOqeDwCvGsCG1DW+bCQaBqg==
X-Received: by 2002:a05:6402:31ee:b0:525:570c:566b with SMTP id dy14-20020a05640231ee00b00525570c566bmr2773625edb.22.1692012110511;
        Mon, 14 Aug 2023 04:21:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e14-20020aa7d7ce000000b005224c6b2183sm5451603eds.39.2023.08.14.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:21:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [master-next][PATCH 2/3] kubernetes: fix installed-vs-shipped with usrmerge
Date: Mon, 14 Aug 2023 13:21:39 +0200
Message-ID: <20230814112140.1048354-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814112140.1048354-1-Martin.Jansa@gmail.com>
References: <20230814112140.1048354-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 11:21:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8181

* fixes:
ERROR: kubernetes-1_v1.27.1+git2555e0f90e80a13628f47eca5cde34decc89babb-r0 do_package: QA Issue: kubernetes: Files/directories were installed but not shipped in any package:
  /bin
  /bin/k8s-init
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
kubernetes: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 1989350..c6d8c43 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -104,8 +104,8 @@ do_install() {
     install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-	install -d "${D}${BIN_PREFIX}/bin"
-	install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"
+	install -d "${D}${BIN_PREFIX}${base_bindir}"
+	install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}${base_bindir}"
 
 	install -d ${D}${sysconfdir}/sysctl.d
 	install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
@@ -143,7 +143,7 @@ FILES:kube-proxy = "${bindir}/kube-proxy"
 FILES:${PN}-misc = "${bindir} ${sysconfdir}/sysctl.d"
 
 ALLOW_EMPTY:${PN}-host = "1"
-FILES:${PN}-host = "${BIN_PREFIX}/bin/k8s-init"
+FILES:${PN}-host = "${BIN_PREFIX}${base_bindir}/k8s-init"
 RDEPENDS:${PN}-host = "${PN}"
 
 RRECOMMENDS:${PN} = "\
-- 
2.41.0


