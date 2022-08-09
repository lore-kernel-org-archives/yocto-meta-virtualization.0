Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA47CC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 16:33:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.14358.1660062827858950834
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLPWF1Uk;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id v3so14995044wrp.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VDMHXP/8XCNk7dwTKSI8F3qHVNUZQUPdGK8HFm+zJT8=;
        b=RLPWF1Uk5rCDqpFF/8HftmkYsczFIsQ0KqrZ5oqTt3tRlQMJ+kSDOXqqtixjZ+wZ2G
         yLOW6HAjUZMN5wit4bwvGVTw8e7EOnDkFp9WSpwOhArKOnjYUCdj+N5xRwpqC94KMvz1
         5K7UjbXatdUtA4+4gj8Yy6Anet81WJ8llxtGT0WVYM8OWqNgj3BaQYV1fsCnYVxYJS9T
         rQisVQLVo9vLB385g1L6tm/8XLZqJAj7kluEOSUoxngFB9b6Nvtoz+5juvXuENOmqUgT
         v6kSIZRSIbvHe8q3TJlgPdxTYfG2x6VsRoGDEWlZo9cybA7cofAoCr8WBzh9GzRt9ZHM
         TpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VDMHXP/8XCNk7dwTKSI8F3qHVNUZQUPdGK8HFm+zJT8=;
        b=oLomydLmT+uMAECA+f/qHHcrx5OCh6dNQZkBW7B7ZHbnF8J+2R36eNczf74Zjrn1tr
         O+JAHnhsen+/pcfXhL+I4YQC4IATlqSQuKfgFx2RbvUK+Ni4V3pIvv83EPRt3A9Bmb14
         biaDVU1+T19Hc3y6Sq1dTRbvRLkvaFEsR2MIru0HhPRW+jfuX6FIUsWLlNz2Q6PoR9Ce
         0NYVoOrQFaAs+0FG9qj4P1Mfda6Gmd3eIemE7SAcf2jGtWlsY4p+sOLbBd6AvVAo0CrP
         4/XcErqWM74EoSTTQ5TSbyEATFhkDt3vZhJiAIs9UovfCNm87K2qoWt6nilG8yshpuVc
         DumQ==
X-Gm-Message-State: ACgBeo3zbhAucJ8ahhc9A80H2jNGOrVd2ulHPKTDsWSbjZhD+jZlzysF
	3++Tae+3MEJzlzHfhLRmjAWM4WyMMuo=
X-Google-Smtp-Source: 
 AA6agR5iDJUUxDuxXkUWTsaBe3e8TIgtzJiWXwTvsbplAu/dJXb8X4BfXnARbJCVwZ5q5WSwgVd5EA==
X-Received: by 2002:a5d:5601:0:b0:220:7144:2938 with SMTP id
 l1-20020a5d5601000000b0022071442938mr15714714wrv.50.1660062825964;
        Tue, 09 Aug 2022 09:33:45 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r66-20020a1c2b45000000b003a5a4635fadsm1210248wmr.37.2022.08.09.09.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:33:45 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH v2 3/3] kubernetes:
 replace tabs with spaces for identation
Date: Tue,  9 Aug 2022 17:31:30 +0100
Message-Id: <20220809163127.54464-3-jose.quaresma@foundries.io>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7508

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


