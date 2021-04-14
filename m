Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.821.1618443600758593254
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 16:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N7I9cHa8;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id 18so3438678qtz.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Apr 2021 16:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSiWDubbd+odnZ71UScYb4KDXw89D6eY5jh50aePpJA=;
        b=N7I9cHa8YR4HDp/+yUPiZQqHrfe/lfPYhaiiruDNshnfcv1/KzoRliCJXA9HYyv5Me
         CkIjzq5X/+Hxnb98hZhcy8OrBHFKx2N5vyP2APzPT7Acp2A5Jk7y74lXdgrhy0M+80Rq
         tOFB9VR/IHuQsQRLHd9CCO25aMVFNaoZZ6ghXyl/mIhB/7vQSIzfVcQlLKwIm6TdDo6s
         Wi0bjJRtL2mFKCQsMQguBY5lxF1dT4HyXlJlVAoSBhdPwv5C+Pzwlzf7Hb5wJxelowDW
         La3LoaNsK9ZJfFE6N0bBCyVuON7dzlzDbHDKWLH/uECrOT3cEqDaGKV3JtIcFpHqjWBW
         BFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSiWDubbd+odnZ71UScYb4KDXw89D6eY5jh50aePpJA=;
        b=XNfxbECMHrXgCNuI2wt/xnK3gu44th2jLnUX4yFwEErXxrccLMPv1oB0yabuHDS/Le
         ossxjwUKuZVT+tzkCrCcIb2pW8myQWrFOtskIpOXS0+sU0bzZMlIxBfnXZpgU1dEdhad
         KDej1KRDxKXR3IQVwjdhzakdMdYyKRuzmg1NuBB4XgKLrXy/fQldcFdI+NBEvC6Hv569
         6xH2h1bBufFHsEnv+mi72hgZa7D0L+LTuxImUi3CgYVlcB7WKnPwxBll1bEf3ifMgVDP
         c7N3wqPFUnPZo8ZQoYgagbjYzXrX3TerRrQ3uGYUEWuQ4PytIUgIkSM9Q+PGXToZEHcu
         KNew==
X-Gm-Message-State: AOAM533yX1GaP1boxuheJ4Sf/gE2oUrp4NXClOUhbdwzqlGcjJaNugfN
	6EekMZ/urYZMFFdb6pR3PoaMyvQA3ro=
X-Google-Smtp-Source: ABdhPJzppiHN70c4xjLF9eejHa8e1946M1o8LDYUq6pVHAbqnTLOVIesvnN1P15yFNy40WRzM/EDcw==
X-Received: by 2002:ac8:7397:: with SMTP id t23mr602667qtp.384.1618443599679;
        Wed, 14 Apr 2021 16:39:59 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-52.mycingular.net. [166.176.184.52])
        by smtp.gmail.com with ESMTPSA id q28sm736010qkm.15.2021.04.14.16.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 16:39:59 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com,
	andrew.cooper3@citrix.com
Subject: [meta-virtualization][PATCH v2 6/6] xtf-image: add a new image for the Xen Test Framework
Date: Wed, 14 Apr 2021 16:39:24 -0700
Message-Id: <20210414233924.55589-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414233924.55589-1-christopher.w.clark@gmail.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing the Xen hypervisor, with the qemux86-64 MACHINE:
    runqemu xtf-image nographic slirp
        (login as root)
        cd /usr/libexec/xtf
        ./xtf-runner --list pv
        # run an example test:
        ./xtf-runner test-pv64-livepatch-priv-check

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/images/xtf-image.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-extended/images/xtf-image.bb

diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
new file mode 100644
index 0000000..3f9af25
--- /dev/null
+++ b/recipes-extended/images/xtf-image.bb
@@ -0,0 +1,24 @@
+require recipes-extended/images/xen-image-minimal.bb
+DESCRIPTION = "A minimal Xen Test Framework (XTF) image for testing the Xen hypervisor"
+
+# To run XTF tests with an image built for the qemux86-64 MACHINE:
+#
+#   runqemu xtf-image nographic slirp
+#       (login as root)
+#       # xtf-runner expects to be run from the top of the tests directory:
+#       cd /usr/libexec/xtf
+#       # list the tests available for PV guest types:
+#       ./xtf-runner --list pv
+#       # run an example test:
+#       ./xtf-runner test-pv64-livepatch-priv-check
+
+IMAGE_NAME="xtf"
+
+IMAGE_INSTALL_append = " xtf"
+
+QB_DEFAULT_FSTYPE = "wic"
+
+# Set the dom0 memory level lower than that assigned to qemu so that Xen has
+# some available memory for allocating to the XTF microkernel guests to run:
+QB_MEM = "-m 400"
+SYSLINUX_XEN_ARGS_append = " dom0_mem=256M"
-- 
2.25.1

