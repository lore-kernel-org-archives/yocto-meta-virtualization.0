Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F927C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 20:31:51 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.36231.1746390701181629032
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 May 2025 13:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=Zncw9fF8;
 spf=pass (domain: limonsoftware.com, ip: 209.85.210.53, mailfrom: anibal@limonsoftware.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7303d9d5edeso885351a34.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 May 2025 13:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1746390700; x=1746995500; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+JJgXyXpjqcY3uK/ZQqzxC0VhRJSRzi4hv6OYbwFbQ=;
        b=Zncw9fF8CB7TOjQTadHtDuuZejOSMlGkLyZW/CgZIim3MDR2x0krVRq/Pvwl+6Fw8e
         b4PLBEniVLEluAlb4RcVjJr1nJobVkLYfMORmZU94m5Ue3tIYhXFWy5k/vjTkGgDqdT7
         S4S6wbn92tRKT1essThHkAWHBJSSfaiLR459wCNIr0tj6ZIxPblUMqsau+3FFPSXJKgC
         uPLQhTaoAYxwxT8ANBG6HqdSxtAJZwv0hdCwmuV8R4EBm9K0mvk5hWmytqpk7frdiRcr
         sTaXMCy75qRHePi9AOi0onH5wjV05mWeQB6bLoj14qaEMmOcKiUPsY14r4DzWfOPR2Lg
         yynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746390700; x=1746995500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+JJgXyXpjqcY3uK/ZQqzxC0VhRJSRzi4hv6OYbwFbQ=;
        b=PTf4TinO7GJWr/HZp5FNrQImTgBWCeznli0NNOvfKLOfdVYQj6bvw94XUdE9s/hUoS
         KXNg3UUG79qH4pYliZijUSIoeGQju6bMfc36VWVAjZm3+h14liumCDFFr/U/IOMxAPzP
         fUYZyYDn8tz3T1iY85jsuHFg6G6LqqBiqHqtIWQ/jHjuYqaw34wkq6fea2v/9oHnK9+O
         aiBOJfWShpWaXg+pDMpX5WmQfbQWW3ptjvSv88413JZZdzsILm2AW30mKa+BccjQv4QH
         kfV1c+BABizpzijYXAXyLD0Jh3xYTzOLlQAr8xGEMAfu9OmY3clLqqGIK0DLu5EQfYql
         Tliw==
X-Gm-Message-State: AOJu0YyUQt2Koj5q+Hn5zDY517G7R/YrVOCtpXSR2+KGtlS+bKTRvHKL
	4MQEJF9H7f1hfUVFz9fO880F7SK4+IZC83gFho4O4Sx3j1BvKKS2m6xRKdc+bTrxeMrGVp0CZ0S
	JzNg=
X-Gm-Gg: ASbGncuHKs18vbKYHntWqdCtYFEkPW2IE1weT/nO8vAMS3ocL1mM46zrzwGx2hWt+Hm
	Aw+jG7fMA3TI0EEkirJ6JecMujuzAfxxVYabxqtYwAVSueUcrPMUiyW7lC6iGBd919Xt5WmlFEu
	Y1tQTB3f4cOqjx7lpVhymFdbkZYXmJZEV3k4YYZIIwpk7v5G61xfud4gJDUA90nTDjiLbNrRWdL
	KeH6VXNi/nU05JmNkn9D7mIMu/OHymS4YxeFbu9R6otmng2OGj+tG/pMuyjFMYZMpzOW09zrHUM
	6G04kbmlci/S8AEZDicmghanaO36gsgq1hHK7JkLKpa8fg/0y8Kx31GHl30bfKs=
X-Google-Smtp-Source: AGHT+IFC8+sWL8RNWrZW+RsB6ObuaNlWsUMOC1LxSOVOrT6sMpJjDj6VxBx8nmh+OGTid0UK24/miA==
X-Received: by 2002:a05:6830:370e:b0:72b:9b1f:2e33 with SMTP id 46e09a7af769-731e5614117mr4002264a34.18.1746390700247;
        Sun, 04 May 2025 13:31:40 -0700 (PDT)
Received: from blackbox.ts.net ([189.174.29.242])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d31a274csm1281548a34.7.2025.05.04.13.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 13:31:39 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	christopher.clark6@baesystems.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH] scripts: wic plugin bootimg-biosxen drop helper to reuse bootimg-pcbios
Date: Sun,  4 May 2025 14:31:33 -0600
Message-ID: <20250504203133.97015-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 May 2025 20:31:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9240

With wic plugins source rename on OE-Core now can be imported.

Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code
removing all custom calls and references.
Finally rename bootimg-biosxen to allow be imported.

Tested with xen-image-minimal and testimage.

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 ...{bootimg-biosxen.py => bootimg_biosxen.py} | 71 ++++---------------
 1 file changed, 12 insertions(+), 59 deletions(-)
 rename scripts/lib/wic/plugins/source/{bootimg-biosxen.py => bootimg_biosxen.py} (69%)

diff --git a/scripts/lib/wic/plugins/source/bootimg-biosxen.py b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
similarity index 69%
rename from scripts/lib/wic/plugins/source/bootimg-biosxen.py
rename to scripts/lib/wic/plugins/source/bootimg_biosxen.py
index f00747db..5242ee4f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-biosxen.py
+++ b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
@@ -34,59 +34,18 @@ import os
 import types
 
 from wic import WicError
-import wic.pluginbase
-from importlib.machinery import SourceFileLoader
 from wic.misc import (exec_cmd, get_bitbake_var)
+from wic.plugins.source.bootimg_pcbios import BootimgPcbiosPlugin
 
 logger = logging.getLogger('wic')
 
-class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
+class BootimgBiosXenPlugin(BootimgPcbiosPlugin):
     """
     Create MBR boot partition including files for Xen
 
     """
 
     name = 'bootimg-biosxen'
-    __PCBIOS_MODULE_NAME = "bootimg-pcbios"
-    __imgBiosObj = None
-
-    @classmethod
-    def __init__(cls):
-        """
-        Constructor (init)
-        """
-        # original comment from bootimg-biosplusefi.py :
-        # "XXX For some reasons, __init__ constructor is never called.
-        #  Something to do with how pluginbase works?"
-        cls.__instanciateBIOSClass()
-
-    @classmethod
-    def __instanciateBIOSClass(cls):
-        """
-
-        """
-        # Import bootimg-pcbios (class name "BootimgPcbiosPlugin")
-        modulePath = os.path.join(os.path.dirname(wic.pluginbase.__file__),
-                                  "plugins", "source",
-                                  cls.__PCBIOS_MODULE_NAME + ".py")
-        loader = SourceFileLoader(cls.__PCBIOS_MODULE_NAME, modulePath)
-        mod = types.ModuleType(loader.name)
-        loader.exec_module(mod)
-        cls.__imgBiosObj = mod.BootimgPcbiosPlugin()
-
-    @classmethod
-    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image.
-        """
-        if not cls.__imgBiosObj:
-            cls.__instanciateBIOSClass()
-
-        cls.__imgBiosObj.do_install_disk(disk, disk_name, creator, workdir,
-                                         oe_builddir, bootimg_dir, kernel_dir,
-                                         native_sysroot)
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
@@ -95,9 +54,6 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
         """
         Called before do_prepare_partition(), creates syslinux config
         """
-        if not cls.__imgBiosObj:
-            cls.__instanciateBIOSClass()
-
         bootloader = creator.ks.bootloader
 
         if not bootloader.configfile:
@@ -158,10 +114,10 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
             cfg.close()
 
         else:
-            cls.__imgBiosObj.do_configure_partition(part, source_params,
-                                                    creator, cr_workdir,
-                                                    oe_builddir, bootimg_dir,
-                                                    kernel_dir, native_sysroot)
+            super().do_configure_partition(part, source_params,
+                                           creator, cr_workdir,
+                                           oe_builddir, bootimg_dir,
+                                           kernel_dir, native_sysroot)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
@@ -171,10 +127,7 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
         """
-        if not cls.__imgBiosObj:
-            cls.__instanciateBIOSClass()
-
-        bootimg_dir = cls.__imgBiosObj._get_bootimg_dir(bootimg_dir, 'syslinux')
+        bootimg_dir = super()._get_bootimg_dir(bootimg_dir, 'syslinux')
         hdddir = "%s/hdd/boot" % cr_workdir
 
         # machine-deduction logic originally from isoimage-isohybrid.py
@@ -205,8 +158,8 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
         for install_cmd in cmds:
             exec_cmd(install_cmd)
 
-        cls.__imgBiosObj.do_prepare_partition(part, source_params,
-                                              creator, cr_workdir,
-                                              oe_builddir, bootimg_dir,
-                                              kernel_dir, rootfs_dir,
-                                              native_sysroot)
+        super().do_prepare_partition(part, source_params,
+                                     creator, cr_workdir,
+                                     oe_builddir, bootimg_dir,
+                                     kernel_dir, rootfs_dir,
+                                     native_sysroot)
-- 
2.47.2


