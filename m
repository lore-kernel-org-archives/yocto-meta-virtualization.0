Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B440C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 18:40:12 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3311.1785264003564718122
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 11:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WteMA+Ul;
 spf=pass (domain: siemens.com, ip: 52.101.66.24, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Le1VPta4tLx92khqBnmtY6QrmaYOZqQDH+s6mgaer/xdErKE6ws9OAysiKCMfrfpA2tICwnqgm7ZFtbDY7IY7zB5pNfqL/Md2HJu8qsnkTP2tqpofHh4VuWV7RsV19KXuBfBUm7YFxA8Fq/mEimDqS71DZY32BeE7Uok0DAFtwXEpnGTNHpvwpCkg9nVAQyeDvpVQVUr48NDe0AoZNEdQycRKbSnrm2VBf+IwQX7oXRWKp4MupsUWWJdRv08iAJ1ed1h827UCwbT8dqadGRJwpc7tWjVdB9H6PdRSpACIj1z7JhOeZ5gdOmUZRaivVd3xJom3Rz4vdhx4EIudfjUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Si4MuJhmeGsm2O0rk6GQPF1dibZH/VFViytnGIwUsI=;
 b=ihWvoLGJ0uh/FSHaxCN2zOaMow87PgummTHV5h/X7YCtXXltAGGSX+ujWfKUvbG4WVdkqdyiMKPrR9xMGrDUXPrQEHgYqZ4uaTtk0d70uHVbgoYC3mItbwLMaZ1b6NaA6RHtysHQwzq3zsownM8CrmPbWXr9SYkMyibcp+QANlDdN2wUxF8QqMWqPxgioQP92CTg8WLO6nr+/HCrU5lSIcTyY4EhJUsjdMxYRqeOmEVjLU2xx4Nwaf6PlJ5wpePfoPdPUQenc/vPHmth6fnLp460mQ8wm2i2kO0ypogfYUgoaHHXnUxBd6zthZs2VRPm2RXtxVodRSKNhyJQUKKVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Si4MuJhmeGsm2O0rk6GQPF1dibZH/VFViytnGIwUsI=;
 b=WteMA+UlRUwB9w88kuwWfHeuCPAv5W/MmvbA96cR56KyryOuzvgN+5a0CtXjbfXBVlG1cUba7EeMIcKZX0RKfp0LAVPNFSOSLhDEVUu+ivSTUiElvm85fGRJW7HQL6ReX377qJumOE41aqWe+fOxvZt4rKIQZtJvIyeOCyYVC7UqV0bRnR/XI0p5G9pYEzoRlO5MWEUEymyIiEr8KAFDjfESt6Bs89yILRZp5yJuXn0jwnVJuRKWnPr/XaCvKI3YCjr9z4Vt5oHYb/kD5UnivqYot5nX4hUTk2sYjJ7sNPQUIdXzyOhlBgOANV01eFps+hc38EGtUe247qXXsMzlaw==
Received: from AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:435::23)
 by DU0PR10MB5996.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 18:39:59 +0000
Received: from AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c5a:f9c2:dc48:6388]) by AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c5a:f9c2:dc48:6388%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 18:39:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: RE: [meta-virtualization][wrynose][PATCH] crun: set status for
 CVE-2025-24965
Thread-Topic: [meta-virtualization][wrynose][PATCH] crun: set status for
 CVE-2025-24965
Thread-Index: AQHdF8AjqL1m9NmKdUexbmAlqvsDT7aDUTfw
Date: Tue, 28 Jul 2026 18:39:59 +0000
Message-ID: 
 <AM9PR10MB508230EAF658EC9F54AE9E5DFDCB2@AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM>
References: <18C3CBFF4B8615C4.1217577@lists.yoctoproject.org>
In-Reply-To: <18C3CBFF4B8615C4.1217577@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6cb0db24-f5f4-4352-b00d-9bc1c603be77;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-28T18:39:01Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR10MB5082:EE_|DU0PR10MB5996:EE_
x-ms-office365-filtering-correlation-id: 272ee4ae-7d59-4850-29c7-08deecd7a0d7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|11063799006|10067099003|22082099003|55112099003|18002099003;
x-microsoft-antispam-message-info: 
 yvq/eeNenSEI62HZKBwqbuIW3g8ZmsLKEq9FAdojXtSXdNDHFB9lrz2yiO6qOiyCOwkg1PlJtbY7PJprdwBeU8cdD5M2MjO9BSQ/YPByj5pAQKTCqNk8KNtYKgs1shSylZ2FBNFbbqpCm1zLKk/vOzs3+wPMz/zMZ/Q9VUKMTf2zHPh0WdIAe7W5/oFDdhsgku3wjW9/NMWLcCKFbtRyFrN+7/+hVb51wQ65JFOC4MdjAEh5yPU+yml0okghX14KaxJ7HfkEv/DPJhPJi7KCv6nNLLTqepoZWFTuH2hlzm/stasO2JVQxEyE1hHUJwWlODSnrzdWVA+2boGQM9acQG9QfY7wtF2wy1Xz6uvy1NGtLfUIMajj6d0Pn6g+dpYyX1yQ8HDC7AP8gmC7fQnfm8mkgGGCOTD60R79okB5ytQ7thqfMobD7z0bmz/QMIOIDpLhaGEyeP0FlDhNSQOeWQ6Chn9hIqaNpvvcy4fge6IxFee1SlAFCKhO74Dm4cXODbRn9ZxQ85FZz34J9vcf6yMO5TF95bpTo2h700Hb7qGt4Ym4FBfEmvJO2q9X/il0/2BrrA1j2It1F7slYkzTTsbh6N7jqUDjDEBY2MEMBd/zF5smf3e+TtLohzVS3e8YolJQLktL/GUZ4Ry603Etqx2ChT8WXiRPU+igl/wbNrcNfvdjN+8zWdvoxg5c0rJ32sTgb4kKyidtN546eLk9LuBtuZmpc2xL3hVDH+8VATk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(11063799006)(10067099003)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?e8ysyIIqpQADbrAiUY7rDIwVE/g1K9y4ORBBFSoNKRbr/oGrTyhr7BFKw3VY?=
 =?us-ascii?Q?oDelB1jXvvoG73r7eXANGV5J18DqDKlwEIfNfPhkh9gnaiHfKJnEvkurBwY8?=
 =?us-ascii?Q?M8zuaahooHBiEdqgDd78ljs6s66A/ThtZsmasFNyS2hRXolZEX1yTV0flbW9?=
 =?us-ascii?Q?Mn0BCV4hEZJp3uTklQeDZhlhk0Hj/ZoauUR/AJxtyTSQJXsXTW9I/Ju/gJ9B?=
 =?us-ascii?Q?K0CtQ7DPX8tBeBH6RIZUegOBpGDnD8WCC/DRyrhFXCRBXMGRanUAWl8VSGIo?=
 =?us-ascii?Q?y2V+JFNpS2EGiU/nxmzRWq+B5t9wy7GVScK1yCX/V0pbVQdMzmjW/Vz8Vrg8?=
 =?us-ascii?Q?20W1ycvI5Zm/SAvZlSyZ811m4HWwivGgvMtfqbs8EU02U9+3+H/a020FwX60?=
 =?us-ascii?Q?4tqOAmEGRJubk4ao57epHrVyI7FyLlLUwX/tL7AfWlsJKR2OSZDvMb/jxdLO?=
 =?us-ascii?Q?XqoAQTWXzjxo2ubeBV7RNBMtG/uThxUFUAleYbZ6tmCId31szXm1FqlSv/SU?=
 =?us-ascii?Q?anPeQdULdLHSCmbgQOmV7dGkLUQMvZ37qSL18dxAYFWpv0YVnR4x72PuJrJs?=
 =?us-ascii?Q?VVr3Xh2tIm7o3W6aUmNeeoiUnh/mEGP3zE86YLZnP+MRhR798agqoQRGRbXE?=
 =?us-ascii?Q?iZLVkLkkLHB2V4+HSvkXotB7/DM3E9kLBXTRNenK0ox5g8fUwnJwEsi7VdYU?=
 =?us-ascii?Q?mjnSN7063p5J4DJCJSz7DfIQk/41QcGG/WaIg15RBppLboD2Qo9U6P+w6kjP?=
 =?us-ascii?Q?Pr+G5Jk8OtlzNsarTlOHEinOck9rB296yABmi/4csKhjDoF/YcETYu6S9lMZ?=
 =?us-ascii?Q?xWXMadKjS0OBGy0n1ILvHJuvu8iuOjzQdDRUUAmgeZzR82DeMd+97+FEPgXX?=
 =?us-ascii?Q?ONjhY1QE5gWFefTPHyNMh1uuUNO4W3JFytiQISvbiDzOUl22t/tnVeura/CP?=
 =?us-ascii?Q?NM9P5D4LEX3rSaFS6M/h7K24wnPo18+6BNFqrzkwskdDyFmVjBKK4iMJ+RvH?=
 =?us-ascii?Q?YsXcVudJkMrEdx4os9p8eNUe1vdCPsSLs4GBQFw3GPBCYVP9m50tuKUEQ9IE?=
 =?us-ascii?Q?mDGCsgSst/PlX4TNFwSb4szwH3W+f9DMIWSuaNFh2fVqb/+WwaJ8CdynWd+F?=
 =?us-ascii?Q?LR1ZAirz4mm5yZJG/v6tJIXnyigCieZKxilnm7BrJBsrnWCFdgXLRZiGuUC2?=
 =?us-ascii?Q?TAHeG6ejNkLyN/QfQglPSxQNu0WblWJ9HxSgxqNTSqvjmvMVxCMRlq85uiar?=
 =?us-ascii?Q?qk8XhqLpQPhrW+tm8oLS2jl9abHFwmn/xE3/PDyGzmHCWrgdwqrwUr5tk2xL?=
 =?us-ascii?Q?1eAhGoak2FU+wQhdk5Im/mIuGlBTCMF+zt89G5fIlabfm1gAihMAVG0CC83a?=
 =?us-ascii?Q?uwV6hgnaCnE5uzM/BCYYe1JQxonluAIf6wC84n2vT95GVb+fQbr+o+asIdXb?=
 =?us-ascii?Q?VMMMD47Kke8fNO4GWdJWQTorV8VSd9ZnOhjVTR2WPxDKE5hmQ1B5CCT3mjOO?=
 =?us-ascii?Q?32neI6y3syy+/7b+8RErqUL8wEaox8GUCWFjl9Kw15PCSJUrwUN46Ugi5tbs?=
 =?us-ascii?Q?qpQjxVogDj7BLNwFge8eH2797RnuDx8I+2pyiAjI+xNR3Om1SglkUsvyjWKb?=
 =?us-ascii?Q?7j4vzGXm+DO3F9DSwrajgCxvqa8Cacj9vC4gq+oIPXC+xBTgBggpg5qDntRN?=
 =?us-ascii?Q?7+E1QlsTkWdUPC4ZD0NFD5u0UGcEKGKkSxV/1CTS893DM7UsBss35+QRYUYT?=
 =?us-ascii?Q?NW6oTEH7eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 272ee4ae-7d59-4850-29c7-08deecd7a0d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 18:39:59.3620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lTEwgAGHwZjyPYs3+UPrv/YtVG39fMnA8L+mBQcufH2qRkFITFj0ylWYBfnmO723/N8ZvUVhIN78eBMmymR8yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5996
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 18:40:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10008

Gentle ping.

-----Original Message-----
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> On Behalf Of Peter Marko via lists.yoctoproject.org
Sent: Sunday, July 19, 2026 10:49 PM
To: meta-virtualization@lists.yoctoproject.org
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [meta-virtualization][wrynose][PATCH] crun: set status for CVE-202=
5-24965

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.20.
This is mentione in NVD report description [1] and github advisory [2].
Explicitly set CVE_STATUS because cve-check still reports it as open.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-24965
[2] https://github.com/containers/crun/security/advisories/GHSA-f42g-r5jj-q=
h4j

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-containers/crun/crun_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/=
crun_git.bb
index d2f7b63b..ea14e8ec 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -67,3 +67,5 @@ RCONFLICTS:${PN} =3D "${@'runc' if d.getVar('CRUN_AS_RUNC=
') else ''}"
 REQUIRED_DISTRO_FEATURES:class-native ?=3D ""
 DEPENDS:class-native +=3D "yajl libcap go-md2man m4 libseccomp"
 BBCLASSEXTEND =3D "native"
+
+CVE_STATUS[CVE-2025-24965] =3D "fixed-version: Fixed since 1.20"

