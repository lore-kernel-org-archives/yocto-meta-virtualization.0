Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.3305.1625185943112807901
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Jul 2021 17:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bUC1s9mp;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id g4so7916434qkl.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Jul 2021 17:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IbBg+Ml7S0SsykYGMCSge/j8wki/SYwn0jtvQLhYxLA=;
        b=bUC1s9mpYEO0gvWtnh9Ziiy4A+CK5txgzzbaxU2L4Rj4qeQgHFE2J1a3slTb/huStu
         3OARBnnP7U18ry7cdqzIZ3efpBFXrXhVuq2XZjbKg6/LJez76z5NWMXuuquT8ybm15jA
         7N75KF7DWvPpO+mdfIq8rdbLOecJZ772h33S/Qg7ShysdEmWjFvZUpEskbmHrTozgaY8
         XOefW30kbuubGXDp3xmTzbEB3xMzq4vxGO7biqGR+q/mjEeqCn29+JUD8t+3X9jEV0s+
         ps8joIkHCQXot/zJHlqGnY70Hudjqo1+nl8Rc5MK3N1SRCbYSashFd4LcYrPN7+iEPvC
         qtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IbBg+Ml7S0SsykYGMCSge/j8wki/SYwn0jtvQLhYxLA=;
        b=aE+j8fpogkMRJfFmyfjizFI64WEUWyNBe34EzL81F9qJjcejdMH9H6aACywm7pOsQE
         P3QPqOeycmODUi/gNkkUPqg6ylS5qLTKH4RLO2ePXqvph1CQxcnpJ3YgY0DejYIsMFH9
         aJ8A9nG3K9v2GsCH/tTKtf9KLtRHSYC7BHGOI7YuB9PPBZ23h/t0ROJ1gYJTSOJ/ipAD
         FhNThla335k8UkM0ntUOpzCuvFjrc7AZT/my505tcdSAuTAIgJaFgGqsENyoTK5Id2sl
         EW92i7J5QNODGovO9XT7yEmJC1Id0UX4Dx4MYvpw33eq+oGq7xdF/gPHi0EYj+ksl1w9
         uKFA==
X-Gm-Message-State: AOAM530wzuh4ia62JZtviHUuyjKRU8R0xNVlyU2ilJy9/FPPPioc+uT1
	m/Jpb/XuzQlKM3UELDhN8fQkQV3JokYnng==
X-Google-Smtp-Source: ABdhPJz2YvfSNc0eDDMyoGy4Ji6nFWBb2jmRlsICkLyAchbKkYorTyvO/VUV1XTTgcp3/8Ay3Hs1tA==
X-Received: by 2002:a37:9b53:: with SMTP id d80mr2446981qke.280.1625185942145;
        Thu, 01 Jul 2021 17:32:22 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-137-178-102.mycingular.net. [166.137.178.102])
        by smtp.gmail.com with ESMTPSA id x16sm621135qtw.80.2021.07.01.17.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 17:32:21 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH 0/3] Xen and XTF build fixes series
Date: Thu,  1 Jul 2021 17:32:03 -0700
Message-Id: <20210702003206.79756-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull in updates from upstream Xen and XTF for GCC 11 and fix passing
compiler flags for the Xen hypervisor, tools and test framework.

Build and boot tested for both Arm64 and x86-64.

Christopher


Christopher Clark (3):
  xen, xen-tools: add upstream patches for gcc11 compilation fixes
  xen, xen-tools: fix build and passing of CFLAGS via Xen vars
  xtf: fix build with gcc11 SRCREV and specifying linker

 ...-rijndaelEncrypt-prototype-for-gcc11.patch |  52 ++++++++
 ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ++++++
 ...x86-make-hypervisor-build-with-gcc11.patch | 111 ++++++++++++++++++
 recipes-extended/xen/xen-hypervisor.inc       |   3 +-
 recipes-extended/xen/xen-tools.inc            |   6 +-
 recipes-extended/xen/xen-tools_4.14.bb        |   1 +
 recipes-extended/xen/xen-tools_4.15.bb        |   1 +
 recipes-extended/xen/xen-tools_git.bb         |   1 +
 recipes-extended/xen/xen.inc                  |  12 +-
 recipes-extended/xen/xen_4.14.bb              |   2 +
 recipes-extended/xen/xen_4.15.bb              |   1 +
 recipes-extended/xen/xen_git.bb               |   1 +
 recipes-extended/xen/xtf_git.bb               |   3 +-
 13 files changed, 219 insertions(+), 8 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch
 create mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
 create mode 100644 recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch

-- 
2.25.1

