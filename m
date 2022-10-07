Return-Path: <ksaye@saye.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40ACC433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 19:09:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.135])
 by mx.groups.io with SMTP id smtpd.web10.8414.1665169781970770510
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 12:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sayeorg.onmicrosoft.com
 header.s=selector2-sayeorg-onmicrosoft-com header.b=P9tfwFl0;
 spf=pass (domain: saye.org, ip: 40.107.94.135, mailfrom: ksaye@saye.org)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=VvAgzS4AgY7OpBo/4jE4xGWGZjjVBTJz6lduF0O0/Hy4NHNBdlBiaC9B6KtL1DmXaLS4JT0DpnY7vQ6GFA5BBcYEfaM3HluIP7EC8QocXp00JyKu8lMBurmVkbSTnID5LSxt1eTOM5U5AUeo6L80UkrjipzmYs09vBvZOQuvSqxWhciNKKuYAe9dFDLM+yCxXvxqxf0FD8Av/EVUPFov7+oKgAhJQBjrG/H8lI/pJa+I5jR+1d3oktyQKpB04p//LmlpSDM/yaUmYMIYdHxVCfwp1ludq7frLi7Km+9ICcd/YgO1Abvstz3ljksUX1krIG3BGeSROyJv1543MOqbAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeT2+iWeYrkSgwqK+eGaGQpUT2Frptv6JanOC46BP/c=;
 b=ODFgYO2HR72UetLCadh8HbLZeLP5tSsQnLhdEuCmRyDnACGBXNKUs+CTBbyHDf/sItyMJ6z1Gnq8qxxqLDRnPNyDvFAm+Rt/ge07LhU5V++ZOq1UQQdL7ekV6SaBJs2Z/zSimWhJlOhU794Oa5sdBJyzyvjYxw8I2Zl1XCkSJ1y3L35yL9NNxj9I8qDHR3Ism3lTLJcDxYo63tBIACaKg3HTz5JeyU2OjkTQma4/MvRmMjeRyQdJFDs06bGlSWNzxnLkqyN6FF4anP1x7LNGnn8ubo9z/ZFnLK643wsmq+SGazh3IlzUi7T7+pfRMC4mQadslUkd29MIr817PQQuXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=none; dmarc=none
 action=none header.from=saye.org; dkim=error (no key for signature); arc=fail
 (41)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sayeorg.onmicrosoft.com; s=selector2-sayeorg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeT2+iWeYrkSgwqK+eGaGQpUT2Frptv6JanOC46BP/c=;
 b=P9tfwFl0a/GgqkcRWBcuYdA8wX8mIC9HAa0yHQsF3NdQBY4EAggokjjcGP4CYa8uEonN9HqsOkwAqwiYEZU02vLWgbj5c6d7CUWPLus1F+ZLDqAJtVoEfu14FB2ZLmMipWXJ7NVwzqyJNGHHyTdgZZnNfdhRcW+HMnsyTi+smY8=
Received: from SN6PR03MB4127.namprd03.prod.outlook.com (2603:10b6:805:c0::25)
 by BY5PR03MB5220.namprd03.prod.outlook.com (2603:10b6:a03:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 19:09:39 +0000
Received: from SN6PR03MB4127.namprd03.prod.outlook.com
 ([fe80::f6ed:661d:fb14:afd7]) by SN6PR03MB4127.namprd03.prod.outlook.com
 ([fe80::f6ed:661d:fb14:afd7%4]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 19:09:39 +0000
From: Kevin Saye <ksaye@saye.org>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Breaking Change: Github disabled support for git://github.com
Thread-Topic: Breaking Change: Github disabled support for git://github.com
Thread-Index: Adjafwn1cPgevEyhSg62MpW2zevRSw==
Date: Fri, 7 Oct 2022 19:09:39 +0000
Message-ID: 
 <SN6PR03MB41278821A2E85FF22A8FECD7C55F9@SN6PR03MB4127.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB4127.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(376002)(39830400003)(136003)(451199015)(38100700002)(2906002)(166002)(122000001)(38070700005)(37630700001)(52536014)(41320700001)(83380400001)(86362001)(186003)(33656002)(966005)(26005)(9686003)(6506007)(478600001)(5660300002)(71200400001)(4744005)(786003)(316002)(55016003)(41300700001)(66476007)(8936002)(6916009)(66446008)(7696005)(76116006)(66556008)(64756008)(66946007)(8676002);DIR:OUT;SFP:1102;
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sayeorg.onmicrosoft.com; s=selector2-sayeorg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XMv4UuZDyX3ZQQxAz+Cqw7xXP3H0OMSHlVDI4bydVc=;
 b=nqGIo/jYukmlzsXtq8sbOWB9rOCxEy2faZ1qq9+sbnbKTrMA3QXXfzyEYaKc0aWanAUAJPVW/9WM1uTGgj4H9NBefGNBMZmAdBcxFGUeMxuwFm3ZKGdsucGzyK8vXa0qhEH3l0AxLETKYiVApqau0Ve2QJb1mU3T6a+HB7r21uQ=
x-ms-publictraffictype: Email
msip_labels: 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=3799bfd8-c8aa-4a06-9bf4-b78a31a464ae;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-07T18:59:44Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=saye.org;
x-ms-traffictypediagnostic: 
 SN6PR03MB4127:EE_|BY5PR03MB5220:EE_|SN6PR03MB4127:EE_|BY5PR03MB5220:EE_
x-ms-exchange-crosstenant-originalarrivaltime: 07 Oct 2022 19:04:59.8163 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: e07ddb96-c37e-46dc-a3be-d6fb8d768523
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR03MB5220
x-ms-exchange-crosstenant-network-message-id: 
 05a4b4ed-253c-4a27-b5f4-08daa896d502
x-ms-office365-filtering-correlation-id: 312047d9-ecad-44a2-3b05-08daa8977bcc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZlYJeAPhTuO5jtvj76gSx3uecqSTg03gfIzzXbdlqNhdq9UC6PG0pT8bq/BH81jphQXUbQ1g7mNqQFjkTpLYORkYufZYiCfpynBrjK6EcwQqdAmOFYVAwR1y8nIWs28sNlMazQNzPY2cmtbHTdUSF8mnLUUGNHFRYS7gCOxMqmBkh2b3CachaJeikBiBDdwc7GAGN6PpEVNy7UuzVijIxk60jMIwekgszzMMbB4vcQL0sP61wYJGhlATEENN3nQFLGbiwf0T9NMUzjIW+cEFLhqNi8WieJD8CJi4Ma2FIjNgr38AnwUqYbV59+SPpi6v4RxbuJigQv5gd8Ns/mzxTwibZZildCXoUfSGcYsGP0GugCWyVam8dsffKzBGSygCTvtWJRVIcPScTa2UqlZf9ZHBihW2Ml6VjU2isE8I9Iyw0QdI34YRBN1X1fbybTR4WV6ErcqxtJMMYqIN9nCcV9AUACJcqsmhQ6XS6vYY2xkEUImfIc94TWAMYqN8SrqN8PcMUuhKCIehPQdaYZoZ9/DOpdI2C+DaoHa4X6AAU7tlyWMtbwwZHfrZd6hl+MnbDEh4xL55sVBhQYz+MPvXjF1I9w8zWL7SFAWvoP0tsj8sJdfXM0OPxNIOpYRELRTKIZzi86nkSNjFWap++ObI2etc+QqvZJnK2m2yCucNG2QhL8b48iXVyTx6jarmjVBCkBMPnFAH0d8YxGPO63FPJFIBaIASRZKQL7QjFDWM55k47Mjs/VhQDPK/VEUM81ckSFlJLPRuWtEHW5o8sQ5Hni4C2dWZniNxtMKDcbAKnDw=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN6PR03MB4127.namprd03.prod.outlook.com
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 
 QFrTmHQ+PQE3abYLzCX0jOb6IiKfOC64Gr7nUZcGKjY7rYr8Uj/byY37alPxxMi1
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng1ow2ZiITcI7oPgU0rDB145KiX+xtl3R/d4I/pvBS9FXXIBDO7NNvStMTTg0GewfYCiERKH2hf1f6xGRsFyab1JtfXaJJjBWJXpB4pDS4UJ7NSy04Jh/VQSNMNTx89HN0oHlXniQaBS/J0GD+Xl10GyluNHL4Pvb9/RNytve/oPznTPjn3hyrFf151fFJgGzn1AMmxqA6ppk3eOJoOgBL0A/GXW1RqyZQ8LSWLLgJXknU99fHoqnEk6VzgIRzCxrNh59E9wTcFQSJPrSIBPAcALj5Q41tFMxNMXtHhMpkwM5U1IHba4q5ukFLeaWtZqJA7PlEPRtN5yLoW5BFDJGg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XMv4UuZDyX3ZQQxAz+Cqw7xXP3H0OMSHlVDI4bydVc=;
 b=KJKI2BtqdT+QCHvuAWReH/ZBh914nhGFQfY2frpfppDbFJ/1C2Lyhpr9L1bUJ1Qkbic9ODjKIe4AkehKoZDrBVN9sBYu4w85mBQlSS1rgHe5mzm9KllnDv1gq+FVuGWSDTpEPj22pT/orSVrqzfT7ZAByHJqekyEMXdWTSUwn10AL3RQFtMguLZHLCiq5GSWVAomXFWcGocPfsZMfLGdhICURcLIEtoA8EGaqHvfHngjnUkLOixnFlhLr1HAKS9DIear+bbnxCTpHrhGYIgf57PfN2DPHg05Gi416Cp17a3BTTnszmlx3E+LEj9Ob9NzTXwUL15ui4hL7GWAMDUqbA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=saye.org; dmarc=pass action=none header.from=saye.org;
 dkim=pass header.d=saye.org; arc=none
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6Bt0/YZuE64xxZRpQOkNAJGU2zGbhPcBFWNaPiSK1yuiyOfpEfWz4bIIfywS?=
 =?us-ascii?Q?/ET50YKRValbSiDuic6722nCqVUIxe8W6e4675iepV6ICbEn5m9wz1GR+Kg1?=
 =?us-ascii?Q?GWcjkB6bjw8VwmSxO706M6vxPPYMGZSs2vkCRWezDD+nAX9tBF5QVSKXbepM?=
 =?us-ascii?Q?KpjDQPbiwpjouvSTr10vUX0ZkXH1jomHAO1saz5dMnFYtoK/pukTZYbQTyc/?=
 =?us-ascii?Q?d4PYUlREjcmgut+LUha++UGR3n51CfIxEUhr5CLiYcWSXQbQg1WX/s+noW9j?=
 =?us-ascii?Q?rGeL8dq9QyQH3LWVwBa6Sp9kia5NhCvxY+8Kjd7OXpYvPiSrwg1ygs4JL7YV?=
 =?us-ascii?Q?TPRbacNPEOu/27CPjxmJyiMuUr0+FUv6SBIINX8MI50+P2+vlFxPkjMGFpbP?=
 =?us-ascii?Q?PwY+rBv885rB4U8a01MAGG49c9XpxoyIVOuOBhv1sr1eQTY3QaAOoRzkHkM8?=
 =?us-ascii?Q?KF4R9oJN+2mcbXzvYYMHpC3dVxQqDFH0a7XfO4Z5Rin2MzplGnu7DydbFLdO?=
 =?us-ascii?Q?P0kVZUAdzVDIZIT5lUOOv8qNEPiRHEysSf+UA4I/sciqTkez/yaH9Jqy05iJ?=
 =?us-ascii?Q?JHZjNu9D9nXOwpAG1I4b4bU9Qq2Yzw6M0JdOlWaKE4epLXtZC5bW83Xt3TQm?=
 =?us-ascii?Q?ulKWVvEBEr+qOxAugU3ory4Y3fLjGtD8nRZ5F9fjzJ0KR48hFuELZCxD8dDX?=
 =?us-ascii?Q?/C4mV/34c44R1QnCAVfrJ+QyUtGi6chXAWIcYYRwNiZXHs1o+H1LGZINX6VG?=
 =?us-ascii?Q?vKArKd50FmvwNcmT8rgrd6DvtcNUJQ2kU2smsbYHjmWLfIANrv3IftUwBdin?=
 =?us-ascii?Q?r1rYTwbgUgaKNrYhPn2rH1ne+BogiLFJDsk1D9Ftax/6nhKyk6dJVE+7dv/Y?=
 =?us-ascii?Q?dtk59HWks7LGxorUC1SaMXx0oz3xNW5SO0MhUhykiQJ9dFqFWrAF87emurmm?=
 =?us-ascii?Q?vEDRFDqa4U7Z7OPtre5uQN9XvlqNADRxomM3DvmTeMa/MNbWKbsmPtipQelA?=
 =?us-ascii?Q?PPn/7rhLPH06DvVhzwAiGpMuYD11P7Tu8WE3qxyKc0B2xnVb0/4Ocbf4F6fN?=
 =?us-ascii?Q?cMv9S7bRf7vS9Fw3rX2euPsutLygtpEPsues7PfVwC/dyFRX+rHfk781BXpq?=
 =?us-ascii?Q?SxW99/4aL5CQSYpFMDjQPVwkrN+3trhCa2iR/UU8jKxCKHsNwaTJw85+qQGt?=
 =?us-ascii?Q?P+81wwwE58LHRedueKhOHKa/j1RAHRMYGwV1M+6XQDop+daz4bPDcz6wS0/y?=
 =?us-ascii?Q?/ieAwfHnf0G2NlKyq0jP9rDcaReRWkhju140BUjJ69heMb5tPH7WGzEuLj9i?=
 =?us-ascii?Q?ORlPinExmlbcBuQnwzOAKBzr59R3S2E7tg/dZp4pPez6f33tUwEXErVMEwLP?=
 =?us-ascii?Q?jI3+BS7WjAo2dld0I2vFvQNWc9XcTNRQ6BhVGvBBAowc/JkddUgBJ2hoRuhD?=
 =?us-ascii?Q?es3AxFuJ+NZwNXtrsQ9lmHUeAR6ZYXYYvyvhzFU2LEd+OO3ktSbkoZnFPRz2?=
 =?us-ascii?Q?7uEoQanJDF8tJJamVNvXeO5wBDuhgJjmeqiI0vM3FuEjuKWInwARbWnKoeMI?=
 =?us-ascii?Q?u1iSuQaQPeq+jvSr4ls=3D?=
x-ms-office365-filtering-correlation-id-prvs: 
 05a4b4ed-253c-4a27-b5f4-08daa896d502
x-ms-exchange-antispam-relay: 0
Content-Type: multipart/alternative;
	boundary="_000_SN6PR03MB41278821A2E85FF22A8FECD7C55F9SN6PR03MB4127namp_"
MIME-Version: 1.0
X-OriginatorOrg: saye.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB4127.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 312047d9-ecad-44a2-3b05-08daa8977bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 19:09:39.6544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e07ddb96-c37e-46dc-a3be-d6fb8d768523
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 T2NR/YQ0IviX6h0Fhp0iVyv6fIqxz1FtJUVgJNvPACG95c3gxuoFurIULNLS4ONj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5220
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Oct 2022 19:09:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7647

--_000_SN6PR03MB41278821A2E85FF22A8FECD7C55F9SN6PR03MB4127namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As far as I know, GitHub disabled unencrypted request using the git://githu=
b.com on March 15 2022.  More info here: https://github.blog/2021-09-01-imp=
roving-git-protocol-security-github/#when-are-these-changes-effective

My recent build of Yocto, which needs the meta-virtualization seems to fail=
 because of this because recipes-devtools/go/go-systemd_git.bb has a hard d=
ependency on git://github.com

While I am using sumo (https://git.yoctoproject.org/meta-virtualization/tre=
e/recipes-devtools/go/go-systemd_git.bb?h=3Dsumo) but the latest seems to a=
lso have the issue: https://git.yoctoproject.org/meta-virtualization/tree/r=
ecipes-devtools/go/go-systemd_git.bb?h=3Dlangdale.

Are there any suggestions on how to resolve this?

K

--_000_SN6PR03MB41278821A2E85FF22A8FECD7C55F9SN6PR03MB4127namp_
Content-Type: text/html; charset="us-ascii"
Content-ID: <D395C4C1806ABC41B011D415461FEFAC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">As far as I know, GitHub disabled unencrypted reques=
t using the git://github.com on March 15 2022.&nbsp; More info here:
<a href=3D"https://github.blog/2021-09-01-improving-git-protocol-security-g=
ithub/#when-are-these-changes-effective">
https://github.blog/2021-09-01-improving-git-protocol-security-github/#when=
-are-these-changes-effective</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My recent build of Yocto, which needs the meta-virtu=
alization seems to fail because of this because recipes-devtools/go/go-syst=
emd_git.bb has a hard dependency on git://github.com<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While I am using sumo (<a href=3D"https://git.yoctop=
roject.org/meta-virtualization/tree/recipes-devtools/go/go-systemd_git.bb?h=
=3Dsumo">https://git.yoctoproject.org/meta-virtualization/tree/recipes-devt=
ools/go/go-systemd_git.bb?h=3Dsumo</a>)
 but the latest seems to also have the issue: <a href=3D"https://git.yoctop=
roject.org/meta-virtualization/tree/recipes-devtools/go/go-systemd_git.bb?h=
=3Dlangdale">
https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/go/g=
o-systemd_git.bb?h=3Dlangdale</a>.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Are there any suggestions on how to resolve this?<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">K<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR03MB41278821A2E85FF22A8FECD7C55F9SN6PR03MB4127namp_--

