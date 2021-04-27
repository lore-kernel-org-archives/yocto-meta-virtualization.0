Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.51])
 by mx.groups.io with SMTP id smtpd.web12.5063.1619506500785601698
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 23:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lry4GKNT;
 spf=pass (domain: windriver.com, ip: 40.107.236.51, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYR/zabS71NeoqUAvyafL3acZDLEWTlZBa6U/Y/3otTBkx1dDrD8fdR9nmpxh1whuURFwowq1iKch5TIQLsM18ILZ8kCB3oQlWx8XiQNIohuYBA0WUysSKF2y3Ffo3Mli2JcZZPQZWRj+XJSkop+zxNjfeLSACmgaw0J7JPRNhL6v1DBwCZyoAtAwre9GuGQL2zPlDwKQPzBqwtZyMIQzJ3K6bFHGy2xnTE6DgVyMrB00Wu4rr7G+JZTXPhOWuinq/qnaHXbFpv+9LIAz+4hlbsAPPyB86/UefwQnUgI7MxIxveJVPR5XqnjSK8qnVmEK5Av53y6OT0ekGc4CpU/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbYXngyr/p2jarzltOvS4DQw7ljcItnvkEPkTDrvgWU=;
 b=f8EflZLbIM9WDBk/Drpu3/Js+9zZqw7KUsDPioobqLPee1ZpfC9y1a7HdtOb6DNW+YQfaqxJUIYBar9rA8JEeK9rgWE++5rNuF+hOIHDQZq/E371CNcdqsP1uOZM8KS/c2rs0oDqWcr/NH9UgOiZUE6j1yOriDqhO8iY3jxhCacgWOwqu4vbfbObS/XmMGiNK60Nv1PDM/8fyCKvNl1MUFfqR0lZ7CCFLybLIw0AQno7cw++i9xCficqvq6TI7LqY8oqHseI0tnGtQqbfj80eoQToYmyqb93/02m87hPzB5QrA4m0XIUaOOdP/HNq0y+xhkaDyTXMXz0+yr5mD9wMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbYXngyr/p2jarzltOvS4DQw7ljcItnvkEPkTDrvgWU=;
 b=lry4GKNTjnefzbhNEp5gXXZQxtJ/wjdjCwH7nXV3CZwSfPsfsag7aG3cJZf/5YhNsAva2ILeLIYIxxkWAPPoG9QSgfpqPd1sbP9FJRDTdaBZyxLztNSRapihMbYIqJ4OEqvEIyaHOiPySaeGEXurjDDLYfoJY8CVS40YxmBrnx4=
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM6PR11MB3801.namprd11.prod.outlook.com (2603:10b6:5:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Tue, 27 Apr
 2021 06:54:58 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 06:54:58 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: Bruce <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Help on openvswitch
Thread-Topic: Help on openvswitch
Thread-Index: AQHXOzFR1u+PL85GCUaB3pK/EDn6KA==
Date: Tue, 27 Apr 2021 06:54:58 +0000
Message-ID: 
 <DM6PR11MB42022546C341761BE3193E74FF419@DM6PR11MB4202.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13843a22-2033-4691-d1e7-08d909495f4b
x-ms-traffictypediagnostic: DM6PR11MB3801:
x-microsoft-antispam-prvs: 
 <DM6PR11MB380109E613A6564F463C836DFF419@DM6PR11MB3801.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pj9cciduh/+7wJkzPqOjAGNKlDN9s8mjcbDJjfd+PAiPgwkDSr/mQoKRIsIILBu1NAaXAwpcuwumlcx/9Wmx8zUMxCoplHiO4w1OOszersE7+Qv72N+WLRpFvVXOc0jVacKS52fDj2a/shBaesnSgW15N5co7tXcoHAbxQAMQ09TS3j2uHkESiahKAMzqoJEpZVdXyLnGRKD2RG69uV4f7Ix3/H4AANN0QZd5k6Z4G1hlETdM5cPUlZL3E+Bji3jhn82vC5AVWX4MdyACgB0NBGwK/Q64CCuvupNlUdYDdTV8zRC25qHEWzNzr8hhlo41vOPq8vo/uNAueNwlicopr+pxbHB8NXjYjISXkNe6tgzKSGCiMGJ38yKvUOmcqdACjlN28RXeRczSqXcrqU3VsSCZfsavqPip0bQ0rLc+8UEl3aCHhayqNmy982GY6GQ9pD8/pPuheNi5WC9OXB5MeVrgDnncvn7eNckYJAzLq0Gi9bzxkHaknZbQkfhaZS2rRgTJBtW73fzY1muspHu89TdX/UR4PTcztHf39xGh7wyFKi4ROTiJTBrLBQwS6lFAmLw/VfhL9EAGQ3HK8RXWw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(366004)(346002)(376002)(396003)(136003)(186003)(7116003)(478600001)(9686003)(55016002)(7696005)(2906002)(71200400001)(76116006)(66446008)(66556008)(64756008)(91956017)(66946007)(6506007)(4326008)(86362001)(66476007)(38100700002)(5660300002)(83380400001)(26005)(8936002)(6916009)(33656002)(316002)(8676002)(4744005)(3480700007)(122000001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?NzlFWGN0U28wNGpWT1hXZTFDZDBTbFUrOGorRTQ2S0ptKzVlc3FnY0lRYmRw?=
 =?gb2312?B?QWpiL1EzYWZMZ2FOV0l3WTJJbjJid3FlUThseWxrUjU1NDNkVWdwaFl5ZVZC?=
 =?gb2312?B?eks1czFOQ2JDS2IrWWFjdkYrZlBlSXJ0MWVJOXpRZUZHVjc4VUF2RG9VL29R?=
 =?gb2312?B?bDdnWlFUNGVwdXpVMDVnMCthSklCWkdWaldjK2QwaEJ5Q3gwdDVOOGtRWTVa?=
 =?gb2312?B?UGdrOE1xOTE4cWI1VXgrTHNXWUttVUx2MUFlbGVLcHVJa0UwYlVYSG5UUXpz?=
 =?gb2312?B?M005ejY2T2E5Z0g3TkhjaitwVjhGVGQ0dDAwVS9BL2hwa2M5c0hXbXRtaWNi?=
 =?gb2312?B?ditzU0QyQjBkZU5NZnJFN0JJaDA1dkhHK0wxRCtaTjFwblhQaFI1R01BTUVV?=
 =?gb2312?B?Mitrd2JqVEpDQXpWS21RSjNGVU5wZHVKeDNjN3phMjVBaDI4UWxLWVltREN6?=
 =?gb2312?B?V0RoKy9QM0lPczdMdTlRbFJRaFZkOG9VYzNzQjhVMG90TGFZWDJFS3NWQXRv?=
 =?gb2312?B?OTRSZ2RDQ1kwTVpva1MvR2xtOEVsMm0vc1hSMHNzQW1nSm9sVFg2QWE2QnN2?=
 =?gb2312?B?eHlqNytxY3RWNkRCYjRZMGZFUDNBQ0wvQSs1dFdiNkh4QkxYWGhBSUdwdFZp?=
 =?gb2312?B?SG01L0RsNFo2cUlveGtYVVFDR2YzUEdqbURiaXZ3ZlZYUUJEZ0Z1QnBrWHJO?=
 =?gb2312?B?ZXo4S1kxNGVBRFlMZmxXZXJhRHM4UHlkVE1wWjQ3ZHZOVS9FTFV5YUV3dXdN?=
 =?gb2312?B?T1RvNklScGFRNm56Zy9sdERQL251NllqMXp6d2hha1YrT1BKcllGd2lwdVJI?=
 =?gb2312?B?amFCenBINXcyTjNwMXVrOFpUa01CcGJEdklPcjFneWtSZlVDWXdxOUVhdFhT?=
 =?gb2312?B?K1FkOE1BOWV0SGtxVVhQQ1I1OVZTbTVuSW1venE2ZHZwTlZIMFN1WFZMTXFm?=
 =?gb2312?B?S3hpaDN5ME1BVjBtR2o4M3F1VmZQanZTSEo5Zi9CTlV1QUlOR1g2VmJVNUFq?=
 =?gb2312?B?M01tUjA0VTZkRnpaUXkxNTQ5czZkNUZ3S2dDcEFKWElZNVJNZlpyRmZzeC9w?=
 =?gb2312?B?NlZGREczYmRxWDNZKzRYbXhHM3l2L3g4RFExRHRjakx3SXdQTkNQS3lLU3RV?=
 =?gb2312?B?ZEJLY01mRWI2ZDFUOXpZVUs1Q3VrYng2SHZZUngwZUFRTlJxTFhsSWtybkgw?=
 =?gb2312?B?Q1pPS3Baamg3M2JLaWNBYmpmYXpSN2pLTmFtVkczMlI5S0h2dFMzT1FVL09y?=
 =?gb2312?B?clcrT09QR2pSUk41Um52Ui9UK1AvWitSNXhSSFhNcTBkSitJTkx6MjdjZ3py?=
 =?gb2312?B?MkFqV1BwdGFtdWdpUzNFdmFvcHZVZU9sbWVrMldScUFCRFp4VE5VeVp1UGlP?=
 =?gb2312?B?amNSQ0dJS3g2TkEwTzB6eDh6NDBGQURBUllpbEU3dFF6R1duK01WS3JTTmZj?=
 =?gb2312?B?M2JnTm5JdVRUdW9YMFNMeHpaa2JudmRobFlGNGp3dDdBMWx0VzllZStibDhL?=
 =?gb2312?B?WGZ5NEVyT0RUUjRMR0pxTHN1VVYxTW5OLzdxT3RuSHQvNWtEd3NKY3ltRFRY?=
 =?gb2312?B?Ym9oNkRLc1U2QWxIOEN6aTR2RzBkWENpTXNNTDk2a0dMakx6S3pnSW5Db1kr?=
 =?gb2312?B?b1h3Nk9QZWlGR1R1UnRiYmllaWl5cHlwWHY1NGI1bUxUYlB5Y0ZHd1ZGWVM1?=
 =?gb2312?B?K0t2MlJURDIzR0FoYy9xQjg0cEYzdDkvSnByV0l4K0huSURia3pZRGR0Z056?=
 =?gb2312?Q?UoHf5Rpb3CTlLlTrsk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13843a22-2033-4691-d1e7-08d909495f4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 06:54:58.4553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcmKn5ELP+Mr2E5a3PPMQVjjCTEHW8aDrt27inXib9NSpM/wKCDLySe0ZOZ0o0dxN17WUSJ0QOKtOQ2RU7nx5N9rul6ThcxALLkahmu9z/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3801
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gQnJ1Y2UKCndoZW4gb3BlbnZzd2l0Y2ggZW5hYmxlIERQREssIHRoZSBkb19jb25maWd1
cmUgd2lsbCB0cmlnZ2VyIGZvbGxvdyBlcnJvcjoKCmNoZWNraW5nIHdoZXRoZXIgZHBkayBpcyBl
bmFibGVkLi4uIHllcwp8IGNoZWNraW5nIGZvciBydGVfY29uZmlnLmguLi4geWVzCnwgY2hlY2tp
bmcgd2hldGhlciBSVEVfTElCUlRFX1ZIT1NUX05VTUEgaXMgZGVjbGFyZWQuLi4gbm8KfCBjaGVj
a2luZyB3aGV0aGVyIFJURV9FQUxfTlVNQV9BV0FSRV9IVUdFUEFHRVMgaXMgZGVjbGFyZWQuLi4g
bm8KfCBjaGVja2luZyB3aGV0aGVyIFJURV9MSUJSVEVfUE1EX1BDQVAgaXMgZGVjbGFyZWQuLi4g
bm8KfCBjaGVja2luZyB3aGV0aGVyIFJURV9MSUJSVEVfUE1EX0FGX1hEUCBpcyBkZWNsYXJlZC4u
LiBubwp8IGNoZWNraW5nIHdoZXRoZXIgUlRFX0xJQlJURV9WSE9TVF9OVU1BIGlzIGRlY2xhcmVk
Li4uIChjYWNoZWQpIG5vCnwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElCUlRFX01MWDVfUE1EIGlz
IGRlY2xhcmVkLi4uIG5vCnwgY2hlY2tpbmcgd2hldGhlciBSVEVfTElCUlRFX01MWDRfUE1EIGlz
IGRlY2xhcmVkLi4uIG5vCnwgY2hlY2tpbmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyBkbG9wZW4u
Li4gLWxkbAp8IGNoZWNraW5nIHdoZXRoZXIgbGlua2luZyB3aXRoIGRwZGsgd29ya3MuLi4gbm8K
fCBjb25maWd1cmU6IGVycm9yOiBDb3VsZCBub3QgZmluZCBEUERLIGxpYnJhcnkgaW4gZGVmYXVs
dCBzZWFyY2ggcGF0aCwgdXBkYXRlIFBLR19DT05GSUdfUEFUSCBmb3IgcGtnLWNvbmZpZyB0byBm
aW5kIHRoZSAucGMgZmlsZSBpbiBub24tc3RhbmRhcmQgbG9jYXRpb24KfCBXQVJOSU5HOiBleGl0
IGNvZGUgMSBmcm9tIGEgc2hlbGwgY29tbWFuZC4KCkkgZGlkbid0IGZpbmQgb3V0IHdoeSwgIGhh
dmUgeW91IHJlcGVhdGVkIHRoZSBxdWVzdGlvbj8KClRoYW5rcwpRaWFuZwo=
