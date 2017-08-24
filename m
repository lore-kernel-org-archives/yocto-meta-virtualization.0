Return-Path: <chunrong.guo@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6728E00A39; Thu, 24 Aug 2017 02:39:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.32.105 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 7301 seconds by postgrey-1.32 at yocto-www;
	Thu, 24 Aug 2017 02:39:05 PDT
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0105.outbound.protection.outlook.com [104.47.32.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F8C4E00726
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 02:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FDhta1cA43GRaWdT0kFCyno55Ch0QT9cHSOy9IYMHm8=;
	b=CmWzzu6o8g64ZYvz2gm6RmPrDrmzhN6K//UCjhOvgoefLkymZ/iD5a+I2p+hiAuhZd3MuwR4e/y+aOGQJu1z7GAwPXwFy5E/j8yHXLyeVpMnXyAL8JtDZBjJXaQBQUoRdkvHxU5C34d8e3iWC2yEjFvVv2uEIunSzEq6zlXGIhI=
Received: from BN3PR03CA0101.namprd03.prod.outlook.com (2603:10b6:400:4::19)
	by DM2PR0301MB1327.namprd03.prod.outlook.com (2a01:111:e400:5025::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1385.4;
	Thu, 24 Aug 2017 07:03:48 +0000
Received: from BY2FFO11OLC004.protection.gbl (2a01:111:f400:7c0c::122) by
	BN3PR03CA0101.outlook.office365.com (2603:10b6:400:4::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1362.18 via Frontend Transport; Thu, 24 Aug 2017 07:03:48 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC004.mail.protection.outlook.com (10.1.15.184) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1341.15
	via Frontend Transport; Thu, 24 Aug 2017 07:03:48 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v7O73jKN011850; Thu, 24 Aug 2017 00:03:46 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 24 Aug 2017 15:03:40 +0800
Message-ID: <1503558220-28686-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(2980300002)(199003)(189002)(356003)(105606002)(4326008)(110136004)(68736007)(5660300001)(47776003)(107886003)(8936002)(104016004)(81166006)(50986999)(8676002)(81156014)(2351001)(50466002)(48376002)(77096006)(626005)(305945005)(106466001)(53936002)(42882006)(189998001)(50226002)(8656003)(6666003)(508600001)(97736004)(54906002)(5003940100001)(36756003)(2906002)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1327;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC004;
	1:+meb99ojtP3My4obr5Uq8CxpdFk82o832rxDV5p12Iz8PlNabRY+j2yJdGhawxhdebcZ/IXBPwVdYpHcrkGIwSTKgA1HMgzdthYe74y4l6IzfrNwz47nt0dQ12hG/QsV
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d54926c7-8c1c-4132-1a28-08d4eabe44f6
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603196)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM2PR0301MB1327; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1327;
	3:M6O4taMk1g8C4gV5QjkbeG62hQ/IhQfJh7prp2pFbu4YzNeKJBD0+H5w96Y4JSj9UyyZg94vkIQOJJfHxtTjtt8SLD2QHrxi/FGsIH9/kdZmap4M8CrDZbLGryPC1X5Z5Rkgxh5WmYC6D95zb66mvM5r1RkVhIh5phenkFTdBRV9bMpB0fg9X6409+G0UUt0xOcEFwR8Ekbu/AXNv3awowDEr/mTrbaZOEXOiWd1Ji1FZO5HP1Ef1Ah0leJQC2joBrYuGxsB0HEWUhxCwXbf4LZv2raYMGp2tju4xl8NaGh0xKlRczastYhhf5GvrFQYbKkMVsKHjtDvNEY9HELamJHxiz8mPZ7uS/FnQIDsGhQ=;
	25:uMSeu7APIsvBtrNVLV1yITyZvwwbMj/brkNfDU4zWwK0UB3vGAdHMwIClO7jztN+RcpWT7N/oAqBy9W8fx17m3mXAKx4sP966QjagmMn2Td1QIJ5nnEoeBYGDf4cNgMjUKTlzmb9B+9Lkc2HKDm42ceDjijocFoz8w33jDn6IGCi1MgwQhN8WG88tk7ps+/FRLd/zOGkOqCuoi57SE7JthWXnsnJ+bew6ayUeRFmKB1iZ57vscTL/RgR9rwPY5BmDwqpu9LMiVQlKNFNRGdeuNnk2WtOc09GAO34UscwfAiAH6M9HigKUtkL3CNtgbeqNXCdHCACVib0Il3mw3x0aQ==
X-MS-TrafficTypeDiagnostic: DM2PR0301MB1327:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1327;
	31:tdROpWGnHBSMTMHq4bAtWDQUEFCPyxFkQB4pcRSyCOY5PnxIsIYmFsxv1p6r67sKFOnFMAPXMOYSMWSoB/J/WHPr629/eiYgZAb9U8rmGVsZD/FTfpbsJ9bnUc+lj1+g0iPCvhclcvzedO4js2LL5Ay0/noaKtvgjAM92XFM1lrLne34sgMtKU+qNHh1XrR67wwbsLZTV19qvMkgomJH/1ckCgqAg9XbZS/nFkVuy3w=;
	20:uVCVWqBE6mfmIRLz5SiYtgAh/GxVxOSMVRMV4pNLHDcT1x/OXzgn17sA1o8UTrwP+LpBJGvasby+NQQPJ+lbwVhoOvfYs2nolTQ5ltu7j8ZSnR69RZoj/ip3UeEeoaaZYMObDW1WyQhhJ6e6Zs6yyK092+Gi5BVezPjP9g5q+d5Jqeq69OGMuI5/w1WHTmVbbkW9MfjkxF9vOhR5GD8bCpR01SI9MiVfWEeWOhirqCrFkZl+Oi4/zgSMmaZF7hYHT70MNNuhOAwiiysRqsGVeizdnPTN/NARiwxlEfj3dnW7mkH7aFPBgLpVg8I+5X2CcIaSl2lIHkN+EOht2PMvQCp30yNtWikbLp2ixiJyAy07MDzPR9HzemnS7dCxO5u2j7Xc/nmE0r8chyF/oT4mzTBqV1t2aC0SpRoRtwJfyl+sGJ0VajCzRM46VnrytttDZonPRh8qAYBWC1xC1O6MAzCMo6bqM4orlAgoDFkTvZYsTo/5dBBZ9TjD6LpSJ3LdLbfmThmIBVZV3+Ew7aTjjHIwfhFVkSL6UyqyDsjtzeKyYGygwRjEuo4rz72dBGdcAlHIsn422HLnr3UI4VLSOKk/lR0cZ5z2cSLeMwSa7JM=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1327B14C87C0A44078741560849A0@DM2PR0301MB1327.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13018025)(8121501046)(5005006)(13016025)(3002001)(93006095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(20161123558100)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR0301MB1327; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR0301MB1327; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1327;
	4:dMt4/zfkS7WC0+tDnL5OOCKAiqPZ28gqIwGx1y4a1FbkmzIjqkklX0J7GnIPSPOROse19A6fowG8lgcGr6w5nppnuUPczgKMSMX7nLOjvOYc65Nu5AAjYi9H4FOCra9b5YhVyr4NmvhHkzgZvcf/9Gc05SdQXAs2EW3KdLd6CAvkI0lyLm1/keGUJhF9qcA1lZLlPnrEyOZiEasnorp/2ohCSzRst8BNRiF+HGP1ItYSWmCWD0HT3JOC/fttkOyPZp78kj+mdlycAinOlLdY7sTFNw6Gin8fEe0doFTGrUhqJ9Q1Z1oIQxn7KuScVe9Zx2Xt3ZvhzH74bPJo+d9pLA==
X-Forefront-PRVS: 04097B7F7F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1327;
	23:87ZDl+iRI22TpaxEy7fMPOAGuVxbEcDeL8BMpB6?=
	=?us-ascii?Q?vrDxEXB3hoettu8NyC7ujacw6+hTEve/eizlx+cc+7fgI5ZJ3HuX7Tjpoprl?=
	=?us-ascii?Q?dtCcp4jMt3Cqfn5L9nOCHj5YNMg5G7MynbD0gxYSeatdJGO9IJQA89bj7CI2?=
	=?us-ascii?Q?Ay+e6wLXzPWzhKYLHcRQRTo3qwCUCl9ITPIPe4SsjYINSUvn40gZJNhBkZI5?=
	=?us-ascii?Q?cbaChl2DmrtISqWVMW51WijEXogsyuwBXo5bboIxr059eEP7hYBx7M8R7I8M?=
	=?us-ascii?Q?a5YLVKen9joTl1P6XY6kMQEPidYa6GkPy6w2Q6RMGE0ARJHSJdx+36XIC2w+?=
	=?us-ascii?Q?sB1VhVX1L27HFwe4PYQLetarMrUInQnfMrzCgO293LIfQ0nC/RY5by07F5r6?=
	=?us-ascii?Q?6VIns5tCtgvxBvuJMmdHlCRMKT5TASxi++nxn0lY2zyWZz8P6UJ/cJbJx+Kw?=
	=?us-ascii?Q?EUjYmPCfPEdinoMkazm92gigQyNHlY3Gv9meDGi2i+c0hF3EVObB5OWs/KBj?=
	=?us-ascii?Q?ff632gm9+yt/xMMfDLsHdc+x3RiDHGfH0wbL+/hJif4JQgERGrY9HsxJQ/dO?=
	=?us-ascii?Q?PEWOMpX0erfCfuqkvzYtXcOxwYNloeJmegCnNMZtYkIaXqr4SK/Zng5lVEy+?=
	=?us-ascii?Q?aF3aFosg9bpq9qmf4MYnLoMXa9pLt6FlIaoy1fePBFPN5hVjwgqftCpSmrG2?=
	=?us-ascii?Q?7b+oIJaIczf6VGIph7TSj7AJ//YgO6i8jpIBa5SBryyCgDDtXn0KV6uwgzel?=
	=?us-ascii?Q?lLtHZpfTBbcJWjQzGEe70Lg/owiK+3wBiJKyy4acw1jLeKnlsof24ViSL+IN?=
	=?us-ascii?Q?8KYAKIJr7FPEllABChPz3NsqMapMdb3rHK8yrNOFJc+pCy91agSJ9d6EIkjv?=
	=?us-ascii?Q?jriIFfi+qvWkmqrZATe7bTwPEuEk/RWl6jOFZLE/R3sNPRx8ZVcC+22kKoTV?=
	=?us-ascii?Q?rGORXPKIJF+Rxtsm4V9AlmQeO0CDuwG7nrz0zRcRZyw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1327;
	6:2eyHISZCTLntPoDd6HsZsCsxa3sUjurgAAIjvDmHVsZ6+i9XWx6KjbimEPiukD+eR1u5WOc3icbuaLmnNVoiBIBi46K1i80Q6MmQp2902vVCa3Zo1X+CwboMFOHrDFKIukdM26axFisXVj1xZ6X07vB+qDvmwfuMUDC/Azdiih3xDgpS8K/FfR4ZihklVlCk25YcWdwuG0khxCUyaoEVsDpUEWImsqVOL7mBKIWfrZNWhJ2UUp7dOQepDp4iYo09Gzod9+Ditb5iQ7kukVgjOGvyU8hwo1dQcl/t5bEcOm2TAdFmKbhdyn/K8GJAeQxTawAK+t2h9ZHCmaLMhvhb5w==;
	5:wAkyeplvwFmM8szo/+ubljJ/FdOf82JbSO6C8nD+mbqlkkOkY869HCn+HBuZWDS4xLac5AmFLU/Wb+V+QGd/abPBi7CUpQ+mHCrWiWx/Un+htz1QLTvde1ThGj+0Kro57foy8MZxRUSEICrHeZI4Qw==;
	24:gAk45hlIugBFntPNyS7Ey1iaW777RA2OTAaMkz97jjAy1F8KX1fd1Eyms0eK9LY2xWpkHh9fgHwz8yUVsBMr4gZeqdbah1BPQMA4YGdCUiE=;
	7:PxNU6PgTIqa1j8NgS4ggO6KeD5jswBatP10sW+7gBFA1qpa/wZm0CVZcXYk3BFoxMjwC4od+edprlSnUqiIVrZ0sLcGIGMGoV0NCU4zIWsekU31FmDvOxjp10jWVy9Q6+BV1tkdgjXq1Aqh2l7SVgT5I4Fn/G/MVSB0/lnQdFPuvfd778NVUW5P6b9uwyLXv13eNDiaUWTWViAPK2OY134+zUUgoRFpDlxOvqOiS9Qg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2017 07:03:48.5563 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1327
Cc: Chunrong Guo <B40290@freescale.com>, chunrong.guo@nxp.com
Subject: [PATCH] kernel: drop 4.1 bbappend
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
X-List-Received-Date: Thu, 24 Aug 2017 09:39:08 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

    *4.1 is no longer in oe-core master, so we drop the bbappend

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 recipes-kernel/linux/linux-yocto_4.1.bbappend | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.1.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend b/recipes-kernel/linux/linux-yocto_4.1.bbappend
deleted file mode 100644
index f163fdf..0000000
--- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-            file://docker.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.9.0


