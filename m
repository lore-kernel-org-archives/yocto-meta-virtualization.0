Return-Path: <pascal.bach@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BEFC00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 13:17:31 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.59])
 by mx.groups.io with SMTP id smtpd.web12.41571.1660828650281307550
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 06:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zsKgekOn;
 spf=pass (domain: siemens.com, ip: 40.107.5.59,
 mailfrom: pascal.bach@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehOe39BY4nQrEWqhb4SOtwU1NvWzdbe9Oe8pyAaz6Wc66rpLJQGGcWQ7UIodnBBlwsWV2ril58psqsCOCeE5ygJKytTvx3Tc+RS2Ws0A2v97GGJVk6xvfyRCE3289m5wccPnPjpZ1eRP6mPTlIzoDKLp5d7uWGjqoOR0N8+zK0kzoMe6xQYV3d56Ue3DAdnYiDXMpKtrn5FgYid6/QlyMOQo11ufSVlw0pazY8Y1IppoOz+Fg+7RP82/14148rN+1WwSopPanQ6q/z7RaSvekc7EVUEFvFfCFXthHR9SVq2YNjpV5gso8jQefMJA6nqz8UQcpOkNz89vPzqIpr9f9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R7HbqOA/5tHY1+dV/ZQTsQilPmp3XeeSnaerd6A2P8=;
 b=Ci85wPrhvn11CV68LxH1OjDG99yq20dIAKNK6fE0yPyZ2AvoqEwj3KcFu4FXOfyYu7EC3/py+nPAGegTyPN74G/ICOySzZUnTmz3ddaNhzoN40K+xS9f0CTyz939sXd3jBRZmUH6pItdm1ibUWvx8WcTbkhhLdio9wOGNZ00OvSRhjr1clxNHYHqSGQwrcfsZyr2I1Aw2zHfqRE8A+GHg6UOdxwVDA+wBD6OqkXIQ64TLs0UIhjOkfdehFeMShHrUvzR/HAw+Df0xwBWOIijMkqkiSCyQrfX8JrvJvE8nz++eDUDOj1AzJnnxMZJUvhpA4GQqTowOXVPRoU5ZsUcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R7HbqOA/5tHY1+dV/ZQTsQilPmp3XeeSnaerd6A2P8=;
 b=zsKgekOnbSQ3yLdjGhS4Are9ef0HSA+OsUydd4DNFmWMwvi/rfyIBXpOqSnTINUiRPbOPaasGKPcTB96RkZCT/tTg9Iu+c7krx1qmEIoMO7MJ7B2aTK1BH0rVBPlmHevg0320RhXOASoKSjwKz4Ejhpw7Mgv1wz4+DHPw9KBoJ6mX0pYBpi1BgCRHaDEYPr+Lj5RpTCHQ3oUA5ToZVI0yoXmch8VKfFKdyARGRtl+uUquMHj7/DSucDKhxHJr99W4qZOTZ2oqr+J6hZkpOxXkKIAqS4jP9gUgMWg9aC/gLJsFWxdlIJe3lsT0AN3n/JIG5vcenZfLKlERLFlW3SK7A==
Received: from DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:340::11)
 by AM6PR10MB3015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:ee::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:17:26 +0000
Received: from DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5d66:d07d:3d24:53ab]) by DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5d66:d07d:3d24:53ab%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:17:26 +0000
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH] netavark: init at 1.1.0
Thread-Topic: [meta-virtualization][PATCH] netavark: init at 1.1.0
Thread-Index: AQHYsubvALp1SQkWtkS3iFJ11NE3AK20m/YAgAADnPA=
Date: Thu, 18 Aug 2022 13:17:26 +0000
Message-ID: 
 <DU0PR10MB53618F27B7137D6F0F308791F56D9@DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM>
References: <20220818094304.1773112-1-pascal.bach@siemens.com>
 <CADkTA4OGNgpUpfaLhk8-AdOXtzGoHt6dSqJQrZfeR0nO_4H-Cw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OGNgpUpfaLhk8-AdOXtzGoHt6dSqJQrZfeR0nO_4H-Cw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-08-18T13:17:24Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7af6ce5b-8a80-4977-847a-6e5ee103de1f;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30185b21-649a-4402-d7ce-08da811bfed9
x-ms-traffictypediagnostic: AM6PR10MB3015:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1WmvV2LfYadQdYeaR1fcA4XZfDra6/t2SLVI9oOektrl+ac5Nx2XGQovCRuWBXb8yqvQ0v8EI4jlT2XwVJBIKZiV/9MZdPmYGbQJC3U6Dft4I9TYOn9RoZdJDhvc5czht4PBCn18eQK7QnQipMPt9WEM/dcfDz/iiXp9JtnNAFoJ/SE5q4hKEuK9zWA8vT6Ajm6/2JYNK52J+XPZwo1xX4FCiP+o8yufOiQhBEG3ip74rgIhaL3pJghejBllM6QELq5UUZ/wDbEYa68hamIYH3DJsoQYgKvi1jB/k6Mi4xxGR1cl0+oEg/X3KyQp7UAA+53nYHar2FBfBfYItFIoF0udxgt+FlMj4U/OkMWl5tsPQOTnUo22JHgDwZ7XDlvpTgkNH4afXpPxbayB+xd+Z8OwaLq5oPA3LyPwX4O+cL30x9GR4z+cEIJ8wjKTHwFhxSiSzDxQfZmXwFLkpPaxRh8Rt5xOMLrKl2zRpxUpzFr1q0yL0opWWf0KZ2dl+BFbrzhadmRMRO3v90MXgFOFKSNuDWr7w1gHx4Z8lR0Ah2a64v4aCeRHwz2wUKF+x+7JvDRjnWvK+xSx4sOYae3z9f7y/PvVCb7c0WMv9/1IfF+k5D/nfz7JVxsSoKZwy9xB0+N8Dh1TuYVZMJsfeCfOPYWrKKRdpOhn+mFVz9bbfybK0EuasE16gebsNu+Qt7wC7pgxQwQitZmWq2ZbfGpZrzjnJpN11OYAEbNBvD9ohrKXmn0ChJdylAsVQrkzRCcXmUJZ2dKPQM0gvjSuI6Z9d+ktQPU5hR9ekny4p2fqIlk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(316002)(186003)(966005)(478600001)(83380400001)(33656002)(76116006)(9686003)(2906002)(55016003)(122000001)(4326008)(82960400001)(66946007)(66556008)(66476007)(64756008)(4744005)(86362001)(52536014)(71200400001)(8936002)(66446008)(38100700002)(6506007)(6916009)(38070700005)(26005)(5660300002)(7696005)(41300700001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/YBYTRaxtbvp/ODZgisMi91wWRk5LlD3YZi+a2DCyopTuonCs4vpv4sZHe44?=
 =?us-ascii?Q?ZxCpLzzzpxt+TodenXyGf7srf+ad4kPtGjj7FhHTuK5yHpRwgBz1E3d+Ju/Q?=
 =?us-ascii?Q?rB7Iih+c8lysU98KlDqalOxCUrqlo5KnPSEXE/KKvnU9B3VXK6KuKKy5Xc2n?=
 =?us-ascii?Q?Jm3GtCMjrbSpI7JVUJpJnlb0hAT7LpEbiHya+s/76IMPDlgBIASfs/6CIDqF?=
 =?us-ascii?Q?LkkmNgumV/HLYD4J0ipQo35AwaVmINuQYuOEAFpjx0BezhePOIL8eQGdVZI3?=
 =?us-ascii?Q?Al8Afi08X4q0d38beuw17PeLeLc4xMnDkjNXtBpGSMKPEWaKj6NBLAUx7cv2?=
 =?us-ascii?Q?CHn/rN7kt691XK5uyTdzLpK3DR2mL2sNxgAcDjW+HX2nDJqWCSfepXkVGIWj?=
 =?us-ascii?Q?6h4j0wbjf0RJ6haERaTZsLKan2nDzpsW7R4STepa2cQZba5HP1mXu+coP9X8?=
 =?us-ascii?Q?XrlMHhsSbKyytW57t3H/xZwVwEQAxNEU+D/g/dCbU6imlMj66YjZfOI/ur5w?=
 =?us-ascii?Q?yWbTSj2WZVFspm1gne82fTHyvFXQaK2frpdrX3ZTZBsF/0PKe2ulRWNpYrwl?=
 =?us-ascii?Q?GaC8J/ZiHytkEer1kRJuOL1gU7MLIedKOEIo5RGDNwuUCdFVWHnZd4rQF6mB?=
 =?us-ascii?Q?9udZ3X2EhjrXtUt8IuNBTkifezdVpM1C2ApJVlcTWjAg+Wei5ZJ7WZJltTle?=
 =?us-ascii?Q?x37LsHfPkLIE2NkD2BNbbfnRJMMwpkWRCPBebmCbYlwQ6st1HySuFaRSgnDz?=
 =?us-ascii?Q?BBsrEzeUfmqtABuz74F1s9jUXm2M/v7VRxGqdkrUPq7rpLXAXMo5T3Az5/oy?=
 =?us-ascii?Q?y1SU+t2WPQg3IsYtBrkU7EfgRyHKoVFgci9D9oyquIXQOrvJ3L+4CG5l4W2B?=
 =?us-ascii?Q?9E3WUgx2HT1znQ5wqSmIIXxCi5E79ldmTnjXYz4nBwrNY0OQEiY2Y9Tv8qss?=
 =?us-ascii?Q?CVXlol8aqhNnO7xlBVWpZhN9ObXfACv0oJHpWmuwSfl1wAdwkN6DCeq6zG+X?=
 =?us-ascii?Q?3bLYLr78mz98aC/zRbDZNq86FgySTEnPnK2RsjbOQQyIP8C/Yp519ZpVtT8K?=
 =?us-ascii?Q?/tiZDho2PVw9QH36iehvH5zi86+Vx3LWA9GqmRT09hKNEiXAX4n7WS804EtG?=
 =?us-ascii?Q?N2AIgVzmcOUVyFbghrMK8YjG62L2xUWYqj1lQdl+uF7QK0NKSlxaCyWVSfo2?=
 =?us-ascii?Q?pJu/CBQWIhW4O5IzbmzcTIWE0qEnOZFkUQFnNO6DC+N8UMcfJ2fsHMooPUbm?=
 =?us-ascii?Q?gljNw3XhFL1tVsk32IMEKc/cIHrT+iRJCzMPNPLO/eOuR3JYhxeLSytkARFk?=
 =?us-ascii?Q?RGgGma6xCVdTXxwhza8L/WDa5dLS+DrwiA1WmbgKxDXY8YZQWcdgxHzRSYFG?=
 =?us-ascii?Q?6SJvvI6lzRwjAayFQzCGq9pwP79jqnVPtzYlQ2kp19+vVl17BimM0ux30H9b?=
 =?us-ascii?Q?pvaSkCHEryfquMZzMggdKZvrqL2LYCVMXZCJfAqflJyyIwVEENdgkJL2H4rf?=
 =?us-ascii?Q?skRD5pJa0o5CICkxl0M5iljO9x6FeK9/VaazCc8J5yTTidv4VClMXRXYDP/Y?=
 =?us-ascii?Q?/CO34nNxPcwbDOLLnQl4dt95CQ64GQ4M0f4ZCMcg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30185b21-649a-4402-d7ce-08da811bfed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 13:17:26.5655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bfLMY6Ck1aexbOUmob0tkAWbU8cIORKkS9iiGwwCnGeXjNV5DMRw0d2esvw/GBKh+JB07ClY/CrM6aXguQqhEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Aug 2022 13:17:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7543

> >
> > Netavark is replaces cni for podman.
> >
>=20
> s/is replaces/is a replacement/
>=20
> Since this can replace CNI, can they co-exist at the same time ? We shoul=
d
> mention that in the commit message. If they both can't be active on the
> target at the same time, then we should have a RCONFLICTS in the recipe t=
o
> make sure they aren't both installed.
>=20

Both can be installed in parallel. And from what I have seen if both are in=
stalled
podman seems to prefer netavark.
The backend can be mahually selected in the podman config
 https://github.com/containers/common/blob/main/docs/containers.conf.5.md#n=
etwork-table=20
but only one can be used at a time.

Pascal

