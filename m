Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0C5EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:04:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3272.1689930295407656275
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Jul 2023 02:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65663cb7d1=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36L5vPps005684
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Jul 2023 09:04:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8adgqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Jul 2023 09:04:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjZRk3zmFjZkLfg21mOdkfZeIUKdOvm5KoktxF3VKancTiZWNgZg3DIIU7wcvw7SKYCnzybmr+DxQVDa/8v4sue5okE653qPMj2knCZj5sbgBnwuufotYkzFRQ0Q/fgIqsvmLRlqbrD2oePV6KEJ7i+Y8rUGEjsSv1qTrLkGmiG7Q6tdtFGCLCSG8cTXCtmR/b7oVV7rrgIAcexE41MdZbkUcI2HhvHmMLPMGL2RLnfBKSW3i1BlrL0zMSNWFhHVGDg1Vepy4HWd+9sE2MyZkRwRK/F6IU2ljgMpGsBcP6LCB/Hmmm2TVjqqmA0f6m7yjm1mI1hFW0SNxeO6QhYJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj8xMN4dulOhl4nraIaUA5trRxTwWYktdyO5qwTm6d4=;
 b=Tjr7DCxbzJ1IE5j7B0PE2iJNDj45q3reWOaLcaekDGtasPUXZSZGc6GUN3exzQ1M6yFl/NP6g8BTX/U9lzBGiLkVzuDaMyYhPdFP6EeY4Y0+99VcP5wmqkipnBtI1r2p2XMwsbgzg4yCW41isJGcHTNQtjUBQySD2x0yaESTqSSNgjhpHhF9BRi0YC3dMaeJ5YRA9/Zo5C6g6SGsiujyt57zYaJQQO+KGaidDdWksUnBp7Z7XuugfcrmbemPb9jVp66TXiGQx6m2HxesV9ctOhxzltNz55uQLPXyZocSczX9TSRbra6jf9kFSjY11brWzhdmIEQG6cbbANJpAbTnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 09:04:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::c8f6:72a0:67fa:5032]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::c8f6:72a0:67fa:5032%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 09:04:52 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][mickledore][PATCH] ovs: fix some installed packages in openvswitch cannot be executed
Date: Fri, 21 Jul 2023 17:04:32 +0800
Message-Id: <20230721090432.3664891-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbc03a7-f9ea-40f5-eb57-08db89c98b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WcUX3q1gYcL/HZXdNv0xCv7AJj+ic8w508wfLCou8TjGWcn9s4VHFYNxndQR1q8oZ0sA6teT1A/mrBUPgMN74XlwcV8OAWV+QYh1bzHh1nH7zFXWX6wkPO9WRYyFDZkt+i6h0NcVz0JiPsN6c+fG+Nr0UXQax30pFR2gHVzbml8Za/7Kqw/mDVDFmuG86IqwjHFNd0M1ky/KmpSqoY7lO5/tNwSajqakY9Rg7/1+n+66tpCiYzxjDZuHjhk95n1RSdxi0DcaoNoUijVJr9suHk9geq6fBkVr6pNW0K+NBdUnsAacAqt2VLpycc1+/tPYQVKstYxkK/ABoTQWnQs2pPWjoVdXGGgudgEz8LN4CoPPYJYrkwlfAfocvrgg3vuac6f5WhOXAZMT5tU3hWJuqfRgipWZvqUGw9JAfCqA/LXyP+prvA6ytSw4vVTX26QOsbDaFkSOyEZWJlBtWCJVX68JgyAfdf85KsOIB21MfT1M0ZfS3UUwPy4mqfpKsPOg0lJXPGeBODva2lyy/CXHmBEmLDLmnRmo+gpOwqfiWL84bfPr6H4MHc8LwcRuGq5K491D7L7ahP5avPryxwiC9MbzYd1/8C5/ELXcUYLc/08fXOJBnvyGLrDGFJBK+5DL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(451199021)(38350700002)(38100700002)(8676002)(83170400001)(5660300002)(2616005)(8936002)(66946007)(66556008)(44832011)(66476007)(316002)(6916009)(83380400001)(2906002)(41300700001)(478600001)(6666004)(1076003)(6506007)(26005)(186003)(52116002)(6512007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DtIbG/VnRJJ/lLF7A/7xRW9IvLwco6so4PaDLIZ98sEqOfaIo6Vymwgkmo7w?=
 =?us-ascii?Q?edWXXuKnvc1xV2G4HfvlCteERQqITvBUtYVsHSq1eWbcQOoAOAk8ZW9/sMx/?=
 =?us-ascii?Q?Bi/Jr0gz0L5vfK/yNpHKWqo6QzEtkGOsY6xNiui7BLP0VtTcyqQue2Qf5Wzt?=
 =?us-ascii?Q?MVxLEer2ATy+eIcXX0zNz8o4/ZYxlXpGiWuSYp3zumFbCknfevFCWCw1o6b2?=
 =?us-ascii?Q?7B7C+w/keiH4taLbKWyFkZJOsMOBMidRnwPMw3Nc94MO7DGETmJv7slkP8vT?=
 =?us-ascii?Q?z2w3ViXDTQ2oePRT5jxHZfI3DVnyf0EZ5ZaV9/x/E9bthaixnQBA4IJ+XdFs?=
 =?us-ascii?Q?bf88N9G6BbBF3Ht1a+H6nVgFpGj/xvjooXYFeCqvg1mQcNgzLQ8T67Ye8k/y?=
 =?us-ascii?Q?bb0kEErdyHyjVX//xOwSaNUAB5rhpnapsP264UB7LiJWc6NGzVoMmnjSq72r?=
 =?us-ascii?Q?q/Pwj+mbi2nuHkOaTXIJpvHBede/ce40Vs+Eib9qfY7pXySEfqy5ItIzXnPx?=
 =?us-ascii?Q?wz4mSxh7htVDDck+TvXyWV33dRng3fIJZob+AhGSjedtLsrYLrLpxmv0z+84?=
 =?us-ascii?Q?y0HsklrYxLPIbnWrUPoqxJfvlNLslo579rF7vUFLGbpnCmsstvLngJBfknVZ?=
 =?us-ascii?Q?ZAUAPGYcl6HsmrLOzU6IYDr47361YSHfd2fi4TphxrRIEjigCRP1opYVdqKq?=
 =?us-ascii?Q?oacaC2RfR3iCCwgRFfsQGidb16dSeWcAuBU234UDDyn9dmEivTPPwuGWzhQs?=
 =?us-ascii?Q?thWf6ORKnWVSrzXyEPxfmUQIMVJYpsFHMXj+DTlyanZN73PXT72VmvhfH50L?=
 =?us-ascii?Q?3wjR9sYSXD6LG7eT+t1eT6ePBLUdBaSQB74siw++1+87QqihNB2OhuTPdhCj?=
 =?us-ascii?Q?Q3fsVfGxgMdJ3YUCxN34V16CK/IBreFuX+Ry3HBBLSFNAEJEAERkPYHGdZOI?=
 =?us-ascii?Q?9JopDNpJJqpA8iu0lx2DWkVwECya+5X508/j00p0HTD93pC8IedgT/kxoLV8?=
 =?us-ascii?Q?579TEz8L/1adOYrtx+dp09RST1K9zJvgjK/z8O68wXWX+Eq1DnIXzTciP/gj?=
 =?us-ascii?Q?7xDi7H9r2I1j23ILnJJncoLgympNUjzr9gDlhUETddq5WxByo8WtsoRUy6vZ?=
 =?us-ascii?Q?0O+5j9ePUBjaXU0sT6zXfnSXod0zVoLfnuLfCk6IAyrj4nC3XEL+rK/yBtqV?=
 =?us-ascii?Q?HPcyORXEL1F0eEqcfieFarC6bzI2sFAoMv2yAmAQi4CkE+lULlMQHo989MTL?=
 =?us-ascii?Q?CWUhrJADrJi7ptfvZ7E3Y+ircpMgzMG2oJj1qD35x7/GJ+rpZxvT6Fjpetai?=
 =?us-ascii?Q?n/3sWLuV+RukPl3FUcGG1SuYxwGtqvssZiOEH9a+RqRtCdS5sdL6l9I9I1SS?=
 =?us-ascii?Q?/TaZ7Czamk/8AXN6jcI0UUaIvO2Ccl5tjXSUWW9YPPPP+bjSxOFrxr3SOOlS?=
 =?us-ascii?Q?c2pkjMUYs2cYTal1oVVSYozHIvyM3aHd/AxQcZoXmKpz15RGkIgv6UJa/h42?=
 =?us-ascii?Q?5f5gwM2kaDMTyBi9x/HAaSuUW4cC6XC04fa/8dEJ+Q8XAZ8ET9PU6QeKbEkR?=
 =?us-ascii?Q?2jL7pqhGu/nKxj6IyhVVLzfZQ/TdA7tL2Z6WvtzbassibIBjfBgGfpAcC2D5?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbc03a7-f9ea-40f5-eb57-08db89c98b3c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:04:52.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxn/Fqkj+1ehF3qIaMIrWERpO52I58P2lleuJO+LewPpAxyO3G6doyhgSBhP5y7guyrWItJJ8rDelvMSb/vU49SgBsahZsPMltu4HwgY3kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
X-Proofpoint-GUID: 3KZiMA7pTxFGxO7zPbhqDV9LzBQ3B2_G
X-Proofpoint-ORIG-GUID: 3KZiMA7pTxFGxO7zPbhqDV9LzBQ3B2_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_05,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=986 clxscore=1011 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307210080
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Jul 2023 09:04:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8129

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The variable "PYTHON3" in Makefile.am set as python3, this cause the following scripts error:

/usr/sbin/ovs-bugtool Not found the interpreter python3
/usr/bin/ovs-pcap Not found the interpreter python3
/usr/bin/ovs-test Not found the interpreter python3
/usr/bin/ovs-tcpdump Not found the interpreter python3
/usr/bin/ovs-tcpundump Not found the interpreter python3
/usr/bin/ovs-vlan-test Not found the interpreter python3
/usr/bin/ovs-l3ping Not found the interpreter python3
/usr/bin/ovs-parse-backtrace Not found the interpreter python3
/usr/bin/ovs-dpctl-top Not found the interpreter python3
/usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
/usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
/usr/share/openvswitch/scripts/ovs-monitor-ipsec Not found the interpreter python3
/usr/share/openvswitch/scripts/ovs-vtep Not found the interpreter python3

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...the-python3-interpreter-with-usr-bin.patch | 43 +++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch b/recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch
new file mode 100644
index 0000000..472ecb5
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch
@@ -0,0 +1,43 @@
+From 5053d98f6595653dc02485810fda94348b6e8a1b Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Fri, 21 Jul 2023 08:47:51 +0000
+Subject: [PATCH] Makefile.am: set the python3 interpreter with /usr/bin/env
+
+The variable "PYTHON3" just python3, this cause the following scripts error:
+/usr/sbin/ovs-bugtool Not found the interpreter python3
+/usr/bin/ovs-pcap Not found the interpreter python3
+/usr/bin/ovs-test Not found the interpreter python3
+/usr/bin/ovs-tcpdump Not found the interpreter python3
+/usr/bin/ovs-tcpundump Not found the interpreter python3
+/usr/bin/ovs-vlan-test Not found the interpreter python3
+/usr/bin/ovs-l3ping Not found the interpreter python3
+/usr/bin/ovs-parse-backtrace Not found the interpreter python3
+/usr/bin/ovs-dpctl-top Not found the interpreter python3
+/usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
+/usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
+/usr/share/openvswitch/scripts/ovs-monitor-ipsec Not found the interpreter python3
+/usr/share/openvswitch/scripts/ovs-vtep Not found the interpreter python3
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 28e85d422..031bbf39c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -154,7 +154,7 @@ SUFFIXES += .in
+ 	    -e 's,[@]PKIDIR[@],$(PKIDIR),g' \
+ 	    -e 's,[@]LOGDIR[@],$(LOGDIR),g' \
+ 	    -e 's,[@]DBDIR[@],$(DBDIR),g' \
+-	    -e 's,[@]PYTHON3[@],$(PYTHON3),g' \
++	    -e 's,[@]PYTHON3[@],/usr/bin/env $(PYTHON3),g' \
+ 	    -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
+ 	    -e 's,[@]VERSION[@],$(VERSION),g' \
+ 	    -e 's,[@]localstatedir[@],$(localstatedir),g' \
+-- 
+2.35.5
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 842ac11..9d3101a 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -26,6 +26,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.
             file://disable_m4_check.patch \
             file://systemd-update-tool-paths.patch \
             file://systemd-create-runtime-dirs.patch \
+            file://Makefile.am-set-the-python3-interpreter-with-usr-bin.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.34.1


