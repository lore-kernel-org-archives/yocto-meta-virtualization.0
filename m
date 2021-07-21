Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1626.1626835470833423089
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 19:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W+Bku8Zi;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28367cf104=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16L2iT5B013241;
	Tue, 20 Jul 2021 19:44:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=/4zjXCNJuBIaGg8b2oMvKA4/CBnpy7Wk8HVNtTfhUNw=;
 b=W+Bku8ZisoPWyi6hkCumvGKnDhP/Fnv12c6BPLE1Dw3fDFdOBJYmOXIHE4qslRGln74g
 CfSbWR3KtVerGjO45dhZCtWDEjBRyWKj7W4tqDCJHsT+akpPZu0+PRNw6Cd0zeduSx8Q
 l5YV2Srm7QOiGF22PAPXSdwBL+gMX8Y4y8Z0lX1iGSmNsOVgfBsKSLVCmcRUWrho9u7D
 sGjPQY07eaxgKCsfS7fd9FPC/sLMnAnmxnx2vEdY/FsVaSQqsV9XM2838vAuXrD++qbo
 3VHgxAvmwKDvt97M2diHsXlFkgkDBrX2VbrfXj0MEo/HHjECsji4l3EWJ9z5Ntmw1REJ DQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 39xb1h8014-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jul 2021 19:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmfmqPXG6zPmQoYIHQq9tzW7K9DDOnZ0kjmN+T2jnmCB3t8qKh2woRaqGGAIpJcgCEpmkZxalCJBgdnP3AhjZ4nbQ4v0wn2ErKcYZkTkSs9sgGdtj+qkGB+clMBLPTCatiFAauM1kKylikeWbP98g1kaQb2ixSeVG8JZuzgdKAR0MPPae8ZJxiOxFhbnuknjlYE7q5Cf6iDr8aGdcWhg+HtlhejRDLhQLbEgL+Vmdy1elAD17BWOTN35KcWVtKJ9nhuT7fnK3urFRHyEJtgUyd4d86FTKRjG5LMoECGL4ud95JURWpr9Zp5AKKpf8OWTIC1NaxqiZYiYWrjktRe3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4zjXCNJuBIaGg8b2oMvKA4/CBnpy7Wk8HVNtTfhUNw=;
 b=MKEVAYqAu1ub8WWgdRrd9lqKgBQPAqNhqCew+nH/AJxU7quEx+wKDI3Ku02Q9lE/eHCLDyAOhFg3A3BlUvaUPqsjxEusKLIBGm79TRgWcbCjyplGRoh3RR01Vz+pJzMEeQZZpBkh18QwQbS+gtQxEDjs47k/DMKRFALVvHcbF72Fw21n9131E9Uk9MjPgD+WRzSxY1Tq95U2i6hA7Ef8TlmFplheiCza5ShRKtVO7Kv0d8VIySkEU9u3bi96agKrpWE7y7jK6HOICKAVD2P2Qw+JEkTw1LTGpFLUr9cg5V9T/Vu4EmBfhh5XaKYYTyywPZMSvQ3tmq9be1Tplm50Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 02:44:26 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 02:44:26 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] k8s: update kernel configuration features
Date: Wed, 21 Jul 2021 11:14:14 +0800
Message-Id: <20210721031414.14596-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR02CA0170.apcprd02.prod.outlook.com
 (2603:1096:201:1f::30) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR02CA0170.apcprd02.prod.outlook.com (2603:1096:201:1f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 02:44:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c381c58-098c-489d-2a27-08d94bf17408
X-MS-TrafficTypeDiagnostic: BL1PR11MB5301:
X-Microsoft-Antispam-PRVS: 
	<BL1PR11MB5301425B752C1D7BE7D6CB5CFFE39@BL1PR11MB5301.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+tzJe9KdObbjgWoprouFbny6kQFQrCWhu9wzmJ3B7Cb9NsnvjVT7kAPOIC3mUU7yyI9H+Py9g0Zud7T0ImFBrtcRkFe/xMVyW4iE1PzXt8pZAH/y2zxmAprb5Vd5yxu5tpqJhfMpjeXU84yBdcTjspQCn1NDc9Pd/jqAbqPlwaajSi35RcxhPkP+cOZCmj3epjHdY7KnVS/B3PV5Rte9uQAsxdAFxmoPLAAMDlRnpGq2/O/0k5yTfOCuN8i59GF8zJIAGgHWAWu65aSLPd8t2wQDJrS2jLMcSLAysag/Lfwo2meJrAtQZZ9dwlrDaDlCLaXO2L69aaL5stZMz9VKVcgj/fSb3bj/AydxlONBD1OGaPYdyFTp94t9fa9HUlufN2OZOzaKzV8NwdaIfrPlYMtVby+moAFn3OSVeriIUW/EX62NkbzI6aBG1qruJ610HlRVMJZtACfcg0ePEIgJEfU8N+AqnfhOQ2jTUaa3BFM1JxJRKbCfmb1KABcg7E3bMxgJf6Moc3jhtoJopt/+dWXo1ooponYErCPTdJBRDyF8wpDStHhYYJY2XTvLZearMvXHwal0/1bMYqYwQ3SEdgEwU69fbJLWJL63IaVU2T25Q/fBSqX5eVl/IXCY0vXHyPsWTe8Ynwm93ni1kzqQS9qwAbzLgpFeubW2qioKBdav+vizN6+RNosqOeSX3RGG6iuj+TJ/jW1YDS4JePGqpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(66946007)(5660300002)(6916009)(956004)(8676002)(9686003)(6512007)(6666004)(8936002)(1076003)(186003)(6506007)(4326008)(316002)(52116002)(2616005)(66556008)(2906002)(478600001)(38350700002)(36756003)(6486002)(38100700002)(86362001)(66476007)(26005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3dnzm/l3CxxjB98kqwvAeusCQSY/QjA2INamrUGvHpB9FAUPjCFVWFPtO9WL?=
 =?us-ascii?Q?4Iiu7c98QXPlWU+DwSCTtPS191M9DJzVmeYmfQNPZTXxDhn0dbR0WJ8G86n4?=
 =?us-ascii?Q?QHh0HoTgsbCDYf5/RtNhgaO2xBeKjCdUXQUBAsoK8/xlnr0Ax/flp2J5x8fZ?=
 =?us-ascii?Q?BBr1KLNRfc3MA6SXT9PFhypBg/sw6jhbuh20gMLu6md3C6/jTElYmXFzTPuL?=
 =?us-ascii?Q?9tWkFVSs/oRnVypZisNtIHBbSKi5m1GFpRujXy3dRYA4G/xznsmXH+k1oG3e?=
 =?us-ascii?Q?cyrwJLgk8Ar454OYPXH1UMkrTAlWTlvMP/rhqu0t7bzHTzXCTS+HDBSh30Kt?=
 =?us-ascii?Q?tkcqxPyRAA8Rz+4QHCe6mGJ+n6MCav9DSkid6iMhAl7Um0RW4PLeXHJ739p9?=
 =?us-ascii?Q?4XfILy9htXmdxmiIeN6LdEo1NWjG3fJwIDjzuWHO+FkOtWi0wUTOmWy/6UlL?=
 =?us-ascii?Q?VOQOYpoiQ6VEndc0ufMxbsEcdbyj6z1VtPRr2GMhxlICCkUk8IFk4BFIJBJs?=
 =?us-ascii?Q?7k3RMYvXEiWROedQQtQPSIVybzvopCR2AzNL1antbUCGZQP0PYc7MjEcNoID?=
 =?us-ascii?Q?p+f/SL54Ro2huj/PgxwCLdGjgXpD6xbPRgr2C0PRkwl6oR0jRcKhELyjwXcf?=
 =?us-ascii?Q?jXktv61PZKzdxeDv4eHarExenIt/cBiYgJjDQJtq4S7qcUeDXFpKIvjW+Gqt?=
 =?us-ascii?Q?Q8ZDI70pqqGlbElZoC8Phpjnwu+wT7DOqB1tdrzh/a2Pedxqqv73iJQsG7z8?=
 =?us-ascii?Q?y3BcpM1HGdmlqeV4ppygTGRzKSh6CzFrL9MLONRWuySbvRaGpR4S2rRXA8wu?=
 =?us-ascii?Q?GymDbsI2Wg4UTzftB0Bgqc68EEE/+NcLtW9wLrQ7Yu5u167i8Sp1nor7hDfV?=
 =?us-ascii?Q?b7wyXmDf8IoMGz9KAit8SQYwYwXbOqN14v4HGIL6ETe45BiNnjTQiAYILdrm?=
 =?us-ascii?Q?ewNUFlG7jq2V8Z0gYte5sN5Mzx7LR8ieiPXmn3lKaLC3roq0U90eqBpomQbT?=
 =?us-ascii?Q?GMdKcJb52VhYQvIIZA2J/hC9QMMuPKOjswijLPsrXpzQqISAwKe2qecUHH/V?=
 =?us-ascii?Q?xd6LTfeamKk0Koqf5tbk5BQHfi40+GM1tArBdvwtPGtt2AHq/9PsMsfwNuXN?=
 =?us-ascii?Q?1pHYN6oo5Q6zWPx9NNTmnjrFRjf22mygogvUGSgRQJ8G+cjjOqjeMP78QNHN?=
 =?us-ascii?Q?/HJ4A7ssVwgK0k9+2a9KV5A4gjKh2YnTHr9YZ4CGlzDdDgiiUIXhswh8y69j?=
 =?us-ascii?Q?2y7cKpBl3XqYd0NMXoCDh6btGT9WRrc1gz6gMn/vXOCEmhBDTdS70i0TJafM?=
 =?us-ascii?Q?wBJORRjlQbvjfiQwLRCrDCWQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c381c58-098c-489d-2a27-08d94bf17408
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 02:44:25.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ctrwO57fdQv5SQYKuAIssj6JSUO03kkNzkKiSU2t/hpbVo6EkhmtYNifBN5JNCUImK6q48yMVcIW8syU/fmaFgn1yZhF2DWjajxOP/+65Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
X-Proofpoint-ORIG-GUID: UYspx7yNZ8FeOO5ORVnyBUrfLDXjfXXD
X-Proofpoint-GUID: UYspx7yNZ8FeOO5ORVnyBUrfLDXjfXXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-20_15,2021-07-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210013
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

Add kernel config fragment according to the requirement from the file
types_unix.go in source codes of kubernetes.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 .../linux/linux-yocto/kubernetes.cfg           | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
index c3e90d43..2d4e1f54 100644
--- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
@@ -16,4 +16,20 @@ CONFIG_IP_VS_RR=m
 CONFIG_NETFILTER_XT_MATCH_COMMENT=m
 CONFIG_NETFILTER_XT_MATCH_MARK=m
 CONFIG_NETFILTER_XT_CONNMARK=m
-
+CONFIG_NAMESPACES=y
+CONFIG_NET_NS=y
+CONFIG_PID_NS=y
+CONFIG_IPC_NS=y
+CONFIG_UTS_NS=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_SMP=y
+CONFIG_CPUSETS=y
+CONFIG_MEMCG=y
+CONFIG_INET=y
+CONFIG_EXT4_FS=y
+CONFIG_PROC_FS=y
+CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
-- 
2.29.2

