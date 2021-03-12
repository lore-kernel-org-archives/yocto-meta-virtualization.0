Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.78])
 by mx.groups.io with SMTP id smtpd.web08.5317.1615535877964430487
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 23:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eZ69OS3H;
 spf=pass (domain: arm.com, ip: 40.107.14.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzPmrlHFTwj+hp10+vDIJZuoDKMeH6LD6gJM9C4CXfg=;
 b=eZ69OS3HxaCUmge8rQWnOX56J4bTBQZm4VOgrYPyZ9W3ndRVFjg6n70QIT9zKZ/zMIFEvL+cV6E+migI7kCZtDgh/RJzqhEVshNfhFZWBMhCbkoJxiEKFHDO9tKjCeVja7TVu5lDrHadG5B/V9YE5wS4o/xIYsjyajFdqnWyVEU=
Received: from DB7PR03CA0078.eurprd03.prod.outlook.com (2603:10a6:10:72::19)
 by AM8PR08MB6323.eurprd08.prod.outlook.com (2603:10a6:20b:354::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 07:57:50 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::2a) by DB7PR03CA0078.outlook.office365.com
 (2603:10a6:10:72::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 07:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 07:57:50 +0000
Received: ("Tessian outbound 24a7072fdae6:v71"); Fri, 12 Mar 2021 07:57:50 +0000
X-CR-MTA-TID: 64aa7808
Received: from 91bac3b71147.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ABC98FB6-C273-46B2-9980-F9BDC062D684.1;
	Fri, 12 Mar 2021 07:57:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91bac3b71147.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 12 Mar 2021 07:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH/T+mm5MDWnTpd0u11hkny2JwOcUzz+z2ixvszkkyKdtL6jqktxmr3N/bUPVSjlXxZL4vajvzUJtaWVnz3iTQrzhErFGsMGvwbEJNox3VYcuZ1RaE2AGdzrGCyYYcrxSRo1SgGn5tf6LIJBXCBObevW1MgyBL3wLPSuDqpvTqW5X4bgHV1vD1pCV5lAkgADcyzyX8Ou7cDNbqmlkcvww5nv7Zr92HXjsdFBy+iGOsmAJKyRTTp1nGQFy1Tp9z/CMHjpq7hSZ9MAE1scvKMUub302MJNfVeVhO+zINZix1sJcQ5vCvOAgO2F0M9/BNQSAHh62TGYp0GgfFleLj9UIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzPmrlHFTwj+hp10+vDIJZuoDKMeH6LD6gJM9C4CXfg=;
 b=aua04ZABGtBiV7UEdriJeoMv2qP7mn+hbkKPpopQAprb7z/QCFDOmY8Vs3GeWUhjeGririG8+LphhxZ19U/Bo2Par3yAy6I/RGsxb76sZWmA1P70iKvGzD0jLzAs4A8Eq8VFAwz7gqikq1q8qV/HyUXVsOSKAPl+TtJhZqNuvW9E/TMN9l6sypF+nFkEF7XyN9bcDZde+qz/rAdInlGXKgW7RElmBUWnTaLG0nMh/o0afYKp9rt1+3tGV+yC8Fd8VXM8H8S/KNQkTvOCvb376ndqnLeyqQK3pAWwoHLmfY6IFwf+DEfMvDIub49Ii2IwpAO/zKUtcpwsvI0V7zOLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzPmrlHFTwj+hp10+vDIJZuoDKMeH6LD6gJM9C4CXfg=;
 b=eZ69OS3HxaCUmge8rQWnOX56J4bTBQZm4VOgrYPyZ9W3ndRVFjg6n70QIT9zKZ/zMIFEvL+cV6E+migI7kCZtDgh/RJzqhEVshNfhFZWBMhCbkoJxiEKFHDO9tKjCeVja7TVu5lDrHadG5B/V9YE5wS4o/xIYsjyajFdqnWyVEU=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6087.eurprd08.prod.outlook.com (2603:10a6:20b:29c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 07:57:44 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 07:57:44 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Updated status of meta-virt roadmap
Thread-Topic: [meta-virtualization] Updated status of meta-virt roadmap
Thread-Index: AQHXFuzYpS4s6LMvX0eWg2SFiFA75Kp//Gqg
Date: Fri, 12 Mar 2021 07:57:44 +0000
Message-ID: 
 <AM6PR08MB3461BEEFCDCE07BF09C5BAB5926F9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <nDbt.1615459289447454507.U8Ef@lists.yoctoproject.org>
 <CADkTA4PFB7RiWXLC5MHW=3DfpX55O539RUH02mS=8g_1dZCJjg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PFB7RiWXLC5MHW=3DfpX55O539RUH02mS=8g_1dZCJjg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 92AAAFED5876BC4BA225997B1BC8E0A2.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [151.231.90.23]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c7877d18-73d2-4775-1397-08d8e52c8871
x-ms-traffictypediagnostic: AS8PR08MB6087:|AM8PR08MB6323:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB6323A2CCABE818C3383C23E4926F9@AM8PR08MB6323.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AkgCjRKLMXTlbAMPjj0N0a8j1eVzc1nmjgampjh30vU+29L9mpaAlhUBZxMYZpKzSAzTPXgRBL7GtgJ1jOiEhDjCvZEiVes2biL+6mzpgQLsHsK0FpIj2f6TmjVV+gWsBPpzNFlxqKbYYGXRHS1tod/1uq9QGZne0kB0tyjxBpCQz5vaxaoBlst61qfu/B8eOtE4RaJ6qHi0CFoTGETf1ZBfsfGuFBqoewpbl+mK7xc3kyGxbjnwJ3GoAvxOi7CA3NUAls0WTotxPDhnlDqkSYjvsJFIAMQoBztINq5cQ1/vW21QzkYNMNHiXJl3IctNAJHA9lFCrdnQ5pnJd8ksIRCQnndH8Z/khyJ9nUdgp4MN8gChWgn0S2YWjDRl95ChlfgWTsUk98SPVMWw3LJG+MZrrXg/jlh8o4qsjb68YzWLYH+W6LPCDRHnpqcndMgWvSHCRANbW/Og+3qpoeMcKIOD2C8zxnN6cBdhV14OU60ER5tvVCI8RuUi9NsWJY6m4IoqQ3wJCOfxj9yrAQZ0sdYt7hy4MYqDXYmBnHoyXB6UDWjq0+/GEmW3DaSHFlGRo5RwggyRucI0TB+GqpMmpk3tVioMRM+WRhWb709B1Ic=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(55016002)(6916009)(4326008)(8936002)(52536014)(26005)(6506007)(186003)(478600001)(54906003)(15650500001)(64756008)(66556008)(66476007)(66946007)(33656002)(66446008)(316002)(2906002)(5660300002)(76116006)(9686003)(7696005)(83380400001)(8676002)(71200400001)(966005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?OTJMVDV6MDlUbUtnbWJUb0ltY1NtYjlKWko0M29LT3RZQmNTQkVVdUpZVHgr?=
 =?utf-8?B?TGNXdzhhcUFkREdRcGlTL3pmWUVZMXlobXVjcTNJUk1sVzlGRU5FSzNOK1ZM?=
 =?utf-8?B?SGpPdlg5Sk9VYm8vUDlVWmVtM1E4cThXTkh5bTducUtmUGEyK2VueTlHUjh0?=
 =?utf-8?B?c3p1NktGWk5sVGRUVlhKaEkzKzZZbkhKczBOSlJSN292WmE0Q3VHbHZvSS92?=
 =?utf-8?B?TjYvcDVEQVF3Q29UTlUyaUJvZC9TSEcwcmRwejNsL3ZoNkJ3cXYrbEE2amVB?=
 =?utf-8?B?YkdHZUhha1JuRm5Fckw0WkZSRWYzNUtsK2NmRnFPOHplcFA5MzlCbnRTblRx?=
 =?utf-8?B?bU5vR3ZTNVczVTNnUkxMRDJ5RXFxcWxOODJkTUpMSUN6UXQ3VVBMV1ZBUmVh?=
 =?utf-8?B?OWcwWVM3RERtUVo2N0NTVWU4Q0FwdFRFVzUraTU1M3FkNjRIbXJiU0xqeHow?=
 =?utf-8?B?OVpnSmFlRkZoeENleUR5djZMN2FnVUxRazd5THI0T0RtMlNScy9rdVdXMWZX?=
 =?utf-8?B?VzFLbUNpTUd5UjN6cWU2bGc5cHBYTlllY2VrT0N6d0FpK1pVeE5QL1YvS2lm?=
 =?utf-8?B?b3RFT3BEMDczelNkU3FEWm5WTlpSVG45V2gra0JKRXFiV3lkWE1zclhpOTlJ?=
 =?utf-8?B?Mjk3QktuY2hPeGs1aU4waEZWcmwwS0xwR2tPaEw4SGVjMFVZQk82OGF1K2JX?=
 =?utf-8?B?SlhmWmY3SkxJTWM2WlBqQ0lmR29UaEprYkRYMTJrMmNyVENDT0tHY25uMDZm?=
 =?utf-8?B?VG8wMGdoc3lIYVRIKy9hSXE1dkNCbXlwcTYxSGtONHYybVdLMlhUU2c2TFFn?=
 =?utf-8?B?QU03Q1BEZE1xWnMyaGUxK0MwbERGS2dZaDNLOGRNcXZIUzVEQ3VJTjNjVER2?=
 =?utf-8?B?YTltekVyeDBLRWJPMHY1UVZyZVJQL3lhUVFXZzhwWWovWU5UOUNQa0R2VjZv?=
 =?utf-8?B?Mkx2aVJ3a0Z1NTNVOXJBbERtNlFUTVVyaS9ZbUk3OHlmbEYyMHpJTDRtTWJo?=
 =?utf-8?B?WVdtbVFXOWdnVEhMYmtEZmNLZ1BRK202WTA2NWNBNERkdWdLZWkyWEM5ekJF?=
 =?utf-8?B?WnVLaGVablc5YXBiaytOeXd0aENIaXlWZWt0Q1F2WVlCR3phdW5IZVRYZGZp?=
 =?utf-8?B?REZKR0dxTE5mcEF5WW1TQTVNbGdnWERqbUdhbjN6VlNOUm9RWm1sbHoyVlkx?=
 =?utf-8?B?M1Y0Y0k3ejRLV0NwV1ZCODdhVFJKa0lkU0MxdWdScmRBQmpQOFVjU3V4ZVBU?=
 =?utf-8?B?STVVZFVjQnVkcG9DWXdlQk52aVk5b09GK002VnRTWWJqQ0ptc0k5SWNqRGlE?=
 =?utf-8?B?eUhqZ0RjT2RjaU9VbXFlQmtQd2EwN3Q4OEZnbXRVUkdHTmU3Mm8wblgrNHh2?=
 =?utf-8?B?aEI0Z1ZNclZKa2dJOHV6NzFSZDNEQzRNTFZ1VlBUTDlmK2pPZVRCVGNLWnBt?=
 =?utf-8?B?ZWQyTjNVWkNMOXYzVEtYbVIrbmVkRDVTOGxOY1RnZG9hZTdVVnppck5CUkV2?=
 =?utf-8?B?VGhSNU5ndmVBV1JrbWFJQzQ1aFpJVmI1ZmRoUEl4MmE1eFhMRTBCeHVtRmxV?=
 =?utf-8?B?NmxKVklMR2ZlaXUySXFrN3BsZUpsOWhKMUluNUhJM1ozeEVUbkxvRFFRUm9W?=
 =?utf-8?B?bWhQZkVYR2x5WHdMUGVTa0x3VUJhR2xXYzRRTmNnU1I3UXhNWnNxRWdWL2tF?=
 =?utf-8?B?WEJ0MStqZGhBZFp5TzIva1kxQy9yczhld1pyeGdaaVNwVHVHYmRweWZpWGdQ?=
 =?utf-8?Q?cLaQKdh8GsTWl0zZ8hEkeZZdWCvaJUxv7q/R7Me?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6087
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3cc81f13-caa0-4271-a9e3-08d8e52c84e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+O7s6HabVUyqmAnostQvYrySf5BXERwP8ifvyTRSfIf9/o/kiMrD8/wjb8WSvIAr3GQQhglhB2YBRJQE7irKo5HbNHpQQfj6mepmhH/6hXCeLVzxrqGYiGnRYKS5T8gMJIDm/PuX6B21d+bCDdBX/rs5iUhvXD2o1JgMLOWQVc7liYtGNSvwA38SVKD6O194pOMY2XR2AXeu2MfagMRqzXD9S7dTxTzOy/fkfAA04hbb2VMfQl3vFTPHf3NZkCK6wyDQk8p6w2xFPOKyiPNZwtYv7vWenZsGGlp/of+7TnhK9b72Zg4VWNWwNeQ7y2Ul+j/azTfTDmTgiosCGQ2mstrwZsrHqmi+LfL62mQmuhiq/tYVU3v1DvSU5KA2M0C93sTTHn/5+Yb24ZhCaLsUW1U0/N1wYMeJoTrgC/YLpAwSOsyZeKJgo5xbBmEppoieEgcV+7ou16YkzHA9FmVmVCIUmTt0zk1xsmmnkoov0Q8SL6xVDasD1xxXE6HmjHnmRyOIhQA2cWI29SfGsIft3PY9D4vD3SGVyMWn75qjLOhrDAXH1MySDSy5bmCbqzg4Sqi8xwRaTD2sNOB5xnfzCxXgR3p+NWNWvLO6UqqNd6rR1BKzphzbhPtsaTjVoMM1id+zdQPtxUiYX4DE3DlMiERstQDUrhZPKJjC5VbIhorIfoSuOWKYh8Jj2ztzemfNerCfzG8gLHQPN0S7++StzKDRcvY3OLy4bT1wMT53mQU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(136003)(36840700001)(46966006)(5660300002)(8936002)(478600001)(336012)(966005)(54906003)(52536014)(86362001)(83380400001)(47076005)(36860700001)(8676002)(6506007)(186003)(7696005)(82310400003)(70206006)(33656002)(316002)(55016002)(9686003)(70586007)(26005)(356005)(4326008)(2906002)(82740400003)(6862004)(81166007)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 07:57:50.3298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7877d18-73d2-4775-1397-08d8e52c8871
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6323
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEJydWNlIEFz
aGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+U2VudDogMTIgTWFyY2ggMjAyMSAw
MzowNw0KPlRvOiBEaWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29tPg0KPkNjOiBtZXRh
LXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj5TdWJqZWN0OiBSZTogW21l
dGEtdmlydHVhbGl6YXRpb25dIFVwZGF0ZWQgc3RhdHVzIG9mIG1ldGEtdmlydCByb2FkbWFwDQo+
DQo+SSBhY3R1YWxseSBkbyBoYXZlIGFuIHVwZGF0ZWQgcm9hZG1hcCB0aGF0IEkndmUgYmVlbiB3
b3JraW5nIG9uIHRocm91Z2hvdXQNCj50aGUgcmVsZWFzZSBjeWNsZSAoZHJpdmVuIGJ5IHRoZSBw
cmVzZW50YXRpb24gdGhhdCBJIHByZXBhcmVkIGR1cmluZyB0aGUgZmFsbCBPRQ0KPmRldmVsb3Bl
ciBkYXkpLiBJdCBpc24ndCBmb3JtYWxpemVkIGludG8gdGhlIGV4aXN0aW5nIGZvcm1hdCBhdCB0
aGlzIHBvaW50LCBidXQgSQ0KPmNhbiBkbyB0aGF0IGFzIEkgYmVjb21lIG1vcmUgc3VyZSBvZiB3
aGF0IGlzLCBhbmQgaXNuJ3QgZ29pbmcgdG8gbWFrZSB0aGlzDQo+cmVsZWFzZS4gU28gaW4gdGhl
IG5leHQNCj4zLTQgd2Vla3MsIEkgY2FuIGhhdmUgaXQgdXBkYXRlZCBpbiB0cmVlLg0KVGhhbmtz
IGZvciB0aGUgaW5mb3JtYXRpb24uIEkgd2lsbCBoYXZlIGEgbG9vayBhdCB0aGUgcHJlc2VudGF0
aW9uLg0KDQo+DQo+VGhlIGJlc3Qgd2F5IHRvIGZpbmQgb3V0IHdoYXQncyB1cCBhbmQgdG8gY29s
bGFib3JhdGUgb24gZGlyZWN0aW9uIGlzIHRvIGRyb3ANCj5ieSB0aGUgI21ldGEtdmlydCBmcmVl
bm9kZSBjaGFubmVsIGFuZCBjYXRjaCBmb2xrcyB0aGVyZS4NClRoYXQgaXMgZ3JlYXQuIEknbGwg
am9pbiB0aGUgY2hhbm5lbCB3aGVuIGFwcHJvcHJpYXRlLg0KDQpSZWdhcmRzLA0KRGllZ28gU3Vl
aXJvDQoNCj4NCj5DaGVlcnMsDQo+DQo+QnJ1Y2UNCj4NCj5PbiBUaHUsIE1hciAxMSwgMjAyMSBh
dCA1OjQxIEFNIERpZWdvIFN1ZWlybyA8ZGllZ28uc3VlaXJvQGFybS5jb20+DQo+d3JvdGU6DQo+
Pg0KPj4gSGVsbG8gQnJ1Y2UsDQo+Pg0KPj4gQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBhbiB1cGRhdGVk
IHN0YXR1cyBvZiB0aGUgbWV0YS12aXJ0dWFsaXphdGlvbiByb2FkbWFwPw0KPj4gSSBoYWQgYSBs
b29rIGF0IG1ldGEtdmlydC1yb2FkbWFwLnR4dCBhbmQgaXQgc2VlbXMgdGhhdCBpdCB3YXMgbm90
IHVwZGF0ZWQNCj5zaW5jZSAxMC8yMDIwLg0KPj4NCj4+IEFsc28sIHdoYXQgaXMgdGhlIHByb2Nl
c3MgdG8gY29udHJpYnV0ZSB0byB0aGlzIHJvYWRtYXA/DQo+Pg0KPj4gS2luZCBSZWdhcmRzLA0K
Pj4gRGllZ28gU3VlaXJvDQo+Pg0KPj4gDQo+Pg0KPg0KPg0KPi0tDQo+LSBUaG91IHNoYWx0IG5v
dCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRo
ZWUgYXQNCj5pdHMgZW5kDQo+LSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFy
IFRyZWsgSUkNCg==
