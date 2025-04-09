Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EBAC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 15:07:24 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.10958.1744211234555422400
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 08:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=NAVO2wTy;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.160.172, mailfrom: troth@openavr.org)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4768f90bf36so62704741cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1744211232; x=1744816032; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Xo6RZtU+EEy+7Qm3m97YqbP4qe3OUp5Tp/7/2M7PUw=;
        b=NAVO2wTyYx7xxd2N4/p4Tpig++RPe7kWlNxYM3VulUnXPnv5TwjYdspCQdF5XEP930
         ZKwHczk+SBomzDJARLNLnEKuDowYq5jDfiq9+FrZ2AZc4Ujkk9doN/TCb7j53OWpXNHK
         +Uoo5x1nabBbbp6eqoFa7dFP4I2iEn33QUbD+L7ykFdJPy+oyqkQaqSZxp+rKMx1VIYG
         cU4VlpF0oFLrsWYCmhY9Q42DqQRfTU4WZW3CNyrwTkmpAz2MSkeQHQewt8fLtTk8vqsW
         N1wUmpnkLUSZyQhIXKqrw8sj2GzKX7hWaU2EbW1NaOQRAwO/SMX6IUGDuRDft2ovnr1U
         wJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211232; x=1744816032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Xo6RZtU+EEy+7Qm3m97YqbP4qe3OUp5Tp/7/2M7PUw=;
        b=DHfZCQHHQD+wbLYauUHTKJXpd4LkdJ5VLyeQbHJGh9s1GQtyO5Va9uOGa/X4JrNTqo
         i22yUoE1WHP0nv4oduWhW9KqMo3W4vFrbyVLYBP8M+NigOpZxHEM12GWcPlGnn5hdR1p
         Ei06vyXZIlP4IWBRLL8wUuwjAvetCP87ZHMEijnxXM0tbyACtzsbE2wJOwiN5dKhsMhp
         tBlDoPtCRyhVq50arTLG5l5P0LpgrHv5JyP51qgCH3FlxjzlLRKkM4TVjTPPsKVSwacy
         f0KFQHoEX1DS81i/lX79yMUvufxbQ19iMZx0KnhRNKi31ZcvaRsXi5ZRN2xukFXq9W0N
         rWMA==
X-Gm-Message-State: AOJu0YwgAq15/3aCyKHziF0H0faCasIqwCp70KBZMw4jD0evZA9GoEKQ
	UWU6zudg+JEerS2jdsDBA9x6uys+lhX9ioCGSlR8+9epQJV3hziA5r1PsjTWWSpWPv6H1atq286
	D
X-Gm-Gg: ASbGncueNovcxCrEvENSn+eotKQDeHkKeO9DMD8OzYn0vZWXnaH2DLo5Ic3grkwxh4B
	1vtob114I4xMO8/kkhy/Jf95O0h+UXSSV5mvh38LUJBgwRcQef+cDrzlwoKvWfoMrBW64NrULwV
	HzocyGk+etsFIrHdwwk8Ty/m3dUwB/CwMGaodvbucAzoWgN+utAZsPLNlXrLYvtRgAxb3A53iGU
	xvl9VHB7xCF6GcHR9y9/SXxtwlRVHGPMrIWlWtibYREq0/nzZUm7q5htBeuCTOFL8pbNe9PXMe0
	E+3upRygD+STOsscxNqwz4WxpOdfuDrOqk78kf7CqP8JsxQdaV0aaCiJLxc=
X-Google-Smtp-Source: AGHT+IFsBHucg27HmQCYD5LrGO8KWBLCc5IY8055VQ2c9wOFD+Qs1HHlYLQM/vo29E+vMZU8fZFZZg==
X-Received: by 2002:a05:622a:134f:b0:476:afd2:5b5c with SMTP id d75a77b69052e-479600c531bmr44514491cf.30.1744211231295;
        Wed, 09 Apr 2025 08:07:11 -0700 (PDT)
Received: from tas-troth.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964d71abcsm8116891cf.5.2025.04.09.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:07:10 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [meta-virtualization][PATCH] podman: Fix QA error for invalid PACKAGECONFIG
Date: Wed,  9 Apr 2025 09:06:20 -0600
Message-Id: <20250409150620.59558-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 15:07:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9211

The insane.bbclass now flags as errors when PACKAGECONFIG contains a
value that does not have a setting.

For example, setting a value like this:

    PACKAGECONFIG += "foo"

without something like this in the recipe:

    PACKAGECONFIG[foo] = "stuff"

will result in QA errors like the following:

    ERROR: podman-v5.4.1-r0 do_recipe_qa: QA Issue: podman:
           invalid PACKAGECONFIG(s): docker rootless [invalid-packageconfig]
    ERROR: podman-v5.4.1-r0 do_recipe_qa: Fatal QA errors were found, failing task.

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---
 recipes-containers/podman/podman_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index be85e512..9f886ed4 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -70,6 +70,9 @@ EXTRA_OEMAKE = " \
 # packageconfig, the podman package will rconfict with docker.
 PACKAGECONFIG ?= "docker"
 
+PACKAGECONFIG[docker] ?= ""
+PACKAGECONFIG[rootless] ?= ""
+
 do_compile() {
 	cd ${S}/src
 	rm -rf .gopath
-- 
2.34.1


