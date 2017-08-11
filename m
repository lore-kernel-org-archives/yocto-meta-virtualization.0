Return-Path: <mobahbay@outlook.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FC7EE00C7B; Fri, 11 Aug 2017 20:01:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (mobahbay[at]outlook.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust *      [40.92.8.28 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 26464 seconds by postgrey-1.32 at yocto-www;
	Fri, 11 Aug 2017 20:01:07 PDT
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-oln040092008028.outbound.protection.outlook.com [40.92.8.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54EBBE00C31
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Aug 2017 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=B7sYqOB8+69UI7gvTbLoN9ElYoWMspS8jjhg7V6HmBw=;
	b=M9BHypc6B1oD205VxFxPWTo2/IeFrV2SpJqDzCiYhdErwjk4YsedMC3EnhPVciePcO0r9RLv37KdwB9DYYIxN5miCtTcJZktLbaPQaXI2DLuCO7fXaF/IhWjRbtHxlPc2B79FzUii6y3ZqPf5twlsZAkf1u2VEiYVLwpKCaice5e5B8a3alboZbH6jELaC2jQUlnJKj45K/VPa8sNy96GbhsVe/evcV+AGzaugyz/UkPSLOBtFTtukH1jUOI+mga2KLD81+reMNAbnDhuBkmleEQGsh3TF0+Y346t+awR5jV/9YhWalCGpmEO1O10DYdZwXcnmXRNKs+ITrKOM+XJQ==
Received: from CO1NAM03FT058.eop-NAM03.prod.protection.outlook.com
	(10.152.80.51) by CO1NAM03HT061.eop-NAM03.prod.protection.outlook.com
	(10.152.81.158) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1341.15;
	Fri, 11 Aug 2017 19:25:42 +0000
Received: from DM5PR12MB1548.namprd12.prod.outlook.com (10.152.80.53) by
	CO1NAM03FT058.mail.protection.outlook.com (10.152.81.107) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1341.15 via Frontend Transport; Fri, 11 Aug 2017 19:25:42 +0000
Received: from DM5PR12MB1548.namprd12.prod.outlook.com ([10.172.37.23]) by
	DM5PR12MB1548.namprd12.prod.outlook.com ([10.172.37.23]) with mapi id
	15.01.1341.019; Fri, 11 Aug 2017 19:25:42 +0000
From: Mo Bah <mobahbay@outlook.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: meta-virtualization branch to use for xen-image-minimal
Thread-Index: AQHTEtXgFT5pfUyemEqLj+dCxLUPjg==
Date: Fri, 11 Aug 2017 19:25:42 +0000
Message-ID: <DM5PR12MB154859E8836C5AC6A4884F9ECF890@DM5PR12MB1548.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C6BA0FC2EE5124AF61417EEF2E85C9B86A7FFABFB226110486F77B2F7A1F47B9;
	UpperCasedChecksum:9152C1A253300D2FE21281EDA96BEF7A4C6C6EF5EEF651FBCCDBE4DD4AA278BC;
	SizeAsReceived:7059; Count:43
x-tmn: [XL//q2L2tgQFOS7nFn4gU95QEMgYVLqj]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO1NAM03HT061;
	6:lCUC2z2tVsnnStozElrN8iF74mzWvfi5I8gPjF9ka4R8BeU4BP8gu0HDui+txl4XOc1GvB7WyK+9YeNmyjrFfzKOoW+8o3B0VDhVqfJh3Q9chuXc2R/2vzW5Y4vZU14ab9z9UceZ0Qu+6jm6d6fsK3NmZ1xWO1NssQNw5De7UQt+ZCfEPOJp/3cPlnVPy/yNXOz9/InWkscJCNTLUzoR6h2Rfb/LDnDMPJL8TihSzzGqvRtbWho5k8/faKaQ1lSuFTWpg7UAXfQDtXNCfZHj5gfsjeFz9ahcMcWSExnQ0/r3g09uiXwTs+Pi4VtZ3j2NeoCMmqSIMx/ZrANkfZutZA==;
	5:AQm82h9h1UQ7DOsgQAVQtA8Qw2neuFJ+rGCuxhh55ZHQwwzgJgJvevh4JWoeZtKXcCTkTHI0hcaL6Hxn6yHFGkCjSQ1hTVjsdRFxcwaoMTS0RjBIMEvF+T0ykwut3ggoqFjkso/5KBs3QcJROKIO3g==;
	24:m4ni6U9ly7R1K6p9pZcTP9OOPdJlMQziYaYVs1UXpFzX4epaKB7EXqB0NWRHhjG18JYiAF1soPiNKFECke0jvDTqvoNVSuMpo8Ibe8YOvVY=;
	7:0nHfP7B1GmDdq3BMYB2vg5Ag32iBlJdQ6gnDDvYFHwI8+Jn4OYLR780fkw0JqC4rh88Bg7TTTYwn0CrU9n28LcvbVYcUgeZLOdkH4B9UhZAGByubUKgMWlQW5r1qMZbw4Z6PrLGIii4vWUpPAK2sLg40a/DOqWFeee9ensZMq9ACwpmMZymFJ9PxmnD+B/bFSUrgeW4dVFMB9M4RPVArkvW4UW+6lpxCVOvjcMNQzvg=
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:CO1NAM03HT061;
	H:DM5PR12MB1548.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:;
x-ms-office365-filtering-correlation-id: 154d8941-bb4d-494b-84bb-08d4e0eec1ac
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322377)(1601125374)(1603101448)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CO1NAM03HT061; 
x-ms-traffictypediagnostic: CO1NAM03HT061:
authentication-results: outbound.protection.outlook.com; spf=skipped
	(originating message); dkim=none (message not signed) header.d=none;
	dmarc=none action=none header.from=outlook.com;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:CO1NAM03HT061; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CO1NAM03HT061; 
x-forefront-prvs: 03965EFC76
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2017 19:25:42.0979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM03HT061
Subject: meta-virtualization branch to use for xen-image-minimal
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
X-List-Received-Date: Sat, 12 Aug 2017 03:01:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB154859E8836C5AC6A4884F9ECF890DM5PR12MB1548namp_"

--_000_DM5PR12MB154859E8836C5AC6A4884F9ECF890DM5PR12MB1548namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I am trying to build xen-image-minimal out of Yocto and I did checkout of t=
he master branch of the meta-virtualization layer.


But when doing, 'bitbake xen-image-minimal', I am seeing the following erro=
r.


| make[5]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/cpu'
| make[4]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86'
| /home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xe=
n-4.8.0/xen/Rules.mk:166: recipe for target '/home/m/grxen/poky/build/tmp-g=
libc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/built_in.o'=
 failed
| make[3]: *** [/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/x=
en/4.8.0-r0/xen-4.8.0/xen/arch/x86/built_in.o] Error 2
| make[3]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86'
| Makefile:135: recipe for target '/home/m/grxen/poky/build/tmp-glibc/work/=
core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/xen' failed
| make[2]: *** [/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/x=
en/4.8.0-r0/xen-4.8.0/xen/xen] Error 2
| make[2]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen'
| Makefile:45: recipe for target 'install' failed
| make[1]: *** [install] Error 2
| make[1]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen'
| Makefile:97: recipe for target 'install-xen' failed
| make: *** [install-xen] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/m/grxen/=
poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/temp/log.do_compil=
e.30351)
ERROR: Task (/home/m/grxen/poky/meta-virtualization/recipes-extended/xen/xe=
n_4.8.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2081 tasks of which 1387 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /home/m/grxen/poky/meta-virtualization/recipes-extended/xen/xen_4.8.0.bb:=
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Is the master branch of meta-virtualization layer having issues with 'xen-i=
mage-minimal'?

I tried the 'bitbake xen-image-minimal' by putting the 'MACHINE ?=3D "intel=
-corei7-64" and MACHINE ?=3D "genericx86-64" and DISTRO_FEATURES_append =3D=
 " xen" in the conf/local.conf.

And the bblayers.conf looks like:
BBLAYERS ?=3D " \
  /home/m/grxen/poky/meta \
  /home/m/grxen/poky/meta-poky \
  /home/m/grxen/poky/meta-yocto-bsp \
  /home/m/grxen/poky/meta-openembedded/meta-oe \
  /home/m/grxen/poky/meta-openembedded/meta-python \
  /home/m/grxen/poky/meta-openembedded/meta-networking \
  /home/m/grxen/poky/meta-openembedded/meta-filesystems \
  /home/m/grxen/poky/meta-virtualization \
  /home/m/grxen/poky/oe-meta-go \
  /home/m/grxen/poky/openembedded-core/meta \
  /home/m/grxen/poky/openembedded-core/meta-selftest \
  /home/m/grxen/poky/openembedded-core/meta-skeleton \
  /home/m/grxen/poky/meta-selinux \
  "

And all the layers have been downloaded as per documentation mentioned in h=
ttp://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/

meta-virtualization - Layer enabling hypervisor ...<http://git.yoctoproject=
.org/cgit/cgit.cgi/meta-virtualization/about/>
git.yoctoproject.org
Layer enabling hypervisor, virtualization tool stack, and cloud support. gi=
t repository hosting

Could you suggest which branch of meta-virtualization would work for 'xen-i=
mage-minimal' while doing bitbake?
Currently, I am trying with git checkout -b krogoth origin/krogoth branch.

Thanks
M


























--_000_DM5PR12MB154859E8836C5AC6A4884F9ECF890DM5PR12MB1548namp_
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
Hi Everyone,
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri,Helvetica,sans-serif,&quot;EmojiFont&quot;,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Seg=
oe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;" dir=3D"ltr">
<p>I am trying to build xen-image-minimal out of Yocto and I did checkout o=
f the master branch of the meta-virtualization layer.
<br>
</p>
<p><br>
</p>
<p>But when doing, 'bitbake xen-image-minimal', I am seeing the following e=
rror.</p>
<p><br>
</p>
<div><b>| make[5]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/wo=
rk/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/cpu'<br>
| make[4]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86'<br>
| /home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xe=
n-4.8.0/xen/Rules.mk:166: recipe for target '/home/m/grxen/poky/build/tmp-g=
libc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/built_in.o'=
 failed<br>
| make[3]: *** [/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/x=
en/4.8.0-r0/xen-4.8.0/xen/arch/x86/built_in.o] Error 2<br>
| make[3]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86'<br>
| Makefile:135: recipe for target '/home/m/grxen/poky/build/tmp-glibc/work/=
core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/xen' failed<br>
| make[2]: *** [/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/x=
en/4.8.0-r0/xen-4.8.0/xen/xen] Error 2<br>
| make[2]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen'<br>
| Makefile:45: recipe for target 'install' failed<br>
| make[1]: *** [install] Error 2<br>
| make[1]: Leaving directory '/home/m/grxen/poky/build/tmp-glibc/work/core2=
-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen'<br>
| Makefile:97: recipe for target 'install-xen' failed<br>
| make: *** [install-xen] Error 2<br>
| ERROR: oe_runmake failed<br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_compile (log file is located at /home/m/grxen/=
poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/temp/log.do_compil=
e.30351)<br>
ERROR: Task (/home/m/grxen/poky/meta-virtualization/recipes-extended/xen/xe=
n_4.8.0.bb:do_compile) failed with exit code '1'<br>
NOTE: Tasks Summary: Attempted 2081 tasks of which 1387 didn't need to be r=
erun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
&nbsp; /home/m/grxen/poky/meta-virtualization/recipes-extended/xen/xen_4.8.=
0.bb:do_compile<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
</b></div>
<br>
Is the master branch of meta-virtualization layer having issues with 'xen-i=
mage-minimal'?
<br>
<br>
I tried the 'bitbake xen-image-minimal' by putting the <b>'<span>MACHINE ?=
=3D &quot;intel-corei7-64</span>&quot;</b> and
<span><b>MACHINE ?=3D &quot;genericx86-64&quot; </b>and <span><span><b>DIST=
RO_FEATURES_append =3D &quot; xen&quot;</b></span></span>
<b></b>in the conf/local.conf.<br>
<br>
And the bblayers.conf looks like:<br>
<div>BBLAYERS ?=3D &quot; \<br>
&nbsp; /home/m/grxen/poky/meta \<br>
&nbsp; /home/m/grxen/poky/meta-poky \<br>
&nbsp; /home/m/grxen/poky/meta-yocto-bsp \<br>
&nbsp; /home/m/grxen/poky/meta-openembedded/meta-oe \ <br>
&nbsp; /home/m/grxen/poky/meta-openembedded/meta-python \ <br>
&nbsp; /home/m/grxen/poky/meta-openembedded/meta-networking \ <br>
&nbsp; /home/m/grxen/poky/meta-openembedded/meta-filesystems \ <br>
&nbsp; /home/m/grxen/poky/meta-virtualization \<br>
&nbsp; /home/m/grxen/poky/oe-meta-go \<br>
&nbsp; /home/m/grxen/poky/openembedded-core/meta \ <br>
&nbsp; /home/m/grxen/poky/openembedded-core/meta-selftest \<br>
&nbsp; /home/m/grxen/poky/openembedded-core/meta-skeleton \ <br>
&nbsp; /home/m/grxen/poky/meta-selinux \ <br>
&nbsp; &quot;<br>
</div>
<br>
And all the layers have been downloaded as per documentation mentioned in <=
a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/abo=
ut/" class=3D"OWAAutoLink" id=3D"LPlnk804212" previewremoved=3D"true">
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/</a> <b=
r>
<br>
<div id=3D"LPBorder_GT_15024542053840.22644516227267864" style=3D"margin-bo=
ttom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_15024542053710.3007271333312367" style=3D"width: 9=
0%; background-color: rgb(255, 255, 255); position: relative; overflow: aut=
o; padding-top: 20px; padding-bottom: 20px; margin-top: 20px; border-top: 1=
px dotted rgb(200, 200, 200); border-bottom: 1px dotted rgb(200, 200, 200);=
" role=3D"presentation" cellspacing=3D"0">
<tbody>
<tr style=3D"border-spacing: 0px;" valign=3D"top">
<td id=3D"TextCell_15024542053750.7529949949566461" style=3D"vertical-align=
: top; position: relative; padding: 0px; display: table-cell;" colspan=3D"2=
">
<div id=3D"LPRemovePreviewContainer_15024542053760.9021992851707933"></div>
<div id=3D"LPTitle_15024542053760.9987794121240315" style=3D"top: 0px; colo=
r: rgb(0, 120, 215); font-weight: 400; font-size: 21px; font-family: &quot;=
wf_segoe-ui_light&quot;,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quo=
t;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif; line-=
height: 21px;">
<a id=3D"LPUrlAnchor_15024542053790.9569886343941635" style=3D"text-decorat=
ion: none;" href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtuali=
zation/about/" target=3D"_blank">meta-virtualization - Layer enabling hyper=
visor ...</a></div>
<div id=3D"LPMetadata_15024542053810.9906985067008547" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: 400; font-family: &quot=
;wf_segoe-ui_normal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,=
Arial,sans-serif; font-size: 14px; line-height: 14px;">
git.yoctoproject.org</div>
<div id=3D"LPDescription_15024542053820.5467038874994977" style=3D"display:=
 block; color: rgb(102, 102, 102); font-weight: 400; font-family: &quot;wf_=
segoe-ui_normal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Aria=
l,sans-serif; font-size: 14px; line-height: 20px; max-height: 100px; overfl=
ow: hidden;">
Layer enabling hypervisor, virtualization tool stack, and cloud support. gi=
t repository hosting</div>
</td>
</tr>
</tbody>
</table>
</div>
Could you suggest which branch of meta-virtualization would work for 'xen-i=
mage-minimal' while doing bitbake?<br>
Currently, I am trying with <span>git checkout -b krogoth origin/krogoth</s=
pan> branch.<br>
<br>
Thanks<br>
M<br>
<br>
<br>
<br>
</span><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<p></p>
</div>
</body>
</html>

--_000_DM5PR12MB154859E8836C5AC6A4884F9ECF890DM5PR12MB1548namp_--
