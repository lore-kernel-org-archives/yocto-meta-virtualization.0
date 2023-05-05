Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D9CC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 02:28:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18235.1683253702106178442
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 May 2023 19:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nGVYMq3/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4489daff9e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3452SLLd018577
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 4 May 2023 19:28:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=2vu7+/RTshz6fCgNOdGYfb7Viqp4sssInoKH9xh75cs=;
 b=nGVYMq3/akWr8COY/hJEmRQDln78fje0jZTA0j0LJSZvyZ61lrJ7wPKjV+WL2Y3CHl2w
 l0v70WAnD2x69ZmYEE6Mmaf6n1rwvS/NqrE3NFMrDRSCXSbSotQWU7u+WFpg303wXjKo
 KNz1WsOJtYRMpAOS0PRJobBUZBLAnrD3+oPCNjrPSXIhgu6EflY+zyNC4GAdFBh6fZkP
 Y4laMhwHKKscG4AtAk+8ddvBWThCRIjxcS/f6fI4KiHS9KhUzt0T+GcHMeKpKNrLvzcs
 hyoL5ZPWJkYwlK3XbsA3xCj/9tAzRmKjAuNdUjsXFs/AXn/aOaieBLhwW2ApkiNL7eIN eA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5n9dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 19:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogKFPkz9WKqLY55RCGJ8UQKq7S/yGqu/1k79bAjqQYI20pfkqNP9HR4gGIDU6RJ4icgkmwjC+XaZJ/a2yJhIuEg9bGb3uIxXX4okOQ2ivATBib92pQmA687wSNpjmc4iAnZa+XjKMkguzxJCqOB7+oh6OZhFGaOCY4YsCyLCcpJ0lKHqLk0J9yvrg/bQjjm3YnucPBImMKiW1/yKrw56aXad+3xFGih+v65/jDaE7uRRBzqM6z5KftaEAhV3v5NVLX9V8bPnBD8YjDO2AHblHDfwctUfcTGCNCme0X31I/FYBowlH/4TrMcRTdI4RoZnHtlbkqD/h3qjmu1fjK+3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vu7+/RTshz6fCgNOdGYfb7Viqp4sssInoKH9xh75cs=;
 b=hfA/M8R7cnYZC1xetyLNtfOMMxCyr9RdT9GkkUQ8w5xKtVK0pa3lF8Wo8bdIaWoAhtDtjBvFwuQKwStX8yn4HMex4qxPYiLs9MSHDe5FNZfbe2fd+nZTCympr0UYtj51d97wipPZmFoFP1UFuh5r/5pk7IhUjT6yHK7eebo4YM4sVFa+QfH78ZFaxF6woHaNyJ9FP9Yu8vI5L40o54c7pQO3maYDyN9L3Moh+nGcuBroYHeIsQzEAXBlmEu0Vbaa0BiclSBBGd1/N2B6sjzAJO3/LGnHuMUcj1M6KgLiZFlpqICiBB0aIGdSfbcixeS22d0GpdhyUIlhvXdA7s4qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 02:28:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 02:28:17 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix package QA error
Date: Thu,  4 May 2023 19:28:01 -0700
Message-Id: <20230505022801.3072200-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4c63d7-0f53-4877-6ec4-08db4d106262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q3nqeZ+vu2MrA7TWHS9yT+2uhZNkyiDuP9Edj25gA3BokVNeWNylfi6wBRqpzeWlJUX4qsmiZnNyFt77/4GPsuaGfF63JaFwVA7LJ9zIHDdVBeSpRvrOMuqCgFzAPrxXKtbUxuxWyPG/QxGmh/WDaYacNFgpy07YEqleTnkdeEcvmBzsu2FwJj6H0qOo1EOzp1q1lBn5HWX2UaCbXhlDCV14DAlWiKnbOz6vMjhO7LBCw3zCGsmWX7yBs7PJW4+65aUWav5VbhNoJ20Ddrvplf+0R3GT52xf1+3CWSAY33EgmGmihF2Nyg4WA9Sdf9MWblcdgSLVDSEoM/iO1mODNShzU+yv1ZjC15Atcz0Mc9ANuZSOYRUlIHEqJXtiLcEZZIlR3+IckTaTGLndknoknG6DTKFVcUSucMnISfCJDsZfs1bqtP3/gdx8kLmv/DjhIyh2NbneouH8xzM6DR7lG1AKC0luXfY9VsTLpFS9qqF1RRWVCdq98fVh6BSn4r6f2rkDdJD+Zoham7EinWvwIRZOhMv0ynYtKaqXpXyzhW1VCYTI9rCCKBV6OhK5Yc2TbJS+/I8gYt5/WhZaH9N0+mfUK+RjUtaMh+MsICo8Q8bfYwLmAvaGpMKcQydQUxMb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(366004)(376002)(136003)(396003)(451199021)(66946007)(66556008)(6916009)(6486002)(6666004)(52116002)(66476007)(316002)(86362001)(36756003)(478600001)(83380400001)(2616005)(1076003)(9686003)(6506007)(6512007)(26005)(8936002)(5660300002)(8676002)(2906002)(41300700001)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fm0st/w+66AoJ1LLciw8nGAY1YB0R3Qr0YHaHPzVzesNQHR83j05Vs8FdKNO?=
 =?us-ascii?Q?SbjBKNsp1e5lLl/iybqPmzU6KyQ8ShptmvsaMivS/cwAKSGJXQkpxniydmYW?=
 =?us-ascii?Q?Gbq1fUg9IM+1kA17p5N+yDlaKXc288qVULb0xlk0Eg4iTNrklpiqmeAj6TR4?=
 =?us-ascii?Q?ZsRPo8woVpR1zL0Sd29GKwaJwrxv00ETzwc2QpF3J+xX9zKbe5ebO4qypxE/?=
 =?us-ascii?Q?Hj/UEcptaRxAhN0pHlrbX6zHQYkgM8YieJb0GMGj5IyTug+p6ZEO1YQNgmx8?=
 =?us-ascii?Q?x8VqTw/M9x8u6l4MUoP9Qyyi/XCDirLMEHN5Sm82SO1bPD8n/LgT6Fz9TGAH?=
 =?us-ascii?Q?j+4lUYH5MvuudCEDag3nv+NvbxmSmjH2hcux7Yden4HwdofYvk4L3p1XdFts?=
 =?us-ascii?Q?GjkiEi88lb2rTteh39TquwyvlQVsRStQgZMzgq6RCKi5BycmQyOy/bY/kug/?=
 =?us-ascii?Q?R9GBflS8A3aRzBUQ5zz3uMKlhx90DbC/wjS3jwvZw8qoGmSWkGmdRB8A0sa1?=
 =?us-ascii?Q?jR8EyMBki4XG9tHheKA33ZoCu4LzTK5JXyognGeu9AkszGvDprsQwwRuRRiQ?=
 =?us-ascii?Q?0fyl+cZzKI9KCBe+DAeqWeyzDpf9zZYjZ+ShVXXRVdK4d5GTDMBYQqqVTNW0?=
 =?us-ascii?Q?hLI0f/MacL0GEuq748lHncysrscZIy1PpWNT7mfLVpVFka57jqIHD3RCBZm4?=
 =?us-ascii?Q?7gX9X+Mv3kfZaUd0scJH9sd/Sr3NylfI51hI4gxqHktsxqDH5f8VOOUvTat7?=
 =?us-ascii?Q?jk+pa8iH92k4tM0+eTHKJ7lBdcQYzTTGYQa/6gZivMpEUIDpS6+IaS7TWRmo?=
 =?us-ascii?Q?n9Lnpuw4lam0GgYQLRrU2RJS/C11EVi7PcxYeYonfobySQ2xAnI1VSCqbO37?=
 =?us-ascii?Q?gRWio52syBm/iELKYMjX8SPKmGH5Ek+bjCjGVNB3octOUpRoHOD1kH9lyl0F?=
 =?us-ascii?Q?u+E6sgvQfaQZ3mBoQctRylrEziL8+LsKu8t3a1X9isWOBur8HWUF970RIq7k?=
 =?us-ascii?Q?O/Mo0MPW7ecRHWwVvTHdceJ4dNz0CRUEHdSxV4EnIXPE5nLFChccl91HTckO?=
 =?us-ascii?Q?C9/VRQl8ocGHDBkm2xpoyI2jYdnlgRTaDRNwnSR+LE27FoP9te0uyc6i/4mg?=
 =?us-ascii?Q?m/S+2LEHc6PYeE694jU2F/kycjp0Evwfj6skYqLw7knNnNdJUSluCrLN+d6s?=
 =?us-ascii?Q?ZUbmBP711iKqsJ5WOqGQjlKz3S87uds2xKyEgHkmurB16IQKWvDDUY1+Vw9h?=
 =?us-ascii?Q?WDFpIXMjqTSMaxjjReddAsBnpDUUCn2pdhvVQ+Awsa9L216m1v8IfnxufJiq?=
 =?us-ascii?Q?NWQygxAfbSMSP6Tjy5cBIPUsWiE7T8DgfioXjn5ai0hmweDfuCjAHid75ZjG?=
 =?us-ascii?Q?DF75MbOI8diyQRQKz/LQOHE5r/9vHZSv2fKZzejT6qhLBWTBlyA6/vTrUw4D?=
 =?us-ascii?Q?ienaO855xyBZzVX9F2OVJIrWVh4EdGTotxvQl1nhZVs90XxrhWNtDkycDcDa?=
 =?us-ascii?Q?2zzyNV25SXxjWvzWCbPiETgzKiOOul3pe9nYmZArFtgzRdJtbvGOl4Q8BQTu?=
 =?us-ascii?Q?gCUuGC0Yn55nIpZ5Qe0NFjzGYfd0r7Wr49Wb6+R7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4c63d7-0f53-4877-6ec4-08db4d106262
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 02:28:17.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rm04I7AyysDobv2OSBQrSYaF46KSqRxYnTK9eKke/jIyk5SWjGK6Mt2uXi1dQnr9Tocytnh8ayygETC+pz4Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
X-Proofpoint-ORIG-GUID: BPdMhlJJbv5HbB48nW72RphbgIaHkeRV
X-Proofpoint-GUID: BPdMhlJJbv5HbB48nW72RphbgIaHkeRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=660 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050020
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 May 2023 02:28:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8046

From: Chen Qi <Qi.Chen@windriver.com>

When multilib is enabled we can see the following package QA error.

  QA Issue: Files/directories were installed but not shipped in any package:
    /usr/lib/firewalld/policies
    /usr/lib/firewalld/zones/libvirt-routed.xml
    /usr/lib/firewalld/policies/libvirt-to-host.xml
    /usr/lib/firewalld/policies/libvirt-routed-out.xml
    /usr/lib/firewalld/policies/libvirt-routed-in.xml

These files are now packaged into libvirt-python in case multilib is
not enabled. This is also not correct.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/libvirt/libvirt_9.2.0.bb
index 98f0941..5e70470 100644
--- a/recipes-extended/libvirt/libvirt_9.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
@@ -82,7 +82,7 @@ FILES:${PN} += "${libdir}/libvirt/connection-driver \
 	    ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${datadir}/polkit-1', '', d)} \
 	    ${datadir}/bash-completion/completions/vsh \
 	    ${datadir}/bash-completion/completions/virt-admin \
-	    /usr/lib/firewalld/zones/libvirt.xml \
+	    /usr/lib/firewalld/ \
 	    "
 
 FILES:${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
-- 
2.40.0


