Return-Path: <peter.spierenburg@nautel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DC79E009E2; Thu,  9 Feb 2017 19:09:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.41.131 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0131.outbound.protection.outlook.com [104.47.41.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE5B0E009CD
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 19:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nautel.onmicrosoft.com; s=selector1-nautel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FwRxXSFnPV2Qdg1Um6NLZs73ftjzWcOzpLMoY1qNQpI=;
	b=Kp9/sMhNaNUOne8LBPC13FDyD0FHaDbrrlf5ZXz2WkmPwNJjr8CPpGMA3l3wq7DfqKWmy21LHE0bTZXzGt3M3kSVDLIVhWAtEsMk7HoTlccdQe6Sl3pksGObbIVjgaQi5GZ4w7XjYnwXd8Gytz5Arnj4fz1me/dQwiZyrFIaP1s=
Received: from BN6PR05MB2851.namprd05.prod.outlook.com (10.168.255.136) by
	BN6PR05MB2849.namprd05.prod.outlook.com (10.168.255.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.5; Fri, 10 Feb 2017 01:34:40 +0000
Received: from BN6PR05MB2851.namprd05.prod.outlook.com ([10.168.255.136]) by
	BN6PR05MB2851.namprd05.prod.outlook.com ([10.168.255.136]) with mapi id
	15.01.0888.026; Fri, 10 Feb 2017 01:34:40 +0000
From: Peter Spierenburg <peter.spierenburg@nautel.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: I am missing some docker dependencies.
Thread-Index: AQHSgz0U5XaAVj1nsUm0auMZ9nLVjQ==
Date: Fri, 10 Feb 2017 01:34:39 +0000
Message-ID: <BN6PR05MB285170FF48A047358E55626B9E440@BN6PR05MB2851.namprd05.prod.outlook.com>
Accept-Language: en-CA, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=peter.spierenburg@nautel.com; 
x-originating-ip: [25.171.172.4]
x-ms-office365-filtering-correlation-id: e3aa6a5a-a176-4f67-b051-08d45154fb6e
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BN6PR05MB2849;
x-microsoft-exchange-diagnostics: 1; BN6PR05MB2849;
	7:M3cNn6DE+VUV+7U95ZAP75tQmqa4KiZuplDOhsx53VMRMG2XUgsjHrz9CpyKbIp7ehKMQujepo8X1Aw8MMOqCDDUwMSzldbOYP+bt7iyShN3OwX7CfB/uSMBQpMVXegh3JgpbCx+wvsb57Lxp55b4r0RKbb3ZX2YKnxfpq0LWKsB5VsDjYEu+EMWcwDHbMN7VwSPY6r2SfTCF8bwhiMJkgD7/G5alCJqX09+Nwruy1kKUgefDPvbUhrAHRHI6JcL76CJo2+FycDqvQv4tDK2Y67OhT38wdi5ckRty8Mp0SjBaDWALFMlssRtJuaYtEaYcRuSPQuG0x6FSPJ5hwueiRdq78/u1AQ3k8ds07fKNbxiKEYsTSk9mPKNBcFaez8CwQPDeK9NYHxgw+slppngWWsJK5twb3iXVm5so1OZGw9P2mH5TtXx0G31guqtwap98areWPa7b0qLfOPP6Eq6IAVEHho0XN7FxNWuQA0YypDEJcdhjKnYwjv6zGSfHTbqplrfeu2sz0Tfsxp/yo8hhA==
x-microsoft-antispam-prvs: <BN6PR05MB2849BDA18F8B77F58F7414619E440@BN6PR05MB2849.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(20161123562025)(20161123560025)(20161123558025)(20161123564025)(20161123555025)(6072148);
	SRVR:BN6PR05MB2849; BCL:0; PCL:0; RULEID:; SRVR:BN6PR05MB2849; 
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(189002)(199003)(2501003)(9686003)(53936002)(6506006)(2906002)(2351001)(8676002)(101416001)(5660300001)(6116002)(122556002)(3846002)(102836003)(189998001)(54896002)(55016002)(450100001)(99286003)(66066001)(5640700003)(2900100001)(3660700001)(97736004)(105586002)(8936002)(25786008)(6606003)(6436002)(54356999)(50986999)(92566002)(6916009)(106356001)(33656002)(110136004)(7696004)(106116001)(74316002)(81156014)(81166006)(3280700002)(7736002)(86362001)(38730400002)(77096006)(68736007)(19627405001)(161833001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR05MB2849;
	H:BN6PR05MB2851.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nautel.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nautel.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2017 01:34:39.8136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 656f830c-eb88-49fe-90f1-433363ec7ccf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2849
Subject: I am missing some docker dependencies.
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
X-List-Received-Date: Fri, 10 Feb 2017 03:09:42 -0000
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN6PR05MB285170FF48A047358E55626B9E440BN6PR05MB2851namp_"

--_000_BN6PR05MB285170FF48A047358E55626B9E440BN6PR05MB2851namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I think my kernel is missing some modules or features needed by docker. I'm=
 posting this here in the hope that someone might have some insight.

root@qemuarm:~# docker daemon
INFO[0001] API listen on /var/run/docker.sock
ERRO[0001] Failed to built-in GetDriver graph btrfs /var/lib/docker
ERRO[0001] Failed to built-in GetDriver graph devicemapper /var/lib/docker
ERRO[0001] 'overlay' not found as a supported filesystem on this host. Plea=
se ensure kernel is new enough and has overlay support loaded.
WARN[0001] Running modprobe bridge br_netfilter failed with message: modpro=
be: module br_netfilter not found in modules.dep
, error: exit status 1
FATA[0004] Error starting daemon: Error initializing network controller: er=
ror obtaining controller instance: Failed to create NAT chain: iptables fai=
led: iptables --wait -t nat -N DOCKER: iptables v1.6.0: can't initialize ip=
tables table `nat': Table does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
 (exit status 3)



--_000_BN6PR05MB285170FF48A047358E55626B9E440BN6PR05MB2851namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<div>I think my kernel is missing some modules or features needed by docker=
. I'm posting this here in the hope that someone might have some insight.&n=
bsp;</div>
<div><br>
</div>
<div>root@qemuarm:~# docker daemon</div>
<div>INFO[0001] API listen on /var/run/docker.sock &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;&nbsp;</div>
<div>ERRO[0001] Failed to built-in GetDriver graph btrfs /var/lib/docker&nb=
sp;</div>
<div>ERRO[0001] Failed to built-in GetDriver graph devicemapper /var/lib/do=
cker&nbsp;</div>
<div>ERRO[0001] 'overlay' not found as a supported filesystem on this host.=
 Please ensure kernel is new enough and has overlay support loaded.&nbsp;</=
div>
<div>WARN[0001] Running modprobe bridge br_netfilter failed with message: m=
odprobe: module br_netfilter not found in modules.dep</div>
<div>, error: exit status 1&nbsp;</div>
<div>FATA[0004] Error starting daemon: Error initializing network controlle=
r: error obtaining controller instance: Failed to create NAT chain: iptable=
s failed: iptables --wait -t nat -N DOCKER: iptables v1.6.0: can't initiali=
ze iptables table `nat': Table does
 not exist (do you need to insmod?)</div>
<div>Perhaps iptables or your kernel needs to be upgraded.</div>
<div>&nbsp;(exit status 3)&nbsp;</div>
<div><br>
</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_BN6PR05MB285170FF48A047358E55626B9E440BN6PR05MB2851namp_--
