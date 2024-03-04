Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD90C54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:52:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.93])
 by mx.groups.io with SMTP id smtpd.web11.102518.1709567562185040596
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 07:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=H2P9zNe0;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.93, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7D6c0b3EZmGCldSnHgxW/DNHkDRKHjtOBzjn4O31xdNbCMNklRe+aF3T7Fi4PeSx8TZFObzSaE3dqfIkXxR3FmXzQtoyMgQFNT8EpE+W3jYG+zo2Yg6V+fovqY3RUzPw357jpTKrQTvXZOwUT5iF4H7po2tF3NHsSWMsqgZAqRVu504RkKOwpfWlnHixdwrJG3uEGQXM6L59UKgB6X3aGcCBwWoesvcm/dPe9I5n1kSHQQ2WhbSIVqQZ+bdbd0hEtH69c/ZfcFoIMx3JneY8h8qjxstCDBbjdu0lB4h4R4NmwYJIIriP7J5ylvoc/edu60SCQnEefZWF9cchoIpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIYez55V7ctrTAwtI8lYzmQR7KMBlXc3P34/J1EFSBs=;
 b=DxkojD57K3NOIFf9ext6ywzg8zzO8W5t7o8Wd/W8qrlw8+QKBkI3zLgfqS3DHa+IlCZEUBdxFjOnKe0onVvYbVEBoxB2mS9mL4w2OPm4Isy4xTfHKaSiv0kO1IaSM6R6LtZEKZzcaGCTJztVv9xQA7cuHz+6ve3mUr2ITYUD8Pjo6kYedRssL044fjA/XeeqaeMp8Iq1KQi8nPIGqGzXhO5uB9dBF5FZbj9EC+OuPf+fyR4lZnkulcNytFm2YVLXSAFxzvsEdVTF4RPsRHce1YZatlSCP/gteE6PR0XEeALahiOd+CQkTJxVmV+hNeM07LfpYS+jIn/LcJrFxvf30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIYez55V7ctrTAwtI8lYzmQR7KMBlXc3P34/J1EFSBs=;
 b=H2P9zNe0TltqSWJ91T6Wjy7QwVFu4J2ovu9De7NGQWcpUSzhPqi0ye3yN0UclvNhPLPRz0b2FTGftgqZ5Fc0analnlM/MHeDaut9g5nZUcL1CeoohA2wQMN3tBeWo2ArFrnlLILn6qhtBbQGQ6ZhM3Zj+nMbzwDYEYm8PG1IEqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by AM9PR08MB6642.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 15:52:39 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 15:52:39 +0000
From: christian.taedcke-oss@weidmueller.com
To: meta-virtualization@lists.yoctoproject.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [meta-virtualization][PATCH] kernel: lxc: drop HVC_DRIVER
Date: Mon,  4 Mar 2024 16:52:27 +0100
Message-ID: <20240304155227.613062-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|AM9PR08MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 81345083-9efc-49da-cb4e-08dc3c631ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	71KqpH3JPI8bY4LL9XAiwCxvwVuH7XSlxxVJ58hHluMJRjioXOT9LWN+C4k0aLH0d8xq9VVb1/SzsfLdVRQhR/SIbrD83p3JwLM9b3holFBAJihUBuyPfdUs7FQSz0d7AMAtYbc47UPN2X8PreLY8O4hnbV0ca6RU4Mp129p/cVoQVm9hmWGeC18MdIkusUx2tfkFN6hn0gx1Y8UaDixmsHKqBp2m3Rmm61LQ9Da51xKtfq6vyvdMrCKU2cWOdX9CleRS/qkXbkUtHHYerFQMkMtAR0hTCOJ0fvKhj+6NZZe++dtfPMSfBWKs3yARSYvre3K6lJXDX61SAurMfMCd9FYktuEGQC3ivRzSdpJn1WBuPQaiy6ROwAPThUHOC6WbptmOKortxjXbwnvt0y9rUgFUPrbqFB4+hh4WojOQ6jrkoTXLcSTq5SzT4AxiNnJw84iOnlAdo4N3gyZ80bE7Hovuri5c1PtDvfT4ftKcoou0PnfV+51Fc9HxyTkfLv+qZJSC7MLDsnRGonuSalyM0sJAuuMsHfapO8gNvdCVkYxMxUwoQW3+rHVhWatnWW8apqigzAlCaKon/dCuA0kozLpa7YB4i6UYZfcIxRXMuBndSRw+DwQ2nK2MVDd42bXl4rt5XNTpTS1DNeHsSBakOl+zVHiM5Z0IjnFxZHBEZxhmcDJ+r7KEAg5vsI+SH8rTZEsuqFp4Y2LxvfYL7Mvipm3iiXQM4Vj2a7FesJPTMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Bo5TRylekXCaXtadNGWQh+u7jZP0flyq6ZzZwxU7ohGzFRLhnMZfrxriJst?=
 =?us-ascii?Q?8WJ3tgfFknunOJDUCw77SPn9ltYd9GZYikHrcCw8Hud/5WZ5sGhh5rgcuH46?=
 =?us-ascii?Q?yj4uk9taYHb3xvrqomVZA4e/Tj8WTFGK7KFpmUu1R7m/5y2/ec5H59DDrtxE?=
 =?us-ascii?Q?Fo4TmlgGdHfO37qGBqI6f+vWT5+UnynqLBglCOs82LjDDJIUZbq8W08t4kEO?=
 =?us-ascii?Q?RpjOyvbjElzOYd2i9MLbe0PthLoiVBtJM7E2toltacu7v3PsWGJijUHCVKVv?=
 =?us-ascii?Q?I7jvDruKKc5d3uOLy+EZdnCG32OKJeOkvVrTx+ha6inwaTdCcOjiwcLNhjSF?=
 =?us-ascii?Q?Sw3ks5RGFa7tr4lV2wcVcwlpSLkrcYxcUc3/cwtJJ14qcijyJHYCECH+7SyM?=
 =?us-ascii?Q?g+wAeSb+s7NZ8FUW6+4W6MlfDbOb8cBtnHUyV9GFoll3cgen7jUsIWiCMQWv?=
 =?us-ascii?Q?DGdcnrXUIj23+QqFlO1l3sohXooE1yFIE8lJn4Al8MCIVMyx4hYbhLT47W6c?=
 =?us-ascii?Q?LSgdToJ9IrjUQ15ojvWXbruxBe7sFzRGLv4bpB5l8swTJMSpPMLmjyyZg1TL?=
 =?us-ascii?Q?hENGrqdaUR8JEnTKSDyZaNqc+JzV4hMfGe9M6dbnaL+Onx3ce18x1rc9w3hT?=
 =?us-ascii?Q?cMU0RWtW6xsnRmrbbfSZLFFoUNUVZov3fVWAd+JhK3yqDs4a7ClN/cLeYngk?=
 =?us-ascii?Q?mRbaZWYqVMd7S3nBCjYCfnEdNTjHsnX4i1l0l+/7Rn7vIW9u9MupTV/fkA1K?=
 =?us-ascii?Q?ucsGf9JdHC45VG6wth+vOjtcAhRO1KsScz47dBCnxoOxR6MzlRno024QWQfa?=
 =?us-ascii?Q?yngNqUVHBYZzaLOEzOyAa/+Sqt6F1ZwZACrXpOzhmvC/eWuMKKjUf+Y7ky0p?=
 =?us-ascii?Q?0ud+GiOZQA2GCsU63D2UITBFg0uT0Ck35Z5YAAxRwDy4V5COY6UNeVtb39F7?=
 =?us-ascii?Q?RAB/NGSgb+PpL8lodcapWyeVzBQZkYyVr67zHWee3Q/vAz4HOQ7aj6Ujh1lC?=
 =?us-ascii?Q?VMbhzy3HUVjgTePxibhzsSo0cMy+Qe/U9f7q8zFhC9fZk97QrCi3mBNIbBnj?=
 =?us-ascii?Q?lrxxtOjKEuHNltZw+gSz93KmPyTjgrg2ep5mTK5MNdq9qUw9uH3zDaqWT3I/?=
 =?us-ascii?Q?pO9WeIi9x8HfBu1OTrhcBzdmhEA6SqptqkyCBEpfbH827vVPO414MsIpq6UR?=
 =?us-ascii?Q?3W96RYiqEOYcrb2u8eDjC6CfjkAjvbLnV0IlMtK9p1qmaegtrTpE4JAR9mHe?=
 =?us-ascii?Q?KmRbBo3oXLcBNEspFj9a3bB6avJJxfq/CunP6oHltDVNJ1Htzm4MtuQu4fPY?=
 =?us-ascii?Q?58BEiEdYY8ST8x3nf6DL3CvVTSQ1qlfxyIJ7O4yAhPl/a3K+8Q8A6IDfkfm1?=
 =?us-ascii?Q?2s8Z4M3KoxrmqxrmVJowmWtsLxon8QoJRIai6grGG7875m8ll4BaWc2OKBaI?=
 =?us-ascii?Q?/+a8G8Mbbb59k+1Yj7HH01IEELyt7AdfZaeYboObFb6Pd5/dj8wGLAdGp1FY?=
 =?us-ascii?Q?jeK293BF6fwW3WQMtE1qEE/905WmznrcmUhEu5+6opZ7u9EpXtjyB9pfYoY2?=
 =?us-ascii?Q?W+CWn7XAo4qwGInJVUv9QMA6PVnfPcYBaewj4aU2noK+dnB2UAJS8Aa5pYMl?=
 =?us-ascii?Q?/FUOjCp6CzBs76AhVxb+ma4q04nbOShZNuYuQaFoK4AH?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81345083-9efc-49da-cb4e-08dc3c631ec9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 15:52:39.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIErlpsujd/jOJvKHBw1HVEWvLLgeHzmMdi4ZfFdj0sW/MkJ1gWFbvbZyrbJ9h2IJqtV8LwhkBDzw621qvg0wDVGQBp8n2p7FxkUtdiBy16+HnkCfPpJqilOljj3+c7z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6642
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Mar 2024 15:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8602

From: Christian Taedcke <christian.taedcke@weidmueller.com>

HVC_DRIVER cannot be selected directly since it has no prompt.

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---
 recipes-kernel/linux/linux-yocto/lxc.cfg | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linu=
x/linux-yocto/lxc.cfg
index e195c15b..ab75cbf0 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -16,9 +16,6 @@ CONFIG_NET_CLS_CGROUP=3Dm
 CONFIG_BLK_CGROUP=3Dy
 CONFIG_CGROUP_NET_PRIO=3Dy
=20
-# Virtual drivers
-CONFIG_HVC_DRIVER=3Dy
-
 # Base support for live boot
 CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_NLS_CODEPAGE_437=3Dy
--=20
2.34.1


