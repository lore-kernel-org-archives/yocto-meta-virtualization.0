Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.35.1635176808521457196
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 08:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=i5B0KFWb;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5932144ca1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PCWr4l004671
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:46:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zuxK5s0bm/L/nKXIDmDCylN4VtAKp7QJUj0Dc2Z9Eqk=;
 b=i5B0KFWbOwqZF2J/NtjVCvM1imkpw2PLY0pdaMm7q2a60jA5dPzGc1sfc7Nw+v+wNz8C
 XvEJwQYkFiPIGn+vEYsMfYut2uuAa8eSHUyUi/vFO3v4gCj7z9PWw5HJv7EceLbdx9kM
 rUWxrXJNSUOGgexrRYodJCoH5uujJNSOpv5l3pXHyRcfP0R5giYWeB9wqVujI+Fhb+Yq
 qG49aRWju0e5AFEnqdSzmBi5iUanr4FwSMhfNChNMvsa5I2ZO4r9hy0zDxLdNSv7wJ+v
 95Ez0aLex+meFLxDoIlgk3EqymeV0mOtGdA6+8URa+6fUfbd5Zfi1Hapr+N2yIANedIk yg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bw9rwgrpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtDCaJwrHNYk61IXHHahG/0KhC38yY/zt7HqDLWw6AIoUjBAgexbwqpGAexXpsHfkj7gTzVXZGDpyysfmgHtUN0L7T7h6yJXypOQ6SNjqn8gXrARVv1oz0MD7lKFG4XX42PpkyNXEuRKpv2FxdXoMAPQYmcapR38UYddeNmXKeRzqfsiyfNjXp2Apbtrl8ydo3CNle0M3q414TMmhCuDc9QG2rSLZJeXfytalzdAxnLorVHckNVdgec1GKWI4INwAleO/7/QBezqokldHUEUvP04M7WH3hTLErR5/XLSt9iXk59c5l0xJBV2e3bAvb5oe9hPYI/JRDSgy1zPHWSTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuxK5s0bm/L/nKXIDmDCylN4VtAKp7QJUj0Dc2Z9Eqk=;
 b=Oq3375ZZw9Hb9sQbm7XGQWE+UVN8hyLNYAiJMwoW+wdssyMC98dUzHG1cogrSF6xiQMUwwzilNMJd6VjhcmUshOjq8W+8eRdEq2dZBKIOftJCiRodOEjrReGwi77fzc/K4HlM0Z2Gn4rrUkNnMT0UcpNdKkrSu047DDLu99oUEeJDAYPuE6Az5OI1MOumcPdytXuGsfP7S49oYhfB9F7rz9zqwLdpcacfxunZmh/MnEbcm4lvdCNEYji4/xY6EMFmmuZI3eOm8Dr2TWTL0zw5BLXuQHTvE2onjXfbaw4T/oZYHQQvYxtLATp0r88b/o7aL8CBZ0eIixEoyAWFYfH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3224.namprd11.prod.outlook.com (2603:10b6:a03:77::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 15:46:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 15:46:44 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][m-c-s][hardknott][PATCH] python3-posix-ipc: Add LDSHARED to recipe
Date: Mon, 25 Oct 2021 11:46:31 -0400
Message-Id: <20211025154631.14039-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
X-ClientProxiedBy: YT2PR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT2PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend Transport; Mon, 25 Oct 2021 15:46:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d6c933c-9472-4a53-a6e2-08d997cea4f7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3224:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3224CEB5B01738BB3C11A6759F839@BYAPR11MB3224.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OqXTcwtsO9ISX/u/jqc58+R5dMbdNVHtxSrJKnh049rqwesss79Rw4a61uyr3w23MNgQ/GA8FxOLUFkC4HXEYlSNvxRs16CAAIc/3IWgLsqNHNn4WzXjQtf0Ktbx2yz5pfUji80oJe0nYIAg0R66yPe+2G06eUvL3wRrWp+Eha2SqsHA5HQOMoYG7spZr4ChBWWVw64uokqLcLlpyopKq8x2JW4uNjmilWVNSYyMPV4uz2HwKnJHKl5ytctuo2P0KWJyMwSL+JZHSNj9SYEjT594unIxqKngAFRfWTv+bqs6UXxMvwu64kt8/0ShlNpLJYXw1R1kq+IUpx4CuY/h4gzjV0+y1V3CBmy7FT9NZJ7T4cwdGnbDGdpeDXyWnclxc+f/a9vjefLTRumMjGtC0vpJnZ3jXg10AP5ZQYL/aD55FFrylR+H404AXT2utMsx6NGkYUJbu9IMHiiMkoR1RWJEQdsFy4B5ijzENwUc8gSdEfeGq4y557buMh4bd9hlrBfhdGQGnieOTDoPEK4dn5KKXmaL2mJ3icqRP4zIkrSu+lasj2LKB9Hq3rkVwGx+RlYORioGaLSig1bxXMoh9wY71upb+NaapUQ5JZwERSObPfnEIetqQEdDwL7wI8fAH2tzuBlWrvwd4pE+xPvtap/3GXcpbIUJmAiGMDDFHdV8MsXmcp6H1s+3iIYn11obXzlVObxFlE8LjCeCjUbT9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(6486002)(186003)(956004)(86362001)(2616005)(6506007)(44832011)(5660300002)(26005)(316002)(38350700002)(6916009)(4744005)(66476007)(8676002)(508600001)(38100700002)(6666004)(66556008)(8936002)(66946007)(2906002)(36756003)(1076003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5/sRmZ7jNXQ0T/qizBCwdGA8Io/m0DNvsi+N0j1u8FPWRBNyp9YOB5NzypgB?=
 =?us-ascii?Q?bBaR3Cezz6lyhSas5+qeWK+aaPhvuae2ISv2vekTtgqweIxOdOpA0YeoJlRM?=
 =?us-ascii?Q?GhipNxqEwmByICGvwDY30ldn6u0uDlb4DlzAmk2UVaNE06IP91zDGAQMG9MX?=
 =?us-ascii?Q?Q1FRfNbbNZLc7xb4A4lZZ5KrVJnUzukmuJxzbpHZu6Uf3/Oud6ldDMt1toVu?=
 =?us-ascii?Q?AQobN9WgU9q89pHVWeAU4CfeM7EujvpxZ1xkXsezJfKclLWVU81HS/TgsmNI?=
 =?us-ascii?Q?+p8W7Vnx5TUVlkTKc9Nqe9LJKxtAUU924cWSyxuoU+4AfGaxsJZbfImoajSP?=
 =?us-ascii?Q?Q9HRdRva+fGQpAsCT+RXlCmet262IyuTJlyLn74mUP3iSY/KDXdbR44TkuCQ?=
 =?us-ascii?Q?LSWf8AMiMMAPh3QzBWVvUyoH37jQl/E1XzHlvrWPhb7R6DNpk4wqXwZ+sZ+1?=
 =?us-ascii?Q?0LgrtCP0fdEoIid4Yp6uNbO5lU5Ly7sxyGV1ThXFEPFGdlzl+MTS63mMDFjU?=
 =?us-ascii?Q?zvu/URKYss8Yh3AOMnXGd3BmRtf67+DJpwKuLnTRImrPVD/KGx4vrzBma1Ex?=
 =?us-ascii?Q?PoK1e4ftCuPC5H0S4LLvD1mJjQ3hLVA7sf1VpKZTgYLZjKwBQgdR4wivQIic?=
 =?us-ascii?Q?iETKUprg82j9tJpseMIT6wkbUHKsH1S/POIyIEjVYQRXvBo9N8FtQPD+Q8/P?=
 =?us-ascii?Q?AP8otBwRLy9gxRj8Yp+lSB/AHrDjyEV9pEI+6guEhSAGgdAkH12MkyNdGCf+?=
 =?us-ascii?Q?cqMEV803YGOArlpatwksC8Zl1Kz5/6eX7bduD3UhDEs/CmtpG23N0pJXYqah?=
 =?us-ascii?Q?bIvbel45Lnl7XSazSHotJmJi/ti6H4SBRkTqB0Mnq0WAuiacQREatHuaUdcT?=
 =?us-ascii?Q?rAp1iDinNfidMhoUZBmuUKTCLNfqTxhVUqlBtggPkdxn65rptP2tE8ycK7/5?=
 =?us-ascii?Q?kU1xDT7RQF9SbrsPN5xMi/vd/dGETPX3p3ny4pPRaoJahfoFc5VEaIdQmlRE?=
 =?us-ascii?Q?q4Qh0xM+uBxhWzvkhFD5Dg448hgbxKtAySUrv8IRGom5dBv/K0vSl0bzRU3F?=
 =?us-ascii?Q?1ivDjDS7aLRm6b4+7uqgI1i1VgcXYn5wp3G5ifO1OJ7N+gnjcg8qVo8EiOQV?=
 =?us-ascii?Q?GpJo6VNluj/yk6wkmzTDTfdGRgdUThNEoiOM8SAQrFFA12t40ZyytTM431zg?=
 =?us-ascii?Q?ou0I1xUcN7WUpQhgP7dKN5oxIeCMQL9/MFlAAQHBj8ZC2Htbf0Z9FBTln20j?=
 =?us-ascii?Q?/b3GLJvm9mCEzpUXAc5qiSSf6EvOxkX8ZowBTJT/+aVmm1vPgMUa75ftvJAg?=
 =?us-ascii?Q?3JTn3AncKnY2v7//cfOVwqxhJCltjs8pJ0OhtMuZUsqlFUrtIdQYS2fZAen5?=
 =?us-ascii?Q?vA7Vhnd0UGOmTK8XzO/SsvB+CNCp+xKD+HMqq31eo6rTkX0/5WXkEwwoQpJp?=
 =?us-ascii?Q?J6LEdojVHLjftIshltQA7RnrA6PBsX7MSywD/mTHkRegXs+rHc/ZylqabLas?=
 =?us-ascii?Q?MeONpMm/svNTlgqtAI48YvFRP7x1YDyLcqRZ2skQ2y7anm3EoyddIYPkvXml?=
 =?us-ascii?Q?p2+ui23UIROQmZ4mKJ7dEhxQK+Brg+oSiKxIgcESjWEpBcCa7eYLen2bSTVa?=
 =?us-ascii?Q?qswkL6ruh4SMkq8eZ774oWy+00/V1QLrQmWkGK6r00kYEEOeJkW+pPnykoY4?=
 =?us-ascii?Q?oOaw6A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6c933c-9472-4a53-a6e2-08d997cea4f7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 15:46:43.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cZv7lqeLTy/QBLP4Mrk+pdXdnwJeLElBg7EWJqRp44i2mG+vQrs9kelq9tXUKth8TncH9o8C9lpgy95jNiVNXi52le+yrOQnVnP3h1PHwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3224
X-Proofpoint-ORIG-GUID: bFlv2geE-vDr00vwCyNb9qQWzj7-iMVp
X-Proofpoint-GUID: bFlv2geE-vDr00vwCyNb9qQWzj7-iMVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=852 phishscore=0 adultscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110250093
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Doing "import posix_ipc" on hardknott builds gives the following error:

ImportError: /usr/lib/python3.9/site-packages/posix_ipc.cpython-39-x86_64-linux-gnu.so: undefined symbol: shm_unlink

Set LDSHARED for the recipe with "-lrt" included to fix this.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-posix-ipc_1.0.4.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb b/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
index 2e8dca06..cded499d 100644
--- a/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
@@ -20,6 +20,8 @@ DEPENDS += " \
         ${PYTHON_PN}-pip \
         "
 
+LDSHARED="${CCLD} -shared -lrt"
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         "
-- 
2.33.0

