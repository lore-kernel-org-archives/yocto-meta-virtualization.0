Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBBFC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 17:03:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.11875.1646931802983834502
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 09:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jZB0VZyn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0068e34002=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22AFj1vS017332
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JsIK4MpNGAh/ITnzZeoSRz6AObV94LqRi+RJAZ440J8=;
 b=jZB0VZynlmoS1h4cwVXw/lb4LsLgbxv7S42jsl5AeJr82NLZhx7unoLV2NCpkcR0XG59
 uNiKs5ihmOb4jLvoRan5muu+2ODHjIXaEDB7Hw7IRVL0oe0FvfBrRhfysyYWGuUEJxan
 gpV8fk3fRJv3XUCakrBlsnKFXaKtMHI7pdaqMelkoyhmGDyi5QaRLVLfhDm8E+kN7pdF
 JZ281sXa/h2x7ZGQcjmGsSTVXI7sG67nuCxS8DWORXekHGA495h/PsYyJHl7t/Z7/OGY
 6Y9P88ApHlo2Y7CPyW2i2DwrhSWQSTHIkRfaqRHfnwiZJY6qbD3L7LPcNRyg20h2SepO LA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ekw304k6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 17:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R42cS9+34rGcoo3YsGAjFr7ZVkSIYYSDklIFzh+3TviLT7JISFFMptqTlbW8sINCDhIZfLZ1pSwbd9DIS+fEAuzijFXGzRUv3C5mUYBs5a7sEWDfxsT7Du5XZEa3OTxyyuG6bXKCq7DJpx7oJ22eSdyRSBOAZ2PYwnIIjQc+B1m/OsUAizv4wTYg0Gjt9XBsQNzNRlLoVIg4nOkO3U9FVoxsBlBP7ZJOD/BZH3vVM1wwSkr3ATrBQ5cV//yzI239EjuzkAHT1rj+fJy97qdWH2m0JOW/jxTHVE5AixsfSyFBmTJ6hVrM9V6Ray+B7EYnvQkucmnCVHn8GsrBLnqe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsIK4MpNGAh/ITnzZeoSRz6AObV94LqRi+RJAZ440J8=;
 b=dUOJ3RFWCbccLY+OxjWm6MWfUtnHkcFCScm4ulLU2hAWX/2u5cBkj14T+JNr1SstAoVzb4hh7tIlS16v/AJe29WACsEl2OAIzloR4caAdnKSVQfCOIBBI/7dY+G1Q7rdIM18F5Q0Q4LwhrsBK+Alu8C9THScvncFFbHVVcXr9yVaNmonurWG6EPkryXxGM/p0Ad8d6VEnIhnoUFXz6gPVq9noLob+vS/P27JlJES/H270uB5zk146BC8ilJC7GdWk9OcNBFAvkdZKUBFYB4XOqZcP5VVDp71An7NfAYfvQcE0Q9lGgyuqb4gr5S0Xzdkzts0qk9pYIi6urpyJuhgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 17:03:20 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 17:03:19 +0000
From: Joe Slater <joe.slater@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-virt][PATCH 1/1] libvert: modify dependencies on lxc_protocol.h
Date: Thu, 10 Mar 2022 09:03:04 -0800
Message-Id: <20220310170304.4783-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49bc012f-1838-4f5b-65aa-08da02b7e06f
X-MS-TrafficTypeDiagnostic: MW5PR11MB5882:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5882DDB96E6D0A9AA316265F880B9@MW5PR11MB5882.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dJrp84t1xiRfJWSN2Qo45tPcTQjGOIbNE2WsG0tU+APZ7ICTn8H3N9Om5ZNTJpdXRnx/tcY1KUTKZpvEGHMi+bzs8NgEHl4ezspCk0Iwcyn1y/r+28gi7+58P8OTgP1LYLqWgrus+o/cFDkz8RhfYQ4hs43Mf9qX63dEuk8o2QHtATRIz16QKmo56zn3DT4QYDmkSZPVan7a4Ean+hGF3z3CziPGDMYLMLBaq287mUEjmFd1fOtxLGIgXxh+yO07WZ0ZGzrJb8VxNGsPLj6Ugwr07upCuJpA1ZP36ZAcOQ4oW7FYJrFIMbxUGGk6bttIAkGXp7uOWnuoNMh8eQggJFvHUL28aM9Od54vMC5JMvy6ohwE6RPKeXymG/NUUxMzsGWzJFfDG2g2xf1tQCFIIUZ7A/g7UPo6qFeTTNU9LV2K8Rf3rt20SBvWU0J1s1li8K/08Hvdrc7UxArVGfsbT8PBFfNHd0a/fgYjvfh3gsNGrA/Jn1n6nv55hJ4He/Nh2fupSSQochKmn5YBUJY4dLVeVbvWXYtfiDEjjQMs0t//0kDMdr9sbtvBfrACe4zzCWDHk6KCmkx9+Vj9LbradKK+vjGbGhdtVmVCCVXgWubXGOe+EK0jscm6GSPHYK1eitcZCyy6dsbS7K5CQnD2olkrDjE7K6SeSiI592xsLBzVplDIWEGW1RCOAcC+HUx4N4fGX9A5UpWEofbtime5SR88oRf1RcQpYSaaBxeDhtSV/aEoQoUdXbXFderLO0MlzwyHGkJI1BBASLRCT+ILanNf1h14cURZr+/QD87TNqGv6Uh9E67xXbAVyizKAkqj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(86362001)(38350700002)(6512007)(6666004)(6506007)(4326008)(8676002)(2906002)(8936002)(44832011)(66946007)(6916009)(316002)(66476007)(66556008)(107886003)(26005)(2616005)(1076003)(186003)(6486002)(38100700002)(508600001)(52116002)(83380400001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kz/+zWszgesuVpBjUlbhZeB2D0jpmzqNbkKbCIGzJ0yexipp8DZn8VOCBVqb?=
 =?us-ascii?Q?VeDve5iqQmxw4VNmI3LoGsrwzlJ0DPbhQinie2hfM3q7QzEx3XEHWXadQYyj?=
 =?us-ascii?Q?0WX1U57qQDvl4/eHYUc7A5LVwNppMIHcg0LNcBgaw2jhQcJWQU36HVqJZEU6?=
 =?us-ascii?Q?qRmhhoQSHNNBbqFSvUP1yExVqqJ3h4CqMeLaqhh3wZS8X9r6re07WtRPorJi?=
 =?us-ascii?Q?GdmFOnn1KM4ZZHMSjiRA1my6YPKIy31u3gbiwEOxYfe21q4CJUKejAZigIKP?=
 =?us-ascii?Q?YHd3Obgek4gVjmSehIQf3A6piMysFv/aXDnogljDdosRm7obIOFxjubJjS+Q?=
 =?us-ascii?Q?u5Ull2/0LLJNLOX+KR978y2v+5Hqaff6QytLwsjK1Qzave3kzTWfqGeHg7w+?=
 =?us-ascii?Q?LL9d/aY19klCEouVVrL2gh64ld7yD1nqazl6p589vCHJDbuXtKiaWSSsh7qF?=
 =?us-ascii?Q?UdREvOda6BiKTmWbj9T9PIUKhoAo0O5nf/kBsexOygJXzaBrQCpv+ENPN2HM?=
 =?us-ascii?Q?/0wh6hilAtPicQu6F4bgjfdLbQEH/l2QDnD/fKPZsJwDRjyIcqSVCZT/bUrH?=
 =?us-ascii?Q?lVj8MjgBmW/jccsV26W1FfEDYT2M/zzEMOXpp+1nHZ7ummNO666Ya1elCN+x?=
 =?us-ascii?Q?6DfhgCsLLBssXYbSRWzc6pI5p+VEvaZorYiKexZ3yOuNxySWgv7c9hxC/OzG?=
 =?us-ascii?Q?X+sKNHoUaF8HI92w9g3ZsRMcQS13C99IwujQvZYN27cJbBlUuUaf5qUMKOnf?=
 =?us-ascii?Q?1ANpk1yRlrk+qb0gkaXOVMy7/EWAfYb0OITDweeBlIFQ4XH36GuJFvn0Q/QI?=
 =?us-ascii?Q?U5j2NDGt74zxV1utPiHc+WTB9HJaM1XOcO3Wkn58jsgNwBa77WriQCpnqHwM?=
 =?us-ascii?Q?6HCsvHTkXBm2QrWBkA4XEoJUbwdbRUV4bAmR+NpXY+OgcNSTEp4CynhIc2Re?=
 =?us-ascii?Q?RGAI0tMYUP7GQDCM5AF9mQdq5K8sNCcwDFhovD8DLmi82rHpH5GNRb1tncwy?=
 =?us-ascii?Q?R/3aVoFTYtEGUJ1W4AVrvotUKU7wFV5WonaI2WpxYkWXuJyPvb4NKtI4lIEt?=
 =?us-ascii?Q?MUyTLu0QxerOJh6vII8oneCpxUIgTNacC8ytZEGUYK8KXR3I7o8tHV+PujBv?=
 =?us-ascii?Q?9i2J+brRhEBo39pLz2FbfOMpk33L1DdBYT9hiCrqd2nPp1PJ4f5g+LhGQnTf?=
 =?us-ascii?Q?x4kuQg3YR7LajhUd1gGq6q6s8Mhv5UdqWHQ4MHPYgecbOnWSiu4WjUvIziA8?=
 =?us-ascii?Q?defBkVXWOWQcyiJVc+80Y2+VQEAH+zpIoXFS2WQ+uAjWA2kpfeJqgllVrf0q?=
 =?us-ascii?Q?+lAvd7WRc78tI/hiL6odSHJ0noAZzZUsad7kZOqoGoBk19Uzp7LZeEPMrA53?=
 =?us-ascii?Q?IzYfFpZzxjb/jKEpqTLm0slxEZ5rmn1q2XBexxQNi7a9Mvob15EfvK1amvLO?=
 =?us-ascii?Q?JrFyOGwz6f6RxWoxPYNCWB5khmeeKDkUn0XR3q//qxgNDRRxzAv24OvqZIAd?=
 =?us-ascii?Q?cByNqSqxZnu6ZofBxIM92rRwUoExquvgK5qhzZwwV8SvA17WFetL1H5drrzB?=
 =?us-ascii?Q?NLcdMVPG3NYyml0vq75GVlIddxvTHeAWmfw3jYOMbFgb18Omig+6sK0NjZWu?=
 =?us-ascii?Q?nHfoB4f/uvGE2Orv4aG1wL8i/m1CV5ES5r7FaaGdz+SFUNSmeqxnMu0qcwqP?=
 =?us-ascii?Q?TciCAvvcGrHcs0aVRDSuHrr1yZc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 49bc012f-1838-4f5b-65aa-08da02b7e06f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:03:19.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 niZ/Zb5bCUn0VBGxrOumanuymrG2hnTu0UPeFRg9Rui6ZTI9tSG2POoOCA4DtJRyua3Gx+k+Z0bMgQFXJoF6psRchusurJCQrMlTagMkowQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-Proofpoint-ORIG-GUID: 7ISxnhARrt_woVPj5M9fxz-4GQtvtgOX
X-Proofpoint-GUID: 7ISxnhARrt_woVPj5M9fxz-4GQtvtgOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_07,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=428 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100091
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 17:03:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7084

src/remote/meson.build does not create a dependency on
the generated lxc_protocol.h for remote_daemon.c.  Restructure
how this file is generated to allow the dependency.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libvirt/libvirt/lxc_protocol.patch        | 104 ++++++++++++++++++
 recipes-extended/libvirt/libvirt_7.2.0.bb     |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/lxc_protocol.patch

diff --git a/recipes-extended/libvirt/libvirt/lxc_protocol.patch b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
new file mode 100644
index 00000000..595c3fe4
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/lxc_protocol.patch
@@ -0,0 +1,104 @@
+From 38af66c1a9c4cdeb256eeaf563c6807757c370ce Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Wed, 9 Mar 2022 23:17:33 +0000
+Subject: [PATCH] working commit
+
+remote_daemon.c and others need the generated header lxc_protocol.h,
+but do not have it as a dependency in meson.build.  This means that
+builds will randomly (ok, very occasionally) fail.  Restructure how the
+header is built so that remote_daemon can have it as a dependency.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/remote/meson.build | 48 ++++++++++++++++++++++++------------------
+ 1 file changed, 28 insertions(+), 20 deletions(-)
+
+diff --git a/src/remote/meson.build b/src/remote/meson.build
+index 0a18826..31a30ee 100644
+--- a/src/remote/meson.build
++++ b/src/remote/meson.build
+@@ -1,27 +1,11 @@
+-remote_driver_sources = [
+-  'remote_driver.c',
+-  'remote_sockets.c',
+-]
+-
+-remote_driver_generated = []
++remote_xxx_generated = []
+ 
+ foreach name : [ 'remote', 'qemu', 'lxc' ]
+-  client_bodies_h = '@0@_client_bodies.h'.format(name)
+   protocol_c = '@0@_protocol.c'.format(name)
+   protocol_h = '@0@_protocol.h'.format(name)
+   protocol_x = '@0@_protocol.x'.format(name)
+ 
+-  remote_driver_generated += custom_target(
+-    client_bodies_h,
+-    input: protocol_x,
+-    output: client_bodies_h,
+-    command: [
+-      gendispatch_prog, '--mode=client', name, name.to_upper(), '@INPUT@',
+-    ],
+-    capture: true,
+-  )
+-
+-  remote_driver_generated += custom_target(
++  remote_xxx_generated += custom_target(
+     protocol_h,
+     input: protocol_x,
+     output: protocol_h,
+@@ -30,7 +14,7 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
+     ],
+   )
+ 
+-  remote_driver_generated += custom_target(
++  remote_xxx_generated += custom_target(
+     protocol_c,
+     input: protocol_x,
+     output: protocol_c,
+@@ -42,6 +26,30 @@ foreach name : [ 'remote', 'qemu', 'lxc' ]
+   rpc_probe_files += files(protocol_x)
+ endforeach
+ 
++
++remote_driver_sources = [
++  'remote_driver.c',
++  'remote_sockets.c',
++]
++
++remote_driver_generated =remote_xxx_generated
++
++foreach name : [ 'remote', 'qemu', 'lxc' ]
++  client_bodies_h = '@0@_client_bodies.h'.format(name)
++  protocol_x = '@0@_protocol.x'.format(name)
++
++  remote_driver_generated += custom_target(
++    client_bodies_h,
++    input: protocol_x,
++    output: client_bodies_h,
++    command: [
++      gendispatch_prog, '--mode=client', name, name.to_upper(), '@INPUT@',
++    ],
++    capture: true,
++  )
++
++endforeach
++
+ remote_daemon_sources = files(
+   'remote_daemon.c',
+   'remote_daemon_config.c',
+@@ -49,7 +57,7 @@ remote_daemon_sources = files(
+   'remote_daemon_stream.c',
+ )
+ 
+-remote_daemon_generated = []
++remote_daemon_generated = remote_xxx_generated
+ 
+ virt_ssh_helper_sources = files(
+   'remote_sockets.c',
+-- 
+2.32.0
+
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index 5ad7d59e..04c66eb5 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
            file://0001-security-fix-SELinux-label-generation-logic.patch \
            file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
+           file://lxc_protocol.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
-- 
2.35.1


