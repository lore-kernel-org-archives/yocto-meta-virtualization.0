Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.655.1630452509213314213
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 16:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vNNrEmpT;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id f22so1196071qkm.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Aug 2021 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ry99kP0JB053Ssyckuv0Y0BMAHCEkmm5f6kkHaOlqM4=;
        b=vNNrEmpTqAkfvGw82SR5oz6x4x5GjHWoajEUr+k1DeC8To+0UfmSLxzGmReeTjqLH+
         rWzLjqzfzPeLKoyRrfeLMJR40JSb55FbCgPvU+qUqnAHtpZOEnpYZsvjIKMDx3ismWbY
         XNWzAp7XqFaaP448AxrZ5RVICJ3fdThvjyGK30ZFTo4DCz6NVlPZYZ7Xyk51bcF78q8k
         HRxI//oOpX0scRwnzG6253I+bF8MkU66TKQull7y/NRvA39efHYNB5gmH6p/imjpvieQ
         jQg3TO5mWPtJEX5l4kQTfHFvsiMMGtFK1syUbFj/8rFR3j9EfSn3EcqFOJruECuYkE0W
         VdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ry99kP0JB053Ssyckuv0Y0BMAHCEkmm5f6kkHaOlqM4=;
        b=JVnEkHsFo/fRDk6+mzx/xdj16H9IkBgeS1L/q6EoRkkohXI7aRiFiGK556oYmXLGe2
         kJYP1tfAMpRNpLBmFjOaxunsGx+odFbwcXZrnR3m3g2lM1n/9UzJtGIndgwWeHIm4+pt
         jzRUe8XAD9EcdS4oZQ6HlueIu3z9eglYr7z947Ld6wpw7ocfmCckg6wQbBfUBkgE13Pr
         VWUVqDNSnJLkwCtgpVfkhikaTQL9voA9W1Q10EJN6a1jvHw5V9Gd+1PPMEeReuZDTO9S
         XQ/0T1TxOh3JRLqYJsVnCPz+I0WP3rGXPOgiVSiJHzcYaCG/eG365pa35UQj2ZoLLdxm
         UzbQ==
X-Gm-Message-State: AOAM531aaKx7UGPjk3vLDGiHjnlvUrDexTF+jlOxodvnxoopG+KXNDnA
	0hayZJfff/IquqOcv+l7vAsM4dJ0RgPu9w==
X-Google-Smtp-Source: ABdhPJz1oPVEgrfESwcSvmCpCE/R6B2kC9V1uV+fO5Su3sFG8mYhDhSCNj0TVmgWF8Ades78tt8xZQ==
X-Received: by 2002:a37:2d04:: with SMTP id t4mr5748841qkh.160.1630452508150;
        Tue, 31 Aug 2021 16:28:28 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-170-39-79.mycingular.net. [166.170.39.79])
        by smtp.gmail.com with ESMTPSA id d20sm14793007qkl.13.2021.08.31.16.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:28:27 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH 0/4] Xen Test Framework OEQA
Date: Tue, 31 Aug 2021 16:27:39 -0700
Message-Id: <20210831232743.252498-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series integrates the Xen Test Framework (XTF) into the
OpenEmbedded QA (OEQA) structure and enables testing of Xen with XTF
test cases in Qemu via the standard OE testimage mechanism.
It builds upon the earlier work to package XTF and the XTF image.

I am aiming for this test to be enabled by default to support test
coverage for the Xen hypervisor and initial virtual machines, the
Xen toolstack and XTF.

Since many XTF test cases have hardware-dependent behaviour, the list of
XTF test cases to run is minimal by default but able to be extended as
appropriate for a particular downstream image or machine via provided
configuration variables documented within the test.

thanks,

Christopher


Christopher Clark (4):
  xen-image-minimal: supply bootloader config for qemux86-64 machine
  xtf-image: fix QB_DEFAULT_FSTYPE: only needed for x86-64 qemu
  xtf-image: update qemuboot settings
  xtf: add testimage integration to run XTF test cases in OEQA

 .gitignore                                   |   1 +
 classes/qemuboot-testimage-network.bbclass   |  17 +++
 lib/oeqa/runtime/cases/xtf_minimal.py        | 116 +++++++++++++++++++
 recipes-extended/images/xen-image-minimal.bb |   3 +-
 recipes-extended/images/xtf-image.bb         |  20 +++-
 wic/qemuboot-xen-x86-64.cfg                  |   8 ++
 wic/qemuboot-xen-x86-64.wks                  |  12 ++
 7 files changed, 171 insertions(+), 6 deletions(-)
 create mode 100644 classes/qemuboot-testimage-network.bbclass
 create mode 100644 lib/oeqa/runtime/cases/xtf_minimal.py
 create mode 100644 wic/qemuboot-xen-x86-64.cfg
 create mode 100644 wic/qemuboot-xen-x86-64.wks

-- 
2.25.1

