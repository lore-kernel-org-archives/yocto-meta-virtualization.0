Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036ACC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:59:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.12690.1743609578452820465
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 08:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnWu6eWF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so8963184a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743609577; x=1744214377; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0tiyuKD1ZCZLexxoKxw2li1kR8KHaqIW+h6a5ptVNE=;
        b=jnWu6eWFij5PvWu/giwjOVmbj180WdySDzL3JjJwEouAm460GHW8vewP1/3KzbFzLA
         fprjCqIim8O6Q82Blge8Wi+QmemCi4Z3DIM//uMQ+ewro3P7nwXb6Ab4Tu47PfKymZd0
         afLj4xcs54WsBw+amAMNqWVBTE9kCtO69cAYoTcx4ER7jIDXbCg2MuzUVnX8GYz7N5Eb
         u6mdEu+rcIhV+KiV/5LEGDUuS+3enA1W0GgtPiCKXvrdo0aRRmoNT1ZjwTlUP4vEiI8E
         IS9tQo4YfpLpVoKSyk2EnOh8Dg6O/IUTkzyyTyLJxUJtyV2FH0GvHhc9jyewfJO8gdON
         Bnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609577; x=1744214377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0tiyuKD1ZCZLexxoKxw2li1kR8KHaqIW+h6a5ptVNE=;
        b=ZDreu+/0JgTixF1TXqirneN/KP/jhE7R5kXLm5rdK9k1fjIsRsFcAD8IqCc/CiMSm7
         PG7rKfYTLs/lXgbnsugzHEGBUA6A79RbeMtgXZW/I1ykgEnlJ+mvH4ojEeLmnjsH/6rz
         +i8vzlT5RpZcDgjaD1+tg5hv+lO6ukbTxdG/KiddNdLZl1tC3ldE+B4YeNA/C3cJmVwy
         HxNyrI1twj5hEd4wCgSohG/K0FtgcR/fqvLCs79JNotks22xzMeebDOg7v7WaBPlSbYB
         pJkaP7qKPyCSpoZiAs9cOHj5yVhDskuddNGemZ+l4QrKgU1l1m0RvJVKiuh0jATU7Mlt
         eu0Q==
X-Gm-Message-State: AOJu0Ywm+PqmF4VIkkLh3Xe5VC3sGFOoqvX2MjivtQZfmWDTKTT84atd
	Oaz0prLA4z0vezyUu9L7owsf3+TPin2LfUH/Z95L1Kms3llVq5x+q4DCG85Z
X-Gm-Gg: ASbGnctVYBER7AN4JIxgmTY7pRN5aFG8ADhXgEiboQEpqCBZ7PA6O71tlPhtDLwKBTo
	amoU0El51yMphvqDi+OwXDZHbdU0EZyF6AOJQDlmRP0q1O6/kInURyKPQS5YSO1FSqVnanbJgvR
	HsY1JrZ9einYoNOel9Nt5D05r188z7Rqss1j/DmHmbqd7HStTaEvz0Nk10SWYuR7pu+v/tvrn9g
	lkuAVRyHEv99P2IGcsh2H0LDvuaJ1h6Fp8NEbCKcCv2y6D0UrlFhXjqoeOyGB8zlAwC33As+rDf
	Aabk4HT8dxHwulxXRJIl8vKFj88zvR6V26IcmoMhdreaHTQ=
X-Google-Smtp-Source: AGHT+IFXNQBtjcsZMw/LP4xfYWPOERp1US+Y9T/K7TgmRCz7PpivraaQjkKBSG5PcH1C1EwBUBrPzg==
X-Received: by 2002:a17:907:724a:b0:ac2:972c:f732 with SMTP id a640c23a62f3a-ac738ad5864mr1503725166b.33.1743609576712;
        Wed, 02 Apr 2025 08:59:36 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7196dd46asm922587666b.160.2025.04.02.08.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:59:36 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 3/3] metadata: relocation.inc: add whitespace around assignments
Date: Wed,  2 Apr 2025 17:59:27 +0200
Message-ID: <20250402155927.3585290-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402155927.3585290-1-martin.jansa@gmail.com>
References: <20250402155927.3585290-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 15:59:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9194

From: Martin Jansa <martin.jansa@gmail.com>

With:
https://lists.openembedded.org/g/bitbake-devel/message/17508
there are many WARNINGs from this layer

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-containers/docker-compose/relocation.inc | 2 +-
 recipes-containers/k3s/relocation.inc            | 2 +-
 recipes-containers/nerdctl/relocation.inc        | 2 +-
 recipes-extended/rootlesskit/relocation.inc      | 2 +-
 recipes-networking/cni/relocation.inc            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/docker-compose/relocation.inc b/recipes-containers/docker-compose/relocation.inc
index 9e71acd8..469361ac 100644
--- a/recipes-containers/docker-compose/relocation.inc
+++ b/recipes-containers/docker-compose/relocation.inc
@@ -1,4 +1,4 @@
-export sites="k8s.io/api:k8s.io/api:force \
+export sites = "k8s.io/api:k8s.io/api:force \
            k8s.io/utils:k8s.io/utils:force \
            k8s.io/klog/v2:k8s.io/klog/v2:force \
            gotest.tools/v3:gotest.tools/v3:force \
diff --git a/recipes-containers/k3s/relocation.inc b/recipes-containers/k3s/relocation.inc
index 72c02319..c9caaee0 100644
--- a/recipes-containers/k3s/relocation.inc
+++ b/recipes-containers/k3s/relocation.inc
@@ -1,4 +1,4 @@
-export sites="k8s.io/utils:k8s.io/utils:force \
+export sites = "k8s.io/utils:k8s.io/utils:force \
            cel.dev/expr:cel.dev/expr:force \
            k8s.io/gengo:k8s.io/gengo:force \
            go.uber.org/fx:go.uber.org/fx:force \
diff --git a/recipes-containers/nerdctl/relocation.inc b/recipes-containers/nerdctl/relocation.inc
index f5427070..a6129016 100644
--- a/recipes-containers/nerdctl/relocation.inc
+++ b/recipes-containers/nerdctl/relocation.inc
@@ -1,4 +1,4 @@
-export sites="gotest.tools/v3:gotest.tools/v3:force \
+export sites = "gotest.tools/v3:gotest.tools/v3:force \
            go.uber.org/mock:go.uber.org/mock:force \
            golang.org/x/net:golang.org/x/net:force \
            golang.org/x/sys:golang.org/x/sys:force \
diff --git a/recipes-extended/rootlesskit/relocation.inc b/recipes-extended/rootlesskit/relocation.inc
index f968694a..6c64233d 100644
--- a/recipes-extended/rootlesskit/relocation.inc
+++ b/recipes-extended/rootlesskit/relocation.inc
@@ -1,4 +1,4 @@
-export sites="gotest.tools/v3:gotest.tools/v3:force \
+export sites = "gotest.tools/v3:gotest.tools/v3:force \
            golang.org/x/sys:golang.org/x/sys:force \
            golang.org/x/net:golang.org/x/net:force \
            github.com/gofrs/flock:github.com/gofrs/flock:force \
diff --git a/recipes-networking/cni/relocation.inc b/recipes-networking/cni/relocation.inc
index c6538dd0..8d4a35db 100644
--- a/recipes-networking/cni/relocation.inc
+++ b/recipes-networking/cni/relocation.inc
@@ -1,4 +1,4 @@
-export sites="golang.org/x/exp:golang.org/x/exp:force \
+export sites = "golang.org/x/exp:golang.org/x/exp:force \
            golang.org/x/net:golang.org/x/net:force \
            golang.org/x/sys:golang.org/x/sys:force \
            gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \

