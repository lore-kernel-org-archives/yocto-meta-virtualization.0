Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2213C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:40:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.44])
 by mx.groups.io with SMTP id smtpd.web10.10288.1651239636771409988
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 06:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=WLgnB1P6;
 spf=pass (domain: arm.com, ip: 40.107.8.44,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hlcgh/RW4ApM4ODJJf3A1YoCmtlxgMDJXvaaUyLxqm6MBguMWMVObcvEPs9t6x6DWF1r+591nIO0s+cyKjqpkbcLCq2HRsCrHbDrxv6z0IHZpo63YIypRssrJuvV3JjYEBSXo6vK34RZhquSN2qgZlm/Gcj/iTATPpYy5xZgbx3XTTtM+eAL9sBo6LTbb59TXKMZXFzp/zJgfMe82XtAEfVsiHnhUVrJ3XTmTAT+X8B40Sqg1lSNKO1O1+JuRyIWtzu8U0inboQsd2mvauWEpj33kbEctx54YE3C19eMXNcP7aVOO3Hc9I2JTbWMdtUo2pcDeMbjRvjV22phSY7amQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ang8fcOffX1s2pri+RFNrmJw07Wh9sMNi7AQNdDlwx8=;
 b=WBYGW4V7JNASCWW6/HZSdzP0ykJ0l2G6GBEjGotn5AUVwUFkdHhT0vPB9kCEna8oKyCwMc+YstQhZtijEc0S0yFrTyECHEhSyvee9kN3ueQmc+p7dmfx0fYacZVvOrR9zJ0UHtGYVIe9MPbZ4BK7j0QjZlvk6YgT/bGB5BMrUkHFxLTU9EyFYpnohW44j6GW7QwsGNIfuo/qhJFHGJpzugA4ycc1l+ERiCgmTdqtyGMpuRSyc14Qvju+NWSf8w598ODYKS6WkrN+mj+YEha2q22fUM8DsdRZLFUJcT8dcEOGnioVyQ4pB1oepxZDBWT5DVZnPK1GwAQVnTnLoQjQHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ang8fcOffX1s2pri+RFNrmJw07Wh9sMNi7AQNdDlwx8=;
 b=WLgnB1P6GvC/b6AzYizdT//BmcH0NOc0bQ7lmIvQRYKuWZToAZg1ZhrJiGDd6J6lIehCUJftRShDjbv+pTkC6cY7pjHRpHGvdr3XisaMXnYqgEPRlBPSQHMfqzrhc98+EzQdP+j0BzjMSTWW37Kq7ix0rS6RV2b6DzgwJN7AB+w=
Received: from DU2PR04CA0277.eurprd04.prod.outlook.com (2603:10a6:10:28c::12)
 by DB6PR08MB2822.eurprd08.prod.outlook.com (2603:10a6:6:1d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 13:40:31 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::97) by DU2PR04CA0277.outlook.office365.com
 (2603:10a6:10:28c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 29 Apr 2022 13:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 13:40:31 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 29 Apr 2022 13:40:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e5116595fa789b3d
X-CR-MTA-TID: 64aa7808
Received: from 6f7633a3ba8a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8037651-741F-4589-8426-61FCE2B2CD9A.1;
	Fri, 29 Apr 2022 13:40:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 6f7633a3ba8a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 Apr 2022 13:40:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsKPufYeq8WSlR462ayira9QAx7UhTrq3ZmJuoilPPAc3y0d5UmAH285DL6qmOGvNHJk4dLArAjnVDgWAEZ9TrgxmN8OMT+dkPkqTmRhWeqXP0bj+Cgmh9ew8zlPXnY6l5rVyWXU3JNwgNjlY59WnbPVnndavPN+FLcmjCp/MOWvgUgqfLJu5wVStDFNcdF2YOJGE31j+V+DXz+aw2pFlAZeYJ5qFisHILT7Kh4Asyawcfl1ICcaAD+iGYF/Ys3+P8slZMe5nDYUK+IS1Q4yn2agBIfFB6cB/PnV/kElZ71030iMAmZ1YLQxurYl/bAOFdqTRF6eqYToQrizGC8f9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ang8fcOffX1s2pri+RFNrmJw07Wh9sMNi7AQNdDlwx8=;
 b=iOSBi8qVCgWCxtOMueLi7haiBVdkmfcjMk1XkbOiDFOoOABJlIPRFiurRrmfoSOFrSHY5TqkSC58ZBzd53xDNH9qJWn17tCq0OqQ5tAkPaMic3VjANt1XdDxF7X8SH8FL++Kye4CPUPBERfGdWH3QpeUEnBlu7uiHKy3IUBW+pIu856aiveSCPkAKZVCSv/fCUoCJUkPlLAmwiWQ3wpxtkJLWFSIiZbuEuuHZ39wqSkeBskJ1ZynrO5h0kp18uoc1owqp0NaGN4cWOFOGKSo3p5B7pJpyWdVIuONewXVLBfkOct7jf0R9T/5TtMuQkDjW0gcS0Ih64vTxGmoVc++Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ang8fcOffX1s2pri+RFNrmJw07Wh9sMNi7AQNdDlwx8=;
 b=WLgnB1P6GvC/b6AzYizdT//BmcH0NOc0bQ7lmIvQRYKuWZToAZg1ZhrJiGDd6J6lIehCUJftRShDjbv+pTkC6cY7pjHRpHGvdr3XisaMXnYqgEPRlBPSQHMfqzrhc98+EzQdP+j0BzjMSTWW37Kq7ix0rS6RV2b6DzgwJN7AB+w=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7305.eurprd08.prod.outlook.com (2603:10a6:20b:440::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 13:40:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 13:40:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Topic: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Index: AQHYWpPid/oZQrV6gE+p6K0H2pRecq0G43AAgAAB4gCAAALWgA==
Date: Fri, 29 Apr 2022 13:40:16 +0000
Message-ID: <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9bce4f55-bc46-4db6-fb7f-08da29e5d43b
x-ms-traffictypediagnostic: 
	AS8PR08MB7305:EE_|DB5EUR03FT042:EE_|DB6PR08MB2822:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB28229616F2F16B7E4AF248C29DFC9@DB6PR08MB2822.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 imybSLrSY81uLl7VhKoSGj/BoXKwOgEia0JfWkiF3yZuC4PO+otsM9g8LWbUWJGDTACMzoy4m80OCEj7wcIkGKqhMVVuq8CcVElXy2+U0UZ3CqALSPkithFfPKMdOCpBGbzFgEYO9P0SEVTOx+Wxy3b/+8e7JB8S0KS3J9zUuPR6dFu6JA3z+BJZel6bdy/FDvJGQDanbEDLmVStzzBtXf90anMOcLVsiVZnQK3U1VpZsLz71rSzwIAKLlwav1eAtc7NdwscB/yOe3vB15NxwEkPkB56Kq3akig0atZVhgCE6MsZK7DCD6hk46tlvcpX3G/1LNchWqm7buuozovX2k1HgkWtYg8UvOrFVInklfnJwdDYN+giG+D4H4nVhaAqv3SspsWFvAp0n5h5ynW47Ly/Esl+tC13J2MEUVHkRDoWr9nkvJycSb0Tg6/8mIyRI1JZI3znweQbZUt5D3Sa1LEAct1b+Kmy7A4GsHXJ0b/bzEk5eAtcZ1abQ8N6lvL3pnKpz0HwzME1Ymb8kmIX+8vsmDx6WdD8REgqyptTdDdLlOVANtPWozpn5fCh8R0Itnx3XOBdiyzqUt4XOe1cO2+y8soTJuHhQRUxZaNGv8LGTstN4WpLTzteAmkIs3VYhq396uK6bSiF9F6AmkisdKDwdQSa0kUjlzM6rhA1MAdC/SNXtkF4BgW+FU1Nw3nvM/okKHBHbZQg2nTHesBoT0HHsxz3MPEFj8lJQvpZ63jMSJezGtQmZv4jg3YWBqwqo2dcrP4m+njABbk4YyM5by6kJXnaPb5Xpl7/A7Jmp/KYogGuYzZpttfmgNvbtvjZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(64756008)(6506007)(6916009)(54906003)(966005)(6486002)(508600001)(186003)(91956017)(66946007)(76116006)(66446008)(66476007)(66556008)(83380400001)(8676002)(4326008)(86362001)(71200400001)(36756003)(8936002)(33656002)(2616005)(5660300002)(38100700002)(38070700005)(2906002)(122000001)(6512007)(53546011)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A0E843B76D037F4394E13CDE591BAF03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7305
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ba526831-1f29-47f5-3a83-08da29e5cb46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ECXe+/wkzC0BbO7KIEcJZVvy20OBdeNRp5y0QZI5Eh6GCx3qDpjueaiM/P5M/+XDmlCmQUH1IfEvVmzt0E7xq3bcl1eLhm8Zq7za8VqvD86Sb/5IVzg5XHCjux9oxr4OXnG2QcWfeKv70bmFnjewWQxZ/+y3qTjS9Qa/ott/8uE1+AWPgc+MC1Plni6jb5AMqaFNM83ABw1qSu1RM4Fqpabc+zPYd+Led69M8KG5oTj87AM2n3Uv6NLMmQ7JkgT39uLvxTYW1ZTzUpcDfYD8yO/yww+apu5j2H/u1T6yKdkl6bwSi1F6wzUR383iUAcjTJKSQchJinSGK6I4FPcRf6WfOluOB6lGvG/3ozieHZ8fF/KgM/PQ5fQ/nnLfA9Ks5PDDpmgF+pWjoR9Aai47ZToFI9sTug8ULGR92v+IAWz1cGpfTyujP61WkZV+rZdkGJJc05gkXtXq3kHX2iPWLiXVkooIeWSmemGjYHTFo4ylujI5CQ78ymJjnX0NgTnUyYFa7CDA9PJetpmxZDGajffa8vpqgVkFvhjPMXfG91QVg7S4w3ITXk+nVtl5WmCOcwq/2amRMYg/lNbaYOaClJpzAUfgaCyXe5K+83BnUxguKWlWeuo6HrMrVbnRibT/XR7L3qBYp/KKmOSsglm8xdZnXqi9h2FkZ8JEOb7O/WzuqpzPwOSHy0li4TjvoCDun9U0kEzS6o+dAmwWbvekq+0xtw3aQYEbqSTBE0Y1AGc57Bl0jSKJrel6MUM7ubT7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(70586007)(6862004)(33656002)(47076005)(336012)(83380400001)(70206006)(4326008)(8676002)(40460700003)(107886003)(2616005)(36860700001)(186003)(316002)(54906003)(6512007)(2906002)(26005)(86362001)(6506007)(53546011)(36756003)(82310400005)(356005)(5660300002)(966005)(6486002)(508600001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:40:31.1296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bce4f55-bc46-4db6-fb7f-08da29e5d43b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2822
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 13:40:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7235

Hi Bruce,

> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>
> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Christopher,
>>
>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.org =
<christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>> The Spectre and Meltdown mitigations for Xen run PV guests within
>>> HVM virtual machines, so Qemu is no longer only needed for systems
>>> configured to run HVM guests.
>>>
>>> With the split xen hypervisor and tools recipes, the bios dependencies
>>> belong in the tools recipe, so move them and replace the hvm
>>> PACKAGECONFIG option with the recommendation based on target arch.
>>>
>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> I can build and run on x86 qemu and I get stuck during init in Dom0 (whi=
ch is apparently already known).
>>
>
> It is likely the xencommond init.d still causing issues.
>
> I'm doing a revert of all those changes locally, and will start some test=
s.

Please let me know if you need some testing.
On my side, I have the issue on arm64, arm32 and x86 at the moment.

Chees
Bertrand

>
> Bruce
>
>> Cheers
>> Bertrand
>>
>>
>>> ---
>>> Unchanged since v1
>>>
>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
>>> recipes-extended/xen/xen.inc | 6 +++---
>>> 2 files changed, 5 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/=
xen-tools.inc
>>> index 6bbc8cd..54bc477 100644
>>> --- a/recipes-extended/xen/xen-tools.inc
>>> +++ b/recipes-extended/xen/xen-tools.inc
>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
>>>
>>> RDEPENDS:${PN}-dev =3D ""
>>>
>>> -# Qemu is necessary on ARM platforms, and to support HVM guests on x86
>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d)}=
"
>>> -QEMU:arm =3D "qemu"
>>> -QEMU:aarch64 =3D "qemu"
>>> -
>>> RRECOMMENDS:${PN} =3D " \
>>> - ${QEMU} \
>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
>>> + qemu \
>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vgabi=
os', '', d)} \
>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_R=
RECOMMENDS}', d)} \
>>> ${PN}-flask \
>>> ${PN}-hvmloader \
>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
>>> index 8b86de5..4c38ccf 100644
>>> --- a/recipes-extended/xen/xen.inc
>>> +++ b/recipes-extended/xen/xen.inc
>>> @@ -9,13 +9,11 @@ require xen-arch.inc
>>> PACKAGECONFIG ??=3D " \
>>> sdl \
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
>>> "
>>>
>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkpol=
icy-native,"
>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd,=
"
>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmware/b=
ios.bin",--disable-seabios,seabios ipxe vgabios,"
>>> PACKAGECONFIG[externalblktap] =3D ",,,"
>>>
>>> DEPENDS =3D " \
>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
>>> --disable-rombios \
>>> --disable-ocamltools \
>>> --disable-qemu-traditional \
>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim', =
'--disable-pvshim', d)} \
>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bios.bi=
n"', \
>>> + '--disable-pvshim --disable-seabios', d)} \
>>> "
>>>
>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/=
vgabios-0.7a.bin"
>>> --
>>> 2.25.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7226
>>> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bertrand.marquis@arm.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

