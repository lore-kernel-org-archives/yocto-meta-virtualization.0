Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7A4FDEE58
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 01:02:04 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11831.1776992520559019391
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 18:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YF5ca1iw;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c79467f11abso4779593a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 18:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776992520; cv=none;
        d=google.com; s=arc-20240605;
        b=MAflLe1tPZNxBjL8sAjrHEff8n+L7rzR46E3C/z5GrYVjOPDAqk82DRVrcAP9a2rAz
         rHWPNtjlGahlN6oCxdBxWtmz+av7/SZwYbter2GXFkz5UViexfjWt58UH3/9On+fFZLH
         YWz/p4YDOkKaJS15S+Ks7tp79XSz6I+W3SGn+KOO2L8431ufpCWxQfAhV3qk83q4Ult9
         OOX9FveCZG7arjsVN1MsSrvls91/5+7qz0qfA43Its/XUCAz2hyIHNBcMC85Y8rwh5/R
         FRxffQwZREBmWThgZclUFTD2a1LTkpHTpVdD9tL95E19NyWvZaUdJIcRD5hnZNDTYRV+
         dr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vPhm/1CrifMawTpYCUeUIZJw6hlO2CV6dqN6OJRc7+c=;
        fh=o9y9D6cjCPNK4FfxY/Ptl7cPQ4JDf1vvTSawG4Vs0TM=;
        b=fLrJLz/Bnn/4GhHzrv2JkOmaTwXpn0NyxscxV+LT8oxwwIpQvSajnLHKnht2kRLUEm
         m/WNqh37LVWpdntUL7U2db+8vUtlXl6kXz2ynh6vU8bcUCl98GAyrb+ZA3lwLUTh920w
         z5jKvPngLzc/VaYPjaLXV6F3KjmpfdrVEd7EJK1Sl+6nreIhKEuJwXkIM9PbL1vjgtTt
         EGhpbfHr+EgWvL0Kigkbmb5UmiRCIshG7/fDcQM5yb6Klkoz307AZ3PTkoWuWqpH4Epl
         YTKgrQDQLIGBPDLdImHqkpouMzbtfjkIeoTeSEkrae9hIncHIEih8YXFIeXmBJ1jdFzA
         DAFA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776992520; x=1777597320; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vPhm/1CrifMawTpYCUeUIZJw6hlO2CV6dqN6OJRc7+c=;
        b=YF5ca1iwhH/+luWohnMndsOyGT1HR3CflHBYxQWNJkCNft0sD19n5nhu67syqfaFXh
         NCtMufSSt9rFhq7kkkAYneRqlKEJRqkiujZo4rJjzvpywxYaZMQnY507WgLrp99doo4+
         k4BhUQktkLIcmULt6BNn7k240fgJcoPyN/FbWZLXyOHYevBmiHlvqJi3K+5CFVbQnXSh
         i09b9K6REeHxIsbD/0qDmT80SKTByPo+8MA8AAHMMhroFvAZ51QFCLQk6UGFN+NW8041
         NL7BqKZz5pMRLXaFNdWu7QFBVUfrNBOY8uEHP7CXzDjzb85fxSmcE6OzLJ5UEwGo3c/y
         u6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776992520; x=1777597320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPhm/1CrifMawTpYCUeUIZJw6hlO2CV6dqN6OJRc7+c=;
        b=IEKiSe9zkRVvqqoXgJeJMQcb89P0jxho1Bgs1moP8YJs97i4tVs83umA09J4Avlc0N
         MJeTR4vuYlcmq4AYheZbTZPYId3q6rI2GkGE4fbWfnX7jBFnMfz/WXO3jmn/27OxcyG/
         Br82+ZVx8uGevnPA0EOkPDY+5DvBCs2DWVN1MyVtBq9APb67OKQT+gwNDi4pxFkRsUcK
         rHAnvAc1eTs1rgTVTmsEvcEFZ2+sypCqoSXRMLqaYF6NzPGpybnkqARgc8IK8X3Q39Fq
         wXnR1sRuH5+XCHf9Ifp06NDzq6n/RBas/g0ay7HbL0Vo/83YyHMNoHtvU6K99Vh4yfpT
         YDmw==
X-Gm-Message-State: AOJu0YxW+dj/zp2eflP4vmck/bBwR1DJNoiNOqm5Wx6cjxwG9tEigc3E
	DjLI9bbAxViIzzE57drSKWABaMCBXaSI1jWiYO1DSw5quLq5OvRrv9t/2JMlMLKXsCE5gd+leEb
	eKBcNly895K0OLlRK/gH7KySzRP7PDak=
X-Gm-Gg: AeBDieuX2JVFwV5jpIiY9MBY9tFEAenxSyM4DWR7FxpNpGvH7Oe3DzgiNEY3UQe69Be
	oEeBCN1Xg/doREEjtAyQRxnjmhEvnMy4BlBrldak4qDMgxBEdZW67O4TMS/1gZvWDhr5MzT0SMy
	pTC2c0z+ZXOPBAzCT6Nxh6hDjz/o8Ux2Uc3xyLXErdwV8bwVuZFLbtCvw2DYSS6+IMtIG86qHLX
	Lmv8kniKwJjGWwaTS3EaXvyullOjqtqW7KuAVMck8FWWsOOH+nx/UJ56DDY+oabDx1oIAeC/mQa
	4Q2Rm2EG3oG55ahZgZMwrDskzr5Zd3SSAIzOfO229S0XTht8Ll8=
X-Received: by 2002:a05:6a20:a106:b0:3a3:1f85:644d with SMTP id
 adf61e73a8af0-3a31f857f65mr5919311637.22.1776992519625; Thu, 23 Apr 2026
 18:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260423154741.2094781-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260423154741.2094781-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Apr 2026 21:01:48 -0400
X-Gm-Features: AQROBzC-j7_Lpy1phKPFDjhK-Eta-y_ZXVQj9Kf_b34mO3xS6RthBjzRJ0JzTyc
Message-ID: <CADkTA4Pr6QPDa3iByS1EPaOJCB19G_x+mX1qLSy0N8aXiO29kA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] lasyer.conf/qemu-system-native:
 Improve native DISTRO_FEATURE handling
To: richard.purdie@linuxfoundation.org
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e69e1106502a4f99"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 01:02:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9732

--000000000000e69e1106502a4f99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via lists.yoctoproj=
ect.org
<richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:

> OE-Core needs to make some improvements to the way DISTRO_FEATURES is
> being built
> but this will break the way meta-virtualization is handling native
> propagation.
>
> Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.
>
> That then means updating the bbappend just to look at DISTRO_FEATURES and
> to
> look for both possible values.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  conf/layer.conf                                     | 2 +-
>  recipes-devtools/qemu/qemu-system-native_%.bbappend | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index eababe00..2a4a4c91 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -72,7 +72,7 @@ HOSTTOOLS_NONFATAL +=3D "getent"
>
>  # Propagate virtualization/vcontainer to native DISTRO_FEATURES for qemu
> virtfs support
>  # This enables virtio-9p in qemu-system-native for
> container-cross-install batch imports
> -DISTRO_FEATURES_NATIVE:append =3D "
> ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer virtualization',
> 'virtualization', '', d)}"
> +DISTRO_FEATURES_FILTER_NATIVE:append =3D " vcontainer virtualization"
>

I'm good to use DISTRO_FEATURES_FILTER_NATIVE, but it was less the mapping
of vcontainer -> virtualization I was going for (although I did like the
simplicity of just checking one), it was the yocto compat question.

Doesn't that change now make it an unconditional update to that variable
(and everyone that had meta-virt in their layers now gets those two
variables filtered )? Or is by the native of it being distro features there
is special handling and it won't cause compatibility issues ?

Bruce



>
>  NON_MULTILIB_RECIPES:append:x86-64 =3D " kubernetes"
>
> diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend
> b/recipes-devtools/qemu/qemu-system-native_%.bbappend
> index 1b77db02..e6703c0c 100644
> --- a/recipes-devtools/qemu/qemu-system-native_%.bbappend
> +++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend
> @@ -6,7 +6,7 @@
>  # This is required for the fast batch-import path in
> container-cross-install.
>  #
>  # Note: Native recipes don't see target DISTRO_FEATURES directly.
> -# The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE whe=
n
> -# vcontainer or virtualization is in the target DISTRO_FEATURES.
> +# The layer.conf propagates virtualization and vcontainer to
> DISTRO_FEATURES
> +# using DISTRO_FEATURES_FILTER_NATIVE.
>
> -PACKAGECONFIG:append =3D "${@bb.utils.contains('DISTRO_FEATURES_NATIVE',
> 'virtualization', ' virtfs', '', d)}"
> +PACKAGECONFIG:append =3D "${@bb.utils.contains_any('DISTRO_FEATURES',
> 'virtualization vcontainer', ' virtfs', '', d)}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9728):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9728
> Mute This Topic: https://lists.yoctoproject.org/mt/118973947/1050810
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

--000000000000e69e1106502a4f99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2026 at 11:47=
=E2=80=AFAM Richard Purdie via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfounda=
tion.org@lists.yoctoproject.org">linuxfoundation.org@lists.yoctoproject.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
OE-Core needs to make some improvements to the way DISTRO_FEATURES is being=
 built<br>
but this will break the way meta-virtualization is handling native propagat=
ion.<br>
<br>
Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.<br>
<br>
That then means updating the bbappend just to look at DISTRO_FEATURES and t=
o<br>
look for both possible values.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
=C2=A0recipes-devtools/qemu/qemu-system-native_%.bbappend | 6 +++---<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index eababe00..2a4a4c91 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -72,7 +72,7 @@ HOSTTOOLS_NONFATAL +=3D &quot;getent&quot;<br>
<br>
=C2=A0# Propagate virtualization/vcontainer to native DISTRO_FEATURES for q=
emu virtfs support<br>
=C2=A0# This enables virtio-9p in qemu-system-native for container-cross-in=
stall batch imports<br>
-DISTRO_FEATURES_NATIVE:append =3D &quot; ${@bb.utils.contains_any(&#39;DIS=
TRO_FEATURES&#39;, &#39;vcontainer virtualization&#39;, &#39;virtualization=
&#39;, &#39;&#39;, d)}&quot;<br>
+DISTRO_FEATURES_FILTER_NATIVE:append =3D &quot; vcontainer virtualization&=
quot;<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I&#39;m good to use DISTRO_FEATURES_FILTER_NATIVE, bu=
t it was less the mapping of vcontainer -&gt; virtualization I was going fo=
r (although I did like the simplicity of just checking one), it was the yoc=
to compat question.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Doesn=
&#39;t that change now make it an unconditional update to that variable (an=
d everyone that had meta-virt in their layers now gets those two variables =
filtered )? Or is by the native of it being distro features there is specia=
l handling and it won&#39;t cause compatibility issues ?</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0NON_MULTILIB_RECIPES:append:x86-64 =3D &quot; kubernetes&quot;<br>
<br>
diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend b/recipes-=
devtools/qemu/qemu-system-native_%.bbappend<br>
index 1b77db02..e6703c0c 100644<br>
--- a/recipes-devtools/qemu/qemu-system-native_%.bbappend<br>
+++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend<br>
@@ -6,7 +6,7 @@<br>
=C2=A0# This is required for the fast batch-import path in container-cross-=
install.<br>
=C2=A0#<br>
=C2=A0# Note: Native recipes don&#39;t see target DISTRO_FEATURES directly.=
<br>
-# The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE when<=
br>
-# vcontainer or virtualization is in the target DISTRO_FEATURES.<br>
+# The layer.conf propagates virtualization and vcontainer to DISTRO_FEATUR=
ES<br>
+# using DISTRO_FEATURES_FILTER_NATIVE.<br>
<br>
-PACKAGECONFIG:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES_N=
ATIVE&#39;, &#39;virtualization&#39;, &#39; virtfs&#39;, &#39;&#39;, d)}&qu=
ot;<br>
+PACKAGECONFIG:append =3D &quot;${@bb.utils.contains_any(&#39;DISTRO_FEATUR=
ES&#39;, &#39;virtualization vcontainer&#39;, &#39; virtfs&#39;, &#39;&#39;=
, d)}&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9728): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9728" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9728</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118973947/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118973947/1050810</a><br>
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

--000000000000e69e1106502a4f99--

