Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10024FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:05:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11446.1777377908857932402
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 05:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@semalibre.com header.s=dkim header.b=aUXEdnXT;
 spf=pass (domain: semalibre.com, ip: 185.246.84.56, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CCDC91A346B
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 12:05:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99D2C601D0;
	Tue, 28 Apr 2026 12:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71DA110728A70;
	Tue, 28 Apr 2026 14:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1777377906;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cx4BjvbFr5Bg6ewhaI168CxuD+lHj8s2RmJ+7JKkUjw=;
	b=aUXEdnXT3D2bMpDHlqzMRfDSd4utUlfzQ6h+xFXUeoqs29zpT0S6LRjoVQihf867GljL/K
	B4MzwWFc+vS10u3xnbSM5UHnchT8B6DJc5Kd0hHFZ+tIFo87YZAGDPpBGw28iIFziJA2de
	u5R195z5+7SAHorKAUfgUx6EX7a3bsuHw+RBPGZlNPeNRPGnHcB14IWXmEYWQBoTJvU77q
	du/28MMOKcSMgHcQcClt0CDytNaO3SB7mpKI7diFQK4Z1w8jCbvPu1VPWu8op5kxeWJYF/
	PGlqoRY3NdHtGpA82HJCHBoHxVHhnlIXyBOTJ8Sb/bzQkTnF5E8YpzG1XpPzfw==
Date: Tue, 28 Apr 2026 14:05:02 +0200
From: Louis Rannou <louis.rannou@semalibre.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, pascal.eberhard@se.com,
	Louis Rannou <louis.rannou@non.se.com>
Message-ID: <806cd494-9720-4305-a067-7d9ad06353b6@semalibre.com>
In-Reply-To: <afCd5q-X7UtiNBt0@gmail.com>
References: <20260427135431.205900-1-louis.rannou@semalibre.com> <afCd5q-X7UtiNBt0@gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: remove obsolet depends to
 avahi
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2_120862949.1777377902527"
X-Correlation-ID: <806cd494-9720-4305-a067-7d9ad06353b6@semalibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 12:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9772

------=_Part_2_120862949.1777377902527
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

Human after all ! I decided to track down our dependencies to avahi and saw=
 neither br or arch require it.

Unfortunately I have no tool for this but I also realized that would be nic=
e as we probably have others unneeded deps.

Louis

28 avr. 2026 13:45:47 Bruce Ashfield <bruce.ashfield@gmail.com>:

> small typo in the shortlog fixed, and pushed to master.
>=20
> I'm curious how you noticed the obselete depdency! If it
> is a scripted or specific prompt you used, I'd be
> interested to know if there are others like this lurking
> in the layer.
>=20
> Bruce
>=20
> In message: [meta-virtualization][PATCH] libvirt: remove obsolet depends =
to avahi
> on 27/04/2026 Louis Rannou via lists.yoctoproject.org wrote:
>=20
>> From: Louis Rannou <louis.rannou@non.se.com>
>>=20
>> libvirt has removed support for avahi in version 5.5.0 in 2019:
>>=20
>> =C2=A0 * Remove Avahi mDNS support
>>=20
>> =C2=A0=C2=A0=C2=A0 This feature was never used outside of virt-manager, =
which has itself
>> =C2=A0=C2=A0=C2=A0 stopped using it a while ago.
>>=20
>> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
>> Signed-off-by: Louis Rannou <louis.rannou@semalibre.com>
>> ---
>> recipes-extended/libvirt/libvirt_git.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/=
libvirt/libvirt_git.bb
>> index b5b0a5f2..34a1ff21 100644
>> --- a/recipes-extended/libvirt/libvirt_git.bb
>> +++ b/recipes-extended/libvirt/libvirt_git.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5f=
ce4486a80fdaf4a4263 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://COPYING.LESSER;md5=
=3D4b54a1fd55a448865a0b32d41598759d"
>> SECTION =3D "console/tools"
>>=20
>> -DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap=
 util-linux e2fsprogs pm-utils \
>> +DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 parted curl libpcap util-=
linux e2fsprogs pm-utils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iptables dnsmasq readline libtasn1 =
libxslt-native acl libdevmapper libtirpc \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pytho=
n3-docutils-native \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG=
', 'polkit', 'shadow-native', '', d)} \
>> --=20
>> 2.53.0
>>=20
>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9746): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/9746
>> Mute This Topic: https://lists.yoctoproject.org/mt/119030694/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20

------=_Part_2_120862949.1777377902527
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
 <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 </head>
 <body>
  <span dir="ltr" style="margin-top:0; margin-bottom:0;">Hello,</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">Human after all ! I decided to track down our dependencies to avahi and saw neither br or arch require it.</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">Unfortunately I have no tool for this but I also realized that would be nice as we probably have others unneeded deps.</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">Louis</span>
  <br>
  <div class="fairemail_quote">
   <div dir="ltr">
    <p>28 avr. 2026 13:45:47 Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;:</p>
   </div>
   <blockquote style="margin:0;border-left:3px solid #ccc; padding-left:10px;">
    <div>
     small typo in the shortlog fixed, and pushed to master. 
     <br>
     <br>
      I'm curious how you noticed the obselete depdency! If it 
     <br>
      is a scripted or specific prompt you used, I'd be 
     <br>
      interested to know if there are others like this lurking 
     <br>
      in the layer. 
     <br>
     <br>
      Bruce 
     <br>
     <br>
      In message: [meta-virtualization][PATCH] libvirt: remove obsolet depends to avahi 
     <br>
      on 27/04/2026 Louis Rannou via lists.yoctoproject.org wrote: 
     <br>
     <br>
     <blockquote style="margin:0;border-left:3px solid #ccc; padding-left:10px;">
      From: Louis Rannou &lt;louis.rannou@non.se.com&gt; 
      <br>
      <br>
       libvirt has removed support for avahi in version 5.5.0 in 2019: 
      <br>
      <br>
       &nbsp; * Remove Avahi mDNS support 
      <br>
      <br>
       &nbsp;&nbsp;&nbsp; This feature was never used outside of virt-manager, which has itself 
      <br>
       &nbsp;&nbsp;&nbsp; stopped using it a while ago. 
      <br>
      <br>
       Signed-off-by: Louis Rannou &lt;louis.rannou@non.se.com&gt; 
      <br>
       Signed-off-by: Louis Rannou &lt;louis.rannou@semalibre.com&gt; 
      <br>
       --- 
      <br>
       recipes-extended/libvirt/libvirt_git.bb | 2 +- 
      <br>
       1 file changed, 1 insertion(+), 1 deletion(-) 
      <br>
      <br>
       diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb 
      <br>
       index b5b0a5f2..34a1ff21 100644 
      <br>
       --- a/recipes-extended/libvirt/libvirt_git.bb 
      <br>
       +++ b/recipes-extended/libvirt/libvirt_git.bb 
      <br>
       @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ 
      <br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://COPYING.LESSER;md5=4b54a1fd55a448865a0b32d41598759d" 
      <br>
       SECTION = "console/tools" 
      <br>
      <br>
       -DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \ 
      <br>
       +DEPENDS = "bridge-utils gnutls libxml2 lvm2 parted curl libpcap util-linux e2fsprogs pm-utils \ 
      <br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \ 
      <br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; python3-docutils-native \ 
      <br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \ 
      <br>
       -- 
      <br>
       2.53.0 
      <br>
      <br>
     </blockquote>
     <br>
     <blockquote style="margin:0;border-left:3px solid #ccc; padding-left:10px;">
      <br>
       -=-=-=-=-=-=-=-=-=-=-=- 
      <br>
       Links: You receive all messages sent to this group. 
      <br>
       View/Reply Online (#9746): https://lists.yoctoproject.org/g/meta-virtualization/message/9746 
      <br>
       Mute This Topic: https://lists.yoctoproject.org/mt/119030694/1050810 
      <br>
       Group Owner: meta-virtualization+owner@lists.yoctoproject.org 
      <br>
       Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com] 
      <br>
       -=-=-=-=-=-=-=-=-=-=-=- 
      <br>
      <br>
     </blockquote>
    </div>
   </blockquote>
  </div>
 </body>
</html>
------=_Part_2_120862949.1777377902527--

