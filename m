Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D20ECCA47B
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 04:21:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.23152.1654834869107532511
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 21:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ffdwg0/W;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A4L84G007263
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 9 Jun 2022 21:21:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ObSb7QAQRXBoSYdzX4LEEQwfoTaNKtNRgTIu41CBBXU=;
 b=ffdwg0/W5/bYkf5NIccwXpYk7GVijqadYsBu4lT4TZUTmnj31PNsyrdtiejVB2KEqxVy
 LGQbT6O/zms7hivU724W4BUuQD8W9iTbjf/dI/Rc9RDGm2OB4iVsQdxTJ0Vw/SuZQ6AO
 ea9RqJRSEC3xgzIpooSZRcRGvdW+dRG0IpicihNPwjZy0+OoB9G5qBVGDNTN6kiUL1lm
 Y15Y0Kg8kU9d+E9AvK6B2j+XtLfFYEUrEqOBe+1fz+WmXbsiqjpbNUcC7kFknHWKJacz
 uQUWTEgSD2LTyiQ98AvrS/VlWPVjQYq0mRZG5XfURSMD5DrstwXI00pIAhy7UmsK4tkK FQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkutq031g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 21:21:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMyfH3DdT7jcfSR6phV5S1UMCLF8jzwpxN1EtDaeMJUodMQl2QLq1n85kBO4+vyK48/1E/mIYbxs0i4xXfTCPThCNNx4zoFuZOQwNQBTuTnhyV4w9M4ugNUhIztngy1PqyIeRLMuyY1BbuZPvkFyjqDPqrw1FySYp/NlsmlILdEk/OMG7899e7wjiv7XENwAT7TtKipj9x0i59REhR5MOuianrr534H6LhghnLLQeqL4lAVMlW2n4SUIpUI33IR1PJiUOhy+Vn8vcTCtTETYQVd5QvCGmGQswPHIfhHNC+ROt0aFP+dabBDNsDrjnIABBEPR4SMuLU99e6q8lyLTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObSb7QAQRXBoSYdzX4LEEQwfoTaNKtNRgTIu41CBBXU=;
 b=gWZkpJcVN8bKEpJYJBXhhdVPDsrAl+awPoBSzMRRsIq37YieJv+goPfICYx/sIhzNXmT45NKpF4jZ6MJg1tDRpytVpAlIlzHFoS0e6c89J/+XiVsLXVN0CyD0HPMSq+/8cWyUZibGYNV3gCZyWodHALbIKDYtaLHytDSOEjqIBsTzi0Y68de9elkgW8nabwri5I2PTGQSWHVsyiPFD/bT3X0VbVUX88taHIj5uGFmLiSqTd8TPOgNszXmD0H/tpknx51344jCsF4taXXTRhTdyOZGfjizt+XtgodEEaMDKqPbEMg/zgckN9o1ZAE8HvJlXInwQ4qWI22zwhlRerX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Fri, 10 Jun
 2022 04:21:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 04:21:04 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][kirkstone][PATCH 1/3]
  docker-distribution: fix the inehrit and systemd settings
Date: Thu,  9 Jun 2022 21:20:51 -0700
Message-Id: <20220610042053.4051-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 046df181-175b-4aa3-61ab-08da4a98a210
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5816:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5816B0A8E8F2975A64A2488DEDA69@SJ0PR11MB5816.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NX5iHcVLDyoq9iA4B/W2EYNLpyxLmhsAMD2hX67qn1xN+08XBQQNWgLxuGa0hW0s12YBuZR7SDbKjNlH0knkXCSQLCcst5Kirzitxzw+LUSbiQzbrrCyG9jsQYi82+BFp5+FMni2+sQBNYUR9mbJMYHxY5rW0J3CXYF/H+acGXpKWiKecFfROycm3MgAZ6YWwrPvt/Ssgb4NLk+x3CozBZmo8wsGh9dN85EkwerChY6+4DmBVklsE4mH6A00xRxeeetHi8E5Az/uaJLVktyVPWmx+KrE+IECkz3qmQRrucxWpHEW43p9ocZJv9K3gQztl0kNY+5hejeyTOz5GsEHG9xDowGPYbOwjtY69GkexKzzraFREZO5T3Ksop2/xR917EOru7iPMkqliIwolKi8kxaJ3+y6Bo3VILDulyJ6dBKMIX/ar62q7WifnWcqrSJuBCWAQ6R0tz1o+r6Vm9PfbmpqIZPge1cpH3jr0JHsoPCWv27Z/KdCtvw9NkaC1QboSlcGqTVAgrjTztGfJmZ1gnHliYLnX8B1jIALoqrm/TTk9plPLgkWlL5uJ4nn0H0PFp1dkWYyKjxJP1MKDDNOSKWmGdcFHTEATw5+HCQJ1vXGY5Z7WBagFpHMbZ3BePNe2BsqSeGTnExpRm+kw9U9fcWrILngbJX7VABqQAj3eqvSiHzq20WaQg9dPSq7Pb3dz1Va/h3o6ZNQmFMdtJxsBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(2616005)(38100700002)(6486002)(1076003)(5660300002)(86362001)(36756003)(508600001)(26005)(52116002)(316002)(8936002)(6506007)(6666004)(6512007)(6916009)(66476007)(186003)(2906002)(8676002)(66946007)(83380400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WxUTpjrgbC8TC+wxEdno4KSOJaqGDQhymqs9eQzvZTfbFthLuk/AHBEZI4eo?=
 =?us-ascii?Q?qAxUOwPV4y6ux7wNh3LcGWCjhaA+AciXw4+xTNcANLEcsYxLSrYJIWMyoGgV?=
 =?us-ascii?Q?ghCobHUWvb3OJGDxByzAQdj6k77YMU5vUBMZgqtYOTYY95jXyD4ZL2KEfC6y?=
 =?us-ascii?Q?8SWN0o8eDJEJubmD20vYhHLy9j3DjEUFWODgzh5bspI7ESSVYJNasl/nUKVa?=
 =?us-ascii?Q?k68vjqSTtfsJj+eZg6ZpLk5KITq8jmQTP9Zj+EP4AfCwGmOMLCTHcQX0Hw4k?=
 =?us-ascii?Q?n2X4g+gy3DevG9yeqzOnJH5hSYiApob0qtYZacEit932VRi1IGmhkcOEmp1r?=
 =?us-ascii?Q?SndIgy/9M0gLbAoh0tAXgmyE3G1PA7ZLmJLjXOGQRQ5QGFlpt7HD8/LzI/RQ?=
 =?us-ascii?Q?w6ONnLMX7sU3N9uGLi93xB8tsv1r77w6Yj3TL+dHqT5wcIWQ5SW4Jvo+8ydo?=
 =?us-ascii?Q?euXZo+PPam6VzGNnKm+Vgm8y7QsT8bqYVoUCWj5tUhc3xwacPrh9FecROLPm?=
 =?us-ascii?Q?AdMFQwOuDT/G/logcv3cgJZk63VLHEFBWjUae24q7RziVPw5G0OT1/sa4qho?=
 =?us-ascii?Q?mpjAhpaL156t/rmKsEcHXspJ3Jdcx9EEqrQfAa1s2iQkslPpyw+LqdAGwH3c?=
 =?us-ascii?Q?gpuzfLi2XDruVT6pCXKhc0s5yA9k6Zq+76ysrCghNSpCQUwEHBVIwkB+XMt0?=
 =?us-ascii?Q?5EhAHOAJwdYBty9jWfHS4kZ9C6NIJ7zDW541ZeJ5x8l2HScDRzUxNk6uLGu+?=
 =?us-ascii?Q?OhXFw1S9RzllIwmh7xdLHy/9cKkx9LQ7pXakIkDFHAQdSOk7R6VVgPn9KHFp?=
 =?us-ascii?Q?L1i8POX+6aZKlvnHp7Y1abRXV7PGXm/AsaTlv4RV7N55QnkcC9FapcOm0lr9?=
 =?us-ascii?Q?08/wZklPgk24hE13GdDCOZoTdLRC7iWm5BWVEZMDrC/T28iPMjq+DCH/JYLU?=
 =?us-ascii?Q?ckCYFawt7OYLxWoKJgaGNmhZRsnuSsmH+0uMZ+xyncguU1pHzePHPYLlW/1D?=
 =?us-ascii?Q?P1HSpoz4RA4M/r1Zeg+TSjerzJuPuZWOn6tInfB/q5V0T2WZVW9/6+2uCkiS?=
 =?us-ascii?Q?GBfOR7R7caihSf7OBXjEM3H/IDAGuphqVcXZw73KWctQfsGRM1XezgahCaSq?=
 =?us-ascii?Q?ueI4q47KW1cFKcaF2Aj4/2Rnj/ednUmPTbm1cesfCGy+4925d8pvSLfRiPlO?=
 =?us-ascii?Q?DFb3RAY6Jy5xzF7JQzioAe8ZAVpvVIutkVwTpX00xqzORHj+g1u0TXttElui?=
 =?us-ascii?Q?YpaDiWR7fuJzUZI15ASOBDWvbcjKVVEXHLveKh2QNY7wFWcR9Uo6YNXdI5ub?=
 =?us-ascii?Q?Sa1W/75AJhrD8HoozbOQcuq+rpBCM++Q28cZrJXjEdno5GZxuKj0URNByLSq?=
 =?us-ascii?Q?g0tC7hu4scY1k5VDhEBYrP6ZT4gM6130Z5JDn+JYEcRf78hBITyujIsnnIqY?=
 =?us-ascii?Q?TGRNqOXRP1RZMS8YAipwI2yX9UNTikytH1POnaFOEC3uNQ/NyxgWHchCJP6S?=
 =?us-ascii?Q?YB91yKR8GKTILF+AdYZL9L4dOTj5jTw6QkIrLzdGoOfaAU3fzTTLu90okau1?=
 =?us-ascii?Q?1sSsfO7qIiWeydPN44yifQEksB5/m8be9yLjmD3H4l1lyqeb7shW5IKQ9JhU?=
 =?us-ascii?Q?CU3V9Ck1I2LwPiEHe6H4yWMbNwVDWGqejU9CmrwYc0ONSSPt7tRmKCYZV5rq?=
 =?us-ascii?Q?vQJiTXyvs9f6ezNOzd19sflj9I5wVY+dPIP+dWu6KdM7j7DV9qZ0jN/7zkEE?=
 =?us-ascii?Q?AaKJ2e2tuL+ujbPlKYtnCEzPKjAPZM0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 046df181-175b-4aa3-61ab-08da4a98a210
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 04:21:04.8012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SE/kVVLWy4BVrQynb5FPD4agoBVhm1M9h6taNuJQC9CuIRVDeKoNZOX3mPJ76gKYKDHxCJNyZ74LbYAkRbsC5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-Proofpoint-GUID: sBZ78ybN5EDZSOyxRugfD1FzLwC2pGHc
X-Proofpoint-ORIG-GUID: sBZ78ybN5EDZSOyxRugfD1FzLwC2pGHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_01,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=842 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100013
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 04:21:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7355

In order for systemd variables such as SYSTEMD_AUTO_ENABLE to have
effect, we need to inherit the systemd class. We also need to specify
the package which contains the service.

As go.bbclass already inherits goarch.bbclass, we only need to inehrit
go.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 95e2b66c..1d074bf3 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -16,8 +16,7 @@ S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
 
-inherit goarch
-inherit go
+inherit go systemd
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
@@ -66,6 +65,7 @@ FILES:docker-registry += "${systemd_unitdir}/system/docker-registry.service"
 FILES:docker-registry += "${sysconfdir}/docker-distribution/*"
 FILES:docker-registry += "${localstatedir}/lib/registry/"
 
+SYSTEMD_PACKAGES = "docker-registry"
 SYSTEMD_SERVICE:docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
 SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 
-- 
2.36.0


