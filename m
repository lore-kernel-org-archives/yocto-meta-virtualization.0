Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18476C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:53:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.4984.1702288413371900895
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 01:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QNRxPUMU;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50bf7bc38c0so4746373e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 01:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288411; x=1702893211; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgnjPwdHbHFBC5h/nSCEwyjpKJpAE554FtVa7pjjoUs=;
        b=QNRxPUMUT47PovdRqWFaXRMTXiFl8OiQHeU4jgnpD3H1y9xzZ0AO4VoN2Fkue/EEm8
         NcPNdzloNPwUqEJ97jGoOmxs5n5uzRsNDhRvEw6U4EiK4TKGtO63dUbRvewA0l4r3Xdd
         wR2ZaV9SWf8pcmyS037lPi47y5+PgPBhhf+na2oxhpbcg6LUeEtuPYTt8SgPFvGeCBjv
         p5EgSZyACkcIMddj4nhaSB2UDd2zPpqc+BBy/4JEglvYiWXBhyQjHyXvjJJh3jFf9ud2
         ZdhiXp5DoYGgunivEEkhrjBkmNkG/YoFuQwaJD8dpn1wNrRE6OkQVOvB/UWFhzPMVLlI
         3pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288411; x=1702893211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgnjPwdHbHFBC5h/nSCEwyjpKJpAE554FtVa7pjjoUs=;
        b=gTkQMIgX5VcIUd1elR5u/zEQlFaLBYEFp3sBGe/gw2SXc8uGh67ddMAluf0W/naV0Z
         dm9gQSdY3rm3ZQDSHiXj9k9zGty9MxJyPGS+b5d5PvYIw0lQVJmx9KIt2l5yHQ7AC83M
         D6T3Hgy6651nlSK2HbErnNadAtNeI+Ce78VRw/zPpMz3jSQvQQ/AhlR6XDIOg4tDzqPB
         cvgVdqchmMG/296KDHdNqnWo/1Fk55JWg8uQpikbxiRXOtw4LlCrv5xPOQKO6F/nNWLE
         gi9a6/acuUvnZHpLtaULOtSRoTDVLiPxqD1ySWa+feYxtiiT4ii1lx1RekY57AkvOme9
         jm2g==
X-Gm-Message-State: AOJu0YyL2m/L491zl/U2kvgMe5Blk6/SGIRUBh9CIWaFMbeReNCdUUQS
	S1r5jVoQM7ATWLRkjAMdqeBJEcCdm5Y=
X-Google-Smtp-Source: AGHT+IEyapXSYj+Pt7SQOgEA33c7G2fdzpBgivmldcf0wtenCNd2IgAv5y/HAkc4sA1P56KWNYTjVw==
X-Received: by 2002:ac2:4a68:0:b0:50b:effb:c63f with SMTP id q8-20020ac24a68000000b0050beffbc63fmr1741521lfp.6.1702288410761;
        Mon, 11 Dec 2023 01:53:30 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id h42-20020a0565123caa00b004fe202a5c7csm1031696lfv.135.2023.12.11.01.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:53:30 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization] [kirkstone] [PATCH 2/3] cni: fix textrel QA issue
Date: Mon, 11 Dec 2023 10:53:19 +0100
Message-Id: <20231211095320.10874-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211095320.10874-1-liu.ming50@gmail.com>
References: <20231211095320.10874-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 09:53:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8493

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
index fd9115ab..854c7a04 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -39,10 +39,10 @@ do_compile() {
 	export GO111MODULE=off
 
 	cd ${B}/src/github.com/containernetworking/cni/libcni
-	${GO} build -trimpath
+	${GO} build ${GOBUILDFLAGS}
 
 	cd ${B}/src/github.com/containernetworking/cni/cnitool
-	${GO} build -trimpath
+	${GO} build ${GOBUILDFLAGS}
 
 	cd ${B}/src/github.com/containernetworking/plugins
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
@@ -50,7 +50,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build -trimpath -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build ${GOBUILDFLAGS} -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.34.1


