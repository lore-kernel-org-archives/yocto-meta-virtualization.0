Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A8AE81E1F
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 18:21:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.89])
 by mx.groups.io with SMTP id smtpd.web11.1488.1696616482044418370
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 11:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=A1n2HXOu;
 spf=pass (domain: siemens.com, ip: 40.107.8.89, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh9U6CDOsu/fH4cl5wD0qLu63JvvBSSeW0/TbbwB/ufN5lSO1Ipg5cI6pFhsP8QqeNZCxM/vFpxf89lyFuHz4YSst/F2XCpQHQ7hyEQPCI3km6KPUmI4Nap+N3CzUjGiutfLJX3Em8yyrKVDm0zFK7YuO1ta2KxbfRMVxJ4P0XabsXScTdc9tNazRbRcDEq1XWacfKr1bLAY13VoqvCqAMpmAcEfSNUlbPcytI6BontJtw/KusH3HQG9UsytKkoeGX+UE5iRfCZ2ZctFCk/Ld4HPcMq859bULOgIuLan8w/JUo3kwOr+wxH9786nvpVT1u3t/X04Copk2e/AJtQUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMKzymZUoEkDOB7NkhYrhcTP1nXt8fKqDYNBB2CyppM=;
 b=ixBLMOgAs06y8PWXSgePFZxIyeNF6svEF7A46NLtoD30EG1v37M0D7cT+VjeEYOsLNQvo0T08mUZ74/VxyoeNmDPXn77CRx6Vu2NcPdqrRmvYE7Y3kVQ3bIxkH9iCcWJD7GZ20YmUj5tFhHXopIfWv/DcwHgI7qJckftyAPKdk/9fGdOfvmuv81RjzK2bA/QYAkezjEySyZvZCqYn4l+hOQJK1HKsNCFBAbX+aXM5wudH3XbDNBkr76k/fb4mNmJoDnJ6N6xoSVCNvtF90gYBOMNC4Bfrc7778R0mT4D5m/bWTe75L4DHmdt9kMty7jZ46yHOjGT5w4xGw95EsnslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMKzymZUoEkDOB7NkhYrhcTP1nXt8fKqDYNBB2CyppM=;
 b=A1n2HXOu9TwEZpe8kP3s5fPRjobQtyX4Ls12VTsbdKxHRRC6IXF9s2/nL4yEqi0cYQWkvt0DVm+6oUukmLIr9CF7k+rMSTeS7lDzI3/FoYbg+4l0+VDL93zppp7qBPi79f91Mhp/fT3atXDMbPtv/QhBxDtovwaaiTS6BLFN/p7YCUUWT7JWoNWYdjBM/1QYlcFP0vzYs0FD7tKEhhX1wCeQVSBnUAvD3Uw2ak+J7SAckavKKQftBrIvMvEZooGxdVxZSHi21vKaW87lW+JXyU1iUQwx5K/ogH695jxwf8CyTZ9iXZOrJUThSSE7yHd5V5ELZZI3lqFz1rRtf0z1mw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6412.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 18:21:18 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 18:21:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "przemekchwiala@gmail.com" <przemekchwiala@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] Docker-compose Go update on kirkstone
Thread-Topic: [meta-virtualization] Docker-compose Go update on kirkstone
Thread-Index: AQHZ+GkIHqKttWjvpUiHtR9OmyYgIrA9EaLg
Date: Fri, 6 Oct 2023 18:21:17 +0000
Message-ID: 
 <AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <1D32D17E-126F-413C-9F22-2E5CCF20E61F@gmail.com>
In-Reply-To: <1D32D17E-126F-413C-9F22-2E5CCF20E61F@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=37adb844-1ffb-4f53-82e5-f8560a0fe5ce;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-06T18:16:29Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6412:EE_
x-ms-office365-filtering-correlation-id: c2e2ca7f-07b1-46a5-bdc4-08dbc69908a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w9lYmraKfnFwtHZkOFmy5vK4u0x/Vf/lG7+xvu4iaQYqYfo7H/gOwuGVtKhPCd5bTmnSo5WX8L7Lap/FBjDCq3Mi2Cn1v6jmFOlSGB7HoDnYs4fbnhOwhRChaF1pfrEfWLGJrICPcobSwyf93hEWZNMOLPRPs8SvXApt3jYRb5A28ePkijvlSp/p7xk4snn5TbF3BDNLq7hR4KLfSXBOCt+NlOfdxE04LvlwPNEBEcNJnhKTAOJcK3lTiAx/0qSRobmllBhj7Gz0+QgafWjlGzOR+VW5ZShGJM0cqUxFEFwL07nI/JRT75neFKYgH8si4khYGHU3919y+RLrjHddbFTt0Xxi6z8IhBuCqWMi8yjFzIcZTvGNtuRl/ydsqp1S22/vQ9bky5pYwW9miJ1j0ppwb17EDRnYHMEiV9CZH2XgWXApoo3tRzUvAl+HrO4vVlTfo+fYOwQ4XlCwN/On5ecpk/yEVux698fIVwOSnXjStQZPjp20usIKpTOVFOChV1AcJpnWeH4durEoDXHYDSsptDNWFe7LW1wXmDRH1kq1RtM2cwdtwcClzC+pnwQQLsxQdMOm6IHAlLuR5gmS8j8QPEUHJC82R5amyzChWe0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(7696005)(6506007)(71200400001)(478600001)(966005)(83380400001)(9686003)(26005)(2906002)(4744005)(15650500001)(316002)(41300700001)(66946007)(6916009)(64756008)(66446008)(66476007)(66556008)(5660300002)(8676002)(4326008)(8936002)(52536014)(76116006)(33656002)(38100700002)(38070700005)(86362001)(122000001)(82960400001)(166002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2dyZFNtTnRpaWJvM3Y5bGtUQWFydXpQdVhVZjUvYkNVUEFjYkNyaDRQZkRh?=
 =?utf-8?B?QUduMjRyRGZud2twMmhCVlJUTFYyZU1jQzV4a0Ewd2ErKzA1OGR6YkhMODhi?=
 =?utf-8?B?K04rOWxGWHp2cGpSK2lKYm5VMmEwMldsVHRWOVZKNnk2d1Y4T0dBanNqTUo5?=
 =?utf-8?B?dCttTDdkS0l2M0daQ2doNlpUMWhMNSt2aGtnT0dYbHJ2Zk16eWh5RHhORDVj?=
 =?utf-8?B?bzZVaExHZW9SNW0vRmlVWHBGVVVCd2pZVEgvNG9HM0xlc0VMQ1pXaTFhQ05C?=
 =?utf-8?B?RStTK2JmV01CU0NBOWc5TGxhR3VBWWFMR25MaUlsSWRXVnVyekRDekwwTDF1?=
 =?utf-8?B?SThiLy9ZVnhxdkh2UTNqcktrZTVUNFgwNWhLYnlQZlYyT1lLTThneFN5VW9a?=
 =?utf-8?B?YmpsOFhJZVJzaHBDWXA0ZWtmQmRVcFNUQm53dFowUnFjRUJDelVWNDdhSlFO?=
 =?utf-8?B?cC80dVVEN1NXRUU2aWw1M1JHdi9ZWE1rK09tWEh1ZytyMllsRlN0QU9pMHR2?=
 =?utf-8?B?L3NkVlczY1hIdkFiei9VM29qQ2dMUWh6ODNib084eTRoOVlIc2FYY0MreGZk?=
 =?utf-8?B?ODBhR2dQaktCWS90TkFOU1NrcnVIVGU5OFFvTGk0UkZtL3FSY25yTy8rcDNl?=
 =?utf-8?B?Sklwd090SXVHcnFMbDNQTGZIWStHbTU0QlVYVmthdldsRWNlWVBPZjcvdWx0?=
 =?utf-8?B?SmFVbjJrMmtTTXhNM0hOWm4xbFo1VVp6bXNRYnpLV0tUYjBaNlVtaVJEWXFa?=
 =?utf-8?B?MlFpcEprMm45VDNOMzlheXJibzJuUCtXWjNIOXduNGhxRjZSeDJwN0pVVU80?=
 =?utf-8?B?ZUJPSzZTY05hNURMUXRlTG1NK3RPeFNCeUJuVVNtVE9Pa2lETGY1dTA1bDZt?=
 =?utf-8?B?ZGd5dC9zUXp3c3VsQ0duV0JqaTFIM3FrV0ZGUXZ4MC9xdG82R2kvMXBjeVhC?=
 =?utf-8?B?cncyNmdTV0JycGtEU0NoeTdhVVhRY2w4ajREc0Q4RjVlWFRWYWd1RllaR3lQ?=
 =?utf-8?B?YTQ0NzZtajNOVTRkWmtncW8vcEt4dk9uenBiWFUydmRSVnhUb2ZHUzl5djFG?=
 =?utf-8?B?bWlZbHVpUGlnN1JIWlFhRnJxZEdFYzQrckQwL0pPY0ZlM3J3T1graFVFNnhx?=
 =?utf-8?B?b1BkOUpmSVYyT2c2SDlsRTFCZ3lvVzI1MjJ6Vm5iZzliWDlOS2JrM1BKK1Uy?=
 =?utf-8?B?aklCOXZzTVB6amtPbGc3RUJTOGZJcVpEYk9DODk2R1FnQU9ySzJBV3ZGckZ4?=
 =?utf-8?B?VEw1UUc2Smw1RDhYZGtOakxHcUZOWFU1dlZHM2IwVlhvWjBKK3lQbTdhUjZO?=
 =?utf-8?B?c2JtZVRpdEcvZEhLcXB1UlBZODZDYzhwS3hmeXlHVkE0S1BnWFhQdHIwazJj?=
 =?utf-8?B?d2RQdUVRT2FKZXFZcWNtY0lRN2FXVytQZHNNcUsrMEhOUitnWGZYcS81enlB?=
 =?utf-8?B?ZlF3clVIVlUxOXJyVjZIYU1SL2RkTWppa1pYMm8vMUxsSXM4bjRBdmN1bjhC?=
 =?utf-8?B?K0JDT3hSQTA2MTBtbmVWMkV4WURqME82WWdUekgrMW15SWQ3Z2w2c0xJeHdn?=
 =?utf-8?B?OWgxbzk4UjZpOXhEcWt5WGpISVczSUx1N1h6ak5lKzEvSjkzSFNLSjErQTBj?=
 =?utf-8?B?bWpYdnpMVGVaRjdHTlpCOTVYTVNEWFh1RzRVdkhaZm05Yjc3ZXhIQmpEL2N4?=
 =?utf-8?B?QzlkMTluc1RZanVpdlpvUjc3YWplcGY0Y1F1NC90RXZPdFZEd3QxOEpNbFVH?=
 =?utf-8?B?OEJleEx0ZkhoaXg4ZFVONDNJcERMaFhtSEIzSHJTSGNxTDQ2czB1OG5rRmFJ?=
 =?utf-8?B?MGI4OXo4QUZEUWkrQW9sajllTzRCbC9yaWtnNnZSNG1CUEhRQTRHOXN5NElD?=
 =?utf-8?B?cG9hZFltSCtGL2FaYWxWS2FsaEU1R0xnRTMzdS91THB1a3NhUUdackxRU0gz?=
 =?utf-8?B?M2VSWXczV2N0ZE4zWnc5SkVNeEhxTmV6ZFFmWmk2TnFTTmI3NWZNeG9pMmRV?=
 =?utf-8?B?MjRaVytFV25DMkRsQUowMGRnRGs5TUYwTmNVV2dwa1dDeEtRN1ZvVU95SnJs?=
 =?utf-8?B?UllFOC95QjJVMmFrWWhxV3NTam5LQytoVjJQZVJiMmp2R2Q1R2tQTEhqdElK?=
 =?utf-8?Q?7ICCaOo8lMQQMY/A952ejnyO1?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9AAS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e2ca7f-07b1-46a5-bdc4-08dbc69908a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 18:21:17.9794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ba8JQ3yzMVG1kmOm0Ywjm2LzKsQkhEDKP0POqs7iY+dvDFY5BIMgs4akhDsLpHRFHqdIt/D/Q/Dtk7bokOkh3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6412
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Oct 2023 18:21:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8338

--_000_AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9AAS1PR10MB5697EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WW91IHdpbGwgcHJvYmFibHkgbmVlZCBuZXcgZ29sYW5nIHZlcnNpb24uDQpNaXhpbiBsYXllciBr
aXJrc3RvbmUvZ28gaXMgd29ya2luZyBwcmV0dHkgd2VsbCB3aXRoIG1ldGEtdmlydHVhbGl6YXRp
b24gbWFzdGVyLg0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLWx0cy1taXhpbnMv
dHJlZS8/aD1raXJrc3RvbmUvZ28NCg0KUGV0ZXINCg0KRnJvbTogbWV0YS12aXJ0dWFsaXphdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBQcnplbXlzbGF3IENod2lhbGEgdmlhIGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcNClNlbnQ6IEZyaWRheSwgT2N0b2JlciA2LCAyMDIzIDE3OjIzDQpUbzog
bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBbbWV0
YS12aXJ0dWFsaXphdGlvbl0gRG9ja2VyLWNvbXBvc2UgR28gdXBkYXRlIG9uIGtpcmtzdG9uZQ0K
DQo+IEhlbGxvLA0KPg0KPiBJJ20gd29ya2luZyBvbiB0aGUga2lya3N0b25lIGJyYW5jaCwgd2hl
cmUgd2Ugc3RpbGwgaGF2ZSBweXRob24zLWRvY2tlci1jb21wb3NlXzEuMjkuMi5iYi4gSSBhbSB3
b25kZXJpbmcgaWYgdGhlcmUgaXMgYW55IGNoYW5jZSB0byB1cGdyYWRlIHRvIHRoZSBHbyB2ZXJz
aW9uIG9mIGRvY2tlci1jb21wb3NlIGZyb20gdGhlIG1haW4gYnJhbmNoPyBJIHRyaWVkIHRvIGJ1
aWxkIHRoZSByZWNpcGUgZnJvbSB0aGUgbWFpbiBicmFuY2gsIGJ1dCBnb3Qgc29tZSBlcnJvcnMu
IEJlZm9yZSBJIGRpZyBpbnRvIGZpeGluZyB0aGVtLCBJJ2QgbGlrZSB0byBhc2sgaWYgeW91IHNl
ZSBhbnkgYWRkaXRpb25hbCBpc3N1ZXMgdGhhdCBtaWdodCBibG9jayBidWlsZGluZyBkb2NrZXIt
Y29tcG9zZV9naXQuYmIgZnJvbSB0aGUgbWFpbiBicmFuY2ggb24ga2lya3N0b25lPw0KPg0KPiBU
aGFuayB5b3UNCj4gUHJ6ZW1law0K

--_000_AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9AAS1PR10MB5697EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsN
Cgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9u
OnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25h
bC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5k
b3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0K
CWZvbnQtc2l6ZToxMC4wcHQ7DQoJbXNvLWxpZ2F0dXJlczpub25lO30NCkBwYWdlIFdvcmRTZWN0
aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4w
aW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxl
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIg
c3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48
eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQi
IGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+
DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSIgc3R5bGU9Indv
cmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5Zb3Ugd2lsbCBwcm9iYWJseSBuZWVkIG5ldyBnb2xhbmcgdmVyc2lvbi48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk1peGluIGxheWVyIGtpcmtzdG9u
ZS9nbyBpcyB3b3JraW5nIHByZXR0eSB3ZWxsIHdpdGggbWV0YS12aXJ0dWFsaXphdGlvbiBtYXN0
ZXIuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YSBocmVmPSJodHRwczov
L2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtbHRzLW1peGlucy90cmVlLz9oPWtpcmtzdG9uZS9n
byI+aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLWx0cy1taXhpbnMvdHJlZS8/aD1r
aXJrc3RvbmUvZ288L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBldGVyPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8
ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFk
ZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj5Gcm9tOjwv
Yj4gbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnICZsdDttZXRhLXZp
cnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcmZ3Q7DQo8Yj5PbiBCZWhhbGYgT2Yg
PC9iPlByemVteXNsYXcgQ2h3aWFsYSB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzxicj4NCjxi
PlNlbnQ6PC9iPiBGcmlkYXksIE9jdG9iZXIgNiwgMjAyMyAxNzoyMzxicj4NCjxiPlRvOjwvYj4g
bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPGJyPg0KPGI+U3ViamVj
dDo8L2I+IFttZXRhLXZpcnR1YWxpemF0aW9uXSBEb2NrZXItY29tcG9zZSBHbyB1cGRhdGUgb24g
a2lya3N0b25lPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPiZndDsgSGVsbG8sPGJyPg0KJmd0Ozxicj4NCiZndDsgSSdtIHdvcmtpbmcgb24gdGhl
IGtpcmtzdG9uZSBicmFuY2gsIHdoZXJlIHdlIHN0aWxsIGhhdmUgcHl0aG9uMy1kb2NrZXItY29t
cG9zZV8xLjI5LjIuYmIuIEkgYW0gd29uZGVyaW5nIGlmIHRoZXJlIGlzIGFueSBjaGFuY2UgdG8g
dXBncmFkZSB0byB0aGUgR28gdmVyc2lvbiBvZiBkb2NrZXItY29tcG9zZSBmcm9tIHRoZSBtYWlu
IGJyYW5jaD8gSSB0cmllZCB0byBidWlsZCB0aGUgcmVjaXBlIGZyb20gdGhlIG1haW4gYnJhbmNo
LCBidXQgZ290DQogc29tZSBlcnJvcnMuIEJlZm9yZSBJIGRpZyBpbnRvIGZpeGluZyB0aGVtLCBJ
J2QgbGlrZSB0byBhc2sgaWYgeW91IHNlZSBhbnkgYWRkaXRpb25hbCBpc3N1ZXMgdGhhdCBtaWdo
dCBibG9jayBidWlsZGluZyBkb2NrZXItY29tcG9zZV9naXQuYmIgZnJvbSB0aGUgbWFpbiBicmFu
Y2ggb24ga2lya3N0b25lPzxicj4NCiZndDs8YnI+DQomZ3Q7IFRoYW5rIHlvdTxicj4NCiZndDsg
UHJ6ZW1lazxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0K
PC9odG1sPg0K

--_000_AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9AAS1PR10MB5697EURP_--

