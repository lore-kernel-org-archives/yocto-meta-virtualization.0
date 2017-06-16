Return-Path: <pieter.cardoen@hotmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C8DCE00A16; Fri, 16 Jun 2017 06:52:57 -0700 (PDT)
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
	*      [40.92.64.39 listed in list.dnswl.org]
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
X-Greylist: delayed 22651 seconds by postgrey-1.32 at yocto-www;
	Fri, 16 Jun 2017 06:52:54 PDT
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-oln040092064039.outbound.protection.outlook.com [40.92.64.39])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13634E00992
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Jun 2017 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=Em8nVJIrx1jHQlQUOt7BWdwADN/XFKkCsdNFwHtr1pY=;
	b=oQEYcjn9hkRJzGge60ESHCuOAK2fhWdWMkPu7oYjh68eKqFAN68OxleP3ZLw7Toe1VjoUZxv+AkTdlymi4CTr20d5b0/WXSK6Gi8Y7zFmJNyOe2MnLoV5P9RdoKypvm6X3C2RDRQHHcqbgSup1uWEaMQjNpj5VPj0FVlRSHK/bkMF4kPY7cijdMwQWJbL2PeZo7EXicW5zsINaUjltY51nJT6lrM4DJ9hLUDBMX7zJH2yYduLZC4MY5t0ARBgNaQ3bqAe/mQ4gU0pk43rrPqOdSa6wkJpLctCbqDH/iUUMZHTfEJRZ5re3R0R4fVAn1qQyEPjhmYQzytsv8LU2qIyQ==
Received: from HE1EUR01FT047.eop-EUR01.prod.protection.outlook.com
	(10.152.0.54) by HE1EUR01HT191.eop-EUR01.prod.protection.outlook.com
	(10.152.1.110) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1157.12;
	Fri, 16 Jun 2017 07:19:43 +0000
Received: from DB5PR08MB0774.eurprd08.prod.outlook.com (10.152.0.52) by
	HE1EUR01FT047.mail.protection.outlook.com (10.152.1.5) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12 via Frontend Transport; Fri, 16 Jun 2017 07:19:43 +0000
Received: from DB5PR08MB0774.eurprd08.prod.outlook.com
	([fe80::2dfe:215f:e5a0:8bba]) by
	DB5PR08MB0774.eurprd08.prod.outlook.com
	([fe80::2dfe:215f:e5a0:8bba%13]) with mapi id 15.01.1178.013;
	Fri, 16 Jun 2017 07:19:43 +0000
From: Pieter Cardoen <pieter.cardoen@hotmail.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] /usr/bin/docker: No such file or directory
Thread-Index: AQHS43bJIA69KgO8z0+2ytWj0ieVqqIk1MYAgAJETac=
Date: Fri, 16 Jun 2017 07:19:43 +0000
Message-ID: <DB5PR08MB0774D48A10151464EAFE3AB48EC10@DB5PR08MB0774.eurprd08.prod.outlook.com>
References: <DB5PR08MB07748AB759E39713C30CC2098ECD0@DB5PR08MB0774.eurprd08.prod.outlook.com>,
	<CAPuovE+1ihfaXhXpv9C3Koa7W1OPQXy=L7C+QuzAU_rZq4wp+Q@mail.gmail.com>
In-Reply-To: <CAPuovE+1ihfaXhXpv9C3Koa7W1OPQXy=L7C+QuzAU_rZq4wp+Q@mail.gmail.com>
Accept-Language: nl-BE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=none action=none
	header.from=hotmail.com;
x-incomingtopheadermarker: OriginalChecksum:4834F99C07BDCFEED7745120163E2A0EA309468B5457BDB95F7CC9CD069DEB37;
	UpperCasedChecksum:30990C7A5F09EBC1F0B1C02B543B4F9BE19F715771A051F086195084BD780E15;
	SizeAsReceived:7535; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [ejK09tH2PioSLlY35fDLmaHk9q4BTjUrhLHdyioTgTmw+el15oZQhA==]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1EUR01HT191;
	24:crGaya+xigNcJ/mcFPjUzohsxd7kIzMLprRaP1HrhKDcsjQp1zgSFb5XhNJjB5F17Rz5H086OSholk1u58lKzI9QQWJHdT8lhL/f1msrFU0=;
	7:8Zh7d3b1xqADK70qk95CfpFfKtvmkHV5NeAXz+p8DIWuvhj+qHeot/Br9I+G1plusgb7Fb7CG37qds5ynume4wdOksSLSbHS5EPtiOl/ADvGSfDJPM/T9+Or+kXnsmmcnOHSITN5KLY+iZb+14wNzFEGId6zk1KQmBU2e/KkmIQ/kX3frXKS8xK8TqpqZcdajfFKeo1AquZ2/efmHqyO7ScrFd/AbWad7W73DtRlG0zQ7FtlcWfCrawijHgFxBpM8EcB9SOidV5butntMFF6Aog1B01xzdMadh9xN/gIpQCi89EFtJn94TIXXsrrO4nB
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:HE1EUR01HT191;
	H:DB5PR08MB0774.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-traffictypediagnostic: HE1EUR01HT191:
x-ms-office365-filtering-correlation-id: e8124337-b1e9-4802-c92d-08d4b4880f65
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322274)(1603101448)(1601125374)(1701031045);
	SRVR:HE1EUR01HT191; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:HE1EUR01HT191; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1EUR01HT191; 
x-forefront-prvs: 0340850FCD
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2017 07:19:43.1400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT191
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: /usr/bin/docker: No such file or directory
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
X-List-Received-Date: Fri, 16 Jun 2017 13:52:57 -0000
Content-Language: nl-BE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Dear Mark

I've checked this and came to the conclusion that =A0/lib/ld-linux.so.3 is =
not available. Instead it is called /lib/ld-linux-armhf.so.3. If I add a sy=
mlink with name /lib/ld-linux.so.3 and which points to /lib/ld-linux-armhf.=
so.3, it works.

Now I still have to adapt the recipes to have this automatically OK. How co=
uld I tackle this?

Thanks
Pieter

<pieter.cardoen@hotmail.com> wrote:
> Dear
>
> I am building docker using Yocto for a Xilinx Zynq platform. When I try t=
o start docker, I get:
>
> -sh: /usr/bin/docker: No such file or directory
>
> However this file is available:
>
> ll /usr/bin/docker
> -rwxr-xr-x=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 11661808 Jun=
=A0 9 14:27 docker
>
> What could be the reason of this & how could I debug this?

Run the 'file' command on the file, my guess it won't match
executables that do run.

Mark

>
> PS.
>
> I have checked the kernel config using check-config.sh and all Generally =
Necessary things are OK.
> Generally Necessary:
> - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
> - CONFIG_NAMESPACES: enabled
> - CONFIG_NET_NS: enabled
> - CONFIG_PID_NS: enabled
> - CONFIG_IPC_NS: enabled
> - CONFIG_UTS_NS: enabled
> - CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled
> - CONFIG_CGROUPS: enabled
> - CONFIG_CGROUP_CPUACCT: enabled
> - CONFIG_CGROUP_DEVICE: enabled
> - CONFIG_CGROUP_FREEZER: enabled
> - CONFIG_CGROUP_SCHED: enabled
> - CONFIG_CPUSETS: enabled
> - CONFIG_MEMCG: enabled
> - CONFIG_KEYS: enabled
> - CONFIG_VETH: enabled
> - CONFIG_BRIDGE: enabled
> - CONFIG_BRIDGE_NETFILTER: enabled
> - CONFIG_NF_NAT_IPV4: enabled
> - CONFIG_IP_NF_FILTER: enabled
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled
> - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled
> - CONFIG_NF_NAT: enabled
> - CONFIG_NF_NAT_NEEDED: enabled
> - CONFIG_POSIX_MQUEUE: enabled
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
    =

