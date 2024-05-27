Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536BAC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 13:30:43 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.27697.1716816633829159854
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 May 2024 06:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout09.t-online.de (Postfix) with SMTP id 5A56D57E7F;
	Mon, 27 May 2024 15:30:31 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.219]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBaQo-1tOVWq0; Mon, 27 May 2024 15:30:31 +0200
Date: Mon, 27 May 2024 15:31:10 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH] linux-yocto_virtualization: adjust
 path for scc files
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <Y7C5ES.CCGXXL79A09X@t-online.de>
In-Reply-To: <CADkTA4OJ9p8f0nfq2wU7uv5dYKHvfHKQ71ifgv6hzXmkLmFi=w@mail.gmail.com>
References: <20240527131755.1903448-1-f_l_k@t-online.de>
	<CADkTA4OJ9p8f0nfq2wU7uv5dYKHvfHKQ71ifgv6hzXmkLmFi=w@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yej3+II7SkxIOutPG6Yv"
X-TOI-EXPURGATEID: 150726::1716816631-3F7FC3C7-39965619/0/0 CLEAN NORMAL
X-TOI-MSGID: ad8aaf54-dcda-492a-a739-95af0afd7b36
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 13:30:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8768

--=-yej3+II7SkxIOutPG6Yv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry, I missed that.

On Mon, May 27 2024 at 09:22:29 AM -04:00:00, Bruce Ashfield=20
<bruce.ashfield@gmail.com> wrote:
> Martin already sent this patch, and I have a similar one that I did=20
> as well.
>=20
> As I was saying on the list late last week, I've been on vacation for
> the past week and a half and have most of the recent breakage fixed,
> but it needs more testing before I push the changes.
>=20
> Cheers,
>=20
> Bruce
>=20
> On Mon, May 27, 2024 at 9:17=E2=80=AFAM Markus Volk via=20
> lists.yoctoproject.org
> <f_l_k=3Dt-online.de@lists.yoctoproject.org=20
> <mailto:f_l_k=3Dt-online.de@lists.yoctoproject.org>> wrote:
>>=20
>>  this avoids:
>>  | ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not=20
>> found, this will cause configuration failures.
>>  | ERROR: Check the SRC_URI for meta-data repositories or=20
>> directories that may be missing
>>  | ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   recipes-kernel/linux/linux-yocto_virtualization.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>>  diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc=20
>> b/recipes-kernel/linux/linux-yocto_virtualization.inc
>>  index 9a6554d1..5edaef94 100644
>>  --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
>>  +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
>>  @@ -21,12 +21,12 @@ def kernel_cache_cond_feature(src_uri,feature):
>>       if kernel_cache:
>>          return feature
>>=20
>>  -    return "../recipe-sysroot-native/kcfg/" + feature
>>  +    return "../../recipe-sysroot-native/kcfg/" + feature
>>=20
>>   # no conditional, just use the yocto-kernel-cache addition, yes
>>   # the src_uri isn't used, but we may need to check it in the future
>>   def kernel_cache_feature(src_uri,feature):
>>  -    return "../recipe-sysroot-native/kcfg/" + feature
>>  +    return "../../recipe-sysroot-native/kcfg/" + feature
>>=20
>>   def distro_cond_feature(feature_fragment,distro_feature,d):
>>       import bb
>>  --
>>  2.44.0
>>=20
>>=20
>>=20
>>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8767):=20
> <https://lists.yoctoproject.org/g/meta-virtualization/message/8767>
> Mute This Topic: <https://lists.yoctoproject.org/mt/106329585/3618223>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org=20
> <mailto:meta-virtualization+owner@lists.yoctoproject.org>
> Unsubscribe:=20
> <https://lists.yoctoproject.org/g/meta-virtualization/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-yej3+II7SkxIOutPG6Yv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Sorry, I missed that.</div></div><=
div id=3D"geary-quote" dir=3D"auto"><br>On Mon, May 27 2024 at 09:22:29 AM =
-04:00:00, Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt; wrote:<br><block=
quote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-sp=
aces;">Martin already sent this patch, and I have a similar one that I did =
as well.

As I was saying on the list late last week, I've been on vacation for
the past week and a half and have most of the recent breakage fixed,
but it needs more testing before I push the changes.

Cheers,

Bruce

On Mon, May 27, 2024 at 9:17=E2=80=AFAM Markus Volk via lists.yoctoproject.=
org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.yoctoproject.org">f_l_k=3Dt=
-online.de@lists.yoctoproject.org</a>&gt; wrote:
<blockquote>
 this avoids:
 | ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found,=
 this will cause configuration failures.
 | ERROR: Check the SRC_URI for meta-data repositories or directories that =
may be missing
 | ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  recipes-kernel/linux/linux-yocto_virtualization.inc | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

 diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes=
-kernel/linux/linux-yocto_virtualization.inc
 index 9a6554d1..5edaef94 100644
 --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
 +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
 @@ -21,12 +21,12 @@ def kernel_cache_cond_feature(src_uri,feature):
      if kernel_cache:
         return feature

 -    return "../recipe-sysroot-native/kcfg/" + feature
 +    return "../../recipe-sysroot-native/kcfg/" + feature

  # no conditional, just use the yocto-kernel-cache addition, yes
  # the src_uri isn't used, but we may need to check it in the future
  def kernel_cache_feature(src_uri,feature):
 -    return "../recipe-sysroot-native/kcfg/" + feature
 +    return "../../recipe-sysroot-native/kcfg/" + feature

  def distro_cond_feature(feature_fragment,distro_feature,d):
      import bb
 --
 2.44.0


=20

</blockquote>

<div>--=20
</div>- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#8767): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8767">https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8767</a>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/106329585/361=
8223">https://lists.yoctoproject.org/mt/106329585/3618223</a>
Group Owner: <a href=3D"mailto:meta-virtualization+owner@lists.yoctoproject=
.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a=
 href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-yej3+II7SkxIOutPG6Yv--


