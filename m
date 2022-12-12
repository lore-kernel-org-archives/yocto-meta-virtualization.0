Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F38CC4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.37930.1670831997160363861
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dRI2gAAw;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n20so25896698ejh.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/h8TLBjitMWWVPDluRI9YEXF68OQ7xcrgu5gx4Ge6E=;
        b=dRI2gAAw2ionSRYbZoophR8kLQEG7zzVmQnDO6kh0NDcyv5Do1EPGq54oyDnE5BtP9
         HV5y3kgmdabZVNyWK6RkVH+oSiNp6dgIQTQw9AdFzfKPGEuNK+WKXx3ej+HoLOlCAKN+
         T/YiIwqxAcnTweO8O6asK27VgJn2yRJVZPtC2f5f1HLBbgCJbtPxrbIZ03BXlMl3hGSU
         B5Gph7Wd5WEL55ZF5V1Yv7At0JuIIAn+lTDHz8VgmGrNlCHr4F+s8RleWzrGOrAyIiC4
         yoGHgOdSOVdB6nDUwaz9PTtNJizfkdVW+O2jNVGFebkw2g+Qh5345guh+eSMMj3ffaD4
         uUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/h8TLBjitMWWVPDluRI9YEXF68OQ7xcrgu5gx4Ge6E=;
        b=0C8XqjiTVrq+A4PvjBjP9AsxkvvkFuV6PAO8cFVVo0HAJtWaVGdwZu9zHqDBwO6pb3
         P8NfUosM2g+zUThQAf6OnRJlIb2NYRMRAjgsCrO8nUzdjlyTop9tQbnJkivireCI6lUt
         rNnzTLv0xXBi6vEY9+gq2Sa7gqqukxeuxuIhPEg65cllF6YkJkG5po/JHFbzRfmNHx4k
         Otbxo80PincorQKVG73r8kor+aNKJsfMdw3zwlWP4FtT/FZFld8WIne/RkkZ5k+EADim
         3UrzNxc3svZ+OTcSRtJ8IJ3sdJvwTy4AHqO/pz7qoUBuVstDzedjDwGHvnVQO7+cDPP1
         W19w==
X-Gm-Message-State: ANoB5pmFq/+UHBEqm0lVjVj+zw6dZT8Jyde4pQePBRYevuZZrEUqS72K
	90fiKOCzxv40PPJbYaTNIIjVHMwcH54=
X-Google-Smtp-Source: AA0mqf4VLWtpprHVAS8LbxojPIjiJxH8S/1yNtqj4BMJ+vC7TucJt/AZ5EECqBINRb/t2fvdRWK0dQ==
X-Received: by 2002:a17:906:3acc:b0:7b5:be8e:1b1a with SMTP id z12-20020a1709063acc00b007b5be8e1b1amr17913049ejd.10.1670831995483;
        Sun, 11 Dec 2022 23:59:55 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:55 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 15/21] runc: update to 1.1.4-tip
Date: Mon, 12 Dec 2022 08:58:51 +0100
Message-Id: <20221212075857.1065221-16-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7768

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping runc to version v1.1.4-8-g974efd2d, which comprises the following commits:

    3b958289 Fixes inability to use /dev/null when inside a container
    335ec376 cirrus-ci: install EPEL on CentOS 7 conditionally
    fb145a2f cirrus-ci: enable EPEL for CentOS 7
    276297b6 VERSION: back to development
    5fd4c4d1 Release 1.1.4
    204c673c [1.1] fix failed exec after systemctl daemon-reload
    ec2efc2c ci: fix for codespell 2.2
    c778598c [1.1] ci/gha: fix cross-386 job vs go 1.19
    d83a861d Fix error from runc run on noexec fs
    d614445d [1.1] libct/nsenter: switch to sane_kill()
    3ca5673f CI: workaround CentOS Stream 9 criu issue
    c3986e53 tests/int: don't use --criu
    f46c0dad [1.1] ci: fix delete.bats for GHA
    6b94849d tests/int: runc delete: fix flake, enable for rootless
    fa3354dc libct: fix mounting via wrong proc fd
    eb1552a0 VERSION: back to development
    6724737f VERSION: release 1.1.3
    91fa032d ci: add basic checks for CHANGELOG.md

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 997fb1e..59ddca9 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
+SRCREV = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.3"
+RUNC_VERSION = "1.1.4"
 
 CVE_PRODUCT = "runc"
-- 
2.38.1


