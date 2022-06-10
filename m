Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E2DC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 04:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23093.1654834869988210695
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 21:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BJuw7Twi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A41bIJ025481
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 04:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=FjOmdMugtjQfRLqOUaBNwFAtJp6TeZi9pI/30bvJiY4=;
 b=BJuw7TwiJyk15UOwA54EFsiahnGN9Kpje9jXmsfO8Ezyw0fRujCRmYBJFY3PQbWPXuVH
 ntVPLH7P8G2y6xdVQlQAOiTs85efzg6VUg7c2IrN3yYvgYY3ULJt38MCoerG/TmHzJyA
 7bY6sTPrnizJLBBdXATJ5mzqzw1zJnFLttf4gYPhAq64kzk6VwfrVkY6evH1Py1Joy2p
 fb7jeOrRTovfSvex2OpsMC6Tywo/C9NA54ZmDxxCsm6h15uH3YJ8NJ91Kx3grAJob/7H
 +CHGvvixeBK2oEJ9XD75q426NCaT2joT0MyUnvek+v0JjC4eizHxEPSdx7oNi7tOzeg1 FA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb02vs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 04:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bueZZIJJHtvGsK/0k+m7UIkJxuNOxetK7XvbsiwqfG2bp7g/8ZQ50feVHzQm1FWui2WUwMqq/cxhyfTYmEHnmFQd5vyO3jgEJdNJR1mkXdQ/X4Jwq+W0obpNSjhIkSZWHwdSjqEh1UZU+yuqUc5W/ouUENVyJs7V9TN4a0G8GYKjDMfnIIq8uoyDd7m+Q7BKK2v1K7dmFCM52jEvvM/Wj/GS3bfOQwk5Vfx4kLkOU45ugx4qFEfoxYTtiJepsxvfrZXSgm804ecPxcD7ez+qm8ONLRhp6KIitYaLrg83lEi/UIbXlUDDaXXOgaezO65Iwfdbv1fF7NZPQ2wG4PQ2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjOmdMugtjQfRLqOUaBNwFAtJp6TeZi9pI/30bvJiY4=;
 b=Gvd4vhAnmQK7zz9DDvcnFVnZ5CQcDrW78qJtVXvUb1zqGQXgwICnmjsxdJnV9R5B6sMQxsHLBtqLeLbeULi3LnuUfvULNJneux3JQjF659nyUDc3F1RzN1xqerquKrarriCdXx0QRjHkw16m3ct/Ds/R87AxXwyiKdsZt7XjwMfmSEEcDSzgMD8uwW52lwedfdkW4X5uDXvkXL8hBRbW4+W7XUb14az7aubrE3bFeK75E5WBzgpR/hW+kg94ulcmhsmmd4RkjoKpKEMM4YaJa1c77f44X69kvulU50LtNXTlM1F4/29AK4WtFRFjv8FcRlofGaVSZS4z2jPNvN8s2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 04:21:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 04:21:07 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][kirkstone][PATCH 3/3]
  docker-distribution: upgrade to 2.8.1
Date: Thu,  9 Jun 2022 21:20:53 -0700
Message-Id: <20220610042053.4051-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220610042053.4051-1-Qi.Chen@windriver.com>
References: <20220610042053.4051-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b714b6c-abf6-431b-ad8d-08da4a98a39e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4652:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4652B202C4132CFAD0D1E6F4EDA69@MW3PR11MB4652.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yTD/nSztlVwZV92O908SH2dHm9HWyqlEx+KiWwyXqDzTthEXz6qesPMOrem6p8Pk02Hox065XG7IKPdwEyXlc0S+pnLkUUByHzoVlIT/0ROi38gRKd0L4MGOwkFoXpJnkNHVgYjvaql9vrTA06C1VXG9QldDK6dWqdk10zwrx5b8xtvu6kYvywBVd7BaWrkdT1QNXCrVp3XDuaOyvpa8p5GbwGBlMwBRFfQJ0bEaHkMuqcUDTiNsdpQZxafLqNMbzurAxc+2KKgUwxjwMY99ThI5fHroTk5Z++axRRMDu5rNHXcOEYjUR1i9TClPP7vm1RGDReOGOplRZreOM4N0NOb/FdoXDqEQSAD9RfDPglOGNComJM49+yD2Oa2d9aiiB+oK5wed+ZzHLUzlzheh30HeFcHCfA7z2imljfAxQVOw49lIzn27Po9YW+W0bvwfTe2SIbz/krju9SI8OWTIhOiOA69LRnj0W7A6bhgqQyqcsCiOeUBh7O5/9iPDJEViPY1cPiNnfY7tdoKMebXW/3EqkdXaumOfbYcf61PHLPZcf3lcgHDqq5GrzMUBvpA/yuKQzW1IUxg6089tIb70Fuhi+Dir0OMiBtiBp3f4I5dslzDM9l2yC9h44hvPep5m2Yu5RlgUFXTUn+3hoiM358Av7fK7TXK744d/wK3NwMfFu0kt4uKrJoqMjabYYEgrOCfVUtXv50vNduN56HoQOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(83380400001)(2906002)(66476007)(66946007)(66556008)(6486002)(5660300002)(8676002)(36756003)(26005)(6666004)(6512007)(86362001)(6506007)(52116002)(508600001)(2616005)(1076003)(6916009)(186003)(8936002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0tbfcgA+b2qZZleZ+f+bDgqM65NDxEqdVPQZRk3mCS/V7JU8+Jq7C9DOFJR?=
 =?us-ascii?Q?Us6d3vvLr02TrPfxxB58k5wqWPJvXIJPTC5ZMzbJ2KwXaI7j0rYIkgDQKlRL?=
 =?us-ascii?Q?G/KyqyH6DBjPlfpcEbUQQ6J9ns8aPqJlawcu4TQpHz3dKzbvoh1n45GAhXtG?=
 =?us-ascii?Q?jH4eC5RTMNMN+mC0pt4t1SzlDIcFl/r193c7szgA7wL+S6jK3LOV6rZTnVMC?=
 =?us-ascii?Q?GSkqjpLOcPUg/xPAHWK57DPFyM0XT/nFEJRskXzHuGdGsrHq5wLg1D2OTt3v?=
 =?us-ascii?Q?E7FBXnJlL5r4Xkxmp+V3HgwOde1Bwh2gImlgXHqSoITsvhy8xmI8YP4ujbEo?=
 =?us-ascii?Q?frHX5qGBmZwb4C3NO9ytDe5nRbyAkQS+OQMcUMKIGqXV1LkgcHR4oX6fxjta?=
 =?us-ascii?Q?KEbI5R4JtxA0R8i7wlUOPkMdBALw/7fdE59fgDA9mO2EzX9dOFo5r4hTpHU7?=
 =?us-ascii?Q?wpugsYQ7idi1dbdxXU4FHuVbGfwwQC8ehDsdxaUGkf/DyPgEO90Rf9CGeS94?=
 =?us-ascii?Q?0+gdKRqLsOujtLOjbXilBMQ4G6Rq5xgqDQiVpuxJSs/gzAuBPG7VeqiJaUkI?=
 =?us-ascii?Q?kXZj97xsQbmAYqz5p72JTBJrE2rXu6SCbdMbZVJMDV7zpGdl/uJIQTT3a9Xp?=
 =?us-ascii?Q?r4PGc4InT4dyX+Ak+gDXsC81TaqFSqICkgmdoGh4WOcpcI8WVWolmYOWk7fc?=
 =?us-ascii?Q?z9uUNCPBQMn8rNqgFBjK37Z7wDpA2Nw1tH0K9Y+ooUCesxlATgzx5VUL5Ofh?=
 =?us-ascii?Q?jyFdH6oB/hm+UqkwQr0v//z0G1GVYv66r0jdD6IPx7QpUmqxceCddDhMNGE0?=
 =?us-ascii?Q?a5suQRS7EMNU/9dHv5WRXS3WBDvi9ZYHEwK4n0FMzwLPGl0Lzl1fs+nRZuna?=
 =?us-ascii?Q?in92hoMsZc98czi5oN9VKQ9Ezlrk1O/0gVt2Hz7IPqlP2UduGgRGNZGBGTca?=
 =?us-ascii?Q?7CcjTHSE1jPlM+TAsOoKPwWayYdTAZoJxEYn9OI4HD9C1OILVu+5VNgA0lPP?=
 =?us-ascii?Q?sNqcDtqEtDdrnhNhDC5uR6G6bbSLYCfD8hi+O+VBzvZqBC7HQ9R5K/Mg9fyg?=
 =?us-ascii?Q?g4rXgjuXa+iLNslmSswYoqRwtyENnCzHxDsWGEolCkgrciSH00GarU8pBmpT?=
 =?us-ascii?Q?ptQa3W5S+nsvj+JO3vAXc8529SGO/pyKVNxz5VhJqodk2YktM17VFNhWgrFZ?=
 =?us-ascii?Q?Z9ldBzHPTs0I2HmQEes78LCfMCqwncLwA2t6IZK2t90Td2KjzTYm7q4fm+ey?=
 =?us-ascii?Q?OqG8fkDkWBvBFOZ5TWFR+5b1x6RmhytutQBZziX76FjDtTYJ9c7EbtuRUJc5?=
 =?us-ascii?Q?RhRkOqahbWA6TX/nJQuj3PU2oahCXc0nDJX2p8jurR4JGuGBijZWpBsEm6mw?=
 =?us-ascii?Q?ktYPOZN4r0itU2uBphx7qDBUKQO1YneSBciv99Ur20H1dlxn7jeLa8SZy8FB?=
 =?us-ascii?Q?3W6Ps1hqdi2OE7AfTWfnwtmIL/5y08TNtDlxMUUTfw0N4OlCLGVuu/4DpUGT?=
 =?us-ascii?Q?HM6in1U+4Ti35oc/4M3AJcHlEuLfWWkAriWTqBZi1mN+bBINf+8PMOrspyNu?=
 =?us-ascii?Q?v0EW45Hw/uuTzbOssKZXhHMa9kKOt20p4t4wpSbKEgooLj5MLBU8m6dqqAF1?=
 =?us-ascii?Q?NRJbpnf9BS8Px2/6mZ2YAQJtfyyhqtRoP5e+X5Ibwa0qpH62kv8P7tZCYoiZ?=
 =?us-ascii?Q?BUFMa4Y0dPPIpGtDHDsDsDCQMb5qVOLyMMk2domNuFBmbAapn0VI56zjOF3N?=
 =?us-ascii?Q?Pu52q3RX58AOW5Y5DTzbEergV7bg8kg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2b714b6c-abf6-431b-ad8d-08da4a98a39e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 04:21:07.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q6rHz8v0onl98XXz8WxtMPGxj/znU/etZuJygD0ReGepvkEBiJVFCuepAyBKUZuvYTxZ7MgzcP2YtlGbEQIlPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
X-Proofpoint-GUID: EGD8T3S-8ZSYpLaJMXB203-JV2Ts9eVo
X-Proofpoint-ORIG-GUID: EGD8T3S-8ZSYpLaJMXB203-JV2Ts9eVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_01,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=860 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100013
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 04:21:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7357

v2.8.1 is the latest stable version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 679bcf8b..0d497916 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -3,15 +3,15 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution= "3b7b534569220c840993aad03e3eafe54b923f4d"
-SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.7;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
+SRCREV_distribution= "b5ca020cfbe998e5af3457fda087444cf5116496"
+SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
           "
 
 PACKAGES =+ "docker-registry"
 
-PV = "v2.8.0+git${SRCPV}"
+PV = "v2.8.1+git${SRCPV}"
 S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
-- 
2.36.0


