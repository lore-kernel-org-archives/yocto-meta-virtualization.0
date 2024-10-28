Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034D1D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 07:36:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46150.1730100981996185634
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 00:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0031103954=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S6KnJJ006352
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 00:36:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gyxjshvf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 00:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WznM/T8Jz6LFsWGt4p20wuV9qBv6pMOvByFdgLDR+76+qPAhMBJR/Q1qM3c30ehZYDzwjccUkx294m/vI1LNOQ3y0oXtnViS1DB7Y24YXXObknc04gQlLQ+Shi/oXOYWcsMZ4SAla/vm6m8jsEBsjvrCf6Luj6ZTi/KNFrfLuNzVKU980NszGjH5mmCYCT01WbAY000uOLWIWR2iKdoDLt9GIcSffHB3Y2losX1HPsr1Uh8LVmLpHA2uQkkjqjxnjoGogkVr2QHNkbJ+kyEiKwju75iW7Ptu2Qin8SPmXbJZq7sokPAUXNx1uRH/LTxRuSTIL1g9YrwkC+kj5o8mdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBRdty4JZA9AAbk2fRaISXqaVDI4BlEqNm8gNnoiiuw=;
 b=TfkgAnhqya+NbkviLby95XisuvKUsYfEBddkiy4DmupSq9ONkO7Ydmjpzur63mPUF42DR/p3gUTFuNBMbxIulsZkqnOrT5w+30ixrUyV0dnsCEIuBGx0ItpxuMaGbabr/OQTTDcQcRncLptTKKAUwcp+sJrg5IUON56aSs+ZBwf0ML8V/aMfP2o8UDcFLJLQc4cYMSP/+TWBDaUv2PS5zT6yTc+yA/gAlF7Kcgd5T6zfAaB37PsS6cBkc7Z/RjtH5oAO/qj2Z+fTwJFVN983COcz//S8B646VmUOTxk10bBVM3uXnNH0dqFuehOWICnTW/uRQocL1grMfCCaM3wY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 07:36:19 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 07:36:19 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: don't allow named listening IPv6 address on lxcbrX network interface
Date: Mon, 28 Oct 2024 15:38:46 +0800
Message-Id: <20241028073846.1087759-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com>
References: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa8efab-0d68-42b8-ec32-08dcf72336b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qeuTy+XRE7o2pXyiw+5rV3+tXFmzjYFBjvgxCBF7+v1Z/xnNusNtMrk6idUn?=
 =?us-ascii?Q?HOc3JQqbF+bYHr83UDl5w34uD8VOD963xo4TZQiDURB2eK04uLxnZWPy3GhY?=
 =?us-ascii?Q?lFpJnCO87AXN6mc/WsIMxmfV1yitkUcNuuqm0DL5BaFcnGraEVMmQ/VH2InF?=
 =?us-ascii?Q?Iuo/2JG15MOp00IjHj955v0kLlHnpLlsh4MIMRjdbAYrREwYQfyTmHGogGQ3?=
 =?us-ascii?Q?Rc21ji78oifi7h6Zt56ceXY6jf/V9AXMkN+AQXMzeGpPN4kc0irh5QYFnb7k?=
 =?us-ascii?Q?6RyBnCsHOd+hpYtViObBqUmF1VQSyry3e0UBwTaS/uOeekm7BvAaElZFUsmy?=
 =?us-ascii?Q?yVvUYu03U6JArvN5+tRb2vQ10097J7SEbVmn39Y5dtoOtKispTE2PpCr07cw?=
 =?us-ascii?Q?u2xlMaX96U8BUHDeLBMA/dpnpWbUKhvzPfTzMzeIJIIWuOX+lzQ4qUxvg+j9?=
 =?us-ascii?Q?0Zq3GtZcm0/vTg12ny1KX5PAq2U7I1qs4NXfJ0OxWyEmcEbsBs/g7BNbjSDB?=
 =?us-ascii?Q?CIQe7U4Sapi96LBmbXb3pwJN3FAdX0VqfcEKSfGNcDOFve21aUCNAA1jzwzJ?=
 =?us-ascii?Q?GVvtqNbHqRDSoQPRvYhEiBvC6171HtqvDZ/WwbqV6BQjZJ8u5lSk2sD0zOvw?=
 =?us-ascii?Q?PfJqkkTXLiEVuvnde8CBDarls8uokF2/VqwSHZXrrBJ0YsWYnhUub+NFEJv/?=
 =?us-ascii?Q?mb0Q+wfzKj8i7Sa6XwET5CSV9GgWdVGx+HEslmXnZkW90BzvhmexT0HS524w?=
 =?us-ascii?Q?HCoEemywgMmByZhkciJp54GnQQWnZecU6KRfFccxG6g8p/g1GJE1pbPnlaOq?=
 =?us-ascii?Q?9I6UJxu/ZjdtAe3qjGhGHwg70D+dmAOfCw7al/5QzNJRiOREQXgQdHr7BT0w?=
 =?us-ascii?Q?hSsfGwzlbVkdUrZIy2x/mX9YfqtO+fvP220cDRQwbDvb1nu3RlTvkEJrOlDA?=
 =?us-ascii?Q?mzlodEXoBkGjy11bmFB5Z98hINTBLaSkzUquKxmJtmAZrbYGCaxYEzqcUuDn?=
 =?us-ascii?Q?NKj+xVvB5hfkgXCAJpuOapYhPTGLdthK3IGy5+RiYcW56W/aQQNOYYcfLSvQ?=
 =?us-ascii?Q?/HdjDcIoboCsOZ14bbR0AtYizcZcKS5vKvAP826Jwheg0Ucu9rrkQPh+6+gz?=
 =?us-ascii?Q?NiyxBFnJaexHdUU64YNhYh4c/RejwEuYpGhGoCx0y4elx1wmNQYsXazu+mtP?=
 =?us-ascii?Q?WwaP/lHKmIJiWJYzzFyjS3J91IcA8xZYsYSK6coAzY38itsxkxFyA+44o3Oj?=
 =?us-ascii?Q?oOFkyRD/6GQlQyFdh/RMNdw8yyKwBaMRJfA17TpfOk1irGlcret4GhvTQufK?=
 =?us-ascii?Q?GV+NQ5Qsq4Lul1zDjlCti7LM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qXbmW9u3c3aJTIw5JUiO1Si/fG4RI8jvmymHLnmSegOk2+o3nhXHBneNEcNV?=
 =?us-ascii?Q?0QPFMtduBN8cMyDC0mtfhAg69qqD6tcqGR7RsWIWjtT+eH6csFUQh/0qDlnQ?=
 =?us-ascii?Q?umeUl4ax0gC+O271cJkBeUSb9HBPdSU4i4hcGRsG/Krvcq1DlsVAfbldjHEM?=
 =?us-ascii?Q?Y09ePH8wkTHIVI3JqpxeALUSFLN0Dt7mXEUYrda/BVPV5h4v5a24XTxtL9ei?=
 =?us-ascii?Q?TsXjZNy58OftYaeCjFvd22cbgl94k/BaUUd130zESez8nSnLs1Sk4h3kub3h?=
 =?us-ascii?Q?GySvuKycSPsfzMS66FaZU4zyA7MBLcadwbqQkskSryQPcvMkS3xmDYBi8WyM?=
 =?us-ascii?Q?4FGl/LsXzgeVCPGo+XssF28WP/VDmKICPeOpLST5ma+TRFlvSYBRp62Mt71H?=
 =?us-ascii?Q?edoWWsrZuCEi/fL8oGgEwmWEfrLcpOjezXDZ7cMPpHcSkoCilyZEl89oeQhG?=
 =?us-ascii?Q?HwYCwKCT1/WflIr0N6QftVB+e+4id7VpM4e4uW5YgVY3sMW1cG7zFYht3VZX?=
 =?us-ascii?Q?uxCbkKQsnlgpf+1ms1C1fd+g72EFYhRk5Fpu/JE7qp0s+OeTMVa3BQoiJnrP?=
 =?us-ascii?Q?1WJ588hiTcOOBmwPBCo55654YxkIhn0CbSK7O3AEMhZk0bcQ+ggSw7ya3NUx?=
 =?us-ascii?Q?KPrZWagNk/Ua2IPk51xVt7IsmPQGgIBU9qaXj6wP2zuIIl8C/HwaNAJceqb2?=
 =?us-ascii?Q?CDx2xRGo2TGZ7C8qLrHm5q34i/JOEEfNinJnXYpQa7HABEH1MY/l+OQdGGcC?=
 =?us-ascii?Q?mEZLZ0ZN4b9SV5EsJto9/F3jFQubh5k7ed5Bzf8wEim3AudH35x3wFgMN9Sz?=
 =?us-ascii?Q?S1L7PmU6nzuTpMuj9E3g63X1CfXPnNfGyPIAJ7mDLr3qg9gchrvUUXsCZ/vZ?=
 =?us-ascii?Q?gvfOnCCIDZldSydNvE/YVB/+olvftm7EJjg6rJWYy5BfcBUQyvFZQonaJmn7?=
 =?us-ascii?Q?98xW8v9HA0xpXT8c3qc16SKsQd4zv+q22JAyQI6u0/H3Y8Cj2DCpw8duUqq3?=
 =?us-ascii?Q?rpIIxGSW7W0L2u9WQoWhQW2Nk5qyV/cIdJ/aRVcOz2bbVmcYKkcP22c566p0?=
 =?us-ascii?Q?8lmCsOf45u5UVmfax+pKVJXpOyhZbTfcHDZN/nR/newRu9utFVMPsBJqNA1E?=
 =?us-ascii?Q?ci5P5aJulq3PSGvE8w6+tL7KotpYmqirQaZIqhor8wi1tqWVDIcQ+sgOLE7v?=
 =?us-ascii?Q?CK6psqRuOrCRjxmVvKzqLre/4n2F1KlOeD5AMMtUhwq1s/2VsGAvKp1aZ7f5?=
 =?us-ascii?Q?XkSEpX0aE/GVEGJsHFFeWASD9ZMiJUZwyRp/R7KMeoWPB918tBkeLNxIuMCX?=
 =?us-ascii?Q?i8aJYtK5wC7sOl65HW6r8G/6E7qC/ClwBxnHzHL92DwrWHbUvohklB/Q++2A?=
 =?us-ascii?Q?rWUZo6GoB79CTAjNVn8b/OdSHlj74gbB9HIBs5K/rGobeUnBW57vdhc9s7uw?=
 =?us-ascii?Q?s8g//mt0qdzOton9NPsw2ddd2/SAmTV9gEUhI1o+vxg30SGv5vc0954wycZ2?=
 =?us-ascii?Q?x4BN5Ju+QMiX6QvxYxiizwLPf8TKO1IRuTMGsqBAxU/wdP0lRNP6sYMGAalH?=
 =?us-ascii?Q?Wo6xCQtho6oqYZXhNfaUmjdIUyp3jjM8M6j2qpjrns3U12/HdJG91dKJhpof?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa8efab-0d68-42b8-ec32-08dcf72336b9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:36:19.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57A22e+s1M23Ardu8vSgMBfryYRI6mpA+Lxfe3xqMk44ltgawPZNiOxFKXJCOMRPVyMOhygoF/oOXldhPHoX04GsjCO7ufxDW4EhJnT8fi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-Authority-Analysis: v=2.4 cv=eZtvfKEH c=1 sm=1 tr=0 ts=671f3ef5 cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=_Eqp4RXO4fwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=uNKKGHSHmfObZM9MBakA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: bKQrYWw6A_-jPJyoHheui_ncPLwGPmB4
X-Proofpoint-ORIG-GUID: bKQrYWw6A_-jPJyoHheui_ncPLwGPmB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410280062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 07:36:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8938

From: Xiangyu Chen <xiangyu.chen@windriver.com>

lxc-net enabled the IPv6 by default since v6.0.0[1], when named enabled on
system, the lxc-net which based on dnsmasq would fail to bind the IPv6
address on lxcbrX interface, that cause lxc cannot work correctly.

Add the lxc-net default v6 address to named.conf.option to tell named don't
bind and listen that address.

[1] https://github.com/lxc/lxc/commit/e8888344

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-core/bind/bind_virtualization.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
index a6e39049..f942d7ad 100644
--- a/recipes-core/bind/bind_virtualization.inc
+++ b/recipes-core/bind/bind_virtualization.inc
@@ -1,4 +1,4 @@
 # Tell named not to bother listening on the IP address that lxc and libvirtd handles itself.
 do_install:append() {
-	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
+	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc11:4514:1919:810::1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
 }
-- 
2.35.5


