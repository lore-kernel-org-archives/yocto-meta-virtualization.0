Return-Path: <BSREEKAN@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 720F4E008E4; Fri, 30 Mar 2018 11:40:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.40.84 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 80297 seconds by postgrey-1.32 at yocto-www;
	Fri, 30 Mar 2018 11:40:39 PDT
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0084.outbound.protection.outlook.com [104.47.40.84])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB0A6E00529
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ccvCaw/tL/ugOCiwQ/ZfcrGHQrpQ1ozafFqkPmk1MZk=;
	b=lGKxbEtkOFMYKzjKNDfUbtSR/ICghh0kXe2dnc7tRqS/135ueUAKave8J6TzYikeNpls2ynY4UVeuMb8LZbU88dqcej47MArgOwaPHCUC4pSHMYWO4w3Q34nwTBNXQbY+EF1SRmaZMhO54ubAIGPjSkoxLWtvGxi7qLtu2SDrd0=
Received: from BN6PR02CA0073.namprd02.prod.outlook.com (2603:10b6:405:60::14)
	by MWHPR02MB2269.namprd02.prod.outlook.com (2603:10b6:300:5b::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.609.10;
	Fri, 30 Mar 2018 18:25:51 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BN6PR02CA0073.outlook.office365.com
	(2603:10b6:405:60::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.631.10 via
	Frontend Transport; Fri, 30 Mar 2018 18:25:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.631.7
	via Frontend Transport; Fri, 30 Mar 2018 18:25:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44881
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f1yik-0004PM-Lb; Fri, 30 Mar 2018 11:25:50 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f1yif-00036R-Ic; Fri, 30 Mar 2018 11:25:45 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2UIPYbl023799; Fri, 30 Mar 2018 11:25:35 -0700
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f1yiU-00035f-Qu; Fri, 30 Mar 2018 11:25:34 -0700
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Fri, 30 Mar 2018 11:25:26 -0700
Message-ID: <1522434326-12321-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(39860400002)(376002)(396003)(2980300002)(438002)(54534003)(199004)(189003)(426003)(2906002)(72206003)(8676002)(110136005)(9786002)(356003)(305945005)(486005)(16586007)(476003)(54906003)(36386004)(126002)(2616005)(316002)(8936002)(81166006)(486005)(50226002)(81156014)(77096007)(1857600001)(59450400001)(26005)(36756003)(106466001)(47776003)(107886003)(51416003)(7696005)(106002)(50466002)(63266004)(5660300001)(39060400002)(6666003)(478600001)(48376002)(336012)(186003)(4326008)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2269; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT017;
	1:vvxHLOfFAyOU2eBwt+hfduGGI/93YcxCmxYueelFwx4P9GRtDDbDuSkPZ8rjASLQTrWXJrjdVkoyVnRwBuQMOuRmf+ZedXisp3UMj5jbEduvN/jCuSnhINLk9yPup+ur
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dca6c09-8b3e-453a-6057-08d5966baab8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:MWHPR02MB2269; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2269;
	3:bLFwhBOTVL0Enu2xTLU+E9WiymxOSp3CbJGvHDerrpGFQCUoQ+LeEYlpAgynQkyPQTcBC0gwW0ST+E/xP1o7aonDruWGxVKm1PdPsYp0w+sLcJww+Wk7kSiLbd4nROQwPE9NeXqDIHrNVV9QxHwIoJXN2zCDSzdntICsEjU57ZZKS5eO8qCKjCVmqgizWiycgyjmvHp3j3abvhbOM/l3tM3PRxff49UfhMt06tX+OD6/zAoV3k7QSFzaqcTvonDTwhwq1Fw+A5sL4gny0v36cpgpl821CEoLcPCjCV3d+dO3wR07TajPd28gwaU0+PPqk//FMYrIh6c7d76AEC0IbYTs7Ub6q/ji1T0KvJCfoEg=;
	25:4+eD66CPHMEB6bv70mrsk9Qekb52d0mLtFssgR7ljdNkd9MT1lJcYnf1QmrXpGw9K6wMsuDMhkA6oTkTaNAyIsGOSgOZIiWi7/AErLjms84j9y03oOtllzpIyRpjfrpOw6TLHx725GCjTy7HJ7F7j7uIzeb9W2bpfC9F/yp0unyK+uPGHcP5xiadX1lJXn7Uj05riSFx4MMfcGD5zPBj0xWkaoIZcl4/rix8+6VVRSkdq4KZ5IPnw+VUHg/74Is77maG56PkVAI6Ee6afDHBkuAv+TciSMQXhzfFd3OGlRlpqPbXxI1xpW9yytRgaekDovVJ39vNadjyNg4QbflMGg==
X-MS-TrafficTypeDiagnostic: MWHPR02MB2269:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2269;
	31:KVySC6JAfHX9ojFP4m0nVHeuWwvLwAZ5SKh3XMNRbZdmGOy9c4cHtDJb95VCGDDR49XzPMyCVm2xtojnsaWfiNoJhDN6SzO65brv0lUsuWpC+GJRYR6p0jyTHPP7JMsZ5nx4qMpEaBrXd81gi5DDm7VZWQ8YnXlSPZuMKfHhxeqeFwGF5SrGbRuNvppd97DoKa/U9ofytR/QHt4eP/fVReP7/tJ5Z8FqJ/rxP8c+aRk=;
	20:UNYorIGIAsO1R6xyN87rOA/44u/HwV2Bci0vsr1nPFgVSZsOd/Z0apA8o15yX9zb71Cx1jInzTJc99IcpYvv5WoHE4Dk9WB4grjL7VDN7eR2C5fwLrwsRuw3maE8sdmJ7GsdHRvlzU4uNDKZ86NzUJWsLPj0QqJrMKwKU2wHvXR4AapZpIgOM1BYsgr/5Tc6Q/SpmAg1xLdQBvUywrSJ+fhmr9r7gK1TTRoAV+gPkE3K0wbbNuDy2rTDNwWsarFb8yl0RXs1KK0g8HTPpN26u5BT/jFSAeWnEPxF/sQ54tFpTZCeE0Pv3Fk5gBV5hLel1wE4KKHsOzd+5FxtQXV96uTaVjae6MFjawMdWwrCekwQMImLvf1JWhLrSUO5wkFLrXq8T/CIqtbkROm3loiIF9zzCZGBbegokHs0bF+g6n52esceJ7t6F1tO1GFlC68U5w5KpNl9FU2asU+Hfs4zPggHBmqMyRGBhP4BrUcoRxQBhU6fKCJhWp84NJX4V9Jy
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB2269AD1BA09617C4BAB94D2AB0A10@MWHPR02MB2269.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93004095)(3231221)(944501327)(52105095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:MWHPR02MB2269; BCL:0; PCL:0; RULEID:; SRVR:MWHPR02MB2269; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2269;
	4:vjHLl9dgVoxY0CKz4/5VdV/33K/rQzbYjF34gAT69R4ZHnBNqPWh0J/+5M1e2Bo7Y5RirCu8BVEEbNEQ07P/1Uoh0FoTZr/Eo0uQllF5w+Q3Ftluir8VC8TpyTfaTKTLzsDFn+nnL1iU2WJ1sXR06bPcE2O7/RZ1GJY/RcXLjU101NWIjyoMJAOdtObZ4MNaaW5sUWPi0/G3dr0wJ9gFLCN2Tj2bmR0GXLdnEGjMzS89JhOPSQPh7VzMb5PWUDeFsFFLbSJIBPTXebZinCjC+m48aEgBG2rv5UpxWW+IV2AX1Q4wOTXH5FO+8lXzIr1EWM/tKaf+rUgnik7b7TDyJGO1bbx6HnJaG76BS7VDNa8=
X-Forefront-PRVS: 06274D1C43
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2269;
	23:HMDcl8VcrBhv7EZKtbw6J4Gn0mlNuxuY3jOMgCjTh?=
	=?us-ascii?Q?A5eLFR0WNxSO94T/sTdfqn2Nc64Z20tgD0asqc7rPHs5rt9pgiyljsHD29ih?=
	=?us-ascii?Q?tckDum9FwIXLKMBZwGeCdLZlW+VK1LGczh66HAUIo0/sPlYcQ1i73xafmp13?=
	=?us-ascii?Q?bDhPPWamP0vMQEAVSF6eDbJctltXPRAbjryWNOcilW0CIVss/pSbqhF6VenM?=
	=?us-ascii?Q?9kHHB9u1gOOp3xofgi/4GkZoYN9nwJYJL7TwPT9uEbMjEgJaxV+lNF40oAQp?=
	=?us-ascii?Q?shy8AerPO7aA2NZQKSR2oNQ/TvHJFkJq0cGvi5vzwwNChn8tLedNQcnes8xj?=
	=?us-ascii?Q?EcqHMjrtpOweJL2hE1IpsRD8GheTAz6AHSsN/oCqU+xhJ7XKwurEAemvjcO/?=
	=?us-ascii?Q?3BZArcejKamUI+BhKW52x7h8vvREuhSnod8aq1HQNBQEpD+xC2oqL9Lcy12H?=
	=?us-ascii?Q?5850Z8XSE2XdFa7naa7oS2h/aS4NmLeX4uZUGnZLyPNl28n2pWr+g1T4n0Gn?=
	=?us-ascii?Q?A8DK2WSFKgU4tHm+x363+XYoWxAS88oGqquGiJ2e3fynLg1ACpy838HoTsvv?=
	=?us-ascii?Q?gDN6hEznH1iOKGfxkJC5IURgun+Rtvq+kBfYpYNJb7Qz6pqbiwOmf4UOIgrW?=
	=?us-ascii?Q?59SLV4LHzmR8j3hIe1D9x3cBayYyxsL4SBK1UnwVBdFrE1RcIj3ClTpx06If?=
	=?us-ascii?Q?zpqC7gmNz6P1jXKmm5rQ9175foFK2sJoOwWyHXbbyn5fxlD84ncayVijFUr0?=
	=?us-ascii?Q?Od4st6S3vBseU+8nIzlajcBCVqq1hP3y4fFCLFgsElePriRCaac/oXxvExfO?=
	=?us-ascii?Q?4S4frpMtsLfFdYNxu1IJc2A3Dje5t30ox3TM9Aoj5xU3J/N9kl0qM+jv01Sg?=
	=?us-ascii?Q?ompqo58k6kZGvNXI7Yw6FiNo65FSjZb/oN1EaP2IAz74S+JrIOTws+hFHuYv?=
	=?us-ascii?Q?8St+LTFo9/pU5uVOK5eEEsMjtVbtO5i2yn0FPVVzorfkICDkuHezJAN2fgY8?=
	=?us-ascii?Q?iTGxPx2MqnMEtJXdjfyPGMhIWd9mAmvWqbZHHOLNrB2Mi71/xbsXOj1IudBn?=
	=?us-ascii?Q?P7Tnp3JgcYeAqWy0c1PbItIfMyk7WU9V+Cj2zE7jneaLbzyz86hFHgZQnR4N?=
	=?us-ascii?Q?XgE1FXLwShlOGg5NsrRZBtXpallJ2PET6am8gcBVVkguZkQnEbu33dJ34J2I?=
	=?us-ascii?Q?cY6859RbXL7T4C086ReGbM/hxudE3CJs3KnVTTfSqljc01qVYN5vZsodw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: KcC52R/8DVw/V2uYMF6qM7vEinrvaPOi8nbCNTZA27r+FGK1wnvJnIrwBTf+vtjDhV+y8E/RSoLyW/xAlt/0vz8SW5WJPtBnJrflqegRa/kRR17PbTZ/Axh2GNxgsoSeGc+TlIBhtncuWi3ur3XVCenMdQjs4gOeKRtnF5itg7hl0cqWHRMugUAL3mIjo0Ej
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2269;
	6:ulO6j0M6+nNF7gJ985XY1wU6CnaAxDrdC2o/DyG1SKLtRXqU0fXRpPgch8F8Ow1dkY8HIp21uBp2O7vjfKbd8Ks3UIdEj1hUzf43B2FIMvG/gFg51qjoaZ74eLtGNoacYUH9eL8rhI9T94/VSj/gShD5CgRTafPw9kOsY1AQhd6o2YCmOBlRt8fINj1FueVdslBL+PURMNiBiVZNc86iplsMQPYrPo7pjJzn8kHcjCxuBXg3eclkBVQt+OErR+z8csUzLu+1s0M7a3fCaGX2BGoEB1Hfaemko361D4o94tCDDoc3nONJqYkdqFsD8KQOQypHmldO7KnjHfu1w+7FY/RfovLc2UwudZQHiTNtOw/vISKNpujKirAz26bKkgklrg537sVlCJV6XwqIgkUTCLP7sHud4FP5+BiSluSXf2DBdqMqbm5hGI9sYAzYKw25cuvGcrS/Q48cOUzbTXuHUA==;
	5:2UHeUMLR1Z/5sSs19Gn9iRdVWESan3qMWdGXUXg4lF//+t6LfGpYsfIulGED8y0weoSjZPjAfO9zL8NLv4v3do/YYXwjfLSt9E+CngWm53DoxHlZZWNAsZqAVmiz2xMd72hWSGIYnwWM1lWfzg6M2SCb12aOIjW73S4yP3D5Mp0=;
	24:ehTtkwSnEBGHjva3kb5CtG6cYfCx8MT5buN/2CniS7Z7zQbX8G/IHhPmmF6wBklsA5Nl9NZGCMs3OmWj5vODlPDXlYHN+IpMOl4pqdiqaXg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2269;
	7:Q1xH5rGD1DcY3oAa7aNbvEJ1MwGck6M3RbBZOcjLxbJ6RbGADhFXa9l4LYgNVchPmCpjUvrhM28oiM5usC3t9IDrMz6YNy0dbycgHsFaCcipPy7chdrOyPI+89CT6thA6E1yYR9cXvtHS1BhiFm/q2nJ1xk+/ETPEhGHcU1OepsGcitUAmXkf6NR9K04HpTNhwkNfdvQTC9uiqOVNWrlJnCZ9u3QDoIlR8SYO215eQyCMp1Q7k1ZsO2YuDMKJ3li
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2018 18:25:51.0795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dca6c09-8b3e-453a-6057-08d5966baab8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2269
Cc: Cyril Chemparathy <cyril.chemparathy@xilinx.com>,
	Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH] inittab: fix hypervisor console
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
X-List-Received-Date: Fri, 30 Mar 2018 18:40:41 -0000
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
	to not apply.
---
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
index f71c117..461c73a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -20,6 +20,9 @@ LAYERDEPENDS_virtualization-layer = "core networking-layer"
 # Override security flags
 require conf/distro/include/virt_security_flags.inc
 
+# Add hypervisor console
+require conf/distro/include/virt_console.inc
+
 PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
 PREFERRED_PROVIDER_virtual/containerd ?= "containerd-docker"
 
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


