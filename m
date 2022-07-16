Return-Path: <linux_learner@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E76DC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 06:50:36 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (NAM12-DM6-obe.outbound.protection.outlook.com [40.92.22.40])
 by mx.groups.io with SMTP id smtpd.web08.3057.1657954233372029275
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Jul 2022 23:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=WFDh1r1d;
 spf=pass (domain: outlook.com, ip: 40.92.22.40,
 mailfrom: linux_learner@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nx7ugg3H9KzjiOVjSljH5lt28TgWlf6PHmEiTfQF+CFEvm+QeIZ87SOMx2L7asXQmmsQ7ab7sXMcVGnQJTn9Cma4bOTBCLhrW7duTyVts5UaPy1Rm5z8mKeW21kLwF0yp44dR6Ii2r7ByLWISHJHv3bb9RfcB5WGoZrLdSPAqQ9S//260mXMD/cayYABQXmD8V6B2HO9meSAVn3ekIGGgrCyjMQTlSpd7hFn23l8PnULS6sjRX61dSMM9r3YlLe6E2z2EMUliNsvqNTEepsXYgKjfcs3b14x8f9qnPjthCfNA2mbkPnHwoI4UfQVZbP6t1dbOXGWyzGdRocLCQrkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rlY397GDnbjfJ6njSVTXByd0frzoZdnQPxnAhXKcF8=;
 b=NU+MwGPlQBcIWtWYV71A2fASfI7dHHEdptx7U1AozTrmmraL2o13+HrkOB6+no+JsFrLjduMqk+U316TbvzKBnzAZLqCA2an8J+3Tah4bplrRKtXAVEjn2p9C6d1VsspX5SFvXrXPfNZtn1lwkjmv+acmvEjcYxXl+VR/jgy+LQW8GSD1PEF5iHMfvEpAzRTfPPwTQSKVszgQ+C2m/2HdXyouVAluOWTRw+DSfme9Rg0fmdRd998q/dA3Ik/VhS9H8hZsk5Mz9OANRqGyeXX47+dLcYCguzh+ld5UX2uKwYlWdhrzxvOkqdxocu4jMEazdx+3Dbuez5SQVKmywMBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rlY397GDnbjfJ6njSVTXByd0frzoZdnQPxnAhXKcF8=;
 b=WFDh1r1d30xgYqyyX+Wsombzs0oDlajrh31/lJZJVnb0yBRxIkKN9Ouwo7nlTh+0NCmoIbDM9le4ccVeSnyWKnyBVpCsyOhvuM5YkyrAFPqOSpGdVX/s/+ZVxUC5urTp6vqovzAbOQMCI7Il8fdIfIrSwSacVAky2qiS4AZwsi/UWVpZanvOMe8ssIhTVb6HqquWHgNvQI9xkfO9RpnKxuyIXigvWL+es9gvfLHm1KEBysPCzeE7YeqrwlVf/eKCNcrx+FSlk9TupVhw7J8sE/TkvpgWuoyExBQHLFajqSRuwhKUINltGIUilBgWs/bODvSB++jT2zXhqXHBlh3Y1A==
Received: from BY5PR14MB3893.namprd14.prod.outlook.com (2603:10b6:a03:1dc::15)
 by BY5PR14MB4115.namprd14.prod.outlook.com (2603:10b6:a03:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Sat, 16 Jul
 2022 06:50:31 +0000
Received: from BY5PR14MB3893.namprd14.prod.outlook.com
 ([fe80::a1e2:2e8d:4879:53c3]) by BY5PR14MB3893.namprd14.prod.outlook.com
 ([fe80::a1e2:2e8d:4879:53c3%8]) with mapi id 15.20.5438.019; Sat, 16 Jul 2022
 06:50:31 +0000
From: "Pra.. Dew.." <linux_learner@outlook.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: pthreads dependency error in building podman
Thread-Topic: pthreads dependency error in building podman
Thread-Index: AQHYmN+I3aimISXC70WeqS3bIiQmF62AjtVJ
Date: Sat, 16 Jul 2022 06:50:31 +0000
Message-ID: 
 <BY5PR14MB38931183FDDBF76A031B4EC7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
References: 
 <BY5PR14MB389313571AD8B0342EBB19E7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
In-Reply-To: 
 <BY5PR14MB389313571AD8B0342EBB19E7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [GR/0tvALq3FS41O6WRyFOYx2XsIeuXic]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b43df98-63e7-4223-b7e2-08da66f779ca
x-ms-traffictypediagnostic: BY5PR14MB4115:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RIMkr29s8GHfWncKjxDLVIPRYHkzQMR7LHqzkQX8BvBXaH5l+30vf6mJvAotTcCOOxxA1jvCi2DlUR1NDV/Y9M0LZ/Do+2lOEZ8OFpNJ4s5+DbqUnx3F5EuH4CptGiph8cRF4T54JMvoPy0tKF3fIjaDf6g9rTJeOWAiXN88meVOvRUhs0xg1sVNTiLRluFTdH0dblxpBCLlHsA7QxGpOAMhBYQS/wxFX2CKRLLY0ewXEmwe+ANHYf0Z3SCi34o2RteErwtc18MaCyTOj6ZlyHhgdwThE08Lzamg6a2CDkIJEZm9QwDnjxHt+6XEmcWDfWoOjJNzFpaBfFDDMFghogeNlC5CYkvpvrZce3d4FWnb/D5WN6oEoU0zdsepPR+uYKFMBKjnGVCUWcCSJjMAogmrwT2afTonjN9gFRbt3vaoWrnymLrcfx7MwyfSBiTsckmMF8hKYvqDA4wzbvebJTGxOHK5dnNRL2hK0ijBTsE2UhJGHRxH3hELd80y2/ClD8+IcJyQog34BWPQkPZHwTyiwofht7vUz52rIAJdHCnBs0nWl00vCYEjwe6f4OR+xwrAVZPBOaQwtnfAVd5lESVqr8D8NYcm3bMj8oe0TsVwwk06uZcwhiaVBJ/m/gVT6HX0Js1sOnzLqrgTu2q1ycUhzhrFD1KhkDuHJemYwasTEUNXIVOWW6twus26hhzq
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6ClAv5hcE5b/gibP1k8S1VStpAiutwT8uxBBLsmK2/cuH/iiFj/bhWW8ay++?=
 =?us-ascii?Q?24W1tsTcoE6Y2MDkQBt/xcdKEVETGLAnyVLYo+6S5SBUDbHZacWA2fnl9Raw?=
 =?us-ascii?Q?APVgGKYpEOoNLaB7sn5LQK6NFXCUUw7B1/C7JQNC9c7xTm9alO0F++tsH/48?=
 =?us-ascii?Q?xqvga3YcdrBvoNfQM6RqLT+Lgi3Tf4AWINe2GsStmbzM1viz8MrpMv1ek2vi?=
 =?us-ascii?Q?Zxeg4r1o+pN7Pi7b15sZszPrypxd9mFYvOvku6xqjSLbqvHUBfhgNsv32SSL?=
 =?us-ascii?Q?pbLttLGSN13TeW7Kkx2cUraeQ+AnaC/FDjD1QR5dppPeoP7iHPjQuaLqE9OA?=
 =?us-ascii?Q?xQOXoU3N4gLEsJz2KMk7RVezIblYrgJKZdUTy+mYafUPEsbxmptAMo6taWWk?=
 =?us-ascii?Q?NmgAn3Py8a29DuCGCxj3eFVZ41GGOq5JjKcgdigQgI87Rn5v4F6spix50A8g?=
 =?us-ascii?Q?h/FrR6MT51Cxxw73WPnjVF25287GKStkXjIbk53O70DfL/CYdbhYSBnzD+e3?=
 =?us-ascii?Q?hKOAT2k0WRyUQ6rWDAOD2NWKmdRjH3jPJw+rg6iHG1uslRn5KDh4ldkSuDXu?=
 =?us-ascii?Q?3ZwkUlYL4La9zsc0wyJwgSHkJfSL8CWq/WgVsFB54VUEywMppMu3n6dnTsWW?=
 =?us-ascii?Q?INlc7n+RzssgUHcqsR23w1os6rTulEVP6YSGoB7XgYxqf6OJp/qZ+fvPUauD?=
 =?us-ascii?Q?3kCmmL8pcV+V4dEFjfFPuW6m49g3o5dodDB2u1mQJAoqrltTQw8DV+iD+Vbx?=
 =?us-ascii?Q?nuFV6QwxVFwlFMMSxO4sBdIca9+Nv8UbLFFDPhYoEOcWjEm25s8hAP3nfYbu?=
 =?us-ascii?Q?m3NC0WseJQVrfnx814y3y5aaGxGJV+A8g56Q3wfEkNnGJHxVGZtqOEfgx/UM?=
 =?us-ascii?Q?RNeLNc3wGTtcrAQaoqYlr5RCZaialJrbqGhAAKMnn2qMKktOk9enom6rsoTS?=
 =?us-ascii?Q?8hZx3MJPjZehCjJJtNJMfKPpyKPRJrtJoBcMjOaVle/gLonWROXxpKRnzb0r?=
 =?us-ascii?Q?Fx3iRtWLLHRSG3/NkeCgvhvHdlD6LJpY9KiKAZLb1E/1we8eB6yONSWDHg1h?=
 =?us-ascii?Q?21wIDqfstp5MpSpjUccOTHiWmVUwGtEwu7tui8PsIyoihN1zu3XnEUJWGiRq?=
 =?us-ascii?Q?otUX4aL8dclovHIjrLr8YW00OxYyOWBzzDoHLs2xmN7HCkdQgeJKq43SVfDh?=
 =?us-ascii?Q?4UvosEHP3fq4pJRIBxKiDFo51e2g/xFGNeluGrg0TRESk24+QY1/yutlxrc3?=
 =?us-ascii?Q?HLEfUc2eU3dqsPJeZBDAKYat5yLh4Q57LW8zCqCAXqbIxStY4oK4sGQJLDo/?=
 =?us-ascii?Q?pXE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY5PR14MB38931183FDDBF76A031B4EC7868A9BY5PR14MB3893namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB3893.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b43df98-63e7-4223-b7e2-08da66f779ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 06:50:31.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR14MB4115
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 16 Jul 2022 06:50:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7463

--_000_BY5PR14MB38931183FDDBF76A031B4EC7868A9BY5PR14MB3893namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



I added the meta-virtualization layer to a Yocto (Kirkstone) project using =
KAS. When I try to compile the project  I get the following errors. I was h=
oping that the layer should build cleanly since I have not modified anythin=
g in the layer. Tanks for all your guidance and help.

buM_iMH1g6GesQ1UE_c\n"
| HASH[link github.com/containernetworking/cni/cnitool]: "packagefile githu=
b.com/containernetworking/cni/pkg/types/020=3DoY1xAj97Tqs0jbqIHGIg\n"
| HASH[link github.com/containernetworking/cni/cnitool]: 803d1b283174051eaa=
86b7a946484a68a9626fcebff229bc3c414c4222c4badc

# github.com/containernetworking/cni/cnitool
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
| runtime/cgo(.text._cgo_sys_thread_start): unknown symbol __stack_chk_fail=
 in callarm64
| runtime/cgo(.text.x_cgo_init): unknown symbol malloc in callarm64
| runtime/cgo(.text.x_cgo_init): unknown symbol __errno_location in callarm=
64
| runtime/cgo(.text.x_cgo_init): unknown symbol strerror in callarm64

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s



--_000_BY5PR14MB38931183FDDBF76A031B4EC7868A9BY5PR14MB3893namp_
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
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I added the meta-virtualization layer to a Yocto (Ki=
rkstone) project using KAS. When I try to compile the project &nbsp;I get t=
he following errors. I was hoping that the layer should build cleanly since=
 I have not modified anything in the layer.
 Tanks for all your guidance and help.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">buM_iMH1g6GesQ1UE_c\n&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| HASH[link github.com/containernetworking/cni/cnito=
ol]: &quot;packagefile github.com/containernetworking/cni/pkg/types/020=3Do=
Y1xAj97Tqs0jbqIHGIg\n&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| HASH[link github.com/containernetworking/cni/cnito=
ol]: 803d1b283174051eaa86b7a946484a68a9626fcebff229bc3c414c4222c4badc
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># github.com/containernetworking/cni/cnitool<o:p></o=
:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.fatalf): unknown symbol fputs in=
 callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.fatalf): unknown symbol __vfprin=
tf_chk in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.fatalf): unknown symbol fputc in=
 callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.x_cgo_notify_runtime_init_done):=
 unknown symbol pthread_mutex_lock in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.x_cgo_notify_runtime_init_done):=
 unknown symbol pthread_cond_broadcast in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.x_cgo_notify_runtime_init_done):=
 unknown symbol pthread_mutex_unlock in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_try_pthread_create): unknow=
n symbol pthread_create in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_try_pthread_create): unknow=
n symbol pthread_detach in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_try_pthread_create): unknow=
n symbol __stack_chk_fail in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_try_pthread_create): unknow=
n symbol nanosleep in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.threadentry): unknown symbol fre=
e in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol sigfillset in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol pthread_sigmask in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol pthread_attr_init in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol pthread_attr_getstacksize in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol pthread_sigmask in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol strerror in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text._cgo_sys_thread_start): unknown =
symbol __stack_chk_fail in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.x_cgo_init): unknown symbol mall=
oc in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.x_cgo_init): unknown symbol __er=
rno_location in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal">| runtime/cgo(.text.x_cgo_init): unknown symbol stre=
rror in callarm64<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BY5PR14MB38931183FDDBF76A031B4EC7868A9BY5PR14MB3893namp_--

