Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6962C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:31:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9595.1716975108849820947
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 02:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6879a5a475=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4U3oP012698
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5m0bp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXOUqZXPJq6yYyl83G54Wp0niOuWS62x/XjxTa1hiG/zPE27lSqhEz3c0itGPCK2tXY7GESEYKEa6NyyijLqgVrX5xfmGKG0899tCgC8d3LYK+4cr+E0oxAAegrF++tXzIZ82YFgC0KFZsXL5PR9sUjKyxXFZLJqcHNJT/WmTyqLcYMlkm+Jd4GWp1UwIkgFafQRycOPrVnZtvlbwYXdqCmWPopSVuIVYNlHP4E23LkRnnDoy5UJ7/qy47sTOnVGtqrwa/zk1jwXe5IG/iPejPL6oKv6vcjVKAcckVFw5Ke9rtz9UuSbt7qd0dPI3t+f4YX8z38EfQH60DGyV5EX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bo5GOxYjE+U+puVLw5casH3HQLzDOlbblUVwRuHpKPk=;
 b=LwHf6d0F6Xi+hcqy3aGtmdcf6P7eie22AgJHP4m98QTnHG++GqzmebQwB+2lVmeIaznCLpGS5T9MGdIKwDBwg9R9oBpYZwXLy6yzH0bQlLic/11wSIymaqUJXewDPbWRWPkIxw9oVRoNwaJnlImXX09d9j/IivwDcphKkSHIxtDLE2L26RaSoCDu/M9l9PP6+wX9VlaV80BMlyL/asMLFtXFhS1qOoQaPd87QY/5ftKJB/9ocrofQ9MpE6+XLZWLcODndNv4Jsem9SK4fmjqdXS+EFOgkXpNrRn7p30C078e2VAag3i3pD/Rd5dmfYGaMwAMQeCiIc8kZLJ/0AT7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 09:31:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 09:31:44 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/4] linux-yocto_virtualization.inc: adjust path to kcfg for UNPACKDIR
Date: Wed, 29 May 2024 02:31:30 -0700
Message-ID: <20240529093130.72277-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529093130.72277-1-Qi.Chen@windriver.com>
References: <20240529093130.72277-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e97a991-c59a-41dc-7643-08dc7fc226cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tOphhgsg6bMgcd7zrp65zu6B//4f32LZ0mwMVTGlaI6A3+nrXwGw/+fkMBap?=
 =?us-ascii?Q?BjmYU2tPoK7xg76gqa1478+vOkji94Y5UCoqQqzihgtgEjwJ/R4QAPeBcJOQ?=
 =?us-ascii?Q?6GOzAtSNw/J5OAnoVabDLib6+vAidQIVB1c9/YmM6WfbWrcGomgyObHo9SoM?=
 =?us-ascii?Q?perzEcKQXnptdUeFYFm7EUJfrRVmZBW09qqMZKi4GDCTgvIKI5Q0a0vhT9jd?=
 =?us-ascii?Q?mEYUokF6UG5xiPpoFtAcqzfEeeg/YipcxEPR2mqfntZ3jLC6byRmeq7+nB8+?=
 =?us-ascii?Q?oWeCfywYNm9vKw1j1dKU/4ht6SYf7TMAhIIBkaejq7W96kAEXjQ81/qNsFB5?=
 =?us-ascii?Q?k1D416BIBt2IhA64lMVHv1B1NI4XngNY0mPKC6+PVOkUF9d8oX55SvmvZZyJ?=
 =?us-ascii?Q?1fMYylGoQ1MpKu2qdoQkUL6ebx12GZRd6z+wZjHY/BbD4gMGfc5oFBy/UgGK?=
 =?us-ascii?Q?DTF6cnwrsBLfiuqMuD63rkY5xpzKkNnHe68geENkriyxUuW9SRzBod1l+UFb?=
 =?us-ascii?Q?yUSPZprKppbO4nODWvTsW46ZsBZC1WKk5fiJVYJSI2IDXRB4CQyKmGb2K2yl?=
 =?us-ascii?Q?V9BD62JBikH/tulr3a/lZWqMnKyw88AHoqUEfdfyveCI2QUkbBXylPKD8v+l?=
 =?us-ascii?Q?Dov4Tcykhma6Ba7DgIAL5D2baEzOFLI2QS4iK2VoYcgXafVP63TlsczACc+S?=
 =?us-ascii?Q?aDna30u84mOi49qJWIegC9HYLWWhv9/ODnLIFSJYKwWiRCkTxGRQKrtznaP1?=
 =?us-ascii?Q?BZFkTGhwspO2bZwbAo4mH8Rf/WXDlHEMp92xQRW0ADRLUehlJBhRkegkb7Y8?=
 =?us-ascii?Q?rqXfsV04NsNi8s/ZQ8ZERXqSzp+ddbjRw+gDDBO3VlrBt3VlNRSUUmdvjrGO?=
 =?us-ascii?Q?oSP0AOe5k+Ernkd2ay2d7QEltbtnuZ7iTZ1mzbYRMvmYOXjYb8+tQErYHZHT?=
 =?us-ascii?Q?aSl4Hj5Pk/Eo8ndt0qhtMyTsCFOY7jrdHzumGEaMFVjFKOW2IMikwbIE7Ix/?=
 =?us-ascii?Q?hAFyJ7jS7Kp9RgcTI0UUC6HXEoIrujcPMe6eixKD5S3B352p5FeK3JxLKbbF?=
 =?us-ascii?Q?D6upt4J9VM7yftnQvDMeGdBQ2ZKA1DS4FHkIaOyywHU8KNee7U/lzyjbaeRa?=
 =?us-ascii?Q?7R62L8pA+YiYSD/+0Z+6iXgNyppeYwVShsi+QQH1g99JgsosV1ix+MA3ott4?=
 =?us-ascii?Q?XMLuCK1YSAogAvqpcVhOY4kim9EMYvIovkNGoqwT91ugBbk+3LwWVwiTYRks?=
 =?us-ascii?Q?10qSVXD+dcLch8lysBE/4giNaWt09Ki3+yDmP66wfQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RxajQyLdbq5FKtkhUiLO5jQtCh4cmggeQ3rLWtIp/9DvZ4TsY0S0M6TNVi0I?=
 =?us-ascii?Q?WX/MriNu7OehPSMoPQLCC4HZ3UwpY+u0BoSVvIY2OamuFwDKi9q/x2e52dgz?=
 =?us-ascii?Q?/PAHrQsRJzHDX2ihNNwdWtoScMgqeRNCOBOYFqKvZP1Zk9ZtcmuHUwALb+UI?=
 =?us-ascii?Q?mzeLXBCqjNjSdlwaDg0uBIt/H+gxic7dM1tQIq1vtnzbHm5zl0INUfh8ZDkd?=
 =?us-ascii?Q?puNJff6x+wh6EYsT/o4uITlyNmFaVLpjRXIw4tVH900YKc91l2mvDfw36DNS?=
 =?us-ascii?Q?bgoMtrXkwDesa1H6JY3XOhD3dGYATrzDwXkuLk1CpDh7cu/w/MQNQgI3Uyup?=
 =?us-ascii?Q?nzF9vAXvheAAk17WOo4xeP6D4zIvrcMd7IkBaZ8kZbdNGY1QVob8J+4kfckF?=
 =?us-ascii?Q?UGTYzkwYyg3pOUjyt/TB5HjML59bjNVSSEMc8Hy9WMG8ZWUGUAqqJd//ZTQ6?=
 =?us-ascii?Q?AkPxQQ0neANcOwKsyD1fXDXdmf6icQ4i/S/FXmcewSXgaVlE/eDL10zOwrmQ?=
 =?us-ascii?Q?k4lvfJhz4FSIMHsv/WCkUVR/0rhHFiD/GlsMV9er/IFzhcDclFs/0XcGVwHY?=
 =?us-ascii?Q?RO6eqQXlOYujsjhUojP6vsGYVy3btG8iHi8JEXsxgTbqB3P78sLigU/xk1G6?=
 =?us-ascii?Q?EHHxMjYZeaRyNpXNs9EsrEdtl1jg/USt1DiTPmQJyoRyjLDcfQRaxsjnt//K?=
 =?us-ascii?Q?BhWhS9ZzBTEadlGm49kl9Dt3467kXXcEftM/J2U7cliLXSljbq9XZNdipnS9?=
 =?us-ascii?Q?Mxwe43zuNb9SVN7We+oPoR3mbR89FOiwnyZe+9OcNShEmDw9HRquqZQ3Dfjt?=
 =?us-ascii?Q?MPYkWxSjAXSRE180Kg8R7XXhP4f+dfYzTG9c783xqlgB9K+shV3QzrRhHy9H?=
 =?us-ascii?Q?wBHzITUbXADHdYMtJyH9BJ7ZxTPaIUTrimuEVmWTUBDJpolTaUiZFSUz1t9f?=
 =?us-ascii?Q?iIkbM7Zrl72lHQ5YAuRvYhBF4UC1X3sY7KcRCeBRU18uQZ/oFGSG1VtZ0tD9?=
 =?us-ascii?Q?Fz/oC/8AOpCG+Es+GGIX1r0KVAG5U+NqRFDKq9rHaRf6v1JYBdETa8mNcpaL?=
 =?us-ascii?Q?rc/hnqYZ3Qrz7KkeZg8GSZAg/tuNPymJB+USZpsGxduly+T/vcFpy8vbv++W?=
 =?us-ascii?Q?ef2O9br39xA1f4viMG31BEJlwNX8yAS7qGXrhmcV52JZcMC26ZMxojRpZg6H?=
 =?us-ascii?Q?X7n7FiEws5isS5P/CLjsCRq8iNtnUJvytfLYIzl37tYntAKl8GFkqPBRXRU1?=
 =?us-ascii?Q?swU4Qo8DUMBAIJ5iImxiSkfKr9fv+ytwmwowciPkTi6h2X57MOmpUTwiRyg6?=
 =?us-ascii?Q?wV64sb+cA91bdzXbf31gP59GQfIk9MgOmYo7Q6Yc+RLiFDBuiYamNz44NeY2?=
 =?us-ascii?Q?Qta9c7jjRzJJ1xUUBudc6Tuzizk7QhNw/IFugTxIxPE7tvJZcQs5RQHqHY2y?=
 =?us-ascii?Q?H17VIdkkYkzNmzcdhfYXyvwRRAKvVEQNub9vZk7WhKz20J+v17LQlpgVmpSJ?=
 =?us-ascii?Q?H0cwIEn+hUXrFjlHw415gKYY2wnk5C9ZiPNv81CJuQZCx+SA/FxFoZw4Erl5?=
 =?us-ascii?Q?lOuBFeZ475pDHpOR79Eof3KRUaF6GsbFzDI8Pg4e+dOty7qImxfc+LNCXF3q?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e97a991-c59a-41dc-7643-08dc7fc226cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 09:31:43.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYxNwoQZiMFz997+6SMl5o2UwltvGt6u7V8a9tVVFsxCHnkkVfn1b9dQx2mi//St0mD/DCvambty1ZDZqNBWMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-Proofpoint-ORIG-GUID: FCRTlPfLKZsIFE6lgWYK8RicNNx4Gpws
X-Proofpoint-GUID: FCRTlPfLKZsIFE6lgWYK8RicNNx4Gpws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290063
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8775

From: "Martin Jansa via lists.yoctoproject.org" <martin.jansa=gmail.com@lists.yoctoproject.org>

* UNPACKDIR added one more level

* this needs some more robust solution, but now with UNPACKDIR changes
  this was failing in do_kernel_metadata:

| NOTE: do_kernel_metadata: for summary/debug, set KCONF_AUDIT_LEVEL > 0
| ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found, this will cause configuration failures.
| ERROR: Check the SRC_URI for meta-data repositories or directories that may be missing
| ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772680/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index 9a6554d1..5edaef94 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -21,12 +21,12 @@ def kernel_cache_cond_feature(src_uri,feature):
     if kernel_cache:
        return feature
 
-    return "../recipe-sysroot-native/kcfg/" + feature
+    return "../../recipe-sysroot-native/kcfg/" + feature
 
 # no conditional, just use the yocto-kernel-cache addition, yes
 # the src_uri isn't used, but we may need to check it in the future
 def kernel_cache_feature(src_uri,feature):
-    return "../recipe-sysroot-native/kcfg/" + feature
+    return "../../recipe-sysroot-native/kcfg/" + feature
 
 def distro_cond_feature(feature_fragment,distro_feature,d):
     import bb
-- 
2.45.1


