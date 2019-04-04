Return-Path: <Filipe.Rinaldi@arm.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCF1AE00D21; Thu,  4 Apr 2019 13:06:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [40.107.13.49 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 43050 seconds by postgrey-1.32 at yocto-www;
	Thu, 04 Apr 2019 13:06:11 PDT
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18BA0E00D15
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Apr 2019 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nEYCo4gvtTv6si9TXhwfuC6oUQeyfPWy6apZAhKhaQY=;
	b=dHCpdySzfk96eO4JJUoC8gQNidaKBQ7FCdF5Y70YP4tdfxxaLa4zIsua0+9MJe+JIFER+6yNTHEHXNGI5xqOcIXh9DkQVoep52xRPZvSzlAU5eCI1zuaM5XGd68mNUll8CfNipsqP+lc71XBwYrx1fFkhV18E7VE1bld5+tr9KM=
Received: from AM6PR08MB3606.eurprd08.prod.outlook.com (20.177.115.89) by
	AM6PR08MB2949.eurprd08.prod.outlook.com (52.135.167.152) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.13; Thu, 4 Apr 2019 07:36:46 +0000
Received: from AM6PR08MB3606.eurprd08.prod.outlook.com
	([fe80::4dcb:176e:5cc2:6f2e]) by
	AM6PR08MB3606.eurprd08.prod.outlook.com
	([fe80::4dcb:176e:5cc2:6f2e%3]) with mapi id 15.20.1750.017;
	Thu, 4 Apr 2019 07:36:46 +0000
From: Filipe Rinaldi <Filipe.Rinaldi@arm.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Manjukumar Matha
	<manjukumar.harthikote-matha@xilinx.com>
Thread-Topic: Issues with 50cdecc sysvinit-inittab_xen.inc: fix hypervisor
	console
Thread-Index: AQHU6pgPkXVMldPFpUej15S2gb+NvA==
Date: Thu, 4 Apr 2019 07:36:46 +0000
Message-ID: <AM6PR08MB36060562D712E3220B157DDA8F500@AM6PR08MB3606.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Filipe.Rinaldi@arm.com; 
x-originating-ip: [147.50.13.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bf711fd-2ba9-4e6e-faaf-08d6b8d04a82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB2949; 
x-ms-traffictypediagnostic: AM6PR08MB2949:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM6PR08MB294979B99D1DE7D58EE414018F500@AM6PR08MB2949.eurprd08.prod.outlook.com>
x-forefront-prvs: 0997523C40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(346002)(376002)(136003)(396003)(40434004)(199004)(189003)(4326008)(8676002)(81156014)(81166006)(4744005)(6606003)(316002)(106356001)(72206003)(2501003)(86362001)(966005)(105586002)(19627405001)(110136005)(102836004)(478600001)(25786009)(71200400001)(99286004)(8936002)(6506007)(71190400001)(6436002)(26005)(186003)(7696005)(236005)(55016002)(6306002)(33656002)(2906002)(9686003)(74316002)(5660300002)(66066001)(68736007)(14454004)(52536014)(6116002)(606006)(3846002)(97736004)(476003)(486006)(5024004)(256004)(14444005)(7736002)(53936002)(54896002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB2949;
	H:AM6PR08MB3606.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m0nrb394iWiBU+KDBJk9IRmzRJJSj/I+Fz/c3UeaaBRwTXHxAumHXHPhJ8VoDfevSY2AnF7cDBevv6oJxRtRh+8hwOTmSY31QCninf3Y/V7U2V8RyLzQeBRGKLZWOIe27KeTPNu3mIM51ZrkWhuVam7zPzs2MjbeS/wHrqmQeUDAbPlJUPyUs8QQAJ/1PqPQ/3ginb/DkNjUHYhzF2ZEBlVWLnT5oEldiZNAc1XqgYPEVmV9vXG69GIIl9Z5IXl7jk8qKU5GlWjOZwGPe1ZlbzZosVvdeuE9k98zs02D+Kpm0P60G6ifbl25sLppexLvqtZh5emJZoHBIt9iApKuieleVaTY6kit83ruydeWhM+ysuhDx5UiU+Q9rd0c1Wg4IaTlC1mDP+kZU5GygFA0MK09U7+uEcDFmQ/lRXdZciw=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf711fd-2ba9-4e6e-faaf-08d6b8d04a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2019 07:36:46.1039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2949
Cc: Sathees Balya <Sathees.Balya@arm.com>
Subject: Issues with 50cdecc sysvinit-inittab_xen.inc: fix hypervisor console
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
X-List-Received-Date: Thu, 04 Apr 2019 20:06:13 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB36060562D712E3220B157DDA8F500AM6PR08MB3606eurp_"

--_000_AM6PR08MB36060562D712E3220B157DDA8F500AM6PR08MB3606eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


With regards commit "50cdecc sysvinit-inittab_xen.inc: fix hypervisor conso=
le"...


We are having issues with this patch. When using start_getty (a wrapper to =
getty) it will first check if the console device is a "serial" device drive=
r [1]. It then fails because hvc0 is a "system" device, not a "serial" [2].


[1] https://github.com/openembedded/openembedded-core/blob/master/meta/reci=
pes-core/sysvinit/sysvinit-inittab/start_getty#L11

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/tty/hvc/hvc_console.c#n1036


Any thoughts?


Cheers,

Filipe


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM6PR08MB36060562D712E3220B157DDA8F500AM6PR08MB3606eurp_
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
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,Helvetica,EmojiFont,&=
quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quo=
t;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-family: Cali=
bri, Helvetica, sans-serif, serif, EmojiFont;">Hi,</span><br>
</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
<br>
</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
With regards commit &quot;<span>50cdecc sysvinit-inittab_xen.inc: fix hyper=
visor console&quot;...</span></p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
<br>
</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
We are having issues with this patch.&nbsp;When using start_getty (a&nbsp;w=
rapper to getty) it will first check if the console device&nbsp;is a &quot;=
serial&quot; device driver [1]. It then fails because hvc0 is a &quot;syste=
m&quot; device, not a &quot;serial&quot; [2].</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
<br>
</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
[1]&nbsp;<a href=3D"https://github.com/openembedded/openembedded-core/blob/=
master/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty#L11" target=
=3D"_blank" rel=3D"noopener noreferrer">https://github.com/openembedded/ope=
nembedded-core/blob/master/meta/recipes-core/sysvinit/sysvinit-inittab/star=
t_getty#L11</a></p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
[2]&nbsp;<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/tree/drivers/tty/hvc/hvc_console.c#n1036" target=3D"_blank" rel=
=3D"noopener noreferrer">https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/tree/drivers/tty/hvc/hvc_console.c#n1036</a></p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
<br>
</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
Any thoughts?</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
<br>
</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
Cheers,</p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont; font-=
size:16px">
Filipe</p>
<br>
<p></p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM6PR08MB36060562D712E3220B157DDA8F500AM6PR08MB3606eurp_--
