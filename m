Return-Path: <alistai@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0BB5E00C59; Thu, 16 Nov 2017 18:19:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.38.54 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 12833 seconds by postgrey-1.32 at yocto-www;
	Thu, 16 Nov 2017 18:19:33 PST
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0054.outbound.protection.outlook.com [104.47.38.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C6DAE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Nov 2017 18:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aW3WMDabfqR2czbQr8zo/8CL3ixbsmePaqJBdO2eQfY=;
	b=oLBH9+8cjdHa528xH2RgECFf74xfhbbtpmOqei+r3+08lIDEhQbWwfH2e2QyKDcI5ndYAupwmGlUwOx+y0k+VA+W63YQWGIio8Bi9vZN6jVXwHCISr+lQhHkkFS8VpPL2a9mtgaRFkPKxV+xl48larC7ebofsgLqDF7o9rxAlk0=
Received: from MWHPR02CA0024.namprd02.prod.outlook.com (10.168.209.162) by
	CY4PR02MB3383.namprd02.prod.outlook.com (10.165.89.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Thu, 16 Nov 2017 22:45:38 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by MWHPR02CA0024.outlook.office365.com
	(2603:10b6:300:4b::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.239.5 via
	Frontend Transport; Thu, 16 Nov 2017 22:45:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; yoctoproject.org;
	dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.218.12
	via Frontend Transport; Thu, 16 Nov 2017 22:45:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33875
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eFSuf-0005Ku-33; Thu, 16 Nov 2017 14:45:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eFSue-0005Gv-NW; Thu, 16 Nov 2017 14:45:36 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vAGMjUVD001439; Thu, 16 Nov 2017 14:45:31 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eFSuY-0005G4-Pz; Thu, 16 Nov 2017 14:45:30 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 Nov 2017 14:41:23 -0800
Message-ID: <20171116224123.28383-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23468.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(81156014)(36386004)(47776003)(16586007)(5003940100001)(9786002)(4326008)(36756003)(1076002)(54906003)(2906002)(6916009)(106002)(77096006)(2351001)(50986999)(6666003)(63266004)(478600001)(356003)(106466001)(50466002)(50226002)(107886003)(189998001)(8936002)(6306002)(316002)(5660300001)(966005)(33646002)(48376002)(305945005)(8676002)(81166006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3383; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT050;
	1:vBOGwNRm5jiyN8znLdVT8//TNZ7GVO89JEdjopbF+PclFpFMKL2rcDh/Tzjmm/lx0iPkA5/l0Fpjvkd5Latk9AZph92wUWedPZPn+jbPqK7KVa42LcoF+MYkLaoyrro3
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b854e9ba-b03d-454a-fb97-08d52d43c1b7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	3:AvICn1vgoVUn1PND3xAqFJvfa6eJi1EeAtgZ9iGfr9ycqgBU+UB9ZPRB2O600O5EKtgHwxj3heDhsZlNi0SrjOyFCj2Op5hFZF7bBHXHSlxMm3TNbyq0gJpfi3oj32/+dwerKLsNoKtbk7nx6c9y5bU5PK5iHYYvjlwB+AL9/AStVZV6g+KyZC4t5/ZjIl0IgAwFNFePw++6ih0I84dbRb/VXWJZ1VeHsVDg+yW403ZwEsP2WZbJtqxot0roDfy5w0A2Fs7j4dwQ7i81YVAmCl2LkiIHSBtZwjWiI8q+ZCaqYx6JlIEIQrgHZEqKKFRjfXRzuiiCTQ1nRYrFop4DvcHvL6UEq4yY1WDyrV0pua0=;
	25:t9Ljkm6APzwtpeuaNGEPG7/rla4ia9cNMHBMxY+CF++gd3w/ftqPwV2Iv4IkT8b60RCwk5FAoVp1mJ2rpQZtS1ugCGSgCjc59EkQLjnIPj5i9csHP83YdUkvoG4g//U0dzDycWP2Ihy7q5f3oq1GcuYlx9eDwQKhsUgdkc3g3vVRmeOj0X/IiMNXhiaFU2cde5o0WZjItC42eSuGZEYFrXhPoAyXyt82gdkc2A6IcUzZL4Jo6WCpdV4EBhIypITdxk+junl5JNXjUpiHH237Ivg3sMLoWMXUk51LyQ6/VE1rB8pCqxxqxMMgCb6OOTIDUQPZXGFmWPTsWZsUI8yGYQ==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3383:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	31:gF3hdOgXDH3PMx7NunhbdGlkiJqtBFBT31ddCWuNPVOoPsh4fEQSi0Mz469Xx184NARFzodrznRRqp2rJvwkkHZXsudqhbVwNJ604FvHaZVPaiDUAto4d4UpABx55sN3eLXFu5tPV7RdmGAlOMwP+cb9SRHI3NzSLAXedZSjcmQkAu8UbEu2d2w1tT1jVPq/cu0F0whWsyJoJjS2DlLogi7YCCY0TQW/CmphwiR69MU=;
	20:UCDvQfAZ1LnY4N8rNdEOf64T7NfnC9hvFfCpQ+a6FKYzUaGVxFZ+P5j4ZFBTHHzNGPZac0f7lTjv1cPkj6gsgdPCV4tisJ5s20kxJkG6E/0SnAOzZaNEexdjv82KLuo1SWFMnlcqzJB3RDe6NAXfocO3CNoZ0Di1L9k7Vu27VhMgRwhRAZqPcSNaIvwdxftRdGCZ3ZZ8lC+B7HJy5nl22vS/sgGkKMvGjBb3l0fRAHejB7R7WqC6AeDe0g702Iy6bf4nyo19wgvPCU0JvLOFeG+hwfp++JoEPWOWNYMjKS0VPSrVqIoTtb+XRYIheWTKKd8yNOdD+cMbOQNHWs8I/WcyxeNJVblRHAq4HOst5NjYQROL/G8ddEbroZESvGtB3Bpl8gDm59UnXUkh7AQhdgCJp+hcC/nEGoObeGUiAbqSkpl4F61oyo77/lIkAIxM8e3+vVRLfvXsI0PgEiHhYGdX7gC/gBeRu9MfbFZWytdksD7qQctvwlqsCAwBbSvp
X-Microsoft-Antispam-PRVS: <CY4PR02MB3383B5D5743D8576C317559FDC2E0@CY4PR02MB3383.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(114974198459425)(278021516957215); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231022)(3002001)(6055026)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3383; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	4:saqjdj7FBwaQ1kC18ayk8KRorN538G5ognK+peA3GoWwT65tF/fdUecOeSx2tG8Tk9o5APFdDf5qMprHdImJYvHjzxt5Pa12iTe4kpVWZO+00iR46K4rRhQ0phhoOZ1fObUhW/SVnL52MFXVPcpfh6iWaDsnk6TIYL2Ruy30bVFnvYAbH+ITnCwnVpCvtjGThB6JKYmydPocy/5pJ1T6mjQW39Ib7/Q5l2G6dbPYPb7CZ8QtM2pDcMzbp45ZgFtw/eiV5Ae/+9Gw4/l/Ygl6hUCKWbgt6EWSlvvd97UkYHLQtjkHTKZZwZUhI74idyyhldI7xq2bj/Z2yzZ0PqreCYcI+phWEKjwjwrwTwN8PlfZCj5ELljv158QQBJIjTkm
X-Forefront-PRVS: 0493852DA9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3383;
	23:MgPI1Il7345MXyXW2pgf6yXYunuD8sgxPKtVJVj2z?=
	=?us-ascii?Q?t7o8WSoR3OgP9Y0DTwch9Okx9/2g8ObyyIYKhTL3jElf6smcBGZOC9EX9WXU?=
	=?us-ascii?Q?wcbzQXlBXF8/wRN8c6GAn7bjjTG4Tu444S7BYkPnaOHbshuj/dw3/5RPjAyb?=
	=?us-ascii?Q?NOL0tdarxixhKUObTjRuba05oTwPERMGPVaSgS08B00cDLL61rWen5cIFSNA?=
	=?us-ascii?Q?P0psf1J+5jAtMLoQ3njPWiWABDxPqjNh65FfpWHjkVGsgenpA0wtq/KPeIwH?=
	=?us-ascii?Q?wjnPwow2qFCYrDJsh1y0MyT87z69dChLRoCI8Bsk4kNwZyVHM+lTxIMwHp9o?=
	=?us-ascii?Q?dsEZBhx+vMOJh0wB+J5vcyG8wZyZpFFgrwVAUim7VHUgSiOPFGPACZmptiuc?=
	=?us-ascii?Q?ZTFa6/iSaBFIvb1/UiICtj5ErzjImpwqVZiD+FU20d2Zi0aHJ5h1ouNqggns?=
	=?us-ascii?Q?z/3G16UREpTnOdN1zFtWN4Lv3KiAZ6zFpEyZrnGd3k99BGmqY70sqQNX1AGg?=
	=?us-ascii?Q?zSpD55RvOZjDpLP+SnAFewUVa41u6WXrR+llOb+PDvEeSmLyKJiTHaeNM4/J?=
	=?us-ascii?Q?u+ZOEWDNJ2cUBGE5XgQ8ymbeUzjqc+zePNE0tRRyAqH4kx4w8n78IJbdh5Kt?=
	=?us-ascii?Q?abF2fKahAp+vT9wxR5cjWX60DtlMVL+ZJAUSdS+BSu+JAUK3HIH7bY6r33Jw?=
	=?us-ascii?Q?vW85DF3EOALlb/MoSYLe1t1DjjCIHGnhlXU9csVJg6CxMAJSsZnoSIDp9wdc?=
	=?us-ascii?Q?04GspEvSi+eXDAiTZXqqKBtPmcbTgwnl5EilZ5xcnZbpTWdL6T5sCfiIhon1?=
	=?us-ascii?Q?+0qViQKlOY4gdYCUL3QTSEtODUGaFUhhj1YBcLNEf/LBkonA+9ARvNfch6E/?=
	=?us-ascii?Q?2b4QRPJ462VPor+hnXw6SJgH3iBnUzMBDeo6xRjC/pt8bSFf43/rusdJ7fZ9?=
	=?us-ascii?Q?9l/3tAKZ9wgRutcQ3USLiFaCagu02JNtyeKYK8wt5xA1CrC1SFV98dAFHG5s?=
	=?us-ascii?Q?GTKwANZVM1l/YSq4ywch80Nx9VthEgkAa9TH7xALhtR8LO3lGFZls6lAQLh7?=
	=?us-ascii?Q?tRh3Bs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	6:IOX+LyECY2OBeHEvjNXxQ3/nypwx/AwTruZo7+oaE03nN7I8FKdB0isZiojI68L7kVzqhlw/OuL12afhIWeFMnxtD7/Zxh7TOZg3J1mbXm9Xx5iNX/D/qbvm/ZfA3+ST2TyPLGIzs7YVbu+40oKt9JJ5XuR0tO57D9Gnh5MGlyRZY8LVxaxMgVa3+G/mYhxkI+a7RduzjbAmRTVqswy/EAwMcbLmjypHODQTMiDNasO+uEUB6r3X9ic24DoTE4A8wgC6G2g5+hsUl2cMZ4285F5fe5YYKq5ygTdN+Do9S3oDxlatnmMyGojIgDgY1FOhvUhrC9uTPWlEouLM4io4q8fJuUrn7r2Xg+ChO0seob8=;
	5:+6LR8NTfYkNN+JDZpg8Mo05o0wN5BSWcDzYr4Rt+LPWy8gaGVSXmNhqjothRXn1q2zwot2DR7MnTcRlvc1fnxq6XpPf/C6tlCLuuk2WLE3pTkFFeJweSu8tMGunA/kHcBoeJx2ZEj3Pd78kZ/TALgpbntnsMC2YU+uzZvgvm1Vo=;
	24:EMSHnwlL+RwDBqApJnHfBciwUQ8+s/KH/6vsgz5GB6eKPOMKOuIvGykcjWj6qo3k6w0N+9SXg+2XXdG4yoht7o0pR5zfBnp2EjJtevv0kK8=;
	7:s87s1SblMPHonsyA62u5d/0q9O+xgH85+J4rbAPk1MLfEsB9xnT4/2R5uepLfTOMPawvzF6+TZoH5hXzNccWet88zgRwBh4zmfQcCSMAjnkng4N5u4tWr79OYbXP5rCDi3zwnps+yZnAJf/L8sHNwx2E7vU9x4AHWhQ6zIBVUHZNbZBB17EU6OoWn+lJHAcPag8xngKbPv6EP/i9YlgaKBMBlYUaU8DLEfbhWgbTLh4e/g9e4QApa9y1lB9cMgX2
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2017 22:45:37.7505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b854e9ba-b03d-454a-fb97-08d52d43c1b7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3383
Subject: [RFC] xen: Enable compilation with external source
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
X-List-Received-Date: Fri, 17 Nov 2017 02:19:36 -0000
Content-Type: text/plain

When building Xen from an external source the compile step fails as
there is no Makefile (or anything else) copied into the Yocto
build directories.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
This seems really nasty, but it's the only way I can get external
source build working.

 recipes-extended/xen/xen.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index cb314f8..7a54416 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -901,7 +901,6 @@ EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
 EXTRA_OEMAKE += "debug=n"
 
 do_configure() {
-
     #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
     if [ "${XSM_ENABLED}" = "1" ]; then
         echo "XSM_ENABLE := y" > ${S}/.config
@@ -920,6 +919,9 @@ do_configure() {
 }
 
 do_compile() {
+    # If using external source we need to copy the code in
+    cp -rf ${S}/* ${B}/
+
     # workaround for build bug when CFLAGS is exported
     # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
     unset CFLAGS
-- 
2.14.1


