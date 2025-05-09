Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3703FC3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 06:50:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8489.1746773449067701594
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 May 2025 23:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722441f21c=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5494xNR9027302
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 May 2025 23:50:48 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjxt19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 May 2025 23:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfxntT++0VuuAAxODLnxaWG1Lzei49P8WMgyBTm2BE8IUjEOFIG/8SlcaHBH/rBvt/KhWR+34yt0qbgYBjJ7kS4oBQ7HNKLcS2ypuSVDNg3yHxOR27V2uAFsIAuuUEJAW3VFpa7wvIehOM0WYVzj8oPXxwVnfd3nW06VLHk2klBUgh4bPgV2oFmb5hqTnS5Ea33zX8JnRMgAVYoeCvvdXXtln31SQB1gp7Aq9cK9S8W14scZMwL027Qq2evY4myTIY5vP2xujLBjSpZ7QbG8/eLnLSlru7TBwYNlGpGXMu69pwSWl5V5eppZ/iOiqtGDMU0aGljnulrjlaEYwfkGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz/SBO5+7+nHIwJTrV5RZa7h1SIt8mEVEdVwpCPA2tc=;
 b=W+OrCN7FXRL9Z9yPhaMZbvz2n3L8ve+/Ijq4pbY7f5pZmaA0n8hKTIDginfnlXUMFXgqZlmD8h2wtJkOlBLM4I3hUOl1F+yohFXOzdYzzis8ql4yM6yrb48EykyvisZJXgs553AxYVzgQvFIbko1vmCfOi8XpT5HBZRiA6GQNSkDXp0z4/TUP0FOPDCq6slHtzakCwgrcdu4hKIIvwhqVtXbHHnhyATcDjsrdXkRb57rJWR7va1IIw7iKwiYPa+4g6EQGIyyeMNax4cTBM79WuFA3vLfi/UVlpX2RYvah4mSdYyBGsxCMasnUKp9201BYyWsV6DOZwVvdAz+OgvpOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 06:50:46 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.8699.031; Fri, 9 May 2025
 06:50:46 +0000
From: guocai.he.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][walnascar][master][PATCH 1/1] libvirt: add groups of libvirt and virtlogin
Date: Fri,  9 May 2025 14:50:28 +0800
Message-Id: <20250509065028.560826-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::19) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 65db2270-cc4a-491c-900e-08dd8ec5d356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HNVzkeATpXkzgkYieblBQ46BoPnEFcXF1ItNXGlzAti/3jG6PQVeZ3OO8S0w?=
 =?us-ascii?Q?/fP0lJVK4UsTbd2/Dej2Z5rwqq9Duh6YY8DG4i7OhxGnJUkp8YNj7bQsMfsX?=
 =?us-ascii?Q?t/mAE8m8A2CtFANQ4/gdXXCfXcDGXuyTRXiiW31XqEmE7pNQAjLuMosaOuWk?=
 =?us-ascii?Q?3jaLddzV+fA3Iz6i4b83+T4M95jDlZw1FzQjsWHd7m/5OZT9qHxlrr5S0xen?=
 =?us-ascii?Q?2BWbsNyaQ1EH7Hmg4U9/XBiikqZ6yIZL1SHbA/Y71Or2JLDWh/gHG1LX13MO?=
 =?us-ascii?Q?skeFDXInrovMHh4hYQGGprIx9x1g9C+qmO+JHfRL0WMUgo4u46a9LdJEuZcz?=
 =?us-ascii?Q?XUf4C40sIgDb7mPVA2dWA6ymd58sLkH1CKxMLNS/zDb5GC1+ZNKq95RNlJrq?=
 =?us-ascii?Q?JWLvQSK89KIyW//RhRlrX07PQukfOk7eTebUjqdnFeYnX8QDHTFfN1+rr9WQ?=
 =?us-ascii?Q?smEZnSLn0VIRmocd5cYsIdd21eJe7gjNHXMS0jS5HKLwCtG9hGBvf0II9Jd5?=
 =?us-ascii?Q?YcgS3el5XXwrKGeTZvmkCrhCDRjycvafQ8fzIGpmx10QcFgW2elsczjkCa4X?=
 =?us-ascii?Q?Z+pMXVdrNWqTCL8ouqNgifqAB87alPoymKmMAJbejjOZmlBq+2ObucP+q6wJ?=
 =?us-ascii?Q?HhJuMvPc3o5+2bDjVk1oFTPIDTQW/L4XErR8i5AuDPMfzfP0Xve80d/t3kJD?=
 =?us-ascii?Q?O63hKqMCUDr+yHD8wB5QykimbZFGaGoXD+SdkRQzMj1pvFk7cavs4aB5nuSd?=
 =?us-ascii?Q?l2bDmv5MLbXxa1D+VBnYmp1C0ug3gF0SDY9BTXHDza0Xif+KjXR1ols9Skq6?=
 =?us-ascii?Q?KwiTEJDU5KgFXfyo2CrokCtS7DSfL3/JD4maqQvzpoKL5tFle5kxxZ002tiD?=
 =?us-ascii?Q?5ArZx/OwWU3FZqZPAdnntZHLXbDH1Az5Y4SEd5Q31T4oQ+zd3cdnUN5conES?=
 =?us-ascii?Q?dngVeQwVLpjEJjm67IpJAKeQQdBS5aPpRnmOXHZDLnbNbplvj5l9nNSS+tS7?=
 =?us-ascii?Q?bNkIOqMToGldf9dVNJh11s6fnUPhHAkQYhwy5sUzyMyaTsQgXQhPumxNbr4C?=
 =?us-ascii?Q?AGZK/NtX8pMaIDtrJtvaJNQT18fo103g75JUjUZjtmSASy4bzJsXxVMOnmsd?=
 =?us-ascii?Q?8wUuVDbLvLeSOv887rwMyzjHhU1+XQQtW+mxEOHV9IpUZPAdvDj6SvsT1a19?=
 =?us-ascii?Q?1WL4e/4sTn+b4EUNJSr1zy3DBCo1q8xaGP0N7CaIF9LfQFRf2h805FUHfO1d?=
 =?us-ascii?Q?r/bBY3QLEb0PNq0OYvfBf+uVTccPi+LVfo0ijEnm+7djPaCBH9zQco9ZzoXv?=
 =?us-ascii?Q?AeQnxPdSKHRxewZDI+1fNe/h1Ym/zcdbVfJxFy5LzUgPKEjcF9HdlZcw7h9K?=
 =?us-ascii?Q?ZqaxONR3WqeM2a5KzYj58ufLbC3QoEkaS0SvmR2ZW9zRnHOn5JFF3RpDburv?=
 =?us-ascii?Q?c5p34U5ln0Xia7TGQ+eqoRhMyZXGboVI+Ma36nU5a8rf0ydEbPHB7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W/27MhfnJr1SqIGup9nWBNnYOwi/QE1nAnmE+aLEEJbF4IORakRM9VW1xOlA?=
 =?us-ascii?Q?IBcRJnxYWFMx2hfRuFzjaEiqxfqKRlqxnt5DMxbILIw9Vwida+z2PvSF1WUP?=
 =?us-ascii?Q?9CbG2bQiYveEthYpZSuzrrYCl0GN0Jl4hQt71wmHHcQWFYtbzIZz3zQkKbWT?=
 =?us-ascii?Q?dVmCHClHEyZBd0MZjt/IdhxnaeNdNtr9iXlcc8GxSdiCpoogJrEHy3hDig+L?=
 =?us-ascii?Q?YuhdjNjHaV621Mins9McfuQylR+ZjGMJPLc7Nq8CxcIZ9ieCiEY2Jo2whsuE?=
 =?us-ascii?Q?4hIJOYbqXaagzp4QzSBIpaFJnfViaJssx3oVj4mZZv8afIiklM316CGR/ASZ?=
 =?us-ascii?Q?O5w42mXIaaxQdtu1ZMMM1Txp47aYTcrZHwTlZjq/uw64j2FRcd4fKDlsap/E?=
 =?us-ascii?Q?3htyXZ6D3ysd9jAeIZHIqXQGINiK1i80KbYNNk0T0hW1l91hqTUsAfKhEjUb?=
 =?us-ascii?Q?2AiLY0F4HfG4L/93UvL3ctObqCJd0XFJLPsIjvPi6sXtsWr/TMMycjxECbSr?=
 =?us-ascii?Q?fuNpMNPSPVTFrbdKOSwX9MATWWgYj0TvOAmDlGNo9vWc5lERngy36+89GGE/?=
 =?us-ascii?Q?wxoPZPxA124OmHQJxSnLwydMqGlihFGsU62xJjgV9wfdvGkw9S4iVzAqpTxk?=
 =?us-ascii?Q?YD5cMVhl3glXvHQVQN5FM+4pyq4+0I5Zr1u2i7irXorFjakz9C6BIaeHvm4f?=
 =?us-ascii?Q?6VDQjdb/g/gxn05dJNjXkqB0D/pN0GSawHUU4NLPSRP/03rO0ewpwTywZBoM?=
 =?us-ascii?Q?9j4E0km8DGBDC8B1WdR/drEWQfK+0J7u3f2i0jJqBtguWYRfxiap9hurcKFM?=
 =?us-ascii?Q?Jzx8JCLEscFe9FhOQzhYXG023206uOlZVJHIMorjqPVfp5BhIFdJAOSEjtd9?=
 =?us-ascii?Q?BIknlIPd3iVs5T+gVVMcNhjbkQTNXp3lyQ/zK4xqooU2Gy46sZ6mXfwAzlvt?=
 =?us-ascii?Q?YgCD/8ZMi0J5d8/vZshcoi836LSEqY//xAkng/cVPnPm0U1VNW2LuFPNwppf?=
 =?us-ascii?Q?1C2Am4BNqlMaNpAOTp+kxd5rDVZxWXOGLHG4kZfVpwfMQBxfMSLXTrBx6HVl?=
 =?us-ascii?Q?DHPFe3a2KkTDY5P6ntjJ6qFDfc06cRIqQtCwO4G9G9Lzw9QVeJkgT6T82PpF?=
 =?us-ascii?Q?2E92xz1CEnCYYsTqY/48wDYTW+xsaUEiDwQwFD8DHifucPnXjuIytMkpuwEA?=
 =?us-ascii?Q?zff6yGNn+hgI95+Vr7WRflAgxDiWBiK2G9YVTrziJa9bp7hw/9c/8jegIg+k?=
 =?us-ascii?Q?c2GRXw+uoOe6wNglrsvhD3DNM+SqxWg+Sr1GeAgDHZjHaRi58CWjhBdIRNxd?=
 =?us-ascii?Q?KZF0SY3SCfZ+Q8ibCKNsCQ+bpWmkHpt0xH1TXzHxXoEZppl4x8GLLUmnwz9R?=
 =?us-ascii?Q?XjekBGwBl0PracrKa6K/BYzhSCSY3qJSzMZG2zRWeMuudK6O2lK074jnuW/0?=
 =?us-ascii?Q?eU0pEuL40RTSLpoRLsDLGM1/+tMIHFFtuNLh7X97GFZi5yW0HXtzEJ5FxKsf?=
 =?us-ascii?Q?CpdSAMhXn9l2epYyB82OTyFbBR0Yg+iJFVGj5Kx4N9GaGeD2dfPqNYLR9YVz?=
 =?us-ascii?Q?IBAdpH/gpohB1PQWCx/UIIqVEAfCmrRetVx50cAvfidzzRUGBDGI9PBJ/Xxy?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65db2270-cc4a-491c-900e-08dd8ec5d356
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:50:46.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0guLnniZSEmMHG61nX+1ZaTRjFxtlTH+6JQdwTbA+dsAErNHvSdvNM06WAkMfL389PJiv+cMsfGnqezzmbujPlr2D5gP+s47ObSEDClpSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2NCBTYWx0ZWRfX67RaTHrem9g6 dn9afRVnywYV2+BubKLtrOWOQaojrgB6oJAwF5XeQiLDD1s/Uk/sEMiz+f33vOOyBFiMOZLqG3E LNpcxkY6ppe/9Xlgx6KZCwdwjWEDI4hHqG52x7IuD29Nb17NS+hnaQMTtXTyf78o48bHE8HYHHZ
 llJyJjZw4UrwpOicaou0L7FfshRzKZzkwBpYr+nxQTXBxQcmzfB4x5ZpEksKumgbAfopspH2OZZ s1zBMr+xxM2NohymmCG4C9ra0zMRM8ggqpsV+U0vrnD/MsmkQPtaX3fZgc+wbG2fGyLunNor5eT 1WwcpBTVzmSyzY9/9vHXzg3EsqxgBBK7dcFTF1pNb+xfkthJyLfqfpT5HWdX1v7oUpXvCNlue//
 uoPFHA6qTML8NG5WKaH8tc85YVBNAmoXF9gVg8XOF4Vu/d0/62Mmtp18fzCmIMValkHyxeQ3
X-Proofpoint-ORIG-GUID: 34_XGKh3WZV3m0p0ibA0cceDtPDmPtfL
X-Proofpoint-GUID: 34_XGKh3WZV3m0p0ibA0cceDtPDmPtfL
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681da5c8 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RTWaOWMY450A:10
 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=ajvwuzAuBo1pepctZ_wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=654
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 09 May 2025 06:50:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9246

From: Guocai He <guocai.he.cn@windriver.com>

The systemd_sysusers_check logs:
WARNING: wrlinux-image-std-1.0-r5 do_rootfs: Group libvirt has never been defined
WARNING: wrlinux-image-std-1.0-r5 do_rootfs: Group virtlogin has never been defined

This is because when libvirt is updated to v11.1.0, it involves:
2dd4f594ea tools: add sysusers file to create 'virtlogin' group
18f0160994 remote: add sysusers file to create 'libvirt' group

To eliminate this warning, it is necessary to add these two groups.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 4c6b3bdd..7d694ac1 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -47,7 +47,7 @@ S = "${WORKDIR}/git"
 
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "-r qemu; -r kvm"
+GROUPADD_PARAM:${PN} = "-r qemu; -r kvm; -r libvirt; -r virtlogin"
 USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
 
 
-- 
2.34.1


