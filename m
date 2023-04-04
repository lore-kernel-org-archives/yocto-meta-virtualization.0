Return-Path: <adrian.dudau@keyfactor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7143AC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 07:36:40 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.129])
 by mx.groups.io with SMTP id smtpd.web11.95687.1680593789866766142
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 00:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keyfactorinc.onmicrosoft.com header.s=selector1-keyfactorinc-onmicrosoft-com header.b=xdTESMTW;
 spf=pass (domain: keyfactor.com, ip: 40.107.15.129, mailfrom: adrian.dudau@keyfactor.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFmJU1FZA4LKwcuVv269ePwWA2Gsrr284jZDOuEZwZl8MIiz3dK90RYK0Cs0LwIQGkmQ7nR681Mm0PelLhmzH2KVfsAZRXN4TKXj1QrEXbsuItCstLJxtTLciMyv26lYtefH3Bb1yqCw87ZDhr6rgkW4uYF/LOcIiFx+1TOm4hbOX98LIkSK2gZYCo4ZAkA1NDf0QmOksTQlIe8d8UKCg7H83HMRcdEjGVJTd1M7JagRthvMqgsrXL58jTfmT4DEqjKdJeYLNM8WEDEWbwVydSVghDfDgMSLMyjOF0dip9zN/nx5urI/ZxllMTgh0814pVTfis0n+6XNgupXI/farg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EF8crfLe6s5b/9t3z+milDz/KDYKQFNfNunw2F3xfpE=;
 b=boaE0vSgn+DNVV8qIEFCudxWB6F8RLssYW7RF47dp6v/mmdu8zg3KdkREm2eZrbFuXJ5mmbYNZ9XFhUncTQnyLdkKnzgHs60u78c4wDMutT/XUj5IP6k9qI0Aqrvb3HpjePiqt0mbleg+zjP/jnWOtqRI1dtnRRGZt+++KNCRYZ3yI+1UNyw26xqktrCtvFdE1vA3sX1XW3/+TBP0pdCvrXN0qA1KH0DYupSonfoK2myryYKlZXIVqZ1uGQ354hyagf5dJa085YnimpPYv0jqw8ponIMuWQQ/7A7GyftI/jQ1eIVY3kqxaabqdhWn3a5mAntHkCOaKILQJIj9qWITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keyfactor.com; dmarc=pass action=none
 header.from=keyfactor.com; dkim=pass header.d=keyfactor.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KeyfactorInc.onmicrosoft.com; s=selector1-KeyfactorInc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF8crfLe6s5b/9t3z+milDz/KDYKQFNfNunw2F3xfpE=;
 b=xdTESMTWl1tWbpIVl6dGW1kps9s96LPM4KbG1YGHTX2bkJVIV6NMpGSn1r+I9IMzoEgfoW9xQC/eDlpmFzxz1o7A9MamCl9/NqofnSm1TKb5u8LHubck7THLtSjD/l5fyqZtRscQTHGi0MBAhpx7D6cfoAy+yd250HOFKl9KoEd/hk+CNXrfsQCEBBTetd65IlMAIZSRc7o1QmhOA0FeuyjOr4AQ+xg2FEChqh+1w7Xk/3QWfbEPlC81Qi/j4J6AK2wz4jCuEJ62Xd6MrRZsa58oB0RRfmJnThOgunlgPKbvoWKxl7+n/CMBsi1WkIyYqB3IMJ/TxNXUgPABd1YENA==
Received: from DB6PR03MB2901.eurprd03.prod.outlook.com (2603:10a6:6:33::29) by
 PAXPR03MB7729.eurprd03.prod.outlook.com (2603:10a6:102:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 07:36:26 +0000
Received: from DB6PR03MB2901.eurprd03.prod.outlook.com
 ([fe80::3da9:b3df:a6fa:5d2b]) by DB6PR03MB2901.eurprd03.prod.outlook.com
 ([fe80::3da9:b3df:a6fa:5d2b%5]) with mapi id 15.20.6254.029; Tue, 4 Apr 2023
 07:36:26 +0000
From: Adrian Dudau <Adrian.Dudau@keyfactor.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Deploying container images directly into the target rootfs at build
 time
Thread-Topic: Deploying container images directly into the target rootfs at
 build time
Thread-Index: AQHZZsbb356I5zK8uE2EUe7q1I4nJQ==
Date: Tue, 4 Apr 2023 07:36:26 +0000
Message-ID: 
 <DB6PR03MB2901D4439A5131E632CC350791939@DB6PR03MB2901.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=keyfactor.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR03MB2901:EE_|PAXPR03MB7729:EE_
x-ms-office365-filtering-correlation-id: 88884e61-6891-42ce-d747-08db34df4c4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KOSLhcIdnW+7CDz8eOIsZ+YYXxeYXSJqoRgKXrvQdBcGh8pD0tXudrmljHytKHjy0e4r/irZJ6hHWTP4QfqKdYvA1hJHoPFa/9bkEXkOTcZ0gT0zISebVK8cnQCr+oFgyXadT9O5AReYyvf8ECxcyjUUfoAcctlKVNtlaW6OlUH77KBxH+WVz9AsQn65D8z4iWq7ceO32i2qSPpDtRYyIQI4VpYtUzrYHPTaYHtJbIC19LQATA143OOpORPO958h8ECkpEpVb9FE+/yOIy//OkJw+CqEZC1L9+9Q3YUu9aWaao0iPCsXK8QyMSoMxXmK3f92pZ7+Vge1QhfnDyKm72rAWbP9Pg5sGCuW7p75g4jsv8J0vlCpa2zMJYl+A4qXVdABWL/roj8MuFQ+Ao3rwsNFUzZU1hOnQvo4ifyvvqYlPJJ/eYmMWQyydYrNfo/NJxWqLikkrHZwJ6FwsG/L2HsCYRwfcw1Kv+00PSo7S6IhbUowzRY2af6VIKucds9JYqM5XfheWPEsDmw8KxTFAhYnPzHDKf1+/wmHBzSTEHs+OWj0tYXLWQ+GLFL7AGdPFhpdGpY9jH1O4q9dxXRHZb4vB23MmrU8bnl82dW23EhZnzk5EQmxFC/jv5ntekwpaizW6ewBBXEEyPelvyp/GA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB2901.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(451199021)(86362001)(38070700005)(2906002)(33656002)(19627405001)(55016003)(71200400001)(7696005)(186003)(83380400001)(9686003)(6506007)(45080400002)(166002)(6916009)(99936003)(91956017)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(478600001)(41300700001)(122000001)(5660300002)(38100700002)(316002)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TfSUD4xYGqfI41+xocygUKRlisS5l6oZk318fWO5/ULPB2yHO7k0/camD9?=
 =?iso-8859-1?Q?MQ5znduhq4RSQGn80opfL6+5vAS1fITk7vQTB47UaPkzC1FuaCFJN4K415?=
 =?iso-8859-1?Q?UI0PlVDLnRU8KczMYctBwYB+/t8/cJYPxI6wqHZInC70rVnsG2oPT/4w1j?=
 =?iso-8859-1?Q?3IAtGv3ZlTBD4nGrlt6RDfSBglENV0MqIiIIdTAJzV9wCsLBa45lZj0kJh?=
 =?iso-8859-1?Q?VOQulyh/JhgqHRiXVhy5vTIUqaqJ4Iz9NAaCD9rS9LjvF0Q+dWlAA4gC4T?=
 =?iso-8859-1?Q?psB7N6sx4tBmBxatau5wtrH2WX/cGrt+GnITiC3jbicdtBHP9cBTR7KRhq?=
 =?iso-8859-1?Q?pYTqeJmSauhtOHhlxeIbysOYszxyIrzCKfKbD9OIxbEZ/w0tzzni3X2aX7?=
 =?iso-8859-1?Q?T0tYL8PwspC7lU3a4b+2elA7HTGjeqi5CnDDU+DM3t8+KT3HIdECp724Tm?=
 =?iso-8859-1?Q?u6QFRfPKgy6bf8geLOONE0703IkrvcmIeHYmkCWHlFD25TO3ZrJzwG1kP8?=
 =?iso-8859-1?Q?SmokR2Q6t1jNEmkh9HPW19csyxZJCvlB7876U/b76lhopUOXcZqGVudwg5?=
 =?iso-8859-1?Q?OjCbqZjbFJ4jYTTnwm+BQ4sHtFaluMQvnsSKMcRjbqT+/ULHEwU2rYka7N?=
 =?iso-8859-1?Q?pvDg979bclFjBEl3QQeDSIkVHg9YTH/2wus1cH2vna2zoTPQixlkdHiVX7?=
 =?iso-8859-1?Q?PtVsupUkq7ciZ/79zT6xctHo4wJYM91ltKRIIC+iVByI5D8zi/Syo1W7T6?=
 =?iso-8859-1?Q?4DWsAXKCB/E7hIL8dtXKXPEIHR2GQWT87Gp9cHcwK4+l/0l3FaJAxK3LzE?=
 =?iso-8859-1?Q?ll0BRcTROmCaEpFJlkovRtAtaPPIKegErFhiz6rMjWaW2O8CAB9/vRIoDk?=
 =?iso-8859-1?Q?vuclTL9eQBwHPZ80TW9azkk2WalNIg0W/jQTDbuKVGLVZpECFepGg6WtAp?=
 =?iso-8859-1?Q?pN5rFIPErK2ijHwzR59Mv54/abcyUIrAr5Nmei/DlWskrwWhzs9/ZbqSLE?=
 =?iso-8859-1?Q?qlyS2EV7Ym8lh4nlsgQqo82k9Uwiqd0bCXS6bg2DKBOo5sRqtLnsw9KPgY?=
 =?iso-8859-1?Q?mckuUSURa4t9WYYBtAQZd008evJcZdkPUVq5LXHMBR5+xaDU03RwXtVSZS?=
 =?iso-8859-1?Q?Ho+ogz/wUn5A654r3VBtGLgcnq3TSBGW4HR80vTJbeSvu82YD+mLnwLEGg?=
 =?iso-8859-1?Q?gEc+ibGNSZFeKnESejIn4p1syYHTfsHaKU+EOGYpi42deCqWpZMFGL1YnU?=
 =?iso-8859-1?Q?/z6ScqMEFXcUbwY3puTbC/KjpN0X5KgX22bopx5mneb32ZOhuniFMetUb+?=
 =?iso-8859-1?Q?Qjt8SgE6D3iFHCsI40+YPIurhcfo4N2WXbUpBwkE3XBUYOcKeau7K5pmOo?=
 =?iso-8859-1?Q?4vO6dVGvW6Uq63blaz7eIK09Rozz+3vwm2HPc5ABmWrL4zBSnr6F8byqD/?=
 =?iso-8859-1?Q?Ccoik/sBhkoC3M0rxm/TZ83zL1MaOCcgWHmJIHeRRd2C2iRX7y28ET7dIS?=
 =?iso-8859-1?Q?QfUClQTO87ld/n/WucOrsurdLTjZIfAVEZvSqQ7mgUK/RY6oInsgvWAulR?=
 =?iso-8859-1?Q?416NU8M/eXNmWlI1pLS1IwludZQanXZbeRmdhgvbAKCO+4ctb1iJ74DWtz?=
 =?iso-8859-1?Q?GhzKJJAmtgjezyd6dsy6ewpRCkBxpAuUUXbNGecX0DTsV9Lo/cXAONekXA?=
 =?iso-8859-1?Q?oJP+CLUjV4e3NrWkJQ/bknWr3l50WIfj4szWl8Bs?=
Content-Type: multipart/related;
	boundary="_005_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: keyfactor.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB2901.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88884e61-6891-42ce-d747-08db34df4c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 07:36:26.5290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c9ed4b45-9f70-418a-aa58-f04c80848ca9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoKW2dMMxGcmDOpzMDC15jCSPA6+nmN7x0TDcxUZhL3XHrExbKWArKTunWz+P+zf47ADl3RQnQPrcQNAIdFRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7729
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Apr 2023 07:36:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7980

--_005_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_
Content-Type: multipart/alternative;
	boundary="_000_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_"

--_000_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

We have a situation where we have a number of pre-built containers in a rep=
ository that I would like to get into the target image at runtime. I want t=
o avoid having to pull them with Podman at runtime and am also trying to av=
oid having to rebuild them with Yocto.

My approach so far has been to try and do podman pull and build a local sto=
re at build time using bitbake and then have the whole store installed into=
 the rootfs. But I hit a bug with with using sudo in bitbake and Bruce sugg=
ested that this might not even be the best approach, so I came here asking =
for other suggestions.

Best regards,
--Adrian




Adrian Dudau

Senior Software Engineer



M: +46 709 714 069

adrian.dudau@keyfactor.com<https://www.keyfactor.com/>


[cid:60a2ac62-d6f7-4c63-8ef5-d52528656477]

Seamless orchestration. Every key, every certificate.

Follow Keyfactor on LinkedIn

PrimeKey and Keyfactor merged<https://www.keyfactor.com/press-releases/keyf=
actor-and-primekey-merge-to-bring-machine-identity-management-to-the-mainst=
ream/> in June 2021. Moving forward, communication will come from Keyfactor=
. PrimeKey.com<https://www.primekey.com/> will be live throughout 2022.


CONFIDENTIALITY NOTICE

This communication may contain privileged or other confidential information=
. If you received this email in error, then please advise the sender by rep=
ly email and immediately delete the message and any attachments without cop=
ying or disclosing the contents. Thank you.

--_000_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
We have a situation where we have a number of pre-built containers in a rep=
ository that I would like to get into the target image at runtime. I want t=
o avoid having to pull them with Podman at runtime and am also trying&nbsp;=
to avoid having to rebuild them with
 Yocto.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
My approach so far has been to try and do podman pull and build a local sto=
re at build time using bitbake and then have the whole store installed into=
 the rootfs. But I hit a bug with with using sudo in bitbake and Bruce sugg=
ested that this might not even be
 the best approach, so I came here asking for other suggestions.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
--Adrian<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<p style=3D"margin-bottom: 0.06in; line-height: 100%; background: transpare=
nt; font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: no=
rmal; margin-top: 0.11in;" lang=3D"en-SE">
<a></a><font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt"=
 size=3D"3"><font style=3D"color: rgb(42, 25, 102);"><font face=3D"Arial, s=
erif"><font style=3D"font-size:10pt" size=3D"2"><span style=3D"letter-spaci=
ng:0.5pt"><b>Adrian Dudau</b></span></font></font></font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 100%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Arial, seri=
f"><font style=3D"font-size:10pt" size=3D"2">Senior Software Engineer</font=
></font></font></font></font></p>
<div style=3D"margin-bottom: 0px; line-height: 0.29in; background: transpar=
ent; font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: n=
ormal; margin-top: 13.3333px;" lang=3D"en-SE">
<img style=3D"width: 28px; height: 3px; max-width: initial;" width=3D"28" h=
eight=3D"3" data-outlook-trace=3D"F:1|T:1" src=3D"cid:956f7df9-bd54-4350-a2=
7e-4eb8516da0fe"></div>
<p style=3D"margin-bottom: 0in; line-height: 100%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(42, 25, 102);"><font face=3D"Arial, serif"=
><font style=3D"font-size:10pt" size=3D"2"><span style=3D"letter-spacing:0.=
3pt"><b>M:
</b></span></font></font></font><font style=3D"color: rgb(138, 138, 138);">=
<font face=3D"Arial, serif"><font style=3D"font-size:10pt" size=3D"2"><span=
 style=3D"letter-spacing:0.3pt"><b>+46 709 714 069</b></span></font></font>=
</font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 100%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<a></a><font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt"=
 size=3D"3"><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Arial,=
 serif"><font style=3D"font-size:10pt" size=3D"2">adrian.dudau</font></font=
></font><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Arial, ser=
if"><font style=3D"font-size:10pt" size=3D"2">@</font></font></font><font s=
tyle=3D"color: rgb(40, 185, 5);"><u><a href=3D"https://www.keyfactor.com/" =
data-loopstyle=3D"link"><font style=3D"color: rgb(42, 25, 102);"><font face=
=3D"Arial, serif"><font style=3D"font-size:10pt" size=3D"2">keyfactor.com</=
font></font></font></a></u></font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 100%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<br>
</p>
<div style=3D"margin-bottom: 0px; line-height: 100%; background: transparen=
t; font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: nor=
mal; margin-top: 4.8px;" lang=3D"en-SE">
<img style=3D"width: 165.69px; height: 31px; max-width: initial;" width=3D"=
165" height=3D"31" data-outlook-trace=3D"F:1|T:1" src=3D"cid:60a2ac62-d6f7-=
4c63-8ef5-d52528656477"><br>
</div>
<p style=3D"margin-bottom: 0.17in; line-height: 200%; background: transpare=
nt; font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: no=
rmal; margin-top: 0.08in;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(42, 25, 102);"><font face=3D"Arial, serif"=
><font style=3D"font-size:10pt" size=3D"2"><i>Seamless orchestration.
</i></font></font></font><font style=3D"color: rgb(42, 25, 102);"><font fac=
e=3D"Arial, serif"><font style=3D"font-size:10pt" size=3D"2"><i><b>Every ke=
y, every certificate.</b></i></font></font></font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 200%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Arial, seri=
f"><font style=3D"font-size:10pt" size=3D"2">Follow Keyfactor on
</font></font></font><font style=3D"color: rgb(40, 185, 5);"><u><font style=
=3D"color: rgb(42, 25, 102);"><font face=3D"Arial, serif"><font style=3D"fo=
nt-size:10pt" size=3D"2"><span lang=3D"en-US">LinkedIn</span></font></font>=
</font></u></font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 100%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(40, 185, 5);"><u><a href=3D"https://www.ke=
yfactor.com/press-releases/keyfactor-and-primekey-merge-to-bring-machine-id=
entity-management-to-the-mainstream/" data-loopstyle=3D"link"><font style=
=3D"color: rgb(42, 25, 102);"><font face=3D"Arial, serif"><font style=3D"fo=
nt-size:10pt" size=3D"2">PrimeKey
 and Keyfactor merged</font></font></font></a></u></font><font face=3D"Aria=
l, serif"><font style=3D"font-size:10pt" size=3D"2"></font></font><font sty=
le=3D"color: rgb(138, 138, 138);"><font face=3D"Arial, serif"><font style=
=3D"font-size:10pt" size=3D"2"> in June 2021. Moving
 forward, communication will come from Keyfactor. </font></font></font><fon=
t style=3D"color: rgb(40, 185, 5);"><u><a href=3D"https://www.primekey.com/=
" data-loopstyle=3D"link"><font style=3D"color: rgb(42, 25, 102);"><font fa=
ce=3D"Arial, serif"><font style=3D"font-size:10pt" size=3D"2">PrimeKey.com<=
/font></font></font></a></u></font><font style=3D"color: rgb(60, 60, 60);">=
<font face=3D"Arial, serif"><font style=3D"font-size:10pt" size=3D"2"></fon=
t></font></font><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Ar=
ial, serif"><font style=3D"font-size:10pt" size=3D"2">
 will be live throughout 2022.</font></font></font><font style=3D"color: rg=
b(60, 60, 60);"><font face=3D"Arial, serif"><font style=3D"font-size:10pt" =
size=3D"2">
</font></font></font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 100%; background: transparent;=
 font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: norma=
l; margin-top: 0.05in;" lang=3D"en-SE">
<br>
</p>
<p style=3D"margin-bottom: 0in; line-height: 0.19in; background: transparen=
t; font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: nor=
mal;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Arial, seri=
f"><font style=3D"font-size:10pt" size=3D"2"><span lang=3D"fr-FR">CONFIDENT=
IALITY NOTICE</span></font></font></font></font></font></p>
<p style=3D"margin-bottom: 0in; line-height: 0.19in; background: transparen=
t; font-family: &quot;Arial&quot;, serif; font-size: 10pt; font-weight: nor=
mal;" lang=3D"en-SE">
<font face=3D"Times New Roman, serif"><font style=3D"font-size:12pt" size=
=3D"3"><font style=3D"color: rgb(138, 138, 138);"><font face=3D"Arial, seri=
f"><font style=3D"font-size:10pt" size=3D"2"><span lang=3D"fr-FR">This comm=
unication may contain privileged or other confidential
 information. If you received this email in error, then please advise the s=
ender by reply email and immediately delete the message and any attachments=
 without copying or disclosing the contents. Thank you.</span></font></font=
></font></font></font></p>
</div>
</div>
</div>
</body>
</html>

--_000_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_--

--_005_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_
Content-Type: image/png; name="Outlook-l2wtk0n3.png"
Content-Description: Outlook-l2wtk0n3.png
Content-Disposition: inline; filename="Outlook-l2wtk0n3.png"; size=145;
	creation-date="Tue, 04 Apr 2023 07:36:26 GMT";
	modification-date="Tue, 04 Apr 2023 07:36:26 GMT"
Content-ID: <956f7df9-bd54-4350-a27e-4eb8516da0fe>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAEoAAAAJCAYAAACVHLqzAAAAWElEQVRIS2NkYGD4D8SjgEAIMIIC
Sq6bZTSg8ITAp93/GMABpbGTdTSg8ITA2yWjAUVUAhkNKKKCiYFhNKBGA4rIECBS2WiKIjWguPWZ
iNQyMpX9fvmfAQDvciQ25QMDBgAAAABJRU5ErkJggg==

--_005_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_
Content-Type: image/png; name="Outlook-srrhm43n.png"
Content-Description: Outlook-srrhm43n.png
Content-Disposition: inline; filename="Outlook-srrhm43n.png"; size=5292;
	creation-date="Tue, 04 Apr 2023 07:36:26 GMT";
	modification-date="Tue, 04 Apr 2023 07:36:26 GMT"
Content-ID: <60a2ac62-d6f7-4c63-8ef5-d52528656477>
Content-Transfer-Encoding: base64

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

--_005_DB6PR03MB2901D4439A5131E632CC350791939DB6PR03MB2901eurp_--

