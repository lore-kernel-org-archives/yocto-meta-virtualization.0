Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E94CCA47E
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:45:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.25034.1654854322054785228
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KupiwWZF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A9Y3Fe009195
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=NN7JayKGbasl/9w+HbzdKG+arkHDsuvkBY1gwk5Npa0=;
 b=KupiwWZF6YXygmb1ru+Pv8SNoErunDEJlfTQ/X9Sz8A5MsP5Fvkun9UHiKKgXHZLmpoE
 B/KlnF91nV3bvzyspXhy3JkObsC4RnLsPacV2yvrTxTh4NtqojF5X+AxTvt+njkWTj3u
 aMMj1G5VvquG8CB6TOWBCdy6kqXKBuEeXJ55zxLl6+MyiVDbegkdrMIuMdxnM8NzH32J
 7X3StSelCChky5gdlpO4CVuiw/N9SjSDzfect5lK4tn9FzdJznnl5ivyvazT14as1yeM
 LMWW7UOfJrzECdACZraldU+ZFKQoOBw3KMTbjdpG2l/s2mMJECp/FAyinr5whVEnDH9R KQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb080g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTxVd+EQWT1A3Y2StGv82KvyPkYFa7WRPXecY0UZ0z8nX+sDf4rEJwJnDHH5Zh6U7WUNKtOODwOHxWsHJlLulFDdY2cB6NVnNV4U4zyJc/7XR3TIKBWMI3rXfuzMuZSI9xrhNOmaL27GF0yWiDUuEurHfl/E33mciUtawQmt0Hp96TSSJTXkmZsgglxbyHQ/RLORDLTqu5wON4G2Mn4cttIfi9MsyfAS5XbvVsaECJYMad7ZlK9Jo0ud9oRPEYOIaHfZEOECQi7xISyMt/cAMbC1ZF8pZG2FE+jx0kyYkAisT0QOL45uZDI9+/NwtaU5WLrgu10dCunHbZJFeR+o6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN7JayKGbasl/9w+HbzdKG+arkHDsuvkBY1gwk5Npa0=;
 b=jp0+K8wed49JuhZeTNzZjkGRnBhc3A605nK1zsipORdwZY5oY0vNIRsM0RFJD/Eg4rdyuYdFpsoDnPrLvWRSg5rRtdn1jKqw2n4GIQT2YaX0xQkQq471MMhVFoEJKR27utrXeNuE9TA9gGOsRRpW5wvkVJ4+zomaYKtNwtAQXedPlOCcK0r4AzS1HvonXxZrlwjMsJvAA+W5at9DCetNIybum2HvwA1IzSSOFwv37eivSydH1mwBlMYomoY9VNaoFn1zl2SQ/rQGVHoX+GAlzOrotQj972OTYu9kHGL0m2r+FyP8EMimtWeKTYBcvVpXwt6TukHdO+JoRSOufCab2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY4PR11MB1365.namprd11.prod.outlook.com (2603:10b6:903:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 09:45:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 09:45:18 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/5] oci-runtime-tools: adjust inherit
 and fix CGO settings
Date: Fri, 10 Jun 2022 02:45:04 -0700
Message-Id: <20220610094507.74342-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220610094507.74342-1-Qi.Chen@windriver.com>
References: <20220610094507.74342-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eefcd24-bb1a-4149-3ce0-08da4ac5edb2
X-MS-TrafficTypeDiagnostic: CY4PR11MB1365:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB13654BD471FC7ED528E62920EDA69@CY4PR11MB1365.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vldxi3T+u5E+I649djXje+4Vd/S/MIVc0zsRE6LK7gjIxPToSa+tcrWrJ/9/oD7ei6v8ac9scvZ1q9t3CSZBjTSeXU/ySJn4Brf+duKj2kdiXSsMzyu4moEyXUj0zyLGXMvldL9tKCTZ2lIGksZ1pbCYd3wIhgEtsnkgCd2h18YpE86R5WPLRewSO3b0Fejtdpnme0s7gXTiyNJJ/4e/uX2pr0XqwsZdJFJKuQ+vs9zmORhONM9RA2qXNVRGjaOXJl7NsoNRZ/GlHItgi5pQGeyuu8Fkn6D/Tx6Fmxgo7cYy2yt05IWyttg7iWkmOjEzPLi9whJfT0SFCM7TlBHJku7vrPXmYAjlJCs2GQwjdSARrGN/TxhfBpOnqBc23d9A3iCvk2qcjJyAkvdnyIsCpP4IHd6nrox5lvbcdP8oMiYLn0B7BsvZQytNfsZp5Lq/yq07WMij3TrMjClGCWGXFuxNM06Bdval5wg/tuFSnTaL59LW8Z+HVccvOf4cP3+mnUA8QQxAokRYqAzSHyL/XFGS2xL9+kKAXQHq+3OkecI/WuX5pCHmHSxrTb4xKkkHcn/dkuDNRNLCkZTT9dj/q2DZwN8r+B9JcdmITjKD8/gONCNjHTSEAtAlQY4OOY33mTZPwGZeIeWUusp4Ld+Quw3r/BcZm8g/XujDoFoiIIU5hilXD0P9jUezLMAhrqcq3+ztwb4o5K0l9f+D1z60ZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(83380400001)(6512007)(5660300002)(508600001)(66946007)(66556008)(38350700002)(66476007)(38100700002)(8676002)(6916009)(1076003)(316002)(2616005)(186003)(52116002)(86362001)(8936002)(6486002)(6506007)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2GmiuY+Jw1Kn41fznPtWx8ddO2NAjy5zMId8mD9UkUs6AjfP+AVo9Pp5qq/O?=
 =?us-ascii?Q?0VjHi/jFpE+nQmBRg8oIXYvr1aBxdwXWYcFeQPp+hO1uwcIF0JVRXP0TVBTK?=
 =?us-ascii?Q?xVBNFbqgoGezo6ohR3B/yMvi+7VbQNrU2+zrLMb3DWspMv222YPgbzOQbUIN?=
 =?us-ascii?Q?PqicUMFEtQX0poVOzW2+6laCCJryIGci2ej8DN5aojFRSOOoLYJ89i2hk+c0?=
 =?us-ascii?Q?MxBpgPZZxe4+YrYrGQxG/Waffja/y4UDxz5Kxb4iGB6M2OzLaNk4lSgVckd9?=
 =?us-ascii?Q?cFsRv/fQ0Uj0gVUONHoW5yfN9rQm2pG3lH4gt+Vm19Bud25OZQZ5k3iLxpOj?=
 =?us-ascii?Q?+AG6x5hPclyMUKedPaJf4LLGCwS1OhS0Y6oJ2Yd51hW8JmleI3EXEtsEeqBd?=
 =?us-ascii?Q?5OlG9SzZJZ5/4grQrESC4qWpIUUxgq5Tjh/sKr8P6Qa5h3MapWaKBB4yEHgy?=
 =?us-ascii?Q?3HP/PQmiWe7NDCFTdHPj9fp568PlmdUp+OO6wMCeUAwUhbAzq47dcXsv1qeI?=
 =?us-ascii?Q?Lzlfd0OUVQ9yttdV5frBVHpTpS/+OqJ16P4wMH9cpneXoPdrCdUYjVRMP0S3?=
 =?us-ascii?Q?CBGSU4/jll1Z0mRKB+UI6oPHfNayc6toQndVOVy6Tdd4MZ5kxGKOgsZBL3gr?=
 =?us-ascii?Q?WFgcg1ejf+iuJCWr2O7fERIf9WHugcvHPainHq5wLR9D8kwpmg8a1K5g4Kem?=
 =?us-ascii?Q?ZFUAZ5dotd8r2qE6L8hTSQnMueaH8KBx5qRkkm4XUB2rgVqCgtYlghXfyGQi?=
 =?us-ascii?Q?UtwuLcyiu7fgNOq3m8lj7cMg2nFdgD6uyIuOX9C65NvzV9/Q3O+CVG1AV5aJ?=
 =?us-ascii?Q?0XW9dyHnSLybeJkJNcuisM5F8/2MGhn1k23EOu533jHt0T3G5MrJjpgxJrz3?=
 =?us-ascii?Q?L0XlyozkOu4DQ9vpddU952rEDhktMhQVJuci2dKIVU2oiKVLbaoqpW6PUQGg?=
 =?us-ascii?Q?ydTxaaSI7dC9+9nD6cazX/xuNroY6GwJ8xymV8vuZ0aQoDV/Ihll+wDA71To?=
 =?us-ascii?Q?PLIxz9HSAY6W+icNVHje6u0UkpiDU/KScvNh+HPXy0daWlZKbW8lJ7XQII/I?=
 =?us-ascii?Q?Ven8QvT6GCncj2Cxn8mBfiYBTPfrowHxx482khVQm6IHofkDAL6ViuPoTHJC?=
 =?us-ascii?Q?tJjqBU8MCcGK2xnI51KnRXAlfhw48NkQtHtK9boTk/P8vOlpl7H3x2zYccS5?=
 =?us-ascii?Q?bFLhbLDS4r4IucHyYcm3O9h44/xhZ54h8zgeSoS6VTkvg1Eo6Xg0bSWTO0NO?=
 =?us-ascii?Q?sOyIHvrpev0dhchO4N/p9LeNXsDcjEQ7tTVl0T6dQOak3Ev1Rdg2yaZgHudW?=
 =?us-ascii?Q?3ScwurtpIop3UZ7QAWa/4AmRcmP1HhLm+jriWvxEMrokMoNWO8hSyrbgelXL?=
 =?us-ascii?Q?I0h1JMAtVI6le4mBO6vMaep/C8wp+dn1bcsOqfwdBbUEFhbUGsm+FGqrxkZq?=
 =?us-ascii?Q?7FyskAGc4dmqiGUBz5iaHprLqNnv7/6En4k+9juY4IK8IYs66bHCynifoBud?=
 =?us-ascii?Q?K0b+984tXwjV+yKj9h+QNSs4GpRqeaVpwb52NVLrDNfXzSgrFikeJ5ID7Rbt?=
 =?us-ascii?Q?Rht6QlEWmyuN6PIEh99Fl9gbpzxuena/wphbcnTtwb04FqXZH0XUGnW38iKU?=
 =?us-ascii?Q?j+FVPl8NnwopZy62rgXVMcoo15sggqe8fj8T/CMBYNN1mST2olbnvkcnLcFs?=
 =?us-ascii?Q?iC/7vxem2EnoVIeQ0WBPeNK0yM+RmmkIQLN+oDos/a8bggZgbWNr4N9HfUXm?=
 =?us-ascii?Q?1NlD9vRkoO9hcx6HB2OLE5DxIhurXys=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0eefcd24-bb1a-4149-3ce0-08da4ac5edb2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:45:18.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W9moFuu0ASkLtZzHB6hMDrbm+3L7Bfdc5jMbTaQhoMqPv+Fmn5GR9+AHqK/XvsP7pJUkkKnfj10lmbP+EH4J0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1365
X-Proofpoint-GUID: ftfvvoTUZ4P-boFuZVjo0fivE88l3H4G
X-Proofpoint-ORIG-GUID: ftfvvoTUZ4P-boFuZVjo0fivE88l3H4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=758 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 09:45:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7359

go.bbclass already inherits goarch.bbclass.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags as set in
oe-core's go.bbclass, not the SDK related ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../oci-runtime-tools/oci-runtime-tools_git.bb               | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 838d24b..b953ab4 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -13,12 +13,9 @@ GO_IMPORT = "import"
 
 INSANE_SKIP:${PN} += "ldflags textrel"
 
-inherit goarch
 inherit go
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	export GOPATH="${S}/src/import:${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
@@ -26,8 +23,6 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO111MODULE=off
 
 	# fixes:
-- 
2.36.0


