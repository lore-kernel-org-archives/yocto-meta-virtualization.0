Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9613BC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:45:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24960.1654854323026626588
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ggfiS/KG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A9Y3Fh009195
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ACOEcKIg6xme8/MNuS/FrKEGli4zrlGDCJmKZttwRjw=;
 b=ggfiS/KGJtphTlxBDbNxy2MmkofpP8LOqKmL/ekvQexrIJnjccOl2caLYSrFwKQnrl44
 LDioQ8QUpeVlxkNTHQYQH5ZMQJ9qDRNKiMomSayf5liRd2wIdvqeS1Uz1YqfD7fXMP4L
 yEnRigQKcm2CUVFLD25v/1EPdtVjRTGYst4O+zju339wLzMl2ULAykmDM4/8WgR0aEi1
 l4qPVL5dcP76V8tVjOAXTeQXmPzg2WUrdaL8wJ0bOTWe2lPKFX7gLFidYNefDGmmIz3f
 ve8kzHdkcVUVzPcG4Tfg4ukH37Y2rNYWkfYfq8RkXXkn/fQC2R2vIhvkyn8an8/S4C1v 3Q==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb080g-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkNbNltKCu4vuU1spYntALJBKQtoVOeLbAuE6k64du36lrzT+7AhZJOO6GC+6pqyNX4cpAs0xy2WrBeXGaKEPcu1XOupsfwjAI8A8Y6vKVbZQJ0Gdw3LHGuBQm9osjzymEwPuKfnAyo3kLK6SbwEI8Y9IAMj2WWFp1VeeJR9K7dSlbGLreNcggryvgAob80FMjkZT0m7qhQGgGFmPGrsjRnos2hC8nBKMp5LeE2qte3uJqKG24QeITDR25W44keopcOm2gxCJiVhiYI9Nfa5b1qTjnXcPu2Uixa83Tgq/LXjE3u6tr3CqYabciX0FgaTYRk92Fo9U+RYUATbLGWCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACOEcKIg6xme8/MNuS/FrKEGli4zrlGDCJmKZttwRjw=;
 b=gmHOTYYDWMZcnWtz6s2jtBpP0ydwTCPa8O2jE+Ppcdla2gvWia8L22E7Dd+TnHQ6UlhytmEh2mR29w7zl2djP+1MFJ+n5I8BpuxdF6J/Y8S+Kk6E68aXng8jwPY0FOZVYzBI1NaZW2KxAwj0HlTYvNVRtXdqyRFfmEoOAdDdGv5z/A5wOJK0Vwyle83Bld9ewJ2t5jzTK3aCb4qNsSBwzeKfw3rAFlszu8sVrCiXVBXw5uLfc8luT+NxbBfGPzfwkPQqzl/sCHFwIXlVlK19ZscsOtaVBEhSbzvzgXGRkRGWRtCVWDGEBRmSVzAKh/dh6KhWhzIJs6LZvAuZTkGEoQ==
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
 09:45:19 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/5] oci-image-tools: adjust inherit and
 fix CGO settings
Date: Fri, 10 Jun 2022 02:45:06 -0700
Message-Id: <20220610094507.74342-4-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8328e809-99b5-493b-8f85-08da4ac5ee6e
X-MS-TrafficTypeDiagnostic: CY4PR11MB1365:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB136573E240A0D83CEAC9CA16EDA69@CY4PR11MB1365.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cr80ICQ3dQ3ef1gwtiYMMtZXPV+ek9yMAmT+CbjP0H9GxUSgF/vFgJQxb0TcMLs5erIdFCftlTg4a0iiL8r7fqKrOgWzXd38ZmVpLZWK4Aj34QtJIMGr7Q4sMTf21E6be/Z0njVLCitmUMZ+jCyLWoB5Ew7mn1MgYWiSM4wTMQbLrq14rxhOjpVu1APcN+47Si0g/aNG82mnrN8y/sLrgo7e6BZvMyh2rBzWl7MnNZHqtZE0nJHTqLFdR01GB5bub4aPcq2SvEhrR5ysuKuMYqD7Msj0OwSiRPwnX7uTBbFNow0l9MRHP6iWfMBvZ76cuT6THWJsmmrFWCazka7M5lCofBiR0RF7Sc4ThEtQpawxIPbhs8RJqIIUkouBwvP6QIsbYqsgKgBmtvoFLa9KGNHuoHX752NPj/T09V60LkDo9P78bEyY5PsgSn+cU4OaAvjp+BYlPYc5HFywSMDqcLqvDHq2BPMhkekNVhkJYM9yEnCU9xQpM51NoGZ6eUpeNNbXHZjfDg3eRIIJCeannmxH5kKQzqu06Z60lATwBq+UXAsBTLxndKpymC21oJe/7sSbmvAz/Ik0F8ymuoo0/bJq2qF9d0QXgbxXa5Om3MQg9RYSFFDWMTQ3PThkNl1bDcbuAZlMWr3k57XPeSq8aFaf9LNRcmLzhRrkLvTnM9Hb+rw8CfJDiVFyFMi0H/gQ6QG+ynaE/lV+bcbWfB3z8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(83380400001)(6512007)(5660300002)(508600001)(66946007)(66556008)(38350700002)(66476007)(38100700002)(8676002)(6916009)(1076003)(316002)(2616005)(186003)(52116002)(86362001)(8936002)(6486002)(6506007)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gl0Db3Y8W6Y47HjrJDrVJLkB5nUKmOL9jLexE0m0ZNT+rDINi8iA2+HBtJmG?=
 =?us-ascii?Q?fPLyMY1TlPNNXHMUucn5HXlDMRfUXvoY+kYerwYQUpzrrCMk+H19xrZg/+1u?=
 =?us-ascii?Q?nbxBZ5Zv7zDCCSLPj9MinZSa/TPLHI9WI89+7fTTG8i2SCmMiZfjx602xY+i?=
 =?us-ascii?Q?3jmBgNUaCyGBts87RVKCCzrvSouKQCi5gGt14/FnBw7xhrw8pZWqLqzBaKWw?=
 =?us-ascii?Q?JZ3bwKnqxak70gtf3aN4ZmCPbi1xmFLY5iK8lELARtDrkGFScUIAE8YO/Xjj?=
 =?us-ascii?Q?Ko02eZo9C9VW0nl4bvixIHjjVdTC+PMcNSL5ShUle/AeSt0y7c6lLlADcvbv?=
 =?us-ascii?Q?Cpjz/zqCJmrhTp7dkcizMUOyrS/2W9lxNg6pLyau2LVyhefbT2eu50gvEvS8?=
 =?us-ascii?Q?sclFdS0mB6BUPnipSbtr4GEOlv2oDR72fSpp5zXfCXiVJQg5HXluaVtnWQ28?=
 =?us-ascii?Q?X5Z/DJ/wNAXYiBjTjvr13KrCon8arTsHtonbye1m0FL59D3+4F7pXddrm2RI?=
 =?us-ascii?Q?cWVCXY6IcekWwgxBN6jM7TKYMiskV88P444W99UpSjYHG3vFuWqOYlKJWaTF?=
 =?us-ascii?Q?+EPkE1rIbnkFHCtcqcGxNctgQ3QDuzJlk+fggkTxa6ZaT4uBU74BDwiGS93l?=
 =?us-ascii?Q?pC48BvIIu55eRlhttgHYGbiGIbb/lXjeK9sJbXNVPZYu+WUvQEE7AoYbX3vS?=
 =?us-ascii?Q?ISope9zw2DRBpa3lwQQ94OZcepo0JEgoQbE2qahO+yJ7sFPYTpAiTwGzBRam?=
 =?us-ascii?Q?diZr6t9Znxm57DXRHXrG6fm83M1VQuwsiFEz3hcCDwcp27exmTFspjNTM6wv?=
 =?us-ascii?Q?qg8SATg/MTguik9ugfAu+bsNRR4YO1PuRDjMowz/6HGcKa/aEW2oQcCHQzZJ?=
 =?us-ascii?Q?o/NiGnXkpawMdC+kT+VUy705N3/Ksv8Qpfi0nW4bTVmrj7g39aelYmpUQWrl?=
 =?us-ascii?Q?Pr+0EgRmPyAHGSd6KMDu9+oHb2c8ExSAb09GrG3MRI9hoHmu6lOKF9PEwNBB?=
 =?us-ascii?Q?F/+Sht9G+3ULs2JshLzqitGjT84KZ6PZtUU8f4il7ePVbtxXbRgMZ1kjgNWj?=
 =?us-ascii?Q?Ph7KE4807FNmHlAx8upHaNjWl7j5A0/rjUqureEqVZ2Fn5F1YVe6wOUOd4UL?=
 =?us-ascii?Q?F93ADkTTlYOHxhnCZaHS/xXAQZ9oruid6YNTADaBRbnq2uyqMbY2pEmsmSYA?=
 =?us-ascii?Q?rNOSc02L0u97cPKtop0fgVpNK+6PDwjw6KKwjHHM9rpZml8jm52y3w3ijVcj?=
 =?us-ascii?Q?xwZoIxyEmfoSSX/uisTO2UcKy01YACFe14rALXbV7+oQRFxpV0hUbSQhQR3A?=
 =?us-ascii?Q?w7T7ZMhIkkeGtfBX3xDjo7It3XH0nZAbDedxjRuTsBv8QQE32lwaMpU9K0Lc?=
 =?us-ascii?Q?jhBwKow82kB5s72PW8UwaiZ3V+3WQ6UX4miSVdbU/e//khPjkAgVY2dOkL5J?=
 =?us-ascii?Q?p+4CARQOaVwW1TbSxvhkjknRipbq+kQkjgqaQk88UWroev0fXLl/JZUPgaj4?=
 =?us-ascii?Q?ZSR3bVYKtWiYTUKVqHOU7NXdfTF+E4uB8LyCQecMlJ85SB4SKO41md9o+jFa?=
 =?us-ascii?Q?RufVuGtK1y9sv6NQDZXJBt73baFeCiHl65OM3F/vsoTv4owyZ2jdMyaVROPf?=
 =?us-ascii?Q?CY15ciH2dB7geKgG8zIA3bOsOy5YAj0bhJxgnssM1nBPl5v6nE9bjIEm2iLX?=
 =?us-ascii?Q?qu21RrolclQLdFUBn/62b3FHQrdOa/3eyaAbAgX0/b7vJzL2oZTVNzEZtrO3?=
 =?us-ascii?Q?tRU+FWTKhFXV+rlcNWR1ucsqaQIkVfg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8328e809-99b5-493b-8f85-08da4ac5ee6e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:45:19.7300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WuiiOcSg5RUN5Vza0TAvRxU2Qrjlg7yzray156e/qdLCB3dCJ/3ldgIOR0icnqdlP/UK/hjqTlq3ON2fX/790g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1365
X-Proofpoint-GUID: vN_cWRRdK-Sh6oN8uQQgsp-ce4CkzShG
X-Proofpoint-ORIG-GUID: vN_cWRRdK-Sh6oN8uQQgsp-ce4CkzShG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=549 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 09:45:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7362

go.bbclass already inherits goarch.bbclass.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags as set in
oe-core's go.bbclass, not the SDK related ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 8bafd2a..5d2f7c9 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -20,7 +20,6 @@ SRCREV = "11f9988298305d36f64248a6ee55318e60bf170b"
 PV = "1.0.0-rc3+git${SRCPV}"
 GO_IMPORT = "import"
 
-inherit goarch
 inherit go
 
 # This disables seccomp and apparmor, which are on by default in the
@@ -28,8 +27,6 @@ inherit go
 EXTRA_OEMAKE="BUILDTAGS=''"
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	# Setup vendor directory so that it can be used in GOPATH.
 	#
 	# Go looks in a src directory under any directory in GOPATH but riddler
@@ -48,8 +45,6 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO111MODULE=off
 
 	cd ${S}/src/import
-- 
2.36.0


