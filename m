Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA63DC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:39:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web12.5558.1642595988385239692
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 04:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=R0MiAeYN;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kRlY87ZXdtNe4Uk7zu7a+GH0TmB33DPNXL5tn059pE=;
 b=R0MiAeYNCGYCLKlb6camqukwI8hx/aaWBk5IVQiRS9YlA0Juuch6C2wX4pItYNBgahYtocI6JEWvEbnxOzX9q2qOP/2JOw1NIt97JYZ6hvxEopc6oVfIn1/kxIgz0gdcgydGY3DkwVxgJUPSwOHt8Lt3g1Dk9m2KX4q6pxaGQMU=
Received: from AM0PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:208:be::25)
 by PA4PR08MB6239.eurprd08.prod.outlook.com (2603:10a6:102:ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 12:39:44 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::27) by AM0PR04CA0084.outlook.office365.com
 (2603:10a6:208:be::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 12:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 12:39:43 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 19 Jan 2022 12:39:42 +0000
X-CR-MTA-TID: 64aa7808
Received: from b3a65c80eb04.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9FE9222-5A11-433E-A7DA-3F48E5BC59C0.1;
	Wed, 19 Jan 2022 12:39:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b3a65c80eb04.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jan 2022 12:39:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqfWpJrg9d8jVeIagcZ/a1njgin/mrF8mc6nenXTfxOlEkuIGn0+zKWzcY3w7MJ9bAJBfei1VW7B2TPRVNfrapCseejW/kScyoeHQ4bGFMHRtusPX84Ci9LFezOkRUCX9ap1CLJ1ZNPWABpPyzzncSGJC61t/EFFqP/GJgLgPKvMfCRnevpA0sSNvJvBn6D3wEWXtot9FpVPUMHYFsDGrTNsvyEP4ksPW873VrAInaUhGqTa47776jIuyi84FaZjyqWh2vb85GXbK54353GJxOw1F3020nYHRqRJkVRPvB1tOuBqn714CxB/j6Zj3m4zPT9znVNDAL0X8N598BpznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kRlY87ZXdtNe4Uk7zu7a+GH0TmB33DPNXL5tn059pE=;
 b=n1jf0fYod3UP/qFdWD/aghiuJi588Cp5ukNlO8NlpY5SVgyn7yMHezrs1KWWWEj2uusEtFHFSrCVcRRjQiLJv1PzrPR58faKUD0/Ulk9nrszmFLMWfmTYKR4a5nbAXgASIjxC/n0g/tNxnUz+8ePfzgBlOqG/CkpZq9aWefXy6xR3QXQHx9eOSkza63dvoisNtnfetDFsjT4nWbTB/bgxlwp6IsXlRHhibbTDgN0Tb6gdnwpv9Mcq0kA51hlMrgvz4E0jcmcDtiNqe0sW1ZF/a8mkVimjyhU556RnofY8zUTkyU6rawjg9JhKnmrjvCW4AUuM8uNPHLymcvanEQPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kRlY87ZXdtNe4Uk7zu7a+GH0TmB33DPNXL5tn059pE=;
 b=R0MiAeYNCGYCLKlb6camqukwI8hx/aaWBk5IVQiRS9YlA0Juuch6C2wX4pItYNBgahYtocI6JEWvEbnxOzX9q2qOP/2JOw1NIt97JYZ6hvxEopc6oVfIn1/kxIgz0gdcgydGY3DkwVxgJUPSwOHt8Lt3g1Dk9m2KX4q6pxaGQMU=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM9PR08MB6273.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 12:39:24 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::255f:e931:6844:c35d]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::255f:e931:6844:c35d%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 12:39:24 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	=?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>, nd
	<nd@arm.com>
Subject: RE: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
Thread-Topic: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
Thread-Index: AQHYDObbU7Bb0GJp/Ee7nRqVKKwn5KxqN9zA
Date: Wed, 19 Jan 2022 12:39:24 +0000
Message-ID: 
 <AM6PR08MB34615E150DB7600831CD308792599@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20220113113059.20489-2-kamil.dziezyk@arm.com>
 <20220113113059.20489-1-kamil.dziezyk@arm.com>
 <20220119034402.GA51854@gmail.com>
In-Reply-To: <20220119034402.GA51854@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 589CD13722F00C4491A7A758A6B7B153.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9067afdc-9482-41da-0dc0-08d9db48c4bd
x-ms-traffictypediagnostic: 
	AM9PR08MB6273:EE_|VE1EUR03FT019:EE_|PA4PR08MB6239:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6239ED5A8F7586201D8E8BF192599@PA4PR08MB6239.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Jv3eJ6t5wrxYYx1sRNJBKrCbxAyWgIf1tfmsVlvAhgWR0aaT1s8/m7MZ65CpWcH45VAidj8HSQFLeQpiio+zdwZUaOJxO0HfuFHVaK/1NuV3HsqRrNnNZedLU1MdtV59QWN1gABAPw+zz+OvR8SHfhpzNLZmtSi5gmzgF+yX0M9PCcYKTTx0Zwj+yWfIjgWp6PTNQJHIxJI74o6kMYNT45nCW3DpI2NbDQ848L4mvuPB4vSTOx6p2NGq7HRU7SGKnjAcirRhPdoySbx8f2F7h1SCHjgF8JxcIdCSJJSpFTqjAZ22YTIlVecJokz+htsEw586WTOh/bJj7Ah18faD9jRs+azAAPk/dAcJ1LENFHNzPh80782Eeu/J1A779wNpmXWm0157F723JdIchYPaqWSWl6Fwn/fIdywF/7zyOE6kKGvZ9d8FAME2fl1xUQzVJ4bInJjL+LDBPwIPXVLR+zPPiNOJ1ZKnkS1rt0XBHbfpBAMFWAi7xriC38VbfJoKp4Yga53dGXch2sXkC8ycIKmtWzdZL3SyTWRBZXPrdCAMe1e3Zn3xv3tb2pffEuZs7OGSDfFIctTD5z74V3nKhFEk5LgiXiGwe4Sy4TLXVURbVS2FA3rOoKSahYcdtKMSbXOjR7VNjbqKfrxDyjcK7fKEohRqVhCgZfOwaw/NppauKTqbIiKo+lGneXFJ+T8cMu6W5IG2PsBgt/kNW3p7Zg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66574015)(83380400001)(71200400001)(38100700002)(122000001)(52536014)(66946007)(508600001)(2906002)(55016003)(8676002)(6636002)(38070700005)(33656002)(66556008)(66476007)(64756008)(7696005)(86362001)(186003)(4326008)(26005)(6506007)(110136005)(54906003)(66446008)(76116006)(316002)(9686003)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6273
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ea84e621-5f02-4d1f-2277-08d9db48b96b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fQguCSbxc0S2oY5bnlhy8KGJCMMSA9BwOzEaN1ir+5NWI72ukkIpBYtAzKs99jWhs0TzfITQL5klE/DplmVoTkpMS0BvqX6LK9m2Kaba8zA16FPov3k5UP/i5zWg4TcfyXAfN/NhQCI6qcSWunBYXtVEGcBGpI1ANPYSjxKTbrjaAF/THaegbTxArVGsSjmewTyyIzZPyCTLK5v8KwvSRd2A++BxJOP940XiAS1m/n/2UIqlk4tuoJeANOWuGN514tykKRhqWrcI6qfgugV+/m8SuaSAHRLFLMuZDKCvLqwfByP6GPXUqTGINd8ns00BKiNj9WOalv7OqRu146JRYb88Crt7XCzi9Ue8dWFextoNMxlvqXxZURYKZz9ZT2KlwWB3dX58x0Qza7fqsNK4wkZ1yDToHcFwzfIgklvTjYwq3vHo3d8T0rgkJUSdm62Hmq0wS+jTKIUoz8+uCRYcKAOGqYyH1AEM1peHRAzxEQI0amkjWYM2wUoFenvC9rCbFnLGPtON6CAKvqZK8ZiOKL/FMEYLs7SnY0Dn8xpic22kQb1hJ8LmHfMPAiwe2PyVuDtyhZdru9AMcdFRDBkzjHOhFZYu+eFYiFhQWy0lg+tgSrQ7itAzzeWvgEzIH1aq4dT42rK+wg/N+PXvRXTls52MfHtXwG7w9U7OT1KyhJmR7hG1VJLQxwaBXc+zl/nVbolO3/fm7xceountyWVHwlVnnM8V2vJB4u3SYn4E8wGgPzDsP7DpHCPTX6Oa/mN7N0NjCKhX9l+5cNbezFslnQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(70206006)(82310400004)(66574015)(33656002)(6506007)(9686003)(81166007)(54906003)(2906002)(186003)(26005)(70586007)(83380400001)(316002)(47076005)(110136005)(8936002)(336012)(7696005)(86362001)(6636002)(5660300002)(52536014)(55016003)(40460700001)(508600001)(8676002)(36860700001)(4326008)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 12:39:43.3390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9067afdc-9482-41da-0dc0-08d9db48c4bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6239
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 12:39:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7024

Hello Bruce,

Thanks for getting this merged.

We consider these patches as bug fixing and in this case is it possible to =
have them backported (cherry picked) to honister branch?

Cheers,

--
Diego Sueiro

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield via
>lists.yoctoproject.org
>Sent: 19 January 2022 03:44
>To: Kamil Dzie=BFyk <Kamil.Dziezyk@arm.com>
>Cc: meta-virtualization@lists.yoctoproject.org;
>christopher.w.clark@gmail.com; cardoe@gentoo.org
>Subject: Re: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen rela=
ted
>kernel modules during system boot
>
>merged.
>
>Bruce
>
>In message: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen relat=
ed
>kernel modules during system boot on 13/01/2022 Kamil Dziezyk wrote:
>
>> This patch changes the location of xen.conf file, that contains list
>> of kernel modules to be loaded during system boot, to
>> "${nonarch_libdir}". This is done by removing '--with-systemd-modules-
>load=3D' flag from EXTRA_OECONF variable.
>>
>> Previous path based on "${systemd_unitdir}" was not considered by
>> default by systemd-modules-load.service.
>>
>> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
>> ---
>>  recipes-extended/xen/xen-tools.inc | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/recipes-extended/xen/xen-tools.inc
>> b/recipes-extended/xen/xen-tools.inc
>> index ca924f4..6e25046 100644
>> --- a/recipes-extended/xen/xen-tools.inc
>> +++ b/recipes-extended/xen/xen-tools.inc
>> @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D "\
>>      "
>>
>>  FILES:${PN}-xencommons +=3D "\
>> +    ${nonarch_libdir}/modules-load.d/xen.conf \
>>      ${sysconfdir}/default/xencommons \
>>      ${sysconfdir}/init.d/xencommons \
>>      ${sysconfdir}/xen/scripts/launch-xenstore \
>> -    ${systemd_unitdir}/modules-load.d/xen.conf \
>>      ${systemd_unitdir}/system/proc-xen.mount \
>>      ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
>>      ${systemd_unitdir}/system/xenconsoled.service \ @@ -744,7 +744,6
>> @@ SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.service"
>>
>>  EXTRA_OECONF +=3D " \
>>      --with-systemd=3D${systemd_unitdir}/system \
>> -    --with-systemd-modules-load=3D${systemd_unitdir}/modules-load.d \
>>      --with-initddir=3D${INIT_D_DIR} \
>>      --with-sysconfig-leaf-dir=3Ddefault \
>>      --with-system-qemu=3D${bindir}/qemu-system-i386 \
>> --
>> 2.17.1
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are
>confidential and may also be privileged. If you are not the intended recip=
ient,
>please notify the sender immediately and do not disclose the contents to a=
ny
>other person, use it for any purpose, or store or copy the information in =
any
>medium. Thank you.
>
>>
>>
>>
>


