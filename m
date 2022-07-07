Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9D4C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 01:53:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.860.1657158782964679247
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jul 2022 18:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RMkNpd/p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41872ca0c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2671qEfA016443
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 7 Jul 2022 01:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=8JKb4F7C/FD2J6uXbKWCcuOQYWpNk6gjFS1+IipfLPo=;
 b=RMkNpd/pYgqyULL2lkFJvLK9K0W/TUp0n2QmEYmy2hyNVbKxtYJN++61ZrHweRyb2I8N
 4guRAxbcJyIoC8zIQ0kyZQMPScJ+FzaFkTa6G1URM/q2O72z97qenMSKQw6q2LOyhOS7
 oFEi612Gezdo2gF2Q0UrDPpw4vXewGmxwvcm2oyb7jzsl7MUY5HjOqFzGzm4A4nGCayL
 o9Dq5C7KUYHioQwal2DyX4NhuKNIY8HCJN1NKz5KRukiXviQcxNUhhKfMcLC0XKPSaOK
 hvB4IWzccwXgHLaWlt/vWzfu99ovD33NvdPQma1uYJUJtdOOF6NVPe6ifFUB8A53e5u3 vA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uh0s1ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 01:53:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0xyrjOS7D7tGXQA7ZPPi6aISn7rtCGEF1MOmL7chLdJOhrezJBkqxMN8ag+6pbIUtWNAJtEGAW44YEJPS1S5bB7YpLkv7kwiL6xXPWRp8NoFj38OrsfsT82sH2XFIebj3WUCCnS7HMza6OQrV4bjQewWiFxibOy60ZTBssnz13iD01sWe6vTd7LXOvdCuyALv9eLstaNc955QDyLL2sjDbiZvLJtyn+p7q2R6T7seREmICjAn6KMdnVWRZmUYORN2FRcIVhkr+H91C2Bm6abrdhI6M5jl5mRG/fjr4O2LlQF3vNmufyNTvc+qpVGoRZGJMhOUrJ9lH2h/QxOMzrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JKb4F7C/FD2J6uXbKWCcuOQYWpNk6gjFS1+IipfLPo=;
 b=Uts7GT4e5m8MxYsEEubxcgQDqiVXB4kItP9JqswJqCIia7hmtKJPCiFclm4bOBzUBf1HlDHqU+dKjDspF8YwHegpwGNklUDqYKIsbTIMvW7ZOXiFedBXDZCICXAdO6iJLjXV9X8wc3CEtc+/YpCmjUYEwphzFvgMsbklj5rvGvW6j0Aph+qJJ2zE1XdosfrkA2KE0CjBn+BvrAtkZUKHvUwqpiU2uYehj3WnQ9/8SI/grqhUDUheW+dQ195V/BQhFTUPcrmxhDyy+S9PZUWcqiwNHjeXaZZqwqaw1MshfdTPt32ngNdXAFuhv9uFqTMGTLA+hHvwT80lvwS3Ir88LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 01:53:00 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::5cff:5bdf:9dcc:e393]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::5cff:5bdf:9dcc:e393%8]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 01:53:00 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 2/2] runc/docker: update to
 1.1.2
Date: Wed,  6 Jul 2022 18:52:46 -0700
Message-Id: <20220707015246.14696-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220707015246.14696-1-Qi.Chen@windriver.com>
References: <20220707015246.14696-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 982c8265-d639-4873-8c68-08da5fbb6ba5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3817:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ecRMNwMjKX60lAqWxhlxoxNUzCbnrFJVgPCeomzZ8YHZVsqk55IvUfEXEiCK7X28sO1IPZO9NVXdsReA71hdPvUeQ3CTdXdwzih3xBInItuaAhaKpOnxp005b8Pd3mCKve3bbJAivr45lxDCkKng/OHQ4qXgpCmpJ5vfz7Mt0VYnqEHWv40OCVuQSOkuGmxqDdOSh/T5gFzmTxMTbpi8I18+Ov+OUqvZwNzLRbzaULPnOIDDfx1Qv2D6QzEfvqvpvCPZEtiFT0qUPoUU0KCMdsVTdV2uMdA2NAZ39984//VXi5LFFI6j8/ONzs7N2nkyYIjsrrfIFh4w3lGTTKLxlcRmcO98xEpmH9mqlUUdmQzI8MkRl7VUeOuz3Jw72wK3NFHOU+iwfxQBt68hJgBhYoktUWp70MLztj8Iu6N9ahzSxGlngQXq0st8vqnUeAs3J2e9sf6kits3L5tKaG6/ps3mIvfMZFPkS2Bt/5WSLgXs64zhw0jDuC0GQTLYnmV5PVXm3u4TFmhpob6tVDvAJbTaNngEuNMCJ59m32jy0jNkfFr3gYPB3EyXhPTXTtt7GrU911HvA9ob9e1vtHr2Y9TGx+mjvvh5rgmXhdNggJgwsbesd3MEP3AscJcs8PlMnhTa0fwKn7SB5dvOSt7+rsK3Ui806TItYKxCoxFDVR/zuOLcHh/JgI/kuM2qfWCS+Xs9MqzI9Y0kr5oY8EkMcyoXIhFCive3yTiVcGygGDNbfTDpl1/2Rwwx+tD79+f/LKnbQH4Mj0v4Y3lY5SFGqDGGhzfTsnn5REnqPqJpgnj2YZBV1SXVYZoTnc/1qIAA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(478600001)(52116002)(5660300002)(6486002)(86362001)(8936002)(6506007)(41300700001)(2906002)(6512007)(15650500001)(6666004)(26005)(38350700002)(2616005)(186003)(66556008)(66476007)(83380400001)(36756003)(316002)(6916009)(66946007)(38100700002)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n8TsJ5nBhgECGPCKRDI52O9V3Fxu6HJNCR9sgHJqXGylB4s5TNmV6ocqCGxD?=
 =?us-ascii?Q?LTcBTAxJehbsPCpo6xOrbPt0ApPNBjmZ0EyWP/YB8lp7ZqiKh0HCBqN1wmAx?=
 =?us-ascii?Q?WprytgI11umDDEA6YQGAxH9kJ7iDnk6uzb2ACU37jD8PSVrPYjCtiJKhqt4v?=
 =?us-ascii?Q?o7TxiYUjHuL5SpLyiZ4WZlydNtuRzBExd+jlvtZkyZwBz0D9nd54hLQJLW2k?=
 =?us-ascii?Q?fz4/0WkOCvKUhQPk58qgr4HzmTGfObUK2IzzAcnh241MT95cCP2wVVcJqTm2?=
 =?us-ascii?Q?vYsUxDc2pmnRP+7rjQ/VVup/NfO5kvvE+oeypibBRtwUlYCdmSR+eLa9L8lB?=
 =?us-ascii?Q?sYzcu9kpTGNCNqIzW13yCoIz4Wi4Kyk1zDlWN6xemrbRWGhRyefvFe58XgwU?=
 =?us-ascii?Q?DxJr5C3+Uz2lBUNj7C+6LYHhc3H3JOqH4ADw87Q8AtPKjFJUIEAg2UpcDy4l?=
 =?us-ascii?Q?fqhcWTgSRPgC8aO0+pIGcQ8mUtI7XLMk9CAX+4Z4RPy70N7qXxk3riRJthSv?=
 =?us-ascii?Q?gcMGXOESVbPKF45kozILYsFgqjFM3CpDMXwFIWD4fsC58WwY4MUAazWVkCrD?=
 =?us-ascii?Q?/UZ+Ca8LvSXD+lUAfIy8x6TupH+OuvTUPSgUQAPLfnYf3J8nILS62HqczOFC?=
 =?us-ascii?Q?DJyfWxP+QfNuutIEysJKTHDKifKh9CErNlCad+keNvyMHNK7fjqBoj9Y4WUe?=
 =?us-ascii?Q?PVoeSLDC4gib55vsFk/2JDj4Q1Cftej8pBjmR0sgqkjIj9vRSqdM4gUj58T4?=
 =?us-ascii?Q?6WhZfJfJBvKPgjjPXtUNE5VgLDZI5suQxB/JpZxbctmVoPvDt2dK/77xZlUn?=
 =?us-ascii?Q?CdzVzg3i7ihHlI+8nb48Miqtc4+JOjWfI96ZKPpEQRHBL8bH36Qa/ca934rr?=
 =?us-ascii?Q?9Kqp/2qKpo3RxQNqqA5cLiYdPH0pyeUic72C0m1A/Y+3OrtF1M5i/0UhB2b4?=
 =?us-ascii?Q?+tHB+1sGFRpDFka5LNKCfq7Sn2dqK02ess62E4Q7BeKbqar2c/HdlQNHrpjm?=
 =?us-ascii?Q?8uh9X3XixrsSATzElnUObyZNs8J+arITXcd7wSFYFYY66I3rShx9EQkKeH3Q?=
 =?us-ascii?Q?hD4SYAKMf8M8akM6NaN7QVJCSCWbkdNR9Ca9C96nBwTFhCymf44lhv7fYd7T?=
 =?us-ascii?Q?BMOXecWqdDRspBna5qVtCcuRHvWZGyTM6g+1cJtz5WAG1sAZKpzE4eoO96BS?=
 =?us-ascii?Q?3Dy/o0g6e40uTf+yobnEEC39hshuKwc819e16tpt9dlLCZ+LBztWuidYJieO?=
 =?us-ascii?Q?7jGp952n8mlcQUm4VC9eOWOhoHJ5TKH62LDOpq8foTlLqnn8Il3fau3NEgWv?=
 =?us-ascii?Q?9URtg0s1lLM31HRcD7ITL3C+qklUbUMK0xsIit9VYksv1w/3Kq94ncodiD3k?=
 =?us-ascii?Q?vHF9qpPvEwb98WtPoJyMQz3KJGdlqzj1a03RlqDYXnkCoVdXUaTq2iJwyYI2?=
 =?us-ascii?Q?FY9bt/5kOPC+RT6TI8l83fTSTGd01TJXRj5yiOsV7y+lwT2DFsDMdqCOw41k?=
 =?us-ascii?Q?YzGQwJN6IGQC7xoo5NWNCvgSyXtLxf39lImKjXSnzNs+PVQyWj550y7BnFMl?=
 =?us-ascii?Q?G/Tb9Jj4435cKAvfc0DXe2RHMEW5iN5Y0r3XGkTl3r9baNMuL2BkDf3NiMzx?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 982c8265-d639-4873-8c68-08da5fbb6ba5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 01:52:59.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UkukaLqD6ZLMbYY2ySFlrgYuPIG9lNqzYEueQL73oeVF/in8cI0Pvnr9oErPjXJC1v+JSZZWxqdcYAg78SgumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3817
X-Proofpoint-GUID: gfs8vZxxajlDnx8_wMWa0ZJS-lFdtwhN
X-Proofpoint-ORIG-GUID: gfs8vZxxajlDnx8_wMWa0ZJS-lFdtwhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=719 suspectscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207070006
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 01:53:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7412

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping runc to version v1.1.2-9-gb507e2da, which comprises the following commits:

    bf1cd884 ci: use golangci-lint-action v3, GO_VERSION
    1feafc31 ci: bump golangci-lint to v1.44
    89f79ff0 libct: StartInitialization: fix %w related warning
    3b7f2605 Format sources using gofumpt 0.2.1
    eeac4e77 build(deps): bump actions/checkout from 2 to 3
    cd7fa00d Vagrantfile.fedora: fix build wrt new git
    cdfdbe55 VERSION: back to development
    a916309f VERSION: release 1.1.2
    364ec0f1 runc: do not set inheritable capabilities
    8959e372 VERSION: back to development
    52de29d7 VERSION: release 1.1.1
    2636e1cb CHANGELOG.md: add 1.1.1 release notes
    036cc348 CI/cirrus: add centos-stream-9
    db953158 README.md: add cirrus-ci badge
    ea19181e README,libct/README: fix pkg.go.dev badges
    8290c4cf libct/cg: IsCgroup2HybridMode: don't panic
    ee7ba6cb configs/validate: looser validation for RDT
    96193422 libct/cg/sd/v2: fix ENOENT on cgroup delegation
    35784a3e ensure the path is a sub-cgroup path
    986e7c53 libct: fixStdioPermissions: ignore EROFS
    5053a065 libct: fixStdioPermissions: skip chown if not needed
    d2939b6b libct: fixStdioPermissions: minor refactoring

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index dc93a7c0..f2c0613b 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "b9460f26b49efa086b99f32557219d0f24bd23ae"
+SRCREV_runc-docker = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.0"
+RUNC_VERSION = "1.1.2"
 
 CVE_PRODUCT = "runc"
-- 
2.37.0


