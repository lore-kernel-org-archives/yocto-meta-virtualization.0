Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.994.1618598522064235426
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 11:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NkPxI/8g;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id d23so17820797qko.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Apr 2021 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QWjNSO/DtZ68q0//bA+MHK1Sxj92ot43a8gRcdEpoP4=;
        b=NkPxI/8gmza6K8PTLijNhB5hbd3kaKdHnxSVOBukh4jpgS3RLC50Cb9F0uBfy3ghFD
         f6XyWcJTTXDW6FvqKURiOd/gqWqGyyZ4QHZ/OCewcLJhOPrXQZFQqvE9eVJt6y9IAoMz
         KgZDz9Jm0hdaC8SN2R/36cvr4rBZFQqEEh7WAFWR6lXHueNeKxnWe2P93EOYoVd5PubJ
         LQaz0GGyC8L3dbBdCHisVjtbFusgaDOfBTwyB8TQ8nKjmqIyuObvEALQw/NgnQjWtmSr
         Qw9d2S+OiU4ZifBb6bBrKfqXMi+kEJdD0DV1hIspI9+tDTMvF8i3rLnAWUndpFtyXcV2
         RCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QWjNSO/DtZ68q0//bA+MHK1Sxj92ot43a8gRcdEpoP4=;
        b=eqtGPFeleYyb7aoOIqYhHIA8+BA3vagrzXDF53DEhJkUER666LyY20ZV11VHgCtViJ
         6+kRBBQoOPO4Seyr773jemS7m+alaxn+mOXMpa1AGCLKszMotwfY7EO1kxBqrcTXkhi3
         ciMbIvSuArJGTE66hqvD0RasjqcchcGRydtteVi+HZgpYdOJGJ1VuxzGooRmhF8/4Mb/
         KVUziU73zdic3rGx4l3Co/D8wVrYJXPySNk1ktCo1WytgCR81LUCtKa9TFbkR81ZIgqt
         MQxj2aGOSHUTrK+35RrasTgK5zoySG72UibNO1MAGFfZ9zJAXK3LHefh7r50QnBQ/5AC
         uUBw==
X-Gm-Message-State: AOAM530DE5uiKRqTiKp7hoYJjLw75jUczBSmSbYbqWPb8QWl/EQRE0/v
	mFkiDbwwGkXs8uiTRo1cnjliuWcprpZY+g==
X-Google-Smtp-Source: ABdhPJywiBN4M7gUykWfWI+KIL33GewGI9rAw62pcmJ5WirYXegl8pVDa9oVIhrsqlIvovfX34Ke5w==
X-Received: by 2002:ae9:edc8:: with SMTP id c191mr605602qkg.478.1618598520988;
        Fri, 16 Apr 2021 11:42:00 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org ([166.176.185.178])
        by smtp.gmail.com with ESMTPSA id m10sm3922238qtp.43.2021.04.16.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:42:00 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v3 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
Date: Fri, 16 Apr 2021 11:41:32 -0700
Message-Id: <20210416184136.71992-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416184136.71992-1-christopher.w.clark@gmail.com>
References: <20210416184136.71992-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipes are introduced as the non-default version by adding an
expressed PREFERRED_VERSION for 4.14 in:
    conf/distro/include/meta-virt-default-versions.inc

to keep the Xen 4.14 recipes as default for the Hardknott release.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../include/meta-virt-default-versions.inc    |  3 ++-
 recipes-extended/xen/xen-tools_4.15.bb        | 18 ++++++++++++++++++
 recipes-extended/xen/xen_4.15.bb              | 19 +++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
 create mode 100644 recipes-extended/xen/xen_4.15.bb

diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
index 299b5df..b85827b 100644
--- a/conf/distro/include/meta-virt-default-versions.inc
+++ b/conf/distro/include/meta-virt-default-versions.inc
@@ -1,3 +1,4 @@
 # Meta-virtuailization PREFERED_VERSION
 
-# placeholder for preferred versions
+PREFERRED_VERSION_xen ?= "4.14+stable%"
+PREFERRED_VERSION_xen-tools ?= "4.14+stable%"
diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
new file mode 100644
index 0000000..314dc52
--- /dev/null
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -0,0 +1,18 @@
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
+require xen.inc
+require xen-tools.inc
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
new file mode 100644
index 0000000..2842c0a
--- /dev/null
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -0,0 +1,19 @@
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
+require xen.inc
+require xen-hypervisor.inc
-- 
2.25.1

