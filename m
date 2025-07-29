Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455EDC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 16:23:23 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.12430.1753806200122421665
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 09:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=PRdH7f03;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.169, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71a19ea0be4so21379357b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1753806199; x=1754410999; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DwrayDnL1kjEZQpdlpRxXMcTOycfd85VzR2rD0t8xjE=;
        b=PRdH7f03yk4QlDrBg+t/ueHbbC3mqEudwRbmjdQcWmB+sUjDZJZ7vtatmM8xC7c3L8
         romyOIdExM1z1zf//IB3oOY5n4pnZx7E8zlgQxyMLm/DuQFBveB5YGfwBmO/KswphEvO
         Pg9kfuyCTSPOSfWcR/MLlB2QreMkXMSSPBoMjZ7VKbMbJejd0btLAXLPW7fpdIhPNbnG
         5u01CEv/WzCVh/Es4phvkdKz9znfX65Fmmr+GjBq8vJYvAQxR9gpbN9kcegQGooXGM2J
         vA7yv4epC6KnTEAp82Ke9CMVCXl1cIh7VviNp7tOsYT/mA/kFZxztk4YKoRnmQ8Mq2Fl
         xiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753806199; x=1754410999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwrayDnL1kjEZQpdlpRxXMcTOycfd85VzR2rD0t8xjE=;
        b=QSZ9jyCEzqNp92jbl9iRjMWdiGkp4u0BlVb65u0qHVzgrWZykdMYz8/xtTwUiLqv8z
         MIjw5/j0Md3TaMyjfgWmfiy9a+dbazfiy7bY8ZZ48y+8MroJ1AIcH/FRN0xbwVj3HVMy
         kTRWsq7IyLJyVFc2eTjgnl/xP0NlGX4NIBBtmOuvtcwipi+7/Xgxz8sW6CGymRaWRjDc
         4WbssjGjOH+ElFS7DA+2bCads6AYnWdbkV6YZnPtiB5Yob0esfg/4YGgnVlPvSqNucQS
         hrxdW3GzaBPSu71Rg6UBrImScdfTfRsbGd6FZ1F8FT66qAqKEkRWap4fKHddV9zNX1Qq
         PqZw==
X-Gm-Message-State: AOJu0YyCi5kLwgLjoYD4QRcJzFvr7MsgoUDyHvtvtSlU66wa3Q9Cz21P
	TRlO2zLgWjxmDiuAvBkyhLTXUin1BJ4YpU4KbcDNkIoVewHNQMgXPMOJ2qB2Ui+jRs+tgkCchyh
	oMbV6LUy2v+P3f1jROTogKXC7VVfuKRixy7+OXZM0cQ==
X-Gm-Gg: ASbGnctU3f6RrvHTibjZ2SF+OEIz1usgs+FcjpqKY2Ke8YFFQ0bkhHsYwy/xqlCSkIv
	E1ZXvpvVmsKxISQDE/bt3ZFLCa6LxwC1k1Ofc0uzMUGVEgJFBZsR146S9DOjepfvqp2bakMcBVe
	tir2kQW7xAFcxu6aPFXeRlRNG0TOr+q/UsQNF4vCIUyACPGhIT2NF7NGduuVjTHUjm2fsNdjxd3
	nHssSQd
X-Google-Smtp-Source: AGHT+IGDXpNHsfSAPcDpSIujPNbNI29Sxc7/BEMzm4rrfAcbRc6gtR6+9QtPvCSfH/mgjJEl+m0W0vU7i9Q7xAFCJoY=
X-Received: by 2002:a05:690c:893:b0:711:406f:7735 with SMTP id
 00721157ae682-71a46579fefmr6348307b3.13.1753806198860; Tue, 29 Jul 2025
 09:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1856C55E15D2D277.21808@lists.yoctoproject.org>
In-Reply-To: <1856C55E15D2D277.21808@lists.yoctoproject.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Tue, 29 Jul 2025 10:23:08 -0600
X-Gm-Features: Ac12FXxLYDzInMVizAO-Ey3h-EzVF6NuaWI9RaDNp4bfDoJDBRI2Jaw5rKn4IyE
Message-ID: <CAOU5ZMsS8sdnefqHmXtGNkN0CPx_HNZGp2JhR0WYiy6GvQ4LfA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCHv2] scripts: wic plugin
 bootimg-biosxen drop helper to reuse bootimg_pcbios
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, anibal@limonsoftware.com
Content-Type: multipart/alternative; boundary="0000000000007cfeea063b13d38b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jul 2025 16:23:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9331

--0000000000007cfeea063b13d38b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

After all related changes integrated into OE-Core, this patch can be landed
now.

Let me know if there is any problem, I tested using xen-image-minimal.

Regards!,
Anibal

On Tue, Jul 29, 2025 at 10:21=E2=80=AFAM Anibal Limon via lists.yoctoprojec=
t.org
<anibal=3Dlimonsoftware.com@lists.yoctoproject.org> wrote:

> - With wic plugins rename on OE-Core now can be imported.
>   See OE-Core revs,
>
>   afa1b5c9f6ed17c021e37a54d0d6abee50a60bf9
>   2de444fc3ef450f45f8f93403544e8f7461657b0
>   16c8251e5272510ad96613b8c6623550c5a72a34
>
> - Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code
>   removing all custom calls and references.
> - Finally rename bootimg-biosxen to allow be imported.
>
> Tested with xen-image-minimal and testimage.
>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  ...{bootimg-biosxen.py =3D> bootimg_biosxen.py} | 71 ++++---------------
>  1 file changed, 12 insertions(+), 59 deletions(-)
>  rename scripts/lib/wic/plugins/source/{bootimg-biosxen.py =3D>
> bootimg_biosxen.py} (69%)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-biosxen.py
> b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
> similarity index 69%
> rename from scripts/lib/wic/plugins/source/bootimg-biosxen.py
> rename to scripts/lib/wic/plugins/source/bootimg_biosxen.py
> index f3b5540c..e5f545e0 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-biosxen.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
> @@ -34,59 +34,18 @@ import os
>  import types
>
>  from wic import WicError
> -import wic.pluginbase
> -from importlib.machinery import SourceFileLoader
>  from wic.misc import (exec_cmd, get_bitbake_var)
> +from wic.plugins.source.bootimg_pcbios import BootimgPcbiosPlugin
>
>  logger =3D logging.getLogger('wic')
>
> -class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
> +class BootimgBiosXenPlugin(BootimgPcbiosPlugin):
>      """
>      Create MBR boot partition including files for Xen
>
>      """
>
>      name =3D 'bootimg_biosxen'
> -    __PCBIOS_MODULE_NAME =3D "bootimg_pcbios"
> -    __imgBiosObj =3D None
> -
> -    @classmethod
> -    def __init__(cls):
> -        """
> -        Constructor (init)
> -        """
> -        # original comment from bootimg-biosplusefi.py :
> -        # "XXX For some reasons, __init__ constructor is never called.
> -        #  Something to do with how pluginbase works?"
> -        cls.__instanciateBIOSClass()
> -
> -    @classmethod
> -    def __instanciateBIOSClass(cls):
> -        """
> -
> -        """
> -        # Import bootimg-pcbios (class name "BootimgPcbiosPlugin")
> -        modulePath =3D
> os.path.join(os.path.dirname(wic.pluginbase.__file__),
> -                                  "plugins", "source",
> -                                  cls.__PCBIOS_MODULE_NAME + ".py")
> -        loader =3D SourceFileLoader(cls.__PCBIOS_MODULE_NAME, modulePath=
)
> -        mod =3D types.ModuleType(loader.name)
> -        loader.exec_module(mod)
> -        cls.__imgBiosObj =3D mod.BootimgPcbiosPlugin()
> -
> -    @classmethod
> -    def do_install_disk(cls, disk, disk_name, creator, workdir,
> oe_builddir,
> -                        bootimg_dir, kernel_dir, native_sysroot):
> -        """
> -        Called after all partitions have been prepared and assembled int=
o
> a
> -        disk image.
> -        """
> -        if not cls.__imgBiosObj:
> -            cls.__instanciateBIOSClass()
> -
> -        cls.__imgBiosObj.do_install_disk(disk, disk_name, creator,
> workdir,
> -                                         oe_builddir, bootimg_dir,
> kernel_dir,
> -                                         native_sysroot)
>
>      @classmethod
>      def do_configure_partition(cls, part, source_params, creator,
> cr_workdir,
> @@ -95,9 +54,6 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin)=
:
>          """
>          Called before do_prepare_partition(), creates syslinux config
>          """
> -        if not cls.__imgBiosObj:
> -            cls.__instanciateBIOSClass()
> -
>          bootloader =3D creator.ks.bootloader
>
>          if not bootloader.configfile:
> @@ -158,10 +114,10 @@ class
> BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>              cfg.close()
>
>          else:
> -            cls.__imgBiosObj.do_configure_partition(part, source_params,
> -                                                    creator, cr_workdir,
> -                                                    oe_builddir,
> bootimg_dir,
> -                                                    kernel_dir,
> native_sysroot)
> +            super().do_configure_partition(part, source_params,
> +                                           creator, cr_workdir,
> +                                           oe_builddir, bootimg_dir,
> +                                           kernel_dir, native_sysroot)
>
>      @classmethod
>      def do_prepare_partition(cls, part, source_params, creator,
> cr_workdir,
> @@ -171,10 +127,7 @@ class
> BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>          Called to do the actual content population for a partition i.e. =
it
>          'prepares' the partition to be incorporated into the image.
>          """
> -        if not cls.__imgBiosObj:
> -            cls.__instanciateBIOSClass()
> -
> -        bootimg_dir =3D cls.__imgBiosObj._get_bootimg_dir(bootimg_dir,
> 'syslinux')
> +        bootimg_dir =3D super()._get_bootimg_dir(bootimg_dir, 'syslinux'=
)
>          hdddir =3D "%s/hdd/boot" % cr_workdir
>
>          # machine-deduction logic originally from isoimage-isohybrid.py
> @@ -205,8 +158,8 @@ class
> BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>          for install_cmd in cmds:
>              exec_cmd(install_cmd)
>
> -        cls.__imgBiosObj.do_prepare_partition(part, source_params,
> -                                              creator, cr_workdir,
> -                                              oe_builddir, bootimg_dir,
> -                                              kernel_dir, rootfs_dir,
> -                                              native_sysroot)
> +        super().do_prepare_partition(part, source_params,
> +                                     creator, cr_workdir,
> +                                     oe_builddir, bootimg_dir,
> +                                     kernel_dir, rootfs_dir,
> +                                     native_sysroot)
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9330):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9330
> Mute This Topic: https://lists.yoctoproject.org/mt/114433805/8181911
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> anibal@limonsoftware.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007cfeea063b13d38b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<div><br></div><div>After all related changes int=
egrated into OE-Core, this patch can be landed now.</div><div><br></div><di=
v>Let me know if there is any problem, I tested using xen-image-minimal.</d=
iv><div><br></div><div>Regards!,</div><div>Anibal</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jul 29, 2025 at 10:21=E2=80=AFAM Anibal Limon via <a href=3D"http=
://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;anibal=3D<a href=
=3D"mailto:limonsoftware.com@lists.yoctoproject.org">limonsoftware.com@list=
s.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">- With wic plugins rename on OE-Core now can be imported.=
<br>
=C2=A0 See OE-Core revs,<br>
<br>
=C2=A0 afa1b5c9f6ed17c021e37a54d0d6abee50a60bf9<br>
=C2=A0 2de444fc3ef450f45f8f93403544e8f7461657b0<br>
=C2=A0 16c8251e5272510ad96613b8c6623550c5a72a34<br>
<br>
- Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code<br=
>
=C2=A0 removing all custom calls and references.<br>
- Finally rename bootimg-biosxen to allow be imported.<br>
<br>
Tested with xen-image-minimal and testimage.<br>
<br>
Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware.com"=
 target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
---<br>
=C2=A0...{bootimg-biosxen.py =3D&gt; bootimg_biosxen.py} | 71 ++++---------=
------<br>
=C2=A01 file changed, 12 insertions(+), 59 deletions(-)<br>
=C2=A0rename scripts/lib/wic/plugins/source/{bootimg-biosxen.py =3D&gt; boo=
timg_biosxen.py} (69%)<br>
<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg-biosxen.py b/scripts/li=
b/wic/plugins/source/bootimg_biosxen.py<br>
similarity index 69%<br>
rename from scripts/lib/wic/plugins/source/bootimg-biosxen.py<br>
rename to scripts/lib/wic/plugins/source/bootimg_biosxen.py<br>
index f3b5540c..e5f545e0 100644<br>
--- a/scripts/lib/wic/plugins/source/bootimg-biosxen.py<br>
+++ b/scripts/lib/wic/plugins/source/bootimg_biosxen.py<br>
@@ -34,59 +34,18 @@ import os<br>
=C2=A0import types<br>
<br>
=C2=A0from wic import WicError<br>
-import wic.pluginbase<br>
-from importlib.machinery import SourceFileLoader<br>
=C2=A0from wic.misc import (exec_cmd, get_bitbake_var)<br>
+from wic.plugins.source.bootimg_pcbios import BootimgPcbiosPlugin<br>
<br>
=C2=A0logger =3D logging.getLogger(&#39;wic&#39;)<br>
<br>
-class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):<br>
+class BootimgBiosXenPlugin(BootimgPcbiosPlugin):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Create MBR boot partition including files for Xen<br>
<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0name =3D &#39;bootimg_biosxen&#39;<br>
-=C2=A0 =C2=A0 __PCBIOS_MODULE_NAME =3D &quot;bootimg_pcbios&quot;<br>
-=C2=A0 =C2=A0 __imgBiosObj =3D None<br>
-<br>
-=C2=A0 =C2=A0 @classmethod<br>
-=C2=A0 =C2=A0 def __init__(cls):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Constructor (init)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # original comment from bootimg-biosplusefi.py=
 :<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;XXX For some reasons, __init__ constru=
ctor is never called.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 Something to do with how pluginbase wo=
rks?&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__instanciateBIOSClass()<br>
-<br>
-=C2=A0 =C2=A0 @classmethod<br>
-=C2=A0 =C2=A0 def __instanciateBIOSClass(cls):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Import bootimg-pcbios (class name &quot;Boot=
imgPcbiosPlugin&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 modulePath =3D os.path.join(os.path.dirname(wi=
c.pluginbase.__file__),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;plugins&quot;, &quot;so=
urce&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__PCBIOS_MODULE_NAME + &q=
uot;.py&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 loader =3D SourceFileLoader(cls.__PCBIOS_MODUL=
E_NAME, modulePath)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod =3D types.ModuleType(<a href=3D"http://loa=
der.name" rel=3D"noreferrer" target=3D"_blank">loader.name</a>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 loader.exec_module(mod)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__imgBiosObj =3D mod.BootimgPcbiosPlugin()=
<br>
-<br>
-=C2=A0 =C2=A0 @classmethod<br>
-=C2=A0 =C2=A0 def do_install_disk(cls, disk, disk_name, creator, workdir, =
oe_builddir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bootimg_dir, kernel_dir, native_sysroot):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Called after all partitions have been prepared=
 and assembled into a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk image.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.__imgBiosObj:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__instanciateBIOSClass()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__imgBiosObj.do_install_disk(disk, disk_na=
me, creator, workdir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe=
_builddir, bootimg_dir, kernel_dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
tive_sysroot)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def do_configure_partition(cls, part, source_params, cr=
eator, cr_workdir,<br>
@@ -95,9 +54,6 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Called before do_prepare_partition(), cre=
ates syslinux config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.__imgBiosObj:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__instanciateBIOSClass()<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootloader =3D creator.ks.bootloader<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not bootloader.configfile:<br>
@@ -158,10 +114,10 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugi=
n):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg.close()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__imgBiosObj.do_configure_pa=
rtition(part, source_params,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 creator, cr_workdir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_builddir, bootimg_dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dir, native_sysroot)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().do_configure_partition(p=
art, source_params,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0creator, cr_workdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0oe_builddir, bootimg_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0kernel_dir, native_sysroot)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def do_prepare_partition(cls, part, source_params, crea=
tor, cr_workdir,<br>
@@ -171,10 +127,7 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin=
):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Called to do the actual content populatio=
n for a partition i.e. it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;prepares&#39; the partition to be in=
corporated into the image.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.__imgBiosObj:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__instanciateBIOSClass()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootimg_dir =3D cls.__imgBiosObj._get_bootimg_=
dir(bootimg_dir, &#39;syslinux&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootimg_dir =3D super()._get_bootimg_dir(booti=
mg_dir, &#39;syslinux&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdddir =3D &quot;%s/hdd/boot&quot; % cr_w=
orkdir<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# machine-deduction logic originally from=
 isoimage-isohybrid.py<br>
@@ -205,8 +158,8 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for install_cmd in cmds:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_cmd(install_cmd)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.__imgBiosObj.do_prepare_partition(part, so=
urce_params,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 creator, cr_workdir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 oe_builddir, bootimg_dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kernel_dir, rootfs_dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 native_sysroot)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().do_prepare_partition(part, source_para=
ms,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0creator, cr_work=
dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_builddir, boo=
timg_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir, root=
fs_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot)<=
br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9330): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9330" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9330</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114433805/818=
1911" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114433805/8181911</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:anibal@limonsoftware.c=
om" target=3D"_blank">anibal@limonsoftware.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007cfeea063b13d38b--

