Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE52EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 08:45:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.8311.1688719501189352791
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 01:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bL5riL7q;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso17783045e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Jul 2023 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688719499; x=1691311499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHWhVjLtKBgDmIJD6/Gdvct2fhjSM4ShFToYYdGF8Y8=;
        b=bL5riL7qxZbvV5JA6zLr71T7doeB9ORC+bWcajdzXt/ryqzlClm8kbHDjY+k2w7EUh
         RWx5O5fj2qpO3VMyK3KMDxdW9JRAWzuFoAkX6HLbgUnyxZH/6ojb/rkrJGmIZYp1mPgm
         EcfjOG90uY2om80YL51/xvaVUgD0QRJzIEu1kE+Tm25ckMAq0Zd/v4bk8pqSD6Db/Crj
         OZCiW6VfAiDvVpYTUpXbfNlxbnnGusJUd3+FrLrBkX5RfCDdBNwSG9Vhen+l+LZA00ET
         tipgTCErobK+IXTnJbgx1FRrORcL0bLwW5KxT+Qzg+c702GaESnxZkFFPyhw24gbwNsO
         Vk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688719499; x=1691311499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHWhVjLtKBgDmIJD6/Gdvct2fhjSM4ShFToYYdGF8Y8=;
        b=etzIbTKU5IrZVj0na9i++iZTgUouX2Chqhq1uMHRQziI7z+WbOZ6rYtU32djO0qXJt
         sgTk24gulluLfNeb8S2VZ56FEa2ohjMitaEYJuVHDU2G9e3sA5MyyP959UXMq0uYCD3K
         vykCo3cU5cQMyj2cuT9aIc2G2MXLkT1elLRaVErsx63ncj1qeLoKFkGB8nKrJIKB2mvx
         CBMM0BBuhnYdiCsmIIF8g/FQmd+HXNdRfr59cu43i9x4R8HfH8VLmz0Sj1foaLN7e7YL
         3rnuh3ekNsUd8bK8asIeu0L51aJsg8oFe5M07EkdAs5wlRTs6aAkP14zJi4DD3v+S8cU
         412A==
X-Gm-Message-State: ABy/qLZBSZKxMa/xLf80ljJXzOMtmKuiQxY1M/ZILS5sCEA5xKsHa0w2
	gqDm//NCfvAMoXfZ2wgyWOfyuKgIX/g=
X-Google-Smtp-Source: APBJJlHJNXiKogm5ep9MxEShI05a6fYApIVXbpbZAOxpTGWnHqeY5WAVWW9vRbPHkmZ9TNLc1y/t7A==
X-Received: by 2002:a05:600c:2055:b0:3f7:4961:52ad with SMTP id p21-20020a05600c205500b003f7496152admr3627320wmg.3.1688719499423;
        Fri, 07 Jul 2023 01:44:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n10-20020a1c720a000000b003f733c1129fsm1787795wmc.33.2023.07.07.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 01:44:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [mickledore][PATCH] cni: fix textrel QA issue
Date: Fri,  7 Jul 2023 10:44:24 +0200
Message-ID: <20230707084424.2476021-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Jul 2023 08:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8123

From: Chen Qi <Qi.Chen@windriver.com>

When building cni, we get textrel QA issue like below:

  cni: ELF binary /usr/libexec/cni/macvlan has relocations in .text

The problem could be solved by adding '-buildmode=pie' to ${GO}.

In go.bbclass, this flag is added to GOBUILDFLAGS conditionally,
that is, if the arch is not mips nor riscv32, this '-buildmode=pie'
is added to GOBUILDFLAGS. So make use of that.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-networking/cni/cni_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 35aea39..06cef81 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -38,10 +38,10 @@ do_compile() {
 	export GO111MODULE=off
 
 	cd ${B}/src/github.com/containernetworking/cni/libcni
-	${GO} build -trimpath
+	${GO} build ${GOBUILDFLAGS}
 
 	cd ${B}/src/github.com/containernetworking/cni/cnitool
-	${GO} build -trimpath
+	${GO} build ${GOBUILDFLAGS}
 
 	cd ${B}/src/github.com/containernetworking/plugins
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
@@ -49,7 +49,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build -trimpath -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build ${GOBUILDFLAGS} -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.41.0


