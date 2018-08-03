Return-Path: <David.Antliff@Aviatnet.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E7A2E008E0; Thu,  2 Aug 2018 19:47:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.32.78 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 69030 seconds by postgrey-1.32 at yocto-www;
	Thu, 02 Aug 2018 19:47:33 PDT
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0078.outbound.protection.outlook.com [104.47.32.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 723DBE0073D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Aug 2018 19:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aviatus.onmicrosoft.com; s=selector1-aviatnet-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LLVyw1XOsAqkRkRiMXdYzHoRfeoEydVSD5kuwLmsuxw=;
	b=FEAbfoZdGHJviJtmLRK2eJlYISE+GynX022Y7BLoaVdyzaYOn++cF1Nipj0gIuO3as6vvsz7a0pClm3rejnVIF8ETlu5xR8gMZTTVfAHsk9hICcnAR1tdcAX7zu4UqPkiHJy6HE8svDLdVKgx0HL0A8Y3SrGR38Hh68sMzg917g=
Received: from CY1PR08CA0035.namprd08.prod.outlook.com
	(2a01:111:e400:5291::45) by SN2PR0801MB2208.namprd08.prod.outlook.com
	(2603:10b6:804:17::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.17;
	Fri, 3 Aug 2018 02:47:31 +0000
Received: from DM3NAM03FT026.eop-NAM03.prod.protection.outlook.com
	(2a01:111:f400:7e49::201) by CY1PR08CA0035.outlook.office365.com
	(2a01:111:e400:5291::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1017.15 via
	Frontend Transport; Fri, 3 Aug 2018 02:47:31 +0000
Authentication-Results: spf=pass (sender IP is 192.147.115.53)
	smtp.mailfrom=Aviatnet.com; yoctoproject.org;
	dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=bestguesspass action=none
	header.from=Aviatnet.com;
Received-SPF: Pass (protection.outlook.com: domain of Aviatnet.com designates
	192.147.115.53 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.147.115.53; helo=mail-send.aviatnet.com;
Received: from mail-send.aviatnet.com (192.147.115.53) by
	DM3NAM03FT026.mail.protection.outlook.com (10.152.82.185) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.1038.3 via Frontend Transport; Fri, 3 Aug 2018 02:47:30 +0000
From: David Antliff <David.Antliff@Aviatnet.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: EXTERNAL: Re: [meta-virtualization] Docker init script possibly
	uses wrong invocation?
Thread-Index: AQHUKhXo6Cn866I8f0uHfKAF2XgxhKStyD+A//+LEzs=
Date: Fri, 3 Aug 2018 02:47:29 +0000
Message-ID: <1533264448591.1148@Aviatnet.com>
References: <1533182670806.88977@Aviatnet.com>,
	<CADkTA4McPwViJsYLZVo4CHV5s2xYU_1PcG0oLGZcDqzmFeMR-A@mail.gmail.com>
In-Reply-To: <CADkTA4McPwViJsYLZVo4CHV5s2xYU_1PcG0oLGZcDqzmFeMR-A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.15.6.10]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.147.115.53; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(136003)(346002)(396003)(39850400004)(2980300002)(438002)(189003)(199004)(446003)(106002)(345774005)(4326008)(39060400002)(117636001)(86362001)(6246003)(246002)(50466002)(2906002)(6916009)(7596002)(336012)(23756003)(356003)(305945005)(25786009)(229853002)(7696005)(8676002)(6116002)(7636002)(106466001)(8746002)(478600001)(7736002)(26005)(53416004)(97876018)(6486002)(14444005)(316002)(2616005)(11346002)(126002)(76176011)(476003)(36736006)(956004)(5660300001)(3846002)(47776003)(102836004)(53546011)(8936002)(36756003)(186003)(486006)(118246002)(72206003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR0801MB2208;
	H:mail-send.aviatnet.com; FPR:; SPF:Pass; LANG:en;
	PTR:mail-send.aviatnet.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; DM3NAM03FT026;
	1:TmBKv9VcG9/hqMROOVSvvKGczmN/rBuEQZgYgEZHnHKM7Mcmm22kFeplUFGHKeYE2KXa5ix4qPqxdG9BLSkYwsVNh6nZthxVwksXkIsWP0yg/ltNPyhB9QT115a/AKuz
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e3fdac4-bb14-4bc9-786f-08d5f8eb7502
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060)(7193020);
	SRVR:SN2PR0801MB2208; 
X-Microsoft-Exchange-Diagnostics: 1; SN2PR0801MB2208;
	3:g1G4qaeUSMI0MdFBYFbQnYoJEGa2a9KoD7bRWXSqF/6LRWpbexYh4UY+x5SVxx0aEJJnthZ4VDzHLSnAEbKhw8V2n6zBpjFBQZkKFDQBnX0DDVQrpcRDtPxKaapob1ja/j10gF7HS3XGrek7T9VwvTcHrPc3M974apI86+8+TuDTgBrWbRFrzfwt6X0r/eIxbN4Vc9DHjCt4HpdCf5uwFVlI2eIoKESQkAOlkyA3g/ENwFoCL3NjkbhE5D0CICdqwAhVmu3gd8jv+XghpCvuJeCDWWFY94bOKf7+7+H5fUyvbKmYpNip2O6vxICkGDglFC1sPNsRkQ2uF6tC0Qh1OWFZnYB843RUZnK9PbrLGv8=;
	25:Y1dFouTTGhwXelFUJSkcoD0h9tw0UJ3oLwbtZw4IT21i1Bxt0058Yw+j8onysVBXTvjrLQoW6Vnn6JgXzP93sD3RCxnNre4spssREcdiHyI8ryaeoYuSt59+VStiPUrYHd37dm1axBEpbmlfH3bUERAlc6yMTvf+EkxlnVOuxEvoLgLs3nvyfzQOj0Xa1y0uOMQW02f/NxZ/LaoVLKVbnnG78aukpCkYxqJsadVzt2H3N9vkpim/Tk1PLqPeRUBDBZ7zW9jVV5XFNAiE+HLpCEq3Ix6xODIYXILGbKQJq8DwGhjMrkwJlZXRX4Rf0WE3E0uUtGl7yvfRjsdZIFvg/Q==
X-MS-TrafficTypeDiagnostic: SN2PR0801MB2208:
X-Microsoft-Exchange-Diagnostics: 1; SN2PR0801MB2208;
	31:G+s6s84j0Qb8mB1RHdbG5uT5WERilIuL9T+wPN3vyLnaybSvR3NeN7HY60S0D6cW/LF2ZNeeA8NUhpsfUeZ02pcDNUC1mgFRw6Hyu0IMu+SZ4tBmbpOEbupGyQ2wsbk2kAk/Lv1xRGrXFDBfARZxmsXVHHeCCTrR3V7MiLsLAneBVyBSNL5yTc5H8NWbuP0zhr+lnscvHiZo/Ks62/3MIKuVEnRFC7hwtPmm3OPn5QM=;
	20:WcKGL58wUZxWVb5PbfCByLdH/Zd/tb9hNh82X7ZHQYxFPiSWt2nk4dLGshpN5j13M1i7ZWfuRCVmXz0A6jPhFy+HU2kT87Z5Q6t/DtxjNtjEu/o0XXBFBnxtDDX+0clXiDEMO8qx4c8K/oxeqULklsznsauY9Bf3PfkGpnuq2Kpros8S4JVGG4jgmYMo5OqoY5pXoNgIxM6vGFQ7+WwlJTXoaH3AaOp/N0l8ZeAlvR145pNhtM8xcDenFQZ9o2iSfjn60c1OfN0RZ+K4n2VFiunv5m0BVKLsLi40B0iRy/1m1lpa35WnFI4p5hWZUN9GkhZ0735/mGvo3d+Bz7WZ12G5e/14JYZEQbJOWE+lR4dpjZxwXHupsR09fq7H2xPS75SJcNZhlU0YzSIg6WyJF2p/rBiH9y4BsR99+BtJnvdpBJbx9ZCyJdCCTszRBUsuVdf6pFV2o1wBV5fFUeHvxNNXzAz+YK2yUokx7HUa6DY66T33vRQix+c+eLjHXxjO
X-Microsoft-Antispam-PRVS: <SN2PR0801MB22083CB87F6A4A9774F506D08F230@SN2PR0801MB2208.namprd08.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93004095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:SN2PR0801MB2208; BCL:0; PCL:0; RULEID:;
	SRVR:SN2PR0801MB2208; 
X-Microsoft-Exchange-Diagnostics: 1; SN2PR0801MB2208;
	4:9VVvQEnZsMEqCnJwgyAhvQtZCQxVqeGictDfOfsVwpc/J5nBwQdTGO43LQ8YppUfLB/xg3FStienkEcCsGNO/moE4LO7v5aLmgJfphU2cvh6FhP2+gDuerBblZdd+MPuWGXKLmLXtxBiyID94szV291xYqNIF/CTMltovxwF4Gn1mv+DZfJrYVDEBJL7By3IRSmSp1O8E7cYGQikfoJYJ3Oze8+IWrxWQCHbgSuN8FudkNt45m/bv6Oe1kP/LJNf4E0C8dcmmoBGmPlhXIKPmw==
X-Forefront-PRVS: 0753EA505A
X-Microsoft-Exchange-Diagnostics: =?iso-8859-1?Q?1; SN2PR0801MB2208;
	23:3fREu5vVOW9XgupifqNNFs1Gj59aIJMeqkt8h?=
	=?iso-8859-1?Q?AtnMZ6sT7ONTqVljQamOIb0eb1ETjcq28asho1A1oy9VCiCvh4GVrQrJxC?=
	=?iso-8859-1?Q?OzMPsZHHTjn7mArk7Jh4t8k3xfVaxMGc5kfABhVq3iLmctOy0eW/PWnXAg?=
	=?iso-8859-1?Q?eye3h9vkDp4hFamzSIQAgCm1x9ssUxQnieqE9Fxsq9pY534AWzqJJLqCqH?=
	=?iso-8859-1?Q?2rGO2/iatjtFgj2MkpWQFeFED0VW2zV8mSvRqMZQ5/QPZKlL+AIcjahFG3?=
	=?iso-8859-1?Q?zmcAGxWKS2cQS3SVYfK5p+WSeQ+UXrp6hPSVp+uwjyA9kqTPkQceCS2emK?=
	=?iso-8859-1?Q?Qr+EOSdtrMLl+DSMDT0EJ+EJ0xtqLynLRCX8moNVH7Mv3FlAFoYwlIaI7w?=
	=?iso-8859-1?Q?P0EGSHwICvOQ2V14mJqaMDldHNpCTDdmkb1OUbXKtCgcAPY9j5/qWpcr1r?=
	=?iso-8859-1?Q?trprzBonYlydnThuJBIftWHIOEdg7+Co5V4BiFxkeVvfd71SJxeB9vf+Al?=
	=?iso-8859-1?Q?BPaIvtWtlXC651+FzCxrghIYNp62QKzcn0V5wxkMmmBYzhyVLy3utlCH5C?=
	=?iso-8859-1?Q?tcDopJ3u7oAEMWDD3y/aURpowloxeyL13uMk3NUExPUjakrbnaafCMLNEv?=
	=?iso-8859-1?Q?D53WSF+g5CJEHubYnXfXvCcpvnXMr4inhydE1oIJvYmYBNbwoZYSzydlKa?=
	=?iso-8859-1?Q?yuNGt8B0bdPuFrtWv1YN5xsErcfEfIqHH0ijVZnIqhpBqSpSMw2bTiRdri?=
	=?iso-8859-1?Q?VwjIxcnbR7i4rpwgvA0pvKvwt/s3GUlxsTOlzBzMXp1I0jM5N/sJ2wxgsB?=
	=?iso-8859-1?Q?7jl3H14gAUFFAPaAU9Jk9zDOea30d8uFjT/czM7GG5/8gnEw166YrrMzWX?=
	=?iso-8859-1?Q?7PSmC0nY9fEQ54DS8wlVOhDlEJbMLAUqoYHXPS8KaXPWMrMgS851yo1Wt/?=
	=?iso-8859-1?Q?rNJIHshJqRZFEG0YLNvj9izF/bnCydNtcQwEYJrdsk0s+XTCcKaEGxrSFi?=
	=?iso-8859-1?Q?p9w7zOX4VTWqQLjGBQv72z/43NmvowSyr55bIC9VzLT9JYHttgtBeO6os6?=
	=?iso-8859-1?Q?Qi6xFb+pX6tMuOEFo8Q8S76otLMplsShxMktWXLc0moewxyS57kF2Q1pYB?=
	=?iso-8859-1?Q?krApZdAYnkdPb04AKI+dyl+Zjx/vv2qWKyvut0cIr6kir6OxiN8ESdS3+e?=
	=?iso-8859-1?Q?IOH8UsxFZb/LChdWGB2zfdN37/OJcw23Mg0mrTK9GNhEhPTWo4mWlp5E2j?=
	=?iso-8859-1?Q?QJkXZ4/OffCghhrtsOu83OCvgjliRBueUOK7cNDf4HKHGmhepTGPkVVENW?=
	=?iso-8859-1?Q?L26aiCNqnaMC9tYEbj+IADofQXKv+2N0L1mRbj8Z1xuci+kHwnH0jwz6Fu?=
	=?iso-8859-1?Q?Jiz5uw4XOE=3D?=
X-Microsoft-Antispam-Message-Info: u8Qkf5VkoqYognmdC+tglfikA5GG0F/59Dm7uK0EZtlQKb2lqYYDEvfFM7atZt+/pP4C3fMcvZ+OkI/nS3Zm0Y1EE9IOIucRuLJsAjG2tYOhj5CCqTuzFVvzvVNdjZivFDNIOgBXjQaq4xoJYtkiW0H6XICtlgtGzlEWhQLy/gvD043AJKXWhMM/Pfn1LFJZBWjwn0AtU081w9Y2syqA1ppJcIgwUrVMsVUXoIY+Hpt25TtK9h6fthNb3h86H6Hg5gGDnmMKtdrg0V+JAz8kWrXUfoKqtqNiehwVIDdlfW+cSy92XNcGKxNydcDseqU9rjAFPita1AVKDfpXdbYUWeqbgaghptKld2lETO3gSRo=
X-Microsoft-Exchange-Diagnostics: 1; SN2PR0801MB2208;
	6:gv3ybSQyHSUBM2JXMP+nFxq6AclfazX276QJhroPIKdved4NN6B1gDm42w6R0B3y1GUTAjiVtVjhamAlLmn+IL5Gd+qMy68AtNl3KWb/6q6N0zJz53QNq3UF00ISLZ+ABmT2nr/4fcZ3/pvkTchqHUeOnCIl8XEIRqSHakbh0GnuwCR/fkbTMnCgO6e6xei0sDbEq8lKxKAt01qfRn9oZDQmuwluamTS2vOxD4HWGa+fXtvWNSthgw8re58gIgKytUbBiyPKeW27fuSvBuvH85te6cVdcQ9Fm/3SJP9mXjeA5Erc1uxFds19Mc5j79PjN+RmW4IuVdU34Ho3ccVceMvytiIP4vySVwTzfmsdmoTAIog/hK2VDFqYu+mWq2x2prlnI2OtlrGoBQqM73d5AMtV+Rp429Zz+Ggzfiywgiod4wnYU0MKsEjFMajaDapLnhX2BWNClFhq3uvx2GzcKQ==;
	5:pIgbtSVG6zLuU80OVUcYA5PUevziPrqTPbX1iNlRUmCKrxXEaTSJzZZ+ZZOfalqBovPaksRCZbJbarLU5k2/qkSQ7PYR82tSY15Evvps1h4fODSSktmTiFbafu1wZClnOPhkL0UGZxyU9OkBlc++T6wT1isEZ6isU7+A09jNvkk=;
	7:sBLNMh36rk/HR19ttTuHFKewDPCMSC1YoY+MtUJ/WcAuzBpJqe5C626P1xV4JphnlIqbZVW11cKRFkR7hDx5iXt/zifGVqc9QiFF2jFgeAzrr38R0bo/TEPr6p97UoEG7zPL69ebAlgxuR8yjHr+LusiekxsJNnIWIZf/meuiATyC6u2xwxqKDe9xInUAVUfBNbv+dedHUfyv65YFdUDJhqPuVrGyidSIZHlGvESFuqmUF6rT/dnXwTp8iophTLJ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: aviatnet.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2018 02:47:30.4861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3fdac4-bb14-4bc9-786f-08d5f8eb7502
X-MS-Exchange-CrossTenant-Id: 8d7d22b9-3890-4eef-95a6-a226e64151be
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=8d7d22b9-3890-4eef-95a6-a226e64151be;
	Ip=[192.147.115.53]; Helo=[mail-send.aviatnet.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR0801MB2208
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: EXTERNAL: Re: Docker init script possibly uses wrong invocation?
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2018 02:47:34 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 03 August 2018 14:41 Bruce Ashfield wrote:=0A=
>=0A=
> Taking a look at things, I can see that yes, it should be dockerd and=0A=
> the sysvinit variant has rotted. The confusion around the systemd one=0A=
> is that the service file in the layer is no longer used, and is also=0A=
> out of date. We use the docker.service file from the source repo=0A=
> itself, and it has the correct daemon startup.=0A=
=0A=
Thank you for the explanation - it makes much more sense now I know that th=
e systemd file is obsolete.=0A=
 =0A=
> Did you want to submit a patch to update the sysvinit startup script ?=0A=
=0A=
Yes, I can do that. I'll send a patch through once I'm happy with my change=
s.=0A=
=0A=
-- David.=0A=

