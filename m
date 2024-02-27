Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B654C54E49
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 05:12:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6262.1709010752953266248
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 21:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CV0toiAi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871b5145=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R4t2t8005128
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=oFRfhK19NR6/ZSpHcCbT+nagew1C663Rbc+LbL1QwGg=; b=
	CV0toiAidjxCaqMJlovUtlb1UhR7NdCYFaY2WMGA+WRsKLrp3rE1L+eumHTm/FOj
	3brVElT421tTIMeG+Kxczu8bnS6Dilt4SPvGq+YH4tBEdrEViX4k+p3TDz10Eaei
	fzT3jzki0pDMa4iiOFUM/WO1CzDzmvnMkuQnyuQKGISkc5BZh10ugDRRo3pDxIYj
	OPsOEiIqN24itskzC3nneluj7x+GLDmG6dQEHcVUfXZ4Gdqy8Klpht0adG4jpQdD
	Syc1TWQ4aAOz9PhpnZhEiWXWQDVfN1bf9q9tPR/ZtJUdn9hxPVUci3jM6FXT0C9P
	pqLrR2fuayYZzkGwnSdzSg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42heg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaM+6o1Dct3wzSAi5QPSDZd2tNSpHPhuWeBtc+ucIgUvkUo6rUeRnStGigBFLgSsPUN5r0ahCB/6ykI72SQ7wvkSFOzXv0EGbjiX8O5nz+wWnC+UqoO5Mc4L5THyCwGOMsDMYZhZKgQmumr0/deXMlRNukhnHDoCnQu4thu2LADaFGH696TyHbRjBWWI1t9nXuaeTxiM6EL57t/dDfw0YD2203wNI/JJATp9eE4Fi1F+MHgYGKCGUeio5NX0qrSz7wypH7eaQpLZ+TCVX53iVmXJ0IZfgd9Z5nNICOPFoDjXCLDqiklov705vjnD+rrlrvojFrD4DosDgHHsVWLyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFRfhK19NR6/ZSpHcCbT+nagew1C663Rbc+LbL1QwGg=;
 b=cVX2LgmkweS9Y9b+M5ra9uJePecdmYLUgSY5rMMY+mU1784HGKha9rg/i1MYP6HioiMAMXZsmRLXmC4q+nXYRct3hSEWuQ3A5k/Ac9zeT9Y6/lccT0yTms6gtcZcLc1dN85hg15VuFWMXu+Wq+t6yCMx82smjgS2izmoq215PlIUeoNrQlRABmT+SsXozUNG+0z9ks2uids6IgF0akAeCACszugzKH7snLaNagZKylbejllDUg6k98BOqeYW8TeHSLSISdHgSm0W8B/UG+WAdXEhuNNAl4NTgO5ysyBe4xUMjaGO+f92mK/I0tkbaje/1Pn0PRWXRv07MiD5EO1Xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Tue, 27 Feb
 2024 05:12:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 05:12:24 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/4] crun: remove unneeded deps
Date: Mon, 26 Feb 2024 21:12:09 -0800
Message-ID: <20240227051211.3390256-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240227051211.3390256-1-Qi.Chen@windriver.com>
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fac7339-dcc9-477e-cceb-08dc3752aedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oIFXSxg+DYd06EZXjMyksfMR0THZSUb3m3ba4LdwRqQM3UBvgETjgOba4KLUJWYmyJzUKMcwaOcOcsktRBe6jm/HdCibWWy56LbnY0Cv4vPdHXUGYa1EizzRzMB7encD04jsMwyJSIpd4eI1pPZVMLB3mxQulRGijw5AQEPYPGvduHIOVeRXArMVVfQFwzlkcHdjYc7FJx0AWvAqXQRDR5c3ya1Ic+WtKd4URiTyKAY/nPq3i41dopH52Z4zqh9zvthK8+A66aktIaL/+O9bzgwwHhLQVCh9HkERTs79i7yI19YcMhwFGCdKhckZOk+cOkVN2RPllJf+E0izzWa+q/8GOebhTPZI/L6xOrA69ZdW87czaCUD6vO1VbkoHgVglARQPCtbTjeaOjc3OSE19uKRSES5Nzu+NIeIAw4lfZ+/vhMeK7Jfk8FMlaeusR2GcMS73HSASOlqFusuradkneTXYuhWX/VZq7XfW7dRqLYBxTaRptzzrzxb6WaL7NOa3Ne6Xjl7HrMoQJ0EltEF8crUqqYjAJjh4fTOZlil9aEFeh5LDWKVeTdUksvw2JLgoCjSEI8ZwQRB/+LEy587BRplp26jXhw7z9HoKnmpLx6bMaOs9fI3Zi160GWLGCdriEdqKjLifMakzhI8jjUIgWh+HmOVUjzOl/8zf/8ZjlwpYBQ4z4hMMGLxSKjBxTfXVyiBo2tNcp7WiiK2MgtCRyS1ZLjakHCPZT3fdvPxkSk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oa8y8t3/cFY34gLiflZSs+tqz8gz+5wHzP9/q2iesXkSXvJfDYTuXu4D3RE0?=
 =?us-ascii?Q?8aQRC76WiqyAoSTCvg4ZbiL5WzZGgPsG1pLEeikq665Nl7aTNjzIsjRNM9Nb?=
 =?us-ascii?Q?gVeT8EPOgyktLYs5wuaNNTBZAAWlqxNmz9Q4jbpyaA3SHIQ/KUDUDll4Qdiy?=
 =?us-ascii?Q?OgB4ii9BCksDJ7QRyyOJ7hVoj3TMOaSANsZS8iXN/rJTouJeM62AtTV1nnDB?=
 =?us-ascii?Q?5QZET2GXZsJVsK6+3foTmaWb7MarDq/gM6YKGIpM+QMIyv9Y79HyQHtKbcEm?=
 =?us-ascii?Q?3oYuCbK+PRuoO5XEXI2W7+M9Py/Ywf7jK2aONB+juX/lSDlWKaRqxAchwLBR?=
 =?us-ascii?Q?R4FiMUCWKfWQazfZ4wfUH2H1GbOvJN73nZm/VFSwAjdaIfbezzv6QfWKaHTt?=
 =?us-ascii?Q?BwZQHEE09J4oefa3a/ZaSAqN/O7kwW+FvPPeEjEsh8XRr50apVYPpRpe7+ZZ?=
 =?us-ascii?Q?BYygllSWchZ24zA5D+dNaYqFn78ypP/WrF1KYNMUl+CsmaKEHh5qbNlosuXo?=
 =?us-ascii?Q?M5ND7LlqYbgZ08z+YLidbcar8EYoCoB1cBxX0YdW9wVnhNAxs2roZdsf0CqH?=
 =?us-ascii?Q?AJWyKYeWQr5LASRcnCYA8vHSv2Sg2g52+pso7pD4DIZxPi1+1tjZdDacppBK?=
 =?us-ascii?Q?H8TvrT0bkRvdRkLoG95uBJdQdzJKQwdGDKbUxyKI/R5d1B6k/89lk9vYLKIt?=
 =?us-ascii?Q?Qm6dBKcq+tIK6lf7zY4SCeFn2tKukFD0zRZzKq7M84BGmg7OvuzgCzwVCKmr?=
 =?us-ascii?Q?wVAdwfQ6lzntLPVONYziqnYjIC0zBdheB66FAtJ5l7QFkAknZyyjtx0vmLgE?=
 =?us-ascii?Q?hnb7WGCblbRaHwDww6muTQU0IvcggeqGmixzp+CzRLwyzIPb8TDfNZUp3oDs?=
 =?us-ascii?Q?hzFUU/BXFqVLrmrMRXRSdhRBlhKbY9NKbqjXjmdvGgk4RW+zMzRDZtaMWueI?=
 =?us-ascii?Q?7itto4ftWElKAvciR/n8jUmEIxOdVFKf0saU3/3kFrgKNnMlA7l84Oc4B/+5?=
 =?us-ascii?Q?u9JGhoYEb7p17G/AIh8kZai/RFeilrb4oDKLRJjl/LP525GtdVejlmqCs9YU?=
 =?us-ascii?Q?j4dAqoJw/7gqiBfqGoEHXphLRcHFwtXpe5vLE4UOtdH5UJ0RBY4XO1pCnm9R?=
 =?us-ascii?Q?B0ikJAWW3zqt6LyzIkIPUHWsJpf6q/CazevsEhOnqxsakLQY+8dHxvPbdhWM?=
 =?us-ascii?Q?c2OH7cC5q/02vdCeCK9PV/pvE3rj70QLY37Zez61GPypsaBHmAhCUkoqicx4?=
 =?us-ascii?Q?aLlJimBphnzzeLXnBDECHSFDMzbs6sYEItIqulkTx/Yz14BdfcpoBbxH9JHx?=
 =?us-ascii?Q?ahzjUUxL8aOT4VH/s3NqDvTnjtyHTDvUKzoWabuwn5mR5c46do2VlvnXSYRM?=
 =?us-ascii?Q?mDR1DiV7rJqXEY0eyXxhr3vAKpeSSqid/tWkbDH2kXUGx0RjfcwMZKIPDoQE?=
 =?us-ascii?Q?gpP8fyaq4VKzNkIVsBMzzvRovu8a8kWeacCPEavGYAR3LKyRPqyd349ZzeeS?=
 =?us-ascii?Q?kzoNmiQmpjg/cemX/MejlUtIGl8/Vsp2UobG4l+LLJoWvAxSbu/xCSqz2ALa?=
 =?us-ascii?Q?XWcIWvxxIUmAOCYyiVo3n/kEtsMSd9NmyLighoB9waekzCz75m+aO3JFB3P4?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fac7339-dcc9-477e-cceb-08dc3752aedc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 05:12:24.1924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlMqaf8d4aajAXE9qT0QbH8aSYd5707tmOLZZBp7F9t6+W5uV8bdxZwbRvwswULR8D9ZxA7nTWwJ3OqJNHJABA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-Proofpoint-ORIG-GUID: mwzeoJpl2ihs_7m-8O_k4xx96RuRuaTC
X-Proofpoint-GUID: mwzeoJpl2ihs_7m-8O_k4xx96RuRuaTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=738 mlxscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270039
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8584

From: Chen Qi <Qi.Chen@windriver.com>

These two deps do not affect the build result and are not used,
remove them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/crun/crun_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 77126a1c..7a6c4797 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -30,7 +30,6 @@ DEPENDS = "yajl libcap go-md2man-native m4-native"
 # TODO: is there a packageconfig to turn this off ?
 DEPENDS += "libseccomp"
 DEPENDS += "systemd"
-DEPENDS += "oci-image-spec oci-runtime-spec"
 DEPENDS:append:libc-musl = " argp-standalone"
 
 do_configure:prepend () {
-- 
2.42.0


