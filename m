Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD53C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 01:52:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.48803.1658281958457227426
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 18:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IQhorbfm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=420097caec=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26K1p9QZ003236;
	Wed, 20 Jul 2022 01:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/ZD5F2CCQBS1Oet/gREEcafsbInDE7HGNwJjQZPLTCs=;
 b=IQhorbfmFHZPLhp47MUoVFiWrUaiJ+2ZQiGDJy24AiUjQMWq/xls0XAFF22LLTN2qnpA
 gkl360QfFWaO4MA4jmwxbV1PCZoRSvfMOtosBzV3nl2AYga70gvxIUXASjTZovhv5xLR
 RNeo4VgmLI3cn6F4VUxycPlAa67vR8qHg3phmqzJQ8chc6UcCSc0DuFh5CyYPYciMeeH
 INM+JCJWK9N/GEQMrQmJ0g/u1AHa3mmXr7BjT67CXGCDDfjLNy1A7I4hhmhQMb04znUl
 fIeXPMaJpeWvHR4ma+/itPorbJZaPOCd/muw0mdTHQ3Scs5NppYKyJZSKgPxpMSK9TeH 6Q==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbptnaph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 01:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/9hraT+xUM0vf4psGm5IXc3FU5rozikRiBwHPKLAhHh8JmdPbQe3tuh7cgyrwGkwnc6gOUsPzxoFbdn+i5DSJIu8Fgm9TUhhFbn8EAml3ovcv9/zQL3U5DYzDPTk5tHx+lrje/wMqm2hg89pKQzcfovbRsGUtvBqkaye7yFkMgPR8a8Utre44MjNg8l+kEAFMBBJCP+nDDuCK5IGbunbCBrMHlA4nBNeBfQSuEwj7sSMZJiv0H9ITKKqoAQr44Ty8r7qyaANhMveRbizKaMMqU8SxDPA8V62M6QXQ7nP1WgDtr5EK6oVRJmVKsTJeqdEw1o4vPLbWB5Md/eZcSmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZD5F2CCQBS1Oet/gREEcafsbInDE7HGNwJjQZPLTCs=;
 b=Ug2E7uP0B3QDO2ozmDJrhCE7jBYCPZ/HiNArk3P7J/VL6PTFMbLOtvS6ykMVRE5qSu4xCyUl7AgHpK3WcW6oUudXElSdq7bTs/6E1Zrvt6DOsoHTd3g37Ox7Qy4htlCizsYcVLTfoHVd+KVSxFINBGEBtgJpCCHItQ7acOjeoIe1x6JbAQug/Ic+4oX8hpev5ww0oC/uYh/amKHpU/l8m/5aOyx+8Z1ErdTkmslFEa+scARM1rl+1zHR4LVm22ZyATCI/hrjCw36TEvO3HBDuEfDSGVNNsi7oWji0VnnSODORPglc7r+La+v/OGpzfalkD7yuDRxlU/mlfXNQyPjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 01:52:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99%5]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 01:52:33 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][master][kirkstone][PATCH] containerd:
 upgrade to 1.6.6
Thread-Topic: [meta-virtualization][master][kirkstone][PATCH] containerd:
 upgrade to 1.6.6
Thread-Index: AQHYkcr7crZW9xrrp0aLfzWzfMoPT61zACaAgBOSMg8=
Date: Wed, 20 Jul 2022 01:52:33 +0000
Message-ID: 
 <CO6PR11MB56023A170143AACC074938A2ED8E9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20220707062949.110913-1-Qi.Chen@windriver.com>
 <20220707145724.GB40251@gmail.com>
In-Reply-To: <20220707145724.GB40251@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 88a42bf6-e205-b007-4b29-f8bd4c464193
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e892326-0c3f-4ee7-7eb7-08da69f28396
x-ms-traffictypediagnostic: BYAPR11MB2680:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 67JRWF4+n0NIyN/0qNEu0Gu/yksmTjzoH2aL+159I38uKi3AHjXUHcouCZDBQtIPcf0Ku6SmJXKS++Pay7YSSLdE1nNLPpMcMEvnrLnKJhZE4HWCRDln/aQwDDAmz+xJJrNW/g3D+D46BnOi9NlEoPkMeFvMkvLL+8kXDNlUGDt4+0RifGe0ITdgAHjSGV1MqChON9as2IprU5DMDdPfwklaHGahDDTcaLLqK/+eRG1hrdl/MF4xugaEZy5obsodgiClV3nQ5KVGnK/Hdti/Odv0dbdt4piJ3VtgYPkYrGVBltRtgCbi/plRTdK24yYGW8jrFqZ/UqBvisoQL69Tg3Skzxn3h6AYkk5011j39sio2ah3ev3AoKL9pJnxC6e+cZO4tmYQQBcZsTuN6gYs6OF0tlV9uoeVrPvx+63su8FscT3sXHf10Hi07j0iyH37Kwmqzf5ivIt8bT1thH12pO1oPLd1N0q9fjYBQ7m6SGPeYUNpOKQnxNlbLUzG7AqkXpeoxzi0RBXJTjT61CcTHu0B5o1x8nlFO3W8hfwlNqzAeJixwd3S2MhCnryJ20Y//uoqU35YFvzZLLNB5QkUKgyfRG0llfJAK9bpkrRSmKLTy23YBrRIBsGywa7lVuMlMsUyf5xyQy3H8/Z8cgstCRnXHdyn1eHZY6XACG2IeLLwX7xP78LUPQ6D2yfYoCqNbrHC0GBmlE7yZIxjllaQENAGwtFbwMLbzHP0Fw21oPI23rltAKPK/DNkVZ3SGYkUBs/4cXwuEIyz/xz1zMnFK3nNTt8afxWD6XUpT8FYyd9pUdIcSJ7Syq19eLq5vkLU/gvduV3h2bvwXifNHxNfVs4l/IRKXhyJkvzZxNfdCFo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(366004)(376002)(396003)(346002)(186003)(2906002)(41300700001)(86362001)(4326008)(66946007)(6916009)(19627405001)(9686003)(316002)(26005)(66556008)(38100700002)(66476007)(66446008)(64756008)(5660300002)(76116006)(8676002)(7696005)(8936002)(53546011)(55016003)(33656002)(6506007)(83380400001)(71200400001)(966005)(52536014)(478600001)(166002)(38070700005)(91956017)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2hhq60rOoOqWsAuDHLdPsb1KbnaQ7P5jTPLxEsuXNGL8qJIPtJ9fy3B7htqg?=
 =?us-ascii?Q?qM3qczgL86nFVy3DKxeL/GCBQ1I2ro0BM169GBbvCik+YECRnCGBo7WEHr0P?=
 =?us-ascii?Q?4A07G6A1jBqMGJLvv70I0f6l9f6U4RvLrWHagB4JYEGleJ52M8zmsGHWO46s?=
 =?us-ascii?Q?jLRg3Tzn6QxbTYDsdhQuYlluwvpCy74P5/pcC66nW2IDeMyyv/DmWTVmvVgq?=
 =?us-ascii?Q?gGLC/6om/6tAHP7kCenoS4q3eKcT4c9a2AG+9d9mGht82FQIZlW9vR62U7bo?=
 =?us-ascii?Q?R7yQwOIvGc0Dk1ZrR3+WAT/xEHm6paX+Qsfw1sG4X/fgR8vknmP2TYkGwIOc?=
 =?us-ascii?Q?feI2HseO4/g5LBWn9OaFRLIUsTbtgfsPcSmZjhqV6qB5+z+cYMc9zCmB2H7j?=
 =?us-ascii?Q?YytG7HBpAcg7de3YScSGysMsO+PCmhW3WNBGj5Fx33cN+W4IAky9qZqnSs98?=
 =?us-ascii?Q?BhzxAfkOHVj4hn2uwB6jtu4lkFV24QYCaUIAR6ZpLfTZzOfnEYUpWmJBInTY?=
 =?us-ascii?Q?Jj8hdNMJBNgTIW9Dl2pqZ/4ZbRj7zd5Q/qeNkAqlh1MtWHBiQdhIZE53gYNF?=
 =?us-ascii?Q?kgvMlpqvvkgUwrm3vVIiFbz2Mw9nfgZScRIdarZJO6ABRyv1yt8UD1YKxJMP?=
 =?us-ascii?Q?hQc2MwADhRwyYZ1tcmadZhOOL5g+MVeJlw01t12GwDtxKkNcTFAo0aC5kFsm?=
 =?us-ascii?Q?qhSTwksf8e1bDg1oc1w8DHSHqjmHA0cLg9TtPJx2Q18Cr/WUxLz5lMnPKwD4?=
 =?us-ascii?Q?zwJ8KeXk1sh3ZkEc/wip7E53N3XYUgfNyzHGD5u/obHAbXN5TRNrKdMIGgWz?=
 =?us-ascii?Q?ANIZSqw4M/RCyzTuehFqITqn61eabROuvksptnfOiR0CfKVJmNSSCXbjNOss?=
 =?us-ascii?Q?jAlIy5itE5c5KlcsMlvjyBBfs6vY51GJervI9b9/bwf6MZetV87Lic0av+S4?=
 =?us-ascii?Q?F8KorELWKkpDVvIzD4PHnyqkVEF6fCSmIJlK6CCpIBwGrpN7QkyWEA7k2/cI?=
 =?us-ascii?Q?dQVGWJtTHHXd04Ltb6pLvz7sdmEK0MIpPBtB2dxd3521zDuXVvjFRuTBmM7j?=
 =?us-ascii?Q?8l/6dlJsnni3ef+qYcMNxRrOy/E8fvKwQNhKiBj5iEMCo5cOkfUNBYk8+Hwz?=
 =?us-ascii?Q?i54XQIZlsFyJfbBln5G1ACB4CylhnIQGeqfhC33EHNTuZ5G6IGGpXbd4M7UU?=
 =?us-ascii?Q?y/joSBSaoKdTv3cBUDKTT+0DyUs2S29sH07T5CpF+jRZZdbhxrvtDYVjVqgD?=
 =?us-ascii?Q?eYQHlgqEukYq1v/wekOnW4KtrH+vG0NMEpTYaLg5TdecO3fVwR6H3s5GndaZ?=
 =?us-ascii?Q?rR1W9z4S+UimloGKyuHXgy86dgVxSiKkcM25QxavEM/LMHklZbMDOzpq86Q3?=
 =?us-ascii?Q?Qwmnr/fr2zChU0zE16VxYJA+9Am5Vip7NKc9Bes3jkb81K84qU1vKlNeb3IT?=
 =?us-ascii?Q?u0QR/tTbDID75fUzUM4JMuuQfakb1lkX2iq9eJMPm7h8Zx//7QC/tppB3Qo0?=
 =?us-ascii?Q?CrYyMDrxijekAGzsrSSLRpTXe9p0oK7s5hV/GVTIr4JkTIkXyicz8L9RxGvA?=
 =?us-ascii?Q?bZmnptV2MBXhNra9COBiHt6A5KeSAK2VtPWUIqOo?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB56023A170143AACC074938A2ED8E9CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e892326-0c3f-4ee7-7eb7-08da69f28396
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 01:52:33.6558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 DF8km+pOspzkTtuUwjHldtqKrgiAdqgp43ATgXSG6V2WY2mcnZ/F9VV60MRfkES8edCQ190HgC99x8LGwQpOCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
X-Proofpoint-GUID: 6qcRlIbofdlFE_R2f5lX_Jj233ghruIc
X-Proofpoint-ORIG-GUID: 6qcRlIbofdlFE_R2f5lX_Jj233ghruIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_10,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207200006
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Jul 2022 01:52:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7470

--_000_CO6PR11MB56023A170143AACC074938A2ED8E9CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I just checked the commits on master-next. Hope everything is going well.
I also found two typos in the staged commits.

d73932c runc-docker: update to 1.3.3
f21dd94 runc: update to 1.3.3

The version should be '1.1.3' instead of '1.3.3'.

Regards,
Qi
________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Thursday, July 7, 2022 22:57
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: Re: [meta-virtualization][master][kirkstone][PATCH] containerd: up=
grade to 1.6.6

I have a batched set of package updates pending, I've pushed
them to master-next, with more to come in the next few days.

Once I merge them to master, I'll cherry-pick the equivalent
update to this to kirkstone.

Bruce

In message: [meta-virtualization][master][kirkstone][PATCH] containerd: upg=
rade to 1.6.6
on 06/07/2022 Chen Qi wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb           | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.=
bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index b0f92b12..c28b1510 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "containerd is a daemon to control runC, =
built for performance and
>                 support as well as checkpoint and restore for cloning and=
 live migration of containers."
>
>
> -SRCREV =3D "d12516713c315ea9e651eb1df89cf32ff7c8137c"
> +SRCREV =3D "10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1"
>  SRC_URI =3D "git://github.com/containerd/containerd;branch=3Drelease/1.6=
;protocol=3Dhttps \
>             file://0001-Add-build-option-GODEBUG-1.patch \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-sp=
eci.patch \
> @@ -15,8 +15,8 @@ SRC_URI =3D "git://github.com/containerd/containerd;bra=
nch=3Drelease/1.6;protocol=3Dht
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D1269f40c0d099c21a8=
71163984590d89"
>
> -CONTAINERD_VERSION =3D "v1.6.1"
> -CVE_VERSION =3D "1.6.1"
> +CONTAINERD_VERSION =3D "v1.6.6"
> +CVE_VERSION =3D "1.6.6"
>
>  EXTRA_OEMAKE +=3D "GODEBUG=3D1"
>
> @@ -56,7 +56,7 @@ do_compile() {
>                     metrics filters identifiers labels leases plugin serv=
er services \
>                     cmd cio containers namespaces oci events log reaper s=
ys rootfs nvidia seed apparmor seccomp \
>                     cap cri userns atomic ioutil os registrar seutil runt=
imeoptions netns \
> -                     shutdown schedcore tracing; do
> +                     shutdown schedcore tracing kmutex; do
>          if [ -d ${S}/src/import/${c} ]; then
>            ln -sfn ${S}/src/import/${c} ${S}/src/import/vendor/github.com=
/containerd/containerd/${c}
>          fi
> --
> 2.37.0
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7414): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7414
> Mute This Topic: https://lists.yoctoproject.org/mt/92223491/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_CO6PR11MB56023A170143AACC074938A2ED8E9CO6PR11MB5602namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Bruce,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I just checked the commits on master-next. Hope everything is going well.</=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I also found two typos in the staged commits.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
d73932c runc-docker: update to 1.3.3<br>
f21dd94 runc: update to 1.3.3</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The version should be '1.1.3' instead of '1.3.3'.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Qi<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Thursday, July 7, 2022 22:57<br>
<b>To:</b> Chen, Qi &lt;Qi.Chen@windriver.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-virtualization][master][kirkstone][PATCH] contain=
erd: upgrade to 1.6.6</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I have a batched set of package updates pending, I=
've pushed<br>
them to master-next, with more to come in the next few days.<br>
<br>
Once I merge them to master, I'll cherry-pick the equivalent<br>
update to this to kirkstone.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][master][kirkstone][PATCH] containerd: upg=
rade to 1.6.6<br>
on 06/07/2022 Chen Qi wrote:<br>
<br>
&gt; Signed-off-by: Chen Qi &lt;Qi.Chen@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../containerd/containerd-opencontainers_git.bb&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8 ++++----<br>
&gt;&nbsp; 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/containerd/containerd-opencontainers_g=
it.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb<br>
&gt; index b0f92b12..c28b1510 100644<br>
&gt; --- a/recipes-containers/containerd/containerd-opencontainers_git.bb<b=
r>
&gt; +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb<b=
r>
&gt; @@ -5,7 +5,7 @@ DESCRIPTION =3D &quot;containerd is a daemon to contro=
l runC, built for performance and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; support as well as checkpoint and restore for clo=
ning and live migration of containers.&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; <br>
&gt; -SRCREV =3D &quot;d12516713c315ea9e651eb1df89cf32ff7c8137c&quot;<br>
&gt; +SRCREV =3D &quot;10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1&quot;<br>
&gt;&nbsp; SRC_URI =3D &quot;git://github.com/containerd/containerd;branch=
=3Drelease/1.6;protocol=3Dhttps \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-Add-build-option-GODEBUG-1.patch">file://0001-Add-=
build-option-GODEBUG-1.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-spe=
ci.patch">
file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch</a> =
\<br>
&gt; @@ -15,8 +15,8 @@ SRC_URI =3D &quot;git://github.com/containerd/contai=
nerd;branch=3Drelease/1.6;protocol=3Dht<br>
&gt;&nbsp; LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://src/import/LICENSE;=
md5=3D1269f40c0d099c21a871163984590d89">file://src/import/LICENSE;md5=3D126=
9f40c0d099c21a871163984590d89</a>&quot;<br>
&gt;&nbsp; <br>
&gt; -CONTAINERD_VERSION =3D &quot;v1.6.1&quot;<br>
&gt; -CVE_VERSION =3D &quot;1.6.1&quot;<br>
&gt; +CONTAINERD_VERSION =3D &quot;v1.6.6&quot;<br>
&gt; +CVE_VERSION =3D &quot;1.6.6&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; EXTRA_OEMAKE +=3D &quot;GODEBUG=3D1&quot;<br>
&gt;&nbsp; <br>
&gt; @@ -56,7 +56,7 @@ do_compile() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metrics filters identifie=
rs labels leases plugin server services \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd cio containers namesp=
aces oci events log reaper sys rootfs nvidia seed apparmor seccomp \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cap cri userns atomic iou=
til os registrar seutil runtimeoptions netns \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shutdown schedcore trac=
ing; do<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shutdown schedcore trac=
ing kmutex; do<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -d ${S}/src=
/import/${c} ]; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -=
sfn ${S}/src/import/${c} ${S}/src/import/vendor/github.com/containerd/conta=
inerd/${c}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; -- <br>
&gt; 2.37.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7414): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7414">
https://lists.yoctoproject.org/g/meta-virtualization/message/7414</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/92223491=
/1050810">https://lists.yoctoproject.org/mt/92223491/1050810</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [bruce.ashfi=
eld@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB56023A170143AACC074938A2ED8E9CO6PR11MB5602namp_--

