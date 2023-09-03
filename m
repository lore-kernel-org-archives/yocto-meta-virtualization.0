Return-Path: <fib@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B72C83F2D
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 05:21:54 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.23109.1693718505246589901
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 Sep 2023 22:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Rq2vHYu7;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=bAk6SteH;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3958; q=dns/txt; s=iport;
  t=1693718505; x=1694928105;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eYODOL/3bH/loT3bfV2g4w1aSfkJ0lO2DWBNu5+ZFCw=;
  b=Rq2vHYu78vIVviYGaY87SMyHDSY83RzbfL6+KKz3DTs/3aLwMveat8nM
   EEycPMkHH/rCdsMoWivnV6+ItgF4KGxdPX5XeM8PKmslU0vtuEnF69w3P
   QHEY9eJTDitLKhawK1CUDAMTwFWafiPMvMG8GRvv9OoGtHMba6/EucvWl
   w=;
X-IPAS-Result: =?us-ascii?q?A0BCAADMFvRkmJNdJa1aHQEBAQEJARIBBQUBQCWBFwcBC?=
 =?us-ascii?q?wGBZFJ0AlkqEkeEUYNMA4UtiGQDi12SH4ElA1YPAQEBDQEBLgMTBAEBhQYCF?=
 =?us-ascii?q?oZXAiU1CA4BAgICAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBAQEBH?=
 =?us-ascii?q?hkFDhAnhWgNhgQBAQEBAwEREREMAQE3AQsEAgEIEQQBAQECAhkNAgICHwcKF?=
 =?us-ascii?q?QgIAgQBDQUIGoJcAYIqAzEDAZpyAYFAAoooeoEygQGCCQEBBgQFsBYNgkkJg?=
 =?us-ascii?q?RctAYdpHgGBTYFagguETScbgg2BFUOCaD6CIEICgWIFECODITmCDCKJYYUGP?=
 =?us-ascii?q?wcygimDAF+JGwkhgQgIXoFqPQINVAsLZYEVgkcCAhE6E0pxGwMHA4ECECsHB?=
 =?us-ascii?q?DIbBwYJFy0lBlEELSQJExI+BIFxgVMKgQY/EQ4RgkcrNjYZS4JmCRUMNE52E?=
 =?us-ascii?q?CsEFBiBFARqBRoVHjcREhkNAwh2HQIRIzwDBQMENgoVDQshBVcDSAZMCwMCH?=
 =?us-ascii?q?AUDAwSBNgUPHwIQGgYOPANEHUADC209NRQbBQQ9KVkFoE2CVAGBDggjARcJU?=
 =?us-ascii?q?yWTeIQIizyNdJN1bwqEC4FZiiaNGYF6higXhAGBVqQILpd+IIIviEaGQZZGA?=
 =?us-ascii?q?gQCBAUCDgEBBoFkATiBW3AVgyIJSRkPjiAZg16PeXY7AgcBCgEBAwmLSAEB?=
IronPort-PHdr: A9a23:+SdJUxTCP6fjbEGBp+4EvZhlitpso3TLVj580XJvo6hFfqLm+IztI
 wmEo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk0GUN3maQjqq2appSUXBg25MAN0IurvHYuHgcW9/+uz4JbUJQ5PgWn1bbZ7N
 h7jtQzKrYFWmd57N68rwx3Vo31FM+hX3jZuIlSe3l7ws8yx55VktS9Xvpoc
IronPort-Data: A9a23:ebh636sHfZzPTUqCEz83EXj+6efnVFFeMUV32f8akzHdYApBsoF/q
 tZmKWCCb/uIZmOjKt5+YITlpBxQsJfVxtUyHgZr/yAyFHgWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUIYoAQgvA1c+IMsdoUg7wbVh09Yy2YLR7z6l4
 LseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 QpsIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbhVq/kQPPqgH2PU0QEdbr2SIzvlIz
 dRSpMOcShgCMv3DsbFIO/VYO3kW0axu4rTLJz20ttaeihSfNXDt2P5pSkoxOOX0+M4uXjoIr
 qNeeWtLN0zc7w616OrTpu1EiMUpBMLqJ4gY/HpnyFk1CN5/GMicEviStIQwMDEYqsx+P/f7S
 eMjdnlAfhabPC9lEE4pIcdr9AuvriCvL2IHwL6PnoIy7nTaiRJwyqTwOd7UaNWWRMJTtkKZv
 X7duXX+CQ0dLMaYyzeO7jSrnOCnoM/gcJgZGLv9/flwjRjKnyoYCQYdUh2wpvzRZlOCt8x3A
 kwY3nsv/IEL8U20X4bRXAKTrC6Ll0tJMzZPKNES5AaIw6vSxg+WAGkYUzJMAODKUudrH1TGM
 XfUwbvU6SxTXK69Ei3Cq+/Fxd+mEW1Ecj9YPH5soR4tuoG7+OkOYgTzosGP+ZNZY/XvEj32h
 juNtiV73uxVhs8Q3KL99lfC695NmnQrZlBojuk0djv1hu+cWGJDT9fxgbQ8xaoYRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxTsJ/qGXxoCDzIdA4DNRCyKFBb5lsldjBP
 he7hO+tzMM70IaCNPUuONvhV6zGM4C5ToW6PhwrUja+SsEhKFDYlM2fTUWRxGvq2FM9ir0yP
 IzzTCpfJShyNEiT9xLvH711+eZynkgWnDqPLbillE7P+eTFOxaopUItbQHmghYRtv3U+W04M
 r93aqO39vmoeLanPHGKq9dLdAhiwLpSLcmelvG7v9Wre2JOMGogEPTWh7gmfuRYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:G26s0KgewQMwgsjgx5IpcnW3mXBQX5923DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sdi9qBPnmaKc4eEqTM6ftXrdyRuVxeZZnMXfKlzbamLDH4tmpM
 VdmsdFeaDN5DRB/KHHCUyDYqgdKbq8geGVbIXlvgtQpGhRAskKgXYde2Km+w9NNXZ77PECZe
 KhD7981kCdkAMsH7+G7xc+Lo7+juyOvqjLJTQBABkq4hSPizSH1J7WeiLz4j4uFxl07fMH62
 bqryzVj5/Pjxi88HDh/l6Wy64TtMrqy9NFCsDJoNMSMC/QhgGhY5kkc6GevRguydvfq2oCoZ
 3pmVMNLs5z43TeciWeuh32wTTt1z4o9jvL1UKYu33+usb0LQhKSfapxLgpNycx2XBQ++2U45
 g7mV5xcKAnVC8oqR6No+QgkSsaznZc70BSytL7xEYvIrf2IIUh37D3unklUKvp2EnBmd0a+C
 4ENrCH2N9GNVyddHzXpW9p3ZilWWkyBA6PRgwYttWSyCU+pgEy86I0/r1Wop47zuN3d7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUPhvAQOAl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBG+9QTPuwMdD4IURgMyweJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR+TuKGP/cLw5ljEWm6MiX0X2fPdlzerTAWj+1/4jAreawtDmTA==
X-Talos-CUID: =?us-ascii?q?9a23=3ACxoxP2m5roaaHbCPAYZsZQpEG+/XOVTdwFOBIh6?=
 =?us-ascii?q?RMGNoV6zKZVyP0680nOM7zg=3D=3D?=
X-Talos-MUID: 9a23:BEO/sAUKlz6Abbfq/BPgtBNjEelB2bvtJ1IPyso0keOdCwUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 05:21:44 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 3835Liea012432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 3 Sep 2023 05:21:44 GMT
X-CSE-ConnectionGUID: FrjWgdEpSzOKV3Pt/UihtA==
X-CSE-MsgGUID: LACUGe0LT4+C5qFEKvI36A==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=fib@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.02,223,1688428800"; 
   d="scan'208";a="1205427"
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 05:21:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDccZ5CfLD1IsIsi7iLxJsieLzpcOocomojzYraSP31b7Ixsi1tEABGSrCI5VU6/OtwmSCLqPcLOyznJ3QKitlp5wG1t10ZzkzOtdSSWP+bB7L6elElBGI+ttoWba6czzG7THOntClIZM7CkihAiAbhCEfMkSAMWvkPcBe8n7XH0zYrrYLLuwprbL5uTv9Z3moK1nyuNGZZRhfOt060supCcZokaVGvrT8C8lPH4xrdYbi/enf0L1IXMTDUUis1/OxIkNTzhORAOwAJTcznTblxO7R7k9um24m4N2Wzf2g0ZvvGSFZ7AyskwWiegW+KIO6fAkhQWGt9pClnkdbNWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYODOL/3bH/loT3bfV2g4w1aSfkJ0lO2DWBNu5+ZFCw=;
 b=a9waYi78domd+9HuH+2PQ/cHPC9uLXKAzN8pbalCjGjT0dOQiS8kc1bwVO2UhOUI7l8nsN712YfmmiHjZUGC85bstGZ81mxvMg+nQt/d0ZtNvx0TtgLDwy2VeD5lpWzJW+gDZU0LdQw43FOP01VxIYm4T8+I0/zR2LOzPZfd+6iwZgI3fPo5e3LWyNFpO0mpGKMghIe0pmjgvo5N2s0Fr9Q5otN5QpU2XAbK5Be+/C7G0nbRpkwRdxkw29r7Ncr3Q++pE5DzX2670cR5HXKUxcyDmxCDQUxbkl7p6EcbIZk7WGmUndpj5pkZHWcYk76G/ZT8HDFiIVPipq363ODISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYODOL/3bH/loT3bfV2g4w1aSfkJ0lO2DWBNu5+ZFCw=;
 b=bAk6SteHln/5YmSUi3s9Wuk1mnVMk63/SrUglMk1lVqm/omB3TMUvMtT2Agb6YWdhTQqRcgjPIi+ydMFDj8djqlsckppAL9FApKgtC6hajwNEfvOpSG0AlLnyRQIhETFdNA5/Rxl6cHoZBQBkQd4Umi9HlcLzSnCFLZYMvWeEqI=
Received: from BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Sun, 3 Sep
 2023 05:21:42 +0000
Received: from BL1PR11MB6001.namprd11.prod.outlook.com
 ([fe80::7ab6:7959:d433:6cee]) by BL1PR11MB6001.namprd11.prod.outlook.com
 ([fe80::7ab6:7959:d433:6cee%6]) with mapi id 15.20.6745.030; Sun, 3 Sep 2023
 05:21:40 +0000
From: "Abdurrahman Hussain (fib)" <fib@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Martin Jansa
	<Martin.Jansa@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [kirkstone][PATCH] docker-ce: bump
 SRCREV_docker
Thread-Topic: [meta-virtualization] [kirkstone][PATCH] docker-ce: bump
 SRCREV_docker
Thread-Index: AQHZ0AhFe6mVCgR9u0qUYems2Iq9Hq/s7QuAgBu/kBA=
Date: Sun, 3 Sep 2023 05:21:40 +0000
Message-ID: 
 <BL1PR11MB6001A97256DB08EB45FAF76AADEAA@BL1PR11MB6001.namprd11.prod.outlook.com>
References: <20230816060932.668438-1-Martin.Jansa@gmail.com>
 <CADkTA4OWMris3ESwrNCcoc5s1r-q_qKO=GvKqWjESy3S94s9iQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OWMris3ESwrNCcoc5s1r-q_qKO=GvKqWjESy3S94s9iQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6001:EE_|SA1PR11MB6893:EE_
x-ms-office365-filtering-correlation-id: 6783b3dd-8366-420b-5245-08dbac3da78f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f9AcejvBDU7CcAkNq6Gt6o02/U28xMPBu1exZdNMNa1RyfcUn9RNdyeJoIk6FuMGqGOnV9kHtyXM/JQR4yhi2e+jUOMrSAclJtBBP28Le8NFPcpwGEr4+V3mhr+YofiUnCte61kuovG5mKRSxELohu/y7qNCNQEHhW0MEQUa6v14/q9oCq/ZDptNvpGH+bZjas1oqKj6sAxqpyoiHYgwgdHiwIbbEgtX8Z8baQOnfXTJnb/ZKaAmdJpPKbOzXt32mEOTIVWcwnjr7/hCfbnh73hD4aXCdSbj+jNpnucuaKwDEI/D2EIbAnyxlJvi7Fhg2fv6bqEHALlsLUM2VDJsAFA42fQLL0uZoYaCb/wLZu3+MBiZ1yNnkBhksKKJ0BmYQnkp0qictjCYj9BnQAj9paBPoCweL7AmS0souNIZRAPFPQ20ZfxaS6qZ8UbzmUbfGWBSsjHYxqyBy/tI5BNdkS/saH1xFszJkknXtC/3+dzz8fb4aHM1ZUnF3Z6BOihXAwsNu+jMs6XEs92YMhfh6VAjmU2i1VHO0/wGVLMLHs8FBihdeTAbaLc9Z2VNjRtVQCIBNcivAQg1CzBIu1iSYgUtA5gEgtZrbhp6sWFcSCi5UiOtm1Sg3mCLlY2pSALO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB6001.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199024)(186009)(1800799009)(66556008)(66446008)(66476007)(316002)(2906002)(64756008)(110136005)(76116006)(66946007)(86362001)(33656002)(55016003)(5660300002)(52536014)(8936002)(8676002)(4326008)(41300700001)(9686003)(38070700005)(38100700002)(83380400001)(26005)(478600001)(122000001)(6506007)(7696005)(71200400001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q1lzaHJ6S3hBeVNMbDVkUWd1b3orMUtQRXZRN25TeWtCazY4V0Z6VTlEM2Fq?=
 =?utf-8?B?WUVTQWJzR3ZYUy9PMERXNTB3akFTU0R0aVpsUWVSVXh3ZkRJL1NmK0ZUS3Qy?=
 =?utf-8?B?TFBTMFNOR3pKN0tNL3BkV011OTdzTE5RMTRMYWVjTGhTQU5FbTJJQnpJWTN6?=
 =?utf-8?B?Mi9nRjBRTHpGMEtxZjE4WjRUZ3VPUWhUY3lBbXlwRXhSNHcxdnF5MTFiOTZN?=
 =?utf-8?B?TUVIK2c4VGk4Rk1YMDB3ZlBrVnN4Q09MSDNuVHg1U1Fzd0VoRFI3Vk1oTWRL?=
 =?utf-8?B?RHh6ZDNPNEtjMGw4bzQ3Tk96L3VRbk1LVTRjN0x3bmczL3hpNFdoM0ZrMzQr?=
 =?utf-8?B?MUFQb0kzdUhGS205ajNuSkJZdTBzRDVNbHBGZ3l3SnczOVYwdUNiRW03cmRO?=
 =?utf-8?B?VCtlMTFoaDhDV0huWjVXUTZIN0dxbVRHWWpCN2VYZ1JuNU5BRTVNckdLWFpQ?=
 =?utf-8?B?aEViMCtpZnd5bGdhSlZBQm9FUUhwNE8rRjhaY2ZIcEIrcjVqSko5MGJtYVhl?=
 =?utf-8?B?Y0ZJMGJEUnA5RGlXWlBQTUh2Sml5OGxEcGhwSEUvUnB2VUQxb3Y4aVlPbW11?=
 =?utf-8?B?YUUwaEo3UEdHUHVMeUZrZlNaVEFKM0czWDZvcTB2UkZ2VnIxRWhERTJubDlj?=
 =?utf-8?B?RkMwOWQvakRxUFQyYjhXTHlWQTczSjJoMjh3Uzh0OHNuV0E1REJnTGwvdG5z?=
 =?utf-8?B?RGIxRi9haDYyMElmWWxMYnRFMEFDWlJqejhUNFhxSFIrVHVGRk9FM0pzWUhW?=
 =?utf-8?B?d0M0QUxoRmwwbWZYQXROcGtUekQ3cHBFT3V0ZW5HQkFtTXF2aUNyNGJaN1VW?=
 =?utf-8?B?dGVGT1EzYVBnUE8xemJwRFA5YXJZNE54S0gzZkwzWEtIYURpcWJ4T0FOQW1h?=
 =?utf-8?B?OHV5MTMzSWg2OGZnSzYrbTFtZ0ZNRkZoenZJQWtQUjBVZDQvc3FwQkllckYy?=
 =?utf-8?B?QjJKQklFemRzN2lHcmZzRHA0L0lNV05RclREUEYwaGFlZmNSMVE0dVNUbjNz?=
 =?utf-8?B?bXZWbkNJRjhoazVKc1hZZmoza3phcVU2dnRXc3Jpb2dtWVVoNC93MzgzdU9G?=
 =?utf-8?B?SlIyVFZjeWVySVZMbk43b2U1TnRSVXcvSHB5L29sa0hOMWsxYmRTUi9UTGZ1?=
 =?utf-8?B?OWpseGZ3ZnhUZ2V4U2xxWk5lWWoxb3d3Tnd2cXo3YmMrOXMwSzZvQzU0dTFi?=
 =?utf-8?B?WWJWRVhGakUxS1RpRVIvb2x2V09MWjNFdDk0bHlTNjBtRVlyV3dGTU1qZ3ZH?=
 =?utf-8?B?akQyL3RmTUVpaG9oQk94UmtYa21yL08xVTNZY0FkQ2ZHWkgrRHphZDRlWXVX?=
 =?utf-8?B?VlVvaW1FNG5lb2VKUVRGTGpzQlN4eDlUSUlPemJnYXYvSmpzMjlJa3hlMVpR?=
 =?utf-8?B?WVNxM2dzR3plaHV2VGUxZll6RFZjVytaMWpOc1Q0ZFdnc3gxK0VhK2wvTVB2?=
 =?utf-8?B?eVlyeWg3eDBDaGUwWXU5ZlpYbFpCUVdqTlpsOWc3Qm1CTjNJVEZWOGZNZ21S?=
 =?utf-8?B?YWczMkFLUndNSjA2aGI3R0pBS3Uwd0loZGowY3pYMEtvNWlaSnRJUjB3dFB5?=
 =?utf-8?B?MlZyWUxGVzN6U0hPZnQ4czhuWWpSWFJlaGlaTVNOYzVoYVp5Y0Z1eVU3MEgz?=
 =?utf-8?B?VUQzeHdMM3RrRzBoNERtUXVia0pSMFJRK3FySmVCVkRKVGtORk9MVXFSNDZq?=
 =?utf-8?B?MngvdzVkeEdyenFxak5QbG5QdnhVYnRvY2lUTjJLSGVwL0s4VjMxblBJd1Nv?=
 =?utf-8?B?MXhObWp1djE5VnhMZjFOcElhN2VIWmptb3BUelpsbGZ0REM5b0lxZlJHWWcv?=
 =?utf-8?B?cHlFbGg4ejZkM0p5RGFxUlgrdTNMWmlUeFNOR085OUtxbUdURTA3ZC9kMVlV?=
 =?utf-8?B?aTNRZHJkOFkxWGlpd1lFZ211OUMvWnFBMnlpYjZaNVNpVEZhUnZaUjY3Rmty?=
 =?utf-8?B?RVExQlYxMFFIZzBWaS9ONVlGYk5oMnFyVmVQR1pkY1VJSjM0b2wwZ0pkUUhS?=
 =?utf-8?B?VlU1clVMeEQzTDl6MVFFRVNHdmxpM3pZS2h6VjVoVDBvb1dZajBjeVlyaXl0?=
 =?utf-8?B?Vmw3dGJKb0NPVytTc0JqdjY0UTNxdTFkRmNySWNOcVFRZHFIbG84Y0NHdHFW?=
 =?utf-8?Q?uzWQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6783b3dd-8366-420b-5245-08dbac3da78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2023 05:21:40.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQCEzCW8YnlpaxTkevTlPduaM2u/FR5sOrFjpFWM1Er4OwWP5c9G/pzt5TEQt9s+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 03 Sep 2023 05:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8265

SGkgQnJ1Y2UsDQoNCkl0IHNlZW1zIGRvY2tlciBpbiBEdW5mZWxsIGlzIGFsc28gYWZmZWN0ZWQg
d2l0aCB0aGUgc2FtZSAnaHR0cDogaW52YWxpZCBIb3N0IGhlYWRlcicgaXNzdWUuDQpDYW4gdGhl
c2UgcGF0Y2hlcyBiZSBtZXJnZWQgaW50byBEdW5mZWxsIGFzIHdlbGw/DQoNClRoYW5rcywNCkFi
ZHVycmFobWFuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBtZXRhLXZpcnR1
YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEtdmlydHVhbGl6YXRpb25AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEJydWNlIEFzaGZpZWxkDQpTZW50OiBX
ZWRuZXNkYXksIEF1Z3VzdCAxNiwgMjAyMyA2OjM2IEFNDQpUbzogTWFydGluIEphbnNhIDxNYXJ0
aW4uSmFuc2FAZ21haWwuY29tPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBba2lya3N0b25l
XVtQQVRDSF0gZG9ja2VyLWNlOiBidW1wIFNSQ1JFVl9kb2NrZXINCg0KVGhhbmtzIE1hcnRpbiwN
Cg0KVGhpcyBpcyBtZXJnZWQuDQoNCkJydWNlDQoNCk9uIFdlZCwgQXVnIDE2LCAyMDIzIGF0IDI6
MDnigK9BTSBNYXJ0aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+IHdyb3RlOg0KPg0K
PiAqIGZpeCBteSBwcmV2b3VzIGNvbW1pdCB3aGVyZSBJJ3ZlIG1pc3NlZCB0aGlzIHVwZGF0ZSBj
b3JyZXNwb25kaW5nDQo+ICAgdG8gU1JDUkVWX21vYnkgY2hhbmdlIGluIGRvY2tlci1tb2J5IHJl
Y2lwZS4NCj4NCj4gKiBhbHNvIHJlLW9yZGVyIHRoZSBwYXRjaGVzIGluIFNSQ19VUkkgdG8gbWF0
Y2ggZG9ja2VyLW1vYnksIHNvDQo+ICAgdGhhdCB0aGV5IGFyZSBlYXNpZXIgdG8gY29tcGFyZQ0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+
DQo+IC0tLQ0KPiAgcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXItY2VfZ2l0LmJiIHwg
NiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlci1j
ZV9naXQuYmIgDQo+IGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXItY2VfZ2l0LmJi
DQo+IGluZGV4IDc2YWM0MWUuLjcxNDIwNjAgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtY29udGFp
bmVycy9kb2NrZXIvZG9ja2VyLWNlX2dpdC5iYg0KPiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMv
ZG9ja2VyL2RvY2tlci1jZV9naXQuYmINCj4gQEAgLTMxLDcgKzMxLDcgQEAgREVTQ1JJUFRJT04g
PSAiTGludXggY29udGFpbmVyIHJ1bnRpbWUgXCAgIyBzbyB3ZSANCj4gZ2V0IHRoYXQgdGFnLCBh
bmQgbWFrZSBpdCBvdXIgU1JDUkVWUzoNCj4gICMNCj4NCj4gLVNSQ1JFVl9kb2NrZXIgPSAiMzA1
NjIwODgxMmViNWU3OTJmYTk5NzM2YzkxNjdkMWUxMGY0YWI0OSINCj4gK1NSQ1JFVl9kb2NrZXIg
PSAiNzkxZDhhYjg3NzQ3MTY5YjRjYmZjZGYyZmQ1N2M4MTk1MmJhZTZkNSINCj4gIFNSQ1JFVl9s
aWJuZXR3b3JrID0gImRjZGY4ZjE3NmQxZTEzYWQ3MTllOTEzZTc5NmZiNjk4ZDg0NmRlOTgiDQo+
ICBTUkNSRVZfY2xpID0gIjkxMTQ0OWNhMjQ1MzA4NDcyYTNkMzRhN2YxYTk4YjkxOGU2NWM4YzMi
DQo+ICBTUkNSRVZfRk9STUFUID0gImRvY2tlcl9saWJuZXR3b3JrIg0KPiBAQCAtMzksMTAgKzM5
LDEwIEBAIFNSQ19VUkkgPSAiXA0KPiAgICAgIGdpdDovL2dpdGh1Yi5jb20vZG9ja2VyL2RvY2tl
ci5naXQ7YnJhbmNoPTIwLjEwO25hbWU9ZG9ja2VyO3Byb3RvY29sPWh0dHBzIFwNCj4gICAgICBn
aXQ6Ly9naXRodWIuY29tL2RvY2tlci9saWJuZXR3b3JrLmdpdDticmFuY2g9bWFzdGVyO25hbWU9
bGlibmV0d29yaztkZXN0c3VmZml4PWdpdC9saWJuZXR3b3JrO3Byb3RvY29sPWh0dHBzIFwNCj4g
ICAgICBnaXQ6Ly9naXRodWIuY29tL2RvY2tlci9jbGk7YnJhbmNoPTIwLjEwO25hbWU9Y2xpO2Rl
c3RzdWZmaXg9Z2l0L2NsaTtwcm90b2NvbD1odHRwcyBcDQo+IC0gICAgZmlsZTovLzAwMDEtbGli
bmV0d29yay11c2UtR08taW5zdGVhZC1vZi1nby5wYXRjaCBcDQo+ICAgICAgZmlsZTovL2RvY2tl
ci5pbml0IFwNCj4gLSAgICBmaWxlOi8vMDAwMS1keW5iaW5hcnktdXNlLWdvLWNyb3NzLWNvbXBp
bGVyLnBhdGNoIFwNCj4gKyAgICBmaWxlOi8vMDAwMS1saWJuZXR3b3JrLXVzZS1HTy1pbnN0ZWFk
LW9mLWdvLnBhdGNoIFwNCj4gICAgICBmaWxlOi8vMDAwMS1jbGktdXNlLWV4dGVybmFsLUdPMTEx
TU9EVUxFLWFuZC1jcm9zcy1jb21waWxlci5wYXRjaCANCj4gXA0KPiArICAgIGZpbGU6Ly8wMDAx
LWR5bmJpbmFyeS11c2UtZ28tY3Jvc3MtY29tcGlsZXIucGF0Y2ggXA0KPiAgICAgIGZpbGU6Ly8w
MDAxLVJldmVydC1nby11cGRhdGVzLWZyb20tMS4xOS4xMi10by0xLjE4LjcucGF0Y2g7cGF0Y2hk
aXI9c3JjL2ltcG9ydCBcDQo+ICAgICAgZmlsZTovLzAwMDItUmV2ZXJ0LWdvLXVwZGF0ZXMtZnJv
bS0xLjE4LjctdG8tMS4xNy4xMy5wYXRjaDtwYXRjaGRpcj1zcmMvaW1wb3J0IFwNCj4gICAgICAN
Cj4gZmlsZTovLzAwMDMtYnVpbGRlci5nby1hdm9pZC11c2luZy1zdHJpbmdzLkN1dC1mcm9tLWdv
LTEuMTgucGF0Y2g7cGF0Yw0KPiBoZGlyPXNyYy9pbXBvcnQgXA0KPiAtLQ0KPiAyLjQxLjANCj4N
Cj4NCj4gDQo+DQoNCg0KLS0NCi0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50
ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0
aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo=

