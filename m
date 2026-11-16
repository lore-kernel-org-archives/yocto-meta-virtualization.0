Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22212.1794810156039513762
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 22:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D2ve4h6p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kshakir@qti.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LaDa3839104;
	Mon, 16 Nov 2026 06:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/BZHVYZ4t0oeceYJGVyBrx+9
	CyXwmdyCuC3nk/VddiY=; b=D2ve4h6p9FyxAWeG7X4ErONvZmS7jHCkn5frV8LN
	GlcPbq0tBROxze8ext8ULL7zW2jFDXHCj+mLe3DxB9mgHU33JXjZEg69fao84b0K
	FAjRboGO/VERZFjXuDQDpHbjsvWXVFHza1Aoc2iscgGg1BD4Og2POBGzkkOcivon
	U2zC7/dTlOr/2d5mpJSTnlf//aqxWjUxLzVwTMJS+BDgH7pYTo9nAYUX/Q+dRT1a
	lK1SNDNX0LWA/MDpDoRpqtq2+F5slA6lEqGvw9unk9xuxgnSLNTR18Lji9lD9Ggu
	Mw2apKfiUluPWRavxzY4ezA+Rl5HI0E3DDay17yjez4zyg==
Received: from co1pr07cu001.outbound.protection.outlook.com (mail-co1pr07cu00105.outbound.protection.outlook.com [40.93.10.93])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhn1q6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 06:22:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDW/jByIP06Jff8kWWL5S2Ggt0Xpsdj3R5fcAUhkUgxzdUJjAsKzDtBSRGiUQWUBSiTTUathU9+H+a6LNsHRKjIJGYscwJ3v/MCeH3MkZ5K9ddOPqhOFiwXPnNupXZhowhMvpZvqMy/0ng/iTYtYqwbDir4no6fzK/Ly66UwDWKye9yw+UoJiUNTKTeqgPGAT0i9rbTypsRIwOfTd00cvnrWj3HaXm2ldz1jVJurKJSxHCptsXIXo4QbhsXSBci4H64vlMnIEKFJphG5w3xmqOO9m8V6ry+0bQRQR8e+dHr3Oqfrs0d2dfDw+3cSR2ecxRiQ2CYMWQ9yfJTGs8xWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BZHVYZ4t0oeceYJGVyBrx+9CyXwmdyCuC3nk/VddiY=;
 b=mdOGhJpiPlWbszXu7dwdKQESLFvkz0CVp80hOkhmqqNktWEdlxYavPRT/vETjflarByVDUQcCNCopZU2SSzETRVerC12qQs6NkWgVg6Hg9T+4chtMNRUyZqaPq62qEbCGCZDwGvHVZdx02KWyHJvVlYpCQxuLsyWg4ALs7npGowTZNoaTf0/pi7JPCA7gDqLQB3VBvfB3WGLxXeSl8PPaHPdV2CGd0WtqIiUk69G0aE1XcGK2GI8KuhBKhO6mZrvLSRkqEJO/D6wGHfY8WCMNSujx7dFSupBFsled6zWyTQH8aqJXEw5peufBaRMjSZSGoS676/l9dmVlSc/wcu22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB7416.namprd02.prod.outlook.com (2603:10b6:510:18::15)
 by BY5PR02MB6835.namprd02.prod.outlook.com (2603:10b6:a03:210::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:22:30 +0000
Received: from PH0PR02MB7416.namprd02.prod.outlook.com
 ([fe80::81f7:6e15:b461:84c]) by PH0PR02MB7416.namprd02.prod.outlook.com
 ([fe80::81f7:6e15:b461:84c%7]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:22:30 +0000
From: "Kemal Rasim Sh (Consultant)" <kshakir@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "Ivan Evlogiev (Consultant)" <ievlogie@qti.qualcomm.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [PATCH] docker-moby: preserve gids during docker exec
Thread-Topic: [PATCH] docker-moby: preserve gids during docker exec
Thread-Index: AQHdcoTCxH6+1a9NXE+lQFy9JsLunrcwJRUAgAAbR3s=
Date: Mon, 16 Nov 2026 06:22:30 +0000
Message-ID: <PH0PR02MB7416A4AFC8C84504ECD83E65BE7C2@PH0PR02MB7416.namprd02.prod.outlook.com>
References: <20261112090350.2918098-1-kshakir@qti.qualcomm.com>
 <6afa8a00.cbce3cee.49824.e4ef@mx.google.com>
In-Reply-To: <6afa8a00.cbce3cee.49824.e4ef@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB7416:EE_|BY5PR02MB6835:EE_
x-ms-office365-filtering-correlation-id: f04b1453-a5c6-42f8-a57e-08df43a9fe23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261009223027099003|18002099003|22082099003|13003099007|8096899003;
x-microsoft-antispam-message-info: BeLtozcHplNmBVd6Caqqz9HOTXyzT24qFxupI05B9KHUitY6FmfOvTJTHY6wrcJxkKBWu441KAo2EKzj6An5EaF5L8Qec0n1WRT18ZnwORLWojOfBYN0EjciGWo5FSNuC4jlXs18IaPkaFp5CzSbZ9dZ2TegyRbXxX10GoI16xLt79nBl8YAtH9bpMz5BE3e4RRM1yYu4xXQyfIp0XOMJJU2IXe3iZVxt3NLjpDvXSwwmOoL8UviGyBEMcFkQpRvx3yw9WBGeudk0Rf6Pj3hNaORSVbL/9mtVqKXdxcpJgOM906fezD22kJ88teKbnM6P2lXlyKBxe0pgEdINs7S0uJfLH3FWWGRsmgJW6Jeri3pBAIrRCCdKCpkppIf2cNQHXd1eptkNVWQ8OOs+1FWQDHkKWUJO0KHFaiirWvcqwjDVkVMETHrXUpkQ8lzPVOZclrrLqSMv5vxMKE9WXDDPMRSOCGG0WjpRIVezibTxLVqPg9ry3DDtRgxD2FvPVgelLhHLD6iVis0WLeVrCDSZrDDiA+JybPY5snygK7V1fVcgtjTPNKC8Qk2uhPH5Hl0aDkWD/FPpgr7IoVdAH8fsfu++oVrkfk1R40exnV6FTPhlDsiRgYV4W2R0EVLqwl0lj5yDkX19qW/jlripjBYHaQpk4KlASFdz09isIXJGJbceE0ZawhcTncxLly4k+JR5e0wvkj2d3YUDT/yMAQuW/hBDlS3QhZMdNV7B8MHnS8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7416.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261009223027099003)(18002099003)(22082099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xuj7pDe2KmgdtRK+KOgBCqVzVFJ70yTdzRUsEHc6mSyS4ZfDe5KAJfMNCm?=
 =?iso-8859-1?Q?aRI9iKNAtLh9d0YnhqTiZi6zrZHe42XNepVTcX8DyoCwVsz2IaZUxRWfPq?=
 =?iso-8859-1?Q?XzYZJUpRe3dUFIeB0IWO/vlHjdY6G+tZjiPLIXRem6Ru3tHPBuGZRXHDDy?=
 =?iso-8859-1?Q?9y1HdXJWAY2hFKnelKbARr94cz/5XCllFOXiKOMVkt+ZqGOTGyj8OO7pWL?=
 =?iso-8859-1?Q?NgEiPhLpkYT15J4UB2cavXKqzRynjaTG3OjYmdtH5LJjJW20sGuvLlDAS9?=
 =?iso-8859-1?Q?R1trgxIm1SUP/M2qzYdULRNzmDfTsIvy2TGe5sNA1rVQa6VbLsOiP2owbW?=
 =?iso-8859-1?Q?N1ADoVIp8oLDgtuaRmsmgKeElh348mpWM4rfHdwk159okH62s+oM+Is9T3?=
 =?iso-8859-1?Q?5jO5BhS53c1dj7MvFoFoliViiC8G6bsZPYrRHoxMnvT6qT8F9mlF5FGFNr?=
 =?iso-8859-1?Q?PflgQFuZXAAOwF2dgMKuzTeGm/gqJuexqPKsUaXOACsd1dS8NK2/ZUm0vU?=
 =?iso-8859-1?Q?ard8/0+m/tj4AYI9QcbhsvokD46SqZR1149ZOcce2yRUuflIGV8+pfpH0M?=
 =?iso-8859-1?Q?tJ6WkA2shfweR4+BZAAgHdmrbwTCHl5G6sE9dWXkgkLYgVX4MOBMgxLw9I?=
 =?iso-8859-1?Q?jbOd9g1ynvq7ipbtN+w3ZSR5b+eJ3aCAvl11G0dc2kxAY8yeznd/Xs7SrC?=
 =?iso-8859-1?Q?ngFf/gzU5vdxnb/NexGKrVM+1BB6OAuM5vQ9N7anqFqlwwgrmOdAakSoDA?=
 =?iso-8859-1?Q?D0SCT/f97cTG1qBiTTgFeVFY14n6OvJyYODpKJMatZXYuGQQNQu0Kr4AQ8?=
 =?iso-8859-1?Q?/AU+8xD5PrbZbwXkJpnvYqHOAMap+z2CGA0t2CMnthmQHD6T+OTbLyRs/r?=
 =?iso-8859-1?Q?SxYdlLfz6K19Rwz0h2EGttobvF7cs2oDg8L8emWtoaQe61FIn0dujWA7yN?=
 =?iso-8859-1?Q?TwuAo5g9OCi6fdX5EVQLeTcZX/q3Sgjyi/Ubv502vYc7eMTt/YInyVdTDB?=
 =?iso-8859-1?Q?sJ94KgNeBwIPTZ99aWsUwaX/RA0jl6f/c2TBGRDh0FWYWF+Qij18eLyO+l?=
 =?iso-8859-1?Q?ekJOZOFFDww8IC6qqjjj1AMjGYI28JEm4xc3MEsmLOENitO5RgQEYiIihr?=
 =?iso-8859-1?Q?S+d1+jXk9Kv2W9t3wps0EGBozPYAkl03hqVb2nkWW5Ar3pVxYwnkUj/taW?=
 =?iso-8859-1?Q?pnbPquEpcZ5XSKUOdp7iuMHNBG4UwkjaJgh5ELCBX17Zu5IpOOulJ0+6ZR?=
 =?iso-8859-1?Q?KzFeh2honsxgcSzgZLJTbhncXsgWtkcSIZjwz+vwg5v4lUjPJGPh3kTCb+?=
 =?iso-8859-1?Q?VmqnMNb36b8SS9gkzkU3ayV1E8ZB/3OnQhgBnKkoq4UVtQ+UnoHPRreRjF?=
 =?iso-8859-1?Q?D66i6bTVweaIWSctCz5ntOoeLQYgUzQHJHF2kmpKDLKcdYfAsDcBUb/DcI?=
 =?iso-8859-1?Q?R9dYPr7Mnrv/aSZs64+HH4kGtq3VJ8PovD6lK8Fi88yIrTs5y5b86sIeW2?=
 =?iso-8859-1?Q?wtbtAEaWA9Dpu720ohfWlM/hVfvoj93ctieS7mvHRLWsEzMg62WS98f0V9?=
 =?iso-8859-1?Q?2HscdcaXDPJkI1LYdCOGLT0ivTnYUTKMba5zGmiv9vQAwidfHmtBLCguqE?=
 =?iso-8859-1?Q?PCTTPt1/73h8068FCajMEDdl+PmFaeFqOsz8ZEBaSLl56NOShO0gsG4DeW?=
 =?iso-8859-1?Q?moXz9GO2CPRHlc3C00BHhSLmfFVnZE+G+4xRr6WHL4Y3Sf1oI40x+Xtumf?=
 =?iso-8859-1?Q?iY3vvtVIPHAYo3qwk3wraDTOPuTGBakIPlAHQG6ALEGN4R?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB7416A4AFC8C84504ECD83E65BE7C2PH0PR02MB7416namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f8yGMVD3RzLGQKeUfnyJgoYxPePrkKnZy37/CzUnBZfTofMI17ezaBhALNo7VIeoRJKWclp0VlG7OGDSXT7czvSPMAHcnlmOHRayHz9F803PL00tPg/0VRjzckD4IoCrB0UnRJVF44ta9oeRdAwLIS18GPjzMxE+h8jVzz/kjo6937sqjQpqwXcGsdGdENrphSMk/4FvQBsgpWIOY0/l+OProLOFlzuwss2wYBTdKdApYci95SE6aQAR4X8S0yI8ewckFk9Vr7tLSD/yPOJ7eY2zx0+Oa9KksRhmRrj+mJ4Sha3gw00KwHrKKPtyESa8jwbf0EoF/hKU0Jh9Kc9vEA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pwICs3XNiMpKL4s4d0fg3npdpIGemrR2Hf0C2sCq3tusI/HWIBmnmt9yci5jdhPnnVyA922b2XjQbY+PbhZcri1idapHFRCXkR4SpFX93toTZyc4hx3uAem1L8DMC5mYwV2H0fPlas0p/42NxVABai/uHc+ZpvBcyqxvX7KlKQOVNgWUkVIdD0LtuTZ2UwOYI4qQekZZZxlDUSA7twiwoevhixnVQXWdEwGA+vkVz545yqQwxuYB5vckBLfmuerNWOdf/v6//YyUjwV4SWom9+GPHRTPllnZ1inLGUrJMxH+69xsHHj2ux+IqpwSLiD6GwRlFkGWzVdEOyHQJ6+bLV3sE35ZP7XXYj51uJkbaow6PpwPy+mQeauC91rNcfvm3OFK7Wj/X0dlYNk0d7WLJKwpmg8iC4I07Be6ExiPM+LqB1xqVosN0uSo5K79d5jRqRLWrKoFMcSha1BW7S8NTAb53627s0yTbhKT3fqigAw6WyjOD+Hlyq0/c58R8CuTCSESWOwvPktQokkoVzUCdbjzMwr5oLaF90k55/Veh9GII715+j8Dxv7nyuPhA93/vjRCwt2Xwl1d/+cUyZgqX1egds4qS7mDGpkeFo/TUg1JgSHFHECLQcxkTJhaqiWr
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7416.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04b1453-a5c6-42f8-a57e-08df43a9fe23
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 06:22:30.1865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOTy8rTUj/s3u63feGQyPRimhEUhdI4I6nVpDs/U6qkkl5jI6xRnu/0igHccqlwDckPjLdZpgXo/9eU53pgIFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6835
X-Proofpoint-GUID: NhW6zR4fKCD1j3YlckanZeDowyam2cbx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfXxgzoJIBm4Srj
 S6o6B7kWuBsi3D7T6OihemMcV7Wpe5ZIwTE7ubHDyuDqvuNUsBFE2/Fq73TTLz2xF1GZFIKL+eZ
 AYUi0YjlIL3UGXrLePW8hrOY6KOLcHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX1XYHz3ugB//T
 p5/O/0cKTkEDRsgIryFziaJc/JmgfFBWF08BOZkhs8iJvyia5Vq78cUo4Q8NeZsQdYS3xd7ICVw
 n0zc9wGk5NY3YK2BAEIEUqitSLuDynA4SO8RNqffQzgTPoJ/P+wTKlhUKOlvW6XGPUkKj506bWk
 cphTY8+oFe+yzRKFWVJ33AKRLElL0sVuknix/RfuXZwwaSqyw9Qo8QH5moJkrBWj+GHpG7MC7jW
 cL2cKiRv2JxayNvQUFuFoSlQ68U5yDPFFsfunG8oFl8XW7dKrV91RtDC893PzDU7UVlDSf10M6i
 rgtu4sV96IBR0ekzCOn7M6FgrMcNgtDmi2DsKwLD/eMH636xHkgupfa5NQEucrXn0uWiimMNBeL
 nXSjTuJcUnF6WFa7+eR7p7YJRkQWgiAqCvgkDCMqEKJARF+9NJukAwjhkBdfZz1zthX9UkQLmRD
 XE53e+HejNCVWnQrUmA==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afaa12a cx=c_pps
 a=q5vO//TkXWYTfB+U33r3ZA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8
 a=zwUxm8v6c-yu6FT1ROUA:9 a=wPNLvfGTeEIA:10 a=jdJg-prx1bXlnfun:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: NhW6zR4fKCD1j3YlckanZeDowyam2cbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160025
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Nov 2026 06:22:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10172

--_000_PH0PR02MB7416A4AFC8C84504ECD83E65BE7C2PH0PR02MB7416namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
Thanks for the feedback, and sorry for the inconvenience.
I actually sent the patches to the wrong mailing list first. When resending=
, I used --subject-prefix=3D"meta-virtualization][wrynose][PATCH", but for =
some reason the subject didn't come through as expected. I'll make sure fut=
ure stable submissions use the correct branch-specific subject format and a=
re sent only to the appropriate list.
Sorry as well for the typo in the cherry-pick line. The correct master comm=
it hash is:
5c36dadbaa68578bf2087c3f639d64260fab839e
That said, it will probably change once the master change is merged and pic=
ked up upstream.
Thanks again for the review.
Regards,
Kemal
________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Monday, November 16, 2026 6:43 AM
To: Kemal Rasim Sh (Consultant) <kshakir@qti.qualcomm.com>
Cc: Ivan Evlogiev (Consultant) <ievlogie@qti.qualcomm.com>; meta-virtualiza=
tion@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [PATCH] docker-moby: preserve gids during docker exec

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Thu, Nov 12, 2026 at 01:03, Kemal Rasim Sh wrote:
> Preserve and merge the original OCI additionalGids into the
> exec process specification so that groups assigned during
> container creation remain available to docker exec
> processes.

Thanks for the patches.

> +Upstream-Status: Submitted [https://github.com/moby/moby/pull/54104]

I'd like to see what upstream says about this before taking it, so
I'm going to wait for that PR to be reviewed.

For master, I'd rather pick it up with a SRCREV bump once it merges
than carry a patch. I'll decide on the stable branches after that.

You sent two different versions with the same subject, one for
master and one for wrynose, and a copy of each went to
openembedded-devel. When you send stable patches, put the branch in
the subject ([meta-virtualization][wrynose][PATCH]) and send them
here only, so it's clear which is which.

> (cherry picked from commit
> 5c36dadb2543835d79eb4d398cfc9da507f6ff882)

This hash has 41 characters, so it's worth checking.

Bruce

--_000_PH0PR02MB7416A4AFC8C84504ECD83E65BE7C2PH0PR02MB7416namp_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Bruce,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks for the feedback, and sorry for the inconvenience.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I actually sent the patches to the wrong mailing list first. When resending=
, I used
<code>--subject-prefix=3D&quot;meta-virtualization][wrynose][PATCH&quot;</c=
ode>, but for some reason the subject didn't come through as expected. I'll=
 make sure future stable submissions use the correct branch-specific subjec=
t format and are sent only to the appropriate
 list.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Sorry as well for the typo in the cherry-pick line. The correct master comm=
it hash is:</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
<code>5c36dadbaa68578bf2087c3f639d64260fab839e</code></div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
That said, it will probably change once the master change is merged and pic=
ked up upstream.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks again for the review.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Kemal<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Monday, November 16, 2026 6:43 AM<br>
<b>To:</b> Kemal Rasim Sh (Consultant) &lt;kshakir@qti.qualcomm.com&gt;<br>
<b>Cc:</b> Ivan Evlogiev (Consultant) &lt;ievlogie@qti.qualcomm.com&gt;; me=
ta-virtualization@lists.yoctoproject.org &lt;meta-virtualization@lists.yoct=
oproject.org&gt;<br>
<b>Subject:</b> Re: [PATCH] docker-moby: preserve gids during docker exec <=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">WARNING: This email originated from outside=
 of Qualcomm. Please be wary of any links or attachments, and do not enable=
 macros.<br>
<br>
On Thu, Nov 12, 2026 at 01:03, Kemal Rasim Sh wrote:<br>
&gt; Preserve and merge the original OCI additionalGids into the<br>
&gt; exec process specification so that groups assigned during<br>
&gt; container creation remain available to docker exec<br>
&gt; processes.<br>
<br>
Thanks for the patches.<br>
<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/moby/moby/p=
ull/54104" id=3D"OWA7d6f5dff-b2f6-db13-1382-d6f1a41ce91d" class=3D"OWAAutoL=
ink" data-auth=3D"NotApplicable">https://github.com/moby/moby/pull/54104</a=
>]<br>
<br>
I'd like to see what upstream says about this before taking it, so<br>
I'm going to wait for that PR to be reviewed.<br>
<br>
For master, I'd rather pick it up with a SRCREV bump once it merges<br>
than carry a patch. I'll decide on the stable branches after that.<br>
<br>
You sent two different versions with the same subject, one for<br>
master and one for wrynose, and a copy of each went to<br>
openembedded-devel. When you send stable patches, put the branch in<br>
the subject ([meta-virtualization][wrynose][PATCH]) and send them<br>
here only, so it's clear which is which.<br>
<br>
&gt; (cherry picked from commit<br>
&gt; 5c36dadb2543835d79eb4d398cfc9da507f6ff882)<br>
<br>
This hash has 41 characters, so it's worth checking.<br>
<br>
Bruce<br>
</div>
</body>
</html>

--_000_PH0PR02MB7416A4AFC8C84504ECD83E65BE7C2PH0PR02MB7416namp_--
