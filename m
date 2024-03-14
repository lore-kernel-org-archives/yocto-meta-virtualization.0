Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44429C54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 08:09:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7465.1710403757166036507
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 01:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bw4f9uUF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3803013c84=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E6xjvm019709
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Mar 2024 08:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=HMK/+wWCaY+8qGpE2s
	wJxivPHtwUK5UMbU+YU3P1xN4=; b=Bw4f9uUFFeRXq1CwtGvDXNxCBc4Tpt8l8S
	7QT60352bn0/CeXINKKyYTPZfeEVkGAmIlFhlzobGKvyXZJAr8ctnkB2o/ZKGD+2
	1AVqyCfzx3dQLBUxbvLX10oQXlpvM6hpqphWvq8yOZ4YfUNcigtV4N+W7tDZPW/x
	un8YSJZ4ACwu8Wk9tgcdCYRrucntKNkMwJDaXH4s9dlD/7d/u92dO0IRfwj4OdA2
	6vHNNdlxgpoSWeaUB+kGIeUUR3okvabBTdVXBp/stSU9Uid3PQuhX/uPoi+oELEq
	eKKiiUfVkYvUP/o2zdC3ZyMPUYXHCQkM7vmceLF5B8/VmU+J0u5A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrcyxw0vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Mar 2024 08:09:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzGclelPjnF+uXFWk8J7988HLHi+NIsZCh3v36S2MVOapt2Tp+OuheJFAK1Sq2lD2yZSaP1WVamKm43UuuzfmrVV+64e9B+MaHftm4TH82a7DmejM+9ImRY7EU1dTZYrmN3GvX+U2Da6OFQR7hEkAH4AZ8PiT3C0xtU8grh1CgAgBqoe09SamiUPpcQ/3JURy0ue92zZeDdY6rtE2uhtTAdznpWZGtWFhpoFrzUYRoBf4Y5bOVotZgY9XXJvGmdSCmFnJcFLSQmD2V0qxW6YZNxQmnlfiEzj51Hpf6prOKZvx3VVn3Y7IKr528SY/F3lB8YT6ONyvRDONmGWMqsr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMK/+wWCaY+8qGpE2swJxivPHtwUK5UMbU+YU3P1xN4=;
 b=TRS8iEEp8Dh2YK02VSA+/9GEkZ1CIm84cq11cYzfgFuZEyCE2ojVIhC7Gx5GQ8o1yAXTdZIhOBP7+G1OsZ9iv7l3oMvu/PDoiQGJP8COfUrI3vPzbFhHLSgENWCTzwMc/B/yx8u63CB69xUFTyAFf8D6vZwdTLu7LhOQ7ZhT14uRbeihoypTXavRZh6dVxqoyfo1VhBUPrxC0ypisfCbNpTlOqsLPOkhzNJKe0tYXUZIoNRE8G3xxhHQcF4GpLEn8o42Mh83Sa4ILQxyP9LGxf5Jn0x6XSl89LAkk9l5lvuFfjyabtTGIAK5c/T7ZtiJokYrs5l2E36EcOIoHwtFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 08:09:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 08:09:10 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master-next][PATCH V2] ceph: fix do_compile/do_install failures
Date: Thu, 14 Mar 2024 01:08:58 -0700
Message-ID: <20240314080858.1934776-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 194dc7a9-65d5-4be0-610b-08dc43fe06d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5A2rf3g/9s2Z6QfPnO2TDdg9sAiId5YRGe8ERtZC6xyqIKP8raMRiYPJGCIfbS8NH0AkyuwPyB+sPIFs6z4ovJXlwDzvqMZBJsBMQP9ktyJfOALW0ys6CHwRUjXrpxXOBZIDuVkpfXmBbo9qYWGnPBss0nYLksOdAwfaLMfUr38u/HTcTX8uqPdsYrLWQ1ShODRR0yUYrvVCztdRjAH3cl7pIgwPSiRfPyOD3LnHVjzFl8oKdgpkUZXMcS7hGdBMV73RKQ9Nldv0VmbQM+XX6DT9KL9fM6ST5qKS1KxNiWuQC/hYJBAJ3KoblYHrnbYwtKdVwgXoGA33qZIx53EhjHwar3RTrcaTq/TdN/j0Y1MaJHC0gnm9w+CnYGK01ODOSXju0gw2yXaL+nN3XXGWS2aNuRF+OME/EjrvgTE2Ek6EggSfuBJyuDnM3zVISP8klry1iZSH3uMeA8Drd59k0sZpiXUHneSMCUNrEyDuefwwgeHN48fqZJhsA1tPq46QK8vJhVP7X27vEIv8jVypv7lKKek3sySzDKib8IuBy26+jOChpYB6r9lkaD5/jLZbYlZ/bIPBj1/bXKIBN4DNa6dqILl7PTu7RPIGtXqQdSGq36uQffb+GX5A/phCTwaWYY29/u+FoCAe0VFznctbj6LsSbrPYUoJSL1JrBboxvY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eUnwVTtt49pfYN0BxVhLTUbLPgwCsTE5wnkIJCr+tdtap/kCH/7jKApa1XPj?=
 =?us-ascii?Q?W2/q9mwMtTUwaFjO+Ey1p+5QF3FLuZINoqYhtAmWohpB7Wwa/s9dK2KRPjyl?=
 =?us-ascii?Q?YNT7IS2jaKNmvNhByzPKlB3e0QhoygE3IVXm1wVNFlOiAcKCQfHznHPEWkA6?=
 =?us-ascii?Q?qcS5jvChI/GHynF46pD1FOnqWUwSrE3A5Bf8BViLXhEPlpvgUZRyxi5XvQ2z?=
 =?us-ascii?Q?7HL1YFl18YbBIfALC/lZXbS11rXpVPGd9AuimltxDdDPkLvEgC7Uzx5YQNYe?=
 =?us-ascii?Q?PtRiYX+BcYqP3uuu1r2TmQrqQnlswDBT5F1xnuIrySC3TJ53hjrdO5bnLF0N?=
 =?us-ascii?Q?dZYIT9pamx0BAI99GzpJtjRehfKrWvrMVzUTmP0i3jBwH0/P9SUAQFNIAA3p?=
 =?us-ascii?Q?+0Hj7dv/gR2hAoORyw+xIh3CQpb9BRgYBknniGPt/b84RfZzqWSlwXQiuyRL?=
 =?us-ascii?Q?FapJbmq8PMhNJa+nPCGAIbMfqWgcn+VqvntugZ/b0tfnzZaRD9Mr68TeVls+?=
 =?us-ascii?Q?41O7mZiIbh0fDMrKvrR2yPDbE46V6DSppVgkgNb55nYGsxU9OG7cUUVa1S9D?=
 =?us-ascii?Q?riKhbaVaxFSjs77rPqoKKy+7isIl8emsKnwH0VS7Cp5uU61eVhgozRLjReWV?=
 =?us-ascii?Q?XSNjbFKj3jHQA59D3uN0ssjlSMHNJRj2TzkPtPdohTNwwetbAgDpz8wUybHF?=
 =?us-ascii?Q?hKg4Q57NTL77pl259Z4ANu5KI5DBNjf4YEZX6bNw8CEGwg+nkpn8vsx9o5r9?=
 =?us-ascii?Q?ZsBVPoCg73k2Nd0+s0nPh5wvXR4JhCCad6ASDpFcS9lN+NyokPMOy6d260bS?=
 =?us-ascii?Q?kYr70Igom47gY7op9WaeI2BcwhpDdWgPfVRnOO0Y/vim5/0uVhy2s/Roz/iK?=
 =?us-ascii?Q?Pceh2oev3a9v6QOBunzjD+cJ338vfuLIcqGidcwl6piCpP/We9Ou18aPocre?=
 =?us-ascii?Q?e3MyqPnGbwodI1jIP8+tY69TlBPul6+GsF/7IzNYnjhQXujYGnBLkl7KjevH?=
 =?us-ascii?Q?BhPGoh829F4cQJRFMa82BGhnAXLu5Na3chh/BDdS4PsMzhHjym33iNC43L6x?=
 =?us-ascii?Q?XcANhTeBFEClCjikuOh/va/IASRQNBZjB2PHR1dj7iQhglQBbyz4fRq4lThd?=
 =?us-ascii?Q?9Qbb+Jw9UpKn2N0A/2aA0DwGg9qa0XbOh86+rCFr4ED5OPzJNTJ0LjfDzBFD?=
 =?us-ascii?Q?pTcVfc29VG4fkgZgtZKLRtIs1cDPSnaVgqr1gAgIomAdb+nAcVpIRgskZufN?=
 =?us-ascii?Q?HcwfEn9mZNy0UDNLkLFVUIswys9OD8Y2tVX/fR1biYkYFzq6AwU/LhnmbOZc?=
 =?us-ascii?Q?KMn9NRA2HdmiZrb/v+igJHLoysi1gMpF7UG0Jny1f7TxPwAyyKta/Ag9K3yK?=
 =?us-ascii?Q?f+zM9SxL8CSfV7Zi/tz4drv6qCh0JMpaYR7daR6680JrPplmbIXutjCwrkRe?=
 =?us-ascii?Q?RTMIaFW74HZej+z2VNACwzxIgN2O2Sx5nWVzo1QpSgRnfQs/cu+BYTFPdLHl?=
 =?us-ascii?Q?pQingndkwzqW0cpuczQpPvWdncUgWKmG7rBJ/lRsyyOnq08xitQZ+rWnYZwZ?=
 =?us-ascii?Q?LMlLCh+I4EKeVbgllhmEh76IlWNzfJnf61YrC/DVbv8SsCElcyVTIUET6Ylp?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194dc7a9-65d5-4be0-610b-08dc43fe06d1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 08:09:10.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxaaPiIdqCVkgRVob3YvAD9HGKYgf963lgwFS1wBZ2k8RbdH3SQzutfsQKBdiOxPzjNSqP9TEky3EUY4hpE77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
X-Proofpoint-GUID: wBjxuhgedfAbDaZtXy8bqvEqVnAXZjRR
X-Proofpoint-ORIG-GUID: wBjxuhgedfAbDaZtXy8bqvEqVnAXZjRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_05,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Mar 2024 08:09:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8640

From: Chen Qi <Qi.Chen@windriver.com>

1. OECMAKE_C/CXX_COMPILER needs to have sysroot setting in it, because
   ceph's cmake files are using it to construct PY_CC. Without it, files
   such as stdlib.h cannot be found.
2. re2 is added to deps. Seems no way to disable it.
3. 0001-ceph-fix-build-errors-for-cross-compile.patch is dropped. It's useless
   and problematic for new version.
4. 0001-cmake-add-support-for-python3.11.patch is dropped as it's not needed anymore.
5. 0001-avoid-to_string-error.patch is added to fix build error, maybe caused by
   boost version incompatibility.
6. Some cleanups.
7. A few more options are set.
8. BUILD_DOC=1 is exported so that check_sanity() causes compilation error.
   This is a workaround and may need further visit in the future.
9. Delete the conditional check for /etc/debian_version which adds '--install-layout deb'
   and causes the following error.
     error: option --install-layout not recognized
   The patch is 0001-delete-install-layout-deb.patch.
10. ceph-volume[-systemd] are now in sbin.
11. cephfs-mirror units are added to avoid package QA issue.
12. cephfs-top is seded to fix incorrect shebang.
13. Ensure libcephsqlite.so is packaged into ceph instead of ceph-dev.
14. Add bash to RDEPENDS as rbdmap needs it.
15. Skip buildpaths QA.
16. Add ceph user/group, because ceph-crash needs it in drop_privilege function call.
17. Patch the build.py which creates the cephadm zipapp to ensure it uses the correct interpreter.
    We cannot simply use 'sed' against the cephadm as it's zip format.

Runtime tests:
cephfs-top --help
cephadm --help
systemctl status rbdmap
systemctl --failed

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../ceph/0001-avoid-to_string-error.patch     |  73 +++++++
 ...h-fix-build-errors-for-cross-compile.patch | 189 ------------------
 ...-avoid-using-python3-from-sysroot-wh.patch |  43 ++++
 ...001-cmake-add-support-for-python3.11.patch |  31 ---
 .../ceph/0001-delete-install-layout-deb.patch |  37 ++++
 recipes-extended/ceph/ceph_18.2.0.bb          |  79 ++++----
 6 files changed, 195 insertions(+), 257 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-cephadm-build.py-avoid-using-python3-from-sysroot-wh.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch

diff --git a/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch b/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
new file mode 100644
index 00000000..0b4fc984
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
@@ -0,0 +1,73 @@
+From f807220d13adc0656c30d3207d11c70360b88d06 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 13 Mar 2024 03:14:55 -0700
+Subject: [PATCH] avoid to_string error
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/rgw/rgw_asio_client.cc | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/src/rgw/rgw_asio_client.cc b/src/rgw/rgw_asio_client.cc
+index a0ec0bf5c..17880eda5 100644
+--- a/src/rgw/rgw_asio_client.cc
++++ b/src/rgw/rgw_asio_client.cc
+@@ -3,6 +3,7 @@
+ 
+ #include <boost/algorithm/string/predicate.hpp>
+ #include <boost/asio/write.hpp>
++#include <string_view>
+ 
+ #include "rgw_asio_client.h"
+ #include "rgw_perf_counters.h"
+@@ -39,11 +40,11 @@ int ClientIO::init_env(CephContext *cct)
+     const auto& value = header->value();
+ 
+     if (field == beast::http::field::content_length) {
+-      env.set("CONTENT_LENGTH", value.to_string());
++      env.set("CONTENT_LENGTH", std::string(value));
+       continue;
+     }
+     if (field == beast::http::field::content_type) {
+-      env.set("CONTENT_TYPE", value.to_string());
++      env.set("CONTENT_TYPE", std::string(value));
+       continue;
+     }
+ 
+@@ -62,26 +63,26 @@ int ClientIO::init_env(CephContext *cct)
+     }
+     *dest = '\0';
+ 
+-    env.set(buf, value.to_string());
++    env.set(buf, std::string(value));
+   }
+ 
+   int major = request.version() / 10;
+   int minor = request.version() % 10;
+   env.set("HTTP_VERSION", std::to_string(major) + '.' + std::to_string(minor));
+ 
+-  env.set("REQUEST_METHOD", request.method_string().to_string());
++  env.set("REQUEST_METHOD", std::string(request.method_string()));
+ 
+   // split uri from query
+   auto uri = request.target();
+   auto pos = uri.find('?');
+   if (pos != uri.npos) {
+     auto query = uri.substr(pos + 1);
+-    env.set("QUERY_STRING", query.to_string());
++    env.set("QUERY_STRING", std::string(query));
+     uri = uri.substr(0, pos);
+   }
+-  env.set("SCRIPT_URI", uri.to_string());
++  env.set("SCRIPT_URI", std::string(uri));
+ 
+-  env.set("REQUEST_URI", request.target().to_string());
++  env.set("REQUEST_URI", std::string(request.target()));
+ 
+   char port_buf[16];
+   snprintf(port_buf, sizeof(port_buf), "%d", local_endpoint.port());
+-- 
+2.42.0
+
diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
deleted file mode 100644
index 9686becb..00000000
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Mon, 11 Mar 2019 09:14:09 +0800
-Subject: [PATCH] ceph: fix build errors for cross compile
-
-1. set the cross compile sysroot to find the rocksdb library
-2. correct the install path for library in Distutils.cmake
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
-Adjust context for v14.2.3
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- cmake/modules/Distutils.cmake      | 25 +++++--------------------
- cmake/modules/FindRocksDB.cmake    |  4 ++--
- src/compressor/zstd/CMakeLists.txt |  2 +-
- src/pybind/cephfs/setup.py         |  8 --------
- src/pybind/rados/setup.py          |  8 --------
- src/pybind/rbd/setup.py            |  8 --------
- src/pybind/rgw/setup.py            |  8 --------
- 7 files changed, 8 insertions(+), 55 deletions(-)
-
-Index: ceph-18.2.0/cmake/modules/Distutils.cmake
-===================================================================
---- ceph-18.2.0.orig/cmake/modules/Distutils.cmake
-+++ ceph-18.2.0/cmake/modules/Distutils.cmake
-@@ -29,17 +29,10 @@
-   cmake_parse_arguments(DU "" "INSTALL_SCRIPT" "" ${ARGN})
-   install(CODE "
-     set(options --prefix=${CMAKE_INSTALL_PREFIX})
--    if(DEFINED ENV{DESTDIR})
--      if(EXISTS /etc/debian_version)
--        list(APPEND options --install-layout=deb)
--      endif()
--      list(APPEND options
--        --root=\$ENV{DESTDIR}
--        --single-version-externally-managed)
--    endif()
-     if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
-       list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
--    endif()
-+    list(APPEND options --root=${CMAKE_DESTDIR})
-+    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
-     execute_process(
-     COMMAND ${Python3_EXECUTABLE}
-         setup.py install \${options}
-@@ -65,7 +58,7 @@
-   if(DU_DISABLE_VTA AND HAS_VTA)
-     list(APPEND PY_CFLAGS -fno-var-tracking-assignments)
-   endif()
--  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w)
-+  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
-   # This little bit of magic wipes out __Pyx_check_single_interpreter()
-   # Note: this is reproduced in distutils_install_cython_module
-   list(APPEND PY_CPPFLAGS -D'void0=dead_function\(void\)')
-@@ -135,14 +128,8 @@
-     set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
- 
-     set(options --prefix=${CMAKE_INSTALL_PREFIX})
--    if(DEFINED ENV{DESTDIR})
--      if(EXISTS /etc/debian_version)
--        list(APPEND options --install-layout=deb)
--      endif()
--      list(APPEND options --root=\$ENV{DESTDIR})
--    else()
--      list(APPEND options --root=/)
--    endif()
-+    list(APPEND options --root=${CMAKE_DESTDIR})
-+    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
-     execute_process(
-        COMMAND
-            ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
-Index: ceph-18.2.0/cmake/modules/FindRocksDB.cmake
-===================================================================
---- ceph-18.2.0.orig/cmake/modules/FindRocksDB.cmake
-+++ ceph-18.2.0/cmake/modules/FindRocksDB.cmake
-@@ -9,9 +9,9 @@
- #  ROCKSDB_VERSION_MINOR
- #  ROCKSDB_VERSION_PATCH
- 
--find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h)
-+find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h ${CMAKE_SYSROOT})
- 
--find_library(ROCKSDB_LIBRARIES rocksdb)
-+find_library(ROCKSDB_LIBRARIES rocksdb ${CMAKE_SYSROOT})
- 
- if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
-   foreach(ver "MAJOR" "MINOR" "PATCH")
-Index: ceph-18.2.0/src/pybind/cephfs/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/cephfs/setup.py
-+++ ceph-18.2.0/src/pybind/cephfs/setup.py
-@@ -135,20 +135,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--    cythonize_args = dict(compile_time_env=cython_constants)
--elif check_sanity():
--    ext_args = get_python_flags(['cephfs'])
--    cython_constants = dict(BUILD_DOC=False)
--    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
--    cythonize_args = dict(compile_time_env=cython_constants,
--                          include_path=include_path)
--else:
--    sys.exit(1)
--
- cmdclass = {}
- try:
-     from Cython.Build import cythonize
-Index: ceph-18.2.0/src/pybind/rados/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/rados/setup.py
-+++ ceph-18.2.0/src/pybind/rados/setup.py
-@@ -130,17 +130,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--elif check_sanity():
--    ext_args = get_python_flags(['rados'])
--    cython_constants = dict(BUILD_DOC=False)
--else:
--    sys.exit(1)
--
--cmdclass = {}
- try:
-     from Cython.Build import cythonize
-     from Cython.Distutils import build_ext
-Index: ceph-18.2.0/src/pybind/rbd/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/rbd/setup.py
-+++ ceph-18.2.0/src/pybind/rbd/setup.py
-@@ -133,20 +133,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--    cythonize_args = dict(compile_time_env=cython_constants)
--elif check_sanity():
--    ext_args = get_python_flags(['rados', 'rbd'])
--    cython_constants = dict(BUILD_DOC=False)
--    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
--    cythonize_args = dict(compile_time_env=cython_constants,
--                          include_path=include_path)
--else:
--    sys.exit(1)
--
- cmdclass = {}
- try:
-     from Cython.Build import cythonize
-Index: ceph-18.2.0/src/pybind/rgw/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/rgw/setup.py
-+++ ceph-18.2.0/src/pybind/rgw/setup.py
-@@ -134,20 +134,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--    cythonize_args = dict(compile_time_env=cython_constants)
--elif check_sanity():
--    ext_args = get_python_flags(['rados', 'rgw'])
--    cython_constants = dict(BUILD_DOC=False)
--    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
--    cythonize_args = dict(compile_time_env=cython_constants,
--                          include_path=include_path)
--else:
--    sys.exit(1)
--
- cmdclass = {}
- try:
-     from Cython.Build import cythonize
diff --git a/recipes-extended/ceph/ceph/0001-cephadm-build.py-avoid-using-python3-from-sysroot-wh.patch b/recipes-extended/ceph/ceph/0001-cephadm-build.py-avoid-using-python3-from-sysroot-wh.patch
new file mode 100644
index 00000000..a353a2f7
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-cephadm-build.py-avoid-using-python3-from-sysroot-wh.patch
@@ -0,0 +1,43 @@
+From b9867e6b744b77d97d22333eca3ab3d23d47e2e2 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 14 Mar 2024 00:19:19 -0700
+Subject: [PATCH] cephadm/build.py: avoid using python3 from sysroot when
+ creating zipapp archive
+
+ceph has the assumption that the python used during build
+is the python used at target, but this is not true for
+cross compilation. We'll need to use the target python3 here,
+otherwise, the cephadm zipapp cannot be executed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/cephadm/build.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/cephadm/build.py b/src/cephadm/build.py
+index 4264b814f1e..a4483d6f79d 100755
+--- a/src/cephadm/build.py
++++ b/src/cephadm/build.py
+@@ -93,7 +93,7 @@ def _compile(dest, tempdir):
+         zipapp.create_archive(
+             source=tempdir,
+             target=dest,
+-            interpreter=sys.executable,
++            interpreter='/usr/bin/python3',
+             compressed=True,
+         )
+         log.info("Zipapp created with compression")
+@@ -102,7 +102,7 @@ def _compile(dest, tempdir):
+         zipapp.create_archive(
+             source=tempdir,
+             target=dest,
+-            interpreter=sys.executable,
++            interpreter='/usr/bin/python3',
+         )
+         log.info("Zipapp created without compression")
+ 
+-- 
+2.42.0
+
diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
deleted file mode 100644
index c72c91b2..00000000
--- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
-From: Yanfei Xu <yanfei.xu@windriver.com>
-Date: Tue, 10 Nov 2020 17:17:30 +0800
-Subject: [PATCH] cmake: add support for python 3.9 and 3.10
-
-add support for python3.9.
-
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
-
-Add support for python 3.10.
-
-Upstream-Status: Submitted [https://github.com/ceph/ceph/pull/43630]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- cmake/modules/FindPython/Support.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: ceph-18.2.0/cmake/modules/FindPython/Support.cmake
-===================================================================
---- ceph-18.2.0.orig/cmake/modules/FindPython/Support.cmake
-+++ ceph-18.2.0/cmake/modules/FindPython/Support.cmake
-@@ -17,7 +17,7 @@
-   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
- endif()
- if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
--  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
-+  set(_${_PYTHON_PREFIX}_VERSIONS 3.11 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
- elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
-   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
- else()
diff --git a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
new file mode 100644
index 00000000..91eacfa9
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
@@ -0,0 +1,37 @@
+From 903bb882a44eb5567f8b1fc7f7c4857c2f03579d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 13 Mar 2024 03:41:47 -0700
+Subject: [PATCH] delete install-layout=deb
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ cmake/modules/Distutils.cmake | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
+index daaae4ba6..e606e3890 100644
+--- a/cmake/modules/Distutils.cmake
++++ b/cmake/modules/Distutils.cmake
+@@ -30,9 +30,6 @@ function(distutils_install_module name)
+   install(CODE "
+     set(options --prefix=${CMAKE_INSTALL_PREFIX})
+     if(DEFINED ENV{DESTDIR})
+-      if(EXISTS /etc/debian_version)
+-        list(APPEND options --install-layout=deb)
+-      endif()
+       list(APPEND options
+         --root=\$ENV{DESTDIR}
+         --single-version-externally-managed)
+@@ -136,9 +133,6 @@ function(distutils_install_cython_module name)
+ 
+     set(options --prefix=${CMAKE_INSTALL_PREFIX})
+     if(DEFINED ENV{DESTDIR})
+-      if(EXISTS /etc/debian_version)
+-        list(APPEND options --install-layout=deb)
+-      endif()
+       list(APPEND options --root=\$ENV{DESTDIR})
+     else()
+       list(APPEND options --root=/)
+-- 
+2.42.0
+
diff --git a/recipes-extended/ceph/ceph_18.2.0.bb b/recipes-extended/ceph/ceph_18.2.0.bb
index 35188106..3dd75a51 100644
--- a/recipes-extended/ceph/ceph_18.2.0.bb
+++ b/recipes-extended/ceph/ceph_18.2.0.bb
@@ -4,15 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24
                     file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING;md5=5351120989d78252e65dc1a2a92e3617 \
 "
-inherit cmake pkgconfig python3native python3-dir systemd
+inherit cmake pkgconfig python3native python3-dir systemd useradd
 # Disable python pybind support for ceph temporary, when corss compiling pybind,
 # pybind mix cmake and python setup environment, would case a lot of errors.
 
 SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
-           file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
-           file://0001-cmake-add-support-for-python3.11.patch \
+           file://0001-avoid-to_string-error.patch \
+           file://0001-delete-install-layout-deb.patch \
+           file://0001-cephadm-build.py-avoid-using-python3-from-sysroot-wh.patch \
 "
 
 SRC_URI[sha256sum] = "495b63e1146c604018ae0cb29bf769b5d6235e3c95849c43513baf12bba1364d"
@@ -23,8 +24,16 @@ DEPENDS = "boost bzip2 curl cryptsetup expat gperf-native \
            oath openldap openssl \
            python3 python3-native python3-cython-native python3-pyyaml-native \
 	   rabbitmq-c rocksdb snappy thrift udev \
-           valgrind xfsprogs zlib libgcc \
+           valgrind xfsprogs zlib libgcc zstd re2 \
 "
+
+
+OECMAKE_C_COMPILER = "${@oecmake_map_compiler('CC', d)[0]} --sysroot=${RECIPE_SYSROOT}"
+OECMAKE_CXX_COMPILER = "${@oecmake_map_compiler('CXX', d)[0]} --sysroot=${RECIPE_SYSROOT}"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --user-group --home-dir /var/lib/ceph --shell /sbin/nologin ceph"
+
 SYSTEMD_SERVICE:${PN} = " \
         ceph-radosgw@.service \
         ceph-radosgw.target \
@@ -34,6 +43,8 @@ SYSTEMD_SERVICE:${PN} = " \
         ceph-mds.target \
         ceph-osd@.service \
         ceph-osd.target \
+        cephfs-mirror@.service \
+        cephfs-mirror.target \
         ceph.target \
         ceph-rbd-mirror@.service \
         ceph-rbd-mirror.target \
@@ -45,15 +56,18 @@ SYSTEMD_SERVICE:${PN} = " \
         ceph-immutable-object-cache@.service \
         ceph-immutable-object-cache.target \
 "
-OECMAKE_GENERATOR = "Unix Makefiles"
 
-EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
+EXTRA_OECMAKE += "-DWITH_MANPAGE=OFF \
+                 -DWITH_JAEGER=OFF \
+                 -DWITH_SYSTEM_ZSTD=ON \
                  -DWITH_FUSE=OFF \
                  -DWITH_SPDK=OFF \
                  -DWITH_LEVELDB=OFF \
                  -DWITH_LTTNG=OFF \
                  -DWITH_BABELTRACE=OFF \
                  -DWITH_TESTS=OFF \
+                 -DWITH_RADOSGW_SELECT_PARQUET=OFF \
+                 -DWITH_RADOSGW_ARROW_FLIGHT=OFF \
                  -DWITH_MGR=OFF \
                  -DWITH_MGR_DASHBOARD_FRONTEND=OFF \
                  -DWITH_SYSTEM_BOOST=ON \
@@ -67,34 +81,6 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
 		 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake \
 		 "
 
-EXTRA_OECMAKE += "-DThrift_INCLUDE_DIR:PATH=${STAGING_INCDIR} \
-                  -DThrift_LIBRARIES:PATH=${STAGING_LIBDIR} \
-                 "
-
-# retired options:
-#		 -DPython3_VERSION=${PYTHON_BASEVERSION}
-#		 -DPython3_USE_STATIC_LIBS=FALSE
-#		 -DPython3_INCLUDE_DIR:PATH=${PYTHON_INCLUDE_DIR}
-#		 -DPython3_LIBRARY:PATH=${PYTHON_LIBRARY}
-#		 -DPython3_ROOT_DIR:PATH=${PYTHON_SITEPACKAGES_DIR}
-#                -DPython3_EXECUTABLE:PATH="${PYTHON}"
-
-CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-
-export STAGING_DIR_HOST
-
-do_compile:prepend() {
-	cmake_runcmake_build --target legacy-option-headers
-}
-
-# do_compile() {
-# 	ninja -v ${PARALLEL_MAKE}
-# }
-do_compile() {
-        cmake_runcmake_build --target all
-}
-
 do_configure:prepend () {
 	echo "set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )" >> ${WORKDIR}/toolchain.cmake
 	echo "set( CMAKE_DESTDIR \"${D}\" )" >> ${WORKDIR}/toolchain.cmake
@@ -104,16 +90,24 @@ do_configure:prepend () {
 	echo "set( CMAKE_C_COMPILER_FORCED TRUE )" >> ${WORKDIR}/toolchain.cmake
 }
 
+do_compile:prepend() {
+	export BUILD_DOC=1
+}
+
+do_install:prepend() {
+	export BUILD_DOC=1
+}
+
 do_install:append () {
 	sed -i -e 's:^#!/usr/bin/python$:&3:' \
 		-e 's:${WORKDIR}.*python3:${bindir}/python3:' \
 		${D}${bindir}/ceph ${D}${bindir}/ceph-crash \
-		${D}${bindir}/ceph-volume ${D}${bindir}/ceph-volume-systemd
+		${D}${bindir}/cephfs-top \
+		${D}${sbindir}/ceph-volume ${D}${sbindir}/ceph-volume-systemd
 	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
 	install -d ${D}${sysconfdir}/ceph
 	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
 	install -d ${D}${systemd_unitdir}
-	mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
 	mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
 	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
 	# WITH_FUSE is set to OFF, remove ceph-fuse related units
@@ -143,6 +137,7 @@ FILES:${PN} += "\
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
 		${libdir}/ceph/*.so \
+		${libdir}/libcephsqlite.so \
 "
 
 FILES:${PN} += " \
@@ -150,6 +145,14 @@ FILES:${PN} += " \
     /etc/default/volatiles/99_ceph-placeholder \
 "
 
+FILES:${PN}-dev = " \
+    ${includedir} \
+    ${libdir}/libcephfs.so \
+    ${libdir}/librados*.so \
+    ${libdir}/librbd.so \
+    ${libdir}/librgw.so \
+"
+
 FILES:${PN}-python = "\
                 ${PYTHON_SITEPACKAGES_DIR}/* \
 "
@@ -160,13 +163,15 @@ RDEPENDS:${PN} += "\
 		python3-prettytable \
 		${PN}-python \
 		gawk \
+		bash \
 "
 COMPATIBLE_HOST = "(x86_64).*"
 PACKAGES += " \
 	${PN}-python \
 "
-INSANE_SKIP:${PN}-python += "ldflags"
+INSANE_SKIP:${PN}-python += "ldflags buildpaths"
 INSANE_SKIP:${PN} += "dev-so"
+INSANE_SKIP:${PN}-dbg += "buildpaths"
 CCACHE_DISABLE = "1"
 
 CVE_PRODUCT = "ceph ceph_storage ceph_storage_mon ceph_storage_osd"
-- 
2.42.0


