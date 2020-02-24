Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17111.1582521564682273141
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fcsaNK9n;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87551E01483; Sun, 23 Feb 2020 21:19:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C057E00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:22 -0800 (PST)
Received: by mail-pg1-f196.google.com with SMTP id 7so2423780pgr.2
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zyt7dqIdPR19XXRCSyBhWKAdqd4RwN5I0CGUisWX6Vw=;
        b=fcsaNK9nSIXpEhovSc2lgirGde+jtuMJI0P1R9Hd9HrqfC/pNO+L1tKuclOuJ51AlL
         mAkPXZgUqcdGZB8OxJx4xAvFsy/sD9OBG5P4xBkk4hoAf/bYrhZq6pvgQ0YDCIzF0dpO
         pB5+3qj6V3RepRkyJjeJgVbWD8MQWLz2aYoDaqNoZULzmHL4EUakthbbDQo0Y0fBKywA
         dH8Lbjtn75UHMQaG6zlzdCUbqej1HBhjqJfzIcCDmCDYU0arjHjUVsyxWgIOQDYJ3kvB
         PysLAUDhj34ds5C4bPTgPpc1qY7urbJoNa5EW2mvPF6XGvSBbCozO9iXvCNNHWF/wytN
         O9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zyt7dqIdPR19XXRCSyBhWKAdqd4RwN5I0CGUisWX6Vw=;
        b=OpBqRKLZZKkitoXrS+zaqYyyFD2vW++JVQnzXN4QcmTPqAjr7jOniL0fRnUxLKShFR
         QNN89iXxCqEBszHgkv1FhfnvUoCH1BtdiCYXKzg9Xa6kp7mQcOpkoRfrDqQ3XjBMatGd
         Xn9OoAFl/H2Wy0V0Dr0gpej0UdZYjm4dnqkOZi3uJBQ2sfzZyiv8bBQJxspUaogdYs7c
         H9tWB+WwpG41e/gqxCKYxH5SWp7oLhF5ZDd6DWwPBLE8se2Jj5KZFer7iZfeLrAmGyhV
         VOgsc8KokiaYp2aOpuzcQwQNHCbX3uFyNT+32g+5OteUMr7GMXpciWKeTsFjyS4brL3h
         vnGw==
X-Gm-Message-State: APjAAAXvr2rZmFDI2EnZ/AaqQMD3dQpmOIElIoR0xS7p8drbW3hDlIzp
	RYaViuc3g8OzWddF/sgvigqGvdgQ
X-Google-Smtp-Source: APXvYqycuU9wIgOclRzz62xrZbxgRggB9BIYWJJrQMaK6puEyAdfDV9hgyQXBUS4HaIKhGiTC0gkKA==
X-Received: by 2002:a63:f20a:: with SMTP id v10mr50367402pgh.420.1582521561380;
        Sun, 23 Feb 2020 21:19:21 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:20 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 06/22] wic: add support for bootable pcbios partition with Xen hypervisor
Date: Sun, 23 Feb 2020 21:18:36 -0800
Message-Id: <20200224051852.21933-7-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

New bootimg-biosxen wic plugin to populate a boot partition for
launching Xen and dom0.

Includes example kickstart wks files to generate disk images to boot
into Xen from PC BIOS.

  eg: wic create directdisk-xen -e xen-image-minimal

and write the resulting image file to a disk for boot.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .gitignore                                    |   1 +
 .../lib/wic/plugins/source/bootimg-biosxen.py | 212 ++++++++++++++++++
 wic/directdisk-bootloader-xen.cfg             |  17 ++
 wic/directdisk-bootloader-xen.wks             |  12 +
 wic/directdisk-xen.wks                        |  10 +
 5 files changed, 252 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/bootimg-biosxen.py
 create mode 100644 wic/directdisk-bootloader-xen.cfg
 create mode 100644 wic/directdisk-bootloader-xen.wks
 create mode 100644 wic/directdisk-xen.wks

diff --git a/.gitignore b/.gitignore
index 45b1106..357aefe 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,3 +5,4 @@ pyshtables.py
 *.rej
 /*.patch
 *~
+scripts/lib/wic/plugins/source/__pycache__
diff --git a/scripts/lib/wic/plugins/source/bootimg-biosxen.py b/scripts/lib/wic/plugins/source/bootimg-biosxen.py
new file mode 100644
index 0000000..f00747d
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/bootimg-biosxen.py
@@ -0,0 +1,212 @@
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'bootimg-biosxen' source plugin class for 'wic'
+#
+# Bootloader arguments: Xen args are separated from Linux ones at '---':
+# eg.
+#   bootloader --append="console=com1,vga com1=115200,8n1 --- console=hvc0"
+#
+# Optional source param: initrd
+# accepts multiple ramdisk files to be supplied to multiboot.
+#  eg.
+#   part /boot --source bootimg-biosxen --sourceparams="initrd=foo.initrd;bar.initrd"
+#
+# AUTHORS
+# Christopher Clark <christopher.w.clark [at] gmail.com>
+# Elements derived from bootimg-biosplusefi.py by:
+#   William Bourque <wbourque [at] gmail.com>
+
+import logging
+import os
+import types
+
+from wic import WicError
+import wic.pluginbase
+from importlib.machinery import SourceFileLoader
+from wic.misc import (exec_cmd, get_bitbake_var)
+
+logger = logging.getLogger('wic')
+
+class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
+    """
+    Create MBR boot partition including files for Xen
+
+    """
+
+    name = 'bootimg-biosxen'
+    __PCBIOS_MODULE_NAME = "bootimg-pcbios"
+    __imgBiosObj = None
+
+    @classmethod
+    def __init__(cls):
+        """
+        Constructor (init)
+        """
+        # original comment from bootimg-biosplusefi.py :
+        # "XXX For some reasons, __init__ constructor is never called.
+        #  Something to do with how pluginbase works?"
+        cls.__instanciateBIOSClass()
+
+    @classmethod
+    def __instanciateBIOSClass(cls):
+        """
+
+        """
+        # Import bootimg-pcbios (class name "BootimgPcbiosPlugin")
+        modulePath = os.path.join(os.path.dirname(wic.pluginbase.__file__),
+                                  "plugins", "source",
+                                  cls.__PCBIOS_MODULE_NAME + ".py")
+        loader = SourceFileLoader(cls.__PCBIOS_MODULE_NAME, modulePath)
+        mod = types.ModuleType(loader.name)
+        loader.exec_module(mod)
+        cls.__imgBiosObj = mod.BootimgPcbiosPlugin()
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.
+        """
+        if not cls.__imgBiosObj:
+            cls.__instanciateBIOSClass()
+
+        cls.__imgBiosObj.do_install_disk(disk, disk_name, creator, workdir,
+                                         oe_builddir, bootimg_dir, kernel_dir,
+                                         native_sysroot)
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates syslinux config
+        """
+        if not cls.__imgBiosObj:
+            cls.__instanciateBIOSClass()
+
+        bootloader = creator.ks.bootloader
+
+        if not bootloader.configfile:
+            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
+            if os.path.exists(splash):
+                splashline = "menu background splash.jpg"
+            else:
+                splashline = ""
+
+            syslinux_conf = ""
+            syslinux_conf += "PROMPT 0\n"
+            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
+            syslinux_conf += "\n"
+            syslinux_conf += "ALLOWOPTIONS 1\n"
+            syslinux_conf += "\n"
+            if splashline:
+                syslinux_conf += "%s\n" % splashline
+
+            syslinux_conf += "DEFAULT boot\n"
+            syslinux_conf += "LABEL boot\n"
+            syslinux_conf += "  KERNEL mboot.c32\n"
+
+            # Split the bootloader args at '---' to separate the Xen args
+            # from the Linux kernel args.
+            # The Xen args here are defaults; overridden by bootloader append.
+            xen_args = "console=com1,vga com1=115200,8n1"
+            kernel_append = ""
+            if bootloader.append:
+                separator_pos = bootloader.append.find('---')
+                if separator_pos != -1:
+                    xen_args = bootloader.append[:separator_pos]
+                    kernel_append = bootloader.append[separator_pos+3:]
+                else:
+                    kernel_append = bootloader.append
+
+            kernel_args = "label=boot root=%s %s" % \
+                          (creator.rootdev, kernel_append)
+
+            syslinux_conf += "  APPEND /xen.gz %s --- /vmlinuz %s" % \
+                             (xen_args, kernel_args)
+
+            initrd = source_params.get('initrd')
+            if initrd:
+                initrds = initrd.split(';')
+                for initrd_file in initrds:
+                    syslinux_conf += " --- /%s" % os.path.basename(initrd_file)
+            syslinux_conf += "\n"
+
+            logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
+                         cr_workdir)
+
+            hdddir = "%s/hdd/boot" % cr_workdir
+            install_cmd = "install -d %s" % hdddir
+            exec_cmd(install_cmd)
+
+            cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
+            cfg.write(syslinux_conf)
+            cfg.close()
+
+        else:
+            cls.__imgBiosObj.do_configure_partition(part, source_params,
+                                                    creator, cr_workdir,
+                                                    oe_builddir, bootimg_dir,
+                                                    kernel_dir, native_sysroot)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        if not cls.__imgBiosObj:
+            cls.__instanciateBIOSClass()
+
+        bootimg_dir = cls.__imgBiosObj._get_bootimg_dir(bootimg_dir, 'syslinux')
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        # machine-deduction logic originally from isoimage-isohybrid.py
+        initrd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+        if not initrd_dir:
+            raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting.")
+        machine = os.path.basename(initrd_dir)
+
+        xen = "xen-" + machine + ".gz"
+
+        cmds = ["install -m 0644 %s/%s %s/xen.gz" %
+                (kernel_dir, xen, hdddir),
+                "install -m 0644 %s/syslinux/mboot.c32 %s/mboot.c32" %
+                (bootimg_dir, hdddir)]
+
+        initrd = source_params.get('initrd')
+
+        # Allow multiple 'initrds', as per the bootimg-efi class.
+        # This can be used to install additional binaries for multiboot.
+        # eg. TXT ACMs, XSM/Flask policy file, microcode binary
+        if initrd:
+            initrds = initrd.split(';')
+            for initrd_file in initrds:
+                cmds.append("install -m 0644 %s/%s %s/%s" %
+                            (kernel_dir, initrd_file, hdddir,
+                             os.path.basename(initrd_file)))
+
+        for install_cmd in cmds:
+            exec_cmd(install_cmd)
+
+        cls.__imgBiosObj.do_prepare_partition(part, source_params,
+                                              creator, cr_workdir,
+                                              oe_builddir, bootimg_dir,
+                                              kernel_dir, rootfs_dir,
+                                              native_sysroot)
diff --git a/wic/directdisk-bootloader-xen.cfg b/wic/directdisk-bootloader-xen.cfg
new file mode 100644
index 0000000..3ad76d6
--- /dev/null
+++ b/wic/directdisk-bootloader-xen.cfg
@@ -0,0 +1,17 @@
+ALLOWOPTIONS 1
+DEFAULT boot
+TIMEOUT 10
+PROMPT 1
+SERIAL 0 115200
+
+UI vesamenu.c32
+menu title Select boot options
+menu tabmsg Press [Tab] to edit, [Return] to select
+
+LABEL boot
+  KERNEL mboot.c32
+  APPEND /xen.gz console=com1,vga com1=115200,8n1 --- /vmlinuz quiet console=hvc0 root=LABEL=root rw rootwait panic=10
+
+LABEL verbose
+  KERNEL mboot.c32
+  APPEND /xen.gz console=com1,vga com1=115200,8n1 loglvl=all guest_loglvl=all --- /vmlinuz quiet console=hvc0 earlyprintk=xen root=LABEL=root rw rootwait panic=10
diff --git a/wic/directdisk-bootloader-xen.wks b/wic/directdisk-bootloader-xen.wks
new file mode 100644
index 0000000..c34120a
--- /dev/null
+++ b/wic/directdisk-bootloader-xen.wks
@@ -0,0 +1,12 @@
+# short-description: Create a 'pcbios' direct disk image with Xen hypervisor and bootloader config
+# long-description: Creates a partitioned legacy BIOS disk image to boot Xen
+# with a bootloader config that the user can directly dd to boot media.
+# Boot files are located on the first vfat partition.
+
+part /boot --source bootimg-biosxen --ondisk sda --label boot --active --align 1024
+
+# For the main partition, it can be useful to add additional space for VMs;
+# eg. increase partition size by appending: --size 10G
+part / --source rootfs --ondisk sda --use-uuid --fstype=ext4 --label root --align 1024
+
+bootloader --configfile="directdisk-bootloader-xen.cfg"
diff --git a/wic/directdisk-xen.wks b/wic/directdisk-xen.wks
new file mode 100644
index 0000000..d6ca46a
--- /dev/null
+++ b/wic/directdisk-xen.wks
@@ -0,0 +1,10 @@
+# short-description: Create a 'pcbios' direct disk image with Xen hypervisor
+# long-description: Creates a partitioned legacy BIOS disk image to boot Xen
+# that the user can directly dd to boot media. Boot files are located on the
+# first vfat partition.
+
+part /boot --source bootimg-biosxen --ondisk sda --label boot --active --align 1024
+
+# For the main partition, it can be useful to add additional space for VMs:
+# eg. increase partition size by appending: --size 10G
+part / --source rootfs --ondisk sda --use-uuid --fstype=ext4 --label root --align 1024
-- 
2.17.1

