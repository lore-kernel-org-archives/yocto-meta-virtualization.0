Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE62C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:16:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13542.1676463408748875738
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KjliDGrI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14101ac048=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FBMv3D028974
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4i308dwx1LzlAFdVLtdzs+f8QXY8pHzpqYc+V4odkDA=;
 b=KjliDGrIsXtNzV1zNXW3uRIzNV8kdK5/LA+TczCvfbSllYxh3TyL0pGTfTnukZbTL5rE
 CBIv8jumK+gtIYmPmSpyDqSc5NOmZHRofKysHHIl6KAUM/EiEWMVL5ip6Q0Bljxb9axH
 aleObFDpqEsJaS4+/JGe4z5gUs4sgCUajgkHJPVFKthR8SVL0lfqfCycvq4t5lZxNHii
 er7zMKFfEDBG7AaDxY8uxl6uS9kBCmp7A/4CtNBw/o8hGYEIPqRsh/jUW6Zh+Ld6we+8
 Z0FT1bETGGmu963VHPuxESdv4icU2mUOOAi3kEMtNCbBkphCNOkjWCuZsKnuGtoZH2JU 7Q== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083bq73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3AOLKN2kATqTsjPFCnpSF7s8mk07fji6omCpgVSVzQfScmR9opucGfuZ/Ugnn3G4aU26QaeZEmNoz0TG8aYoZ5W5wEcCyUxtisB66IWP6JDDlE8D26aCNBZScQwhEeufIJ5Pu6AP3mFUJ1SaOB1PDhA2arPbRrNOkC/wiDkS5EnmIQG4/udS/MmmvCOq9aMYTlvMFed2PdG/nJNsBtdeurNrvczEQKrssbMV5sLU+h1dnCHigGrRWupJ265pJCcsoPWppZ25qyME87I2RBnTXYpFqSAgbtaTn1Kjmxq60tn+JwLwIOELBHHGVsTV63eSe2zBGA5J6azqPwkMJx5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i308dwx1LzlAFdVLtdzs+f8QXY8pHzpqYc+V4odkDA=;
 b=IcUAj+fQXpcdxN3r0C5mCY4Nu74Lq9uMt5T+gvVP8nTR4xoKx1Wh3tRs+ywzWl0Caj4fvsKkps0sfRKnV1oQXi4wsGo/jvb/vKH9iNaCXTxJYFvE34eYAUXxp7uERhvQEduuZnbMI4flcOJ1tNkx8wPtU4WSVaGq8IwcLIVti3Hfqjr/6xlKHoDEOfzClnGXyyaloGO1Qd927NepJNavdbejIVNoZVsX4KRDOMPFBdgC/z7+uCtO9jygNFogZjj5S68XmApy9pnRQgh//yXfXNRwFbqD8stgHQ02c7+K93cfMKgN6RrbwM334kdQwcusrEGg6gJsFsEy2mcDgwzrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 12:16:46 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 12:16:45 +0000
From: He Zhe <zhe.he@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] irqbalance: Use built-in irqbalance.service instead of local one
Date: Wed, 15 Feb 2023 20:16:32 +0800
Message-Id: <20230215121632.3091565-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e43bac8-3b25-4471-2355-08db0f4e80e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a5U9TF4vR+Id3x9K4oCf+Jh+wRTf5eg+Sokbv5S19VNniBuZS6si1BSMxM+fIvLomESC5cbnAQlwAxSLpE+MrU8VlFVuFLH13VAy44GN5PeSsnyV25Zyiu1ZWaHYa3FtXq86BgPPlbtbn7J8ieAAtCzaNtdy8GhMEGVXlIu+GuXpkwlytkV+rIwQf17qBC2pYIUKrXIHKbI4tdPZp3YBlL5BD7QZtuL50z5VVmleNDuaS+J0FltdhCRDBCn9YxmoDOlitjMbgiubbJY8DB1xSXTao7KPY7cz0XD54l9z96lTQAwkAufn81AM4pSride15v+Sj3aIaFUaGGzWGBC1N99UgTRJPuZaV6ZMytulJGqgQvuJF0HBnsiLWR3VcDHSTifcPOGneVsJYkOP9E8ZOBl01tPXig+hRXCzSrHsn1hSj8KWzfQNOfocEvsDEQlAEL3OXpTgEWHUUPoO5wd2kiqRQ0Zv79Tjr/N2eLAPUrsFoiPv0BYapsciA4IcHUjXotiQ7YLxB9r9py2IE86LUtKRBElrjfuCw753aBuIazzH3SeWaHsIhMt9wpYuZxaokLSyZuws5+O+cQdOPEDTgn8mShFr7XQBgpdtTUPK3QiKvHfI6pdfDXHcrP9a2vhNjaDKxqG1MFw/CH3H9Uu6E+74YaaxPtFE9ra6neBiHLY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(451199018)(36756003)(66476007)(316002)(66556008)(41300700001)(66946007)(8676002)(6916009)(38100700002)(38350700002)(86362001)(6506007)(6666004)(186003)(52116002)(1076003)(26005)(6512007)(2616005)(5660300002)(8936002)(2906002)(6486002)(966005)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g9jp4i2Y2yGiOk3QuZD6QXvYIL6Fi8ZNaJIHoOa/j/A4fHO5ACaAlJb93/5c?=
 =?us-ascii?Q?jfW+keVRfmSYZoA7/VeEp9sjr0kCjX9zqDbCrANOzQ5+BrsrhezpEufAHD93?=
 =?us-ascii?Q?XV4P9pZZDhuI5j49dmxFbHH/lluFFWsPR/rz9YF0CfV2ySCPbUnDKk+7OY4c?=
 =?us-ascii?Q?+uiBjdMs73/fEiXt10EFIfL1NIg+TCuA3u29Wohbub0To3xbnYeVRHTbQy1n?=
 =?us-ascii?Q?OzXB1kqGn1/qInQxJthHKPwL0F3dR7sqN3d904YEG6A5Z9HnhuX5vHbGt/LT?=
 =?us-ascii?Q?UbGZbR1WV5CUO7Hmfpk1EAD+oDwcDmjG0as075ieR6qxlfPf7JlXFKXTu9TY?=
 =?us-ascii?Q?M0zOivWBDRBWH84j7iRxjNkZSErfsr26KiGgAWjkYf7ztLP8V+Yc+7f50LOS?=
 =?us-ascii?Q?7jwViuEqYFJnOyfZg0hjKZFFCanH+PlKQ8aUjpdhjS8a78VbvATxH8bXceKO?=
 =?us-ascii?Q?kVj0JlWlNRuSQY5syT8skG+1FGDl/7+xuRlOa0n4y+jJSKPvH2qxBradS5BX?=
 =?us-ascii?Q?znK5ONHap9RURfYN4w73amdAB2aDU3N8y4WQtd/kgZlQtDs0Sdq6+o5OP0KE?=
 =?us-ascii?Q?S9mfTnJJYi+Zt1jvH6H9WyWGDYou+A0x4kJOSsu9cFpO2Y2+d3iAYXi7s7de?=
 =?us-ascii?Q?MWRi6T8gTvK7t5rR/ajuSVIJZjUERHexZxjz1LK6UXZOnF0FFey7Bg9uQc+E?=
 =?us-ascii?Q?Tb8rWTGMuBjjoqLfNBKUFzhrlk3wxb3lovTacaxkOShxxMTQ0y7/5PSp32uR?=
 =?us-ascii?Q?wLAT9juAdVN8uuWH5QIsEO8WB+86wyQ9CVsLihfMYluUxKLAQqQ12rjhlIJg?=
 =?us-ascii?Q?rTp/EMMYSU29xL3StoEa2Mqk3HkyP6vgq3IOAGbnFUGI9co0OV/OtvVbTePR?=
 =?us-ascii?Q?RWsWAFeyIVbvmxTeBQpN5FWgRxENBhnVN8JMjfLJyYKaObJxsujqi2g9WhM6?=
 =?us-ascii?Q?iZoX4zVI7SicOw1GKR5F4sdNA+QOO5ktVMQ7e0T3UpNzIL0LQdtNPCFWZdgA?=
 =?us-ascii?Q?C5I7juD/nhOnEhriL8PTzK09zlJKv4FOWhXwjBDMm0XXj9/D6Mn+uVxGNPtr?=
 =?us-ascii?Q?P+goNZXhjwRoMNBlmgrrzM6jK3eXPcRCQewwbS6KEKBROQeNxCQo9PD6Qioj?=
 =?us-ascii?Q?LfWkESMLyXhs/yedHYMrO5CvPHXoukuRq1jKwMt+ih0px84xY8qXf5jgdjDZ?=
 =?us-ascii?Q?6Bll2YIHKHRPa9sCQDZOrdT8ddHLiSJH/0mioBYMDr8I8ITNoTCxMDcoXTtg?=
 =?us-ascii?Q?cnCikxDRYf12qQhjoC/1tQmDwirs9wWB1yj/1/C5V0nMVKfG2nBhSnjvBEL9?=
 =?us-ascii?Q?t3RAD9lQC/As3aLPn9H1utp0GXEKb3f7odjJqJqJBN4MW8N/cEY6t+BAtyty?=
 =?us-ascii?Q?tSKk/wxVQe1F0XynDxv6PGTYac0FseN7W7Puj86sSsf0RsZT9XqWsZEDCA0Z?=
 =?us-ascii?Q?RZhN+QL8uj90IgX8mBDmf/04chkaaXbOCaemc/2a55qORXl7R3kshWxLhe9h?=
 =?us-ascii?Q?6HjpVFVvzL/maawQAW31CwVFRJ+uI8idD4gYRFduoBd/ErlknRua1yloClGJ?=
 =?us-ascii?Q?rKSghHHMK+410TTJ0dEQv2g87Qc7NxiBS4gnAepo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e43bac8-3b25-4471-2355-08db0f4e80e4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:16:45.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57xP5RJh8kyrt+Hj4iemCsN29FQkV3dEt+s7caan5vZQ8KmRBFM2iP3qw0WIljm046jS8dyHzgWxVTXRZU4Tvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
X-Proofpoint-GUID: hydiiHhZ-deU1IbDSn-8bRidXkV1Xxum
X-Proofpoint-ORIG-GUID: hydiiHhZ-deU1IbDSn-8bRidXkV1Xxum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302150111
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:16:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7854

The local irqbalanced.service was written long before when there wasn't one in
upstream. Then upstream created temporary runtime directory /run/irqbalance in
its irqbalanced.service, but no one did this for this recipe. Which renders the
following error.

/usr/sbin/irqbalance[314]: Daemon couldn't be bound to the file-based socket.

This patch starts to use upstream irqbalance.service instead and remove the
local one.

root@qemux86-64:~# systemctl status irqbalanced
* irqbalanced.service - irqbalance daemon
     Loaded: loaded (/lib/systemd/system/irqbalanced.service; enabled; preset: enabled)
     Active: active (running) since Mon 2022-08-22 10:10:22 UTC; 3s ago
       Docs: man:irqbalance(1)
             https://github.com/Irqbalance/irqbalance
   Main PID: 208 (irqbalance)
      Tasks: 2 (limit: 263)
     Memory: 1.4M
     CGroup: /system.slice/irqbalanced.service
             `-208 /usr/sbin/irqbalance --foreground

Aug 22 10:10:22 qemux86-64 systemd[1]: Started irqbalance daemon.
root@qemux86-64:~# ls -l /run/irqbalance/irqbalance208.sock
srwxr-xr-x 1 root root 0 Aug 22 10:10 /run/irqbalance/irqbalance208.sock

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/irqbalance/irqbalance.inc               | 3 +--
 .../irqbalance/irqbalance/irqbalanced.service            | 9 ---------
 recipes-extended/irqbalance/irqbalance_git.bb            | 1 -
 3 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 recipes-extended/irqbalance/irqbalance/irqbalanced.service

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index c69b74ec..038cbae3 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -42,6 +42,5 @@ do_install () {
         chmod 755 ${D}${sysconfdir}/init.d/irqbalanced
 
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/irqbalanced.service ${D}${systemd_unitdir}/system
-        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/irqbalanced.service
+        install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
 }
diff --git a/recipes-extended/irqbalance/irqbalance/irqbalanced.service b/recipes-extended/irqbalance/irqbalance/irqbalanced.service
deleted file mode 100644
index 5b284faa..00000000
--- a/recipes-extended/irqbalance/irqbalance/irqbalanced.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=irqbalance daemon
-After=syslog.target
-
-[Service]
-ExecStart=@SBINDIR@/irqbalance --foreground
-
-[Install]
-WantedBy=multi-user.target
diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
index 48774889..a944c2f1 100644
--- a/recipes-extended/irqbalance/irqbalance_git.bb
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -10,7 +10,6 @@ PV = "1.8.0+git${SRCPV}"
 SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
-           file://irqbalanced.service \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


