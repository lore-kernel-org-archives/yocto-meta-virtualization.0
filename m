Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B643CC2D0CD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 02:52:28 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.12126.1747709540772702929
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 May 2025 19:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cbm9Cf76;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c54f67db99so658146585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 May 2025 19:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747709540; x=1748314340; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7QrjVSMMSjXGN3GJWJy06QXxqzrefgmBeCXtPiJUM8=;
        b=Cbm9Cf768aZsx4FN8zZr82cVyI0jlZVFQsVnFjQq643vTApM6UVmTvH1zr0Hp7BdDg
         Ussx1tPV3rHnUwmfXoMevhWLQkHNMtXEjUn/TexM+kE+evBSa6WwBkh6L5MOQdW74OGs
         NVNmlFCGPe1n4SvxCjevPDBg7d9d5UelxDUyxJIPUm1RhaP28MDo5gXW6n4TJqZJS4O6
         idv64u5ORDyntWHJn/BUORBKQ1kRU31ou5zcpkijnzriu5YosMnV/ARX5VAyv3/5HSrR
         ef3BCikSlSaFOUv2e15mBFAkmkYxygMsoEjpf/EJ9XYT3oJNTrPIeACYg2ns6UzN5pRG
         5xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747709540; x=1748314340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7QrjVSMMSjXGN3GJWJy06QXxqzrefgmBeCXtPiJUM8=;
        b=V4wt6aJZOf/gfe0I1LcTczdR39Tn+KroiPTIKia5UUrz7N3YGF/kAXXhyjbCs+kY+G
         +0PJlXNj5e4hFgKXzJdPLKw+AVsWTpDyjJrhfO9xh45z/RjfeDDHonWHqoegoeA5DO07
         u4SvlXLl7OG+Ac5Erpr48Cfzz+7mt1xvy6KVWh1opkGQaYNLQpiHoyF0uSnd/a1fDkZJ
         kRZJSc6yRp2khTqhzF8xilGTH3ICx2ZTcBTuf5+U5Bdxau52tnSj+z6cvTLZ99SoESM5
         VFVVV3jFnsct2YIduvr9C2Ivr96aFup8s7a5WhSXyzUTfp+p0AYyJt2mwfP+lSbvs8ih
         yV4g==
X-Gm-Message-State: AOJu0Yy37DVhfRLbA3zcMnA0E1Ir5bfsivZRJioqoNAqrYc46gNkvvET
	+HEM/tq3BiIUiSEA+SWlJ37LxNzrvWptab2Thc4uQFAiIF+ZZ3Wdg+eX
X-Gm-Gg: ASbGncu4/asqBklUHtZh3aYRsQwWzl2FENaLBdUPIfJuiA75zFPptujUhW70dhUN2Wu
	uyLvrzsPRzY6qZQe9t8EX4Q8PCDhWzQLNMxj31J5uwDFxy/BuNJlzeOM52c5AKoT2PIyjCT+O6j
	CaNd/5bQIupcu1vNVw+ePNG+W2/THAo5g09LuaBM9+MuxZ15dFNeF5cl2PXsNCfbnq/lddgDUaE
	dLJU/oA7s8acgQQhPzqGEv6xh2vGCFbG5ZnH1l+17vxMQFEByZ0dQRkixSK5HTO1Nj2EUDg9YAv
	ld92dy9tgI2+UTQ95qU/+g5+NWx3vY4nSAtJvLlrQfo1lHwZAUQRqedv1dvZK6FAUIajgUnStvE
	pRODJOj1tRhqZRKG46ioOWQolg7Oeuw==
X-Google-Smtp-Source: AGHT+IFQSS88nzkyJlsrg8I6JE54qjvWb1hQIVPA3Ka7Q3dxcHghljVmUZb10x+1bcp6yJEvP3WmGw==
X-Received: by 2002:a05:620a:2806:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7cd46b6c97bmr1891017485a.23.1747709539647;
        Mon, 19 May 2025 19:52:19 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467eedd7sm670265885a.56.2025.05.19.19.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:52:19 -0700 (PDT)
Date: Mon, 19 May 2025 22:52:17 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anibal Limon <anibal@limonsoftware.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.clark6@baesystems.com
Subject: Re: [meta-virtualization] [PATCH] scripts: wic plugin
 bootimg-biosxen drop helper to reuse bootimg-pcbios
Message-ID: <aCvuYQ0rRfo7Y4kp@gmail.com>
References: <183C6D1717CD05B3.32718@lists.yoctoproject.org>
 <CAOU5ZMtKS8c-TNGzEGhv6uNuiL4_uNpJ+OFoVfddyrto7V8EXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOU5ZMtKS8c-TNGzEGhv6uNuiL4_uNpJ+OFoVfddyrto7V8EXg@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 May 2025 02:52:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9252

In message: Re: [meta-virtualization] [PATCH] scripts: wic plugin bootimg-biosxen drop helper to reuse bootimg-pcbios
on 04/05/2025 Anibal Limon wrote:

> Hi,
> 
> This requires a patch previously sent to OE-Core to allow import wic source
> plugins.
> 
> https://lists.openembedded.org/g/openembedded-core/message/197471

It isn't efficient for me to keep checking if this has merged to
oe-core.

Please follow up to your patch once it does merge, and I'll get this
pulled in.

Bruce

> 
> Regards!,
> Anibal
> 
> On Sun, May 4, 2025 at 2:32 PM Anibal Limon via lists.yoctoproject.org <anibal=
> limonsoftware.com@lists.yoctoproject.org> wrote:
> 
>     With wic plugins source rename on OE-Core now can be imported.
> 
>     Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code
>     removing all custom calls and references.
>     Finally rename bootimg-biosxen to allow be imported.
> 
>     Tested with xen-image-minimal and testimage.
> 
>     Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>     ---
>      ...{bootimg-biosxen.py => bootimg_biosxen.py} | 71 ++++---------------
>      1 file changed, 12 insertions(+), 59 deletions(-)
>      rename scripts/lib/wic/plugins/source/{bootimg-biosxen.py =>
>     bootimg_biosxen.py} (69%)
> 
>     diff --git a/scripts/lib/wic/plugins/source/bootimg-biosxen.py b/scripts/
>     lib/wic/plugins/source/bootimg_biosxen.py
>     similarity index 69%
>     rename from scripts/lib/wic/plugins/source/bootimg-biosxen.py
>     rename to scripts/lib/wic/plugins/source/bootimg_biosxen.py
>     index f00747db..5242ee4f 100644
>     --- a/scripts/lib/wic/plugins/source/bootimg-biosxen.py
>     +++ b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
>     @@ -34,59 +34,18 @@ import os
>      import types
> 
>      from wic import WicError
>     -import wic.pluginbase
>     -from importlib.machinery import SourceFileLoader
>      from wic.misc import (exec_cmd, get_bitbake_var)
>     +from wic.plugins.source.bootimg_pcbios import BootimgPcbiosPlugin
> 
>      logger = logging.getLogger('wic')
> 
>     -class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>     +class BootimgBiosXenPlugin(BootimgPcbiosPlugin):
>          """
>          Create MBR boot partition including files for Xen
> 
>          """
> 
>          name = 'bootimg-biosxen'
>     -    __PCBIOS_MODULE_NAME = "bootimg-pcbios"
>     -    __imgBiosObj = None
>     -
>     -    @classmethod
>     -    def __init__(cls):
>     -        """
>     -        Constructor (init)
>     -        """
>     -        # original comment from bootimg-biosplusefi.py :
>     -        # "XXX For some reasons, __init__ constructor is never called.
>     -        #  Something to do with how pluginbase works?"
>     -        cls.__instanciateBIOSClass()
>     -
>     -    @classmethod
>     -    def __instanciateBIOSClass(cls):
>     -        """
>     -
>     -        """
>     -        # Import bootimg-pcbios (class name "BootimgPcbiosPlugin")
>     -        modulePath = os.path.join(os.path.dirname
>     (wic.pluginbase.__file__),
>     -                                  "plugins", "source",
>     -                                  cls.__PCBIOS_MODULE_NAME + ".py")
>     -        loader = SourceFileLoader(cls.__PCBIOS_MODULE_NAME, modulePath)
>     -        mod = types.ModuleType(loader.name)
>     -        loader.exec_module(mod)
>     -        cls.__imgBiosObj = mod.BootimgPcbiosPlugin()
>     -
>     -    @classmethod
>     -    def do_install_disk(cls, disk, disk_name, creator, workdir,
>     oe_builddir,
>     -                        bootimg_dir, kernel_dir, native_sysroot):
>     -        """
>     -        Called after all partitions have been prepared and assembled into
>     a
>     -        disk image.
>     -        """
>     -        if not cls.__imgBiosObj:
>     -            cls.__instanciateBIOSClass()
>     -
>     -        cls.__imgBiosObj.do_install_disk(disk, disk_name, creator,
>     workdir,
>     -                                         oe_builddir, bootimg_dir,
>     kernel_dir,
>     -                                         native_sysroot)
> 
>          @classmethod
>          def do_configure_partition(cls, part, source_params, creator,
>     cr_workdir,
>     @@ -95,9 +54,6 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>              """
>              Called before do_prepare_partition(), creates syslinux config
>              """
>     -        if not cls.__imgBiosObj:
>     -            cls.__instanciateBIOSClass()
>     -
>              bootloader = creator.ks.bootloader
> 
>              if not bootloader.configfile:
>     @@ -158,10 +114,10 @@ class BootimgBiosXenPlugin
>     (wic.pluginbase.SourcePlugin):
>                  cfg.close()
> 
>              else:
>     -            cls.__imgBiosObj.do_configure_partition(part, source_params,
>     -                                                    creator, cr_workdir,
>     -                                                    oe_builddir,
>     bootimg_dir,
>     -                                                    kernel_dir,
>     native_sysroot)
>     +            super().do_configure_partition(part, source_params,
>     +                                           creator, cr_workdir,
>     +                                           oe_builddir, bootimg_dir,
>     +                                           kernel_dir, native_sysroot)
> 
>          @classmethod
>          def do_prepare_partition(cls, part, source_params, creator,
>     cr_workdir,
>     @@ -171,10 +127,7 @@ class BootimgBiosXenPlugin
>     (wic.pluginbase.SourcePlugin):
>              Called to do the actual content population for a partition i.e. it
>              'prepares' the partition to be incorporated into the image.
>              """
>     -        if not cls.__imgBiosObj:
>     -            cls.__instanciateBIOSClass()
>     -
>     -        bootimg_dir = cls.__imgBiosObj._get_bootimg_dir(bootimg_dir,
>     'syslinux')
>     +        bootimg_dir = super()._get_bootimg_dir(bootimg_dir, 'syslinux')
>              hdddir = "%s/hdd/boot" % cr_workdir
> 
>              # machine-deduction logic originally from isoimage-isohybrid.py
>     @@ -205,8 +158,8 @@ class BootimgBiosXenPlugin
>     (wic.pluginbase.SourcePlugin):
>              for install_cmd in cmds:
>                  exec_cmd(install_cmd)
> 
>     -        cls.__imgBiosObj.do_prepare_partition(part, source_params,
>     -                                              creator, cr_workdir,
>     -                                              oe_builddir, bootimg_dir,
>     -                                              kernel_dir, rootfs_dir,
>     -                                              native_sysroot)
>     +        super().do_prepare_partition(part, source_params,
>     +                                     creator, cr_workdir,
>     +                                     oe_builddir, bootimg_dir,
>     +                                     kernel_dir, rootfs_dir,
>     +                                     native_sysroot)
>     --
>     2.47.2
> 
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9240): https://lists.yoctoproject.org/g/
>     meta-virtualization/message/9240
>     Mute This Topic: https://lists.yoctoproject.org/mt/112618356/8181911
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
>     anibal@limonsoftware.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

