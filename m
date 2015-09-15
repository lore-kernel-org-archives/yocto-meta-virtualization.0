Return-Path: <ting.liu@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D124E00CFE; Mon, 14 Sep 2015 23:53:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.115 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3637 seconds by postgrey-1.32 at yocto-www;
	Mon, 14 Sep 2015 23:52:58 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0115.outbound.protection.outlook.com [157.56.111.115])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D28ADE00BE0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Sep 2015 23:52:58 -0700 (PDT)
Received: from BN3PR0301CA0058.namprd03.prod.outlook.com (10.160.152.154) by
	BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) with Microsoft
	SMTP Server (TLS) id 15.1.268.17; Tue, 15 Sep 2015 05:18:29 +0000
Received: from BY2FFO11FD006.protection.gbl (2a01:111:f400:7c0c::128) by
	BN3PR0301CA0058.outlook.office365.com (2a01:111:e400:401e::26) with
	Microsoft SMTP Server (TLS) id 15.1.268.17 via Frontend Transport;
	Tue, 15 Sep 2015 05:18:29 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD006.mail.protection.outlook.com (10.1.14.127) with Microsoft
	SMTP Server (TLS) id 15.1.262.18 via Frontend Transport;
	Tue, 15 Sep 2015 05:18:29 +0000
Received: from mercury.localdomain (mercury.ap.freescale.net [10.192.208.79])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	t8F5IQ9r031529; Mon, 14 Sep 2015 22:18:27 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 15 Sep 2015 13:18:06 +0800
Message-ID: <1442294286-19952-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD006;
	1:s/LjMqdfCaDmxegDgsgGrMieYhG3qQl/OY86VOquTrBbsPvnUW6SXzbHSL4XzN8co3JxS+AjiTuz+k4E9Cx03TdWlsLn574NqcA1wiTQUubIQCmOiAiFuyvSM8IDuYLbTZuoJI7TQR/9Q1XCkVkll2zBnBaVR8LYy4zeJGf+bh9DBFOgTo9Bi+7e+iWT7WuRWNwU3sxJP3RxIuFIyKkcOuF+8Qm9zG8B475dehastRvjMvCpzgMfsZVkdcq/K0jyZvseU9Jx8wyZjQAM35ebRiDkXiOQY+AccaYqSGUFGxSqML2BKeiWuf35uBflIMgM8ekhMvGyl7jPt3op7Sv58tUQte+/Mfh66M0hIjOTrS0BboqAgJf6OG8HKTxY+mELbfcgroLaVinQEUFOJN8hYQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(4001540100001)(105606002)(19580395003)(5001960100002)(85426001)(107886002)(5001860100001)(450100001)(97736004)(19580405001)(5001830100001)(11100500001)(81156007)(50226001)(110136002)(5007970100001)(69596002)(106466001)(50986999)(575784001)(87936001)(77156002)(86152002)(77096005)(68736005)(189998001)(5003940100001)(64706001)(6806004)(92566002)(229853001)(15395725005)(33646002)(46102003)(230783001)(2351001)(104016003)(36756003)(48376002)(50466002)(15975445007)(47776003)(62966003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1367;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1367;
	2:TmB9VYo6ufVaaGYWYjI/ZVuvKpacRJBInCA3A2sJq/9/ifTOan6gE+GU3OHD6D8sFyhnk+Jx3WPkQDP72A5F0M969PBtesxl8XEv1EmuyFGTzU51MMlPbOLXJE8sE7t3LTrPWCvG40Anw7CyGx8OSOz2HWScuU+0eawHa/UEbSQ=;
	3:ZaRgAlURIEBVH+R1JhABCBzbJl72l11Etj6H2Xfc8lRB/eLKgPvOEoeMRD3cxfsbysU7/bvkWyEYGU2at3sq99EzvnR0duq9ymXNCiURUuj8P3e5I7XgojrB+mLQMWT9QCQKqSJ/MbjJFWTESyaln2lW1ZAEdmJEmASp2CP+OQcFhaYu8UXPRwxBOvzP8XS0LfANA7+fXNl3bVUS4W7MIi9Ds1jXfC9UwMRIk2N3bNc=;
	25:nVNgULaD4ZPshq93mnISx+Br96pILKOl2GzagEm7c04Ahk3szktpCtF23Q8TIuk0del/KSALodtYz1+B+67IjEETmBMDntCJm4OSxmNb8wG1PZ4wycSyf2Ux0Gc0p2MoOqEW9P22RQHbS103xXcTUwehkR+sASLezqnEGGhQskDRX64juTDDpJ7fdyqI1Y1H64NDO+QGyWnIW8FVHsnSQ2YsDjI6tKuS6Y0uw5X2NsOlgcGljEyE0GnyfwV2KMdFUxPibdOabENtfDlJQ5qLgg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1367;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1367;
	20:RsmQzITdcVGmKw5mPvr9pU+jLLVMge+4X+PODSowRccXOcAkTnqbxzO/5rg93pk+cJplPApbV7wFnMwooAKBZcIv4UHbbuaIMG1e/jJHatEDVTqiy+hR2G8xlxxM+Gb0+MheeNJU9i0JD7mfrAa1cXhXwHs7CWXxDVi6arJY9NCT138E2B+YtdmBGnxuhscbCN9fyRQSbqS6zv0QkOh3n8sTcv5enPwTz9gt1QfqPkDbDCuS5bt4VpVUaCEijHGOt0nOH2x2uj/sD1LhCt4MkG4z+VyUxc7Q2q6Mk2B1CfTrYCxlUbfS1UXU1C21WzPgvsiFsL/ULDyfYJ75k9NjzZPpv6XYUcF3QTkUZVAaMfs=;
	4:Wlgb01bLKE2ZLMFztzTpNyYFyCjx3a6pzxXaMP7y9fSdDGn3NDddVBz/nyl60ii8BRg/drQeickwUjfeW1L9FPY6+D4OOJ4Xu+Uiryu3IEOLxpqWeVVwT5GI6PiNPODE2ljXtqwBzFPH21n67eMaH7AAPcnCAVMSxJ7RywKuPApZ7IfwTtOitWhTMLp3tesob7YC8QRmu+ZzWzlG3n/9Nhhy7N/RzhCTlOz6sxDDLqxLYK3oA4On6XWcz3FY+vV35vIg8jbXMr3kerpVyx7sVOsGSJ8Om4arOfuLnW/5zWzBlq/RsQ9yT5V4B0+6D+0XOP6sC/KoiQaf8tEUAcf0m3NkAQhvVhv8XwaWDTfc9dAxffChaFTC1iz7wucJ5wRM
X-Microsoft-Antispam-PRVS: <BN3PR03MB1367C25699A340EC75A090D1935C0@BN3PR03MB1367.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(520058)(520075)(8121501046)(520078)(5005006)(3002001);
	SRVR:BN3PR03MB1367; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1367; 
X-Forefront-PRVS: 070092A9D3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1367;
	23:4b20G/nx7OQRWa1AxPIclaLr5mNDQIse2fg4bEMkr?=
	=?us-ascii?Q?GM8U8K7zR3irvkldJO0Y2kpJLwJyJs1SCFBPjczVLcI0sv/UyKPCprICd6Zs?=
	=?us-ascii?Q?3ycdgn/v72vwq8/CclSS/kPcFA2W9pX/5JZBNBDrIaMFnhSwaT0/LxmYFMoC?=
	=?us-ascii?Q?PVOsMXzb6l8zyyHFQf8ibfmc2Upu+BUS3DRt6FdpBnbLeqvIHEQXL9qxitn3?=
	=?us-ascii?Q?ryE85H3vnmVCuZVs8nfexDJ5EmDe4SDhdCBO6BB3zgzQYlVaag9RZ2K6Niaa?=
	=?us-ascii?Q?ohEiTlNSRHy8ZqN0wrSD5pFoCYXc4QjYZ+d9vBMXTmLs4QRw+uIrGr22Nuyv?=
	=?us-ascii?Q?4Tr4Dv5wpGgUeI6MWMl05JgmDr+Gt5fSuhVY/brx3v5lD5+DCQ5rfKW/KfCZ?=
	=?us-ascii?Q?avXjZy7KxwdBCd0LMZm3m40zC5r1hutOfxLs5hMnQys1Buzz7O9xsr4W4ceK?=
	=?us-ascii?Q?DkbIHPibSJdyDH8RpGq7pwDAX5fSVmgxeNixutrPnHyNU2NMO/g+kBCBB3xE?=
	=?us-ascii?Q?dyx+HeBpq+q2cOH0jCVUNubKY/kUiR7ZN26m4ItFZWsN56cWAf/m7mOKJy50?=
	=?us-ascii?Q?r1fnKG1oRMkIbZMgOoKmbOgNqfTUDjJPNmmocOrL6OTpvKwzfvfc0UwzjwRX?=
	=?us-ascii?Q?Q6+aW/lzwUSiiiBfy5VkyNRpIx/+42L8IDPGvnInraWmtOraOQ3/aKJ0UYV2?=
	=?us-ascii?Q?+uXABmNrusmT8Rzu42KR6YEOFO/UqVZoqnax+bb1Uu8S1lBpIaIr1Kc6upBE?=
	=?us-ascii?Q?VDGUdb0/1H3MPh7sgKx+Y4LH2YJpAIS08rbbAv1xnvi/ASwDv4VPKcPfbm9r?=
	=?us-ascii?Q?6K7kXoW8DH4IRPoW8BDRJWqcSBQO4BOTEcTD499+NVgkkhhvqGWbUatqLF7Z?=
	=?us-ascii?Q?p/rjYCj62zXcJx4RUKArqAD3pTRVzrGRzT4Hg/OaygokJL0yxDLzuozC8y22?=
	=?us-ascii?Q?WWVAp/mjywb7FnLzGJNbj0aQhL92RuS8IGAKDodyuDQdjHPDKc1qqGyFWisK?=
	=?us-ascii?Q?JsrZi9V36w2MPR1tx8rqp7Nota2E8poSuR9FAIqlHEuCZy1lhZNBeF4OmKFk?=
	=?us-ascii?Q?Qve3XtuWbTBc7PdWvm4dthz5m/t7jzFqz2J5B5XDmsRNqIW5rmXEhmhYiuB9?=
	=?us-ascii?Q?Vkwih7cNVdDGPZFAvkOE6mkTXwyvc+2FphyEs9RyN8KG8v1OxthqmcPF7Pi/?=
	=?us-ascii?Q?j0CAJl29h/xVrREp0QmPm/RYL6eagEjkKUoyBjB+r95u+Uhu3O6Ow1ZDlGfn?=
	=?us-ascii?Q?hj1H5dHTAd7POOJ3ZcNYHFXD4mB0IgpnoEn8s69796P28FJWCfT3QTbDulVG?=
	=?us-ascii?Q?gSs8mPq61fI51yOlAgNxlgZCmso3UN2s0p8NHx0OdUNjTePlsS5dG13GMpAe?=
	=?us-ascii?Q?fkIuQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1367;
	5:VC28M+ZENqDeB3Idmdb1rniP8oAicpuXHUInBKsNr4ZnTBteMRxoHJF6T9w9AqCL5SypwMgKjwf+3+1u0ol6DecXkZKX4XN/oXU5B0sPi4OyKwhffCCr+T+NyBdCDw6g7L18JUcjJCNoune57Q08VQ==;
	24:DDYDMmhvu6m5GFanRI/VNtGutSPhpl8nxcph3sGoYtWGd2FOpGEVvb/NYSA6row+p863Atusu/DJn+nJkRH5/9h3eZ8ymDH4/e4YwRpK+KM=;
	20:AVtlLxV2YD7RszzqfKbc4ZSNK2q9Ml/9Ro929hCnF9wPnFdSFOgJaD5vteM3pDzAKW4Y2S5KNNt2s/EzTuGMWw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2015 05:18:29.0469 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1367
Cc: b19537@freescale.com
Subject: [meta-cloud-services][fido-kilo][PATCH] erlang: skip the host library path check
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
X-List-Received-Date: Tue, 15 Sep 2015 06:53:02 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Move a previous patch from erlang_R15B.bb to erlang.inc as erlang_R16B03-1
needs it too.

Fix the below error:
ERROR: This autoconf log indicates errors, it looked at host include and/or
library paths while determining system capabilities.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta-openstack/recipes-devtools/erlang/erlang.inc     | 4 +++-
 meta-openstack/recipes-devtools/erlang/erlang_R15B.bb | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/erlang/erlang.inc b/meta-openstack/recipes-devtools/erlang/erlang.inc
index 8dd2478..8a7bd5a 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang.inc
+++ b/meta-openstack/recipes-devtools/erlang/erlang.inc
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://EPLICENCE;md5=09f9063ea35bc5bd124df2fda1d9d2c7"
 
 UPSTREAM_VERSION = "${@bb.data.getVar('PV', d, 1).replace('.', '-')}"
 
-SRC_URI = "http://erlang.org/download/otp_src_${UPSTREAM_VERSION}.tar.gz"
+SRC_URI = "http://erlang.org/download/otp_src_${UPSTREAM_VERSION}.tar.gz \
+    file://erlang-fix-build-issue-in-Yocto.patch \
+"
 SRC_URI += "file://fix-wx-configure.patch"
 
 S = "${WORKDIR}/otp_src_${UPSTREAM_VERSION}"
diff --git a/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb b/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
index d7fd310..68d144b 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
+++ b/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
@@ -55,6 +55,5 @@ FILES_${PN}-staticdev += "${libdir}/*/*/*/*.a ${libdir}/*/*/*/*/*.a ${libdir}/*/
 
 FILES_${PN}-libs-dbg += " ${libdir}/erlang/*/.debug ${libdir}/erlang/*/*/.debug ${libdir}/erlang/*/*/*/.debug ${libdir}/erlang/*/*/*/*/.debug ${libdir}/erlang/*/*/*/*/*/.debug "
 
-SRC_URI += "file://erlang-fix-build-issue-in-Yocto.patch"
 SRC_URI[md5sum] = "dd6c2a4807551b4a8a536067bde31d73"
 SRC_URI[sha256sum] = "5bc34fc34fc890f84bae7ff1f7c81fbec2c9aa28a0ef51a57d7a8192204d8aa2"
-- 
1.9.2


