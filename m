Return-Path: <BSREEKAN@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05FA8E00A4F; Mon, 16 Apr 2018 09:34:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.32.77 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0077.outbound.protection.outlook.com [104.47.32.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 864A9E0084A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zciJM6ljvojWB0rLsMXhM7diwjJnNvw1meXIdmofh4Q=;
	b=vVwt57CZ/hJAu6IjaWTdM1CYi/BDb7VTiNNvOGzVOqi0uBGImUWwlMsfqhASSncLh5wgWQ7yMdkuG1gsMdtO5LElRfM8BCKGtoBLz5xBuPQ68VQUmoHzyooIBBIcyakVZECU7yroPA6pJfyO0XxGFOLl9wmy7t3nF0SBq6zKqSc=
Received: from BN6PR02CA0031.namprd02.prod.outlook.com (2603:10b6:404:5f::17)
	by CY4PR02MB3189.namprd02.prod.outlook.com (2603:10b6:910:7c::34)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.14;
	Mon, 16 Apr 2018 16:33:57 +0000
Received: from SN1NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by BN6PR02CA0031.outlook.office365.com
	(2603:10b6:404:5f::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.675.9 via
	Frontend Transport; Mon, 16 Apr 2018 16:33:56 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT044.mail.protection.outlook.com (10.152.72.173) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.675.14
	via Frontend Transport; Mon, 16 Apr 2018 16:33:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f874m-0001Lk-2B; Mon, 16 Apr 2018 09:33:56 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f874g-0001yy-VD; Mon, 16 Apr 2018 09:33:51 -0700
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f874Z-0001yR-Sh; Mon, 16 Apr 2018 09:33:43 -0700
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Mon, 16 Apr 2018 09:33:42 -0700
Message-ID: <1523896422-12702-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(376002)(396003)(39860400002)(2980300002)(438002)(189003)(199004)(54534003)(72206003)(47776003)(81156014)(81166006)(50466002)(8936002)(9786002)(5660300001)(107886003)(39060400002)(7696005)(51416003)(106002)(48376002)(356003)(36386004)(36756003)(478600001)(2906002)(2616005)(476003)(316002)(50226002)(186003)(305945005)(6346003)(486006)(4326008)(336012)(8676002)(126002)(426003)(106466001)(16586007)(77096007)(26005)(1857600001)(59450400001)(63266004)(54906003)(110136005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3189; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT044;
	1:fYfIPUARL2U2dFmVLEJCToPfqhwGXQKEWBZ6mj4ESZIEaQYFsK3WPMLFNpLk7m8eAPnTypj7iByzadM+KS8F5EuU/qvvduJigC28NVAewKN9mIzcLzyby7d/IZ+onNPs
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY4PR02MB3189; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3189;
	3:vKlljhWfofCgI5hfU546PN/jbHR4WD5P31xhEZTwdVguObeL4N5VH4wyjqIu9EBcHOdVkAlQU3RmNze3AcMJmt2hEInrI6xiLL1DQxuBGfQ2PC8oDUpnwZ4NzB+kpXfRlcVfUqYCCeFJxe2bQyuohpgU7LUA84N19md1uE6Ry7ocUxOSbrnSacihFsA8eKjchjTcagpw3QUobHFJU3h5TxzI6Z9OO3W6izjhgvPCVu3KJN24TdDqWUcIZmwOkvhK/sGSouU7BByA9VU444OZuQV0Cpngg/+Dx2u2ktN1bH78KIVIQmNVlLguh6iIT+5v0kfPMb16lg5D9amwCvd9/TQCWb6O64bILQOBuKuYhMQ=;
	25:dw06bXRRp6lq6E4jqrVbUZX08mCmShBwgp+D+6BHZQd7RME7JE6Lh08AhDfl7ncVb9oBCSKqIG4tnuueEtA5sxfEWfGaVTb2rHD6ffrEgcgcJhPjqxnDfmUPn5s7YHzcULrzRz2zoW4htg7lGKxTtm7iFheE1YTMi//2xExr64FG3nLbLLtwRGZQHleljlLjTSOU2AEgKTEzW+HonTWv5Bj+voFSJZy6OUoH6qHlBVpghMG5HWTaC3MaL8nL9RakIFbWr6oKO6u94ougyeIblnujR0YFCXcgRkolS0zBcDTsIxx0GfUIv2XplZEf+kpu1p0M0/kDh0EyypAvjWcQiw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3189:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3189;
	31:hoFQ0d0FQ3P2tsFBdiK6/KmycyqRF3Ed8+fUpUs9z6oClLc75TOHTYrj47g8AszFLsWmsT3RneCYmzVGxjQ+aWyIQpJkqVCRAUV4F3sVR2+ZeIftPlLdUL9m8ryYJjK2Yq1Gdx4NB70y8egmkFxOFaWUCwAzLRHrzrZkpJizRsaaV9ekEoycelr1Wu+x1wLdBH5YnnI1I06kJQ5w2dx78OnQ1qovr9989kMAQqKLZxg=;
	20:ARxh+oUTEKlxQGYUQcIDCKWcpxy6I6qB5lAuVnkrDExVWzXF+N/ZbAE2aMkLYusRlit0CS4r/587bnTHvPVO/1cZXRO13LivIIsDIXsylLMr4W33Sy3Z8uBLj9zakoU4HjnW9H+JAl1WMgUKKDwVSyYzdFQH7MGm/mZ2EtY/v92tA65q2hi5/HZUQNHax3H8ARUVSOsP+c2WGadYuJlDhf44wIUwmF4wlsqlyaOnR6CxNDMvuZHMoPGeE3ka9TqqFJWaefsYSS4awufvOFAQkgUwZEJzOS9+8r1ZCJdJiY/HKNIE8UFougJkHRrObQNYirvkH6wWU4UTPDBzbm9gTuTeTPEEczhU0zZ6ZiehzeUKzlbSC4j13OHugl0fju7RR4Mv6urv+HsCb2j5L/UcPhwLzUmhn63ot0pZwj99ir4llvsAO5Rpe2ggTS2M7M4QDt9OvOJoTqfdKI6zTMIhqIYTPmTVTkJk3b2CnwTAynNrYCLz+HTR12CMLFJe75lS
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB31891F23C7A8A620200D33D6B0B00@CY4PR02MB3189.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231232)(944501327)(52105095)(10201501046)(3002001)(93006095)(93004095)(6055026)(6041310)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR02MB3189; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3189; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3189;
	4:m/wLVU2u/VXiKydRI1+Fhe43V8LYXa9Sp2QV87O/lFkLAgyBJTcSKkSM9XylBCjAoQ34PT5YtEjSOZ7tD+qO3lTsa9CR5ndT7pbmd08H5mOqZl1FlbbPTEGnHa/juf8QlxENBJB3MUu6GsZVs58Hqkdn/H8AF8aiPbZGMW1b+E4t3qKP9d9zC/taJzOuMSb0S6KriFhYeFH2AYN1qoCAiLJHAbxJE9lCVgSv1zFA+Styocu+1ZTcM9ozVhcT6HeAQiU1i9zBBf0GbzGnNPP/XcppnE6di1hBNBgglp4DmmKQWV+eY8W65iiZeqe62ViBDtGRjrpkEi+5A4soHjZRqA4JBTAKpDvKZIFQZEiiUio=
X-Forefront-PRVS: 0644578634
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3189;
	23:eiqDHuip93mMkLx6MMRh+Y871Q5Mx8W7ro4MorCwl?=
	=?us-ascii?Q?Pw9ba1mcgxrJ2Gp0RC3/zEtoBrQH3YYHjQzZQDtp5vbhaek4iTEnxFIxOK6C?=
	=?us-ascii?Q?X8CJN4ktKuPcbSeJWyn3y19pWWsnG1lgIX9zAYx3b3DsTOdPgnj+GX++XIbs?=
	=?us-ascii?Q?w3ncJuMaA7Beu2y1eIN9cG2AlpNdiM7uCVkk3nXVNQHwYYSvGc18SaJn5Dtw?=
	=?us-ascii?Q?Z4fc8w4ANdyUewYfBp0SpDHm1myJrxUePROm87ZT2fAnlvDKQKwC1jdTLt2T?=
	=?us-ascii?Q?IIl+I3UiYdJiglnGVXOOuxwac1nVnx4oEOmC6tKOe5pglLk7k4RMUHXXHLPA?=
	=?us-ascii?Q?BZ5MHYnQB4DCz5/zFqvzjmqsYWwzi8dK4mXBTZb3fj71UPpgwwB6Uws6OHLN?=
	=?us-ascii?Q?X7rb7tA5fpdTIODjoKnvJCjQp6G3AmxFE3DAsSvKhtJhXcRdWR3U75i78FlU?=
	=?us-ascii?Q?I2sqsvsGV1G3fdbK1hjqUcivXAw6QHOO8uBgaau0NHglVGtJY93uZkB7Pqas?=
	=?us-ascii?Q?L5qCfugASF7WnrqK8Np3ZhOpKaa5Ou+/0Q1TO2IM1q5rPPTbpMARSPa1d49j?=
	=?us-ascii?Q?GuEaxD8Tr3YkJ8peQoGcyTuHmxE6MYeU9wQ9ct1ARwcbvPj0XH22610qTT35?=
	=?us-ascii?Q?yIpztm3CbUV6vufiBe/wa/Q68EYUjIRQSDjV8RHws9DfbRmY4cKa0Y/4nVms?=
	=?us-ascii?Q?gGnSjyqEldfbtHlgwnAnk5QF5bGhT53ic9a4BHiHMwtSUh0A71oohDtPLV+v?=
	=?us-ascii?Q?KWluXhqd3/yLa8rBowwVljnSArWBKW+jv5K/aIcNKSE56kPAB0ZmzQJwnxS7?=
	=?us-ascii?Q?hWqiK0xLDF6YTY+IfVNiHp/SNYLzaxegvs3DnTfP8KzM7ywuS7q/Fwfz3E+T?=
	=?us-ascii?Q?m4Zdus4y8eM3xM4QmJVdmUEGIlVK71KSjY2yq3lNiEvSksbEeNq4oEEnvbVG?=
	=?us-ascii?Q?anQWo8IcV/q3Ar89QyA5FBNGoIaAMBhuuz7zjU0O0pVqLlcqOBhGvCDqbiSS?=
	=?us-ascii?Q?VLaNN9lEayUJVRqtn21YQY36GKlAhVFOJBDV0t8A31P269qiYGgym8wdB0Yx?=
	=?us-ascii?Q?pJ8nndTICBQf8Nk1SLPSC7iEGBeCslpB0b8Jv3Jq4Z0L1QWwo6sjLkcZyIqM?=
	=?us-ascii?Q?pfBmxOMA1FbLlP29EQ9iUWrTedahnwUv5ZwFkuqmnIZbDbQCTKRoHeGqakLS?=
	=?us-ascii?Q?yFRIZgo+dUnDz0=3D?=
X-Microsoft-Antispam-Message-Info: FsIgVXCTJNL74lHY1p55X/1lDF4EaSHnMFJd0zSBA/lxToZzEPMGlv0O5YC0IIOzzPVJaDuZayA4vE9cf3rJk7FUhak6AlrRWY8uFmusY3yYHFRRZFrKQvvrkYaHU0VysZvaa7wIzbRTom64Eq4USiXrm5K/3nQcRVManb+GRPMvBjU5cupvj0ZT7eGs/gnk
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3189;
	6:xSaGhfcgacpUFrNHiJ95kdZxzQ2TfQm8PvoSIV8QXAfi4u6gJQm0UyWcre1KIorH81fYi3wd9E36pEto3AKxvlWz02RzxpidnafRqLClqBx6gd0/Kz2NURB44sBVda6Ma7GQSt1t/T+IKDimX8MX2YmdwbE/h88rXI7OWmHCTZDLmIMbt+AWkcP22ifIPQhMLQ96JSeGRyzYVRj0oxnXQSF8CwWvo3celI+kPmZHYPKu8mKTFn1WleRzodIGnBsewlb4CnXzg8MsQlSEPOcNVGcmm5wGwFFGZGpSyGMSZ8+/0thXMK2a/XIV+lXzCM1g+EDSLHgnzVjgVyHJDRDWsH+FLlJIvHl6XLQQnQJ5rnQn52jirpxhDYaTlaKGykzOt5O26qf3QBr4XbrRs+AJva0W2rY6+L0AtPYge9zof24J6mNymjmdFFdlOELVpw3Mf8LZfPAnT36/77vt7P0kgA==;
	5:s7o2H3hka17NyT9GSuwFQJ771oQxd7nHpEj7rBeotOuq2NeTCXyJyA8narUnIrB+2HlYKjHrTh+h7l8JHUt3kO9wXlMjcwJfjfYUXJ5Y5BCm2mDa3DwU1qxxbv7ThM2IAKCi7u+boG+FLgDm/TlyTUnVAaHCJPpRPMavyEbL+OQ=;
	24:XVqtQVWLAtsnSH2n786Vn25ckg7ODdmZBwxYce3MeSmBU39p7gst7lrXSdfV2iGbUjHiEHXc3aB/ft/bQylihDLLLS1RwSGGC1QjFAFF/oU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3189;
	7:K7OO0M/fa32lKFFwGJ2wTiV46FLH9nXVC6ltjUFjseYPj1UjkAL4BmK1j7msNRQRvZkqAZ27xSwZ4nXRYOva3ccSvgpfGdPXO/l04TOt08zdVZUYpHqtNBwJQ5S3EBm4rGN06Zwu1jyV2BkeRmGoN6UwqDyswBx/0YgZCdgNX0w68uCZiG0DSlJSejFaZJy6mWs6nymFcYjbOfp9YU27FFvEkoRtxAcz++GhHdem6+yFYXC+Irtxs9Wh3OvWWZDn
X-MS-Office365-Filtering-Correlation-Id: 7eff48be-f41d-4510-de02-08d5a3b7d97f
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2018 16:33:56.4921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eff48be-f41d-4510-de02-08d5a3b7d97f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3189
Cc: Cyril Chemparathy <cyril.chemparathy@xilinx.com>,
	Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH v2] inittab: fix hypervisor console
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
X-List-Received-Date: Mon, 16 Apr 2018 16:34:07 -0000
Content-Type: text/plain

This commit switches over to using existing SERIAL_CONSOLES mechanism
for hvc0 inittab entry generation.  This then results in
/bin/start_getty wrapper being used, which avoids the getty failure seen
when running a xen capable rootfs natively on linux.

Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
---
Change log:
v2: Fixed whitespace trashing in our email system which was causing the patch
	to not apply

 conf/distro/include/virt_console.inc                | 1 +
 conf/layer.conf                                     | 3 +++
 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 6 ------
 3 files changed, 4 insertions(+), 6 deletions(-)
 create mode 100644 conf/distro/include/virt_console.inc
 delete mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend

diff --git a/conf/distro/include/virt_console.inc b/conf/distro/include/virt_console.inc
new file mode 100644
index 0000000..4d56806
--- /dev/null
+++ b/conf/distro/include/virt_console.inc
@@ -0,0 +1 @@
+SERIAL_CONSOLES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' 115200;hvc0', '', d)}"
diff --git a/conf/layer.conf b/conf/layer.conf
index 4233d39..bfc47ff 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -20,6 +20,9 @@ LAYERDEPENDS_virtualization-layer = "core networking-layer"
 # Override security flags
 require conf/distro/include/virt_security_flags.inc
 
+# Add hypervisor console
+require conf/distro/include/virt_console.inc
+
 PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
 PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
 
diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
deleted file mode 100644
index 1b89aec..0000000
--- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-do_install_append() {
-	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
-		echo "" >> ${D}${sysconfdir}/inittab
-		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
-	fi
-}
-- 
2.7.4


