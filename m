Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F38C10F07
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:09:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.6898.1702296566434772512
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 04:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FXFAM8gq;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so53607431fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 04:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702296564; x=1702901364; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mrLse1KBy7kCawlb8Pvf3h8EYFd5dn4LDXIcoYvqLA=;
        b=FXFAM8gqjb8WkBnlian6Lid43ZdGqsgyIlzw8M9+pc4oRrS1rmhcZAZBFzejDjti85
         Ein7B0Ip+btL3Qvr7XHceyAqJjWbgNmpMBSZzfeW1lruiRo74xJDLS13Nsc7icxGPAtG
         wvtKgRqC2gvgmNDeBAxya/BYk0iZ+Qwd7r5VEDw1RhBVyBIg9IO9Rj1fj6jb+d1818NM
         uVL0nbJ8GHeo1z+sIsY1xQgiABO7bOsiLXBZ5HuTv+jtt3VDCMDiCJJOTnPGlSr0qlaR
         tqzqgWg0+5PGhfy7RdyIalgxbYNqm0auMHVl5V1yPAVeSPVWAfzwcmWTBbboGU1ZeM+q
         QiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702296564; x=1702901364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mrLse1KBy7kCawlb8Pvf3h8EYFd5dn4LDXIcoYvqLA=;
        b=cc0um1jDzdZEWyvxfMT4iW/bp6z781bc6vQfu9lAfqjuaEogUf+S/przRf3+K6uual
         IoXy6mnYf/j92+04G7bbx676YaSjGM/92ralQkYH13fd5MSbJMfBYbGjTbuQKHwhznls
         gMI3hO8FzFmnywDzFuTIhhhl+fcAi2NYSq8dJpBgkl0K7RvUUBJT8x79sJ9wKpsWohth
         IMEAXAyRDyaey29WGdUyI4zhdoeBCnMeRUDW2tN8Hi+xOzzAEfwduyna+vTM69B4Cawn
         /SKavG7wKQjm7mU1PloH93ElWqLDV6HY5JXTPkGzrPxNMzimLtyej2Io34nMRB3IOpLU
         drOQ==
X-Gm-Message-State: AOJu0YxAS/rJoaNfUBOsAZ32BbiZipzwvLe75aFaMbojQ0eANOC8v8F1
	3QMfDj6VvtXBjWb3X+Jc5qmOye0g6hE=
X-Google-Smtp-Source: AGHT+IFGCEw0y3GscTnRZn1MvBIAJOjtwpr1dd7XYlMYBQGw+wGKXB1l5P/+aPbnWSo6pPoojflQGw==
X-Received: by 2002:a2e:a103:0:b0:2cb:54a6:5c89 with SMTP id s3-20020a2ea103000000b002cb54a65c89mr1183532ljl.107.1702296563468;
        Mon, 11 Dec 2023 04:09:23 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id r17-20020a2eb611000000b002c9f5039a86sm1210962ljn.87.2023.12.11.04.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:09:22 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 0/2] docker/podman: add alternative link for docker
Date: Mon, 11 Dec 2023 13:09:12 +0100
Message-Id: <20231211120914.1631095-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 12:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8495

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (2):
  docker: add alternative link for docker
  podman: add alternative link for docker

 recipes-containers/docker/docker.inc    |  6 +++++-
 recipes-containers/podman/podman_git.bb | 12 ++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.34.1


