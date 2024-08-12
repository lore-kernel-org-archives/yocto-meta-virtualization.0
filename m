Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F31BC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 05:43:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.39812.1723441384262583319
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Aug 2024 22:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89547dcf27=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2Tbs7001268
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Aug 2024 22:43:03 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g01awj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Aug 2024 22:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk5MasK2PMIoy15X4Wz1wtSsFA0L3ajuFZLzLGyBsn4Gavy1lwj6jiRkIXZo87xntVLBxJqEx1rKxpWlPZvIVY+xJAbRHnwR3xYCRy58527wdi4gQx6EGE8Hqv1wwsqznQls0t2XIpIJJMZ2PGzl/MKvj2qj2XrUmsGNA8Uj9mpTHAD3suh63Ge83BbY8wQZP/C9SyP9KqwuYBuoRCs7IJIuhaBw70pJmcBEEbvFCUKoaJBHMoCqstDvruwHr0IwbhW0NknCQl+RhFaSplgU64yfv3ZVkgoP7qpgdjUEwGdBoaC2msyOz8+J4mFS/sSVQ5aF9tNvwJ/lozdzuVpfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOcuNKDLqBFwG97WjurYvjgD5gzb6fgcbar/DvCLoVI=;
 b=d8bo9L/qswfOyjoAhM8yPoVYHnWKbV8ykHRusv5Rmk4CoKzNRxtEYRP3IIfrE+EXgDfYl1Lxmt3KKmdKUBN9c8k4jI44WhqNzHsHfDYzw3ltyOW8IZBG9NiD26ssUGT0HXth/t7KoNFpT60ljjtdjHbeBND/zyOkPlmEdhlNRauBd4cZKg0nLMeL1oxt5kluqwuqRB3NCdtsh6lHzemoZVfBTqO1DXIjdYY6DMD6XkgXRbCN5L/WRCSdPrbWQWBfyw3WVnTEelnrMKZ6IG07DqWTWMCg2g8Irbx0jdufE/tKlQKVzj74+wjNbx0oIAMKntHbyr5yndm69GM831VM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 12 Aug
 2024 05:42:59 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%3]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 05:42:58 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix
 CVE-2024-41110
Thread-Topic: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix
 CVE-2024-41110
Thread-Index: AQHa5LKH5T0E0hHSVE29CHwMNaXhDbIjK3Uo
Date: Mon, 12 Aug 2024 05:42:58 +0000
Message-ID: 
 <DM8PR11MB5703A77B073D06D6F51C319684852@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <17E7DAAD2DCE80AD.13344@lists.yoctoproject.org>
In-Reply-To: <17E7DAAD2DCE80AD.13344@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|SJ0PR11MB5867:EE_
x-ms-office365-filtering-correlation-id: 9ff6dd7a-fb87-4390-3fc2-08dcba919f4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-2?Q?CgDwW40DMJQtAoPh/zgxFcjkfJ4dsEc0RjuzSdB5eDHao7w6+3ivRK0yyj?=
 =?iso-8859-2?Q?QY1TY5Nfeo9jlhej9O8CwiWzR2fhNQ3DhWINUcYYZ0cDPPTTxCUS3V9rkv?=
 =?iso-8859-2?Q?PDQPu5yudd9S9/ZeHQQ6iWF+EAhOJppLczrDc1RCO9o8oheLNy8MKDBGBD?=
 =?iso-8859-2?Q?10L6M8giR1RBlBiImJVjYwGairOQG+cnbAfmR3PGEHt+Vq/M1HlEOO+HiJ?=
 =?iso-8859-2?Q?vua8SFLkwypZnf+o9WQKVfEF64h9+yS9uFYV0mDbQ7JG8Tif5zw0bDkECg?=
 =?iso-8859-2?Q?TitO2FfhTaw4WmEW4f2igZCED+CGBdkpU6Rh6q1fZf5clGMe0EH+0ZCePB?=
 =?iso-8859-2?Q?hQ20B+FTKsi+gdPF4iqHaLmYtU+OFa0CDazTR0t3l4MPqcHz0EeNJRIODo?=
 =?iso-8859-2?Q?XdlvHrIoyIFZDI3lf82x3IgwUAr2S1OtW4689YtOx3k5xuTLpv2bbnX57G?=
 =?iso-8859-2?Q?kEAM8AgnfGuB2PNF2EvTaJ6V8ort4aHkLcawVJCk0VMddQ7DXzv+AD5dWX?=
 =?iso-8859-2?Q?RZbwJfCYQTZn3RKIUItr4pjaxtsfmcT5LMgyh/wuJIn1Xh0pNVwxS/c+cV?=
 =?iso-8859-2?Q?hqvPd2GNy0DktAsLi2hzsohChtM2gRIiejiNqIqjME2tKL1NqdFIA2bULL?=
 =?iso-8859-2?Q?nxMOpU7Cz7nFWQdBv0ugmH66uJGRhrefMAQTB3cOQm3fZtGL3EnbIqw86k?=
 =?iso-8859-2?Q?63HWm5DIlFuflf0oHUuHf0KsL8XML/EJanM2defyJR4Jtllt2dHzAmCPmE?=
 =?iso-8859-2?Q?5+PWUsfQQU07ot9gHkd2C6d62Vt1XScYyPzDADAST4MjekwRol7brqvOsk?=
 =?iso-8859-2?Q?DckKNbORV5rhkUW48jgP/G6VqVhsxCE/PRyTyU3ISBcMS5+uFUTXWxBZ1N?=
 =?iso-8859-2?Q?d9UCjIvJbmM6M0RWF2kVLt/r0YFJt/Tg8omQI6tmgMaunfLLPJb5ykaYJ5?=
 =?iso-8859-2?Q?HvFi4pyve++1EzPuwEvirClV+c/Xnsmr+iF3uXFUnMQlqjiz3YKt+bei9m?=
 =?iso-8859-2?Q?h6/Se4oCZ/Il4PH32ztAdM7+ZOdY0QekL0ikuGb03yWtOHfV+skJkGLeyp?=
 =?iso-8859-2?Q?COmhkUPEltrik9GHdmmQ2K+S54OVBS1Zld8+e+wK9KFTS7JeqwaNm/3DIz?=
 =?iso-8859-2?Q?Te/5e0CshYeDKFdzLh4PqN7HmrLVF1qrNgEpjpz/nCOuY/rCo1xWofXlNd?=
 =?iso-8859-2?Q?IdVd9q2YasbfkC1ATBYVoWL2H4NGSXI6bjPfZmRr0Bood09e4IGxB5W8Wt?=
 =?iso-8859-2?Q?grn5e09surXvtnRT/rN5o60kKifom6+kywGmsHLcNQuC2IF/XbiS6xjXXN?=
 =?iso-8859-2?Q?65pYf3i3Z/7VMGfbSLjvaStx5VhJHBT5ya/EqQ5n+SrxBCtgXEyY5knKMc?=
 =?iso-8859-2?Q?EQVshE0Jv/Huzqz4lBMyUQtBcn8YZ2vw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?uwl2j744j2GDR+lX+nDBs31a8aNfZqhbldkRLjsoRRmz6AQQOdYsjs7i5R?=
 =?iso-8859-2?Q?6odxVTcTt/al/2kpVwLN2mqX8FhWZHFLeneACHga1bEWvdiSAQZG4SoeRr?=
 =?iso-8859-2?Q?tsHs1dlolVnBZIhWHQzrcTWficLjwOha3z0YnyKe6BcBU2L6oDjQFGlEpZ?=
 =?iso-8859-2?Q?XSqr7iDpz0vMEnz3+7OglsiKEy9Ha08z6Oj12I89ao6ewglUvvEKHPn+HN?=
 =?iso-8859-2?Q?bIUZfwYX5tpeKEurxRTHx4hfX0NBLn4IdSpmvZdsSS4RxGxw3wX2oXU2ll?=
 =?iso-8859-2?Q?acYmETLewaCjaUVTw+AlXAZJcIaCCqQoU5330yFkvNeeuP2l2UHGQKgVPT?=
 =?iso-8859-2?Q?aYW7bKLNAV3UcSdg7KHGDzkals0zZBaQ6V6Nc0mZ08MUQ9pJMNAhPuxG30?=
 =?iso-8859-2?Q?/jhzHv0/DJuul1P5U1sv5NV8ZT4QbrmvYIN61tUu5eWbDRYYpH4liI1NI0?=
 =?iso-8859-2?Q?DJJu88s7C4NgTTEAZATNlTKzCeANXrMUxkW6QrnmeVByJswuksIk7zlSoa?=
 =?iso-8859-2?Q?UFbiSZ6/eqch40r5HUvmFSAYUZzuYnBh8eafJCNX4L0j+XH0hnbrJAvb2I?=
 =?iso-8859-2?Q?4RTdGMa1BO0wM+UQSazeUfmBPocmaHncA+U8oI/XhMVyZQWIDn8wjDvtlX?=
 =?iso-8859-2?Q?zp0TQ5oQkRBqn36UW5+DZbrfxcCpklcBHqkK+1KYZZtgW1JH3JBeHrl1Dj?=
 =?iso-8859-2?Q?vPMBFD6mHoHpGXJsawzLF1CHiYvjPkolCqTvHAg2eEB1WS6hSbZhjmTGKp?=
 =?iso-8859-2?Q?1hZhto8vJFtqVcYccR2+JY4PUyXh384Ow2oR0UiBlUMjKkk+FJ5vxISOh1?=
 =?iso-8859-2?Q?uCptA0a4m+1vo+sbuV12vEsAkzghRmBC5w/U81HiT0B58SnG8xlBSj2UTN?=
 =?iso-8859-2?Q?WqofmOC7cjdeNxjYVsDFPPnI0kBkQwmss0pCVLBC9rfzaE9s7ndXCgs8tI?=
 =?iso-8859-2?Q?QOh9ar8VqoVMZqhn7qGYb0S5bV8Tv7LA2MmC495RzbnRNKc0uvPunJb3qP?=
 =?iso-8859-2?Q?g3WdSZ9p6nkSNzcbmscnV70KtTfnpZ2ZjlWcYeRtWCoaZEp7iJQZ7l1S0m?=
 =?iso-8859-2?Q?yswmIN7jEleMqB7C7FWbGXIwiCdsGf2xWkeUTehAUwWanxjMPkSK7OqFCQ?=
 =?iso-8859-2?Q?T3ANFT0sN9emoz06e7IH13bZ9xF50dpHSVz57KZE5o2shYGzaoxaqLb4cN?=
 =?iso-8859-2?Q?j0NFLxjNGyIsXYEYlWJQn1g3oTA6EHdcZihnehdK7odyzLnbxVaDMMYwDt?=
 =?iso-8859-2?Q?UoUAqlnbMuWyhmPym5JBcTdREdNbkeyGBEOmW1ZiRansnd9u6+/1YlCQoB?=
 =?iso-8859-2?Q?eLGJQ9pHrQ+e3VcpXsVRyJydmOpv+VJFZRoPFPq04Ah54DJHSJGLybOn3o?=
 =?iso-8859-2?Q?FYiCckSD4q0QbJEBGx+cEhm1KVF98dZ+vie7Tk9etrfNWRKK0v5FzKi7bK?=
 =?iso-8859-2?Q?pvv853Z8V5OTGLE4ecb6JYBEREfXcsT+e/+HTWVkWAbsNNPm2NdDYsaRsf?=
 =?iso-8859-2?Q?YbjvGaHixqrIhNtw5J445Ouom43B4OnDFYdlsRp03NQVUda9G8thpqjmmq?=
 =?iso-8859-2?Q?oNCyz4+jiI3W7n/SYLtMf5/BFjtKerp6IeAc5qBYXMnPJ1TxZCtlgIBhdO?=
 =?iso-8859-2?Q?TQMF8SuneZRevXar0XcqdRMzSn7tOEwYMnoLAmW2D+U8DLoe4T06eWMg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5703A77B073D06D6F51C319684852DM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff6dd7a-fb87-4390-3fc2-08dcba919f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 05:42:58.4914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymDPBQVKRleY1+NY9c5FK3uQEhL3DAaA3xQ6DYzRvTyDJD/KoMiLZHIUj936glN8D+NsI82y3s4GfnthlwDA+pTdHGncuikSmACJ3x6UKFljXpR7Q3YwQ6babkQCk+7e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
X-Proofpoint-ORIG-GUID: 7GTZgIbBcWVRlPirV89ZmFUF7c06bCxo
X-Proofpoint-GUID: 7GTZgIbBcWVRlPirV89ZmFUF7c06bCxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120042
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Aug 2024 05:43:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8859

--_000_DM8PR11MB5703A77B073D06D6F51C319684852DM8PR11MB5703namp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Reminder!!

Regards,
Archana
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Polampalli, Archana via lists.yoctoproject.=
org <archana.polampalli=3Dwindriver.com@lists.yoctoproject.org>
Sent: Friday, August 2, 2024 13:33
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix CVE-2=
024-41110

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 .../docker/files/CVE-2024-41110.patch         | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-41110.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-contain=
ers/docker/docker-moby_git.bb
index 0abb0b3f..706101d1 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -56,6 +56,7 @@ SRC_URI =3D "\
         file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch =
\
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc/i=
mport \
+        file://CVE-2024-41110.patch;patchdir=3Dsrc/import \
         "

 DOCKER_COMMIT =3D "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-41110.patch b/recipes=
-containers/docker/files/CVE-2024-41110.patch
new file mode 100644
index 00000000..6dd56a08
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-41110.patch
@@ -0,0 +1,176 @@
+From ccfe0a41d438053ee54f0478d3a77b090e40c379 Mon Sep 17 00:00:00 2001
+From: Jameson Hyde <jameson.hyde@docker.com>
+Date: Mon, 26 Nov 2018 14:15:22 -0500
+Subject: [PATCH] Authz plugin security fixes for 0-length content and path
+ validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+fix comments
+
+(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
+Signed-off-by: Pawe=B3 Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 2ac8a479c53d9b8e67c55f1e283da9d85d2b3415)
+Signed-off-by: Pawe=B3 Gronowski <pawel.gronowski@docker.com>
+
+CVE: CVE-2024-41110
+Upstream-Status: Backport [https://github.com/moby/moby/commit/ccfe0a41d43=
8053ee54f0478d3a77b090e40c379]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ pkg/authorization/authz.go           | 38 ++++++++++++++++++---
+ pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 1eb44315dd..4c2e90b251 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -8,6 +8,8 @@ import (
+       "io"
+       "mime"
+       "net/http"
++      "net/url"
++      "regexp"
+       "strings"
+
+       "github.com/containerd/log"
+@@ -53,10 +55,23 @@ type Ctx struct {
+       authReq *Request
+ }
+
++func isChunked(r *http.Request) bool {
++      // RFC 7230 specifies that content length is to be ignored if Trans=
fer-Encoding is chunked
++      if strings.ToLower(r.Header.Get("Transfer-Encoding")) =3D=3D "chunk=
ed" {
++              return true
++      }
++      for _, v :=3D range r.TransferEncoding {
++              if 0 =3D=3D strings.Compare(strings.ToLower(v), "chunked") =
{
++                      return true
++              }
++      }
++      return false
++}
++
+ // AuthZRequest authorized the request to the docker daemon using authZ p=
lugins
+ func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) erro=
r {
+       var body []byte
+-      if sendBody(ctx.requestURI, r.Header) && r.ContentLength > 0 && r.C=
ontentLength < maxBodySize {
++      if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || is=
Chunked(r)) && r.ContentLength < maxBodySize {
+               var err error
+               body, r.Body, err =3D drainBody(r.Body)
+               if err !=3D nil {
+@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *=
http.Request) error {
+       if sendBody(ctx.requestURI, rm.Header()) {
+               ctx.authReq.ResponseBody =3D rm.RawBody()
+       }
+-
+       for _, plugin :=3D range ctx.plugins {
+               log.G(context.TODO()).Debugf("AuthZ response using plugin %=
s", plugin.Name())
+
+@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadC=
loser, error) {
+       return nil, newBody, err
+ }
+
++func isAuthEndpoint(urlPath string) (bool, error) {
++      // eg www.test.com/v1.24/auth/optional?optional1=3Dsomething&option=
al2=3Dsomething<http://www.test.com/v1.24/auth/optional?optional1=3Dsomethi=
ng&optional2=3Dsomething> (version optional)
++      matched, err :=3D regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.=
*`, urlPath)
++      if err !=3D nil {
++              return false, err
++      }
++      return matched, nil
++}
++
+ // sendBody returns true when request/response body should be sent to Aut=
hZPlugin
+-func sendBody(url string, header http.Header) bool {
++func sendBody(inURL string, header http.Header) bool {
++      u, err :=3D url.Parse(inURL)
++      // Assume no if the URL cannot be parsed - an empty request will st=
ill be forwarded to the plugin and should be rejected
++      if err !=3D nil {
++              return false
++      }
++
+       // Skip body for auth endpoint
+-      if strings.HasSuffix(url, "/auth") {
++      isAuth, err :=3D isAuthEndpoint(u.Path)
++      if isAuth || err !=3D nil {
+               return false
+       }
+
+diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/auth=
z_unix_test.go
+index c9b18d96e9..275f1dd3d0 100644
+--- a/pkg/authorization/authz_unix_test.go
++++ b/pkg/authorization/authz_unix_test.go
+@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {
+
+ func TestSendBody(t *testing.T) {
+       var (
+-              url       =3D "nothing.com"
+               testcases =3D []struct {
++                      url         string
+                       contentType string
+                       expected    bool
+               }{
+@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {
+                               contentType: "",
+                               expected:    false,
+                       },
++                      {
++                              url:         "nothing.com/auth",
++                              contentType: "",
++                              expected:    false,
++                      },
++                      {
++                              url:         "nothing.com/auth",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    false,
++                      },
++                      {
++                              url:         "nothing.com/auth?p1=3Dtest",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    false,
++                      },
++                      {
++                              url:         "nothing.com/test?p1=3D/auth",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    true,
++                      },
++                      {
++                              url:         "nothing.com/something/auth",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    true,
++                      },
++                      {
++                              url:         "nothing.com/auth/test",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    false,
++                      },
++                      {
++                              url:         "nothing.com/v1.24/auth/test",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    false,
++                      },
++                      {
++                              url:         "nothing.com/v1/auth/test",
++                              contentType: "application/json;charset=3DUT=
F8",
++                              expected:    false,
++                      },
+               }
+       )
+
+       for _, testcase :=3D range testcases {
+               header :=3D http.Header{}
+               header.Set("Content-Type", testcase.contentType)
++              if testcase.url =3D=3D "" {
++                      testcase.url =3D "nothing.com"
++              }
+
+-              if b :=3D sendBody(url, header); b !=3D testcase.expected {
+-                      t.Fatalf("Unexpected Content-Type; Expected: %t, Ac=
tual: %t", testcase.expected, b)
++              if b :=3D sendBody(testcase.url, header); b !=3D testcase.e=
xpected {
++                      t.Fatalf("sendBody failed: url: %s, content-type: %=
s; Expected: %t, Actual: %t", testcase.url, testcase.contentType, testcase.=
expected, b)
+               }
+       }
+ }
+--
+2.40.0
--
2.40.0


--_000_DM8PR11MB5703A77B073D06D6F51C319684852DM8PR11MB5703namp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reminder!!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Polampalli, Archana via lists.yoctoproject.org
 &lt;archana.polampalli=3Dwindriver.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> Friday, August 2, 2024 13:33<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fi=
x CVE-2024-41110</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;recipes-containers/docker/docker-moby_git.bb&nbsp; |&nbsp;&nbsp; 1 +<=
br>
&nbsp;.../docker/files/CVE-2024-41110.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 176 ++++++++++++++++++<br>
&nbsp;2 files changed, 177 insertions(+)<br>
&nbsp;create mode 100644 recipes-containers/docker/files/CVE-2024-41110.pat=
ch<br>
<br>
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-contain=
ers/docker/docker-moby_git.bb<br>
index 0abb0b3f..706101d1 100644<br>
--- a/recipes-containers/docker/docker-moby_git.bb<br>
+++ b/recipes-containers/docker/docker-moby_git.bb<br>
@@ -56,6 +56,7 @@ SRC_URI =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-lib=
network-use-GO-instead-of-go.patch">file://0001-libnetwork-use-GO-instead-o=
f-go.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-cli=
-use-external-GO111MODULE-and-cross-compiler.patch">
file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-dyn=
binary-use-go-cross-compiler.patch;patchdir=3Dsrc/import">
file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc/import</a>=
 \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-4111=
0.patch;patchdir=3Dsrc/import">file://CVE-2024-41110.patch;patchdir=3Dsrc/i=
mport</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;DOCKER_COMMIT =3D &quot;${SRCREV_moby}&quot;<br>
diff --git a/recipes-containers/docker/files/CVE-2024-41110.patch b/recipes=
-containers/docker/files/CVE-2024-41110.patch<br>
new file mode 100644<br>
index 00000000..6dd56a08<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/CVE-2024-41110.patch<br>
@@ -0,0 +1,176 @@<br>
+From ccfe0a41d438053ee54f0478d3a77b090e40c379 Mon Sep 17 00:00:00 2001<br>
+From: Jameson Hyde &lt;jameson.hyde@docker.com&gt;<br>
+Date: Mon, 26 Nov 2018 14:15:22 -0500<br>
+Subject: [PATCH] Authz plugin security fixes for 0-length content and path=
<br>
+ validation Signed-off-by: Jameson Hyde &lt;jameson.hyde@docker.com&gt;<br=
>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+fix comments<br>
+<br>
+(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)<br>
+Signed-off-by: Pawe=B3 Gronowski &lt;pawel.gronowski@docker.com&gt;<br>
+(cherry picked from commit 2ac8a479c53d9b8e67c55f1e283da9d85d2b3415)<br>
+Signed-off-by: Pawe=B3 Gronowski &lt;pawel.gronowski@docker.com&gt;<br>
+<br>
+CVE: CVE-2024-41110<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/moby/moby/commit/=
ccfe0a41d438053ee54f0478d3a77b090e40c379">https://github.com/moby/moby/comm=
it/ccfe0a41d438053ee54f0478d3a77b090e40c379</a>]<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ pkg/authorization/authz.go&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 38 ++++++++++++++++++---<br>
+ pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--<br=
>
+ 2 files changed, 80 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go<br>
+index 1eb44315dd..4c2e90b251 100644<br>
+--- a/pkg/authorization/authz.go<br>
++++ b/pkg/authorization/authz.go<br>
+@@ -8,6 +8,8 @@ import (<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;io&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mime&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;net/http&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;net/url&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;regexp&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;strings&quot;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;github.com/containerd/log&quot;=
<br>
+@@ -53,10 +55,23 @@ type Ctx struct {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; authReq *Request<br>
+ }<br>
+<br>
++func isChunked(r *http.Request) bool {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // RFC 7230 specifies that content length =
is to be ignored if Transfer-Encoding is chunked<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if strings.ToLower(r.Header.Get(&quot;Tran=
sfer-Encoding&quot;)) =3D=3D &quot;chunked&quot; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return true<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, v :=3D range r.TransferEncoding {<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if 0 =3D=3D strings.Compare(strings.ToLower(v), &quot;chunked&quot;) =
{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false<br>
++}<br>
++<br>
+ // AuthZRequest authorized the request to the docker daemon using authZ p=
lugins<br>
+ func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) erro=
r {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var body []byte<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if sendBody(ctx.requestURI, r.Header) &amp=
;&amp; r.ContentLength &gt; 0 &amp;&amp; r.ContentLength &lt; maxBodySize {=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if sendBody(ctx.requestURI, r.Header) &amp=
;&amp; (r.ContentLength &gt; 0 || isChunked(r)) &amp;&amp; r.ContentLength =
&lt; maxBodySize {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; var err error<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; body, r.Body, err =3D drainBody(r.Body)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if err !=3D nil {<br>
+@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *=
http.Request) error {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if sendBody(ctx.requestURI, rm.Header=
()) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ctx.authReq.ResponseBody =3D rm.RawBody()<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, plugin :=3D range ctx.plugins =
{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; log.G(context.TODO()).Debugf(&quot;AuthZ response using plugin %=
s&quot;, plugin.Name())<br>
+<br>
+@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadC=
loser, error) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return nil, newBody, err<br>
+ }<br>
+<br>
++func isAuthEndpoint(urlPath string) (bool, error) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // eg <a href=3D"http://www.test.com/v1.24=
/auth/optional?optional1=3Dsomething&amp;optional2=3Dsomething">
www.test.com/v1.24/auth/optional?optional1=3Dsomething&amp;optional2=3Dsome=
thing</a> (version optional)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; matched, err :=3D regexp.MatchString(`^[^\=
/]+\/(v\d[\d\.]*\/)?auth.*`, urlPath)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if err !=3D nil {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false, err<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return matched, nil<br>
++}<br>
++<br>
+ // sendBody returns true when request/response body should be sent to Aut=
hZPlugin<br>
+-func sendBody(url string, header http.Header) bool {<br>
++func sendBody(inURL string, header http.Header) bool {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u, err :=3D url.Parse(inURL)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Assume no if the URL cannot be parsed -=
 an empty request will still be forwarded to the plugin and should be rejec=
ted<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if err !=3D nil {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Skip body for auth endpoint<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if strings.HasSuffix(url, &quot;/auth&quot=
;) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isAuth, err :=3D isAuthEndpoint(u.Path)<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if isAuth || err !=3D nil {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/auth=
z_unix_test.go<br>
+index c9b18d96e9..275f1dd3d0 100644<br>
+--- a/pkg/authorization/authz_unix_test.go<br>
++++ b/pkg/authorization/authz_unix_test.go<br>
+@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {<br>
+<br>
+ func TestSendBody(t *testing.T) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var (<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; url&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;nothing.com&quot;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; testcases =3D []struct {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contentType stri=
ng<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected&nbsp;&n=
bsp;&nbsp; bool<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }{<br>
+@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/auth&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/auth&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/auth?p1=3Dtest&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/test?p1=3D/auth&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; true,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/something/auth&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; true,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/auth/test&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/v1.24/auth/test&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;nothing.com/v1/auth/test&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; contentType: &quot;application/json;charset=3DUT=
F8&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; expected:&nbsp;&nbsp;&nbsp; false,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, testcase :=3D range testcases =
{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; header :=3D http.Header{}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; header.Set(&quot;Content-Type&quot;, testcase.contentType)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if testcase.url =3D=3D &quot;&quot; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; testcase.url =3D &quo=
t;nothing.com&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if b :=3D sendBody(url, header); b !=3D testcase.expected {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.Fatalf(&quot;Unexpe=
cted Content-Type; Expected: %t, Actual: %t&quot;, testcase.expected, b)<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if b :=3D sendBody(testcase.url, header); b !=3D testcase.expected {<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.Fatalf(&quot;sendBo=
dy failed: url: %s, content-type: %s; Expected: %t, Actual: %t&quot;, testc=
ase.url, testcase.contentType, testcase.expected, b)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+--<br>
+2.40.0<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB5703A77B073D06D6F51C319684852DM8PR11MB5703namp_--

