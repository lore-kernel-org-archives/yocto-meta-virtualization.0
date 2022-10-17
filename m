Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D7DC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:16:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web09.39638.1666005368641496610
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Al8WTI4U;
 spf=pass (domain: siemens.com, ip: 40.107.22.72, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0LPqhRzfx//qLZxeWNC3+BFQ3btBHctFBQx0Z9qWTBDlVAp8b/P6HWI94pxzhU4sdrf2M94yO1/B8exl7wc/HlUwPZCazcieD+AYSlhLLWhYN/f1LMu+Tg45XbQ9RELwcdA7heWfs3i14JhcuskznN1zUHgxkd1P7rTd3KugSrepxUhMf/9nNjV+vaTUjvN4tJp8b6BB/rohN3LbHXftaUPyhk6eWvao4Rd+2ha1NzicYuyltuUddvNiiC5uFUGDRNdMGTxXCeeT/Eu2M1oV1vUuMsI8z2KxZbfPuQJPpws5n6cPpxJWRqRXgF6YzYyMS0/jYkro3LlxUDPLg/b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPAVe9EVJ0y9URRmYALmgF6ARPKU8DL3Snq73C5Ub9I=;
 b=O/dVl5rxg3NvCg2JM2fJn6FvwPZRii0DZCN3l/kFs97cgGR5JpLSEhm+N2PhfTZKXgT+b1/PhLpdN0YsleWcueh3GW2hFk2Q5ZYGVH78/oWIbF3xpOw3N1wZgN24LZQBPDTq1bAHvcDnl+nVu3QFK8HyaZ7ZyaRhiTKooeRwL39Yc0Xme6nUnvCUbR1kFzUcPh3nGOdlMmg/DKKElmeEV5tIy7bLpEPpDwWMwdfEiNSbOgOFFVDp0ZCKlSsoPGqtF6VhsHe/CFLoDDM1EDxhbRRsPVe4NRYahaZc2nkwFZK89D59eTpRyVmDsJ8Kk8ZS1qVRbqQi9HhWw+ulcDn3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPAVe9EVJ0y9URRmYALmgF6ARPKU8DL3Snq73C5Ub9I=;
 b=Al8WTI4U0fghMrA4L+jsoaN5zONBsNEuAbxgRoVVKOO0HBBAphaPJZJlwAfuaF+tQB732RIzn3yK7VmLfR4jtuAAXcJiBB9iWy7kGTRdjXdix7+qTAeuBAdOxW8WrJgI/uyPwQHhhjT47+U+SpPhK3EqxdzrpPx8Q7VKVGttFhWNRofcnpbVd2CyU7c6h9ZgpPyCY5JPH6Iqq0W9TG8NGNWVprziKtC4ndRKNsXwoNysUVbBDHPUSOhZyXdyAjfthf6M2RkixxxKGNykQxHPEzWcDDYiU6g95g17RKNLdp6YUWsy8m5IcuNNv8AZHYeYlKgyVYzQl39luI8qJJirQw==
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b6::18)
 by DB8PR10MB3689.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 11:16:06 +0000
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25c9:37e2:180d:7dba]) by DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::25c9:37e2:180d:7dba%9]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 11:16:06 +0000
From: "Anagnostopoulos, Vasileios" <vasileios.anagnostopoulos@siemens.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support
Thread-Topic: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support
Thread-Index: AQHY4hmJFzR6DvvhHkeES+N5d9tLya4Sbvow
Date: Mon, 17 Oct 2022 11:16:06 +0000
Message-ID: 
 <DB6PR1001MB1285C664112541F2BCA24A60FA299@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
References: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
 <171ED6ED0A693A56.19083@lists.yoctoproject.org>
In-Reply-To: <171ED6ED0A693A56.19083@lists.yoctoproject.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-10-17T11:16:04Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=04b80434-b3da-49c4-9440-044cb95e30fd;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR1001MB1285:EE_|DB8PR10MB3689:EE_
x-ms-office365-filtering-correlation-id: 0587f67d-aca1-4275-f5cb-08dab030fc27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TtTs3MIIoVp/G1h84mrNa3IDMLmEsvaDtybzlSRzLRhyC0Ao/UreJQ5eSAnBNUPlEB1aq2a2qY7SE+pdgG6xk5KdE945lF62EPYVntrDRLkVamW/ImzelMOl8HQqhJt75CVjUw5TTTrnXh89suQp5vV11QzSqKdSIOwWxhbN6gtEq5G6Bp6yHLKMPbh1eVyDLTrbbZQc+WlciXg7WylSi6d4POErb7EHpX8BcRztDEnJdrOvv7qk4ElAMcv+HA3xKxFz8QSEt8NoznnKga29yvWOyFvzfkhxiXP+77Cc13lenUYjDyCNE27NUtN0B1/CT91WH5TZ130iyctPVEiON1uI5NjU6jkLiUs7bi2657edDRFR2alKlq+ZrsDCD9y97xCx0BZ3pS10nKbV/8xwSJDSWDLBEfhT+kquN82Db4xj4VHRnddswo4078fcgxZlYLaO9iPFpyhLwmzjWwAgvAsyDQsyQWYE99/MUr2aWfnpSAk+CevbLtFf0rXc7EAaMsbqyTulnoxLlKB6gltOKxKkFOCNvy2pYb363eDCV3RE4AXqIiPkkBHmCDn7NrKlTeuMJIkwxesigNDlvRURQ9hi4Z3hbj8Rk10WKUhRt7J3yPT2BDuXntBUF8itSVnrTY9tPCnwcBFXBgcEO0uJk5RXNJCYgXe/OQ0dprP2OUHnlUXbIoWGwuuuwCkMb8L86UlVgmRhSci9V3qJqJaZH7pbW/b0OM/MKqozVdzT7mwQVTHCQrSrGas2/a3vTO3cZJUrRjtI1HLfyaV3egfkZw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(186003)(83380400001)(38070700005)(86362001)(82960400001)(38100700002)(122000001)(5660300002)(2906002)(41300700001)(52536014)(8936002)(55016003)(8676002)(64756008)(478600001)(9686003)(26005)(53546011)(6506007)(7696005)(316002)(66446008)(66476007)(66556008)(66946007)(76116006)(6916009)(71200400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5Wwx5wqH/r+fi6dHjPmLZZtvfvXNMkKp8CcqKn9nwL0Vm4UQjWbLTBFNuuSk?=
 =?us-ascii?Q?psdnhXKAQEPGnBCGREjcdC578SCvBd5VXe3J0IT9OA9wplrmK613czke5dNz?=
 =?us-ascii?Q?05N5h9bgIO4mqkvaUpE+FcDHAmMkge3nUK47EcAPeDEXdR9fh0esnFMlQXpW?=
 =?us-ascii?Q?6flbSvVrIxZpCHmCATZIRIiQmeN/Do4/lzLs5jzNc6C1G05CQxk5T9te1p61?=
 =?us-ascii?Q?rFiUOOF1e+jjiCBN5dpzq6o0lPkGccR3UkCf1Y7wC21zQw5hCCBGbRgwTYKD?=
 =?us-ascii?Q?vsttrmSpRgu0jvB6jfTiiqxjxyz7ba6+IX4UbpD/DFJZ5cVMcJcSNaP/xbvU?=
 =?us-ascii?Q?SF4vnJDQrGIGLUsc+hs+Mcg4e73Nz58AWdyHk8gjQdGgEqmtu4eXTlMxOtd0?=
 =?us-ascii?Q?Y0+0QlPizu8RSdnjwXHIuAteWN6XVdcuBzRGwPmeNed+mD6kUGaUyBPY1sJq?=
 =?us-ascii?Q?TZEKH7m2PF8JUhPDt5yvgK7kvN25fL28Ps5PJ+qC75BCwKkHUptxe905GLsM?=
 =?us-ascii?Q?3yxvUQZhD8aYGh/eC9OkHIWSJXKO+9Hj140ygnDOBweyUAKQ4beX4ShX5TZ9?=
 =?us-ascii?Q?BUlXhaVs0AHRwBwohPgNdBL2PXYy1yYZ+2R27TAS0KR2Qpj8ZtcdAVIhTcj5?=
 =?us-ascii?Q?0Acs/r2SJdIAPqwC6h0RJIHquiydohmCe0XY1vTG7YaZ947TkcC/iL5JIruD?=
 =?us-ascii?Q?z4PCe/Ex8dCyVv4+Jt3MlVkV/DYr+QjEZ1nqyhNTyM5gsy9xJcdwAnZFMB7G?=
 =?us-ascii?Q?/KW18dJvOQjLr0hQ3sQ+yLPowM3PSpP+sgUe5zQvtSK+D3vQdhce5JNi/395?=
 =?us-ascii?Q?EA43Oyqiw8BBYr6GUGpURsOKNptzTyWdeVQJU/AWk50SEJc77lJ4MqwkJ6l4?=
 =?us-ascii?Q?i/9GIXsLJifg2bjbN7K0k1ok5OCGnGcaZw/MsFoAKMqtt9HFwaLJKfVT+rde?=
 =?us-ascii?Q?x8fnGgjY370WUkr4msJOXO/pKRPPNV+i+Ym9lvzgkgqU7XcsQRsdVO7QUUv+?=
 =?us-ascii?Q?4aV5VeOynpjFFQbVOw0kSfAlt9+vrFG7u8YAYQ9kCHUVM7UrSgVbqbWlpAst?=
 =?us-ascii?Q?PlRCO79FoNgBhgD+HqMdC8Yq34BqCcqVKy56z4kyET97Jm0qMJKo42LXeEQP?=
 =?us-ascii?Q?F6GPnCndQWoB8v7KYCHshKBIoyXWK8E1feaCvj20FblkpwDRUZgJ5nHFJz+A?=
 =?us-ascii?Q?Pao08G6ePVyND4KMJKB9dMX6Cl0sRaS1qugpQEwuZ11HJMuAwNy4yF61yn3z?=
 =?us-ascii?Q?nFhi2N+Vng132kInhbZs//jrmlTIMwXEoVSLbuk+63EAt3kAUzDgZPzqMFv1?=
 =?us-ascii?Q?b3tTvJ16tJYJrFeMWtWQmq+zA32CcKOvnRD5j58XgvZ4R47KslU37f4+hFHJ?=
 =?us-ascii?Q?4z7F0ZIi3lCRMssFeAB/VN2Idypxol+s4HnDKB/OWgjKMWrpFQ7NioxVXODh?=
 =?us-ascii?Q?daH45y4Zc8i5gBqzM4FYpaNqRZhHPvBcz4x6V3/b8oOatbn3D9JozwihSvMv?=
 =?us-ascii?Q?PnOFBMSm3Tt6e6g5mUmqbRjzzglj26tC8Vqx3viZreGJWsFvgwzgkA23FoBD?=
 =?us-ascii?Q?CMweUgejGPEJSMgJjWIonq/BOXqfUDHIS5OsMv5jzOW9P8dvQSX/Tjz6dAbS?=
 =?us-ascii?Q?3/Qw3qrO7BCbP5rhC+cq6e0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0587f67d-aca1-4275-f5cb-08dab030fc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 11:16:06.1586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tu3daGEpTeN8waTVsi+FRxkTUmoD3f8D+mHAYBSvmvPTBnkRXtH5W7BmDwPdP542Nosd/I3pNHq/iUcZBmEvctdYZqbMjSLlpchBeqZxarySupj4HTZl3RzyZp0vidWv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3689
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7660

Hello Everyone,

Some background for the patches that I send.
I am continuing the initial work from Pascal with netavark and I adapted th=
e podman recipe to integrate with netavark, aardvark-dns and crun. To activ=
ate them, it has to be done probably from your distro overwrites and do som=
ething like:
```
DEFAULT_CONTAINER_RUNTIME:pn-podman =3D "crun"
DEFAULT_NETWORK_STACK:pn-podman =3D "netavark"
```
For the moment I kept the backwards compatibility and it is an opt-in chang=
e. But maybe we should consider changing the default behaviour, because fed=
ora is already shipping with crun, netavark, and aardvark-dns by default.

Furthermore, I had some problems with the tests (even without my changes). =
When I tried to execute the podman tests in the device I was getting:
```
START: ptest-runner
2022-10-17T09:38
BEGIN: /usr/lib/podman/ptest
Makefile:176: *** Required variable NATIVE_GOOS value is undefined, whitesp=
ace, or empty.  Stop.

ERROR: Exit status is 2
DURATION: 0
END: /usr/lib/podman/ptest
2022-10-17T09:38
STOP: ptest-runner
TOTAL: 1 FAIL: 1
```
It is a minor problem, but even when I executed the tests manually I still =
had many of them failing

```
root@cxg3:~# cd /usr/lib/podman/ptest
root@cxg3:/usr/lib/podman/ptest# bats ./test/system/ ...
373 tests, 77 failures, 38 skipped, 15 not run
 ```=20

Do we have to set up the device in a specific way? Is there an example on h=
ow to deploy podman on a device?

Finally, I was wondering if there are any plans on back-porting podman 4.2 =
to the kirkstone branch? Is that something of interest, or do we prefer to =
avoid it?

Kind regards,
Vasileios

-----Original Message-----
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> On Behalf Of Vasileios Anagnostopoulos via lists.yoctopr=
oject.org
Sent: Monday, 17 October 2022 13:11
To: meta-virtualization@lists.yoctoproject.org
Cc: Anagnostopoulos, Vasileios (SI BP R&D ZG FW ITW) <vasileios.anagnostopo=
ulos@siemens.com>
Subject: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support

---
 .../aardvark-dns/aardvark-dns.inc             | 24 +++++++++++++++++++
 .../aardvark-dns/files/run-ptest              |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-containers/aardvark-dns/files/run-ptest

diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc b/recipes-con=
tainers/aardvark-dns/aardvark-dns.inc
index 4123a2d..70c94dd 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns.inc
+++ b/recipes-containers/aardvark-dns/aardvark-dns.inc
@@ -1,6 +1,30 @@
+inherit ptest
+
+SRC_URI +=3D " \
+    file://run-ptest \
+"
+
 # Cargo installs the binary to bin so move it to where podman expects it
 do_install:append() {
     install -d ${D}${libexecdir}/podman/
     mv ${D}${bindir}/* ${D}${libexecdir}/podman/
     rm -rf ${D}${bindir}/
 }
+
+
+do_install_ptest () {
+	cp -r ${S}/test ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest +=3D " \
+    bats \
+    bash \
+    coreutils \
+    jq \
+    iproute2 \
+    slirp4netns \
+    dbus-daemon-proxy \
+    util-linux-unshare \
+    bind-utils \
+    ipcalc \
+"
diff --git a/recipes-containers/aardvark-dns/files/run-ptest b/recipes-cont=
ainers/aardvark-dns/files/run-ptest
new file mode 100644
index 0000000..b33d8fd
--- /dev/null
+++ b/recipes-containers/aardvark-dns/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/bash
+
+NETAVARK=3D/usr/libexec/podman/netavark=20
+AARDVARK=3D/usr/libexec/podman/aardvark-dns bats ./test/
--
2.34.1


