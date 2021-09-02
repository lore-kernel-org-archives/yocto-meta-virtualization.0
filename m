Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4317.1630572838324547161
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Sep 2021 01:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nimTJQ3e;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4879bf5a3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1827b2Xb021113
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 2 Sep 2021 01:53:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=AzO32uljEFONBxhvY+LF2F74IVmOy9un3th4zWLify4=;
 b=nimTJQ3eqNYMXa/Gx8S1tVN+J2EEU/2wkKew/uYNhbZCRD58KVW2X9JJR5PgHo5IDaPB
 Wp13a79O69U0VfIpDyBC4NjGzNQ8sYKrxV5fpuGNLjOmwL3t3+icMALxG7A7C2RhiOGU
 VNorBrrJ+E88sBSVf3uTMIBMM+GpULm5znSO3cKZg6Y7bhGhULJYhV/nDfzh6T+cORcS
 35wZEAI3f1mdE07y4iaEwXZSgRtDEOxc0Uj5mx/W07eXfckhkKMs79t23cu/F0BQMA7w
 2wtVyH6eou+kIiml4ZOFgzRtWngb5V3rLvRtp/l3ZDmGb75Parcka4b7ggOpuiUQATKJ MQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx60gd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Sep 2021 01:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvmdI0bhH4hqHlnIRu3AIdly/o6MYtCwThY6fDSwLa9p23czQp00OyafvKaDp1KiGuCwdoPZlEyTgUrePUuncCkQs46MZXKw0w/SaM2PmnAeXnr26XpUrDTLi3zGrxIbZSnohx2Gfxx19xXFdd5DNxD6VW9/gcWkTiTBZ4VD/Br+3SLojTtP1VCvu+wBy4lI0pY6DaktMhtuKUuSSAu0IHBdRCLjwJASI6DvYYQti+GsbXhHapTdqQ8IwNRuMC+hBcBEnK/eqokbF10fmlgz2oWhl1AvN4iVqjeStWdUa0crDUwSjFqW70/Y912RFovYnE5hdC3fyNu3IERkwm6Y3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzO32uljEFONBxhvY+LF2F74IVmOy9un3th4zWLify4=;
 b=iJui7E060N5HQSvPB1/Jgbu+uafRMVRePFP5xDB9haliEYpwBu7BCSfcrGAv1n5/DUf50OchMgS4/It0G/UKUENkU9bkvpMIsS3Y1pK58VP1QanGlun2vSlmBVAzcQxioK/T0d/ZpLHHkxlCQJd3KHxESKzQfSbdIYwwDJ5u4d8CYdi73Av/8lZP1vaU/cr7Z3/xS1uA7thrrsuC8xiMdudTUGMs5sZSdRp5LWEGS/ZobdF/aJ2bxBarymrsmjJOy7sq4YZzVFnKx1rDq967RDY6XONNGgJllEqPS3ddYidRHrMu3bhvadOnkBnVtm+HbywySJ0bcmf4QO5Kjpw4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1981.namprd11.prod.outlook.com (2603:10b6:300:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 08:53:55 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5dd9:8ef5:89d7:8b3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5dd9:8ef5:89d7:8b3%3]) with mapi id 15.20.4478.020; Thu, 2 Sep 2021
 08:53:55 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] docker-distribution: allow empty packages
Date: Thu,  2 Sep 2021 16:53:44 +0800
Message-Id: <20210902085344.74360-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 08:53:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cff68369-c72d-43d0-eaec-08d96def31e7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1981:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB198190817A6ED28CC158F2BCF9CE9@MWHPR11MB1981.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZVPtFTzB4F3VWgn9vDNXY7rVAULY3nZfyXewNrd3FnFKVa127GXo1GKAsLF2Jxz6//mwmGJqTqcUZ+NiuXq2QUJYZ93qj++PJmOwyjkOM0GDE0K+5tbsPVoEDl+DJKnkxxwTFlRf5vGrtK9WZU0GVe90b76vBflO0uK3xUMv4aZnlOd1lvHgpNOiZlaSV9vugjSoV4jOCmma/Z1jcIEus2uf1crNH2nHG3ivRHztJkrxsmuKJClbfJDZgsEnzGWAgBv253EJciphKMJ5LrR6B6xEcSYZg8ytNrWFj2be8IxPg5RIrmHZ2pehcbouSzCydSE8ZDj4MwTJpPbgFZHZEOFcqj6o65RfU4JQNzcXPLmCJKOgfWXFqYUOmZ1pMYG4sq6veo4hta018KTzj08TupEDjpwJ09Ur3DBM5VyBIb2JoNV0q3Clj92CA3e6+XHHEOtWC9JgtZ8WKCqUk4zi+MrhWp3TImYx3dQAABMcFGjQWlJ+msffmDXIRpSGWAtSocgFU6XH7keMEb1gDk8DPB75HxwcqJSp8socpIJw+60WIq+GALxr3swJaqpTZx1YtqkXhbejSduWx+TaFUN8TADL8Tal7g6RS8TFuGCwJezQwZzBfsHJvR9DFUprOAaE2UkOGMgqHavTCo0Y5DRTITT4A2LO/H6WQd4za18HJNYk2NDeJXQnUgL9eVCPv1qhf6g4dEMRdNg1unfVEZNe0A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(366004)(136003)(396003)(6916009)(1076003)(86362001)(186003)(66946007)(26005)(478600001)(6512007)(4744005)(66476007)(66556008)(6666004)(6486002)(2906002)(5660300002)(36756003)(38100700002)(38350700002)(2616005)(316002)(44832011)(956004)(8676002)(6506007)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6nvYEoYvZP0J6xS9UC15i4AMOwH07N5s7dqfTbrMmJuVQRYRl9X0oE52AFeA?=
 =?us-ascii?Q?e0i/7Uh5gCy8r+WN+WW14Wtr3qlaL4X2FPQkjdw6a5wNtEntg6cgzfucDnWG?=
 =?us-ascii?Q?RfGfn4qBUsalYsTKUuuF944ho4RQDoxYFC2q7ZpNBFHdVYrio8HrXCGHEoKG?=
 =?us-ascii?Q?kNq7ahGOkmMSNRoc+M0rwLnYxfLhwZHjCkvQlFG5O8kfDbL8090HflMx8yM3?=
 =?us-ascii?Q?MvkyH5aKzJy21NlSu1mrf3p36kyVLP+DFTB3FuFNusbTWF6gmpo7tNM+nHQi?=
 =?us-ascii?Q?F1vzATmJADpSLQPEacLPxYObB3cFBB3B/dmqSmZ625AgMOAEgRKupf6PNtnu?=
 =?us-ascii?Q?fhzooWpXDXotH8vz02LCrBmobKv9ejUYek03KRz38wGri67IEotFp9ReFT+7?=
 =?us-ascii?Q?Le93eE4Drru9KSeFxYavHvGrwse+CtNvZD77NSp6cvkvm1y4tvWzUxgySK7w?=
 =?us-ascii?Q?Kde9UqdLsCPRccx1ix4b1wRwaDGnYx8RjdJ8YMY06wbbpEv65/Kzh3gfhG8W?=
 =?us-ascii?Q?XWY6vsnXEPFqIc6WsqyO4PJAKXrOm1VzZt09hX7+llYKj/k3bHjmZt2jtTik?=
 =?us-ascii?Q?o18PaFEiiQS5VPenZOqC1+xL8CsK0EL9wphgRHhthK9KH61JSCEN7h2A75Sx?=
 =?us-ascii?Q?V8tqiqB+nA7VZYFqmeEBI16zgWX6wAlsRNxKFbcEff+4q0DQSAQON1sbKkaC?=
 =?us-ascii?Q?FUJZ+WjXoybozXGv7t0NJa2FAeYubX6pADxMrutOCSVYiE/3k4JKPJ14vdMK?=
 =?us-ascii?Q?4JC3aytK7EJQ3+3wyJbbs+U/LzwJpu/E48h8CKhq+hg8jdm0fcWOg8bJm6P9?=
 =?us-ascii?Q?wOVWx4WRoyyfZn84OoqF46iHRwLknQuq61B7L2PfSmYEuvjP8yGV5mluptMD?=
 =?us-ascii?Q?iZAUiqpC3O/R2qQzUrUMEx8sbDWK1WQpXS9wGq+9DZtugjM/anIjxoZhS9xK?=
 =?us-ascii?Q?Ol2BRMJIw830d4ioqdJzFZ4tp32DKMC/t3mP9dxa5X7xeWHce2+P1ZZlKn/V?=
 =?us-ascii?Q?qIIHuX/uiqjkSRN0Fs/N9WpdPSeCBYiGBMmjjOZblHOLoUE90ruqyU/AgpiG?=
 =?us-ascii?Q?229F4HUlNhqd16Pc7rUnse0G/ZHPz80vdfydpLw53tQDDRHaBepQNJlgw83V?=
 =?us-ascii?Q?REsAZOQ7btXoGikUlqJHaae6XBaWpJsklOYvm6tKTg25z4qNoPrnmhmTjoVf?=
 =?us-ascii?Q?RruVZvn90eLKlhBakaCI9/0GqnpqfGAaJq14YymA/fKgeU72BZUZ+OnupcTd?=
 =?us-ascii?Q?kQGTGDB3QUgwexxtAlUgbGPOPdUuHNraYWPJAWi0w5BKrMEgxUib0e1DKsov?=
 =?us-ascii?Q?D5c2uUL+uy5mZGwaUBFTI85Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff68369-c72d-43d0-eaec-08d96def31e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:53:55.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFcMkuzHwWGshRi4CoQXsb2rl+rp4lKXzeSTz4vbLYJiN3UzF4DgxkBpCXhc2WbKucJ3beIe/LOGMUe0IvBgwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1981
X-Proofpoint-GUID: 4LjJIl8gK85WaIkXnlqzgPlg4VVd2iIz
X-Proofpoint-ORIG-GUID: 4LjJIl8gK85WaIkXnlqzgPlg4VVd2iIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_03,2021-09-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 mlxlogscore=530 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020054
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Allow to create empty packages for docker-distribution and
docker-distribution-dev to fix the do_populate_sdk error:
Error: nothing provides docker-distribution = v2.7.1-r0 needed by docker-distribution-dev-v2.7.1-r0.core2_64

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb             | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 1f6334f..6e93a21 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -72,3 +72,6 @@ SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 RDEPENDS:${PN}-ptest:remove = "${PN}"
 
 CVE_PRODUCT = "docker_registry"
+
+ALLOW_EMPTY:${PN} = "1"
+ALLOW_EMPTY:${PN}-dev = "1"
-- 
2.25.1

