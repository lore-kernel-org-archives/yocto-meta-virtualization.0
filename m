Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A7CC4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 21:38:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.139150.1670189915955967033
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Dec 2022 13:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=enoqoDUA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id f7so13352291edc.6
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 13:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcqeb839NPOwIhndLhp9Ovo6J8qvSDDiKA8X7Pbhtao=;
        b=enoqoDUAJ7RITg9JaJ7QuJBByvBWtQmlb3ta6K8L7f3Y4p6M9j7alFo9J1FGT2sDb3
         MzYVQ7N1Fvo/ZdGBu86V4ro2sxQ0bw4VdzBmCENeYL6dhJOZtgFDi1O6mZ15h2S2QNee
         3hoECOJ+50O2RBF869dGhS0exKFRCv6HhIIPZ5gFfkfEsWz/Uwe3bT33LBKcemmJ4+sM
         xHL5z9J37lR0ZLqyWlUzBG9qhtFA/ZGywj9GdT5tXK5G9o3UFeXnhlrAdD4v5TBmznu6
         B07yBjxBr2veNyen8YgE8po/unOeMyUqtvTmEjDe/2wWxc5KrBoz0KbGFi0htDf+yREq
         MBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qcqeb839NPOwIhndLhp9Ovo6J8qvSDDiKA8X7Pbhtao=;
        b=2p+anIrwVGws0CZth9IzoJaJHXx3meX4kowAq//wpjS866hfFfaPMDQ6dQyW6xU9rY
         6m4bodvzA8vlO7xzdU9B4tO/+/t9JOWxWw5r0xsq/c4ho4F5s/N8H6HB9zWeMH8rw4wn
         qxAUSMidjNh0PFnSiBTHBPWihi/vbNWP/avqEs2gakllaaZhJJnQRnUzXm0E5adpY3n9
         iyvxL6oFpOY8u+UlkGFzL76SZdzjBW5yEgROanDF5E7hbUINGA+o6BQ2CnOg67hhoIjo
         b2ehkSjxmq3SATi/7l0uryez3hOwRWW2uZVt0EOYR2aTewu4zEV0CPN/KfXzF7LVOuIG
         groQ==
X-Gm-Message-State: ANoB5pkU3e6eszTiiUglfarkOFcGYvsLqUidTDQKjOo5AXHLP88sCWvF
	ZVkwYIITX6FgoAivh4xNsogg6AXqiAI=
X-Google-Smtp-Source: AA0mqf4UcHijCKyMuQSx1R3Dj758hstdOr7CqDkytAxoo0EAgLgz7Oiy58EsvK2wgLwosi1EOMYPRA==
X-Received: by 2002:a05:6402:22db:b0:46c:c16b:b4c4 with SMTP id dm27-20020a05640222db00b0046cc16bb4c4mr1464335edb.419.1670189914142;
        Sun, 04 Dec 2022 13:38:34 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id dt13-20020a170906b78d00b0078d3f96d293sm5544179ejb.30.2022.12.04.13.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 13:38:33 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCH 0/3] docker updates
Date: Sun,  4 Dec 2022 22:38:06 +0100
Message-Id: <20221204213809.483131-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 21:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7733

Bring docker on the kirkstone branch to the same commits as they are on
master-next. Just let me know if you think this is not the right way. I
can easily maintain this on my own layer. But there are some bugs and
CVEs in Docker which make this update kind of mandatory for the LTS
branch as well.

Some findings:
* runc-docker RUNC_VERSION is on 1.1.2 on master-next. I set it to 1.1.4
  bcause this looks correct to me.
* docker: SRCREV_moby is used by do_compile. For docker-ce the variable
  is undefined on master-next. Here it is initialized to SRCREV_docker.
* docker: Upstream updated to go 1.8 which does no longer compile with
  Yocto's go 1.7. There is a patch to revert the go update. It's working
  but not sure how long this way will work.
* Testing: docker-ce running on a arm64 device can run a Debian
  container. We will do more tests in the future. But that's what I did
  so far.

Adrian Freihofer (3):
  runc-docker: update to 1.1.4-tip
  containerd-opencontainers: update to 1.6.9
  docker: update from 20.10.12 to 20.10.21

 .../containerd-opencontainers_git.bb          |    6 +-
 recipes-containers/docker/docker-ce_git.bb    |   30 +-
 recipes-containers/docker/docker-moby_git.bb  |   27 +-
 recipes-containers/docker/docker.inc          |    5 +-
 .../files/0001-revert-go-1.8-update.patch     | 1218 +++++++++++++++++
 ...efine-ActKillThread-equal-to-ActKill.patch |   90 --
 recipes-containers/runc/runc-docker_git.bb    |    4 +-
 .../runc/runc-opencontainers_git.bb           |    6 +-
 8 files changed, 1261 insertions(+), 125 deletions(-)
 create mode 100644 recipes-containers/docker/files/0001-revert-go-1.8-update.patch
 delete mode 100644 recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch

-- 
2.38.1


