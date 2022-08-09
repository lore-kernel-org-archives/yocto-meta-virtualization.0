Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89B2C25B0D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 12:16:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.11158.1660047390274827851
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=msja3sHB;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bv3so14097870wrb.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=c8Hw1HdwFPBWj6dYv357sYd3JWiR0ZTp3j7MKZpoAlA=;
        b=msja3sHBmsa1fRlBBfHPQ34kIETOdmcYCX4cyuXO2IozTsevDt2r7/jWZsSGexJCer
         ndtT2j/kGXRDsBk6itFIJiDbQeNRo9omiF2CI6/DT3jGUSdtv6WQWb7MzlEocasi6cBC
         rsF4IvvlDYTCKwroMcr/gYoPuo8nH2PXC9mm2FZ2mzivbPWxbc+3uis4qqs+eVRss/6j
         VMLzdFE6/rOJf6xPv/Qy62VjYL4zFYdlefbLD+0+1BGVS5lhulLt2wEHKs8uzSyx+WBC
         +/J2ZUHzLj5rXzrsp1kYuv+mrQPj5L32tUK5HvcC5HfT9dVm/+zBKcwQ/PeQyNzO+Iok
         yKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=c8Hw1HdwFPBWj6dYv357sYd3JWiR0ZTp3j7MKZpoAlA=;
        b=WVrpzQwKHTPiTyHj1cr+JrAKxD+9rvcCSec+jelesRIQSySH9aCO8A7dqxe0AJBIp1
         O5tJ7JWbSi36V7X68URwAnlE1a4TKPmJO7rj8BT17lRvLow2QinNAYejiVTGK7bziQd7
         NOlYBKN9GW0L7XYnmwld9qoHfhCo5YxIW2qp6AMasMpvHW8FYouv4jYTWHmgThsy56i4
         MSmj82qWQ1JpQh6d8i+srKrRpAfYJu5d+YSX3RuHRtX9q16XEOD9RQkDxWHUOKl0qiZk
         VcSXy+c/GEDApl7NbKEJamFXt4P0V/2e1zIrSf/XJPkMlxf9ZgtXlAwQdlec7z11nxn3
         Wwtw==
X-Gm-Message-State: ACgBeo3hYh/M3NEbVe4yD7JnBQLWHvmQND7w6jsZw6DL+MeOmffwSl5G
	z9EN5s8+YAqPyI9ph6EXgCdJbgPPnac=
X-Google-Smtp-Source: 
 AA6agR5qPmykUjPdOPCJ3YTC///sGyMNHBUUcu7Y55zD8IefoADv4NXj3gRxF09Ue7BxS5imemr+/g==
X-Received: by 2002:a05:6000:1869:b0:220:639b:8337 with SMTP id
 d9-20020a056000186900b00220639b8337mr14723515wri.572.1660047388536;
        Tue, 09 Aug 2022 05:16:28 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm11178908wmk.4.2022.08.09.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:16:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
Date: Tue,  9 Aug 2022 13:16:17 +0100
Message-Id: <20220809121619.32258-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809121619.32258-1-jose.quaresma@foundries.io>
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 12:16:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7496

- The env BIN_PREFIX is there from the beginning but there are no references to it,
also fix a fatal QA errors installed-vs-shipped.

ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were installed but not shipped in any package:
  /bin
  /bin/k8s-init
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
kubernetes: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index e9460d4..82b75b1 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -103,8 +103,8 @@ do_install() {
     install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-	install -d "${D}${BIN_PREFIX}/bin"
-	install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"
+	install -d ${D}${bindir}
+	install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
 
 	install -d ${D}${sysconfdir}/sysctl.d
 	install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
@@ -141,7 +141,7 @@ FILES:kube-proxy = "${bindir}/kube-proxy"
 FILES:${PN}-misc = "${bindir} ${sysconfdir}/sysctl.d"
 
 ALLOW_EMPTY:${PN}-host = "1"
-FILE:${PN}-host = "${BIN_PREFIX}/bin/k8s-init"
+FILE:${PN}-host = "${bindir}/k8s-init"
 RDEPENDS:${PN}-host = "${PN}"
 
 RRECOMMENDS:${PN} = "\
-- 
2.37.1


