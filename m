Return-Path: <linux_learner@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BEBC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 06:03:10 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (NAM10-DM6-obe.outbound.protection.outlook.com [40.92.41.78])
 by mx.groups.io with SMTP id smtpd.web09.24021.1658124180750934365
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 17 Jul 2022 23:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=ZpXXAJET;
 spf=pass (domain: outlook.com, ip: 40.92.41.78,
 mailfrom: linux_learner@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqZS0MS56vlcWyUrSUZmd82ufWAwnl7ZBeYpjj6chXtM0L8wCCpB0sFkIbyswbAIWp7n1slke4TnzorFuOIHMwaVk/19+sgzk/nx1eEChntbTh0duFQ6ftU9RXSJ38+SpPF+YqKSeIOsQiZAdDYoxew+xLn30NBDuQQSMDbafFKAF43Su3gt/i2B7zMwLz3mIgbWXKlj0jqkphjQlRr+6kWfnYVUXCSZ2RiuwSSMBh9i4ioEJ4IA0i/mYtOEOaIxtmE3GZVtDNkDtRQnsYwkkBN4FrIdwJ3+mO1lkRgBmboqjUuza3zxLMpMuReXnTDgkv3VKdVHvxsFzYUn+3ZNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usfQM9AT0AI5VqHW07mrgE2CPmiqHcq/P/gfMvDVmt8=;
 b=dbb5DRUvhiayGVIDADXk/UuP8HXaiuOEkxxRdIgjZymD1zysN8l5VLdQAvhMN+VYibtwCrAiKS2UazseOe1gWSrj0/ghpDHZjcqDQNaAYWbS2N4kDuwSkJJTTg8kerbnMvC2x3p119rQNqfXpZaoI1LgsKehXqPEbRtk5iNWnLHX1fGLsJlaWPu+MFRhY6JexdCf0aIFLCGLdbOqzU+RYhmENNg1eUv5T/rAK3NwBaIJxaSKyVG61QblBWMJ9Pch8T80wZhX9LMv8xkO6nIYluSG7I/zfjTkHL+NtLJhWHeAVz5ljtvl4hJTZIWE5lRf8hHe7k0Mt1PkHnyBvB7DPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usfQM9AT0AI5VqHW07mrgE2CPmiqHcq/P/gfMvDVmt8=;
 b=ZpXXAJETf3NBFCzy9++sMsnhV4rf1OTK+cI5C98dm+4cFXYxHAm8iMaQpKNW8E3NEw78FSN/sNoIk7ZyB9GwdQc3xkL/SnHvDcw6LaP4icO0qD6Ixu1jT0Pu90ZygFyoD56aN89g5OfrLNtF7uGPQ1cxQHiqrqyUBWuUtqbnvFQOo6IWBqqy1fwBsuyO0naS9yReT4XIX1yhbW+LsWswd3lJxgDAsg1EuPlUdp0n+TP6jku2x72KhdhzSwRTGIfUmahZo2PYmBDlyhDLwwHW5P569J4mhf/28Xs8T+7RkC7uUHpUKsHbdQ6guLamCV+P06LX0u1XyIiofmVs+T9Ruw==
Received: from BY5PR14MB3893.namprd14.prod.outlook.com (2603:10b6:a03:1dc::15)
 by MN2PR14MB3421.namprd14.prod.outlook.com (2603:10b6:208:1a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 06:02:58 +0000
Received: from BY5PR14MB3893.namprd14.prod.outlook.com
 ([fe80::a1e2:2e8d:4879:53c3]) by BY5PR14MB3893.namprd14.prod.outlook.com
 ([fe80::a1e2:2e8d:4879:53c3%8]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 06:02:58 +0000
From: "Pra.. Dew.." <linux_learner@outlook.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Andrei Gherzan
	<andrei.gherzan@huawei.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] pthreads dependency error in building
 podman
Thread-Topic: [meta-virtualization] pthreads dependency error in building
 podman
Thread-Index: AQHYmN+I3aimISXC70WeqS3bIiQmF62AjtVJgAJZYACAALyQrw==
Date: Mon, 18 Jul 2022 06:02:58 +0000
Message-ID: 
 <BY5PR14MB3893EB9A81915490B3F068E9868C9@BY5PR14MB3893.namprd14.prod.outlook.com>
References: 
 <BY5PR14MB389313571AD8B0342EBB19E7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
 <BY5PR14MB38931183FDDBF76A031B4EC7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
 <CADkTA4Nw8iNm8rjR=BvOsdPjPFybn9eLQ--3cn9_Au6a2H80wA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Nw8iNm8rjR=BvOsdPjPFybn9eLQ--3cn9_Au6a2H80wA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [xzootBjm3MA12nkW37HgYvJahOl333+V]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37da1ea2-0eb8-401f-2ba7-08da68832a09
x-ms-traffictypediagnostic: MN2PR14MB3421:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Kli9mVoNjqDfmRLaD/MNwyCTokoMik8yctekgnezde7VeKHnwLJGRvYGRJciu4Pmnn9a33+jZ0xbd6Jg2cKStD+odyUCt+yZCGmjoUqL52qGiMZka4/SqdzgI5oG4fgKk368Jou6UiDaBQit69KJIQIVpHdO6xsdM5UciEEvYGwSMhyvYtxajjDu1IkiczlezB5uUmCyPoBiuHOJGlMdlj+a4qq6aXKaG5wz361qGESRECuzPxOh7an28Rzcjw+YlwUQZUIF8zz18tLn7qh8zQtxmdxB3+pQ7VO4RFXRh9XMjq0h/7Vx489/zLCMgKm2loIA4Zi0UMKLxWumFJ47rsx8jZNhoXjKNxShjceFizjNaORebsz5HfId6Xe9MKgXMLbIxLkAmBWlcksg8RFkLRHAHmJgOj0HJjr1tGlIv+z6uXJrX87HToDx4acVRiaSEeva3zQQE5AngEAluFWxIb5KxJL3STJb0undeqojE0x8Rm2Wcn2eNBt1Yp5QEdMJk2Ek5hLYrAr6DhM16UVmO9gxmCs7ShtE7ZqF5Yd6Epxv3MVoFErxuesTpXwW8zZWW8K57PhqS+NLArxm0FEDYAh10oYgFWHx9WxIfEve5nPoiGV8LbKo/2/D6C0IHUcwPh3BLJJlId1m6fdWJX2ecJIt+SJCmyDOeryNl3fEI/110EJQ+EyzmAJ9mz5ixr+9/p/k4e061LmgjilbbfyP0evGBKK3JpUcWz8AAL3Gg1E=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yPsyo5ZYU6Rtgcq1yp6ldOBUVNuU4teobCTYNm4LzDP6cvWsiLGifkOizN60?=
 =?us-ascii?Q?7njzuHaeh+mcRl8zXbDo9zrzV3Z+E4q6QZ8AX1Xa3n74CcxXnjvZnct4MqoQ?=
 =?us-ascii?Q?Dz+XsR3GsNcnu0o9UxR5lLnjAnUGN9dGLKS1EFPDkAorm8rG4LG4BZSZEgYn?=
 =?us-ascii?Q?uyqfD9GGKR40LKN6LOq42C9nK7MU2zE84RGMp+y+nbOI/03WMABd3iNP8IB+?=
 =?us-ascii?Q?Kz/4rgWPfbJecTzzZ2iSdorHNpBg0I6NHgs9MDU+BGJ24pm1AU7WbNrYOSEo?=
 =?us-ascii?Q?6cE49VzbxYzhpgS9sFXAc+jG8eTcxNpFnaBRS+EbJEas5DZciVpjEfflsO5E?=
 =?us-ascii?Q?A6K9cTSkYL5XCMlOF++Nw0nM+Hl3E0mlp8i73S+NXAZ8XnGNuxr7kEfWAYOw?=
 =?us-ascii?Q?rZBXdp+fwOd/Ov593WtATSsbg3XuHYVJfuy18CXb5AtfXYD3kVUG8AOCr1iX?=
 =?us-ascii?Q?5KUes34KL3w1nU9lD3fJQ4yQVowoZA6k/+coZjkwGZsis4Sz+dgLEU48A8Ee?=
 =?us-ascii?Q?MMU5gwUScO+Ru1aNfr+QeTzevCD6ix0BMofZ9MyP13bYZBE7E8bkCeHCOIBS?=
 =?us-ascii?Q?JbqWtbEcf1bKOaMo9eZWdulYUblkMgZ4Edet7kML+7iZlWwUoX1FhxSbz1BV?=
 =?us-ascii?Q?ITB7+k5Aul0JpHXMA/FE62yp7iJWvaRdi+3RSkJF33ez9M0CoKGQDvs1tjgq?=
 =?us-ascii?Q?qBIRlN5Ng+yU58ssOMZZkDlATE/gHfX2qbaxKNX5nrIpQ3isnDAw8oqx3g3K?=
 =?us-ascii?Q?04D1UCj+YqsdJDjlM2WfORVAPSLviZu16SORPiz4Ys01U+RLlaYa4y//KORt?=
 =?us-ascii?Q?W31eyIbNi52k69NvqrFz/sQm5Vm++Rt1CfEA4sKG8H9+dOzqPOWXHbeagvUw?=
 =?us-ascii?Q?eM2jH0Mksq434ZxgB7iAAak28b7oqWIT+jHKW4HFoG5Fmmdl+ggcmvtFjzeN?=
 =?us-ascii?Q?YPYzJJQPta0lFsiE+ffLwDYTUPSTgTqrtehnP+JUeze26PEGMwMewLijtTdx?=
 =?us-ascii?Q?hcRJvBkVVlt2epdoLbSvXAKEYRXd/0K7Y6f8aQomY7s+1hX18k8dw/Wlywku?=
 =?us-ascii?Q?k8kiFDsikNtaqs2GJuavNfclELiPvbRqoYeHe9EnKtF/TuUhjFSDoHvt2mRU?=
 =?us-ascii?Q?qcWH8XdHY+OMY1FsOoMDc+jCnPdj5EcAAeD3n85dwyqFyxwThZO0EQ6A3l2j?=
 =?us-ascii?Q?s078cIGqgZ2ZVuJOx7j+z+EfIL30JBSwdKePtK9haAco6EGfdiK7DsM5nUHg?=
 =?us-ascii?Q?mPvBQH64lls3/Eam5PE117OprCJQFGgBVJ3CEqtD5bh3eZohbh7SUICP7udJ?=
 =?us-ascii?Q?XqQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY5PR14MB3893EB9A81915490B3F068E9868C9BY5PR14MB3893namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB3893.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37da1ea2-0eb8-401f-2ba7-08da68832a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 06:02:58.1126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR14MB3421
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Jul 2022 06:03:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7465

--_000_BY5PR14MB3893EB9A81915490B3F068E9868C9BY5PR14MB3893namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you so much Bruce!


  1.  This is the commit id that I am using. I think this is from Kirkstone=
 -  d81de7af35cc4ac803c1567a8af1c5725f80ef7d
  2.  However, I am getting the same errors for podman



# github.com/containers/podman/v4/cmd/rootlessport

| net(.text._cgo_3c1cec0c9a4e_C2func_getaddrinfo): unknown symbol __errno_l=
ocation in callarm64

| net(.text._cgo_3c1cec0c9a4e_C2func_getaddrinfo): unknown symbol getaddrin=
fo in callarm64

| net(.text._cgo_3c1cec0c9a4e_Cfunc_freeaddrinfo): unknown symbol freeaddri=
nfo in callarm64

| net(.text._cgo_3c1cec0c9a4e_Cfunc_gai_strerror): unknown symbol gai_strer=
ror in callarm64

| runtime/cgo(.text.fatalf): unknown symbol fputs in callarm64

| runtime/cgo(.text.fatalf): unknown symbol __vfprintf_chk in callarm64

| runtime/cgo(.text.fatalf): unknown symbol fputc in callarm64

| runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthread=
_mutex_lock in callarm64

| runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthread=
_cond_broadcast in callarm64

| runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthread=
_mutex_unlock in callarm64

| runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_create=
 in callarm64

| runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_detach=
 in callarm64

| runtime/cgo(.text._cgo_try_pthread_create): unknown symbol __stack_chk_fa=
il in callarm64

| runtime/cgo(.text._cgo_try_pthread_create): unknown symbol nanosleep in c=
allarm64

| runtime/cgo(.text.threadentry): unknown symbol free in callarm64

| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol sigfillset in ca=
llarm64

| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sigmask =
in callarm64

| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_attr_ini=
t in callarm64

| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_attr_get=
stacksize in callarm64

| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sigmask =
in callarm64

| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol strerror in call=
arm64

| /home/work/azure_repos/azure-sphere-nre-yocto/build/tmp-qemuarm64-azure-s=
phere/work/cortexa57-azuresphere-linux/podman/4.0.1+gitAUTOINC+717edd7b84-r=
0/recipe-sysroot-native/usr/lib/aarch64-azuresphere-linux/go/pkg/tool/linux=
_amd64/link: too many errors

| make: *** [Makefile:398: bin/rootlessport] Error 2

| ERROR: oe_runmake failed

| WARNING: exit code 1 from a shell command.

ERROR: Task (/home/work/azure_repos/azure-sphere-nre-yocto/work/meta-virtua=
lization/recipes-containers/podman/podman_git.bb:do_compile)



Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

From: Bruce Ashfield<mailto:bruce.ashfield@gmail.com>
Sent: Sunday, July 17, 2022 11:42 AM
To: Pra.. Dew..<mailto:linux_learner@outlook.com>; Andrei Gherzan<mailto:an=
drei.gherzan@huawei.com>
Cc: meta-virtualization@lists.yoctoproject.org<mailto:meta-virtualization@l=
ists.yoctoproject.org>
Subject: Re: [meta-virtualization] pthreads dependency error in building po=
dman

On Sat, Jul 16, 2022 at 2:50 AM Pra.. Dew.. <linux_learner@outlook.com> wro=
te:
>
>
>
>
>
> I added the meta-virtualization layer to a Yocto (Kirkstone) project usin=
g KAS. When I try to compile the project  I get the following errors. I was=
 hoping that the layer should build cleanly since I have not modified anyth=
ing in the layer. Tanks for all your guidance and help.
>
>

master looks like it has a problem with a patch I recently merged from
Andrei, but I've fixed that here and pushed a change.

kirskstone doesn't have that change, so should be fine. I'm getting
patches for podman on kirkstone, so there are people building and
running without issues.

Bruce

>
> buM_iMH1g6GesQ1UE_c\n"
>
> | HASH[link github.com/containernetworking/cni/cnitool]: "packagefile git=
hub.com/containernetworking/cni/pkg/types/020=3DoY1xAj97Tqs0jbqIHGIg\n"
>
> | HASH[link github.com/containernetworking/cni/cnitool]: 803d1b283174051e=
aa86b7a946484a68a9626fcebff229bc3c414c4222c4badc
>
>
>
> # github.com/containernetworking/cni/cnitool
>
> | runtime/cgo(.text.fatalf): unknown symbol fputs in callarm64
>
> | runtime/cgo(.text.fatalf): unknown symbol __vfprintf_chk in callarm64
>
> | runtime/cgo(.text.fatalf): unknown symbol fputc in callarm64
>
> | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthre=
ad_mutex_lock in callarm64
>
> | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthre=
ad_cond_broadcast in callarm64
>
> | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthre=
ad_mutex_unlock in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_crea=
te in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_deta=
ch in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol __stack_chk_=
fail in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol nanosleep in=
 callarm64
>
> | runtime/cgo(.text.threadentry): unknown symbol free in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol sigfillset in =
callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sigmas=
k in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_attr_i=
nit in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_attr_g=
etstacksize in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sigmas=
k in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol strerror in ca=
llarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol __stack_chk_fa=
il in callarm64
>
> | runtime/cgo(.text.x_cgo_init): unknown symbol malloc in callarm64
>
> | runtime/cgo(.text.x_cgo_init): unknown symbol __errno_location in calla=
rm64
>
> | runtime/cgo(.text.x_cgo_init): unknown symbol strerror in callarm64
>
>
>
> Sent from Mail for Windows
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7463): https://nam12.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fme=
ssage%2F7463&amp;data=3D05%7C01%7C%7C381955eaa922446abfb208da68242517%7C84d=
f9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637936801697321806%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000%7C%7C%7C&amp;sdata=3DvO1fmfxv8WMe%2FB19SNS%2BTttVWdb4busK%2Bc46zx2qS=
B8%3D&amp;reserved=3D0
> Mute This Topic: https://nam12.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.yoctoproject.org%2Fmt%2F92416761%2F1050810&amp;data=3D05%=
7C01%7C%7C381955eaa922446abfb208da68242517%7C84df9e7fe9f640afb435aaaaaaaaaa=
aa%7C1%7C0%7C637936801697321806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DcLStJNelKn8AvVQRy2p3cDARSBKIcXUDKU2joYUEde4%3D&amp;reserved=3D0
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Funsub&amp;data=
=3D05%7C01%7C%7C381955eaa922446abfb208da68242517%7C84df9e7fe9f640afb435aaaa=
aaaaaaaa%7C1%7C0%7C637936801697321806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;s=
data=3DRePKfqhP8BRmJ5Fk%2B8YdP1GNrHdKlhQVbnQNZDLYLlQ%3D&amp;reserved=3D0 [b=
ruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


--_000_BY5PR14MB3893EB9A81915490B3F068E9868C9BY5PR14MB3893namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1143935201;
	mso-list-type:hybrid;
	mso-list-template-ids:-1779400592 -1 67698713 67698715 67698703 67698713 6=
7698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Thank you so much Bruce!</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">This is the commit id that I am using. I think this is from Kirkstone=
 - &nbsp;d81de7af35cc4ac803c1567a8af1c5725f80ef7d</li><li class=3D"MsoListP=
aragraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">However, I am g=
etting the same errors for podman</li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph"># github.com/containers/podman/v4/cmd/rootles=
sport</p>
<p class=3D"MsoListParagraph">| net(.text._cgo_3c1cec0c9a4e_C2func_getaddri=
nfo): unknown symbol __errno_location in callarm64</p>
<p class=3D"MsoListParagraph">| net(.text._cgo_3c1cec0c9a4e_C2func_getaddri=
nfo): unknown symbol getaddrinfo in callarm64</p>
<p class=3D"MsoListParagraph">| net(.text._cgo_3c1cec0c9a4e_Cfunc_freeaddri=
nfo): unknown symbol freeaddrinfo in callarm64</p>
<p class=3D"MsoListParagraph">| net(.text._cgo_3c1cec0c9a4e_Cfunc_gai_strer=
ror): unknown symbol gai_strerror in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.fatalf): unknown symbol f=
puts in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.fatalf): unknown symbol _=
_vfprintf_chk in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.fatalf): unknown symbol f=
putc in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.x_cgo_notify_runtime_init=
_done): unknown symbol pthread_mutex_lock in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.x_cgo_notify_runtime_init=
_done): unknown symbol pthread_cond_broadcast in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.x_cgo_notify_runtime_init=
_done): unknown symbol pthread_mutex_unlock in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_try_pthread_create):=
 unknown symbol pthread_create in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_try_pthread_create):=
 unknown symbol pthread_detach in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_try_pthread_create):=
 unknown symbol __stack_chk_fail in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_try_pthread_create):=
 unknown symbol nanosleep in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text.threadentry): unknown sym=
bol free in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_sys_thread_start): u=
nknown symbol sigfillset in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_sys_thread_start): u=
nknown symbol pthread_sigmask in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_sys_thread_start): u=
nknown symbol pthread_attr_init in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_sys_thread_start): u=
nknown symbol pthread_attr_getstacksize in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_sys_thread_start): u=
nknown symbol pthread_sigmask in callarm64</p>
<p class=3D"MsoListParagraph">| runtime/cgo(.text._cgo_sys_thread_start): u=
nknown symbol strerror in callarm64</p>
<p class=3D"MsoListParagraph">| /home/work/azure_repos/azure-sphere-nre-yoc=
to/build/tmp-qemuarm64-azure-sphere/work/cortexa57-azuresphere-linux/podman=
/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/usr/lib/aarch64-azure=
sphere-linux/go/pkg/tool/linux_amd64/link:
 too many errors</p>
<p class=3D"MsoListParagraph">| make: *** [Makefile:398: bin/rootlessport] =
Error 2</p>
<p class=3D"MsoListParagraph">| ERROR: oe_runmake failed</p>
<p class=3D"MsoListParagraph">| WARNING: exit code 1 from a shell command.<=
/p>
<p class=3D"MsoListParagraph">ERROR: Task (/home/work/azure_repos/azure-sph=
ere-nre-yocto/work/meta-virtualization/recipes-containers/podman/podman_git=
.bb:do_compile)</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:bruce.ashfield@gmail.com">Bruce Ashfield</a><br>
<b>Sent: </b>Sunday, July 17, 2022 11:42 AM<br>
<b>To: </b><a href=3D"mailto:linux_learner@outlook.com">Pra.. Dew..</a>; <a=
 href=3D"mailto:andrei.gherzan@huawei.com">
Andrei Gherzan</a><br>
<b>Cc: </b><a href=3D"mailto:meta-virtualization@lists.yoctoproject.org">me=
ta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject: </b>Re: [meta-virtualization] pthreads dependency error in buil=
ding podman</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On Sat, Jul 16, 2022 at 2:50 AM Pra.. Dew.. &lt;linu=
x_learner@outlook.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I added the meta-virtualization layer to a Yocto (Kirkstone) project u=
sing KAS. When I try to compile the project&nbsp; I get the following error=
s. I was hoping that the layer should build cleanly since I have not modifi=
ed anything in the layer. Tanks for all
 your guidance and help.<br>
&gt;<br>
&gt;<br>
<br>
master looks like it has a problem with a patch I recently merged from<br>
Andrei, but I've fixed that here and pushed a change.<br>
<br>
kirskstone doesn't have that change, so should be fine. I'm getting<br>
patches for podman on kirkstone, so there are people building and<br>
running without issues.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; buM_iMH1g6GesQ1UE_c\n&quot;<br>
&gt;<br>
&gt; | HASH[link github.com/containernetworking/cni/cnitool]: &quot;package=
file github.com/containernetworking/cni/pkg/types/020=3DoY1xAj97Tqs0jbqIHGI=
g\n&quot;<br>
&gt;<br>
&gt; | HASH[link github.com/containernetworking/cni/cnitool]: 803d1b2831740=
51eaa86b7a946484a68a9626fcebff229bc3c414c4222c4badc<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; # github.com/containernetworking/cni/cnitool<br>
&gt;<br>
&gt; | runtime/cgo(.text.fatalf): unknown symbol fputs in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.fatalf): unknown symbol __vfprintf_chk in callarm6=
4<br>
&gt;<br>
&gt; | runtime/cgo(.text.fatalf): unknown symbol fputc in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pt=
hread_mutex_lock in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pt=
hread_cond_broadcast in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pt=
hread_mutex_unlock in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_c=
reate in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_d=
etach in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol __stack_c=
hk_fail in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol nanosleep=
 in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.threadentry): unknown symbol free in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol sigfillset =
in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sig=
mask in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_att=
r_init in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_att=
r_getstacksize in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sig=
mask in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol strerror in=
 callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol __stack_chk=
_fail in callarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.x_cgo_init): unknown symbol malloc in callarm64<br=
>
&gt;<br>
&gt; | runtime/cgo(.text.x_cgo_init): unknown symbol __errno_location in ca=
llarm64<br>
&gt;<br>
&gt; | runtime/cgo(.text.x_cgo_init): unknown symbol strerror in callarm64<=
br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Sent from Mail for Windows<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7463): <a href=3D"https://nam12.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtu=
alization%2Fmessage%2F7463&amp;amp;data=3D05%7C01%7C%7C381955eaa922446abfb2=
08da68242517%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C63793680169732180=
6%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DvO1fmfxv8WMe%2FB19SNS%2BT=
ttVWdb4busK%2Bc46zx2qSB8%3D&amp;amp;reserved=3D0">
https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F7463&amp;amp;data=3D0=
5%7C01%7C%7C381955eaa922446abfb208da68242517%7C84df9e7fe9f640afb435aaaaaaaa=
aaaa%7C1%7C0%7C637936801697321806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;s=
data=3DvO1fmfxv8WMe%2FB19SNS%2BTttVWdb4busK%2Bc46zx2qSB8%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://nam12.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.yoctoproject.org%2Fmt%2F92416761%2F1050810&=
amp;amp;data=3D05%7C01%7C%7C381955eaa922446abfb208da68242517%7C84df9e7fe9f6=
40afb435aaaaaaaaaaaa%7C1%7C0%7C637936801697321806%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&amp;amp;sdata=3DcLStJNelKn8AvVQRy2p3cDARSBKIcXUDKU2joYUEde4%3D&amp;a=
mp;reserved=3D0">
https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fmt%2F92416761%2F1050810&amp;amp;data=3D05%7C01%7C%7C38195=
5eaa922446abfb208da68242517%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C63=
7936801697321806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DcLStJNelKn=
8AvVQRy2p3cDARSBKIcXUDKU2joYUEde4%3D&amp;amp;reserved=3D0</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://nam12.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fun=
sub&amp;amp;data=3D05%7C01%7C%7C381955eaa922446abfb208da68242517%7C84df9e7f=
e9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637936801697321806%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0%7C%7C%7C&amp;amp;sdata=3DRePKfqhP8BRmJ5Fk%2B8YdP1GNrHdKlhQVbnQNZDLYLlQ%3D=
&amp;amp;reserved=3D0">
https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fmeta-virtualization%2Funsub&amp;amp;data=3D05%7C01%7C=
%7C381955eaa922446abfb208da68242517%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%=
7C0%7C637936801697321806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DRe=
PKfqhP8BRmJ5Fk%2B8YdP1GNrHdKlhQVbnQNZDLYLlQ%3D&amp;amp;reserved=3D0</a>
 [bruce.ashfield@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BY5PR14MB3893EB9A81915490B3F068E9868C9BY5PR14MB3893namp_--

