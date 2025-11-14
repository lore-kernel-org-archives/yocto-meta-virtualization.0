Return-Path: <nvhieudt11@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6F1CDE00A
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 05:51:07 +0000 (UTC)
Subject: Re: [master][scarthgap][meta-virtualization][PATCH] kubernetes: skip textrel QA warning
To: meta-virtualization@lists.yoctoproject.org
From: nvhieudt11@gmail.com
X-Originating-Location: KR (203.247.149.151)
X-Originating-Platform: Windows Chrome 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 Nov 2025 21:50:58 -0800
References: <20240430061733.3518484-1-changqing.li@windriver.com> <ZjPU1aQrRd2rs7hR@gmail.com>
In-Reply-To: <ZjPU1aQrRd2rs7hR@gmail.com>
Message-ID: <445921.1763099458031068955@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="YRHDUUKgRS6EEGPFoDWk"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Nov 2025 05:51:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9440

--YRHDUUKgRS6EEGPFoDWk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Changqing Li, Bruce!

My understanding is that CGO is disabled directly in the build script
because building statically can fail on certain environments that don=E2=80=
=99t
have all the required static libraries. However, for meta-layer builds
with Yocto, could we enable CGO and set -extldflags "-static"
so that we can apply some default security flags from Yocto, such as PIE an=
d RELRO?

https://git.yoctoproject.org/poky/plain/meta/conf/distro/include/security_f=
lags.inc?h=3Dscarthgap

Could there be any runtime issues when enabling CGO and building statically=
?
I hope to receive your feedback.
Hieu

--YRHDUUKgRS6EEGPFoDWk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi <span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', =
Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emo=
ji'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; b=
ackground-color: #ffffff; text-decoration-thickness: initial; text-decorati=
on-style: initial; text-decoration-color: initial; display: inline !importa=
nt; float: none;">Changqing Li, <span style=3D"color: #333333; font-family:=
 system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation =
Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI =
Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
white-space: pre-wrap; background-color: #ffffff; text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial; =
display: inline !important; float: none;">Bruce!<br /><br />My understandin=
g is that CGO is disabled directly in the build script</span></span></div>
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
important; float: none;">because building statically can fail on certain en=
vironments that don&rsquo;t </span></span></div>
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
important; float: none;">have all the required static libraries. However, f=
or meta-layer builds </span></span></div>
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
important; float: none;">with Yocto, could we enable CGO and set <code>-ext=
ldflags "-static"</code> </span></span></div>
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
important; float: none;">so that we can apply some default security flags f=
rom Yocto, such as PIE and RELRO?<br /></span></span></div>
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
important; float: none;"><a href=3D"https://git.yoctoproject.org/poky/plain=
/meta/conf/distro/include/security_flags.inc?h=3Dscarthgap" target=3D"_blan=
k" rel=3D"noopener">https://git.yoctoproject.org/poky/plain/meta/conf/distr=
o/include/security_flags.inc?h=3Dscarthgap</a></span></span></div>
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
important; float: none;">Could there be any runtime issues when enabling CG=
O and building statically?<br />I hope to receive your feedback.<br />Hieu<=
/span></span></div>
</div>

--YRHDUUKgRS6EEGPFoDWk--

