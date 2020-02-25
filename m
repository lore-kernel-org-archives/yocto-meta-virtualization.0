Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.94.1582591037569891001
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 16:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bpn9jntQ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CAB8E01755; Mon, 24 Feb 2020 16:37:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RHS_DOB
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.178 listed in list.dnswl.org]
	*  1.5 URIBL_RHS_DOB Contains an URI of a new domain (Day Old Bread)
	*      [URIs: platformsecuritysummit.com]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0E8CE01486
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Feb 2020 16:37:15 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id u12so5985559pgb.10
        for <meta-virtualization@yoctoproject.org>; Mon, 24 Feb 2020 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1sC2eVMnAYQlmAhzkIxGleOvlhODw7QtXNCbZnW4fQ0=;
        b=bpn9jntQxibOoRrlwzQI8N156sfDU5xxMqrh+PwVRx0ulOh3vXF6Z2eVYOuyx5RIXw
         +lhTJ48XgU1CQmSPtuVAtPUKR7+kb/jwdTkjtt++6U3inErd36RiPGIzJtNeZFeqbvbj
         FaKb5NQZxy3hRzJIWwnjo7TaOz3jGeuTi63CZcucioedNIFFdLORBL5ysomr9BQ4yfQb
         13aWMdtCr+jyKtfGfUpzoy7U6f4/Wakom02kHLjhLjQnOyPVfnKsCcy9VmjJFZ+vuHV9
         z9GfhsGHcHEz8xffyk1VzfIdPCd+VCc/u82ffnSphg8lXLF1Sq5duxtlAe6Gj9mcNmMg
         u4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1sC2eVMnAYQlmAhzkIxGleOvlhODw7QtXNCbZnW4fQ0=;
        b=PwW1QiNtRTFZnPsfQhzQIuCWtF1Vs5G0F/upLT1TupypdamTZAf39E8Kd2QS4jhfqg
         apz8XC4iZMMF3wpUAKBkMOu3hsbqlQXFyzBmL3J6LHkuYYFGc/H08avuHA8ViZ5II/D5
         5f95aoQL03ShnfV+ApTGtawkaLHBGs0ppC5PfjpB5F2JJ15VKj1YhkXFxxhXo03facwv
         w3LF9IqYDzOrsDY8EDogqJmiJghSi95cydB2TgYywMgOa6ouGu+wKt6jFWno22ElD74+
         xgL2OHO1JO5MhTsGuYD0kqCqOE3T5DFGHfqTHeVJfrWRYMdWFOm5Yc6v+0/48UuWNhXg
         XscQ==
X-Gm-Message-State: APjAAAUFPcLaf5fGss4RBwRK82k422KjCkT/hD2KcXcekaU2r0+wSM7K
	1n4W5/EsAu40kwBxCXY9EHKH6Hxk
X-Google-Smtp-Source: APXvYqzz97RjwEYltr55hBodeoYIJv/PUtvvrP/8KhkC2ttW0mN8IL3S49WFxGKJm8YfDR3A1fvSSA==
X-Received: by 2002:a62:cf07:: with SMTP id b7mr52204050pfg.77.1582591034331;
        Mon, 24 Feb 2020 16:37:14 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x132sm14065017pfc.148.2020.02.24.16.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 16:37:13 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] uxen-guest-tools, image: package the Linux VM tools for uXen hypervisor
Date: Mon, 24 Feb 2020 16:37:00 -0800
Message-Id: <20200225003700.14858-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

uXen is a type-2 Open Source hypervisor from Bromium/HP.
    https://www.bromium.com/opensource/

This adds packaging for the Linux guest support software, enabling OE
to produce VM images to run on the uXen hypervisor.

    uxen-guest-tools: in-guest software device drivers
    uxen-guest-image-minimal : minimal core image with uXen drivers

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../images/uxen-guest-image-minimal.bb        |  9 ++++
 recipes-extended/uxen/README.md               | 48 +++++++++++++++++++
 .../fix-Makefile-for-OE-kernel-build.patch    | 36 ++++++++++++++
 .../uxen/uxen-guest-tools_4.1.7.bb            | 22 +++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 recipes-extended/images/uxen-guest-image-minimal.bb
 create mode 100644 recipes-extended/uxen/README.md
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch
 create mode 100644 recipes-extended/uxen/uxen-guest-tools_4.1.7.bb

diff --git a/recipes-extended/images/uxen-guest-image-minimal.bb b/recipes-extended/images/uxen-guest-image-minimal.bb
new file mode 100644
index 0000000..d37a95b
--- /dev/null
+++ b/recipes-extended/images/uxen-guest-image-minimal.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "A Linux guest image for the uXen type-2 hypervisor."
+LICENSE = "MIT"
+
+inherit core-image
+
+IMAGE_INSTALL += " \
+    packagegroup-core-boot \
+    uxen-guest-tools \
+    "
diff --git a/recipes-extended/uxen/README.md b/recipes-extended/uxen/README.md
new file mode 100644
index 0000000..0973383
--- /dev/null
+++ b/recipes-extended/uxen/README.md
@@ -0,0 +1,48 @@
+# uXen : Open Source type-2 hypervisor support
+
+For any issues with the uXen recipes please make sure you CC:
+
+    christopher.w.clark@gmail.com
+
+## uxen-guest-tools : software for within guest VMs, kernel modules
+
+* uxenhc        : hypercall driver
+* uxenfb        : framebuffer driver
+* uxenhid       : Human Input Device driver
+* uxennet       : virtual network device driver
+* uxenplatform  : uXen platform device driver
+* uxenstor      : virtual storage device driver
+* uxenv4vlib    : v4v, Hypervisor-Mediated data eXchange
+* v4vvsock      : v4v vsock virtual network device driver
+* v4vtest       : basic v4v vsock test
+
+To produce a bootable VM disk image file:
+
+    wic create directdisk -e uxen-guest-image-minimal
+
+To test, copy the .direct file that wic produces to the host with uXen installed and write the following to a new file: `linux-vm.json`. Update the file path within it to point to your wic-generated disk image:
+
+    {
+      "name" : "Linux Virtual Machine",
+      "boot-order" : "c",
+      "block" :
+        { "id": "ich0", "proto" : "raw", "xsnapshot" : true,
+          "path" : "c:/Users/Yocto/directdisk-202001010100-sda.direct" },
+      "memory" : 768,
+      "net" : { "type" : "nic", "model" : "e1000" },
+      "hpet" : 1,
+      "vcpus" : 1,
+      "use-v4v-net" : 1,
+      "v4v-storage" : true,
+
+      "" : ""
+    }
+
+and then boot it:
+
+    uxendm -F linux-vm.json
+
+References:
+  https://www.bromium.com/opensource
+  https://github.com/uxen-virt
+  https://www.platformsecuritysummit.com/2018/speaker/pratt/
diff --git a/recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch b/recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch
new file mode 100644
index 0000000..651d991
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch
@@ -0,0 +1,36 @@
+# OpenEmbedded uses KERNEL_SRC instead of KDIR
+# and enable the modules_install target.
+# Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+diff --git a/Makefile b/Makefile
+index 3fd3075..80cf0fe 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,10 +1,13 @@
+ ifneq ($(KERNELRELEASE),)
+ # kbuild part of makefile
+-else
++include Kbuild
+ 
+-KVERSION ?= $(shell uname -r)
+-KDIR := /lib/modules/${KVERSION}/build
++else
++#normal makefile
++KERNEL_VERSION ?= $(shell uname -r)
++KERNEL_SRC ?= /lib/modules/${KERNEL_VERSION}/build
+ UXENDIR ?= $(shell pwd)/include/uxen
++INSTALL_HDR_PATH ?= /usr
+ 
+ LX_TARGET_FLAGS= -DLX_TARGET_STANDARDVM
+ LX_TARGET_ATTOVM=n
+@@ -19,7 +22,9 @@ EXTRA_CFLAGS=$(LX_TARGET_FLAGS) -g -Wall
+ NOSTDINC_FLAGS=-I$(shell pwd)/include/ -I$(UXENDIR) -I$(UXENDIR)/xen
+ 
+ all:
+-	make -C $(KDIR) $(LX_TARGET) M=$(shell pwd) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)"
++	make -C $(KERNEL_SRC) $(LX_TARGET) M=$(shell pwd) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)"
+ clean:
+-	make -C $(KDIR) $(LX_TARGET) M=$(shell pwd) clean
++	make -C $(KERNEL_SRC) $(LX_TARGET) M=$(shell pwd) clean
++modules_install:
++	make -C $(KERNEL_SRC) $(LX_TARGET) M=$(shell pwd) modules_install
+ endif
diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
new file mode 100644
index 0000000..757f1e3
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
@@ -0,0 +1,22 @@
+SUMMARY = "uXen type-2 Open Source hypervisor Linux guest tools"
+DESCRIPTION = "Linux guest virtual machine tools for the uXen hypervisor"
+HOMEPAGE = "https://www.bromium.com/opensource"
+LICENSE = "GPLv2"
+
+COMPATIBLE_HOST = '(x86_64.*).*-linux'
+
+SRC_URI = " \
+    https://www.bromium.com/wp-content/uploads/2019/06/uxen-vmsupport-linux-${PV}.zip;name=uxen \
+    https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
+    file://fix-Makefile-for-OE-kernel-build.patch \
+    "
+
+SRC_URI[uxen.sha384sum] = "d9d7a1fa5c44ac77eea3d8d4756f9e07fc02acfe12606325ff0bb8a60c07abc3e9ddb80c2039797fb2122d750219722f"
+SRC_URI[license.sha384sum] = "92e48c614df3094cb52321d4c4e01f6df5526d46aee5c6fa36c43ee23d4c33f03baa1fc5f6f29efafff636b6d13bc92c"
+
+# The software license is GPLv2: please see page 199 of the pdf document
+LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
+
+S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
+
+inherit module
-- 
2.17.1

