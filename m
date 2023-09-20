Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2EFCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:18:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30460.1695187102223575922
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 22:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P1WnYXGt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=762788c381=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38K4eHrO002557
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Sep 2023 05:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=IJqhWIiH51LA4782BL
	tojllugYYGEYHOsPiLFTRbsPw=; b=P1WnYXGtBxyHcPy09oNs2DkgUFJ9dAKL8H
	On6OF1Kd8mgV+TX1Kyd1FFVLkRV2CoDsNeLA36Fmfnz6BzorBlFf6VRlFh0MB0d3
	hCPkwxkwTSb1ybgYuozHXrvusuF3YaL7QajcDJH/4E7nigzhEvJYVpl43NoM2Oxb
	P8MBbmy4rzzHKwMYL3732m1dr6BYF/0oIFJ3lYLiMRx7YR/+7Bgv8f+8lG96bWMY
	V5ylfxi/WhcqnZ5wkGeesTc3y1tTJPIid5bM0MSlTJo81GH8wIMo5y0MtKr3aej4
	liIqTYYSjjhrBl/mc9kBcOn1vYbeujMfxQm3ZWOb/Lj6WVKpbR7Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jxb6w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Sep 2023 05:18:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP506tN+BQX3Uq68eM0UlEJyy1PIdzZgvPAV8D2dm1jWpm6kfLoV+SqUX3SFgXzK95m7F2RvbQB68y6lT1loBXYJ3HObPA8MewBDcvc4xOcdO9KtjjlQTlad4Ul3b9Joe1Q3FhR6YSBGJTAf+LQPJ/09tJROvgkNtk6UR2GQyrQf5cxrP+KZ6pSKPRl0w84VfACPvmowv9r2MB/KU/d0VKqqJpeI1kOL9UOaBaKo1aWm6ioxhpEQnjf6s/vKIPKJE8i9hAd2EKQd8plk+P2IoeZ0dGqU+5xizj6MKTWYqhc8F+A1i+OZCYXb3Ybv3QLCBq7q6Xiu667ykRLFceCsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJqhWIiH51LA4782BLtojllugYYGEYHOsPiLFTRbsPw=;
 b=gFd8ds9InjHofn2XZJaxFYom5HlxrCoq12XRb4vTM2GrOAuRjkEYwMB3g78UiZRoAzHkdVXeg3N1JasYXHBt3hcJV7LumJTODOctosFPVrUFI/s5oGdmpoLwDUsBGoPgeToT4CBPwYmgq+oyaHsEBAP0d/JytRByXiPKjHOscHBqdg/zCUyGrSVetNHyb1Ki3SMVH8AG/Hz1ZUNvbXj2lCctcLEL2+nLBlzLp0abn0VOE1VNdSKnWoPPthUqDd1QJSt2FtR9icTjbCwOMmPlM6tS/H0xngav8OWblx7LnDFeQeR3sBYuSZyz/TBVfzsWNKYoW8flBJQWOKz5e5RpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:18:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 05:18:16 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: fix textrel QA issue
Date: Tue, 19 Sep 2023 22:18:03 -0700
Message-Id: <20230920051803.2385542-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:180::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d7562e-623f-4a7d-fcc0-08dbb998fe5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LrB1/EYHsCrBSQLE2Uqm95kEPSpBhZicgZ1aqwP0UnDK/ODH8HLNab/nDBB+2tNyyGsa9mg/li6/+trPMz1KdazCH6m5DVRD9uBljar5SbbkBOXpVE8fIiYKDIaOjlURV/MqDXzM330oD+uEVSg6IA0nmhgp1IEIKgyKCn/VLIUpY8++Bjc512tworIpQ9IdVJv4m+zr2smmcxFTrgqbDX/73x0WyHjFQvtKIghBMhX04lykNma40p6PLJacunHhDFoNpbd0wGbE2qU/OGqlN0YDalUk+T5i3F6+wPXYNWBa6JjA4kDs1fmLQ40zoPI+/UExkeauhG6nV8FjonqmFSTE8eNhL9dexAbQ6mE8GKoK3/OIGDvGPyoLjQ7NgVf1KeDoKKMip9GULMRqF9LztiNCGggcAcnXffMMdWsHjYkuRMhdCSxtJHjvwKvkQT/TDgYvtBese7yGFzYACoiJcfM1TGPyLVXEsoPQXpMi2PE3Th0DtAv7uJ0vDPNvcU265uSCIvNfFdQfzxa0eJbhZ0NQjCZEZBgQ9GxT5CzIk32Ax4QQMXXmnqZppxEI2RLkx3C2l7K0k3iMq9x/ShTWJJEA2fA2OV3AdzmW4sS2FEGEFs5bgtZeXtUkCPPKcv6t
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(376002)(366004)(396003)(1800799009)(451199024)(186009)(83380400001)(6486002)(6506007)(52116002)(6666004)(86362001)(38350700002)(36756003)(38100700002)(26005)(1076003)(2906002)(8936002)(9686003)(6512007)(2616005)(478600001)(41300700001)(8676002)(5660300002)(66476007)(66946007)(66556008)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D7e4bi85zM188KYr4zTPYEUWoiJ9mN4dvNKpCcTYPK3+x+IlmiY3V2puzMKi?=
 =?us-ascii?Q?wqvCvzK8kFkOkbzx715h2iHcOc43rGrKrNihfEqQQBfRfULIIQ+pmLXQ9P32?=
 =?us-ascii?Q?J92LbNcbu8yoW71g9Sqvv/VHTZhqb53NeFxmyh1bfWF9Vc+9sMD32NvkKS2l?=
 =?us-ascii?Q?9ewXk0WS0BbLFQMis1o543PSNxt7DiwsXYEIRzuD9XyTEH5bLVC6EKkC13vh?=
 =?us-ascii?Q?isFg/Bsq9Out9RVt77hTB5Tqd9PnSKHKH1POWdE8FUcn/0nuEWIc9a3Ouj86?=
 =?us-ascii?Q?IwEdBP38rJ9i15ZbEZ1FF0aQ0/pXeApSMrRq2P3RLy6t70Q3Awwt4PSR0EmO?=
 =?us-ascii?Q?Mhxv2ddHvBaMhY4l8k9kym+TILT63CCuCGsHNiStgZIF7HoBXq+N6uCDbpOj?=
 =?us-ascii?Q?he3UCxKdlf6NbhTiEcAu6+HZoUI4ZTXYFr1VyWfP3Bd47TxKxpPDsNzRaknh?=
 =?us-ascii?Q?hhPmeDJkMuR1qwDFzO2EdgXT2CnEXQd8YHNb8cHPfTilyeo29xmScttK24v5?=
 =?us-ascii?Q?ARfOe20cBurltSHKWSwh6ANmXsckkSvIlh71T3sBy4ZfmMrkV9nd7Dxzl/4x?=
 =?us-ascii?Q?H9Gmp2ZmzME1P0PVGDjrtqo+LNnElLfEVgCFmtRNLFhX6urj+AXaFSPh0RXD?=
 =?us-ascii?Q?HkQWlNBdP22xr0KV4Bchj2bi6YxQfqn82Qtrm4VkOp+PXquDQsQuisedym0W?=
 =?us-ascii?Q?rf84qW9kEBlnrCIT7v0GtQV9v6J/TGlnY8M/watSbHOvmV51xfGbvYXmpPp1?=
 =?us-ascii?Q?ASmefVH2GoPtL4HpazcBRPJqaJehFcasHnHaAeqqEV22XNcqyiA0W2CxrH2d?=
 =?us-ascii?Q?UEHfu+28ppzJYfwhyIjXcfP6hgk/csDlMAEyNJJBTOgMbTA0i4lh1XKi6as/?=
 =?us-ascii?Q?Zazxq11iQodPRBgmoBIdXSSHiz9zrsXvA6T7Kd4GopTz8MgQwiZvXSWpGNWi?=
 =?us-ascii?Q?TMNHWAHktFguAehOw5zmmy+weqU+5wfrmnsh9QlOC8fY/f5ar2cYfbFezNU0?=
 =?us-ascii?Q?6WX9olrpZmuGjUjSlZHht34A+7FFDMKFmoOMzv7Kh09EDq8EKasjU+EHr7bQ?=
 =?us-ascii?Q?NEHlMdPsyxLi7Mcf0uqa34c3LQldunh0b8rQOP/qzq8N7gs1cHkRNq5ZOFQt?=
 =?us-ascii?Q?tC8sP/X+rE6u+q8LgbHdR152VbXKfSqo8R7WvOnA0N+L5Kkb4u5RmTIp5lYW?=
 =?us-ascii?Q?vlzokvDiG3aDkk7HRDtfkNT2ijdl5isZhjixk8usVvp70wH8hIhGeLdzb7pg?=
 =?us-ascii?Q?EWa+ugimVfyTUoPMysSWnQNYXtzb5PTDtW7WNyQepHmBZEzbBzfb73qvpQov?=
 =?us-ascii?Q?Pp6kLu4ACLkOIHFs3+RXU2xaui0D08PfxVXDBETGlm5ZmzFbxunFUdmwGGvC?=
 =?us-ascii?Q?BDH72BZ2UlVw5PoBWjxjZF2C5HQBqfiVbZqkXanjoJJf4E9GL++QxTC2iutL?=
 =?us-ascii?Q?9QTYtFdBpOQNGXnZDntg+qKdz3I7fkf3jxrGSR6oYH4maZpAlh8XoPIlhHlg?=
 =?us-ascii?Q?0xbeGoj01Xcy4L/KJ1He/ZOmw5sYpSi0OosNnxAacNe1LYCMTQFmm2gz7ELl?=
 =?us-ascii?Q?LUXw32JXD3PKdrN/59LF4mZRyhnO5w7aRa53ffE3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d7562e-623f-4a7d-fcc0-08dbb998fe5d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:18:15.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrXhAz2UJ9BRY3W4g79QBcMvYY1nMkXWguFGS+deyBQaAwuSr5eafZZSOt0VO9072RjgAIwinD6BgCSsGqNwZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
X-Proofpoint-GUID: wJ__2kctPPoDO-fB-YtVWhsjUIvus_71
X-Proofpoint-ORIG-GUID: wJ__2kctPPoDO-fB-YtVWhsjUIvus_71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_02,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=775 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309200042
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Sep 2023 05:18:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8313

From: Chen Qi <Qi.Chen@windriver.com>

Fix the following QA issue:

  ERROR: QA Issue: nerdctl: ELF binary /usr/bin/nerdctl has relocations in .text [textrel]

We want to use -buildmode=pie, in order to avoid duplicating codes with
go.bbclass, make use of GOBUILDFLAGS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 62460a52..f68223df 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -51,6 +51,8 @@ PACKAGECONFIG ?= ""
 # sets the "sites" variable.
 include relocation.inc
 
+PIEFLAG = "${@bb.utils.contains('GOBUILDFLAGS', '-buildmode=pie', '-buildmode=pie', '', d)}"
+
 do_compile() {
 
     	cd ${S}/src/import
@@ -64,7 +66,7 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
-	export GOFLAGS="-mod=vendor -trimpath"
+	export GOFLAGS="-mod=vendor -trimpath ${PIEFLAG}"
 
 	# our copied .go files are to be used for the build
 	ln -sf vendor.copy vendor
-- 
2.40.0


