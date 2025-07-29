Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3E7C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 17:43:13 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.14652.1753810993352221317
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 10:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPbh5g3O;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b391ca6146eso5198877a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jul 2025 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753810993; x=1754415793; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2eXhVDRyoA1XwZ3xou1WAP+oa4h0urAl7kp2PQU/e0M=;
        b=cPbh5g3OyqNZVAFshM2Rdc4tWvEkDcq/AtKK07TfLCqDqKAY4kDTYbEGtUFr5L6wyD
         0uqppFdLEWhAHpOxA26dqeIZqFMwRoAEls4hZyQ+ia5da4nAou0rDJOpRsR5SB+K5Vfs
         vEA/Zd0C8e2v8k/CGYQFUceVfXf2wO1orV4BeivPA1reoUVnGKQQomFXD6CgLGP70Mii
         DZDvYtulO8QeIf7BOcuBCM2KCvY4UWLZ6n8jgq+2XbGHNmicGuCrx0Yjm31K88jD5q0S
         xtXnsiPahv/ftwoVLdmaZ/IxFwPHe4zlgL60+XresfKQqCYSQy/916sn/cr6+QRmFZYV
         pb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810993; x=1754415793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eXhVDRyoA1XwZ3xou1WAP+oa4h0urAl7kp2PQU/e0M=;
        b=Rp4CZKjT6sRfaRyDUSx8HZ5zcv8egIwaCvIHrSyZp/Xc/8g6UY4sUJLv7flLmrSHej
         aO1eZsjxQuIMNe9He2CLrAyNZPWBRoCaKXy/ejsbLnevBH2JCeUSZsHDn4zCZRvn6bhY
         9BsdI1S6RiJGjdMHGLulDNMvakkUgprkpUR4ToVnk1LVK/MbXIF8gJ3U6sZw+N4N63Ov
         exVF8IiTlItKVWd3+MVqLEmcyx1MTlfWBCJMOxH0z77iFeZ59icPnYdJ0GXARrpKdaBg
         gVD1/8+ta2Il+SqTLvS6iTev39Nm2h2pu9JbzTN17cgAFzapuzlHDJ5oSzxpj2ekz4J3
         NiTg==
X-Gm-Message-State: AOJu0YxXrdxp1jEo4RBjvaKNzCwiWDXzJX6PgEmrmQz/1cpOpe15PhaH
	F3d4DRQZvI6Of6ygN2o0tKDXhMQIZg5hTAgqER53fHEhkzoUiJmtaOn3rn5jQx0OQbviG/UPRjr
	UaaPp7j9vCaLujKUJjwWPp3BmwA6k5Wk=
X-Gm-Gg: ASbGnctuObskPTeFV7u7Z0YOTr5mF36S572nFHrEuVJOsC97lT81y4SZmm6QIELntzx
	ggNj9LRjrKb24QdI++MbVPvpCWLK0pammEBCTPJ8ndv6HYiN5yDvlFkB3eZPcdX/ErcoXBlbQ7e
	bJd+kUefLKSP0eI3kKxENMZzDRN4oyP0vB1MnfWxGAOVWKYUlTZPB+rlDR/exFuR23cR5EMM67e
	/Sc5bk=
X-Google-Smtp-Source: AGHT+IHZzd1IRdus3q8AnqQpZT2ZKn82BU9/0VyTy9fee8NAib+gW3O03xkEVnWQAL4KygbvXzX57qSviXHhpFP4l6w=
X-Received: by 2002:a17:902:e890:b0:224:910:23f0 with SMTP id
 d9443c01a7336-24096b3d823mr3959015ad.49.1753810992212; Tue, 29 Jul 2025
 10:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <1856C55E15D2D277.21808@lists.yoctoproject.org> <CAOU5ZMsS8sdnefqHmXtGNkN0CPx_HNZGp2JhR0WYiy6GvQ4LfA@mail.gmail.com>
In-Reply-To: <CAOU5ZMsS8sdnefqHmXtGNkN0CPx_HNZGp2JhR0WYiy6GvQ4LfA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Jul 2025 13:43:01 -0400
X-Gm-Features: Ac12FXzxA-d2oC0yZrA92idDOCtL4LsvjjN6t-MgPTlGwrBDutHRvJ76elfyG8E
Message-ID: <CADkTA4P_tQQr6nkKF0F7k2Wz24BnV_21=vX7Kg3uA6yU+F__VA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCHv2] scripts: wic plugin
 bootimg-biosxen drop helper to reuse bootimg_pcbios
To: anibal@limonsoftware.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000031b186063b14f15b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jul 2025 17:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9332

--00000000000031b186063b14f15b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:23=E2=80=AFPM Anibal Limon via lists.yoctoprojec=
t.org
<anibal=3Dlimonsoftware.com@lists.yoctoproject.org> wrote:

> Hi Bruce,
>
> After all related changes integrated into OE-Core, this patch can be
> landed now.
>
>
Thanks for watching and sending the update!

I'll test this shortly and I don't expect any issues.

Bruce



> Let me know if there is any problem, I tested using xen-image-minimal.
>
> Regards!,
> Anibal
>
> On Tue, Jul 29, 2025 at 10:21=E2=80=AFAM Anibal Limon via lists.yoctoproj=
ect.org
> <anibal=3Dlimonsoftware.com@lists.yoctoproject.org> wrote:
>
>> - With wic plugins rename on OE-Core now can be imported.
>>   See OE-Core revs,
>>
>>   afa1b5c9f6ed17c021e37a54d0d6abee50a60bf9
>>   2de444fc3ef450f45f8f93403544e8f7461657b0
>>   16c8251e5272510ad96613b8c6623550c5a72a34
>>
>> - Drop the custom helper to find BootimgPcbiosPlugin plus adapt the code
>>   removing all custom calls and references.
>> - Finally rename bootimg-biosxen to allow be imported.
>>
>> Tested with xen-image-minimal and testimage.
>>
>> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>> ---
>>  ...{bootimg-biosxen.py =3D> bootimg_biosxen.py} | 71 ++++--------------=
-
>>  1 file changed, 12 insertions(+), 59 deletions(-)
>>  rename scripts/lib/wic/plugins/source/{bootimg-biosxen.py =3D>
>> bootimg_biosxen.py} (69%)
>>
>> diff --git a/scripts/lib/wic/plugins/source/bootimg-biosxen.py
>> b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
>> similarity index 69%
>> rename from scripts/lib/wic/plugins/source/bootimg-biosxen.py
>> rename to scripts/lib/wic/plugins/source/bootimg_biosxen.py
>> index f3b5540c..e5f545e0 100644
>> --- a/scripts/lib/wic/plugins/source/bootimg-biosxen.py
>> +++ b/scripts/lib/wic/plugins/source/bootimg_biosxen.py
>> @@ -34,59 +34,18 @@ import os
>>  import types
>>
>>  from wic import WicError
>> -import wic.pluginbase
>> -from importlib.machinery import SourceFileLoader
>>  from wic.misc import (exec_cmd, get_bitbake_var)
>> +from wic.plugins.source.bootimg_pcbios import BootimgPcbiosPlugin
>>
>>  logger =3D logging.getLogger('wic')
>>
>> -class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>> +class BootimgBiosXenPlugin(BootimgPcbiosPlugin):
>>      """
>>      Create MBR boot partition including files for Xen
>>
>>      """
>>
>>      name =3D 'bootimg_biosxen'
>> -    __PCBIOS_MODULE_NAME =3D "bootimg_pcbios"
>> -    __imgBiosObj =3D None
>> -
>> -    @classmethod
>> -    def __init__(cls):
>> -        """
>> -        Constructor (init)
>> -        """
>> -        # original comment from bootimg-biosplusefi.py :
>> -        # "XXX For some reasons, __init__ constructor is never called.
>> -        #  Something to do with how pluginbase works?"
>> -        cls.__instanciateBIOSClass()
>> -
>> -    @classmethod
>> -    def __instanciateBIOSClass(cls):
>> -        """
>> -
>> -        """
>> -        # Import bootimg-pcbios (class name "BootimgPcbiosPlugin")
>> -        modulePath =3D
>> os.path.join(os.path.dirname(wic.pluginbase.__file__),
>> -                                  "plugins", "source",
>> -                                  cls.__PCBIOS_MODULE_NAME + ".py")
>> -        loader =3D SourceFileLoader(cls.__PCBIOS_MODULE_NAME, modulePat=
h)
>> -        mod =3D types.ModuleType(loader.name)
>> -        loader.exec_module(mod)
>> -        cls.__imgBiosObj =3D mod.BootimgPcbiosPlugin()
>> -
>> -    @classmethod
>> -    def do_install_disk(cls, disk, disk_name, creator, workdir,
>> oe_builddir,
>> -                        bootimg_dir, kernel_dir, native_sysroot):
>> -        """
>> -        Called after all partitions have been prepared and assembled
>> into a
>> -        disk image.
>> -        """
>> -        if not cls.__imgBiosObj:
>> -            cls.__instanciateBIOSClass()
>> -
>> -        cls.__imgBiosObj.do_install_disk(disk, disk_name, creator,
>> workdir,
>> -                                         oe_builddir, bootimg_dir,
>> kernel_dir,
>> -                                         native_sysroot)
>>
>>      @classmethod
>>      def do_configure_partition(cls, part, source_params, creator,
>> cr_workdir,
>> @@ -95,9 +54,6 @@ class BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin=
):
>>          """
>>          Called before do_prepare_partition(), creates syslinux config
>>          """
>> -        if not cls.__imgBiosObj:
>> -            cls.__instanciateBIOSClass()
>> -
>>          bootloader =3D creator.ks.bootloader
>>
>>          if not bootloader.configfile:
>> @@ -158,10 +114,10 @@ class
>> BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>>              cfg.close()
>>
>>          else:
>> -            cls.__imgBiosObj.do_configure_partition(part, source_params=
,
>> -                                                    creator, cr_workdir=
,
>> -                                                    oe_builddir,
>> bootimg_dir,
>> -                                                    kernel_dir,
>> native_sysroot)
>> +            super().do_configure_partition(part, source_params,
>> +                                           creator, cr_workdir,
>> +                                           oe_builddir, bootimg_dir,
>> +                                           kernel_dir, native_sysroot)
>>
>>      @classmethod
>>      def do_prepare_partition(cls, part, source_params, creator,
>> cr_workdir,
>> @@ -171,10 +127,7 @@ class
>> BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>>          Called to do the actual content population for a partition i.e.
>> it
>>          'prepares' the partition to be incorporated into the image.
>>          """
>> -        if not cls.__imgBiosObj:
>> -            cls.__instanciateBIOSClass()
>> -
>> -        bootimg_dir =3D cls.__imgBiosObj._get_bootimg_dir(bootimg_dir,
>> 'syslinux')
>> +        bootimg_dir =3D super()._get_bootimg_dir(bootimg_dir, 'syslinux=
')
>>          hdddir =3D "%s/hdd/boot" % cr_workdir
>>
>>          # machine-deduction logic originally from isoimage-isohybrid.py
>> @@ -205,8 +158,8 @@ class
>> BootimgBiosXenPlugin(wic.pluginbase.SourcePlugin):
>>          for install_cmd in cmds:
>>              exec_cmd(install_cmd)
>>
>> -        cls.__imgBiosObj.do_prepare_partition(part, source_params,
>> -                                              creator, cr_workdir,
>> -                                              oe_builddir, bootimg_dir,
>> -                                              kernel_dir, rootfs_dir,
>> -                                              native_sysroot)
>> +        super().do_prepare_partition(part, source_params,
>> +                                     creator, cr_workdir,
>> +                                     oe_builddir, bootimg_dir,
>> +                                     kernel_dir, rootfs_dir,
>> +                                     native_sysroot)
>> --
>> 2.39.5
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9331):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9331
> Mute This Topic: https://lists.yoctoproject.org/mt/114433805/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000031b186063b14f15b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 29, 2025 at 12:23=
=E2=80=AFPM Anibal Limon via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;anibal=3D<a href=3D"mailto:limonsoftware.com@lis=
ts.yoctoproject.org">limonsoftware.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">Hi Bruce,<div><br></div><div>After all related changes integrated into O=
E-Core, this patch can be landed now.</div><div><br></div></div></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Thanks for watching and sending the update!</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;ll test this shortly and I don&#39;t expect any =
issues.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div></div><div>Let me know if there is any problem, I tested =
using xen-image-minimal.</div><div><br></div><div>Regards!,</div><div>Aniba=
l</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jul 29, 2025 at 10:21=E2=80=AFAM Anibal Limon via <a href=3D=
"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a=
> &lt;anibal=3D<a href=3D"mailto:limonsoftware.com@lists.yoctoproject.org" =
target=3D"_blank">limonsoftware.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">- With wic plugin=
s rename on OE-Core now can be imported.<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9331): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9331" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9331</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114433805/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114433805/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000031b186063b14f15b--

