Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.819.1618443593311047881
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 16:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dMznfJ/p;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 30so10819546qva.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Apr 2021 16:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GmDRCpQX3E03IdzH2TnnsZwPsPxYu6BQ8ox/8YZDE8=;
        b=dMznfJ/pwm7W+zgUvjrENuDNp007H96CelMnxRS87ViZpRRk0FdNZy6bbrEI2peJCu
         +t7TKPYGzc29cAIYHYU/0MnwURIyogeSlo+K6nbmkbnBMyHN4Va7KZ0CjlOhVHvUrWGQ
         gmkljhJXsPFs4svL7g1tqOAU7W8eKdtCkvZmdRlEjKy6fGGLfSXDDp29nIViTZq4ZxlY
         RISHmjDyxVbKmuEj01bh56vOVquhn/eO0y7b6QGxeUyNAdl+0ZX36Lyzdbi2Fgra48HM
         Ss/Yym38C9bllL6BlL2mZkM6HDpPQGDpVfkcx7t4EMOVaRfgiBP2eCPJVdri2wiEQTqL
         gJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GmDRCpQX3E03IdzH2TnnsZwPsPxYu6BQ8ox/8YZDE8=;
        b=GHDE1TJuG/0+q/UxQ/1YFVSh8Oqcij2h0TNBRYy7HM4XPZDzkaQooN+ucCooVrjIRe
         4VbbnbGUArkFIAOmhyFFAOW64I/srIpSHnASciCm3hbWhoCDDL8tq13lKf0QptG6eUQs
         2zxzd0+9irHqrejzmTLgDgYgW2/HC9Kf61l0sPT2ZEiJhnUJYPU2iLc6M/9HXo6Kk6kX
         hKqpglDkbSF0khB7Lc3VL/sjv+gSL0xBPCYxy4/udaJqBhEvQxDXL9BZS1fqx1nDtciG
         F3fBP+kxNGmiwgqpXXBTvm8PGvbDsVXmXWCh8NniymHBg0H7FITqmxlUPxIxRkt3Kc+i
         l7OQ==
X-Gm-Message-State: AOAM532/Flu5++CpFEM6YX7J5FEyCWNEIA5bPZTcwQi/8IkytJd5ZW9L
	SnqKfVsQ3mEZKiw5NkHXHp2cLJALoes=
X-Google-Smtp-Source: ABdhPJzHzcxtTSPz+1ZWVnrP89lqrEOtwn9ebuBIbG24CSpEUGpPqKDq4xI4KP1GQYBOOtZMdmmlqw==
X-Received: by 2002:a0c:eb06:: with SMTP id j6mr673063qvp.10.1618443592352;
        Wed, 14 Apr 2021 16:39:52 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-52.mycingular.net. [166.176.184.52])
        by smtp.gmail.com with ESMTPSA id q28sm736010qkm.15.2021.04.14.16.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 16:39:52 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
Date: Wed, 14 Apr 2021 16:39:20 -0700
Message-Id: <20210414233924.55589-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414233924.55589-1-christopher.w.clark@gmail.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added as non-default, retaining the Xen 4.14 recipes as the default
preferred version for the Hardknott release.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools_4.15.bb | 20 ++++++++++++++++++++
 recipes-extended/xen/xen_4.15.bb       | 21 +++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
 create mode 100644 recipes-extended/xen/xen_4.15.bb

diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
new file mode 100644
index 0000000..d8cb846
--- /dev/null
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -0,0 +1,20 @@
+SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
+
+XEN_REL ?= "4.15"
+XEN_BRANCH ?= "stable-${XEN_REL}"
+
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
+    "
+
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
+
+PV = "${XEN_REL}+stable${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE ??= "-1"
+
+require xen.inc
+require xen-tools.inc
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
new file mode 100644
index 0000000..49268cc
--- /dev/null
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -0,0 +1,21 @@
+SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
+
+XEN_REL ?= "4.15"
+XEN_BRANCH ?= "stable-${XEN_REL}"
+
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://xen-arm64-implement-atomic-fetch-add.patch \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    "
+
+LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
+
+PV = "${XEN_REL}+stable${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE ??= "-1"
+
+require xen.inc
+require xen-hypervisor.inc
-- 
2.25.1

