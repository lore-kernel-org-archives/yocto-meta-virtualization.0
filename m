Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.12584.1617346972596090421
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 00:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=udzH9d6h;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id w18so4587189edc.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Apr 2021 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YwHnzANFMJDQpw4Rro7tg/qcfv+jh+4rL+paDE2V30=;
        b=udzH9d6h0RZ7KYj1hTLU4i+ihQiY5bA4uIBrouLOHAKtG70QMmMc2lTUXoJ/5BVDaK
         lrfM/DkdwfPHtqjfynZcqo0LqndZWwqpWHPKfhnQITm8iixa1Ay18xgdsphu1CUNFgRf
         6RzFwVce10D91Msf3AlERLvmAPVUFDZg2HiEBWOOXtBTE6gB0d9hCDJrw58RiVN9oDbm
         gyluo69iZSTaFi5Tk5UQh4MT9sG/y3Ixv++hP803J3CFZ/MKvXn+ASH85v1OAu9X1RF+
         nOn2kHxAsmPe+5oJVA9lj41Vsx0xu+PjjZmB69bM7+/5dt4m7SmFnD0eUXP38qmwPC65
         QiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YwHnzANFMJDQpw4Rro7tg/qcfv+jh+4rL+paDE2V30=;
        b=ZCwilejLClny13lWegxCMcJBY/TS+7443NHpwyY4g+vWQcnPf33i9EFGNwNfa9FRt0
         ii9gLTuXV+asD+jwKaElOeLSXo4P+qPZF+9RDEZgPcMbtSkFakaA6fZVBLfYpzcRPOFi
         sV3IIjzJuZ2YcHRQtEe4DAdo0MtkJNrv4jM2NOlo3PPxgQO+0in4aWfs5OJ+xszgMVsp
         cQg0UGTNVrpejWIshSxLgBzFOUJpkPv7l+XofMzM2oqf2LyhaUw3s9+Nh/wqTlnxzTed
         Nm1Brg6q2UWaFWwaRcgcXDlI1wM6c//yYz5Q8HS2taZdVmGZlfXQ+F0IoChfELyIdRcb
         ooKA==
X-Gm-Message-State: AOAM532q0Oe3YWjijzAM5Vv5bEA203ZlsbwVt2prm/Hy+QcktCav2Jtd
	y5T1ecVcFrGblsqFW5W3Ax9EDl2kSqs=
X-Google-Smtp-Source: ABdhPJyuscF57pxS+B4ocwkrIYZfmDuMoI5xWWqosKiX2wJL84YRfwNth0zQ43g1J2OGLtXRn2xt7Q==
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr14109617edu.164.1617346970901;
        Fri, 02 Apr 2021 00:02:50 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dg26sm4925699edb.88.2021.04.02.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 00:02:50 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] packagegroup-kubernets: add seccomp to REQUIRED_DISTRO_FEATURES
Date: Fri,  2 Apr 2021 09:02:43 +0200
Message-Id: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes world build:
ERROR: Nothing RPROVIDES 'k3s-server' (but meta-virtualization/recipes-core/packagegroups/packagegroup-kubernetes.bb RDEPENDS on or otherwise requires it)
k3s RPROVIDES k3s-server but was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
NOTE: Runtime target 'k3s-server' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['k3s-server']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-kubernetes', 'k3s-server']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-core/packagegroups/packagegroup-kubernetes.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
index ec528e0..237e72e 100644
--- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
+++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
+# k3s has this restriction
+inherit features_check
+REQUIRED_DISTRO_FEATURES ?= "seccomp"
+
 PACKAGES = "\
     packagegroup-kubernetes-base \
     packagegroup-k8s-host \
-- 
2.30.2

