Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC945C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 10:14:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web10.14826.1713780858893740516
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 03:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=lHYOu2O7;
 spf=pass (domain: axis.com, ip: 40.107.22.65, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYvUOddmtDXV+cEaD2+kveV7UAfU+72H6IiYkH1EZREbR1LQcn1PsxDJTtQmbAX5lcUOBxloQUZeRyTRtozZa7ZRhpIPckUbAOH4V1JdOEttLNRdF5NWLRg9r4zIAuCGkuqRx/KDjDhz2X/NQ2bzsfGL9/lc32Haa7LjlYjHloilSZ1AkWUD4zGdQhJIgr++Ss9VXXjUhryhMZjPhATfx3dx9wDf0rn8k5sPS0pSRMdS8VetPmSRJzoyTDg2O0b7kLGZsBXnuIXeekxh0881pz8yFdRCu35duXMOlyM/jbweVKOX8NDp53Sb340rIi3k4mRR87VP6+SNytTS5PmmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIwgiR4WJg/s9LrAONpSC+32hsiifpvoj0rXULFdkqA=;
 b=l2pbGzTRlI3MePztxCeuhCF7VBB4Ct8YFb4E8+v6ZAL1LspPHBdYIR+2bPbxZ6TAw4q2v4V0/6lwABqmy+YBavCtYepoF4QSpLtgjXeJjCGsS9sog4CcOrHqNAY7RtAfxPFLMCjRA/uiDOTyIucgvqO6kN0AfWDNh0SoM0cVoL41gDiYoOiluLWTBUrcXbCM7x/i1RGe4hVpns6l2ctuY9t7a+1dosvhQaE6q/GyvqNNSSyUMR2pc930O1yzZNNqtOrjTs0RUJ+VzN8JDlcIaVpdEHPuY29FXVoC+T21jqdtGptKrCSQtr/TwttxyDbgJAE6xDHE7ER1y6vzE50+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIwgiR4WJg/s9LrAONpSC+32hsiifpvoj0rXULFdkqA=;
 b=lHYOu2O7O2yztyaT6mn3SZ0amEZoWvz560H97/xpXqQIt2DAU1NFCax+AcptNc6MmCBqmlASEWIejCuV8nJqK5a7EX3dES09wfFu7Q5QtasJm9MPcqKkDcoVMkVDZ5n7EVu/rloV0fkWGnTMWJQNs648NITf6PYueCysr5JxZW0=
Received: from PR3PR02MB6252.eurprd02.prod.outlook.com (2603:10a6:102:74::10)
 by DBAPR02MB6280.eurprd02.prod.outlook.com (2603:10a6:10:195::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 10:14:15 +0000
Received: from PR3PR02MB6252.eurprd02.prod.outlook.com
 ([fe80::dab4:cb8d:fbb6:f7e0]) by PR3PR02MB6252.eurprd02.prod.outlook.com
 ([fe80::dab4:cb8d:fbb6:f7e0%5]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 10:14:15 +0000
From: Ola x Nilsson <Ola.x.Nilsson@axis.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCHv2] diod: Build in 32bit systems with
 64bit time_t
Thread-Topic: [meta-virtualization] [PATCHv2] diod: Build in 32bit systems
 with 64bit time_t
Thread-Index: AQHakvR/4SSFNb4pR0+Adp2qya3UCQ==
Date: Mon, 22 Apr 2024 10:14:14 +0000
Message-ID: 
 <PR3PR02MB6252A820016A2ECCB1D5C3FEC6122@PR3PR02MB6252.eurprd02.prod.outlook.com>
References: <20240420072917.914160-1-martin.jansa@gmail.com>
	<CADkTA4O0aONd4+4u4ZnTTiDNv2CqoQZvUVKSZM=5Dk08QpWDog@mail.gmail.com>
In-Reply-To: 
 <CADkTA4O0aONd4+4u4ZnTTiDNv2CqoQZvUVKSZM=5Dk08QpWDog@mail.gmail.com>	(Bruce
 Ashfield's message of "Sun, 21 Apr 2024 21:29:04 -0400")
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
user-agent: mu4e 1.12.1; emacs 30.0.50
x-ms-exchange-imapappendstamp: PAVPR02MB9521.eurprd02.prod.outlook.com
 (15.20.7544.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR02MB6252:EE_|DBAPR02MB6280:EE_
x-ms-office365-filtering-correlation-id: 7948c731-41ec-4411-1130-08dc62b4f691
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?bwZTdik6zhydDm+i2ZkyWX+kB+uuzACM8lmOjZtAMEPU3YRLlnMjh97m?=
 =?Windows-1252?Q?GG3UrGGuE2DU5fU8r9m9BdSxSLVnOVjUeca7RkrIvy9c89tVOqfXmajO?=
 =?Windows-1252?Q?NCtlXWUi665Uio1eYiiydUZ2FbHjR7x4PlPoEAB+3LI8CRXQqR0Jy6Lm?=
 =?Windows-1252?Q?vtI0uwd9krNHfXqYJwsxMrAb1MgoFiz7f+5Pw4aipwtVB9v1lJHFmarW?=
 =?Windows-1252?Q?ASywJSNtdRhB7i7dRA16ZRMfU+BQlxAE1VM2XPazK2rf5+ULYR2K2QjY?=
 =?Windows-1252?Q?XmYaFFmm+G7NfwD6JWAifFBox1uGdc9KJ324W2lxA7jlosXh4tXeo5Rl?=
 =?Windows-1252?Q?aHi0ZGUyNp+jqy0aQzmy+bGK0Q/WZVwcBQotR3/Cu/8CYf8VqR8vV+Gy?=
 =?Windows-1252?Q?bjdW9A3AbsoH/ojIiBA2Iv3y5lGJ9dtJ7fkAFVx9vFTlBLvlSWgmbA5f?=
 =?Windows-1252?Q?GlUTx2VeNdLs6i0Sgvs6fWHfm0ZfEZa3bZ3z0SwdGgk3cACGthIKJy/k?=
 =?Windows-1252?Q?myBdyZ2+NesJGDfsileIn3PuDNdvgcVHQT8ziv2Vh9cyFZ6CS4Lt5xjp?=
 =?Windows-1252?Q?5TM/vH3Tul9W/RxWu+dicMQfPIkMYVSqkomOHpKd2klo0UXngCbUewOk?=
 =?Windows-1252?Q?R5nao417fImjOS3jeVJ0X+1QgA3uMX2wlC3mqhoYzzC6oMJLavw9pXIU?=
 =?Windows-1252?Q?CuiNWqIzSgYbbz9neFTL4ht1Fjy6Ex+Hltc5jpQ3FPh/msi3TACLQprL?=
 =?Windows-1252?Q?IqdDysCq5WlRIMGmIehGjFUD9A3MOD/1g9MslopLruNHQSNZTdkw7zes?=
 =?Windows-1252?Q?22qgFpomSYKe2et6LTbwolN9ZKsAdEk2QOEd50MY5LfI4raplRlU1vh3?=
 =?Windows-1252?Q?BuVGvtAlazxuIDq5Vxu9TXbWpDnFNt8Qn6SsejqtUrFDcSSXkOL2+w2X?=
 =?Windows-1252?Q?OcmzevubXU7cY7Ui69m/G0/ly56YNzGE+O1cidP1fw3DYBwth2d/b8mL?=
 =?Windows-1252?Q?QwJ8XbBFjw2ffces86SJuFHfUqVAidSGO7jbXFQYNdbxDOnbqOVo8iIm?=
 =?Windows-1252?Q?fYKjrKtBTYiAGN9yFuiwTI2NeVdzWl7z793soB4WlO63Nk08w7sv16/1?=
 =?Windows-1252?Q?Q3MALztsLK2JNNNvfJS8qaIVXCoekWAa10Wmg9w+ATAhRdQfImFR9dXW?=
 =?Windows-1252?Q?z7+kAJKLxA36fSSNgPIGosKGFciFXoi1qhieLHM4wd+tzDgXXMnIgu9W?=
 =?Windows-1252?Q?GTaNnuGcdyOaaetq13A4cCjQOXYkDqYN2M2OU3cIasoei4Fb8raMb0Je?=
 =?Windows-1252?Q?5xUAlCgXu8DooZFabiSLRITdH5vPE/B5vlfoNCsu/v73krSExAgQm4K1?=
 =?Windows-1252?Q?E3LHp1viTAyV9aeZf/EU3wQc7rDhXLvQ2Pc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR02MB6252.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?v/IN7NelVsRsvqtJTbPQmcm/ce1MOgo6RsyAMe3CId5WWci9r4Dj9brt?=
 =?Windows-1252?Q?M8GINCKehyRV91q251HUt6JPDdO9S7uXxvr2Ux5VQ4InU/Hx49Y1+NPH?=
 =?Windows-1252?Q?gW2TqOyNHhZTmD8YaKWaTFO7IoRJVCb+715y1wsTcRfr4t1Esf/17SR5?=
 =?Windows-1252?Q?/6/sz6jdf7NNU9RK0roAMH7SxDwduEbgqlZkgnH6jFse51XfOvOqizMf?=
 =?Windows-1252?Q?gzL5K2raJjWMvJOVHc1/9sEBYHvpfl/wM/0nDW1dCmvepz0sCxaoCSFy?=
 =?Windows-1252?Q?RopsiBwEtuKk9jmDYm0KdP1V26HAqfkC0+cqWil+hupF6UAzORnoAd2V?=
 =?Windows-1252?Q?FvImOjz3ZGWR7lR9ruTbH5LawabMrHDD4b0r3a1FJVbFQOSG7ALT7i4K?=
 =?Windows-1252?Q?5wwsvx30wsQAJj5F1dQdve0H7mTyDKmsXh2ojN4JhisfukURm4RptmYx?=
 =?Windows-1252?Q?r8MgTImjznUibQWYHr/0WiZDC6MvDIU0G6n0P/VmwlKGViCN6LIurIwl?=
 =?Windows-1252?Q?ELubVqofteEh609ec0P3oWEodUt7lLgrJoVwamwQ1ljoCIYne1tNaHJ9?=
 =?Windows-1252?Q?HPHTkknUlFNj/QC8R1QUnk3El7cA1Ze4CMTp18YQHZthMViGmZOmBQ3g?=
 =?Windows-1252?Q?F8pkwLN1UNjS7rFP772wcnUChlr4HlQjzZXLQqYnvtXM8xHZ+E64VYYX?=
 =?Windows-1252?Q?MxjvnyS9Q1Quj4oBNrmYArC6NqX7eQKTO3qUigtWollou8Wiyl3Cxc3l?=
 =?Windows-1252?Q?iIqhCwmKvL7n9tW1Yi7jIi79Cvh/Wdc7+f4A7SWSMU2GMdHN+DKWDWhZ?=
 =?Windows-1252?Q?U2I/1G5CvHQCg2Bdn3qFhG48QXCFI8UGL/lkJMY6O+tfFhZq+uYWCupC?=
 =?Windows-1252?Q?cEB+WjtNy4kzY/SHKDD7X8aHuWlJY193PAZswAN1zzydoHiYmZ7bZQcU?=
 =?Windows-1252?Q?ltCojfhINGvnDkopZvKQTW6lofu8xHJIrEvZeyunWhJ/07IWZ9dRk2dT?=
 =?Windows-1252?Q?M9wDk6BVdobrEBlwTRpqvEu9VGOaJXowcXjK7kj4Lvh13tS4g7X8zHAL?=
 =?Windows-1252?Q?kE4OC/m5xPfQ/sj1Mjz3r4KFPPsA0jrgL+FArKI44kNNdhIUXIv04U8/?=
 =?Windows-1252?Q?wH2qrbhZ+6myrG/SySIIftq7xKIvopQoRqRfE/UMWNpL9F41R42tdYhw?=
 =?Windows-1252?Q?iRu8MQf9nVgkGNqmk4+IN62x2K6b02zJnQrEbK9rHBfBCNJ313Mi5JAn?=
 =?Windows-1252?Q?VoCiQlTUKA7HMStht93CHo6A7lHc8WYUUMN/NSBV1fY4CAnOAy17OO63?=
 =?Windows-1252?Q?X3mXKpLUmJVK38Xlx0h3MUIFQTHAXfkuPBE0QpN0kAx8fwUivitNGEX+?=
 =?Windows-1252?Q?D56H8bEkc8uijVDpxEV+FN0NSSL9dbQ9GqSbHQhotNxBiRaTxnUFhJha?=
 =?Windows-1252?Q?e/wY34NVNKmtUQejlq8wFM0MaCleGcudtFn8G6CuK2I5RzceDcTQKZjH?=
 =?Windows-1252?Q?YtGO+mp6J303l7ZoTt+t0ByKbbyddB7ooQjyR9jYE2h7a10PmGf6ohXG?=
 =?Windows-1252?Q?bUuGNmBYDdvJS/T5Z9q5oUqLpG9O2rhuRcHbv4Dva6nNJ/NRXLeFxWEg?=
 =?Windows-1252?Q?IIpoCl6IdmFt077L4nM5VftE4m12Glwo6GZKWPC1/RiejH1JwEwGcccY?=
 =?Windows-1252?Q?X6VPHkSqcJM=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR02MB6252.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7948c731-41ec-4411-1130-08dc62b4f691
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 10:14:14.9498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66ykn4vzuZeWo7+dys7aeD/UCTKQO1RHfEFbUNEkdR1cQZuQSxuAT4tS9R92GYIn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6280
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 10:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8689

=0A=
Sorry, I did not realize you required a new patch from me.=0A=
What was wrong with my patch exactly? I had already deleted the email=0A=
and could not see anything wrong in the groups.io web-ui.=0A=
I have not changed my setup and have sent patches successfully before.=0A=
=0A=
(There is something wrong with our SMTP server today, I'm forced to use the=
 outlook web client *shudder*.  Sorry if I sent this more than once by mist=
ake. )=0A=
=0A=
/Ola=0A=
=0A=
On Sun, Apr 21 2024, Bruce Ashfield wrote:=0A=
=0A=
> On Sat, Apr 20, 2024 at 3:29=E2=80=AFAM Martin Jansa via lists.yoctoproje=
ct.org=0A=
> <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:=0A=
>=0A=
>> From: Ola x Nilsson <olani@axis.com>=0A=
>>=0A=
>> Signed-off-by: Ola x Nilsson <olani@axis.com>=0A=
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>=0A=
>> ---=0A=
>> v2: just fixed Author=0A=
>>=0A=
>>=0A=
> While I appreciate the fix,  I'm going to wait until Ola ack's this, as I=
=0A=
> need to know that their setup is fixed so that future patches have a=0A=
> correct author field.=0A=
>=0A=
> Otherwise, we are just pushing the issue of their configuration down the=
=0A=
> road.=0A=
>=0A=
> Bruce=0A=
>=0A=
>=0A=
>=0A=
>>  recipes-extended/diod/diod_1.0.24.bb          |   1 +=0A=
>>  ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++=
=0A=
>>  2 files changed, 101 insertions(+)=0A=
>>  create mode 100644=0A=
>> recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-a=
nd-scanf.patch=0A=
>>=0A=
>> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/dio=
d/=0A=
>> diod_1.0.24.bb=0A=
>> index 5e191dc0..6019fbfb 100644=0A=
>> --- a/recipes-extended/diod/diod_1.0.24.bb=0A=
>> +++ b/recipes-extended/diod/diod_1.0.24.bb=0A=
>> @@ -14,6 +14,7 @@ SRC_URI =3D "git://=0A=
>> github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster \=0A=
>>             file://diod \=0A=
>>             file://diod.conf \=0A=
>>             file://0001-build-Find-lua-with-pkg-config.patch \=0A=
>> +=0A=
>>  file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch \=0A=
>>             "=0A=
>>  DEPENDS =3D "libcap ncurses tcp-wrappers lua"=0A=
>>=0A=
>> diff --git=0A=
>> a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf=
-and-scanf.patch=0A=
>> b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf=
-and-scanf.patch=0A=
>> new file mode 100644=0A=
>> index 00000000..3c13c101=0A=
>> --- /dev/null=0A=
>> +++=0A=
>> b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf=
-and-scanf.patch=0A=
>> @@ -0,0 +1,100 @@=0A=
>> +From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 2001=
=0A=
>> +From: Ola x Nilsson <olani@axis.com>=0A=
>> +Date: Mon, 15 Apr 2024 17:31:44 +0200=0A=
>> +Subject: [PATCH] Handle various time_t sizes in printf and scanf=0A=
>> +=0A=
>> +The members of the timeval struct are both signed (defined by POSIX)=0A=
>> +and typically both 64 bits on a system where time_t is 64 bits.  This=
=0A=
>> +is possible also on 32 bit systems where time_t is larger to handle=0A=
>> +the 2038 problem.=0A=
>> +=0A=
>> +It's practically impossible to find a type and printf format that=0A=
>> +works even on all glibc systems.  Play it safe and always use printf=0A=
>> +with intmax_t and explict int64_t variables for scanf.=0A=
>> +=0A=
>> +Upstream-Status: Submitted [https://github.com/chaos/diod/pull/100]=0A=
>> +Signed-off-by: Ola x Nilsson <olani@axis.com>=0A=
>> +---=0A=
>> + libnpfs/conn.c   | 5 +++--=0A=
>> + libnpfs/ctl.c    | 7 ++++---=0A=
>> + utils/dioddate.c | 8 +++++++-=0A=
>> + 3 files changed, 14 insertions(+), 6 deletions(-)=0A=
>> +=0A=
>> +diff --git a/libnpfs/conn.c b/libnpfs/conn.c=0A=
>> +index 6e85fff..c34c840 100644=0A=
>> +--- a/libnpfs/conn.c=0A=
>> ++++ b/libnpfs/conn.c=0A=
>> +@@ -16,6 +16,7 @@=0A=
>> + #include <stdio.h>=0A=
>> + #include <string.h>=0A=
>> + #include <stdint.h>=0A=
>> ++#include <inttypes.h>=0A=
>> + #include <stdarg.h>=0A=
>> + #include <errno.h>=0A=
>> + #include <pthread.h>=0A=
>> +@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)=0A=
>> +                               (void)gettimeofday(&b, NULL);=0A=
>> +                       (void)gettimeofday(&a, NULL);=0A=
>> +                       timersub(&a, &b, &c);=0A=
>> +-                      np_logmsg(srv, "[%lu.%-3lu] %s",=0A=
>> +-                                c.tv_sec, c.tv_usec/1000, s);=0A=
>> ++                      np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",=
=0A=
>> ++                                (intmax_t)c.tv_sec,=0A=
>> (intmax_t)c.tv_usec/1000, s);=0A=
>> +               } else=0A=
>> +                       np_logmsg(srv, "%s", s);=0A=
>> +       }=0A=
>> +diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c=0A=
>> +index f40cde4..317a22e 100644=0A=
>> +--- a/libnpfs/ctl.c=0A=
>> ++++ b/libnpfs/ctl.c=0A=
>> +@@ -16,6 +16,7 @@=0A=
>> + #include <stdio.h>=0A=
>> + #include <string.h>=0A=
>> + #include <stdint.h>=0A=
>> ++#include <inttypes.h>=0A=
>> + #include <stdarg.h>=0A=
>> + #include <pthread.h>=0A=
>> + #include <errno.h>=0A=
>> +@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)=0A=
>> +               np_uerror (errno);=0A=
>> +               goto error;=0A=
>> +       }=0A=
>> +-      if (aspf (&s, &len, "%lu.%lu %d.%d\n",=0A=
>> +-                                      tv.tv_sec,         tv.tv_usec,=
=0A=
>> +-                                      tz.tz_minuteswest, tz.tz_dsttime=
)=0A=
>> < 0) {=0A=
>> ++      if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",=0A=
>> ++                                      (uintmax_t)tv.tv_sec,=0A=
>> (uintmax_t)tv.tv_usec,=0A=
>> ++                                      tz.tz_minuteswest,=0A=
>> tz.tz_dsttime) < 0) {=0A=
>> +               np_uerror (ENOMEM);=0A=
>> +               goto error;=0A=
>> +       }=0A=
>> +diff --git a/utils/dioddate.c b/utils/dioddate.c=0A=
>> +index bde002f..f392792 100644=0A=
>> +--- a/utils/dioddate.c=0A=
>> ++++ b/utils/dioddate.c=0A=
>> +@@ -21,6 +21,7 @@=0A=
>> + #include <unistd.h>=0A=
>> + #include <stdlib.h>=0A=
>> + #include <stdint.h>=0A=
>> ++#include <inttypes.h>=0A=
>> + #include <stdarg.h>=0A=
>> + #include <stdio.h>=0A=
>> + #if HAVE_GETOPT_H=0A=
>> +@@ -142,11 +143,16 @@ main (int argc, char *argv[])=0A=
>> +         errn (np_rerror (), "error reading date");=0A=
>> +         goto done;=0A=
>> +     }=0A=
>> +-    if (sscanf (buf, "%lu.%lu %d.%d", &tv.tv_sec, &tv.tv_usec,=0A=
>> ++=0A=
>> ++    int64_t sec =3D 0, usec =3D 0;=0A=
>> ++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,=0A=
>> +                                     &tz.tz_minuteswest, &tz.tz_dsttime=
)=0A=
>> !=3D 4) {=0A=
>> +         msg ("error scanning returned date: %s", buf);=0A=
>> +         goto done;=0A=
>> +     }=0A=
>> ++    tv.tv_sec =3D sec;=0A=
>> ++    tv.tv_usec =3D usec;=0A=
>> ++=0A=
>> +     if (Sopt) {=0A=
>> +         if (settimeofday (&tv, &tz) < 0)=0A=
>> +             err_exit ("settimeofday");=0A=
>> --=0A=
>> 2.44.0=0A=
>>=0A=
>>=0A=
>> =0A=
>>=0A=
>>=0A=

