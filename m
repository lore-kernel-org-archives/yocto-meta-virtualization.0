Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C14FC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:23:19 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.43983.1722435794793074492
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 07:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oj+t+9xI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso3299349f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722435793; x=1723040593; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjr5Z4eLZZRcOvCF+4ruPnD+BSrt/IQmNqxZihMn48Q=;
        b=Oj+t+9xIbm0s9dpTlkGVxGhmtVSchhT9HGQ++Mn3n0v/JDtWVzTMLum1pEDQB9F7o6
         12wY4DXGo71hHuJsRb5ZqPjVQqidGMajyPajzKKfiydizu7iQOWIZfZkIB3smra5ONEv
         lNbl0CmAW2YGmcFfSeKzYfR5CTCcNgNnU8HZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435793; x=1723040593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjr5Z4eLZZRcOvCF+4ruPnD+BSrt/IQmNqxZihMn48Q=;
        b=ODG3bvKwMPHV+Ocvj4r86xay87DHlYkSNChne7J1a0/Oa9KQ0dEnHxh9S3alnlvFcX
         Un5ZWXJW7qXRRJ+NmqZPo2OevaYK1qeL6Usq4g77Kz6MBhJTYOalNaeUoUSTadnOBnYi
         oIRosOhqUxy5ucLbMAodltCBwOcbl2rpnjpoF8dfiKgat0vciGt27k9tUdkMfyKnB0MH
         9yvWYn+qf+/qkFz7QogrMR9formYOBQypZTIgasvrPxGFfHkPI4NPFwjUOKE9LPjz57c
         +r2BsYtHuiQZPgNVgGazXMWzj9VYqdDG0kTx/ej2gx0ldK808+XcuTkZiAgzKLnpqK8B
         Su9A==
X-Gm-Message-State: AOJu0YxoMeeb1P7uTvAFDmJOxpJEWB7nQSp13t6JGDoNUQG1zwhI6jr5
	B+1/tzLCa83LBgeOo6RX0VJh610z0fv12IYN/DKPLHDiROYRL7s30wGhvGvzPtd3hmd3db4yCxL
	O/5E=
X-Google-Smtp-Source: AGHT+IGE0Aw2l3FCvYrvi4ZvkGpkK+PGuJZxjdcmef0BfeuXoqahdUHW6Q++4ON0xvHu+EsxTvTTnA==
X-Received: by 2002:a5d:4392:0:b0:368:75:2702 with SMTP id ffacd0b85a97d-36b5d0b0472mr8595665f8f.13.1722435792482;
        Wed, 31 Jul 2024 07:23:12 -0700 (PDT)
Received: from jet.. ([2001:8b0:aba:5f3c:ae1f:6bff:fe41:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36862489sm17040221f8f.105.2024.07.31.07.23.11
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:23:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] xen-image-minimal: Add missing dependency causing intermittent failures
Date: Wed, 31 Jul 2024 15:23:11 +0100
Message-Id: <20240731142311.47693-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 14:23:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8849

"bitbake xen-image-minimal -c do_image_wic" fails with:

| ERROR: _exec_cmd: install -m 0644 tmp/deploy/images/qemux86-64/xen-qemux86-64.gz tmp/work/qemux86_64-poky-linux/xen-image-minimal/1.0/tmp-wic/hdd/boot/xen.gz returned '1' instead of 0
| output: install: cannot stat 'tmp/deploy/images/qemux86-64/xen-qemux86-64.gz': No such file or directory
|
| WARNING: exit code 1 from a shell command.
ERROR: Task (/media/build/poky/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_image_wic) failed with exit code '1'

Add the missing dependency to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 recipes-extended/images/xen-image-minimal.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index fe79a485..e6fa93ca 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -102,6 +102,7 @@ QB_SERIAL_OPT = "-serial mon:stdio"
 # qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which is needed
 # to boot this image, so add it here:
 IMAGE_FSTYPES:qemux86-64 += "wic"
+do_image_wic[depends] += "xen:do_deploy"
 # Networking: the qemuboot.bbclass default virtio network device works ok
 # and so does the emulated e1000 -- choose according to the network device
 # drivers that are present in your dom0 Linux kernel. To switch to e1000:
-- 
2.34.1


