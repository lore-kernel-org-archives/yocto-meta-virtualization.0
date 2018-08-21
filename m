Return-Path: <mac1g12@soton.ac.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25CC8E00566; Wed, 22 Aug 2018 20:51:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.2.74 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 45010 seconds by postgrey-1.32 at yocto-www;
	Wed, 22 Aug 2018 20:51:55 PDT
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0074.outbound.protection.outlook.com [104.47.2.74])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81799E00529
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Aug 2018 20:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sotonac.onmicrosoft.com; s=selector1-soton-ac-uk;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HlSGoNqOz4+CR0iWMo0zVaGVUJqgYtpyWlQUIAg9A08=;
	b=l8PGoOpUP/v802IUsLsfVEv9MH3LVesuPFR4LuDNKWxhGM1s7KirWIXUM2rTC6WITQWs0PdJAr5gf1NL7Z8tErgWtk3nb/wvZ0wudaKgB5rH8FzVoEr2hNYuM6/KZPefQ5c8uGTtSeP0XLlHN/k99gaOMhvka/xJyxw626vp5Nk=
Received: from AM5PR0402MB2802.eurprd04.prod.outlook.com (10.175.41.20) by
	AM5PR0402MB2785.eurprd04.prod.outlook.com (10.175.41.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1059.22; Tue, 21 Aug 2018 16:49:54 +0000
Received: from AM5PR0402MB2802.eurprd04.prod.outlook.com
	([fe80::90af:f6f5:71f3:c6d1]) by
	AM5PR0402MB2802.eurprd04.prod.outlook.com
	([fe80::90af:f6f5:71f3:c6d1%4]) with mapi id 15.20.1059.023;
	Tue, 21 Aug 2018 16:49:54 +0000
From: Apetroaie-Cristea M. <mac1g12@soton.ac.uk>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Docker daemon not starting on Raspberry Pi 3
Thread-Index: AQHUOW78M+NS8wi4X0ylr4N7JEio5g==
Date: Tue, 21 Aug 2018 16:49:54 +0000
Message-ID: <128A9675-00C5-43FA-9C47-D37E1E4E2447@soton.ac.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mac1g12@soton.ac.uk; 
x-originating-ip: [152.78.132.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2785;
	6:gqtmpnPqSzmmnUUgB2Ra4iEBVRVfnCBRbu775qGH1RvGstKqlWGQ+m/xES6PRCUV1HWlSPvDx3LNs5INuYYk7PjlZyz/SSCRMr//gBF2U3ZrsRQhMh/4KsZrkLdejvNRNXvHtAjOzUQ1M4Th+710WNx3cmNo5fDVoKFR0wNYFlVVDZ3Kg52Ffh/Y1JevLn8WWsTREbJZcqXBFciXA6RdYhuTBQPeAjGF+4+lAXS0X98wN7P3WIwLCMvbZ/BXYwmHtqdHuGPDgp2fwPr3Bo+5vQGYxDJT+H8fskd/bPWXy+VQxQ2o4xTL+P5Y5bz0wDOY3K1EY9qXWPXnBD8EftxEp0+EQteIfUfPiXUbRtljP2uuYcy0u34LCGY5qUrqDK+/T+xUIiflGB7vvd0GSp8OaDMoEtErvbzpk3vfMNIRRNKI5DoODNBbYeiO4WOdO/tcC730O6IvU/D1GoBFRGlqnw==;
	5:suLhOFd9mSx2xEVxKOyZoRh1sGuYsPf17XRGpwyKfUHwQevmVwP4/qc9/LsheydN5w8OlzFsv1h8H2wJZsC59K8v4N3AiaEBwX0f6nOofO0TcClSfVmL7DX3TaSCe1vp4g1jCZveEpb6KipgPKX1RjXSgYeL91PgJtElZ8+9Nww=;
	7:I8Kj8LBgjDejSCPYK71KTvwYtiLhQdSDa4r9aRTE4gmN1rAbfk4rFp4T3DWOf9nM278f5IKJWa1SB74ITyDPxeH7+Xj9VqV0xNnqGYnPlSJIwpve76V9jvvy/OeZJ9pRtCoY8Gym1ZVSjrq/vJkT0wX5bWTNiBiPultZKBCCwMqPrruBUZNdW7QRgqxaOJuiGAfTMbBxJ7f5wIFz4eJpJZYkvy3BdCgud+BmXxy2zeFOCnEJhjy+BKTMj0J6lfSV
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9cf99e9e-bdfd-4555-cb80-08d607861f0e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2785; 
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2785:|AM5PR0402MB2785:
x-microsoft-antispam-prvs: <AM5PR0402MB2785AFC2A03EABD233437F14B5310@AM5PR0402MB2785.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281529075)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699016);
	SRVR:AM5PR0402MB2785; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2785; 
x-forefront-prvs: 0771670921
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(99286004)(81156014)(8936002)(8676002)(81166006)(68736007)(2906002)(86362001)(66066001)(2351001)(6506007)(33656002)(26005)(6116002)(2616005)(3846002)(102836004)(74482002)(5660300001)(105586002)(106356001)(6916009)(14444005)(786003)(316002)(486006)(14454004)(478600001)(36756003)(186003)(53936002)(236005)(2900100001)(54896002)(6512007)(476003)(83716003)(82746002)(25786009)(97736004)(6436002)(6486002)(5250100002)(2501003)(5640700003)(7736002)(256004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2785;
	H:AM5PR0402MB2802.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:3; A:0; 
received-spf: None (protection.outlook.com: soton.ac.uk does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: ElHOodL9QwMOCI9OALGYM7rJ3Eucf9D08N1Ju+Qp0vIFVqRLZdduXQrz0jYEWscTR09Z2UyHDuIsWMsopGu/eyX6c3IKc9QBvlrH20uYpmgGoxdZnrWxb7y6XtQesr2SiZbCUfg/tdbsgtJIQBk4YlEsjNrfU6VtKkhjKz65Vn3/kwkZdrRpfmB+epLG+ae8fU71SddACfamAjYmMGPuB4RgHCieo5tcN8bejgZkSG+ld7GZZGmxzQOzm4K2B3xKn6In752JTAm89t4QAIT9BndYQQufehyywFgD5G2b9e0oCVoI8lkL9shUJfzZ7GLeG6ihdq4SnZY4+tVHY5sTL8qlWYkg5paDH9Qx/5Rspx0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf99e9e-bdfd-4555-cb80-08d607861f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2018 16:49:54.5897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a5378f9-29f4-4d3e-be89-669d03ada9d8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2785
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2785;
	23:AoDVmJXVd73b9WhsZQX3uAi7H46EgOITxPxZuRlgEvMeHNsTjhHp0sYmwsFybBd5apoudhdf1cxjB2rO/Fpz0Xn3eEmMcukqQ/IqIfBLfwQM6SNq4ZSFxdSu2pZhnCh8uT0uqI2VwP5D00868QVUeg==
X-OriginatorOrg: soton.ac.uk
Subject: Docker daemon not starting on Raspberry Pi 3
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
X-List-Received-Date: Thu, 23 Aug 2018 03:51:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_128A967500C543FA9C47D37E1E4E2447sotonacuk_"

--_000_128A967500C543FA9C47D37E1E4E2447sotonacuk_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to build a docker enabled image for Raspberry pi using the meta=
-virtualization layer, sumo branch. The image builds, but when I try to run=
 docker on the pi I get the following error:

Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the =
docker daemon running?


When running $dockerd, I get the following errors:

root@raspberrypi3:~# dockerd
INFO[2018-08-21T16:42:43.735133756Z] libcontainerd: started new docker-cont=
ainerd process  pid=3D1281
INFO[0000] starting containerd                           module=3Dcontainer=
d revision=3Dcfd04396dc68220d1cecbe686a6cc3aa5ce3667c.m version=3Dv1.0.2.m
INFO[0000] loading plugin "io.containerd.content.v1.content"...  module=3Dc=
ontainerd type=3Dio.containerd.content.v1
INFO[0000] loading plugin "io.containerd.snapshotter.v1.overlayfs"...  modu=
le=3Dcontainerd type=3Dio.containerd.snapshotter.v1
INFO[0000] loading plugin "io.containerd.metadata.v1.bolt"...  module=3Dcon=
tainerd type=3Dio.containerd.metadata.v1
INFO[0000] loading plugin "io.containerd.differ.v1.walking"...  module=3Dco=
ntainerd type=3Dio.containerd.differ.v1
INFO[0000] loading plugin "io.containerd.gc.v1.scheduler"...  module=3Dcont=
ainerd type=3Dio.containerd.gc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.containers"...  module=3Dc=
ontainerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.content"...  module=3Dcont=
ainerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.diff"...  module=3Dcontain=
erd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.events"...  module=3Dconta=
inerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.healthcheck"...  module=3D=
containerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.images"...  module=3Dconta=
inerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.leases"...  module=3Dconta=
inerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.namespaces"...  module=3Dc=
ontainerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.snapshots"...  module=3Dco=
ntainerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.monitor.v1.cgroups"...  module=3Dc=
ontainerd type=3Dio.containerd.monitor.v1
INFO[0000] loading plugin "io.containerd.runtime.v1.linux"...  module=3Dcon=
tainerd type=3Dio.containerd.runtime.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.tasks"...  module=3Dcontai=
nerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.version"...  module=3Dcont=
ainerd type=3Dio.containerd.grpc.v1
INFO[0000] loading plugin "io.containerd.grpc.v1.introspection"...  module=
=3Dcontainerd type=3Dio.containerd.grpc.v1
INFO[0000] serving...                                    address=3D"/var/ru=
n/docker/containerd/docker-containerd-debug.sock" module=3D"containerd/debu=
g"
INFO[0000] serving...                                    address=3D"/var/ru=
n/docker/containerd/docker-containerd.sock" module=3D"containerd/grpc"
INFO[0000] containerd successfully booted in 0.023991s   module=3Dcontainer=
d
ERRO[2018-08-21T16:42:43.989165300Z] Failed to built-in GetDriver graph btr=
fs /var/lib/docker
ERRO[2018-08-21T16:42:44.002937386Z] 'overlay' not found as a supported fil=
esystem on this host. Please ensure kernel is new enough and has overlay su=
pport loaded.
ERRO[2018-08-21T16:42:44.025624033Z] 'overlay' not found as a supported fil=
esystem on this host. Please ensure kernel is new enough and has overlay su=
pport loaded.
ERRO[2018-08-21T16:42:44.026525661Z] Failed to built-in GetDriver graph dev=
icemapper /var/lib/docker
INFO[2018-08-21T16:42:44.054916094Z] Graph migration to content-addressabil=
ity took 0.00 seconds
WARN[2018-08-21T16:42:44.056984615Z] Your kernel does not support cgroup me=
mory limit
WARN[2018-08-21T16:42:44.057659885Z] Your kernel does not support cgroup cf=
s period
WARN[2018-08-21T16:42:44.058345781Z] Your kernel does not support cgroup cf=
s quotas
WARN[2018-08-21T16:42:44.058842247Z] Your kernel does not support cgroup rt=
 period
WARN[2018-08-21T16:42:44.059354130Z] Your kernel does not support cgroup rt=
 runtime
WARN[2018-08-21T16:42:44.060948686Z] mountpoint for pids not found
INFO[2018-08-21T16:42:44.064498271Z] Loading containers: start.
WARN[2018-08-21T16:42:44.077446385Z] Running modprobe bridge br_netfilter f=
ailed with message: modprobe: WARNING: Module br_netfilter not found in dir=
ectory /lib/modules/4.14.39
, error: exit status 1
WARN[2018-08-21T16:42:44.570023626Z] Could not load necessary modules for C=
onntrack: Running modprobe nf_conntrack_netlink failed with message: `modpr=
obe: WARNING: Module nf_conntrack_netlink not found in directory /lib/modul=
es/4.14.39`, error: exit status 1
INFO[2018-08-21T16:42:44.571706412Z] Default bridge (docker0) is assigned w=
ith an IP address 172.17.0.0/16. Daemon option --bip can be used to set a p=
referred IP address
Error starting daemon: Error initializing network controller: Error creatin=
g default "bridge" network: Failed to program NAT chain: Failed to inject D=
OCKER in PREROUTING chain: iptables failed: iptables --wait -t nat -A PRERO=
UTING -m addrtype --dst-type LOCAL -j DOCKER: iptables: No chain/target/mat=
ch by that name.
 (exit status 1)


Does anyone know how to solve this problem? Thank you!

--_000_128A967500C543FA9C47D37E1E4E2447sotonacuk_
Content-Type: text/html; charset="us-ascii"
Content-ID: <16620D793D131340890EFFC8AA26A2C7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hello,&nbsp;
<div class=3D""><br class=3D"">
</div>
<div class=3D"">I am trying to build a docker enabled image for Raspberry p=
i using the meta-virtualization layer, sumo branch. The image builds, but w=
hen I try to run docker on the pi I get the following error:</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Cann=
ot connect to the Docker daemon at
<a href=3D"unix:///var/run/docker.sock" class=3D"">unix:///var/run/docker.s=
ock</a>. Is the docker daemon running?</span></div>
</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D"">
</span></div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<br class=3D"">
</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px;" class=3D"">When ru=
nning $dockerd, I get the following errors:</span></div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px;" class=3D""><br cla=
ss=3D"">
</span></div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">root@raspberrypi3:~# dockerd</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
33bbc8" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:43.735133756Z]
 libcontainerd: started new docker-containerd process&nbsp; </span><span st=
yle=3D"font-variant-ligatures: no-common-ligatures; color: #33bbc8" class=
=3D"">pid</span><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D"">=3D1281</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] starting containerd
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; </span><span style=3D"font-variant-ligatures: no-common-li=
gatures; color: #5230e1" class=3D"">module</span><span style=3D"font-varian=
t-ligatures: no-common-ligatures" class=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">revision</span><span style=3D"font-variant-ligatures: no=
-common-ligatures" class=3D"">=3Dcfd04396dc68220d1cecbe686a6cc3aa5ce3667c.m
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">version</span><span style=3D"font-variant-ligatures: no-=
common-ligatures" class=3D"">=3Dv1.0.2.m</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.content.v1.content&quot;...&nbsp; </span><span style=
=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D""=
>module</span><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.content.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.snapshotter.v1.overlayfs&quot;...&nbsp; </span><span s=
tyle=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=
=3D"">module</span><span style=3D"font-variant-ligatures: no-common-ligatur=
es" class=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.snapshotter.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.metadata.v1.bolt&quot;...&nbsp; </span><span style=3D"=
font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">mod=
ule</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.metadata.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.differ.v1.walking&quot;...&nbsp; </span><span style=3D=
"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">mo=
dule</span><span style=3D"font-variant-ligatures: no-common-ligatures" clas=
s=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.differ.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.gc.v1.scheduler&quot;...&nbsp; </span><span style=3D"f=
ont-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">modu=
le</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.gc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.containers&quot;...&nbsp; </span><span style=
=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D""=
>module</span><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.content&quot;...&nbsp; </span><span style=3D"f=
ont-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">modu=
le</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.diff&quot;...&nbsp; </span><span style=3D"font=
-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">module<=
/span><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"=
">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.events&quot;...&nbsp; </span><span style=3D"fo=
nt-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">modul=
e</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.healthcheck&quot;...&nbsp; </span><span style=
=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D""=
>module</span><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.images&quot;...&nbsp; </span><span style=3D"fo=
nt-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">modul=
e</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.leases&quot;...&nbsp; </span><span style=3D"fo=
nt-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">modul=
e</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.namespaces&quot;...&nbsp; </span><span style=
=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D""=
>module</span><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.snapshots&quot;...&nbsp; </span><span style=3D=
"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">mo=
dule</span><span style=3D"font-variant-ligatures: no-common-ligatures" clas=
s=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.monitor.v1.cgroups&quot;...&nbsp; </span><span style=
=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D""=
>module</span><span style=3D"font-variant-ligatures: no-common-ligatures" c=
lass=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.monitor.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.runtime.v1.linux&quot;...&nbsp; </span><span style=3D"=
font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">mod=
ule</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.runtime.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.tasks&quot;...&nbsp; </span><span style=3D"fon=
t-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">module=
</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.version&quot;...&nbsp; </span><span style=3D"f=
ont-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">modu=
le</span><span style=3D"font-variant-ligatures: no-common-ligatures" class=
=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] loading plugin
 &quot;io.containerd.grpc.v1.introspection&quot;...&nbsp; </span><span styl=
e=3D"font-variant-ligatures: no-common-ligatures; color: #5230e1" class=3D"=
">module</span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">=3Dcontainerd
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">type</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">=3Dio.containerd.grpc.v1</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] serving...&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"font-var=
iant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">address</sp=
an><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">=
=3D&quot;/var/run/docker/containerd/docker-containerd-debug.sock&quot;
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">module</span><span style=3D"font-variant-ligatures: no-c=
ommon-ligatures" class=3D"">=3D&quot;containerd/debug&quot;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] serving...&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"font-var=
iant-ligatures: no-common-ligatures; color: #5230e1" class=3D"">address</sp=
an><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">=
=3D&quot;/var/run/docker/containerd/docker-containerd.sock&quot;
</span><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">module</span><span style=3D"font-variant-ligatures: no-c=
ommon-ligatures" class=3D"">=3D&quot;containerd/grpc&quot;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
5230e1" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[0000] containerd
 successfully booted in 0.023991s &nbsp; </span><span style=3D"font-variant=
-ligatures: no-common-ligatures; color: #5230e1" class=3D"">module</span><s=
pan style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">=3Dcon=
tainerd</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
c33720" class=3D"">ERRO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:43.989165300Z]
 Failed to built-in GetDriver graph btrfs /var/lib/docker&nbsp;</span></div=
>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
c33720" class=3D"">ERRO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.002937386Z]
 'overlay' not found as a supported filesystem on this host. Please ensure =
kernel is new enough and has overlay support loaded.&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
c33720" class=3D"">ERRO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.025624033Z]
 'overlay' not found as a supported filesystem on this host. Please ensure =
kernel is new enough and has overlay support loaded.&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
c33720" class=3D"">ERRO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.026525661Z]
 Failed to built-in GetDriver graph devicemapper /var/lib/docker&nbsp;</spa=
n></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
33bbc8" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.054916094Z]
 Graph migration to content-addressability took 0.00 seconds&nbsp;</span></=
div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.056984615Z]
 Your kernel does not support cgroup memory limit&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.057659885Z]
 Your kernel does not support cgroup cfs period&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.058345781Z]
 Your kernel does not support cgroup cfs quotas&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.058842247Z]
 Your kernel does not support cgroup rt period&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.059354130Z]
 Your kernel does not support cgroup rt runtime&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.060948686Z]
 mountpoint for pids not found &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
33bbc8" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.064498271Z]
 Loading containers: start.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.077446385Z]
 Running modprobe bridge br_netfilter failed with message: modprobe: WARNIN=
G: Module br_netfilter not found in directory /lib/modules/4.14.39</span></=
div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">, error: exit status 1&nbsp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
afad24" class=3D"">WARN</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.570023626Z]
 Could not load necessary modules for Conntrack: Running modprobe nf_conntr=
ack_netlink failed with message: `modprobe: WARNING: Module nf_conntrack_ne=
tlink not found in directory /lib/modules/4.14.39`, error: exit status 1&nb=
sp;</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; color: #=
33bbc8" class=3D"">INFO</span><span style=3D"font-variant-ligatures: no-com=
mon-ligatures" class=3D"">[2018-08-21T16:42:44.571706412Z]
 Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Dae=
mon option --bip can be used to set a preferred IP address&nbsp;</span></di=
v>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">Error starting daemon: Error initializing network controller: Error crea=
ting default &quot;bridge&quot; network: Failed to
 program NAT chain: Failed to inject DOCKER in PREROUTING chain: iptables f=
ailed: iptables --wait -t nat -A PREROUTING -m addrtype --dst-type LOCAL -j=
 DOCKER: iptables: No chain/target/match by that name.</span></div>
<div style=3D"margin: 0px; font-stretch: normal; line-height: normal;" clas=
s=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" class=3D=
"">&nbsp;(exit status 1)</span></div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px;" class=3D""><br cla=
ss=3D"">
</span></div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo; background-color: rgb(255, 255, 255);" clas=
s=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px;" class=3D"">Does an=
yone know how to solve this problem? Thank you!</span></div>
</body>
</html>

--_000_128A967500C543FA9C47D37E1E4E2447sotonacuk_--
