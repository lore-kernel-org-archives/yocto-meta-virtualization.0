Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775A0C02197
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 05:09:55 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 1/1] runc-docker: upgrade 1.1.4 -> 1.1.12
To: meta-virtualization@lists.yoctoproject.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (72.163.220.6)
X-Originating-Platform: Windows Chrome 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 21:09:47 -0800
References: <Z5vLVAx4FJPTNmZU@gmail.com>
In-Reply-To: <Z5vLVAx4FJPTNmZU@gmail.com>
Message-ID: <12196.1738732187186511335@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="fsG0CNDfgCU8dGP4Wi9U"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 05:09:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9118

--fsG0CNDfgCU8dGP4Wi9U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

After this merge, 0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re=
.patch is getting failed for runc-opencontainers as this recipe also uses t=
his patch and not upgraded to 1.1.12 and still uses 1.1.4.

Is it possible to also upgrade runc-opencontainers to 1.1.12 to fix same CV=
Es which we fixed for runc-docker, else we may need to maintain two patches=
 for two different versions.

Thanks,
Ranjitsinh Rathod

--fsG0CNDfgCU8dGP4Wi9U
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello <span style=3D"color: #333333; font-family: system-ui, 'Segoe UI=
', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-se=
rif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color =
Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orph=
ans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: =
2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial; display: inline !impo=
rtant; float: none;">Bruce,</span></div>
<div>&nbsp;</div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">After this merge, <span style=3D"color: #333333; font-family=
: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation=
 Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI=
 Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: pre-wrap; background-color: #ffffff; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
 display: inline !important; float: none;">0001-Makefile-respect-GOBUILDFLA=
GS-for-runc-and-remove-re.patch is getting failed for runc-opencontainers a=
s this recipe also uses this patch and not upgraded to 1.1.12 and still use=
s 1.1.4.</span></span></div>
<div>&nbsp;</div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;">Is it possible to also upgrade <span style=3D"colo=
r: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', '=
Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Seg=
oe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; t=
ext-decoration-thickness: initial; text-decoration-style: initial; text-dec=
oration-color: initial; display: inline !important; float: none;"><span sty=
le=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetic=
a Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Em=
oji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 1=
6px; font-style: normal; font-variant-ligatures: normal; font-variant-caps:=
 normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: =
start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: =
#ffffff; text-decoration-thickness: initial; text-decoration-style: initial=
; text-decoration-color: initial; display: inline !important; float: none;"=
>runc-opencontainers to 1.1.12 to fix same CVEs which we fixed for runc-doc=
ker, else we may need to maintain two patches for two different versions.</=
span></span></span></span></div>
<div>&nbsp;</div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;"><span style=3D"color: #333333; font-family: system=
-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', =
Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'=
, 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: #ffffff; text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial; display=
: inline !important; float: none;"><span style=3D"color: #333333; font-fami=
ly: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberati=
on Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe =
UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: pre-wrap; background-color: #ffffff; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l; display: inline !important; float: none;">Thanks,</span></span></span></=
span></div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-=
wrap; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; display: inline !=
important; float: none;"><span style=3D"color: #333333; font-family: system=
-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', =
Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'=
, 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: #ffffff; text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial; display=
: inline !important; float: none;"><span style=3D"color: #333333; font-fami=
ly: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberati=
on Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe =
UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: pre-wrap; background-color: #ffffff; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l; display: inline !important; float: none;">Ranjitsinh Rathod</span></span=
></span></span></div>

--fsG0CNDfgCU8dGP4Wi9U--

