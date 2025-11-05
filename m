Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBE6CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 20:15:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19276.1762373746749373837
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 12:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=shZWq91g;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.49, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF0RIZEG7TL5d5sl/ymOB2Mdxjc7LguXGbyAVta67VTLGO0sy8vYefE+KM9ixfRV+KNZ3bdPBWdKcPmpUu1uJr/V6dNRpa2HzdrSGq+oYKsV1Xfz/ewM6CNR3nu/FSIm0aOtVRVRPswXCtJesnqLJWojkfUwObVIal50lXlLz7yI7MYQ/o90Yp6/Ohcki0j06LUewIQuTLMLHe8Ad33cGRGx/KfZdxBk/8tW4LTzx0AlVxhYxdfjeoM7Cmps9WEmOkJyUIqYsW5z1xatYIzjhfUVv5ddQhJc8PJDS381W8cv30fqifFRJCxI+jEGcvj3IplBKtFATLU3UphtjfuU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab/XWNKD5YqjkOpffMVE5WyNqOac+AE2HZlhPZCTxng=;
 b=XmPJ9TP+yGWAA97HYWmkjUISThpo+QhYTc5+MYT0ZFFH9Kii8zgA/Nar/Xlsp7CmdhTxPeUhXti2CLTwAX2vuXCXuaYTNDxTZLG+BolRmCjgibGcDECBINGcjBrqo0qHF89dWpOy21lKKfB+nePFcFcDsBCv6jmAxkWC7EMT2C5gdyaSqd2P04pvpCn07mLcshEMz8QSu8t1CoK+qaCh/NdQmzzBPX4twyWACV3WVmd+gKZzQ2zJx01PRKsEedY12I11aq1CXlhF3Uc6kcww9t1rB3oT0w3Zh0/aTQKktsFpD7foCqpjsTxW5Kvk6PJy7llAa2MqK+5HE9DPj2zb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab/XWNKD5YqjkOpffMVE5WyNqOac+AE2HZlhPZCTxng=;
 b=shZWq91gpGM8QmoEWe1qluwpHJDkcuXN3hWaFlDMF1aYF4QKrPZYRRIqO9n233mTTumJh4FfNqpls0wEjl7/f9ISa54kgdenXBmXN0Dxez/OHH6Rhb939GrzJLSSTXvINJ7OAjsyhxXg5lvIy9VsIqvdWF5CyLqsYb/w6ql079HynDN5J7CVSfIJg+owOA7E8yP7GvINgT20/+4RWg3ZPjbQKF8yMmIQavTqJOMXhs2WaI648Fo9wNK62USUSFrc8+QgUknNjhBihYivb78v9ex9waYFef4BsoxALixCUa6HpXCEpgRZgJfzJQsfoYHEIoxYVYMTRzrEnZ1BS46P9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9346.eurprd04.prod.outlook.com (2603:10a6:10:356::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 20:15:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237%3]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 20:15:42 +0000
From: "Tom Hochstein (OSS)" <tom.hochstein@oss.nxp.com>
To: meta-virtualization@lists.yoctoproject.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
Date: Wed,  5 Nov 2025 14:15:25 -0600
Message-ID: <20251105201525.288881-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0005.namprd06.prod.outlook.com
 (2603:10b6:303:2a::10) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8c5da7-57f9-49b9-e350-08de1ca81805
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UiOnUK5ZWd6D5KJ2vdMT+g27QE4NFek6c86Moh+jiweV+0mYd7MPA8N3/9Np?=
 =?us-ascii?Q?AwgRIr0DaX1IIIoqRxqWRlagA/rqPhOfTWr2TVTtEQVwCtpYuE3U+8rZNme8?=
 =?us-ascii?Q?lAZYPNvODs4csnOChqxL7vTQ0bpqkIxfBe/vZ0/usbsugsSEP7w3IrY3Hw3Y?=
 =?us-ascii?Q?NNYvfrhrg646FJtMKowHhOTdmy2J9paHrNNjRxrrxcUZVKfTAbCFPXLAgWt0?=
 =?us-ascii?Q?U3wZP1GchwLcK21A4K4U/j6JKvNaEl2D/AuCZak10nSabNcuhJD9pWP9I3bw?=
 =?us-ascii?Q?RGSPdLXdvr3d4022qVQugeNxLjJJzIyAlqMtUhwJrAO6/Qb8Lbnpv2khW+aH?=
 =?us-ascii?Q?rMbp69wCPbwCDAGp8/fNctR3onIP05XJEOLHb0tzZ+EbqkD06Fm8g9ENhEOk?=
 =?us-ascii?Q?GeI7haPArxWRIjiNonecKN1UE91ElOMqQK590Et4rOkk5OWUiGman/uZw8yK?=
 =?us-ascii?Q?IbKRrUxDbh08c/rwXYnTd0HiaDI4oXi1a/6zO1+wuj8gI9ZxF808XhZ6uNIP?=
 =?us-ascii?Q?ouDhOKIajuSzZowwf/72lxWQXXLWe7V+HlzkwrrfZCsJx1g8c89WOxDSsbGv?=
 =?us-ascii?Q?jgdLHO75N5G8UMRz7vwtf3POd8i/cIxgkNKIVmX65RhluqpSr11IIwU4+GyM?=
 =?us-ascii?Q?A8FdvmUqqw7NuFi3Y2FWLiM5vKort5Lq7ArjlqnSKsnK9WtV9QEvekRbnXv/?=
 =?us-ascii?Q?aTaazd1oP2zMwg9L7HGCwlZbhUKH5YxH+vMumzei2No1fHHbjki9zLWr9lU5?=
 =?us-ascii?Q?XjVzj7sKxRcYNKOSENKRXH2rVOjNrAYdxHrgOj2pnVIKsA2L4bWCEgD72cjk?=
 =?us-ascii?Q?/4et4il8kO8FNXOOqW0bP6JyzTDf6XYU4jbXzWgblE+kf1Bi/lRyuN205XnG?=
 =?us-ascii?Q?x1ZrG4pWUC97Lq2ZYWKSNfsosvOdALRF+p8MCUFl1XbDCRD9O4WvOQ91ZM7V?=
 =?us-ascii?Q?GPlOYjZo+DClSTuuVjmDSfULaLbnIBdKnerMnyQy+0lUltgoSo7KJ/gMpESp?=
 =?us-ascii?Q?/6AjwHZCQipfXBNECk5Y/fE73/mDuO1mgHvsfVBDAZnQxzC6nUx6uKrKCsV/?=
 =?us-ascii?Q?a5iuHt23MU6TcVHb4XDyzLXpe3gKXVfrR3GKMj4Yxw20P5Q+t7NRLmaiwEgH?=
 =?us-ascii?Q?JAUxJR9gVGbXAJcW/jTMVsotogVWmyPFfxIbliP9+12JD3k2t/LT3kr64eVM?=
 =?us-ascii?Q?DKeR6G7HJIuz6j2UKqPi3cLCDt102jtEVuAmoaQLK3J0Wz0zAh3Nl7L2niH9?=
 =?us-ascii?Q?lrAINWE2kevuCv9d9wuEGGceYu7OXhZENPU4XNer27li4scnR8OjHMpy9b6j?=
 =?us-ascii?Q?yhNtDX0dSMqgY9gvOqkKmQljaYpbCp/AYQNqAsLHkA/Al8YPR2TD3+5Sy2aw?=
 =?us-ascii?Q?lqUlTXG0lQTIH6G8JQkOIr/NAJyziMSScfOdrsmOoJhIrL/QeWKRyuC/Xeug?=
 =?us-ascii?Q?F5VPAnC7s3t5nqrnSjpx7fAhpIfpvRx/PaHiJRdfjSX0bS+AcI7iaOylOzXe?=
 =?us-ascii?Q?1o/2yW4zSSNRHFmKDX2o0dzcovp83hNIYUBF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VIPlrSAyP7Cf6+6O9fP9FfuJbBUILIpYua+moW0ta2QGTSvxelZ0ATOWNBCx?=
 =?us-ascii?Q?CSwO/dxs3KBDUNs/+87qXqgoP/G3EUQaKC8jt8Ey8W959oJEAIGr203Rzpgd?=
 =?us-ascii?Q?pyXIuYZbusM3LcajwX3i6iHVm3W3QPeLZmu8/2JcVVGzczQOLs6q30NXvBy2?=
 =?us-ascii?Q?EE/w91IUUFR/Z7d2TlhIZQnQmlBqzCbdAOW23L60iLQa917DJnAFhIQ1WOEY?=
 =?us-ascii?Q?kqE6FzgyAOTPTU+f1hbxZKRPhztga1N1qUy+ZBUGG7UVZuwVE3kGH/QngLZa?=
 =?us-ascii?Q?DQe4DcdFfiwzUgcmnVxIdhRXWO8Fvl4Rk1BXaX1xV//0WkpPiAqOrTlnHBBx?=
 =?us-ascii?Q?aEuK3uBjVm657wJSYuNrlFzCSpnFX3vkbkEdR15yYxA+lu+55g1yIo6L/qks?=
 =?us-ascii?Q?1S2nwvZKvjuxA32l1lA+G4BmDJOBeUq8bC47VL2l+qWyzkMQMHZWeFVb30/A?=
 =?us-ascii?Q?wAQFhLW6CuvIQJydaSFuVyXW4M7HYBEGo8cIe1NWmJLO/kN50mOMksnRBzRm?=
 =?us-ascii?Q?fYg7pSuAdCn9GBRF6baEJ1qZDy0AbqFYV3MWzkRu8oCk/30DKqaNtON1LYhe?=
 =?us-ascii?Q?RBeDg7ohwa9+Sw7euPJ/eTxuUJkF1gwmxbcoXQhOchH7mrhODDHbwvrm/zTj?=
 =?us-ascii?Q?J8bdCGxxSPGRPBzeqlkW8rNWi4+Gt+IiDN+dVuijAGjb/UtUtTfxx5K7gaoP?=
 =?us-ascii?Q?A+EZOhyzPBGRgMxz0oinpMYz8mpTSCk5DQ/mp2uSKNzv59DIkcVtr1QTfuia?=
 =?us-ascii?Q?P72aWUuhVY8CC5v5pi6IqNppR9fj8kVw//QmbCOfMhZ2pR1jLq7tawQUS3V2?=
 =?us-ascii?Q?N4IV3KIC56mucqnxcTmSJL1ONIc1cJspJOuR14P1UdApejlkYiOjzFP2Hi0Y?=
 =?us-ascii?Q?OjLehrkSIDip4Tjn+24yn/MfoL6tSlXmNZ491JlbkxtDLNia7Tt0ywyClIr8?=
 =?us-ascii?Q?tSUyS+G6XHVk0fRc64pQfFqN3hJkAGXt/Qjd0IBRbJPqa/BpImbB/SS4o76R?=
 =?us-ascii?Q?RVnp6wSapcYBIApcZDcJI7a2SUoUEzcqOIF9ztqqOgtIpyFKl4dZ2DgIi3+m?=
 =?us-ascii?Q?wOOy5ueowchxsehQ0BHHkQasdWwBvp9gd6+0eTs+E5cfOumZpP6DhXkP3uC6?=
 =?us-ascii?Q?Ogn6YNg3qHPkhydFkwCLacWUKksFE9hMsOLxOuH/gMiOqWfe40Lf1p8oXlfl?=
 =?us-ascii?Q?WrDvWcIFpJYEomvx5QMwxGAlTXrfmi3y/ixczY4QfA/Q7k12T4EOOdHeux57?=
 =?us-ascii?Q?HOan6uYfUiVVe0euq0KrYSwufxlw4E4YfaOPRbvMi+ysvRhXUz+yoM2mowpp?=
 =?us-ascii?Q?eyi1dMKWmB0tzLPha0RMC5ZNOsBKFFVZY59owD15RkRAzcJJUgz3xZHT5b+m?=
 =?us-ascii?Q?HTVMwiS3prkxVkkH+JVwODcTVOYTeEYS9zb0CRiTDovtQutmCwnSNpOoqNCH?=
 =?us-ascii?Q?t5upz1+cnA1aonAunBQE+dmLpgyRiBo1c7M89TqCGr0T5VMks942/lpACrI9?=
 =?us-ascii?Q?l7H0Zwh9lYeksZNgYJ+VLpTBKnuI/9F01wGzNQXW56/u6EI7QW51OwDj3Uyi?=
 =?us-ascii?Q?HqNI2Zllw5a+equ3UJmyWeq9x9LSQQpp8iM4jiyXZN18rugZBIRULugyIxEB?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8c5da7-57f9-49b9-e350-08de1ca81805
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 20:15:41.9695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6CQTdjHlkw7DXyhslaEOPm1JZ/rkCFDK37/AWz+9GRfkb7WLraAtqwHmt5rL55nEyF7E5EB71oDWrHW7B24NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9346
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Nov 2025 20:15:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9426

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

Fixes: 389df3b77e
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc
index c430ffe5..0a99296a 100644
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
@@ -46,8 +46,8 @@ do_compile:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=3D
-		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
-		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
+		cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
+		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
 		cd -
 	fi
 }
@@ -58,9 +58,9 @@ do_install:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=3D
-		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
-		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
-                       --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${L=
IBVIRT_INSTALL_ARGS}
+		cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
+		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
+			--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
 		cd -
 	fi
 }
--=20
2.34.1


