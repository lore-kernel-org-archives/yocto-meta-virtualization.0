Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC624C47258
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 12:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14479.1704632188929460698
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Jan 2024 04:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1736c9399a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 407CuS17011116
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 7 Jan 2024 04:56:28 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf78m8qag-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 04:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORcREsKxRdmDCqdIVWYb2DmvOuuBVqdlWWI1EdTg7Yyuoilfitl9b0Dh50OYn1EPyFS0Asvh/cG3SF19cdaOEuLXlmqDfIARNwPhtwHKAGsD8BC7jbNnwhdMnDNr1hE1pr+tsBGS75jBY1UiydG/AAnZbdQG8rsT0S9FO+mKbFp1AXMyiqntrX0KMRSTnoAeBBZbGx9fys26JmsTy9SNimcO1m13E81oON6l/AvKh/fESWVh84HQsV+nXkKKXIqlN6J7QgLH/ENPsay6bJkLQLU+hsD7tKhHxgd0Ry9kJez96b4KEUzzFBu0UGNMfu85YLaOqhIkoLyQGHWp6ppB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2XzbaBfwTkRhwDC2UBtqFttUXm1pVs+yZ+mTsRFCO8=;
 b=CpBYXVrERWSWbHInYhEmmaDbgg0CaNtmIK/drDgqMbo5X6wQjorC3ddCteCJ9cw8YFEXo9y699Ceb27BoeUb06BMPAXQKGDpj8tNajNZaAy1t59dGnVJ1Yu2+TKmOo8UzY/zci0BeXy8226j7d9gQ3KcH3GDTVEIucI5odRh94gAt/vpi3aSKSO5O/OyNl6PE6XCYVcFs05m5W6Db/rVSPJ8o+lXlTPlA6fCFSzSl25u+LBs0tqOeEU4BBcAcdvBQGOckLQkaB5Apty9ap+WM0vIjFLS3drukC7nHRPwqp4O95foinJMf8iBGjKtUUjwzo+KP5Xav1F10m7eUHScpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.20; Sun, 7 Jan
 2024 12:56:26 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e%4]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 12:56:26 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/3] lxc: adjust the lxc-test-unpriv running order
Date: Sun,  7 Jan 2024 20:56:09 +0800
Message-Id: <20240107125609.3502113-4-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
References: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ffbfa8-dded-4ca0-f173-08dc0f800f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hWuJYpRAUw8Bt6ivg+Y4H8X5ZjeLXNX2dFuFrO2ZpBfE/ic8mrrmynSK8yD7WqUrqXrOQyMt0688v1mP+HH1VrzC26t3T/5P/r4g1fXs1rPAji2G9VLJ6v4XQcgXrxd0FLEcODwx+iPJO5O7+qSRKLM3QWesIAcLEiYqShnVKeocpTCA5rLeVZtE2rZh6zvKtIsK7LUWWXBWyz+tArqPWWhs+IYczgbK7cQpcDo/8n0lYIM1dA7N5Z1Z2CJ1IegbaC3U+7Xtm8wRX7C4if+AJt97o+M6BJKz/EhQWJOVPzIzgLHBb4T/ZE9144Gl5iyF3S54A3gHUecJOKEkZSIVhH7J7stOaei5TaQSs3kWdYtmOdP/XvMp5EGMXKL/Me+GedURtH/xAvOkLNpRkTP0FuqNG+b6V5U6NfHbv/EHJRqrKAERN+5VyGKq249SDAZEQWZY6QK8sKIbWnHDDYyzgUSP/b87j1givGYRgxAT3scNUVPFomTkhoZnov92CNIrrYmdqLMASjmVUgiQ2dlSTOlx56BlrE7tcVmTXCFdu8F6krwC68HVAef1cbYn1Ds/nAYXLISFm67QcBjkxMh/kV0AH57gSICMWp55ubJ0UVr9fMMNZPEWqx7oMRa2Gh3W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39840400004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6486002)(52116002)(1076003)(26005)(2616005)(478600001)(6506007)(6512007)(6666004)(83380400001)(5660300002)(2906002)(41300700001)(66476007)(66556008)(66946007)(6916009)(316002)(8936002)(8676002)(44832011)(38100700002)(38350700005)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?At+ym8+HBeLxgJy1D1zYxSMLdXY+7m9vntaU28SjgPrBmASSHACwY1YTMzC6?=
 =?us-ascii?Q?1eaP9/SCRejhFVHIjXD5++f1zCmIlBWyrN348lxG3smZKMhaAOvQ3I4kl7AJ?=
 =?us-ascii?Q?JJsBfuTiD2O8trH5pyYno7khQnekBuV07ZCC1JlcTMngKgaAn+kXilgbOH3T?=
 =?us-ascii?Q?Boy1MTscZZb+nbgcz4It5GRBdJK+kgDDcgy2SLIXqpg2omF5glyazFTOH8ym?=
 =?us-ascii?Q?uNbFA9OX1JrehKTkkDumAg9bWh+YrqnIdUvSsp38q0h6D1V5E5MAuSCtOSwb?=
 =?us-ascii?Q?Cms0udM9NIJqytYT3CI+AnaYanppNR4b9/jQTxiqMXfLRq8L2bVklgnOOlLL?=
 =?us-ascii?Q?cj8FO7PHi1PaXmNoG30A+yE6xKUZ0GVcFaje2k8xVGjh9tR4UI7ldAg4kcdC?=
 =?us-ascii?Q?TlOPc+pm2jqOLOzzG/ha2Sqb8aM7M6hssmg7nbMabtt2CRYgAstQLc3NuCE0?=
 =?us-ascii?Q?XlimAvBAcRxEuQ6Paq/89+5oHxHBc3fVrdZxPLS8P+vI+wK38/o7H7ZHjjeC?=
 =?us-ascii?Q?D6A/gILBq76y3T3ymRa/gGIqZ6Xv89buq6lk61b3zpO8UZdL1pGnpSg9Mt5m?=
 =?us-ascii?Q?Y37q9N9BgrdsYjzaQrU2jyWeVrMsYIH3hvH29vLK47b3ylWn7j87ikNNBdrx?=
 =?us-ascii?Q?eBVQrJBfiJ8hSxm1Qo/QendcFxYh5vywCZCP0aMzRPCbpNQm4LlzvM1vcFoE?=
 =?us-ascii?Q?hqKrKz8Wtsc6OHOYEo+RbLTZcf6POh5cpWtLF3Cqv8LWlb4Sd5O4QlbnplYj?=
 =?us-ascii?Q?MQIzxInmOP0XS6FYVCW97LnBSFZAnBZQXEt50ZE9yFWNxoE+Oy/WPmJepX/8?=
 =?us-ascii?Q?1+P7w3epvxZ3XEcR/sADeFioNcEQU5AdBDH3l+7yLI4VsVLszMwZAokWsGd2?=
 =?us-ascii?Q?o1lQ96vZ/lu/LBgpkR9E5HWJAzgPCY/tsvDri857jr8VufPEKDMq9/RqpVaF?=
 =?us-ascii?Q?s9gmPUcwjDmiuDtCITsCxg6Zb3tiw+eiOTwkroTfKKdl8O0dgqEBZUQU/R5m?=
 =?us-ascii?Q?jEXjDvqvFef0znK2tAwrjEnssZoZPyBbINvkCKztJlgat5HHFkuavD5UJxHq?=
 =?us-ascii?Q?Erz0ippIHyPln2RZTxNZR9fr7LIxS4SjOto34ZfT72OEzaMbUZQp6010qTC2?=
 =?us-ascii?Q?1L0voYwRdnjD1HKwc49XGF0kpwiAADzr8eI8SdonvTZrYlmTTCr/wYxP2mPl?=
 =?us-ascii?Q?DGz6XU6te2S0R/a4DYXdJ93FLMVP7l1u5sdTJNIZQswyv6LE4oewqxuNGjXy?=
 =?us-ascii?Q?SLgR45GaGB+rEkwlbm6pIQjGsU/r9PFwk/6C7Jf95YM4qP/i2dUSZXHqSxJx?=
 =?us-ascii?Q?7Rs8e5MehlJ6ku2pTpuBmBxEoVNkJjhpMecNc/amjel2cqDP3lyxSYjJL0sa?=
 =?us-ascii?Q?cuC7SFelhiHLx+dTAhPwhPXNo072Wsfca79tVbEfR/QHriv8POpc5HZSOugO?=
 =?us-ascii?Q?V9fXag0oNgHdDFeV+mjndlplTUphDa279ICBZJxQpnORxCcOxm5pJbv80f8T?=
 =?us-ascii?Q?h20YPsQjX42mekN59KX+6zbHH1JG6LCTook1DJz25lA7UQBLubUvVA15hnIF?=
 =?us-ascii?Q?tXnT35YUNkHu7XKrW+hA6C5bf/4BNECK2XlUp8jcS8Mw9DlhKVO1FIiGKInV?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ffbfa8-dded-4ca0-f173-08dc0f800f1a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2024 12:56:26.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ml30JafI7A2k4W4vvb2UIX4ZmTyNFZ7r1cuwRr61UQ37BSXepKljMJdfXNMDHbsdMQOr53bhaKKFg6DayxdZDvFVGUnLCNtA1y0592Mv6OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
X-Proofpoint-GUID: 6uYMoLXd0A2M5ADGD26IHbhpkMrwwhI8
X-Proofpoint-ORIG-GUID: 6uYMoLXd0A2M5ADGD26IHbhpkMrwwhI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401070062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 12:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8529

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Some of lxc test cases can not full clean the system environment, that cause
lxc-test-unpriv cannot execute successfully.

Since those code in lxc are using for tests, so just adjust the cases order.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/lxc/files/run-ptest | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index 2e5af3c3..196adb04 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -16,6 +16,10 @@ blacklist="$blacklist lxc-test-get_item"
 blacklist="$blacklist lxc-test-shutdowntest"
 blacklist="$blacklist lxc-test-state-server"
 
+# Tests in firstrunlist will be run first
+firstrunlist=""
+firstrunlist="$firstrunlist lxc-test-unpriv"
+
 passed=0
 failed=0
 skipped=0
@@ -26,11 +30,29 @@ rm -f logs/*
 
 echo "### Starting LXC ptest ###"
 
+for test in $firstrunlist
+do
+	./tests/$test >logs/$(basename $test).log 2>&1
+	if [ $? -eq 0 ]
+	then
+		echo "PASS: $(basename $test)"
+		passed=$((passed+1))
+	else
+		echo "FAIL: $(basename $test)"
+		failed=$((failed+1))
+	fi
+done
+
 for test in ./tests/*
 do
     if [[ ! $blacklist = *$(basename $test)*  ]]
     then
-	$test >logs/$(basename $test).log 2>&1
+	if [[ ! $firstrunlist = *$(basename $test)* ]]
+	then
+		$test >logs/$(basename $test).log 2>&1
+	else
+		continue;
+	fi
     else
 	echo "SKIPPED: $(basename $test)"
 	skipped=$((skipped+1))
@@ -47,6 +69,7 @@ do
     fi
 done
 
+
 echo ""
 echo "Results:"
 echo "    PASSED = $passed"
-- 
2.34.1


