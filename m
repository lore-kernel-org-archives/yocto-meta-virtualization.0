Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E43FF327BC
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:46:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15448.1776757604572760111
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 00:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sSgLhXB/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8571ea7b75=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3b9LI709983
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 00:46:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gDzKEANkaIunD0QwPpTQ
	BAql/2LlPPa8NBV0GeSJ0k4=; b=sSgLhXB/0253BLjn9FZjeJWZmvMFuIUd3j8e
	Dm9CCEwpuLsprsle7UaxjowemaY9abA2C5+Gg8ABH0rGu0A078t1Q0HdMIla/4jV
	QSeVZft66otiPgKcRDOJjx1WImdKUQa2s2VSHL0/HSgtzhPihGJQReU1AEybLeA3
	uufANXzQJBNNx8lTZLHdsXznwxmtm3lHGtgUu7mEP0Hpl8dDvQsPiHfF1IGkdVIq
	37nv9iSM1AZNDVgbYCkwLaWrjykrUkFY6Lu7JsBa6vylODdU8JvexvF9ij5VYPgJ
	GxHGAtx/uQUKPPS5SvI3y96lMLWFKQ4qCrrM6B+EG+8bWHIEfw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm9fctt55-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 00:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYsULZ/S/IGlRalmm/h2RuvPfvu/p4MYLV/DyCEZg2itAu6zY/ilysNZHHQkMKZOTaOj8xFK/EkBYNtqdNPeuZiIVZmzTYQ4kI3/AD3KqVlHWJmzY4OxV2b1Nlon/nLFvOqPUwcrxJx8YT2Uzo4ef3+191Fdh8KJg4dCojSsm+Sg1HkXYeQ8lDQzXJtXSPgfjCZzcjFpcCvMAruhISCfGaU/ytEShbX051EozB+Bmpjp77xkBn5V7teykzZAZR0MqcjSCBOhiDllmd57Aw903DZWwZ56YqBua3wowTs9o3Ov2JsJHkEqQDxkIU5Wi9Pu1r9VUAn2QS2mmvY8bk6gCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDzKEANkaIunD0QwPpTQBAql/2LlPPa8NBV0GeSJ0k4=;
 b=gV1dB+7o7MP5aMBjivgGHNbBYCjjA3JX7HW9XzeWWFELe//6a4VePD/i9blkAJGKwlocT15vDKpypX2zowEim5zlPkzQZfCKi5Mp5+F+FpNtaia12eo203seDNfuUtrcc7EW3RqKiP/rdl21C31oBDNW6/r1bDj8PtqDfnx+XUCr74eXI8b29Bes9bVuXsq9fWTQX+fES5FRcd+Pu5RWxX4y2ZXB2eCD0Lzq0izs0mgIuoKU7BVPSQ6bsjAk2o7Z6q8uO1pkWaEkSnpmAYP4VWJt+/cg9/kNrFTzHsRfRUIQF4WzToa+VaNpj2kOPqTB8sBsww3f5hy3/nMY35qqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 07:46:41 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9846.007; Tue, 21 Apr 2026
 07:46:41 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: Drop the deprecated workaround
Date: Tue, 21 Apr 2026 07:46:35 +0000
Message-ID: <20260421074635.1647111-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2a6ad2-a68b-4f46-d81a-08de9f7a2062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ChptSyiUZVoc67TQzDYTGJQNOmvgEWv6DeWvI4GikMBjUwpkY2QtDXoYZsOnyoK7Iy24Ls7OPPTEh1wIBPEGIJQGMbJMc2azwDYDhYbMS1uRkZN8II+NMtBjakeM6NPTaUSGdxY8zZcElNtIHm9E717scrZ4GeDspbMmZkKJ5s+EJ3iYAgcgGSKAW0qCgFO7lD+AMl6iw5KYQpi03Q81l9pV44RbfiByKzInn3EaYgqIDJiuFOc3sp7xZXLSZ5/AZ21jJt5UvohEs91+5TsG4j+QnoHlT0tNFI91LWHGPxb0EzuxjRui97fqimXb9zWaQ2/pZGz6GMVupokrrV+cBReCv6O0cURQFX1lLCCUjGK2bzIRhA2zVKMQ+HdsAEs1eZ6leM3GBjP2khCbaXdfKtJdQz51GVFUTpqAvHO68vfvBglu82x1RRTR7qmL+PMQ2sXc4/yqFfZqhCvuE3LQ0GVs8eLY58pYjPjLseXAK1MQpxR/NwTqSGY3R8XdTAtx6k4v0Mgm/MdCjFPh7jvWPR0zmL4rIiXJSxCThsOMrzvuImrcoYo2OOUikZuZcq2PW93kGkgFgjyZgRNbiG+COT59WvISAT7CKOMnYMzuGGRX0esqoqk9KDh5jKAEJ47n/8CSGYRiSsQQkF38Jz96TP9iGqb1Z7O1Ce5/qDAEPa0qgZ3S0zastoFqoPW8H5MQZWxUQYPA2JeYA897kkwLjXXrFdJyc+ITZp6G6jwPxOByh2vFKsQjk+3j/TQprAg8UAusymcsy7phuDCZ7FRMepkD8lgH+x2SPg/EH71qaqc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VzV+YbyAWbTQd+825vLodReENJ7Hvyvusoplk78n80tFVk43QuQ3z37IVCOP?=
 =?us-ascii?Q?7mqd4yQZXaxQhGYpsdmrDmkBLgYcvdOhRvmRq1i4+qYI+0oZ9oVRfH4O5QuY?=
 =?us-ascii?Q?fT4bmYKWDoha+prbACN9us3r8DX1esZjfBE+V7uacooyzKJlaD1SBWc9aZv4?=
 =?us-ascii?Q?QuRfrh8WaYA8sCdFrdXQzmjuUQT3st2PpxbJEoM5a3AyyfTufPX7pIy2ADgX?=
 =?us-ascii?Q?6YeE/Cwpai1hzYtb6+NhmOBOio2oSHx7WhWwGC/vsgLe2iHeUElGwZyMQ2O6?=
 =?us-ascii?Q?7NdgKPNBhsvXeNJyp/eEORZxj9OONGEEtTd84cg5ek0SEDEtGNjnrgHGasH1?=
 =?us-ascii?Q?ClG4tYXF9xiEnZcjg4FUZo710jitERAAcF7MmnFZ7RT6Q08J4J6PjEovSJgF?=
 =?us-ascii?Q?PbMPBYaEG2V7zhOPHPOXjaBmEtyRiNp6Lf6Apj/ET9Hxl6uv4kf+y3KP+zwC?=
 =?us-ascii?Q?/59ZvHS/21RbfMsXFy5/TwXSq3lH4jcnt+7prK6gbik1xPRaDYczgDvX6Tr1?=
 =?us-ascii?Q?RR95U2fdB/z7EZ8ZfWsxKulfWBg/PMCh4HT9fUMszF46+dLJIM8BVn7pYFZy?=
 =?us-ascii?Q?i5h9nMNG9DtnPYG5oeTytzo75zNf8j8QIKhyeCdgeOqUOB4XaH7UTDchgMnM?=
 =?us-ascii?Q?PFK+9XsPED3mT1G4mboIzRjT4kvDGMUCHDlK+HJkQmoPY+w3BfU+hRPBRDFf?=
 =?us-ascii?Q?fWrPqU423Uzdv2SY6GW08XzXVUDp1fVJ8PdAc1U+qHXKMbh4bpGcbgJTZyVR?=
 =?us-ascii?Q?p8nJ+1CzYLV6Mu8a21YAa8wLzPxp4d9R8grSj3leqeub0Y1GhzdTcmW9GCuW?=
 =?us-ascii?Q?HZAodvVWOw3iS44FRoLebDGdCysw/PxbaODLJk0rbpqFkTENHTR86bao2axi?=
 =?us-ascii?Q?l21US2C2ysBRYlMmeiqCR5+hBS8jx0/7MyGJgD/0TW6ZIRCdnhu/KKbExvGu?=
 =?us-ascii?Q?ih/VMGBHgYq3b4qw75gQ8e8sD62GyJIHU5r6v3Yv63VW98CxQddjHIuefjfz?=
 =?us-ascii?Q?PUbwU+ERywCPD1cMddfrD0HRNv+u/WJg1jeDX1Uh8tDudLzWWyBaoD6YtEHr?=
 =?us-ascii?Q?zXZ3uFesaS4ZfeH1LdhD/LMJkippeU6JFl/o5mOkLRM72lu8okzXnu0Q0ueX?=
 =?us-ascii?Q?/eK3RkpXHsO2V9b4UWck6TC6rI1tcrdgyQ/Ow1a+asaUeW8q4Gj0C5IvdMuT?=
 =?us-ascii?Q?8wr5QBb82fmro91WiM9hbevahRKFcOPz6sc05YexrmaCCKmNe0TK+gXF11/V?=
 =?us-ascii?Q?r1HSZZYj89uK9CeumbYiHFG+ja1YHZsR2UmHKadtQgLui6FR9RHJl1kLmj9r?=
 =?us-ascii?Q?eZkp3YfX1ArQ7hNlGOWtf6RUTaA8FxSzUNZWQ2H75DLufv+um959/pPeKjrb?=
 =?us-ascii?Q?WpjVtLiKjOJ0ln7+FLoo2ubjIRoH8iFr8XrE1tu0wZ8P+/NDCrg3KLOueBbN?=
 =?us-ascii?Q?u4TSbkkt7jUpvfjUxApp7XUgWV2z5PHKnXuqYkYJxYwQP7k0rsGQhvqRd+gi?=
 =?us-ascii?Q?Pcj6iYAYmsL44qiODP4Z7DphqPG96kOxqATKVH4DcWqUkyHGSm8lIQzVttAR?=
 =?us-ascii?Q?AJFhROBqMGAdwkY/qlOkFAi7JjWlE2gFqToR9c/qKTplxmlhtes/Sp53Wzwg?=
 =?us-ascii?Q?iqu9t2mbL/f0L+8Bvr7b7nOxi6C2CcwKPiWYKu0h1TpxLkqj7TDqvdxCdxQg?=
 =?us-ascii?Q?zFiSqyUNdk96xOpeIgjPU+217RohZJxBGg8eSlJIQ2s52BiN8I4Epknn9otL?=
 =?us-ascii?Q?EDOD3O/+++pl6RGU9tw0JK3zwKQ/jgI=3D?=
X-Exchange-RoutingPolicyChecked: 
	DsrP7saEcWiyuZyrm03+dZv42sVpUpMJxyioXd5Upofzo/NcjrVTjFAOXvMfgBFukMgGYycEOPROOIF8LTunCW+cMYLr9HPZjjraXD4IFh/H/rH/ChM8LxVUoOctgRFfluLnygK5P+RIwV9dhM95do19rzO2uXP9Ji6sH4kgBAixq6psuWy0YJlaqYb+JX629eWGl2L0Ev8J+zF1YNgdDvLv8uC8kXMwQBpzuywnPLNn5E2W89XOfpAPwQl//uS9wykGBjiXYefQ9rlDFsUNK9CNF0dgBnj6BDz/6IjczgLG99jJHJmx5XXrH3k8hQqLm5HExjFuq25Mm26/Sr2Evw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2a6ad2-a68b-4f46-d81a-08de9f7a2062
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 07:46:41.2322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u2NlHK5YqTKKFfkxiQ26soiX34d5qpctwcFiUkitMuFYUuMKfPsrS7nXHnq7dtAnwV+YL19H7om7A0RHyWcDC/44eyEZSLSdqr5bKCndcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
X-Proofpoint-ORIG-GUID: 4trfYs_mjuCpWjglwK500BeG73V1fNjo
X-Proofpoint-GUID: 4trfYs_mjuCpWjglwK500BeG73V1fNjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NSBTYWx0ZWRfX26Wv9rM6lkvr
 3Dok0zTWoT+CcQVV2EWnKsqgoBY73b0TzlvhfaKDOLG4fRzVa0iOHBQEpiSdtyVdVt6j1drBQ/6
 oYE3KjkKv4QmjMrpF7MHBrhEMCJR+ZsMUo7iBl/Uf0JduKGfZYDFEyk6PP5p392FH9Rk9gR/em/
 UUK8TrGpsZ5YaJ7YCumi+vLl0aV1+if0s2wvtCdklwddSomVztrz2A1UlyXnKvTVXC9UIdsUqLi
 5p7jiPRbNNPF7bbibZjH+IMFxG9TglKESpCnNMLwX2lCJ0sn6pRLiR8rSd1EB7m0N/+chI7v1AH
 EvXfKQ4DD7UkoAN3bRxuvusexr+9ZCXysxj11s2/S24v1era6hwq80cpLUvK+Xxt6CKp+crNYOx
 +oqqvULvPoQNemMpWYWFxNewqlovyvKIu81mRyS9MVRCaPzeST1JtRbn/xay6GPGiQd9RxFyYRR
 0bKgsOEnmp+ORs/M7+w==
X-Authority-Analysis: v=2.4 cv=WKZPmHsR c=1 sm=1 tr=0 ts=69e72b63 cx=c_pps
 a=nfJ3K52CLbhVQgIdADXVOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=Io_XDWT2tM8LUEtPzNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210075
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9719

The workaround is not needed anymore as the systemd supporting.
The libvirtd.service Type has been changed from notify to notify-reload,
so the final Type will be 'forking-reload', that's invalid for systemd.
Here we delete it to avoid the following output information:
>/lib/systemd/system/libvirtd.service:29: Failed to parse Type=forking-reload, ignoring: Invalid argument

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 62931d17..b5b0a5f2 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -232,13 +232,6 @@ do_install:append() {
                 mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
             fi
-
-	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
-	    # Change default LIBVIRTD_ARGS to start libvirtd in the right mode.
-	    sed -i -e 's/Type=notify/Type=forking/' \
-	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
-	           -e 's/\(Environment=LIBVIRTD_ARGS="--timeout 120"\)/#\1\nEnvironment=LIBVIRTD_ARGS="--listen --daemon"/' \
-		   ${D}/${systemd_system_unitdir}/libvirtd.service
 	fi
 
 	# The /run/libvirt directories created by the Makefile are 
-- 
2.53.0


