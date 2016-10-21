Return-Path: <jorge@fispe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9803E00E1E; Fri, 21 Oct 2016 09:56:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.36.64 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 1970 seconds by postgrey-1.32 at yocto-www;
	Fri, 21 Oct 2016 09:56:47 PDT
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0064.outbound.protection.outlook.com [104.47.36.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45926E00C35
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Oct 2016 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fispe.onmicrosoft.com; 
	s=selector1-fispe-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OBG6pQYlCHhLxGPjdlKZuD4CBCPiqs/YhxtNsOKxG2E=;
	b=UgOHOjDYHoAPoHmR6NdBgwuhW+az3YvsU9Mk2lsi001eCgWUjN4ujiyWYWo3eN9xGyAqGNPz0ggoCe2SmYSvvWySFJyxFZgtaebsyew3LnE+cqznZy4Om2st6+xiD3IczG6r6oGvK8FFu5ZTYP0owjyEaqjh3K94EFtcm8GPuBQ=
Received: from CY1PR20MB0171.namprd20.prod.outlook.com (10.163.54.152) by
	CY1PR20MB0170.namprd20.prod.outlook.com (10.163.54.151) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.669.16; Fri, 21 Oct 2016 16:23:55 +0000
Received: from CY1PR20MB0171.namprd20.prod.outlook.com ([10.163.54.152]) by
	CY1PR20MB0171.namprd20.prod.outlook.com ([10.163.54.152]) with mapi id
	15.01.0669.018; Fri, 21 Oct 2016 16:23:55 +0000
From: Jorge Nolla <jorge@fispe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: openvswitch 2.5.0 "testsuite: No such file or directory"
Thread-Index: AQHSK7eErye5B/1cJUaSlz3Ee5PvHQ==
Message-ID: <CY1PR20MB0171AC94ADB1FAFD84630197A9D40@CY1PR20MB0171.namprd20.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jorge@fispe.com; 
x-originating-ip: [132.245.45.21]
x-ms-office365-filtering-correlation-id: f28980b9-b37f-47c1-6a99-08d3f9cea756
x-microsoft-exchange-diagnostics: 1; CY1PR20MB0170;
	7:9da1ArWQ4Xm8/IEck7Nw0yGYayZSX8f7L+oWBVWaPSX/1oeSEm1UrOYtUfQC6RVERysfdz6HKcuIfqiu5r6nw5m850Xi70jHSvcoBCCx/mo8i+0QHpwRGD18lzdrXQTynnDYjI3H86hbodvHWDXvpyPculHS2l7PI6f3pbKNM5Za9aJHRxG8ZgBgHAiQ+J2/BkOon2sStMczB5BfCadCuHwWQAIyNQDjuGKm0tPv8LD129zK08JPa4v1HNOwZTSC3YsJrM8yrEV1wkF2xWn+gDEp1JLtGjzqHYbmuxnwpPa7AOendRH5dJjI1nSSP3BoT81RunYKkQEVqJX9XeNZynq/Qu0EotMc/YGbYPLv1F8=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR20MB0170;
x-microsoft-antispam-prvs: <CY1PR20MB0170C08EB7A98629DE4F14D8A9D40@CY1PR20MB0170.namprd20.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6043046)(6042046);
	SRVR:CY1PR20MB0170; BCL:0; PCL:0; RULEID:; SRVR:CY1PR20MB0170; 
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(189002)(199003)(189998001)(5660300001)(2900100001)(77096005)(76576001)(87936001)(74316002)(8676002)(6606003)(99286002)(9686002)(97736004)(81166006)(2906002)(92566002)(6916009)(5002640100001)(81156014)(122556002)(2501003)(7736002)(7846002)(10400500002)(110136003)(107886002)(7696004)(68736007)(6116002)(19580395003)(575784001)(16236675004)(50986999)(450100001)(19627405001)(2351001)(3846002)(86362001)(19625215002)(102836003)(586003)(106116001)(3280700002)(11100500001)(105586002)(8936002)(3660700001)(54356999)(5640700001)(66066001)(101416001)(229853001)(33656002)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR20MB0170;
	H:CY1PR20MB0171.namprd20.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: fispe.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: fispe.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2016 16:23:55.4668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 77ccb639-ac4c-46e3-8826-d5683f0c843f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR20MB0170
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Subject: openvswitch 2.5.0 "testsuite: No such file or directory"
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
Date: Fri, 21 Oct 2016 16:56:50 -0000
X-Original-Date: Fri, 21 Oct 2016 16:23:55 +0000
X-List-Received-Date: Fri, 21 Oct 2016 16:56:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY1PR20MB0171AC94ADB1FAFD84630197A9D40CY1PR20MB0171namp_"

--_000_CY1PR20MB0171AC94ADB1FAFD84630197A9D40CY1PR20MB0171namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Team,


I'm trying to build openvswitch 2.5.0 but I'm getting the following error. =
Could someone take a look and let me know what might be the issue?


Thank you!


| sed -i 's|at_top_srcdir=3D.*|at_top_srcdir=3D'"'"'..'"'"'|g' /home/jnolla=
/armada38x-bsp-3/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/open=
vswitch/2.5.0+8c0b419a0b9ac0141d6973dcc80306dfc6a83d31-r0/image/usr/lib/ope=
nvswitch/ptest/tests/atconfig

| sed -i 's|at_top_build_prefix=3D.*|at_top_build_prefix=3D'"'"'../'"'"'|g'=
 /home/jnolla/armada38x-bsp-3/build/tmp/work/cortexa9hf-vfp-neon-poky-linux=
-gnueabi/openvswitch/2.5.0+8c0b419a0b9ac0141d6973dcc80306dfc6a83d31-r0/imag=
e/usr/lib/openvswitch/ptest/tests/atconfig

| sed -i 's|^\(.*config\.log.*\)|#\1|g' /home/jnolla/armada38x-bsp-3/build/=
tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openvswitch/2.5.0+8c0b419a0=
b9ac0141d6973dcc80306dfc6a83d31-r0/image/usr/lib/openvswitch/ptest/tests/te=
stsuite

| sed: can't read /home/jnolla/armada38x-bsp-3/build/tmp/work/cortexa9hf-vf=
p-neon-poky-linux-gnueabi/openvswitch/2.5.0+8c0b419a0b9ac0141d6973dcc80306d=
fc6a83d31-r0/image/usr/lib/openvswitch/ptest/tests/testsuite: No such file =
or directory

| make: *** [test-install] Error 2

| ERROR: oe_runmake failed

| WARNING: exit code 1 from a shell command.

| ERROR: Function failed: do_install_ptest_base (log file is located at /ho=
me/jnolla/armada38x-bsp-3/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnu=
eabi/openvswitch/2.5.0+8c0b419a0b9ac0141d6973dcc80306dfc6a83d31-r0/temp/log=
.do_install_ptest_base.29782)

$<50>ERROR: Task 705 (/home/jnolla/armada38x-bsp-3/sources/meta-virtualizat=
ion/recipes-networking/openvswitch/openvswitch_git.bb, do_install_ptest_bas=
e) failed with exit code '1'

$<50>NOTE: Tasks Summary: Attempted 2472 tasks of which 2456 didn't need to=
 be rerun and 1 failed.

--_000_CY1PR20MB0171AC94ADB1FAFD84630197A9D40CY1PR20MB0171namp_
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
-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi Team,</p>
<p><br>
</p>
<p>I'm trying to build&nbsp;openvswitch 2.5.0 but I'm getting the following=
 error. Could someone take a look and let me know what might be the issue?<=
/p>
<p><br>
</p>
<p>Thank you!</p>
<p><br>
</p>
<p>| sed -i 's|at_top_srcdir=3D.*|at_top_srcdir=3D'&quot;'&quot;'..'&quot;'=
&quot;'|g' /home/jnolla/armada38x-bsp-3/build/tmp/work/cortexa9hf-vfp-neon-=
poky-linux-gnueabi/openvswitch/2.5.0&#43;8c0b419a0b9ac0141d6973dcc80306dfc6=
a83d31-r0/image/usr/lib/openvswitch/ptest/tests/atconfig</p>
<p>| sed -i 's|at_top_build_prefix=3D.*|at_top_build_prefix=3D'&quot;'&quot=
;'../'&quot;'&quot;'|g' /home/jnolla/armada38x-bsp-3/build/tmp/work/cortexa=
9hf-vfp-neon-poky-linux-gnueabi/openvswitch/2.5.0&#43;8c0b419a0b9ac0141d697=
3dcc80306dfc6a83d31-r0/image/usr/lib/openvswitch/ptest/tests/atconfig</p>
<p>| sed -i 's|^\(.*config\.log.*\)|#\1|g' /home/jnolla/armada38x-bsp-3/bui=
ld/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openvswitch/2.5.0&#43;8c=
0b419a0b9ac0141d6973dcc80306dfc6a83d31-r0/image/usr/lib/openvswitch/ptest/t=
ests/testsuite</p>
<p>| sed: can't read /home/jnolla/armada38x-bsp-3/build/tmp/work/cortexa9hf=
-vfp-neon-poky-linux-gnueabi/openvswitch/2.5.0&#43;8c0b419a0b9ac0141d6973dc=
c80306dfc6a83d31-r0/image/usr/lib/openvswitch/ptest/tests/testsuite: No suc=
h file or directory</p>
<p>| make: *** [test-install] Error 2</p>
<p>| ERROR: oe_runmake failed</p>
<p>| WARNING: exit code 1 from a shell command.</p>
<p>| ERROR: Function failed: do_install_ptest_base (log file is located at =
/home/jnolla/armada38x-bsp-3/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-=
gnueabi/openvswitch/2.5.0&#43;8c0b419a0b9ac0141d6973dcc80306dfc6a83d31-r0/t=
emp/log.do_install_ptest_base.29782)</p>
<p>$&lt;50&gt;ERROR: Task 705 (/home/jnolla/armada38x-bsp-3/sources/meta-vi=
rtualization/recipes-networking/openvswitch/openvswitch_git.bb, do_install_=
ptest_base) failed with exit code '1'</p>
<p>$&lt;50&gt;NOTE: Tasks Summary: Attempted 2472 tasks of which 2456 didn'=
t need to be rerun and 1 failed.</p>
</div>
</body>
</html>

--_000_CY1PR20MB0171AC94ADB1FAFD84630197A9D40CY1PR20MB0171namp_--
