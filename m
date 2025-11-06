Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23A3CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 16:12:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1153.1762445511744613509
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 08:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=tVlr8TBl;
 spf=pass (domain: oss.nxp.com, ip: 52.101.72.1, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTPQGfiqm9xKWvgCnPtY3V9zrMTc/0OF74ydkNwOS73w6bB/GL+I6mQI4LXglG/QgVESSALmkvHhd4zOtrSVi3pzOGtjqg+rv8t/mXawv/Wnf6fOvRIZ/KVM/2QaMRPSI6CvlEDYGOZtc1HHx7tP9fTvgVu4kJbgGeCAfae9WQgMVgsShmbYkVEfopenPP7parGwSgK+uQd5IkkDUz5AHO2bouRIT83yKdOQBvFAojcg4LVFAfoFHYiHm5CKEl3+bn5b8qoPDGOcUlDYTX0iSlyN1PRowxbfWYjWwbFsyvaex8qyouA2H5TXP1NCAGbjgoe+pSvQ2WbS79hEN+IQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJKTzRRxlbcztYQiO++PTET7c14+GYDKRaX619dpc+A=;
 b=jqdW3l4TmA94n3P9ZWuAwbJNy3LMrDHwu5aXbxXQZm/p6UFjOsndrezUKFYgEuLRWJdxmcxoTsQuX4tRyBdf27ho8lMIieVJGJpcPIs27wief1VOyjQHnLdM/gKaSnxOpAfo+z+XlNqs5nN+TiDo3VMOgfCO5vmuc7pVycuQnxOe7tGs4DLvGcWG0dvsmt5q0T4YnSI+xr/Ls7aCsTeWpUkOLNRfzsWXszdQ7JcgRNWmo6w7dI24il3tP2zqHE/OxexVaqtfEeuNFlbb/xvXDzdqtF4+UND2Rzp1t/dqkbgrqfLjfp0wzTVK0H6RNJZJgsJOXe/jb4DCqF6cfLyRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJKTzRRxlbcztYQiO++PTET7c14+GYDKRaX619dpc+A=;
 b=tVlr8TBlKUrqFbjiSKewXHPYDnX3hofxO6tv/HZY5JFExlKmjWbymTU8nmV9XFHO6cgNKxWTxzBfI/dyKAy/8ZHUm3tmJ+0A+g2roADaNg47ksAv0ZX6CgYTSGqnvBYK15K5o5NNtBMOwJgvMxhoCBjrzFhfP2Ak8ML5kyQ8iM+XcN2I6dB1eqdklYuGzHRSY6yVxnUdSB0gzg6PZATy1mXzKEMlqJ7w3NoD0v6BSkgqa3CYvvjTTz36tBMlrJzRlFMh8wCbubBUAGRAuYQ4HGi9lzmi4+hjHxc/w2nYCUl07tkW9Q/rVOJz8g/xe+WRLEb4iK7px1wYTB+qhGt5kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS5PR04MB9771.eurprd04.prod.outlook.com (2603:10a6:20b:650::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 16:11:47 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 16:11:47 +0000
From: "Tom Hochstein (OSS)" <tom.hochstein@oss.nxp.com>
To: meta-virtualization@lists.yoctoproject.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [meta-virtualization][PATCH v3] libvirt: Fix missing libvirt-python
Date: Thu,  6 Nov 2025 10:11:30 -0600
Message-ID: <20251106161130.1562976-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::25) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS5PR04MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 5423aacd-8533-4b98-80d7-08de1d4f2fcc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vVLVDPJnZD3QCMb8S1WbEijjg4eV+enVI2DC5bteng8AfbjGCyHIInGG41XN?=
 =?us-ascii?Q?yNXjRfvh6H3wEgNRdsYaW5KZdAusMl9xymb96XWMCFu+HcOZ0zQF1j3omWhC?=
 =?us-ascii?Q?IwteBxS5YQdtCzAFsw91Z8f5ZKMs6AmMl26X7Kq0PIEHqbKpV5hQpqjxq7UW?=
 =?us-ascii?Q?Sq2rhdjI9I5ogFw5gt05xZ4QFuNg0jmYnqa2rA+DCTmr9uhw2m7rEDZdDJ64?=
 =?us-ascii?Q?2aep4yVjNcVgDvxobh6AsNhNU3MjX+vd7mwIsOitnRqf2itu/mfBEfx7j9Qv?=
 =?us-ascii?Q?SvBiacXw+NdZTfChrpDF7BS5MAUiWLlXNXkcUVU2YCNpZp9pUYzYhpfOOomj?=
 =?us-ascii?Q?12seMNejTpXkiaWo3cQ/eOSidAGPPPD1l7B2DrLXrLqXHxjYLyHYVpvYf2uD?=
 =?us-ascii?Q?MFRrscdD+qBz2/0RY5OFnDaye/iaY78rjlzYKOD5yv3XVCRYwRDZnKenIXFr?=
 =?us-ascii?Q?IyPdnM1ddB8HB6CUpJ9MhWoCCBHPCPqhqd1jYYtGoKhHUuafazZq9gZBMwRo?=
 =?us-ascii?Q?jh+ayzt3cTACWxsDbtOBf+Ob/rtxHh4eo3JaNd+HFuG8et61PhpLBKFzCy4b?=
 =?us-ascii?Q?3UqbR/WVAueourO6t4elUTybjdZJHsxx2B3qP9XPMa2zsfp8RHDJA6f8Cz3m?=
 =?us-ascii?Q?jcTRZ773UjM9OzSOLfufqJl0mEnHPGED+8hhjs9oMTrLF4r0Bcj2dsHCktRY?=
 =?us-ascii?Q?onLf1yJHRoXtvKsExOrK30U0iGQjn0dLvPIf1Hki0zUhe4xHl51+1+ZLh7yi?=
 =?us-ascii?Q?X3/+u8iTaO2GsP3ljDWscXvCWfbgQX/54Cbmx9igK9+akHg4rNu6wDxg1ODl?=
 =?us-ascii?Q?g61W/hZGc3J9pj2J3znmEOHb310ywv3Jny0vpLZ3lsUYY3ioTwgOE1fZaNbF?=
 =?us-ascii?Q?T5Epv9XZc29qHcQjG/RYzUMUsiXsPjCtGuqBRrspes/96xdrWKDkXUzMyvjW?=
 =?us-ascii?Q?BgItnnNJ+pgenMjZV+kzeehwbpxOe+otrh5lqdWBlrF99hMU2Yr9mzhC8cRO?=
 =?us-ascii?Q?vrJrStq9Db0yIGPXDHjgHBvBNfn2Uz7rbEHNzi3JlvpoPD5zmE2mR5cr8hU/?=
 =?us-ascii?Q?09NU3tSsAnIlVUX2RDsKAZrZxyDdmi+bFpT7tc+LdWVNf89vvRG6uMEO7dYa?=
 =?us-ascii?Q?k9zc8xFvpS3ZHhCMbDpAwhbqc/4/4+ouwh3S5naJFrOiaFY5eSKcFYGcBdYP?=
 =?us-ascii?Q?JB9f2jM0lmB2W9/U4OwMUAvvbuARRsYCmUHtp23OMAoSdVzOAx4s0T4mMHEE?=
 =?us-ascii?Q?odL3dYIRzZGDCaDdiAtA9IUrJ77z4gjbUocVJX2ZpcZEycsYV/13d3GdU4/7?=
 =?us-ascii?Q?n5vZ+FB9Gf9SmxR2VM7TzlUatjg5KdMV7aVm2VJH6o48lVivRAmLiScQtpfe?=
 =?us-ascii?Q?xgw/QdlQexijRuU+QePmxUGO3wYPC112xJURNlVMp658mK95fDZ0pMT0URzM?=
 =?us-ascii?Q?EyCk1eC/+t3m5ZCXY3eQbeoFC03XIUuVbbtuFv2TIwCB38zIZHxrdu+wSQKV?=
 =?us-ascii?Q?6BU9lxsdkZH9UWy2MsK1SaIYztCR7n83953P?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Wh6lJZGqGD2zjtbiJ50NpZZoK8xFQ7SsLJIfSDXmzM4WYk4v9ek2iVn5BjA?=
 =?us-ascii?Q?Eobt4BdwgTskAeIG8GVdPjRXf8DdVJy9o9EgI/sErOED8dfrhKm22PbsSftH?=
 =?us-ascii?Q?VzebMXcd4WwATOHc5frq1fcFF0hjA99lzdRv+W4xt/2FgkZU+auLJ6hEoPYg?=
 =?us-ascii?Q?XoglQTOp6Ft+f9HU3MLs2Yt1gnWG6pwkTV2jIV45oadCv0wDRCDA8xyKyb8f?=
 =?us-ascii?Q?2liw90B8bPQcNSbVzk44HMuilsx+JVWIS/2UGU7xHvGkFNSpH75/pdpyEX87?=
 =?us-ascii?Q?y8H5Oic+hfVyzp3Kx1nAoXZlRROyZZTKy5bJBDc89iQzivFXs8FOli/2QgNv?=
 =?us-ascii?Q?xfy1gJ9DXm/d+fOmWe3T1AveDnhOnNk6tV2wpQADve1+/TCJMZDL0c7V/JML?=
 =?us-ascii?Q?rc/EAL7Q3PXAcqKyB+xeRwU09Bj/XJlj8xiKany+QvPCwquzzCiWEXH3AJzc?=
 =?us-ascii?Q?IQ4Q/GbaSk/uEBxaEr08SomBP4o1huOD83tky3HbpiDeh8ifECMe9EaUZuPp?=
 =?us-ascii?Q?OYGvzlYtEuUxt0WTMwfpGCXVnEPjLTcY1vw0Bwv15mIxu8pzzsNR2XN8nFZk?=
 =?us-ascii?Q?uWcIZnlC14EAdzBARvXWlrFewpTrCSJqoYMpHbOJZMNffPGeR7ZtSHuZfRdd?=
 =?us-ascii?Q?dFVfOlQlp9twWNtO50nl9dJwswVC/QSithz1Bhw0iwSyLFCZdaw1O7JwY+Cs?=
 =?us-ascii?Q?bNyN6AWEE9Qzro08HA8fmn5Q/92sMFPoHvLj4G593q18kKir25MauP+5d7TU?=
 =?us-ascii?Q?kS+nskfmTsV3MVJcXz++RRzOEqyohaVbVtVwTVjew1pC6X/DxTiqZO+skSpK?=
 =?us-ascii?Q?ZozjriiohfYn3Dil0NFs3TRxFcQeE94x1qp7zlbyOz3DGiVg2OXrpj97j2//?=
 =?us-ascii?Q?1Kk0ZvwPyUnfS09vZ8vShJeEGkZnx1HXbq3R+u+XKQNS/zCXY7T7fkUFbxcF?=
 =?us-ascii?Q?JfK1gxEjY8HdSqGT8T/hd/EMXvsL0g8sf0OR5n7l4NayfGivZysxsMLpwFR5?=
 =?us-ascii?Q?ZsFVbchg8vRJCX5lgEwL6tzgCWzcwK5CvJCUSQhYeKM6bJD6rZN5rcgJBjVP?=
 =?us-ascii?Q?D5/K88POh6u24zgmjR1NaOHP4cAbYGeoD6ntG3ByDbk2o2WPWh8RX/T9++T+?=
 =?us-ascii?Q?2mxSa/+F1kszF1t2ok72Z1fh/E1zWRxgrPBFEuXnN3wDPdDdrZ6XUM8+2gUH?=
 =?us-ascii?Q?wj+L5L1fCdo0+WrZLgzyfxCdwAS+MYd3ttQsVdKOK6d55uEgaocrTcjzIM93?=
 =?us-ascii?Q?06CJKkvxqwtUiUniJgRgD++Ns0tMZJzz9zj6dDfS5/v4k71ZYBCnPN0eHSQW?=
 =?us-ascii?Q?1vj1vomZiv7D9ZPZPY0S09iA6EXw63adtZGn02pWxqwvtb+U0dJf2RLwgqMP?=
 =?us-ascii?Q?iU6bpbfZFBBtPpSGweedCfyacbRxu5PHuL0OICPCU5B4ZsjArJN9oZl6xMjB?=
 =?us-ascii?Q?ou9YDitIh2bhIX0DT6tZzRv4M4df+HUHFdPdkqhN0hWsonSPcjlAIcXuoUyL?=
 =?us-ascii?Q?mIxbiI3UJgada2Yp/1zqvJfOmS+uRN8BjtnuvMzxV2TPbcOGrNET7LhaVTxF?=
 =?us-ascii?Q?Rm24iSSIky2KPVBSS7crI0f4nKr+qBPIMdE5p613aT1bDZXFU8ZRCoNOEpgt?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5423aacd-8533-4b98-80d7-08de1d4f2fcc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:11:47.7577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNI4C+ZuixUH0AoTfmz8OaaeToSj/eL9x9Yq5rHVkkf8Y2H1H+sxddWgk/J+rH/t/RgHyEFe4iw071/Oqw7QUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9771
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 16:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9434

From: Tom Hochstein <tom.hochstein@oss.nxp.com>

The do_rootfs task for an image that includes libvirt-python fails.
```
  - nothing provides libvirt-python needed by packagegroup-fsl-virtualizati=
on-1.0-r0.ls1012afrwy from oe-repo
```

The log shows that the do_compile:append() from libvirt-python.inc is
failing but not reporting the failure.
```
174: cd: can't cd to /.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/l=
ibvirt-python-11.8.0
```

The root cause is the archive folder format is changed from
libvirt-python-VERSION to libvirt_python-VERSION, but the do_compile
and do_install tasks are hard-coded to the old format.

Fix the root cause by encoding the archive folder name in a common
variable. Also, fix the build and install commands so the cd failure is
not ignored.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 22 ++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc
index c430ffe5..b8c8656b 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES:${PN}-python =3D "${bindir}/* ${libdir}/* ${libdir}=
/${PYTHON_DIR}/*"
 # Currently the libvirt-python debug libraries contain buildpaths
 INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
=20
-SRC_URI +=3D "http://libvirt.org/sources/python/${BPN}_python-${LIBVIRT_VE=
RSION}.tar.gz;name=3Dlibvirt_python;subdir=3D${BP}"
-
+SRC_URI +=3D "http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_N=
AME}.tar.gz;name=3Dlibvirt_python;subdir=3D${BP}"
+LIBVIRT_PYTHON_ARCHIVE_NAME =3D "${BPN}_python-${LIBVIRT_VERSION}"
 SRC_URI[libvirt_python.sha256sum] =3D "5d80e13e0cfb96dd254d765ee60e77e5f9b=
6925172540056cec0aa0e6f0ca83c"
=20
 export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
@@ -46,8 +46,12 @@ do_compile:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=3D
-		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
-		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
+		src=3D${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
+		if [ ! -d $src ]; then
+			bbfatal "Python source not found at expected location \"$src\". Please =
check that this task logic and SRC_URI are consistent."
+		fi
+		cd $src
+		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
 		cd -
 	fi
 }
@@ -58,9 +62,13 @@ do_install:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=3D
-		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
-		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
-                       --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${L=
IBVIRT_INSTALL_ARGS}
+		src=3D${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
+		if [ ! -d $src ]; then
+			bbfatal "Python source not found at expected location \"$src\". Please =
check that this task logic and SRC_URI are consistent."
+		fi
+		cd $src
+		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
+			--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
 		cd -
 	fi
 }
--=20
2.34.1


