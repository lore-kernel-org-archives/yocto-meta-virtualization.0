Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9670BF45A1C
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 04:58:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11875.1776142672381551970
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 21:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ICApRBmv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85645fefe5=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4oJ4E4062397
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 21:57:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gDzKEANkaIunD0QwPpTQ
	BAql/2LlPPa8NBV0GeSJ0k4=; b=ICApRBmvTtyUkCrGiEg0iEFrnmXZxUDce+yh
	0cXImF2+PF4mTI8HWxa3777V1pykPuFf9XKIrkxDd8DAgS07itn6M/rch0bJmZp9
	HHr400gijaA6IJp7n7CcxP+fTfrVgAIP6O6q/G1p+coSzT2yV8sMu5fvz0OsgZRG
	putXh1T3uJdrXhW3kYH/oGhJJSUWpPyNzIYz16tkAHtgZuZpwX9yNbFWTb4Vm4Ir
	jwrK0f3IU2nGKuFXCXwEYzOJBnaIrFl1rW5DzXhGBIriDMwQea5mgi3YcPhdYC6S
	FmFAaDvTwY0vV7yCr5Hk4XCMRNbLrljb8IJq1Fl4lEHOxpv1HA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86m89st-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 21:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzvdaOWgLUJK1ztC6O2+TCntpoFPfXuNpk/+zIaU88q2m3HkYPeMSdVCDYMEML6OlVBhuUbu/0Rw92ttaSv8ouBnmXNeD7aNBOecGLP9bJbmcW0SveabYYEhTMm33ubUYhfZJMl9UN9aYT9r8QdcATSSmGwWrf103RP2wx3Z/ZSr5cXipk0n2kxdMDSU384JUo4njCqWtxJpHtY1HtDo+8sztkS0LF1EajKoF6u+3mWp0PH+BjCEtFinJk9jRAhirffZOt2jKzGfPQfqhWoE1Rg9un5wPX+hXVwQ9jLC4fFi5EcCpVsrSSVj09yyvhLCHlQtlbYxVpxafGhxY7sXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDzKEANkaIunD0QwPpTQBAql/2LlPPa8NBV0GeSJ0k4=;
 b=nu8Z4JQP0lDjkE6/FIroZbyQ1qr/gVCTnvLmRz4YcIPh5EakUiszB4DUg1k1O/VmPsFaGq5PJt9CUlvvolUV5jMjoEfkCkL7/8qYRQqs4HAiamIvx2+pDsKGst+7bYwv12oFfaC+7OD9W6EC2AFQ03TitqfY5s+wvVGl8VRT+larX50GsvZYhZo2UabitLWJTmhnV8K1MBB6Kd53IH+90ZAGM0/FBWYGYy5Z5F3h1S9afMAdUdw5G0piojq1Dsga2uAm1iCHqmqMUHx7xj3Lqux5yYwngK8Ho//CjUgHIqBjeIt3TkG4NGCwjYlsLcAXejcxMShlFGvjLrQgNsSbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 04:57:48 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9745.012; Tue, 14 Apr 2026
 04:57:48 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [V2][mete-virtualization][PATCH 1/2] libvirt: Drop the deprecated workaround
Date: Tue, 14 Apr 2026 04:57:40 +0000
Message-ID: <20260414045741.809844-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To IA3PR11MB8986.namprd11.prod.outlook.com
 (2603:10b6:208:577::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB8986:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 518beded-ace0-4093-4913-08de99e25fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WO38k50qUBt2W3Hh8sNVjii39htEZx4S7ChmjXUiEIuJ758xpThsQHreYOGYURT9GbAJAgoFkQg8B16Og4XfvebewfC6+MCisQ/r4mGTX0GnuLRZR+YClYYhWJHvLG78QSFhmMXFpahf59+gKfeiDa7I8mV8naqqY/5GOc3hY921BwSPj9WeF+aEWDBXvDwDs8UktYnKz8j1RWJJ58fmbKJsrknSaY0bIC5vZ6pNtMeihq8MVyLxJ+mPYw3y9zewn0VcGZPsm5eHgyKK22He5mq0dRnLpLBghJ5aFsgDTW4ON9VagWF3DMfbcxySRKYKadA0ci3EqHxvkVdiiJzAVYR7rvs56hHZte0mhs5Xhuj988bkKv85ECpmwAkwlDhp1jC1VRxYHR6BXkshPy+LjrKIbz4wKDlyUz9NwzRVmCh/s0v5Zmn7wFWkv7BGJTiLG27VuzELwBDi3ORA8jvrcMHVwPd9IAYHodfa/V84J7zBKIOZzFaFe5UJavjWD/PCBsgrXjEIjmYlwZkZM0x/2uAnBBGDb6eyUA/2gMbKgcz3/NW1TXkpoQDPk5MKaaTzSq2vV/aFRlHlGGFLZQtdJgD6ySEqYPlzDeyvogzX8TW08phYb4r8Jf10nHyex6D0nHDlU+jqCgT4UZ9qGEdRE+UM+b6NRUq7ga2FZwPo7qegRmbyoy2E9TC84nPjkFQg/jHdQFj+eDnMhBDdkBKtFDwWOU7UGy7j18a4bagAcySb5WWnQBa1E2OtLWO5N4K54xYaP5UDHEtmzGtWKknn6cA6C7Vytg+O0CGDbkvAZng=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?peBU4axj7WMEBu2cGI4XtwGgaCAVr8XM93AbsOYmd+wyQtMRh+kWMfpfauFK?=
 =?us-ascii?Q?a8DMT8wkgtX4R5D031GQaZZvXN4GSS82u5oDVsrd4zbsaMtDFZU8LGC/yKvH?=
 =?us-ascii?Q?X6eK4HBp9/83viHP4eWIB5lfqTCrYCRzNEIcxN9iKPpimbxOpcIc+1YfOh03?=
 =?us-ascii?Q?MvbhE5qb+d9uppJpH5Vp6lYukJ9fY1lMiOheReR4K85i9wAcgFJzvTSP6QAM?=
 =?us-ascii?Q?6n03RFLVcS0UBv2w39B+zt5WE11b1EaSBaeYet+YXcupkSpaDLMqpe8i8Dav?=
 =?us-ascii?Q?DAcXf+90hYQfmUFYyGyVlADw6VAuYVRR09t3K9NqnQHm3w6+NgO0ziuqVgbn?=
 =?us-ascii?Q?Vo5x10QSP3AoO/1owp/+2bCkgV2q9itdmaBGZ0g36wZ0c7dGUt5FQRqVGIR0?=
 =?us-ascii?Q?zg6NGrMr2HSF+eXjP/OD24Y2SRS66XOu4YIWtdMu13qxE/ZzYuMI5rtLmh4d?=
 =?us-ascii?Q?437lxzWKuqRzl4MDSowSB32yDMID4RCu0F9IArG5+kQE+VLwiu7Bqa5q/4Xv?=
 =?us-ascii?Q?mW5gG8NuBUchyiJAQ3zK/echf+6TdZXOkwJ8n830T8oNCzcqTlwG9ySQ+m7u?=
 =?us-ascii?Q?l4PYviQCtKvfv27z5pK54HNw4dvqWHCV96VgqOzRmG2Ej4n9TUpmaQ0JNIQH?=
 =?us-ascii?Q?uctuiWgtK06L1zhe0sDxiHSIbuz4V7MV/yGDGyRSEObgRN4vMAsbfDjfFLoG?=
 =?us-ascii?Q?ADpFL5IAjb3nEg3RLWdz6cWBxHIQsbXikSVDlGCqAm22EbNBvtW05O0qfMhs?=
 =?us-ascii?Q?LuCnNjL5pX1JdVQWIHMCmlOze8dsxdmnR2qklqBFb7IhMgkBfMaTWygN/u9W?=
 =?us-ascii?Q?29Sj6Vs8JCZbUtXL7Y6Zr5ZIvoYa8cyY1X/Enojmgl8MKFWrGzuUTH4frp+s?=
 =?us-ascii?Q?tySqPyCBtSt+vlAAiaGQoYdvqtZazwoYI9QCm4+3hLoK1+djVEy+ya8gpyg8?=
 =?us-ascii?Q?LScDk5ePDv85S0Cf23to1Ze5MdqznOckX1q1OiiwYWdZGaGYNkfGy7sgrUd/?=
 =?us-ascii?Q?UX+eTBY1iKXSURJKFbgBzFlQ/s7QNu9w/DzSpT5fMc3nN9+hQDZaYwZ/ue4j?=
 =?us-ascii?Q?mSJO5zOsGnFWSGxMxP89K+2dDRK/E29vM5pc1o/tDGvCXzcVVfDpYS7LYJin?=
 =?us-ascii?Q?AwGs20MdYskHMlNG04slNcDaO5tZI7zY4xFHeZmWlBYWJTOaARYN9s9CbhUq?=
 =?us-ascii?Q?/t3GDQ3C6Fng3/k7kBRV5Ij7eQqM1taZYftONHFUDhz3yLXyad07Kbmyq7Go?=
 =?us-ascii?Q?2qgQkniSQu7mBSGJDmec9+Llg/zSifc+lzyM7luyjxhjf1tnYhybUgVqAPKW?=
 =?us-ascii?Q?9QNfQPfyv+w977sjQdpkZIHuhA7KJSrl/ExuJDOjKpf+JTd2BgNKjI3Q1tzM?=
 =?us-ascii?Q?oIZ/15PMhNRvqKAd+XAVwEA1DLmeTYGR9mcxYBEW+fdAfEjJrhhh1CHJZAEm?=
 =?us-ascii?Q?mT7AkotaW56oDrb5Zn/IfCU1A/K/HOHY9G3ZM1SdLgX37sLcPNd++ySWBHhB?=
 =?us-ascii?Q?wJFBQsNi5aU/0Ec/lLqHa+tEJt+6tqu810hiS7USF46GDp4mpFcp5lmfi3ho?=
 =?us-ascii?Q?Ob5D8TcCto4JxQ09Oc1YYJBYcNZcIFfZdp4OA15qGNfnBRJioD0gcjS7Mi/M?=
 =?us-ascii?Q?Q6ToziOORQlTHDylOr245/RQXx4j8nkdKZgvEqwysGt2+vb6h+Vm9t97gsSK?=
 =?us-ascii?Q?tDhCZhJn10/Wv11q8lBHdUsRtfgysgmgOPs+lH/EnTWGy3NY44XZYHnhb5gJ?=
 =?us-ascii?Q?I6LXLXqauxlygxZwvS4Nb6hbdYUcPe8=3D?=
X-Exchange-RoutingPolicyChecked: 
	OlGGZbACRqzVLQ+c5PZXn2dU13AlsB6TWyPL9WX549+DqABjcLFkZKjdHFVI3kEy6lG7Cgpi23+gjzSLmascEIGY3n0jitw4GwSc759wEmqpqZRd6uVgvNB9RW7ScQuTn5JGEPAMsDq6tulhzv4VVQb+CiB8wvlHsKo4SJAl572EGknKlAnbSaknRVt1nIWJlZP6berdP07Y6vbYhm7jQkEtGpKvcJL6cJAZuQS100G4Os9lyLNS/KlefVVrEmiIzBbgWJc0UcZqeK7LqTcFoYUi8cqrd8sKGiw9IoLbf0fyHTTNfnCf5V0dbuX4JrkUqHj/ZF5SIulcWDZ4RHs8Mg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518beded-ace0-4093-4913-08de99e25fd1
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 04:57:48.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8QGafZ7YJBnZrsD4DMB+DYHZXzcrxRtFi4L3NEFj/eWpXeAin2G6HGJgsYMwVDO9dSLtkX9sUPRfWVnE5ZHOmQRmoP0F2XXtBaxjfMuFRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69ddc94f cx=c_pps
 a=lZTGddAnKZ6AR5Pw1xQKMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Io_XDWT2tM8LUEtPzNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ev_utkRtGawPL4w3jUsMT-pidTRLicMN
X-Proofpoint-ORIG-GUID: ev_utkRtGawPL4w3jUsMT-pidTRLicMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NCBTYWx0ZWRfX3d8GpNeiU7CO
 XK//7lvmcI6DBT2hd8BApc3o42NyHSSLjDPCbECFIQyEZGK0Pm1ZFrauUiyFXd2HgWbZOZ5RSUc
 ud9LNcm0fWk46aWFmbrQQEyBp4iJR88vmFxfpc2T+yXxAxIoA34XFKJUPJUOw+by9uwkrOACVh7
 Uzs95Rpxo1trGYnB7Bo12Z/nH9iog29VHwCtg1U1lJZ9NzYATLj/X9bUXzWs3RMS37OfyG8BB8o
 v+wHQdfqkLHYHOxhQqKlwjxCEeGQHo9Gzsv9YcHqdI1bWv5BM/2zK6TPM1Bp9/Kx/HZ2OErE7FV
 DsPJ8iOh38m1KrzmI4sF8/Nt5I1bxmewQR719QLaoqV/zglCL/f8c835b3qZWDckIlDwwE0+CRZ
 ja0+NsWZDlc3YGYWXMHE2LD3t0kugQ5bjs4SdcBnTumlosjPOW34IQZqeabS28O+PaDdamrzRfv
 OIKEpCS7j0b0mNud8Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 04:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9700

The workaround is not needed anymore as the systemd supporting.
The libvirtd.service Type has been changed from notify to notify-reload,
so the final Type will be 'forking-reload', that's invalid for systemd.
Here we delete it to avoid the following output information:
>/lib/systemd/system/libvirtd.service:29: Failed to parse Type=forking-reload, ignoring: Invalid argument

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 62931d17..b5b0a5f2 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -232,13 +232,6 @@ do_install:append() {
                 mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
             fi
-
-	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
-	    # Change default LIBVIRTD_ARGS to start libvirtd in the right mode.
-	    sed -i -e 's/Type=notify/Type=forking/' \
-	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
-	           -e 's/\(Environment=LIBVIRTD_ARGS="--timeout 120"\)/#\1\nEnvironment=LIBVIRTD_ARGS="--listen --daemon"/' \
-		   ${D}/${systemd_system_unitdir}/libvirtd.service
 	fi
 
 	# The /run/libvirt directories created by the Makefile are 
-- 
2.53.0


