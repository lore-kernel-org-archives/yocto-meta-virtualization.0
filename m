Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F781C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 04:25:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2350.1650947123850379652
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 21:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GfanvhyS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1115f13a8e=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q4PMbt031803
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 21:25:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=fiqhbG7lrKdhFDYmcAEivtLCM5+5qExvRt8DJU2/j5o=;
 b=GfanvhySsVeM35a803iJB7HwDu6AIT85aDr1lKlSVx/Ua0Goq5P0wPe+ajdr35u6GUT3
 RPaEwOLYU5DiYTlbV/ZbVGsUlIrMn+8A9wITVFbfHXkmSfW50/TicxT274ajJosibZ5p
 wZfnKlRIJz7JAVseWp8flGOjMRuzQFI1P+qZLkMkC+35CE3XKCJId2O8+FIHxtSIyTgo
 8phz/9EL1obDFc4X8+PS4CMoiTfhgcRYlQvUoc/OiSBEDZD3XnPE8MhKyN9wMRWLm601
 vnp9pgxWW2Vbstm+0Pzqe+zk4A9XyCUECUPeKd1I/4P8Q1fzCcINQEPn3taZpy4iusdk Hg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgyksvtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 21:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/VoFZHord8OWcizSKsS8fP6SMXPilLgcZnNKJfPm7g2peZRsEUZliRj1rYL1PRM1X9BlmfWGAJhXh4jgDAYbXxrei6xzyewH/Dl/y8uisUV2dIP0S8COicPuCQ/cCksD5KLYdr7aP+uSLea7H7XN6dxaNvcJ6hxfNFXTbe4kfUFbafLQOYOEQlHmThDK9ZP0EisoeOydYSKajhhFwX8ZX1IskOeVO+maxa9Fkr0/QY7ysiZ60hoDhor5+dUk+psrjNLe7RYbUgtVAeIoBTjUCer6QLmzlYV0EnJgRgyNpi1knS93xNaX9uoYeG6PqFtIF1Rgw7DonRgxZ/mOz8bhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiqhbG7lrKdhFDYmcAEivtLCM5+5qExvRt8DJU2/j5o=;
 b=R2KxxToqHoax2TyzDAYu5vDpx1x7V9y/72W6Pdc2WDA17etLUX5uj/V8avs50tP1P5Ra+l8JNPAfWOslRE7ExqOXLf1fFsGnt4eN6w+oF8DGhnjNeVbguEkC+Lj90NI0a4UIKBala0jHTX9UomF7IkKlaJo5Rop2MRmBuInBpqWNmUf8i6v5IqlZWwYhHhLWPFF0eVYXwBDiAn1CJ23iehmVIUqKKWEHZHAYUA2+YvA3PfWmybHSeFA+b0XgFuR1AR0WyUViXHS7zPcQr2fvK3ZkdgnX9xpCxLJos3KnNd82wCZDb1ik3pBfKOD4T3aYiQeEMCJytGdBfaksTC25AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN6PR11MB2606.namprd11.prod.outlook.com (2603:10b6:805:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 04:25:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 04:25:18 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] containerd-opencontainers:
 add CVE_VERSION setting
Date: Mon, 25 Apr 2022 21:25:07 -0700
Message-Id: <20220426042507.104803-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9283c849-19a5-46fd-39c0-08da273cc4f2
X-MS-TrafficTypeDiagnostic: SN6PR11MB2606:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2606BF4FDB226BA5568059E2EDFB9@SN6PR11MB2606.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wek3rvN7a7PiJYFs4DLGEIQtmUDdmdqfuNamwUTM4taJbOGyf8OwWSRGYnycN8SAku3guaRRZUihTbhtobap67EvjkA/tHZnhDprDxF1owQFJajkI5wu71fi452B+kCHSkDfGJj3aXS20O5e46enGJhiyETQlcTyH/lX5UCUEuUXy9O7tAqosd5Y7qDXB0B0yA1/0NbMbZkzh7TSceYm6zQd/pa6qQwgOF1dmPTCFDD1CYK55w8OsUXyrIPUwRSg4uE3UTsj+/+9zzbvsX4qUL1OtVi5NobCoyE64/xKCOWaj1M1kPZ83+be4ii2gwcFcYtk39ED0upG3F3G8tOG6krO4X0oiDbxbILFY5c34YmoBQg7IAfC5hLFlmEaaJav+l/05GttiA8k2FPSez5hwoXFR4Ca3ox664Dt7g8BENDrY5kVk3QAJmNdWHqo7k4tfP09RVG/iXqzhAq2KIMbzSKCDIYPm6kdmh14vL8Xbx8nEXo26fTeCcNUplnOMCco7phXyulk3cPkN9TdVDugNweq3QROoNdOOWw3kudLJWDedOPwR0ShLQ4b+E74VMKyM5eFn703Lm6f4GcJFGYX73FaixH28+07h1iWA9UCYw1ejUqt1gBANuaczFZiCtqTxggdIUYb7TT0LAFRT+vRoKJu8d2xKtWfuK4LmK9GIurPr//z48S4BfjB7bMVE+qNcUcf91yLpDzS424LnHlvfhwPevImzoBWkLWlba0egYaVB+1ukU+spBSRLbR3n2CEgOXzKwUjSqEZmH6GInbow/wcO9ZrdM9o+9ZMrLhowWY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(1076003)(6512007)(26005)(6666004)(6486002)(508600001)(186003)(38100700002)(38350700002)(6506007)(2616005)(6916009)(966005)(86362001)(4744005)(2906002)(8936002)(36756003)(66476007)(66556008)(8676002)(5660300002)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?amgQprZsD24bJhWuJqvrJsLMo49H9zcSKy5G0cJMuiB2WdJHJmt9DfVr4w4T?=
 =?us-ascii?Q?fgDbk4JXfNmC8vHe1krhjjAF50v8UGU9IW+rAT0Ppl1Wpt8WvIZ+h9OHuRqF?=
 =?us-ascii?Q?9XQkDah4LkLIobNN+4QwTVompN5AMPg5MQux+2oZASQNn5biLyO1whDI5jzH?=
 =?us-ascii?Q?z12d4Gfzq2RvOBbepVbD0qpl56WHXiMM607KKNnfVKi2CrqImyG6qz0A+6GP?=
 =?us-ascii?Q?xqVsETbSY/KR5EkHO7yJqqL6wStYeN7hO9Ur8ZMMCxWZl8fP9+gCH3aqj8l1?=
 =?us-ascii?Q?uLJyc16lqoxKsXDFE9O9l+NFiVsPQ/cKJaYDuqJAX40+wlao4bKG1JI45LtV?=
 =?us-ascii?Q?3BA7hZsBHK31oRyHUTKWHB59cDE/egNNGBxeKoBUEWb3ywrOwpTtyL13rN+S?=
 =?us-ascii?Q?FzTSdmbffdgrxKYQ3XftesPja0kT2XGDc2pYyQuwANTs1DPpQHY27e/LTgSR?=
 =?us-ascii?Q?U20Pil6Px1VwSscmWtWBg4MdMNYJU1OONT06HEk/WozsHmW+2S4Xg4dV2BlF?=
 =?us-ascii?Q?Bg7RA9MKnI7gPo1GQ68TSwH3zla4z3N9UqWMfF6mo9ZvG9RK8ZRy0OlYyLOA?=
 =?us-ascii?Q?c6xllUkdCovTxnV6UdoR3c/KhaUs9y9PyNIBkSoXBb4eI7L7pBBb2c/4OPSj?=
 =?us-ascii?Q?b0bzTaCSvxYm7GTjgV8i9qceleQywOg1bHd6izl8Fc4lHiyp4Wj3D/2j0xYr?=
 =?us-ascii?Q?PfgXDMaVIPqga/B+j1uaIsyWNvpPo7UUXy0NK2NGxJox/nTXXgubULMDzVWj?=
 =?us-ascii?Q?b6ptHoUyaBb8g3Rwjti1/2u6sKLqN3KgduM2q25gJfRV2jlgS1bgKvmSkgSi?=
 =?us-ascii?Q?UkJvZJc0kFiFDpv5mpch+5l0JPPHhkfBTUfpaAMFYV2PVJmYvlGw6vMZx9tz?=
 =?us-ascii?Q?BTYs+tHyfZfjdNiMWlbHT8oREPKC/BkC9DZoHhclQQT0SuoiC0fphBXcmsc+?=
 =?us-ascii?Q?K9to+yng0ZFP2yQEMwSPeNx2xDr9IXN8c0DMmmkUke2tsiFPWFSR06I/Vxoo?=
 =?us-ascii?Q?NKTwjwMNXK9ejEYUz1pikCix1lYtGSYq88fxak+7OU5/yvY3AQrCMRx32hY4?=
 =?us-ascii?Q?VVDAkPgbyYt/KBynNNN4P9qNrfu2x/eCUUawp0PghpP0/OEDMmfKz+wfr74Q?=
 =?us-ascii?Q?whTrOwp3rih7ZFP+v7Wd/MLtoLPcL1RuABsnodfja8faHd9enOaec+42QJyr?=
 =?us-ascii?Q?H04WAzO1SyTGXaH948s+z6ARFDWSqwp4Aol+1ySc/BtPMib7ZeTwlQryl987?=
 =?us-ascii?Q?umS1w0coYiLukd5DuLn5qi64okkPNJFA3jv+4nyJHCzbB3BOCvhOAmQklYcm?=
 =?us-ascii?Q?aYAjnv7Xg/CImDS+M20TeFAJ6Qz7Bfvqo3odcO0YhTO0M6m8oHxSewGKBF5J?=
 =?us-ascii?Q?bzZHPXTuXfxSsW/FRVLuPdQiiFVsJhzayIsc+b1XoJBNqr3Su1/B9ZHnW+5S?=
 =?us-ascii?Q?EIFvUs+2uLjloFkNWxQQVdZ6MKA5k22UxAnSLApusWtbS9MixWcyzWlelrgV?=
 =?us-ascii?Q?4TzEBcJ6335Di01m2DMUo5ceIymiueL3fd48AdRayXtu/HB9w0uWZTBNeiKG?=
 =?us-ascii?Q?Oy3pQf0WFunkUoXKRmyU1sFAlmyR8ZcRVW+fVi9WwgcCJ8UVeUBV+4khnsoM?=
 =?us-ascii?Q?euIvj8f1RagtuhEC/Kk2vVx9M9QEza2gyJ+/bximLBALpIJT12O9e5MYqukc?=
 =?us-ascii?Q?w8im8GUtIbw1d45zpolTilgXLk18iDAm6D4idlqltcO/kBgI9GKpaGqShG7n?=
 =?us-ascii?Q?WVI9SrYqFEHJMTaYvK17ntFvguQKoUM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9283c849-19a5-46fd-39c0-08da273cc4f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 04:25:18.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 w5zJWaawHAw1JTCsBDxVMVk0T1eFuBy4a7U7OgxniMz9ih2eL78YoeKjgpMq2CA9XcwKgM69tr2pc92Nt6BLoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2606
X-Proofpoint-GUID: jeS_uJuCedtDVn_Z63iZpver00H6tMyG
X-Proofpoint-ORIG-GUID: jeS_uJuCedtDVn_Z63iZpver00H6tMyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_01,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=491 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260026
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Apr 2022 04:25:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7216

The NVD database uses version without a prefixing 'v'
for containerd.

e.g.
https://nvd.nist.gov/vuln/detail/CVE-2022-23648

So we need to explictly set CVE_VERSION.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 40b03163..2beeaf8f 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -16,6 +16,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
 CONTAINERD_VERSION = "v1.4.13"
+CVE_VERSION = "1.4.13"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.33.0


