Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56020E7AD40
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 04:50:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.134055.1766638215060107737
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 20:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VIT7i82B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44544b9a69=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP4nZDO631904;
	Thu, 25 Dec 2025 04:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=W3s1dglIsRzOFmfnDUgJx9wW6zDYNjlxdl5rRtkZ2Qo=; b=
	VIT7i82BPjt+1X2E4IKKsBPoAG+3pk8SmSjaVcEjDYXQxniTdaY2KWJabDLLsnHD
	cwrPW+Yiv98ENrBQ45E6aUi+JIX7zn9ca6QTs+v57EXW/jm1yBxW8v1aPLSjdDus
	iy08GXxykosKq2KCwn+5x3TaqX1+S6X7LAQ6QIybAcCOCXIHleXRIzz0iB4cRtJR
	4yIPXTWGeBIxbvZNFLsDxH35fSd91nJxMtbBdSIAEK4k8olK1J8o12HpGhZaZD2C
	mqXl+eb8EGN8WCNtg4qkkPEqGcPd/cMovP9CefjXRSR2d/dJwY6HxA33Z5FHNO4j
	2RrXPs9obWhFmXnh0DK6Sg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js74qvy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 04:50:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWAdYpECHFuHh8TlGpK+51T2/CNeIFzUhglu/2okC7hgjR2S474VuqgivuhOtGz5Lw0fS4BFA4GxdnoTzIey/4brDCuVLX1wmcMxBs6W8u+Z3vbh8oYr80v68BW77/2g74xLjxZt5q79TFhYO9impD7G3aAtrKoGTOQ+z6REAqkT9NoP+wLUnbMlLdBFYnbfDseTHAGCar4cMRLl8e519QuMPtc+vLMdekXWQlv37HIGy1kij5pk5kcbPRime2eoxJXFD41SWXtRf8WUcWY9MWrx0elBZAv7OztslVdwBwkQAhC1XbI6X8eIwzMrUAOyIR79ANLN2+d+DIMPn/4yJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3s1dglIsRzOFmfnDUgJx9wW6zDYNjlxdl5rRtkZ2Qo=;
 b=pr7qd1paad0xHC7wJM1sgEwkmtIKSrzsTw9icbHzfjvxeRSy2LKz2kMD4BXU94rzPC0VrUSZ8LEF/Ai+2/r2l8e7GFLdrmbbpzWhLAHCUxNYi3G7/yOfjogyphhnkMik49Jr14XtkP6HHg/CIaY6oEUln4cgUTIG8DbJ7Upj4ngEsoN8zGeuXc9GCuoJfbq/1W7c/0JeGVl2YTmG5DPn7A3BxjQXw+mRgaDOkXkPSWxuw4jzSQn+JMqDnT48DTnCYW/ctRiJpzFtt7dckZOFGcMNumuPFtpKWiKYs7GMTLwbiHsljiuTbRoMMSau/pzcy/WzInceCm3ZQ+oXE8Ov/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 04:50:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 04:50:10 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
Thread-Topic: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
Thread-Index: AQHcdJjcj575oGAFOEuqYZk5WEUKELUwwn4AgADcKTCAAB76jIAAAWXw
Date: Thu, 25 Dec 2025 04:50:10 +0000
Message-ID: 
 <CO6PR11MB5602DA0932FFE604CF48F351EDB3A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251224054744.3109658-1-Qi.Chen@windriver.com>
 <CADkTA4NK2AtaY0qfCKBP2T34N4+bTmyzKCtVf7tQjbkaCJEfdQ@mail.gmail.com>
 <CO6PR11MB560251C0260BAA43DCCD5CEBEDB3A@CO6PR11MB5602.namprd11.prod.outlook.com>
 <188454A06472FA76.1342979@lists.yoctoproject.org>
 <CADkTA4Pza_UFhXfaJc83o+KP0ys2z+eqc3zmfoKqSpP-UqnqLw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Pza_UFhXfaJc83o+KP0ys2z+eqc3zmfoKqSpP-UqnqLw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=98e8c6f3-35ea-46f4-a5b2-b608f2589801;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-25T04:08:22Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA0PR11MB4621:EE_
x-ms-office365-filtering-correlation-id: 257d3014-5d50-4b8b-a02a-08de437115a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?L3R2NEY3dE83Mys0Y1FxcHJUQWdNQUhiVGlHK1pReGxlY2plT3NpcUhUSDZV?=
 =?utf-8?B?Q29VR2EvbWRONGlHR0drZ2QrUUI3bzFDVnl4SldjeGZveExPa2JsUkNrVGxJ?=
 =?utf-8?B?SnNwc0FPN1FBaDBBblg1RzI4SE84eFQvMUZKbDFuWGdKTElRTTByTDZnZDN0?=
 =?utf-8?B?ZHp5UGVPV3p2dEpVNkQ4eU54cGdpMXVhYkh5eFMxWmdjNGYyNXpyRktzSUs5?=
 =?utf-8?B?UlVseE9ZSCtvdUkzMVl6MThnVXZLZS9SbGw0TDdmQjQ1SkdrS0ZNNCtieFNF?=
 =?utf-8?B?d0hKNUxHVlBXNFJWaXVlQ09FQkV6WnJGeUZVVHhMNGhhZUxMeXJVcjkxaElV?=
 =?utf-8?B?VkZlOFBmOTRkYnlsM3dBM0V3RjVDMDd0RHFyckE5cmlXMzI4VGdkdTNCRlFa?=
 =?utf-8?B?THQ2a1BkdFBzSkV1ZnE5UnV2Tm1mcTRYenFmT2hBNnFjU3U4NGUvMGhLbzVn?=
 =?utf-8?B?VnJpOU9ReWNteUFyVGl6dHY5amJLcVUzOVRsQTcxeWd0WUJydUk3dUtJcUZX?=
 =?utf-8?B?Mk1SQ0dvNjQraFRCdER2V0lreGFaYUtINUw3R2R6UE02SHUzc0V5SE5wVVVs?=
 =?utf-8?B?RHN4K1M1enVWWU9CUURKM0JEenhzeTJPQzNkb0dWcUxWQXFBRmxTNmN1Vm5V?=
 =?utf-8?B?UjhBUE9kT25hT2lnY1RZVzRtTGlpTyt6YWQwalhxRG42dWlqYlpFNE92cU13?=
 =?utf-8?B?bklUalVHYzYranJ4eW5hTDlJbkZEb20rRHdNV1RDN3dJRjROZ241QkhWODZm?=
 =?utf-8?B?VEJHOWlpQ05tK2V3YUpjMFE1VGVWNkdLRitHWktQSjIzWWNIM3dvRnJEMlBl?=
 =?utf-8?B?ZnRwTnJzT1hLRW1BS05XWHNoNjc0V1d0MlhLaEVhOXRiVnNzYXpzN0FnNjhX?=
 =?utf-8?B?eUZsT0VTTDdpVGgzQ2NSRkFDaHFOekpQME9jNjJlcHhhc3lJVFVSNWJ5bmRt?=
 =?utf-8?B?aG9EWGJZbEx3NFNJV0ZVZlEzY1dEZW1KVktlZUsyZVMrZlFISXZsRUxQY0sz?=
 =?utf-8?B?SW56T1VxYjdLK1Zvemo0b3F6NUhIdGFMVXZPYTY1R3MybE9LMkhZUlBva1FY?=
 =?utf-8?B?dFhzY1pLRWEza09FSGQzbUd6QzQyOHgyMDRrM1gxOHVLRVA5UDBoUThxM2FN?=
 =?utf-8?B?Z3VLREVIdUhTYXNMVkNxV2V2VU9mZFNuSVFMYjBRTktkQzI2elY5dExHQ1pH?=
 =?utf-8?B?SW1Wb3NaT3g5YkRtUm40MFhnTW10SmpTek1qTEwrTXcrUm1xaEg0K2ZYbVE2?=
 =?utf-8?B?TWdJd25ndDdOekJTT3NaZWR2ZXpONWNnemFuV3QyK0N4Nk90NkpRdDdZdGtM?=
 =?utf-8?B?dWVwREtVVFV6dnM3TEFFSUZkMmw1NHl1NHU3WjFicnR4ZXZ2Zkx2Z2NHeFNE?=
 =?utf-8?B?eHZ3NjNkZERjS0VOeWJOYWpXdmE4c3U4SUpRQWN4Wk1FYVRRMWpBMkJrSS93?=
 =?utf-8?B?ekx0MHpGUStQdi9MRWpPNStLOWJBcWZraVlFTTFTd3d2TDBGblRPaVU0NGNR?=
 =?utf-8?B?RGlaN3k5Mnh2VEZGbjRUSFhCQXB4MXF0OU5tbzBXMDB6K01iWHZxOW1qN0ky?=
 =?utf-8?B?alAyZzNuNVdKczBHalJ6ZzlGeVNYK0pkRGFnNURBam9VbFZSNXc1Q3p1Q0VJ?=
 =?utf-8?B?clpPSEREVUhodytxYjgxc00yUUxXcmtOdHJjZXJVSmFKRXllWGJiMG9NUWVu?=
 =?utf-8?B?cGdqdnA5SHNTNkF5N2FJdzJGNFpWbFliYUl6dXV6ejhhYzdLMEpiRC92YXVs?=
 =?utf-8?B?LzFCaHZmNWFPc3ZraXlsdG5GRnBHQjVHUVhYNGdyZVRjQWZvb2tyM1RqRTZT?=
 =?utf-8?B?WWk3MElkKzMrWWE4VW1wdE0wVjExOXBSUlFNUnlkbFhMcVFKRVdUYllLb3NM?=
 =?utf-8?B?YWJRMDBOYTdTSVNxazl5QlVJMVVOV0JCcGZwdTU5YmMyQ0JQTDR0cHR2Ymtx?=
 =?utf-8?B?SU1ndmxHQnZTYzlvNXpBMkJqejIxbmRQaEVQR09HRlRqUTZFbTVZVWNQUDBo?=
 =?utf-8?B?N29EQ01FRFhRa0ZYZDVHNjRHMHFDTTJIbkdSSUNXd0didXlLaGc1bmVvSUVa?=
 =?utf-8?B?b0l2bS9hRFh0LzZwSSs5Z0k2WTk1VjdUdUZxQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U1R6aU5BeFhrVktkTS9ydFBJY0hKbEtOQXlwM09ZcElOUHJjOTVPRk9GamZK?=
 =?utf-8?B?TEFJOW1Rc2dZcEhNUGpBaVBMaThXeWZVUGRDU0thN2VVZUFheWRmdnQ5MkZt?=
 =?utf-8?B?V2dzS3RITk1KZDZLT3d4elJOS3VqQ25OWXVDNkdCZnZTdGV3aUxtZ2pHc1Zm?=
 =?utf-8?B?Q0lNVkd4TzYxak4vYzVINkNMUGFjSmt6V1NRc2hObGhEVUE2U01tVURNcVFL?=
 =?utf-8?B?VUxBemhHMEdsSXdKS1F0ZXZLK3VQSCtGRnVhQ1hnVE5tMlZUYjVaakVNMVNP?=
 =?utf-8?B?K1J0YVcrdWk3aSswQ3lub2VxSFMvNTg2SjZ0TDBSSERjczRac2hmTjQwMTVn?=
 =?utf-8?B?czYwWEJaMms3YllwSEhIcTFWdXdpTVpyUmo1aEVoOFl3dzFWaWY4bjFLVEtX?=
 =?utf-8?B?UGc4SHdRc3hseWFYcHNkZFR6U0o3Z29lM3dpMEdma2pQTm9LemlBS1JtWHFZ?=
 =?utf-8?B?R3BTL3JKVFhXWkVwNGhMNkZucVovUFNwelFybFJ2ZjhuZGd3WU01Y0RqS3hY?=
 =?utf-8?B?bkJET1Z4dk4wQlllNjVKaTJkQTVkNG9UbFJIa2VlREc2MnBpOXZyVThiSU52?=
 =?utf-8?B?RmhHaTBsMXFjdjVhV21wSDREMTRwT2Y2aFIzOUFlK3V0Z29LOURqdTZST1pC?=
 =?utf-8?B?WjM5d2lJaEFVeWRScFB5bGNxV2s2RjVrRHFuVHQzRjYxalBoZEtBSVdJSGtG?=
 =?utf-8?B?enp1a2g5a2pYbmFUb25zV2k3UXExc2JhZ0ZjNDZQRDRWcW5qK3UwZ256MjBY?=
 =?utf-8?B?YzFWblUvUjgyNUtXZkdVb2ZwL2x0U1NYbEQ3cUxvNldxN1VVVDZ6OGxNSkhp?=
 =?utf-8?B?Vkc1MGFzTFlWbkk0KzAwMTNYNHhEUHhJb3FhR2tqRkJqcDVKckN1QTh0VTNV?=
 =?utf-8?B?K3ZpQkRZSUw3VVZNandzYjhwSDBuZWlBbW9Tb3QxOTg5d2kzK1BOcENzaEtM?=
 =?utf-8?B?SkMrclF4RFVCYzRXa1l6V3ZZRmZLZFVnQVVKNVFMQUo4U290d0Vpblo3d005?=
 =?utf-8?B?cEJFWHJlQWVhdDNOTkxvWFZVckxnVnpXRjVFRXZkdG1NQ2NrY3VjWWpJTDhM?=
 =?utf-8?B?SHJtVUNUN3ZTeTB1dkR6MGk0MzVVQ0NNeWlJb1poVUlTVHphSXpQTHVFWGZT?=
 =?utf-8?B?MHlVd3MvWkhTTVhKbkJkRGNpMWRUR09scHkvQ2N1ZlNORW03L2JvTk5GR2xn?=
 =?utf-8?B?M1VlS1d1ZW1zeE8zdG1pY2JwS2ZOQTMzL002UkRiRStlNlpzclZUT0FRR2xs?=
 =?utf-8?B?MmR6UTJOdTQ0b3kwWGlLTkt3YU9LTUphaWY5MmRhQTlKVVNLSWEwcjBwS1V1?=
 =?utf-8?B?Y1lLUFh4U1p1NVhiNmZGZ2RmNHhaRkFwT3pUcUJpRUhUZmhHMlNobEF6MkJQ?=
 =?utf-8?B?KzBBZDk3QXRhUzVaU3hKc1JaSWlwTVFxVmpHL1JJanVXTEpXYU5TSzB1dVVl?=
 =?utf-8?B?QXZGRldOUHNuaHRXenpUMUZzbEZTaXdxT3p1bENrSW8wSDJnR1poVHJQemVW?=
 =?utf-8?B?b0E3RDNNd2pIdGRnb2hPb2lvaVlSV2pSdW1zRlVlOUoxY3JleWpqeEpWL2Ra?=
 =?utf-8?B?dHJaT1g2cFlPUTRCbGt1VDluMWxwb2RpeTlHMFp1ZmxFU3p4MUszaGJRWVEy?=
 =?utf-8?B?V2ZjRzNOcXZraDVEUkNmUGlVRm96eHhSUjMzVUtHeGxwek1xN3RmTzluSjIx?=
 =?utf-8?B?MVpBNDhqZEVEbnd3L25sYWNvNmRXc3lyWnRvREV6UjNuejFQOUV6VGRmUTB1?=
 =?utf-8?B?RGZFa1c3dit1cXA5dURVaVlGY2NiZy8zVHpKQ3RMR0ZzQ1M2RWQ0OE93YUxu?=
 =?utf-8?B?Y1Y2eExEM1RiYWRjZGVIUUlMNGVjNUZZV1l6cmhSck1BOVhMcThzczZoVCtP?=
 =?utf-8?B?RjYrZkJrbXk1OEZTUXkzVDkxVnVOdnp5aVVrdUxOQXV6VFg1U0FrN2Exc1Mv?=
 =?utf-8?B?NU5wZ2F3dURLa1pNcWtEQnVqZkdqVW9oZUhoaUx1a1AxbU5iWEdnT3l4bm5F?=
 =?utf-8?B?NkhkNExXNHUxWGNPQ3BmL1pmL0hmV0tqaVVxZitUUFpHOHRVNkRjK2NmcVRs?=
 =?utf-8?B?SGFBaTBoZDc3a3JNZDhzRG9zTVZTY2trSDhmTENnNFN1MGNGUWJTMW9qUW5T?=
 =?utf-8?B?eWxNa3VSaXlNckczKy9DTmUwYXJtNGE0S25iS1R5cHcvS1JIZ3JWT3NIWjlL?=
 =?utf-8?B?d1BVYTlEeDQrYURTVUpJbERxZ0UxMWl3djhvNlNzRmt5VWU5d2VQV0Q1YkF4?=
 =?utf-8?B?TnlNVTBpUDY0MTlrZjFjT0JqeWg2VXpQVHljdnZpRzdSKzF5YzZVcGxzRnpa?=
 =?utf-8?Q?JmWGRJRoqWgeL/NNLS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257d3014-5d50-4b8b-a02a-08de437115a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 04:50:10.6421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxRLiovAbOlBqk6uLNPwcWZiqKwo13rex7xa0st8sLaD1otiEhNAW5FhWCruwKONrKr7nTOGpMUaGpijmjzY/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
X-Proofpoint-GUID: ffYPhq1PqdltLRqotzyYe2bWwKkoLS1M
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694cc285 cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=I86UdcNW2R5UYItMCsEA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ffYPhq1PqdltLRqotzyYe2bWwKkoLS1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA0MiBTYWx0ZWRfX5DSKCguBgUlc
 i6cVWjNNeEiEFgZ4AdwGmofbl62WwTP9lv7vOEXHi/NJfu0pTasrDqlLlgfaZG9ou87qe6EBPfC
 IIlwZniaPKaQcZ1dCmPkeGaBrva5Te7WHJBr2Sjq0m9OZdK+aHmYiAt+evlCoDopSBroJl9/oSI
 vAYotkNYzoOVsXKcx1lvMsFaQDifgP1sCykMyX9+smfm6yFzB1PKMVg+z6J5Z8aYX86b5vXteHg
 YWaFZ/+wWvtbJpQmtBOEVi61TwA9i+Zmc+KOvwQAxCiWjno8UfFdfjYAaKy7dMGncFkpZd4b5zr
 OoZIJubo7wxc/7XjvPi+fB9SFM1ufSPz8H5MDEpWoU8gqHiqalEMlhm8TfUdC4ID8odzEasRlyD
 ME3wkioDCaDKnZFyKKkOCLo+m1U4bJkkT2hqowJg9uL1brzthNAzwFscwQ6JG/nJxeUkOWztgDu
 AAlM9WF7EuXe478B8Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250042
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Dec 2025 04:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9503

SGkgQnJ1Y2UsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCkkgcGVyc29uYWxseSBkb24n
dCBoYXZlIGFueSBzdHJvbmcgcHJlZmVyZW5jZS4gQWxsb3dpbmcgZG9ja2VyICsgcG9kbWFuIGlz
IHNvbWV0aGluZyB0aGF0IG1vc3QgZGlzdHJvcyBzdXBwb3J0LiBTbyBJIGZlbHQgaXQgbmF0dXJh
bCB0aGF0IHdlIHN1cHBvcnQgaXQgdG9vLg0KDQpIZXJlJ3Mgc29tZSBiYWNrZ3JvdW5kLg0KDQo8
YmFja2dyb3VuZF9zdGFydD4NClByZXZpb3VzbHksIEkgd2FzIHVzaW5nIHJ1bmMgZm9yIGJvdGgg
ZG9ja2VyIGFuZCBwb2RtYW4uIEV2ZXJ5dGhpbmcncyBPSy4gUmVjZW50bHksIEkgc3dpdGNoZWQg
dG8gdXNlIGNydW4gZm9yIHBvZG1hbiBiZWNhdXNlIGNydW4gaXMgdGhlIHByZWZlcnJlZCBydW50
aW1lIGZvciBwb2RtYW4uIEFuZCB0aGF0IHJldmVhbGVkIHRoZSBjcnVuICYgcnVuYyBpc3N1ZSwg
YXMgd2VsbCBhcyB0aGlzIGRvY2tlciBpc3N1ZS4NCg0KVGhlIGdvYWwgd2FzOg0KMSkgYWxsb3dp
bmcgZG9ja2VyLCBwb2RtYW4sIHJ1bmMsIGNydW4gaW5zdGFsbGVkIG9uIHRhcmdldA0KMikgcG9k
bWFuIHVzZXMgY3J1bjsgZG9ja2VyIHVzZXMgcnVuYy4NClRodXMgdGhlc2UgdHdvIHBhdGNoZXMu
DQoNClRvIGNsYXJpZnksIEkgbmV2ZXIgdXNlZCBkb2NrZXIgKyBjcnVuLiBJIHRoaW5rIGl0IHNo
b3VsZCB3b3JrLiBJIHByZWZlciB0byB1c2UgcnVuYyBmb3IgZG9ja2VyIGJlY2F1c2UgSSBndWVz
cyBydW5jIGlzIG1vcmUgc3VmZmljaWVudGx5IHRlc3RlZCBieSBkb2NrZXIgdXBzdHJlYW0uDQo8
YmFja2dyb3VuZF9lbmQ+DQoNCkkgY2FuIHNlZSBob3cgaGFyZCBpdCBpcyB0byBtYWludGFpbiBh
bGwgdGhlc2UgY29tcG9uZW50cyBhbmQgdGhlIGJpZyB0ZXN0IG1hdHJpeCB5b3UgbmVlZC4gQW5k
IEkgdG90YWxseSByZXNwZWN0IHlvdXIgZGVjaXNpb24uDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZp
ZWxkQGdtYWlsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMjUsIDIwMjUgMTI6MDMg
UE0NClRvOiBicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20NCkNjOiBDaGVuLCBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPjsgbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQpTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIXSBkb2NrZXI6IFJERVBF
TkRTIG9uIHZpcnR1YWwtcnVuYw0KDQpPbiBXZWQsIERlYyAyNCwgMjAyNSBhdCAxMDozM+KAr1BN
IEJydWNlIEFzaGZpZWxkIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxicnVjZS5hc2hmaWVs
ZD1nbWFpbC5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+DQo+IE9uIFdlZCwg
RGVjIDI0LCAyMDI1IGF0IDEwOjIx4oCvUE0gQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBSdW50aW1lIGVycm9yLg0KPiA+DQo+ID4gVGhlIHNjZW5hcmlv
IGlzIHRoYXQgSSB3YW50IGRvY2tlciBhbmQgcG9kbWFuIHRvIGJlIGluc3RhbGxlZCB0b2dldGhl
ci4NCj4NCj4gVGhhdCdzIGEgc2NlbmFyaW8gdGhhdCBJJ3ZlIGV4cGxpY2l0bHkgbWFkZSBjb25m
bGljdC4NCj4NCj4gPiBBIGZldyBzZXR0aW5ncyBuZWVkIHRvIGJlIHRoZXJlIHRvIGhhdmUgdGhp
cyBkb25lOg0KPiA+IENSVU5fQVNfUlVOQyA9ICJmYWxzZSINCj4gPiBQT0RNQU5fRkVBVFVSRVM6
cmVtb3ZlID0gImRvY2tlciINCj4gPiBDT05UQUlORVJfUFJPRklMRSA9ICJwb2RtYW4iDQo+ID4g
KFRoZXJlJ3MgYSBwYXRjaCB0byBmaXggY3J1biAmIHJ1bmMgaW5zdGFsbGVkIHRvZ2V0aGVyIHRo
YXQgSSBzZW50IGEgDQo+ID4gZmV3IGRheXMgYWdvLikNCj4gPg0KPiA+IE9uIHRhcmdldCwgZG9j
a2VyLnNlcnZjaWUgZmFpbHMgYmVjYXVzZSBydW5jIGNhbm5vdCBiZSBmb3VuZC4NCj4gPg0KPiA+
IERvY2tlciBjYW4gd29yayB3aXRoIGNydW4gYmVjYXVzZSBjcnVuIGlzIHNvbWV3aGF0IGNvbXBh
dGlibGUgd2l0aCBydW5jLiBJdCdzIG5vdCBsaWtlIHBvZG1hbiB3aGljaCBkb2VzIGF1dG9tYXRp
YyBzZWFyY2ggKGNydW4gZmlyc3QsIHRoZW4gcnVuYykuDQo+ID4gQW5kIGZvciBkb2NrZXIgdG8g
dXNlIGNydW4sIHVzZXIgbmVlZHMgdG8gZWRpdCAvZXRjL2RvY2tlci9kYWVtb24uanNvbiBmaWxl
LiBUaGlzIGlzIHRoZSBub3JtYWwgd2F5IHRvIGRvIGl0Lg0KPiA+DQo+ID4gSW4gc3VtbWFyeSwg
d2UgbmVlZCB0byBzdXBwb3J0IHBvZG1hbiAmIGRvY2tlciBpbnN0YWxsZWQgb24gdGhlIHNhbWUg
dGFyZ2V0Lg0KPiA+IEFuZCBmb3IgdGhpcyB0byB3b3JrLCB0aGlzIHBhdGNoLCB0b2dldGhlciB3
aXRoIHRoZSBjcnVuIGZpeCBwYXRjaCwgaXMgbmVlZGVkLg0KPg0KPiBTZWUgYWJvdmUuDQoNCkFu
ZCB3aGF0IEkgbWVhbiBieSB0aGF0IGNvbW1lbnQgaXMgdGhhdCB0aGUgY29uZmlndXJhdGlvbiB5
b3UgYXJlIGRlc2NyaWJpbmcgaXNuJ3Qgd29ya2luZyBieSBkZXNpZ24uDQoNClNvIHlvdSBuZWVk
IHNvbWUgc29saWQvc3Ryb25nIGp1c3RpZmljYXRpb24gdG8gY2hhbmdlIHRoYXQsIGFuZCBpdCB3
aWxsIGJlIG1vcmUgdGhhbiBqdXN0IGNoYW5naW5nIGEgZmV3IGJpdHMgYW5kIHBpZWNlcywgSSBu
ZWVkIHRvIHJld29yayBwYXJ0cyBvZiB0aGUgY29udGFpbmVyIHN0YWNrIGNvbmZpZ3VyYXRpb25z
IGFuZCBhZGQgdGhlbSB0byB0aGUgdGVzdCBtYXRyaXguDQoNCmNydW4gaXMgYWxzbyBtb3JlIHRo
YW4gInNvbWV3aGF0IGNvbXBhdGlibGUiIHdpdGggcnVuYywgaXQgaXMgZm9yIGFsbCBpbnRlbnRz
IGFuZCBwdXJwb3NlcyBhIGRyb3AgaW4gcmVwbGFjZW1lbnQuIElmIHRoZXJlJ3MgYSBzcGVjaWZp
YyBydW50aW1lIGlzc3VlIHdpdGggaXQgaW4gcGxhY2Ugb2YgcnVuYywgc2VuZCB0aGUgZGV0YWls
cyBhbmQgSSBjYW4gbG9vayBpbnRvIGl0Lg0KDQpDaGVlcnMsDQoNCkJydWNlDQoNCj4NCj4gQnJ1
Y2UNCj4NCj4gPg0KPiA+IFJlZ2FyZHMsDQo+ID4gUWkNCj4gPg0KPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbT4NCj4gPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDI0LCAyMDI1IDk6MDUgUE0N
Cj4gPiBUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gPiBDYzogbWV0YS12
aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gU3ViamVjdDogUmU6IFtt
ZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gZG9ja2VyOiBSREVQRU5EUyBvbiANCj4gPiB2aXJ0
dWFsLXJ1bmMNCj4gPg0KPiA+IE9uIFdlZCwgRGVjIDI0LCAyMDI1IGF0IDE6NDjigK9BTSBDaGVu
IFFpIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gRnJvbTogQ2hlbiBRaSA8
UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+ID4NCj4gPiA+IGRvY2tlciB0cmllcyB0byBmaW5k
ICdydW5jJyBiaW5hcnksIGFuZCBpZiAncnVuYycgaXMgbm90IA0KPiA+ID4gYXZhaWxhYmxlLCB0
aGluZ3MgZmFpbC4NCj4gPiA+DQo+ID4gPiBUaGUgVklSVFVBTC1SVU5USU1FX2NvbnRhaW5lcl9y
dW50aW1lIGNvdWxkIGJlIGNydW4gb3IgdmlydHVhbC1ydW5jLg0KPiA+ID4gVGhpcyBpcyBub3Qg
Y29ycmVjdCBmb3IgZG9ja2VyLiBXaGF0IGRvY2tlciB3YW50cyBpcyB2aXJ0dWFsLXJ1bmMuDQo+
ID4gPg0KPiA+DQo+ID4gSG1uLiBubywgd2hhdCBJIGhhZCB3YXMgaW50ZW50aW9uYWwgKGlmIG1h
eWJlIGluY29tcGxldGUpLiBUaGF0IGlzIHRoZXJlIHNvIHlvdSBjYW4gY29uZmlndXJlIHRoZSBz
dGFjayB0byB1c2UgZG9ja2VyIGFuZCBjcnVuLg0KPiA+DQo+ID4gQXJlIHlvdSBzZWVpbmcgYSBi
dWlsZC4gb3IgcnVudGltZSBlcnJvciAgPw0KPiA+DQo+ID4gQnJ1Y2UNCj4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXIuaW5jIHwgMiArLQ0KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4g
PiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlci5pbmMNCj4g
PiA+IGIvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXIuaW5jDQo+ID4gPiBpbmRleCA5
OTUzNWE3Ny4uMzk3ODJiODggMTAwNjQ0DQo+ID4gPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMv
ZG9ja2VyL2RvY2tlci5pbmMNCj4gPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXIv
ZG9ja2VyLmluYw0KPiA+ID4gQEAgLTEzLDcgKzEzLDcgQEAgUkRFUEVORFM6JHtQTn0gPSAidXRp
bC1saW51eCB1dGlsLWxpbnV4LXVuc2hhcmUgaXB0YWJsZXMgXA0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcs
ICcnLCAnY2dyb3VwLWxpdGUnLCBkKX0gXA0KPiA+ID4gICAgICAgICAgICAgICAgICAgIGJyaWRn
ZS11dGlscyBcDQo+ID4gPiAgICAgICAgICAgICAgICAgICAiDQo+ID4gPiAtUkRFUEVORFM6JHtQ
Tn0gKz0gInZpcnR1YWwtY29udGFpbmVyZCAke1ZJUlRVQUwtUlVOVElNRV9jb250YWluZXJfcnVu
dGltZX0iDQo+ID4gPiArUkRFUEVORFM6JHtQTn0gKz0gInZpcnR1YWwtY29udGFpbmVyZCB2aXJ0
dWFsLXJ1bmMiDQo+ID4gPg0KPiA+ID4gIFJSRUNPTU1FTkRTOiR7UE59ID0gImtlcm5lbC1tb2R1
bGUtZG0tdGhpbi1wb29sIFwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWwtbW9k
dWxlLW5mLWNvbm50cmFjayBcDQo+ID4gPiAtLQ0KPiA+ID4gMi40OS4wDQo+ID4gPg0KPiA+ID4N
Cj4gPiA+DQo+ID4gPg0KPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IC0gVGhvdSBzaGFsdCBub3QgZm9s
bG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyANCj4gPiBhd2FpdCB0
aGVlIGF0IGl0cyBlbmQNCj4gPiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0
YXIgVHJlayBJSQ0KPg0KPg0KPg0KPiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUg
TlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgDQo+IHRoZWUgYXQgaXRz
IGVuZA0KPiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0K
Pg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM5NTAxKTog
DQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24v
bWVzc2FnZS85NTAxDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL210LzExNjkyNTk2OC8xMDUwODEwDQo+IEdyb3VwIE93bmVyOiBtZXRhLXZpcnR1YWxp
emF0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IA0KPiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1YWxpemF0aW9uL3Vuc3Vi
IA0KPiBbYnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPg0KDQoNCi0tDQotIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBm
b3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQotICJVc2UgdGhlIGZv
cmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0K

