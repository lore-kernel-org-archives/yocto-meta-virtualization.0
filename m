Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.39976.1584274803082690352
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 05:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dc3TYRJF;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id g12so15501088ljj.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m2NPwxVTtwa9E5TJp9/pbIVXRgkkLCRky5Sxno4M8Do=;
        b=dc3TYRJFSPz/OW5UMyIOd6CckHIt1oKHh8C1UD6bDz/rdEtfVPfIrjK1z5SMk+w7ST
         cWR3550cbPYZq5wBdbV5kw28k8a49JpG2MzvjPkyEnl5ALtWUVUzdDuewLbSOCZzuEVs
         h6APWprDc/ZH3y6XtfIwo+l5eFUl7F8/BrLP8UvaRGj/nxX1pgMjN35RydWG3ApoUt1F
         mwT5cxEhEpKzSdSINTF9pprchtUeKcERiIvaPIIBMSi4R2nuPNbqXiIsDzkCZWCVtvEB
         cK6Ut+TJYdvEK8AK9e2loAelvPkuFEQ3+PKivUjA+24qN0OP7G36nuqDgw2N/vgFOr5I
         qmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m2NPwxVTtwa9E5TJp9/pbIVXRgkkLCRky5Sxno4M8Do=;
        b=Fczt4XEMjyfSkwkajtw3klfus8cb39Cuut01Knf3rxt+ozGiQ6g4c3kPDMH0Z/+fn1
         EPfs+vlCUBE2fLY6+mpJdK3w84ghBDfPMMGc4TKis0yLOPBTaJ/q93JLblv6ksv/4Lj4
         Oxp4PrAcW8xMjTyjBMCDxN3OiTqiiFVZLtk1j/SFJ7KS06iE5E9uq2rehuGsitjl5bgv
         +8ySDuGwETklslFIyKQbBiO4lc7MwIRO7DNhf4ukw7CKa0kahmDjPuMuAxAmY6aLfl84
         bjBoCr5/0tGyZ7X16oUXzaTzzcdX9U7Nt+nMr21HdysrFa9JG+Gns4xI1OXIhIBqk6fr
         9JUA==
X-Gm-Message-State: ANhLgQ1Q63/wHh3ylU06oaaMpSgGKEwllvIdImlGoV8VoNmSYiQUcqe9
	qSrnB4nlGjyfZqX8Bf7f/P4Vos+aUrM=
X-Google-Smtp-Source: ADFU+vvvhnVDC+0AQSm8EKvuAHZf7bqn6Jy4IkJeIYttd+PytWCI2rKdylKpe8fxiz5cURjavm16dQ==
X-Received: by 2002:a2e:b792:: with SMTP id n18mr14158362ljo.268.1584274801087;
        Sun, 15 Mar 2020 05:20:01 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id q4sm22393707lfp.18.2020.03.15.05.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 15 Mar 2020 05:20:00 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH 3/3] docker-ce: uprev to 19.03.8
Date: Sun, 15 Mar 2020 13:20:08 +0100
Message-Id: <20200315122008.22161-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200315122008.22161-1-liu.ming50@gmail.com>
References: <20200315122008.22161-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-containers/docker/docker-ce_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index e32a734..82cce73 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "f0e27e52c1d57597a9b2e50baad33feb80474b76"
+SRCREV_docker = "afacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3"
 SRCREV_libnetwork = "9fd385be8302dbe1071a3ce124891893ff27f90f"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
@@ -38,7 +38,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "19.03.6-ce"
+DOCKER_VERSION = "19.03.8-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 PACKAGES =+ "${PN}-contrib"
-- 
2.25.1

