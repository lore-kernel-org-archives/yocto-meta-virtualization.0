Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57243C3527D
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5352.1650014661726045568
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 02:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ftOStAm2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1104f3b100=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23F9A3VL001049
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 09:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=v0iSh5oqYyLn89hhxasnNp63dEecBXZpJIz0Po5ji/g=;
 b=ftOStAm2OI/5CEBmHPE7ZvouZr568/cHBqVf56W1fJIyi4bFmQqmvqe/yoQT2VbN6yHB
 d5vvgbKiiIvicUEpBkVJ21pxw0Zy8uefMvN0r9y8aA6IL45j1A3rfVn4b+2a2ynUVzHn
 hDhK3qNVhuRmoEWdrxcSxX12qPID4yMm8G8i5l44ZOEMczn9pL9C9b59wzEdcomB9XEy
 HF8vGXsCH71ci/AXzYaQBSNvYi1dgwLwWrHNKXK/5mC7k/AwRG6ZWKWojoQkXdFAxvXb
 JfOudiTKPiZeT2M/K36gIpYx+4d63NmKIHEmzv0WzVcIlBHe1JJs6UTfbUBIM6Hk2vga Og==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb66evmum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 09:24:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVUoGR6s+A7rZ7giqhliwJk8+WSI9W32ty6VrDXYkSWX0ceKjd0y7Xlypogyz9aS3Jyfw7opGfbHnVvsFevBTocZ28/YKoa0eo1NBX2cVRghCoHpt/qV50G8yjdiB3Q2rd+gW04C6f/t58hNVtUa/WvVsutk9MGuFWx+bQafX38OLO6pEWJ0EwMoJqwRPATzNuEfZ5AqgeN7DflbJD8ZrgdssJPVp1gtRs/xS9HqvEkq3DjFQdAnI9Y8vgd3G5hyDfnCXu9krXgQojtNfHWmHJBMRMgzvj/rYzp9Wh2bKdo/j3TpBigA8U3EpoKMJQE7kvDWR7AR7Vr8HuSfpt3hxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0iSh5oqYyLn89hhxasnNp63dEecBXZpJIz0Po5ji/g=;
 b=Thm7xOwiU1gkQbnQSWjlmasKU+NOksjwsYfcSkweCX7V3E2SOrV56IjqFNuD3uOg867ZB/CPnKv8IEvMtUzQGyG4wHYIZ7/1LNtyLmWZWTbVVdov//7rd0wIRUYENHVwapitiZgSPFtdd7HDEONR4Sr+jrwVh+GLLMXg+94x6yze1WmiUxSFZx5kbGgOtTnsythiW9VndmK7nhJm+PAz8chhyfn+7ft+eDCWtWjuSPsWIrdaTJQxlIJNiZmUhH6hbf+1w8NYzFxUrWYtcfvP2ikbuG2KMOlqtfjd15rnqX+a1R/w80lolgHNj5lgPif4o+GIBM2WASixKFyeD1tJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MWHPR11MB1728.namprd11.prod.outlook.com (2603:10b6:300:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 09:24:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%4]) with mapi id 15.20.5164.018; Fri, 15 Apr 2022
 09:24:19 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][hardknott][PATCH]
 contaicontainerd-opencontainers: bump to v1.4.13
Thread-Topic: [meta-virtualization][hardknott][PATCH]
 contaicontainerd-opencontainers: bump to v1.4.13
Thread-Index: AQHYUKpn8f+V0L1xQ0m/kclt+JqSrazws7mg
Date: Fri, 15 Apr 2022 09:24:19 +0000
Message-ID: 
 <CO6PR11MB5602F2784DE34CF0F5DF4859EDEE9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <16E60780C63E00ED.11564@lists.yoctoproject.org>
In-Reply-To: <16E60780C63E00ED.11564@lists.yoctoproject.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd673771-d1ec-44d4-72db-08da1ec1b84f
x-ms-traffictypediagnostic: MWHPR11MB1728:EE_
x-microsoft-antispam-prvs: 
 <MWHPR11MB172882B33D9FEA0EF9FB8353EDEE9@MWHPR11MB1728.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tDq1UnwTpyQxmBeZvDNOy1HuGQelSl8mjVVbW5cpZfWEWo5TaRK9CY9uYYnv9lHPmIRlIqDdaPPEcM0oBqYPHWqu1Ug/U8KCVoDyh1nwEGDZ+XSG1Ntp/Mtps/52ln5SNDe9htEYyfzFkVH+neNZFOGkSJWQWhc/P0CJIoUsNhjwYGQ/APQqfomU7uSR+JbewAsRSMLOVYKcOvI7JGyQFighANg5AnwR0ETCcYoegh7f01TU/5VQyndR2D58n2BoVH3DYOJYJgDQw7cx1MG9PSob7o8w5kzog/yz5oWVnp634pFDtE1WifOlc6YLrSEgz580oxhcZ9nGX0xi0IQpFJ+bZbOVE4C8yoe2xvJaqN9i2/o+K47JiHaXj7pCELZ7uCE3szJbzdLa/EoEFqOXbQVTH6SGWrrFYcaiYPX+vUHxlZPTK98YAfvtRs4qdQW44AK+e4QkK1Kzq63uBx2bkm1uh+rDLLszPseQjj5aM/z1p2c4DNg2uMws9fAUNGQDaqDwt/yPbzyB2weUAGZnkoSXt9jXGfAFTj0Zg0JBJK104dU7YWnkKW14Z4jWoOAznyVCkGwYWswoWdXwv5GtOjp5VQAG8kQz1nTZwJvN7nF7U27V3bPu8IlRj0uQQgjpIWlcMMtNMAblYT3JlT0abU1RYZQojPRPmwktg5s7kt2ooY3qPg4+u6o0pbF5+tcLtgDPtC3CNkCHN+Du/B3nMCT8yTCi8fUp1H34I9S7NJU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(33656002)(52536014)(316002)(5660300002)(122000001)(71200400001)(8676002)(55016003)(508600001)(66446008)(64756008)(86362001)(66556008)(66476007)(2906002)(8936002)(76116006)(9686003)(66946007)(38070700005)(83380400001)(110136005)(38100700002)(6506007)(53546011)(7696005)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?V8a7ecoeFHw1jQhKgbNcYzspYXZ8CS765eNaW+7Kwb2wEaHEiLUW/r8D8Z86?=
 =?us-ascii?Q?lteh5Wwk9oCtpuvSVO2664lpcto/tyQ5OI3bytX8s0D57Ter9U/zKTSk+z1U?=
 =?us-ascii?Q?VkxSjslNAmKcEmHXuFyMz/Nnmcp6g5iuUY31swk/xRpTVqqfULD9zndmcit0?=
 =?us-ascii?Q?4bxteNgxfbL2NldS/HXGknEeEYNPjPAbk8oK7SC9TPSSaGFRFdBdzzncWn5i?=
 =?us-ascii?Q?ZBsLlNo3o3Dm9RDrG4lu1my0TFgpNA+sXwA+43QI9P9ew5OOAVpoDUPmf14O?=
 =?us-ascii?Q?QCusOeD1BO0YxKdacbCOixwSam0nzzILnsDRg29tboqr1DSDALnTbQ1YRI30?=
 =?us-ascii?Q?Umwwlwo9eJ8yb/9BwX31n9yqZVw2tjTE6QGE0Kj6IsaUtN2QJx923PwIES9p?=
 =?us-ascii?Q?txCg2DO1fJicVrG3BUxFFR6xxxYUEJgwb+kA/4zgNETr1Jz+xEBzVNCxCFEe?=
 =?us-ascii?Q?jSwiKxro4CeecnxYecQ0Dc1v185UZKv40kwmuzzlI/6dvnPSA9Hn3AfxY6mZ?=
 =?us-ascii?Q?baoDlQEkUKPCYXf4OzOTGqIhYIacwwGSPRBq2zAj+hGHvYBjN63G8iTeeNG/?=
 =?us-ascii?Q?0HampS6ZXaIlpS49QrpQvdnLSNASCvQ8U8b70UStV+KlJdfIRxVgkw+4SdHg?=
 =?us-ascii?Q?5pmiupAj7ggJb8nmEF209WTe+dmIpZMV/O60vkVOj+74uoI7BSR//2nw1I0Z?=
 =?us-ascii?Q?k+Zo1WykiBDYkvNma1SqBGCvBEV5x8rO3QIXKFvpHjQ5uZxK1Xi6YXOII3+n?=
 =?us-ascii?Q?TmhIoVx+Y8U/Al12h1NAE520/MfmHaEPlRPxttrsFp4w9et1pJAzFMfmMwTw?=
 =?us-ascii?Q?6nCCA9PLHwqg2ZSbp+tXE0qhef8HeNxQCeWkpMnQrR+VGbiJqWAhr8jxz3Pd?=
 =?us-ascii?Q?NAR4ZdfiuOpxM4tVdAKHUxxxb+tjUEfxFtKSJGlX0vNUqU9WYkimZh0EMjlc?=
 =?us-ascii?Q?cFVavSK9R80ryRsSNrAsRVRWlgK5OcQy3KsaWYRVKs3pW5aBxeVuUDW3IYSq?=
 =?us-ascii?Q?HZHNPVRaM8NM1UkQRM7ASmzC+wIjnTIOckBZJiHPtDIQhs7KyYIZQgNeFjOZ?=
 =?us-ascii?Q?cp2vzGLTSkxNYjXlCHb06meByYanEn3kYWsUsD0Y7SA7/Y424dxA55zm1Dmj?=
 =?us-ascii?Q?Z3wrst/WCKI3dC8Qi1Ak7W4O0ECkKdnI6Mn0NenSI0VM9e5X97bmS9DuotS/?=
 =?us-ascii?Q?WUbPirvdPb8ZSEkQmEN1ht0SSXmG+noxpN75VNhJoHWq1LIomvNSCaJrhHPS?=
 =?us-ascii?Q?Io1fxNqigCSjNHUy9j3NFPhOG1e5tNj/Kdssedm0onnR9dWk/hhBpSVbDUXJ?=
 =?us-ascii?Q?agMSUpuHXrpYUHaVIjbq9XHYZtbtKPT3iIAdtRgK4RFjAu7vyceuPJfmPf5t?=
 =?us-ascii?Q?5CVf7gNBLZAkaModpzbjXSnzHMSDGErbTOlYTuMN42KT8FHrW3SWj/03Pwks?=
 =?us-ascii?Q?QrIqstvdT3gBKEVUohRFlsCogbABIh37vJYEps0PQd4ML8lxzD7HYcvQKJo8?=
 =?us-ascii?Q?AeF8bM+KJfCUVHDNWH+rYA3CayjRX8HKUq8lbmChoJBbhhimrmvzaYAGZjRZ?=
 =?us-ascii?Q?S0NR5Co5dQ/DlhBxHxmOnX5oIyJnyO4C2Fi6Z79kwyXV+sHwVQHSsWjmSfE2?=
 =?us-ascii?Q?rAj77iTeQYoqJvmUWjKGu716oWvWnQ0wScH17SKaaiJjyBHVYw7AnIccLnFP?=
 =?us-ascii?Q?oJRlWp5LgbER8WuCvbZszvDfnbSZzu5++1Xzd3is5HjKb+MjBKpySW3QG4Q8?=
 =?us-ascii?Q?gkwrRUZ1SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd673771-d1ec-44d4-72db-08da1ec1b84f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 09:24:19.4832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vzoT0t5w0YMKTPKkLIXi/GpQaiYuMchFVBHEmCdlOn8aqMkVq8+c1338QGQt4chpur9yWHsmA1ku2a8KbWUJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1728
X-Proofpoint-GUID: bCDlqNpyxXb9nlR-DtcoRSBWCswhq-vU
X-Proofpoint-ORIG-GUID: bCDlqNpyxXb9nlR-DtcoRSBWCswhq-vU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_03,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204150054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7179

Sorry for the typo in the subject. I'll send out V2.

Regards,
Qi

-----Original Message-----
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> On Behalf Of Chen Qi
Sent: Friday, April 15, 2022 5:22 PM
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] contaicontainerd-openconta=
iners: bump to v1.4.13

Bump from v1.4.12 to v.1.4.13, which solves CVE-2022-23648.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb=
 b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 7f6c75d9..40b03163 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "containerd is a daemon to control runC, bu=
ilt for performance and
                support as well as checkpoint and restore for cloning and l=
ive migration of containers."
=20
=20
-SRCREV =3D "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
+SRCREV =3D "9cc61520f4cd876b86e77edfeb88fbcd536d1f9d"
 SRC_URI =3D "git://github.com/containerd/containerd;branch=3Drelease/1.4 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
            file://0001-Add-build-option-GODEBUG-1.patch \ @@ -15,7 +15,7 @=
@ SRC_URI =3D "git://github.com/containerd/containerd;branch=3Drelease/1.4 =
\  LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D1269f40c0d099c21a871=
163984590d89"
=20
-CONTAINERD_VERSION =3D "v1.4.12"
+CONTAINERD_VERSION =3D "v1.4.13"
=20
 EXTRA_OEMAKE +=3D "GODEBUG=3D1"
=20
--
2.33.0


