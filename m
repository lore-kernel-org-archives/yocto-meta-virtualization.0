Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84380C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:14:32 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.3134.1737141268956544095
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 11:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gKfokKti;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso5885938a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 11:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737141268; x=1737746068; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nn4DQ3g49US562wvhh9/uRe84FYFTIU5z5nFk+27jS4=;
        b=gKfokKtihJzPhx9Vl7WoQ8qpKCSh7S4nnZ/8Fszf4Tu1Uk+PEVT0w3qjqh9yKK8oRE
         1igLZvYkK4qEx20TKzzr1VerxZvea4OhHRUGQ6/vSIW5t3bYMULmYc/G0K6A7iT7XTbY
         x3Ark8hmDP0XvRmPsrWpDz4aJA65DZPXcoVlQioJT+AL+2IFsy/XDefH6dvVrNOVAonK
         9RojiDaIrzCcFb095v/eXWGRXiwXFd7OMQr0i644xNBb0NUKGu53hwXLQXzNcjDM/xuh
         TEOEZfbc0cSpImA6n7C64CPJNAxlyXw0N2Yum5Dd4MR7lXS5B8v/yRWAOCLHBfFgokPb
         Bl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141268; x=1737746068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nn4DQ3g49US562wvhh9/uRe84FYFTIU5z5nFk+27jS4=;
        b=mDpJDTDBZvPvlY5CLosh87t0QrDIuWFkXUtVVe+epvQSp5pWIeVbynE2Wh0qLLcxi/
         qz5GEZvwgBb+0zqwfDpYhTMiyzcrnHVSIpubc70dce7WG/GeJ2XwZGCV5JEdGATksx8u
         83yfaaVddUY8TOjc4HJbToIpkf88fawOQ1NcXjdRZJd3eYVDw4xmusZt8/FanGjJ15o6
         kh0KEDB1+0D4c0ZE/X84h/lhAsX6B++dUG9t+e0HUDspk7EMbqoptv3nolha1HfM+PtA
         67d6WHvJPifSQzML0cruoYNXPMVo84lyaz7FdUUspfjdM5HqqxowgPGSzau+B2XnwDhf
         ZBhw==
X-Forwarded-Encrypted: i=1; AJvYcCW5y7BfpPr3VSHpO2mB9cS190kD+EB6V1EJsf6Btp27YCY49kPEbhaE4uCYE2ajyISE5wRcyQfj60FH427jKrDvT2jA@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyq5Sh7T1efnkwZ/G3OvK5TpRktRHJl7VbI8Lu8abDYqQ3GvrdK
	vtoleO6vgA9ft8dEGMZZVXW+NbHIJ93YckCknxL3ct6nGO+MvStALsU7P2GRs8d/GEoVXdO6Ht0
	D2utVxtW3/bwgwxKK8doRtVL0+SY=
X-Gm-Gg: ASbGnctLXYCBajvVGQVfS1gkFv9PTfpKRlWMwRc10s0OX1QOFTjtZVDZA3YtHrrpI5U
	UParI7Mrb1Vh40mowRBcgIq/ZmrLUJgMyBBX2wl8=
X-Google-Smtp-Source: AGHT+IGnFTFn2SirzwUoxTloc3bjSukjSCsXhsPdJE/oojNLhOiLO8KkXErgRz1CxrYCGkt4NYTUo6rOn7iaD93fmb0=
X-Received: by 2002:a17:90b:1e53:b0:2f5:5bc6:a78d with SMTP id
 98e67ed59e1d1-2f728da3537mr17601689a91.3.1737141268058; Fri, 17 Jan 2025
 11:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
 <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com> <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
In-Reply-To: <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Jan 2025 14:14:15 -0500
X-Gm-Features: AbW1kvZkfuzbJXJaKLqxnzPmUJawTbecF4a3AD3AqKPLAuLGmBhxzBD3CLhBE4c
Message-ID: <CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com>
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 2/5]
 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: sandeep.gundlupet-raju@amd.com, meta-virtualization@lists.yoctoproject.org, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000003519d1062bebb840"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 19:14:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9098

--0000000000003519d1062bebb840
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI: I was waiting on answers to these questions, and a possible v3 before
merging.

Bruce

On Tue, Jan 7, 2025 at 10:33=E2=80=AFAM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sandeep Gundlupet Raju via
> lists.yoctoproject.org <sandeep.gundlupet-raju=3D
> amd.com@lists.yoctoproject.org> wrote:
>
>> Inherit xen-launch-config bbclass to use common xen launch config
>> variables for xen-rpi-u-boot-scr recipe.
>>
>
> There is a functional change in this commit that would be appropriate to
> mention in the commit message:
> it introduces the use of KERNEL_IMAGETYPE to identify the dom0 linux
> kernel file whereas it was previously assumed to be 'Image'.
>
> I think this is an improvement, though I'm not able to test it at the
> moment.
>
>
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>  .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in        | 10 +++++-----
>>  .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb        | 13 ++++++++-----
>>  2 files changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git
>> a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>> boot.cmd.xen.in
>> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>> boot.cmd.xen.in
>> index 98742200..b0ed0dc8 100644
>> --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>> boot.cmd.xen.in
>> +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>> boot.cmd.xen.in
>> @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
>>  fdt get value bootargs /chosen bootargs
>>
>>  # Set module load addresses
>> -setenv xen_loadaddr     "0x00200000"
>> -setenv kernel_loadaddr  "0x00400000"
>> +setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
>> +setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
>>
>>  # Add some space to the fdt so we can edit it
>>  fdt resize 0x1000
>>  echo Add boot arguments for Xen
>> -fdt set /chosen xen,xen-bootargs "console=3Ddtuart
>> dtuart=3D/soc/serial@7e215040 dom0_mem=3D'@@RPI_DOM0_MEM@@'
>> @@RPI_DEBUG_XEN_ARGS@@"
>> +fdt set /chosen xen,xen-bootargs "console=3Ddtuart
>> dtuart=3D@@XEN_SERIAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@
>> @@XEN_CMDLINE_APPEND@@"
>>
>
> Is there a way to ensure that if XEN_SERIAL_CONSOLES is unset that the
> dtuart=3D argument is not passed, and likewise for DOM0_MEM and the dom0_=
mem=3D
> argument?
>
> Christopher
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003519d1062bebb840
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">FYI=
: I was waiting on answers to these questions, and a possible v3 before mer=
ging.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 7, 2025 at 10:33=E2=80=AFAM Christopher Clark &=
lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Dec 9, 2024 at 2:54=E2=80=
=AFPM Sandeep Gundlupet Raju via <a href=3D"http://lists.yoctoproject.org" =
target=3D"_blank">lists.yoctoproject.org</a> &lt;sandeep.gundlupet-raju=3D<=
a href=3D"mailto:amd.com@lists.yoctoproject.org" target=3D"_blank">amd.com@=
lists.yoctoproject.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Inherit xen-launch-config =
bbclass to use common xen launch config<br>
variables for xen-rpi-u-boot-scr recipe.<br></blockquote><div><br></div><di=
v>There is a functional change in this commit that would be appropriate to =
mention in the commit message:</div><div>it introduces the use of KERNEL_IM=
AGETYPE to identify the dom0 linux kernel file whereas it was previously as=
sumed to be &#39;Image&#39;.</div><div><br></div><div>I think this is an im=
provement, though I&#39;m not able to test it at the moment.</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0.../xen-rpi-u-boot-scr/files/<a href=3D"http://boot.cmd.xen.in" rel=
=3D"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 10 +++++-----<br>
=C2=A0.../xen-rpi-u-boot-scr/<a href=3D"http://xen-rpi-u-boot-scr.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-rpi-u-boot-scr.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 ++++++++-----<br>
=C2=A02 files changed, 13 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/file=
s/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">b=
oot.cmd.xen.in</a> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-=
scr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_=
blank">boot.cmd.xen.in</a><br>
index 98742200..b0ed0dc8 100644<br>
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a hr=
ef=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd=
.xen.in</a><br>
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a hr=
ef=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd=
.xen.in</a><br>
@@ -5,13 +5,13 @@ fdt addr ${fdt_addr}<br>
=C2=A0fdt get value bootargs /chosen bootargs<br>
<br>
=C2=A0# Set module load addresses<br>
-setenv xen_loadaddr=C2=A0 =C2=A0 =C2=A0&quot;0x00200000&quot;<br>
-setenv kernel_loadaddr=C2=A0 &quot;0x00400000&quot;<br>
+setenv xen_loadaddr=C2=A0 =C2=A0 =C2=A0&quot;@@XEN_LOAD_ADDRESS@@&quot;<br=
>
+setenv kernel_loadaddr=C2=A0 &quot;@@KERNEL_LOAD_ADDRESS@@&quot;<br>
<br>
=C2=A0# Add some space to the fdt so we can edit it<br>
=C2=A0fdt resize 0x1000<br>
=C2=A0echo Add boot arguments for Xen<br>
-fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D/soc/seri=
al@7e215040 dom0_mem=3D&#39;@@RPI_DOM0_MEM@@&#39; @@RPI_DEBUG_XEN_ARGS@@&qu=
ot;<br>
+fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D@@XEN_SER=
IAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@ @@XEN_CMDLINE_APPEND@@&quot;<br></bl=
ockquote><div><br></div><div>Is there a way to ensure that if XEN_SERIAL_CO=
NSOLES is unset that the dtuart=3D argument is not passed, and likewise for=
 DOM0_MEM and the dom0_mem=3D argument?</div><div>=C2=A0</div><div>Christop=
her</div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000003519d1062bebb840--

