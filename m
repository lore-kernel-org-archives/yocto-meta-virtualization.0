Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098C9CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 13:15:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15042.1762434913127250103
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 05:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ctoy0VSJ;
 spf=pass (domain: oss.nxp.com, ip: 52.101.65.12, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uniRsGdcPUULSxvIyx3AFTKTlYfyEcr29cMsWiKU7OQfVmV2Wh9NTtaQ15eSEFj0pQazchQsgLjwNFS+VBzdSrXGHuM+JRhqWTsjjDxGlU3ArFGa34dbUhj0qmon3jfuZc1LmKKrn1u5Dv/A6JwWEvAftO7IdUeQJXRhZnI2dvmaxgztOq1nRRqZoxcsz5J2NBZ3uRJQIkSnlAAB0L77rL1eHaevITuamKVjHHzlJxOBPDqozfcEUwk4GZETAkVYSNkBhw9oJdFl4R2JlR2k3xdxWM7M+f4ZzCQuJgoXKZIRrkrFQLccjwqCfXFy60XfAwFST+dOSI0LtkWLWjDcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOFGmIN2nm3dX9LOcyBO6j9h/1Ts5j3rWgJd2Q41l04=;
 b=JUkv78gqYcWXtbCGa6p6nhhA5k3+z/o09F5HUrVRTwQ/el+QqAJorOIRgKD7jAS7zac8jLXvqOvFF7C1zLnG++AF+/o2q4qdXbr4dgs0wPIlWvH2vkKkHG3ilkhJcrz40dxK0ZfcyxbUbpOnH33Mo59c6SgCAHrgyqNdvSo2TLl6PipVfWQ8ebnOTObG/FlCcfsqcQoBB3qp7GcvBlWy0O2Pjek5SmFejA931yPUY63JpuR1sl8JAML/jWDDAoI7Or3oxyDW7wCSihZ9vtQpniMSoo3DS6wODD5XsyWbxgwqwh1DP6tbR0SO6FCmITSeGlAUqxlb+jBGQcuzmtR8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOFGmIN2nm3dX9LOcyBO6j9h/1Ts5j3rWgJd2Q41l04=;
 b=ctoy0VSJb3h1tRLjFXQZeW3/4BA/JUxEtxzaPc6p/lwnOlzta9qKvpoZnsKHUy8ZFpeOtj0EWX6uljukSyFN1j9WBKNSQOLEkcp11rWnHP8vXM4t5MspQWgUXgYmzlZbXS+If7ZprtBN+M3V+NfaELqBd7Txf5X67ZM/l/QpGV3RSrIF6p/7xrkcW9Jg4kUwcHkBg1V6rsFKQUqFmimXy7p300DWDzoae2Ru48sCpzOQjYxIxCyVq7OKMG7TleWDnC7yh+4dFnngMUVMfqBmxjCLycsV/VR0dfL/NWSbwfgpIO5aOvv/Ekl+hOTPClmtPqYYyEuT9jXezAomisADQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PR3PR04MB7289.eurprd04.prod.outlook.com (2603:10a6:102:8a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:15:09 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:15:08 +0000
From: "Tom Hochstein (OSS)" <tom.hochstein@oss.nxp.com>
To: meta-virtualization@lists.yoctoproject.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [meta-virtualization][PATCH v2] libvirt: Fix missing libvirt-python
Date: Thu,  6 Nov 2025 07:14:37 -0600
Message-ID: <20251106131437.589960-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:5:74::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PR3PR04MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd01aee-1c2e-4a2a-8740-08de1d368265
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PAZMs2GA6BDMrrqN1QAYwztwWKL64I5ZduHyo/HIhJV8uLrHMQCP18Y7P1/Z?=
 =?us-ascii?Q?uUFItisRM6kaL7caQe1GVNYB6/kM5fqyl3x37MnMb0ZBf0L4e8sO8K/wii4f?=
 =?us-ascii?Q?ozHeLKjm2ZfSn0wcYpWdYfrCXgHEIQCUiNCAxZXk62hTVcwnkE5iTR0ImTQ2?=
 =?us-ascii?Q?nArx9lnjJUVikaScusZJ8x111lNjx2zm0Hs1KiQQXL2Pdrm4tsXRTkxlMqk/?=
 =?us-ascii?Q?fjrSqaU76XlhTP6CcSYh0Hz9BJjuJDEjI6qR9nSmMIg4DQGzWCzWkYcTonc4?=
 =?us-ascii?Q?SUcu4AVI/vxaLPKxc0NKOIkpLut/pXKIKv0Klm6h0zI1vTPgmW35DnupPhZu?=
 =?us-ascii?Q?Xo7ZFDoHNKY++Ufj9SV5GgADcnKvElSwqsxBfp5mk3Kun4ZtvUSidk57WJoK?=
 =?us-ascii?Q?YkSo6/fivnKNg8zsfesNY7HuNZpHGg/Hpr5ukMYMz0kM8gpocRJw8vZmwPjM?=
 =?us-ascii?Q?LHJCLzZfDRiQlxZ79O9Ue8Ix5cgmODnzV5UUEi4B4asyFJ2voGp3S0e+SWSn?=
 =?us-ascii?Q?mX0BuJ4JIcAC2MoEhuye7ib2mlbBga69mHSLcxQ30/RWwcCFZqdNjEg4b4gW?=
 =?us-ascii?Q?/9SkuL33afR9IHB+eRwmsChwgLJCZpvY+esqQcalmHUM5Wl8vFyWnOg/CX3G?=
 =?us-ascii?Q?r7A6fQ+FEv8dqWtz7J5sa8t2mi2g9Hz4yZQx6LsFq7DbdYfrhBUDUyLFxZzJ?=
 =?us-ascii?Q?gFCPXLi/e4WgaBpy237wg9jwnHQd/VSJMkaFNELHC8chq9LNnpVaAxedv60t?=
 =?us-ascii?Q?uJvWVdlQ2ncKT1XNxxaKnpeIPoq71cCJGrC7vWCHbS1KZqTV8WJiHWgqSWRh?=
 =?us-ascii?Q?gqJHrUufWLsR88atup67PaDifS3C+zt5szoX97TzWhIjY2dqgaujZmMaCNsd?=
 =?us-ascii?Q?CIMQNKqFFOD3e+4qTr07l/IHVIekXrTU/Wuj+FP9ann+wDKTxHSRFyo95c1V?=
 =?us-ascii?Q?czzFQbXplZRxTHltmjrjY0JN63jjIcwbhCWhUqw6aRrJHM1/j4GK9V5m6FHP?=
 =?us-ascii?Q?G79v7aGBfIuZsF1GxNqpZJHkAatHwPHW1wzfXY25LxDnrma5rOush6EqlRzp?=
 =?us-ascii?Q?s1GP880XwF9f2V3PShMrJwDcDmfQSaWZXIa62n7Zmjfp0e4N2OIdilxr1pAI?=
 =?us-ascii?Q?pdBp47KPIAtZw0P75teMrwqSAzxapUJUKxvV6A9Qi41yb4yzuJBeI/7cv8mb?=
 =?us-ascii?Q?tGmIq7NInt5GNYrSTCwXcYkrlCcqlCgD2vqF/ReKsBEhs05AN0kucgwpJfjX?=
 =?us-ascii?Q?Pu3+b7D0BhBnGDYu6XgCoCeTvYCSPEvcOEjLvt7UIbzCR1ZhsEYpe37TBX+L?=
 =?us-ascii?Q?cF/lmxC47Ihc+X2XkzYteJIwI4d7w1OedRpmq1kgOQzaJ11uSyxPVHUP9473?=
 =?us-ascii?Q?PixiEbfKbK89NjQxGsdQCOP+HI+AE7SF2PWOav15eRR/4hZZ4Pp15RkRa4Tg?=
 =?us-ascii?Q?uuH7xMJspr87/qRfGCAURqmhC4/YLMzZX86eCltgwwnHj0bmy1hi19YzZoya?=
 =?us-ascii?Q?GBozjfjjt6QfjwdVA/BtUGexkrNi880bvboJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ixQMpvXgZkcGprxlJesJ8hWq4Pxp3BnmBf8YdPDNqA4WYM/3gXcarp3GSjMP?=
 =?us-ascii?Q?HgjNuE4dkA/eF1jqCh3o/2PsFypwq97ZhsZWuFJUxLtLtkp8d6EaVv3O7MY5?=
 =?us-ascii?Q?dc5iZIvm1efpDleb8AfnvPM0RrlDy4N9ehRTNSKil4KPTCeETxTqwoYcTd/+?=
 =?us-ascii?Q?GzvUTYwZeWQh1lFcSOY6L1SGWitp/MUuo14qD+yULAfRnNUQfe+Uc8pCJme6?=
 =?us-ascii?Q?m7dIbDKsTeRq6FUBhJRRzjHNVj3N/5DTVkMNt+naJAGWbjOjKbzvBTC4whxh?=
 =?us-ascii?Q?mGbM35pIsMDZUeXFDovY1XMTojnR1qEyJiIFVMNRFN6naTKAvfIURBw25Dgt?=
 =?us-ascii?Q?dK7+GCyJ7ZFFjTf4Pn+ovLaqNslgIk4nSnQdic6RL2dQJXEbX5v5VR9FWRb/?=
 =?us-ascii?Q?9aZ1pk0EHCO5DPrYJqnqLQsyKtO4QTugw0DZ7+g+/O9PpCtXdXduMgZg72US?=
 =?us-ascii?Q?5tuxS+2QST11tDK9nijj9ipST2Ie9eapsb8VacLgPeti1kZfGV4eDcazO5Dz?=
 =?us-ascii?Q?OLUO+PwcMKQmNacdOjC24YROzmHl0AoOipQTzhCAx/ZsplihO7qr8kafHeIZ?=
 =?us-ascii?Q?60YQm2/KPq/At4E6C/s329SOzwkG4yhvHBwzqkEoDTTS1YeLSupVUNKCalIB?=
 =?us-ascii?Q?xEr2iKVSaic+Ak9yK2VzsGi48mw1yNNHJgRM9IYzDke6kKEJ7dgWE+RqS948?=
 =?us-ascii?Q?9l6mtWGJtOygzODNhyIsb3bgUTC6l8Qkujbj/uXAmtSHzvcuIULQCFiidnDi?=
 =?us-ascii?Q?oyppWHxyyiQY6wxYjLNR8xbWgr9EX//zAav2VmJ5ceQjmqY+uj0AvPcMpfmR?=
 =?us-ascii?Q?W3YExqZL3oopaYbiyZy0KRq0cGTR8jRAbtfQ8jRBrNsePZKSxQ3dnHDc/NuC?=
 =?us-ascii?Q?XBM4iAlGJu6Ay4f63SfsLp5WQ1dmRi0iSSb3P9KnUY29mOOR8W0xReJtaaLU?=
 =?us-ascii?Q?A/dgzOLcNXY4d7pR56tVm297/SI8nc5n+kO9eN0HO4GnjHdWgtPSJ6CNSfT6?=
 =?us-ascii?Q?u1hIXfqn79158+Pu0uOYo9pv+6VPhg/bhXSezUEnfYO66s/mugkucYv6goBt?=
 =?us-ascii?Q?U2KQzHt01FEIVQNzTWjrCiZXtJcRU7IaD3lWXNAvWPWvU6R/9exOfBIehPeR?=
 =?us-ascii?Q?hKvT5W7uYouBVnN5yoi97a6IbCGF5odQYrHsYcq76P67I/xGZIlihg158GeQ?=
 =?us-ascii?Q?VwXZg+uKgDWQQzAUQwnpRBsnQbUaRIVETxq7V2GyDYprbjq7uD+B7rjbn7iB?=
 =?us-ascii?Q?RiL+87FzVbc9CXTUnfYVn00Juq/MHNhnjxIOlY1a2PwK1SM6DORQtq11EJy6?=
 =?us-ascii?Q?UCcsOaHKKOVToEqTVInJ87eiaFwFT5NG/p+0zMq2+i9Qz1grmE+W+nTjLIBM?=
 =?us-ascii?Q?LdG4N6ISS2sfuVbNG/EFt+n41jzVThLZ3SBL94Deec7IlGwItG5/eW2hfH+m?=
 =?us-ascii?Q?pO/cUKHgfnhN0xJyMb4R/EuWGHN0Pdb6UH42J4hW2FZ4vX6Fu3zwmYRrsUA8?=
 =?us-ascii?Q?AfQ8BH5KDkhSzHPCmZMy81d62JwpUglMziPUouVbaygEI4WhQR+Ji83w22K/?=
 =?us-ascii?Q?igTZy2B9p1YzRHMR/i3JcsZR1+y2mGFihK2dTwFMchBfMmXbKt/vDEG6pRti?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd01aee-1c2e-4a2a-8740-08de1d368265
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:15:08.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07pmc0qMnLfA8y+lilXOIEeu3M0ve7h4eeA8wHidhkKmC/4BOPJG17rwVqX1ZRrixQraSbOR0yz+PgiZu9hBMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7289
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 13:15:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9429

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


