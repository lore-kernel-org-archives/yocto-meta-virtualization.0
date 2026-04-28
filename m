Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3299CFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:20:04 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12041.1777378801458668033
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 05:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rIuz/P4x;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso5005352a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 05:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777378801; cv=none;
        d=google.com; s=arc-20240605;
        b=W/YGGA/OjxwKQOTmxFbKlunjuOyBg+KNEPsvsrcInxeVxRuSxBcfnh0OWR/3qgVx91
         6zcuR6PE3gETQEWonjwkfaa2lf1w7TbCRoL27XrENhnC+kxfzmouhpxk3WpECaT2wmiZ
         TWGzNL6wyIY5QDPFmLYCsuD/QohJ8Gjci3AzBX9biFqG/FWZe9iQ5imPlnk1lu0+UYrt
         m7EQOXhVHsCWY6liAHrq1ESu2exQSIXw3Ywz9fJaif4PxFxOy6rmoFehQki8fxMc2All
         ukey2SnlVCY9sCStp0gh9x3zqq3YFHPNKPuLIfFeqv/h/Ac5iyzLEuBbx0rHVMywsbuP
         ZRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u27Tpb/+Ti6wI1rmadmgtKbUAQLqcGiIrKUUqcmTQas=;
        fh=dWvOgDoYcJU4eaxmyRO5PVtJMiDEuByoVRCAaGzyV0k=;
        b=P0b31ZmaR6fcHWTGMS4dAXdEA0WLVocLJw+A/nZCRr02YfIamRypnwjSFaZ+Kbdjqw
         K4TfLtKtv1fEeHxlzOsWpLeKxouM5BwcJfcWpDHSsVF4C73nSgBpt1+fscIccSG2MHwO
         lshWmR9VA/3RIHxy07Jzwe/uk/wFCJ6wFMIaSogIaQHx3IUkXtD+7BMlXA0AkGpDDhA7
         tTKh2vRXz+xyYtzNizjPWRahdjX/Djw/TGgL1Ni2rIV/OabADgMO20Nm1qYi4lcIU/gB
         RGBzKMSLWJiUdcHr/ZcYtDCLgMbj9ZEe8mLUqmzZbWcCF0bjg86HyeBdTlkTIb6GtP19
         Ghag==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777378801; x=1777983601; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u27Tpb/+Ti6wI1rmadmgtKbUAQLqcGiIrKUUqcmTQas=;
        b=rIuz/P4xQPpbsf4eWPgtZ69q49z0ftFelCHjuYmHByoTBtnnkA+nX4HmJvUFO16rp/
         QqIltDtdqYZAw44X/R/gxrvw24hHfbahLhRrKdn+4Ct6zsHg9eV3ng2s4H/TeKwQvhWX
         OyAtgtnLkctAQQLpoHz5TI75vAkApXVBljGTshu9klQrei/jDgg3Z1HrVMSDqnyRdDSY
         O0b/Wc7LE2o4rzmED3WfFdXlzuvOjN5zhkffQDqneoJi3J0OqSyx/5ULklpUqSvtKMEI
         X+FF5BZXZ1uaXYGtcGsbvBq10RqrX7ZZgoV+wfCNnkapA3Jeby6sKlY9rCHI0ERqB4e6
         cPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378801; x=1777983601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u27Tpb/+Ti6wI1rmadmgtKbUAQLqcGiIrKUUqcmTQas=;
        b=VX3qUMfFAXhdWvh8OdOOu+r2y+mm0/VC+ifINDbaJ5+BMrgcXvPWwCc+HD/cB/BuqD
         DqZIblPHjrJw9tBLMoXXyM46dAwS7si49QEkaF6Uuu5X1vmeTkNRKMsbg/5HTYEzElUv
         rpzeS14FrxAy384r72anoEmn76dcCCQja1g/PMjOd+5ir1J1yfFnnTli/K+oBtKI9sOC
         NFb66m3Jq1DNGjd1zBL8VryTsQeIySH8nOmr0hhWn9MxS/q7abXIcDCmVkQaHbeiKBfW
         AUHB14CeDU58T9amjv7ecoevgHeaB720puuaGzfx1bFFV7u0Ui6FCyKVGn95VTezNILC
         vaFA==
X-Gm-Message-State: AOJu0YwjfKMOVWaSIDr7sjlyUQEP+ff4lWMVG+epqwo601rxKp8xX77X
	m/DM3MEDMuJS1B2LgcsKqU5kHZIfM+H6TuD2Y6FLCHtR2z0soW1MQEw7sTHNsunW3DhIBxgVfQ+
	uWLiznRpIqiqrILD1A/F9mpVRkR4N4Wo=
X-Gm-Gg: AeBDiesSAW5Cys9emVCOJCQWaKQgr4uJvh0M+QY7SOsutoQubsi0zXe+NPbeMKGn5FS
	Xj/s9hH5U3+aNBuzSSoRQ2fZVNVMOq5gikKrPaHxuOU2AcLu/1i4wLJVw6p+KA5ACKJ9nR0uFRq
	OXwSSkSjS+v5gkxEB9ky8oZxRUOCG9rt7GULQUR/BGjyn3VC67adNLKM2XDkg0YKcHGzZ487uW0
	j/+dbaqWs0ZEKBxBAw7/CpHbSDcaKsNGtO6zA1zsm0AWT7HCEzAhenQkaL/uPQY8jkKzXTyYqN5
	i4IE23ffqMKFbmN4xUhLs1JAFJhOH3jil/K4S62Lqc5DT9zZJY8=
X-Received: by 2002:a17:903:298c:b0:2b4:7b57:5d77 with SMTP id
 d9443c01a7336-2b97c478e89mr27102915ad.26.1777378800542; Tue, 28 Apr 2026
 05:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260427135431.205900-1-louis.rannou@semalibre.com>
 <afCd5q-X7UtiNBt0@gmail.com> <806cd494-9720-4305-a067-7d9ad06353b6@semalibre.com>
In-Reply-To: <806cd494-9720-4305-a067-7d9ad06353b6@semalibre.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Apr 2026 08:19:48 -0400
X-Gm-Features: AVHnY4JFOtdTwp_mD7bZeIq-eTkZt7Srz-AjokWY41Pc82RIVlyz26lybj42CdM
Message-ID: <CADkTA4NBPi3o8cXJep1WSnFDiyP5idYL6ns5A8p7PQAqx4HM+w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: remove obsolet depends to avahi
To: Louis Rannou <louis.rannou@semalibre.com>
Cc: meta-virtualization@lists.yoctoproject.org, pascal.eberhard@se.com, 
	Louis Rannou <louis.rannou@non.se.com>
Content-Type: multipart/alternative; boundary="00000000000009a895065084401e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 12:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9773

--00000000000009a895065084401e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 8:05=E2=80=AFAM Louis Rannou <louis.rannou@semalibr=
e.com>
wrote:

> Hello,
>
> Human after all ! I decided to track down our dependencies to avahi and
> saw neither br or arch require it.
>
>
In this day and age, I appreciate the human effort :)


> Unfortunately I have no tool for this but I also realized that would be
> nice as we probably have others unneeded deps.
>
>
I've put it on my TODO list.

Thanks for the follow up.

Bruce



> Louis
>
> 28 avr. 2026 13:45:47 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
> small typo in the shortlog fixed, and pushed to master.
>
> I'm curious how you noticed the obselete depdency! If it
> is a scripted or specific prompt you used, I'd be
> interested to know if there are others like this lurking
> in the layer.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] libvirt: remove obsolet depends
> to avahi
> on 27/04/2026 Louis Rannou via lists.yoctoproject.org wrote:
>
> From: Louis Rannou <louis.rannou@non.se.com>
>
> libvirt has removed support for avahi in version 5.5.0 in 2019:
>
>   * Remove Avahi mDNS support
>
>     This feature was never used outside of virt-manager, which has itself
>     stopped using it a while ago.
>
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> Signed-off-by: Louis Rannou <louis.rannou@semalibre.com>
> ---
> recipes-extended/libvirt/libvirt_git.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_git.bb
> b/recipes-extended/libvirt/libvirt_git.bb
> index b5b0a5f2..34a1ff21 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>
> file://COPYING.LESSER;md5=3D4b54a1fd55a448865a0b32d41598759d"
> SECTION =3D "console/tools"
>
> -DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
> util-linux e2fsprogs pm-utils \
> +DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 parted curl libpcap
> util-linux e2fsprogs pm-utils \
>        iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper
> libtirpc \
>             python3-docutils-native \
>        ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native',
> '', d)} \
> --
> 2.53.0
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9746):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9746
> Mute This Topic: https://lists.yoctoproject.org/mt/119030694/1050810
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

--00000000000009a895065084401e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2026 at 8:05=
=E2=80=AFAM Louis Rannou &lt;<a href=3D"mailto:louis.rannou@semalibre.com">=
louis.rannou@semalibre.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=20
 =20
=20
 <div>
  <span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Hello,</span=
>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Human af=
ter all ! I decided to track down our dependencies to avahi and saw neither=
 br or arch require it.</span>
  <br>
  <br></div></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">In this day and age, I appreciate the human effort=
 :)</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Un=
fortunately I have no tool for this but I also realized that would be nice =
as we probably have others unneeded deps.</span>
  <br>
  <br></div></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">I&#39;ve put it on my TODO list.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Thanks for the follow up.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div><span dir=3D"ltr" sty=
le=3D"margin-top:0px;margin-bottom:0px">Louis</span>
  <br>
  <div>
   <div dir=3D"ltr">
    <p>28 avr. 2026 13:45:47 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;:</p>
   </div>
   <blockquote style=3D"margin:0px;border-left:3px solid rgb(204,204,204);p=
adding-left:10px">
    <div>
     small typo in the shortlog fixed, and pushed to master.=20
     <br>
     <br>
      I&#39;m curious how you noticed the obselete depdency! If it=20
     <br>
      is a scripted or specific prompt you used, I&#39;d be=20
     <br>
      interested to know if there are others like this lurking=20
     <br>
      in the layer.=20
     <br>
     <br>
      Bruce=20
     <br>
     <br>
      In message: [meta-virtualization][PATCH] libvirt: remove obsolet depe=
nds to avahi=20
     <br>
      on 27/04/2026 Louis Rannou via <a href=3D"http://lists.yoctoproject.o=
rg" target=3D"_blank">lists.yoctoproject.org</a> wrote:=20
     <br>
     <br>
     <blockquote style=3D"margin:0px;border-left:3px solid rgb(204,204,204)=
;padding-left:10px">
      From: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" tar=
get=3D"_blank">louis.rannou@non.se.com</a>&gt;=20
      <br>
      <br>
       libvirt has removed support for avahi in version 5.5.0 in 2019:=20
      <br>
      <br>
       =C2=A0 * Remove Avahi mDNS support=20
      <br>
      <br>
       =C2=A0=C2=A0=C2=A0 This feature was never used outside of virt-manag=
er, which has itself=20
      <br>
       =C2=A0=C2=A0=C2=A0 stopped using it a while ago.=20
      <br>
      <br>
       Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.s=
e.com" target=3D"_blank">louis.rannou@non.se.com</a>&gt;=20
      <br>
       Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@semal=
ibre.com" target=3D"_blank">louis.rannou@semalibre.com</a>&gt;=20
      <br>
       ---=20
      <br>
       recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" target=3D=
"_blank">libvirt_git.bb</a> | 2 +-=20
      <br>
       1 file changed, 1 insertion(+), 1 deletion(-)=20
      <br>
      <br>
       diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.=
bb" target=3D"_blank">libvirt_git.bb</a> b/recipes-extended/libvirt/<a href=
=3D"http://libvirt_git.bb" target=3D"_blank">libvirt_git.bb</a>=20
      <br>
       index b5b0a5f2..34a1ff21 100644=20
      <br>
       --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" tar=
get=3D"_blank">libvirt_git.bb</a>=20
      <br>
       +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" tar=
get=3D"_blank">libvirt_git.bb</a>=20
      <br>
       @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234=
ee4d69f5fce4486a80fdaf4a4263 \=20
      <br>
       =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://COPYING.LESSE=
R;md5=3D4b54a1fd55a448865a0b32d41598759d&quot;=20
      <br>
       SECTION =3D &quot;console/tools&quot;=20
      <br>
      <br>
       -DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi parted cur=
l libpcap util-linux e2fsprogs pm-utils \=20
      <br>
       +DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 parted curl libp=
cap util-linux e2fsprogs pm-utils \=20
      <br>
       =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iptables dnsmasq readline libta=
sn1 libxslt-native acl libdevmapper libtirpc \=20
      <br>
       =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
ython3-docutils-native \=20
      <br>
       =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains(&#39;PACKA=
GECONFIG&#39;, &#39;polkit&#39;, &#39;shadow-native&#39;, &#39;&#39;, d)} \=
=20
      <br>
       --=20
      <br>
       2.53.0=20
      <br>
      <br>
     </blockquote>
     <br>
     <blockquote style=3D"margin:0px;border-left:3px solid rgb(204,204,204)=
;padding-left:10px">
      <br>
       -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=20
      <br>
       Links: You receive all messages sent to this group.=20
      <br>
       View/Reply Online (#9746): <a href=3D"https://lists.yoctoproject.org=
/g/meta-virtualization/message/9746" target=3D"_blank">https://lists.yoctop=
roject.org/g/meta-virtualization/message/9746</a>=20
      <br>
       Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119030=
694/1050810" target=3D"_blank">https://lists.yoctoproject.org/mt/119030694/=
1050810</a>=20
      <br>
       Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoc=
toproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproje=
ct.org</a>=20
      <br>
       Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtua=
lization/unsub" target=3D"_blank">https://lists.yoctoproject.org/g/meta-vir=
tualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>]=20
      <br>
       -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=20
      <br>
      <br>
     </blockquote>
    </div>
   </blockquote>
  </div>
 </div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000009a895065084401e--

