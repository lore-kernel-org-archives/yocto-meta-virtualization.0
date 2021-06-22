Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6612.1624355747995639668
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Jun 2021 02:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Duw/1mRD;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=18076bd17d=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15M9quw1032568
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Jun 2021 09:55:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 39avpmrkry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Jun 2021 09:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLFv+XwrZ70Ho/QcX/fYluHchorf5fyf1T/XRtvHtMTZrdf6oLmU+fs8VAQmJ44A9u6IGF4M94ppJqgyOPe4W8TOs7nlFLOjIT+drlMtJoTQD6xv5Q7GzDly9r1WP4eOTnODLCBtKUxtFnk6R0JgrDEVO3t1dRz2q+KYnxwmvV8NI4Cq5CaqZtif+7mW5bBZ2oHWij9z0rCMo0qhA1WGhuDTsQLxkNC0FzYhUF1HW5oRHfrd3bpHiCdrYUPmLJ3Jv20a1CQXPKw2Uag4hVZQ3ZdWiUPuU7Z6FEEyVJpAQkd7zxUSKgAE3K6AEKaPK//LwHnrSHI3duJGUvfyQ9gzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXaHNffQr55eMeP5guPlYP33K3Kbb+uUSx30WbQwfGM=;
 b=E7I1IB8MpO7cncNga9Zzu4v6KVbzFWbYh95JWUXuayEwfm8FhFoJSJgfODTzU2SpsJb8qVPL5/zSna/cgltRzEoKdagryoTeJ0xzTGDvNPoSPQil2rB8n6qGjJZxUhOqeJje0fOelBdUxgdYGW22rVOqp7IspGollRott196+amUfHWfisiQMwoaRK8A3f5+EZi9yL3PMfwuSPFnw8SUfS95ehzVCKEbRODRsDF6H/QDXotwmWWTa2HKHMz0YGzL9X+DnSXaiHk3bRMSXEb/XUztyyPi2MvPxntYKHMbaqgU7oS5/YYHML9Gk8hXD753/FFgf0pprMFwPsNKhi5GRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXaHNffQr55eMeP5guPlYP33K3Kbb+uUSx30WbQwfGM=;
 b=Duw/1mRDo57/ye4loS3NpzNdjQwol5rWEI8ufbmQrAzqH5281ibUC2m7yCWkRdpch1ymCCrf6eS9iS+l3D+DbEtGGmcvirhfa97lVcyL/9ZD93U9kq6fzyAOGqjIfUEYdkv/szi0S6vnPrv/WpfDS1+3bW0OpF3ygp2/G3Kqw1o=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:55:43 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::34b3:17c2:b1ad:286c]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::34b3:17c2:b1ad:286c%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:55:43 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] skopeo: add native and nativesdk support
Date: Tue, 22 Jun 2021 17:55:31 +0800
Message-Id: <20210622095531.33700-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0030.apcprd03.prod.outlook.com
 (2603:1096:203:c9::17) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0030.apcprd03.prod.outlook.com (2603:1096:203:c9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 09:55:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12ff2a7f-7da5-49e5-9abe-08d93563e60f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165A3EF5AC3069263F72BE2E4099@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qQ4wQzFOvaRs64wX7ncY+aqWANROtfbLrHtCS8uvNf7/hvNCCJfyGLn+Jj/FXadkIvyHayXEYnLwlJPnZhSpa0ilJ7Q2SA+u2wDPsZLGlN5BHlSNksHvPBqym71gMCF/YKNyz0Yz8Zdt34ZvVvGzvZFBk1jM/w9Bbg9b02QuSlU9m16iIRH3gbaCm2nI8Fb7VlSP4SPqWGmGQDWuz0dNoeBl1XC2JcCn4f5fCW8m4sacD0HbCt2r+0Mb1TSouD1RQakdZ6MoDDZpeIdT6batFtDa/h8veS11bs+xVubQKjXUBzKywsybkjIZsQl6/kN4bg6KaWP7efhPVU/OwuAnWKdT4zK80PRpHjTfWNA4KBOjm03ov5csp/KD8AMGWMMtsaQzipWwVt/flMp3NZzIHc2kvOiHE79HezywXBQcqSLxmiO2ha67azALh1mocFXwEFdnhKY/fhVubGPjYskxLb4MpklJ27ENsnWY4plY3QC50djxWlgjnn2bw3A+T1MLLtqO4qulZ8WlauwdezsH5SCiPcShvaGKPKn2U8EobC0IWCAv5ACFPffLqeRBapu9yQHIjxgCIzGDKSggSdUYc8hobnQikPrsK0fRcEiZZNf8giRVacfI5jR8a1oUxikXMeHgzMHDSShULKzRyXOWWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39850400004)(376002)(396003)(316002)(6916009)(26005)(6486002)(478600001)(44832011)(83380400001)(6506007)(1076003)(2906002)(8676002)(52116002)(86362001)(5660300002)(6512007)(38100700002)(956004)(186003)(8936002)(66946007)(36756003)(2616005)(66556008)(6666004)(16526019)(66476007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BV99nU+dB3LELmCAe0qd8NZ2xXeYztg73skbUuGcrJdiCLo3DyL0QA7S+/sJ?=
 =?us-ascii?Q?xOO027mJPzMQQQV8Wv/emq7sDEUfA26CULQkHVeZHQFcDMrr0nt9fjpyhtoL?=
 =?us-ascii?Q?0IgnBPlzHYMt/Mx9rd0RE660vaUjJWxFV1bMN9OZlHQXxnS9EjdaXxJwzmGc?=
 =?us-ascii?Q?PxzTDxMLAtkxtdAU9B+knME18q1VRTqbC61g0p9L84w4vedIxbuKvaUYj59D?=
 =?us-ascii?Q?GZKXXYstl+Euijb/kRzmhAb58c/JpiSk0QUdQvu7ouN12A/K7rJgAPMszQCJ?=
 =?us-ascii?Q?Tt6Vqq6Gn4ty+berJO6Zu7aw1Qy+lUQN+djx/pxXHM7qbyFEZV5utHJdD6fl?=
 =?us-ascii?Q?Ha0OOuKXFtM4q4wLTH5BjQ4F23a3kaHbDsmwgkAeQBBvoIIxEEV5w+E/HPQB?=
 =?us-ascii?Q?IJf4i7a7582AfqmTbPL3jrk1hO/JbRAsoGnfbNi3ZkdJByMekW1unnpBUjQl?=
 =?us-ascii?Q?9XDGKpN9/zg+QGMQ9EgMWY+et1fq2Nh0FjXpKTosSWowtjly9fqiAGOTl1Ki?=
 =?us-ascii?Q?/G06dzlVTkP7Cw5D3SbvBDO4+NuPV5R3B7p7Y12FyY1gyMPPMysw6hC6pSFa?=
 =?us-ascii?Q?N3JXQKvP1+MQzzD1t/tdpvBw4NzbwqwvuncQ1K0ywWKZ45E/S/0zCbshyzAe?=
 =?us-ascii?Q?8VSX7i6YmuuruV1PvTikQ8JB9yIN2u2guPcLvWWTdIaTQtCb0TI6rnL6IU17?=
 =?us-ascii?Q?cppV+NQgXeR+kAng8wsAEX5tDlQ9WYKl7cyYvO6GzfG4iGZXOamm4lmsHEoD?=
 =?us-ascii?Q?EA85mCo1tj/dTwcQvH3E3Lb3+R0dvHjK0glM4MkRLDBJq17SATBYK6SX0nzw?=
 =?us-ascii?Q?vGroTX3QbvESQS8Md/o72Tdf+uRMzii9/WO7GAWmMDvRguzM9SKjZMY0yT1f?=
 =?us-ascii?Q?FBV05x7XKHPx0n349d25DD6lH5mO5P+xwYVAZnU0lA2UbIEzZ2/TZa7lTuWo?=
 =?us-ascii?Q?5CsykDSnJ9vcFZSpNgW0NftnOdFL60HotGfYWnHK+FhNY2fg1AgmkDb7Pj9E?=
 =?us-ascii?Q?63dQVLJU0o12CtCjpSygUdVCpDDArcb0KxVdT3rmm6gWq6qo6R9tS9HKveNu?=
 =?us-ascii?Q?wx+DpCZN7WEOKPljCMMjqTL57qWbYlwHdxSCYhqipnAg+UjhWsbdrFULnvAh?=
 =?us-ascii?Q?sEPk+lCaSXWLQCcfNjU7ya1vl1VztXtEFHXv/5karAZ4EB82ByDUYla36Ggn?=
 =?us-ascii?Q?OiqM9f6pc7p+7GkALB0FjJqgxkp9ZtCZ+H2/q4IqqP2S9Tx4EFLjpKGX60xX?=
 =?us-ascii?Q?sjn+ogVkYVtnW2GJBwGjiVETWjaEKJOVzTSsxNk9JKCx2Bv3cqC2e6ur1JRA?=
 =?us-ascii?Q?uozXvkm9h3P2xTEDrWZFJO69?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ff2a7f-7da5-49e5-9abe-08d93563e60f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:55:43.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HJmWYugjXXoe4VCbWGv81S5z9AQymqHkgt/YtUDPKbZYKmK7wEPVNsy8GDw1l/wbQRJK6HZKIlv8NzLQpmTmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
X-Proofpoint-GUID: klzg--frinQkTdcka-rQn9OaMBJXtUne
X-Proofpoint-ORIG-GUID: klzg--frinQkTdcka-rQn9OaMBJXtUne
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_05:2021-06-21,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220063
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1.Add native and nativesdk support.

2.Replace "multipath-tools" with "libdevmapper" and "lvm2". Because
the really direct DEPENDS package is "libdevmapper" and "lvm2". Log
of do_comopile as below:

-----------------[cut here]---------------------
DEBUG: Executing shell function do_compile
NOTE: make -j 40 BUILDTAGS= bin/skopeo
CGO_CFLAGS="-I/...../usr/include"
CGO_LDFLAGS="-L/...../usr/lib
-lgpgme -lgpg-error -lassuan" GO111MODULE=on go build -mod=vendor
"-buildmode=pie" -ldflags '-X
main.gitCommit=8efffce8befc2de87670ba75d6c86ada61e869fd ' -gcflags ""
-tags "" -o bin/skopeo ./cmd/skopeo
Package devmapper was not found in the pkg-config search path.
Perhaps you should add the directory containing `devmapper.pc'
to the PKG_CONFIG_PATH environment variable
No package 'devmapper' found
pkg-config: exit status 1
make: *** [Makefile:134: bin/skopeo] Error 2

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 2c292463..6c95bf3e 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c4385
 
 DEPENDS = " \
     gpgme \
-    multipath-tools \
+    libdevmapper \
+    lvm2 \
     btrfs-tools \
     glib-2.0 \
     ostree \
@@ -80,4 +81,16 @@ do_install() {
 	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
 }
 
+do_install_append_class-native() {
+    create_cmdline_wrapper ${D}/${sbindir}/skopeo \
+        --policy ${sysconfdir}/containers/policy.json
+}
+
+do_install_append_class-nativesdk() {
+    create_cmdline_wrapper ${D}/${sbindir}/skopeo \
+        --policy ${sysconfdir}/containers/policy.json
+}
+
 INSANE_SKIP_${PN} += "ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

