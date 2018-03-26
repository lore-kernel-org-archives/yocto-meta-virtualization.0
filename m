Return-Path: <BSREEKAN@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56128E00C58; Mon, 26 Mar 2018 16:17:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.36.58 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 4659 seconds by postgrey-1.32 at yocto-www;
	Mon, 26 Mar 2018 16:17:21 PDT
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0058.outbound.protection.outlook.com [104.47.36.58])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B288E00C6E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 16:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kar58PEdEJR8apQN5QxsRoLgOVMraqICL6Jxikaug4o=;
	b=Zx+VuWDpMpR2UUeTR+4SfcMD4NuqQkcxlx8CK6hWv5od3S6488BNfx08TGJIrgp0MurlsyYqZagByaAPYvhVFhmfxbQ8dQnkBzuuhcocVF6IZFt/aQ+umq6lUKmW15IzMVv0IOFJR8iEHHd0AsK6N+css6PBUIfFT9DCx9zV7bg=
Received: from CY4PR02CA0024.namprd02.prod.outlook.com (10.169.188.34) by
	BN6PR02MB2258.namprd02.prod.outlook.com (10.168.253.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.10; Mon, 26 Mar 2018 21:44:39 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by CY4PR02CA0024.outlook.office365.com
	(2603:10b6:903:18::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.609.10 via
	Frontend Transport; Mon, 26 Mar 2018 21:44:39 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.631.7
	via Frontend Transport; Mon, 26 Mar 2018 21:44:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60283
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f0Zuw-0005r5-Aq for meta-virtualization@yoctoproject.org;
	Mon, 26 Mar 2018 14:44:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f0Zur-00013N-7w for meta-virtualization@yoctoproject.org;
	Mon, 26 Mar 2018 14:44:33 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2QLiQOp018266; Mon, 26 Mar 2018 14:44:27 -0700
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1f0Zuk-00012e-SE; Mon, 26 Mar 2018 14:44:26 -0700
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Mar 2018 14:44:23 -0700
Message-ID: <1522100663-5563-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(39380400002)(346002)(396003)(2980300002)(438002)(189003)(199004)(59450400001)(186003)(5660300001)(426003)(4326008)(36386004)(47776003)(2351001)(305945005)(6666003)(476003)(486005)(486005)(406003)(2616005)(81166006)(8676002)(316002)(356003)(50226002)(6916009)(81156014)(36756003)(6346003)(77096007)(336012)(26005)(2906002)(478600001)(8746002)(72206003)(8936002)(5890100001)(9786002)(7696005)(51416003)(106466001)(63266004)(50466002)(48376002)(106002)(107886003)(54906003)(81973001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2258; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT016;
	1:A7fh8/Obst+r1nJ7/Vu5vdv7lkR5Q36EC38cHQoDU6UB+BWyIrQXrQ3QPBCxdH2n65sfL8p9LjX8H7zhPMGoKTluMOh5UEYYaivxdrxcLYmmAlXL05C0xrp7luXOdBRi
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8ad8551-4b3a-4591-fc4f-08d59362c691
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BN6PR02MB2258; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2258;
	3:h91hjpRtFRU6N87+p2EzGdpboC/ElL9es3U2gpRthRxcqft3HOZJ0VW1pSuWMY0i0hFY20FCGmII7fyHosrtlIYPaxZzCLr82nbAAD9pplueGWVmDGT3Gh32OU/BrT4b9xf4fX6skll082teadeH7ba95++f66sbSlTvondyuvZJvD+Ko1DUxbAdYZADso579g5Z3cJ0ZYkAtvT8yFlJaMFTMiCzDcb2cqAgqnFDDdCpvsf6Wrk3Gr27O5H06EBvZ2AKmDjRLymXb1TxBhNGP1hEv0rW/XhGQ+aJgCaTu+rzVATeosCszIpqOLuniYuaOfL23xLR34KoDMmhTCUg61fxofo00wUrHl0xhEcccR8=;
	25:q78HQFSV2pr5PuCGa9Y23t0EYaJtAhFrkZ0B8bKw7gkGEEhza4mc5eRWse7bxCqzgbVKwc6AxgzOkdJ7G+5B/vGLzzMj+HJbMKn9ahQyuvQspD96Fv/Z/WEnKVB6ygCBUOdVCtHTD21F3pmJEA05DmgTaStiIm2g0OyG/ew2OVgz4iAlrzoaqzHmjfudLw1j4ekOl07/uzZEiuB99rZ7cUQYVEneYz6re6kka0VHBt4n3hW+vGQinF26hB2NqmRCCz24TtaV/kTIiFcxhdZlZMO1s4iG43iACRYxqsVo5QJXZscz7so6gwu4FclYaApPcdMTaVoW1yBnYMrv0M/0ZA==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2258:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2258;
	31:jIcBNeWCmAoDyoR+7vY19eHPVpacHUfnkLPcjDC1e+RTaE1iYTqRkq+H+dwMO3/cbHqNDkKivRS2WMUXfSjoWcRvJZOOvWwMU7k7Ga4pX0P/Mg+/jyXY3PBXZ/QpyKxYC9Ib62OPDy7yNJkkP8gkfcu1T96OS+zLZ+KNbTaX6NzW5cjVJQFzFMCUrjjvP95XQ/pObP1LaG3hdL4jAyf+q2W+qYzlZ4zMFwHVR77VfUg=;
	20:onl87EeQfAD/lLOOfzYqkIVylrcQMsYv+y7Jn9DTuVUsnMmEfUlxp6epOnDI8/aC9pkAMFYs70LB/ksJFqgM6Qg4XVMzlecK4d+ua1157CwG7ENt5mD4gs8/h5RGEyPywNNSHG1A8hvqISjlW3B/edW7WL+u5rHu/pBFMTKkJQKUJFOYJuc1DV+FnLohHQmVoiArqTbW94DE+VUbt7sX6vHoDj6zMNTQoLJXead5LDOzauaIA03XUgs1uhJ4QAx3fPDpySh30jEwl9yA2IHN9sqZhjRIrRdom+nZuSOoxwpXsxufKxwPkFYzuwuosoA0ZZQ2zs94NuvEzR7K0Cs3GCSNsJW7Z9oREPacB+VJ6h1eZRhfuewcm9QSYujSWdQExO/MPr7ta1szLwYM2H6LhMQdOj48pypbekK1q9R0LHVXneGDdwJiKEQsZfcK/RG9rz+p+lhT4wxo2xofYg+dPJKvrZRmpXVc1uQq6U5b5yfGC/lEP4I3szAMO0EM4kH+
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB2258BC06392C068246DF3CE6B0AD0@BN6PR02MB2258.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:BN6PR02MB2258; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB2258; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2258;
	4:tutYtsVimaFko93YJFf9Ps6yTSxV7p7zdfls+YWrQAb37B6pxgWWQdu+TaMU6DRHELv7M4JGYcT3rhmyyW6QeK3lkDwHL0kBYJaKpA2y5GUeF7qnIR9htGMDg1yPtkGVk6SGzJFRwI+EAhe5WO1LNXKmn0wt8Hj1QZKDKVrhZWMGDzY9frRUhZY02zjKbifCtonzF6H/xCeLyJ8FCBX+nC9PHyJqH+13KdPAFoIgQTA0tyH+x0yaaNLmj/iM87RB4z/5hMkI7UZpUXhQvCj83qINt0xx2pdhsB/rRwK2SDAG6pU16JcPTrqgSurccmfizahoS7V0qK/5cbOcw4KxwOXfI9ZS20VUTxj1OCx4Kls=
X-Forefront-PRVS: 06237E4555
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2258;
	23:VKjhTAkfHRJV1BkP87KAoJT303RB1o6ldvkX0p2S6?=
	=?us-ascii?Q?uGbZaDVSVifkh0dzuTXtgByvnP24DD19HKyNc2xlPVvOyprmDzGTDW/Wb71g?=
	=?us-ascii?Q?0f2F+18Kyp1geZp490jpSWLTeK09+8+dQGHev2rC3Ly9q/ZVKQD6iYZzMxDy?=
	=?us-ascii?Q?sQpkI9RdkKt191T3D85I7GKEbYlKZvOxsR9CMIrvWvFJaG1gP/l9cAMqTpus?=
	=?us-ascii?Q?ziIgypZanlCu3PY6rdl9MD/V51ZOAy0cJiXTSLkkbeK1i7tiPl8JoCxIwEUo?=
	=?us-ascii?Q?5pdfNljCeShaDvlFH5yaTlzQD6ohEsz6Y0NfmomWhVr6IDl0aRaLZFhKMZ52?=
	=?us-ascii?Q?dqyj5Z4R94MYJ5wjULGZ1/jfAQj0yjuxjjW/frAU62NkjlkcigocMIJvR05A?=
	=?us-ascii?Q?1+60P9PGeCh1/s27MZMuBVPxwZJVAnutNrrj4TxZcX6O291Hla0oodPVq01Q?=
	=?us-ascii?Q?Fe5rKvQeDDM9fIbkpu4gCir1AvnwdQ+DBT5XjUVaK4VJAJv06GNolhaVFlgI?=
	=?us-ascii?Q?NCg4+LiPnhQp0CDXNxZgx9Us0mS+ItasRufNFfjvFRo9MC+FJ/8HjOKSuxHn?=
	=?us-ascii?Q?ax0pZFusLMIVe0TTAvjeVKkGN49Ubg3Zrjdd1qi5e68B5w6ON4pibbsrFBGQ?=
	=?us-ascii?Q?e+eb5LoorTGYBs6q9HkqaNyNIkgOGpUTMMI48ECa1pUCPRtS4gkPfytSpOPf?=
	=?us-ascii?Q?fWL4dl+uIDmv1khbECoH4YHZIKs7JKAcnig9uUoHHLfirIECE4/dO2l2GaDc?=
	=?us-ascii?Q?x04z056A/mXwWo1tqAIl7PAHPOZTATTg6GHJOmwIi4XA50SK80Xn9DkE+DVo?=
	=?us-ascii?Q?Tq00x8Lms64PHb9Qzyw4coIHePCC+sr3JpnhRVWGcwc5J27tHvGe3QEuS26s?=
	=?us-ascii?Q?4hwQ1s+9GFgsrr0EVLs5gOTGBJOAZpMikwglg/CEVfR5RN5PN7KIdqpNCs0N?=
	=?us-ascii?Q?ORrgRG7s3QMkXnbItW8kok3HD2jO4HJO315mFmj3IjLb68keJflu52GIaXt1?=
	=?us-ascii?Q?GgBUZc9JN+LVMfjgXvAzbZgDVBQVnjfHSBKNVmiVkOBDjJA0WD1ywSLi6tUO?=
	=?us-ascii?Q?AazmSxQtj88iUVshEdyD5CbDpV2PxHUq6bLTG5wa5jenqVB7/aSUl6z3nKOM?=
	=?us-ascii?Q?pelY6r61/xEK4k8qg1EniDgXAyc9ENaqrUU9bixllMwigc70M48gwbHCUhYv?=
	=?us-ascii?Q?I8wCzidqy5M935fzI/MJ/VJeu2IpAOoZW9XoyrsMNXOswVel/vzl6voJfrqh?=
	=?us-ascii?Q?3Sqt37B3Vs6Z0+4Puk=3D?=
X-Microsoft-Antispam-Message-Info: Hfz4dPcnZU80poUi25EUW2e3hs4JY2L0MsgSFELgWBUJTXX6RCtqq+3q0LWaXey3iawBmJjp63hOHDRsiZHeJ5Tk5eQn5xfrOOKx8rvAWgtnoY5Rc6u7vi6axgwJac6eZSFOfnISD4LDZPR2FFnQBf1kB18lweeMUYRV9nsYGLIrans6vXAIXcjeli2NH9q6
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2258;
	6:R1ICY6JsGeAQeCBJIP28xLV5aOh/JPvVuZfnNcAYr2MqkpjGEsuteZzqCaLFitdqiIPgmaT7gmGvYM+P2r7EWJaCkazQRMmzqjFFw+g+SiCV4s1hYO21IEuDqoSbo/Bhsx0+YlUIsQasRcCgtGVQZSNI4futF3QM7+2D4PpnfqagklSyot0E54sj1YeYEhSH9PVyl9jwTe1V7ti7NPfRJgCiOYvEBBcVNznUJHROzmkQ/h6dDecWOOuxroLAxmxbl8FXlpL7lx8jxO70pJDY0aZGWEms81WIUIi5jet8OYzDI5gnffxf52UVddlemCZxEzoEyQcRt3OpNXu6yYlW1rT5WqKb517niJbDNqZVEuz2qgFYsf18fTD2EtSH/3WgUq4hTpTJxcYhfizqC3bedkCt5pq89sAM6DcsNOQYgv3DAsH+TmrQ8EFlDRvxfQZ6edu4OMRRJPQNi3rQUJOFsg==;
	5:P13ELadra2WTc27ip6Ik3yZIGCYf5tBbh+0XYZeKbeXIZCwHY1xvyY5qHJ4sm4DTD5oF/BrHXLV46QOhn2Ji6x/M75iYbHrmlFlDS2KCaikOOGbfx+edBBvH14A8qPHhyWBGVLcxfyIHSRyPQmVJrmc60MO/DSoYtV9djdwp+EY=;
	24:g3IT4RtsFPhRwsi9Hcg5CCJpUP8FUoOw0P0EO2W/BHjPkrKFik4YRFFM6CKoVDMDlWhhvGAoI01qjyst4+WN8zC0gb2/4zj5GkSroI7vWxU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2258;
	7:hLtMCk78rprdxLFXKst9YnV651gywuHiQJwIHdbffrp+phAkA+DE3YVfTNOET99DJTp9n3p6Xe3dcYd3U/pRV7LYzmv+HcJVa688x3Fq29HD47Ub6LpSnYxN1Ts3COg7i3mjN5/koKfjFCDYT7JRTMYpHCexNUumggsRFW8XAKAz43aPbVK8K1bkXTU9xp6WvN4jRhmiJnBTijqks+Qt+5eeNSgVe06rP/YoLHUwHql594sdD5Rhz4B3VLkHBNh8
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2018 21:44:38.9077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ad8551-4b3a-4591-fc4f-08d59362c691
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2258
Cc: Cyril Chemparathy <cyril.chemparathy@xilinx.com>,
	Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>,
	Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [meta-virtualization~][PATCH] inittab: fix hypervisor console
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
X-List-Received-Date: Mon, 26 Mar 2018 23:17:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Cyril Chemparathy <cyril.chemparathy@xilinx.com>

This commit switches over to using existing SERIAL_CONSOLES mechanism
for hvc0 inittab entry generation.  This then results in
/bin/start_getty wrapper being used, which avoids the getty failure seen
when running a xen capable rootfs natively on linux.

Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
---
 conf/distro/include/virt_console.inc                | 1 +
 conf/layer.conf                                     | 3 +++
 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 6 ------
 3 files changed, 4 insertions(+), 6 deletions(-)
 create mode 100644 conf/distro/include/virt_console.inc
 delete mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend

diff --git a/conf/distro/include/virt_console.inc b/conf/distro/include/vir=
t_console.inc
new file mode 100644
index 0000000..4d56806
--- /dev/null
+++ b/conf/distro/include/virt_console.inc
@@ -0,0 +1 @@
+SERIAL_CONSOLES_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen',=
 ' 115200;hvc0', '', d)}"
diff --git a/conf/layer.conf b/conf/layer.conf
index f71c117..461c73a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -20,6 +20,9 @@ LAYERDEPENDS_virtualization-layer =3D "core networking-la=
yer"
 # Override security flags
 require conf/distro/include/virt_security_flags.inc

+# Add hypervisor console
+require conf/distro/include/virt_console.inc
+
 PREFERRED_PROVIDER_virtual/runc ?=3D "runc-docker"
 PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-docker"

diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-=
core/sysvinit/sysvinit-inittab_2.%.bbappend
deleted file mode 100644
index 1b89aec..0000000
--- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-do_install_append() {
-       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
-               echo "" >> ${D}${sysconfdir}/inittab
-               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sy=
sconfdir}/inittab
-       fi
-}
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

