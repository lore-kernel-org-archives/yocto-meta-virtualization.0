Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA9FC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 01:49:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28541.1668995355625253149
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Nov 2022 17:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Pnu/nvv/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8324f9db88=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL1gT9m003927
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Nov 2022 01:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1yrygtpEzwYoubMzllv+PgiXMjb5qO+rKOFdGII6hDw=;
 b=Pnu/nvv/vtFhAB8eYfWsUSYlT/1wQt+/KeWnIAtlyTIqkGuJ5B5UU3yr4NuzGrhSvuQ7
 E/6iwU+fBauzoK+isgRsTRod+MRFpwz3O1+FN6LvSrEQfRnR7MXFlywezb133/RY5yxw
 nywsQsCm8pRUUkw8pDe6HUNXb5o7414ca5HPmwdEFFzfMXS4m2sE1doPffc/ARXDZKuX
 08QT+p2paH8FWELamVphDSwHeDcxvpW/JdFDsvxaSNVItlebWCqwZX4BTRMe4sxgvBgc
 fCeCOGRRctOqTkZ0L/9nx1GfsRYhkoiY8C1GI5nxICfVG8or73uexDTg4axtpL8uAWiP 4A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj189t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Nov 2022 01:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5JcZDuyXXmonWrGrVnaBSzFVyam7VwnzmiMBOBMQ+rs4WaYQPAih75WiU5MWVngkb+E+4LTxLy6p1y7zVl1LYw5GaKuNfOOFD5hOwQhqlDtjTNDQ6ExMLWYSzeW+S5ddZt3SpUsbLvFv8WVwtNaceeyxQkwXi76AJYs02SVaxO+Tji43oZUxq+OkK1YEsi7MsIs31Ecp2iaQhRicvPiAK8e5sqEDQQq0KxZC7fWo/aemhqGCrL1VPI6qwW6WBRIkvbyfhzGgDg4Kex/+RmctFN9vz/zwamBH/zz4SgsaZ6ohcvkk+57ZMNQZAY/N8UMlaRpnfLQsM/mIuJcZJpeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yrygtpEzwYoubMzllv+PgiXMjb5qO+rKOFdGII6hDw=;
 b=YeG/cHawsIWxCVsK1Vke5krCDqZ3zLxY1GOtCWnPjmSn9JVJ80yUD7ibdYk6fqA1UNfTJBGImGvawTedmWn50QejPLh6vHFls4YjdiQ/D7Hft2xTzmQPj1lHZ3ZLtO0mGD5r6FU6gwIyaE5cxjgwFL/ZvXeSvnvbd2OXcJxdHn8UIG4QHEdaQiGB3NEB2gJlXjCc/pUw2T1dUdMk5itCxINwKGgTy8VKSxhvyyiGMXkXeoKwELDUg9hwdv5yNKwQuL12JwQT3i8qc2Rf81qhMDMjls2OMzGLWNTgCILKbM/YH7+JO5q1NVhyh6NM9S9Os/4NlfOAO4Y1vmMPjlWX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 01:49:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 01:49:12 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] docker-distribution: do not build for riscv64
Date: Sun, 20 Nov 2022 17:48:56 -0800
Message-Id: <20221121014856.31761-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0dd948-bafc-4017-27b0-08dacb6295da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B7YXg6dOvtiRXp8hmA0qKUkxybqhY2zvKNIZYQSiWY4ajpHca345bVMkyQh+DgssOYStPP4dCKHIlnsmTCUoxE+3e77of8N7SwiU/GxUzHRHR5QxLhefW2l/60P1q2gluVNhzE+wEKjvh/t+9bCsj8F9hnz2gBd0oBb69ZA8OAHEEdsh1YPbp7qGevfR7AYptgap2FxNNeMN6E6KshP3oOG9vTS4WklsrTllUBaoiJx3yDzmFf4NGRKuJbAGI6x9pubCZz1ERCEqTjj8Dwzj89InlPGMLP59CqWEsYsIJJjW+kjfxXcLSNaFuWavwfKMSRUDYMDxb7ZopNiHTHHhldOQCboEf6YUUCOV9qGmS5Hhvp984p3u+gdnwUr80CiulzqSFPWwRd0oScxE9thoMqoWL1eR8CIzrwZHcq5sZFbQrk4Om1hGCmbkVd/d0J12/qtQF0KEGrbfmyaPjRRheQVnZwD0DRQHO/wl82QZorfaWZ3H1aG6AUTdDwCJFclHioBk5hPkWzINqXlRF5XqvhLReQjqwrzjem4PjhpdxUAfy3vUUrsDWnnhS5b7EIQYatvYBJxEDonOGQa3TPQLrPhdhYkcRzoYZwa2pTKTK/wqbbcjw8sJJiq0LqgHYBCPs0ylmDx/Bd09h4dEaguCnGDMT/lnWitzOvGwrqUdUPZjt9geWeP73adIwp1xH8Vk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39840400004)(346002)(366004)(451199015)(36756003)(8676002)(86362001)(38350700002)(2906002)(8936002)(4744005)(38100700002)(66556008)(6916009)(316002)(1076003)(2616005)(186003)(66946007)(6486002)(478600001)(5660300002)(66476007)(41300700001)(6666004)(52116002)(6506007)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RPFcMofkiBjXhnCK5UIzvLrklPjma9/2Icv6CWqqVGnNgek3qpI5uEMGECm8?=
 =?us-ascii?Q?Uo8jABW46n7gLEZUcYbjhhwwjQy+6e2aHQ4hpORpIOIKRPzgD2QHnL1UaI4F?=
 =?us-ascii?Q?EoPAGdaZ1NGCIqxhnKVfUb7RLQNDf8TAYQHntaM9yBUdnTCQ4eeUCnyeLM1b?=
 =?us-ascii?Q?dFrfOgq02F71l4ex6I12KM4mHl0TXl0WygzZH5OibXvvGNrnmZmKPWe4Pm0E?=
 =?us-ascii?Q?ajXAM9DjYXV1vHF2D834N8fioaFoOinlHTtks2N6fNJI97b00DVOcQW7P4IY?=
 =?us-ascii?Q?s16W1FxuIoaXWKWpclKzBbsMWcf4M1ptK580ikVoiT1pWrpyXNxSICPxv9UG?=
 =?us-ascii?Q?l4GLRddthMr95aOG8h43IlDLofHEdWXnkH2RtdgIFVQuSD1hm22EJeYWC7rA?=
 =?us-ascii?Q?tcLlrDDsB5/aLTk7KHli4PqVe+WuwD7Yt/t52WjGb6cBqnl5lJkJlys4GIzN?=
 =?us-ascii?Q?XvmXS/ZKPMA6F/gyuuOX6VK0UvlIpZo3RFwmx7Ywie3ue/UiwHD3+e5TMChj?=
 =?us-ascii?Q?cgOd6SL7blHMXTaXlHYlDehD8xMfW9YtoGmoS7zxDL4N+eIKusFqb6tNnrX3?=
 =?us-ascii?Q?tQdTQ5tTm6YKqI+tKc7g2W1U+OYkVMWlxP5Vl+XNA06OJ2Xk4jPhimQiCpio?=
 =?us-ascii?Q?uWHZYwnL0C+0llMscTzp5DcN30gvATIvgWUOipoqvbRvWls88kkrb73g0QHA?=
 =?us-ascii?Q?O+d3vE2O0KgWJ0naHHZ/yU1XDadvl5Jj23xgRWhE1YIDu1yTojAUPHa/pNTr?=
 =?us-ascii?Q?Y+YsAR6ajw9gnD+osT0Y4+4Bf2A+6NGTB0u4I1kTtajfwd2RAE0mNuDwMMn3?=
 =?us-ascii?Q?TjvYV8G/KUtIYePDEyupyNodiji505jJT8f0dPALpVnvXbQjI1telNu0obEe?=
 =?us-ascii?Q?JdblVHsf8ocLUiBG49gsH7SeesbsLyN34nXgeCa/I1ZL2/KLViG9/6JbP5x/?=
 =?us-ascii?Q?4Iq+GToLCJlBO7XaApnEfXQYGzPGXGzpVMYBBm4WhBip3534U27okDNVGMbx?=
 =?us-ascii?Q?h+Kl4tSFB86pYiB6mmSaeXWkmj4ACNkdsaJbx5fAk1C7dVEWzN+OfGrmjZTH?=
 =?us-ascii?Q?qPYOoiIaqP/xEG5aUGZeP1bKHVqPwQTR4rNjx0fFS9Y/0I2byI1B/T0xk+W+?=
 =?us-ascii?Q?+dirfALanli7kBLy+1NAme/lHsjoRxaeVJfyETcpVrqw4vn0ILna2bwPyUoI?=
 =?us-ascii?Q?fwkw+he2hRW9eeF2V8jDrcy1nbZylVcw0ypXgbeKiQecJB4MErpncvDgaVt/?=
 =?us-ascii?Q?2GmR7MDQkCDvJxiBXJ85ToEiVo7EBhvDGcN+4Cqgue8L3jCtqb/l6rwc5W+6?=
 =?us-ascii?Q?n5bmLqnf7ghXUMCzNKqLt5x3PBHrA53Vpd/Q+jAns3+2PpXzZ3/i4UR7/5SJ?=
 =?us-ascii?Q?adWXRZaimod/cfOidltOMIK74SaYUZFkTfyj35gWIzHcDe2jHtw2cnSm/bQe?=
 =?us-ascii?Q?fL5tEjQW+hSnY2dSFbkIWxMjdhcQi8tU2NUTS5fMHJa/qAQwWKJog13D/ax3?=
 =?us-ascii?Q?F0hm9e946SaBufWE8mTu5B49E+vhu5t006zdQuBHqCRzMC4sIpQmNh6wjPjD?=
 =?us-ascii?Q?G2rY3SD8c3wYWGZvHG2uC8Vr0VaDbSgCdmMUMs84?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0dd948-bafc-4017-27b0-08dacb6295da
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 01:49:12.4879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hXR/n58rEsTRl+H9OKV0WSYXm4abrIQiKiP437AvSApcHEfKY3aQqH6NkQLIpvpV6Do4Z+GgmNYUCNPKiJLDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
X-Proofpoint-GUID: 2KcQ2hVbNMGp8eGKCz0Iv081rqgXy7w1
X-Proofpoint-ORIG-GUID: 2KcQ2hVbNMGp8eGKCz0Iv081rqgXy7w1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_01,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=6 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=6 adultscore=0 mlxlogscore=527
 priorityscore=1501 clxscore=1011 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210009
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Nov 2022 01:49:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7690

Currently docker-distribution has a do_compile error for riscv64.
The problem could be reproduced by:
  MACHINE=qemuriscv64 bitbake docker-distribution

So explicitly set COMPATIBLE_HOST here to avoid it building for
riscv64. When someone interested in using this recipe for riscv64
fixes the compile issue, this setting could be removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index d0cd8f3..86fcd62 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -73,3 +73,5 @@ SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 RDEPENDS:${PN}-ptest:remove = "${PN}"
 
 CVE_PRODUCT = "docker_registry"
+
+COMPATIBLE_HOST:riscv64 = "null"
-- 
2.37.1


