Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4534EC83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 16:21:53 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.12250.1753806112561569590
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 09:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=jg3INi4E;
 spf=pass (domain: limonsoftware.com, ip: 209.85.160.48, mailfrom: anibal@limonsoftware.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so2545923fac.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1753806112; x=1754410912; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxgYrtYBSPg7k9IOu8xV4VKO+EVsllbDvdhTF2WL4Xk=;
        b=jg3INi4Ejiy5B+Ihv5L+I/xnS16LT3zkQGk2kolsUYJyXX/An9aXtlEh/3tmqsVGuF
         fty3b/WhYlGSOfn8uXdE35j27t1T8fVpVFN6bUqP3sYc8wrpy2UkTMHUGgVDD7uGaHkC
         CSF9HXzhi6q5Zyr8MEkJoe+MFm8cAnhe5N9TQZfbhegV1Am9daJQFC5Y6AwUu+Ii6hQJ
         fr2pGvDp8vPU+aHaCKB1g+2d60C3AVLW2uvxKHSo4Oi7Ja32vVHNbRFf3bU+kIXzEFnU
         FvQnwSfLDE9XGFizxJr11Lw+0T2GIjHwP2dWDhfxT/mnWgqQBjaaizuvvvnVDP5wTuBc
         dp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753806112; x=1754410912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxgYrtYBSPg7k9IOu8xV4VKO+EVsllbDvdhTF2WL4Xk=;
        b=NLq2qXPviID+sF0VvDQPPY5DOSmf9pq5+G6zRg5Bx3SkM7Fe63U8GeAtB4PiTnsEvp
         UA112/fmJghXBJEwhgXqN6/vMD7iLm4NlnFO78LStmuoG+aoJDEJsyzfWWWTZuYdk12C
         K1WhRWkUKO1ijdo7LdDMXKzQeZy0psDK8u2/QRgyJnY26GfokVKnDLeEDUteK+yb06lx
         MGS7/6NBJude4QI0qnic+yISf3+n0HUrgFFEoRyMyO7Sizvxaoo94KmzY1CU7OSX1DJw
         FV45pmZ1IcQ8Szz/Y1+l/xXNU9hB7ouz69iNCEUiSbGMKp+BAqm5m/FRpTp2ZahCv8OP
         r3mw==
X-Gm-Message-State: AOJu0YzKXOlkj19Pt8lI1AMIhK19loOltJdu2k1rjLCRnsACD4ZoU4WO
	ZX4pG7OKLLzLh9QyXdScxG7qcD4GOoStv5QaUrhhuzWzQm6fcxqgeE8EUgmQC1COYRHdMtXxI+B
	4U/qU2vw=
X-Gm-Gg: ASbGncveOAqCtb3KEks+7BIOmm9GiITVE7sDxOPbCclkxi12spG/vEdbxyWCI/SDN3q
	27dK/qyP94kUj8Yg8r1NCWlCerBZBE8Dwl2YI1exgbsDB4M/7NPTWfSREp0NXN0bWR+ospCJ8GO
	fTXq7rahqMGMLY8HKDjRloYR5C2eJKPzg25OW7286jRD5uWZraYooAKu45xwjIPkV5rwVRvlggl
	xiKTfTe/X5DSvFScc2XpxoNyBigqLMOh3D347MpRWdA0RDESxGFIrg0NY3i+wsDPTvWW3JZ0Cze
	K258WNjx1U1absVc8lAmMhI5cn6/aau45SxOBPs0oKw6Uu0/qxG0W9laaNLFUVLmahTDFX7+qyV
	s9cG/Juqnq8NHyPPgwCkuWMoReQ==
X-Google-Smtp-Source: AGHT+IHKd+JvIhNaP7V4wihz7dug4USR4KvHR06ScgcO0bJAUKAZwF+lUCG/cJPjS9hVbfqaZF9tuQ==
X-Received: by 2002:a05:6871:798c:b0:2d4:d07c:7cc5 with SMTP id 586e51a60fabf-307018c87c8mr9805128fac.12.1753806111527;
        Tue, 29 Jul 2025 09:21:51 -0700 (PDT)
Received: from ls.ts.net ([189.197.16.141])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307135a4325sm2372567fac.26.2025.07.29.09.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 09:21:51 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCHv2] scripts: wic plugin bootimg-biosxen drop helper to reuse bootimg_pcbios
Date: Tue, 29 Jul 2025 16:21:47 +0000
Message-Id: <20250729162147.1011966-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jul 2025 16:21:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9330

- With wic plugins rename on OE-Core now can be imported.
  See OE-Core revs,

  afa1b5c9f6ed17c021e37a54d0d6abee50a60bf9
  2de444fc3ef450f45f8f93403544e8f7461657b0
  16c8251e5272510ad96613b8c6623550c5a72a34

- Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code
  removing all custom calls and references.
- Finally rename bootimg-biosxen to allow be imported.

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
index f3b5540c..e5f545e0 100644
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
 
     name = 'bootimg_biosxen'
-    __PCBIOS_MODULE_NAME = "bootimg_pcbios"
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
2.39.5


