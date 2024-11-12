Return-Path: <simon.kaiser@phoenixcontact.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B355D42B8C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 14:38:38 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.129])
 by mx.groups.io with SMTP id smtpd.web10.87972.1731422310713921819
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 06:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phoenixcontact.com header.s=selector2 header.b=KkGs3NU0;
 spf=pass (domain: phoenixcontact.com, ip: 40.107.103.129, mailfrom: simon.kaiser@phoenixcontact.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIvfM0qVbulLLRd1RHZlhj8UYjgCzkVoVHn4ZnanRSTKMKyGVDY/i3pA2J1XCgN4TpdLH2GzQDMqmHy0cK1iWrCDaHavwFMRDq5oQnm02jc7u16wt5IEPBEqwu1vyNrVQ60fnvjVvhr/2U6KFNq/pqXrjHb1tHKPQFXylIGX1w+ISGLqV7nAJ2kF5wQgPjBtIpdp9OAdLDVz068eZcJXg8C09rgvKtwmwEbCiGLk2A3500rDvWe9IK4BC8XdUlbYT2milidpd/tePdUMLMMXQoK3imvRZQcrmcTP0+7Qp/RVyRZqB+vuZRWHq3F/BEa5gh24zJw+0EmWwMbe4sH/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNkJO8Ou1ARUfVC0pqkx57UH2XTxwtP4CMNMrrWLdMM=;
 b=uqBwYnQgDTuGsrxik+mz5HT+CSi2roi8ZmNA5vbgB6b9sWa9iZwgcBSo6fDQa6p5w1aALp4Md8bYVe4EUoGsCQl95loR53JA60Y3HHNGIfEZvp/VByRZfdnUe/DrbVuL2lG/8RrTvpwLVDwvI0I0aJfwbNljBoF3jc/5tQqEUttvuB8xHutQ8GJpZKpf9ei1PRaxWT42O6Ou++DWy922GaeprMP2EkJKMHW4LF3zlhkuBdmkmgNrdg/KLkqh+eY7s48qZYyGPlCTOP6VvP7KSTaNF2oWpLRw3XIhE7Eh0K089bE8PGegd6h55b/hGht4wfdiM6LKHQ32z7/rbDXSlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.47.17.175) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=phoenixcontact.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=phoenixcontact.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenixcontact.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNkJO8Ou1ARUfVC0pqkx57UH2XTxwtP4CMNMrrWLdMM=;
 b=KkGs3NU0C+CIJYWet+8bM80XFLB3ZKP6uPcctuzaCtu5v4UiCGeGQeJn5wxjg+IREhM7RZmwsift9023XbYq/3dRzFK0srtUNQGyjIZaM/IIIxfIveu6Q1rZz2F8xl7YDFOZjxyofvo6xj2PjtoQVwTp6TUXl8nQu83gR0xMo86jPPZKVN34VqOz6XsN0fpP5FEEJ8bL60yq5+THAjfJkbTbxEbQm9iTs8M1SJU/tSRrJ0GyCwlvyBSx+OS/Jz+BzArXvbOYFWZWXaubEjxrP2pWdzR1TeZKzjgD7F2anQiGxsqwYaXyNB3XWRflBfLjMiiBS3og9zMKgBGig4kVww==
Received: from AS8P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::13)
 by AS4PR05MB9327.eurprd05.prod.outlook.com (2603:10a6:20b:4ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 14:38:19 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:31f:cafe::44) by AS8P189CA0028.outlook.office365.com
 (2603:10a6:20b:31f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Tue, 12 Nov 2024 14:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.47.17.175)
 smtp.mailfrom=phoenixcontact.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=phoenixcontact.com;
Received-SPF: Pass (protection.outlook.com: domain of phoenixcontact.com
 designates 104.47.17.175 as permitted sender)
 receiver=protection.outlook.com; client-ip=104.47.17.175;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com; pr=C
Received: from azr-iqsuite11 (51.136.18.164) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 14:38:18 +0000
Received: from mail pickup service by azr-iqsuite11 with Microsoft SMTPSVC;
	 Tue, 12 Nov 2024 15:38:17 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com ([104.47.17.175]) by azr-iqsuite11 over TLS secured channel with Microsoft SMTPSVC(10.0.14393.4169);
	 Tue, 12 Nov 2024 15:38:16 +0100
Received: from GV1PR05MB9724.eurprd05.prod.outlook.com (2603:10a6:150:a1::6)
 by PA1PR05MB11415.eurprd05.prod.outlook.com (2603:10a6:102:45c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 14:38:15 +0000
Received: from GV1PR05MB9724.eurprd05.prod.outlook.com
 ([fe80::226b:585d:f590:4399]) by GV1PR05MB9724.eurprd05.prod.outlook.com
 ([fe80::226b:585d:f590:4399%3]) with mapi id 15.20.8137.022; Tue, 12 Nov 2024
 14:38:14 +0000
From: Simon Kaiser <simon.kaiser@phoenixcontact.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: classes/image-oci-sloci-image: Allow labels to have spaces
Thread-Topic: classes/image-oci-sloci-image: Allow labels to have spaces
Thread-Index: AQHbNQZrZvH1kOmK9Uyww3NoY00oSA==
Date: Tue, 12 Nov 2024 14:38:14 +0000
Message-ID: 
 <GV1PR05MB9724DECE44E633581768ED6BE7592@GV1PR05MB9724.eurprd05.prod.outlook.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phoenixcontact.com;
x-ms-traffictypediagnostic: 
	GV1PR05MB9724:EE_|PA1PR05MB11415:EE_|AMS0EPF00000194:EE_|AS4PR05MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: ef139eea-8960-4f7e-8816-08dd0327a61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UDJVTnB1RHZiM2RKTTFOOTUrOG9iZmp4dlNMYjNEWEszQlJPWHY0bGRBZHd1?=
 =?utf-8?B?LzZ6YjdGTGluMGxITXp5dWU1MDU2NDRkUWt4VlI3RDVuTVpCZURGOS9LdkZE?=
 =?utf-8?B?S2hiVnE2eXZ3bzBIMGdyZDhMOWg4WjNWUk1JcS9FQTY5R1ZsYnQwbUVBclB2?=
 =?utf-8?B?VVBXS0pySkNFb3Ixa3c3VFlCWU5hZEd4bHpia0dFZi9Pdmg3NkMyQlVvdDJZ?=
 =?utf-8?B?NFNyNTV3MGxmbWEvSi82ZHlQU1dKVFdxVk9NRzFqM3ZGZ3hiYUVmUGFvditU?=
 =?utf-8?B?Z0UzQjJrbUNjQ0h5bUlRZFN0NDdwbi84U3B4cE95UEJyRzkrVEZYUUtZNVVZ?=
 =?utf-8?B?OFBocjRIWWJ3YWZRVGdCbFFjZ2N1RzQ4Y0luVStRVjdTOEhNWjhaSEVseTU1?=
 =?utf-8?B?SkJMREkvOTIrK1VlUXg0MXUvd29uK284dEk3RlBRUjRtTVkzdk5oRnE1eXZZ?=
 =?utf-8?B?bzlJYjZMZkVIeEFFS0VndGdDaEc1c1FENnNkUXh6UDJOcnVJVDVEMDhlLzJE?=
 =?utf-8?B?empxeEZ0a3N6c1hFcmRJS2p2NW5FT2xlWkF4Ti9vVEhWWHpkallWQ3ZkeDdR?=
 =?utf-8?B?UlZsKzAwT1o1eHpZT0JsckZieVBmdEZzYWo1a2tsek9qR2lRWXFlZ1hVM1JF?=
 =?utf-8?B?WUF0c0VQY0FabmdiZDdUUFdyeGdTSTdnUk1BYkY3M1hQNHBrNE1VY3pBODhY?=
 =?utf-8?B?VWtkM0h3ODZkRGdUTlN3R09nSW9LTUdEQlIzZnZBTSt0cEREU0RCVERadmRo?=
 =?utf-8?B?TXQyU0RpQTRJdXYrU29KQTlwdWpIRlhKKzU3V21taFlVRzhDa3NHd3I5b0hJ?=
 =?utf-8?B?RlM3RnQwWFQ0WldMcGRSRUZRYnkwdTQ5S1IvbUtHUjVTeTV4ZEFRVUFhekZZ?=
 =?utf-8?B?c2RBam5kcCtiR1crRzBrN003WkpXL2ZhRy8ybk9mNUkwMmVkYzRnQmpjRGR5?=
 =?utf-8?B?RHNmWjRWMlFHU3RmcmY5RUF1RzRvM3c5YUo3NzRTZDE2M3IrNWhzWFcrL1hZ?=
 =?utf-8?B?UUNiZURtMG5FdHI5Y05uVlZ1MlJmdGNLckF2RDBzNlRFRnRYemxzOTFVZXla?=
 =?utf-8?B?a2oxdTQ1VDRZSDJ6bFlTRDUrNHZjcjZBNlhEZklkVFMxdFg5TDhIdC9udHBJ?=
 =?utf-8?B?dDFYQWpyaEs2WVBReTdRMmRaemJIRTdjclhGVStKVW9GK1pOQ2dDZTMwTjk4?=
 =?utf-8?B?RWNLNkg1SjJpM1Jtd2ZVZC9WR2pEV2JQZ2U0bnZzYUI4eGUvMDJ2UEM3TnlK?=
 =?utf-8?B?a2F2Y280M3JUOGc5TzVFU0JWZXVaeUtoRXl5bjVxbCtNRDBQUm0wYVRrK05x?=
 =?utf-8?B?RlI5MC9Vb0I3S3JyTmpOVVl1K1BBSnBhTU02cTJwUDNjeGpNRXF1Z2lRWldz?=
 =?utf-8?B?VDYySkxLMUZTQ0orZkRSSGl6bnhvVVMwdDZ2V1Jib0ZQT2d6bnhkOXV3QjNX?=
 =?utf-8?B?TjBlbjRoWHpuVU1iaThOS2IzcGxsa1RmL0YxcDlNRGNoOERsVG5DR3VjK0JI?=
 =?utf-8?B?WTJYU3NMZWcvQTBhTFlvNzVCNFhDTVN3TTYxa21aSlRZNVcwY1ZXdHFCL2tH?=
 =?utf-8?B?QTl5TTgzNXllMDAwcmZObUR3S0NIdkV4R1grTlowWElsMFhEV1BMQlFpb3RD?=
 =?utf-8?B?WDF2aEwvQlhjVnJER3pLOExXR0diOHQzMm02dCs2SW5vYUN3cVJrRXdYT0JC?=
 =?utf-8?B?Q01RRWh1V2VSbjcyamZINjF0czVOSEdXTjc1enB5NWk4Y2RuZk5vNWpjeTJy?=
 =?utf-8?Q?6IKcUFKDpfFPbPitnsxBsihgMHVRHQarr8za8Mv?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR05MB9724.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR05MB11415
X-OriginalArrivalTime: 12 Nov 2024 14:38:16.0882 (UTC) FILETIME=[82DCD120:01DB3510]
X-schobiWasHere: 1
X-GBS-PROC: k7BRzbpU//IoBiUoohvGGAXKNBvFoVOLcuwz7BHsIDro9ldI1MtmPqu35zfl1FIf
X-GBS-PROCJOB: gDzm5A0wN7nCJuaH2Mghbjx7UdPmxeOU5M4v4Zgm9fKoxSht6XPwYroQnk/d7sJW
X-GRP-TAN: azr-iqsuite11@F6FB224D785B45CBB9748A60B407A580
X-iqsuite-process: pxc-processed
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[104.47.17.175];domain=EUR05-VI1-obe.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: 
 ip=[104.47.17.175];domain=EUR05-VI1-obe.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a498f692-8990-45d3-1922-08dd0327a420
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|14060799003|1800799024|35042699022|156008;
X-Microsoft-Antispam-Message-Info: 
	X8xUkJww8jB3zxQz0tgyNoa+kmNbf//Tf8pKsmHzdGrboW3+9dJodxjWHXBSFe19/99dfdAHQ1h4VBO4t3b+d1XgMFXYMvEZMXq0ABph2TrxtiCasy9l5gnF6N6PlW3U3/IJkikZnhM8OJaXzJyi1ULB32a9u4N8jOBNSrEpuLAq5w/mNBZXKwOu/4KtnbQv5UmA/EGSbMjbmbON4tinhvWewu7+jLg/YWYispYX/U2ifcdzaZbroF8F9EexdROMqeiPJNbqyCQEVEdN0EZiK7PRDe4/uK3MwjmIXuMAfblTgFTmWwNkRZbwlZlMb2JMrvSVZ9qz34AclwSGvugfPYPGxXLHtcO0PQQsmGRNeOwB9Mz7Z4GLhdsX9u/PsjTtLGKGfalU5zf1oUKqGiDYj7Taq8HBhV5GBpn/GzWxrn3PzegV0wU1SBgpIrkFxnE7RS5jxT6PaMClgOE5K3qy+6PNm76QKAi+rU1cQj3ozTFfIQij9HOeizAa+jVoJQBwkvu7lh+Bo9/MD02jJZKS4Gt84OdpL6TGbXvHJ3Zw4BaH+sPRPi9KCigenZjlKtq1ZjmPVQooIwBLG0jFFzh8X8/7lY8NyQT+xI45LavB/xdk43GBg1+VO9BpxQTJfpwWCytyV5a5daLfQpXA99BJyRdsNiIv/knGWGrfuk9qZrk9q2FdCh5/VNd93pgcCU7sfPE171JikNOg7mWlx4IQqdMmb1XYFLE6baQNHzxhhhRs9jywb/v9LFNsjQiozvzOXQjs7gZIoTIt2iZ0P/PN2u42fBXHYW41ZmayL93ccA93m58hl0YmwPgKfEor54I72BTgSofzLBkuKJQSaiLf7w==
X-Forefront-Antispam-Report: 
	CIP:51.136.18.164;CTRY:AT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EUR05-VI1-obe.outbound.protection.outlook.com;PTR:mail-vi1eur05lp2175.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(35042699022)(156008);DIR:OUT;SFP:1102;
X-OriginatorOrg: phoenixcontact.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 14:38:18.1817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef139eea-8960-4f7e-8816-08dd0327a61c
X-MS-Exchange-CrossTenant-Id: 6868843b-f012-4c95-a18e-bab826cca9ac
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6868843b-f012-4c95-a18e-bab826cca9ac;Ip=[51.136.18.164];Helo=[azr-iqsuite11]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR05MB9327
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 14:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8963

SGkgYWxsLAoKSSB0cmllZCB0byB1c2UgdGhlIHNsb2NpLWltYWdlIGFzIGJhY2tlbmQgZm9y
IHRoZSBjb250YWluZXItYmFzZS5iYiByZWNpcGUuCkV2ZXJ5dGhpbmcgd29ya3MgZmluZSB1
bnRpbCBJIHdhbnQgdG8gdXNlIHNwYWNlcyBpbiB0aGUgbGFiZWxzLgoKTXkgc2V0dXAgaXMg
b25seSB1c2luZyB0aGUgcG9reShUYWc6IHlvY3RvLTUuMC40KSwgbWV0YS12aXJ0dWFsaXph
dGlvbihCcmFuY2g6IHNjYXJ0aGdhcCkgYW5kIG15IG1ldGEtY3VzdG9tIHdpdGggYSBzaW5n
bGUgYmJhcHBlbmQgb2YgY29udGFpbmVyLWJhc2UgdG8gcmVwcm9kdWNlIHRoaXMgYmVoYXZp
b3VyLgoKbWV0YS1jdXN0b20vcmVjaXBlcy1leHRlbmRlZC9pbWFnZXMvY29udGFpbmVyLWJh
c2UuYmJhcGVuZDoKT0NJX0lNQUdFX0JBQ0tFTkQgPSAic2xvY2ktaW1hZ2UiCk9DSV9JTUFH
RV9MQUJFTFMgPSAia2V5PXZhbHVlIGtleTE9dmFsdWUxIGtleTI9J3ZhbHVlIDInIgoKSSBx
dW90ZWQgdGhlIHNwYWNlIGluIHRoZSB2YXJpYWJsZSBsaWtlIGRlc2NyaWJlZCBieSB0aGlz
IHBhdGNoIGZvciB0aGUgdW1vY2kgYmFja2VuZDoKaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL2cvbWV0YS12aXJ0dWFsaXphdGlvbi90b3BpYy8xMDIwMDU3MDcjbXNnODM5MQoK
VGhlIHZhcmlhYmxlIG9jaV9pbWFnZV9sYWJlbF9vcHRpb25zIGNvbnRhaW5zIGNvcnJldGx5
IDMgLS1sYWJlbCB3aXRoIHRoZSBleHBlY3RlZCBrZXktdmFsdWUgcGFpci4KaHR0cHM6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLXZpcnR1YWxpemF0aW9uL3RyZWUvY2xhc3Nlcy9p
bWFnZS1vY2ktc2xvY2ktaW1hZ2UuaW5jI24yNQoKU28gSSBkZWNpZGVkIHRvIGFkZCBkb3Vi
bGUgcXVvdGVzIHRvIHRoZSB2YXJpYWJsZSB0byBrZWVwIHRoZSBzcGFjZSBpbnNpZGUgdGhl
IHZhcmlhYmxlOgpkaWZmIC0tZ2l0IGEvY2xhc3Nlcy9pbWFnZS1vY2ktc2xvY2ktaW1hZ2Uu
aW5jIGIvY2xhc3Nlcy9pbWFnZS1vY2ktc2xvY2ktaW1hZ2UuaW5jCmluZGV4IDkyNDg0ODlm
Li5lYzk4ZTQ2MiAxMDA2NDQKLS0tIGEvY2xhc3Nlcy9pbWFnZS1vY2ktc2xvY2ktaW1hZ2Uu
aW5jCisrKyBiL2NsYXNzZXMvaW1hZ2Utb2NpLXNsb2NpLWltYWdlLmluYwpAQCAtMjIsNyAr
MjIsNyBAQCBJTUFHRV9DTUQ6b2NpKCkgewogICAgIG9jaV9pbWFnZV9sYWJlbF9vcHRpb25z
PSIiCiAgICAgaWYgWyAtbiAiJHtPQ0lfSU1BR0VfTEFCRUxTfSIgXTsgdGhlbgogICAgICAg
IGZvciBsIGluICR7T0NJX0lNQUdFX0xBQkVMU307IGRvCi0gICAgICAgICAgIG9jaV9pbWFn
ZV9sYWJlbF9vcHRpb25zPSIke29jaV9pbWFnZV9sYWJlbF9vcHRpb25zfSAtLWxhYmVsICR7
bH0iCisgICAgICAgICAgIG9jaV9pbWFnZV9sYWJlbF9vcHRpb25zPSIke29jaV9pbWFnZV9s
YWJlbF9vcHRpb25zfSAtLWxhYmVsIFwiJHtsfVwiIgogICAgICAgIGRvbmUKICAgICBmaQog
ICAgIG9jaV9pbWFnZV9lbnZfb3B0aW9ucz0iIgoKRm9yIGRlYnVnZ2luZyBwdXJwb3NlIEkg
cHJpbnRlZCB0aGUgd2hvbGUgY29tbWFuZCBmcm9tIGNsYXNzZXMvaW1hZ2Utb2NpLXNsb2Np
LWltYWdlLmluYyBhbmQgcHJpbnRlZCB0aGUgaW5jb21pbmcgcGFyYW1ldGVycyBmcm9tIHRo
ZSBzbG9jaS1pbWFnZSBzY3JpcHQuCgpGaXJzdCBJIHJ1biBteSBjaGFuZ2VzIHdpdGggdGhl
IGJpdGJha2UgY29tbWFuZDoKYnVpbGQkIGJpdGJha2UgY29udGFpbmVyLWJhc2UgLWsKLi4u
CnNsb2NpLWltYWdlICAtLXRhciAtLWFyY2ggYW1kNjQgLS1hcmNoLXZhcmlhbnQgIiIgLS1l
bnRyeXBvaW50IHNoIC0tY21kICIiIC0tYXV0aG9yIG9lLnBhdGNoQG9lICAgLS1sYWJlbCAi
a2V5PXZhbHVlIiAtLWxhYmVsICJrZXkxPXZhbHVlMSIgLS1sYWJlbCAia2V5Mj12YWx1ZSAy
IiAgICAke1RPUERJUn0vdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvbnRhaW5l
ci1iYXNlLzEuMC9yb290ZnMgY29udGFpbmVyLWJhc2UtcWVtdXg4Ni02NC5yb290ZnMtMjAy
NDExMDQxMjU2MjIucm9vdGZzLW9jaTpsYXRlc3QKQW1vdW50OiAyMApWYWx1ZTogLS10YXIg
LSAtLWFyY2gKVmFsdWU6IC0tYXJjaCAtIGFtZDY0ClZhbHVlOiAtLWFyY2gtdmFyaWFudCAt
ClZhbHVlOiAtLWVudHJ5cG9pbnQgLSBzaApWYWx1ZTogLS1jbWQgLQpWYWx1ZTogLS1hdXRo
b3IgLSBvZS5wYXRjaEBvZQpWYWx1ZTogLS1sYWJlbCAtICJrZXk9dmFsdWUiClZhbHVlOiAt
LWxhYmVsIC0gImtleTE9dmFsdWUxIgpWYWx1ZTogLS1sYWJlbCAtICJrZXkyPXZhbHVlClZh
bHVlOiAyIiAtICR7VE9QRElSfS9idWlsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGlu
dXgvY29udGFpbmVyLWJhc2UvMS4wL3Jvb3RmcwpVc2FnZToKICBzbG9jaS1pbWFnZSBbb3B0
aW9uc10gUk9PVEZTIE5BTUVbOlRBR10KICBzbG9jaS1pbWFnZSBbLWggLVZdCgpDcmVhdGUg
YSBzaW5nbGUtbGF5ZXIgT0NJIGltYWdlIHdpdGggdGhlIGdpdmVuIHJvb3Rmcy4KLi4uCgpU
aGUgc3BhY2UgYnkgImtleTI9dmFsdWUgMiIgY2F1c2VzIGFuIGxpbmUgYnJlYWsgYWZ0ZXIg
dGhlIHNwYWNlIHNvIHRoZSBrZXktdmFsdWUgcGFpciBpcyBzcGxpdHRlZCBhbmQgMiB3aWxs
IGJlIG1pc2ludGVycHJldGVkIGFzIFJPT1RGUyBmcm9tIHRoZSBzY3JpcHQgc2xvY2ktaW1h
Z2UuCgpGb3IgZnVydGhlciBpbnZlc3RpZ2F0aW9uIEkgdXNlZCB0aGUgZGV2dG9vbCB0byBj
YWxsIHRoYXQgc2NyaXB0IG1hbnVhbGx5LgpidWlsZCQgZGV2dG9vbCBtb2RpZnkgc2xvY2kt
aW1hZ2UtbmF0aXZlCi4uLgpidWlsZC93b3Jrc3BhY2Uvc291cmNlcy9zbG9jaS1pbWFnZS1u
YXRpdmUkIC4vc2xvY2ktaW1hZ2UgIC0tdGFyIC0tYXJjaCBhbWQ2NCAtLWFyY2gtdmFyaWFu
dCAiIiAtLWVudHJ5cG9pbnQgc2ggLS1jbWQgIiIgLS1hdXRob3Igb2UucGF0Y2hAb2UgICAt
LWxhYmVsICJrZXk9dmFsdWUiIC0tbGFiZWwgImtleTE9dmFsdWUxIiAtLWxhYmVsICJrZXky
PXZhbHVlIDIiICAgICR7VE9QRElSfS9idWlsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3kt
bGludXgvY29udGFpbmVyLWJhc2UvMS4wL3Jvb3RmcyBjb250YWluZXItYmFzZS1xZW11eDg2
LTY0LnJvb3Rmcy0yMDI0MTEwNDEyNTYyMi5yb290ZnMtb2NpOmxhdGVzdApBbW91bnQ6IDE5
ClZhbHVlOiAtLXRhciAtIC0tYXJjaApWYWx1ZTogLS1hcmNoIC0gYW1kNjQKVmFsdWU6IC0t
YXJjaC12YXJpYW50IC0gClZhbHVlOiAtLWVudHJ5cG9pbnQgLSBzaApWYWx1ZTogLS1jbWQg
LSAKVmFsdWU6IC0tYXV0aG9yIC0gb2UucGF0Y2hAb2UKVmFsdWU6IC0tbGFiZWwgLSBrZXk9
dmFsdWUKVmFsdWU6IC0tbGFiZWwgLSBrZXkxPXZhbHVlMQpWYWx1ZTogLS1sYWJlbCAtIGtl
eTI9dmFsdWUgMgpWYWx1ZTogJHtUT1BESVJ9L2J1aWxkL3RtcC93b3JrL3FlbXV4ODZfNjQt
cG9reS1saW51eC9jb250YWluZXItYmFzZS8xLjAvcm9vdGZzIC0gY29udGFpbmVyLWJhc2Ut
cWVtdXg4Ni02NC5yb290ZnMtMjAyNDExMDQxMjU2MjIucm9vdGZzLW9jaTpsYXRlc3QKClRo
ZSBtYW51YWwgY2FsbCBvZiBzbG9jaS1pbWFnZSB3b3JrcyBmaW5lLCBzbyB0aGUgaXNzdWUg
bXVzdCBiZSBpbiBtZXRhLXZpcnR1YWxpemF0aW9uL2NsYXNzZXMvaW1hZ2Utb2NpLXNsb2Np
LWltYWdlLmluYy4KQ2FuIGFueWJvZHkgaGVscCBtZSB3aXRoIHRoaXMgaXNzdWU/CgoK77u/
QmVzdCByZWdhcmRzClNpbW9uIEthaXNlcgpQTENuZXh0IFN5c3RlbSBGdW5jdGlvbnMKQnVz
aW5lc3MgQXJlYSBJbmR1c3RyeSBNYW5hZ2VtZW50IGFuZCBBdXRvbWF0aW9uCgpQaG9uZTog
KzQ5IDUyODEgOTQ2LTE1MTcKbWFpbHRvOiBzaW1vbi5rYWlzZXJAcGhvZW5peGNvbnRhY3Qu
Y29tCgpQSE9FTklYIENPTlRBQ1QgRUxFQ1RST05JQ1MgR21iSApEcmluZ2VuYXVlciBTdHJh
w59lIDMwCjMxODEyIEJhZCBQeXJtb250LCBHZXJtYW55Cnd3dy5waG9lbml4Y29udGFjdC5j
b20KCg0KDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4NClBIT0VOSVggQ09OVEFDVCBFTEVDVFJPTklDUyBHbWJI
DQoNClNpdHogZGVyIEdlc2VsbHNjaGFmdCAvIHJlZ2lzdGVyZWQgb2ZmaWNlIG9mIHRoZSBj
b21wYW55OiAzMTgxMiBCYWQgUHlybW9udA0KVVN0LUlkLU5yLjogREU4MTE3NDIxNTYNCkFt
dHNnZXJpY2h0IEhhbm5vdmVyIEhSQiAxMDA1MjggLyBkaXN0cmljdCBjb3VydCBIYW5ub3Zl
ciBIUkIgMTAwNTI4DQpHZXNjaMOkZnRzZsO8aHJlciAvIEV4ZWN1dGl2ZSBCb2FyZDogSGFu
cy1Kw7xyZ2VuIEtvY2gsIERyLiBNYXJ0aW4gV2V0dGVyIA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpEaWVz
ZSBFLU1haWwgZW50aMOkbHQgdmVydHJhdWxpY2hlIHVuZC9vZGVyIHJlY2h0bGljaCBnZXNj
aMO8dHp0ZSBJbmZvcm1hdGlvbmVuLiBXZW5uIFNpZSBuaWNodCBkZXIgcmljaHRpZ2UgQWRy
ZXNzYXQgc2luZCBvZGVyIGRpZXNlIEUtTWFpbCBpcnJ0w7xtbGljaCBlcmhhbHRlbiBoYWJl
biwgaW5mb3JtaWVyZW4gU2llIGJpdHRlIHNvZm9ydCBkZW4gQWJzZW5kZXIgdW5kIHZlcm5p
Y2h0ZW4gU2llIGRpZXNlIE1haWwuIERhcyB1bmVybGF1YnRlIEtvcGllcmVuLCBqZWdsaWNo
ZSBhbmRlcndlaXRpZ2UgVmVyd2VuZHVuZyBzb3dpZSBkaWUgdW5iZWZ1Z3RlIFdlaXRlcmdh
YmUgZGllc2VyIE1haWwgaXN0IG5pY2h0IGdlc3RhdHRldC4NCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClRoaXMgZS1tYWlsIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBhbmQvb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbi4gSWYgeW91IGFy
ZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCAob3IgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvcikgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFu
ZCBkZXN0cm95IHRoaXMgZS1tYWlsLiBBbnkgdW5hdXRob3JpemVkIGNvcHlpbmcsIGRpc2Ns
b3N1cmUsIGRpc3RyaWJ1dGlvbiBvciBvdGhlciB1c2Ugb2YgdGhlIG1hdGVyaWFsIG9yIHBh
cnRzIHRoZXJlb2YgaXMgc3RyaWN0bHkgZm9yYmlkZGVuLg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQoN
Cg==

