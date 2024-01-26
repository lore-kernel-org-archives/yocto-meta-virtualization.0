Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE49BC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:31:56 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.96])
 by mx.groups.io with SMTP id smtpd.web10.92.1706290308924262607
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 09:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=ECsXJSix;
 spf=pass (domain: ni.com, ip: 40.107.102.96, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJEpwY7gyyu+FBnFszUNfleSXWgt9UkOc4f0+OPqXK/Z6Edx2bGJtJI9KGtfCVU9VMEJZ6DtFwJcY4j3Ziln04dK7haxscc3pD+FtdFg5Zf2vc+WJ1f43m2eSeo07tSjpbKPeNXVnk7OnYZe2fAlleULolpUOjzGhJ9NKR4SYtQ1oIxP6pc3tXLemiUMaEZqQHjUoTX+xUnb6gQlhp7Af9u6QXuUGBdWNlx8Nt9IgXmizzc2KCNQE+cq6ELbe+NBFxXuOT3G4RtOm0FOj8BbwJT2yDaizEgwE2Qhs/B4ZHh5aD+jyriCpzuBfNiXYSKkqbp66XClwXhcTovdz2HOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk2zPRtyAVa7zAvA3pN6zHPCkC+neXrNp+kJL5Pfeao=;
 b=kkjo8qBviQhhZnTkMAB93KjRm/5toNrLW5WBvPpG75nIYDF1G+qfZkS3NU9GqF9OBpekoel8asVMDlPq4PrkIUQJQqZuKAkW1OzKjWVSqsfzoPIRwUlvWnZa72bmaanVcp6kZzavYScCyGslEkjN6YjBseDu2AVSqP1SGOOCoKK/YuDH5bUFvecNkAG+dXwPnmAwQsSyK+TXTYOnOmKLCpawCJqjppRgUn8cCrQ8BIj+gdDli4LjIA+6C2AxU+fe7ZfwcSVWOZU7wXuEUYvx/PCVKysVcLNmWUWAp0rOPOxgKSkDjrjS5PVutwNJ0prDpDUnTpOt7MtgwKQY4hvnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk2zPRtyAVa7zAvA3pN6zHPCkC+neXrNp+kJL5Pfeao=;
 b=ECsXJSixCfB5ylK5n6IOJqsdn/AIigW5bg7iwe9UpbaJbiQM8hClF1HY0wRlSFlmkcEVPe+qHNmqQNqwte3FFYaU0+SQB4le3sgJsqv7iqWePmm5qrOjpMUt+6PmbJ8Rvl8R3/pGGmjRV5hbNMzXso7uGJM2pvGJyHW5PEF/FlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7313.namprd04.prod.outlook.com (2603:10b6:303:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 17:31:47 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 17:31:47 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: meta-virtualization@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 2/3] libvirt: upgrade bbappend to 9.%
Date: Fri, 26 Jan 2024 12:30:49 -0500
Message-ID: <20240126173050.1137474-3-alex.stewart@ni.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126173050.1137474-1-alex.stewart@ni.com>
References: <20240126173050.1137474-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0391.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::6) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec029d5-301d-493d-3dd4-08dc1e94ac38
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rmNMm0F3UsuZ4wkg0R+d3sY/y1UeODlgyPpwndLYUEpS20xleQB8CQptc1TtiTXxxV9hekz+WaE9K/ceRGDX7BRUyBXV5QkjE2vejxcBAlVNWEJdC/a7zK876UoiuxyGSomhFcjUqgnVvSfxf3XRynmMOLbDrLysLDMob8swPjy10uYDp3zhDE8sn2shW0NKC4y9ba32imRtMclGkQ13ztvr3jAKUWUoiXRKY/tXEZDc/Ln7/sxEbHB84hqP71zvThS3VF+U1XWBDP1LEF9HQsO7CtVsb0pV5fwvPnpoGeNM/5++RxJrTPgZHSxJkH/Qc3YQoCKjATJdbGwXvNRPUUVNMgNl57111TUs28oGjsL543iKw2aFR3m01FAqS1dobAPTgKEh+8PTM6pienHKZIAs1aCpTrSE679vK+Ne30gvkwjDvmCOMwskxXUedTwnvCX6NHhRU0CS33TDvluK/qxSsrkg70lOdYNSQSyg42NW1qpQjKkfuyAeRgbGDj8f9G9Jspqov+vz/VdJSr8Ji59L0s3zvs+A3WFNfeZAnurJ1bTk0GYg4tjW91rOXmy9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4744005)(2906002)(38100700002)(5660300002)(44832011)(41300700001)(36756003)(6486002)(478600001)(6512007)(6506007)(1076003)(2616005)(83380400001)(8676002)(4326008)(8936002)(66476007)(66946007)(86362001)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QdlF2IUNlDw5+RCgq585ylg6UnF34tDxlyM4V0RmaQIrVqNTsPVRIimW+zCE?=
 =?us-ascii?Q?xgMnQMp+VTQtTikGMSNy9JJ3Gkra2rF0DKlpLpwy72JlxWrfnf4U87/xpM18?=
 =?us-ascii?Q?6NbiRXx1d3NR58pV2EqHlSFURI6qEYLo8JUpcX3v8Zoyo3jjB/ozZG7B60o6?=
 =?us-ascii?Q?AktaxZSRjKWeRBZZgYR5d37G/ZJxEbTS6CNmFkxEqv+06wmPGDKPQDz2BtyC?=
 =?us-ascii?Q?4mixoRYsYycm7bmJ+02TYKEjnaDVt3dR96X5ijlVzr2CNlD2cb05bl06lf2a?=
 =?us-ascii?Q?J0Xa2DG7eLc9T22Rb5VpEAd2LLbLsPoJyB86vxeM7LD7GMgEzLrKVT+a1PXb?=
 =?us-ascii?Q?RyK/KsGqYDYEnHkSMCP+fVeZWHRJ18i55GZrN58EeEWhVqFEfTc7EJ7C05ap?=
 =?us-ascii?Q?nScZewpppI/x9yfmQ0eOp2A8+ioeHvL77fpLD/5UuTqjNGZuY9lYSwS+Hr6u?=
 =?us-ascii?Q?VvNo3tFFXydF9DMWDBUZe2XPo0mxxZLtoplHPYD2F+qoit1eCiCeXZxos7fb?=
 =?us-ascii?Q?NCpl2SddHH7TWGCXIF0xRcE0ZbeKfTSCzReXmcNp+U6SI2TKNnsv7D0QSBg3?=
 =?us-ascii?Q?aXsCWO+7VFMuvmcnI+cKo6fbejy+cOQeiYthzXLlIbsOQdoM5IwW9dkaNtlu?=
 =?us-ascii?Q?a7p+jG7qEBso8mY/VDVELYkxnvG49lrnSjNlGakNQfd3WffJKNWSESKC31PK?=
 =?us-ascii?Q?AEXH11Ua+yApNVFQKVEg99QihK5dWi8l0EvqGgW5sPE5uxTzo41umXVhCL2W?=
 =?us-ascii?Q?2ExWmoEakwbklNxbxqk14nC9QFOmj6nDXkpq6in+667JkWeA6DEdqpx684IF?=
 =?us-ascii?Q?dlxOWsCuJj0zNrqBanqkCuw8VjnPWhZEyLN2D7Kkd26/eTbIE6kcAdUNge95?=
 =?us-ascii?Q?cR+y1HFNUU0AaEoxQbLvTqpD8Fr6NbdvVyuAc1k5MBDYX27yU+Q9M1N/2lB2?=
 =?us-ascii?Q?28/n/R3KcQFHJ009SuHgMAIHkNtf/d6hHSiK49SDTtoMq//8kgnM7HO+e6EV?=
 =?us-ascii?Q?2ud9NeajtzjZd/3diIpUSbHklECRaxju7aj48U8YF+tucWOtlw+lUadtc8W9?=
 =?us-ascii?Q?9y10nMHYNH1I5yu7VSiFlhZDNII2GZglM1r+c7+Qx0byuAKe/IgaImnauHmP?=
 =?us-ascii?Q?A+NSsMqY3s0IddRvewrYs8gNXpJPSkkP59aJFj/I2WZo+qmFmspQdIzT1Sem?=
 =?us-ascii?Q?8MdlVCC73kOjyqZQu564di1Oyd+mOYSLz0+JNDOrz+4fnD2RmU0SqNaPjewY?=
 =?us-ascii?Q?me+ZwPvqDLRsdm5ZhxRZqt4wb0xacioNMnc0xXKK8Sk+AsZaQOO4DwJe0t41?=
 =?us-ascii?Q?uhTeDuQspU+r1wRwo+ijZdn6/NrHcq1WW6wm7y8e1sUuy4xqNmURLsyc8PXw?=
 =?us-ascii?Q?cYn+uncfQyEl54VdNgLfB+8tEWrgTUtI2bDqhsq4LiFU77oBQuSI9FWVDLPY?=
 =?us-ascii?Q?P/z7tTGsk2g13k5vNJ5zjz2OcNrmLzx5VMEyjJnn15MN8KAfKmQYrWt1MKLG?=
 =?us-ascii?Q?MorQwXIelc1EJikc3EufciOABuD4fk740o95l/wTcrwxPZnggNrEKw3B8BaF?=
 =?us-ascii?Q?xAw2Pucq1Y9zc0siX8FIbHb/wMMeHVQmB6tBV0gHRRevXX67JN/Sj//DMq6/?=
 =?us-ascii?Q?o6V8St05+ROe7q8dtQZkZTA=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec029d5-301d-493d-3dd4-08dc1e94ac38
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:31:47.4059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xGtmapI9sG6ntKCfEXbIC6c2fBLlEMC5Zy+KNPBUdSuYF5FIz+M4IKU8buC5b9lwBsZgRLI88Rd7j27oVoaDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7313
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jan 2024 17:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8554

Compatibility with meta-virtualization nanbield.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../libvirt/{libvirt_8.%.bbappend =3D> libvirt_9.%.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/libvirt/{libvirt_8.%.bbappend =3D> =
libvirt_9.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend b=
/meta-openstack/recipes-extended/libvirt/libvirt_9.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
rename to meta-openstack/recipes-extended/libvirt/libvirt_9.%.bbappend
--=20
2.40.1


