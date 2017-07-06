Return-Path: <pieter.cardoen@hotmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 835F2E00BE8; Fri,  7 Jul 2017 15:58:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (pieter.cardoen[at]hotmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [40.92.72.22 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.9 FORGED_HOTMAIL_RCVD2 hotmail.com 'From' address,
	but no 'Received:'
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 14448 seconds by postgrey-1.32 at yocto-www;
	Fri, 07 Jul 2017 15:57:57 PDT
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-oln040092072022.outbound.protection.outlook.com [40.92.72.22])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FF4DE00BDF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jul 2017 15:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=f2i0k5t+zH2D/ujVbUPckWmhhIqX6zyZvcEjgpY90JU=;
	b=af3/sDqR7Qh3cm57MLvJKv8yzMPcaE/4XLvDHtZVmWFz+PGj+e3Pc0IsNNVBYhR3DBpHLM9WxkqTtTF3CNagFdwAnidtahnQ4IGjbjUKA8qTeEXK/TLT6Q1Du5Dx/lzxEAusxnJ9XAa6mIsrxIklbrzpwpGoGiMKevQpsBu7YsRVgyVPRpCKFXhVLTa/ghIz8KIpXBPBSNhhzw17/Knm6nMY41eRE3xVrNdrYTAFeEgj45Zo/Wr5WmVB9byS6VFEFShlT9vawjRWnf8SctbcYoGcB3UCgKf5qA7OCf/HMonHpBIa99kNKR2GbSKGndes6uUoZBq1cB8MUDenSy1LrQ==
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
	(10.152.18.52) by VE1EUR03HT212.eop-EUR03.prod.protection.outlook.com
	(10.152.19.192) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1220.9;
	Thu, 6 Jul 2017 16:23:10 +0000
Received: from DB5PR08MB0774.eurprd08.prod.outlook.com (10.152.18.52) by
	VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.9 via Frontend Transport; Thu, 6 Jul 2017 16:23:10 +0000
Received: from DB5PR08MB0774.eurprd08.prod.outlook.com
	([fe80::d54a:d847:a1cb:4f95]) by
	DB5PR08MB0774.eurprd08.prod.outlook.com
	([fe80::d54a:d847:a1cb:4f95%13]) with mapi id 15.01.1240.013;
	Thu, 6 Jul 2017 16:23:10 +0000
From: Pieter Cardoen <pieter.cardoen@hotmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Container not found error
Thread-Index: AQHS9nP8L+m2VbbZKUijKtJoEf5cYw==
Date: Thu, 6 Jul 2017 16:23:10 +0000
Message-ID: <DB5PR08MB0774FB29A185E93873FCE5F68ED50@DB5PR08MB0774.eurprd08.prod.outlook.com>
Accept-Language: nl-BE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=none action=none
	header.from=hotmail.com;
x-incomingtopheadermarker: OriginalChecksum:7C9F4F72E9B44636A4ED12769B03BFF61AC4A9C15FBDE20B9D7628451138A490;
	UpperCasedChecksum:19C9BEC8AF825B41CFFBD4BDDAEA89B8DD086D7B9CA0818F63CAC27B6F13B7C3;
	SizeAsReceived:7091; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [vrV/TM+Al6OPk2MssFZkChoGG/xMLVQ/]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VE1EUR03HT212;
	7:Emd71tklRTB+ojgXz/Sq41km/hzqop/qoUMwry3ZTWKroRUaQWlAaSPNoiTKFxcH/J81uOAq4DhQqLmnnc6Imlwz5zszAoVhOZ1RgCIoYqOGbzxPkKS+wOQVwGqiSsx/YX6slvHs65hLBapowjbOQDwHotqnU8OfoYn4RtvBTDUkf9ngrz/PEUZMTuomrDUvdNdTHln+6xgGIWsMGhuZb32xYpY6d/vBEz3gs/rKsHosQya3w1vP0GJDKVs0V6DjvoC4DoT7+JG+nuXLMcmEpGQ1D1RoJNBchbGuITs/Lbsxm6kfgRm/HHXTPHClW7thAsOgLlxMVRWWdn2nB8AMym0jHgSrp0z+jyNEMDvRRlI1NBnwDQLC5Om2TYc86GzDGiL1yQyZ+6/NhAqem9WZk1HS6O4mZOoyFSMbHd6p2wrTmeWdwqiAnW/keeUAtFWxATYw55rSDWCjVdq0jDT3mKCaC4ZS8ed9XEMIZd6vRjqke2v0/4SPIisaFloiwwGQz2jGIyalpisgTALsvr1lpUMWIFmX1iwwRFGZDhKvoKqxKmF3UAn2xaRDFuqo1xD4lX0Vo/5h5+4ntkNfU24csVqTIJEXIDDufE2y5yWCVomMHYdcI3wt+LbjGKreSGk/qqEMBZBs/IvtX/UdYzkZ5r4+QtBtclHwKuLtRMmp03LkNvA7szbu51fRBZQLdovIrLQIZKR1MsAzBjApCV5pRJuitsIBTiRjuTltiTOFYl91rfSFH8o8iz7Orh0pTm9ZtwMnhLGNkTsbMSeOhINztw==
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:VE1EUR03HT212;
	H:DB5PR08MB0774.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-office365-filtering-correlation-id: 1f7cb7e7-8e3d-45b6-9c47-08d4c48b4ada
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322274)(1601125374)(1603101448)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VE1EUR03HT212; 
x-ms-traffictypediagnostic: VE1EUR03HT212:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:VE1EUR03HT212; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VE1EUR03HT212; 
x-forefront-prvs: 03607C04F0
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2017 16:23:10.0891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT212
Subject: Container not found error
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
X-List-Received-Date: Fri, 07 Jul 2017 22:58:02 -0000
Content-Language: nl-BE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear

When I start a container using this command:

 docker run -it alpine /bin/sh

I got an error:

ERRO[0231] Handler for POST /v1.24/containers/321f74a7c7ecc1614f62973dede23=
92dbcdd3a5ee995e04b5ae472c9c1ab6e6c/resize returned error: rpc error: code =
=3D 2 desc =3D containerd: container not found=20
                                                                           =
                                                                           =
                                          =20
WARN[0231] failed to close stdin: rpc error: code =3D 2 desc =3D containerd=
: container not found

I can't find a solution to start my containers.

Thanks
Pieter
=20
   =

