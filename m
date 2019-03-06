Return-Path: <danc@opengear.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D60A7E00C93; Wed,  6 Mar 2019 15:48:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [40.107.78.50 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 32450 seconds by postgrey-1.32 at yocto-www;
	Wed, 06 Mar 2019 15:48:45 PST
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780050.outbound.protection.outlook.com [40.107.78.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A86B0E00BCC
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Mar 2019 15:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X3Ps1MegeM2yZBycD5gVtPma1xXSvCefXeW9m6jaqOM=;
	b=OJtXEuG90aLiZn8G1xQMIJazJ0r0WYZi+vFhCXcdt+7yxdvRN1n1qpWe3+bSlDepAEZyv2KYDYANAetRs1SLyhuWIm4R147FlqG7YbPNFsxqjQVlq9aROc+Z6KhHAw+iJGhoMTlJ65JccEAR0asLRPO/YY8MzsTsNo4SSuDl6fU=
Received: from MWHPR15CA0055.namprd15.prod.outlook.com (2603:10b6:301:4c::17)
	by BN8PR15MB3217.namprd15.prod.outlook.com (2603:10b6:408:75::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1665.18;
	Wed, 6 Mar 2019 00:13:08 +0000
Received: from SN1NAM04FT031.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::209) by MWHPR15CA0055.outlook.office365.com
	(2603:10b6:301:4c::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1665.15 via
	Frontend Transport; Wed, 6 Mar 2019 00:13:07 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; yoctoproject.org;
	dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT031.mail.protection.outlook.com (10.152.88.153) with
	Microsoft SMTP
	Server id 15.20.1643.11 via Frontend Transport; Wed, 6 Mar 2019 00:13:07
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id B523DDEB2B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Mar 2019 10:13:05 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 935F44295AAF; Wed,  6 Mar 2019 10:13:05 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 6 Mar 2019 10:12:58 +1000
Message-ID: <20190306001258.13911-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39840400004)(136003)(346002)(376002)(396003)(2980300002)(448002)(189003)(199004)(106466001)(356004)(52956003)(478600001)(2870700001)(42186006)(36906005)(316002)(2351001)(186003)(90966002)(336012)(5660300002)(1076003)(426003)(6916009)(26005)(26826003)(6666004)(7636002)(2906002)(305945005)(4744005)(50466002)(85326001)(51416003)(2616005)(44832011)(103686004)(476003)(126002)(50226002)(48376002)(246002)(8676002)(6266002)(486006)(47776003)(8936002)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB3217;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24398722-0ef5-4f90-d76d-08d6a1c88283
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BN8PR15MB3217; 
X-MS-TrafficTypeDiagnostic: BN8PR15MB3217:
X-Microsoft-Exchange-Diagnostics: 1; BN8PR15MB3217;
	20:R+20A2F7hDZl+fAi3DYIkvq8CYxEL9v6yfgVk47Xf1nvl4PDTwlD41+cUjqR6TfIScV9k6t9OMLWlTkEXmtGUDJmf8HgXCfNiVeGD0SRCbPO87fknCAIvtgiCY5KpuhCwvt2mIbUw2iWNdPh+e2245yuNkVIW51Nzj/u9Fcju8U=
X-Microsoft-Antispam-PRVS: <BN8PR15MB3217369A8AD9E2141D2168E4B8730@BN8PR15MB3217.namprd15.prod.outlook.com>
X-Forefront-PRVS: 0968D37274
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN8PR15MB3217;
	23:lg7x2FC0/te/91QSYVpoSWCV7PKOayS7Skm7ge5jh?=
	=?us-ascii?Q?1dYX8GEnutWUnj3Lj7tSq0xK3PzbCbTbwCpz/M+iXPuyVmQB4l5WwPS5wfnL?=
	=?us-ascii?Q?m5GlsscFHJtix4ArMlaO1KCDi/HpaMrVfUOXWuDgPffdDh1fNjpJKkTHxULf?=
	=?us-ascii?Q?+3/U5X4c/HZ7eouiGxzfk2JipzwUtZdFSB9NLwHmiFMRHMZSOMrXoKFYzWRT?=
	=?us-ascii?Q?c445JRCUoq+z+1X1YpyrGYdx4l7qbh2X0enZWzGdupJ3AGFbwcGJaBq/EaAq?=
	=?us-ascii?Q?uKYnFRnhcbhzWya6yhioRFlARPikuQ/T2k/TmemV0fqPnmSvGTGGjJVub7ac?=
	=?us-ascii?Q?NIE4apVSJwxxk++dlnzkCqlHd6TAsgdz/EZNQlp4rjH/TY9uKSXIKiy79aEm?=
	=?us-ascii?Q?PyL3WLJBOoq4RTmGMGCDOlNnTopqoepgyfdgvUJPBnXtckh60A2vqcoCUD3v?=
	=?us-ascii?Q?iMXxM0XCAv5NI0Vu8vcUaGzUwdNEWpAxX4DticTazAYmpdrX2i4IOPw3xVcm?=
	=?us-ascii?Q?oOKFsVie5odNUFXq9y1aYo4qPoH/Tq4oLBEW8X12P0K/YlnNKGUcmqtV5s2K?=
	=?us-ascii?Q?XKkiJ0nU1wrlL3uGzOUAGQ4/bFTc22NVD7PNGI9x7eVSbbbp0KZYeQ7NrAqW?=
	=?us-ascii?Q?vFolsrG8p2jNinAH03D1mGupKvzlzeNgp+rDK8C0awMHxh13MC1MuzUQjo33?=
	=?us-ascii?Q?W7XQngOv6kXUQSRZDu7ngJdUh4ZyYH1ks68E0KtFHiSd8Wp0vgRn7xEh7p9w?=
	=?us-ascii?Q?TbaoYC/RrSOPgfIvDPOv2u/YgnN8LoZ3fZQjlotyhy2igGnb0m2734aIx+Qi?=
	=?us-ascii?Q?5hnDnM+j5HvEjO1TfcRLh9qb8moFNCA3NyXYRGfddLvR0uPil1ME+Oa/0rzv?=
	=?us-ascii?Q?5xmY+4K9jOzczzguJMcANW8cmOEM7Otny3PYYA08jSXZTLpv3YVMYv0F3ucz?=
	=?us-ascii?Q?ibylgzirMGG/2WHPAy5IQ4d4Qpy/x4KZ6R+AoqPKAgPAXLB23GQ004De0FGY?=
	=?us-ascii?Q?+pGCtS+RNQkjGDn4Xi0m/pnyMyfYWT9Z7ji5O5K8/ByuJFBSJGMeDHWqp/wy?=
	=?us-ascii?Q?tnzfl4BZj+4UXf6WqFGmO+blGT+x066lJ3iBO74+RJ2RJkgxw=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /inT2WKmP4W2q7qtNq8votewgzeOax4Br6liPu+LH+vImrRZb95+Kdby8xZNA6GhiQBzeoIknZdPoDhenufbDFfzADy94DBQ53p87m+D3CoUrKiH+RK57vOYlfXp+eGbz8shcmfutLz8k1i/pwQOONl9aJy0Af84pzXtqjNbV327LDtQaNV1UmJcJ2X08yk1PggwmWWhvOBHkPnK/DwG/MWioXy0WiIiozzr4QcbTK6sBA21wLz97hwws7m6g1Y7kps7mSQxTopXe02KOSHFaLdkxAxmVz8tI0w9JTpLHR6m2roMK6I+nCAKIafSI0LoekYRmbvV35weEgBfhLiTnKa9oU7bpuHDYO2qvLSw3onIFdzSKT9TDXhjw58Dh3iEDQtCHm3P+SHqGRjN++sLg1NHdOFuYAspfL7Hg8o3XCA=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2019 00:13:07.0620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24398722-0ef5-4f90-d76d-08d6a1c88283
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3217
Subject: [PATCH] python-docker: depend on python-misc for the ntpath module
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 23:48:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 recipes-devtools/python/python-docker.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
index eec7cda..a0ba60b 100644
--- a/recipes-devtools/python/python-docker.inc
+++ b/recipes-devtools/python/python-docker.inc
@@ -7,6 +7,7 @@ SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
 SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
 
 RDEPENDS_${PN} += " \
+	${PYTHON_PN}-misc \
 	${PYTHON_PN}-six \
 	${PYTHON_PN}-docker-pycreds \
 	${PYTHON_PN}-requests \
-- 
2.20.1


