Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6577C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 07:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16573.1705648175481376217
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 23:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dr5GpO8X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1748b1ad81=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J5nMsQ016484
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Jan 2024 23:09:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=A9Z/oc+XzMLEBgXVzi
	+m82Wr7kpGDN1IhpCAGrQ7x2o=; b=dr5GpO8XSJ+zXy6eYeE/rvITtK0nML8Tgm
	ZBnezqhmkkLpUOTnZnyR5r34tjR7cxcqS8nqJZReLz6ujsJaNoJJ+wO4+cAZ/E+e
	dNWMfYmlmsXxbozqTC7ndVXCJ335j02DfxnmNv94fx2H7jI5RVSGfZCXqhvRfSuC
	7afe2qnBelRoSno5qFvrQO8DypdRUqXYLQrVXxK8uqnza69THk1GPqfAM7DGwTjH
	IhOIfXrsskJEg25q7I9R77uMJpg63qu1P1wYy5C0MLNctOfIh3LwFdqh/53zbsol
	HWnNTw8Lp8OhR1FGjzN1n02Lm57z9EQym4oIj5nA+lM8OEUqWj+w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46guy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Jan 2024 23:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ0Lub3+hAc7Bi23bx2zVpuKOG/5EhQNp96gjg05/WSM5+lDnmE4SngA9P8ndA6SL+qa1aP85AjoV77H5kZAU7T0/+1+hWzZDOv4xs/kbNvriedw/6rGkX0JXwcDtDOJFDvur8hgwwb1yOQWgXLN+DZMHF0aRMCIyPu+QcDm7FlW41R9onqSsDBZtXCFkfmtDHtTuCtL9Pxm37VrvwggRwqJfBNbY248+daYPIPR+bLzv8C3EHFX7OcuB7HOTt70gB1ztgfDMSRv8+vJejakR4vg1GYZII/yZLcAHeIXoa2JlSdkGOmREdVHYFNosJaehSRM+Q5upYU1TWkfYs5cGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9Z/oc+XzMLEBgXVzi+m82Wr7kpGDN1IhpCAGrQ7x2o=;
 b=J9hcICm7YrWR0WEONGyO1d05f153p4cO7lzcg2m9np54guavVnkUXgesw4MRXkdsIDt07gthRlXP3/lpIJsbdz1uDllUwetdIudBmTlAd4ku/gt6UNZBHb6xVajj8czJR+U1B0JOhjSs/wfVbfv2Q7FMrH03QgEpiAtx8TtapZMBQsyTzClnhumznQksa/C29rOl0W5FcQ50Shlg6OrXBzpm0qGH9fF+OlEL5iqzTv4oMRcmgM6mR++C2lNXI1V00mFirIHbXfwjDee70go5doMOri5YEfTAcqmrQjjLNbwPlv3eLrFe2+ngt8hLO+54/D9Hcf3utUZrX3gPZ8HNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:09:29 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::8ba4:4bbd:ce09:b53c]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::8ba4:4bbd:ce09:b53c%4]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 07:09:29 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] buildah: fix branch name
Date: Thu, 18 Jan 2024 23:09:16 -0800
Message-ID: <20240119070916.1243692-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e1b2ff-7ea8-42a0-347c-08dc18bd93cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uXZSXlZvbHmqgoH3YvtydeYa/WdRjzY+9VXXAxSA60PPBwerYy0yF9r9qwVm5QQI6wEfQ9jNZmMK/qhP1ngULHh/LYKttJWdUi4+RzIB8QV5rBTu9FEWE6sObz3fu9ibZIKU/NW985+MoLBpr/nSg1kuI1suo8GhS3Y99ZNLXXq2LdfMfyM2PShv1S7kbVB3mZjHflbZRMXEDCt6r9JPtHEUCkf/R91F5oX22O9RJNXTc0InD9l7g6x8qydgsCBkmwGTF+b0g5LbxcqyASAARrXLD46StYTZevOWHy5Wpa5OkoQ8XBw8yYESGAcS7qjW/H6ijJS0Izix3rtcJeXepnDGXdLjvKMqGXuNE1+8sbFKiHHbLGDilhmEmLb7itoNlWFQFr74fE2QEGFVOjirBXLSOsUzgcITn2YHljxheyQ+bjAEyLlvG6W2LdR0ShWVekxTOeQwMpJGHKq8ChQUwU4th302wFRdUuUAT25vhjnIBKYsqHlvIPv8M15r0zq1UtnHtk+tuL07nkcj7NUnTZGoKPTQgvATdKy+Vq2ie+QIjDvxmAxUXTKHxyCABnE/pAv7FrGcGSqFJ3r/LxEzx3dxA/PbYymoEDONlDg8EvekP+lUq2O9tQgRbMYIJQMN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(366004)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(6666004)(6506007)(52116002)(2616005)(1076003)(26005)(38100700002)(36756003)(86362001)(38350700005)(8676002)(2906002)(6486002)(5660300002)(83380400001)(41300700001)(478600001)(4744005)(8936002)(66556008)(316002)(66476007)(6916009)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H7sLzlq4b4KfVgWgzANB5TT33EuDNKCSD469d70Mof3PclzXcHQh1elx0x6p?=
 =?us-ascii?Q?BFMhj951jG0Ct+3EA5fVN6vyh578heKdogr5BhCsMXMvT1QK7C8sr3rbjObQ?=
 =?us-ascii?Q?7TzZIo78KPYPpZUdi2DQj2EFODn1GexZQnw6ktpPw+muO7HRSNeY73Njivcs?=
 =?us-ascii?Q?AbeY2e9WqhIzWCUlGTr6aeJll9YaxukMEiJKve6cuRdycQnb/s40uEyxd9Qo?=
 =?us-ascii?Q?IWKtHJVi5mQcc+kH44i3aPb0QbUFhVZMSlzAQiCUrz//ic8yKXdOpHEJSSvX?=
 =?us-ascii?Q?86BLNIQw9ycxQLBEVDVt01pbpC0sHfUMAyJ5t27xrhbj+XLQXsd6yiXlCfap?=
 =?us-ascii?Q?Wl7ktFUS9jjvVmkHLI4vxZypGoX2+Ie5imGXkUM57RkUJGcjmy8mkt7GqQVR?=
 =?us-ascii?Q?XWYvorQ5tPpGsauPSDIkFsmUjD9dSDgqFGxAKVHpdB8PuzKXtLGauXkYipUq?=
 =?us-ascii?Q?iDrKHDijGAPyr82Vq4sAZRWhYe/DbD4xrExrD0PCF7rSPM+uvRY7j33hIJKp?=
 =?us-ascii?Q?y1RcLW6vBlziMn07eps7fTKtRfk4Gr7Kd9RqKfXryrEpFk0qTPpzq03k86lX?=
 =?us-ascii?Q?j1nBSAzHdIMGo6DlBZ2a1yDW6HFwghYtNfxaezyxmRVYQLt26CJBHZ0vk8/n?=
 =?us-ascii?Q?OOXPK7ZbGOVnj/oe4N06GorbzacIpiVkDBxty11y+YY7UlVxxiN0ZR5dgqVf?=
 =?us-ascii?Q?piFsl3Ley0E12qkOkgnikvzRUcwLr4R+WtPdLWIvOZWxNe3di0rF7/4z2oSM?=
 =?us-ascii?Q?YiJntC4Ie5Vl7ipcvQrZEDfCQT4Ws5U/w5ptuDXW8+Avl7mjvq7QmlSr0jwL?=
 =?us-ascii?Q?eO/3ouXsT60xqZDAPc2OYEQfXB3KguRtpEcRw8cx1gtDlyjr654f1R1xisvW?=
 =?us-ascii?Q?RMHPJJVefjzUcVCsth+S1tkaZFOYWvYqHLtI2pN6TG+Ej6pUbVDL491QNR+h?=
 =?us-ascii?Q?i6z3EOJu8zyh7xsrDW9qZSJIQZGMlH9e8ZAvd8K9jBvj3CKrIC17MU+a09AW?=
 =?us-ascii?Q?hIATznOQBTkXILwcJM7vnhoSa8KuI9tXaPid2gqeIUHizuKrXrfg8ERAGniu?=
 =?us-ascii?Q?VsJj9MmXpqyrurEv0R4CGBfqeUySyZ7/7UQlgqd2zKOYwmh8Sufq+zAiicUO?=
 =?us-ascii?Q?wNdJNGWTUO18gqLz7qQSQHPnN3aIYJ8+177QFkyolBtB6MN1MN+fWW9vqO4h?=
 =?us-ascii?Q?xM+aVte7gbIfDqXGo0NBdLjr0Pgqs1VeRg/Q8QyKhDfvBZL6c2P/mVISrlvq?=
 =?us-ascii?Q?JnRiXq5soG3C9ClIcRTSef2lcioUQNWoZ0f8r7o9bjYQsnzsUi+gX6d/+Mbh?=
 =?us-ascii?Q?tI6yvBcbZG5QOYCN8E3mwBGuHVBXRBxDhJ/byFZHcY8JRYlLBcKCI/oDycEt?=
 =?us-ascii?Q?a2QECdeevCUJ5wYoC+3dVTiz3X+0KrO5kvx5Vdh35/L5kCG31NtotIqXQv5l?=
 =?us-ascii?Q?OeWadPAAu9xERiWxt3wi0YFOmEKtmC+WMsiRvvMv8QQL07KrCEk0EGTa92JE?=
 =?us-ascii?Q?nd5Uu1xSfcgro8xmCC+ro/lor9zxZJ5Z4e7QNpTxtOH6qsQYbzeexCWUsNGl?=
 =?us-ascii?Q?Vs3ToivIQo5oWA03p4avtzMyAnmpKM5h7CABMOYv8fouetfTNwsjdqlvzAcK?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e1b2ff-7ea8-42a0-347c-08dc18bd93cc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:09:28.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7cQhhqZfOIORNae4ekgJQfjg28QLhXY+QQkU1oDzgfBuqTghfshO1iq1V3lnLrCkJMlECbKxFI5eC851ie0NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-Proofpoint-GUID: 9HPE4POFtPHW8nQFN4JIXUHSSqkZ25Gm
X-Proofpoint-ORIG-GUID: 9HPE4POFtPHW8nQFN4JIXUHSSqkZ25Gm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_02,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxlogscore=712 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190021
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jan 2024 07:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8546

The branch 1.33.2 is not there any more. The correct branch for now
is 1.33.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index d3ccc920..f04adca9 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -32,7 +32,7 @@ SRCREV_buildah = "8be6786d5ed1f07387acdd30d52fc07cd1b4bd0f"
 SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 
 SRC_URI = " \
-    git://github.com/containers/buildah;branch=release-1.33.2;name=buildah;protocol=https \
+    git://github.com/containers/buildah;branch=release-1.33;name=buildah;protocol=https \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
-- 
2.42.0


