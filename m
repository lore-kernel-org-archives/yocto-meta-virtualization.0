Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B133C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 07:52:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3484.1650959534969442721
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 00:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HUMIHRc+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1115ab0058=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q7Rtxh002443;
	Tue, 26 Apr 2022 00:52:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1AUWj1AkT9ghDNdDpSXz080FJ1oEKCO+4HW3JI9Oa58=;
 b=HUMIHRc+bpF+3C246w2+jrlrrn5Gd/GMbquU3nPtfd4fw4u4wf2xspg2Vv9nqwADPU6d
 b9O8bCHTAOvxyt7kMNDI+BwXW4DbbpnE2b7hr8lFhThwmDxb8wva+mc8OuNrLWOUk2+x
 TZxRgH8gr0NU45ce0TmGyylldvcJqzT08zf9ZXaMYCt3PsnuXTfjDiMlaUoTu63Riup+
 X1V9/eBCbUszjPpdZEZpyK0yCD4fOADnQiUvaN7hTM/d7fU11l4pwB2xpN3bTSCEL2dt
 dvwWML7W0psIhY4CPZh6+zq7hyM3WN3/zIUmeDSSNcQs0XuqblNr9rrHE+WK+nEjrb1Z Aw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4a3pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Apr 2022 00:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuAUAoBr1qVPBwVHogVK62lyqbcK7IyQEwpDvCnNJ+I8rJ7VRKoQmDAn5Kl1x0BA12yws86Lk3wF29ZrRxWMkDa/mKnneeGIMjahvhzU1liVwJqljWAHlCoXEJTKenkgWUqg3V5zMRd0b5ExkZmN3OlrVghzCfJ8MtdSYUMGAzHBuDTDred09oOGprV/aPl8K9xu+zVy+7cd0CDBRfwSHNG4WBJMBtCAe30oCOV3CQSOOr2Dk7v8Voz4ef4cADFGxx2KOT+v8QRGDKKxXDi+m8vExUcszwcuP0wQl7KiblRQ6LRpuXeOwibV6orabdGADgcZPVuPY7uqYyTnSPFTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AUWj1AkT9ghDNdDpSXz080FJ1oEKCO+4HW3JI9Oa58=;
 b=fC4vsyc6SWda3aFQnTr0GxccVNfJK3e4BJnsK5uQQWKNt63wB8zBmJj3JyvV4w4BNAl6JuLcY4vJgOj7GF5PRl+SKlu1uNsb0UuQPTnAWt74JNciT3IwSqrrD1XxQ6Yre2NFNNLXXWZc6qkOj42FBn9omZFq95lkv6gvOjCFYb8KdnqG5W1sX4mIOacTJp/irVb8j05iWO0ebe6i57F3mgabQLbKkzIspGVuolXV4RHD7JaAu1E5uqphEHhldewO6k/7u6ENrLYi0/yG2vyTbA+akYgD38rovcZJgC9HdZYrW0Fl9IcKNWxjEcdckhyZ8SWefH35O3yAHNvtOHgQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 07:52:11 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:52:11 +0000
From: He Zhe <zhe.he@windriver.com>
To: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] libvirt: Fix error on undefining domain
 and segfault on libvirt_driver_qemu.so
Date: Tue, 26 Apr 2022 15:51:57 +0800
Message-Id: <20220426075157.3961307-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:202:2e::20) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d59a419-3e6a-4144-10ff-08da2759abd4
X-MS-TrafficTypeDiagnostic: PH0PR11MB5189:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5189BDFB2CD4D3474D27A8A18FFB9@PH0PR11MB5189.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lqm+oAY3S65lBEqauY34lBolEkmJcTGZO5xt1QxwssFUNwWNy9/IWruwirIglWvm100ASn7mkgqgIAAed3p9CXNYPh/5AOfCl+RXNUuR1upbJOs4JBvDTqqY0wZ0YcqV/luk1is6d4e2qyuNCTnZK2Lekg5of6QGIWdhTkBRXaW51XgpIc7glqWXVHDebnHXT+kVA4hjZPEwlbs6Y94k1SEvu0KwW7cYCSzFxSCZP5hXMsENbyI2KcKDk07jLtygxzF5vd/3cB47M5YqWSuVxQ9XQjqMCalOKbDh48IWNiffw4iPU+Y2lZWQbAbVXQlzXYIPoK7htdR7o+Wu8l3FRvScD2jvztUhaB/6epw5EUcCXKM/uX+unjt1KgSbhTSJ3amEHSBCCzTteecsNzvegOIeR6Qmspx6MdmRdsq0Sac5ftsKBhTKKkGJ/0kpDMxsjv9ba7I5xfoPnpM/0/HqZt/NVE2EamJOVUOc6sxHn6687+qDGrwD1syHSg6Je0/3bexM4SWpGHGScIq++uKIXSoGS+jVIzoS+AHWpu8RHwtqM6KXiLZ/ZPUKjAjHpomKFcx654xNjDaHXqzy41HGNfyvalwkvLcqzAgp3GbSA0WVdm0TVgzvWDVFqbc2QxO20k9kaxLzYIxLR+qLnay6GIseqNLm2XZKNqaVowFEhi2BSwhxhlcJkAAFYXLGNQBg0M9Mp+MD36CGbusg5ACrwEJ0Pttt0unpnEsXyCaznulYy79ZDxYxj+wT0MDybk3cvkLkykt5HiX6JMJrgVIeY9pNZm9VlR3/jBn5cWfaaSg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38350700002)(6486002)(38100700002)(6666004)(2906002)(66476007)(66556008)(66946007)(8676002)(8936002)(86362001)(5660300002)(26005)(83380400001)(316002)(6512007)(36756003)(6506007)(2616005)(186003)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O6Fb5FBaUKqNyNi+TeBCTEVERtHyLv4lQF0V3sbRv84kWLFS5XuMEPV8/qN2?=
 =?us-ascii?Q?89pzOsGIehJzUKPkzgt4uSi7HI7zRb0NdkCHneF9zOFhS57XpTbTuEmcQViN?=
 =?us-ascii?Q?YNdOEwuOmz4mrPwhR4q43tLMK3xwTRkAR//Siu2lYX+fDbvn7hIIqU9jk3mD?=
 =?us-ascii?Q?QaWCF/eyM6pkFiMVdYCiF2eo6YjNYWqj/1OnCDKbZdZWsmB+WFXKSFbVTNqj?=
 =?us-ascii?Q?PXLIA+Bah+VOohbNlbaiurnT5Z4NJrXlYmGDJDQY3lv7XT0p+CEdMky2R0yO?=
 =?us-ascii?Q?hG17B4byPrCjiL4BSLs6jdeIc5Rf/kmZHY6goGstFPgjpjnwIod7/h7HVSLR?=
 =?us-ascii?Q?Ogd6yQE6Jigwdlq4LkGQb6bKP8cORdQb+5Pd7GcL+AzgC5W2aYU2P9t+5fCY?=
 =?us-ascii?Q?JH4psYsGtT3eOBG1gDl8VFyiXTzU4Sppci60/zU+y0Au5lJ9AY0GmdZg0BMn?=
 =?us-ascii?Q?q73n5Tb91hlj/+XXkiTTa17/2MZhogi4gaXAxQcRk6twZuW0v7Dq1hQnRA+F?=
 =?us-ascii?Q?y4VNdd7iSPOGOims0PinEca+phAJHuOpYwp4B/8HMoJxAM0CmNq5MnHkmCwv?=
 =?us-ascii?Q?r0ux3iOek7pj2gF1HqYectQ+0ZYSqp0+J+W2R9BeEytZRR3YqxnhaVyrBFv8?=
 =?us-ascii?Q?h09aEgMMukvnHV7vgQ3hGnvZ5XFd126xqk+Mw1/K1Md4bp3vnOVymSSP0fv4?=
 =?us-ascii?Q?8smdEZrtq9lWOVqaoKSUUDRiAUF7P5wYshEAdV/a1LrluldHfja9njOgWwnk?=
 =?us-ascii?Q?4kPTt19MWHeq6IH9/yfJ0mbr7hycE8IMBaVC3zyl2lv4vMTtoCj5s+kSM0Nx?=
 =?us-ascii?Q?iXM2pHnGnnfGy+l4rSgDlAAxskqW/QwvTBRpc0cElVl0gXqemps8ktP5wrXi?=
 =?us-ascii?Q?6eIJtf4EyyoY8VRhKBjuqGj4obiQdPqh08T4WaG5FO+sW8uLRfxArQ0dfg6C?=
 =?us-ascii?Q?7iGSJdCICzuXPUaRnaNu2ytAX03gx8rheQhfeCU826HXU6CVDao25SkokgBp?=
 =?us-ascii?Q?Q+wIK0Z9xMKZw8cntpXRz1wsDFNV2sJ8Iv4G0Tp6/fjCwAmAq/mffEzuBnGI?=
 =?us-ascii?Q?LgQ6yJkR4t0cJpDPCyJY2d2yXGyvhthUJ5Tr6zz/wu1hrP4cYs08Bqiqtn8b?=
 =?us-ascii?Q?2PF1AX+LWYCGFdSS05fTfvFIAAtsfFsjiuF3Mcgvxog08iU4RWwvkrBTRdUl?=
 =?us-ascii?Q?0yYqLiqTTfAT8vplO0hyqnZ9IZnfGLwYI+6PKbfQ+RoXVU/ZWHcqLaIXt7K5?=
 =?us-ascii?Q?7+8S6kPmXDNTryNVA3e4GBgsuRJjo0voi0VRiDOSVeduxVsk6T8zVGXUHw5r?=
 =?us-ascii?Q?uHFO96OGFcgQaLl1mx9WHjDO5xiyLkoHrYmVjGHbeswk/Xp7iIOc/AAyy4cD?=
 =?us-ascii?Q?0KPweF4OcOfLImHuX8vwxZv0vxq3UvIH35IB7fS1D+Kzdtwi6o1k9KRAwCqF?=
 =?us-ascii?Q?uIQ/l9oSvxN4f0E72rzujdNCDtSjMcM9WAcKrnIfnEhA50OtDqHlDGIsYxAz?=
 =?us-ascii?Q?dm+PYrN66FIHnpA9Jsz3r6K5RItfdZ+9aumr/w7Q1V/VWyw2gwqGAeS4uUC3?=
 =?us-ascii?Q?A9z3kCywlw0LtXsNwCEudPYLLMPsVf/LTUdFdKNvdCab3t+9t8il6QYatVD0?=
 =?us-ascii?Q?wmTtvFNjwXa6u7yEi4IewztmET/Fz4HI4LZmjlj3jMTPhh19XUaElHo8gl+r?=
 =?us-ascii?Q?zmQTPbYRIV7FTab6MTuPQqv5F7WJo9WWcTreBc8P+07VIkoZE7yoQoC5expy?=
 =?us-ascii?Q?8zuDYR34Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d59a419-3e6a-4144-10ff-08da2759abd4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:52:11.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +efVix2M8M/RttpIZTrH2ln5URsZeYB7Hif7Z086CR7WpZIN8aDhNulhcXcvlGkDwqq0yCmzimsqX1BQWOuIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
X-Proofpoint-GUID: vDpHldIVHJTbYl6r1ASDb2493jLmanVp
X-Proofpoint-ORIG-GUID: vDpHldIVHJTbYl6r1ASDb2493jLmanVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260052
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Apr 2022 07:52:23 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7218

Backport a patch to fix segfault when undefining virtual machines.

virsh undefine vm
rpc-libvirtd[9725]: segfault at 18 ip 00007f8b0a5f17a9 sp 00007f8b3f8cbb60
error 4 in libvirt_driver_qemu.so[7f8b0a56e000+113000]
error: Code: a4 01 0f 84 89 03 00 00 4c 89 ff e8 d1 ed f7 ff 85 c0 0f 88 b9
             02 00 00 48 8b 45 b8 48 8b b0 80 00 00 00 48 8b 86 b0 02 00 00
             <48> 8b 78 18 48 85 ff 0f 84 42 01 00 00 e8 b5 02 f8 ff 48 89 45 c0
Disconnected from qemu:///system due to end of file
error: Failed to undefine domain 'vm'
error: End of file while reading data: Input/output error

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...n-fault-in-virtqemud-executing-qemuD.patch | 52 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch b/recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch
new file mode 100644
index 00000000..85870e09
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch
@@ -0,0 +1,52 @@
+From 823a62ec8aac4fb75e6e281164f3eb56ae47597c Mon Sep 17 00:00:00 2001
+From: Boris Fiuczynski <fiuczy@linux.ibm.com>
+Date: Tue, 1 Mar 2022 18:47:59 +0100
+Subject: [PATCH] qemu: segmentation fault in virtqemud executing
+ qemuDomainUndefineFlags
+
+Commit 5adfb3472342741c443ac91dee0abb18b5a3d038 causes a segmentation fault.
+
+Stack trace of thread 664419:
+ #0  0x000003ff62ec553c in qemuDomainUndefineFlags (dom=0x3ff6c002810, flags=<optimized out>) at ../src/qemu/qemu_driver.c:6618
+ #1  0x000003ff876a7e5c in virDomainUndefineFlags (domain=domain@entry=0x3ff6c002810, flags=<optimized out>) at ../src/libvirt-domain.c:6519
+ #2  0x000002aa2b64a808 in remoteDispatchDomainUndefineFlags (server=0x2aa2c3d7880, msg=0x2aa2c3d2770, args=<optimized out>, rerr=0x3ff8287b950, client=<optimized out>)
+        at src/remote/remote_daemon_dispatch_stubs.h:13080
+ #3  remoteDispatchDomainUndefineFlagsHelper (server=0x2aa2c3d7880, client=<optimized out>, msg=0x2aa2c3d2770, rerr=0x3ff8287b950, args=<optimized out>, ret=0x0)
+        at src/remote/remote_daemon_dispatch_stubs.h:13059
+ #4  0x000003ff8758bbf4 in virNetServerProgramDispatchCall (msg=0x2aa2c3d2770, client=0x2aa2c3e3050, server=0x2aa2c3d7880, prog=0x2aa2c3d8010)
+        at ../src/rpc/virnetserverprogram.c:428
+ #5  virNetServerProgramDispatch (prog=0x2aa2c3d8010, server=server@entry=0x2aa2c3d7880, client=0x2aa2c3e3050, msg=0x2aa2c3d2770) at ../src/rpc/virnetserverprogram.c:302
+ #6  0x000003ff8758c260 in virNetServerProcessMsg (msg=<optimized out>, prog=<optimized out>, client=<optimized out>, srv=0x2aa2c3d7880) at ../src/rpc/virnetserver.c:140
+ #7  virNetServerHandleJob (jobOpaque=0x2aa2c3e2d30, opaque=0x2aa2c3d7880) at ../src/rpc/virnetserver.c:160
+ #8  0x000003ff874c49aa in virThreadPoolWorker (opaque=<optimized out>) at ../src/util/virthreadpool.c:164
+ #9  0x000003ff874c3f62 in virThreadHelper (data=<optimized out>) at ../src/util/virthread.c:256
+ #10 0x000003ff86c1cf8c in start_thread () from /lib64/libc.so.6
+ #11 0x000003ff86c9650e in thread_start () from /lib64/libc.so.6
+
+Signed-off-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
+Reviewed-by: Jim Fehlig <jfehlig@suse.com>
+Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
+
+Upstream-Status: Backport [823a62ec8aac4fb75e6e281164f3eb56ae47597c]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/qemu/qemu_driver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
+index bcd9bdb436..8337eed510 100644
+--- a/src/qemu/qemu_driver.c
++++ b/src/qemu/qemu_driver.c
+@@ -6615,7 +6615,7 @@ qemuDomainUndefineFlags(virDomainPtr dom,
+         }
+     }
+ 
+-    if (vm->def->os.loader->nvram) {
++    if (vm->def->os.loader && vm->def->os.loader->nvram) {
+         nvram_path = g_strdup(vm->def->os.loader->nvram);
+     } else if (vm->def->os.firmware == VIR_DOMAIN_OS_DEF_FIRMWARE_EFI) {
+         qemuDomainNVRAMPathFormat(cfg, vm->def, &nvram_path);
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index 61b7a443..f8deba45 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://dnsmasq.conf \
            file://hook_support.py \
            file://gnutls-helper.py \
+           file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
-- 
2.25.1


