Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15444C25B08
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 21:03:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.8019.1660597386002639531
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 14:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZmgiV1J+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52262ea844=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27FHZCDw021312
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 21:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0gRjmDIdA3X7lg63vLVlqq659i+dQp5ZII7xzBUbbn4=;
 b=ZmgiV1J+oj6Qg7l3zdE5Wl3lS47PA7G4ZczjQssJvrVQQaQ5GbKCrALShkieC7oY4Di8
 3SFy5L8Jsfql+iRfNR9s8ZoL7C8VkPR9uBHfWAd/SnPJH/CtUR+LbrdwGy1oVEGrdTxZ
 h+L0U3n7m6WfGNCDaKrvCdAwoFN6q+/lBvYK+m/KFxdWxhY445bjbovVJBGeeSSt24Tx
 44i7qmf80j+UcsBAjFrZ7GQWV5nEJcLQC/tgNA9wBVHpvJ+NyLMltoS+ZUcE6qZDsD5C
 CKTpmyeYmURZS7On3xfRhlgjQHRF13VWIPkzBDpSOAD907BDba88cuDnA78mm1IFW06B bg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160t1m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 21:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/RWKcQBaqk2YjxvcRc6AJw3y1U+bB/iNkq5NT0BNbPmuPPek7cDqNACWVqMmKm/hqKpQ7wyN61RmDm4yXEMC1iUa79RlccIFM3q0GwTCeq7tVyL4BgGTe7fQ5O0xsmYQCpeMsZAg8pnMgQCWjJ3LDmvWx2U35cfpUu1KAN5cTFBxV49YSIEPGyqAqzUhRoBBNZWIeHYztDtr1FHrBa/ukvshRnxievedLz0hGCOdQpIBbk86ChUlN72K/TvocD7ab/8tYoMUOmYfiWGlPkUT2p/ME3wvcd38sFYB+4JRxhFX7/N/4Kj9wRnFfLuUtN3nBUoNrwOQfUKxlHWEmnzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gRjmDIdA3X7lg63vLVlqq659i+dQp5ZII7xzBUbbn4=;
 b=iOb24yLHOuLuvoaqvlH29O4h8pkeiz0AY8+gN+VF43rxP2f8uVNNWl/lwLS/k46ideby7xSaacBfqP22tQyVA01Vjh5f1yb9jUKvftYOknkJVhZIliH/rGOipc/6aoIpgrJskgJ2d0jXl+2ParXmsAG0XL2t9UQu7pewd5OfUcQMBd99s02r4IufGYJ0bGmuiD6QmFzYvXk3nPTgAF/opFREOEHezIWZOh02ND0o4mNb/mGzeP+M6d9fJsnFV0Jcav5t4rrlSclCo10e70POHKIRado7llO3b8EV7vUnRQUrR0BtRuSO+V7pRy8nqafDwusSNK6ait9yC6Zxq9xMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 21:03:01 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 21:03:00 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
Date: Mon, 15 Aug 2022 17:02:43 -0400
Message-Id: <20220815210243.25546-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::29) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82e56f10-f948-4b04-72ff-08da7f0189a3
X-MS-TrafficTypeDiagnostic: BN0PR11MB5757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+xj1YhVSB0d9m2Hh6CUe9GMq1q/JQIe5qk/xIZPZTgDxd81ZrVVGI0YSZ5T2/LP3nesvqVrq8IEjT8cZEpPPuux429vauAAxQf7wC34ZzpCQnb9G6kB27HvHr+DnDQYWzMFW0WSZ4RxkoTA1fgHOufJ020qb+1JGrNdD6KyZFAlnN9nc2zz7iHU4Q8WAuwecteexAzn7X+siSiuibcLjHPtHwAR/sMGtAfCLo7qxQjTt9T+uQH+soKO2CpDOp74+V+1I0gPoJ6kFrLmQkdavzhLz/z1QO5WnCKnSEZLtBHN7eUk6lvuYwX+oBV5xG9H/euwSY9FXU1N2meoPjjY/BN8UU9MRO0JMLw3lL5ZOXslcMEmcDNMLGGHWYgCG5SlWggOfvdVJKAPQTh1FY1ugWgWXaR+8LZoU6T9Jd+y0nLw/ey05ShyDkH1F4VTjSQounrz/jeGOa3vc80sYuf8rancBjc0CHS1EqbUbvG5bbrQM0JqMSBGikaO4c+hbOAupo5CQMxAtfYaiAjPQ0D4XtBF1HBQaIetM6Om8WeYKlAYx6gYs4Mz9E/guitc1NEoQl9YSwBK5u35PC3p/oyNKkK4I6wqP4S30VHe0LNFnPPxO1aIuJINpVsXir4eDoJPx/xaR9vz0y1cNcxIZVDAijnkLfPeqZahU6m0HJQYZ3cxeot657LZs+kDV7/YGFVLgdg/kIvOFA++iyPX8/JyPY3usjvVJF9OvzPixr4NWn/zCe2mWZYH8proJPq5wbbrMk2b/NpkE04mhJvKH8Yjm64sDAebTZoysdyMqDS+ANS9XPuy2f3hBR+l4kwKV0LJyfxmy6eH2DajSYKipxcoCSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(6916009)(8676002)(8936002)(6512007)(66946007)(66476007)(66556008)(26005)(6666004)(2906002)(52116002)(41300700001)(5660300002)(44832011)(6506007)(478600001)(186003)(1076003)(86362001)(6486002)(2616005)(83380400001)(38100700002)(38350700002)(316002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?44bXfV9niU0eKQGi2xP+Ca+GJuJxABBIccwsPLpMJ/avftdRvsebcsXbR1m/?=
 =?us-ascii?Q?5IDsPRGDtX9PA1O+4RhpWZNSdgXwlymj/suJUuPu48/9fJZYSQvUB1XGW5/a?=
 =?us-ascii?Q?E3FZLQQgNm71v9bb5CBWZxSCLlB1F/9ITUKtNWxe3/YCUi5MjNMK7xmG+Koe?=
 =?us-ascii?Q?EVaGuirjCnZWw1/5Ebn0NnGZEJZIEYFdwL70GTDcadzA38k5xMVQQDBXwody?=
 =?us-ascii?Q?FqE83FpoEdYhRfPmzto3VzhvYV3FSIX/8MWzudjxQ5YTh+DbC21JrOTqS5ej?=
 =?us-ascii?Q?zQD53mlM2E+sn8tByRMPEI7AWAorFdyjbTVyKSdoaupPvNNXOen2GGepTK4S?=
 =?us-ascii?Q?bZDO+JWhzYCuhdFOjwboj+vJw+MM0pPvMxjqh+JweYTpMM35dBANgITLESi/?=
 =?us-ascii?Q?fpkvFQqVuVMPBc1Wfseo+wWJWgUnvwGtPsYTU0MXIz6jDC2QX83htX/OPXze?=
 =?us-ascii?Q?9Gohs1H1H9rMRecSOlWf1etRusZ6u23mUBhXxhtnVbryMHWPYeos8aNSN02Q?=
 =?us-ascii?Q?54JDKrx/3k5tEKXc+WkktTOyWc78YRAScXIbIRAYKXEMUtIVYXmTRPf5vBqK?=
 =?us-ascii?Q?DJ5hkFH62NxkWpSOn7njHqj1XALvtmDI7FbvyTaDcp9SvaRrgvdrvVrt/RYW?=
 =?us-ascii?Q?go3xZe2pE5YGbsvlATDWp5tqXH5hcCRPOfT3EpDyQPn9cQAu18fAfMh7oZmS?=
 =?us-ascii?Q?RmjD5XhIE1K6Y1V/Ax6UtJq23YVcT0jl928r0KXESyyyTLg9k6OJ3v5hf+mt?=
 =?us-ascii?Q?0H34C//ROpp6BKrA6BuIUVYSlMemOCoAjJQMq/lAmwh8Hrbb/bdwNi6WLiiD?=
 =?us-ascii?Q?jDX8+1ftH1kDzY9C/paEzNGGMJMskXmyCjf05/t6hy2CGbkc2YMcUKGOGgsP?=
 =?us-ascii?Q?rLExeMPH7N4P6mBywZBMWlpf2wvvgRw8/bOt5McNAsaR15bfPkQWE7UHrCwY?=
 =?us-ascii?Q?1OwOallKESM1PKyC2TEGM4hckndDKWqkLXPi5bxNdWC3gtrUxhCfiV3vKBn8?=
 =?us-ascii?Q?XNbhfvQhltVqebjpPKV8Ft29YUi7+LNoszEosPm9lBghVluQawqAn/GplWxx?=
 =?us-ascii?Q?Rx4YqrLWRmJX86IBGGzimwrbI8UBTXeZhUXRuPvD6P8/e4tYaztimAc3V/Yk?=
 =?us-ascii?Q?tneeeE+a0RA9usL8PswXTVGg+zXMYYgcYfK5W0mzwzFat2Fp9ylVmmMGkqtg?=
 =?us-ascii?Q?lEEznFu7jFV1Ga5Y4jV/j63b5IH5swSYzCkdiU3PEBpjic1tOGMeBD6mdnhx?=
 =?us-ascii?Q?2Fr4Eg61sAsx8mka4VV2EpNTQ043D2n4REQUuj5ImJ5+GIjjVKZioH3OGUcU?=
 =?us-ascii?Q?Q9G2fPZsZ1uR5vEj4gJUGb1AMphCDbU7OFGm+vo26/gQ6z8709s410GU2Hs4?=
 =?us-ascii?Q?efd6wle2UaxGgtNTW2gvs8zZtK6CUaHUNyYw5TGKiBPPsn139giHmzpVyaLp?=
 =?us-ascii?Q?PngBPap5K/r/QOCB3lMWxYcBjpM4hZoREYbdbnyTwmRkFEvAnpxUVwKBvP4R?=
 =?us-ascii?Q?BFydKUzCA8XuACtyuPygXQ9bSR+3nct1A1D0Mm1jtWmQa7kLn+MjcxR9+XHo?=
 =?us-ascii?Q?BPyO0ZLgXlhAkSwhiqbWkhWVNZr+/SOvF4eLMz6vsxFWK/n6JPSGXcw9q2sf?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82e56f10-f948-4b04-72ff-08da7f0189a3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 21:03:00.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p1WpSOyZqCo4CSQwNMryjG1ahR+Q+eTM9qEl1a4ALGZHDNeSn4dES9fGbjb5f9qCcfn901asYwa5l8fzRBQDoGGnuazaGBU51Fom4OkigV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5757
X-Proofpoint-ORIG-GUID: YWbzEkJnrbC9C9A6yLUxHd1RtJUi9rjQ
X-Proofpoint-GUID: YWbzEkJnrbC9C9A6yLUxHd1RtJUi9rjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=629 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Aug 2022 21:03:14 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7523

Upgrade ceph to latest v15.x.
Minor upgrade containing fix for CVE-2022-0670.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)

diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.17.bb
similarity index 98%
rename from recipes-extended/ceph/ceph_15.2.15.bb
rename to recipes-extended/ceph/ceph_15.2.17.bb
index 17dbcf3..9fb2e72 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.17.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
 "
 
-SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
+SRC_URI[sha256sum] = "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
-- 
2.33.0


