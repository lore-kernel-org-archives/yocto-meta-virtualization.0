Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244C3C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:21:22 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.2634.1739316079211331774
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gjVjMyM8;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so5037582a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739316079; x=1739920879; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PHS6k+7OOXR4ilvF278kSb7RiZc+zlI3flUCexIh2SQ=;
        b=gjVjMyM8kJj3ZcKtiOFQhpJJAlWc/FBOUaiNaAsyTOHgo0CR1VqYi9qhLajXGR3uQW
         UO/pHgI4vI2rR9HK492GuIXC9IpzUhKGbnu4KV7QK8kHmpzB6BF+DFvnlMvt0XfH19cS
         TOVBXxfbSeeujALymIzMwdeIowMlthxhe/BX0ao8TE4HspCesvJaGajxT5A9y9lZFTpM
         aRmQstD6tYFvfeE6+5KHDgfrka6jvqS2dI3uIU+tN7VcyPcVDx6HzYguK6CByHvOldce
         OURhkHsv0oc8uHX57lLkvx2jpbwkySyBDRL12OXNdZm5L2YIQbb/PicZ9zaZ4sBgJc0l
         BZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316079; x=1739920879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHS6k+7OOXR4ilvF278kSb7RiZc+zlI3flUCexIh2SQ=;
        b=ciFr3CJ4+H7qUg3pokT6wPn14WUJvudkeQ1na/dVSDDwJldMdCJbj5dQMS7LAMOTDK
         QtRSaQtblVIEapPx7FuHkNYLPVuLVk52tJ4B08MAGE7brqTP+Q83xqtXXJnLFgFhI/o1
         4V3NDVUuopp6ML044Y+vgBUJjjoMRBxRqMW6JvlK4sO5qbO4gh5EbIz3a3p8KG7ff8Ko
         ZjVEqO5Ez6OgUkPxDBuzaZqKl2+XbBgunBabqYGWdE/96oUZeNwx/iHQYxFvhcBfREXg
         vQAZCZhxS6ko4pYUD4NEVO/1HA1UdOdnQnh5O/+dhRr1Wt4eHRcypSB09mk4m09wnEcd
         btYw==
X-Gm-Message-State: AOJu0YyTLnZApmJLvX9ZJ/RTx47MZLSdcsWCRVGadBFD09LaqmIfZ1CH
	2riZJLtaDwfkvZQHq0oOra5apY9C6hFYvxPT56EDAbkq5pKkQLe9V6B7AFKOLs97QU+QoGZff5k
	+mHt21ZMt82e8DcGlfxX1U3k7mz4=
X-Gm-Gg: ASbGncsJ7z/oAnPLzhYQs7ekCg6SMQfurKMyKjJE8Ac+iAQpkDSY/kUzSmGwGNPkyeH
	j1QPb1NVdkGwg5NzydgUG5f6CWLt8I1ck2Fjy9P0iUWNlfyuS6jQ6F0f0+Zlz2uxaaVc3yiQvkA
	==
X-Google-Smtp-Source: AGHT+IEjRi9Rwhw3tStLfo0I/b8O9qOk99DXMkV5CLDkdyWLCLdSRjzHJMI42S5wMmD/zMOsXPP7gnI5OMtCLnWlMCU=
X-Received: by 2002:a17:90b:1f8e:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-2fbf5be9705mr1392887a91.13.1739316078334; Tue, 11 Feb 2025
 15:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20250211210418.3463657-1-troth@openavr.org> <CADkTA4PiSSq8QeYT1asw9p_SvwQoLbzGeWNZsjtvgytvLE38YQ@mail.gmail.com>
 <CAFMvBt2_ALk=hAcsbSg3jv9PNrkzrnrcrfc+U+6PRwE5K_xRJA@mail.gmail.com>
In-Reply-To: <CAFMvBt2_ALk=hAcsbSg3jv9PNrkzrnrcrfc+U+6PRwE5K_xRJA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Feb 2025 18:21:07 -0500
X-Gm-Features: AWEUYZkeg8WBwsrMVdCycbGPiVn4w6huFjCrQ0rNA4ES7LyATfzm5ADnhzDBoVY
Message-ID: <CADkTA4OCYqzvgjKxXeXE99BC8avKxF=bNbtbYLqGZ68kAtE38w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kernel: Remove linux-yocto_6.6 files
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: multipart/alternative; boundary="000000000000005c8c062de615a1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:21:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9139

--000000000000005c8c062de615a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 5:52=E2=80=AFPM Theodore A. Roth <troth@openavr.org=
> wrote:

> Thanks Bruce!
>
> Works for me if you commit your version. I did see that you removed the
> 6.6 stuff from poky.
>
> Just thought I'd send a patch to make sure you didn't miss something in
> meta-virt or it fell through the cracks.
>
>
It is more that I was debating (with myself, I do that) if I should keep
some parts
of 6.6 around and only remove the bbappend. I decided today after doing som=
e
re-testing that I'd just drop it all.

master should be working now.

Bruce



> Ted Roth
>
> On Tue, Feb 11, 2025 at 2:56=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com>
> wrote:
>
>> I already have this commit prepared, as I was the one that removed the
>> 6.6 kernel :)
>>
>> I just didn't realize it had been merged yet.
>>
>> Bruce
>>
>> On Tue, Feb 11, 2025 at 4:04=E2=80=AFPM Theodore A. Roth via
>> lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org> wrot=
e:
>>
>>> Upstream poky has dropped support for v6.6 kernels which causes rpi
>>> builds to fail:
>>>
>>>   ERROR: No recipes in default available for:
>>>
>>> meta-virtualization/dynamic-layers/raspberrypi/recipes-kernel/linux/lin=
ux-yocto_6.6.bbappend
>>>
>>> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
>>> Signed-off-by: Theodore A. Roth <troth@openavr.org>
>>> ---
>>>  ...6.6.bbappend =3D> linux-yocto_6.12.bbappend} |  2 +-
>>>  .../linux/linux-yocto_6.6_virtualization.inc  |  4 --
>>>  .../linux/yocto-cfg-fragments-6.6.bb          | 37 -------------------
>>>  3 files changed, 1 insertion(+), 42 deletions(-)
>>>  rename
>>> dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_6.6.bbappe=
nd
>>> =3D> linux-yocto_6.12.bbappend} (77%)
>>>  delete mode 100644
>>> recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>>  delete mode 100644 recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>>
>>> diff --git
>>> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbapp=
end
>>> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbap=
pend
>>> similarity index 77%
>>> rename from
>>> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappen=
d
>>> rename to
>>> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbappe=
nd
>>> index 2e2f92b6..9d1d49f4 100644
>>> ---
>>> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbapp=
end
>>> +++
>>> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbap=
pend
>>> @@ -1,5 +1,5 @@
>>>  # Enable use of the linux-yocto kernel for the Raspberry Pi 4
>>> -KBRANCH:raspberrypi4-64 ?=3D "v6.6/standard/bcm-2xxx-rpi"
>>> +KBRANCH:raspberrypi4-64 ?=3D "v6.12/standard/bcm-2xxx-rpi"
>>>  KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>>>  COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>>>
>>> diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>> b/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>> deleted file mode 100644
>>> index 59311487..00000000
>>> --- a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>> +++ /dev/null
>>> @@ -1,4 +0,0 @@
>>> -# include the baseline meta virtualization configuration options
>>> -# after this include, we can do version specific things
>>> -
>>> -include linux-yocto_virtualization.inc
>>> diff --git a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>> b/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>> deleted file mode 100644
>>> index 6bdc0d03..00000000
>>> --- a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>> +++ /dev/null
>>> @@ -1,37 +0,0 @@
>>> -HOMEPAGE =3D "
>>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/"
>>> -SUMMARY =3D "Kernel configuration fragments"
>>> -DESCRIPTION =3D "Typically used as part of a kernel clone, this is the
>>> standalone \
>>> -fragment repository. Making it available to other fragment management
>>> schemes \
>>> -"
>>> -SECTION =3D "devel"
>>> -
>>> -LICENSE =3D "MIT"
>>> -LIC_FILES_CHKSUM =3D
>>> "file://COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
>>> -
>>> -do_configure[noexec] =3D "1"
>>> -do_compile[noexec] =3D "1"
>>> -INHIBIT_DEFAULT_DEPS =3D "1"
>>> -
>>> -LINUX_VERSION ?=3D "6.6"
>>> -PV =3D "v${LINUX_VERSION}+git${SRCREV}"
>>> -
>>> -SRCREV =3D "4a494b202029e94a72ebb3c3966d9f1d249900f3"
>>> -SRC_URI =3D "\
>>> -        git://
>>> git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-${LINUX_VERSION}
>>> <http://git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-$%7BLINU=
X_VERSION%7D>
>>> \
>>> -        "
>>> -
>>> -S =3D "${WORKDIR}/git"
>>> -
>>> -do_install() {
>>> -    install -d ${D}${base_prefix}/kcfg
>>> -
>>> -    # copy the configuration fragments over to the native deploy
>>> -    cp -r ${S}/* ${D}${base_prefix}/kcfg
>>> -    # scripts bring in a bash dependency we don't want
>>> -    rm -rf ${D}${base_prefix}/kcfg/scripts
>>> -}
>>> -
>>> -FILES:${PN} +=3D "kcfg/"
>>> -SYSROOT_DIRS +=3D "${base_prefix}/kcfg"
>>> -BBCLASSEXTEND =3D "native nativesdk"
>>> -
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#9136):
>>> https://lists.yoctoproject.org/g/meta-virtualization/message/9136
>>> Mute This Topic: https://lists.yoctoproject.org/mt/111131116/1050810
>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
>>> [bruce.ashfield@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000005c8c062de615a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2025 at 5:52=
=E2=80=AFPM Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org">troth=
@openavr.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div>Thanks Bruce!</div><div><br></div><div>Wo=
rks for me if you commit your version. I did see that you removed the 6.6 s=
tuff from poky.</div><div><br></div><div>Just thought I&#39;d send a patch =
to make sure you didn&#39;t miss something in meta-virt or it fell through =
the cracks.</div><div><br></div></div></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">It is more that I was de=
bating (with myself, I do that) if I should keep some parts</div><div class=
=3D"gmail_default" style=3D"font-size:small">of 6.6 around and only remove =
the bbappend. I decided today after doing some</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">re-testing that I&#39;d just drop it all.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">master should be working n=
ow.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div></div><div>Ted Roth<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2025 at 2:56=E2=80=AFP=
M Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"=
_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-size:small">I already have this commit prepared, as I was the on=
e that removed the 6.6 kernel :)</div><div style=3D"font-size:small"><br></=
div><div style=3D"font-size:small">I just didn&#39;t realize it had been me=
rged yet.</div><div style=3D"font-size:small"><br></div><div style=3D"font-=
size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Feb 11, 2025 at 4:04=E2=80=AFPM Theodore A. =
Roth via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.=
yoctoproject.org</a> &lt;troth=3D<a href=3D"mailto:openavr.org@lists.yoctop=
roject.org" target=3D"_blank">openavr.org@lists.yoctoproject.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upstream po=
ky has dropped support for v6.6 kernels which causes rpi<br>
builds to fail:<br>
<br>
=C2=A0 ERROR: No recipes in default available for:<br>
=C2=A0 =C2=A0 meta-virtualization/dynamic-layers/raspberrypi/recipes-kernel=
/linux/linux-yocto_6.6.bbappend<br>
<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:theodore_roth@trimble=
.com" target=3D"_blank">theodore_roth@trimble.com</a>&gt;<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org" ta=
rget=3D"_blank">troth@openavr.org</a>&gt;<br>
---<br>
=C2=A0...6.6.bbappend =3D&gt; linux-yocto_6.12.bbappend} |=C2=A0 2 +-<br>
=C2=A0.../linux/linux-yocto_6.6_virtualization.inc=C2=A0 |=C2=A0 4 --<br>
=C2=A0.../linux/<a href=3D"http://yocto-cfg-fragments-6.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 37 -------------------<br>
=C2=A03 files changed, 1 insertion(+), 42 deletions(-)<br>
=C2=A0rename dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_6=
.6.bbappend =3D&gt; linux-yocto_6.12.bbappend} (77%)<br>
=C2=A0delete mode 100644 recipes-kernel/linux/linux-yocto_6.6_virtualizatio=
n.inc<br>
=C2=A0delete mode 100644 recipes-kernel/linux/<a href=3D"http://yocto-cfg-f=
ragments-6.6.bb" rel=3D"noreferrer" target=3D"_blank">yocto-cfg-fragments-6=
.6.bb</a><br>
<br>
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.=
6.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.=
12.bbappend<br>
similarity index 77%<br>
rename from dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6=
.bbappend<br>
rename to dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.=
bbappend<br>
index 2e2f92b6..9d1d49f4 100644<br>
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbapp=
end<br>
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbap=
pend<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Enable use of the linux-yocto kernel for the Raspberry Pi 4<br>
-KBRANCH:raspberrypi4-64 ?=3D &quot;v6.6/standard/bcm-2xxx-rpi&quot;<br>
+KBRANCH:raspberrypi4-64 ?=3D &quot;v6.12/standard/bcm-2xxx-rpi&quot;<br>
=C2=A0KMACHINE:raspberrypi4-64 ?=3D &quot;bcm-2xxx-rpi4&quot;<br>
=C2=A0COMPATIBLE_MACHINE:raspberrypi4-64 =3D &quot;(raspberrypi4-64)&quot;<=
br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc b/reci=
pes-kernel/linux/linux-yocto_6.6_virtualization.inc<br>
deleted file mode 100644<br>
index 59311487..00000000<br>
--- a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc<br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-# include the baseline meta virtualization configuration options<br>
-# after this include, we can do version specific things<br>
-<br>
-include linux-yocto_virtualization.inc<br>
diff --git a/recipes-kernel/linux/<a href=3D"http://yocto-cfg-fragments-6.6=
.bb" rel=3D"noreferrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a> b/=
recipes-kernel/linux/<a href=3D"http://yocto-cfg-fragments-6.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a><br>
deleted file mode 100644<br>
index 6bdc0d03..00000000<br>
--- a/recipes-kernel/linux/<a href=3D"http://yocto-cfg-fragments-6.6.bb" re=
l=3D"noreferrer" target=3D"_blank">yocto-cfg-fragments-6.6.bb</a><br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-HOMEPAGE =3D &quot;<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/y=
octo-kernel-cache/" rel=3D"noreferrer" target=3D"_blank">https://git.yoctop=
roject.org/cgit/cgit.cgi/yocto-kernel-cache/</a>&quot;<br>
-SUMMARY =3D &quot;Kernel configuration fragments&quot;<br>
-DESCRIPTION =3D &quot;Typically used as part of a kernel clone, this is th=
e standalone \<br>
-fragment repository. Making it available to other fragment management sche=
mes \<br>
-&quot;<br>
-SECTION =3D &quot;devel&quot;<br>
-<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING.MIT;md5=3D3da9cfbcb788c80a038436=
1b4de20420&quot;<br>
-<br>
-do_configure[noexec] =3D &quot;1&quot;<br>
-do_compile[noexec] =3D &quot;1&quot;<br>
-INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
-<br>
-LINUX_VERSION ?=3D &quot;6.6&quot;<br>
-PV =3D &quot;v${LINUX_VERSION}+git${SRCREV}&quot;<br>
-<br>
-SRCREV =3D &quot;4a494b202029e94a72ebb3c3966d9f1d249900f3&quot;<br>
-SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yoctoproject.org/y=
octo-kernel-cache;branch=3Dyocto-$%7BLINUX_VERSION%7D" rel=3D"noreferrer" t=
arget=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-${L=
INUX_VERSION}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 install -d ${D}${base_prefix}/kcfg<br>
-<br>
-=C2=A0 =C2=A0 # copy the configuration fragments over to the native deploy=
<br>
-=C2=A0 =C2=A0 cp -r ${S}/* ${D}${base_prefix}/kcfg<br>
-=C2=A0 =C2=A0 # scripts bring in a bash dependency we don&#39;t want<br>
-=C2=A0 =C2=A0 rm -rf ${D}${base_prefix}/kcfg/scripts<br>
-}<br>
-<br>
-FILES:${PN} +=3D &quot;kcfg/&quot;<br>
-SYSROOT_DIRS +=3D &quot;${base_prefix}/kcfg&quot;<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9136): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9136" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9136</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111131116/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111131116/1050810</a><br>
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
</blockquote></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000005c8c062de615a1--

