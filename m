Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73FAC001DB
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 03:22:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13773.1693884143795255689
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 20:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J5wm+fqp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761265d233=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3852eYPl020295
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 5 Sep 2023 03:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=dn8FvZfCCHPBXOF0+THYXEG9OMhiRQBZ2StyoKiN0iQ=; b=
	J5wm+fqpxb4pHTtdf5P6LyAiKC0BEhhxDEoYIl88Ra8e9/7Z4aGd8/DPhfGdHB34
	N8zk8lfLqRqYIyvq/5vE//AChXSFL1sUUiU0SPuymL/XD371tHZym9JAMOgg1UiY
	S0xT1WS9JXGAKr6023UGjL/AEi5rIdsS4PEVNqn0sgyrqBuaxgSA7RZZ1AWc46hC
	RsmhOVuSf164TTmu7ZZM3KhsjM0hL3zuYPxN6S7Z2hGqCM9rRWcai/TDnUzyuGcb
	88NuMQeVDSK+kpg7kFH790D40ew97i24hqFK2dzsp3usYNCqZijQbYPkeOj51NvE
	uYxK9z0ri0XlQcMzQduQqQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k0wqr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 03:22:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+VjgWa92bD6vbhZ445xYVSlJQnBzk7J8iyyMdf8MwqdEDavfVwv4Tf6GbpxtOt5cE3QxtpMJrN0dj3gdR1dXDH+Gwx4A3JmaJwh9Ebv3BlVeQ0v09/4mQRyhq+ELvhxVVricto6TzBNiT8buH+AxkLrEcz73iV+Ym4lyawVYq+eufSMgzeIU/ACGsb2hhxFxqZsMx1e9fen487W7hmN99FwPcJhggQfRqInJ9ELpww9A7BHHyLtOsGzhqqyjWGt5Zc5SP0i2ByulflYXbQYoZNIdQKLezlAySi6dHZrSz1qVBl/nKk7qIAlVgv8e7xXsUKHikwD8QRLBZDl3O1i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn8FvZfCCHPBXOF0+THYXEG9OMhiRQBZ2StyoKiN0iQ=;
 b=fny7nhsLQQMXAeN2D/Y4Q389343JwkrlXd3VTiaDzuHoKGRB3OwntDgwNGsdzUPKV48+srXeD5LajvPtX8jGcY8KZzA73MwtAsDYM6uoK1YE4XXppdkljEbbZV66iyVqUXh7P35wnPRiAYDWX8rH3/ZEfyGFkGVNEuk4jTdExWqyMfTdtX7n2xI1JsBGUMPIT1IpfFbLV9gd6aNRYWFE9oG/sHlUmZepUT5m1k4CZo8C6c2nVh7N8q945OHOrg/8gUuQN7czz7Ox5PgKdbkApd8lKkyDtAQo4/+MO8XxmyZVGCHueOfmh9kz4ke9H2EjzGsFsTDCMUGDsaRNXFBQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 03:22:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 03:22:17 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/4] nerdctl: upgrade to v1.5.0
Date: Mon,  4 Sep 2023 20:22:03 -0700
Message-Id: <20230905032203.1896328-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230905032203.1896328-1-Qi.Chen@windriver.com>
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a89f5f-df7c-4635-8903-08dbadbf4cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TvgSJuEaUdt9BTzleVkKDxL6A5G61P78QwQj4bd7VoNkHYCyYuPm3cLusXTKqmIogQC8N5z1nE/miQG5iQtMk/YX6tZcBfKrn4MoA3KWfrJPU710Upy76yS9eVHfQAOyP+P8SgkT9CfJEviePUNgGryGvB4gn1SuxCekTu09TfwRKBUV4S0XD8te2zDIpcgYxhHedcnmZSfWP4XCh8KqRev1Pqzj5BJQXuwjGLMKjIhPFmwld1K1H12Aac21k+e1Gcysl0AtX8xeECqP6AUzDDRpBxwfvaomafCvJQo5RR0r7ACgD63yci9sw85NngNgsz8hfBexxHU4xgf2Vz/2DK5ZSu/xNjkdmZDLduhKSPh7mIe6yEl0cEJhjSxVe4icUCudDDQyWKHsceLoKISOSQg5KMq65cbsycfV8EecIsw/VilQh6XaEra7ujR+f/8YYfhyNWVhgGWjDHoLylG4z/SNXYq08CUFarfwCwN3YHXlksmuRLRcYRHoKtPjKxgDPQamINWNN2yA1U6rjWbXRCOHh1KR1n2b+bq3vi2ssScHxATeCGbxQ/aa4cWYgv5vA5P0OEl+nds2jWsJP77at+UNKfmTpLeEXRHCTq1nc3A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(39850400004)(366004)(1800799009)(186009)(451199024)(41300700001)(38350700002)(38100700002)(45080400002)(6666004)(19627235002)(86362001)(478600001)(966005)(2616005)(83380400001)(1076003)(26005)(9686003)(6512007)(52116002)(6506007)(6486002)(66476007)(66556008)(36756003)(2906002)(6916009)(316002)(66946007)(30864003)(8936002)(5660300002)(84970400001)(8676002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q3IM7RY3Fy8BNWfSA6MMVVFG38mSpsj1V4KJyDDrbqwVveQHBL/Q7DWJjOIa?=
 =?us-ascii?Q?18wuy+l4+R/aNxk8G1qTD7nBlXAYtwyHCXkmu/Y0wTi8DooOFU54HGC2Aef6?=
 =?us-ascii?Q?an2bgGX2MlDg3d7vaqt2m2sXubYU5VemJd5TKU/Ex/EbBQ0POb4fz6kuPEfm?=
 =?us-ascii?Q?nLlzK2sekSWg6QpjHyqbPCiLm9vcFjVwTJD0eKLggR6ivEa8i3h41YlE9Yeb?=
 =?us-ascii?Q?a7KNTQnvOzP9yv/c8RcIw7ktQS7OWQW7g8F0HMgQJilMn0t0GoOkZ7wM65CL?=
 =?us-ascii?Q?XbrUikAnJrH89tLOjQkZTIxt1luo/RFKrUrGNPwBrPDnh30V+9sVKmkKvn4v?=
 =?us-ascii?Q?Dfy6toRZ8npMZqKci51Jq1Av/m94n+rKpc9irsfp4vNGBd5Ybabu32SZED/x?=
 =?us-ascii?Q?qwO9LpwgpTz5MYhcI57UE2osZ39+v4tFPwP1oihlQhlTwWKwsbb7ii7UqHsA?=
 =?us-ascii?Q?k0kSkQQdCjyzerkFUCZPCaH7IpSg9eKENkZWfUNDoxmbjx6s9sI4sMxVtDgQ?=
 =?us-ascii?Q?xg7AZMPPR4leDPIyYDodi8Qn0BjAv/OsAw7VgOwK8MY4aXhDjPZuiWONVtVH?=
 =?us-ascii?Q?n4W5srWD96jl9oX4FgT47TGhv32x9wiaUlxX1O1akSU1cQqexh3Xa5J/HYlc?=
 =?us-ascii?Q?mIOuIus9StUBlMF68PmxIFPmSVI1xW1OqsHQRT/zYhMLXMoGh8cDVhdAaEV2?=
 =?us-ascii?Q?LLWdxEk2SZxxpic7/5RvZk4362Kx64xGLbBT8MX3PwzJ1PCsUs8Iv5SXg8an?=
 =?us-ascii?Q?OwMMxlGlkee9x315hHQFTEyblH38X3opRaIAZXirTxxMxCTPUR5XcEoOE/Kp?=
 =?us-ascii?Q?F5wf/iUGFxsa69LTuUgeIsTkV16Z6IBpUU6J6cYs/Hm4yTCMbkC4rzMjvhwi?=
 =?us-ascii?Q?277CMQtAsHEma2q/5yG3ksl07At70H4HlBxnAqnlF4vJ9nItWNIFmjpE9Kxi?=
 =?us-ascii?Q?Fl3uJ6SUtA+PqCKuMlAfe3L+SfA+8gaH/U7CCfXXKkJeLTv5PXH6ls6/Kl+0?=
 =?us-ascii?Q?lwHOf7wnydz9pjMmxJVD0Kki/KxSCNJlS/kkIp5mvAr3mk6PazadZSxdAD/X?=
 =?us-ascii?Q?lTtMqC8ad+ye542Tf2oKYzrGoiSvHvDRSLbm8hsUzQjteeTHo1bGa6A3C8rI?=
 =?us-ascii?Q?nYdk2yZRdzN46DKP6bXoy+dNa+mIEZFkhWe7FDf+T1JhQLZLjNQizzL69zd0?=
 =?us-ascii?Q?lJo3eYc4xzoWJRjOrLghXE/8ZHbe812fhb0CWh1HQzPOs7K7tJmHilTsoDnn?=
 =?us-ascii?Q?J2T/Titxs6XbydDCOVJKEiGrO+Rmlq05oqAL/E8S8i+Z0XkuBP6DFCuM2pYx?=
 =?us-ascii?Q?v29g8PUeYR1L2pWz46hZuj36cA7OKy8ipF8hVKoUuC6PmzrLuDPw1Bn4d7uv?=
 =?us-ascii?Q?IaMX0mouGkxb0cgWQOklQfOg04uj4wBXXlMQj1gjzplZJ+jxpI5elCYbML/a?=
 =?us-ascii?Q?HPFWfc/nFv4m2Y6jkFprB6E9EaQbBPrR2gr2PGd0uFxcQoC+EkZk9QwoumCT?=
 =?us-ascii?Q?2rEB2mSKIzRT1u08qvIa0h70MgKKr2Aj8WhVq8fk8RSdyJuPGVPvnKaoOR63?=
 =?us-ascii?Q?/eA5i7uZGIo9NbsbEtnG1npsyPMLWaf4rfPhYBHg/djlDDr4nGjy/kTVLpm9?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a89f5f-df7c-4635-8903-08dbadbf4cf2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 03:22:14.6293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuTgch/q+qh/3TfUOQXfV+s6O2ARudKF2WMJCC6IYCNLNA2dWNRQtOhKLuhuFu5d8R+3zodjetig40KLs4VNYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
X-Proofpoint-GUID: yKzL1rBfmPxXAWNgeHeCdaeaxNF1QY2_
X-Proofpoint-ORIG-GUID: yKzL1rBfmPxXAWNgeHeCdaeaxNF1QY2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 03:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8273

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../nerdctl/nerdctl/modules.txt               |  96 +-
 recipes-containers/nerdctl/nerdctl_git.bb     |   6 +-
 recipes-containers/nerdctl/relocation.inc     | 245 ++---
 recipes-containers/nerdctl/src_uri.inc        | 973 +++++++++---------
 4 files changed, 682 insertions(+), 638 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl/modules.txt b/recipes-containers/nerdctl/nerdctl/modules.txt
index 01e34f5f..deafa0dc 100644
--- a/recipes-containers/nerdctl/nerdctl/modules.txt
+++ b/recipes-containers/nerdctl/nerdctl/modules.txt
@@ -1,26 +1,28 @@
-# github.com/Masterminds/semver/v3 v3.2.0
+# github.com/Masterminds/semver/v3 v3.2.1
 ## explicit
-# github.com/Microsoft/go-winio v0.6.0
+# github.com/Microsoft/go-winio v0.6.1
 ## explicit
-# github.com/Microsoft/hcsshim v0.10.0-rc.7
+# github.com/Microsoft/hcsshim v0.10.0
 ## explicit
-# github.com/compose-spec/compose-go v1.13.2
+# github.com/awslabs/soci-snapshotter v0.3.0
 ## explicit
-# github.com/containerd/accelerated-container-image v0.6.0
+# github.com/compose-spec/compose-go v1.17.0
 ## explicit
-# github.com/containerd/cgroups v1.1.0
+# github.com/containerd/accelerated-container-image v0.6.7
+## explicit
+# github.com/containerd/cgroups/v3 v3.0.2
 ## explicit
 # github.com/containerd/console v1.0.3
 ## explicit
-# github.com/containerd/containerd v1.7.0
+# github.com/containerd/containerd v1.7.3
 ## explicit
-# github.com/containerd/continuity v0.3.0
+# github.com/containerd/continuity v0.4.1
 ## explicit
 # github.com/containerd/go-cni v1.1.9
 ## explicit
 # github.com/containerd/imgcrypt v1.1.7
 ## explicit
-# github.com/containerd/nydus-snapshotter v0.7.1
+# github.com/containerd/nydus-snapshotter v0.10.0
 ## explicit
 # github.com/containerd/stargz-snapshotter v0.14.3
 ## explicit
@@ -28,19 +30,21 @@
 ## explicit
 # github.com/containerd/stargz-snapshotter/ipfs v0.14.3
 ## explicit
-# github.com/containerd/typeurl/v2 v2.1.0
+# github.com/containerd/typeurl/v2 v2.1.1
 ## explicit
 # github.com/containernetworking/cni v1.1.2
 ## explicit
-# github.com/containernetworking/plugins v1.2.0
+# github.com/containernetworking/plugins v1.3.0
+## explicit
+# github.com/coreos/go-iptables v0.6.0
 ## explicit
 # github.com/coreos/go-systemd/v22 v22.5.0
 ## explicit
 # github.com/cyphar/filepath-securejoin v0.2.3
 ## explicit
-# github.com/docker/cli v23.0.3+incompatible
+# github.com/docker/cli v24.0.5+incompatible
 ## explicit
-# github.com/docker/docker v23.0.3+incompatible
+# github.com/docker/docker v24.0.5+incompatible
 ## explicit
 # github.com/docker/go-connections v0.4.0
 ## explicit
@@ -56,7 +60,7 @@
 ## explicit
 # github.com/ipfs/go-cid v0.4.1
 ## explicit
-# github.com/mattn/go-isatty v0.0.18
+# github.com/mattn/go-isatty v0.0.19
 ## explicit
 # github.com/mitchellh/mapstructure v1.5.0
 ## explicit
@@ -64,25 +68,27 @@
 ## explicit
 # github.com/moby/sys/signal v0.7.0
 ## explicit
+# github.com/moby/term v0.5.0
+## explicit
 # github.com/opencontainers/go-digest v1.0.0
 ## explicit
-# github.com/opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b
+# github.com/opencontainers/image-spec v1.1.0-rc4
 ## explicit
-# github.com/opencontainers/runtime-spec v1.1.0-rc.1
+# github.com/opencontainers/runtime-spec v1.1.0
 ## explicit
 # github.com/pelletier/go-toml v1.9.5
 ## explicit
 # github.com/rootless-containers/bypass4netns v0.3.0
 ## explicit
-# github.com/rootless-containers/rootlesskit v1.1.0
+# github.com/rootless-containers/rootlesskit v1.1.1
 ## explicit
-# github.com/sirupsen/logrus v1.9.0
+# github.com/sirupsen/logrus v1.9.3
 ## explicit
 # github.com/spf13/cobra v1.7.0
 ## explicit
 # github.com/spf13/pflag v1.0.5
 ## explicit
-# github.com/tidwall/gjson v1.14.4
+# github.com/tidwall/gjson v1.15.0
 ## explicit
 # github.com/vishvananda/netlink v1.2.1-beta.2
 ## explicit
@@ -90,37 +96,39 @@
 ## explicit
 # github.com/yuchanns/srslog v1.1.0
 ## explicit
-# golang.org/x/crypto v0.7.0
+# golang.org/x/crypto v0.11.0
 ## explicit
-# golang.org/x/net v0.8.0
+# golang.org/x/net v0.12.0
 ## explicit
-# golang.org/x/sync v0.1.0
+# golang.org/x/sync v0.3.0
 ## explicit
-# golang.org/x/sys v0.7.0
+# golang.org/x/sys v0.10.0
 ## explicit
-# golang.org/x/term v0.7.0
+# golang.org/x/term v0.10.0
 ## explicit
-# golang.org/x/text v0.8.0
+# golang.org/x/text v0.11.0
 ## explicit
 # gopkg.in/yaml.v3 v3.0.1
 ## explicit
-# gotest.tools/v3 v3.4.0
+# gotest.tools/v3 v3.5.0
+## explicit
+# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
 ## explicit
 # github.com/AdaLogics/go-fuzz-headers v0.0.0-20230106234847-43070de90fa1
 ## explicit
-# github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20221215162035-5330a85ea652
+# github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20230306123547-8075edf89bb0
 ## explicit
-# github.com/cilium/ebpf v0.9.1
+# github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
 ## explicit
-# github.com/containerd/cgroups/v3 v3.0.1
+# github.com/cilium/ebpf v0.9.1
 ## explicit
 # github.com/containerd/fifo v1.1.0
 ## explicit
-# github.com/containerd/ttrpc v1.2.1
+# github.com/containerd/ttrpc v1.2.2
 ## explicit
 # github.com/containerd/typeurl v1.0.3-0.20220422153119-7f6e6d160d67
 ## explicit
-# github.com/containers/ocicrypt v1.1.6
+# github.com/containers/ocicrypt v1.1.7
 ## explicit
 # github.com/distribution/distribution/v3 v3.0.0-20230214150026-36d8c594d7aa
 ## explicit
@@ -132,7 +140,7 @@
 ## explicit
 # github.com/frankban/quicktest v1.14.2
 ## explicit
-# github.com/go-logr/logr v1.2.3
+# github.com/go-logr/logr v1.2.4
 ## explicit
 # github.com/go-logr/stdr v1.2.2
 ## explicit
@@ -142,7 +150,7 @@
 ## explicit
 # github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da
 ## explicit
-# github.com/golang/protobuf v1.5.2
+# github.com/golang/protobuf v1.5.3
 ## explicit
 # github.com/google/go-cmp v0.5.9
 ## explicit
@@ -150,11 +158,11 @@
 ## explicit
 # github.com/hashicorp/errwrap v1.1.0
 ## explicit
-# github.com/imdario/mergo v0.3.14
+# github.com/imdario/mergo v0.3.16
 ## explicit
 # github.com/inconshreveable/mousetrap v1.1.0
 ## explicit
-# github.com/klauspost/compress v1.16.3
+# github.com/klauspost/compress v1.16.7
 ## explicit
 # github.com/klauspost/cpuid/v2 v2.1.1
 ## explicit
@@ -190,7 +198,7 @@
 ## explicit
 # github.com/multiformats/go-varint v0.0.6
 ## explicit
-# github.com/opencontainers/runc v1.1.5
+# github.com/opencontainers/runc v1.1.7
 ## explicit
 # github.com/opencontainers/selinux v1.11.0
 ## explicit
@@ -208,7 +216,7 @@
 ## explicit
 # github.com/tinylib/msgp v1.1.6
 ## explicit
-# github.com/vbatts/tar-split v0.11.2
+# github.com/vbatts/tar-split v0.11.3
 ## explicit
 # github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb
 ## explicit
@@ -220,19 +228,19 @@
 ## explicit
 # go.opencensus.io v0.24.0
 ## explicit
-# go.opentelemetry.io/otel v1.14.0
+# go.opentelemetry.io/otel v1.15.1
 ## explicit
-# go.opentelemetry.io/otel/trace v1.14.0
+# go.opentelemetry.io/otel/trace v1.15.1
 ## explicit
-# golang.org/x/mod v0.9.0
+# golang.org/x/mod v0.11.0
 ## explicit
-# golang.org/x/tools v0.6.0
+# golang.org/x/tools v0.9.1
 ## explicit
-# google.golang.org/genproto v0.0.0-20230306155012-7f2fa6fef1f4
+# google.golang.org/genproto v0.0.0-20230410155749-daa745c078e1
 ## explicit
-# google.golang.org/grpc v1.53.0
+# google.golang.org/grpc v1.56.2
 ## explicit
-# google.golang.org/protobuf v1.28.1
+# google.golang.org/protobuf v1.31.0
 ## explicit
 # gopkg.in/square/go-jose.v2 v2.5.1
 ## explicit
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 62460a52..892629fe 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 # Specify the first two important SRCREVs as the format
 SRCREV_FORMAT="nerdcli_cgroups"
-SRCREV_nerdcli = "1525035ce9aec89a796f6f15c7537db2448f88b9"
+SRCREV_nerdcli = "b33a58f288bc42351404a016e694190b897cd252"
 
 SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https"
 
@@ -22,8 +22,6 @@ SRC_URI += "file://0001-Makefile-allow-external-specification-of-build-setti.pat
             file://modules.txt \
            "
 
-SRC_URI[sha256sum] = "d7b05a9bff34dfb25abe7e5b1e54cf2607f953d91cb33fb231a4775a1a4afa3d"
-
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
@@ -31,7 +29,7 @@ GO_IMPORT = "import"
 
 # S = "${WORKDIR}/git"
 
-PV = "v1.3.0"
+PV = "v1.5.0"
 
 NERDCTL_PKG = "github.com/containerd/nerdctl"
 
diff --git a/recipes-containers/nerdctl/relocation.inc b/recipes-containers/nerdctl/relocation.inc
index 451a4504..401a980c 100644
--- a/recipes-containers/nerdctl/relocation.inc
+++ b/recipes-containers/nerdctl/relocation.inc
@@ -1,124 +1,127 @@
-export sites="github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3 \
-           github.com/Microsoft/go-winio:github.com/Microsoft/go-winio \
-           github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim \
-           github.com/compose-spec/compose-go:github.com/compose-spec/compose-go \
-           github.com/containerd/accelerated-container-image:github.com/containerd/accelerated-container-image \
-           github.com/containerd/cgroups:github.com/containerd/cgroups \
-           github.com/containerd/cgroups/v3:github.com/containerd/cgroups/v3 \
-           github.com/containerd/console:github.com/containerd/console \
-           github.com/containerd/containerd:github.com/containerd/containerd \
-           github.com/containerd/continuity:github.com/containerd/continuity \
-           github.com/containerd/go-cni:github.com/containerd/go-cni \
-           github.com/containerd/imgcrypt:github.com/containerd/imgcrypt \
-           github.com/containerd/nydus-snapshotter:github.com/containerd/nydus-snapshotter \
-           github.com/containerd/stargz-snapshotter:github.com/containerd/stargz-snapshotter \
-           github.com/containerd/stargz-snapshotter/estargz:github.com/containerd/stargz-snapshotter//estargz \
-           github.com/containerd/stargz-snapshotter/ipfs:github.com/containerd/stargz-snapshotter//ipfs \
-           github.com/containerd/typeurl/v2:github.com/containerd/typeurlv2 \
-           github.com/containerd/typeurl:github.com/containerd/typeurl \
-           github.com/containernetworking/cni:github.com/containernetworking/cni \
-           github.com/containernetworking/plugins:github.com/containernetworking/plugins \
-           github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22 \
-           github.com/cyphar/filepath-securejoin:github.com/cyphar/filepath-securejoin \
-           github.com/docker/cli:github.com/docker/cli \
-           github.com/docker/docker:github.com/docker/docker \
-           github.com/docker/go-connections:github.com/docker/go-connections \
-           github.com/docker/go-units:github.com/docker/go-units \
-           github.com/fahedouch/go-logrotate:github.com/fahedouch/go-logrotate \
-           github.com/fatih/color:github.com/fatih/color \
-           github.com/fluent/fluent-logger-golang:github.com/fluent/fluent-logger-golang \
-           github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror \
-           github.com/ipfs/go-cid:github.com/ipfs/go-cid \
-           github.com/mattn/go-isatty:github.com/mattn/go-isatty \
-           github.com/mitchellh/mapstructure:github.com/mitchellh/mapstructure \
-           github.com/moby/sys/mount:github.com/moby/sys/mount//mount \
-           github.com/moby/sys/signal:github.com/moby/sys/signal//signal \
-           github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo//mountinfo \
-           github.com/moby/sys/sequential:github.com/moby/sys/sequential//sequential \
-           github.com/moby/sys/symlink:github.com/moby/sys/symlink//symlink \
-           github.com/opencontainers/go-digest:github.com/opencontainers/go-digest \
-           github.com/opencontainers/image-spec:github.com/opencontainers/image-spec \
-           github.com/opencontainers/runtime-spec:github.com/opencontainers/runtime-spec \
-           github.com/pelletier/go-toml:github.com/pelletier/go-toml \
-           github.com/rootless-containers/bypass4netns:github.com/rootless-containers/bypass4netns \
-           github.com/rootless-containers/rootlesskit:github.com/rootless-containers/rootlesskit \
-           github.com/sirupsen/logrus:github.com/sirupsen/logrus \
-           github.com/spf13/cobra:github.com/spf13/cobra \
-           github.com/spf13/pflag:github.com/spf13/pflag \
-           github.com/tidwall/gjson:github.com/tidwall/gjson \
-           github.com/vishvananda/netlink:github.com/vishvananda/netlink \
-           github.com/vishvananda/netns:github.com/vishvananda/netns \
-           github.com/yuchanns/srslog:github.com/yuchanns/srslog \
-           golang.org/x/crypto:golang.org/x/crypto \
-           golang.org/x/net:golang.org/x/net \
-           golang.org/x/sync:golang.org/x/sync \
-           golang.org/x/sys:golang.org/x/sys \
-           golang.org/x/term:golang.org/x/term \
-           golang.org/x/text:golang.org/x/text \
-           gopkg.in/yaml.v3:gopkg.in/yaml.v3 \
-           gotest.tools/v3:github.com/gotestyourself/gotest.tools \
-           github.com/AdaLogics/go-fuzz-headers:github.com/AdaLogics/go-fuzz-headers \
-           github.com/AdamKorcz/go-118-fuzz-build:github.com/AdamKorcz/go-118-fuzz-build \
-           github.com/cilium/ebpf:github.com/cilium/ebpf \
-           github.com/containerd/fifo:github.com/containerd/fifo \
-           github.com/containerd/ttrpc:github.com/containerd/ttrpc \
-           github.com/containers/ocicrypt:github.com/containers/ocicrypt \
-           github.com/distribution/distribution/v3:github.com/distribution/distribution/v3 \
-           github.com/djherbis/times:github.com/djherbis/times \
-           github.com/docker/docker-credential-helpers:github.com/docker/docker-credential-helpers \
-           github.com/docker/go-events:github.com/docker/go-events \
-           github.com/frankban/quicktest:github.com/frankban/quicktest \
-           github.com/go-logr/logr:github.com/go-logr/logr \
-           github.com/go-logr/stdr:github.com/go-logr/stdr \
-           github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 \
-           github.com/gogo/protobuf:github.com/gogo/protobuf \
-           github.com/golang/groupcache:github.com/golang/groupcache \
-           github.com/golang/protobuf:github.com/golang/protobuf \
-           github.com/google/go-cmp:github.com/google/go-cmp \
-           github.com/google/uuid:github.com/google/uuid \
-           github.com/hashicorp/errwrap:github.com/hashicorp/errwrap \
-           github.com/imdario/mergo:github.com/imdario/mergo \
-           github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap \
-           github.com/klauspost/compress:github.com/klauspost/compress \
-           github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2 \
-           github.com/mattn/go-colorable:github.com/mattn/go-colorable \
-           github.com/mattn/go-shellwords:github.com/mattn/go-shellwords \
-           github.com/miekg/pkcs11:github.com/miekg/pkcs11 \
-           github.com/minio/sha256-simd:github.com/minio/sha256-simd \
-           github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir \
-           github.com/moby/locker:github.com/moby/locker \
-           github.com/mr-tron/base58:github.com/mr-tron/base58 \
-           github.com/multiformats/go-base32:github.com/multiformats/go-base32 \
-           github.com/multiformats/go-base36:github.com/multiformats/go-base36 \
-           github.com/multiformats/go-multiaddr:github.com/multiformats/go-multiaddr \
-           github.com/multiformats/go-multibase:github.com/multiformats/go-multibase \
-           github.com/multiformats/go-multihash:github.com/multiformats/go-multihash \
-           github.com/multiformats/go-varint:github.com/multiformats/go-varint \
-           github.com/opencontainers/runc:github.com/opencontainers/runc \
-           github.com/opencontainers/selinux:github.com/opencontainers/selinux \
-           github.com/philhofer/fwd:github.com/philhofer/fwd \
-           github.com/pkg/errors:github.com/pkg/errors \
-           github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 \
-           github.com/stefanberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri \
-           github.com/tidwall/match:github.com/tidwall/match \
-           github.com/tidwall/pretty:github.com/tidwall/pretty \
-           github.com/tinylib/msgp:github.com/tinylib/msgp \
-           github.com/vbatts/tar-split:github.com/vbatts/tar-split \
-           github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojsonpointer \
-           github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonreference \
-           github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema \
-           go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 \
-           go.opencensus.io:go.opencensus.io \
-           go.opentelemetry.io/otel:go.opentelemetry.io/otel \
-           go.opentelemetry.io/otel/trace:go.opentelemetry.io/otel//trace \
-           golang.org/x/mod:golang.org/x/mod \
-           golang.org/x/tools:golang.org/x/tools \
-           google.golang.org/genproto:github.com/googleapis/go-genproto \
-           google.golang.org/grpc:github.com/grpc/grpc-go \
-           google.golang.org/protobuf:github.com/protocolbuffers/protobuf-go \
-           gopkg.in/square/go-jose.v2:gopkg.in/square/go-jose.v2 \
-           lukechampine.com/blake3:lukechampine.com/blake3"
-
+export sites="gotest.tools/v3:gotest.tools/v3:force \
+           golang.org/x/net:golang.org/x/net:force \
+           golang.org/x/sys:golang.org/x/sys:force \
+           gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \
+           golang.org/x/exp:golang.org/x/exp:force \
+           go.opencensus.io:go.opencensus.io:force \
+           golang.org/x/mod:golang.org/x/mod:force \
+           golang.org/x/sync:golang.org/x/sync:force \
+           golang.org/x/term:golang.org/x/term:force \
+           golang.org/x/text:golang.org/x/text:force \
+           golang.org/x/tools:golang.org/x/tools:force \
+           golang.org/x/crypto:golang.org/x/crypto:force \
+           github.com/moby/term:github.com/moby/term:force \
+           go.mozilla.org/pkcs7:go.mozilla.org/pkcs7:force \
+           github.com/docker/cli:github.com/docker/cli:force \
+           github.com/pkg/errors:github.com/pkg/errors:force \
+           github.com/fatih/color:github.com/fatih/color:force \
+           github.com/ipfs/go-cid:github.com/ipfs/go-cid:force \
+           github.com/spf13/cobra:github.com/spf13/cobra:force \
+           github.com/spf13/pflag:github.com/spf13/pflag:force \
+           github.com/cilium/ebpf:github.com/cilium/ebpf:force \
+           github.com/google/uuid:github.com/google/uuid:force \
+           github.com/moby/locker:github.com/moby/locker:force \
+           google.golang.org/grpc:google.golang.org/grpc:force \
+           github.com/go-logr/logr:github.com/go-logr/logr:force \
+           github.com/go-logr/stdr:github.com/go-logr/stdr:force \
+           github.com/miekg/pkcs11:github.com/miekg/pkcs11:force \
+           github.com/tinylib/msgp:github.com/tinylib/msgp:force \
+           lukechampine.com/blake3:lukechampine.com/blake3:force \
+           github.com/docker/docker:github.com/docker/docker:force \
+           github.com/tidwall/gjson:github.com/tidwall/gjson:force \
+           github.com/gogo/protobuf:github.com/gogo/protobuf:force \
+           github.com/google/go-cmp:github.com/google/go-cmp:force \
+           github.com/imdario/mergo:github.com/imdario/mergo:force \
+           github.com/philhofer/fwd:github.com/philhofer/fwd:force \
+           github.com/tidwall/match:github.com/tidwall/match:force \
+           go.opentelemetry.io/otel:go.opentelemetry.io/otel:force \
+           github.com/djherbis/times:github.com/djherbis/times:force \
+           github.com/godbus/dbus/v5:github.com/godbus/dbus/v5:force \
+           github.com/mr-tron/base58:github.com/mr-tron/base58:force \
+           github.com/tidwall/pretty:github.com/tidwall/pretty:force \
+           github.com/docker/go-units:github.com/docker/go-units:force \
+           github.com/mattn/go-isatty:github.com/mattn/go-isatty:force \
+           github.com/sirupsen/logrus:github.com/sirupsen/logrus:force \
+           github.com/yuchanns/srslog:github.com/yuchanns/srslog:force \
+           github.com/containerd/fifo:github.com/containerd/fifo:force \
+           github.com/golang/protobuf:github.com/golang/protobuf:force \
+           google.golang.org/genproto:google.golang.org/genproto:force \
+           google.golang.org/protobuf:google.golang.org/protobuf:force \
+           gopkg.in/square/go-jose.v2:gopkg.in/square/go-jose.v2:force \
+           github.com/containerd/ttrpc:github.com/containerd/ttrpc:force \
+           github.com/docker/go-events:github.com/docker/go-events:force \
+           github.com/vbatts/tar-split:github.com/vbatts/tar-split:force \
+           github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim:force \
+           github.com/containerd/go-cni:github.com/containerd/go-cni:force \
+           github.com/moby/sys/mount:github.com/moby/sys/mount/mount:force \
+           github.com/pelletier/go-toml:github.com/pelletier/go-toml:force \
+           github.com/vishvananda/netns:github.com/vishvananda/netns:force \
+           github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm:force \
+           github.com/golang/groupcache:github.com/golang/groupcache:force \
+           github.com/hashicorp/errwrap:github.com/hashicorp/errwrap:force \
+           github.com/minio/sha256-simd:github.com/minio/sha256-simd:force \
+           github.com/spaolacci/murmur3:github.com/spaolacci/murmur3:force \
+           github.com/Microsoft/go-winio:github.com/Microsoft/go-winio:force \
+           github.com/containerd/console:github.com/containerd/console:force \
+           github.com/coreos/go-iptables:github.com/coreos/go-iptables:force \
+           github.com/containerd/typeurl:github.com/containerd/typeurl:force \
+           github.com/frankban/quicktest:github.com/frankban/quicktest:force \
+           github.com/klauspost/compress:github.com/klauspost/compress:force \
+           github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2:force \
+           github.com/mattn/go-colorable:github.com/mattn/go-colorable:force \
+           github.com/moby/sys/signal:github.com/moby/sys/signal/signal:force \
+           github.com/containerd/imgcrypt:github.com/containerd/imgcrypt:force \
+           github.com/vishvananda/netlink:github.com/vishvananda/netlink:force \
+           github.com/containers/ocicrypt:github.com/containers/ocicrypt:force \
+           github.com/mattn/go-shellwords:github.com/mattn/go-shellwords:force \
+           github.com/opencontainers/runc:github.com/opencontainers/runc:force \
+           github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir:force \
+           github.com/moby/sys/symlink:github.com/moby/sys/symlink/symlink:force \
+           github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema:force \
+           github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:force \
+           github.com/containerd/cgroups/v3:github.com/containerd/cgroups/v3:force \
+           github.com/containerd/containerd:github.com/containerd/containerd:force \
+           github.com/containerd/continuity:github.com/containerd/continuity:force \
+           github.com/containerd/typeurl/v2:github.com/containerd/typeurl/v2:force \
+           github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22:force \
+           github.com/docker/go-connections:github.com/docker/go-connections:force \
+           github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojsonpointer:force \
+           github.com/fahedouch/go-logrotate:github.com/fahedouch/go-logrotate:force \
+           github.com/mitchellh/mapstructure:github.com/mitchellh/mapstructure:force \
+           github.com/multiformats/go-base32:github.com/multiformats/go-base32:force \
+           github.com/multiformats/go-base36:github.com/multiformats/go-base36:force \
+           github.com/multiformats/go-varint:github.com/multiformats/go-varint:force \
+           github.com/opencontainers/selinux:github.com/opencontainers/selinux:force \
+           go.opentelemetry.io/otel/trace:go.opentelemetry.io/otel/trace/trace:force \
+           github.com/compose-spec/compose-go:github.com/compose-spec/compose-go:force \
+           github.com/containernetworking/cni:github.com/containernetworking/cni:force \
+           github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror:force \
+           github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo/mountinfo:force \
+           github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonreference:force \
+           github.com/awslabs/soci-snapshotter:github.com/awslabs/soci-snapshotter:force \
+           github.com/opencontainers/go-digest:github.com/opencontainers/go-digest:force \
+           github.com/moby/sys/sequential:github.com/moby/sys/sequential/sequential:force \
+           github.com/opencontainers/image-spec:github.com/opencontainers/image-spec:force \
+           github.com/AdaLogics/go-fuzz-headers:github.com/AdaLogics/go-fuzz-headers:force \
+           github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap:force \
+           github.com/multiformats/go-multiaddr:github.com/multiformats/go-multiaddr:force \
+           github.com/multiformats/go-multibase:github.com/multiformats/go-multibase:force \
+           github.com/multiformats/go-multihash:github.com/multiformats/go-multihash:force \
+           github.com/stefanberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri:force \
+           github.com/cyphar/filepath-securejoin:github.com/cyphar/filepath-securejoin:force \
+           github.com/containernetworking/plugins:github.com/containernetworking/plugins:force \
+           github.com/fluent/fluent-logger-golang:github.com/fluent/fluent-logger-golang:force \
+           github.com/opencontainers/runtime-spec:github.com/opencontainers/runtime-spec:force \
+           github.com/AdamKorcz/go-118-fuzz-build:github.com/AdamKorcz/go-118-fuzz-build:force \
+           github.com/containerd/nydus-snapshotter:github.com/containerd/nydus-snapshotter:force \
+           github.com/distribution/distribution/v3:github.com/distribution/distribution/v3:force \
+           github.com/containerd/stargz-snapshotter:github.com/containerd/stargz-snapshotter:force \
+           github.com/rootless-containers/rootlesskit:github.com/rootless-containers/rootlesskit:force \
+           github.com/rootless-containers/bypass4netns:github.com/rootless-containers/bypass4netns:force \
+           github.com/docker/docker-credential-helpers:github.com/docker/docker-credential-helpers:force \
+           github.com/containerd/stargz-snapshotter/ipfs:github.com/containerd/stargz-snapshotter/ipfs/ipfs:force \
+           github.com/containerd/accelerated-container-image:github.com/containerd/accelerated-container-image:force \
+           github.com/containerd/stargz-snapshotter/estargz:github.com/containerd/stargz-snapshotter/estargz/estargz:force"
 
 do_compile:prepend() {
     cd ${S}/src/import
diff --git a/recipes-containers/nerdctl/src_uri.inc b/recipes-containers/nerdctl/src_uri.inc
index 149bc3c0..0fc89701 100644
--- a/recipes-containers/nerdctl/src_uri.inc
+++ b/recipes-containers/nerdctl/src_uri.inc
@@ -1,585 +1,620 @@
-# 	github.com/Masterminds/semver/v3 v3.2.0
-# [1] git ls-remote https://github.com/Masterminds/semver 4694ab0ad3c9477a17e347d828d2aca9ef7130f0 
-SRCREV_v3="4694ab0ad3c9477a17e347d828d2aca9ef7130f0"
-SRC_URI += "git://github.com/Masterminds/semver;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Masterminds/semver/v3"
-
-# 	github.com/Microsoft/go-winio v0.6.0
-# [1] git ls-remote https://github.com/Microsoft/go-winio 376b2013fee695d54f9b21db81716426a8a736d9 
-SRCREV_go-winio="376b2013fee695d54f9b21db81716426a8a736d9"
-SRC_URI += "git://github.com/Microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/go-winio"
-
-# 	github.com/Microsoft/hcsshim v0.10.0-rc.7
-# [1] git ls-remote https://github.com/Microsoft/hcsshim 5871d0c4436f131c377655a3eb09fc9b5065f11d 
-SRCREV_hcsshim="5871d0c4436f131c377655a3eb09fc9b5065f11d"
-SRC_URI += "git://github.com/Microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/hcsshim"
+#       gotest.tools/v3 v3.5.0
+# [1] git ls-remote https://github.com/gotestyourself/gotest.tools a80f057529047c44e1a85d0d017b200787e537e0
+SRCREV_gotest.tools-v3="a80f057529047c44e1a85d0d017b200787e537e0"
+SRC_URI += "git://github.com/gotestyourself/gotest.tools;name=gotest.tools-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gotest.tools/v3"
+
+#       golang.org/x/net v0.12.0
+# [1] git ls-remote https://go.googlesource.com/net c73c09c3904ce6a210970374bd1bc507ef1f8cc2
+SRCREV_net="c73c09c3904ce6a210970374bd1bc507ef1f8cc2"
+SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net"
+
+#       golang.org/x/sys v0.10.0
+# [1] git ls-remote https://go.googlesource.com/sys a1a9c4b846b3a485ba94fede5b50579c7f432759
+SRCREV_sys="a1a9c4b846b3a485ba94fede5b50579c7f432759"
+SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys"
+
+#       gopkg.in/yaml.v3 v3.0.1
+# [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f56608cd2c32c51f8194bf51
+SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
 
-# 	github.com/compose-spec/compose-go v1.13.2
-# [1] git ls-remote https://github.com/compose-spec/compose-go 4d6b286b976c3f3aafcf422d56f0b552f4559589 
-SRCREV_compose-go="4d6b286b976c3f3aafcf422d56f0b552f4559589"
-SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go"
+#       golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
+# [1] git ls-remote https://go.googlesource.com/exp 613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963
+SRCREV_exp="613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963"
+SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp"
 
-# 	github.com/containerd/accelerated-container-image v0.6.0
-# [1] git ls-remote https://github.com/containerd/accelerated-container-image 7540814873f0b3917b57396cc18386e08e0e0f70 
-SRCREV_accelerated-container-image="7540814873f0b3917b57396cc18386e08e0e0f70"
-SRC_URI += "git://github.com/containerd/accelerated-container-image;name=accelerated-container-image;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/accelerated-container-image"
+#       go.opencensus.io v0.24.0
+# [1] git ls-remote https://github.com/census-instrumentation/opencensus-go b1a01ee95db0e690d91d7193d037447816fae4c5
+SRCREV_go.opencensus.io="b1a01ee95db0e690d91d7193d037447816fae4c5"
+SRC_URI += "git://github.com/census-instrumentation/opencensus-go;name=go.opencensus.io;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opencensus.io"
 
-# 	github.com/containerd/cgroups v1.1.0
-# [1] git ls-remote https://github.com/containerd/cgroups fe7323f622bc222e72473679f12a9089aeeda177 
-SRCREV_cgroups="fe7323f622bc222e72473679f12a9089aeeda177"
-SRC_URI += "git://github.com/containerd/cgroups;name=cgroups;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups"
+#       golang.org/x/mod v0.11.0
+# [1] git ls-remote https://go.googlesource.com/mod 62c7e578f1a7275d934c99dd48715525bd52b17e
+SRCREV_mod="62c7e578f1a7275d934c99dd48715525bd52b17e"
+SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod"
+
+#       golang.org/x/sync v0.3.0
+# [1] git ls-remote https://go.googlesource.com/sync 93782cc822b6b554cb7df40332fd010f0473cbc8
+SRCREV_sync="93782cc822b6b554cb7df40332fd010f0473cbc8"
+SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync"
+
+#       golang.org/x/term v0.10.0
+# [1] git ls-remote https://go.googlesource.com/term edd9fb7f4aabf5aa4c7bca2146907778a2af0321
+SRCREV_x-term="edd9fb7f4aabf5aa4c7bca2146907778a2af0321"
+SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term"
+
+#       golang.org/x/text v0.11.0
+# [1] git ls-remote https://go.googlesource.com/text e50348080f29449bcd6808c11400b3d45f08b09d
+SRCREV_text="e50348080f29449bcd6808c11400b3d45f08b09d"
+SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text"
+
+#       golang.org/x/tools v0.9.1
+# [1] git ls-remote https://go.googlesource.com/tools 4609d79b05b5ef86867bd70209b7077e22d30cb2
+SRCREV_tools="4609d79b05b5ef86867bd70209b7077e22d30cb2"
+SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
+
+#       golang.org/x/crypto v0.11.0
+# [1] git ls-remote https://go.googlesource.com/crypto e98487292dcad4efaa6033b245ee014f90d177a2
+SRCREV_crypto="e98487292dcad4efaa6033b245ee014f90d177a2"
+SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto"
+
+#       github.com/moby/term v0.5.0
+# [1] git ls-remote https://github.com/moby/term 9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9
+SRCREV_term="9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9"
+SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/term"
+
+#       go.mozilla.org/pkcs7 v0.0.0-20200128120323-432b2356ecb1
+# [1] git ls-remote https://github.com/mozilla-services/pkcs7 432b2356ecb18209c1cec25680b8a23632794f21
+SRCREV_pkcs7="432b2356ecb18209c1cec25680b8a23632794f21"
+SRC_URI += "git://github.com/mozilla-services/pkcs7;name=pkcs7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.mozilla.org/pkcs7"
 
-# 	github.com/containerd/console v1.0.3
-# [1] git ls-remote https://github.com/containerd/console b5cb846c9186d67bcae3ce3c324e47cd317d9527 
-SRCREV_console="b5cb846c9186d67bcae3ce3c324e47cd317d9527"
-SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
+#       github.com/docker/cli v24.0.5+incompatible
+# [1] git ls-remote https://github.com/docker/cli ced099660009713e0e845eeb754e6050dbaa45d0
+SRCREV_cli="ced099660009713e0e845eeb754e6050dbaa45d0"
+SRC_URI += "git://github.com/docker/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli"
 
-# 	github.com/containerd/containerd v1.7.0
-# [1] git ls-remote https://github.com/containerd/containerd 1fbd70374134b891f97ce19c70b6e50c7b9f4e0d 
-SRCREV_containerd="1fbd70374134b891f97ce19c70b6e50c7b9f4e0d"
-SRC_URI += "git://github.com/containerd/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/containerd"
+#       github.com/pkg/errors v0.9.1
+# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465
+SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
+SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
 
-# 	github.com/containerd/continuity v0.3.0
-# [1] git ls-remote https://github.com/containerd/continuity 5ad51c7aca47b8e742f5e6e7dc841d50f5f6affd 
-SRCREV_continuity="5ad51c7aca47b8e742f5e6e7dc841d50f5f6affd"
-SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/continuity"
+#       github.com/fatih/color v1.15.0
+# [1] git ls-remote https://github.com/fatih/color 12126ed593697635c525b302836b292b657ea573
+SRCREV_color="12126ed593697635c525b302836b292b657ea573"
+SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color"
 
-# 	github.com/containerd/go-cni v1.1.9
-# [1] git ls-remote https://github.com/containerd/go-cni 6603d5bd8941d7f2026bb5627f6aa4ff434f859a 
-SRCREV_go-cni="6603d5bd8941d7f2026bb5627f6aa4ff434f859a"
-SRC_URI += "git://github.com/containerd/go-cni;name=go-cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/go-cni"
+#       github.com/ipfs/go-cid v0.4.1
+# [1] git ls-remote https://github.com/ipfs/go-cid d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7
+SRCREV_go-cid="d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7"
+SRC_URI += "git://github.com/ipfs/go-cid;name=go-cid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-cid"
 
-# 	github.com/containerd/imgcrypt v1.1.7
-# [1] git ls-remote https://github.com/containerd/imgcrypt 01a05dffff35aadeb0a3008016ed745e7ff6beda 
-SRCREV_imgcrypt="01a05dffff35aadeb0a3008016ed745e7ff6beda"
-SRC_URI += "git://github.com/containerd/imgcrypt;name=imgcrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/imgcrypt"
+#       github.com/spf13/cobra v1.7.0
+# [1] git ls-remote https://github.com/spf13/cobra 4dd4b25de38418174a6e859e8a32eaccca32dccc
+SRCREV_cobra="4dd4b25de38418174a6e859e8a32eaccca32dccc"
+SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra"
 
-# 	github.com/containerd/nydus-snapshotter v0.7.1
-# [1] git ls-remote https://github.com/containerd/nydus-snapshotter cde243fcb806b33c2ab0252257a2391e24d3ecad 
-SRCREV_nydus-snapshotter="cde243fcb806b33c2ab0252257a2391e24d3ecad"
-SRC_URI += "git://github.com/containerd/nydus-snapshotter;name=nydus-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/nydus-snapshotter"
+#       github.com/spf13/pflag v1.0.5
+# [1] git ls-remote https://github.com/spf13/pflag 2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
+SRCREV_pflag="2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
+SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag"
 
-# 	github.com/containerd/stargz-snapshotter v0.14.3
-# [1] git ls-remote https://github.com/containerd/stargz-snapshotter 6ee6fa1a88df6ea098f6b7dddde29e33f09d5331 
-SRCREV_stargz-snapshotter="6ee6fa1a88df6ea098f6b7dddde29e33f09d5331"
-SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=stargz-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter"
+#       github.com/cilium/ebpf v0.9.1
+# [1] git ls-remote https://github.com/cilium/ebpf d560e4479b395c4523851a4571b04ba0b3846cd1
+SRCREV_ebpf="d560e4479b395c4523851a4571b04ba0b3846cd1"
+SRC_URI += "git://github.com/cilium/ebpf;name=ebpf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cilium/ebpf"
 
-# 	github.com/containerd/typeurl/v2 v2.1.0
-# [1] git ls-remote https://github.com/containerd/typeurl 2a94991bd2295cc8158a425fa0ac227204c6dd01 
-SRCREV_v2="2a94991bd2295cc8158a425fa0ac227204c6dd01"
-SRC_URI += "git://github.com/containerd/typeurl;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurlv2"
+#       github.com/google/uuid v1.3.0
+# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723f106b36d56ef13ccc88
+SRCREV_uuid="44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
+SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
 
-# 	github.com/containernetworking/cni v1.1.2
-# [1] git ls-remote https://github.com/containernetworking/cni 3363d143688bb83ca18489ac8b9dc204c1d49c4a 
-SRCREV_cni="3363d143688bb83ca18489ac8b9dc204c1d49c4a"
-SRC_URI += "git://github.com/containernetworking/cni;name=cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/cni"
+#       github.com/moby/locker v1.0.1
+# [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9d1487c965f24d30742fe
+SRCREV_locker="281af2d563954745bea9d1487c965f24d30742fe"
+SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/locker"
 
-# 	github.com/containernetworking/plugins v1.2.0
-# [1] git ls-remote https://github.com/containernetworking/plugins c4d24e80d64393d2c632a825a3486d1c2c0248ec 
-SRCREV_plugins="c4d24e80d64393d2c632a825a3486d1c2c0248ec"
-SRC_URI += "git://github.com/containernetworking/plugins;name=plugins;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/plugins"
+#       google.golang.org/grpc v1.56.2
+# [1] git ls-remote https://github.com/grpc/grpc-go faab8736bf73291f92b867d5dae31c927d53d508
+SRCREV_grpc="faab8736bf73291f92b867d5dae31c927d53d508"
+SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc"
 
-# 	github.com/coreos/go-systemd/v22 v22.5.0
-# [1] git ls-remote https://github.com/coreos/go-systemd d5623bf85e8e73ae6352f78ee6b55a287619dd4e 
-SRCREV_v22="d5623bf85e8e73ae6352f78ee6b55a287619dd4e"
-SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd/v22"
+#       github.com/go-logr/logr v1.2.4
+# [1] git ls-remote https://github.com/go-logr/logr 4da5305ff29a64c62f54ad43ebbfcb5e1b015fb2
+SRCREV_logr="4da5305ff29a64c62f54ad43ebbfcb5e1b015fb2"
+SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/logr"
 
-# 	github.com/cyphar/filepath-securejoin v0.2.3
-# [1] git ls-remote https://github.com/cyphar/filepath-securejoin 8f267f5ea675a20a2cb5e91011d063721f53bf79 
-SRCREV_filepath-securejoin="8f267f5ea675a20a2cb5e91011d063721f53bf79"
-SRC_URI += "git://github.com/cyphar/filepath-securejoin;name=filepath-securejoin;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cyphar/filepath-securejoin"
+#       github.com/go-logr/stdr v1.2.2
+# [1] git ls-remote https://github.com/go-logr/stdr 521af2addfa7c81c8a65d0e85ed34bb6bb6dc262
+SRCREV_stdr="521af2addfa7c81c8a65d0e85ed34bb6bb6dc262"
+SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/stdr"
 
-# 	github.com/docker/cli v23.0.3+incompatible
-# [1] git ls-remote https://github.com/docker/cli 3e7cbfdee1eb5be2ac23ed3668c654362dcd29b5 
-SRCREV_cli="3e7cbfdee1eb5be2ac23ed3668c654362dcd29b5"
-SRC_URI += "git://github.com/docker/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli"
+#       github.com/miekg/pkcs11 v1.1.1
+# [1] git ls-remote https://github.com/miekg/pkcs11 f3481918a208bd212aa995a41f92d786eb418a7d
+SRCREV_pkcs11="f3481918a208bd212aa995a41f92d786eb418a7d"
+SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11"
 
-# 	github.com/docker/docker v23.0.3+incompatible
-# [1] git ls-remote https://github.com/docker/docker 59118bff500fc0d95d0560a9788735a8d89568ce 
-SRCREV_docker="59118bff500fc0d95d0560a9788735a8d89568ce"
-SRC_URI += "git://github.com/docker/docker;name=docker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker"
+#       github.com/tinylib/msgp v1.1.6
+# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b486e350b4d105da6d8b
+SRCREV_msgp="205265da651409c54677b486e350b4d105da6d8b"
+SRC_URI += "git://github.com/tinylib/msgp;name=msgp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/msgp"
 
-# 	github.com/docker/go-connections v0.4.0
-# [1] git ls-remote https://github.com/docker/go-connections 7395e3f8aa162843a74ed6d48e79627d9792ac55 
-SRCREV_go-connections="7395e3f8aa162843a74ed6d48e79627d9792ac55"
-SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-connections"
+#       lukechampine.com/blake3 v1.1.7
+# [1] git ls-remote https://github.com/lukechampine/blake3 bb7ece4161ea910c6c385c17799b17d658075fcd
+SRCREV_blake3="bb7ece4161ea910c6c385c17799b17d658075fcd"
+SRC_URI += "git://github.com/lukechampine/blake3;name=blake3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/lukechampine.com/blake3"
 
-# 	github.com/docker/go-units v0.5.0
-# [1] git ls-remote https://github.com/docker/go-units e682442797b36348f8e1f98defdbf32bac0b6c6f 
-SRCREV_go-units="e682442797b36348f8e1f98defdbf32bac0b6c6f"
-SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-units"
+#       github.com/docker/docker v24.0.5+incompatible
+# [1] git ls-remote https://github.com/moby/moby a61e2b4c9c5f7c241aeb37f389b4444aee26bea4
+SRCREV_docker="a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
+SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker"
 
-# 	github.com/fahedouch/go-logrotate v0.1.3
-# [1] git ls-remote https://github.com/fahedouch/go-logrotate 8d5cc0d08c8653a794ad7bfe7c4d8150b2179aa1 
-SRCREV_go-logrotate="8d5cc0d08c8653a794ad7bfe7c4d8150b2179aa1"
-SRC_URI += "git://github.com/fahedouch/go-logrotate;name=go-logrotate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fahedouch/go-logrotate"
+#       github.com/tidwall/gjson v1.15.0
+# [1] git ls-remote https://github.com/tidwall/gjson 8d2c36ffa41368759c3bcb25b8790c8ce1e5562d
+SRCREV_gjson="8d2c36ffa41368759c3bcb25b8790c8ce1e5562d"
+SRC_URI += "git://github.com/tidwall/gjson;name=gjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/gjson"
 
-# 	github.com/fatih/color v1.15.0
-# [1] git ls-remote https://github.com/fatih/color 12126ed593697635c525b302836b292b657ea573 
-SRCREV_color="12126ed593697635c525b302836b292b657ea573"
-SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color"
+#       github.com/gogo/protobuf v1.3.2
+# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc
+SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
+SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
 
-# 	github.com/fluent/fluent-logger-golang v1.9.0
-# [1] git ls-remote https://github.com/fluent/fluent-logger-golang 5538e904aeb515c10a624da620581bdf420d4b8a 
-SRCREV_fluent-logger-golang="5538e904aeb515c10a624da620581bdf420d4b8a"
-SRC_URI += "git://github.com/fluent/fluent-logger-golang;name=fluent-logger-golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fluent/fluent-logger-golang"
+#       github.com/google/go-cmp v0.5.9
+# [1] git ls-remote https://github.com/google/go-cmp a97318bf6562f2ed2632c5f985db51b1bc5bdcd0
+SRCREV_go-cmp="a97318bf6562f2ed2632c5f985db51b1bc5bdcd0"
+SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp"
 
-# 	github.com/hashicorp/go-multierror v1.1.1
-# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0 
-SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
-SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
+#       github.com/imdario/mergo v0.3.16
+# [1] git ls-remote https://github.com/darccio/mergo 14fe2b165b83359196f820886a2b24f2771729e9
+SRCREV_mergo="14fe2b165b83359196f820886a2b24f2771729e9"
+SRC_URI += "git://github.com/darccio/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo"
 
-# 	github.com/ipfs/go-cid v0.4.1
-# [1] git ls-remote https://github.com/ipfs/go-cid d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7 
-SRCREV_go-cid="d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7"
-SRC_URI += "git://github.com/ipfs/go-cid;name=go-cid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-cid"
+#       github.com/philhofer/fwd v1.1.1
+# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a132ec243ba944efdb644
+SRCREV_fwd="9bcb9cab1b0394d8516a132ec243ba944efdb644"
+SRC_URI += "git://github.com/philhofer/fwd;name=fwd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philhofer/fwd"
 
-# 	github.com/mattn/go-isatty v0.0.18
-# [1] git ls-remote https://github.com/mattn/go-isatty 72a590e157f100a8191f6a086e84d5f6f73da9d6 
-SRCREV_go-isatty="72a590e157f100a8191f6a086e84d5f6f73da9d6"
-SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
+#       github.com/tidwall/match v1.1.1
+# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf
+SRCREV_match="4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
+SRC_URI += "git://github.com/tidwall/match;name=match;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/match"
 
-# 	github.com/mitchellh/mapstructure v1.5.0
-# [1] git ls-remote https://github.com/mitchellh/mapstructure ab69d8d93410fce4361f4912bb1ff88110a81311 
-SRCREV_mapstructure="ab69d8d93410fce4361f4912bb1ff88110a81311"
-SRC_URI += "git://github.com/mitchellh/mapstructure;name=mapstructure;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/mapstructure"
+#       go.opentelemetry.io/otel v1.15.1
+# [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go fc96138629cecdcc04dd5cb65559ead9e485d927
+SRCREV_otel="fc96138629cecdcc04dd5cb65559ead9e485d927"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel"
 
-# 	github.com/moby/sys/mount v0.3.3
-# [1] git ls-remote https://github.com/moby/sys 416188aff8404d549e1e34a50e513befeb11c3b9 
+#       github.com/moby/sys/mount v0.3.3
+# [1] git ls-remote https://github.com/moby/sys 416188aff8404d549e1e34a50e513befeb11c3b9
 SRCREV_mount="416188aff8404d549e1e34a50e513befeb11c3b9"
 SRC_URI += "git://github.com/moby/sys;name=mount;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mount"
 
-# 	github.com/moby/sys/signal v0.7.0
-# [1] git ls-remote https://github.com/moby/sys b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5 
-SRCREV_signal="b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
-SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal"
+#       github.com/djherbis/times v1.5.0
+# [1] git ls-remote https://github.com/djherbis/times a1edc5dc082a710e4a808e99c78989b8d04e3025
+SRCREV_times="a1edc5dc082a710e4a808e99c78989b8d04e3025"
+SRC_URI += "git://github.com/djherbis/times;name=times;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/djherbis/times"
 
-# 	github.com/opencontainers/go-digest v1.0.0
-# [1] git ls-remote https://github.com/opencontainers/go-digest ea51bea511f75cfa3ef6098cc253c5c3609b037a 
-SRCREV_go-digest="ea51bea511f75cfa3ef6098cc253c5c3609b037a"
-SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/go-digest"
+#       github.com/godbus/dbus/v5 v5.1.0
+# [1] git ls-remote https://github.com/godbus/dbus e523abc905595cf17fb0001a7d77eaaddfaa216d
+SRCREV_v5="e523abc905595cf17fb0001a7d77eaaddfaa216d"
+SRC_URI += "git://github.com/godbus/dbus;name=v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/godbus/dbus/v5"
 
-# 	github.com/opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b
-# [1] git ls-remote https://github.com/opencontainers/image-spec 3a7f492d3f1bcada656a7d8c08f3f9bbd05e7406 
-SRCREV_image-spec="3a7f492d3f1bcada656a7d8c08f3f9bbd05e7406"
-SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image-spec"
+#       github.com/mr-tron/base58 v1.2.0
+# [1] git ls-remote https://github.com/mr-tron/base58 cd0e5141f51dfcadb8311fd8e495eb11126a8010
+SRCREV_base58="cd0e5141f51dfcadb8311fd8e495eb11126a8010"
+SRC_URI += "git://github.com/mr-tron/base58;name=base58;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mr-tron/base58"
 
-# 	github.com/opencontainers/runtime-spec v1.1.0-rc.1
-# [1] git ls-remote https://github.com/opencontainers/runtime-spec 3e013c2729f542c16c7483ffc2fe06ba96b53e5b 
-SRCREV_runtime-spec="3e013c2729f542c16c7483ffc2fe06ba96b53e5b"
-SRC_URI += "git://github.com/opencontainers/runtime-spec;name=runtime-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runtime-spec"
+#       github.com/tidwall/pretty v1.2.0
+# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a854b85675801362cbdaa2
+SRCREV_pretty="aaa765e7476acb0028a854b85675801362cbdaa2"
+SRC_URI += "git://github.com/tidwall/pretty;name=pretty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/pretty"
 
-# 	github.com/pelletier/go-toml v1.9.5
-# [1] git ls-remote https://github.com/pelletier/go-toml fed1464066413075eac02cd4dc368b5221845541 
-SRCREV_go-toml="fed1464066413075eac02cd4dc368b5221845541"
-SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml"
+#       github.com/docker/go-units v0.5.0
+# [1] git ls-remote https://github.com/docker/go-units e682442797b36348f8e1f98defdbf32bac0b6c6f
+SRCREV_go-units="e682442797b36348f8e1f98defdbf32bac0b6c6f"
+SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-units"
 
-# 	github.com/rootless-containers/bypass4netns v0.3.0
-# [1] git ls-remote https://github.com/rootless-containers/bypass4netns 8175487972621850933a7bd6c6924a16569ba435 
-SRCREV_bypass4netns="8175487972621850933a7bd6c6924a16569ba435"
-SRC_URI += "git://github.com/rootless-containers/bypass4netns;name=bypass4netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/bypass4netns"
+#       github.com/mattn/go-isatty v0.0.19
+# [1] git ls-remote https://github.com/mattn/go-isatty c067b4f3df49dfc0f376d884e16cfd784ea1874b
+SRCREV_go-isatty="c067b4f3df49dfc0f376d884e16cfd784ea1874b"
+SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
 
-# 	github.com/rootless-containers/rootlesskit v1.1.0
-# [1] git ls-remote https://github.com/rootless-containers/rootlesskit 6222b477d4c3ce6eea2bcff0586e43c95d1c0bb7 
-SRCREV_rootlesskit="6222b477d4c3ce6eea2bcff0586e43c95d1c0bb7"
-SRC_URI += "git://github.com/rootless-containers/rootlesskit;name=rootlesskit;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/rootlesskit"
+#       github.com/moby/sys/signal v0.7.0
+# [1] git ls-remote https://github.com/moby/sys b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5
+SRCREV_signal="b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
+SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal"
 
-# 	github.com/sirupsen/logrus v1.9.0
-# [1] git ls-remote https://github.com/sirupsen/logrus f8bf7650dccb756cea26edaf9217aab85500fe07 
-SRCREV_logrus="f8bf7650dccb756cea26edaf9217aab85500fe07"
+#       github.com/sirupsen/logrus v1.9.3
+# [1] git ls-remote https://github.com/sirupsen/logrus d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
+SRCREV_logrus="d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
 SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/logrus"
 
-# 	github.com/spf13/cobra v1.7.0
-# [1] git ls-remote https://github.com/spf13/cobra 4dd4b25de38418174a6e859e8a32eaccca32dccc 
-SRCREV_cobra="4dd4b25de38418174a6e859e8a32eaccca32dccc"
-SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra"
-
-# 	github.com/spf13/pflag v1.0.5
-# [1] git ls-remote https://github.com/spf13/pflag 2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab 
-SRCREV_pflag="2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
-SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag"
-
-# 	github.com/tidwall/gjson v1.14.4
-# [1] git ls-remote https://github.com/tidwall/gjson e14b8d37087f5774d3d4dce0b0b708cbc32015f7 
-SRCREV_gjson="e14b8d37087f5774d3d4dce0b0b708cbc32015f7"
-SRC_URI += "git://github.com/tidwall/gjson;name=gjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/gjson"
-
-# 	github.com/vishvananda/netlink v1.2.1-beta.2
-# [1] git ls-remote https://github.com/vishvananda/netlink 5e915e0149386ce3d02379ff93f4c0a5601779d5 
-SRCREV_netlink="5e915e0149386ce3d02379ff93f4c0a5601779d5"
-SRC_URI += "git://github.com/vishvananda/netlink;name=netlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netlink"
-
-# 	github.com/vishvananda/netns v0.0.4
-# [1] git ls-remote https://github.com/vishvananda/netns 7a452d2d15292b2bfb2a2d88e6bdeac156a761b9 
-SRCREV_netns="7a452d2d15292b2bfb2a2d88e6bdeac156a761b9"
-SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netns"
-
-# 	github.com/yuchanns/srslog v1.1.0
-# [1] git ls-remote https://github.com/yuchanns/srslog becd9b11119269a7928ae89fde90784335c1d016 
+#       github.com/yuchanns/srslog v1.1.0
+# [1] git ls-remote https://github.com/yuchanns/srslog becd9b11119269a7928ae89fde90784335c1d016
 SRCREV_srslog="becd9b11119269a7928ae89fde90784335c1d016"
 SRC_URI += "git://github.com/yuchanns/srslog;name=srslog;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yuchanns/srslog"
 
-# 	golang.org/x/crypto v0.7.0
-# [1] git ls-remote https://github.com/golang/crypto 776e461a4e6d8b372a43c72122c5c28cfc40dca2 
-SRCREV_crypto="776e461a4e6d8b372a43c72122c5c28cfc40dca2"
-SRC_URI += "git://github.com/golang/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto"
-
-# 	golang.org/x/net v0.8.0
-# [1] git ls-remote https://github.com/golang/net dfa2b5dffd96fb2ae13e7d182501f0bce044a0a4 
-SRCREV_net="dfa2b5dffd96fb2ae13e7d182501f0bce044a0a4"
-SRC_URI += "git://github.com/golang/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net"
-
-# 	golang.org/x/sync v0.1.0
-# [1] git ls-remote https://github.com/golang/sync 8fcdb60fdcc0539c5e357b2308249e4e752147f1 
-SRCREV_sync="8fcdb60fdcc0539c5e357b2308249e4e752147f1"
-SRC_URI += "git://github.com/golang/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync"
-
-# 	golang.org/x/sys v0.7.0
-# [1] git ls-remote https://github.com/golang/sys 64840c112d2335ed9874114aed48f946e778a769 
-SRCREV_sys="64840c112d2335ed9874114aed48f946e778a769"
-SRC_URI += "git://github.com/golang/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys"
-
-# 	golang.org/x/term v0.7.0
-# [1] git ls-remote https://github.com/golang/term 7ae6be6d0150527c2c41e70586b9ade6a972a186 
-SRCREV_term="7ae6be6d0150527c2c41e70586b9ade6a972a186"
-SRC_URI += "git://github.com/golang/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term"
-
-# 	golang.org/x/text v0.8.0
-# [1] git ls-remote https://github.com/golang/text 9db913aaf20ced01b7a130d9fb222d74a1339fa6 
-SRCREV_text="9db913aaf20ced01b7a130d9fb222d74a1339fa6"
-SRC_URI += "git://github.com/golang/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text"
-
-# 	gopkg.in/yaml.v3 v3.0.1
-# [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd2c32c51f8194bf51 
-SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRC_URI += "git://gopkg.in/yaml.v3;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
-
-# 	gotest.tools/v3 v3.4.0
-# [1] git ls-remote https://github.com/gotestyourself/gotest.tools f086d2783c5b3a2a21b482ec19c1c310e68f4d18 
-SRCREV_v31="f086d2783c5b3a2a21b482ec19c1c310e68f4d18"
-SRC_URI += "git://github.com/gotestyourself/gotest.tools;name=v31;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gotestyourself/gotest.tools"
-
-# 	github.com/AdaLogics/go-fuzz-headers v0.0.0-20230106234847-43070de90fa1
-# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers 43070de90fa134c9ea55cd6de4308a2ae59658d3 
-SRCREV_go-fuzz-headers="43070de90fa134c9ea55cd6de4308a2ae59658d3"
-SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
-
-# 	github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20221215162035-5330a85ea652
-# [1] git ls-remote https://github.com/AdamKorcz/go-118-fuzz-build 5330a85ea6528bb00bea0417b6d61f30deb61f2c 
-SRCREV_go-118-fuzz-build="5330a85ea6528bb00bea0417b6d61f30deb61f2c"
-SRC_URI += "git://github.com/AdamKorcz/go-118-fuzz-build;name=go-118-fuzz-build;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdamKorcz/go-118-fuzz-build"
-
-# 	github.com/cilium/ebpf v0.9.1
-# [1] git ls-remote https://github.com/cilium/ebpf d560e4479b395c4523851a4571b04ba0b3846cd1 
-SRCREV_ebpf="d560e4479b395c4523851a4571b04ba0b3846cd1"
-SRC_URI += "git://github.com/cilium/ebpf;name=ebpf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cilium/ebpf"
-
-# 	github.com/containerd/cgroups/v3 v3.0.1
-# [1] git ls-remote https://github.com/containerd/cgroups 960ef05a33a09fe4f432683d3cbb4bb96e89d537 
-SRCREV_v312="960ef05a33a09fe4f432683d3cbb4bb96e89d537"
-SRC_URI += "git://github.com/containerd/cgroups;name=v312;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups/v3"
-
-# 	github.com/containerd/fifo v1.1.0
-# [1] git ls-remote https://github.com/containerd/fifo 151b205263c29d471e0d55c787d2ce9f5343fd46 
+#       github.com/containerd/fifo v1.1.0
+# [1] git ls-remote https://github.com/containerd/fifo 151b205263c29d471e0d55c787d2ce9f5343fd46
 SRCREV_fifo="151b205263c29d471e0d55c787d2ce9f5343fd46"
 SRC_URI += "git://github.com/containerd/fifo;name=fifo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/fifo"
 
-# 	github.com/containerd/ttrpc v1.2.1
-# [1] git ls-remote https://github.com/containerd/ttrpc 36fd7c3f33441e5f0ee5388d55a68019417c91a2 
-SRCREV_ttrpc="36fd7c3f33441e5f0ee5388d55a68019417c91a2"
-SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/ttrpc"
-
-# 	github.com/containerd/typeurl v1.0.3-0.20220422153119-7f6e6d160d67
-# [1] git ls-remote https://github.com/containerd/typeurl 7f6e6d160d675241af388d5cf1b90814786bac40 
-SRCREV_typeurl="7f6e6d160d675241af388d5cf1b90814786bac40"
-SRC_URI += "git://github.com/containerd/typeurl;name=typeurl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl"
+#       github.com/golang/protobuf v1.5.3
+# [1] git ls-remote https://github.com/golang/protobuf 5d5e8c018a13017f9d5b8bf4fad64aaa42a87308
+SRCREV_golang-protobuf="5d5e8c018a13017f9d5b8bf4fad64aaa42a87308"
+SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
 
-# 	github.com/containers/ocicrypt v1.1.6
-# [1] git ls-remote https://github.com/containers/ocicrypt c61dfa5ee6c2ac10004c4e156d1a435f11c444cf 
-SRCREV_ocicrypt="c61dfa5ee6c2ac10004c4e156d1a435f11c444cf"
-SRC_URI += "git://github.com/containers/ocicrypt;name=ocicrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containers/ocicrypt"
+#       google.golang.org/genproto v0.0.0-20230410155749-daa745c078e1
+# [1] git ls-remote https://github.com/googleapis/go-genproto daa745c078e18def54ea6b63235554b59c97f01d
+SRCREV_genproto="daa745c078e18def54ea6b63235554b59c97f01d"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto"
 
-# 	github.com/distribution/distribution/v3 v3.0.0-20230214150026-36d8c594d7aa
-# [1] git ls-remote https://github.com/distribution/distribution 36d8c594d7aa4fb0b9b927fb1edf4171b36f361b 
-SRCREV_v3123="36d8c594d7aa4fb0b9b927fb1edf4171b36f361b"
-SRC_URI += "git://github.com/distribution/distribution;name=v3123;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/distribution/distribution/v3"
+#       google.golang.org/protobuf v1.31.0
+# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 68463f0e96c93bc19ef36ccd3adfe690bfdb568c
+SRCREV_google.golang.org-protobuf="68463f0e96c93bc19ef36ccd3adfe690bfdb568c"
+SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
 
-# 	github.com/djherbis/times v1.5.0
-# [1] git ls-remote https://github.com/djherbis/times a1edc5dc082a710e4a808e99c78989b8d04e3025 
-SRCREV_times="a1edc5dc082a710e4a808e99c78989b8d04e3025"
-SRC_URI += "git://github.com/djherbis/times;name=times;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/djherbis/times"
+#       gopkg.in/square/go-jose.v2 v2.5.1
+# [1] git ls-remote https://github.com/square/go-jose 3a5ee095dcb5030a9de84fb92c222ac652fff176
+SRCREV_go-jose.v2="3a5ee095dcb5030a9de84fb92c222ac652fff176"
+SRC_URI += "git://github.com/square/go-jose;name=go-jose.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/square/go-jose.v2"
 
-# 	github.com/docker/docker-credential-helpers v0.7.0
-# [1] git ls-remote https://github.com/docker/docker-credential-helpers ac5992b5f4756fc0398a7d0c93c609e624368bde 
-SRCREV_docker-credential-helpers="ac5992b5f4756fc0398a7d0c93c609e624368bde"
-SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker-credential-helpers"
+#       github.com/containerd/ttrpc v1.2.2
+# [1] git ls-remote https://github.com/containerd/ttrpc ac26f8cbea1c440d451dd19a4a1b847fd073f3c3
+SRCREV_ttrpc="ac26f8cbea1c440d451dd19a4a1b847fd073f3c3"
+SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/ttrpc"
 
-# 	github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c
-# [1] git ls-remote https://github.com/docker/go-events e31b211e4f1cd09aa76fe4ac244571fab96ae47f 
+#       github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c
+# [1] git ls-remote https://github.com/docker/go-events e31b211e4f1cd09aa76fe4ac244571fab96ae47f
 SRCREV_go-events="e31b211e4f1cd09aa76fe4ac244571fab96ae47f"
 SRC_URI += "git://github.com/docker/go-events;name=go-events;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-events"
 
-# 	github.com/frankban/quicktest v1.14.2
-# [1] git ls-remote https://github.com/frankban/quicktest 9f3c63cd6950868c53a96aa4bf4cda5ca1d2e857 
-SRCREV_quicktest="9f3c63cd6950868c53a96aa4bf4cda5ca1d2e857"
-SRC_URI += "git://github.com/frankban/quicktest;name=quicktest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/frankban/quicktest"
+#       github.com/moby/sys/symlink v0.2.0
+# [1] git ls-remote https://github.com/moby/sys 03b9f8d59a07f5206a2264105f4903a222aea964
+SRCREV_symlink="03b9f8d59a07f5206a2264105f4903a222aea964"
+SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/symlink"
 
-# 	github.com/go-logr/logr v1.2.3
-# [1] git ls-remote https://github.com/go-logr/logr 47e013cee9b1f91c987cc70a218639655431b607 
-SRCREV_logr="47e013cee9b1f91c987cc70a218639655431b607"
-SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/logr"
+#       github.com/vbatts/tar-split v0.11.3
+# [1] git ls-remote https://github.com/vbatts/tar-split 3cdf99b6d45a47170f0092f1f3c0bbf2aca55db6
+SRCREV_tar-split="3cdf99b6d45a47170f0092f1f3c0bbf2aca55db6"
+SRC_URI += "git://github.com/vbatts/tar-split;name=tar-split;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vbatts/tar-split"
 
-# 	github.com/go-logr/stdr v1.2.2
-# [1] git ls-remote https://github.com/go-logr/stdr 521af2addfa7c81c8a65d0e85ed34bb6bb6dc262 
-SRCREV_stdr="521af2addfa7c81c8a65d0e85ed34bb6bb6dc262"
-SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/stdr"
+#       github.com/Microsoft/hcsshim v0.10.0
+# [1] git ls-remote https://github.com/microsoft/hcsshim 28cce9cea720462e4b84498f9f79fdb836454ba0
+SRCREV_hcsshim="28cce9cea720462e4b84498f9f79fdb836454ba0"
+SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/hcsshim"
 
-# 	github.com/godbus/dbus/v5 v5.1.0
-# [1] git ls-remote https://github.com/godbus/dbus e523abc905595cf17fb0001a7d77eaaddfaa216d 
-SRCREV_v5="e523abc905595cf17fb0001a7d77eaaddfaa216d"
-SRC_URI += "git://github.com/godbus/dbus;name=v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/godbus/dbus/v5"
+#       github.com/containerd/go-cni v1.1.9
+# [1] git ls-remote https://github.com/containerd/go-cni 6603d5bd8941d7f2026bb5627f6aa4ff434f859a
+SRCREV_go-cni="6603d5bd8941d7f2026bb5627f6aa4ff434f859a"
+SRC_URI += "git://github.com/containerd/go-cni;name=go-cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/go-cni"
 
-# 	github.com/gogo/protobuf v1.3.2
-# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc 
-SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
-SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
+#       github.com/pelletier/go-toml v1.9.5
+# [1] git ls-remote https://github.com/pelletier/go-toml fed1464066413075eac02cd4dc368b5221845541
+SRCREV_go-toml="fed1464066413075eac02cd4dc368b5221845541"
+SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml"
+
+#       github.com/vishvananda/netns v0.0.4
+# [1] git ls-remote https://github.com/vishvananda/netns 7a452d2d15292b2bfb2a2d88e6bdeac156a761b9
+SRCREV_netns="7a452d2d15292b2bfb2a2d88e6bdeac156a761b9"
+SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netns"
+
+#       github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
+# [1] git ls-remote https://github.com/Azure/go-ansiterm d185dfc1b5a126116ea5a19e148e29d16b4574c9
+SRCREV_go-ansiterm="d185dfc1b5a126116ea5a19e148e29d16b4574c9"
+SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-ansiterm"
 
-# 	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da
-# [1] git ls-remote https://github.com/golang/groupcache 41bb18bfe9da5321badc438f91158cd790a33aa3 
+#       github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da
+# [1] git ls-remote https://github.com/golang/groupcache 41bb18bfe9da5321badc438f91158cd790a33aa3
 SRCREV_groupcache="41bb18bfe9da5321badc438f91158cd790a33aa3"
 SRC_URI += "git://github.com/golang/groupcache;name=groupcache;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/groupcache"
 
-# 	github.com/golang/protobuf v1.5.2
-# [1] git ls-remote https://github.com/golang/protobuf ae97035608a719c7a1c1c41bed0ae0744bdb0c6f 
-SRCREV_protobuf1="ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
-SRC_URI += "git://github.com/golang/protobuf;name=protobuf1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
+#       github.com/hashicorp/errwrap v1.1.0
+# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0
+SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
+SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
 
-# 	github.com/google/go-cmp v0.5.9
-# [1] git ls-remote https://github.com/google/go-cmp a97318bf6562f2ed2632c5f985db51b1bc5bdcd0 
-SRCREV_go-cmp="a97318bf6562f2ed2632c5f985db51b1bc5bdcd0"
-SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp"
+#       github.com/minio/sha256-simd v1.0.0
+# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9
+SRCREV_sha256-simd="6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
+SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/sha256-simd"
 
-# 	github.com/google/uuid v1.3.0
-# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723f106b36d56ef13ccc88 
-SRCREV_uuid="44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
-SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
+#       github.com/spaolacci/murmur3 v1.1.0
+# [1] git ls-remote https://github.com/spaolacci/murmur3 f09979ecbc725b9e6d41a297405f65e7e8804acc
+SRCREV_murmur3="f09979ecbc725b9e6d41a297405f65e7e8804acc"
+SRC_URI += "git://github.com/spaolacci/murmur3;name=murmur3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spaolacci/murmur3"
 
-# 	github.com/hashicorp/errwrap v1.1.0
-# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0 
-SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
-SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
+#       github.com/Microsoft/go-winio v0.6.1
+# [1] git ls-remote https://github.com/microsoft/go-winio 070c828abb873da9e71c7247740253b50f7cf049
+SRCREV_go-winio="070c828abb873da9e71c7247740253b50f7cf049"
+SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/go-winio"
 
-# 	github.com/imdario/mergo v0.3.14
-# [1] git ls-remote https://github.com/imdario/mergo d19834bb682056bd1eec5dfe6d9ec9bd9d6ba58f 
-SRCREV_mergo="d19834bb682056bd1eec5dfe6d9ec9bd9d6ba58f"
-SRC_URI += "git://github.com/imdario/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo"
+#       github.com/containerd/console v1.0.3
+# [1] git ls-remote https://github.com/containerd/console b5cb846c9186d67bcae3ce3c324e47cd317d9527
+SRCREV_console="b5cb846c9186d67bcae3ce3c324e47cd317d9527"
+SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
 
-# 	github.com/inconshreveable/mousetrap v1.1.0
-# [1] git ls-remote https://github.com/inconshreveable/mousetrap 4e8053ee7ef85a6bd26368364a6d27f1641c1d21 
-SRCREV_mousetrap="4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
-SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
+#       github.com/coreos/go-iptables v0.6.0
+# [1] git ls-remote https://github.com/coreos/go-iptables 14d56d57c892f27a717aa6026fd2d3293221395b
+SRCREV_go-iptables="14d56d57c892f27a717aa6026fd2d3293221395b"
+SRC_URI += "git://github.com/coreos/go-iptables;name=go-iptables;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-iptables"
+
+#       github.com/containerd/typeurl v1.0.3-0.20220422153119-7f6e6d160d67
+# [1] git ls-remote https://github.com/containerd/typeurl 7f6e6d160d675241af388d5cf1b90814786bac40
+SRCREV_typeurl="7f6e6d160d675241af388d5cf1b90814786bac40"
+SRC_URI += "git://github.com/containerd/typeurl;name=typeurl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl"
+
+#       github.com/frankban/quicktest v1.14.2
+# [1] git ls-remote https://github.com/frankban/quicktest 9f3c63cd6950868c53a96aa4bf4cda5ca1d2e857
+SRCREV_quicktest="9f3c63cd6950868c53a96aa4bf4cda5ca1d2e857"
+SRC_URI += "git://github.com/frankban/quicktest;name=quicktest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/frankban/quicktest"
 
-# 	github.com/klauspost/compress v1.16.3
-# [1] git ls-remote https://github.com/klauspost/compress 8183f00311278ccf61e1805b35db90052d333d64 
-SRCREV_compress="8183f00311278ccf61e1805b35db90052d333d64"
+#       github.com/klauspost/compress v1.16.7
+# [1] git ls-remote https://github.com/klauspost/compress 67a538e2b4df11f8ec7139388838a13bce84b5d5
+SRCREV_compress="67a538e2b4df11f8ec7139388838a13bce84b5d5"
 SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/compress"
 
-# 	github.com/klauspost/cpuid/v2 v2.1.1
-# [1] git ls-remote https://github.com/klauspost/cpuid 976c6486fb9f5d9ef7354ef9c2819b1ffcda73a9 
-SRCREV_v21="976c6486fb9f5d9ef7354ef9c2819b1ffcda73a9"
-SRC_URI += "git://github.com/klauspost/cpuid;name=v21;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpuid/v2"
+#       github.com/klauspost/cpuid/v2 v2.1.1
+# [1] git ls-remote https://github.com/klauspost/cpuid 976c6486fb9f5d9ef7354ef9c2819b1ffcda73a9
+SRCREV_cpuid-v2="976c6486fb9f5d9ef7354ef9c2819b1ffcda73a9"
+SRC_URI += "git://github.com/klauspost/cpuid;name=cpuid-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpuid/v2"
 
-# 	github.com/mattn/go-colorable v0.1.13
-# [1] git ls-remote https://github.com/mattn/go-colorable 11a925cff3d38c293ddc8c05a16b504e3e2c63be 
+#       github.com/mattn/go-colorable v0.1.13
+# [1] git ls-remote https://github.com/mattn/go-colorable 11a925cff3d38c293ddc8c05a16b504e3e2c63be
 SRCREV_go-colorable="11a925cff3d38c293ddc8c05a16b504e3e2c63be"
 SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-colorable"
 
-# 	github.com/mattn/go-shellwords v1.0.12
-# [1] git ls-remote https://github.com/mattn/go-shellwords 973b9d5391598d4ee601db46fa32f6e186a356ac 
+#       github.com/moby/sys/mountinfo v0.6.2
+# [1] git ls-remote https://github.com/moby/sys 1bf36f7188c31f2797c556c4c4d7d9af7a6a965b
+SRCREV_mountinfo="1bf36f7188c31f2797c556c4c4d7d9af7a6a965b"
+SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mountinfo"
+
+#       github.com/containerd/imgcrypt v1.1.7
+# [1] git ls-remote https://github.com/containerd/imgcrypt 01a05dffff35aadeb0a3008016ed745e7ff6beda
+SRCREV_imgcrypt="01a05dffff35aadeb0a3008016ed745e7ff6beda"
+SRC_URI += "git://github.com/containerd/imgcrypt;name=imgcrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/imgcrypt"
+
+#       github.com/vishvananda/netlink v1.2.1-beta.2
+# [1] git ls-remote https://github.com/vishvananda/netlink 5e915e0149386ce3d02379ff93f4c0a5601779d5
+SRCREV_netlink="5e915e0149386ce3d02379ff93f4c0a5601779d5"
+SRC_URI += "git://github.com/vishvananda/netlink;name=netlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netlink"
+
+#       github.com/containers/ocicrypt v1.1.7
+# [1] git ls-remote https://github.com/containers/ocicrypt ee4e19a2ec93f08262499bc9521c751f4a1d935c
+SRCREV_ocicrypt="ee4e19a2ec93f08262499bc9521c751f4a1d935c"
+SRC_URI += "git://github.com/containers/ocicrypt;name=ocicrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containers/ocicrypt"
+
+#       github.com/mattn/go-shellwords v1.0.12
+# [1] git ls-remote https://github.com/mattn/go-shellwords 973b9d5391598d4ee601db46fa32f6e186a356ac
 SRCREV_go-shellwords="973b9d5391598d4ee601db46fa32f6e186a356ac"
 SRC_URI += "git://github.com/mattn/go-shellwords;name=go-shellwords;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-shellwords"
 
-# 	github.com/miekg/pkcs11 v1.1.1
-# [1] git ls-remote https://github.com/miekg/pkcs11 f3481918a208bd212aa995a41f92d786eb418a7d 
-SRCREV_pkcs11="f3481918a208bd212aa995a41f92d786eb418a7d"
-SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11"
+#       github.com/moby/sys/sequential v0.5.0
+# [1] git ls-remote https://github.com/moby/sys b22ba8a69b306f0b4adbbe2a529457e6283ed9f7
+SRCREV_sequential="b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
+SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequential"
 
-# 	github.com/minio/sha256-simd v1.0.0
-# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9 
-SRCREV_sha256-simd="6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
-SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/sha256-simd"
+#       github.com/opencontainers/runc v1.1.7
+# [1] git ls-remote https://github.com/opencontainers/runc 860f061b76bb4fc671f0f9e900f7d80ff93d4eb7
+SRCREV_runc="860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
+SRC_URI += "git://github.com/opencontainers/runc;name=runc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runc"
 
-# 	github.com/mitchellh/go-homedir v1.1.0
-# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf3004701891bf4fdb884bfe4920b3727 
+#       go.opentelemetry.io/otel/trace v1.15.1
+# [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go fc96138629cecdcc04dd5cb65559ead9e485d927
+SRCREV_trace="fc96138629cecdcc04dd5cb65559ead9e485d927"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/trace"
+
+#       github.com/mitchellh/go-homedir v1.1.0
+# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf3004701891bf4fdb884bfe4920b3727
 SRCREV_go-homedir="af06845cf3004701891bf4fdb884bfe4920b3727"
 SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-homedir"
 
-# 	github.com/moby/locker v1.0.1
-# [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9d1487c965f24d30742fe 
-SRCREV_locker="281af2d563954745bea9d1487c965f24d30742fe"
-SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/locker"
+#       github.com/xeipuuv/gojsonschema v1.2.0
+# [1] git ls-remote https://github.com/xeipuuv/gojsonschema 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
+SRCREV_gojsonschema="82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
+SRC_URI += "git://github.com/xeipuuv/gojsonschema;name=gojsonschema;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonschema"
 
-# 	github.com/moby/sys/mountinfo v0.6.2
-# [1] git ls-remote https://github.com/moby/sys 1bf36f7188c31f2797c556c4c4d7d9af7a6a965b 
-SRCREV_mountinfo="1bf36f7188c31f2797c556c4c4d7d9af7a6a965b"
-SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mountinfo"
+#       github.com/Masterminds/semver/v3 v3.2.1
+# [1] git ls-remote https://github.com/Masterminds/semver e06051f8fcc4c8b4a4990c337b9862a2448722e5
+SRCREV_v3="e06051f8fcc4c8b4a4990c337b9862a2448722e5"
+SRC_URI += "git://github.com/Masterminds/semver;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Masterminds/semver/v3"
 
-# 	github.com/moby/sys/sequential v0.5.0
-# [1] git ls-remote https://github.com/moby/sys b22ba8a69b306f0b4adbbe2a529457e6283ed9f7 
-SRCREV_sequential="b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
-SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequential"
+#       github.com/containerd/cgroups/v3 v3.0.2
+# [1] git ls-remote https://github.com/containerd/cgroups 8fa64246e17ceea54277b3ad7139d9ec17545bfa
+SRCREV_cgroups-v3="8fa64246e17ceea54277b3ad7139d9ec17545bfa"
+SRC_URI += "git://github.com/containerd/cgroups;name=cgroups-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups/v3"
 
-# 	github.com/moby/sys/symlink v0.2.0
-# [1] git ls-remote https://github.com/moby/sys 03b9f8d59a07f5206a2264105f4903a222aea964 
-SRCREV_symlink="03b9f8d59a07f5206a2264105f4903a222aea964"
-SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/symlink"
+#       github.com/containerd/containerd v1.7.3
+# [1] git ls-remote https://github.com/containerd/containerd 7880925980b188f4c97b462f709d0db8e8962aff
+SRCREV_containerd="7880925980b188f4c97b462f709d0db8e8962aff"
+SRC_URI += "git://github.com/containerd/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/containerd"
 
-# 	github.com/mr-tron/base58 v1.2.0
-# [1] git ls-remote https://github.com/mr-tron/base58 cd0e5141f51dfcadb8311fd8e495eb11126a8010 
-SRCREV_base58="cd0e5141f51dfcadb8311fd8e495eb11126a8010"
-SRC_URI += "git://github.com/mr-tron/base58;name=base58;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mr-tron/base58"
+#       github.com/containerd/continuity v0.4.1
+# [1] git ls-remote https://github.com/containerd/continuity 25762ef7c27a37645197ed6d1d708e55a230e35d
+SRCREV_continuity="25762ef7c27a37645197ed6d1d708e55a230e35d"
+SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/continuity"
+
+#       github.com/containerd/typeurl/v2 v2.1.1
+# [1] git ls-remote https://github.com/containerd/typeurl 7ef6316b771f959cbb208b229e3423a466947df3
+SRCREV_v2="7ef6316b771f959cbb208b229e3423a466947df3"
+SRC_URI += "git://github.com/containerd/typeurl;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl/v2"
 
-# 	github.com/multiformats/go-base32 v0.1.0
-# [1] git ls-remote https://github.com/multiformats/go-base32 a16b66327f327428b32b919939b8c93482507e1f 
+#       github.com/coreos/go-systemd/v22 v22.5.0
+# [1] git ls-remote https://github.com/coreos/go-systemd d5623bf85e8e73ae6352f78ee6b55a287619dd4e
+SRCREV_v22="d5623bf85e8e73ae6352f78ee6b55a287619dd4e"
+SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd/v22"
+
+#       github.com/docker/go-connections v0.4.0
+# [1] git ls-remote https://github.com/docker/go-connections 7395e3f8aa162843a74ed6d48e79627d9792ac55
+SRCREV_go-connections="7395e3f8aa162843a74ed6d48e79627d9792ac55"
+SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-connections"
+
+#       github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb
+# [1] git ls-remote https://github.com/xeipuuv/gojsonpointer 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
+SRCREV_gojsonpointer="02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
+SRC_URI += "git://github.com/xeipuuv/gojsonpointer;name=gojsonpointer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonpointer"
+
+#       github.com/fahedouch/go-logrotate v0.1.3
+# [1] git ls-remote https://github.com/fahedouch/go-logrotate 8d5cc0d08c8653a794ad7bfe7c4d8150b2179aa1
+SRCREV_go-logrotate="8d5cc0d08c8653a794ad7bfe7c4d8150b2179aa1"
+SRC_URI += "git://github.com/fahedouch/go-logrotate;name=go-logrotate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fahedouch/go-logrotate"
+
+#       github.com/mitchellh/mapstructure v1.5.0
+# [1] git ls-remote https://github.com/mitchellh/mapstructure ab69d8d93410fce4361f4912bb1ff88110a81311
+SRCREV_mapstructure="ab69d8d93410fce4361f4912bb1ff88110a81311"
+SRC_URI += "git://github.com/mitchellh/mapstructure;name=mapstructure;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/mapstructure"
+
+#       github.com/multiformats/go-base32 v0.1.0
+# [1] git ls-remote https://github.com/multiformats/go-base32 a16b66327f327428b32b919939b8c93482507e1f
 SRCREV_go-base32="a16b66327f327428b32b919939b8c93482507e1f"
 SRC_URI += "git://github.com/multiformats/go-base32;name=go-base32;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-base32"
 
-# 	github.com/multiformats/go-base36 v0.1.0
-# [1] git ls-remote https://github.com/multiformats/go-base36 dc4afa6ad3b0720f4a1b282776db2a59ca9c8be7 
+#       github.com/multiformats/go-base36 v0.1.0
+# [1] git ls-remote https://github.com/multiformats/go-base36 dc4afa6ad3b0720f4a1b282776db2a59ca9c8be7
 SRCREV_go-base36="dc4afa6ad3b0720f4a1b282776db2a59ca9c8be7"
 SRC_URI += "git://github.com/multiformats/go-base36;name=go-base36;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-base36"
 
-# 	github.com/multiformats/go-multiaddr v0.8.0
-# [1] git ls-remote https://github.com/multiformats/go-multiaddr f317559337171436148d927749f783f33b82a698 
-SRCREV_go-multiaddr="f317559337171436148d927749f783f33b82a698"
-SRC_URI += "git://github.com/multiformats/go-multiaddr;name=go-multiaddr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multiaddr"
-
-# 	github.com/multiformats/go-multibase v0.1.1
-# [1] git ls-remote https://github.com/multiformats/go-multibase c1bc15b22eedb45f9205f3b60ce5fcb8fca93e08 
-SRCREV_go-multibase="c1bc15b22eedb45f9205f3b60ce5fcb8fca93e08"
-SRC_URI += "git://github.com/multiformats/go-multibase;name=go-multibase;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multibase"
-
-# 	github.com/multiformats/go-multihash v0.2.1
-# [1] git ls-remote https://github.com/multiformats/go-multihash 16974ad98ab1fb19eb756919f55373b39cc80bec 
-SRCREV_go-multihash="16974ad98ab1fb19eb756919f55373b39cc80bec"
-SRC_URI += "git://github.com/multiformats/go-multihash;name=go-multihash;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multihash"
-
-# 	github.com/multiformats/go-varint v0.0.6
-# [1] git ls-remote https://github.com/multiformats/go-varint a3ded45ab16ca9f2f2a516e68053ffa7ebd9bb0e 
+#       github.com/multiformats/go-varint v0.0.6
+# [1] git ls-remote https://github.com/multiformats/go-varint a3ded45ab16ca9f2f2a516e68053ffa7ebd9bb0e
 SRCREV_go-varint="a3ded45ab16ca9f2f2a516e68053ffa7ebd9bb0e"
 SRC_URI += "git://github.com/multiformats/go-varint;name=go-varint;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-varint"
 
-# 	github.com/opencontainers/runc v1.1.5
-# [1] git ls-remote https://github.com/opencontainers/runc f19387a6bec4944c770f7668ab51c4348d9c2f38 
-SRCREV_runc="f19387a6bec4944c770f7668ab51c4348d9c2f38"
-SRC_URI += "git://github.com/opencontainers/runc;name=runc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runc"
-
-# 	github.com/opencontainers/selinux v1.11.0
-# [1] git ls-remote https://github.com/opencontainers/selinux b68c45eb2df48c6b0c949901ccda90c8e65fe677 
+#       github.com/opencontainers/selinux v1.11.0
+# [1] git ls-remote https://github.com/opencontainers/selinux b68c45eb2df48c6b0c949901ccda90c8e65fe677
 SRCREV_selinux="b68c45eb2df48c6b0c949901ccda90c8e65fe677"
 SRC_URI += "git://github.com/opencontainers/selinux;name=selinux;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/selinux"
 
-# 	github.com/philhofer/fwd v1.1.1
-# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a132ec243ba944efdb644 
-SRCREV_fwd="9bcb9cab1b0394d8516a132ec243ba944efdb644"
-SRC_URI += "git://github.com/philhofer/fwd;name=fwd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philhofer/fwd"
+#       github.com/compose-spec/compose-go v1.17.0
+# [1] git ls-remote https://github.com/compose-spec/compose-go 95ac1be8bfdc4dc21cdfb14e37b52c31275046a3
+SRCREV_compose-go="95ac1be8bfdc4dc21cdfb14e37b52c31275046a3"
+SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go"
 
-# 	github.com/pkg/errors v0.9.1
-# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465 
-SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
-SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
+#       github.com/containernetworking/cni v1.1.2
+# [1] git ls-remote https://github.com/containernetworking/cni 3363d143688bb83ca18489ac8b9dc204c1d49c4a
+SRCREV_cni="3363d143688bb83ca18489ac8b9dc204c1d49c4a"
+SRC_URI += "git://github.com/containernetworking/cni;name=cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/cni"
 
-# 	github.com/spaolacci/murmur3 v1.1.0
-# [1] git ls-remote https://github.com/spaolacci/murmur3 f09979ecbc725b9e6d41a297405f65e7e8804acc 
-SRCREV_murmur3="f09979ecbc725b9e6d41a297405f65e7e8804acc"
-SRC_URI += "git://github.com/spaolacci/murmur3;name=murmur3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spaolacci/murmur3"
+#       github.com/hashicorp/go-multierror v1.1.1
+# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0
+SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
+SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
+
+#       github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415
+# [1] git ls-remote https://github.com/xeipuuv/gojsonreference bd5ef7bd5415a7ac448318e64f11a24cd21e594b
+SRCREV_gojsonreference="bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
+SRC_URI += "git://github.com/xeipuuv/gojsonreference;name=gojsonreference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonreference"
+
+#       github.com/awslabs/soci-snapshotter v0.3.0
+# [1] git ls-remote https://github.com/awslabs/soci-snapshotter 2574f6466b4a148be04f8f79c6e71167994452a7
+SRCREV_soci-snapshotter="2574f6466b4a148be04f8f79c6e71167994452a7"
+SRC_URI += "git://github.com/awslabs/soci-snapshotter;name=soci-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/awslabs/soci-snapshotter"
+
+#       github.com/opencontainers/go-digest v1.0.0
+# [1] git ls-remote https://github.com/opencontainers/go-digest ea51bea511f75cfa3ef6098cc253c5c3609b037a
+SRCREV_go-digest="ea51bea511f75cfa3ef6098cc253c5c3609b037a"
+SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/go-digest"
+
+#       github.com/opencontainers/image-spec v1.1.0-rc4
+# [1] git ls-remote https://github.com/opencontainers/image-spec 82e8329f7eb6df5c62924f2792d285ba276ae876
+SRCREV_image-spec="82e8329f7eb6df5c62924f2792d285ba276ae876"
+SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image-spec"
+
+#       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230106234847-43070de90fa1
+# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers 43070de90fa134c9ea55cd6de4308a2ae59658d3
+SRCREV_go-fuzz-headers="43070de90fa134c9ea55cd6de4308a2ae59658d3"
+SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
+
+#       github.com/inconshreveable/mousetrap v1.1.0
+# [1] git ls-remote https://github.com/inconshreveable/mousetrap 4e8053ee7ef85a6bd26368364a6d27f1641c1d21
+SRCREV_mousetrap="4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
+SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
+
+#       github.com/multiformats/go-multiaddr v0.8.0
+# [1] git ls-remote https://github.com/multiformats/go-multiaddr f317559337171436148d927749f783f33b82a698
+SRCREV_go-multiaddr="f317559337171436148d927749f783f33b82a698"
+SRC_URI += "git://github.com/multiformats/go-multiaddr;name=go-multiaddr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multiaddr"
+
+#       github.com/multiformats/go-multibase v0.1.1
+# [1] git ls-remote https://github.com/multiformats/go-multibase c1bc15b22eedb45f9205f3b60ce5fcb8fca93e08
+SRCREV_go-multibase="c1bc15b22eedb45f9205f3b60ce5fcb8fca93e08"
+SRC_URI += "git://github.com/multiformats/go-multibase;name=go-multibase;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multibase"
+
+#       github.com/multiformats/go-multihash v0.2.1
+# [1] git ls-remote https://github.com/multiformats/go-multihash 16974ad98ab1fb19eb756919f55373b39cc80bec
+SRCREV_go-multihash="16974ad98ab1fb19eb756919f55373b39cc80bec"
+SRC_URI += "git://github.com/multiformats/go-multihash;name=go-multihash;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multihash"
 
-# 	github.com/stefanberger/go-pkcs11uri v0.0.0-20201008174630-78d3cae3a980
-# [1] git ls-remote https://github.com/stefanberger/go-pkcs11uri 78d3cae3a9805d89aa4fa80a362ca944c89a1b99 
+#       github.com/stefanberger/go-pkcs11uri v0.0.0-20201008174630-78d3cae3a980
+# [1] git ls-remote https://github.com/stefanberger/go-pkcs11uri 78d3cae3a9805d89aa4fa80a362ca944c89a1b99
 SRCREV_go-pkcs11uri="78d3cae3a9805d89aa4fa80a362ca944c89a1b99"
 SRC_URI += "git://github.com/stefanberger/go-pkcs11uri;name=go-pkcs11uri;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stefanberger/go-pkcs11uri"
 
-# 	github.com/tidwall/match v1.1.1
-# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf 
-SRCREV_match="4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
-SRC_URI += "git://github.com/tidwall/match;name=match;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/match"
+#       github.com/cyphar/filepath-securejoin v0.2.3
+# [1] git ls-remote https://github.com/cyphar/filepath-securejoin 8f267f5ea675a20a2cb5e91011d063721f53bf79
+SRCREV_filepath-securejoin="8f267f5ea675a20a2cb5e91011d063721f53bf79"
+SRC_URI += "git://github.com/cyphar/filepath-securejoin;name=filepath-securejoin;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cyphar/filepath-securejoin"
 
-# 	github.com/tidwall/pretty v1.2.0
-# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a854b85675801362cbdaa2 
-SRCREV_pretty="aaa765e7476acb0028a854b85675801362cbdaa2"
-SRC_URI += "git://github.com/tidwall/pretty;name=pretty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/pretty"
+#       github.com/containernetworking/plugins v1.3.0
+# [1] git ls-remote https://github.com/containernetworking/plugins 38f18d26ecfef550b8bac02656cc11103fd7cff1
+SRCREV_plugins="38f18d26ecfef550b8bac02656cc11103fd7cff1"
+SRC_URI += "git://github.com/containernetworking/plugins;name=plugins;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/plugins"
 
-# 	github.com/tinylib/msgp v1.1.6
-# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b486e350b4d105da6d8b 
-SRCREV_msgp="205265da651409c54677b486e350b4d105da6d8b"
-SRC_URI += "git://github.com/tinylib/msgp;name=msgp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/msgp"
+#       github.com/fluent/fluent-logger-golang v1.9.0
+# [1] git ls-remote https://github.com/fluent/fluent-logger-golang 5538e904aeb515c10a624da620581bdf420d4b8a
+SRCREV_fluent-logger-golang="5538e904aeb515c10a624da620581bdf420d4b8a"
+SRC_URI += "git://github.com/fluent/fluent-logger-golang;name=fluent-logger-golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fluent/fluent-logger-golang"
 
-# 	github.com/vbatts/tar-split v0.11.2
-# [1] git ls-remote https://github.com/vbatts/tar-split 80a436fd6164c557b131f7c59ed69bd81af69761 
-SRCREV_tar-split="80a436fd6164c557b131f7c59ed69bd81af69761"
-SRC_URI += "git://github.com/vbatts/tar-split;name=tar-split;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vbatts/tar-split"
+#       github.com/opencontainers/runtime-spec v1.1.0
+# [1] git ls-remote https://github.com/opencontainers/runtime-spec 06252546d1cabcd924a5fb3cb0177178d5e3082f
+SRCREV_runtime-spec="06252546d1cabcd924a5fb3cb0177178d5e3082f"
+SRC_URI += "git://github.com/opencontainers/runtime-spec;name=runtime-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runtime-spec"
 
-# 	github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb
-# [1] git ls-remote https://github.com/xeipuuv/gojsonpointer 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb 
-SRCREV_gojsonpointer="02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
-SRC_URI += "git://github.com/xeipuuv/gojsonpointer;name=gojsonpointer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonpointer"
+#       github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20230306123547-8075edf89bb0
+# [1] git ls-remote https://github.com/AdamKorcz/go-118-fuzz-build 8075edf89bb034603c758f28fe93143047ac5677
+SRCREV_go-118-fuzz-build="8075edf89bb034603c758f28fe93143047ac5677"
+SRC_URI += "git://github.com/AdamKorcz/go-118-fuzz-build;name=go-118-fuzz-build;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdamKorcz/go-118-fuzz-build"
 
-# 	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415
-# [1] git ls-remote https://github.com/xeipuuv/gojsonreference bd5ef7bd5415a7ac448318e64f11a24cd21e594b 
-SRCREV_gojsonreference="bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
-SRC_URI += "git://github.com/xeipuuv/gojsonreference;name=gojsonreference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonreference"
+#       github.com/containerd/nydus-snapshotter v0.10.0
+# [1] git ls-remote https://github.com/containerd/nydus-snapshotter 8ca9591ac87cd816783d58ce0c07f6747b9f1282
+SRCREV_nydus-snapshotter="8ca9591ac87cd816783d58ce0c07f6747b9f1282"
+SRC_URI += "git://github.com/containerd/nydus-snapshotter;name=nydus-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/nydus-snapshotter"
 
-# 	github.com/xeipuuv/gojsonschema v1.2.0
-# [1] git ls-remote https://github.com/xeipuuv/gojsonschema 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927 
-SRCREV_gojsonschema="82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
-SRC_URI += "git://github.com/xeipuuv/gojsonschema;name=gojsonschema;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonschema"
+#       github.com/distribution/distribution/v3 v3.0.0-20230214150026-36d8c594d7aa
+# [1] git ls-remote https://github.com/distribution/distribution 36d8c594d7aa4fb0b9b927fb1edf4171b36f361b
+SRCREV_distribution-v3="36d8c594d7aa4fb0b9b927fb1edf4171b36f361b"
+SRC_URI += "git://github.com/distribution/distribution;name=distribution-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/distribution/distribution/v3"
 
-# 	go.mozilla.org/pkcs7 v0.0.0-20200128120323-432b2356ecb1
-# [1] git ls-remote https://github.com/mozilla-services/pkcs7 432b2356ecb18209c1cec25680b8a23632794f21 
-SRCREV_pkcs7="432b2356ecb18209c1cec25680b8a23632794f21"
-SRC_URI += "git://github.com/mozilla-services/pkcs7;name=pkcs7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.mozilla.org/pkcs7"
+#       github.com/containerd/stargz-snapshotter v0.14.3
+# [1] git ls-remote https://github.com/containerd/stargz-snapshotter 6ee6fa1a88df6ea098f6b7dddde29e33f09d5331
+SRCREV_stargz-snapshotter="6ee6fa1a88df6ea098f6b7dddde29e33f09d5331"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=stargz-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter"
 
-# 	go.opencensus.io v0.24.0
-# [1] git ls-remote https://github.com/census-instrumentation/opencensus-go b1a01ee95db0e690d91d7193d037447816fae4c5 
-SRCREV_go.opencensus.io="b1a01ee95db0e690d91d7193d037447816fae4c5"
-SRC_URI += "git://github.com/census-instrumentation/opencensus-go;name=go.opencensus.io;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opencensus.io"
+#       github.com/rootless-containers/rootlesskit v1.1.1
+# [1] git ls-remote https://github.com/rootless-containers/rootlesskit a2c596ff9b3fddc0c2becb38f2ef4004f15765b5
+SRCREV_rootlesskit="a2c596ff9b3fddc0c2becb38f2ef4004f15765b5"
+SRC_URI += "git://github.com/rootless-containers/rootlesskit;name=rootlesskit;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/rootlesskit"
 
-# 	go.opentelemetry.io/otel v1.14.0
-# [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 2e54fbb3fede5b54f316b3a08eab236febd854e0 
-SRCREV_otel="2e54fbb3fede5b54f316b3a08eab236febd854e0"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel"
+#       github.com/rootless-containers/bypass4netns v0.3.0
+# [1] git ls-remote https://github.com/rootless-containers/bypass4netns 8175487972621850933a7bd6c6924a16569ba435
+SRCREV_bypass4netns="8175487972621850933a7bd6c6924a16569ba435"
+SRC_URI += "git://github.com/rootless-containers/bypass4netns;name=bypass4netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/bypass4netns"
 
-# 	golang.org/x/mod v0.9.0
-# [1] git ls-remote https://github.com/golang/mod 69aa7acea306dfd277ec48fcc687ef8fa0f2bdb4 
-SRCREV_mod="69aa7acea306dfd277ec48fcc687ef8fa0f2bdb4"
-SRC_URI += "git://github.com/golang/mod;name=mod;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod"
-
-# 	golang.org/x/tools v0.6.0
-# [1] git ls-remote https://github.com/golang/tools d0863f03daeff79ab917de5768285bb077f77b20 
-SRCREV_tools="d0863f03daeff79ab917de5768285bb077f77b20"
-SRC_URI += "git://github.com/golang/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
-
-# 	google.golang.org/genproto v0.0.0-20230306155012-7f2fa6fef1f4
-# [1] git ls-remote https://github.com/googleapis/go-genproto 7f2fa6fef1f44d4d1e9f75b0eff784d1466e53d7 
-SRCREV_genproto="7f2fa6fef1f44d4d1e9f75b0eff784d1466e53d7"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/googleapis/go-genproto"
-
-# 	google.golang.org/grpc v1.53.0
-# [1] git ls-remote https://github.com/grpc/grpc-go dba26e15a07f43875ccf806a2dd6cbcbc1c12eab 
-SRCREV_grpc="dba26e15a07f43875ccf806a2dd6cbcbc1c12eab"
-SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc/grpc-go"
-
-# 	google.golang.org/protobuf v1.28.1
-# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 6875c3d7242d1a3db910ce8a504f124cb840c23a 
-SRCREV_protobuf12="6875c3d7242d1a3db910ce8a504f124cb840c23a"
-SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=protobuf12;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/protocolbuffers/protobuf-go"
-
-# 	gopkg.in/square/go-jose.v2 v2.5.1
-# [1] git ls-remote https://gopkg.in/square/go-jose.v2 3a5ee095dcb5030a9de84fb92c222ac652fff176 
-SRCREV_go-jose.v2="3a5ee095dcb5030a9de84fb92c222ac652fff176"
-SRC_URI += "git://gopkg.in/square/go-jose.v2;name=go-jose.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/square/go-jose.v2"
+#       github.com/docker/docker-credential-helpers v0.7.0
+# [1] git ls-remote https://github.com/docker/docker-credential-helpers ac5992b5f4756fc0398a7d0c93c609e624368bde
+SRCREV_docker-credential-helpers="ac5992b5f4756fc0398a7d0c93c609e624368bde"
+SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker-credential-helpers"
 
-# 	lukechampine.com/blake3 v1.1.7
-# [1] git ls-remote https://github.com/lukechampine/blake3 bb7ece4161ea910c6c385c17799b17d658075fcd 
-SRCREV_blake3="bb7ece4161ea910c6c385c17799b17d658075fcd"
-SRC_URI += "git://github.com/lukechampine/blake3;name=blake3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/lukechampine.com/blake3"
+#       github.com/containerd/stargz-snapshotter/ipfs v0.14.3
+# [1] git ls-remote https://github.com/containerd/stargz-snapshotter 6ee6fa1a88df6ea098f6b7dddde29e33f09d5331
+SRCREV_ipfs="6ee6fa1a88df6ea098f6b7dddde29e33f09d5331"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=ipfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter/ipfs"
+
+#       github.com/containerd/stargz-snapshotter/estargz v0.14.3
+# [1] git ls-remote https://github.com/containerd/stargz-snapshotter 6ee6fa1a88df6ea098f6b7dddde29e33f09d5331
+SRCREV_estargz="6ee6fa1a88df6ea098f6b7dddde29e33f09d5331"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=estargz;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter/estargz"
+
+#       github.com/containerd/accelerated-container-image v0.6.7
+# [1] git ls-remote https://github.com/containerd/accelerated-container-image aabf505074e0a31879bf004ec400c659ff046b70
+SRCREV_accelerated-container-image="aabf505074e0a31879bf004ec400c659ff046b70"
+SRC_URI += "git://github.com/containerd/accelerated-container-image;name=accelerated-container-image;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/accelerated-container-image"
 
-- 
2.40.0


