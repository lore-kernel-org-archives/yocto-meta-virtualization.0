Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D3BFAD3F4
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 03:55:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13690.1777002951509677198
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 20:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HfPZAQe8;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so7566491e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 20:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777002949; cv=none;
        d=google.com; s=arc-20240605;
        b=YFRW3gvVF71RXkAtnQOmVOlMESX3xSFKRY6ZFc5FVS8CkU0aN0qNyJdKVZQhi3jXt0
         PBfLwX0Qmw/ekHhtyzEI2z/Yg4iM2c8T6+h3IWhltngxWWAycBMf1NpBmdOrbA7bYwK4
         f/1Zuey0SN2vymlg5KBtVq+a0Fyx3m6aXOhj63q4i+lsboqBEj7dxGsVNsY+hYzfbEUD
         xffW3VDwI0rc1jQsKOPDl5XoGF8JaJOlLJ6QURFAx8R4/izzVpojK9lfP/6I1fjEuUGX
         +6T4ljQFjy+Z+F2l7UUN8UAYEXHKics/EWIUqlsmAfB8OLIujvNoyORMl6/rEQp8+nOa
         /o5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uAoIza/YH+o6NiyKGrJsSxsuxkQ3tClGLsi3xd0hzKs=;
        fh=2fM3vDP3cNqd1cATTGxf+13g9PwKZiUjTy6XMZNLzfE=;
        b=lPFerDWJmCc8LV4V1Ln6C7hS4bMG3vModto+TalPbE2L1uxFrFPSJRnPaFF1Oe/HXf
         z+R2z3HgcEnVouc2JviqomVJLYEHrymkv0tKpLuJ4iYijxldotDJAR0npO3JRNCxTw/V
         3GhgNgDB7zKKtOxevLSHBE0mIEZ0/uqY1Ed7fnVSCD90hgD+HesCENGMbCVigU2GfSX9
         nOUU1JAzMqsjl/U/PcBVh8ATnTqj33+vhxhLAuV/3MmUods+TtU0fG5Gol+RQNruzf2m
         xhY24vWi3N2TrtccCo5BAmxlg32VWr6TqdwFp6lnGhn6OBsVs9iSjTJd+bMQ35eUenmc
         6cUw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777002949; x=1777607749; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uAoIza/YH+o6NiyKGrJsSxsuxkQ3tClGLsi3xd0hzKs=;
        b=HfPZAQe8PVt3lxKGsjKVPXwb+yoLcDwYMg4vHYXIPfW6tM/M71Y3QJ15dvmDeD1tu8
         3o8W7YavMbHn/NGQW9PCWYpWk3pD7X1kSl931L0iQRglxCkDnnYOmLmShu74DhyDZIS+
         98/Z8r1HJXp9K/rJWFiaUtuglKXzr3cRf69xhwUt/XQfmRn/X6lBw5cKzhpP2EBqaVCo
         409720ulNkfIKavlrZy2TaILXWOGHz+8lvR93LOmXv+Y42/bGsrDEBTinhomRws689mi
         EhT5vsPCbAXL+AaP9oHo/jPr2Hd4+XnegoDThJ5fNp0FTb4kzru0FmyKF6lyHN/46RQb
         rhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777002949; x=1777607749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAoIza/YH+o6NiyKGrJsSxsuxkQ3tClGLsi3xd0hzKs=;
        b=QyrCkN27v/Ok618vHirsonFl79Mdt8DzpoMKXBmMdtCqDtzxzCELD7ridJJdD7Z5yx
         jS9NRiSunphnLsISvhLqVkZ5mdSv7dG6DFuixYldTbG3QKEe9AG8BhaYf7qkVMBBCpwA
         ROC5SXx8UloquMZmf2Kv0NFS3oRUxILt4wDcYsnKg655ezLcieBG7NfvGHCQ3cWfHBB7
         K10smTdQ6O/cfy6WDYp0PF0MqXf5A8nARbrXA1izli93h781lM6xjBSss6DHI7X8OqnN
         YhsN52WKhg62uvfYtzC/SVqFPBWV9er2d26bQuwT7zs9sjmoxquyokot/HXYxAs2USRB
         6dlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZpQc2PS+QhcKHOJdMdy1GXSLiBTgyA5E0qimEh2hkVC+LxkPsyYyjOWfzT0UzyTxc7RYXcboOyowkhNgmiNI0CRtZ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyg712LtI4zNSt6Q+MF0XD11oqTdkdV6UWyRSTcGC1lOeEymwxz
	/OPSDSKIIn6TrCCYY6PTgfOQoObc6iqhUO4NBzSum1ECn6tzyjvRSSGuHPgNubwfSfn4u8IUdap
	NVnB/Q9+cYQGqQBwjKQ1no1hu1zwZqlY=
X-Gm-Gg: AeBDiesxkgrYIUpbYBOub72jTJAi5ax/XApVht2ncXkpTLktcCUP6hcGNgK52uetiIl
	QypINybw1zzkf9CdXtBvDzo4qPTn5r8+G6Zms2dCX40U0as07nO9a9Xh/1dB0Dh4FI4N+iZwW4h
	xsZS3MqPQzRKH8hPIIw6yrFW6meVWyNcaRjSK8hG2JJlXVIjl2zGS7eJWz749DWP05QHEd0jfgp
	C4L5Tdejq6AAGoOLAY3Z19AJu64Pzg/GgxNUnk7LfAbh/JM4EYGaA2MhtGvq+8pNnQ4ja9aTKF1
	8ah23uMQs30+Yy3JoYuUbz/M+vua
X-Received: by 2002:a05:6512:6ca:b0:5a4:d8:ce6f with SMTP id
 2adb3069b0e04-5a4172ea08cmr9260756e87.42.1777002948899; Thu, 23 Apr 2026
 20:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260423154741.2094781-1-richard.purdie@linuxfoundation.org> <CADkTA4Pr6QPDa3iByS1EPaOJCB19G_x+mX1qLSy0N8aXiO29kA@mail.gmail.com>
In-Reply-To: <CADkTA4Pr6QPDa3iByS1EPaOJCB19G_x+mX1qLSy0N8aXiO29kA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 23 Apr 2026 20:55:37 -0700
X-Gm-Features: AQROBzACTTbzKjDJ4BH3sjWKDhsJ_mkv9R_9AKnrhxDcDvx2CxUeZDlxsq9chYg
Message-ID: <CANx9H-Dx7C0BX13Yrz-ay2Sis5grs_=XCBkuGb0FUqbhbgAH4Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] lasyer.conf/qemu-system-native:
 Improve native DISTRO_FEATURE handling
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000088b96406502cbdc2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 03:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9735

--00000000000088b96406502cbdc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 6:02=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via lists.yoctopr=
oject.org
> <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
>
>> OE-Core needs to make some improvements to the way DISTRO_FEATURES is
>> being built
>> but this will break the way meta-virtualization is handling native
>> propagation.
>>
>> Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.
>>
>> That then means updating the bbappend just to look at DISTRO_FEATURES an=
d
>> to
>> look for both possible values.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  conf/layer.conf                                     | 2 +-
>>  recipes-devtools/qemu/qemu-system-native_%.bbappend | 6 +++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index eababe00..2a4a4c91 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -72,7 +72,7 @@ HOSTTOOLS_NONFATAL +=3D "getent"
>>
>>  # Propagate virtualization/vcontainer to native DISTRO_FEATURES for qem=
u
>> virtfs support
>>  # This enables virtio-9p in qemu-system-native for
>> container-cross-install batch imports
>> -DISTRO_FEATURES_NATIVE:append =3D "
>> ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer virtualization',
>> 'virtualization', '', d)}"
>> +DISTRO_FEATURES_FILTER_NATIVE:append =3D " vcontainer virtualization"
>>
>
> I'm good to use DISTRO_FEATURES_FILTER_NATIVE, but it was less the mappin=
g
> of vcontainer -> virtualization I was going for (although I did like the
> simplicity of just checking one), it was the yocto compat question.
>
> Doesn't that change now make it an unconditional update to that variable
> (and everyone that had meta-virt in their layers now gets those two
> variables filtered )? Or is by the native of it being distro features the=
re
> is special handling and it won't cause compatibility issues ?
>
> Bruce
>
>
I think we have a related problem with DISTRO_FEATURES_FILTER_NATIVESDK:
ERROR: Nothing PROVIDES 'nativesdk-libseccomp' (but
mc:vruntime-aarch64:virtual:nativesdk:/home/pokybuild/yocto-worker/vcontain=
er-tarball/build/layers/openembedded-core/meta/recipes-support/gnutls/
gnutls_3.8.12.bb DEPENDS on or otherwise requires it). ...

--Tim


>
>>
>>  NON_MULTILIB_RECIPES:append:x86-64 =3D " kubernetes"
>>
>> diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend
>> b/recipes-devtools/qemu/qemu-system-native_%.bbappend
>> index 1b77db02..e6703c0c 100644
>> --- a/recipes-devtools/qemu/qemu-system-native_%.bbappend
>> +++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend
>> @@ -6,7 +6,7 @@
>>  # This is required for the fast batch-import path in
>> container-cross-install.
>>  #
>>  # Note: Native recipes don't see target DISTRO_FEATURES directly.
>> -# The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE wh=
en
>> -# vcontainer or virtualization is in the target DISTRO_FEATURES.
>> +# The layer.conf propagates virtualization and vcontainer to
>> DISTRO_FEATURES
>> +# using DISTRO_FEATURES_FILTER_NATIVE.
>>
>> -PACKAGECONFIG:append =3D "${@bb.utils.contains('DISTRO_FEATURES_NATIVE'=
,
>> 'virtualization', ' virtfs', '', d)}"
>> +PACKAGECONFIG:append =3D "${@bb.utils.contains_any('DISTRO_FEATURES',
>> 'virtualization vcontainer', ' virtfs', '', d)}"
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9732):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9732
> Mute This Topic: https://lists.yoctoproject.org/mt/118973947/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000088b96406502cbdc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23,=
 2026 at 6:02=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoctopr=
oject.org">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailt=
o:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via <a href=3D"http://list=
s.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;richar=
d.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.yoctoproject.org" ta=
rget=3D"_blank">linuxfoundation.org@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">OE-Core needs to =
make some improvements to the way DISTRO_FEATURES is being built<br>
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
quot;<br></blockquote><div><br></div><div><div style=3D"font-size:small">I&=
#39;m good to use DISTRO_FEATURES_FILTER_NATIVE, but it was less the mappin=
g of vcontainer -&gt; virtualization I was going for (although I did like t=
he simplicity of just checking one), it was the yocto compat question.</div=
><div style=3D"font-size:small"><br></div><div style=3D"font-size:small">Do=
esn&#39;t that change now make it an unconditional update to that variable =
(and everyone that had meta-virt in their layers now gets those two variabl=
es filtered )? Or is by the native of it being distro features there is spe=
cial handling and it won&#39;t cause compatibility issues ?</div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce</div><b=
r></div></div></div></blockquote><div><br></div><div>I think we have a rela=
ted problem with DISTRO_FEATURES_FILTER_NATIVESDK:<br>ERROR: Nothing PROVID=
ES &#39;nativesdk-libseccomp&#39; (but mc:vruntime-aarch64:virtual:nativesd=
k:/home/pokybuild/yocto-worker/vcontainer-tarball/build/layers/openembedded=
-core/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.12.bb">gnutl=
s_3.8.12.bb</a> DEPENDS on or otherwise requires it). ...</div><div><br></d=
iv><div>--Tim</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9732): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9732" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9732</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118973947/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/118973947/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000088b96406502cbdc2--

