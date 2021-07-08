Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.7878.1625718783100510262
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bgqgexw5;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id s6so1599904qkc.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8tfLbIDd5CHiAFb9I7+7P+lPHkT0rXqf77uXoaS0a0M=;
        b=Bgqgexw5n90FqtL88l62uf4XJ4Zpae54xZUtN/XyiY0k+//jhXGMxV6DhFMdmACDgV
         WPl5juf4ttlArrV/Tk86gBiRp3Gjb2oVtSS5Tw1FKk8bp+7YzOUXDd/AQATLdLc8Re9U
         AzZC0uK0X87bicM8nxLTP1oNQWtA7jZCeRspv5qK+79jNqN0WMUMjf83X0NWHkD5ggpb
         Vk1Adr6hW2JIfCPcudQahremysf9CKVYe9d6gs5TK0r3a636JBf6r/EoJY2q8Mczmq1r
         OyP2d3QoEzmG8fWeT4U52XWGh3WmyoNflynBSMlKX+6LqA7Q9oa+GLXjwRjT5nDjEIRK
         ODlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8tfLbIDd5CHiAFb9I7+7P+lPHkT0rXqf77uXoaS0a0M=;
        b=JcI5csEAxvWstnzgSdsdppw8Kpt4Q/vArAqnLS/Qe6JMFTextmdoPXtW2YKndqAJ6z
         1Xt5RoP62Gr8RGfawIwo22PawaHi74UDV0zV9iAwMxW1knITy+cAWHCCfbUc4wTYasCX
         QnLRgzdAqGiEOR6O2FaF5dywWPPSn+uGnubXSbe/PWeJOSxXTiNB+tekWmGWF31JOjdo
         gS1jmha5J7lRwzXb6vTkECOMVsYY0TS/C36nQ3XZE28AzS7Ye+BYp5NA6cP8PD5zLRmI
         tkUy4DyuEnD7V75/FubayC012/DG/1oZ19oTRD+RusFtvjF8aYgVW2x6hLzy/gq2gPJO
         Ge2w==
X-Gm-Message-State: AOAM531dAwkchX/K9E01KbqRn1SNQ7QLYCE4TbQvaz8uqMVomudbsbFC
	qDgKs1MeFiLZCpQF22vs49SolN47hw/pgXdr
X-Google-Smtp-Source: ABdhPJyU67e02gOay67GyaWn6IBhUZ33nObHZgiWEu2fINQXQHQkYt+PgTX07nAjd3o2Bjm8asThtQ==
X-Received: by 2002:a05:620a:1423:: with SMTP id k3mr28921383qkj.118.1625718781477;
        Wed, 07 Jul 2021 21:33:01 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id p9sm517908qtw.88.2021.07.07.21.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:33:01 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH v2 0/4] Xen and XTF build fixes series
Date: Wed,  7 Jul 2021 21:32:42 -0700
Message-Id: <20210708043246.126719-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull in updates from upstream Xen and XTF for GCC 11 and fix passing
compiler flags for the Xen hypervisor, tools and test framework.

Changes since v1:
- for Xen 4.14, drop the previous cherry-picked compiler fix patch
  via an update of SRCREV to the current tip of stable-4.14
- add a patch to drop an unnecessary compiler flag override for
  the Arm 32-bit Xen tools build

Christopher Clark (4):
  xen, xen-tools: apply upstream fixes for gcc11 compilation
  xen, xen-tools: fix build and passing of CFLAGS via Xen vars
  xtf: fix build with gcc11 SRCREV and specifying linker
  xen-tools: remove Arm 32-bit compiler flags override

 ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ++++++
 ...x86-make-hypervisor-build-with-gcc11.patch | 111 ++++++++++++++++++
 recipes-extended/xen/xen-hypervisor.inc       |   3 +-
 recipes-extended/xen/xen-tools.inc            |   6 +-
 recipes-extended/xen/xen-tools_4.14.bb        |   3 +-
 recipes-extended/xen/xen-tools_4.15.bb        |   1 +
 recipes-extended/xen/xen-tools_git.bb         |   1 +
 recipes-extended/xen/xen.inc                  |  13 +-
 recipes-extended/xen/xen_4.14.bb              |   2 +-
 recipes-extended/xen/xen_4.15.bb              |   1 +
 recipes-extended/xen/xen_git.bb               |   1 +
 recipes-extended/xen/xtf_git.bb               |   3 +-
 12 files changed, 167 insertions(+), 11 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
 create mode 100644 recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch

-- 
2.25.1

