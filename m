Return-Path: <BSREEKAN@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 868F7E00A26; Mon, 16 Apr 2018 13:10:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.40.69 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0069.outbound.protection.outlook.com [104.47.40.69])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94A5BE00843
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+RJyPefj3Po+ONT5OQAWHo8jUx3uRzHZrAdDKTCBy6A=;
	b=dgB2ey+zquxYgZcWpzovgzKCv4Ubr28Pn3C5/Zlb7VY1NP6c69om5sSOPn/mLuck6rEWD8X1NKOpiDALyPJ7bdELDrgNqNf3HFmDnaYSQL/SrUDasD/CDB9EWIAORIkaYclnG/i4+I77U1tiO2ercGh4D94IHC6iRTftO8QCPi4=
Received: from MWHPR02CA0043.namprd02.prod.outlook.com (2603:10b6:301:60::32)
	by CY1PR02MB1229.namprd02.prod.outlook.com (2a01:111:e400:5286::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.11;
	Mon, 16 Apr 2018 20:10:01 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by MWHPR02CA0043.outlook.office365.com
	(2603:10b6:301:60::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.675.10 via
	Frontend Transport; Mon, 16 Apr 2018 20:10:00 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.653.8
	via Frontend Transport; Mon, 16 Apr 2018 20:10:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56423
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f8ARs-0008EE-7l; Mon, 16 Apr 2018 13:10:00 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f8ARn-0004jU-5D; Mon, 16 Apr 2018 13:09:55 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w3GK9mNC009344; Mon, 16 Apr 2018 13:09:48 -0700
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f8ARf-0004jE-Uf; Mon, 16 Apr 2018 13:09:47 -0700
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Mon, 16 Apr 2018 13:09:47 -0700
Message-ID: <1523909387-12263-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(396003)(346002)(376002)(2980300002)(438002)(54534003)(189003)(199004)(426003)(2906002)(4326008)(476003)(1857600001)(106002)(54906003)(305945005)(9786002)(110136005)(106466001)(63266004)(50466002)(336012)(36386004)(48376002)(47776003)(486006)(36756003)(5660300001)(8936002)(356003)(50226002)(8676002)(81156014)(81166006)(2616005)(7696005)(126002)(51416003)(6346003)(39060400002)(72206003)(478600001)(77096007)(26005)(107886003)(186003)(59450400001)(316002)(16586007)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1229; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT038;
	1:uUC1SQNL8KhZvRoPwrRYQ4vrc3d4QbJ2pSR2KuND3tQgzHktg39FXjXb0NxB2lGaSGrvmCwlrnMk4WS0BzraHO5FGy+CHQGZgVCULqTBE9A7CfKedSJd1gGL2c9eqYEP
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY1PR02MB1229; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1229;
	3:B1EKwHzbm/5YgdjGjZ3N1//dpc0hgV4qMT7fsDea+TQXK9jQEox35ipX4Sy4LoxOi52vQraiqEh9MG92SJnqjqO5ya3Hxbc1QH1LzrTA2u6oKFly0ob2LNswu8yyuCNQ8FJRIJfDJF653sV8W6lZCpP/D5GvQtBQ0vHs6FIDCxkcuDMXLzwg6Zll2Aicnh0IU4vtwJjzBxf0QMRDFUmWLMiqftULQQJ0LDJtUtdFuCoCHPIluuAsBNU1NiN3TLHVVTqzUDbeF+H98cr8wPiHyyZbeC00gO+zMLjmkYs+BASXCwO8LDNaW5bt2CmF1fR9lFQBgU4X6S9dl0Bmm4WDxxY3AB8NofRS5Lhqy6iRTGg=;
	25:I+YEowmgTeWKFsldf961sWgpCqG2rOpzmXiU0vF2FRygk+u9+IZ+SomKTasR9GU+VR/coNou4DsxI3nBa6JZdayAA0jTsRfcPh1G47LC9Kaoil75uoRNR12sItFIPYyZyy/A9a7E2QYKoE7OrQsBolD09w/zNvO0HlSP+MwJ60x3WnPz7sn4LpyDl03s/WvAqacP8W1A+FIq6wijro72BQbFmtH/4+GFH7gDCdgL5hktAQyWmhBfyBk2DkPUOtC9lhJjmGUlm3LK6n3sFkD1O8kKS96/eaTMHXEFb3tM2LEk1kmR8U30DpdIQdjmExhSyzCtGMUi3xP+3n6/KevZgg==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1229:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1229;
	31:TD+P3Lg+kUhze1v1F6NcOqDzejS5X+hPpVftGXvp7xwpwMg7VcBHTdqW/2zdtgCg//MKdr0giLtFY7mhIN2SEt1DcmilKRrGndr81h3LJd2Hz7l57TL2qMvuodub4AgJlw229yUsDbE8OvL3llzgJMyvkO5JLAE55IH8HfuqR9HZY62chan1FIgc190eGGS0n30/PjWKSpSiW5ZltytT2w6lR6fVxmvnGAodc2qqZA8=;
	20:FFUXWep1eecyTT+AGGIKsiaHSoZ/mkLdIYiXVVx2nE632U4dP5+uWSEXk2D2PwEfZLMC5fIIHKFoA3FWorU6k4qz1oD1TsH8m8GMHcOK4fu+os73yeE8yjdODbLS36XsI3qcPfWxaJc6yDdAhL0XuVp73QXPohlZtrcekShuHuHmghqmBskbBx1x4UvimyadVKONFuX3+AskpkgZQo0iR7CuWqrA73cSwLJZ19lFnk3ugMjm1K/g4uKqQBJZaam2yJ2OrcLjwHsihoGf88KhM3qryqyX4LXjNjkgep9Y+ZdpCrkC5GztRwuu3jWy1SCj/rG1Qj9CBM0VGx1kOzBFTUF5+NaS3SJSioU3ylvmlepgT68PNy37F7eTmRyVY4SxiwjuDZfUXBaBWaTFr/ztSeeLqbJFKXjB997BOkAxhGWlkGJnJMb81na+P4JOXhLqbbSIRy9kc5Tlep1zieUbxJQNNyY/8X///vosMcSuEgAKyylKvzI8D+y/fO1CRoNx
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB122942291C4E438B55530D0DB0B00@CY1PR02MB1229.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231232)(944501327)(52105095)(93006095)(93004095)(6055026)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY1PR02MB1229; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1229; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1229;
	4:oMb5IyR/hOLMnq5O1kKHkUDXKTweDA83pX8NwqUs2WcpfjYJXTBzzSbVXYCq44EKwqOznYhUMvlFnCUi38hll1veNXL7O8UYcKLDMgkZuh449IYLpwxvAeX4VqPeTnOSQZqR0meLjnVfQS2RKG5eihWeRep/SuhIbDhOA+x2BNnqFYdCNEPcsTiKuvgOLh5bSIX6YmWbM8pjyK0QLEPIE6EOr7hqkt0FNr8tFfkV8LpMDDBZFohfamNhZWU6VtP215ksaw7PKLZfSR90z35aylWGoCcIi5vd9wYtRERZAXwBo1xjTWJN0ekZlasI+lssVAdzPuz7kEVo2xyxJvtNkK5GMmKD0QQ8EURzFrvmXvA=
X-Forefront-PRVS: 0644578634
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1229;
	23:68BFrHTFQo7AalefrXy67PsiQS9fYqxPwJhuEG/N9?=
	=?us-ascii?Q?4JQy00rlLG5Ue7UwTyVt9VbhGhu83fji1dB8YNd3pTbjhLMhOZj75PWDUjn+?=
	=?us-ascii?Q?LtyKIXloxRz3i3t1sYBkkCCE41Vkf5mPz/22pD4yA3PQmGWPkwsi/EHZ7+x3?=
	=?us-ascii?Q?niXLeJatIZ6nTgnLpb1sBXM9jEQNhy+Q+0wVMiKInFmL5Vy3Qy0nnheTuwP1?=
	=?us-ascii?Q?r/6xaJ2mg8e58/unXi9J6W7qFhxSI6BZ3za9V81qSA6r1ndEqzWQHd49kJy1?=
	=?us-ascii?Q?BLlttBOq+IfcLsSz+jgqvJwikUwfs51/mbF7OosZVbbPZUT+2xNQokKqHJ4Q?=
	=?us-ascii?Q?lJA2gs7S1pbnp6obWEOlaNJYEFavikkKwdngiNDTHn9Q0DLuq6OPy9uhsUI1?=
	=?us-ascii?Q?heccTUIi4llm0eecKXMmPkjKLgYNkHuksPmRj55kQoWr2pk+tGca/vvLjnEp?=
	=?us-ascii?Q?HeVWkJFDG0FTRNzC9QPZJloGV+IV1swiFqVbjworbHQWyEFRwhYwuT9xG5sc?=
	=?us-ascii?Q?c2G4yxcMCdgpnAl+sEGYD4JWfPeejh9w7fLkN8phZI897C2YyRkcVv7XYLMv?=
	=?us-ascii?Q?qmpNSrUVhbC/Mn2VJNEKzo5/+t213u7Lo2PSswDd7LnCIy7yCQuhjToOt1xQ?=
	=?us-ascii?Q?UBdFS51+UddISy4d5bZfnDOuAoDlF9YcU0O98eoA71VlWijOHFMCzC8BYR77?=
	=?us-ascii?Q?YxcSVBNuymI6+b6HvoQBp2MAfY0l8oiE9yOeVVntbESqojCtqcTUo2fKBIfM?=
	=?us-ascii?Q?elsChwVDWF6i0Q9KgSVCWSKcyiMCY96wJu1H/atH7UszbHHplu9g+E+ng9Ny?=
	=?us-ascii?Q?eobVkXaGg3ZIJmeos3f0ljoppF88LRIeV9DwUijTDWXC02XC+BTVYvJKlbHy?=
	=?us-ascii?Q?S3pEEvyGEnU7tDFhYkIMd4Y8Wf5WhGViGBVFAdXR8D/BrXSJTjYqp7Rvjr6H?=
	=?us-ascii?Q?VG6TZTNtg49/lzL6pb9hH/VJaqjGpHts5MncJwENSGI0vRLIP0o2GNs79GJ5?=
	=?us-ascii?Q?UD5AWCkMppqOWFYyQfLBoqCLXEoKViNniJvtQfvVkqWWX19UoO2yfh7uoGrc?=
	=?us-ascii?Q?boluIX7IoTe3pwjxYM4RCimu/pqrcR60tgTLjbBEpjwVezNZOqHGrK0cP94c?=
	=?us-ascii?Q?JrE38yKFvQN5OanzoGqFl3AFV2qN/qZgMPskUWvUdw+dJwP0bTSRp2L0ter3?=
	=?us-ascii?Q?/jGTbt+9fp23SfZRX9CfidxM++2hTcORb4Z?=
X-Microsoft-Antispam-Message-Info: J6amLPE7b/Rf3ilemaazlpFK/qSjRyHzFF49/Dq8DEiB3JQJT2/Ers8RCsj5g+A+yl1zyxNOocrEs8ucO/VzxWcGcujEvoOnu+g29CdvafdtsRQ9BK3Lnau82YLQkvbs+hM/+QkeYlojAJPcKek/dNo9DvVjRLKBoV4hNvjO30MWOTqwsL8jf2HSw3pR6XnR
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1229;
	6:ak/ZoCnd0lT/wONo0SZBkzMYPoFNORpnUtqm2TippbCDzvBkNo7EgnCjIfgeLMra/uGdvvedvzoJFCDI6a4uc/DhZakb1Jl0Pl2SqLGZvBdp2s2uwZIhq2T8PhJUz9fufJly7P13VTdKAMpkLuq7S8J32Pw4SFI6/L4y84G8PexA3/8//QkquVsv2MecjW6oRPccI1shn7TS7Yy/78uF3gEo2W1N/Uj19flCK0H5i7gHeR9g5WvtZJd66nH5ymi9+yIPTJFlLB/lSlCm7QXXxUU0+qrY5Da006gT7a2oktXwWL7VE1C91YtG2h9NCMhrQ+plWspU7d9TNMZazPCI4+K19DrfLcduUb5mapaenqTQXrJuscjC0SWoIB8hXmGP2xEA1p0dCItE+SzHO/3yhAadl7KaS13kXzQXg6ISPbzE8SXjJ/Wxc9HV7MxXYC5XqOCHyZU1OszEP8OPKlf9QQ==;
	5:Qkgdm8SHSL0Df0GSfFdbIMkfq5x2ldvl/God7BvJEgH0eX0t9Bg5bCxps1pHRV0onCzwHYeQC/dE07lIO10BtDOsPEDIRx+SY0IdPHSGj6+FpEjitMuELg6tBuHChdAPgLsw/Fv1rCFj0EeUJi2nhGxeNRIuv5AE28bBSeusHig=;
	24:N0ZgQQYHdorjQAzjoKksg/d0L3anMGSJfAIWQtcsuZLie04rFkL16cG0E4pwsfsbgpGtopYGLaE4kRUoCTu/KxvaH+YSHwoDaZ7m+hoFnbk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1229;
	7:aMPnIH8pUJFFT+YCnZNk/lLFSr2ESvecd790byPZOGBSRvVr6Tv9rMCdLhxW351BFtIT4ObiUbXn/sQrGgPq08heIRLmASzjp5DRZnj14Qg/Bqxp6/M3DnJXvkvV/UhLmTsbvaicPEOodffUJFYng2z4nVauo/UMLhfFlAqVsHf0Q7QZyZjndzhofLtNNE6ckMPu3AJz8IVcy9vPznGbNkP8zqHAjDTcTkLcb0VpRXtOHLUWlScCcuww/chUShhS
X-MS-Office365-Filtering-Correlation-Id: 8a7e3194-c422-4ddb-df52-08d5a3d608ba
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2018 20:10:00.6336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7e3194-c422-4ddb-df52-08d5a3d608ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1229
Cc: Cyril Chemparathy <cyril.chemparathy@xilinx.com>,
	Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH v3] inittab: fix hypervisor console
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
X-List-Received-Date: Mon, 16 Apr 2018 20:10:05 -0000
Content-Type: text/plain

From: Cyril Chemparathy <cyril.chemparathy@xilinx.com>

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

v3: Update patch author

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


