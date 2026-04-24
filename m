Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182B4FB44A5
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 04:30:18 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14395.1777005016966824546
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 21:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G9TmZRKp;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38dfb789d7fso56238451fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 21:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777005015; cv=none;
        d=google.com; s=arc-20240605;
        b=Ihcw0Ua+hFwO6piTL3KLnUi6HZTKUI5RdnT1zgpZlck0xIg/h2UbGnRhfAlkSXW0+u
         ckrFidmBQNaHeYhZvbcgSpF1r6mC0v6Cp1TYBvw93DKGxWjwegmE8VhVa3WTybFcwpyT
         WhOs/013JfNmkTnZZBhnzwJ1v89KorIIdbHhMpVYop3Giae9kKy8DIbcqmkdOGbIHsda
         3/pWT4m7CHKy8ii+ond/ZguJ6QSeXnCz96qZCZwTlw+9lVJtOorK2BW7M9LlP6OdvQKo
         /eAVAY8PGZyzGunAtaYePB3mH4LPf2rSiR7aWcvB6SX/Eml6T7ck0hwMQCbs7iK6Sw+j
         BNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ga7bGV6AaxYX6QczaHM6XtgX4cHdd89HxHj+IP4G8Ik=;
        fh=D0mo+dvbVYIj4yBkILwbOIpm7DTCrdJJq5V8zWzUKD4=;
        b=dO45Oo2xP4LKUjMxkIVFUKSF/6aLz9KtM+VRfl3c6FEUeQjLeZ+D294E7ZxVXkzdWK
         DUf837D3RT8+eKGBDSdY42Ai1Ug10pMaSnyVwf23wKyzbg/uF40qULHfK7xUbd2pgSWN
         Jp+RtQYQNjqx4lNN0eO+RYOApEfx51xJVZWi+7WSaiwOF0ZV+CSPIY+DGkFsgYeJFbIf
         J2n8iIU3f5+ntfgjOmTatytoStLazyB9T9qODCEaxKE4n+eQuq/K24A5X/acv9hKhoC+
         UROL7L5TBE+JE5REu4DhHGV6dJL4DBMHLFI4RWcIITCa+42vtXR4XE/yzKzjjy8X4vj8
         3LYA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777005015; x=1777609815; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ga7bGV6AaxYX6QczaHM6XtgX4cHdd89HxHj+IP4G8Ik=;
        b=G9TmZRKp6TrhWTDp0qWsSla2iRwzip2Vra494B6PosKcy4C/FdJfNFdwc0y9AFuJXm
         V/y3+UVYy2fN2zF2GfDoUmTUE6gFIAqiXE+vsQZQajk3/te/Mgzn613dP3zyFj+yg0Sh
         +Z0fDwcBpAXhFHe7nNacPt8hAuMzgs5cEupOsDb5evQJdte8SrZyZUMjBGOYC1h/JkBA
         /+hJQt70z2taQ7Wq8TVVAECYwqHLqhld5MRg6nr0d5tQj7MQ5wo4JSMoLo5kDWElDKTU
         MdaWsLkJKkPEq4omPuEzkELFTKX5x5AHn6zJrVYus6nxXQCXxpTv4G9NUOxsz9V0DYGL
         X/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777005015; x=1777609815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ga7bGV6AaxYX6QczaHM6XtgX4cHdd89HxHj+IP4G8Ik=;
        b=ZeAmHnU1bxgTWrgDKwpcpXQhUCtx+A+8g1bbulgskX+iEkm63ThJ3D/ni7NiEPN8bI
         ImE9jPE3nLF6vRjmcnmkOXIO5EYZED5grTr4pk7lOwYDghjtAC6C6U51Tqwwxy0K7d+4
         5jS+PzFCpb0aCiz25DqeOGL99feRL+Y/qOsFZwtoEBYTtoBxQCkqSeJ951IoO7ZsMA1X
         fmVLkcOaYeB1zxkwJbyGDKeZFjijNVp5ffnA9J6rSCv0RtJM92FmM2cNlieqs2dO2ZjE
         BGH4sYRQ62jHug3BZo0tvrw4/8Z1/wKtZeoyAJy/cpxhfpuTFK3dBP8REXYkilNV8CrU
         zvEg==
X-Forwarded-Encrypted: i=1; AFNElJ+LvFdMzgj7dgM6daR4bCMZVDLhLnSmAHyApb2tov4QrCymU0X8B2DQ+aLjHqnLnjxUsuU6je9u1TbQ7BN8pye9vGDb@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxOqi5co9CrcXu2+t7lUblx4ixMoZxtssucVlH5HE5Img1EIuZf
	/gNEOmVmwi82tlQKEw3k/3sN5kKwHc/ex5BNu1GLUnbTPFKCIeZe8gJpRG3yTOXJJhVLX0HvICq
	dZez4E7qT59FgNsJxffiyG7yF4x/+inU=
X-Gm-Gg: AeBDietNpzt67id4Orw194lWwK05SwbcpEBDxw4FVQFPU7AxP/iTBNeSeDCVUeIoDma
	aIYjz5BKrE7uD5WlmeCUgG+FC6YiNlhlQck9kbEUIDLrtu4hFVjK5pSTt1USG/u1P6FcyOUxMUR
	BlidTwJcDS71wLm3PL0eopOOC/a/W/mJrDOH+NkoCW+KnMCkV50wJQ1w1EmNESWP7WYHx0+HspQ
	eYWWbdIcYJj7Zu+CCXKDTuvxRd+w4QjpCbJkYlHp8l7S2yPf2B66XXUXBOCuMwO3Ydkxa6m/1r8
	5G8ROGxbpu3oleh9Vg==
X-Received: by 2002:a05:6512:159f:b0:5a3:e7d7:659 with SMTP id
 2adb3069b0e04-5a4172be9bemr11082632e87.15.1777005014338; Thu, 23 Apr 2026
 21:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260423154741.2094781-1-richard.purdie@linuxfoundation.org>
 <CADkTA4Pr6QPDa3iByS1EPaOJCB19G_x+mX1qLSy0N8aXiO29kA@mail.gmail.com> <18A92EC515045964.2056844@lists.yoctoproject.org>
In-Reply-To: <18A92EC515045964.2056844@lists.yoctoproject.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 23 Apr 2026 21:30:02 -0700
X-Gm-Features: AQROBzDHCrnj0nAwTchuRuxLMZyUkhiyLxQx6gEF3ZM7YRCNjBG_aMRm7jHPVuA
Message-ID: <CANx9H-B7vsm2BYxgLkY5b9jnj70Xn9L+aLNYwMJ0ixRo3v4t6g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] lasyer.conf/qemu-system-native:
 Improve native DISTRO_FEATURE handling
To: ticotimo@gmail.com
Cc: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a4d05306502d384c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 04:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9737

--000000000000a4d05306502d384c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 8:55=E2=80=AFPM Tim Orling via lists.yoctoproject.o=
rg
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Apr 23, 2026 at 6:02=E2=80=AFPM Bruce Ashfield via lists.yoctopro=
ject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>>
>>
>> On Thu, Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via
>> lists.yoctoproject.org <richard.purdie=3D
>> linuxfoundation.org@lists.yoctoproject.org> wrote:
>>
>>> OE-Core needs to make some improvements to the way DISTRO_FEATURES is
>>> being built
>>> but this will break the way meta-virtualization is handling native
>>> propagation.
>>>
>>> Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.
>>>
>>> That then means updating the bbappend just to look at DISTRO_FEATURES
>>> and to
>>> look for both possible values.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  conf/layer.conf                                     | 2 +-
>>>  recipes-devtools/qemu/qemu-system-native_%.bbappend | 6 +++---
>>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>> index eababe00..2a4a4c91 100644
>>> --- a/conf/layer.conf
>>> +++ b/conf/layer.conf
>>> @@ -72,7 +72,7 @@ HOSTTOOLS_NONFATAL +=3D "getent"
>>>
>>>  # Propagate virtualization/vcontainer to native DISTRO_FEATURES for
>>> qemu virtfs support
>>>  # This enables virtio-9p in qemu-system-native for
>>> container-cross-install batch imports
>>> -DISTRO_FEATURES_NATIVE:append =3D "
>>> ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer virtualization'=
,
>>> 'virtualization', '', d)}"
>>> +DISTRO_FEATURES_FILTER_NATIVE:append =3D " vcontainer virtualization"
>>>
>>
>> I'm good to use DISTRO_FEATURES_FILTER_NATIVE, but it was less the
>> mapping of vcontainer -> virtualization I was going for (although I did
>> like the simplicity of just checking one), it was the yocto compat quest=
ion.
>>
>> Doesn't that change now make it an unconditional update to that variable
>> (and everyone that had meta-virt in their layers now gets those two
>> variables filtered )? Or is by the native of it being distro features th=
ere
>> is special handling and it won't cause compatibility issues ?
>>
>> Bruce
>>
>>
> I think we have a related problem with DISTRO_FEATURES_FILTER_NATIVESDK:
> ERROR: Nothing PROVIDES 'nativesdk-libseccomp' (but
> mc:vruntime-aarch64:virtual:nativesdk:/home/pokybuild/yocto-worker/vconta=
iner-tarball/build/layers/openembedded-core/meta/recipes-support/gnutls/
> gnutls_3.8.12.bb DEPENDS on or otherwise requires it). ...
>
>
Fixed with https://lists.yoctoproject.org/g/meta-virtualization/message/973=
6
In this case it was DISTRO_FEATURES_DEFAULT =3D> DISTRO_FEATURES_DEFAULTS
that only got uncovered by recent change to filtering.


> --Tim
>
>
>>
>>>
>>>  NON_MULTILIB_RECIPES:append:x86-64 =3D " kubernetes"
>>>
>>> diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend
>>> b/recipes-devtools/qemu/qemu-system-native_%.bbappend
>>> index 1b77db02..e6703c0c 100644
>>> --- a/recipes-devtools/qemu/qemu-system-native_%.bbappend
>>> +++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend
>>> @@ -6,7 +6,7 @@
>>>  # This is required for the fast batch-import path in
>>> container-cross-install.
>>>  #
>>>  # Note: Native recipes don't see target DISTRO_FEATURES directly.
>>> -# The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE
>>> when
>>> -# vcontainer or virtualization is in the target DISTRO_FEATURES.
>>> +# The layer.conf propagates virtualization and vcontainer to
>>> DISTRO_FEATURES
>>> +# using DISTRO_FEATURES_FILTER_NATIVE.
>>>
>>> -PACKAGECONFIG:append =3D "${@bb.utils.contains('DISTRO_FEATURES_NATIVE=
',
>>> 'virtualization', ' virtfs', '', d)}"
>>> +PACKAGECONFIG:append =3D "${@bb.utils.contains_any('DISTRO_FEATURES',
>>> 'virtualization vcontainer', ' virtfs', '', d)}"
>>>
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9735):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9735
> Mute This Topic: https://lists.yoctoproject.org/mt/118973947/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a4d05306502d384c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23,=
 2026 at 8:55=E2=80=AFPM Tim Orling via <a href=3D"http://lists.yoctoprojec=
t.org">lists.yoctoproject.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.co=
m@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 23, 2026 at 6:02=E2=80=AFPM Bruce Ashfield=
 via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoct=
oproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoc=
toproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via <a href=3D"http://lists=
.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;richard=
.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.yoctoproject.org" tar=
get=3D"_blank">linuxfoundation.org@lists.yoctoproject.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">OE-Core needs to m=
ake some improvements to the way DISTRO_FEATURES is being built<br>
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
-core/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.12.bb" targe=
t=3D"_blank">gnutls_3.8.12.bb</a> DEPENDS on or otherwise requires it). ...=
</div><div><br></div></div></div></blockquote><div><br></div><div>Fixed wit=
h=C2=A0<a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/mess=
age/9736">https://lists.yoctoproject.org/g/meta-virtualization/message/9736=
</a></div><div>In this case it was DISTRO_FEATURES_DEFAULT =3D&gt; DISTRO_F=
EATURES_DEFAULTS that only got uncovered by recent change to filtering.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>--Tim</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
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
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9735): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9735" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9735</a><br>
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

--000000000000a4d05306502d384c--

