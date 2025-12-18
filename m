Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3622FD6D22C
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 14:30:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43321.1766068192197115522
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 06:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eX2Rgax4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDPmH4943337
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Dec 2025 06:29:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=kBuJOhWFbrU62VuOxNxk
	zeW0aM5+hf0qjWVAH7yIMWs=; b=eX2Rgax4zW/Cu64lrhDXR8elZW2ZNvujbSPo
	qIUE3isMOklXXwHuONgZuvTbRmT94osmwELEjISFLmEtfxHoEpWHDF/pRiR8A9h6
	LWDhoRmZuUHPDhGn8k+xm3vuSBVE08M4YWLJn4BqYmIU7LBZ54IB9A6pUPoatnf3
	la0sA4sPOY4wiv7QlnAY75ghP/RTLy78YwV74JLEjU/sLqOnl4y8aPSgwRmdAXMG
	wNuj0X8QHl9ogc3bHvjZrga72Cwt8Q624QU11xS95lQn5sDQypSlZk4tycLi6PxU
	9rDhJRylzlUPFxVlEXEWqDYAuwjr2V6B4FGaAhVZTAERWnT00g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sj2n4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Dec 2025 06:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9N6CteajPiboVALcypjEjzebcgqkZE532Qg12glB2y0bDo+LzmqYve6kVRQb3UJV/3t1k0mQCBQnxYhT5hGFcATtTZgrJ9IuTL3Gi/badgS31VYkFE1QiFo6vAi/PghBtrcWhRV4Xfgzm+mniQSTl9+E9kiM8dKJikP6aoGz2SIn5T3TqW4XCBUo1koe/oKwZYjReHdOj7B2vVhZ1ZSqBG0OPLUXojDpE6IeF83U/4vqKaj3QRHLW2TBZlKs9QjvjvrDZJO4VQg1AX7L+HJvoU3j6tMYqbZfbVlWOPSoHHUQWzgyujKFzLq0X4uPD3kUCZcUBA1Ooo4Q4JhnrAkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBuJOhWFbrU62VuOxNxkzeW0aM5+hf0qjWVAH7yIMWs=;
 b=i7zEP6kGUi08NiwMN+Ip1tAvJYfmfjmu8/Fa0JlD2mSZC/rqLEqJGTZigNtyy9OulNWO7GCP2GxZ6Jw6P8A17z7OHJlGlKgq0na538n6ql2xvQbmXxHM7QWdyrXl1LHIC+108dVR4aDlFfKaHrhRj+nq4oeVjafNPdSw5Jk5rLHbCVBLiMuBIdgcnISfvidDpQT//g2hsLDtDvC3Zd1AYsxawLibPcbKpM50snbMwkC9S5aZjtdl7PGDRXYPCWwbDjsLL2G9SUh7l7vO0NPsre/a3twQrxRjeIRmxaFInM6t/qX7PQegR4yscLl+1lZ8G4H2ci0LoU0f7tHySSQDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 14:29:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 14:29:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-dotenv: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 18 Dec 2025 22:29:33 +0800
Message-Id: <20251218142933.3335853-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba3be65-d324-4416-88ed-08de3e41e5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QTs5FD/K1nCyIoqscqikzkMw9txG7RmAkZGqI4nBZk3OMjrSefhWi/TDVWkW?=
 =?us-ascii?Q?uTEQMzqiFxKZEiwvgVjyM3lRwDNx10/UVoDFkxrjQLBv3FXW0uMLsMz+tF52?=
 =?us-ascii?Q?LmlPXumYwF9sh5Xmyu++IwWB5Vx5PLxlMVbhf5JaK/f5NOPgDCUCUV1vrDQj?=
 =?us-ascii?Q?TEdcjAH7Zmc4QcnJV9ij+/cZRFjvcWmoV/ULkEyRd9lBwQB5GBAMj+UA4C1L?=
 =?us-ascii?Q?ZGvKnPUe+uuK6wFdN4DbRWI1HNSKrvLuvrXvVKEQua0HWjEXcsrFxaChgR6G?=
 =?us-ascii?Q?Tx9YuNEJNU1ERv5eR4PwQxRIDrc8btkWd9DdGUXETNouEK0HORmp/WyBfANY?=
 =?us-ascii?Q?O7CsqkbZOrQGjuPwChRZ0ONCvR8NLXYT0Utqt3iMcK49+5gZ3xJGQ06sII+v?=
 =?us-ascii?Q?ypISKaqzC1F0uoE1M5gYD6anic0bWYLWQvSra3zXkCt7uBLZJTWTIkap5IEp?=
 =?us-ascii?Q?Rq7m56jX0Cr5wkZz0GkSVam3rndzzdSN8bx01JwqpMtC+zS9vDdnXow133DR?=
 =?us-ascii?Q?3Ej9pF9yx0fe/LALsAiyxyxTCnBqqbw4JQcbeQTpwNWkV0f+zRbkmQ3Ip/Wp?=
 =?us-ascii?Q?mFXUjszMCT1OhylNBClnPd3Ajzp6wLPL4cdWVJGwsUMVXdwPW6kZN94yuuVT?=
 =?us-ascii?Q?g3oIrdJE+Kanzc2OUKyqfstj1lUQ4XukTEtEhy6V2Ux4HRyjGZOkU3q+N/Tc?=
 =?us-ascii?Q?BbPIcCaY/zmoxQ702V39MLBMm4Z35TP9wDm9HW4smpA3jimx//ylSNZdvZS2?=
 =?us-ascii?Q?PH/xphmtEA8rn/ZzLYWEDB+kxwUq0ku3VDkh56vpumgNqLz51M79EEt29UDS?=
 =?us-ascii?Q?FYpMgDnlVCjV/TCsKxJdN1DOJJ1LMjopyQHbq8Rx4Oon5iZO/fETl84qejdt?=
 =?us-ascii?Q?adnEVhF8mo9eSe0UWq5cBUI5G47m5zqROUMhUBTKZYLlcMbp+V9Z125v7Dmh?=
 =?us-ascii?Q?KXdnnfvkAVDRsNgUXqMs7RKtiZQpEOeLLupVHS0M9ZxltXR0scFEIR38rXHe?=
 =?us-ascii?Q?zg9i3nhcJhcwzXd9J0JnDjLtMYV476wh8mAepTQusNdzHRpK9ejSajflrQP+?=
 =?us-ascii?Q?Z//wBRYZvG5QEqqs78coBS15y0526zYalHkXt29MArvFuuSMEDRy8joZi2g+?=
 =?us-ascii?Q?Muf074WCUfKvZ0XP1hJruLmpEVZN1jAaD01Pe/4dyvFD8PUWxvysBLDGes5V?=
 =?us-ascii?Q?gbAkpgHm7gQfI/rwLaZIIkMxiefjwPLgk7MdOQxpjhifRr46ExoF3BwWf7As?=
 =?us-ascii?Q?Ooao35Vsx6Y0jrzXjGl5cAVHmqt7AYltZdgiayF87AD/v1sREE1GNFmOyug+?=
 =?us-ascii?Q?W/cFBCnFMWHX3IFbX6KW5raTfUR6Y4jCW3gU/JTfqm9gvm1kZau8TFtw5iTz?=
 =?us-ascii?Q?egaOZL5EtQUEyzmUTETmHtY7vrh6Vlf20lBa6HSF6SgikIWsJ2JUkT5rqEKM?=
 =?us-ascii?Q?8GdRpi6MoqOFIo2znZZdX2p7Pma7BMzBuMXA/pw1D2l1PE6Cvj/G/zm2wLSh?=
 =?us-ascii?Q?OeCCGYPLTq9FgWOEzHm5t1WAg+zqyjl8KmU6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jUbxTWQ/H+oQN6Ay5lNHGCojOQz78uLdZv79MmbrXoH1P3KdYh66y+ijvTTa?=
 =?us-ascii?Q?aq4VNPpXbZTEa8TId7Em4yOftB16a2BAoZ3lNfv9C2SCoGfniB2N3Z7cIyx5?=
 =?us-ascii?Q?jYxXxOe8UljteCrd3visCVMpHW8KcxfJE6i93bZCb2tOpQNE7/MC0sIMf+1N?=
 =?us-ascii?Q?uXhELUeD1+5NtAQ67rZXly1H02I2vpXsxt6GcUiQtUH8LmZU+PAFf2/5Ogie?=
 =?us-ascii?Q?4KgRzRfGPyckdbNMWOC1BHOA2v3oyo+Vq7q5V2hJp82QsObXgcmrHPhuX5t0?=
 =?us-ascii?Q?5I3cdjRV5FUKe5r8bmd0w7G36OwNdH+U7gxpQfo2MA9XRdZXCbd8ur7GV1zk?=
 =?us-ascii?Q?bLQkzWU2E5LBt2SdtlvOqrndkplo3jdWUV6zn6xbc09w88mr8eRYpY2290M0?=
 =?us-ascii?Q?bSYWGMq38TApmI2A+/rQDhuCO4nXLIfUcfBHQgTh/KvUUmiljb3PnXlRXEla?=
 =?us-ascii?Q?xHduwgZJNFk28ktwDKvN412N9ovCiFQi1A7aYnQZ1YndUeg33PzKWzc0Aa4w?=
 =?us-ascii?Q?yVqL5p9LrHBggDBtSM/m6fjxvg4mCxN1f89k6MlLrBqVX0Qowil3T7+CxNTJ?=
 =?us-ascii?Q?HhIPaR5HBD7d1mRY6YdMGyWSUHDWLnFEvjRWI+b52aYW2cE4frqsd1hEnOjM?=
 =?us-ascii?Q?BwOv60QsBnRwnqv0U6/l2e5wWkLH6uC2sAbWpOXV68XhBkR0cTwyeKWc9X5e?=
 =?us-ascii?Q?7lFuC2MaDAnzershPpOvexp0dTm2FL5REg+0YRYBL5f9zTmgPbZEdig/MtC4?=
 =?us-ascii?Q?q8SA+BGtMHhkI0//G9hlJxby09/kZyQ9OAcBnMUJHcUuQD9fnRLynJWzFrn3?=
 =?us-ascii?Q?5diE2LioYHxdE8cnS2lyAAFY3MXp8Xl3KjiZYmYvqKMlKQuxQUyQ8KLAjmqZ?=
 =?us-ascii?Q?ArmF8prKcxWDDXB8Kl+QOsTrfic5QxMMLxk/zXbEuONr3Gwv4gqDtNnAWp6B?=
 =?us-ascii?Q?aQ40EYiTXWMwc9pJ2oOpRZSRi7bjrueCvYZVukfBr/5Bnvk4sA8SZhHISpVX?=
 =?us-ascii?Q?T/UdpIihAWqWmvU9W85UzUXyn+wlhxpXTzE+R9sOXpwe3QyeQf7fXJdvZLBV?=
 =?us-ascii?Q?XJ/pmwl2/+0kW/AmPj+O5RLAsioV5WRrGn3zbMdHTa5UAcBF+L1G0JGfMvU+?=
 =?us-ascii?Q?2HZeFCNTMMxk7wIefKSin1U0u/fKUhnbaMsYJQfoLrfy5vYtwrvpiXr5dCxs?=
 =?us-ascii?Q?i1pKyvzilyv9B8AgjcdGxKcf/mD6gsw6DxQ7q2UHijCjWtdcHAHhZ4YILJNw?=
 =?us-ascii?Q?30wWge6jyw70vZPWp5usUPwobAnO2ceqLMFhsP4042daQnm99jIuUtvJ2YVI?=
 =?us-ascii?Q?urPgVWmpciMS6ZMaH7UPsmAHqVM1JBHmzRnKplBC2YwZ3uh5wWCoJArBeI/Y?=
 =?us-ascii?Q?481+WpOt+GqdaZgrKITB6G/3TPbl5IBVvd1CRIY4vUKP1bd9E/aGQl/LNL4d?=
 =?us-ascii?Q?YAZKKygxKncdDSfkC7B0CAkIye8638rXByKzu1z6IfcAqNBFt4lWbhEVhDrb?=
 =?us-ascii?Q?UeQltggvQ7S8KV/Zr1i9wXuCxPEd/R0XplhXqEbre+A/7VxU1R7bBZ4dcRwe?=
 =?us-ascii?Q?NgizA9MQE/mro9rOaG10WywCCcM31OV47PNcdsHP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba3be65-d324-4416-88ed-08de3e41e5eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 14:29:48.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vC+Cyv0PIc42PAxMUX8zOZqLo6+zGmQGTTgJzeTCSmROnCmeOAblUBVOMDEsGD77Hp4hxFgHor03loRW0LqAhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-Proofpoint-GUID: jVJChyguVOKDeQWPCAKY4Jbc2F7d3kvc
X-Proofpoint-ORIG-GUID: jVJChyguVOKDeQWPCAKY4Jbc2F7d3kvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMCBTYWx0ZWRfXzzc3q9AUGHFP
 QBJTHQse0X7y/rPby65a/kjbwLefuEzxNzlsrwo0Y8vx8jNrYkUw1unJOJuFJK/AXy4hHHRQmNi
 DnguhBPUJBdpKQcG20QRpl359ArxkvvPiK/6nxOiUmHdLfuQB/1LfzkmrCAuMeIpsyZuaK9UvXB
 lTX8hIBntDXjgycnlxQz/Bf//BZD4POPNMFxbzIV9SEIJh7tD1dBlxliLcKyD9uGiCDpXRKCYoB
 CHOgsi8ad1ImSARbeLNh0hZYt2jt5kspmAa62+NqaA07U2Fl0mJDJoJdp/fqUTaUkd9dAbIzUP/
 jw6FpjCGyhSl2YzoxlHNTujO6f/I8EJgrEKdsdl/FRiVFDnxJpSkIKdmfBVzBCf525D+n0MocbN
 PcVqqv1AhFYZWefvteW7g7IdlMSjnQ==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69440fdf cx=c_pps
 a=tYtg4CXWOAG754Cl0Lh34g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=CRbiok7uc7mLu6ESLsoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180120
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Dec 2025 14:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9494

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-dotenv
INFO: Current version: 1.1.0
INFO: Latest version: 1.0.1

After the patch:
$ devtool latest-version python3-dotenv
INFO: Current version: 1.1.0
INFO: Latest version: 1.2.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 recipes-devtools/python/python3-dotenv_1.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/python/python3-dotenv_1.1.0.bb b/recipes-devtools/python/python3-dotenv_1.1.0.bb
index f297e6a6..7e20a444 100644
--- a/recipes-devtools/python/python3-dotenv_1.1.0.bb
+++ b/recipes-devtools/python/python3-dotenv_1.1.0.bb
@@ -6,6 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
 
 PYPI_PACKAGE = "python_dotenv"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5"
 
-- 
2.34.1


