Return-Path: <chunrong.guo@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A1D4E00AE6; Tue, 25 Apr 2017 01:15:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.33.107 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 921 seconds by postgrey-1.32 at yocto-www;
	Tue, 25 Apr 2017 01:15:36 PDT
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0107.outbound.protection.outlook.com [104.47.33.107])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C966AE00A9B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 01:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Q2Iu5CSu8u1QxdPE1lc4UB3cQ6fWL3vNlZNCosQyTCw=;
	b=hWOnnyRKY0sib+BehWL9kgtfRCIJJMdhxpeUGlXbnQARYnUWUCS8EHB+QeS7jGick0CAmjy2IT4+MxTEav5wZenmCSfQOTgJs2kqc8F6l9a+4mnjDhJL8QPpH3gYqyDC14Xt6jnBB2+AIgcrHHwtgtZlz4u9BOTGrC5xJOjxbFo=
Received: from BY2PR03CA048.namprd03.prod.outlook.com (10.141.249.21) by
	BN3PR03MB1447.namprd03.prod.outlook.com (10.163.34.30) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Tue, 25 Apr 2017 08:00:13 +0000
Received: from BN1AFFO11FD036.protection.gbl (2a01:111:f400:7c10::194) by
	BY2PR03CA048.outlook.office365.com (2a01:111:e400:2c5d::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1061.12 via
	Frontend Transport; Tue, 25 Apr 2017 08:00:13 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD036.mail.protection.outlook.com (10.58.52.240) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1047.9
	via Frontend Transport; Tue, 25 Apr 2017 08:00:13 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v3P806br025568; Tue, 25 Apr 2017 01:00:11 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 25 Apr 2017 16:00:01 +0800
Message-ID: <1493107201-29291-3-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1493107201-29291-1-git-send-email-B40290@freescale.com>
References: <1493107201-29291-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(39860400002)(39850400002)(39450400003)(39400400002)(39410400002)(39840400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(38730400002)(50466002)(48376002)(36756003)(110136004)(189998001)(8936002)(2906002)(85426001)(4326008)(305945005)(77096006)(54906002)(105606002)(106466001)(2351001)(104016004)(53936002)(50986999)(76176999)(2950100002)(47776003)(8656002)(42882006)(81166006)(6666003)(50226002)(8676002)(6916009)(5660300001)(5003940100001)(356003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1447;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD036;
	1:Dv4/FygHRs07MzqUDd7giGue4b+bPj3ha8biNuYf+HHiMYA4/YcS2jQFL3b/EzNckNy7lo/Km17fNgd6mquW+Q0kYkbMaeAxxUDWDXEJo5thikAGOkO1gra3ojtZoH68NncmdchR+2zD4ykaAuFzUfllhegMvwtuMjA2U78xJhY6Wij+2NX61COeE6CbDd8/nePooCrL5oU3sbHqyCBwWymBmwRHVruEksH7MqNjcSWzQaabm3/cmG20+SqD73aBDr34//CI2/QVAsJ0b2ZujSo/yzwm1ebrUgutsCNW6f9JAM1y1LWpD5OnGX6QHuIRqcuxW19GjYeie9i6UmctBdEdipYfPEm78eHAnMxVonq1WeQrTsFEVKe4uDxMvZjZgnw+tbBQ74AveRQRwOL/99fLuS1/mC+ZN2d6rLlDQIGSJerKl+IPoOxk9V9HcKOkWNNVUhCbdgMqumvQf/tcJN+hzf6Mza0KLyLYlhScOV1LtrNnCLpIqaIcT3VKs+BbCJv+Wev8/KFYG7b8AReo5iJ1Sx9uYgpi6qwBf2Ej26HtjU0PcB8Xi4e0DQwygEOJX1r+JtV6YqkFQq7g9VplOQ==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9757ffb-4d73-4dff-f8d7-08d48bb11a61
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BN3PR03MB1447; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1447;
	3:/Ujub8sVNHIy2629dTA79lvGyhnSn8NgvXP12P1DFe6FfLW2lVLqacMqFhLZudtGP0n7XToVg3ZUDs3IbojbtJ5xB1NmqJOO/xBo2TPxzDMxeELV1wMOIlADaD2BIOYm1tvBoLgTVIZXRDz12NuvlqYlpi4QPS2JByks2iNjm9tCTwV9ukLzqAdBQDOgN+ndLnrlupoWfUogcF0odtVNOORAekAYmnYJyuckEd5HbCXYhayUd7mgZ0YSGnbNLrIaU45/gqeng7ZIV6il0hKa+u/i+Mgkel/tPSBbOePUt2X3/4wjBNGh8l+ucxPm1KBkAddGogKiV9cP5QOqbusqqovjl34QZlULVXzmC3JyUOkYpRw1ic8WjhFGPmktGrXbCAMvi//W5WFKuRHbQvKGISEbRRj3OH2yr4G8Zvq/zkiHg8hJAdzTWytVaMkPnscLUo06zmrRLAH95fLdnl2sI95ij6Zv5svb4QleeHJmlxFEK9VFMl8f/en495A8nxuB
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1447;
	25:oCJSBs2N1VFEuwRIxuaPfn0o1MvkmOVBxaD/uQMDRIfuaXeF3wLsKwF4xkl6Jpog55oPPOjgbSE23S8KzQeoYoiXZYYhibaoQ8mHj4yNzZzaS9Rw9ba7TiC6ZIAUOPtc3dsLDf1Z+jVtkDvC5UGlVeBXaQtHYJ5V1x6QbXJ7QT2rfaO9Q1786yyw/XeesIGaLm0vKl/jd+HWkT9g4/lsVkt7bKHyj7Pk5trsBe9+4DFkJYJCP7yZevey01jpy5LGBac3hmxlZ85n8iH4aXzBKPV1Vm4QYNq/+puxn/EQf6GOlLDQEbeY8snyuNtAufwQpZ0gL8YzDnTqqOH0sL93j/MXAyjxaopkiwiFZNblQ6LFG+L08wesQznqfu814VZGw4an2qngvkjN0JQCWzYtaz8mzh6ofRQeB8TBx6mSa0TfSSb8ub88zuOlH1b/CUtYLUifZHVw0hSLhqXC6CjIhw==;
	31:7YzdKkwwNuVgeDVlxQohUuKniMYSyBK4JEzX7TylOyynepWKQsmuewth7AeaLgmSWHZlzjRTzuMdTN4yBa4iLeNpOqrK0vD5QdA/pos1zn4iyJDPP8r5gl4jDSn5E4YfGTSijAZMkzD6QBwMOI3QEifMvy4Ooa+tT3jE/TAcClBjtxSeOW9GoFvIXKtoN0y8szM/z2sInTq9otJ9iZxa1YOA7pFj4iQ85l52XYB0+eDZ6mWWvob3tCfQWk1GDoQBxamom3ZVk5IXEygfxM8+Vg==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1447;
	20:WjBHQASbWrxe5DmdRof0QJmDykHe7WqSW7zb3/VyJOnqx7ieWNGpK3yeNqj7rxsuZODcoGzFbTQAPX3szuiL0sIMRHFF8MswCLnwfm2i5Gmexdi49EcP6/NQxECJGcf6aZjmJkh8+K/9UqRNaW4JusfTG7LxD9NV471vwic0JKFnVDrndGyyy1lcBpp1R1k7fiF1Mv70zFvG7Eif00rhqx2/NCZC8xaDpHmf4gtwpJf73qecpYHtMD5LRv0teflGVsmjI4twjrNJQaJ7Dq7HZcMa85IXCLh0qTxDW2fPC7BY1kDG/2IKll8u15iR5/50tIYWkFeDAP1NDh/QJMa6BxNwLKJlFF6kV84LhHNfDOCn9S5cEMQnNx/8w2a2B4ieJzx+u+nlPCykK+wC6itqqstflEaTf8FKKDPr/0L2wmbWHXunm0P8KW+T3rFlDJbYOfDV/eHOp01daQ4qQ+yFiU3aDK70gM98RHJnTPzFv6wG/gp4/WLONgWKlQTTnt/obAYW6gVqv37tNFAJWz3kBL6BBynw1wrakyi7uC421fsGuuLNnegcSpHr2g8GywsKSknYxZ3RcQ6FpButv6Zr2d225WmddjY8rY1IUGko0ps=
X-Microsoft-Antispam-PRVS: <BN3PR03MB1447B3949523B4A0C19C3DDA841E0@BN3PR03MB1447.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13015025)(5005006)(8121501046)(13017025)(13018025)(13024025)(13023025)(93006095)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(6072148);
	SRVR:BN3PR03MB1447; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1447; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1447;
	4:aHaguVMbBqolEfkU0779bohV23OEEdebxM0Cj2Kzv2w2aPo+9bka06hTyz5b1226gQwz74I8jWdY/QQ+1UqAJwsS/epaT9vLROq5yrMEHCSUFJYWvqHgUhz9eDYsYLZW58Rm8G4usVHfWVeDjvE5xrQ1A81bzhcwor9zItZwJxL83ee4t9HW+ZfYOm5kUyIcxsrrsxEa/OYWdiotf0x9lpIGRTEH1tZPB2InbVDfNfaYq6g7oMxt0IrojG4Koto+fe2aY3vmzMJAHh/3qyCiSSzMOIaLlkmjpm+Gstl8lIjiQAzz13VxeR9SNHkn2nJNqvAnV+5aR41hIYV9tN7CSSSo2xoNtdiI9YSiTw8x5SZ3Iet9Wfo+TcUwy9Uok2kAIMB5Qw5xeeVWjwFKa8zZdTzdxDH5RD6yjpk4K4xtvz+NabH6uFNH4krL2xBJuupwkUMxWXz0oQN7jDeXQaGzHJmwnlTzS2CZhu13E7hDI3D+OjNkdS4GShPp+UmYGBgsTZWgCGuFSlmClUi6JAMQgOiy27H61A1rWPUzyQrhoMOZEgF6XSZZph0qt+1zBzYnQ7C4KibC8hb7oANPgBtPfuD4REZu4ZEuG/vb5pTQlikxzfPgEKR7orRsSKbAGcSuJKoEvN9xiEnKYJym4BuQItmzrYlsKJ0lRG2nbwfmSjJN5ZBzn6ORU/6dQkxj2pa2RtodzVL1ve4ywFq4v5rPdTcXxNBmm7to16OOx6jQrdiOuOxrN3Hz8EXC1csIbJ9B2DNJEghmfIaBUQJ4P6Z2WNiA74QGF2AsPDjTMTICIcJG/pf3mam2QugdPYHag5Lxgnd3AV8326wSBo/xsA4Yr6nwWELf0atpokhc+8WdvtA=
X-Forefront-PRVS: 0288CD37D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1447;
	23:GZ0Jrvhl2ZFCBu0b3/4yFJup1gnp4nBVkmxDj2WR7?=
	=?us-ascii?Q?kJ4PUnWPsi1ZOuJS5hDl8qX+Tw3muCmuGB8hhwwM3iWDzo6DcWAD2V2x0ZnM?=
	=?us-ascii?Q?SyeaRYLyRM82If5f0cdujj5s8fp6xWaG2g/P68XAzmma1BRFwVfa3L4YyAok?=
	=?us-ascii?Q?hjFPCbT22u2VVPqFCegTMQGZkK6m2iCKIvc9Tz1+xJHJ5QVoTliLhuyW3VbT?=
	=?us-ascii?Q?dw8T70NnWmH4GrjCUkVUrQH8xlqBn+TUBiTBA3nYKAZuTQNnw8PcovU6eJvC?=
	=?us-ascii?Q?GbHx6CSY713Cbm9wKifGkQAxbs35oSSpmj5o3anoYFgA7TzsCeJIm9UvxOhX?=
	=?us-ascii?Q?v9GRJwNDUbHPCQaYuDablNfTAV/FJoXzqF0FHjgLjkOjSnpycI23IosK1XwQ?=
	=?us-ascii?Q?Jub/yH/8b5qwzVm8x4IfX8RlpuQOZgJKfKOR3aVAky1mu3r4BjAh5u1gn4Pn?=
	=?us-ascii?Q?tPnsDIhTIfswtrtpwce/RIuOSP+oRVQGrbBjpP5jIJDEwYQyVMpxfZCxYXrw?=
	=?us-ascii?Q?yIq6Yx7NN/HFpUiT4g6NlHeP+oGYqw49usvIGuTuXs4osT2Xy3AJY9nb915N?=
	=?us-ascii?Q?B7Cygi4PK+0XiSR8KxXqf1ls9ILSjXl5psHST5jXe4tDcya4bor7pMkL9Erx?=
	=?us-ascii?Q?XDzwORFHl8em/+mXvit3lZrnaGGNp/cOBQA4CTtrlXusS42VNQXX/ld601pN?=
	=?us-ascii?Q?k5i/gKT9cDfqG5TmS38l+v/JDFqff7YEDmuHYKXTXZZHMQGvsat8KjLzpP/h?=
	=?us-ascii?Q?mwGYHEj7kTgNYSlMh9TQxhTXZxUXhF9kr+EMT0diPkgJoA9dxBWcbk9qbemC?=
	=?us-ascii?Q?XX64IbYp3egygAAKZlfcrOM8uFDApLobWSFslrkeIi3PKnkbwSCUcIy9k3l5?=
	=?us-ascii?Q?WQ10r6M6pYab2SreiaGpG/VecpiS0nJtcY3AlUcyCibqTithtF4lIODagI98?=
	=?us-ascii?Q?EqLS/tG3XZchQkx8Bw0FHkrZRZC1mK9+BSPPuOyEYIdb7tVtwjmXpWHw4Uw7?=
	=?us-ascii?Q?wfTEwaM6948oBsbHGFk84niwARnX4BqnFPF0LNihVTgxQApvuMkAHfZYgY+U?=
	=?us-ascii?Q?kc7NSC6ZMJr/MZVw8vHawFbI6Mj87txSctH7keKIn8zOpiDKcd3gStmggi5S?=
	=?us-ascii?Q?/ehWE0IcCq0EgPRfOs9nXCq7cdnd297YtV97YARI4znu1IlsKIQD69qengbn?=
	=?us-ascii?Q?cesxwaRsdvhtBPjtgGlluYc9CYtv9cvZx7KxgAFFJB8UMVKjOs9vmGrDR/dr?=
	=?us-ascii?Q?gaoRMFSkYFFtQutCTg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1447;
	6:YWS+m2uVm7GmeezpIB/wF6Bg8jNEL9Ask33UxDSwPNpJsyCzLyMazassugAVFje3E92GQmfSaEx9wnB4JdxTlKjjedv6t99JqCZ8IbG+A3MujKcrwlbSPuh6iWglwhQ7qbext3btucCgoZ1VDeOABS9wbuw1UOzgyW+hHx3elwyUYktiT7s/LwNati58jEwjoRQA74VTUd6sVJd4Tbx/inD+um3SMcM11a0vjFtl6cCzGYQCZEt5WuOsVY680H6U5CQKfvrcZx5m4xln/ZiA4gaDPOukKQupPyEtPHBI83dpBXbBsREnKhhDqU5V1WIQCjbl0YWNy68ORcx7YToJua7W1TnUCYAyTn6jKHxPtNtFF6V8EhedXKXgWzHr1RXPmFbnSK4WRp1nVq7Jrtl24s7scIqZyoj8sruXPjPSfxFZishmpAwen3pyXYjIoxYuBWbwtpYX3eWbB6bHspFy+VDwXzH/Mcxe8UNrHeINeTKOiafv2n5bN4v6Y0gUVWY56cg4VeIqLxdwdGquHZJB85V9Z0t3VgOawNGaFPAG/UE=;
	5:vIP6lV1cRE2ptpWFp6271Ij4IqKA9c7PsIT7MvKldI+eXJ4Qk4HmgYMMHldCUfKKIE8ppnpU8kZxeWiAeb2mG4NayxPGHfH1sG/F8Mck92Cq+8JvWEqfqhdCfsupGWH5cM0PaSlpl5Kpqkk1AH7olA==;
	24:HTJXp+CvjHNVK0wHdXx4fIAy+Bj+UUwzGP0Oxh+1AgfeY04wl2Tr++gcrkCWEkEoEu57pfLPOX1kOGOiXG8RZVFqwQ4+iskpOj7CjwIOJxk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1447;
	7:uYElGcHl2Mn3Or5A4uxKTaWARKxIKeIT/DbOCsUvKhTINQYHLNvRUplieUmB5Lt94THPUxLGHB0F+NSpUvF1Z+wyWAeuj7Xr37xEsXTtEorTsf6ZV3ABym5Cw5dWopq8/DagU0sVYC+/5sW+O8mG7eQp62KdoEgGP3nngl44eX0lR5Zza9ETJZjGDGXASaG5Pyd8826zy6gGaYxoR3YtUDHS+exGlWgoCih4IzBpbiBoEv/elSo4RHcxRt5p5Q7kXu84pg0b8JGmZ/v497AYwgPssW3n6dl/vM79moR4ZZ+chXFMvcFKdhyOb4e0Yd/AifSnKFVLIe7aCK9I80ZTXQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2017 08:00:13.2623 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1447
Cc: chunrong.guo@nxp.com
Subject: [PATCH 3/3] packagegroup-virtualization: initial add
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
X-List-Received-Date: Tue, 25 Apr 2017 08:15:40 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

---
 .../packagegroups/packagegroup-virtualization.bb           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-extended/packagegroups/packagegroup-virtualization.bb

diff --git a/recipes-extended/packagegroups/packagegroup-virtualization.bb b/recipes-extended/packagegroups/packagegroup-virtualization.bb
new file mode 100644
index 0000000..7e9dae5
--- /dev/null
+++ b/recipes-extended/packagegroups/packagegroup-virtualization.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "All packages virtualization packages"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit packagegroup
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
+    'libvirt \
+    libvirt-libvirtd \
+    libvirt-virsh \
+    '', d)} \
+" 
-- 
1.9.0


