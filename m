Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC8AC25B06
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 12:16:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.11241.1660047391482156214
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jkQcJrq6;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id b6so6215584wmq.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VDMHXP/8XCNk7dwTKSI8F3qHVNUZQUPdGK8HFm+zJT8=;
        b=jkQcJrq6SS6u374k/N4phi1I+rm/LmbJ+A4DZrBo3NIEH443L4F2LXyxDW7op6T+Gt
         hBMuLDUl3KB+0dAblvnJwBJ6Hx2YlaNTE71n626LawEj3pqNJnwX0o+nwtidVoYtnS+i
         WWT+1w9D8wPdUk2dpsfTPtHOgR9FAri/QM50WaKjU9uDGiUx3dfR07T5/ESb84j8UNxk
         LaTfrzUaIXx4wU9WupgLynSWWjDPkabvCqL+S1BJ0nfM2EvSK23nv9hTa2M+QYlfahrE
         J0sF9HSA5ZctPDWzTqsU2kBecnkPAxhM0RPhG8qKzqKHsCW3ZBqySwy6h3GFbPpWPaEM
         sWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VDMHXP/8XCNk7dwTKSI8F3qHVNUZQUPdGK8HFm+zJT8=;
        b=RhDfJDYUBHwV5QO+mg5SFEHJO8fwWckTRag/IUGMVInR0FqqIsh9pAwzktjqRa+I7I
         bXvxRmH184pFT4Ps9/KdZ2xkszltwbXwvcCoERTDmWDq5gjw5eFjRUyFsTjn8SEffcF+
         st6mxLmf43aMc73oW3Z/ccpLEldTopgB3m2B3n5z/BOYt7IRBatAK1aUmerqfJ9ENxl6
         23BrRTBHW790eYN/ZxL/Kqt8tCo4N0YPXsSUKfqXoipzXRjixDELgT0aSFwRPWwJYvTx
         Iqnv+u/54qWKJ+9VNaZvyYDP/7k/83dSUQk6ytqpJwrsgB2riANDEEPJCkZ66rUVy74E
         Ip2g==
X-Gm-Message-State: ACgBeo3aFMW5AWJBuk8qn3cgmwv/G7x3Dl67maRrA++WrCpX+8Z11L2C
	yEuuWqogo7buPVv/uL7mkkc0iVYsuU0=
X-Google-Smtp-Source: 
 AA6agR6PtspQ7RZysHxzJmDw1AKsntiEzsIonEefWowjNPACfTNwJmmUqLt4uN/Qr3ExwtOolMBN5g==
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr4688476wmp.151.1660047389648;
        Tue, 09 Aug 2022 05:16:29 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm11178908wmk.4.2022.08.09.05.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:16:29 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH 3/4] kubernetes:
 replace tabs with spaces for identation
Date: Tue,  9 Aug 2022 13:16:18 +0100
Message-Id: <20220809121619.32258-3-jose.quaresma@foundries.io>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7497

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 82b75b1..4d65b27 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -103,11 +103,11 @@ do_install() {
     install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-	install -d ${D}${bindir}
-	install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
+        install -d ${D}${bindir}
+        install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
 
-	install -d ${D}${sysconfdir}/sysctl.d
-	install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
+        install -d ${D}${sysconfdir}/sysctl.d
+        install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
     fi
 }
 
-- 
2.37.1


