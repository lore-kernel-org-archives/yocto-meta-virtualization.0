Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.15715.1605412178599042818
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 19:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MtK/qihv;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id 131so33498pfb.9
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Nov 2020 19:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VeXMPN0oPvVjrrDRCMmEBihIUiO3kFDMsLWnF2Q0qW0=;
        b=MtK/qihvBxBBgLYOy8Ea2rgcfflQ9aHv+8iuHeW9TwmsJYZlnx0+UEAYiCKkRymX6P
         SsQ/qDQ4cEvsa96kJ+tpKeme/y15pjBdyJdYshWcwZr3PGoV8pCAtPIe/Cw+EnaAYzcK
         WwKpwzcog+YMXikcRE1OvKbgzzQhgqL9JsVVyBxihRV7yMbJW4siXcsV7jufAKgcQv4h
         wladDsJy72niqkHt9mbNbKOeXzecnQmZ8GxkZWyO34cnjLg9XeOFnoY1HF+9/Y7ybgUc
         poWittTg+jGa53Ben0xKhWU8BI6GKXUz+ASX7sV7WM8xVOQ8sXSFPgAIynO5RpdnFILz
         gVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VeXMPN0oPvVjrrDRCMmEBihIUiO3kFDMsLWnF2Q0qW0=;
        b=pjuzf9xHYavZsDoTxQXKJiovzT8xZtAQSROfCI/lie4kL0g31jRazUh75Ph6J5Hirh
         Vuo1nhJnePRJgWUdv//sEbat46KGQ1TGgo232BOOKlWsR9nMFcJGHbEWcHMwErp7GOeN
         G2y+nMwbcVujww2HPZ02yRPN4HPK/tZdZDMnmsIL8kwCZYEWbAQOoxGCAOjRdQrgocS6
         ZPNeP6w1Rj0YZq8/tBa4BJyp+OjPgRTydxdDWRoZmFo7UfRXO6wiHveF9WCrnZ2YMlN4
         mCMPsThfeG01VLqkMiHs1cVrA+0ilR+sbGOx9hAbyawGvABUy7eUL/P2O6veH3rWNkIJ
         kTNw==
X-Gm-Message-State: AOAM532CA7ySZUKZkofgxlee+vHzI0YGnVqWLT+id3P+Q3/2rC6/RL0n
	Et5Iun5luJmbD1cOXHk3sBCz9n55Gr6gLA==
X-Google-Smtp-Source: ABdhPJxG7fHs3IS4WM3GGG15E9t6r7OWHqWhgfJi5ruRhgneTTvFVcasAPYuZeDKaPYAuu8zG+rxkg==
X-Received: by 2002:a62:8857:0:b029:18b:cf28:9bbe with SMTP id l84-20020a6288570000b029018bcf289bbemr8573863pfd.45.1605412177770;
        Sat, 14 Nov 2020 19:49:37 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:51f4:b524:ff3e:9205])
        by smtp.gmail.com with ESMTPSA id h68sm13997045pfe.74.2020.11.14.19.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 19:49:37 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-virtualization][PATCH] linux-yocto: add cgroup-hugetlb config
Date: Sat, 14 Nov 2020 19:49:22 -0800
Message-Id: <20201115034922.30940-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Add kernel config fragment for CONFIG_CGROUP_HUGETLB

This is a recommended config for Kubernetes and k8s
will throw a warning if it is not present.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg | 5 +++++
 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc | 5 +++++
 recipes-kernel/linux/linux-yocto_virtualization.inc | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc

diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
new file mode 100644
index 0000000..417ca24
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: MIT
+#
+# This requires CONFIG_HUGETLBFS
+
+CONFIG_CGROUP_HUGETLB=y
diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
new file mode 100644
index 0000000..7d1f999
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: MIT
+define KFEATURE_DESCRIPTION "Enable hugetlb cgroup"
+define KFEATURE_COMPATIBILITY all
+
+kconf non-hardware cgroup-hugetlb.cfg
diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index f050b3f..42a10b3 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -5,6 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
             file://docker.scc \
+	    file://cgroup-hugetlb.scc \
 	    "
 KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
 
-- 
2.25.0

