Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.1191.1626911462123947834
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 16:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=LEaa3ylb;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5334; q=dns/txt; s=iport;
  t=1626911462; x=1628121062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SeVgG9Ymm4bJg0RfWu7n4FMk1kLo4q+rxrr//D31ry4=;
  b=LEaa3ylbz8fNUm2KDVYEMfFbV/wo/LZ99y8nUMmPypcL9NF3kwAYjrhR
   i2iQQ+ml0dJ97Cjr8Ju5NbivzNakAJA6RP/0VZJgstTKgzwZyR8QsAnTv
   Q1RdUrs3LFM9nVDqL4/J6SyF1q7myAeacxeX5mgH8jTAbEle6+G2/RJyX
   U=;
X-IPAS-Result: =?us-ascii?q?A0AIAwCDsvhgl5BdJa1aHgEBCxIMQIFOC4FTUX5aNzGES?=
 =?us-ascii?q?INIA4U5iGEDgRCJR49ZglMDVAsBAQENAQEqBxAEAQGEVwIXgl4CJTcGDgIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEFAQEFAQEBAgEGBBQBAQEBAQEBAXKFaA2GRQEBAQMBARERE?=
 =?us-ascii?q?QwBATcBCwQCAQgRAgIBAQECAh8HAgICHwcKFQgIAgQOBQgagk8BglUDDiEBn?=
 =?us-ascii?q?S0BgToCih96gTKBAYIHAQEGBASFMQ0LgjMJgRAqgnyEDoEXhUsnHIINgRVDg?=
 =?us-ascii?q?is3PoIgQgWBJDuDFTaCLoMWB2MYEwhEeGyVY6coWwqDJIExiQSMOYFrhXoSh?=
 =?us-ascii?q?SqhNS2lQpUlAgQCBAUCDgEBBoFxI4FbcBWDJAlHGQ6OHxkegyEZhRSFSnMCN?=
 =?us-ascii?q?gIGCwEBAwmJSYJHAQE?=
IronPort-PHdr: A9a23:G2qeJRCPDz1wIJ37QAMlUyQVchdPi9zP1kY95Z8uirYIeaOmrNzuP
 03asPNqilKBHYDW8OlNhOeetaf8EXcB7pCMvDFnEtRMWhYJhN9Qk1kmB8iIWkL+Jf/uKSc9G
 ZcKWFps5XruN09TFY73bEHTpXvn6zkUF13/OAN5K/6zFJTVipG81vu5/NvYZAAb7Ac=
IronPort-HdrOrdr: A9a23:jq3wBaC6zvWbArnlHej0sseALOsnbusQ8zAXPh9KKCC9I/b3qy
 nxppsmPEfP+UkssHFJo6HmBEDyewKjyXcT2/hQAV7CZnimhILMFuFfBOTZskbd8kHFh4tgPO
 JbAtRD4b7LfBtHZKTBkXOF+r8bqbHtms3F9ISurUuFDzsaFp2IhD0JbDpzZ3cGPDWucqBJba
 Z0iPA3wwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnb4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlRFtyssHftWG1SYczFgNkHmpD31L/sqq
 iVn/4UBbU115oWRBDvnfKi4Xi77N9k0Q6S9bbRuwqSnSW+fkNmNyKE7rgpLScwLCEbzY1BOe
 twrhGknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfJsRKEkjQho+a07bWjHAUEcYZ
 5TJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYMit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tLKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGGEfIx8Z0Wl9ih63ek2hlTRfsufDcSzciFZryL7mYRsPiTyYY
 fGBK5r
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,259,1620691200"; 
   d="scan'208";a="751742103"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2021 23:50:51 +0000
Received: from mail.cisco.com (xbe-aln-007.cisco.com [173.36.7.22])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 16LNopfQ031320
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Wed, 21 Jul 2021 23:50:51 GMT
Received: from xfe-rcd-002.cisco.com (173.37.227.250) by xbe-aln-007.cisco.com
 (173.36.7.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 21 Jul
 2021 18:50:51 -0500
Received: from xfe-rtp-005.cisco.com (64.101.210.235) by xfe-rcd-002.cisco.com
 (173.37.227.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 21 Jul
 2021 18:50:50 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xfe-rtp-005.cisco.com (64.101.210.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Wed, 21 Jul 2021 19:50:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceXEUNPfOxXqlZ/v3BvlkzYNlvjoJmhOpfr79srLj5re8RqXrMPsFbvHwLn+JSG4MKbM90PFw40S+rdkVpe6M4smUlPA4vAmozk2bfz/nPnfF2K7YTKb5K96PXH7zA4qAQJM78eJV0xsn2CjM1tKUOUJfiOx5L+a/Gzj5aVCfFzDSRV2rF3OdwGOl5R/s501TN7d8fuSb5tib+9JFnLhNeNLzSW0LvpYuYhmlNC5Nms+0/tJzs+JCUAZBgYWa36n4eMBtUM/xnRlnXhI94MMNM0QMb0fLjzdSOPnO2i/g7DcFFJCalZy/Z4YT0rs4mbBLC9UhMKKuxwe/ZBSlZvLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeVgG9Ymm4bJg0RfWu7n4FMk1kLo4q+rxrr//D31ry4=;
 b=ISIyOTo/XtgB8hnApmJiaKmgZTsUXPiw13WIA+pkiXeMAVQP+zW3zj6u5CFUFjd8u4J3TjYYXd2j/gapxdl2YHa9HmGvAlhwaqmOOq6AklKN4o8uY0X1z8bHTP+lGh8pGY7h6HvBtxW5GdBoCFxC0O5qsEBnxlaBOKMOSjGjwRBTd6qiCWhNfUHQZB8tpZy0A2OrhSPYi9dMwerIsE2vkAuY9d1EeT7YK7drPWq1EV4m+wS7Fq/tdrf/4T5kkVTtDtMRuU6B3LT7112rBjlVV2kIrJGe63faQ4KUM2mS9MGVBoKQUoMxZG2+X5sdv2POENWpCwVpnjNMzBT+2nsWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeVgG9Ymm4bJg0RfWu7n4FMk1kLo4q+rxrr//D31ry4=;
 b=MFEo1pCnIoeERczNDv+OJrwJ4dvR1cA+F7/Oha/W+qN1Cd50mQLMgqOu86dlAFTmN6UXbigF75eyexFRh3zABHTwE/CyA8q0tyKrLMVF6Cvao5mQ1X36I7jy+etKRhuH6CFJjoonpa7ZxdpzIh/hws7b/Wc3etb1k1n3sTdjYuA=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 23:50:49 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%5]) with mapi id 15.20.4352.025; Wed, 21 Jul 2021
 23:50:49 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
Thread-Topic: [meta-virtualization][PATCH] python3: unbreak python3-native
 when virtualization is in DISTRO_FEATURES
Thread-Index: AQHXfm83bnU8N4frvEiMNcIFL78GGqtN4geAgAAAbkCAAAQysIAAHY0AgAAULcA=
Date: Wed, 21 Jul 2021 23:50:49 +0000
Message-ID: <SJ0PR11MB4784C29819CC6CF4AACD4004ADE39@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210721202955.137761-1-fib@cisco.com>
 <CADkTA4M_d3nrJWxo7rNJjPgZMus1jz_t2-y_qrTp3A4AnNL1QQ@mail.gmail.com>
 <1693E8C660DC5CDD.19034@lists.yoctoproject.org>
 <SJ0PR11MB47840ED9E9582FAD969BC68FADE39@SJ0PR11MB4784.namprd11.prod.outlook.com>
 <CADkTA4O7rWXuvZNVb95U8-amgo_R=QAty1Jz8hsqiDDX4sfEuw@mail.gmail.com>
In-Reply-To: <CADkTA4O7rWXuvZNVb95U8-amgo_R=QAty1Jz8hsqiDDX4sfEuw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bf8e0e5-0772-4518-76af-08d94ca25ddb
x-ms-traffictypediagnostic: BY5PR11MB3893:
x-microsoft-antispam-prvs: <BY5PR11MB3893736076D4DE4B9734D29DADE39@BY5PR11MB3893.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuirA4AtwmG+kWojsT5Ij3yaO5ZzmR3FqgBbIBEQYJgWXwHVWKUY/HbxQXzAg3DR9OSYiSvDmzOHbAmJJC2sZAjNPUuVrrtHklgnmjqyCa7RjMinkcErlQcZ2Ue8DzWtPJ29ymZNVAJDFCVu7blcyquVCCj+xZy9SS5azUFObodnKwVVCckpsgqvEeXQ/wl42bi9ldnWe9rO1XR0JAGKk2EtFS8yVJYSXR0pwD93zN/nRka31YaYTxsy3J7MrBj20QiYlhPDXs/1iqOIYaHEc29AGf6D4tIVl34r+cTJa4bGueLxoCQtcLgoxN5Ft++Dtqjrub2ZlxGeVldv/a77BD9Zc6+9btM8/2rZZMKNiA5Xt6uCL9cI4s/fHpgqEQhRaJWztJVL1CF18iM//VneZQgRxDbItIR1e2eDL7QA8pZq0v3fGuThejiAL1+ddKp9r9dcuEGcJaJAcImn6NIRIaDWQChiaI5ra1DqTkR+FeBxxPhts1maR9T+tQU9MF/tw2SGmtbNg+tMS3pteJTI5fIGcPOcTeyhEmQNMfTmAqNBE7CM7nZnQpIh5a5uvjynG7BO9Aoji6Czyu3wjbuRyEnzIrKXYmKg/jOJ8irqiA9IA3MXMyYenCIiwMcBrUjKQQlQodehvDx6P/HOguw5m5ZaeLziQo8ItpFuDhZmTk2X2iWTgd2G/dRddIXTYWM0aOOU9uGGvG+J8fZvB1/6sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(396003)(39860400002)(52536014)(4326008)(64756008)(186003)(8936002)(33656002)(8676002)(83380400001)(6916009)(38100700002)(122000001)(7696005)(76116006)(66556008)(66446008)(26005)(9686003)(66476007)(316002)(55016002)(71200400001)(86362001)(6506007)(66946007)(53546011)(5660300002)(478600001)(2906002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTFrMnVhdjZwL3JqWDQvYW5UeWFrMCs5c3RLemQ1b2FpRkFSK2VmdUh6T3RQ?=
 =?utf-8?B?QTVQQnp0NFpxRzJBZGVTUzFuakRnUFpIcEM5NHdrT2hROEJpVGxSV0JKcEZK?=
 =?utf-8?B?djhIbDdub25oVUphdENvbFZOUDdJL3NQZ1JRS1Z6THlQVmtUZ1p2bzhxbWtI?=
 =?utf-8?B?YTh3L2N6cFFMMlNZUEg4amFKam9JWEFQNUtPUk9hblZHZnJDRytSVTFwa09K?=
 =?utf-8?B?TnpLM2NGNytMYW42RWpXb3FjZVcwSmM3SldQUnJyRmVKMEVsQkNkbDk3bG9o?=
 =?utf-8?B?VmJKSnZpRkgzc3V0ZVhtSXBRN1hRekQ0ZzdBUmhXcTZsdUxvVkNBOXVJOHpN?=
 =?utf-8?B?VEg5dWxtWTBDSmVYc21LZTV4eWxXR1oxMVJTcG1heERpampDT2JtN2FGT0FJ?=
 =?utf-8?B?Vk5nQzJrM1RCbDJFaWUxeGhkUElzdTljSGU2OTVuaU1oTWw4ZCsvbFYzNlB5?=
 =?utf-8?B?NzdxdEwxSkpFL1JUWDFGWUVPcGlrdmZmRDZ1b3VvcXFqbVozVVBJTlMwaVhY?=
 =?utf-8?B?R1Yzc2Rua0VJSnV3NFpIYnpnbm9QczBlUnduNnY4SkI2TjF0aExJZ1c1TTI2?=
 =?utf-8?B?VldKb1BBTk5qSG9Pc3BCU1pyV09NaWRJenFudnovc0N5ZE4zbjQvZE5SZEpy?=
 =?utf-8?B?bzJtZitPcVZlM0ZRV2pvYW9CQ3c4SldhaXJCMG1yOG5WRW5PTlhZK1liZDgz?=
 =?utf-8?B?QTlDY1kvRnNhOXVlU3dmUUlnbC93TkJXOXBRTEhBQkRFSG01M1liMFpNVkZU?=
 =?utf-8?B?bHBkcE5tVXR0K2FFSDUrYWxtVG9FS0VPSDFLRWd1YWZGbk5kaHp2d0trbEV3?=
 =?utf-8?B?QVJoaTVRQnExeXhlWi8zS09CWVREZHQvTmpYa05XQ1VONy9FM29vd0NmTURL?=
 =?utf-8?B?QTVIMnZIMnljTUtkY1BHb1RucXlGbEJlSmVUaGFPM1dpNG1PSmp2c3doMURU?=
 =?utf-8?B?Rm0zMXRMUWlDNmIyRUlVeHlXR3dJenlXWDRvaCtsV3ZKeUdVeWwxUm5uZEx3?=
 =?utf-8?B?MCtQVkdrQWlOUWoxd29kaENDQ3E2RjRXS1dsV3BXdDNmdUJNZS9YNHl2ZWVq?=
 =?utf-8?B?WmNtV3BnNGhId2ovbnVpNjRxZS96OWQ0aDR1dFd1bVdyT0NRK2hpUXI4dEMz?=
 =?utf-8?B?SWJrZU42YllQWlBDbU1oblkwTjBWaXNDeVJnMk5xY3hUUkE4VUhqSnBNQTEw?=
 =?utf-8?B?QUIySmhBejZBcFhnMmdTMHZINXhJNVRlREJQbGwxQzNuMW50WG5McGtNcmpx?=
 =?utf-8?B?UE1zYWhkN25rSU55RFJSWjI5VUpBWDVKcm9VZDI2MmhOUW9jMWYySDRYcmk0?=
 =?utf-8?B?ZmNxTk5lMGZCNzJwVEVpVEJCbndWUkJuc3Exb2ZCV1A0VzVqSVBMeFZBaDRy?=
 =?utf-8?B?UDBTK0kzY3d5Q0ZRdEZIWSs3bnVXd2dZS3RabFg5ek91Zi8wMXNnRWpOVlk5?=
 =?utf-8?B?VGR6cVZ2MnJROEcwcW0zUDVsWVpCeE4zWDlXZ29Uei94RXIxZEw5emIrc0Uy?=
 =?utf-8?B?S3BZa3F6dy84RGpuQ1QvQU1tMlYyQlNIWDZ6Zk1ybHJyZTF6ZTc4bk5UaFEr?=
 =?utf-8?B?NkRTUGRuYXhaMkw3QU92RWdsVHhmR1Jveit2QkFzSUNsMDZzZUZBNFV0ZHNT?=
 =?utf-8?B?WDRPdERVNHVGNkRXU0s5d1EwZjlnNXBib2RxZEtnUmVGaENQWFlYVkRRajMz?=
 =?utf-8?B?ZXFGUTdhaUZiV2l1cVRGcUk4WG9YS1pUQVJ0TFdCK0FlY21mTEpCMmJPMFhY?=
 =?utf-8?Q?uSqiRTuAE4yNUpwWA4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf8e0e5-0772-4518-76af-08d94ca25ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 23:50:49.1657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M51BJf3cVWP7QYdN3YfXzTX3VY1SdGEYmjub2s5vJqypXvg8uM9B/swIIhnEEBv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.22, xbe-aln-007.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gbXkgY2FzZSBpdCdzIGEgY3VzdG9tIGxheWVyIHdpdGggYSByZWNpcGUgdGhhdCBpbmhlcml0
cyBweXRob24zbmF0aXZlLg0KVG8gcmVwcm9kdWNlIGp1c3QgYnVpbGQgcHl0aG9uMy1uYXRpdmUg
b3IgYW55dGhpbmcgaW5oZXJpdGluZyBweXRob24zbmF0aXZlIHRodXMgYWRkaW5nIHB5dGhvbjMt
bmF0aXZlIHRvIERFUEVORFMuDQpUaGUga2V5IGlzIHRvIGFkZCAidmlydHVhbGl6YXRpb24iIHRv
IERJU1RST19GRUFUVVJFUyBhbmQgeW91J2xsIGhpdCB0aGUgaXNzdWUgZXZlcnkgdGltZS4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5h
c2hmaWVsZEBnbWFpbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKdWx5IDIxLCAyMDIxIDM6MzQg
UE0NClRvOiBSdXNsYW4gQmFiYXlldiAoZmliKSA8ZmliQGNpc2NvLmNvbT4NCkNjOiBtZXRhLXZp
cnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS12
aXJ0dWFsaXphdGlvbl1bUEFUQ0hdIHB5dGhvbjM6IHVuYnJlYWsgcHl0aG9uMy1uYXRpdmUgd2hl
biB2aXJ0dWFsaXphdGlvbiBpcyBpbiBESVNUUk9fRkVBVFVSRVMNCg0KT24gV2VkLCBKdWwgMjEs
IDIwMjEgYXQgNDo0OSBQTSBSdXNsYW4gQmFiYXlldiAoZmliKSA8ZmliQGNpc2NvLmNvbT4gd3Jv
dGU6DQo+DQo+IEp1c3QgZG8gYWRkLiBJIGFtIG5vdCBzdXJlIHdoeSB0aGUgcHJlcGVuZCB3aXRo
IGV4cG9ydCBMSUJSQVJZX1BBVEggd2FzIGFkZGVkIHRvIGJlZ2luIHdpdGguIFBlcmhhcHMgaXQg
aXMgbm8gbG9uZ2VyIHJlcXVpcmVkLg0KDQpJdCB2ZXJ5IGxpa2VseSBpc24ndC4NCg0KVGhlIGdp
dCBoaXN0b3J5IHNob3dzIG1lIHdvbmRlcmluZyB0aGF0IHNhbWUgdGhpbmcgaW4gMjAxNS4NCg0K
V2hlbiBpdCB3YXMgaW50cm9kdWNlZCwgd2UgbmVlZGVkIGEgcGF0Y2ggdG8gbWFrZSB0aGUgbmN1
cnNlcyBERVBFTkRTIHByb3Blcmx5IGNyb3NzIGNvbXBpbGUuIFRoYXQgcGF0Y2ggaXMgZ29uZSwg
c28gdGhlIHNlYXJjaCBwYXRoIG1vZGlmaWNhdGlvbiBpcyBhbHNvIHByb2JhYmx5IG5vdCByZXF1
aXJlZC4NCg0KSWYgSSBjYW4gYXNrLCB3aGF0IHJlY2lwZSBhcmUgeW91IGJ1aWxkaW5nIHRoYXQg
aXMgc2hvd2luZyB0aGUgZXJyb3IgPw0KVGhhdCdzIHJlYWxseSB3aGF0IEkgd2FudCB0byB1bmRl
cnN0YW5kLCBzaW5jZSB3ZSBhcmUgYnVpbGRpbmcgbWFueSBpbWFnZXMgb24gYSBkYWlseSBiYXNp
cyB3aXRoIGhvc3QvdGFyZ2V0IHB5dGhvbiBwYWNrYWdlcyBhbmQgSSd2ZSBuZXZlciBzZWVuIHRo
ZSBpc3N1ZS4NCg0KSWYgSSBjYW4gcmVwcm9kdWNlIHRoZSBicmVha2FnZSBoZXJlLCB0aGVuIEkg
Y2FuIGFsc28gY29uZmlybSB0aGF0IHdlIGNhbiBqdXN0IGRyb3AgdGhlIGNvbmZpZ3VyZSBwcmVw
ZW5kIGNvbXBsZXRlbHkuDQoNCkJydWNlDQoNCg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcg
DQo+IDxtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFs
ZiBPZiBSdXNsYW4gDQo+IEJhYmF5ZXYgKGZpYikgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcN
Cj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDIxLCAyMDIxIDE6MzcgUE0NCj4gVG86IEJydWNlIEFz
aGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+IENjOiBtZXRhLXZpcnR1YWxpemF0
aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxp
emF0aW9uXVtQQVRDSF0gcHl0aG9uMzogdW5icmVhayANCj4gcHl0aG9uMy1uYXRpdmUgd2hlbiB2
aXJ0dWFsaXphdGlvbiBpcyBpbiBESVNUUk9fRkVBVFVSRVMNCj4NCj4gQmFzaWNhbGx5LCBweXRo
b24zLW5hdGl2ZSByZWNpcGUgd2l0aCBESVNUUk9fRkVBVFVSRVMgd2l0aCB2aXJ0dWFsaXphdGlv
biBpcyBicm9rZW4gZHVlIHRvICR7U1RBR0lOR19ESVJfVEFSR0VUfSBiZWluZyB1bmRlZmluZWQg
YW5kIExJQlJBUllfUEFUSCBlbmRpbmcgdXAgYXMgIi9saWIiLg0KPg0KPiBJIGNhbiBwdXQgdGhl
IHBhcnQgYWJvdXQgJHtTVEFHSU5HX0RJUl9UQVJHRVR9IG5vdCBkZWZpbmVkIGZvciBuYXRpdmUg
cmVjaXBlcyBpbiB0aGUgYm9keSBvZiB0aGUgY29tbWl0IGlmIHlvdSBsaWtlLg0KPg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNo
ZmllbGRAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjEsIDIwMjEgMTozMiBQ
TQ0KPiBUbzogUnVzbGFuIEJhYmF5ZXYgKGZpYikgPGZpYkBjaXNjby5jb20+DQo+IENjOiBtZXRh
LXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtt
ZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gcHl0aG9uMzogdW5icmVhayANCj4gcHl0aG9uMy1u
YXRpdmUgd2hlbiB2aXJ0dWFsaXphdGlvbiBpcyBpbiBESVNUUk9fRkVBVFVSRVMNCj4NCj4gWW91
IG5lZWQgdG8gZWxhYm9yYXRlIG11Y2ggbW9yZSBpbiB0aGlzIGNvbW1pdCBtZXNzYWdlLiBXZSBu
ZWVkIHRvIGRvY3VtZW50IHdoYXQgZXhhY3RseSB3ZXJlIHRoZSBzeW1wdG9tcywgaW4gd2hhdCBz
b3J0IG9mIGJ1aWxkIHRoaW5ncyB3ZXJlbid0IHdvcmtpbmcsIGFuZCBob3cgdGhpcyBmaXhlcyBp
dC4NCj4NCj4gQ2hlZXJzLA0KPg0KPiBCcnVjZQ0KPg0KPiBPbiBXZWQsIEp1bCAyMSwgMjAyMSBh
dCA0OjMwIFBNIFJ1c2xhbiBCYWJheWV2IDxmaWJAY2lzY28uY29tPiB3cm90ZToNCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFJ1c2xhbiBCYWJheWV2IDxmaWJAY2lzY28uY29tPg0KPiA+IC0tLQ0K
PiA+ICByZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zX3ZpcnR1YWxpemF0aW9uLmluYyB8
IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM192
aXJ0dWFsaXphdGlvbi5pbmMNCj4gPiBiL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNf
dmlydHVhbGl6YXRpb24uaW5jDQo+ID4gaW5kZXggNTUzMDFjNy4uNDgxZGI1OCAxMDA2NDQNCj4g
PiAtLS0gYS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zX3ZpcnR1YWxpemF0aW9uLmlu
Yw0KPiA+ICsrKyBiL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfdmlydHVhbGl6YXRp
b24uaW5jDQo+ID4gQEAgLTIsNyArMiw3IEBAIEZJTEVTRVhUUkFQQVRIU19wcmVwZW5kIDo9ICIk
e1RISVNESVJ9LyR7UE59OiINCj4gPg0KPiA+ICBERVBFTkRTICs9ICIgbmN1cnNlcyINCj4gPg0K
PiA+IC1kb19jb21waWxlX3ByZXBlbmQoKSB7DQo+ID4gK2RvX2NvbXBpbGVfcHJlcGVuZF9jbGFz
cy10YXJnZXQoKSB7DQo+ID4gICAgICAgICBleHBvcnQgTElCUkFSWV9QQVRIPSR7U1RBR0lOR19E
SVJfVEFSR0VUfS9saWINCj4gPiAgfQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjI2LjIuQ2lzY28NCj4g
Pg0KPg0KPg0KPiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVy
LCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgDQo+IHRoZWUgYXQgaXRzIGVuZA0KPiAtICJV
c2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KDQoNCg0KLS0NCi0g
VGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFk
bmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2Fu
ZGFsZiwgU3RhciBUcmVrIElJDQo=
