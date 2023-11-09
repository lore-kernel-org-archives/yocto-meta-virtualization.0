Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCD8C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 07:41:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web11.116660.1699515680342302458
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 23:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=IsYVCLfe;
 spf=pass (domain: navimatix.de, ip: 40.107.20.68, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te2Y8au3xxi7oAZbnkfWW3Lt/VoqUg8gcFjihNjb27WAOaQF5d8EtzSdQiJuAonsHtf7Q/ZnLpSlf54oTZyGgcbnVZ7LCfa113odcwR4TAnGobxi5lpIknUxAjjSTOJHoRjJGurisZYg9oU4L5bbGcf8he6jGPQK/2KDGTYpjceMgJ8E6KB+0LY1uKaST0odOA8hbC7H4GFlMf4EEBudbigZSJN2qsCHS+E/+Jca3scVuEnIo4hXcGraCsAzTqG9zwP7hWu6tn7YetNP2MewFlyjzQhgfqwDA+EtrVemN/jwPDnI5JvUjgdVuujFaoDrvnuoZYS6nNb2JyXQG4UDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mA91VhO7kUVyJxXxTXfaB5smeOgErTMUJs+hj5VJKo=;
 b=ive7rbGNsnwyJ8Ztyv1BzPC38Tvv1jVHjULZklfwmMz/oODrBvgpDqJwgSYk2DsFxWGN4RHdT9tPxhUFeJsgSJRxg+BR/3n1fh5c4wQRfVYoxxjNL+OgTu37vtdWUYzDpDC/XWBR0waav+yANZJZ5OHAtlsMBmUWmhNEvhFPKPaXgEllBlzsEdKPPFiFeCuCe1lh2wp77ODeVw5GcsTCtxpL/7615vRtHcTHImHVqOZiGX0xYZ/5DB/WoRYWjyLQWkm4yH6I+r5VoUWKCDL9Hjov4/pr6MkqoyFHok5L0F382ZnC8PFjJ+eWz8kv47YWsWBvdxCn33YPsnjPyV9/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mA91VhO7kUVyJxXxTXfaB5smeOgErTMUJs+hj5VJKo=;
 b=IsYVCLfemob3v2z+hFj0T6v1O+ksiSanIWLMZbuAtk4SSQbEqQDM2Ee4RsjF4zkJTip0g13IbwWLePzhCFkg2hKdsXmOMYIdTHtm6rKQWOmtn7f3HYjCJRsiHiEGAtQM4nZYmudEidW69MM5FYLm3blFNQ29ktuUTt8il+4gZIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DB9PR01MB10220.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2ef::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 07:41:15 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10%6]) with mapi id 15.20.6954.029; Thu, 9 Nov 2023
 07:41:14 +0000
Message-ID: <8362e51d-a44e-42c6-a5e8-d8adc4c93729@navimatix.de>
Date: Thu, 9 Nov 2023 08:41:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][kirkstone] packagegroup-container: require
 ipv6 for podman
Content-Language: en-US, de-DE
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: meta-virtualization@lists.yoctoproject.org
References: <9ca767079c48373a2d3117217376b0ab5b2a3143.1699439788.git.joerg.sommer@navimatix.de>
 <CADkTA4Mg1svgE7t1Xr8=OMvtCswN3UH6ARzTizY5JRJJPaV3jw@mail.gmail.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <CADkTA4Mg1svgE7t1Xr8=OMvtCswN3UH6ARzTizY5JRJJPaV3jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::13) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DB9PR01MB10220:EE_
X-MS-Office365-Filtering-Correlation-Id: 17303cd9-a81c-4139-9233-08dbe0f73ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQMQQC9Y6Rz5KTkDOt2n9L9tkW/bHXEnYvYhjc7q+txjH1XidSqJ14v4IRvsTezyH3ozUvMIbPBSbHBGkY4p/ysHl2/KQtRDfCXxf4lS2Y+JNBnKT2L+WjOnG/qmARyYKk6+vWmq2C8UY+LWfNazcPbf8HyDIF2ov65v5QhQ843OtK8FalQ/Hznp46nfXBswL8gMccG7bdD14whsEFN/KKAoSCs7UMg7RNq4a7H+lQTXwV37JPAbX/h8jeNbrdGLii4o77BO+bwq6WHKJHoQI2Cdm4BqfL571hWNwzSRPNu7TA/xqAbcAemOe82h1xB/E9XRNw4WWb1Ms/MW5+71cyDKGBaX5VVhQZGVlVWtAJJk/oE9TFKcLC/AbunPpRlFdoDbiHKjmDFvTfJS53ulpNT3RR4c8LtkMzEX9IZBBnpvCdaE3i4D1yUZCYaMFSInA2YzorQ+Uszw1lUX3KPwCzzm2qMEF8Ys+tbuUGXyk8N0zb5UKXEde9timMMQbT3X1nXFiehy5rdvSNx/+ga79eNknb6LWy9WbBDxQ19DxBGpYU4uolnYjx7P3CBbByL3eHC2eBk4iZ27zGk5XaEwCQYHoqyASEZRh4mgH/LyFTY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39840400004)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(6512007)(6486002)(966005)(478600001)(53546011)(6506007)(2616005)(36756003)(86362001)(26005)(66476007)(4744005)(5660300002)(66556008)(66946007)(41300700001)(8676002)(2906002)(38100700002)(31696002)(316002)(8936002)(6916009)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QRhY2/RMqXu+fqemksIbxbZyDM1eRfvuj1ae2qLGuigBddG2HOUwuJw/Hj7C?=
 =?us-ascii?Q?t+70hhnoWswS9ENtQL6uRfbzpwD2W5636zKY5oKVGL/D2LQH1RbedqvqAvHn?=
 =?us-ascii?Q?JMbUkavebCyvNxCOqVswPFXt1szbiA2UrDx2n5jttTUYJmfEgp8NLqI35J+/?=
 =?us-ascii?Q?fUXBIxxo4ZdHrXDDc3jOCZsC9ROJLxwUp8UJsWasKRmQr78iSzm/Xk5o8prW?=
 =?us-ascii?Q?cj45XLsYuvV4BFQ7ZpxIgO5I/dsa+bZorrkZEdEHYNx/22MYKPM0qdwaxZsz?=
 =?us-ascii?Q?Vfqlzo4fFmKEbzLpTLroHU6EqVN4jrvSZfpJ4sIofwUXalyY/zdrgh8qTVZo?=
 =?us-ascii?Q?UO024pLMVtne9oWChqN/7YBHjlUJfPa+4Qhwmf28g1VlPJol0w3M/b7QR5ca?=
 =?us-ascii?Q?GDXCW/qFfVEW3lg830+0Fme4ZqJOqCrnYwT4H/ioYsq68ErV6bzIgzZ35aWN?=
 =?us-ascii?Q?dkkyleksi+7gVDIhkASx0Rx+KVCszWkEj9mviWvEp3xoCTe0S58L89NqFs3g?=
 =?us-ascii?Q?PtWbWPkRTpG0mr3eqIEsyXqLxmYpqDKDvgoXXdR87wGE4Ri5k956X2zxd2B4?=
 =?us-ascii?Q?0iowy9uINZ1UEaj/oah1YZcEnHxrKJcb+DcJ3BA9UR+w4KFfsC+EVf5R2454?=
 =?us-ascii?Q?zgOczzGRaVFye3Vw4nw0EXZrUGtcYo5b5uiIPxvftEOQ//n2afeTNgt4t+iS?=
 =?us-ascii?Q?CiXzB7es7vo12v/3Os4ZK436V259IxaUPVN9SReAQaG/fFEpE1BwHj2fCmSy?=
 =?us-ascii?Q?r93d/6PTuIi3bhI8IMZAkrgPGkgpj3ZYE69iPu2E7Viv6nAARBhZOinF+25H?=
 =?us-ascii?Q?PWk/F7OdOVPgrkpMBSxKCQuIiY+g5sBtM3O1ndGAlmbaKEJZPBi/rFzOcxAn?=
 =?us-ascii?Q?NAFxJk2t/E96c1XrEBdINrtCI2BXM9bDC2Yhm6Sowz8cwERjaW7TDvcWLJ9n?=
 =?us-ascii?Q?WG7UWmT05QfiEEv0KU5uxFGyCwIWeLTTqNDxBKRBmxt95J7oqXwCRiV20sBV?=
 =?us-ascii?Q?zJlZCjdUkPgKf23SCXKJnnWu866gz/3xKfVbKFiKbUtcIxnYjUticIvoGJji?=
 =?us-ascii?Q?uTxWoQNhtDufq4ujZxeTzU31fPjsJmM6HErmlzfdogs7mV09CfwvYtERqNh/?=
 =?us-ascii?Q?KDFJShqy1gzobebV+hnkL59O6ksKJBrjAZeEGF9zo+ITIythVrz+SrM/XQkK?=
 =?us-ascii?Q?1MEEcoUYobjkGOiVaXCAhJTp1/IwU2ymVD60qkD16LP+lSKvtfoceEe3/sMQ?=
 =?us-ascii?Q?xHcA+JeIzrHRCXCCMCND4tQ0P5e8TS84ftT49Oz6yjWf3MWYBc3Nt0YEimzi?=
 =?us-ascii?Q?6roWDzlQ+orzxvZNt3KaovF9xt7mRNY8pczSzYi1JoxGx6Q95l0EOCjTj+hd?=
 =?us-ascii?Q?pPmlJqhlEo3eq7p6oJodpwSKDcN6Sw0o8hJOndY6MwSA1aIc4Eaqza55CM/Q?=
 =?us-ascii?Q?OsVWC1L1u2PtZsVqWo6XWgfc1W0b9Nz1MWyk65PBcqIWpP7wOsOEgPoxGXxk?=
 =?us-ascii?Q?3K+/E/ciTU8C6V5ZCz+MMY6EOg3VAc10md08A0tE4HTsxs3gcgJL7O37ZfLU?=
 =?us-ascii?Q?68KCM/+iQpaasUqEjLIAlbjzE5UepiJTOJTgmD5Lkm499Bpr8xKf/f4Rocz+?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 17303cd9-a81c-4139-9233-08dbe0f73ff9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 07:41:14.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p45zBwFhA3gOAjVCfYoQvv6PBRsMkAMvDjhqAcB9R5NGPGxJlpABTZ2vKcZPoce5n5yQ4P1OATOGeUVv8wvem5pEoIYY23UPdMidUQPmZbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB10220
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Nov 2023 07:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8452

On 08.11.23 14:57, Bruce Ashfield wrote:
> I'll do this as a cherry-pick, since when I apply this patch:

That's fine.

> remote: ##############################################
> remote: Invalid author J=C3=B6rg Sommer via lists.yoctoproject.org
> remote: ##############################################
> To ssh://push.yoctoproject.org/meta-virtualization
>  ! [remote rejected] kirkstone -> kirkstone (pre-receive hook declined)
> error: failed to push some refs to
> 'ssh://push.yoctoproject.org/meta-virtualization'
>=20
> Which is fixable via:
>=20
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixin=
g-your-from-identity

Thanks for this hint. I'll apply the setting for future commits. I
didn't know this.


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


