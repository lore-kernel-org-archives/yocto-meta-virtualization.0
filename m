Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C80C43217
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:46:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.15314.1664912796152713542
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bE0J5NaZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id i6so14030349pfb.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=ZvjjWIA+dnGNH+u38Hyvn/F/vYhU69v3Q+grwvYFKto=;
        b=bE0J5NaZ0x7IuetABhSZsTW1adTSf+Eqb/rNwDPL5d5KJOJDAJaQVrsvkhZ1HEo50k
         o2U9SwuY0D4ZoYdVqYqEdUhvg8VaZ8RLt6GiTFs4GYlQKfCQOoMXjG4H13CDsopaNy1c
         dSv8+vI5maU41WpK5Vgu+nyFENcH3NFzuxzS2KXYwVVPSINQS41Y2DDIQD0V5zEVNJfR
         yUVmk21K8I5MRqV+c4EPnrhsffQlopWMDCh/wXs9lqwtOlpgHZ+xkakSTSDeMkQrQ/9x
         CNos1XpqZetK4bM1AL3O70GfznKzHSZ5yUrOEPnaCpgLLArMlcD4Zn0Oe5KqEpgN4JJO
         9gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=ZvjjWIA+dnGNH+u38Hyvn/F/vYhU69v3Q+grwvYFKto=;
        b=trhJOVyms8/Wi2C3CPkjghfrDB4ql8JtB2c4UK8Z8RxzQC66eZ7g5RhrPZugMvo0xr
         xX9CN/2gE/YdRzhoOIGLjmD4DUp8AyPFtWIXM59BdYUmwcxF1SHLCzTqeeYZ4Swmc/i4
         LfpSIcfuBVTadkH0nMwS0bkUxqSrfCF0SmwyzQww4frnVlTAmM0fK0ZMCgTXbjujcfpJ
         8nEyZ7fzqvfyHi+Lyim/s2ZWoxmmsfz8JFkfIiFnFYr1bcCX2W9kdBvGS0crHUMoyNRY
         8M90TTnKgOfBRFYZ5t8324hYFD5pU+Ppg/y5BuwyPh6ZbrCir3TEHKuLQiua72g8BfkE
         MkvQ==
X-Gm-Message-State: ACrzQf01ZknF721e43O/9NSj5xpnu5MnboibTlL76bfbE8GCWVgtLqdX
	KWtCvSP3otYQ/gNzE/n699DvzshkuFA=
X-Google-Smtp-Source: 
 AMsMyM7T5rgq2Ab8wiJLU80GylnuoIum7dc/Wq1l+7tHIf1HM+L+ijk6CPOx3OFZjj0k9DYpmWe0uA==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id
 p125-20020a634283000000b00457dced8ba3mr802538pga.220.1664912795579;
        Tue, 04 Oct 2022 12:46:35 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a17090ab78600b0020063e7d63asm8360507pjr.30.2022.10.04.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:46:35 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 2/2] xen,
 xen-tools: remove the version 4.15 recipes
Date: Tue,  4 Oct 2022 12:46:29 -0700
Message-Id: <20221004194629.50511-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004194629.50511-1-christopher.w.clark@gmail.com>
References: <20221004194629.50511-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:46:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7639

The existing 4.16 recipes are the current preferred Xen version, so
per the Xen version update policy, the 4.15 recipes can now be removed.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools_4.15.bb | 19 -------------------
 recipes-extended/xen/xen_4.15.bb       | 19 -------------------
 2 files changed, 38 deletions(-)
 delete mode 100644 recipes-extended/xen/xen-tools_4.15.bb
 delete mode 100644 recipes-extended/xen/xen_4.15.bb

diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
deleted file mode 100644
index 5592dd7..0000000
--- a/recipes-extended/xen/xen-tools_4.15.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# xen 4.15.2 release sha
-SRCREV ?= "32dcef072fb37d432fd45c7916383472f3fcbc5e"
-
-XEN_REL ?= "4.15"
-XEN_BRANCH ?= "stable-${XEN_REL}"
-
-SRC_URI = " \
-    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
-    "
-
-LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-
-PV = "${XEN_REL}+stable${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-require xen.inc
-require xen-tools.inc
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
deleted file mode 100644
index 41023b2..0000000
--- a/recipes-extended/xen/xen_4.15.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# xen 4.15.2 release sha
-SRCREV ?= "32dcef072fb37d432fd45c7916383472f3fcbc5e"
-
-XEN_REL ?= "4.15"
-XEN_BRANCH ?= "stable-${XEN_REL}"
-
-SRC_URI = " \
-    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
-    "
-
-LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-
-PV = "${XEN_REL}+stable${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-require xen.inc
-require xen-hypervisor.inc
-- 
2.25.1


