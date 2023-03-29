Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BADC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 21:59:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10665.1680127181756594372
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 14:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KLUfWI1L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34521dfe42=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TJI9Dm021672
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 14:59:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hnjfMgeUurlN1qAAN2Ok9NiamdD0UKbbk6U0yLFWpcU=;
 b=KLUfWI1LMvU0AgAlcUcGO3m0w5NC67qz/7wjW0YXg8EZOBEsE5/H7RprDOJyvBn9Elfl
 S3k0gKDuh9cA87go2YBJfaL5flhBIGv8zsaAnMU+1mlyyekd9tTr8NbfDQypijFjtC8s
 AAqsjzCjS/6PrXq0NXoq234fiYKms+B6FvN0fqs16kt10h34n1HgJq9ORrIGEq9Cyozj
 wvz2Okh+X3HYQIeTo1G77QdczfmaokellcBqCMfnRx1nz3k5sbNsaGcKvn1Mr2W+bjxo
 r9gDlSkS4r70/7KXsF1kOgxcpzvpHUEsTQTsQLewvD7RWw5k31RyUvAuVJXgRZSlNBgp jg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85w93j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 14:59:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2R0pVoFgBznbVK0YlG1qI80x95fpOG4WFxUX2Y4XgoZIcFG/kRniirtWTAX8+keMhsJMDAzNEu1APRomoXCAb0U0NSyF52Jr6g+Ht+WZGmqR7Ex+lqy+UHX8onGMX4fdte18q3Z4C4WBPQp4efH5UkEqWCfTi+P0zcz0Duusd3+f3Cs8Q6ow23BIE5CwBpUMSjhMxh+E6uzKzu1SHf3umhHD2+x8rqv1rt5LOy66LT+2OGYq8GEEWwoUQEZeQeUSPzbbOPyrpcGqQBeFoVW0HlNn+K/E3WqXC00f0fPbhsKoJgkpiTx2IzGgQs2b6eEFTZK0i3WHln0ifDysnPSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnjfMgeUurlN1qAAN2Ok9NiamdD0UKbbk6U0yLFWpcU=;
 b=BdKXqBN7KSYeUywMmrTOg0pGdMHK9bUJ9yxyDEyTwGgIf3YoXBUlDowUsatDBbXXHGBXRQ9js88nCH98Uq230ImTXqBXI7hwoWTrmuTFbI7s+q9aCJUSX3lyMX9G9faOAATEswsP2TkTnnbNqHt3TDWpNQqJmVT+zMuhvjG6WwCbu1VXrCH7nAqaPKswUD+7vPkBM3fzQbXeymvclF6JFGxHi+A/Oc1sESQoz20YhHpSDNEvW6HzoB4axhwhkS2scBjzkf7ctuuK6h+rtBCLRYhL1L1dvO+AYdXI3bdRNit9pkfZJrCauxkWHE+AsTepmkeiHElPfe+Ui19GheVEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM8PR11MB5656.namprd11.prod.outlook.com (2603:10b6:8:38::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.35; Wed, 29 Mar 2023 21:59:35 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 21:59:35 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] kubernetes: update to v1.23.17
Date: Wed, 29 Mar 2023 17:57:29 -0400
Message-Id: <20230329215729.719615-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:208:23b::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|DM8PR11MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ae3270-f9d1-4972-2541-08db30a0e216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u79Z2HrZrmGkjrRFJEFdfonD5Hfep1mkxAcZ6U9y5jyNZBuvV4Gcm0a/yYk1hDq38W5tPJWTiS3zZ1U68WcBchSuzxXumZuuDRjSGZh15i1g7vU9heMVdjxLu+s2jAKWDOwNogDTzxlU0nZ+FdW9ETQgIu5P+YyPO1mX1w8F84UTE1g4JtsA69ooOZgpoqJ1gtY7ivSioSIFWDDCJlYt23BazmIFH3PbJ136AsCwCTky7uxLbXF42IU21Drl7ImcNw6KdqdNxDhU9z1k2KNPff8kG7Irf3MlINyUvbGAyWGF688vPiBI9rXYKiY+SjuoVhbqGup3QJ7aX4QqGvJsRbkpWClUI8G7KrRSUhPmfNgIf7ULm69ntOzINEU6KswTPSTWZ5VvXo8Vr6SE0FtBgFCyBKycbm0GPBhinhkkeZlGh0mdfM5lP/CUxEZt/Je4D5nlX0Thw7IuZ0iXNX/KL5D6EPZIOgzRhABQy4pbxk895JeP/UY5YtfWvuszbjSvHo/72irtY6C7NjS8Vu29/vVltQyP5tOXTqaWP3LRr1ZFEx1g4TitdJnmncLNkDbT64awEKwF0gb6CR0ZYymsKF13k+Bf+IArYg5/+biNfq1OGI1g6yulKH7Xcq6oPr3J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39850400004)(136003)(346002)(396003)(451199021)(26005)(1076003)(6666004)(38100700002)(38350700002)(6486002)(2616005)(478600001)(186003)(44832011)(5660300002)(2906002)(8936002)(6506007)(36756003)(316002)(52116002)(6916009)(6512007)(41300700001)(86362001)(66476007)(66946007)(8676002)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wPgu2ZZenhnfthoKk84vsYUNgU3ND08wNEx1kH0zuL4Ym8xskOLTqLj++uNA?=
 =?us-ascii?Q?giKYteGE5YBtkwyPbaBQVqBAK7CY4Rt0WIZdZ6TzLV5vwVwVUJ4VFQHUfVw8?=
 =?us-ascii?Q?PfAfgFHx5Q805pwr4kwemlRengeLrPu49febB10MDUAwVnMmqKncX3Ujz4ge?=
 =?us-ascii?Q?MTncC4KjhXOwbVNl9svqGJNIxcW9JSUKTpqHnZepvwbnDPzPe+nhNcHbNQfQ?=
 =?us-ascii?Q?ImZrk/BtKjQE9i+InZEftUk10uUKdlK35w04NhYnBlkkEnDJYx5R5zJQCrJS?=
 =?us-ascii?Q?JfLtvWnG7sGimNX7OzDPsixEQDr6atU1heacLGqYLcBG2MlnSENGc+ipuyNh?=
 =?us-ascii?Q?wFBQG6bvZsCZ/KSHmrRasiAOBQCuf2IquzOOnjGF7QOeYGtIjnCZMDKL66xX?=
 =?us-ascii?Q?5GxwG5355STpO8Zcs+hnk+Ox1ShY7Kbzlt6M3c+L3knbwxmUC0eG/8jJJnLq?=
 =?us-ascii?Q?qM+i1vreZ1dy++J30QlADJAMVaw4PdwYuU7mb60u7kG6LdWpazoLVcbERy3m?=
 =?us-ascii?Q?gYD8N7tjmYzKtezOLUtU9hjz4oOEbi6fJThCRg92Ig9GV5anIoWxXNghtCI/?=
 =?us-ascii?Q?E3qdbpGoqLJ6zP2Cme6rUWFkKadArshaTc6GPMdV6l0Dyn7AqaefXP9Pg1R8?=
 =?us-ascii?Q?0PxP2QSoS95GzAplcuVz/GL0tbYf/CiL0ZtC/Mnhyjxk1Tzau+NuY3Mah4W0?=
 =?us-ascii?Q?0zKMNRVq6jZEkFe62oJVDdiVasOrZw8XTUzDfYPwixNxEbSj2Hq6U5KKzdv1?=
 =?us-ascii?Q?o+dHQtaKeiiRvp9rvCM9Y5Li2ELkOhA5JssKDqXukQ7G3qmdMLj1IqEc6hhj?=
 =?us-ascii?Q?VNhKaJU+aLCKDREvO/k9e8hTCIjbAw2zOAqXDjl61gPnT5aR/9Y6owKQjVcs?=
 =?us-ascii?Q?PjtiXC5mTVEJ7nSJDuIpMUaUGKpxFqXMP05YfvomJw4vJ1iapPIgZqHCcepH?=
 =?us-ascii?Q?2WvwdR+t2Is5iIbhkJehohx66Ocfza1u98YxJrkCX94GYv/QwkoOEKs1jm4N?=
 =?us-ascii?Q?pN5mF8qeECxkF9oa2wYbWlJ9LipHRfqwHkrzrI309kI3nFBaw8lBN0R3fwRI?=
 =?us-ascii?Q?u0JgNj2Guc9lv8GSgvamlfJ78rs3urqeP5uxguKJuMTtag2PVzpNSt/KaUtL?=
 =?us-ascii?Q?8UPeulde5Hat/EYVU1RkEGgmS6wc22zQ7QJArafm0SznPZgp7s74xO9OX5ob?=
 =?us-ascii?Q?wVfYfZ65h6hWU00cHaewoptmuHldx0FK3LQqHIF5fBCHpcg2tLVCRcwGrrYg?=
 =?us-ascii?Q?Riu5YwQ5y3i2unPYUQgF5zxb5B/Vpv2NI8zSw2pwQVi8dcA8vIoqgA4JzFIF?=
 =?us-ascii?Q?U9IlVGN2EDmmejw0KsuvSBAlbZ22Wix8DtvL/LPkTMa14g+n0sBEyAipgVGb?=
 =?us-ascii?Q?aklgSiySI9QMIgDWT3RT9EMXIU7OyKiHXElMtYas2+CVg8xA9IWxAiEyXbvT?=
 =?us-ascii?Q?5I9WZrLf6AhaLDQD/U+H8Z5+qD+6f2oVdDxZRHngI8TK7V/HksKxffrUZw6E?=
 =?us-ascii?Q?A7ZHG5jGX6pbXoHyGyxx9VO43CgSFm+lpts1nigc1SbAz17BdxV6dS28vuH8?=
 =?us-ascii?Q?YNA89EhAKWejpGmB7HsgOB4OzutxUbZihVsi2di0dUhHRusp04JAUTdfZcS2?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ae3270-f9d1-4972-2541-08db30a0e216
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 21:59:35.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u86vd7lYGwJ2FFx/GtIfErzOVZv5YSKZ0fKP9d1T/gZmLNwTVpYbNcAetk7EOL1jyJDhDBnLz75lkdZ8vmC8DKgKAhLlfxTkO7TtK2s2PM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5656
X-Proofpoint-GUID: CJU9iKciNPOrp9uANKKccCBV0aJaBmKt
X-Proofpoint-ORIG-GUID: CJU9iKciNPOrp9uANKKccCBV0aJaBmKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 mlxlogscore=613 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290166
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 21:59:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7966

Bumping kubernetes to version v1.23.17, which comprises of 251 commits,
so not listing them in the log:
  $ git log --no-merges --oneline fbcfa330..953be892 | wc -l
    251

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 170a938..f475bd7 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.23.6+git${SRCREV_kubernetes}"
-SRCREV_kubernetes = "fbcfa33018159c033aee77b0d5456df6771aa9b5"
+PV = "v1.23.17+git${SRCREV_kubernetes}"
+SRCREV_kubernetes = "953be8927218ec8067e1af2641e540238ffd7576"
 SRCREV_kubernetes-release = "7c1aa83dac555de6f05500911467b70aca4949f0"
 PE = "1"
 
-- 
2.40.0


