Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0E0C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 16:33:48 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.14357.1660062824032403866
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FDhIgPqr;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id j1so14955803wrw.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qHm1auOF9ahjlvvwmjrXgnABU4BBYwIP5dm/rVHNVcY=;
        b=FDhIgPqryMraJqfPXLs3Ca18oWmltEsiunmh2i52lKQ9bloGtMU0RVblky3/XdSrf+
         XoSo8qNcwrGydtEK+CF6kv/QW/+ioWuaekwgIE9euWGC4LXQ9+zOh6uo2dGo3lpuN2r5
         SK9EITcc2rQdhP4tCK6qrcjntwlTMTdZ5U/w5zd8zqD2cqOxKBj8mdm4r2nv6v/8yfq/
         12pWV0jpqvJJ0QcdZ2i3PSy9bm1LfWWr+Fq0lUf9wH9t/v7li6sjTUVMg/L6qo1qgTXz
         xIQZR9KXZOt4ARhZRiP6OeOOymtURd1YcvPbgACtKjl+d2k+Rtt7lqTyqu1yV6LuClM+
         XTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qHm1auOF9ahjlvvwmjrXgnABU4BBYwIP5dm/rVHNVcY=;
        b=ftxQzgoCD1ALLZD2lQuyUqHmJAYZIhztcKueIdv1DKdH7wPnlAHNcc5nVaFThkGS6z
         65OOYG86NqJI2mREhRvpa2hgwmAfboLphMhGlG8v00dSbDnCqf26Zmw2hZKtH1IOpcn1
         cUfiScqUQFKJ4nbaYGfmbBft/NgQq4GILNdER+rMgE15/tbaeXsgcbFRiy74CNjeboku
         yaaSJ0UThw6ayS5n97F+TwmZUZVjo6KEdX8rrhaygyGtOTluXHWVq7at+H7WtJXBzHC9
         TglaRWqc8u8zkpyTu/dbfu28jQOWAoGg9HIMP7mVaCuQB/5hFOs3xPd/2N2Jss3deilz
         KExA==
X-Gm-Message-State: ACgBeo3QiT/xxCPK5jDXt3IBWznC1yfzOBhZQ6PvwG13LRGyHWa7FLCV
	Imijm5uDwxEKdG4der5qSA6IALedf6M=
X-Google-Smtp-Source: 
 AA6agR5yu/qQtNjhHajeBUrQmTU9/dvi9I7NgQFHVAr7nag9Pz2Ixa2elDzHxJlGpL9aQhWsrT7uJA==
X-Received: by 2002:adf:dd46:0:b0:21e:e972:7c70 with SMTP id
 u6-20020adfdd46000000b0021ee9727c70mr14580060wrm.554.1660062822001;
        Tue, 09 Aug 2022 09:33:42 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r66-20020a1c2b45000000b003a5a4635fadsm1210248wmr.37.2022.08.09.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:33:41 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH v2 2/3] kubernetes:
 install the binaries in OE standard places
Date: Tue,  9 Aug 2022 17:31:29 +0100
Message-Id: <20220809163127.54464-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809163127.54464-1-jose.quaresma@foundries.io>
References: <20220809163127.54464-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 16:33:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7507

- Install the binaries in the default "/usr/bin" and not in "/bin"

- The env BIN_PREFIX is there from the beginning but it is not defined,
also fix a fatal QA errors installed-vs-shipped (only enabled with usrmerge):

ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were installed but not shipped in any package:
  /bin
  /bin/k8s-init
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
kubernetes: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

 v2: update commit description, drop k3s patch

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


