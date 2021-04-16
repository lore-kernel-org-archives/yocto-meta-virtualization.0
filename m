Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.995.1618598529855941957
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 11:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJ0yj2E5;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id d15so16889085qkc.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Apr 2021 11:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iC3hmrNQdUlG2NJiNO/gZ1EIcCU6vPixaf82sOIEQHM=;
        b=cJ0yj2E5wkQBzgZK5mIAj3c48Pm3KO/x0eVlpTV3fmcmGq8HLa/ajp+xAar7YAYHDf
         bDTRmgYsVK0/z0uHpNUOt26xH5FQLT8yduijYFi6gwNSCTPESLbwiPyxCqM3NXn5jT2n
         LwUhbidjwsf73uTQ/lRdmQlyBd6+b1bDMpl3sGdb0jOeKSSfOK0i550v1UL6AKfhru59
         jVt6QRtkC0NUXwn4zRYb/nJOA112pSB1V8Jd2SbqTSbwfVPsrT2jMwGpETxQiLETxuur
         pyMHJznlcp1y0nFI4+yuW6bOCsoy1K0hlav3NNoapLUvGtuD312g72mzRMviOWXqqgr9
         SaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iC3hmrNQdUlG2NJiNO/gZ1EIcCU6vPixaf82sOIEQHM=;
        b=iibWuXwsLS6VR5QTxIp61qxcivSuYlbtPXa8WxAE3z4tsDhRAVSUOi5DtPFgbLjBm8
         BL8Otptz3u1BzEb2aSNCfx3ubhfXAHrHSkFyaxaTs7ByLfgvKvF3QRipi44x1yx53oBv
         pstwe7pNSCdQWRdbjK/brN7E46y3nxT7CtqYcpIbt1d7uKcBISWikxIJ6xYmS/CH1Al3
         M7I37a/BjvfasnBvvoB6DIKGVD6+6DaIa6CRuedqYs+ElC/LNkemoxjTzQiV8wkCgcnz
         QVxi7xj9wv9D983fv0MzzBYu9NCnxQcMjNgTZlH+KLs0598t3SNMWRnIIjz4ADxsul6z
         r2MQ==
X-Gm-Message-State: AOAM5323gNqlvPVr05gh31ZJ9G76ggXQ7l/RbFBZvEVbbBPjKFz5x63u
	LFgfyIPjX5RQywipsixs6rbrD0zTBcU+Cg==
X-Google-Smtp-Source: ABdhPJwUFpDVDpS6hlexHl563XkLv78xtmbNDaoJ2NbztrTZJBG/Zjl2M63AZdoQsXG7tcDe1fVtdw==
X-Received: by 2002:a37:5b43:: with SMTP id p64mr610248qkb.131.1618598528940;
        Fri, 16 Apr 2021 11:42:08 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org ([166.176.185.178])
        by smtp.gmail.com with ESMTPSA id m10sm3922238qtp.43.2021.04.16.11.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:42:08 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v3 6/6] xtf-image: add a new image for the Xen Test Framework
Date: Fri, 16 Apr 2021 11:41:36 -0700
Message-Id: <20210416184136.71992-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416184136.71992-1-christopher.w.clark@gmail.com>
References: <20210416184136.71992-1-christopher.w.clark@gmail.com>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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

