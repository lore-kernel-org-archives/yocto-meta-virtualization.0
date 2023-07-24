Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D952FEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 03:16:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.40281.1690168574660580406
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Jul 2023 20:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M8JwjekP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6569a436ce=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36O36VJv024297
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jul 2023 03:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=nP0SVpxwOfVTW2H5ZT
	HJGjFMozDi7BiFzz4Gh7rrwn4=; b=M8JwjekPYLkSFjIpR4HzIQne4dVcCDYa8r
	g5OkDukTuPOMZIyikLVjYk2DKjTEX84XlSwFfRwLBu5V6d9xj2ecy3JoWX+KLFKY
	i5TsmuvN62kInPGc2d8JRmtKMAds/o7NQsVlmgnUxfpesTexUlFWylmBR+FJlW4u
	NsuAuA9RUAgyWIr1G9w+K9NJRsHqo4j/mrjsoze3BBtqjfnwpq8qIub5lkGcB+01
	sQ9AQUtRBx8pi26ipA94LYjYPmVZlRQ5wDh++RQ92Kt/gJAaPkgF1ePDRAXwTT15
	KoMkYTEbVXMiVIcRLvnDky/L2S7NNN5ZTq5XkRaMWFVDQjY6ZQ/w==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78r6h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jul 2023 03:16:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tau68rj5IYlAl48l6/Vqffa4s8lUhotlwsGuj9ZjqqajQMypR5ClQRmZHMby+pCHQCbUGhIG+m/mng9nwEDwQbFeJjlWOwO8b3sfWGnTX7+TcXsu0I7PptLv3Ws4gmDx1bWLKVx7IDERKCaT82EM76QKOznNp6b38m7b6rB82yvmIBcxLRt65cxVRmPzbhHb33GxA//0hcYg//Y+YZ7CTUKnVVahjvWyJ/3ZrL8yUWkkHEgXBMIKWxLa9R7hr5Mc8WhQhMoKBlFQjClwl7xZ0cFKvoqv+4A+0/OCo1ohuKscam4vvA6cZ1MMhKydKLdFoTmDnTV71MywJAq8CxI1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP0SVpxwOfVTW2H5ZTHJGjFMozDi7BiFzz4Gh7rrwn4=;
 b=DwnkSqfug6vRshRDB4mBEnm1MQPqmkSAk+eg2Hrny7jw/AlYgqP5oNxO38TgX+QPDY7dTOf57VTpbJ6UL3Al7zhQw91MeTEpegKq27r6Qh26Fts1L0vs09a/Eh+18y8ibN2KC37FXgw5I8XFMO/4hwJlqkAtpWRVBwX0ttlBdqF1dTnDuqFnHqot5bvNMxE1S30DC2Y/5xctVMCsTh8PvhhpCf1M30sQ0+ghUHy9uif2U+iSaT66R4dZSHSDuP14mfkptQep8OzjJfWWhlAP1CP+Kripm41IcPWkf+2JvG70dmp0l3Mvk6DM5EhEOopkmit5I1CwmVnsnceR1/yJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Mon, 24 Jul
 2023 03:16:08 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3%4]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 03:16:08 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] kubernetes: set CVE_VERSION explicitly
Date: Mon, 24 Jul 2023 11:15:48 +0800
Message-Id: <20230724031548.2485517-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: f5898fe3-8833-4f78-cb24-08db8bf452bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yMZHT7W+o+eI4G5r+CKVsEGGd+VgGp2Q2pMEm0Qq9V7rPCtRHQXlSbCstiSt3Map553jWQy3mcvipgD9fR3veVk+AltFR6CH57SVxeeu9WryTLCpSg4ANJ8CkUSTIqRlACTb+ipqxcjdHx/L5l1MQCuirqB/np1Twff630N8m/L8EGR4UYGiQjixIbqMen51EdMRC2fSA7PFcZIF5FM6DPL2JJfbQELOKW2q28rBw1khjfgqt5Xk3EGqkni88dXfjFQbdJjV7mVLOHN5vmnmKL5bsM0YQRlED2UsIkaNLS2+VS+1zxteDG/6FqIZ4X0TNIqpON7Ngo+GPToaCMdHKKiLynkb/v0PnrvbAvoSgGUEvruDuEm84rfe3bJ9LJ7vCzNGXUSfEcnT9SudksvUaZAD5p8riygYmxNaLw0nAHUXhR3iVjFDRY8nw/Asd8uW+h9GUpl9rcMq0a/A5EOHtv0jkGdCJoLbW/GxGzJsNHEqI/ohdvrj/8G9DTYFY//53BCZ8xxmrntgkvmKe6pb9pfCNQxNhlwAODTN0WOs7+Zz1FT5Rb2ZEUp3qaOh7qwAzfuZ/+4ahGZ1/K4DbgL3rnOgKMMjEkj1tQA0Q27uZxzrCIHLH533OZn95FUIK4q0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39840400004)(346002)(366004)(376002)(451199021)(6916009)(8936002)(8676002)(66556008)(41300700001)(316002)(66476007)(66946007)(5660300002)(6512007)(9686003)(2906002)(2616005)(4744005)(26005)(478600001)(6486002)(38100700002)(6666004)(36756003)(52116002)(1076003)(186003)(86362001)(6506007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FDngjVYMg3MZDWXnhkZWdVBGSLaNhXp+CSRJJJVCRUvMH+4b7OlzXk5zxzz0?=
 =?us-ascii?Q?tPmnmvA6l/R2qUqBw3qqGxO3F2xT2xtdqIw4NcrTUCwFmPkX9UZhP+SLptm8?=
 =?us-ascii?Q?TGTVn60zghAjRy+piCLJaYAk0o79Vy4c/oD3zf4BBVskqeISNTCMb+1jqPyT?=
 =?us-ascii?Q?e9k6S7lzsuYcCjw5MYcaWixq3RW0aYjUG2r5ybSTbZIM5n/wIy5/Xdbb+rsM?=
 =?us-ascii?Q?f4gC/HrkHxs7YPRF6+8Th/Jwb43vp/Ktkp90BkwR5oGZnU++deq5v9yN52yH?=
 =?us-ascii?Q?/APHc770NdPYIga5HvSBAfZe3zj7qh53ZPHAnt8AirpFMO8Z77IhscqCJxQk?=
 =?us-ascii?Q?dEMKa+YDtfCSUsntXm6ue076YU3UTKo2nXGnKfK1lhNBIzI0JMs1KOMU8kdJ?=
 =?us-ascii?Q?2KogTrdgR1nOER+esceXm4HcTQiT6szEz5eDdnqGnSvKKkwuIQF+C0baYsbs?=
 =?us-ascii?Q?HWrKaVULD+VdX+fKBK774TGIwqKnZKz9k/w1qtNyxshRWCLbkeA/3c8Yjq34?=
 =?us-ascii?Q?NmoEAiQn3NEXVwz06Cr9Yv6wPE5tEAczLDLQ2jwmEQauCSHGIIF8B0iA0/RF?=
 =?us-ascii?Q?i4jAC8pG+WKRvWXySPapq838MBN5qjqY/aJ5nqsZxsoqNM3QLEPAQ+kXE15A?=
 =?us-ascii?Q?NPZkR0BSftDuNVdUAGazyuf7jBHiWH4/QcuDoikYvKk3dGhOGIDIce6pDqIG?=
 =?us-ascii?Q?bMAVGhHxm6dtW5FpdmGgfKxl8YwJFJDwGjHVwC3HiRVzK6S/hbpYEZ5e6c0W?=
 =?us-ascii?Q?x8lxMatkzxQS2Q8SdxKn/j+ogzycXh55NImfp0dNzW5WpAf5ubRJ2m+K89oK?=
 =?us-ascii?Q?qilnXFXg5EWUSmJMmtv4J5IQ7R2LmOqavGfGXPSDdbEjkxMmJmdq4v1oXshw?=
 =?us-ascii?Q?xJog+i99PP7gwWcj9UUYPOGF0FjQputWlC0jpdnTCFJKICuXohKIYnlkd1sd?=
 =?us-ascii?Q?dRylS51bsWx92NP3jJzr9qjUl2xJOXSr85F7B1JXIUiku0BGhYk4y1uDCpRl?=
 =?us-ascii?Q?LCyw0W1xbva/T1h8ehY0tjQ5jzhk26xiT5RCoizScI7A5ZR1B5JMgow3P112?=
 =?us-ascii?Q?f3ymWB1WzaJQdzzPgTBrX/t1WJxaLTs99fzePT18KZHobomQ8ZlQ8E6VMd1z?=
 =?us-ascii?Q?0vJb3jfR/H1LBKgxBbFO4aQh88GGxEFWl3QAyTW71qSwoWrNhIg1pg1Or+Gy?=
 =?us-ascii?Q?vtD9+K6QTluOjXyk87AIliDRtYtalzs4lcAVlJsr34DUz6lg1nQZzgQIOLND?=
 =?us-ascii?Q?JOU0XSExZYjBWWJZJQAdRfzZ1JNIcseQzOF1zfj/bZFyKuOR6c+op1sgz/3s?=
 =?us-ascii?Q?egEf2PAxcreIsVXdKaOWThEurvMggw4nvsMjxNW5gtKMIOTFHVdAq/iYTeZW?=
 =?us-ascii?Q?uZ0jV99oJc5yVlcRn2tVtbPHr4Nt6gc227QOJoBVXRORnFzNfBKBqjpH6FV8?=
 =?us-ascii?Q?Uq2xtispkIvZQRW0rmeXvvszrTCFYjK0iYj2CtzxnfAGzCDayuyL9W2QQnSj?=
 =?us-ascii?Q?J0+4A3ZfL3yfnTlvptizVN+8JcDSkUyg8TbH5xCAiz1xoG4Hm+qsLp3/lDYS?=
 =?us-ascii?Q?wnmLljZnk84lQT6+4rG/p01i22S4wA5cfCisELHz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5898fe3-8833-4f78-cb24-08db8bf452bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:16:08.3318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/cP1GB6PlOl53z9v1OXWxDX4k3c8cZSSC7aqujbezXzmPFklXS/RExtDtn63RWTPY4H7Ug5eoXZwAmNKT9G1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
X-Proofpoint-ORIG-GUID: 3iRJJRN-fzZO_u3RWIzFTNUsVJb_mhJS
X-Proofpoint-GUID: 3iRJJRN-fzZO_u3RWIzFTNUsVJb_mhJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_02,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=596 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307240028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jul 2023 03:16:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8130

From: Chen Qi <Qi.Chen@windriver.com>

The CVE_VERSION defaults to PV, but in NVD database, there's no
prefixing 'v' in database. So set CVE_VERSION explicitly for better
CVE scanning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 8b7c9e0..fefb2c1 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -6,6 +6,7 @@ maintenance, and scaling of applications. \
 "
 
 PV = "v1.27.1+git${SRCREV_kubernetes}"
+CVE_VERSION = "1.27.1"
 SRCREV_kubernetes = "2555e0f90e80a13628f47eca5cde34decc89babb"
 SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE = "1"
-- 
2.34.1


