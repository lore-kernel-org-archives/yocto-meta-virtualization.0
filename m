Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2FBC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:28:22 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.2698.1739316500174033472
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=S5tv0kXJ;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.181, mailfrom: troth@openavr.org)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6fb0de4ecd4so13621457b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1739316499; x=1739921299; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKYyAcfS7zzqJbAZPoCbfCX9JnBTzOnUUpsuMIIghHw=;
        b=S5tv0kXJNK7hPXC3EXEtD8i9WYpK7xeSq9ATqQqUD7dtA8ir/awXl5BQ6888LhDap8
         hbVvPIoE51BpOU7RZXRxDblPoejncMC+NRKA4yVI6EsSN2KyI4gNz5eU+cQY5KlgoIBL
         nnDFa7QQRIMNRBrkO7+X3tsQ+pSa0SUNFk5Nw0i1D/KFZN1e2NYh5CJ8siHevU/gqg5y
         mE0xoXgnLpBcn5sU1C+F4P1TFG4ugnJAuV+opqH4eW45oQujYEH2z0BBs8SW+8f8r5XZ
         glWM9Cn7Hhlpm6yA0M5zard/U0G2bveh+/x4lZZwxqqooB4UVxKGPlJO9SwAia2WM08s
         IhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316499; x=1739921299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKYyAcfS7zzqJbAZPoCbfCX9JnBTzOnUUpsuMIIghHw=;
        b=tsbNqhpv11JoA0hGt/pE4eORbU7knamxZBw0XOdHF6Sz+RKXXvmA4ygwpOIkGTGUOP
         CZbwEJ6rQKgMQtgOO0a0bFUqbBf9BLNQRS4iLPeV2YYM6HwXU7MJIEcO4EnbYFERCSF5
         NJCEFiAykwkftHfFW2P2EPOB6YTn3ruct6nxspaJu93CHUbaoiJ1NrEzR3hI/OT533aD
         97FCw488L9IeHPyeyTaHuDlctyIzjPQFsxf2E0BKJd/dff/m42a7GOVgAXVvGUuyBnZy
         VXHDDreWIGIulgzc6sIfOTWmj4wiEp7LF1uHxw0NHk/ZSa/ipswzn6m+67on/4KItXab
         9oiQ==
X-Gm-Message-State: AOJu0YyWRTjojSb2vjN2MNx/QVyDdIPtiyKFuOiogRfV/DPQryWPyL7U
	veuI3/TB9i5ZBVgFa/QtBV13Y/mJ0eJh8n2Vhgzi6HjFssB63zMkq9A1AMgFq6aN9yNH6ftfBK+
	Qv5re5GVAEoPY8BcDemLx7vzujuDF2oMa8IWKSA==
X-Gm-Gg: ASbGncsMjsmKoALlhxkL5WFn4kkXEmIMuRrFzQIrw5AO9+pmXMjsylNVJLex2SlJq5b
	nxgLkacMMp+ZQBLyJFzUhpH0xEHOhIhs+918DXzrd9NseHpIUE4p5Kxj7b2M+r+Hu1o9PYnqs
X-Google-Smtp-Source: AGHT+IEmPgkzw3hU3LAND92bzaOH/1gQhlz6Y8qnTkA4K6YUQIAmLr4YEJGVIYoHY8e/HTaCTYbBx5ciymKqR5okrH0=
X-Received: by 2002:a05:690c:c8f:b0:6f9:9cd3:7f97 with SMTP id
 00721157ae682-6fb21b01ccfmr8993287b3.13.1739316499181; Tue, 11 Feb 2025
 15:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20250211210418.3463657-1-troth@openavr.org> <CADkTA4PiSSq8QeYT1asw9p_SvwQoLbzGeWNZsjtvgytvLE38YQ@mail.gmail.com>
 <CAFMvBt2_ALk=hAcsbSg3jv9PNrkzrnrcrfc+U+6PRwE5K_xRJA@mail.gmail.com> <CADkTA4OCYqzvgjKxXeXE99BC8avKxF=bNbtbYLqGZ68kAtE38w@mail.gmail.com>
In-Reply-To: <CADkTA4OCYqzvgjKxXeXE99BC8avKxF=bNbtbYLqGZ68kAtE38w@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Tue, 11 Feb 2025 16:28:07 -0700
X-Gm-Features: AWEUYZm6qiaawfLehpXxcpTVZp_SuKqWaWSUTd6quRgFA2_txzw_sRNZ3acPZk0
Message-ID: <CAFMvBt3cUDcA1Sfv8ceRBs_dm6qJnhnAmJCuuxTb4pHMk=ORYg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kernel: Remove linux-yocto_6.6 files
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: multipart/alternative; boundary="000000000000160e8d062de62ea2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9140

--000000000000160e8d062de62ea2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good.

I've just kicked a build in our CI with your changes. Will ping you if
there are still issues, but I don't expect any.

Thanks!

Ted Roth

On Tue, Feb 11, 2025 at 4:21=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Tue, Feb 11, 2025 at 5:52=E2=80=AFPM Theodore A. Roth <troth@openavr.o=
rg>
> wrote:
>
>> Thanks Bruce!
>>
>> Works for me if you commit your version. I did see that you removed the
>> 6.6 stuff from poky.
>>
>> Just thought I'd send a patch to make sure you didn't miss something in
>> meta-virt or it fell through the cracks.
>>
>>
> It is more that I was debating (with myself, I do that) if I should keep
> some parts
> of 6.6 around and only remove the bbappend. I decided today after doing
> some
> re-testing that I'd just drop it all.
>
> master should be working now.
>
> Bruce
>
>
>
>> Ted Roth
>>
>> On Tue, Feb 11, 2025 at 2:56=E2=80=AFPM Bruce Ashfield <bruce.ashfield@g=
mail.com>
>> wrote:
>>
>>> I already have this commit prepared, as I was the one that removed the
>>> 6.6 kernel :)
>>>
>>> I just didn't realize it had been merged yet.
>>>
>>> Bruce
>>>
>>> On Tue, Feb 11, 2025 at 4:04=E2=80=AFPM Theodore A. Roth via
>>> lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org> wro=
te:
>>>
>>>> Upstream poky has dropped support for v6.6 kernels which causes rpi
>>>> builds to fail:
>>>>
>>>>   ERROR: No recipes in default available for:
>>>>
>>>> meta-virtualization/dynamic-layers/raspberrypi/recipes-kernel/linux/li=
nux-yocto_6.6.bbappend
>>>>
>>>> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
>>>> Signed-off-by: Theodore A. Roth <troth@openavr.org>
>>>> ---
>>>>  ...6.6.bbappend =3D> linux-yocto_6.12.bbappend} |  2 +-
>>>>  .../linux/linux-yocto_6.6_virtualization.inc  |  4 --
>>>>  .../linux/yocto-cfg-fragments-6.6.bb          | 37 ------------------=
-
>>>>  3 files changed, 1 insertion(+), 42 deletions(-)
>>>>  rename
>>>> dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-yocto_6.6.bbapp=
end
>>>> =3D> linux-yocto_6.12.bbappend} (77%)
>>>>  delete mode 100644
>>>> recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>>>  delete mode 100644 recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>>>
>>>> diff --git
>>>> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbap=
pend
>>>> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bba=
ppend
>>>> similarity index 77%
>>>> rename from
>>>> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappe=
nd
>>>> rename to
>>>> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bbapp=
end
>>>> index 2e2f92b6..9d1d49f4 100644
>>>> ---
>>>> a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbap=
pend
>>>> +++
>>>> b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.12.bba=
ppend
>>>> @@ -1,5 +1,5 @@
>>>>  # Enable use of the linux-yocto kernel for the Raspberry Pi 4
>>>> -KBRANCH:raspberrypi4-64 ?=3D "v6.6/standard/bcm-2xxx-rpi"
>>>> +KBRANCH:raspberrypi4-64 ?=3D "v6.12/standard/bcm-2xxx-rpi"
>>>>  KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>>>>  COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>>>>
>>>> diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>>> b/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>>> deleted file mode 100644
>>>> index 59311487..00000000
>>>> --- a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>>>> +++ /dev/null
>>>> @@ -1,4 +0,0 @@
>>>> -# include the baseline meta virtualization configuration options
>>>> -# after this include, we can do version specific things
>>>> -
>>>> -include linux-yocto_virtualization.inc
>>>> diff --git a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>>> b/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>>> deleted file mode 100644
>>>> index 6bdc0d03..00000000
>>>> --- a/recipes-kernel/linux/yocto-cfg-fragments-6.6.bb
>>>> +++ /dev/null
>>>> @@ -1,37 +0,0 @@
>>>> -HOMEPAGE =3D "
>>>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/"
>>>> -SUMMARY =3D "Kernel configuration fragments"
>>>> -DESCRIPTION =3D "Typically used as part of a kernel clone, this is th=
e
>>>> standalone \
>>>> -fragment repository. Making it available to other fragment management
>>>> schemes \
>>>> -"
>>>> -SECTION =3D "devel"
>>>> -
>>>> -LICENSE =3D "MIT"
>>>> -LIC_FILES_CHKSUM =3D
>>>> "file://COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
>>>> -
>>>> -do_configure[noexec] =3D "1"
>>>> -do_compile[noexec] =3D "1"
>>>> -INHIBIT_DEFAULT_DEPS =3D "1"
>>>> -
>>>> -LINUX_VERSION ?=3D "6.6"
>>>> -PV =3D "v${LINUX_VERSION}+git${SRCREV}"
>>>> -
>>>> -SRCREV =3D "4a494b202029e94a72ebb3c3966d9f1d249900f3"
>>>> -SRC_URI =3D "\
>>>> -        git://
>>>> git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-${LINUX_VERSION=
}
>>>> <http://git.yoctoproject.org/yocto-kernel-cache;branch=3Dyocto-$%7BLIN=
UX_VERSION%7D>
>>>> \
>>>> -        "
>>>> -
>>>> -S =3D "${WORKDIR}/git"
>>>> -
>>>> -do_install() {
>>>> -    install -d ${D}${base_prefix}/kcfg
>>>> -
>>>> -    # copy the configuration fragments over to the native deploy
>>>> -    cp -r ${S}/* ${D}${base_prefix}/kcfg
>>>> -    # scripts bring in a bash dependency we don't want
>>>> -    rm -rf ${D}${base_prefix}/kcfg/scripts
>>>> -}
>>>> -
>>>> -FILES:${PN} +=3D "kcfg/"
>>>> -SYSROOT_DIRS +=3D "${base_prefix}/kcfg"
>>>> -BBCLASSEXTEND =3D "native nativesdk"
>>>> -
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#9136):
>>>> https://lists.yoctoproject.org/g/meta-virtualization/message/9136
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/111131116/1050810
>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b
>>>> [bruce.ashfield@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--000000000000160e8d062de62ea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sounds good.</div><div><br></div><div>I&#39;ve just k=
icked a build in our CI with your changes. Will ping you if there are still=
 issues, but I don&#39;t expect any.</div><div><br></div><div>Thanks!</div>=
<div><br></div><div>Ted Roth<br></div></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11,=
 2025 at 4:21=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11=
, 2025 at 5:52=E2=80=AFPM Theodore A. Roth &lt;<a href=3D"mailto:troth@open=
avr.org" target=3D"_blank">troth@openavr.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks Br=
uce!</div><div><br></div><div>Works for me if you commit your version. I di=
d see that you removed the 6.6 stuff from poky.</div><div><br></div><div>Ju=
st thought I&#39;d send a patch to make sure you didn&#39;t miss something =
in meta-virt or it fell through the cracks.</div><div><br></div></div></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">It is more that I was debating (with myself, I do that) if I should=
 keep some parts</div><div class=3D"gmail_default" style=3D"font-size:small=
">of 6.6 around and only remove the bbappend. I decided today after doing s=
ome</div><div class=3D"gmail_default" style=3D"font-size:small">re-testing =
that I&#39;d just drop it all.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">master should be working now.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>Ted Roth<br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Feb 11, 2025 at 2:56=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">I already have this c=
ommit prepared, as I was the one that removed the 6.6 kernel :)</div><div s=
tyle=3D"font-size:small"><br></div><div style=3D"font-size:small">I just di=
dn&#39;t realize it had been merged yet.</div><div style=3D"font-size:small=
"><br></div><div style=3D"font-size:small">Bruce</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2025=
 at 4:04=E2=80=AFPM Theodore A. Roth via <a href=3D"http://lists.yoctoproje=
ct.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;troth=3D<a href=3D=
"mailto:openavr.org@lists.yoctoproject.org" target=3D"_blank">openavr.org@l=
ists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Upstream poky has dropped support for v6.6 kernels whi=
ch causes rpi<br>
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
</blockquote></div>

--000000000000160e8d062de62ea2--

