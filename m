Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547BCC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:10:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2546.1676365801762362655
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 01:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iBJVoGfI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14099f99b8=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E8LuHU012315
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 01:10:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=tT3VBQO7LFtFNC4xhIsDdQW4wnQCbhtduj4E8uy/DOU=;
 b=iBJVoGfIz5P3lKPOtwOVaDU4JyxLp66jHGZayEA8dCTGa1CAg7D+hiReLa9iw1Zq4tzH
 yxJ+7dBxu2bzIoMIlDPIoGbKnmipLMkMyiniBPH9QQELGYteQSxvRv38ZXTaxQAI1F9Q
 vLqXTGqRHultA1TAxibUxADE9zI1mkiM5TseYW7FjRLsoS7ZRYIiHLIWvg2R7v2Pz5TV
 /e/UaoIKevqjJmHXirJ3ADcui89dcW8FsuNlOA2F/YgGPA2yyUM9WoFhTKK1XuInsjRd
 y63lFb23AMrWMlD6jB9dDRNFXPNCXCw7MHeuQOAEeV32Ryln9GMVajBE5tAjus9p+y5v WQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdrt5m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 01:10:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlxaQX0c0n0OPxX/9RNSSZ5Vs+K6o2w0uFtFAzpUELGCGnJjub7ghrTbZTgDj5gvzwL9KbKZCClRRnxEEuQ6Y9QcERLsNm/yBU1g0ONu534iQbjvw9Nws+jzXvUCc38qsZTIEE4DZYFuGdKaAlUsneNIA8c2Kp3pVB+PlOzclPxJHrhPG/cse58cwvCj+vdJ/rz90ynanA0bbwc9c7DFqqYpO0fr418AUkEUEsPDNwSAtRmAPj6T364+v4yLenAizoSR7ikGabDHALX0wAZ1k1IzrUVtq7dg3vU3COQfhDpM/ZJYfyoO7WSjIHTq25Oji8bYrxzN3iKwvvTO3Qk+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT3VBQO7LFtFNC4xhIsDdQW4wnQCbhtduj4E8uy/DOU=;
 b=g1O1sAT7Ii3KHOwGWwGGzQUqxksLJ21svV4dkFAQzSDdM6K8D799wPG5HYwQETw5dUjmjnSRL5MvmV+s23fHTZIX1CXzl56UhRal9PsZRQganA9R0zpUBmGdrOyyWMq//6wuTHsFt3Gder05pNGU6mDhs+ijiNk85mUBkpmUqgLATBbWf+ttJ+iHl248pkqbR/HVFvzbTch1u8fZlBkLy+kLF43UrLo7a6gC6CRVXOlcRfBmrDcZ5sjQUpIgKLUGCXJoK3Qp03NOpLgctEb5DgLALWvYDQd8KCN2CE5JMMhBppjZRHINveCqXw8ddCRR+k2y47eWUvew3Qv0QhDkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 09:09:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 09:09:59 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] containerd: update to 1.6.12
Date: Tue, 14 Feb 2023 17:09:45 +0800
Message-Id: <20230214090945.27228-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 19350078-7b6c-4540-bb4e-08db0e6b3f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MhIkMxRtFpXpFFSvLuXqeecHTZx/ccjSuVsu3HEjASNNzfkZH0+7UODUtKoDd0F7JwqLEQpBCs6miAHoxNI1KP54tFCDPCgSyhQRurlKbE8DJ6Rv+AEq60iPtQszdjZaT7G5bXYzc12o2JDj9X92r45aDYGbw+f/nZ1IXA9nLVkohj9lWCu9sGDtRYlTtfWAZJ8ehCb8ouIEGZXk2+VPZd2ZjnE+vbYOQdImcv80EfF7Wg+6OZiGYpV9kMMwvb59uYdJKLO0ViVgasrFzWTxOdUfRL1twKVTSfnPixxmTI7VtvG7HNypMl68N4NRw5QXNeMGBoWRz6VXSwtpJeE78lvrtlSxTwdQoXXIshK1wdxxuZNk0dAThliztjD08l39mnVwuja15Eme/43FHzNYI87F2ZdasFggW0ctSACxp3072pr85JU4wMqt9uvlr0V87AdHTIx8SidNd9ciOpqJxWxFB4vh/AIqu8u1tHzJ11bhcDQB1MMens/i+CpW0lMzjbRnzEf6K/oR4KC7d4PWPBik9ovzYI/fHIgMfEw/d7gu9nsGTZ86nkPHjnLKefv6Rx0CUdfca5hKqZ9OCdyzHJvGrE7h6zdh/DVAKOWoZyisXvDXQyIhuSdidCn2uT+qAxGNEREIPyEbp+8A8Hs49vXQPCsca7hEkm70vlYetFmHC4QsPBd+3/lJFCkJIc6xWk+acXUtAtC1aF0VolKOyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199018)(5660300002)(8936002)(41300700001)(86362001)(36756003)(2906002)(15650500001)(38350700002)(38100700002)(83380400001)(52116002)(66946007)(478600001)(6486002)(66556008)(6512007)(8676002)(6916009)(26005)(186003)(2616005)(316002)(66476007)(1076003)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IwV9djiTN20O6P+ZnZZhHLMzCFDb0uwDKqrLQvZ1yh7HlecGCH+GhcDE9ZKo?=
 =?us-ascii?Q?Hueg77tQvorfzVIeOtxIsZw0p7zdRshQQdwi8MbLNH+Rgq8A4eTGaqmsB4Tm?=
 =?us-ascii?Q?Fe20Od0Smj2RMHRyDe92eTDcE1sm510bCYQ5FifBm9mhptwHSACbGxk5Wh1X?=
 =?us-ascii?Q?SNHCoSRM2DQXRMhXDKc4g0atwGqP1UsZ2lwTEu4Z3Robj3B2Egn+1fhexTyo?=
 =?us-ascii?Q?D3BEZ45kOySKqTK3uN4A57V2ckqY6+edHWJmJscTZ5VA22843MHCheUxcIYC?=
 =?us-ascii?Q?1XPwSwqPZIsHX9zc0kSz0RtR+C1O7s+f3/K+iJGISvTcyc/l3shTKx+5FrSv?=
 =?us-ascii?Q?F1VM5JYVB/FBnkA4N0pJxEH9R4nP9yxEPlGZA5UoPTXEvDbI8x40QqkbjyD9?=
 =?us-ascii?Q?+EqnXb6LaHTXwqiXdUtImajf1sH4s9lEtlS4NiIBildLPq3QlFK4vKjYqE5g?=
 =?us-ascii?Q?lwRGpb0DJh7ir2j1ed3aKslIVK0r3uTMDQh7rsUX1S6aLbOIuXpwZLBdYscx?=
 =?us-ascii?Q?qErHIO67u74gIBCBA9Z3ghHbuPFaIaINfFJLkV684BagDqECr2Jch1VRh+La?=
 =?us-ascii?Q?1sDtV6rWDfC+VdJGKZ2+lp03Qr19S9dVwTehEIicAC0fdTnoxF9PCJnNUofl?=
 =?us-ascii?Q?zuTsZ81eH2yDI0BRXp+roBlcn6kPiysqz5O5fFYw0gwSbpunZPmC1+Oyjxoy?=
 =?us-ascii?Q?W37kFkYuFYGTXSERlHUEgg297akN2gPFMJBeHfl0M8r6RLRAFZBGiwjiDI1B?=
 =?us-ascii?Q?70lWmbIye5vxDz4iyPPdN+jUU3VBpyuU4qqJlDVgJfz/D5Y7MFFotMrY8g1w?=
 =?us-ascii?Q?31LgBM1jC0f+IiuAP/OixhhuNe7YiyYu9wU525/RY4u086poILSOPTua4X6s?=
 =?us-ascii?Q?0up8Rgv8SegKmT5zJC0U7MM40+mKbzOAlCsBRO4FOC1OMF1jj8KL54KixVfc?=
 =?us-ascii?Q?51GXabbugSaHTW3/CBR9XIs0/DyZcsgmCLGAO2t1do7Ji/YtxRhsiC4RYmuP?=
 =?us-ascii?Q?k8pFtd1/pVWaiY5CDlBvK61UN5N9Xg9orgGyMGRksJXTFZ3Xxo6XaYPGG/q8?=
 =?us-ascii?Q?FuVNFISY0Ru9pNJVBSPcmXlLkqT7ls13GY/edmvAziaYX/6mFEA/PW6kxFp3?=
 =?us-ascii?Q?5Dvu8Y23D6OHuUAvZwg5H3iKLxnKeX7hqaxUV4M2XztcD+CrmGhrLn3N/rq3?=
 =?us-ascii?Q?4nMAGO/QZsNZdLtM8jU9KG0vSxT8fM/Se+kC2dxlh/a24s04yZXVelniZe0W?=
 =?us-ascii?Q?5i3dA/7pYu7OvkZKBho8CZqaPkW44NhXnKMkPpeFIi5jqoX2J9wOKEVHQI/2?=
 =?us-ascii?Q?95LwCdk1oVK+3rgXkGYs7P0jz5s+t25gDt1ysdr+Z0jE8Z/n/8NzkBaeYL5N?=
 =?us-ascii?Q?QGLK4TU9R46oM6drPqm85NX+itrEG4hYYvAT/GMJUVyr6n9yRlWaRVyrgCKK?=
 =?us-ascii?Q?+cjobZV2FU22q2M1HF+5nbCLH84Oh7me3pF2Tro+NvFh8GtfNOxOdH0L6G+F?=
 =?us-ascii?Q?T6C+UtyTQzd6r9rPJurCuWHYXMHIiqGxgLRBIztqFc2JHg0ipC0cOQox3Na3?=
 =?us-ascii?Q?5I+erNmUHAHjFu9RQhfHaXX+TlvUIrbtjDsEGR1b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19350078-7b6c-4540-bb4e-08db0e6b3f48
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 09:09:59.1869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cj1nW0He0EkNU6x0BwHjBflrPfwCJ1oMlTbncmCXvYOmP8JVlX8Fa6uKbw2bhQJbj81I+k/KpfVITbrZNIQYuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
X-Proofpoint-ORIG-GUID: UI-F3RTO3uoYTpdnXZCOU--y1UsFkkVE
X-Proofpoint-GUID: UI-F3RTO3uoYTpdnXZCOU--y1UsFkkVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140077
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 09:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7853

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping containerd to version v1.6.12-2-gccfc27e30, which comprises the following commits:

    3595dd04b fix: check for tmpfs when evaluating if userxattr should be used
    1899ebcd8 Prepare release notes for v1.6.12
    ec5acd4c1 CRI stream server: Fix goroutine leak in Exec
    9743dbae8 [release/1.6] update to go1.18.9
    3d24d97ba Prepare release notes for v1.6.11
    bb96b21e5 fix: support simultaneous create diff for same parent snapshot
    15b541238 Fix order of operations when setting lease labels
    9fdf713e5 Added nullptr checks to pkg/cri/server and sbserver
    56593cca5 cri: add pod uid annotation
    8ec051a6b [release/1.6] go.mod: use golang_protobuf_extensions v1.0.4
    e639ecd7c Prepare release notes for v1.6.10
    5af8d89ce overlayutils: Add fastpath for userxattr check

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index e95ca175..5fe3e4fa 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "6c41694da9eb09c2f1f49a5a5fbec4e970cfb460"
+SRCREV = "ccfc27e30d9f599efe6a7471ea1932dedf2beec8"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.6.9"
-CVE_VERSION = "1.6.9"
+CONTAINERD_VERSION = "v1.6.12"
+CVE_VERSION = "1.6.12"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.17.1


