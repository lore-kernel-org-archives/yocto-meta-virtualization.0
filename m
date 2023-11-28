Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C074C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 06:50:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27257.1701154235245448857
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 22:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KIpKy8fO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96964a57df=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS6goL0002396
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 06:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=eD1wcbrljjn1pmjVzQ
	XcWLXhx+3dhwGL5qmDWBdxlw8=; b=KIpKy8fO2VFsodmd62QfIQlTSlc3TwOOTf
	uedz0QIucjiclfyK0bjI75H0qMnmfJTljpXfAAUDIAUCMXUooQmDFe48XI3pIyG5
	xYh4eFMKrvigOjtZfN3pD1RSPmX9riUOWOdzqL4iDWkFrYZiblxUMUVNjdr6kpFp
	cTyOUrqCpjLI9a1mxJ0OmFu01vhT+pmAzPOMfiCWD/oWZhKWlPzGxzA4a6B0UQ1J
	cnyP3nzyACMc3uR3yxtamF68LV/J5d51nzwoj0dI2F6IjNTsG37KuLE39UM0YnIK
	T/LtAEBMZhpgEe81g/BbLq8bHAHW6CKCtFiuKbwDdDMcBx6yjEFg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6jc8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 06:50:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGiVtin+CkTUI3lCIXcQfK04GJk8BxDbuuMit9Jiimf+4PAMcXRRXE1UgxIEJ490KBBFHxFIw7zSySJJLapoTA2fi7AUeSeOn67BxCuVxdmu4CX6qtCssvmbwNAiCwZVOV3cb9/gAL6O6GFgN2vhdgxhhkzo1ESoVb693kxvAKsOGxKzlF18EyhH9DxpanWbZCEkYnkau0XOGXha5HnX7ib1JKQnACpEQGm/HqTMtksTAsvH18HJ0RpC01rqTMD9FSsMXnQxapsXn8TTlO/gg4ujGDq3xhaXng+1ZYwPxYXvX3wqHaQ4nWpegPk1SyxgYjBcKq6zjTKagsAFYLHMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eD1wcbrljjn1pmjVzQXcWLXhx+3dhwGL5qmDWBdxlw8=;
 b=WgLoa4kNzt4FycMThm7GJJtRxOA3SzipkZihLPMCr1XpHwJz90rDTwkYkUc/ny1iEQ9KCSlO8WzUPsSyghzLxjPPKNf8bX15ZSZthC/t1wR+engfY8lSToXrzXO+EwfTNTbtkRD4edvIgakOkYBlF3LbxxLhEm6i9+ebjXSvqffcyksihXRLeIDO1ow3+woiBYWDUxI3d0u8/Cq5Q3Hwqh95pn4Xv4Oywah6ofJm+Dt1SopDLCoGY3U0CNsAfvCVY99KNOGXE2CoIgyxX0yNsCT72t0wMh9ULBENOSkSKVogYuTEv0D7Rejj0uXI+QLfXeLe7prxBGspbrOjagAVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 06:50:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 06:50:30 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] docker: remove unnecessary dependencies
Date: Tue, 28 Nov 2023 14:50:14 +0800
Message-Id: <20231128065014.3729629-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9355ffa9-555b-4e4a-c87b-08dbefde4fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	shB6YQa7c3cIGtIYN+yY28gqjntzY4Pdm20Z4RNMn1J32Xr1/mIABTe0XvjZ7THOaRVknQQCvRKwNzYShqjfCTU3FSNjrZYHIgQbUOWcupllC2HZpCtf5vXq0XRZPUqV8hr3tS4Vx3I6NetpoGT49cFs0+p+qj/vRtRwjQWdW59KsPd6SQp9zIpwmWFjCE+T/wfmq5S++3LPwYoWcq0IbYTciTy2b++M0DunCEZc44AnmockQ32gKYQfEUi6Cqty2LS38UBpV+S1UI0bFSItYq+aWzjURnv3TmGpI/OmXYemNiHi01R7q/yRwr91h0iNwzxlwuv/Vy019GTeecTDFF8Bq/XiCXxvyQ1hDsvosKar5pWwk436l/5mltNsjPvUwO6nj/kjrBgW3K/FLzqGXLndMPjM0VGdAxIzqb5i5kEYjMVHEgF1SMUrquHJThWHe/DQ1s0adMUjmbae23mbqA0MxRj65ETS3vOLzHYDMiMGGiJ0KVzjdjzW9JKVbKNoPIeFOsbY7ubLh44qkCbV0TfXbGkQj5z5JFbYRteenHpcgnLQvjHeB5MVodSeTkeRvqYdeY8p4aNlGAxEJ52gt8M0IEnddHPxvxsHnKQD+8JVq8RHOvSrWCKTddJRPu4I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(8676002)(6666004)(8936002)(6512007)(9686003)(6506007)(52116002)(316002)(66946007)(66556008)(6916009)(6486002)(478600001)(36756003)(38100700002)(41300700001)(1076003)(38350700005)(86362001)(26005)(66476007)(2906002)(2616005)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yLMllOAfFrVP6VwXJPw0HiYkZDcM4o2emWWhST1L7tdBKDlgYSCmNo/Po4rU?=
 =?us-ascii?Q?GhzmCIai3ReNH22vIRYvoW9vTDURjNgXo8D0c1JkFNATYAZ+E5dm+8ul3mbS?=
 =?us-ascii?Q?XBj0SnwZC8MmUMblORITVKVARHbxjZo9LCEvUkmideBTcawpY7LgJsIdwTYp?=
 =?us-ascii?Q?4BOUxYrZlYruJvY23EWWLl+w5IRmzPd57ZCJYyweMqMIg1DTdhweNzzcnjLz?=
 =?us-ascii?Q?cPMC5uE0PuW9Z4PVUQ+10RoMqL1MKp9dgacwVfi1ovV7KkG50I0kPhU1eET1?=
 =?us-ascii?Q?+TOD0e7hN3AuBm7QAjLI6MbPZlEuZp0ZB6VjcL0hCmBQ838qRBXOaZUQweAH?=
 =?us-ascii?Q?gKMkQuY/hZS48xsrHVhkq2DXfR6yhM5SQAGT2zr35vUOtRceJX7EO6Gi/l40?=
 =?us-ascii?Q?PwCwtbh2yBZC6g1GqD9LGe7VTjKzOa6Jf69C94vgLL68OLINjtxZjFdCKlWJ?=
 =?us-ascii?Q?xaxnFBcK47uYopXd2MjMpRy0KDEL0NzevUw3NFRmHRClnzAtvEDTSyYZIei3?=
 =?us-ascii?Q?bNMA3lIISibGLiThRIvvfob1WNeTOF4R5H9VvUtUoZT2TL2QlIjwcz/GaC4v?=
 =?us-ascii?Q?WYrMncmxffiuQ33pLDFI8QvTXhrpsowzTkYu0h+iGtoGyi0nxXf+fSi7+6Jz?=
 =?us-ascii?Q?6rQgGWtld+Kkf/KCJWGhFBbBbLTsCIykWurb/GvaNV78nqM3gKJZLL4N7I4O?=
 =?us-ascii?Q?KLDewB8kOWUI0n0gOZl3cveM7HOUSVlbFQ6fFfEOWtVndy7k0KP/wEOCsyMa?=
 =?us-ascii?Q?X7JVHCLmgVRrgi4Vj91UohwEcWQTFo/+EVvc2tANoQFGKaqssLoiF1q01nfL?=
 =?us-ascii?Q?ReIEt8l0sQSFbHOTJ7gblfIvhLg+hhTP/4ZNWfn/yBZrRXSLemlw7Yij91nP?=
 =?us-ascii?Q?90hsJQXSRA31NEZZGCZPqtzE/d2E3vKYx6hSK0TS9eX8I4pgzrefmxk1SwIJ?=
 =?us-ascii?Q?m7ES3BhTrYYfjzVOE82vCEyQRDTNFJXF3Xq8Zn5eGUoqyTccYHdp+TW8gLKF?=
 =?us-ascii?Q?+Ka8vMDALWB+eigT6+iWWwklz54GingljXV+bbDrgSxttlXR+c2q+E1zJ9b5?=
 =?us-ascii?Q?FqqkyjwhQF/YUyw8pXtmNnZUm79YkwBeHLIN+70B/5+wNkB5OyHXw7UiB/60?=
 =?us-ascii?Q?9U6EibgTT7LkIg7Az/hZseAWIwPCSMXtnIRJ7QIt7q9MUCKck1P48tVv/TJQ?=
 =?us-ascii?Q?ch8cKg4NzxCUziym6MRFKMAFra7y+BL2ehawB388T31v8e7MkhFF/v6x3/nB?=
 =?us-ascii?Q?4F7luFJA32C9AZkDeHz7KGv3SpxYtPQSK+Ef4oEm7SENkx+0mBbtApFdt0KU?=
 =?us-ascii?Q?XnBRO+ihgOGr5bEBK/0lcdPRSsjLkoC6dVfXz/Y/lGw25dCs4M4xGr91JPUF?=
 =?us-ascii?Q?safI/xkOWaw8idbhGwrKS0g2vt/gpU5InhFhPSW2rmZEo+3O84mAmFOi05PF?=
 =?us-ascii?Q?AVLWJtOAvdPb38tExj3bK4FAaS77cFgzhspQK0uHvyo8ObbiiA/VKqzlPDMC?=
 =?us-ascii?Q?n3+egh7+Ir7H0JGROXAumXV5toC7Q/IVs+XLnx+vNUUjN2lKqGiUoZfeJWEY?=
 =?us-ascii?Q?nNc7GYQScdfakLkFf5fptVPpmcOteYsQKlVslDLC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9355ffa9-555b-4e4a-c87b-08dbefde4fce
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 06:50:30.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XMF9gsQ02n9GdEF9kBf5qriKsZsnTN218fHJo5cgvedkF8hJraKwhuurcSNoBpKh2esMENcpPtQ2U5o5kR9Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
X-Proofpoint-GUID: CFPDaB5RYt4geL0tty8cdfSEoI0nBIM-
X-Proofpoint-ORIG-GUID: CFPDaB5RYt4geL0tty8cdfSEoI0nBIM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280051
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 06:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8475

From: Chen Qi <Qi.Chen@windriver.com>

The build is not using the codes from these source packages.
Remove the dependencies.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker.inc | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 4a4bc4f6..48f7d3ec 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -1,21 +1,6 @@
 DEPENDS = " \
-    go-cli \
-    go-pty \
-    go-context \
-    go-mux \
-    go-patricia \
-    go-logrus \
-    go-fsnotify \
-    go-dbus \
-    go-capability \
-    go-systemd \
     btrfs-tools \
     sqlite3 \
-    go-distribution \
-    compose-file \
-    go-connections \
-    notary \
-    grpc-go \
     libtool-native \
     libtool \
     "
@@ -78,7 +63,7 @@ do_compile() {
 	ln -sf ${WORKDIR}/git/libnetwork .gopath/src/github.com/docker/libnetwork
 	ln -sf ${WORKDIR}/git/cli .gopath/src/github.com/docker/cli
 
-	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor"
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 
 	# Pass the needed cflags/ldflags so that cgo
-- 
2.34.1


