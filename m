Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AE3D4337A
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 02:56:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4508.1731034564860230051
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 18:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1042324eef=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A82g3DI020569
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 8 Nov 2024 02:56:04 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5g62j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Nov 2024 02:56:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6wuhZTuTq4x4IGrjjlpyva8xZgcS8oiwGncJVx8rxcNKbgbfAcyoobP2qSm/8FPFFTPabo+MmaGAl57aR5VAeSvv0yWdwE4fetKaHDY6xWhNn5AB5ItcPyVQ2iR3W+YE7+29smKVkSTOBRQDzQIBVZpOT6hFba3hnTjZsCLdOpRA/5nfo0yAun1GHriz1t57c3lSmKS2jJORak3+yVQr9vNFkzmxma7237AOknTV9p/0O8/iAO0r3C/TwBXzjv4aAFlmWKdm6YxYyoV1fE/aoyjaY/1sNEmZ8Ba0vuLnPYMBrKT5sgMPwq4kgHojjNwmN7FIMGlHXv0RF26lBRgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g25EeHr+tJHfavDkP6PcZJ9bDEXJrB4iBi80O2wL3ag=;
 b=JCk3OUjuDSGcAM89E44kamnsL2yDqsq75lyPGjf7Bd2HO2UiKNYHaDNI8Bq1mau6UI2m1C4ACLeafLTGAW7/ggX57sOwSmwvXWJA/9vMgazBH1K5cIjAPT1EiX4OAFfe3Ycza1zoQaYHqdTvQ3ESlIMVZhXy5bcn2RGprcWmWBLMpS/HBY+iykj/onPagPR7kYEMgtrBNvXRyOeNN/thn1tyuGGhz+xXKzWJqUfIlGCWkORah1lNgiJM5F0gETb7nm2AscFwB2VRQICto+2lqpdaPN7d/66xdvWjz6d4bL6IezVlJ/nU4GplvszzHCtIskocLVpOIAjbFnYYmSkXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 02:56:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 02:56:00 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] libvirt: set USERADD_DEPENDS to avoid package_write_rpm failure
Date: Thu,  7 Nov 2024 18:55:47 -0800
Message-Id: <20241108025547.2149297-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f971f8-d865-42f8-5405-08dcffa0e028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6+q0+dxBjfzBZzzUCqHmQ5azy0PVekoxDMEpnbuVz3LzroUUk4uSlJ0BqjBN?=
 =?us-ascii?Q?eVMFIK8i1n+/+psrw+gvFAV992CFwiWQoiVBDFE+TW5kNDV8uRFvXTuCx2Yu?=
 =?us-ascii?Q?8dd1Wb4bBoOFCVHmQShoa9T+Mpn7Xdux21eAI2qW5ApTGwIwYqPn5cW5gEA6?=
 =?us-ascii?Q?lZVdcwOvAoKD1WBpsCT3Cp/i+VrTaXL2Opas5RRS+N6jp5+GWzZ/ZT6Z2bky?=
 =?us-ascii?Q?0vJd1sQXBHC1z1zQFmcmWGtvCrXx2hAcnTx8rWR54y4iKG/Lb3qEb+giSRIq?=
 =?us-ascii?Q?h/6OT7SDWtOG3UQmCvCgNuv7F+OvgEBVlRUV38Ef/xlOnqKlh99E2xg6KJEs?=
 =?us-ascii?Q?xazkO52JeTqY6aVsc/X+me5swFi+WHAx2DrmsqNN30yfW4xlICEP+KhOSF6/?=
 =?us-ascii?Q?6idogJoSImgvw+RPTO6TXEnwEn7l9pznf2OnxDo5JD8Q3BadATHNviC/hxF/?=
 =?us-ascii?Q?k1jSRqKis8b/j80tj7L33vJY+NMz3bZ/3fda2jMypbRTDtKMu3KixFU92yLX?=
 =?us-ascii?Q?JMcqVQuqOzXOeK6L8Y+zzAOD6GMzi3LrzMFRTYpyDMNog3PlN0UA1kqzXFMo?=
 =?us-ascii?Q?n2pR5GS7CniEcm9E4SY8k6N7lPMEGs+hqDze5K7Lr+0EpbJFrR0QBEwH8iwi?=
 =?us-ascii?Q?bdRCEMkF1y4tNIvKwZuoG+R+WXGFYqnkqmI2IkXV0cwP9bezz93l05j/2QzU?=
 =?us-ascii?Q?JUrnp164Zsh87QpYLyKzo8Mf7HShDnRX2e3Hik9oy5PGh1jEug/4uC2mriq6?=
 =?us-ascii?Q?jM0sawOFIscCX/xCbxxHfUqe40cEFmYvW+w/J9K00PbHcdACwosIbf6MCPKx?=
 =?us-ascii?Q?sGD40SRmhza6zj0vmAmLRVehkX+YwioaydU2FBDGMGL+4plAFMfrJWGEDQ5h?=
 =?us-ascii?Q?VWMqf2pqu3ITu2Y7MiuHDClm5zkiWda8T4jlsarCCncV1n6MZoAMhk7YF1To?=
 =?us-ascii?Q?GMZNDHP5pBJ2YksVT53+OZajaIQRwsv/JlbAUKDsgdT0FtFPCE2KY4JQrHNl?=
 =?us-ascii?Q?pXc2EpVCSzWDWtwUNObUzwn/tuHKSfE1RMonkURiclCwkAN61+LrQYwgaWVT?=
 =?us-ascii?Q?KU2LxHibydBTj9Au3vn6xEOFfp6WC6M4dr4Ns+QIt6HBRyj2molJi7NzUSuI?=
 =?us-ascii?Q?KMwJVVdlkhJLNaPR0+b25h/kazKSOt0M+DKMFvR1FcV7Mk9iqfZiN5SDVFE7?=
 =?us-ascii?Q?OjD2OuIB0+kDDTuW5zjjndRddbrkJQ8zRHjEpc4yLTzzsBVdYM6ZVNs1Xnch?=
 =?us-ascii?Q?ubtgIVYsfaeQFnkvYJ5NWTDp4/JUOBDwpCEKVLo+vXhzTjs1DODK4Py1Ywln?=
 =?us-ascii?Q?6SxLd97RFck/DQCikWkRLwZ5a9nhY4AubKRsF/sKdY0CNzLPYDA4bw9a5VVZ?=
 =?us-ascii?Q?L2LuKMA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0s7B7KQZ9OnIifYTkhv8qvqFBZhhJHs9FA6rrrf6JMXKlC1/mq6rkNmZ2I9m?=
 =?us-ascii?Q?9QQlAwXFLypI2tW8EISaBWEEA1W44j4wfhhl7FbQGrQPVI9LdCkjVApMQORN?=
 =?us-ascii?Q?lE44L0/VdlRTCLwpQ2Pjaa/l772yCLFyZDJvhqJu78IrvuD3YxUFyDAUFxhB?=
 =?us-ascii?Q?Vj+h7+WpMgYCCplg4IACnSFQcinP57izN6CUoib/6sjS5leBMzmvDFUYVAUh?=
 =?us-ascii?Q?1DawnwJK3FPtzCJoxG/dTiMtE8JlMZS8m+/UlcAHmxRuSZ8H5hEe3osX/j1z?=
 =?us-ascii?Q?q+QivYjzd8MzE1JDoqN0+IQa12i0cgdoRheEAnxGwBLBI9D6dGBzD0pIYwsq?=
 =?us-ascii?Q?L513SVIRpDsWQmrtI9G6rf5CY3If/8w9/UHqj7gsskwyl5agfdxKR3DirDce?=
 =?us-ascii?Q?3LtYcsQwU8jkHTJ5mVMQkD3vMkE78sa3f0roonYFEXkD+oovkaslaLbo9FM1?=
 =?us-ascii?Q?9WZGpp/EmaxaGuj5reJIdLFWgOkj68OGpzPHI71aoLOr6iLmIbSV0JG5bEEB?=
 =?us-ascii?Q?TjKOJauy5cW21JEIFqaVZMyl+W6urIqIqNjCBLH2plK4TP0M+CO+H2viWfuU?=
 =?us-ascii?Q?53I3EdQ5C3XUitUbav9Oa9F1Q6/UNNiYZAf7qPX/XsaTlm+XoRRg0+EquJF2?=
 =?us-ascii?Q?MYPi4peFnoOsItVi4U8bvZwGIzefShQmSWX+rsWZr43HCvAG49LxcRRvvHhr?=
 =?us-ascii?Q?6GcSKu7dbwfxLVIRktG97YRSo7ZwxG7hFohKq9Qva08GkXcFOmOCYeykt0+4?=
 =?us-ascii?Q?A46dzd+4Qn3Ub4WBQGt+Q4NBu6GIkybY+4F5WS2HNauUMTqns7k+2czND4Rl?=
 =?us-ascii?Q?X8rM84OzbJ3K/BUWIGqP1xf5CK/MaMGsO5hUStq+GpzmxmsGI4gGhiHd6lFA?=
 =?us-ascii?Q?Bvii6MgUkgzBwlbWNFSjJ/qWk/BMo89gAy3FTAAGecVhebvY+/vV0rOztW5+?=
 =?us-ascii?Q?0QBHgySpzYTBnuCNoW8cQSdDhGSVbs+jdg5j/jIE6vnwjApHFwUTPe2Jhj3z?=
 =?us-ascii?Q?3/bW0uXk3oTRnN9riUzYaFtsVv2g/0+zAQJN0sgngDATW1KRIwcPXXOxouJk?=
 =?us-ascii?Q?ETUcZsTMJhzDqGYYQUoqzq8QmRvSfx9GP2hmu86uM9j1tg0UfghaS9E50Vua?=
 =?us-ascii?Q?AY6opFrkJnUeH4OFteORhEqy2kR8q9WyENyEan3Jv28TX3brBSgoYKTrrVyv?=
 =?us-ascii?Q?SkbgllcHgo4egc6GNxhf0UxnaxMoFUI/ABbWyfYdI/hxbMpUIOFY8baaqsA+?=
 =?us-ascii?Q?PG8bAF8HSCVqMZEjHClBgdImQeSGwN2BV4mkuUcX237qooNqzpj+6rIxgt2p?=
 =?us-ascii?Q?kTi7f1Iwn0BAK7q+7DR/oYsyQNmIb0zMBR1SuTv92Xf+Xfq5U3zjS5CVFsFm?=
 =?us-ascii?Q?Axlo84+EglRhFExmpVb0Mb7ckG42mbWHozgFjs+DArC1M/uHxmWSE8LWELkF?=
 =?us-ascii?Q?155VjiMOna7nOfXOvkpCLJVt3gAWF7a/UffpXJ+TGB+9crxGEI+kPYtbGrJo?=
 =?us-ascii?Q?BtYNQw3AbqLEENrjB+VmmzS6ilI5jXHAd+AdtZ/c2kdRmqW4aWW2k4F3BP+K?=
 =?us-ascii?Q?+AOwW+UClxx3TZx5JObzMbQHKzYTBPMj6UBv9EHNMEUYQz97bVkKIlC7GCSW?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f971f8-d865-42f8-5405-08dcffa0e028
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 02:56:00.3594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3srFOjNkkJ74xa2tzse4OTIUypXjYEAZji0Ij62c4Urjl6jJRN4MVjcM7zIdLrYLSNFmpPgDPZg9D7ijgSkaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-GUID: JxwkfbInPXGbxoJxODVLQBqmi6XS7kT5
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672d7dc3 cx=c_pps a=YTelpZo7+Gv92UPfPuytLw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VZzbbjECq-QA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=TFyhVo88PvdufWDY40MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JxwkfbInPXGbxoJxODVLQBqmi6XS7kT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_02,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=733 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Nov 2024 02:56:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8960

From: Chen Qi <Qi.Chen@windriver.com>

When do_package uses state cache and is not re-run but do_package_write_rpm
is re-run, then we get the following error:

  Exception: KeyError: 'getpwuid(): uid not found: 996'

This is because libvirt does chown to polkitd in do_install and polkitd
is from polkit.

Here's an easy way to reproduce this issue:

  bitbake libvirt -c cleansstate && bitbake libvirt -c package && \
  bitbake libvirt -c clean && bitbake libvirt -c package_write_rpm

So make use of USERADD_DEPENDS to ensure polkitd exists to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/libvirt/libvirt_10.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index a33b6980..22193ff3 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -11,6 +11,8 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
 	   ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
 
+USERADD_DEPENDS = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit', '', d)}"
+
 # libvirt-guests.sh needs gettext.sh
 #
 RDEPENDS:${PN} = "gettext-runtime"
-- 
2.25.1


