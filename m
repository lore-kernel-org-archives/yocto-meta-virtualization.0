Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84167C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 20:37:51 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.36397.1746391063357963648
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 May 2025 13:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=pbSCCClf;
 spf=pass (domain: limonsoftware.com, ip: 209.85.219.174, mailfrom: anibal@limonsoftware.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e6e1cd3f1c5so2957137276.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 May 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1746391062; x=1746995862; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr6ZlHsyvL+kXLZcJD06AqG6N9Oc9VXV12osZ/ymSyI=;
        b=pbSCCClfdA2Z2s0WIdlOEW4V+w5eVglAn0Ur0DbAwpOmVgTdpiqT3UaI/cgWTuAXmO
         OHpXW/Ba5wfifH3zYTcFs3wniIoYJSh1jvh1mc4frKlxF1Cif0MbQKHSaigW5DrYj+Ti
         ps641EUo7thCF86v1C770rYklL8yaoX+RUD5ABXOR9IY/fD7SBaLK60xw7z4t9CyzTr6
         7TO+Z44jRa1qDPkopDn2baB/0a7wk9SfnboWQPacXHCJ6+MoNcOO9o5G82HbGvLq/zrV
         TpaosKNQO2Gf9/TPV5wBL6fzjXE5Kbz5cMRRqTY4ul2e+vyYSAqxl5A3cEFxqArNyXSn
         200w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746391062; x=1746995862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hr6ZlHsyvL+kXLZcJD06AqG6N9Oc9VXV12osZ/ymSyI=;
        b=cmBjX9Q3DKSvODPjNN0drZaf8Ja/1DNy29uFFLtK8abMcrUlHmJ6m3ARv1GPRxrntA
         TUt+MS0CY/UcllesTrqVybhEaTu9AjAp++eF94goUrXeht9C964OA44Ei8qt4COci4uG
         gutwgOyTucgfNHUq3owbRdOZRX4h6Sp3dp7a7D62DEGq1GCQdoHZ7YBFVOJxaX7tV0rQ
         hZyJgRmqL8x8kdihjXWVYafWYzYEUWOluy3TAuwec4G/1IEB2WNeiNLKV18Kxe9o6b8t
         LXu4iu00+SFC9gG/UIiADeWXYPJCffZLLWesCUX0fu1xFR5ju8ziUhosGuuGP6mx2hSw
         Q+Sg==
X-Gm-Message-State: AOJu0YxZ6fJvWV/otFmMwSPxFggY26QCT8Ycck9B5UEcmwA/CLD0dzQa
	0/Dk4cPzY99Hqf4AA1piRKvUjt0iaGzm++BK1Yl1rKuoIp3U9x08mVz9S3kaczDppTwEe/wo9Xo
	5KhjjQm9FBFlfYsRSVg8/J08zcutOmUosx+XHRA==
X-Gm-Gg: ASbGncuREcIp8mtuHyceCJ2U2j+NlihMTwQod4HRAEqzxKwjkhyomzN04C0sVZF7wmt
	xg1WpP8o/TlFquQR7yAltxxcfBFmdMRsDgG0nyJs4n8YgRJu7P7NpR1ZYLuYsocrxMJGi2duH6W
	L3WYFVl6zwq9m9pzUxjIIDlTIubZu4NF/eBw==
X-Google-Smtp-Source: AGHT+IEKTnItfPgnrXKPadL4YzpMW5Hq+W66mrs+sVyBqTTBu1u8WyoaNsjni809aEYOWKoiKzaUyqfBxrJWcciip7U=
X-Received: by 2002:a05:6902:4913:b0:e73:e467:1ae0 with SMTP id
 3f1490d57ef6-e7571a75a87mr8906694276.20.1746391062456; Sun, 04 May 2025
 13:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <183C6D1717CD05B3.32718@lists.yoctoproject.org>
In-Reply-To: <183C6D1717CD05B3.32718@lists.yoctoproject.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Sun, 4 May 2025 14:37:31 -0600
X-Gm-Features: ATxdqUGGcuETDbpNNipNccD6_CitrsDjNGxsWc1mr74G12M1k8F71lbzNhsHwdQ
Message-ID: <CAOU5ZMtKS8c-TNGzEGhv6uNuiL4_uNpJ+OFoVfddyrto7V8EXg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] scripts: wic plugin bootimg-biosxen
 drop helper to reuse bootimg-pcbios
To: anibal@limonsoftware.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	christopher.clark6@baesystems.com
Content-Type: multipart/alternative; boundary="000000000000eac5ec0634555a2d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 May 2025 20:37:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9242

--000000000000eac5ec0634555a2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This requires a patch previously sent to OE-Core to allow import wic source
plugins.

https://lists.openembedded.org/g/openembedded-core/message/197471

Regards!,
Anibal

On Sun, May 4, 2025 at 2:32=E2=80=AFPM Anibal Limon via lists.yoctoproject.=
org
<anibal=3Dlimonsoftware.com@lists.yoctoproject.org> wrote:

> With wic plugins source rename on OE-Core now can be imported.
>
> Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code
> removing all custom calls and references.
> Finally rename bootimg-biosxen to allow be imported.
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
> index f00747db..5242ee4f 100644
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
>      name =3D 'bootimg-biosxen'
> -    __PCBIOS_MODULE_NAME =3D "bootimg-pcbios"
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
> 2.47.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9240):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9240
> Mute This Topic: https://lists.yoctoproject.org/mt/112618356/8181911
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> anibal@limonsoftware.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eac5ec0634555a2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>This requires a patch previously se=
nt to OE-Core to allow import wic source plugins.</div><div><br></div><div>=
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19747=
1">https://lists.openembedded.org/g/openembedded-core/message/197471</a></d=
iv><div><br></div><div>Regards!,</div><div>Anibal</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 4, 2025 =
at 2:32=E2=80=AFPM Anibal Limon via <a href=3D"http://lists.yoctoproject.or=
g" target=3D"_blank">lists.yoctoproject.org</a> &lt;anibal=3D<a href=3D"mai=
lto:limonsoftware.com@lists.yoctoproject.org" target=3D"_blank">limonsoftwa=
re.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">With wic plugins source rename on OE-Core now =
can be imported.<br>
<br>
Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code<br>
removing all custom calls and references.<br>
Finally rename bootimg-biosxen to allow be imported.<br>
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
index f00747db..5242ee4f 100644<br>
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
=C2=A0 =C2=A0 =C2=A0name =3D &#39;bootimg-biosxen&#39;<br>
-=C2=A0 =C2=A0 __PCBIOS_MODULE_NAME =3D &quot;bootimg-pcbios&quot;<br>
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
2.47.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9240): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9240" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9240</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112618356/818=
1911" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112618356/8181911</a><br>
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

--000000000000eac5ec0634555a2d--

