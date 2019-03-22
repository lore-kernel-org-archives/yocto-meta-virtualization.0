Return-Path: <MANJUKUM@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05BA7E00D31; Sat, 23 Mar 2019 09:12:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [40.107.80.53 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 39675 seconds by postgrey-1.32 at yocto-www;
	Sat, 23 Mar 2019 09:12:46 PDT
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800053.outbound.protection.outlook.com [40.107.80.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA0B4E00D2E
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Mar 2019 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7R5B5W9FNIhLhNM42hEsZC/8Fh6WNYJ3JMLj6Zf28PY=;
	b=FvALZWYaHflpKsQqpJtH6wlz+RVXGN2xvEF3M4wOEvz5KkiTlKSMXIMQUprubBtKGna6zZKjuImeWn/fV3ORaVPtAicgt1LFE908V/h/QGa32gOR6/alQk2AysWvnn72uGLywacNky+x9MtxYvvUe8OU5jUP3e2sYeVG2CzXhjk=
Received: from CY4PR02CA0025.namprd02.prod.outlook.com (2603:10b6:903:117::11)
	by DM5PR0201MB3398.namprd02.prod.outlook.com (2603:10b6:4:76::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1730.16;
	Fri, 22 Mar 2019 19:40:44 +0000
Received: from BL2NAM02FT062.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by CY4PR02CA0025.outlook.office365.com
	(2603:10b6:903:117::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1730.16 via
	Frontend Transport; Fri, 22 Mar 2019 19:40:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; yoctoproject.org;
	dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT062.mail.protection.outlook.com (10.152.77.57) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1730.9
	via Frontend Transport; Fri, 22 Mar 2019 19:40:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1h7Q1z-0008Se-5c for meta-virtualization@yoctoproject.org;
	Fri, 22 Mar 2019 12:40:43 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1h7Q1u-0001Qz-1t for meta-virtualization@yoctoproject.org;
	Fri, 22 Mar 2019 12:40:38 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x2MJeTvj023197; Fri, 22 Mar 2019 12:40:30 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1h7Q1l-0001Qm-Pv; Fri, 22 Mar 2019 12:40:29 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 22 Mar 2019 12:40:28 -0700
Message-ID: <1553283628-22488-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(16586007)(126002)(356004)(4326008)(107886003)(6916009)(2906002)(336012)(426003)(14444005)(48376002)(72206003)(106002)(47776003)(81166006)(81156014)(8676002)(5660300002)(486006)(478600001)(2616005)(476003)(9786002)(50466002)(106466001)(77096007)(316002)(186003)(50226002)(51416003)(7696005)(26005)(4744005)(36756003)(63266004)(305945005)(2351001)(36386004)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3398;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62f17acd-0714-4d0e-2b6d-08d6aefe4609
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3398; 
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3398:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB33982A339F302937FE4EE0C0B9430@DM5PR0201MB3398.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09840A4839
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Le9K3DAXo5KpLxj5lVwt/aD+bZKr53YY16CJ37rsEiONSI2S3ieaZ00YBVUdagGwB0ceS3O5eicIiy6ksA15WYzl+K0wxoirYOnVPdQTR+oKsKSLyIFiYpzZrCVNCTTGDCsJzO+QD/QjVnmSWcBTHVCWQo7OmsOgNRbtQ0OlSdB5ZQ4FVyfCVEvxBFaCixE36Ej4k8w+3eS54zc2ljBf7YX9y21Cv+71B8oxp8dMzjI1Aik8cxaHi0lEtY8ntS0efqJyYyzUuZnnhBLq2b/e7bn8Qwz1DQe0IXBrS+aWDJAu5aq7Bzc1sWnwK2GJJqOXZOXy7XealY75Nl3ttZOqZcRTOSHKfLDAajPXGpsRwW7kAGy4vxoYLg1F/GiOvngcoiTk95ms5R3zfyVwNszQhOkV1HWLhMrsGy7ssHCjZ2w=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2019 19:40:43.7694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f17acd-0714-4d0e-2b6d-08d6aefe4609
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3398
Subject: [PATCH] sysvinit-inittab_xen.inc: fix hypervisor console
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
X-List-Received-Date: Sat, 23 Mar 2019 16:12:48 -0000
Content-Type: text/plain

This commit switches over to using existing SERIAL_CONSOLES mechanism
for hvc0 inittab entry generation.  This then results in
/bin/start_getty wrapper being used, which avoids the getty failure seen
when running a xen capable rootfs natively on linux.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 recipes-core/sysvinit/sysvinit-inittab_xen.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
index 9d0589c..4d56806 100644
--- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
+++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
@@ -1,4 +1 @@
-do_install_append() {
-                echo "" >> ${D}${sysconfdir}/inittab
-                echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
-}
+SERIAL_CONSOLES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' 115200;hvc0', '', d)}"
-- 
2.7.4


