Return-Path: <chunrong.guo@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9398DE00BB1; Mon, 28 Aug 2017 00:06:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.34.101 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 2485 seconds by postgrey-1.32 at yocto-www;
	Mon, 28 Aug 2017 00:06:34 PDT
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0101.outbound.protection.outlook.com [104.47.34.101])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 759BEE00970
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Aug 2017 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NdQIWyi/AeTk7gVQgQqeRBjWapczvFEqIgaqm/Zt89U=;
	b=hrXp9dBbo5M6vS3k1r2DjDINAvJUyh7nF1sFSPUeEHszDAhwicCWjaLx2iyb1E8UDG3oA+D27umRgRc0wlCYfw/ZR1iqowxxbnuBmLjnoY4UxCBU0rSz1YzUOKsxE0vOG8IUPuaJUBNsMt+NK4ozmkoDTe87ers/PY+BXP5fFm8=
Received: from CY4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:903:33::25)
	by BY1PR0301MB1318.namprd03.prod.outlook.com
	(2a01:111:e400:5115::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.20.13.2;
	Mon, 28 Aug 2017 06:25:08 +0000
Received: from BN1AFFO11FD035.protection.gbl (2a01:111:f400:7c10::121) by
	CY4PR03CA0015.outlook.office365.com (2603:10b6:903:33::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1362.18 via
	Frontend Transport; Mon, 28 Aug 2017 06:25:08 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD035.mail.protection.outlook.com (10.58.52.159) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1341.15
	via Frontend Transport; Mon, 28 Aug 2017 06:25:06 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v7S6P4EE016797; Sun, 27 Aug 2017 23:25:04 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 28 Aug 2017 14:24:59 +0800
Message-ID: <1503901499-2486-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(106466001)(105606002)(626005)(498600001)(50986999)(8656003)(97736004)(6916009)(8936002)(50226002)(356003)(42882006)(48376002)(50466002)(68736007)(6666003)(81166006)(8676002)(81156014)(77096006)(2351001)(5003940100001)(5660300001)(305945005)(189998001)(4326008)(85426001)(47776003)(36756003)(110136004)(54906002)(53936002)(104016004)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1318;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD035;
	1:uBGQT78wvxdAhW7V7NYek5ydnClwZdq1woSlmdeOIPrP64Z4wpFF0EBNXq+PtDCeSpTUVdF+ET2ofdMG0SF1NWsbznNyACCFsoLj3Hyw0WLAXCDlR5AhoS+cx2jK4xdM
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc613595-d132-41f8-6a20-08d4eddd873b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY1PR0301MB1318; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1318;
	3:KKVfaAJxLBxL+9Y3APUC4TymVZFmcKJMUrpbaobbR6MBA70IH1y4gqan+LOFKdpua1Rn9etg2rmb9+ss1gbUUF8JfSyRKbsRaQ706lBPAdYSRHeui5MBKemp5V7NJze486Fb14BCYn8Qm+qEbWyFuSFRexGvrnSYtRo+mdCtuqzJ6YyqrXC1Cmg6fTLA2HZvgD8hrFGrxiBBTH7lIKjH/uxH2syahHHiIw2/3iBRtmPqxN6yP39OY9z+1qyfd3Hfrtj835XhekIZZiEVQwd43DR5LnHPrcJwIc9x4dEJxacBVtnND33l/OJce78gU9v14yZzEyRF+5C+FnI30kR+WfC8MgOP3aDEsakPzOfOkIg=;
	25:WEKd+qGawkfeEJdG5O+Hq53t3qTgQ+xb08b9WkwrD7/i2YDaCHFqVkfVACuL9FKk5GvibFmxJVb46nhAz+p1ZBmaevHuocMMxXrxfC1lGSaq4rV9LWuRQ65QdAAfSe42mus3NCu8zbLWvaOaUTJmIMHV6RQyTKVdZJhS/p1W7NFp+udljeB7G7izLvbAUbAMvgjgvosAC1/s1Y7Tn1EMFk4Ixt1TkNGgVlbQWqor1nBhjw9VOLJtEJEtBBDTtIUzk70gqiuzZOeAW00t/PXl7CrK9Kb+2uF0kOOcnYGxJczPAvEtHI+ESOVAQfawjs9jU4ko+A+Wo0+n2l22E4SuDg==
X-MS-TrafficTypeDiagnostic: BY1PR0301MB1318:|BY1PR0301MB1318:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1318;
	31:iv7+qkmkZUMduWa0t//WqaEIivGCKz71BJxPlQEpGMMqFX7Y/OmGG05ZaZMIb6okyUk0w9ifn2ilbTtrB8ls2Dv5n5X0b5cbzNYJhmK79V1uBv7IPkRf7qImIt3tNvWC65fRBwgF49wiHGTM04F2WuKK3sjXPUVycKnw2y9ZVITpcjkYn2WpEz5poExPASekzYbMqwgGAIE3fbL1S197kUhsjWsgp7fzfc6Y+UM/a6Q=;
	20:Rn7C6ZM275mlDHVOTckCj1v+YbI+N4dfEgIum9hqdmHYBEECoaPYKSBhHGYCFrbyPGdD7ZMmeitwJ5e00LXD3KmHHcwFFnkzc7VERe+lN1iaWYdsCldqffYeczASaBPX499WQRZnG62fet94wSCij/V1hIAu9Khkn93Zn/0SapYwDYUVTLxcTxKhUrV4Xmp/GjFrML3v6esxw4TKnxmKOYM8HXSL1Nk+Ngrku4LzJGOUAyYNMyrhjnb2gH8lkYsbLCkwrURZPc8QLUIWdyIhOxBomJJSidj3ILIpEt9APsiq5IX71sfncKqn7wHjqcQlXUnr5ks3gH516k2T/CvtM8Ogo6FN10e/LZ9GW/6yEooPJ0V7VdHHeTgY//fPkzj9CFtCFIjZCv1CWomjKoezEFsUGvnpH1RZXBib/6iTQj4kP7/GMa5cxQf+X3huEJth1nI1Gw4UJKRftbnb+M7xjrsjTkkg/UqZnZ1rRduTM7lUaUqwt9bUCXrhMqvUHLFJzOvHN7+UTb7IJVuK2LHKEltkfi9j9aToDRwT1Ma767GNQCJ4T87R82bHJXF+haMM1Eqrpmoe7dukp/KolnlZtTg09sRiAvdW877JzIArPyc=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1318FD7783389DC4C4B5EEC6849E0@BY1PR0301MB1318.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13018025)(13016025)(100000703101)(100105400095)(93006095)(10201501046)(3002001)(6055026)(6041248)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY1PR0301MB1318; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY1PR0301MB1318; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1318;
	4:YGfBbfYJIo1d5pAM5ADDrf7DkXE7vNMjEs9yxaJmT7KrBV0cHyalZJinhx4n4CxCmAhK2og7iMye4FR0bDxCweEVKX4OcIeS0U62VY9akIQkl61LqGrCrRSUlSlqQCK8uCihxF+FKZzOnb1VRYDbd4zuEN/XMFiPV9j2oZdypEs1VfnZqlXRjQ7v2SzbaDUFXgDsfpIRjlhUk6SDtmo0g++Il+nsLumtR5mVilGv0L08vzJU8xuNo/jvlllTEvAb+jd9D2zx2pwBs4SSYA9AIQp+wYeleX39OWy2INNJ0pQ=
X-Forefront-PRVS: 0413C9F1ED
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1318;
	23:Nic/CTepuWjGwB4pHSPGgxaDsTsMjnfaiLJvIlN?=
	=?us-ascii?Q?pzbRnMV4OoYf/EA4mP7WOw09nI+EP8l3iYQHseBLDtzcou+U28xpalFW0CiE?=
	=?us-ascii?Q?5vk/fuaiXANNXM3uuOwTqEEi5swLUbcK8PPDbQh2Vmi3aI87OO6cUoidcyyL?=
	=?us-ascii?Q?5u0Fv8Rkbc4YINQ7bHP1XUtI1Sa5f7WD4fYgY/AwF6+vu6EXMSdlhMlMF368?=
	=?us-ascii?Q?v3rsrSvyEQDDbwVWNDPzn92ahibSoE6PSyWx3lMzftKTzo+EZov3deA7Fli5?=
	=?us-ascii?Q?IbBm+i1yM3L1zqHK4DVL19Kbn2qt356KtFrNKNZk45fa7r3F9BHeoP2qysjD?=
	=?us-ascii?Q?7oC/cutBVCP7PfHiNr8LEwkTsq+QC7EN+U5LRnh8epaWYjvng8A5dQFyrjZ9?=
	=?us-ascii?Q?ODm0R3w4ag0UgH1imlpBYWNKJShBfqZX0NyoEzNKdRj/jzLS8oiQda1CXw1V?=
	=?us-ascii?Q?1x+ZGuKJuUIGmDlCED6XeLqKfRF5LFB9kepYqoZc6DfW//i2yovX7IPo7XVU?=
	=?us-ascii?Q?myPA4jA/n+O7hOh0dOTWvqDamRNvu0yPRIkZyHKGgmigi1q0PSAUpzcCwYsv?=
	=?us-ascii?Q?YS3MitJC+6hwNT7dtI/6bXAqeZt8qCct9K83y33o9zKTpBYsv5KusdvfFf98?=
	=?us-ascii?Q?1UhDN+m4esWZMDGOoVjIqVvJayvoAVefDt6slVFxpiIzF9/RsTw2/aQD2ZjD?=
	=?us-ascii?Q?o1UpzqPZdfX7JODCpDQLNgSFNtQ5ym8ICIJMCQGxN2fr02zRb4dxmpFCaQxz?=
	=?us-ascii?Q?Y1aA0vEdaDgBd0+PAZ9IIoxWEVGBR/+NZm3t0m9JKV1l6t6WanLjs16ud+Xa?=
	=?us-ascii?Q?7Nxh/+HXGmjayEWlwp4+pDp4khFGDBgl2Zv77TZOh6eIohb8nU2YmcY6f7l5?=
	=?us-ascii?Q?YY6dOZv7Cu03bDF9oXxwsiEWXagqPtljH7yVtpfhoJ0SmOiFezhlJbqPaSc/?=
	=?us-ascii?Q?Wg+x6Mr7FSmOsVA/CoUdDfBFxyDcfWy/G88715tMBvO1C605KNXCZZRuCvcQ?=
	=?us-ascii?Q?BQGimFq2bPJt76DBMIByqqnWy?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1318;
	6:1V1BWMKIYwLx7MhVMgh/UT01tbnTbe5IWcsfxeBJsLEu8KS1LgT0mstOKLG3UOiYDdMEEo+nNZ7/U0WWWi3FJXzNjgRy9sh0jbW00eLc3hwUzQtZopb/ZNQaVF9OYkL+VsxZZAxse4G4L8l0m6DNA3rt62+zqabxpdTo9Q41pxJAMNZcQCpZ7QivysnsBidtfOxDVXoNZ/OYv1CfTbBufXSl4HH6DN9I1u9n06hrarxvTZS0DvKs9dlLxnHs9Mo+dtXR6BhCbLzOolsCjcZRYkyUu+CTFgyZndUNCbs+2Eg0LFGH1B64CAaYvs95IsuSADfD3oizIOrIz/IQgvOO3A==;
	5:6dYB6rMqoDLocbiPB2kXBzsLliYG8UAYfJkeaRPxvLBYSA3bW9CDEfEPddS+MMCDKyAkb0AGI447Y1JxIImzfQq1iKecv+W9PiaHqV28hx/Iu5ErfuZZ7eGJzU/edupOclI6Whr4Nt1diiQPorM0MQ==;
	24:OUAbtG5liI/u4IGECj6q25LUD1h9O7AfB9ldyqQ0TZlqsl0Kx7KNgaKebN7KqQ+p2lqTR8RA3ur0JIIsR6r2Gw/OZtRHQQm3PgrNhJ79eSo=;
	7:d5b3z/JhEnYZKGWfwN1PzEOIuomnlTgNCbY72U5CN/RL4jQrKgPmUYUvgKQx3A3qCjBZzsnRPgu2R0i5sQUttMGIHOVdCoGaIgY7NjX4z5vwdXTo4U+HZ9S4ECgkAupkXtgYbvfLqFlTmDGMjKmcZP1TRmXnw5PIHRcvuMwd1X+BgTSEo+R4gXMGL/+HJWTKKAm/+mrRePUzbCVM6ugxEcgjQc+fMgdnR8li11fnpIE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2017 06:25:06.6443 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1318
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1318;
	23:a6xgfeRbKikSXFw3ajL9pTOgKbI/XuhxyHqA2hFeG5pM2zH2PqoKBRwHGeuWfZHHEidwNIDGpWyKuP83sX0vd42CLH411TvCBUPgNbht/dOTZjCJks7DenHyvrWXw6GHfe6DgwIqGan3czx/NP843A==
X-OriginatorOrg: freescale.com
Cc: chunrong.guo@nxp.com
Subject: [PATCH] libvirt: fix build failure, failing QA check
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
X-List-Received-Date: Mon, 28 Aug 2017 07:06:37 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

  The build is failing due to a failing QA check:

   ERROR: libvirt-1.3.5-r0 do_package_qa: QA Issue: /usr/lib/libvirt/ptest/tests/tests/check-file-access.pl
   contained in package libvirt-ptest requires /usr/bin/perl,
   but no providers found in RDEPENDS_libvirt-ptest? [file-rdeps]

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 recipes-extended/libvirt/libvirt_1.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index 19b7567..8ed2505 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -14,7 +14,7 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 #
 RDEPENDS_${PN} = "gettext-runtime"
 
-RDEPENDS_${PN}-ptest += "make gawk"
+RDEPENDS_${PN}-ptest += "make gawk perl"
 
 RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
 RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
-- 
1.9.0


