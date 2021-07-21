Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.99.1626899828759821154
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 13:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=G5x39dKt;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2382; q=dns/txt; s=iport;
  t=1626899828; x=1628109428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lhpk86YpyILeEXV9/orMq4XTxV/vrnicFeBV2fZvGhk=;
  b=G5x39dKteZpLJqzMNlkhgpJo9lXZR5jObRIIndtMC9f7ElaXJJDx5TJz
   HRQrbXfXhzp9qX+iZ27q8xHCkHShpXoX9HaDertzfAJhJuPtY9x2E/Is1
   KSUjAfL9isv9pwdjnnXAP8s7sOn0ibNF2veOsp9ppYGkAmvutFXufPmXY
   I=;
X-IPAS-Result: =?us-ascii?q?A0DQAgDmhPhgl4oNJK1aHgEBCxIMQIFOC4FTUX5aNzGES?=
 =?us-ascii?q?INIA4U5iGSBEIlHj1mBLoElA1QLAQEBDQEBKgMUBAEBhFcCF4JeAiU2Bw4CB?=
 =?us-ascii?q?AEBAQEDAgMBAQEBBQEBBQEBAQIBBgQUAQEBAQEBAQFyhWgNhkUBAQEEARERE?=
 =?us-ascii?q?QwBATcBCwQCAQgRAgIBAQECAh8HAgICHwcKFQgIAgQOBQgagk8BglUDLwGdB?=
 =?us-ascii?q?gGBOgKKH3qBMoEBggcBAQYEBIUuDQuCMwmBECqCfIQOhmInHIINgRVDgis3P?=
 =?us-ascii?q?oIggWs7gxU2gi6DG2MrCIE8lk+nKFsKgySBMZU9gWuFehKmXy2lQpUlAgQCB?=
 =?us-ascii?q?AUCDgEBBoFiCyeBW3AVgyQJRxkOjh8ZHoMhGYpecwI2AgYLAQEDCYlJgkcBA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:WWWUtRKN+3g/a4WZHdmcuXsyDhhOgF28FgEQ45sjzblJd/fr85fjO
 RnZ4vNgxB/MUJ7A4v1Jw+zRr+j7WGMG7JrA1RJKcJFFWxIfz8lDmQsmDZ2KDET6KLjhaClpV
 MhHXUVuqne8N0UdEc3iZlrU93u16zNaGhj2OQdvYOrvHYuHhMWs3Of08JrWMG11
IronPort-HdrOrdr: A9a23:ZFwNQq7LWiSh69nhgwPXwZCCI+orL9Y04lQ7vn2ZFiY1TiXIra
 6TdaoguiMc0AxhJ03Jmbi7Sc69qADnhOBICO4qTPeftWjdySqVxeRZjbcKrAeQYBEWmtQtsJ
 uINpIOdOEYbmIKzvoSgjPIaerIqePvmMvD6IuurAYOcegpUdAc0+4TMHf8LqQCfng/OXNPLu
 vk2iMonUvFRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1UjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3DRY0eTFcBcso+5zXYISdKUmQ8XeR
 730k8d1vFImjTsl6eO0EDQMkfboWwTAjTZuC6laDPY0LzErXQBepd8bUYzSGqH16Lm1+sMjJ
 6jlljpxKZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh4LD30XklW6voJhiKorzP0d
 Mee/309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0Uso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrIkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MS2AtPTWu4hjDr1Cy/PBrZbQQFi+oWEV4r2dSq8kc7/mst
 6ISeZrP8M=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,258,1620691200"; 
   d="scan'208";a="724516100"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2021 20:37:07 +0000
Received: from mail.cisco.com (xbe-aln-001.cisco.com [173.36.7.16])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 16LKb6F9006771
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Wed, 21 Jul 2021 20:37:07 GMT
Received: from xfe-rtp-005.cisco.com (64.101.210.235) by xbe-aln-001.cisco.com
 (173.36.7.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 21 Jul
 2021 15:37:06 -0500
Received: from xfe-rtp-002.cisco.com (64.101.210.232) by xfe-rtp-005.cisco.com
 (64.101.210.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 21 Jul
 2021 16:37:05 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xfe-rtp-002.cisco.com (64.101.210.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Wed, 21 Jul 2021 16:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obK9DhbMOsFYzDAYr1KTMSjEM9PtnT2+XNVgCLkPaU/kvCoaQlutGy6peZMnphhEFhIaToyzWsvyZj7hV9KsY72aFVj3BSSlvOAisVZIjL3SoBf3Sd3UAOIaW7k73hgwTtDvzLiBloBU67KASdlUzgxJNjEKtW/lWefTxHdE7jDatbn1xfxpKEhCxcWsn1hyyAb+EtulkyHyrFoi+F8g2pvRJitJlgqK3w7FtB0X4u4pM/RLttVQ4/97rX8YcPqLKKI91vnbXNORwajgu/pMxgBTB+aQVM0CvzGZ36yscIvUQfgX3mULodaa2cDzxIusjc+XpO4glkRINWguoit29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhpk86YpyILeEXV9/orMq4XTxV/vrnicFeBV2fZvGhk=;
 b=lD4liP70sxuRnh5P3mCNMa8Lim6Ze6Ib5tYHkQSRb3t9/hklCyoVzueO7KoxjH6YEGllCP6c4Agay95UDsT4gBnlJMtXf21UbLOuFs284w1fAFC3Nrl/FlMIXMyqNEaEN8ghfLtbV3cfBWVn5Y9M2bgH333xke20L6dLEwtbTECG4YdQdNFTYMhWq8uvKnUQIorNIqA5HyTOuX0LpSpKNRGJogb1b967Vda1z/YwyNfEsqv5Jg62t2X6fcvOHACPVSdsKxgQ1XGe0mzwt3yEieIlJfI/v3kbIu+IMNyz7MgE9m2eqykt+zK8vrMnmsZUjbTSsxTRE8MKjlchNxlXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhpk86YpyILeEXV9/orMq4XTxV/vrnicFeBV2fZvGhk=;
 b=IAuSKWRKQ7O5ZuIBWhfNxZpa2yJ4OArtZEogTn5B+oaAq5QotUP33p5zW8vSRqVqkP/wSw1icI5T7/C9D1f/D+TEtMttb+2ukMz9f1bIqHV07J9mxhbN9y8Uu0XqpinRV1R/iLinln9uB2Z6n6GmaIwS5SoJSqTTqjC6sDPhmag=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 21 Jul
 2021 20:37:04 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%5]) with mapi id 15.20.4352.024; Wed, 21 Jul 2021
 20:37:04 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
Thread-Topic: [meta-virtualization][PATCH] python3: unbreak python3-native
 when virtualization is in DISTRO_FEATURES
Thread-Index: AQHXfm83bnU8N4frvEiMNcIFL78GGqtN4geAgAAAbkA=
Date: Wed, 21 Jul 2021 20:37:04 +0000
Message-ID: <SJ0PR11MB4784EFAE3A9972B942B88D17ADE39@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210721202955.137761-1-fib@cisco.com>
 <CADkTA4M_d3nrJWxo7rNJjPgZMus1jz_t2-y_qrTp3A4AnNL1QQ@mail.gmail.com>
In-Reply-To: <CADkTA4M_d3nrJWxo7rNJjPgZMus1jz_t2-y_qrTp3A4AnNL1QQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adac5a19-b456-4a10-b2ac-08d94c874cff
x-ms-traffictypediagnostic: SJ0PR11MB5167:
x-microsoft-antispam-prvs: <SJ0PR11MB516744EA5983CDF6FADBACB3ADE39@SJ0PR11MB5167.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 38dgl5RksBL79OGA6BczbImxXzwv9J1m7q0eh2cZf7g63LvNXr5yQBmiL9yjQ6zw+hPKb1bEdyJ+q3pt4vyh850s1EViTsFy1wKQVWmVnhpsVVpv3TQosC/ZsdQZp59vE95rxRpf/MdWlhRQfrhCu0DOLWoowmzyjTzLFxGcn2gOwXXXjkEZ5FD4f5ezSTGB6qPPxuvKl6bzkpRIE0Vr9qMpZFcw1fNF7PRlCYeiijXJItaiQkmYI56yO8wVM3uFGJjWxiy2+YjGdALO3yCDU7zrmxVi16fOaS9UHJ029TWFVUiyqofHP6tQRJjjaltEjUWlz0F52HWp/Gqa+9C3HAGdc4jetS2WOyJStoRY8Gr4yfn00fuZXhc8EPur+Yht+RFfY5HQZSTSVQ90a7OoK7biFo6q61O6AKlvP6O6qZNez0Zk+6QkCUvshl8qfFq2g04uk16sjyZ3leQSFxC/i6mGhufW1S/BPuuPYbt/QXSHtAnZ71ZH8UB5SZPqPSKsdSOuZiPKnXg+of2Fa/JUYljy89v7Tq+CqMng3CsMWB44Ll9GPtWbq1B+aXgmuaoRdo2MuOFYnlMLj7vmSvvOk97ID9Ow+ZlaeYKqIsI1XAZ7YhtDYR0HDgSN1FOdv24uwetsLrBb4kOcmHUB9h7xwJFeg0e7ZSDJ18czr2m/AdjAM/tE+FbZ6zEwYpCk1rIqfhf3ITANMfgRtTu091nqkg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(39860400002)(346002)(366004)(33656002)(9686003)(71200400001)(26005)(2906002)(38100700002)(316002)(55016002)(122000001)(186003)(5660300002)(66476007)(66556008)(64756008)(66446008)(6916009)(6506007)(478600001)(53546011)(76116006)(8676002)(86362001)(7696005)(66946007)(83380400001)(52536014)(4326008)(8936002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEdrc29reGxxZjlrbHVmemxhcThjcjZGRzF2NDVKbStrenpZOEZ1NDIyc0d4?=
 =?utf-8?B?d1dQYUIxaGE1QzgvRlFueHNMM3VjREgvMFdrNXhTRjlDdXV1MTNETmpVRXhT?=
 =?utf-8?B?V1lDYTljMThBRFduTk5nWE1VTGlLQVNNWE9kU1F6WDQyM3o2TVh5d1FaQTI0?=
 =?utf-8?B?bXdqTDFEclFGMElkZHVtRXlWMnI3MHZQQTNsZ0daVXhGMHhrZmx1SHZ1cnJE?=
 =?utf-8?B?MmFtT1orUmpuZzhNVHhMQTVkTjMxK2ZUdXU2eXM0eTRjM012THZDckY0NHlF?=
 =?utf-8?B?SUFERW1VV0ZWZEJYNVZWUHlCSDlJaUEwbFNlZHdjWS9aMWM1U1NMQ0hXbnZN?=
 =?utf-8?B?Qmx6VjVRTG5EUlFhWlBqY0tsT0VNcXozOUF5elZyWXMwbTZ3eWY1K2c0Ny9i?=
 =?utf-8?B?bURZTWxWR2hKVU9OdUg5Q1dNNGhEdXdXR1dYK2NyRU1CNFNCVjFKbXhCd1VY?=
 =?utf-8?B?NkpmUXltUWNmSitBeUdYZkEvUlc2ZVRCVUVXVXZRTDIySXYySVU5WWVpS3NT?=
 =?utf-8?B?d3U3Q09uM1VBSC9xTTFaOC9LVkQ0aEZxN2tib04xTUUrbGgvK1hEeThNQjRZ?=
 =?utf-8?B?dHNuV1hPRXJpdzRSeEE0T1d4cXZCZWdwT1N1WTcxWUppdlJCTE1udU5PSlk1?=
 =?utf-8?B?d1BoMUVsSzVOTHQyaGxwcGNCVUJydDluUzNhTXh1L25PWFJtbS9JdVhaaTVr?=
 =?utf-8?B?RXZDTStTd3ZLWGNQSlBSQ1VCUkx0K3lOYTFYWk9PQXNFU2tKS1dvNUFnaUFo?=
 =?utf-8?B?U3hUQjBYL3M2MVdYR08wZ0FsNVY2emVnbmt4MGVVNlFSc0pVS0FYckNFWWNz?=
 =?utf-8?B?bEg4cGZmS0lDejJIbXM1VnVqTyt1Q01rdDVNZ1dhMEdjTGVGWlgyM04rakhK?=
 =?utf-8?B?UTJPLzdPYXJaTUJOeXNzcDJva29Nak9yZmxXdE56QW11am9wZTh5OEdjK3dr?=
 =?utf-8?B?SERQZGpuU25nakQ5Zm1oQUZlSEc1SUsrVzZIN2lFUHh0SlNMQ1l6UFZZNE5n?=
 =?utf-8?B?ZkozaFFtYTNrUk5PYjA3RVN3U0FvOTc5NFp6U3pza1lydU9pVFlETlA5bGwy?=
 =?utf-8?B?RlVMSWh2NnlkbEZnNDBVT2M3L09yRERhTytrT0ZXZ3NOVkpoV0plQnl6NWxa?=
 =?utf-8?B?UlltemxrdFVXS1RRNWVEemdhY2QyWWZWWEg3TitTalNpV0ZkT3VMTThGMnFj?=
 =?utf-8?B?VmlLR1lIYjZ5eU54VytWT0twN2pIY0JjWEJ2V25zQnhpcGVzVEdXYU14dzVm?=
 =?utf-8?B?RDFnNEx5MVYyYkFLWlVGVnQwWTVKUlNBdC9hZ0pVVlVMTTdHamRML2JrTDJT?=
 =?utf-8?B?dzV0Mzh1OVJiNWFENThIVXpQeTdGSmdNaVVQaER1Y09pSVY3d1hhVHVoR09O?=
 =?utf-8?B?NmhaSW9UUGJVNTA1NTJaTmJ2NUplZ3Jia2Zzd1BqTE93WkdpQzZVOWhBVVhJ?=
 =?utf-8?B?anBuM3B0dUpKQmYzaGR1UTBWUkloRnVmYUdCaGlsOVViUmNIV09kbFJYeXVS?=
 =?utf-8?B?cEVuYklkRnYvNWZEVkc5T2xOeXBaQmpoWklLeEU2Y214bksyekZuVnVONnBa?=
 =?utf-8?B?bDMxb3BNWG1zRHdlaFlaanFCNkNESUdVOUgwbmxWazRFc1VZWGFwNVlZY3dr?=
 =?utf-8?B?eGhaZHNLNmRIYml2eHpWSGhuUzNLK0pXL3IvanlOOEdKWlcrd1JvYzcvTGtu?=
 =?utf-8?B?ZVFtVXlJRlYwZ0EwTVlIOTU4ZkJ2M0tocUp4N3ViMW05L3lBdlpDbmdkMGJX?=
 =?utf-8?Q?zgTzZF3A4M9CTpIZkI=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adac5a19-b456-4a10-b2ac-08d94c874cff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 20:37:04.3846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDquJyGo8U9lzo2jUkbvxXj0Miy+Shy+4ZWc6sEHqq076ioQ4U5Y8AvV/jmTyQKk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.16, xbe-aln-001.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QmFzaWNhbGx5LCBweXRob24zLW5hdGl2ZSByZWNpcGUgd2l0aCBESVNUUk9fRkVBVFVSRVMgd2l0
aCB2aXJ0dWFsaXphdGlvbiBpcyBicm9rZW4gZHVlIHRvICR7U1RBR0lOR19ESVJfVEFSR0VUfSBi
ZWluZyB1bmRlZmluZWQgYW5kIExJQlJBUllfUEFUSCBlbmRpbmcgdXAgYXMgIi9saWIiLg0KDQpJ
IGNhbiBwdXQgdGhlIHBhcnQgYWJvdXQgJHtTVEFHSU5HX0RJUl9UQVJHRVR9IG5vdCBkZWZpbmVk
IGZvciBuYXRpdmUgcmVjaXBlcyBpbiB0aGUgYm9keSBvZiB0aGUgY29tbWl0IGlmIHlvdSBsaWtl
Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJy
dWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMjEsIDIwMjEg
MTozMiBQTQ0KVG86IFJ1c2xhbiBCYWJheWV2IChmaWIpIDxmaWJAY2lzY28uY29tPg0KQ2M6IG1l
dGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFtt
ZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gcHl0aG9uMzogdW5icmVhayBweXRob24zLW5hdGl2
ZSB3aGVuIHZpcnR1YWxpemF0aW9uIGlzIGluIERJU1RST19GRUFUVVJFUw0KDQpZb3UgbmVlZCB0
byBlbGFib3JhdGUgbXVjaCBtb3JlIGluIHRoaXMgY29tbWl0IG1lc3NhZ2UuIFdlIG5lZWQgdG8g
ZG9jdW1lbnQgd2hhdCBleGFjdGx5IHdlcmUgdGhlIHN5bXB0b21zLCBpbiB3aGF0IHNvcnQgb2Yg
YnVpbGQgdGhpbmdzIHdlcmVuJ3Qgd29ya2luZywgYW5kIGhvdyB0aGlzIGZpeGVzIGl0Lg0KDQpD
aGVlcnMsDQoNCkJydWNlDQoNCk9uIFdlZCwgSnVsIDIxLCAyMDIxIGF0IDQ6MzAgUE0gUnVzbGFu
IEJhYmF5ZXYgPGZpYkBjaXNjby5jb20+IHdyb3RlOg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBSdXNs
YW4gQmFiYXlldiA8ZmliQGNpc2NvLmNvbT4NCj4gLS0tDQo+ICByZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zX3ZpcnR1YWxpemF0aW9uLmluYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uM192aXJ0dWFsaXphdGlvbi5pbmMgDQo+IGIvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uM192aXJ0dWFsaXphdGlvbi5pbmMNCj4gaW5kZXggNTUz
MDFjNy4uNDgxZGI1OCAxMDA2NDQNCj4gLS0tIGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uM192aXJ0dWFsaXphdGlvbi5pbmMNCj4gKysrIGIvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uM192aXJ0dWFsaXphdGlvbi5pbmMNCj4gQEAgLTIsNyArMiw3IEBAIEZJTEVTRVhUUkFQ
QVRIU19wcmVwZW5kIDo9ICIke1RISVNESVJ9LyR7UE59OiINCj4NCj4gIERFUEVORFMgKz0gIiBu
Y3Vyc2VzIg0KPg0KPiAtZG9fY29tcGlsZV9wcmVwZW5kKCkgew0KPiArZG9fY29tcGlsZV9wcmVw
ZW5kX2NsYXNzLXRhcmdldCgpIHsNCj4gICAgICAgICBleHBvcnQgTElCUkFSWV9QQVRIPSR7U1RB
R0lOR19ESVJfVEFSR0VUfS9saWINCj4gIH0NCj4NCj4gLS0NCj4gMi4yNi4yLkNpc2NvDQo+DQoN
Cg0KLS0NCi0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFv
cyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFy
cnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo=
