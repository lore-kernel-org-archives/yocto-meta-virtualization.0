Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8E0EE57CF
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 06:24:53 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.33587.1694154289490006718
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 23:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CtCIczR1;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-500d13a8fafso2868941e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Sep 2023 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694154287; x=1694759087; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ3NreKkil2cpMCNX0ojJtJa0gQTEoj92DM1foNzTak=;
        b=CtCIczR1J0BY48SuUyth3M2SYoDtyVnZzEOEv0psveK6EV4VyJ4vUa4CE74FX8iSf9
         jeD+utOk9dHZerYE2vU861d8ASDz/XHiMsoa7Gkg6e6CxzenHzLgdx1k60S/tvsi6Yu8
         islf8LQlY+K08adHOYhAPvEmXU6a42zVxFQMLAu01bFWLuOgaXcVz/DqAWHjJCjvgumu
         +qNcw5L3DXhe4djhYHRT7q87qZaW4Cc47+XZqvqHWYN7/R0nMc1vllyet69WTRydUXlp
         0CbZ36FC2s9lLAPMx6VUeDEANs5yY4Ap/SgYerQlLfOE3j9hA4nBLNq2nirE+Jgkx7oP
         CM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694154287; x=1694759087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQ3NreKkil2cpMCNX0ojJtJa0gQTEoj92DM1foNzTak=;
        b=wlgZI6KWIDkCnTiJgr3XqHxBYKTAX+Qvv2RqCKbAM87wW2hWzsVeUg0RHydiSbJN7G
         5YO+XGksUNgJ7CtG9Y56Cf8xNX1hssLt5CqZKTI0OktOXOSRWAyWQKOE/skfy+LcApXY
         ryW23Uy28bHvG6qve47Senib9yD3tER+DdBzVM0aSGJ9nsBx5cHr9vP7d/KRG5/c5Zu6
         4eJAdgFAf2eL35blZKW7ayN42fJXkn1d8Ipo03pnidjeJ/yRBOMHV0ki5mqUTqmPRFlv
         ouvJJTxyzakszDV9qATMzzIUO4SNbsZW1TuAW+IjN+1kElzFgk8Z/zeiJSCfIe8NPw/V
         iYHA==
X-Gm-Message-State: AOJu0YxnpT/yaX0OXxpzTuD0m7dm6TiJ5MLoRt0npdaIKP4dw/+iFKYI
	CDV+ZMxNOzQhUDlIVQWwghp1CgYQ8zV703DLfnY=
X-Google-Smtp-Source: AGHT+IEW0xa6zrgsQ6gAuDhHAM9Sh3iQynPOtEY4VeqkIP3OUgiUyHKNs57HgQaZgpD2EqUfWQi0gLAt+cEnhbWj3ek=
X-Received: by 2002:a05:6512:108d:b0:500:b2be:61e1 with SMTP id
 j13-20020a056512108d00b00500b2be61e1mr1420152lfg.58.1694154286746; Thu, 07
 Sep 2023 23:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
 <20230825181811.3306054-2-sandeep.gundlupet-raju@amd.com> <ZOtOQIeCfldaixvL@gmail.com>
 <3248da58-3271-37fe-c60f-ad9217d9ae5f@amd.com>
In-Reply-To: <3248da58-3271-37fe-c60f-ad9217d9ae5f@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 7 Sep 2023 23:24:34 -0700
Message-ID: <CACMJ4Gacui8QuGFsVBK1N0-pSqoema55e3chhQ5u1fkhb_KAvQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add xen
 variable as addendum
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="00000000000074d0ee0604d308be"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 06:24:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8287

--00000000000074d0ee0604d308be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 2:31=E2=80=AFPM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

> Hi Bruce,
>
> Sorry I totally missed replying to this email.
>
> On 8/27/2023 7:23 AM, Bruce Ashfield wrote:
> > In message: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add
> xen variable as addendum
> > on 25/08/2023 Sandeep Gundlupet Raju wrote:
> >
> >> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> >> ---
> >>   .../xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc       | 12 ++++++++++=
++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >> index b2b76120..6d113c9a 100644
> >> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >> @@ -36,3 +36,15 @@ XEN_CMDLINE_APPEND ?=3D ""
> >>   # Specify the max number of vcpus for dom0
> >>   # Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
> >>   DOM0_MAX_VCPUS ?=3D "1"
> >> +
> >> +# Add xen variables as addendum.
> >> +# Variable SCRIPT_SED_ADDENDUM id defined in meta-xilinx and set to
> null by
> >> +# default and enable only for xen builds.
> > s/id/is/
> >
> > This really entangles the meta-virt dynamic layer with the xilinx
> > layers. You need to have an understanding of one, to really understand
> > the other.
> [Sandeep]: I understand the problem is there is no standard way of doing
> this.
> > If we are setting or appending to a variable, it really should be
> > defined in meta-virtualization.
> >
> > Is there a way to move the functions that are using this variable
> > into the main Xen meta-virt recipes, in such a way that this is
> > a generic way to customize the boot ?
>
> [Sandeep]: We can move the xen specific variables(such as DOM0_MEM,
> XEN_CMDLINE_APPEND, DOM0_MAX_VCPUS etc...) to main xen meta-virt
> inclusion files. Then using SCRIPT_SED_ADDEDUM approach in dynamic layer
> we can append to existing soc vendor boot script recipe do_compile task
> or a separate xen boot script recipe similar to RPI. I will prepare a
> RFC patch and send it for review.
>
> I'm open if you have any better idea or way of handling this.
>

Hi all, sorry for my slow response on this thread. I am interested in
seeing if we can better incorporate board support for Xen into the main
recipes and u-boot configuration, and wondering if it could be beneficial
to see if we could have a single u-boot script for Xen to go
into meta-virtualization/recipes-bsp/u-boot.

As a starting point, it could be built from combining the two scripts are
currently in meta-virt's dynamic layers:
  dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
  dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
boot.cmd.xen.in
with refactoring to preserve the existing behaviour for each board.

Both those files are already parameter driven -- ie. they do variable
substitution on the input template to generate the deployed final script.
If we do this, it should be a reasonable starting point for booting Xen on
other Arm boards just by configuring variables in the BSP layer and we
might be able to simplify meta-virtualization's dynamic layers a bit.

Before getting to that though, one thing that wasn't clear to me is why the
Xilinx dynamic layer Xen u-boot script is currently packaged via a
bbappend, rather than a standalone recipe bb, as the raspberry pi one is.
If you change to follow that raspberry pi example then you can switch your
boot-Xen-or-not behaviour by setting the
PREFERRED_PROVIDER_u-boot-default-script variable (to use either your
meta-xilinx non-Xen u-boot script recipe, or your meta-virtualization
Xen-enabled one) and avoid the need for the second patch that adds the new
control variable in this series. Could that be a viable approach?

Christopher




>
> We can also explore on image builder tool
> https://gitlab.com/ViryaOS/imagebuilder/-/tree/master, We can create a
> imagebuilder.bbclass and user can input the cfg and generate the right
> u-boot scripts. It's VERY unclear to me that this is useful for anyone?
> we need to better understand this component, how it's configured and
> it's general purpose usage.
>
> > Bruce
> >
> >> +SCRIPT_SED_ADDENDUM +=3D "-e 's/@@XEN_IMAGE_NAME@@/${XEN_IMAGE_NAME}/=
' \
> >> +        -e 's/@@XEN_OFFSET@@/${XEN_OFFSET}/' \
> >> +        -e 's/@@XEN_LOAD_ADDRESS@@/${XEN_LOAD_ADDRESS}/' \
> >> +        -e 's/@@DOM0_MEM@@/${DOM0_MEM}/' \
> >> +        -e 's/@@DOM0_MAX_VCPUS@@/${DOM0_MAX_VCPUS}/' \
> >> +        -e 's:@@XEN_SERIAL_CONSOLES@@:${XEN_SERIAL_CONSOLES}:' \
> >> +        -e 's:@@XEN_CMDLINE_APPEND@@:${XEN_CMDLINE_APPEND}:' \
> >> +"
> >> \ No newline at end of file
> >> --
> >> 2.34.1
> >>
>

--00000000000074d0ee0604d308be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 6, 2023 at 2:31=E2=80=AFP=
M Gundlupet Raju, Sandeep &lt;<a href=3D"mailto:sandeep.gundlupet-raju@amd.=
com">sandeep.gundlupet-raju@amd.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Bruce,<br>
<br>
Sorry I totally missed replying to this email.<br>
<br>
On 8/27/2023 7:23 AM, Bruce Ashfield wrote:<br>
&gt; In message: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add=
 xen variable as addendum<br>
&gt; on 25/08/2023 Sandeep Gundlupet Raju wrote:<br>
&gt;<br>
&gt;&gt; Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandee=
p.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com<=
/a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd=
.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
&gt;&gt; index b2b76120..6d113c9a 100644<br>
&gt;&gt; --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br=
>
&gt;&gt; +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br=
>
&gt;&gt; @@ -36,3 +36,15 @@ XEN_CMDLINE_APPEND ?=3D &quot;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0# Specify the max number of vcpus for dom0<br>
&gt;&gt;=C2=A0 =C2=A0# Example usage: DOM0_MAX_VCPUS =3D &quot;2&quot; or D=
OM0_MAX_VCPUS =3D &quot;2-4&quot;<br>
&gt;&gt;=C2=A0 =C2=A0DOM0_MAX_VCPUS ?=3D &quot;1&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# Add xen variables as addendum.<br>
&gt;&gt; +# Variable SCRIPT_SED_ADDENDUM id defined in meta-xilinx and set =
to null by<br>
&gt;&gt; +# default and enable only for xen builds.<br>
&gt; s/id/is/<br>
&gt;<br>
&gt; This really entangles the meta-virt dynamic layer with the xilinx<br>
&gt; layers. You need to have an understanding of one, to really understand=
<br>
&gt; the other.<br>
[Sandeep]: I understand the problem is there is no standard way of doing <b=
r>
this.<br>
&gt; If we are setting or appending to a variable, it really should be<br>
&gt; defined in meta-virtualization.<br>
&gt;<br>
&gt; Is there a way to move the functions that are using this variable<br>
&gt; into the main Xen meta-virt recipes, in such a way that this is<br>
&gt; a generic way to customize the boot ?<br>
<br>
[Sandeep]: We can move the xen specific variables(such as DOM0_MEM, <br>
XEN_CMDLINE_APPEND, DOM0_MAX_VCPUS etc...) to main xen meta-virt <br>
inclusion files. Then using SCRIPT_SED_ADDEDUM approach in dynamic layer <b=
r>
we can append to existing soc vendor boot script recipe do_compile task <br=
>
or a separate xen boot script recipe similar to RPI. I will prepare a <br>
RFC patch and send it for review.<br>
<br>
I&#39;m open if you have any better idea or way of handling this.<br></bloc=
kquote><div><br></div><div>Hi all, sorry for my slow response on this threa=
d. I am interested in seeing if we can better incorporate board support for=
 Xen into the main recipes and u-boot configuration, and wondering if it co=
uld be beneficial to see if we could have a single u-boot script for Xen to=
 go into=C2=A0meta-virtualization/recipes-bsp/u-boot.</div><div><br></div><=
div>As a starting point, it could be built from combining the two scripts a=
re currently in meta-virt&#39;s dynamic layers:</div><div>=C2=A0 dynamic-la=
yers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen<br></div><div>=
=C2=A0 dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a h=
ref=3D"http://boot.cmd.xen.in">boot.cmd.xen.in</a><br></div><div>with refac=
toring to preserve the existing behaviour for each board.</div><div><br></d=
iv><div>Both those files are already parameter driven -- ie. they do variab=
le substitution on the input template to generate the deployed final script=
.</div><div>If we do this, it should be a reasonable starting point for boo=
ting Xen on other Arm boards just by configuring variables in the BSP layer=
 and we might be able to simplify meta-virtualization&#39;s=C2=A0dynamic la=
yers a bit.</div><div><br></div><div>Before getting to that though, one thi=
ng that wasn&#39;t clear to me is why the Xilinx dynamic layer Xen u-boot s=
cript is currently packaged via a bbappend, rather than a standalone recipe=
 bb, as the raspberry pi one is. If you change to follow that raspberry pi =
example then you can switch your boot-Xen-or-not behaviour by setting the P=
REFERRED_PROVIDER_u-boot-default-script variable (to use either your meta-x=
ilinx non-Xen u-boot script recipe, or your meta-virtualization Xen-enabled=
 one) and avoid the need for the second patch that adds the new control var=
iable in this series. Could that be a viable approach?</div><div><br></div>=
<div>Christopher</div><div><br></div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
We can also explore on image builder tool <br>
<a href=3D"https://gitlab.com/ViryaOS/imagebuilder/-/tree/master" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.com/ViryaOS/imagebuilder/-/tree/=
master</a>, We can create a <br>
imagebuilder.bbclass and user can input the cfg and generate the right <br>
u-boot scripts. It&#39;s VERY unclear to me that this is useful for anyone?=
 <br>
we need to better understand this component, how it&#39;s configured and <b=
r>
it&#39;s general purpose usage.<br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt; +SCRIPT_SED_ADDENDUM +=3D &quot;-e &#39;s/@@XEN_IMAGE_NAME@@/${XEN=
_IMAGE_NAME}/&#39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@XEN_OFFSET@@/${XEN_OFFSET=
}/&#39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@XEN_LOAD_ADDRESS@@/${XEN_=
LOAD_ADDRESS}/&#39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@DOM0_MEM@@/${DOM0_MEM}/&#=
39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/@@DOM0_MAX_VCPUS@@/${DOM0_M=
AX_VCPUS}/&#39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:@@XEN_SERIAL_CONSOLES@@:${X=
EN_SERIAL_CONSOLES}:&#39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:@@XEN_CMDLINE_APPEND@@:${XE=
N_CMDLINE_APPEND}:&#39; \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; \ No newline at end of file<br>
&gt;&gt; -- <br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000074d0ee0604d308be--

