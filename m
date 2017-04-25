Return-Path: <chunrong.guo@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B774E00AE4; Tue, 25 Apr 2017 03:33:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.37.121 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 3554 seconds by postgrey-1.32 at yocto-www;
	Tue, 25 Apr 2017 03:33:23 PDT
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0121.outbound.protection.outlook.com
	[104.47.37.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E3B9E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z9g8R9hloLVg6hMRLepR7YIAmu+R26rxO6Ey1SgRPBo=;
	b=WEs6d3f7LnzUQaoDlFHRNg1HPzBLc7WF1Bzqra38QnkxrJoOX/xv6Lr8FAeLUVwrVxOCTs0alNXsWAjk7WerMNMpRcUxPE49Qis6WyxTcooXjzZlGDZHhE9WxmIC/0GXZr0wH8QkqP24b/O+N+/oXO5CtfX6bIWfw9Yv7zncP04=
Received: from CY4PR03CA0019.namprd03.prod.outlook.com (10.168.162.29) by
	CY4PR03MB3175.namprd03.prod.outlook.com (10.171.244.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Tue, 25 Apr 2017 08:00:11 +0000
Received: from BY2FFO11FD038.protection.gbl (2a01:111:f400:7c0c::137) by
	CY4PR03CA0019.outlook.office365.com (2603:10b6:903:33::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1047.13 via
	Frontend Transport; Tue, 25 Apr 2017 08:00:12 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD038.mail.protection.outlook.com (10.1.14.223) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1047.9
	via Frontend Transport; Tue, 25 Apr 2017 08:00:11 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v3P806bq025568; Tue, 25 Apr 2017 01:00:09 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 25 Apr 2017 16:00:00 +0800
Message-ID: <1493107201-29291-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1493107201-29291-1-git-send-email-B40290@freescale.com>
References: <1493107201-29291-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39860400002)(39400400002)(39840400002)(39410400002)(39450400003)(2980300002)(189002)(199003)(9170700003)(81166006)(54906002)(4326008)(105586002)(76176999)(8676002)(6916009)(50986999)(5003940100001)(6666003)(106466001)(8656002)(42882006)(5660300001)(50226002)(2950100002)(47776003)(2351001)(8936002)(38730400002)(2906002)(110136004)(50466002)(48376002)(77096006)(356003)(189998001)(305945005)(36756003)(53936002)(104016004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR03MB3175;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD038;
	1:VW/krgGfkW7wdf8lPGACt9pU4ie1lyXXw/qqh6FeIa8Cv5n98mxRIwatUMxbTiqOGO1eg78y/l4jBo+2TuAVRC7k3AVkt0LZRQao5y1dCVGIeXl+igCTfTbGbCdU+lQzQemRBZxPEV2dTi19oVxWO9tzjcuM+0P+mGPCzgqDCVIG5VioC+dT5wYpt1W0ioeA3zmGEODeQg1GmQnvIxDDhZrqoIUYC1prR2qxpH0RLnJeSxMfCs0SYYh7Q0RHoRtzbP4xh/Lvocm3AxDg0tNV9/s6PkslTIYFIDRH2Vr2j5F0+6D5tHjd085PMMcngN7s0jB6rbpYeuN+MF+z8Akzu0reCbMHwHJaV02SlPQPFxR0mWAe0drjwyiCyiUeRNKkQHd2eDt8/4vZhNSBHWs1MWw0GXSzu4cHh/V0LPn0Bi9lkJlFDDA372yeoH/uH8dcxzMcoDEa2fx1uXcm/rTkn38tFHUW0VOU1T3G3ir4+xpKCizvZC7cgEEkQKQ6ZGHDwsVNfNc8cCjXmPxcEf51/VW9jifdbkLpU9SHEuY2tzo4C7IhoAIww2mfIQARzxt0xzl1TOi6j2CIHi84Nn37Zg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08360a88-db1b-4146-328d-08d48bb1194e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:CY4PR03MB3175; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3175;
	3:i5n+TuqmQ62dzxE4DPbBfoS7elvOmZQi8HsJjYALlnVIM3I+i1ndcGHEbtTnlaW57Z4bbhMPtUrvJaWc9VpaALf2qgQBHUCU6CYmCgqxhiOQHeYq10lUOqEB18ERfM0at8BGIIaa8AFVPJm2ycNMvNkBmjoTdysiVeTED+uIkPYjcOGc7yofHzXMYnzPglFjbE4qGhJlcP7n2M3lfbUQulPudwmoW8sOXNNzIwE+uTpQjJQIawT6w+9h7StRo+//gPxRkt1/YDPml1EeFbcb8chpwMZ9so2cCae4z52GS3NmrZTgmDYQMHTLRHzE09Q6AnqpKxMHzvkGLHp+/XoNQMe5cIm3jUISfdMnyUXnoXrf7zlydJYYyEq0Zm7jWFEvq6GUcDsgMlzPKGYvBQeumhBb9vpRscBsZKp+ZkabwfM+X1JSV8H7Uoe4Q/bDd42XX17dnBpLVPW3cqRvB+xDzQ==;
	25:dwyFgYbCHSkXXTJRx083DKwwiI7DxwGFzqISuBhEh5UozqpZ0bhf+K2+U4JMMO6JvIrvUQOGkCgZXkfk2rGpHFe9El+h3tZhqMuS1q3cSv4yGUvQ816vUDN8uUZA7FB/O7H/m9cpV4KeXM2pLQJOku9dFd1Q82qc/WyStt2iK7R563ccw8V/8/EI7/0rWNOvZK/ehwyGwqOQUPihVwvQKTpd+HWaGS3VcT69yJ3DtytsdU17w6L69wZGd9+AkZWxROKjB/FQJPZwhLC5wC5x/S9JpJAsXMOg2l1rShA/6MxLw7+XVCfzsgaUA4e3fpXYr1Oz3GhVR2E+KlUCWYn+YQWQt+SqxkLWLOMqANdg1mVdd+HMgyRjCfo8qOkkMeAN0hP7hLeauP94J9d35soJvuAQU8oHXE0bDJbJ5I149hCc8kETEywCdLHIdY6Ay5OYt4c3joW4SFWlOhdHTaIiAA==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3175;
	31:NpiP4hifaUb5If32sEJHsxSVfbRd+WY/dsTGSMlFchnuM0B91a7V2LnT/qAV1NveMbUQ7R82q22WUNXpdkOI9FPh4QWCWIFpsA0GbGqHE7Ui6VamL+beWp8MoZv3noZen/qfHTNqv+wKdQfay1xDAvKEJ5sQ7gnh71lCZ2LM5dCj03YCtXuU2Blw/OKkQA4x0zFbRG2PjGB/T4zWXNqwJshWu4HC38Uer0wbcTDWRF9ITUu/2/rX7owacP4XpDp2eTFBbLgAo5BZs4JZd/TFAw==;
	20:0Dyv0qXSZSroibM4WCKwbJFe7nDrl9PyrajlHto8QgsVJpUEeFhwUctoLgYcHK1+RB7kNz/CKkyfOZIk6p/3ocVkUmkf+jxA/Q3vLBOtgOR0+dYTc6bDVwqnmsuVczM7i3SUc0PGgCDIi2azR8pYM3yy3/nd5HZCRmnJVCNcRQdqyqhImY+s0n6+rKoY+O+hoFE4YmXUvs5kkzn7mrAr63O96vNHLbPgn+mn86QJCKVfBiy9fd5U0MPEqkv6Po2u/7wXQrlfLFekDlUt/sMdOhKJzFNhLeO0eRFLJpHacc3/n0QGrggueYZ1hMqirxpa0xNuv9tLF9y5lPbRAE5/xKH0LsSCPZWWWfDFanBcnrjeKQXnRRfH2RbyGTUoIZkfN66ZzDmuVa+OzE/bz1hI3QNYTtsBVtfT0v8kXBHZvfcLZGdZ0roYl3RWwyPdVZRRN2070muYyKi806ktxAj6/DciSJOmrtn/mnxHwvO8mIFirV2CCEll29TEBeN4NK2KF1tVCjDvzYCSZG6je7E44TrflsQuqd2gH2RpgAjBNnIuqHrCJoj8S1yRSQVvxgfeJLOMa+WvmaweJNFuU/K6LWDPNIk7xfuQUgUdd08Pf0A=
X-Microsoft-Antispam-PRVS: <CY4PR03MB3175A7378FE1034A149D4034841E0@CY4PR03MB3175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13018025)(13017025)(13024025)(13023025)(8121501046)(13015025)(5005006)(3002001)(10201501046)(93006095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6072148);
	SRVR:CY4PR03MB3175; BCL:0; PCL:0; RULEID:; SRVR:CY4PR03MB3175; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3175;
	4:7cvZyWGcw29aobdjKKxpuvTyTT7kODNCthJ/gQe2WO54miRrE9cWxQaElbGmx6OflVfF/fI/kZJe7sDxSjC66kXQfZOMq1GGFc7pEB2rNtniHAWZEM641osvZBXwBK9Wzrpe9IaJWOFERk2e5leWejHYSAZpwCW9V5atRx8NNuB6iog/W3Dipbdl2PCtRxxp1884TF9p1RS5h9zJ1MnaL/4chZ5GQebliED6+NaVyIO2PY+D9m69od1C8tDxfSXs3RepH647/kyk4xEdpS0bkq5WkuBQ0rjPNRnS6/1yxNaESh4nA4Z99XBsF9dXcDWjVEywbckSrbrVhcRJG9z5oYBfGcs9cZ1QOfICg3QdW+NVXvYSEgJaAMvseXFeXBj5YKu6RuUzg/f5SySCjETRinNQf4eBPyHvvtwe1X0Itw5Vbio6vbWumey7lvsPw3J+R5yks+aaty4l+2k99nwgJyrT2Hm4XRrr1f6p0H/4eueRObLHY15nUOFma3p5ruZTe1eQ1nSMt7pfvqoaNsAsufCnuM4etNx1oMiG2CTczQNQu4XdcZRwvtjspKcaZSTQFqSOskV8URCIrcjEN9UJsYaQwtGUVZzi2S1uO5SeQGmx/tBCh5ryztCis6rF71uDJPkDKGsnNl3E+yuwhGfnVoHQh+wqJBhoj9nkfOLCvPfi/woF/7qpR4b87aw0A48eTxadVOKYWSYCJdrd/tOXOt40Q3YAByzd2gVTusfcaGLWQ1nmAYL33Ao0fM9aLNI6WicXychFoMH6rAK1sFlojpVX1wsFzXNgnFsnvvY2J3KbYn/F6iqeRNHThnyBPHnK2i60qXSBRP8qzXgdRoHEg4vbj5CNrfkitOtDuG5i1ow=
X-Forefront-PRVS: 0288CD37D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB3175;
	23:/AmsBUE4DIrRM3Iv7ZMIZpEwZWzO8h3UMPu59tIAy?=
	=?us-ascii?Q?6nYNNPx4EUgqNddaVpbSRhLNSJWPusgk24cdHgt74dPtt3sGVH09l9YAsKSB?=
	=?us-ascii?Q?muW5XyhFIUXZyQbLonvVwlCL+mcXw2CroS9D1mbuBPvMbYLPeSAt8p6c8wTJ?=
	=?us-ascii?Q?Vl4mu2OhXvN0+WMlknHWUKFLM6z7I/V+z64DeJyJefoHlMUTCrCXutdUHKyp?=
	=?us-ascii?Q?IVRCn9nNvfEILaJjmVZWTBoBE21UJZCCsdAZHdiJG782y/bBPL6ORGAkPSrq?=
	=?us-ascii?Q?qIMyc9NXOER5BTe8yY+ZnbY86l9cKPcVCxaPCW56o2FnxCHzlFaHIqEA64dO?=
	=?us-ascii?Q?F6ZdBylux1AdCefMDm5SLx0+49wCI4Od+23I6t/IhloVbkLiM6IuyT2HQm6O?=
	=?us-ascii?Q?XBdUMUC7Pc8edSPmC++OgF5Svw4It+AGC1f1/fzGEeqbgLro0/9A1sQjWlqc?=
	=?us-ascii?Q?3p9PXxYAkTd9/63kazUjsIg7ebPmzV8PWf3h2wh3Q0o9BOLJpJGJy8tGTFei?=
	=?us-ascii?Q?pRYtV4+ycOg3MqPE1kxljiCwrlqaHtg6LI1hc2cRcaDXnOMPFvbVN4tLoM5v?=
	=?us-ascii?Q?MrNPOf+I8ICR8CwEnfVsym8T3qHhHhQ5DzHblzMduyEvCqlXvlZDlvfaKayo?=
	=?us-ascii?Q?f6zJi4G4L37w+6FTtNinqzxthQfzbz5hL9GYu0Y4iRlR+jjE/1WNY499TBrC?=
	=?us-ascii?Q?HajZttD1nopct0A2rWQxrD5C4o+QZcOd3dAaaF3FiOZtX+Wkq3Rs4R757h0X?=
	=?us-ascii?Q?h/kjwEASFgspTIRPIMgRpr27qAmgY2xO0G/SqcrBuUmE8yPuywFKDtHBiLTx?=
	=?us-ascii?Q?3gJC8+vhT5QNdp9FqIPYgB1QMwzyZK+SPYv2xKmXZCwXI7tcLsONWiI06t1F?=
	=?us-ascii?Q?kwIlzuTlU2bpanrDX/NlP9nglYTM9FE5UbHTKs0W7hBHu8U4fqqpk3mg9E5v?=
	=?us-ascii?Q?+64YaWMY57p5+oKujQFa3VsHeTStkJa1SoXef546xhRCCwzkdF6ior4eMs9C?=
	=?us-ascii?Q?KV7aKVMH2KcYkmWk2ShLX1gLD+SZChsd5HNV7pgMQ43QniY+Kj/kDe8w2kyc?=
	=?us-ascii?Q?3Bhk6EMmumhdQZrJoBXk8heSYzI?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3175;
	6:fSPyFW4DdTTFbJRyymoYQAUDiK20nyR73wQA9ofOpZf7peOkT8ml/tfROwYvtGjjL1oSiZedQxwBljeOG0FSO9x7TlNhdLNCqDBd0N3AywbYKA2O5KW0cPrZ9zRWhLaEylm5ruyGC/hHvYLXwlMr/Rue6nx2O3BGvdmBOyUfBm+ImCBwYK+BLY7AxHw+JjPvHEu3tX8vvy8XugVaXI1kzPTTEx3n4G595MyiEpRBL4Hp2wr5WFooMi/pZ6gOUYCtY6Dzr+AWWK+4xuxL1IlDv+i5sEknN+Au62/vLFUcRRSfznP+7Lq1S+kIDzD11X4LNqs60LVhdHs69FKN6q9r62wjyhpTrNGs4ga48vW3Xv7v2vdQcq/2imSKagKS/Os9oEyjEocf0yX7nQOPvOoRiO8nyR+39CGQf65C54BWq6st6lFQHwmEJX506Vx9wCqzbMeIBzwNIT/JbkikufnaLLk4Eoj7x6L4ASz6f6SepNr0Qbq3F3ujGu3GyYQiOhF4tmhPtynWVeVncWOo0eJia519yGa+vfJG80ThnEn8qbI=;
	5:OAiT4p65d/MW4/c5CX2CJgYVrQcrMoI29HlXD3FDFfXDSg9cvHe9Vflty9bY9vLLhs/Koo2l10hR5gKfTX3JPJu6D0ex/5UQQRIqbXMIVfhoAaChka70sEDWZUru8gVqXpePBMWxPNm0gVgP087jpA==;
	24:8mx88qn5YwEHFDEYQLWhtmYFz3+RvxHb/Z5BeLp0x4fjI4JNTy9s9JoQyu/Y2RZ1PVl0BWGC51AjWZGytrqzAMoSVzESFX/P+CRlXJjZ+oQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3175;
	7:QsKi3IhBHw4ELIkRBXFcRjRobjXfiaI6EG2o9I/ONxXye3cc3fvC2EDS0YcY24oktJg7pAItg71Qp29MCObB3iTDEI4tHpBr2bSJOk6rN5OS7295szfRUr2Iza4Ftd0TFyON7MxMWDMHu7iEFpdWqtrZjIxSkY8rPTlKSsgx4I9NdsTn372wyXYAC2VrnDNhwQ9Cs4pIpTFyoHeDk+q8YrkCUhs2rM8ucdTYTUA2H0LLnYW8jP6M4nSLkOsRKXYnYIMoR5Gfv4pzx2BSLgIC0K7prW8JSsysvm2beZL3j3AwPeIZg9WrhwKVP3lHKA3nqs1Y5l1qh0CbeI3b/DvyaQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2017 08:00:11.4237 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3175
Cc: chunrong.guo@nxp.com
Subject: [PATCH 2/3] packagegroup-lxc: initial add
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
X-List-Received-Date: Tue, 25 Apr 2017 10:33:26 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

---
 recipes-containers/packagegroups/packagegroup-lxc.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-containers/packagegroups/packagegroup-lxc.bb

diff --git a/recipes-containers/packagegroups/packagegroup-lxc.bb b/recipes-containers/packagegroups/packagegroup-lxc.bb
new file mode 100644
index 0000000..25954ca
--- /dev/null
+++ b/recipes-containers/packagegroups/packagegroup-lxc.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Install lxc tools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} = "docker \
+    docker-registry  \
+" 
-- 
1.9.0


