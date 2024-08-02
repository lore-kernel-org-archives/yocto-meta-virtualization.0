Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944CEC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:38:23 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.91848.1722602297362574644
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 05:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=ZdP8ZbSE;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.45, mailfrom: troth@openavr.org)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-81fbbd4775bso174786439f.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Aug 2024 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1722602296; x=1723207096; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Igef/rGY2orlYcYfb4hMJ+e59qfQ/3hW2SEQVC4jEE=;
        b=ZdP8ZbSEtzxXdxzNL/IDJnsLxjg5U87Lc8KkK5H7Qg/FKKB44q/DcvSM/m0CvzlM+R
         gKsmc6xA8V0YjzKzxOJZ5GbtScoCyyUhu7VPaVaLWu3apt47S9ihVPTtD+LChooW+lux
         9fbV1Odtpkxto5J9NcPY6YENir4nCpEX5Jf8wNShca7rniNfj367lKEkxUZ8w8hG4Q4d
         ehX8bN5oHzFlndHT0vuHfS13VeoXx+gJRgF7cGoQ+Lb2fi9nJwj2cJu+fnWrq/eF1Vx3
         u3vZcpySzZqAc+3wfTEEK9Fy5QlLSrD1wu87A2xFMtSMjAU9zxpAkHIXo+GNbL77vxE8
         I7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722602296; x=1723207096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Igef/rGY2orlYcYfb4hMJ+e59qfQ/3hW2SEQVC4jEE=;
        b=iIxLA0WHg/3NKkOpwbBw8Ye7ooPFiteCx6l2hM42Zc2FxohMMhZ4z+jIbbvzGUUfRU
         O007zepqmG82hMnmfQVmWrWlBhRHl+fSXwtuFDHiVy7mdkpgiNqDopSwCMyPWu1qjFEU
         U3GNmQLyL0w6cTJUsHVACYU41419SpXe3Yz4EVb80dBDW31XiV1kGJztrvc3djXIRp5O
         GqC6Xc4Ukfuc2OxjgImZQtznrXmS/GxIyg0Hg6wJ6/iDSwp8I57PhGcMN3n87bMA3JLn
         68WmVmhX/XH7y47dcIjndBWXgsgsRWfU0gHJCzWbhp45eQEhiUNaXhis/RVVp6wrUnmU
         p7kQ==
X-Gm-Message-State: AOJu0Yyu//+uN1ID5p5aGGVIT5zBtJUqOajlO/Ju+f8Ibs70/vw9jMyl
	Fwd94mctHglz/HjUi0nSqKzQPZxr5DZzA/6DGA+vFFUZw7UWXYWLdK7Cdd4cgcDV/add3uQrqt/
	m1ic=
X-Google-Smtp-Source: AGHT+IGf5FUKQaJqGFqSl4myw8CqylursHYyrKJq4IPqyz+FbMK7WiuRxs72RIcdyfA83wskstlrhw==
X-Received: by 2002:a05:6602:3ca:b0:81f:9468:7c3c with SMTP id ca18e2360f4ac-81fd43e3415mr415220139f.12.1722602296000;
        Fri, 02 Aug 2024 05:38:16 -0700 (PDT)
Received: from beast.bozoland.org (71-211-135-194.hlrn.qwest.net. [71.211.135.194])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81fd4d3aa3fsm52410939f.32.2024.08.02.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:38:15 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
X-Google-Original-From: "Theodore A. Roth" <theodore_roth@trimble.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [meta-virtualization][PATCH] docker-moby: Fix branch value
Date: Fri,  2 Aug 2024 06:37:54 -0600
Message-Id: <20240802123754.3683142-1-theodore_roth@trimble.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Aug 2024 12:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8857

From: "Theodore A. Roth" <troth@openavr.org>

The upstream git repo does not have a `27.0` branch. It is `27.x`.
This is causing fetch errors.

    ERROR: docker-moby-27.0.3+git7fa33a539a2054417c8aacdd7f92e3f8e50f1dff-r0 \
        do_fetch: Fetcher failure: Unable to find revision \
        7fa33a539a2054417c8aacdd7f92e3f8e50f1dff in branch 27.0 even from upstream
    ERROR: docker-moby-27.0.3+git7fa33a539a2054417c8aacdd7f92e3f8e50f1dff-r0 \
        do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from \
        any source.', 'git://github.com/moby/moby.git;branch=27.0;name=moby;protocol=https;destsuffix=git/src/import/')

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---
 recipes-containers/docker/docker-moby_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index b4576de9..16675d21 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -49,9 +49,9 @@ SRCREV_libnetwork = "67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c"
 SRCREV_cli = "d41cb083c352853f94b292a87df4859c4a96dcc2"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
-	git://github.com/moby/moby.git;branch=27.0;name=moby;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+	git://github.com/moby/moby.git;branch=27.x;name=moby;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
-	git://github.com/docker/cli;branch=27.0;name=cli;destsuffix=git/cli;protocol=https \
+	git://github.com/docker/cli;branch=27.x;name=cli;destsuffix=git/cli;protocol=https \
 	file://docker.init \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-- 
2.34.1


