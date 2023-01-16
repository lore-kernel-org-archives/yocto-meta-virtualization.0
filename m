Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64FAC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 05:39:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.160077.1673847579405439089
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Jan 2023 21:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0380af5ed0=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G5ddmg006914
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Jan 2023 21:39:39 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6sf2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Jan 2023 21:39:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVrn9P/yB4JbqOBUKJM86lWGhHScfACTbL610fZM0R48/uUy5DhcG9xk0E7DsuSLQGnupWEptaCDG00owi+6T9Ul/NSOrrck+zDOy9a/qedljnE5GiG6dDSJxfgpBcifnbxZXDdL/FGjEefT2K2CA15uP/0oYZ0J6tJn2qFj9CdTvbfPdAMMijKEBi6/r7uRoT8Rwa98Zi3iAG8kQSDbo1WvWl/8KNEP0VSJvZW3MEJiwSVa1pBo1IukRTFK7QATkO1Jqjt1Y39p4LARnDbgG3JitiWw2BV9POnb+HHoA2sQLKAWv5/EtI+pjpo4BoCXfyVPD01pIB4/vjTDxUbcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnESoe7tAwxcTki/3iHYUqZcpC461oxT4/GCrb9uokA=;
 b=NkGltYEuuCE2IW6SCwvd/CafrSW1f7G6yZ81YqciWYiUvNmI1b5ZMvVDzwr2rk6AVMTOkfbze82WzcNN0Xf1eyNjl6IFcE8Q4Qdkz4DMhy0zR0O2dtrGeTsF53wBtHrqoX6F0HCFLmCWMdm6o7l0/0y2O2sVGff8WUc1l8XE7vuqcKMNMZ/0Uq88b5x2jgEnumdRVoAQgwQEZfVJsnFpDOk73a52Eu308WyOx92rS760QyvrojSeRq1uyQvUJE2+kFRbjDW6TjoJarnEk3IHsJ3dBDgzGgTQeLtW5BUadpoHe54JxlqKleg6Fwv+sBR4f9LOw37rSWEZwSjP5ZWyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 05:39:37 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%7]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 05:39:36 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][PATCH] ovs: update CVE_VERSION to 3.0.3
Date: Mon, 16 Jan 2023 13:39:20 +0800
Message-Id: <20230116053920.3547806-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f52b34d-7e51-4777-7535-08daf7840dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aWJ7WSQvB6vOuSFv9cXtjvSvAbRc4afUvO7Ve1aXpO9Fx8KKkssX9MuZbkUYS5Z7sUyL9jM4RzxXybbHMTPooUMCx4NPGIMCNgXttIP1hHHpfXNLvx5JokgTkXuIXEo/0zjDdLciFgtiKTkUenGsdx4Ft/tAnIufaqjh1xhRbUYCIHnodGTJ7CMwkNzbBF1H8FQp5OzFSHA+GY06DO0kJOKFeIgSw9XJNkWkyMUpRJtxCUN9tBhqV/iVZ+NkmHx0sIwEL7gan47pus3rLWKQXUkYr3SotRu0qkqq9hhuHddF/YiMSjDfP5931Mig4l/2kFOu3xwzfjSKFQ0lSFxUY3Cm4RORISS87pXAep/DiWxTslHPh094KNaUb/Eoern4wm7MiGi3Y2Pw/RR1ky4vO5h0ekkjL+SlUVOZO5xUjtyYN2za/sFSSfq22wSUV6xedf5VazwqjEiRwTgDL4APUT72eEFchFVHcjK5ixUazfZh7+baO7EAJaG4ceXiwsq4aVXaqevOw5c6ldjBPQPnSWGtf/6S/GEaiNp/PGuivPUNeA0WReCYCVjlzKpqsgPHVk7gsrGHxyObbHw6QqUCiiLHU+K86zQHN2N1ttmQmdFynjDVMuhCKclwpHNdqNwJMizW4aH10QpodM1DQAwMFfMbLA5VuL3h5vV1CZ5bAnumGBKuNkPriODq9jpT+go7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39840400004)(136003)(451199015)(41300700001)(6916009)(316002)(66946007)(66476007)(66556008)(83380400001)(6666004)(83170400001)(38100700002)(478600001)(38350700002)(6486002)(8676002)(52116002)(1076003)(2616005)(6506007)(6512007)(186003)(26005)(4744005)(2906002)(44832011)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CB93Az/fIFjYvpxTI7On5dgZtRuzReQfRJgMKq9s78+d2q8qneWKzNZIVSNZ?=
 =?us-ascii?Q?l9/MWbL4sBTfx7obIhqG165iJ3yn+0xSVjZHDHPIYVwpcXL4rKWPXqvy7aza?=
 =?us-ascii?Q?sUj/WXEp1rvHLkwPvVExbBqJzFii1hxz+ha8sHomXxy5MUHaN7dyRVHxQxUf?=
 =?us-ascii?Q?p5RVeQ980Xg2NT3iBKnyrED/atSu4x8UDcai4Rsut+idpeq80k5CndGFhUsj?=
 =?us-ascii?Q?ak6Nl/ryvvsJ4iP0CEPq+0ZD+1LTPsb5wFiiGU8gGeOXVEOFPiMhUGpACN6E?=
 =?us-ascii?Q?6D9RP15bl1YTRDcevq+eKzDsXXQlGOHGNF5I8mZNQ2PBgOVmphBy8LKNfQ7e?=
 =?us-ascii?Q?PI3S6p0u8qaTf1h4fUIBJY0PSEwHgnZIfAqanrSBr3V7+sHBlT5U3gmdBUrY?=
 =?us-ascii?Q?DZ749AeAkfK1LrC+eGo/PciQlOYE6MYsydAtp5f5w5zFtkEvz9TxQdbS+H60?=
 =?us-ascii?Q?2QzcSkenwQQB9+PlxWqOqkdSCAj1cXytWQllthKlEdu+XpkAC8eDLLi+OTyC?=
 =?us-ascii?Q?hUWHTp8TxPKTaL7DbNfHpaRDPZLu2ZIPL0p9mDQhJsIATb2v3WcukB1qmb6V?=
 =?us-ascii?Q?0uJ5udQ/41JZZzoblFq5kifxBbMFbp7Am0GKhbrqaOXIA5i6E363CPE/+ZW2?=
 =?us-ascii?Q?VgT7/AfMXtV6pLOpMO1FMXfmpG0eq+zrHYODHOZq/thlP2Z+0Ixa6elQqFai?=
 =?us-ascii?Q?qA1Wuqr5rBZUJV4LKBVt3am+4Gufusmy3rjuKvWg0apu3uHAXM+F3QIN0KqO?=
 =?us-ascii?Q?HdNhIUkqw2BadbCI+8oZg4D492pu+xU+oT0c/g33QYPW2xfleLNNgusm5Bgd?=
 =?us-ascii?Q?061cO2I5aVAoiXP7ZXSiKxvYjT0ACX12UXyHS30gCTreLRVwTVcFd1tr5Osw?=
 =?us-ascii?Q?1ikYpmOOjs/Lx/921j84+aCTXw5SN/xAz0BrzUWx653gYM4dTZMoyt5Hzzkg?=
 =?us-ascii?Q?KZJoWNGvg6iAKAJjm+oxA4Z1qQiakySDqgVpIvse/qHOy8AXCf+LQOWGqm3k?=
 =?us-ascii?Q?Llaw7wdUjq1nnYI4XVfAJW1DVspFa5M4UQwk3Bpm0345ZnSCADKlH31DrTAl?=
 =?us-ascii?Q?h8UiEqfaE9+AYgPFMRui53ecS7HvLle4E1JDCQ2n2G8ZHdLvjHqDtHRmKig/?=
 =?us-ascii?Q?6Nv8/LHebGG3aKDooXnECMW5rCrieAU1BpywaR/4DU5ElwPeWK2IMTNKfMNs?=
 =?us-ascii?Q?Rsq9FsMdRFSxCI7EVeXciuvRvNW9bLsupowE/xBv31dgPtxDjxg0RGrgTKlj?=
 =?us-ascii?Q?Wd5j7EZ8zoorYP94kHDTzxben7c37BcWtUAIE4qZK7aQhuodmCeENugurcoF?=
 =?us-ascii?Q?2VelkESsjnnYZ2s0V+zQkdBzDapqUyOyDhEHA8HBWBxBh3WkveWMZYsKW1bx?=
 =?us-ascii?Q?r6CcsUKEm7L8qDoUaxLpNc2U6YIoiSZu7zbU9MMtkLd8NbMhs0vZEh3Hp6/4?=
 =?us-ascii?Q?64bNAzihsDP6axyjo1Rqd6Jq+A+e8b/DB8fgo8ifzt1Jwl7VF/UO94QlI4oh?=
 =?us-ascii?Q?f4iZSyPdBy/q774BP8OTj65ZG+BUgN2vSA84VkoPRGRn/CGw7bpMOPlqenv8?=
 =?us-ascii?Q?koL2kef0Wtao5JQpf/g3ihHz+0yDewJ8BVG0+C/QJce9fkv+RCmNgA8sQ4/o?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f52b34d-7e51-4777-7535-08daf7840dd0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 05:39:36.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRlvnMr2zTqMzHS7jgmELrFQLTF8+okKSL48x0rchGTI0/QeycopeOpla9afWxvsVlwnGmTRFKpSTi0q60XTkTrfQ/rWfraRo4TxluuzW1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
X-Proofpoint-GUID: LiiF-926QfuHs5LPQ3QurYDQSeIpjB89
X-Proofpoint-ORIG-GUID: LiiF-926QfuHs5LPQ3QurYDQSeIpjB89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_04,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=772 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160041
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Jan 2023 05:39:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7814

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 3dd7cf7..1ad3e57 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN}-ptest += "\
 
 S = "${WORKDIR}/git"
 PV = "3.0.3+${SRCPV}"
-CVE_VERSION = "2.17.1"
+CVE_VERSION = "3.0.3"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-- 
2.34.1


