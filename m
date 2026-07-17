Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41823C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 20:05:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5096.1784318739565445978
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 13:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aO2tgHmw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16589d649f=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJsDxa2052555
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2026 20:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0hn5zRway
	9nFDIUkmW0MZmFKidrQm0S92hEbaafu00Q=; b=aO2tgHmw8fNUg8QWQLSD+zmAe
	SLAiTtYtcD7tDViMEDvFBM8Ur5iWoXTbHAS4tMftI3ju9VrEZT0tBILSJ2mPFRcC
	3LwsTCe5kIOzuezO8Y4x7IWdC+GOVj89ZK3QVRCEzQp32+qkwKGL+60PDfxAY/aj
	G+CebENKHYndmoYaz5T3uxstKlFLgvIQkl6anHkn+hoakRS5paJqmbhgQ4QI+jO/
	Lg4YpLKARp4fVL4jcEpKUH7htsXA4dhyFSCRAh/ndmDgNFqkvdsnvBzi630Mco8s
	JZXCD8z2KbMXaOuYBHXLmUeXSKjDzPAJwmOO7Pn3U7zIFV+5AuEvVQDKwqzNw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgmth3sc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2026 20:05:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzH9G9TaONIeUIzAPQScnX7FOk4kjj3tQ67xK0DZts6kFkbAGJR50Mv1oWSswtyHezvY9EB0vrydCKocgAxqqA/1IkyUmot6ATtZPrSaqZMwoYrhiZaexDmHCRGE3/vbSxLVEK7g7F+QS1GlRQOAUK2eqLnta0Nn8taIBiJrTcEc7gEmrwROdj0OTmaY3OOttk5Y1Od6q8e3ekuQVs+ya/GGH/NnPNSYRr+OsBfmBiwgB6cNgbAT4AOwoPvqaewX7PDSZURxeUOgJMjRtA0Y6FGPXE2xPnsXU5OY5CcwGQX9nWmV3QyBfIQYQo0kXw15DIWyvzBClksBaM6SF8T3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hn5zRway9nFDIUkmW0MZmFKidrQm0S92hEbaafu00Q=;
 b=sYb8OdWqu+pLzD2/xONB+YlEwXLp1KoDoDn7rPbNGRqPyVE/Cp/kuEhIs1WpJLieu8mNf5JsuqJwU2uXxwMYIZX5/XTU9JBYbG9eDjeqymb/GBL7RqBnbWnfGCYd4n9y32SHiihPavc7U9ufIAoICYCKn3RRzolQUBg6/7AjmghLEJkV8fEbM+Au9S3w6ud1oXY0Bsw4oTCBr5KB7s2NbYCCCH23zn8hOPEyZ5T7ymvlqGZINIk5eAA1i0LioRze8n8frwg0+r9CR6DzRBFSWJP9kqxQPw8o1Ax+UxWn3woqRYR2iPeRhGpaIiLZY81ktCVl6X/xrP1xlaXvFmo+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 PH9PR11MB821391.namprd11.prod.outlook.com (2603:10b6:510:3e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 20:05:36 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 20:05:36 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: kris.gavvala@windriver.com
Subject: [meta-virtualization][PATCH] libvirt: fix typo messon -> meson in patch filename
Date: Fri, 17 Jul 2026 13:05:21 -0700
Message-ID: <20260717200521.3747191-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::31) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|PH9PR11MB821391:EE_
X-MS-Office365-Filtering-Correlation-Id: 973ca10a-73dd-44ac-3722-08dee43ec3df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|56012099006|5023799004|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bup5X1y/BumNKpEbUEWx93oGSfBhM4jYZUKDKkTpn65CZimvqArVn+4qCEeUqgLAtQK30ycsxBNDYQvJymTNHZ3YHHO++Fp6nn6JAo8NF0ARH031jHsHjlYUBynMDUDxEtqwiQ5+Hc3YEgrFxJJQfP/ZCgMJnW7nNAl3nufRr3/7AzdLST0V52+9GyYnSRmaISrThzsXMT5lW2Q1nfYB3AccvP+Tu6x/FXw09MJQpaELWVF6ag4KVt/WNl1HWWSoda0tPFxz3XWlQugqxyrqZBx8iHHvgGhISlZm7mjcYowA7RI0kZGMFJ8B1TbjdEk+xiPHhB6PS7FxNBJMUqKhQooVYfmbnrk0OjBB9fJFfA2NuGMUi10gc4zBYk1a6a7cQXDjKhm3Pxn7JBvjXWFi6IL7Pl32fj7G6s+zWB2/kd1uuGIzW4kOyPL0Rxz7rRm6y2wiJ46ZVndhfp5GyEXcBlBd2q3ozxbuuaUYJcKyv149rtWSEZfo54cItYR73kbyt7BWOb2J2xRH8BZ9OAJfjbk4ywAq2s+Et/CE6BcnQHFNGsxfUm3buivnm7kDcgND6Nx15WXNHjfUHoe9z3xZzvxId4F1QURpnhdb+Fl5FNZp9i8pTOh2MGcbpqTZ3iG2ZvLq7+MbMCST8D/M43+HGa8CDiasHP0yqT9RdoMaBdOBc9kzV+CHGFOcTrOERk8qIhqXXMJj77vjotzKU3uhbF7KdmfYrLg/liSvHwB5RPk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X/cqoPxwD7m8TYA+4We6S4PrKthyTylq5PqFL8DFQhtc1Bm9s60quKrwmuFL?=
 =?us-ascii?Q?5LgpZt+sfIYF6QcD6W1sqG3fRhPY9pVvjzeyOFlyzUEbGm1Y1/2rv6pjeKsn?=
 =?us-ascii?Q?B3Yb2IjwWfcbM6SdCiDmF1k9dfFtJh0mAbTryCoCtHNDcnRTq5xHEmgRa/yh?=
 =?us-ascii?Q?IqVhJzyACMFK3OJEG19Ml5G6JvpkZi0CAAI5CEkfkVMztZNTq3OXKmmrb5DB?=
 =?us-ascii?Q?wzdmXQy6bndkedPYztkAOu0CbWLOHx9JV6aL9sl0blYWzXfcX5xEygdVYJzK?=
 =?us-ascii?Q?u6BbmuxH50RTxrCZCiR2Tqj6lg7rCKuMxulEKWMgAcy8x5Bl04ESiX9cgDUQ?=
 =?us-ascii?Q?5E5Hs+wvTJdTjGwqiID0TGh+YjHDCdiO+inWKYHFNZSGXF92WmWMP4bIufXM?=
 =?us-ascii?Q?3UATukSojDVYmtZjLFoqW8xCftGLeHoJ3ycz5VbpPPZ5ob0M+6S3Rcl5jr8e?=
 =?us-ascii?Q?JSOjoRdMdLHA0iHGJIRl8qkcLQd3tMts3Sy/iLZMSjiwkN46jRuJM7ygIeqn?=
 =?us-ascii?Q?fDLwmMmeVEJXpipF+UdE+YvppBjqeS2UQLIuyLO+ZEuiw+woBsuFfEIFBSue?=
 =?us-ascii?Q?DeqKjhLqBLd1z8MU/YtM5Df6zkik0EwMj/6dhUsThMKsEpzNxCAjJCtENqiJ?=
 =?us-ascii?Q?Pl/BFvcd//qjEdc6eQNd6+WKmiNLza4ErPOGCGQcgNIullVkMlBg2KmW7CPE?=
 =?us-ascii?Q?qcvf+dPh81/f91SrHeJsAIFNY9p2JhW91G1ajnA+Hn0zTQ+CYIFfccY0QxKD?=
 =?us-ascii?Q?CZmPan3AVjZ9z8cyycUOWsj635HwVs76ep4SpMBRp47j3+Y6Psu4OWvKofC6?=
 =?us-ascii?Q?I5X4RP7I9BLs7jgMZkZLIs4uM8xOphLfZu30cEA3ZEY541WEMU9786vAMMfD?=
 =?us-ascii?Q?0YPcZBWMJcvBU9EMg/UiBI+AMZAxB9u8/7kb0mS//WtE3o0FJcWUMavY7bso?=
 =?us-ascii?Q?HnsODsQTUNsMCXpl3Mg2KSk3TWwnyrqph6UDjIo6EMlPvpJlgtjKWz2XLf7k?=
 =?us-ascii?Q?ZnpiD989v+H1wBejbh8cXmsChYVc0gRbL9roGpy93muZcMwMEYR/l+8M8Xua?=
 =?us-ascii?Q?1+ZE6smR0itecQDNdw7PXET9r/2gCkyBCvcjPIQ/pfVMcOvYkT1hdaMl/f1n?=
 =?us-ascii?Q?Y14fDXEPJFvNlpiEDToLepMuaQvCVpYeCt06btIIbJJtI94kEMEDn1LXel+1?=
 =?us-ascii?Q?lL6QF8tgPgTKC/ttxIrTNpsuD3QtsXYRk6S4SJcX4KElKyInPb3UsV3vWeiq?=
 =?us-ascii?Q?GMSPs7RRFPCgpprupwaULkj62qQi/+sSAnd50KXr1rU3odOLD1UAj718Q4sX?=
 =?us-ascii?Q?CYNRp7NHLjgMOwO/HXn6c6SNnmTy83YMaRy/PDprXz3NkgsPPvzJDNRdl4np?=
 =?us-ascii?Q?7TXQiNUZhQSR2VB4pwAED4hRctiuLss+i7HqEPYGdDrA8ar+YeVvsWhigzTu?=
 =?us-ascii?Q?bzwxs/zHktOIT1Pm6SHKATyKj7/Okv9zfBsYwb+Gmhv3pbMsv/8g2Lf4wBrd?=
 =?us-ascii?Q?xTqeiDa0M9nlOqQOepH47Gqy0Ez0NKgKldVZs6zKzsQzYxp60/HdZR+aK6xA?=
 =?us-ascii?Q?kPFTkkj3WNdZFErcJ4jAEQ3/8eYrVNqG+2NWcaozonj2/7gEnEwDdeVqwZ45?=
 =?us-ascii?Q?SS58ncot1hZN7STipUzcXJyjT33m48WDIgVWK2As/Czmwua6nN5D9AQcndzc?=
 =?us-ascii?Q?q24VGbT66cVhE95miGaExhWoG1Wr1rQITQleUqKAFqeBlnQRQ0fJyBov+HnL?=
 =?us-ascii?Q?jB0pYUHv0J9QW6/nBXMo9FkaTI6HkiM=3D?=
X-Exchange-RoutingPolicyChecked: 
	Es7nQ9lPrmFSUc5ZKTCXFYSKT0T8kyb20p4sQFLKezCOboQNIK9oGzE+j8yGm6dCgdQxVdEbnQtj0ZdruFTqk+T88b9PVrpiJQvYjQUuxClmHQxUpG6XclyaNfRiOsaoXmI95ywuvMlfF+ucAq+zYRN66uSOJCDmibM1RAOGPvEl11odCi3foaslV0tmP9gi6if5KZ5Q5ISAbe1J+wkPtRtrIokJscoMkQ+FXzXz+orpXWevZxD2H0uuVJQOWomsE20X0QYT89+FqTpT61tZCOt23O48jAB8IyOXVyoRxm7PX0wZtQt5xl3KtvpHt7vl4dEQ0FdEncOn5cCwd8QdsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973ca10a-73dd-44ac-3722-08dee43ec3df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 20:05:36.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4ABr6AqRLzyD9pdR9NFup+lKPZ1pL2m18RuNqHWWX5D9KvKJod+b2xOaQaRXHFlR3dNdNZJh3I3HuaGzg33fR7nraA47bcGYxW7vk/6+Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB821391
X-Authority-Analysis: v=2.4 cv=aITAb79m c=1 sm=1 tr=0 ts=6a5a8b12 cx=c_pps
 a=cEhcA1GRg4KA0mca7hj4fQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=AvB1gFLB-leIytIA2uUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: j54eWz-4yGppatNHvXXBJg3gEmt3PYIg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIwNiBTYWx0ZWRfX3DbAbXss2IWx
 rFHmQXPBGkc3PcrzDzj5FvfqXWDx0O9x4Ps7wbVnwwaINEOf8wAC93wKs9qmU8RONas9V19kl0m
 GAlmKu4VuL/j8kcgvtF+MRyMbz7/wFYaLhrU9WHqbNf1eMsc6FsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIwNiBTYWx0ZWRfX0wEPmGDReaM+
 bWX/amgP4pv0h/mjVSE3joYJjWtkPtdV4mSXh8E68LCQuRD3UWef6apd9iM4Wg7UZvpShgj/Dd5
 NusLcwvjw6OD7CFI0s80tU0jYC1aTzF3riES9Sif6bsQpypBUJvwKONn9RvTubLOsS/CNBogLHm
 6kPxzuHJ9TDskPORKGJhH+DJh/ZXgxC8Xb9W72ygvbV3KT4ZnguZAulDBbYAF8vt2Ow+OCm4hDw
 w049v1KSeAf6MlVkS2IKqFCFFtnPZMaMYzY0uSiY+8IYGvmxlocLgIqDC3lrRl2hzcOgUmJBhsp
 9rGpoDtrkNQl6NXpPi5fM7RGRJj1ZnoIdN3PownA4oVI/1svktkK7dVlHYhHbxuStzWJ1jlzKqw
 +Oaamnmph2TeyXOogDwxtuF5Aq7h7ieVpr2f3PilhBuWSvsalUZgS8u6EjDkvpwE6cKNbdYItPJ
 ftNwa+VsvKFOo5qZQow==
X-Proofpoint-ORIG-GUID: j54eWz-4yGppatNHvXXBJg3gEmt3PYIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170206
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2026 20:05:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9955

Fixed a typo in a patch filename (messon instead of meson).
Its a minor issue, but could cause some confusion while seaching.

The patch is not being referenced anywhere so nothing else needs
updating.

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 ...001-meson.build-remove-build-path-information-to-avoid-.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/libvirt/libvirt/{0001-messon.build-remove-build-path-information-to-avoid-.patch => 0001-meson.build-remove-build-path-information-to-avoid-.patch} (100%)

diff --git a/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch b/recipes-extended/libvirt/libvirt/0001-meson.build-remove-build-path-information-to-avoid-.patch
similarity index 100%
rename from recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
rename to recipes-extended/libvirt/libvirt/0001-meson.build-remove-build-path-information-to-avoid-.patch
-- 
2.49.0


