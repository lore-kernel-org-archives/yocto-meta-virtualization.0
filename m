Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E892DC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 12:38:47 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.10978.1738759118733529321
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 04:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWUxPdNY;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so3176077a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759118; x=1739363918; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwSJ/renSntIz1HGFi09PUzlnr3ZNNiF2umgbauiHtc=;
        b=FWUxPdNYvB/DzFY5KxKrnhL709JsZSQ637GyqfQ/Er0swiljBW2d0zHSSDt3mVETN6
         et366W5X7YUVVIj9NIcMFFlwvk9EmjGsDJL1wJLSjh/cubTQEIb9xL5OhMnC9PpQPxwK
         0lMDCO/zxUdzDIyZMgrb6A0nx40K/PhaFMJOpi0oRU7lpvg3RF7B1KD0mbvfPA5pFwkV
         o0g9d33px4SpUyy5vMc2hYm/QlmY22sNOsxfFepbdgKRUckrIgsllvI56Mml/9Wy5+L4
         ICeI+nSszeabBIhLFKu3Nk6kjxRDzffw+Ny5tOCiHRniavT638H/7tfMDR5VXPHmi8Q5
         p35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759118; x=1739363918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwSJ/renSntIz1HGFi09PUzlnr3ZNNiF2umgbauiHtc=;
        b=p2UxEDEiblz1KbiD+KhGGn7vjGnswJHvbO6S51t93DQcrVYdLjDd/lIbahHvbbCop2
         W4nMEHv6ORpZMOhqITF40XnjRZCwGFI3+h23HndrL7VN0BpudEbweMvBlj5I6ew/T1p8
         BMRykGe9o3DsJROJ5l2a6hGWd15rS06RDQeH0sznDdA1puVHVErw5+2lfSMJpXjHAjjk
         Lilqng7GgOONTCV0BLFq1SBWTUgHWrn+Bb8T2oSNKe4ZKwxL/3+GxHpkRjMow/n340SV
         Hgck06vYT2+Z+fMydDuzSNZ5AutFOVd1/acOtPqX++KrS1I6ZnQqxDv9mUk4dVaEFzq6
         Ghfg==
X-Gm-Message-State: AOJu0Yz70lsXSfHMC91HUaYJNxFCMopNAu2qlmlDcHZoFdr1ZWplPFH0
	Bm3z/tuMV5WUTM+O3lEViOL/4W30SCBc6jYEtFkddzuIYXBht8hWq9YBUWjZ3i9R1MDbiUPNB/n
	7LG38ezS1BhTHxA/ifsS7G+Qcdz8=
X-Gm-Gg: ASbGncsa5bpZe9vAHluBPwEpGmoJbSi12T7ZPUuaVfsaSJJvVd3UNZu8o0shKkthAh3
	Bdd0CSmFlL7bxwSYdaPnvQRUpd5o9CxR06VPhdXMQQNujJGUlHVcQpPf3lM5eVvZUWVX6RlBpHg
	==
X-Google-Smtp-Source: AGHT+IHVbTxCZYgdwlYF2gvSLp1bdU/k4MjDZ0MMBfiji6pYOLnx5uIcKAn4Gn6PXSrg3LALWdNUIVmc23YbQeq8PCI=
X-Received: by 2002:a17:90b:3810:b0:2ee:5691:774e with SMTP id
 98e67ed59e1d1-2f9e074fa58mr4370751a91.2.1738759116416; Wed, 05 Feb 2025
 04:38:36 -0800 (PST)
MIME-Version: 1.0
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
 <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com> <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
 <CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com>
 <181B927D4BEAD936.28939@lists.yoctoproject.org> <334a9170-082e-4d0c-8f78-6a640a2c2b2e@amd.com>
In-Reply-To: <334a9170-082e-4d0c-8f78-6a640a2c2b2e@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Feb 2025 07:38:24 -0500
X-Gm-Features: AWEUYZmJvXfFP6LTeUwaDhf_UeNip_vBD8x3hSXnRsdDU14r2PKbrPGCpK0pp1E
Message-ID: <CADkTA4MWAQ8ux9FYHkfMoRXFheyrvjNrFxVL8Uqt_4uH=L0vPQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 2/5]
 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007bef42062d6467b6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 12:38:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9122

--0000000000007bef42062d6467b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 6:33=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Hi Bruce,
>
> Any updates on my questioned. Are you ok to take this as enhancements or
> we need to get this one now.
>
> Thanks,
> Sandeep
> On 1/17/2025 12:45 PM, Sandeep Gundlupet Raju via lists.yoctoproject.org
> wrote:
>
> Hi Bruce,
>
> Sorry I apologize, I missed this email not sure how.
> On 1/17/2025 12:14 PM, Bruce Ashfield wrote:
>
> FYI: I was waiting on answers to these questions, and a possible v3 befor=
e
> merging.
>
> Bruce
>
> On Tue, Jan 7, 2025 at 10:33=E2=80=AFAM Christopher Clark <
> christopher.w.clark@gmail.com> wrote:
>
>> On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sandeep Gundlupet Raju via
>> lists.yoctoproject.org <sandeep.gundlupet-raju=3D
>> amd.com@lists.yoctoproject.org> wrote:
>>
>>> Inherit xen-launch-config bbclass to use common xen launch config
>>> variables for xen-rpi-u-boot-scr recipe.
>>>
>>
>> There is a functional change in this commit that would be appropriate to
>> mention in the commit message:
>> it introduces the use of KERNEL_IMAGETYPE to identify the dom0 linux
>> kernel file whereas it was previously assumed to be 'Image'.
>>
>> I think this is an improvement, though I'm not able to test it at the
>> moment.
>>
> [Sandeep]: Yes we can take this as enhancement.
>
>
>>
>>>
>>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>> ---
>>>  .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in        | 10 +++++-----
>>>  .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb        | 13 ++++++++-----
>>>  2 files changed, 13 insertions(+), 10 deletions(-)
>>>
>>> diff --git
>>> a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>>> boot.cmd.xen.in
>>> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>>> boot.cmd.xen.in
>>> index 98742200..b0ed0dc8 100644
>>> --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>>> boot.cmd.xen.in
>>> +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
>>> boot.cmd.xen.in
>>> @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
>>>  fdt get value bootargs /chosen bootargs
>>>
>>>  # Set module load addresses
>>> -setenv xen_loadaddr     "0x00200000"
>>> -setenv kernel_loadaddr  "0x00400000"
>>> +setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
>>> +setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
>>>
>>>  # Add some space to the fdt so we can edit it
>>>  fdt resize 0x1000
>>>  echo Add boot arguments for Xen
>>> -fdt set /chosen xen,xen-bootargs "console=3Ddtuart
>>> dtuart=3D/soc/serial@7e215040 dom0_mem=3D'@@RPI_DOM0_MEM@@'
>>> @@RPI_DEBUG_XEN_ARGS@@"
>>> +fdt set /chosen xen,xen-bootargs "console=3Ddtuart
>>> dtuart=3D@@XEN_SERIAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@
>>> @@XEN_CMDLINE_APPEND@@"
>>>
>>
>> Is there a way to ensure that if XEN_SERIAL_CONSOLES is unset that the
>> dtuart=3D argument is not passed, and likewise for DOM0_MEM and the dom0=
_mem=3D
>> argument?
>>
> [Sandeep]: May be we can implement this in two ways. Do we need this righ=
t
> away or we can take this as enhancement.
>
> 1. Set dtuart in bbclass similar to XEN_CMDLINE_APPEND
> or
> 2. We may need to use u-boot hush shell if condition method.
>
>
I'd prefer to make the above changes now, versus merging them and then
doing enhancements in the future. I'm not convinced that we'll get around
to making those updates in a timely manner .. given how long it has even
taken to get through the reviews of the series.

Bruce



>
>
>> Christopher
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9116):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9116
> Mute This Topic: https://lists.yoctoproject.org/mt/110006801/1050810
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

--0000000000007bef42062d6467b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 30, 2025 at 6:33=
=E2=80=AFPM Sandeep Gundlupet Raju via <a href=3D"http://lists.yoctoproject=
.org">lists.yoctoproject.org</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"ma=
ilto:amd.com@lists.yoctoproject.org">amd.com@lists.yoctoproject.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p>Hi Bruce,</p>
    <p>Any updates on my questioned. Are you ok to take this as
      enhancements or we need to get this one now.</p>
    <p>Thanks,<br>
      Sandeep<br>
    </p>
    <div>On 1/17/2025 12:45 PM, Sandeep
      Gundlupet Raju via <a href=3D"http://lists.yoctoproject.org" target=
=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <p>Hi Bruce,<br>
        <br>
        Sorry I apologize, I missed this email not sure how.<br>
      </p>
      <div>On 1/17/2025 12:14 PM, Bruce Ashfield
        wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div style=3D"font-size:small">FYI: I was
            waiting on answers to these questions, and a possible v3
            before merging.</div>
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">Bruce</div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 7, 2025 at
            10:33=E2=80=AFAM Christopher Clark &lt;<a href=3D"mailto:christ=
opher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a=
>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div dir=3D"ltr">On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sande=
ep
                Gundlupet Raju via <a href=3D"http://lists.yoctoproject.org=
" target=3D"_blank">lists.yoctoproject.org</a>
                &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@list=
s.yoctoproject.org" target=3D"_blank">amd.com@lists.yoctoproject.org</a>&gt=
;
                wrote:<br>
              </div>
              <div class=3D"gmail_quote">
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Inherit
                  xen-launch-config bbclass to use common xen launch
                  config<br>
                  variables for xen-rpi-u-boot-scr recipe.<br>
                </blockquote>
                <div><br>
                </div>
                <div>There is a functional change in this commit that
                  would be appropriate to mention in the commit message:</d=
iv>
                <div>it introduces the use of KERNEL_IMAGETYPE to
                  identify the dom0 linux kernel file whereas it was
                  previously assumed to be &#39;Image&#39;.</div>
                <div><br>
                </div>
                <div>I think this is an improvement, though I&#39;m not abl=
e
                  to test it at the moment.</div>
              </div>
            </div>
          </blockquote>
        </div>
      </blockquote>
      [Sandeep]: Yes we can take this as enhancement.<br>
      <blockquote type=3D"cite">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div class=3D"gmail_quote">
                <div>=C2=A0<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <br>
                  Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mail=
to:sandeep.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju=
@amd.com</a>&gt;<br>
                  ---<br>
                  =C2=A0.../xen-rpi-u-boot-scr/files/<a href=3D"http://boot=
.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>=C2=A0
                  =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
                  =C2=A0.../xen-rpi-u-boot-scr/<a href=3D"http://xen-rpi-u-=
boot-scr.bb" rel=3D"noreferrer" target=3D"_blank">xen-rpi-u-boot-scr.bb</a>=
=C2=A0
                  =C2=A0 =C2=A0 =C2=A0 | 13 ++++++++-----<br>
                  =C2=A02 files changed, 13 insertions(+), 10 deletions(-)<=
br>
                  <br>
                  diff --git
                  a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_b=
lank">boot.cmd.xen.in</a>
b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a href=
=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd.x=
en.in</a><br>
                  index 98742200..b0ed0dc8 100644<br>
                  ---
                  a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_b=
lank">boot.cmd.xen.in</a><br>
                  +++
                  b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-s=
cr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_b=
lank">boot.cmd.xen.in</a><br>
                  @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}<br>
                  =C2=A0fdt get value bootargs /chosen bootargs<br>
                  <br>
                  =C2=A0# Set module load addresses<br>
                  -setenv xen_loadaddr=C2=A0 =C2=A0 =C2=A0&quot;0x00200000&=
quot;<br>
                  -setenv kernel_loadaddr=C2=A0 &quot;0x00400000&quot;<br>
                  +setenv xen_loadaddr=C2=A0 =C2=A0 =C2=A0&quot;@@XEN_LOAD_=
ADDRESS@@&quot;<br>
                  +setenv kernel_loadaddr=C2=A0 &quot;@@KERNEL_LOAD_ADDRESS=
@@&quot;<br>
                  <br>
                  =C2=A0# Add some space to the fdt so we can edit it<br>
                  =C2=A0fdt resize 0x1000<br>
                  =C2=A0echo Add boot arguments for Xen<br>
                  -fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart
                  dtuart=3D/soc/serial@7e215040
                  dom0_mem=3D&#39;@@RPI_DOM0_MEM@@&#39; @@RPI_DEBUG_XEN_ARG=
S@@&quot;<br>
                  +fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart
                  dtuart=3D@@XEN_SERIAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@
                  @@XEN_CMDLINE_APPEND@@&quot;<br>
                </blockquote>
                <div><br>
                </div>
                <div>Is there a way to ensure that if
                  XEN_SERIAL_CONSOLES is unset that the dtuart=3D argument
                  is not passed, and likewise for DOM0_MEM and the
                  dom0_mem=3D argument?</div>
              </div>
            </div>
          </blockquote>
        </div>
      </blockquote>
      <p>[Sandeep]: May be we can implement this in two ways. Do we need
        this right away or we can take this as enhancement.<br>
      </p>
      <p>1. Set dtuart in bbclass similar to XEN_CMDLINE_APPEND<br>
        or<br>
        2. We may need to use u-boot hush shell if condition method.</p></b=
lockquote></div></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I&#39;d prefer to make the above changes now, =
versus merging them and then doing enhancements in the future. I&#39;m not =
convinced that we&#39;ll get around to making those updates in a timely man=
ner .. given how long it has even taken to get through the reviews of the s=
eries.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
<blockquote type=3D"cite"><p> <br>
      </p>
      <blockquote type=3D"cite">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div class=3D"gmail_quote">
                <div>=C2=A0</div>
                <div>Christopher</div>
              </div>
            </div>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </blockquote>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9116): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9116" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9116</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110006801/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110006801/1050810</a><br>
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

--0000000000007bef42062d6467b6--

