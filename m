Return-Path: <vishwanath.m@samsung.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 805EDE00E3C; Wed,  7 Feb 2018 09:43:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7201CE007E1;
	Wed,  7 Feb 2018 09:43:34 -0800 (PST)
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
	20180207174333usoutp02da60aec762f2c9f1e0480a6f564f9f9b~RHBIhLSEL1272512725usoutp02W;
	Wed,  7 Feb 2018 17:43:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
	20180207174333usoutp02da60aec762f2c9f1e0480a6f564f9f9b~RHBIhLSEL1272512725usoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1518025413;
	bh=8X2l7k2gDwkCQcjqEGD5lfzonavP8s4Bb3yva8rUzNE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=GCLYlQKCaUtX/SOu7ipRqnfbvk9oE2mbrnjVNk91Jn/wVjsG8hxAPIwW+jMn8+cfK
	Ye/oDS2T2xv1phw4SRliQcWIRF+58RE1sCJn8Zn70//pRg+eLmxvBzUR4YaA0nT2d3
	0frf5oLjnKKH+LfEKjYfzoyMN+reG2OTPDeHgTmE=
Received: from ussmges4.samsung.com (u114.gpu85.samsung.co.kr
	[203.254.195.114]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
	20180207174333uscas1p12a06faf0564cecaab97ff0678f4b40b4~RHBIYIYYh0588005880uscas1p11;
	Wed,  7 Feb 2018 17:43:33 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
	ussmges4.samsung.com (USCPEMTA) with SMTP id 8C.E5.00495.5CA3B7A5;
	Wed,  7 Feb 2018 12:43:33 -0500 (EST)
Received: from ussmgxs1.samsung.com (u122.gpu85.samsung.co.kr
	[203.254.195.122]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a~RHBH6nOFY0675806758uscas1p2q;
	Wed,  7 Feb 2018 17:43:32 +0000 (GMT)
X-AuditID: cbfec372-f79b46d0000001ef-67-5a7b3ac5c330
Received: from usmmp2.samsung.com ( [203.254.195.78]) by
	ussmgxs1.samsung.com (USCPEXMTA) with SMTP id 1B.6A.03147.4CA3B7A5;
	Wed,  7 Feb 2018 12:43:32 -0500 (EST)
Received: from SSI-EX4.ssi.samsung.com ([105.128.2.146]) by
	usmmp2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
	64bit
	(built May 5 2014)) with ESMTP id <0P3S003SXJWKEN20@usmmp2.samsung.com>;
	Wed, 07 Feb 2018 12:43:32 -0500 (EST)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
	SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.669.32; Wed, 7 Feb 2018 09:43:32 -0800
Received: from SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36]) by
	SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36%3]) with mapi id
	15.01.0669.032; Wed, 7 Feb 2018 09:43:32 -0800
From: "Vish (Vishwanath) Maram" <vishwanath.m@samsung.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-topic: Yocto Recipe for LibRXE.
Thread-index: AdOgOyWlgtjKAqLnTiOPwQEKnL+v7A==
Date: Wed, 07 Feb 2018 17:43:31 +0000
Message-id: <7303d2119528406d838e7922fbadfa95@samsung.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Originating-IP: [105.128.2.176]
MIME-version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsWy7djX87pHraqjDB6s4rW4feAIs8Wkl2vY
	HJg82k/0sQUwRnHZpKTmZJalFunbJXBlLHhznrHgH2PFj0+HWBsYDzJ2MXJySAiYSJxecp8V
	whaTuHBvPVsXIxeHkMAyRoltM1awQDgtTBIL93xjhem4v6GdHa7q0Py7zBDOX0aJFZMmQTkf
	GCW6b6+DcvYzSvxesIIdpJ9NwEri4eurYLNEBIIl3i+7A7SEg4NZwFRi7YxSkLCwgKLEpLOd
	LBAlahITpvxhg7D1JL7vfwg2hkVAVeLB+b1MIDYv0MjDyzYyg9iMQE98P7UGLM4sIC7R3HqT
	BeJsQYlFs/cwwzz6b9dDNghbUeJ5y0lGiHodibPH1kHZ2hJP3l1ghZgvKPFj8j2oOZISB1fc
	AIeLhMAZNonZq9ayg9wvIeAiMX9eKUSNsMSr41uAwuxAtozEIzmI6nuMEo8WdLBDOP8YJTa8
	u8E6gVFtFpJTZyE5YxaSM2YhOWMBI8sqRpHS4uLc9NRiE73ixNzi0rx0veT83E2MwFRx+t/h
	oh2MzzZYHWIU4GBU4uHt2FQZJcSaWFZcmXuIUYKDWUmE1529OkqINyWxsiq1KD++qDQntfgQ
	ozQHi5I4r8LM1ZFCAumJJanZqakFqUUwWSYOTqkGxsOKgTy3ZzgWWhrOmH2P5ZpC9t17IT8r
	Q2/t2FuibHVhcty3Da8kWHa94vt99OGFg8fY3d79yt4/8XbUjO/Lt9zUUtyQtvu8/qsob55j
	dhYrfVlX855fUnD2BUN3nPHmJcbHHM4eONjPHiv8cPrESYcm35w05f0tvf01x77yrwo4keBv
	f1tjW8cmJZbijERDLeai4kQASIK1HREDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e+wn+4Rq+oog6bDxha3Dxxhtpj0cg2b
	A5NH+4k+tgDGKC6blNSczLLUIn27BK6MBW/OMxb8Y6z48ekQawPjQcYuRk4OCQETifsb2tkh
	bDGJC/fWs4HYQgJLGCU+fhXpYuQCsv8ySpxv6GeHSHxglGi+YQuR2M8o0fPwNzNIgk3ASuLh
	66usXYwcHCICwRL/myxATGYBU4m1M0pBKoQFFCUmne1kAbFFBNQkJkz5wwZh60l83/8QbDyL
	gKrEg/N7mUBsXqCJh5dtBJvOCHTb91NrwOLMAuISza03WSBuFpBYsuc8M4QtKvHy8T9WCFtR
	4nnLSUaIei2J9TuPQ/VqSzx5d4EVYr6gxI/J96DmSEocXHGDZQKj+CwkK2YhaZ+FpH0WkvYF
	jCyrGEVKi4tz0yuKDfWKE3OLS/PS9ZLzczcxQiKpagfjna82hxgFOBiVeHgNNlRGCbEmlhVX
	5h5ilOBgVhLhdWevjhLiTUmsrEotyo8vKs1JLT7EKM3BoiTOu3HP6kghgfTEktTs1NSC1CKY
	LBMHp1QDo1vsc27hnL0Rjosk7nz5InH5wY+n3QJ3EtsdGnxOn4r6vOmT/mqXi0K936rCTlaI
	zensUJJ5/WamEnvR/b9qZYdPvKn3LuNkZ6nraj14o1HzzOQlV+d2lj+asvfkw+DujWp/X1n/
	DX2rtuP9SYnUtAzvmytZo1f0tubu/pKo461x8HRi0/G7v5RYijMSDbWYi4oTAUkfpZ2gAgAA
X-CMS-MailID: 20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a
X-Msg-Generator: CA
CMS-TYPE: 301P
X-CMS-RootMailID: 20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a
X-RootMTR: 20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a
References: <CGME20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a@uscas1p2.samsung.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
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
X-List-Received-Date: Wed, 07 Feb 2018 17:43:36 -0000
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

