Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1087.1605895379204348233
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 10:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdOcR50+;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id j7so10954454wrp.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Nov 2020 10:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ea9usgjT2JFZs+Ucb99xOML2oodNage0suQvpsO4/A=;
        b=PdOcR50+gRqv3AjSN/QgTp/Xzol/5ToJteQtdUigxlTgt0CBCRp30yjNbWiIQoBxTB
         mXOu5LzEGyrprCvSsuNKl/6vw/aeE8S9qUrq5GQX404ofK7h/IFJh0FCpHovHkHeHzt5
         FGmJ1QhA6rrzYkOfNOO87vVUUpUZ8EWDa4akkcYbaGv+R7lJK35o7+UUuamS66jcxvmd
         IYO+2LqIsLFnqjHerq6ZEmw7D7GSLJVIE+DuPL/ztBpXq8zXjtYd3wdMiGmec1Yo5aOY
         0vlKdWo3MvYDbcZCGUaEsA/cKeMocSO4w/kDQIGvj2LEgMHP4yurJMV8wgTx5NWy4tSe
         DjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ea9usgjT2JFZs+Ucb99xOML2oodNage0suQvpsO4/A=;
        b=fy5ziu7dthJ7P8YQ3fjlvZE1q63Gmb7B6g4UWlmigIgqypgmy79uRAcLUsi+bXi6LS
         ncNarlLufVUbObbsT2eazrBeXpKyxBTTKmeuIZqAARrkxkRkRGxnlfMUdMLXNpQ0qUKT
         OHpnspglsVlMJFajpXhTXVwaw02yw1rlf3mU2eql2hxIglrHpEXDBLewJMMvxhdW7GHw
         lf2hbPVdnEzmFubwcVlbC0JRUXJkNcRJ6Z6kjsreomE8Fuyb9jyJHew12vrqqv5z061N
         7eQd5GAJf8rUPnzRAFHAF6dzGlFTkcKD1hLQRs+vs4zO0HaCM9SjaBf5YGb45BW70Q6x
         CmOQ==
X-Gm-Message-State: AOAM530ObyR/OkmtOqT8eCKTq8p/Q1JTo8l78idv92zuPW16/bbgrKOj
	BOSOkJ0G77WbMFAFope2VsIhwffs7GA=
X-Google-Smtp-Source: ABdhPJzAy+rIUyBbJcDfIwB4neSF7NA20LYFe8ZFCVO58MbeJbt+9dzoKsiEg3sUvMFYgRFicZ1xag==
X-Received: by 2002:adf:f181:: with SMTP id h1mr16984790wro.267.1605895377102;
        Fri, 20 Nov 2020 10:02:57 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-93-184-20-132.customer.ggaweb.ch. [93.184.20.132])
        by smtp.gmail.com with ESMTPSA id j8sm5763490wrx.11.2020.11.20.10.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 10:02:56 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH] docker-ce: update to 19.03.13
Date: Fri, 20 Nov 2020 19:02:51 +0100
Message-Id: <20201120180251.3612946-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This update comprises the following commits:

4484c46d9d Merge pull request #658 from tiborvass/bump_19.03.13
19498650c3 Bump VERSION to 19.03.13
9e4ef2803a Merge component 'engine' from git@github.com:moby/moby 19.03
ac28add3de Merge pull request #41314 from thaJeztah/19.03_backport_fix_racey_logger_test
f0254fd65c Merge component 'packaging' from git@github.com:docker/docker-ce-packaging 19.03
c78f28f23a Merge component 'engine' from git@github.com:moby/moby 19.03
e0b868f387 Merge component 'cli' from git@github.com:docker/cli 19.03
2961931781 Merge pull request #493 from thaJeztah/19.03_backport_bump_golang_1.13.15
38ac4c17da Merge pull request #41451 from thaJeztah/19.03_update_buildkit
131aed7afb Merge pull request #2674 from thaJeztah/19.03_backport_bump_golang_1.13.15
b99d176810 Merge pull request #41446 from thaJeztah/19.03_backport_swagger_fixes
340e0f5aae Merge pull request #41312 from thaJeztah/19.03_backport_pass_network_error
71f2583eb1 Merge pull request #41334 from thaJeztah/19.03_backport_bump_golang_1.13.15
0d7a5f477d Merge pull request #40408 from thaJeztah/19.03_backport_update_containerd_1.3
edb9fbffd5 Merge component 'cli' from git@github.com:docker/cli 19.03
bcae92a97a Merge pull request #2720 from thaJeztah/19.03_remove_engine_alias
6c6dd50ae8 Merge pull request #2719 from thaJeztah/19.03_update_buildkit
4056693640 [19.03] vendor: stop using docker/engine fork for vendoring
f6cc6fa133 [19.03] vendor: buildkit v0.6.4-32-gdf89d4dc
d61bf277b8 [19.03] vendor: tonistiigi/fsutil v0.0.0-20191018213012-0f039a052ca1
4024535260 [19.03] vendor: buildkit v0.6.4-32-gdf89d4dc
4a3bea631c Merge component 'cli' from git@github.com:docker/cli 19.03
1cab9568fa Merge pull request #2667 from thaJeztah/19.03_backport_remove_from_index
d48744dd4e Merge pull request #2717 from thaJeztah/19.03_backport_update_git_remote_description
9a44f43fb9 swagger: fix MemTotal units in SystemInfo endpoint
a75083ebf0 docs/build: add note about git subdirectories with BuildKit
de666636a6 Merge component 'packaging' from git@github.com:docker/docker-ce-packaging 19.03
772ee04120 Merge pull request #498 from thaJeztah/19.03_backport_bump_buildx
112d03e8ea plugins: update buildx to v0.4.2
ef44b94189 buildx: use v0.4.1
8a18415110 Bump buildx to master to check if it builds on the CI
4d7b3045be Merge component 'cli' from git@github.com:docker/cli 19.03
6002284d4d Merge pull request #2695 from thaJeztah/19.03_backport_fix_vbomml_util
0100e1c0be Replace vbom.ml/util with fvbommel/sortorder
53c69c574e Bump Golang 1.13.15
87867aff90 Bump Golang 1.13.15
76060cc4a0 Bump Golang 1.13.15
8a905386a1 update containerd to v1.3.7
0ffc8f1e55 update containerd to v1.3.6
aff3f55db8 update containerd to v1.3.5
61f6fac7a1 update containerd to v1.3.4
c938231789 update containerd binary to v1.3.3
ba94dd5a0d Update containerd to v1.3.2
13106ca34e Update containerd to v1.3.1
c5ad02b467 update containerd binary v1.3.0
a0edb6a8cb Fix log file rotation test.
b17b2f05b6 Fix flakey test for log file rotate.
efe3cf2163 Replaces ADD with COPY in the COPY section
5a861b676c Check for context error that is wrapped in url.Error
a438db9875 docs: remove docs for —-from=index

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/docker/docker-ce_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 9835350..768cf25 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "ff3fbc9d55de9fce497cd058411f21f4a4dcdb7c"
+SRCREV_docker = "4484c46d9d1a2d10b8fc662923ad586daeedb04f"
 SRCREV_libnetwork = "026aabaa659832804b01754aaadd2c0f420c68b6"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
-- 
2.26.2

