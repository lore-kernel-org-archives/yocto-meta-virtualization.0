Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9957EF531DA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 04:58:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11874.1776142672158108727
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 21:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Azt4RSfv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85645fefe5=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4oJ4D4062397
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 21:57:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KUYu1lAg1oP0cJiWSFXiH6YCzZF31xAH+VNj+8QYm20=; b=Azt4RSfvBYTV
	VhJArAhjJhM7Rv1QVvkMlXNGUYyEuC9wyNTdI58RbDmkOobRpa1VTnL10WBk9mXk
	e94SFQjhDkPDUoPVo9PV9iJ/lg4m0m7yeAOw6gizYMSUN/kjfqON0AY3j5LWZ8L3
	Zs8LveeOrcqBUfUL0LVuSZmvCGegp01nNLz/E93X5KUjQpHdQSNXqLCX+89ivjHs
	uLCmRf4z12bw+bWASCA/zvB3pnwAnmCV3otTUk7lCnggxF0VTAfod0sQG9shGjz8
	0HB2EOq2L1/73JD5i9Qdngl/TiLdqrSlKtNbYWHIKTBuwxaWza9rvX9ljR8LCmy0
	dRNyxCQm5w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86m89st-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 21:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOFBCI/DqkMjvMgaJ3rLPYHfQphwy/aEHVqhqipAdqrJDzfOU/hrW21gaD7El9/KWLAcrPuKJVDo4crURKGXAt2cHiHfneKCUwo6D5vtuI32+wc5b1Avy3EBy3dEHirUY9BP0PjTVIKNJ2sEnEP52+h3nwcui0geY90rA+/0Ulowolv/r7umPAuRJ3267vSmY5qCzasH5M8PZ2QyGq7YWSS3gqk/ma+qDlKapTEMqbhpy6k1cTjKmKcpklQqciHqM/82uBMpX4bIJ030G8UEFsroVX5O2bhkTs8bn5xF99fmZzba7eg5holSb5cqjo+hLLZrLGOyvnnAKcZ0bMasyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUYu1lAg1oP0cJiWSFXiH6YCzZF31xAH+VNj+8QYm20=;
 b=E1sKfa+m/MkoObwKQLbaGGs2PpsImCWqPpvaXsJSxlwPEDCdN9XxkdQnrewuPGuvKUcWx4D8VmAtitUXmYxyO3L/IhS4xG1aR8MahIIfh6fud3ZbLxqmsrDP5/VGCyfcvQ/PX+qvNKHebwXRcWBBn+zDXZfcN5pWywt1JHhiPbGp7UI/hOEE/cEMUS9hzpazyc/3Vrb28QJYNGF5512+xsJh9YxT11VTcUsV8cCeJsHfRASaQ09KKUMuauKliAwMJJVRjrBVjrpO5atd2irZ4/DUvQUnQ+zIz7AqBthHGYbIEKPajdloMssvgzQcJGef7J5Q4p1cxjbKYAEatGRKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 04:57:49 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9745.012; Tue, 14 Apr 2026
 04:57:48 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [V2][mete-virtualization][PATCH 2/2] libvirt: add secrets PACKAGECONFIG
Date: Tue, 14 Apr 2026 04:57:41 +0000
Message-ID: <20260414045741.809844-2-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414045741.809844-1-zhixiong.chi@windriver.com>
References: <20260414045741.809844-1-zhixiong.chi@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To IA3PR11MB8986.namprd11.prod.outlook.com
 (2603:10b6:208:577::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB8986:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf374c8-a680-43e6-80fd-08de99e26017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Mtrq8fkYCX5Z91CjGqFN/KKewdEsz4ffFHH0uAa4BTIHdKcDahcFJacTO15ivJH0miFimc7xX7Tp8//3q5Rw5Mhk8NhaNjRVirGPawMKF14/8jdHol1A/Q8+4LyxROTPY9r91A9VPJAwYmQ0nbIpLXcr41ldoFmF3Et4qh/sKEBwzkrCMpWs+R+/F+DckloYW7PodXZjfdoWOjtnr/Roa1a2TJiYXpXW10qREmajZYGY2oFmQv62TwyEp0WBycRfH9xnNJH5b7QodBfMJ9mGTR361Buz6H97yd0EBgV9PRmisQ26y2Ogei7iKfMIMS27sGmwX1zQ6PlhRi6HaCvGDhZC+6zYNakC6zhRsiNKKQzmeQmDZldQUgtfXFmUV8k3y/XCimeohkXdJTbStMDP/c7b8Xr4zrQAZd5n4dVIa2AJ3+AVip4IqGYpqpz19MZqh4DNA7sZ8M6ylnnyZPgwTO8yPE1WpbSGYIqYPXI45cxLo0fBF8BDHBv5HO+rgUGB3hdEFC6G6ALOidMTqffQhAT/GXQk55SyNyTtTleXxjy5n7Eb2OoMXMDIPCP24cybCW1dYrge37wJOyB/CUM0QG0yAA+MvcQM5M9IRzDcgQ7SbzBBxwz6l2/7Gc0Cq9kudWK3t0/ZJVZxP7FfWMcknx1SFGzaJALs2Nqv4uLgVVMjf9lGFlObRB0/i957MghLJuOJxu205MHJh3qEepgX7YR+fp2W6t3sTcDL2T9zDDQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0k0YTcxeFZpNlV0dGw4b1NaZXNlR283d3QwR1J0Y2lEaUd6ZFBtdURvUjk3?=
 =?utf-8?B?YVRCMklYSk9rS1MxK0VjdUgxWlprRmo5dlRhYU1OeURrWEtMSStFTllNaVZq?=
 =?utf-8?B?b0phNUY5MjFadzFWdnZkclVmQ0NtVmVEdC81Q1JiWmhXZlE2dWJNWm1BQUpZ?=
 =?utf-8?B?Umt0RkJhU05NV2c2b2RVeG5ua1FjMUlIMlpyRlBNTEhNUzUxZjIzMUFtdjVz?=
 =?utf-8?B?N1Jqc3NRb3pIeTYvR1JJMm5tcExKQXZaUnRtVEVlRE9QeHhBQ1RSQkJmMURI?=
 =?utf-8?B?RHhhaVU1cFpESSt4Q2tGMWZwMmdybjI4MUM0K0wvd0xsR0owQTJ2VnE0Kytu?=
 =?utf-8?B?NTJEeCtZM0ZMaklOU2xUekVocmM3UnpnRFpORVhjMVBrWTJiMjJJaStib1Zh?=
 =?utf-8?B?aWZHK3B3elZGVERsSC9DbzdsTGtXRkJMU1FmekZSdG0yWGt5NisveE1KaHJk?=
 =?utf-8?B?b1QyRE1PcmZiWW9TZDZ1UFhHUDM0WWRCREZESVJnWGRRWjl2TWJmZ25EaHUv?=
 =?utf-8?B?OUF2UCt4MU1rNzQxUFdCbUY0UC9neUljVGRRdnYwc0lwS0NsVzV5eE9uZGhi?=
 =?utf-8?B?M2NyN3dXaG5qQ1UyTjh2ZWFDM0FQNEZIejFuUU1tSlJpZFlPOFNwV2h0S2RR?=
 =?utf-8?B?L3g0YUFZWHM2cWtTWi9raUhjNW5ZRjltRW45WHl4Z2ZFZERMZGtEeFBmUFRS?=
 =?utf-8?B?R1JWSWJkcWlxa3VMMzZPcGRMTkNRRTJIMk9zSExIdEY2SDFBaVd0UXZDT1dN?=
 =?utf-8?B?MXJmVktIalh6SVJ3KzN1TlloOHhtTmFXb0pmeWhuTFJFRXh1QTlvL2lHaVE2?=
 =?utf-8?B?YWdhVWVOVzFTdGRIRDVEeFNidlRwZXh0cnZkMDdvME5Vc1IzL0dvRHFvU3Zr?=
 =?utf-8?B?S3pOclNRWlNrVHRDeGZvWFN2aVl0MVVaem4wUG4yejZBYlh1TFR5QkRvaGh2?=
 =?utf-8?B?OXkvZFZNYjRyMVZDNG5ORWpNR3ZrU0RyczdtM2NUNHVDNzFZNUEvQWJQZkRr?=
 =?utf-8?B?N0pCcEQvYUZWRU5ldFljYTc4RVlLdmx5Ky8waWVveVFBYlB2dEF0QjFTaXB2?=
 =?utf-8?B?TzNiMjc3RlJrUkRmWkNDWmJ5TTR0aTZ2N2JObUdydnlZZE02Nm8vcG1CYWtE?=
 =?utf-8?B?YzVqbTlQTWV6Ym5ZZVJ1Z0k3V2o3OS9hd2lDallTWElPeE9xZFVUc1JhQkxo?=
 =?utf-8?B?VU5OOEpZZmFJV2VwanBwdmJhcXkxc3MxdkQwS1NUSHlUQmRBZEkxY2pxSWxZ?=
 =?utf-8?B?R1RKV3NRNWIzbVZ0OVBpajNYbTFkMDFkV1dTWWd4UHIyYUJ4SmlNNE96K2FE?=
 =?utf-8?B?NEViNUJzWnRUV3o3T0lqUHhQODF5eDlOQmJKZC9Kc0JiY3dJQzJIbUxMb0h6?=
 =?utf-8?B?QmMvZll4Z2d6dXFCZ01xMVF2MU9OUmE5U3l6VzFvMWcwM21SNloxWldXQmlM?=
 =?utf-8?B?bzZycE4rRkFPZFRwcmZXeVhRUkhISEF0OUsvcWpsYmdsdWVWQnB1bzFrUGs0?=
 =?utf-8?B?dVJpeXBuczFrVDd0YWZHYlNSN0J5SUE4KzNuSTYzYU11UWdLbGFFVzZRNXNr?=
 =?utf-8?B?emdsc1ZDOTJwWmhwUWowQnhqVXBKeWN1blo3dEErS0VEYms1dkRFTGlHTXFR?=
 =?utf-8?B?czg5MFM4NjhtaDdHWkdvVVlIeFZ3M1JIcHdEWERrcjRWUWFDYktSQW5kTDNu?=
 =?utf-8?B?V2xMZDFUWFhOb242bUxBcEdUcGkvK01JbnVGb3lNSFk2TUhLNDNsMjZCdjJr?=
 =?utf-8?B?cERDamFLMlFFeWtBWk5VRTc2cVZObWZFZ3ZTZ3kwZWZsVU0wQXlUTGZtVkhY?=
 =?utf-8?B?dlMzUHFJTGFSLzZwd28ybGw2OHJlZS9CcHh5UTd2ODdvZm02VFR6RWNRekFv?=
 =?utf-8?B?NS9qbnJHUVVQdVAwQmZvczVjV1M0R3pvclhqa2ZRazlDRG1QTjRkVG9aamlp?=
 =?utf-8?B?ZGpGbndjbEwrbWh5aWdMUFhlVHRNQkdLelFsT2tqMUNxU0s4UkhhM21mTFZ2?=
 =?utf-8?B?djlEaTFjbCtqSEx2bk0yVXFURlk1cERUQ0ZvelkrRUljY2ptSEpUbks5Tkg2?=
 =?utf-8?B?M2NZbW1rb3crSlJoaFRBN3pzVHlPQ2Y0RlhwN0ljMFZrUkJaVkh5S21OeEJs?=
 =?utf-8?B?Q0dNNnpGeWE1N0lXOTQxVEc3SlNjbEoyL0wwWVRtRWkzMHhEQUljdmZ3RzUz?=
 =?utf-8?B?Z2ZTSFhGK1VYYmYwMENvMjJvaW1XbnhiYjhjNDJKUEhTVTFXWEJzeEk2K3M0?=
 =?utf-8?B?TVhDRXFYbDl0WUlCdndQUm5LRE9oak1VcE9LNDdwNzByL1ZmamE0Nlc0K0c0?=
 =?utf-8?B?WnRlMTQrTzNOZVVVc1hWdDVvTHZVajFuZy9OMVlva3BQTlFaMzIrdjdoWUFW?=
 =?utf-8?Q?s6oS9GwDIZis3lyo=3D?=
X-Exchange-RoutingPolicyChecked: 
	iksTBYdms7NZ9v5Rf837oNBkKR6Dinccdb3yofcl5SnHsyqI7tUDmA6iOwHRMIUpesRphH32VPFiUsaxu0BtmMdjcAaEAQTYhOriy+KsrXg1HTCP5mjHRvkKwof7WneZY26x3MA2BFgYxOAD87V4LiSHf/29B657jxF1vSFbvDkhhs7OxcCc7ID8Y4+VUeFuOg8AsOcPx5I/mYC20oFEv8wUp2wAC+d++GQuLxa8j/ZEBLxR+btsViT+zvKwcYLdGQmgeEg+XWcEFSTBvEJR6OeTE+OgWiMqTMzf1K0BJ3+Go3OyqOTv5gaD1iPCMHRZn4uvcBYlBsN3rep3hJCuhw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf374c8-a680-43e6-80fd-08de99e26017
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 04:57:48.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXEGLQ1KXfNO2RHiA0b6Bg3ShaIPX0jgVpOmbcnRMsx8TPXM3lEBKhYhStjwqzcwuKyP7xpW1JD98eYY3+2XgMWcPmF6en0x8Ms4FChnlW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69ddc94f cx=c_pps
 a=lZTGddAnKZ6AR5Pw1xQKMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=SqMvC5kiAAAA:8 a=t7CeM3EgAAAA:8 a=UpdZImfyTAIb4Nb2TNQA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Zc4P3jiixznXaQEzEa6CzUMsD2f2FDbO
X-Proofpoint-ORIG-GUID: Zc4P3jiixznXaQEzEa6CzUMsD2f2FDbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NCBTYWx0ZWRfX9El3quaSVSKY
 ZfmoO13+t97UJE5j90ENPac9iMilKS+uPhhjTKkwGiCP/Wi0O5B+YvtijW6S7i4MkZk9ySXpOUG
 f38z4YwiEO0c2ZP/JlTr2jwSRvfPnbxIsqSvJXP9/BnR/fyprvRC/kCzoFbWunsMR1vSBFqJjWO
 Ki+tNqHYY556yhyZMoboTD54K4YRv/zzGCTR7GCa9jG8PFBWlz+3LobvjJdgut+90zP+UOTjOsS
 eGqX7iirU0LErWQ0n6mMtRDghsSYvVreMMoBCcK4b3ZzfN0L8qcZg4s+KAYLv+A1c/4uiJ0L7ml
 +PScNl9KxYMOeJ/dJByhrva5E6fp/q7WvSa8wZvCRd7KWpJftIseMZVdSwvKhw/L6ZcvZpZVjJJ
 D5H/KHihCRdtde0tRvhCwpCosfGYU/PNqDwidJvLFa2BTgjc5VV4BPwTuwbfC5HzjGwRX7dImQJ
 iCYuK8GrytlDy0bvxrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63E4oJ4D4062397
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 04:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9699

After being upgraded to v12.1.0, the new virt-secret-init-encryption.serv=
ice
has been introduced, and it requires systemd to add openssl to PACKAGECON=
FIG.
Because systemd-creds encrypt command will be executed in the service fil=
e.

Meanwhile this service was added into the dependency chain of the main se=
rvice
libvirtd.service, and will be enabled by default by libvirtd service with=
out
any build dependency detection according to the original upstream commit
https://github.com/libvirt/libvirt/commit/97758bc9a0b1fccf8c0009308658f12=
04b113b89

In systemd recipe, the openssl PACKAGECONFIG is disabled at default. Fina=
lly
the service file virt-secret-init-encryption.service and libvirtd will be
failed as the following error:
># systemctl status libvirtd -l
 * libvirtd.service - libvirt legacy monolithic daemon
     Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; p=
reset: enabled)
     Active: inactive (dead)
 TriggeredBy: * libvirtd.socket
              * libvirtd-ro.socket
              * libvirtd-admin.socket
       Docs: man:libvirtd(8)
             https://libvirt.org/

 systemd[1]: Dependency failed for libvirt legacy monolithic daemon.
 systemd[1]: libvirtd.service: Job libvirtd.service/start failed with res=
ult 'dependency'

># journalctl -xe

   A start job for unit virt-secret-init-encryption.service has begun exe=
cution.

 systemd-creds[1251]: Support for encrypted credentials not available.
 systemd[1]: virt-secret-init-encryption.service: Main process exited, co=
de=3Dexited, status=3D1/FAILURE

The above error info "Support for encrypted credentials not available." c=
omes
from systemd-creds command provided by systemd without HAVE_OPENSSL optio=
n at
the source code src/shared/creds-utils.c

Here we add secrets PACKAGECONFIG for libvirt and conditional removal the=
 new
virt-secret-init-encryption in the libvirt.service.

Perhaps an alternative approach is to enable the openssl configuration fo=
r
the systemd package=E2=80=94for instance, by creating a systemd.bbappend =
file.

However, the method here grants users the flexibility to independently se=
lect
the specific configurations they wish to activate, thereby avoiding poten=
tial
PACKAGECONFIG conflicts between packages.

The users can add the following configs in the conf/local.conf file, if t=
hey
want to enable the full libvirt secrets functions:
PACKAGECONFIG:append:pn-systemd =3D " openssl"
PACKAGECONFIG:append:pn-libvirt =3D " secrets"

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index b5b0a5f2..a9e6180a 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] =3D "-Dfirewalld=3Denabled, =
-Dfirewalld=3Ddisabled,"
 PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled, -Dlibpcap=3Ddisabled,li=
bpcap,libpcap"
 PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabled,"
 PACKAGECONFIG[nftables] =3D ""
+# Require systemd to add openssl to PACKAGECONFIG, so disable it at defa=
ult.
+PACKAGECONFIG[secrets] =3D "-Ddriver_secrets=3Denabled, -Ddriver_secrets=
=3Ddisabled,"
=20
 CVE_STATUS[CVE-2014-8135] =3D "fixed-version: Fixed in 1.2.11, NVD track=
s this as version-less vulnerability"
 CVE_STATUS[CVE-2014-8136] =3D "fixed-version: Fixed in 1.2.11, NVD track=
s this as version-less vulnerability"
@@ -232,6 +234,16 @@ do_install:append() {
                 mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_syst=
em_unitdir}
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib=
/systemd
             fi
+
+            # secret service is completely removed in libvritd.service d=
ependency when secrets disabled.
+            if ! ${@bb.utils.contains('PACKAGECONFIG', 'secrets', 'true'=
, 'false', d)}; then
+                sed -i \
+                    -e '/^Requires=3Dvirt-secret-init-encryption.service=
/d' \
+                    -e '/^After=3Dvirt-secret-init-encryption.service/d'=
 \
+                    -e '/^Environment=3DSECRETS_ENCRYPTION_KEY=3D/d' \
+                    -e '/^LoadCredentialEncrypted=3D/d' \
+                    ${D}${systemd_system_unitdir}/libvirtd.service
+            fi
 	fi
=20
 	# The /run/libvirt directories created by the Makefile are=20
--=20
2.53.0


