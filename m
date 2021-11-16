Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6361.1637043231106405722
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 22:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ENL/ixHz;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69548836a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG68XCX031858
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Nov 2021 22:13:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0Wa392ZSlUFhs6oVU5nUR/1YESjIl21A2Rjg09sGr9w=;
 b=ENL/ixHzAkntGghsyCZNjcLvZjYwXpR7EBOs8jBFcN6vgWuSGycl7hbR3wmmF3K9WNOM
 af7FjFDbPYCJgr9C0YTTIdcLkchJnU+7IgJVtuB2V64C5tpyLDqO9Ovq5FBktf5hudY9
 huYJThGyGev9BvIVeibsPNgsXeZGXuQkX7qfDSUPDSIAyOeo552dSGrn5YcW9U/JO3V7
 3tgNMyxz+HY0VglrQ0hIo5Lc44JQv+h6NB2YlQ45H7vxd2m1ltepmuO0cmHByovX5MxR
 t+q5wfutjSZg6XaemywQEOc2a9zDY2mb9Oet9AGTLYeaOCRJi+coPDFyVKAUpqNGMWlp bw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbqrursdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Nov 2021 22:13:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYPJSfcR2vFFy6pYGDEGFsP2OFIl6m8xhFKZFBgrFe3ME8qAtLEjWbKwLl7SMFXJOHaWQBoJgUC1OeKstR56rgZtwsS5XtFSZ3+tr1vr2jpOGY6sZpb3Y2K+taYNCkOU2U9dOkC4NbXgLTTizCh4heSEYEiqP+lMAKWwSWU9Q895aqc7if5H4j+qv3q2hFF6G+JeuTFxHwa3zy86xIIw9jYa5i9SCfhUJBOE4xdQSDluaJKxNlGBNS4v/p4ydrYF4H1tnAVq1ai7bFXvPrkDSwB/FGITXj/mpywv7uI9Gvo1h6uwvpyVbJbxpLJNAWStojmYx6CocaqTs1Wxa59f5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Wa392ZSlUFhs6oVU5nUR/1YESjIl21A2Rjg09sGr9w=;
 b=HFw+8Pvyz5e+95OEBwILV89gRy7Ar91xL6jLzp89rToiftqbidKWgyYx6iA8x0naUNqVVx4NIMWq1vdp/XdW6zrEiAvXyJjKxYt8K/3U9QoP2Ww0EMAunf902Xnr1gRJHEo2nLA7Kk40vpY0OACcHETyXKHSmODM5J9deMAYf9JVz+GrfjFsSYL/eRxhvSVfVKGdPgtst4NN6tpEvyNMwM5ZRUqmrPLWI6R+hC0kUQvZBSe2egqvp36Hv203TgIz5COmZgKgAiH7vY1LyiqAEVgsyVxJTfZ/EEfEU//YM5vqZWA01XqPYXps01pDfbPpwXVtISFdjTWUJjdy78S3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:13:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Tue, 16 Nov 2021
 06:13:49 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] openvswitch: fix configure error with dpdk enabled
Date: Mon, 15 Nov 2021 22:13:38 -0800
Message-Id: <20211116061338.24900-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend Transport; Tue, 16 Nov 2021 06:13:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 414085e2-294a-4b88-cd6b-08d9a8c840f7
X-MS-TrafficTypeDiagnostic: CO6PR11MB5620:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB562009D5E69D8015021F9759ED999@CO6PR11MB5620.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5G0xq7eNAojdgImescB62F91fJAZUOe5tWTKxOa4S+8Jmee/vImHV+5kJaUSW1SuiC+1YKHeG9iZ8KPE+HjV3DhmkiNgOdQlo9H8fqAonEjDAtXgCnGs2tsG0NCIQel2J39J/O9KSh1sjsOdfIXKKjPbWDMBMkUBngA4TAbAmbzWo1HAHNsmpvqQDJPSRFsrFAR/1SE2sjgR6eFf4DSWhQvvgKSZbx17+/bwHog82yMFYhF8qDPboa36OWb8gm84yk8x7/WVESxRpBrNjOBywjE4VzGA7uF6ceeKUmZfAiskU5cgInWfOL+WfcarWxUhFSCIHDeIwY2qFeSHOg34FshTACKU13K6SsssGHNIpXeUhu3RMIJol6t+Nsgu3TztaU1ZkkTAfTRk+2FkmoGAteF4O9gfkS6HwRaLKjoTvHYYynFyv5k696/G6Z0REZC34mT0asZowj2/6EG3wNrtbg64yKXrOwDAUGroc69JJmwp39Bi3PkpdQVClCjFcbgz6FwOn4omYngn7V+iJM0s8DmjgrhS5jRNjJOUz50RuJLopSGcoVFMhnkPmM4PBU1+TJyjUp2HsFDjEcRYYIqwxhbEfURdm0GFYS03pRpBvEQOsABgbMBQVKTUoYWzU1+MWFX74LemnjOhqMsMfhU8QPHs3hVfcUcGkLHHB4OtiefkHQy7XyAAji/K42pnHN0pvSvtOfBhKNFEGeXpJXl9TxaTJaxtOVGvnN/iw6V2vq/6+JYjgGkXgXQpPsUJbue+kjPDPq8Pgz4TuRvEQUyaPWmym3f3tTJBWnodnF/wgZs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(83380400001)(66476007)(66946007)(508600001)(66556008)(38350700002)(38100700002)(316002)(6916009)(8676002)(5660300002)(6506007)(2906002)(186003)(26005)(52116002)(1076003)(2616005)(8936002)(6512007)(956004)(6486002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5RX+pGK5Oy0213+MTblFJofj+HLT5ULaHyh3Ylb3KhC2uzEPW3q1/YKDcEel?=
 =?us-ascii?Q?c3ACz6igVehroW8L2Rqpyqn1O7nZf4Ix0sNcqrxI5hs+aTxOFt4zKBHG7BiM?=
 =?us-ascii?Q?23CxWjLWUoTr7sBMAHDEZcSRmTHt1TQ/wQt09SfOj75YTjKkVojuk0s3w45C?=
 =?us-ascii?Q?uLRDGSlDwc/26Jm/f70Hj4Qrd1MIP2x/p19JyfFcNRTd12Zao5UuwYYTJAB/?=
 =?us-ascii?Q?eHPy+BSz0KM8ft4V9G38rV29NPXL1ZIyuBFsC85GGS2hR69WOWOTJ/dnqvXq?=
 =?us-ascii?Q?nwPMADfc+19y4DXWJf6rjvrNWnCGa9bhwTfpi1VArBWhnTaGPMgvaGRvDuuR?=
 =?us-ascii?Q?ZvufqJw7A6K+EuftPE6xFgcmCbS2nLYhzupXbpev85QOFnOq+SJNWigwyN6z?=
 =?us-ascii?Q?4kerc7XBT2lHswn/vSaBk2VqNp2FHLIOzWS3ir9Uof6hQK/XS9uyObBgh6tB?=
 =?us-ascii?Q?si7gZYfDuWjAeUY2fT2T0ztzh5p/BahW2LTX8FHGxGOF4ZEOlYAui6mvxiRY?=
 =?us-ascii?Q?4qiVAuPPtO8IXJrxyd+DKR1RmFOoJv8aZtB7RmjkdgjNhbAXJNxrFRtVSYzM?=
 =?us-ascii?Q?xqlOQPHa1kY26gVaygjpBDjhueWq0iRo7dOlyruTMWS6BwBYwhcuhFe4x8C3?=
 =?us-ascii?Q?+Qz5W+GX5QX35APTA5Byvir7xaDijQLosL/fLPpQMDLB+38KXJp1Y5PY2+b+?=
 =?us-ascii?Q?BAfqiu+TacnH8/XVOFKMua87dlAVL5wr6OyvRAt5KIz/1GlYVB4gx3TiHkMm?=
 =?us-ascii?Q?faKz4mlkBlyTTPPs2Trh7wta5U2ddXq3mFR+DoVogNn8Fm60exE81/f20PBr?=
 =?us-ascii?Q?P4Kf2apOOMZOOntJh6wmRSX2YskHsKfyahTYdMGNkT32YdFhWlk83HbZI85L?=
 =?us-ascii?Q?aHSjkHkmxRqUX++mPcgoHm7Fp+8OprNAxroYUW1JL6slZ0LEWYIwxjqD5qtR?=
 =?us-ascii?Q?LwhsmztioKkVgaqfh5XiXy8dRexoQ0X6AP5aCC2zNab4rWHgVyoAe6LPkg+X?=
 =?us-ascii?Q?KDaQB9OPpVVhLTdY1m9C2UCCAKqx8yq5oJHUJC0vBSgYURoRM0gDlZLzw7Kb?=
 =?us-ascii?Q?EheR2wGh8m5rw0pMddD4iU3OPQK9rcsjV3ylqG+oUQh3g/ArOLzEbkQhakMx?=
 =?us-ascii?Q?i1Cv/NA2M+8b/r5eD9PwiuTIcOsMEPtRVQ0uy0HICichOyf2VxCV9ceNK4/I?=
 =?us-ascii?Q?XIrq+CvUoBHDXiqaE3piiJl/B9BQceLosb9C0swROvWKwwAMZ/ccDIPbKX4O?=
 =?us-ascii?Q?ytjlbQZWgw2vKRz44WotXcAEEfPSRdMmP+pgZOFpnFyKxxRCot0VlAkvIQLm?=
 =?us-ascii?Q?+eFMmox/9C+Uc68d2Fsx+74WlgsU6Wy3KZj0tJP7wTG/uMyWrHzbdi/GoKav?=
 =?us-ascii?Q?/UsYnSpGoBLLwHoF00QnsI/sfv45es0f5mLHv0ZQycX+JzdnFghGQq7zAkzi?=
 =?us-ascii?Q?vkC1tEvPuz3wh97IREhyDAB0+bc2zqN2sg9cvQ31CJXC5TJgt4YOUe/sRiP3?=
 =?us-ascii?Q?+YkjY388YfDtIM8K0lpqQhdh6PHLFWq3Q4INg0Of4W750xbPMV602BN2w8G5?=
 =?us-ascii?Q?kddl4fn3yveMNrpjFlTgsqZiDgphMLetht9mdyfD9v0YzNLWwqiGv7/FocRb?=
 =?us-ascii?Q?ZZHDneo/0ggnQf+ThZpPIBY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414085e2-294a-4b88-cd6b-08d9a8c840f7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:13:48.8584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tm526I/6BpvVeBYIQEkSdssvCLuKtiC+M5wsYke0MoVsWewGYX1EPKKzjQihPRLN+z39OTL6jV7wM7ZTfumxIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5620
X-Proofpoint-ORIG-GUID: y9NkgLYliL0Jb6FIxye9xWRsgLftYHFE
X-Proofpoint-GUID: y9NkgLYliL0Jb6FIxye9xWRsgLftYHFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1011 adultscore=0 mlxlogscore=892 mlxscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111160033
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When enabling 'dpdk' PACKAGECONFIG, the following error appears.

  | configure: error: Could not find DPDK library in default search path

Fix the error by tweaking the configure option regarding dpdk.
Add pkgconfig to 'inherit' because pkgconfig is required at do_configure
when dpdk is enabled.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch.inc    | 2 +-
 recipes-networking/openvswitch/openvswitch_git.bb | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index b354a84..831e0b3 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -72,7 +72,7 @@ FILES:${PN} += "${datadir}/ovsdbmonitor"
 FILES:${PN} += "/run"
 
 FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
-inherit autotools update-rc.d systemd python3native
+inherit pkgconfig autotools update-rc.d systemd python3native
 
 SYSTEMD_PACKAGES = "${PN}-switch"
 SYSTEMD_SERVICE:${PN}-switch = " \
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index f1a5c4c..0fb7c13 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -32,10 +32,8 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
 
-DPDK_INSTALL_DIR ?= "/opt/dpdk"
-
 PACKAGECONFIG ?= "libcap-ng"
-PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
+PACKAGECONFIG[dpdk] = "--with-dpdk=shared,,dpdk,dpdk"
 PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
 PACKAGECONFIG[ssl] = ",--disable-ssl,openssl,"
 
-- 
2.33.0

