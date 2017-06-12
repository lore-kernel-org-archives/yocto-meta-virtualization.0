Return-Path: <pieter.cardoen@hotmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4274BE00888; Tue, 13 Jun 2017 13:05:39 -0700 (PDT)
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
	*      [40.92.65.61 listed in list.dnswl.org]
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
X-Greylist: delayed 121247 seconds by postgrey-1.32 at yocto-www;
	Tue, 13 Jun 2017 13:05:36 PDT
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-oln040092065061.outbound.protection.outlook.com [40.92.65.61])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37B4DE00888
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Jun 2017 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=RcI3Eqzrg9HLHEJbeP7auPqbo1Mx8PaLrkPziyrAXEs=;
	b=OvyWQdhDldDcKm8GWTmeFR+6shgYJ9Tv5sPbJni5k9JgYRYdxf4+0xqbdjGyXAVAAjsxhmrMl8cW0MTrtnfotQvvwQtoT0erpKcR1BVps+N1W8bKcLXcx7n7yKuFY4MkY9DdsaGqQcQ6BevYLtmZqH+R8hIAAwsmueOjuBu1kBhPq7THuoVowFzPBg3yBJYu0Grie3C4bYp1OX4PeY4mA8ClXof+Z025E9MrqT5e3HuGdGw3XKrtXx1bNuaP0rG1yCovh8+90YPN+rf16yfViFpiWfoCY4IrZwykfHZidKgdNAW4pcR7mxIEcwOFSq1J1t43yVxXkMhLHPPZ9v1NxQ==
Received: from HE1EUR01FT024.eop-EUR01.prod.protection.outlook.com
	(10.152.0.56) by HE1EUR01HT197.eop-EUR01.prod.protection.outlook.com
	(10.152.1.160) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1143.11;
	Mon, 12 Jun 2017 12:24:50 +0000
Received: from DB5PR08MB0774.eurprd08.prod.outlook.com (10.152.0.60) by
	HE1EUR01FT024.mail.protection.outlook.com (10.152.0.164) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1143.11 via Frontend Transport; Mon, 12 Jun 2017 12:24:50 +0000
Received: from DB5PR08MB0774.eurprd08.prod.outlook.com
	([fe80::ed62:7a02:44c5:7a0b]) by
	DB5PR08MB0774.eurprd08.prod.outlook.com
	([fe80::ed62:7a02:44c5:7a0b%15]) with mapi id 15.01.1157.017;
	Mon, 12 Jun 2017 12:24:50 +0000
From: Pieter Cardoen <pieter.cardoen@hotmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: /usr/bin/docker: No such file or directory
Thread-Index: AQHS43bJIA69KgO8z0+2ytWj0ieVqg==
Date: Mon, 12 Jun 2017 12:24:50 +0000
Message-ID: <DB5PR08MB07748AB759E39713C30CC2098ECD0@DB5PR08MB0774.eurprd08.prod.outlook.com>
Accept-Language: nl-BE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=none action=none
	header.from=hotmail.com;
x-incomingtopheadermarker: OriginalChecksum:C188413A800E34B1E805A40C0ABD1CE4500C1950CF0B2448BE344E4B12E19DFA;
	UpperCasedChecksum:21ECEEE0871B585C99110CE8C680F6E93DAADCBF03077B5F07FBDD9444A2E118;
	SizeAsReceived:7147; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1Cuj6KcPiST81YNnpWUhM3OndrGxKF274LmsQEWDt4E=]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1EUR01HT197;
	24:8iPWLUf3nttWpmUA6xBqstjvPD1lgbme8SFTbwQlB5qGM0LObUs4yLovy9t2ZQLCaS0bdM7wjO+7ldozBkPPaA4cGzUDcmmtj+svLAUJhyg=;
	7:TwqBzPje5U+KBnhZJpbbstp3L2JB8/k8adygf20szwXzo+WfI0k0mEkb/sD26ll0XoGpzq9ycJg3LfQ9gs2iR3DTi8ygLtiyZJU/RLM0JPJBwHgcEmBy4hALfEk0VgbUmd+5rSkM/EbkE+miyKDguf2vpC/bNeCNRPiCEbC51LdK+GvTeXsp6i5ptaBoDbuwXX2pzkxWWYuZr+iz86YPYUUq6e29njtgtNvnXx5Q7OEID0rHBJOP9XVTGE0ECmchNAxX6qvv2LMBaEF/K2oBojqLnowyom3MUTmOM0vvDml1tR3qZWUzMAgzd6TPAPRS
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:HE1EUR01HT197;
	H:DB5PR08MB0774.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-traffictypediagnostic: HE1EUR01HT197:
x-ms-office365-filtering-correlation-id: 5b035fed-309a-4625-2545-08d4b18e059d
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322274)(1601125374)(1603101448)(1701031045);
	SRVR:HE1EUR01HT197; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:HE1EUR01HT197; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1EUR01HT197; 
x-forefront-prvs: 03361FCC43
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2017 12:24:50.2333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT197
Subject: /usr/bin/docker: No such file or directory
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
X-List-Received-Date: Tue, 13 Jun 2017 20:05:39 -0000
Content-Language: nl-BE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear

I am building docker using Yocto for a Xilinx Zynq platform. When I try to =
start docker, I get:

-sh: /usr/bin/docker: No such file or directory

However this file is available:

ll /usr/bin/docker
-rwxr-xr-x    1 root     root      11661808 Jun  9 14:27 docker

What could be the reason of this & how could I debug this?

PS.

I have checked the kernel config using check-config.sh and all Generally Ne=
cessary things are OK.
Generally Necessary:
- cgroup hierarchy: properly mounted [/sys/fs/cgroup]
- CONFIG_NAMESPACES: enabled
- CONFIG_NET_NS: enabled
- CONFIG_PID_NS: enabled
- CONFIG_IPC_NS: enabled
- CONFIG_UTS_NS: enabled
- CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled
- CONFIG_CGROUPS: enabled
- CONFIG_CGROUP_CPUACCT: enabled
- CONFIG_CGROUP_DEVICE: enabled
- CONFIG_CGROUP_FREEZER: enabled
- CONFIG_CGROUP_SCHED: enabled
- CONFIG_CPUSETS: enabled
- CONFIG_MEMCG: enabled
- CONFIG_KEYS: enabled
- CONFIG_VETH: enabled
- CONFIG_BRIDGE: enabled
- CONFIG_BRIDGE_NETFILTER: enabled
- CONFIG_NF_NAT_IPV4: enabled
- CONFIG_IP_NF_FILTER: enabled
- CONFIG_IP_NF_TARGET_MASQUERADE: enabled
- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled
- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled
- CONFIG_NETFILTER_XT_MATCH_IPVS: enabled
- CONFIG_NF_NAT: enabled
- CONFIG_NF_NAT_NEEDED: enabled
- CONFIG_POSIX_MQUEUE: enabled=

