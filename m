Return-Path: <vishwanath.m@samsung.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 274F3E007E1; Wed,  7 Feb 2018 09:45:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [211.189.100.12 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mailout2.w2.samsung.com (mailout2.w2.samsung.com
	[211.189.100.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB1D3E007E1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Feb 2018 09:45:43 -0800 (PST)
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
	by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
	20180207174543usoutp029bdc833682e8e0afcb201bd88bad2481~RHDBTumBI1272512725usoutp021;
	Wed,  7 Feb 2018 17:45:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
	20180207174543usoutp029bdc833682e8e0afcb201bd88bad2481~RHDBTumBI1272512725usoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1518025543;
	bh=8X2l7k2gDwkCQcjqEGD5lfzonavP8s4Bb3yva8rUzNE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VTk4sS+orDmH57pG6zcppI/YY9e0eBBhbxc7OYIEc5fjSdDdzTyUIXhXiXq1MUgF1
	KmZUFCOE9ADiP3d5g1XT0lD158/ByMKcM2riE7OiWe1vRImNJ8pf8QQeisn2cOBN5O
	IsgdfsYW7dZQjL8EkHm4cj6Bhd+TzQb7onHJPMM8=
Received: from ussmges5.samsung.com (u115.gpu85.samsung.co.kr
	[203.254.195.115]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
	20180207174543uscas1p1d199f397432f0eb2664b81ce55718d08~RHDBLF3sz2245422454uscas1p1L;
	Wed,  7 Feb 2018 17:45:43 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
	ussmges5.samsung.com (USCPEMTA) with SMTP id 47.D3.00408.64B3B7A5;
	Wed,  7 Feb 2018 12:45:43 -0500 (EST)
Received: from ussmgxs3.samsung.com (u124.gpu85.samsung.co.kr
	[203.254.195.124]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
	20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34~RHDA60uz42244122441uscas1p14;
	Wed,  7 Feb 2018 17:45:42 +0000 (GMT)
X-AuditID: cbfec373-f79ba6d000000198-d8-5a7b3b463341
Received: from usmmp2.samsung.com ( [203.254.195.78]) by
	ussmgxs3.samsung.com (USCPEXMTA) with SMTP id 00.08.02102.64B3B7A5;
	Wed,  7 Feb 2018 12:45:42 -0500 (EST)
Received: from SSI-EX4.ssi.samsung.com ([105.128.2.146]) by
	usmmp2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
	64bit
	(built May 5 2014)) with ESMTP id <0P3S003YQK060820@usmmp2.samsung.com>;
	Wed, 07 Feb 2018 12:45:42 -0500 (EST)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
	SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.669.32; Wed, 7 Feb 2018 09:45:41 -0800
Received: from SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36]) by
	SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36%3]) with mapi id
	15.01.0669.032; Wed, 7 Feb 2018 09:45:41 -0800
From: "Vish (Vishwanath) Maram" <vishwanath.m@samsung.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-topic: Yocto Recipe for LibRXE.
Thread-index: AdOgO2Fj41FOtMBASWeXiKl/dad7xA==
Date: Wed, 07 Feb 2018 17:45:41 +0000
Message-id: <ce37211d0564452faec96b262fcfb720@samsung.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Originating-IP: [105.128.2.176]
MIME-version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42LZduzreV136+oog28LmCxuHzjCbLHj/io2
	ByaP9hN9bAGMUVw2Kak5mWWpRfp2CVwZC96cZyz4x1jx49Mh1gbGg4xdjJwcEgImEneWbGSG
	sMUkLtxbzwZiCwksY5SY3czZxcgFZLcwSbz+u4kNpmHR3gtsEAmgoucXnzNCOH8ZJa68OAvl
	fGCUeHH9OSuEs59RYvPeWUwg/WwCVhIPX19lBbFFBIIl3i+7wwJiMws4SlzrWgIWFxZQlJh0
	tpMFokZNYsKUP2wQtp7Em0XbwOIsAqoSyw5MBavnBZp5v7cVLM4I9MT3U2uYIGaKSzS33mSB
	uFtQYtHsPXCP/tv1EOofRYnnLScZIep1JM4eWwdla0s8eXcBar6gxI/J96DmSEocXHEDyj7C
	JrFssQaE7SJxv/0JVFxY4tXxLewQtozEji9PWUABISFwj1Hi0YIOdgjnH6PEhnc3WCcwqs1C
	cuwsJIfMQnLILCSHLGBkWcUoUlpcnJueWmyqV5yYW1yal66XnJ+7iRGYLk7/O1y8g/HFBqtD
	jAIcjEo8vB8sq6OEWBPLiitzDzFKcDArifC6swOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8yrM
	XB0pJJCeWJKanZpakFoEk2Xi4JRqYFxS8TKuZGl+pI2E0dabLw6avPBSthCxca1dnl8S23l9
	2g29ALUIhTtMJvYJUxVzdhdFp7c8cH2Uvm2mRttJgW8rXfyVvk6eF5tS/3zSvF/7Ra33NUpN
	vXJW+4nO1au115t6pm1VuF42v6L/f/HRxQ92b4i1qHVkfSa3NKL7ayaDwsedDv0tk5VYijMS
	DbWYi4oTAcJFtS4TAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42I5/e+wn66bdXWUwfXreha3DxxhtthxfxWb
	A5NH+4k+tgDGKC6blNSczLLUIn27BK6MBW/OMxb8Y6z48ekQawPjQcYuRk4OCQETiUV7L7BB
	2GISF+6tB7K5OIQEljBKnHi7kRXC+csoMW/bJ7AOIYEPjBKrv6dD2PsZJVZ9DQSx2QSsJB6+
	vgrUwMEhIhAs8b/JAiTMLOAoca1rCSuILSygKDHpbCcLiC0ioCYxYcofNghbT+LNom1gcRYB
	VYllB6aC1fMCjbzf2woWZwQ67vupNUwQM8UlmltvskAcLSCxZM95ZghbVOLl43+sELaixPOW
	k4wQ9VoS63ceh+rVlnjy7gLUfEGJH5PvQc2RlDi44gbLBEbxWUhWzELSPgtJ+ywk7QsYWVYx
	ipQWF+emVxQb6xUn5haX5qXrJefnbmKExFLNDsZ7X20OMQpwMCrx8M4wr44SYk0sK67MPcQo
	wcGsJMLrzg4U4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrtxz+pIIYH0xJLU7NTUgtQimCwTB6dU
	A6Myj5hLb1jA7aJory+Z79o5pJmYP8ufZU6VWeP6VzFPoLa/2ICjXC1/5yIes4/aMVMerpgU
	15kmMjVmzrbD3rWfnwRNetK/cd2iR8E2X+Yc08773R27PSxMNLxD8oGCqOyn0LnlW3+npO8R
	UEuZk7sn8Okr3pl+jxpiJn48bH7H4cGZ571fRZVYijMSDbWYi4oTAT2I5bShAgAA
X-CMS-MailID: 20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34
X-Msg-Generator: CA
CMS-TYPE: 301P
X-CMS-RootMailID: 20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34
X-RootMTR: 20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34
References: <CGME20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34@uscas1p1.samsung.com>
Cc: "meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>
Subject: Yocto Recipe for LibRXE.
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
X-List-Received-Date: Wed, 07 Feb 2018 17:45:44 -0000
Content-language: en-US
Content-type: text/plain; charset="us-ascii"
Content-transfer-encoding: quoted-printable

Hi,

I am looking for a yocto recipe of librxe? Right now I was able to get libr=
dmacm and libibverbs, but librxe yocto is not there. Can someone help me in=
 getting this?

Highly appreciate if I can get some info on the same.

Thanks,
-Vish

