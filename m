Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D72EC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:53:32 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.5002.1702288411223426170
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 01:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HlKkAcbO;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50bf32c0140so4747661e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288409; x=1702893209; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IufRj73o/sNgudjZhHHhOs3y0z7xw+QU8U+OeAy8zwM=;
        b=HlKkAcbOaegqLxRzyDSP2jlHZCTeXE7EYpF7ArOhyljs5cPriWs/ikn9du3A7xvsnF
         xErHHfVYKdQUdV27kjteF37ImT4Po6eWsqa9BPLDrTV8lENYxFKe8eYlOLZQQajyjPjB
         Fl1LaGIwcAw8Ru+bzp2NHPlZgdbg/fp3jX5Q8WZIaQ+38BK2V7Bd4xQZYDtKoTKqFPJt
         Nox2+ivOc8x5XT9Bwj2lwCNLAv+0cfYm1BajQ1vPXKmpSD2I/spu0Za0MyN5uVbLRkg1
         426FgvaZJOj6ijwuy8Bt9j/Tq0coCe4ajXGK4kv8Z5+z3wa74atcDCg6Qfzkus+lFMkx
         G94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288409; x=1702893209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IufRj73o/sNgudjZhHHhOs3y0z7xw+QU8U+OeAy8zwM=;
        b=flE7Dsd/g3bNV4X7/0suFWMo1o45sc8BfpCPrOiNxYVy0uPnMdbl9omIU8no+i2HQ3
         EUNZe50iAR9xcBfaym+heXUzx4Q4kAL+KkqYdajNyqJ07eg+e4VTRSEmbPiWKn0hYy2+
         RGENyB+EvSNnzj5NUJ9suiVcfcLqJB+7SpM75eT+HqUGqKLO2D1+27ugbAlMyAMC5F80
         Wwj8hkK7YZHy4B/8L1uurQfU6RdJQMl/vbxNvZbzOy5bWn5fs/VLlN8VJn6jLLUvEE3p
         2Fmx2sNOoXrEcMBdYRr7zR5MNl17FHvF4dnAalXSz5jps1yJozChwL8vTuqVJZn4vgs8
         p9ZQ==
X-Gm-Message-State: AOJu0YzxbuNpxdZm3BHqh6l8vTPnlv8UMZp6MothGDYn6vx/35lKKE+N
	w6syG//2ATqF3zhU8H4XTfsvHpjJan8=
X-Google-Smtp-Source: AGHT+IHsz3NN41Lxq1TTPxDbkPeQYUb4x8lmvy8xQDqgcsm5/NixolnJ59KptrOxJdIYr4B0Esiqhg==
X-Received: by 2002:a19:4f11:0:b0:50b:f82f:6922 with SMTP id d17-20020a194f11000000b0050bf82f6922mr1543265lfb.23.1702288408750;
        Mon, 11 Dec 2023 01:53:28 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id h42-20020a0565123caa00b004fe202a5c7csm1031696lfv.135.2023.12.11.01.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:53:28 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization] [kirkstone] [PATCH 1/3] cni: reproducible builds: pass -trimpath
Date: Mon, 11 Dec 2023 10:53:18 +0100
Message-Id: <20231211095320.10874-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211095320.10874-1-liu.ming50@gmail.com>
References: <20231211095320.10874-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 09:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8492

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-networking/cni/cni_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index cac62ae1..fd9115ab 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -39,10 +39,10 @@ do_compile() {
 	export GO111MODULE=off
 
 	cd ${B}/src/github.com/containernetworking/cni/libcni
-	${GO} build
+	${GO} build -trimpath
 
 	cd ${B}/src/github.com/containernetworking/cni/cnitool
-	${GO} build
+	${GO} build -trimpath
 
 	cd ${B}/src/github.com/containernetworking/plugins
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
@@ -50,7 +50,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build -trimpath -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.34.1


