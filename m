Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C6C10F09
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:53:42 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.4985.1702288415061960797
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 01:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iP9X8WgQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso5470527e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288413; x=1702893213; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAf3qo3nkm+jQT1vKsXBrsFkgkfm3HCzoTKZ/4B/dZU=;
        b=iP9X8WgQifHSg475qeV5IGPjqDnzoHoQMBzoZO7rWX/dprD8EHedVFyLNUeRGaCXZk
         Lh71CcTINZG53w5ZFJ9FlKxHFONG5VZJn7OxU8R9djryd2HFo56laAxjeme1DxK88HVj
         SL5sKqhV5VUZ90cKc1hiKLx0ErQnaExr7uPobJilxrsIEoJmoJivgiRbGmfr3soBLCS3
         zYDmOpjhd7nW2Bs8rDeURfKYFdbtOFwP5EGh5DvQ2HM0Qu89p2maSVn2OaL1N4zf1e2V
         5K+NumXwSeb+1mTajL20R26y2TWN02LTnAgNoIUKe1gvoLf/5344otvOVkyMclviZ+9g
         aHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288413; x=1702893213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAf3qo3nkm+jQT1vKsXBrsFkgkfm3HCzoTKZ/4B/dZU=;
        b=BG8e2hezYeP8aUJDlhO7WZniprwZxN/6SSpNNtQAu4MpUdLXqnRhQVkc2bL3W3zxcq
         zrBz8/CAZ2CQY/52VCzpVcuf1WDM6dY4UCIZqGTmZI5BnYrjDXn3XlEhorOkMpdIklP1
         PoWdgkEzXg6eqUwObGOg/61MT32RP0Fg5eG9/0PTEmR+LUVQNJ29mltGfS+wMZ6Chz0o
         msBzocjt+6X3+7SW/ohNYuL4J4YszqZamvwXxXe3yXVN6a7DNzduU3JKB7GgI2knWzKZ
         ztevBqGcmkuNczZ1X8TEHTrHAHs/0EJdpcivoeCh/NSh51RAfsLC27ULJrCN9vIsuWKY
         29SQ==
X-Gm-Message-State: AOJu0Yz2EjTQ1SkE4ObeMBQ/FguzDjkcR/5Q4q4paKNVCemtshj8A5cu
	0l9w+sl+xq32nm4T8maC0uX9ul6Ypw4=
X-Google-Smtp-Source: AGHT+IEm5bVwbI8YTyDr4RQYo8ws5xc7r2w6pNhL0e/sFb+xFEfp+B2YxJmPfk5F7aQ3j+uprf8uVA==
X-Received: by 2002:a05:6512:1308:b0:50d:1a14:2f78 with SMTP id x8-20020a056512130800b0050d1a142f78mr2471887lfu.86.1702288412858;
        Mon, 11 Dec 2023 01:53:32 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id h42-20020a0565123caa00b004fe202a5c7csm1031696lfv.135.2023.12.11.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:53:32 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization] [kirkstone] [PATCH 3/3] cni: clean dir ${B}/plugins before do_compile
Date: Mon, 11 Dec 2023 10:53:20 +0100
Message-Id: <20231211095320.10874-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211095320.10874-1-liu.ming50@gmail.com>
References: <20231211095320.10874-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 09:53:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8494

From: Changqing Li <changqing.li@windriver.com>

Clean dir ${B}/plugins before do_compile to avoid cni generated binaries
like /usr/libexec/cni/bridge has wrong dynamic linker path and reports
error like: /usr/libexec/cni/bridge: no such file or directory".

Reproduce steps:
1. bitbake cni
2. enable usrmerge feature in local.conf
3. bitbake cni

After step 2, GOBUILDFLAGS changed,
"-I /lib64/ld-linux-aarch64.so.1" -> "/usr/lib/ld-linux-aarch64.so.1"

But "go build" seems only check if the cached packagefile changed, since
all not changed, the dynamic linker still use the old one, maybe go
build should improve this.

Clean dir ${B}/plugins to trigger rebuild of the binaries here.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-networking/cni/cni_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 854c7a04..f84e8a43 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -54,6 +54,8 @@ do_compile() {
 	done
 }
 
+do_compile[cleandirs] = "${B}/plugins"
+
 do_install() {
     localbindir="${libexecdir}/cni/"
 
-- 
2.34.1


