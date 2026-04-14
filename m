Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C43BF531DA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 05:05:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12014.1776143120625605402
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 22:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EFEO8xTE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85645fefe5=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4r5Ih4067311;
	Mon, 13 Apr 2026 22:05:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=lZUH7N8psmMK1gunYgZnXu
	kaw4BkjzZJsv9uYP8vbCQ=; b=EFEO8xTEv9Q8TIAklPnpTYT3enQXZuaHUmI3Vt
	FxBDUOkGqAc9NwWjjJY7n//IS4XeMcnejmMM812kIoo7fpH7blc2NKh3dAeu/IfV
	jK1vzSkVnrtbj9ucthp/MyZnJV0J9KuGhBXYp4QXKAHcYiVGWvJbBm1/DrDBBmPf
	fZB88NTB5z3xcaf1gZfq7MhAVQ/ULk7JXB7KMXb4nUXRM32/4EUALedU9TmXA+bS
	7sxt05xXLsmLTTnGyBzCst2OHitfI73jW90ive8rn+w1WUidLJ/8doXQKfHZ+Ig7
	2HuYADtDYTUdpHDgnbAWY8OqleMbm8kDmKotJbHI7B564jAw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86m89yt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 22:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj8AhjSDOtRSFbmZ6qaeuOntp/NCKYsWXYx028FFthV1yRRaXV20xEgynthXzqnZDV6tH2BiqnD3gMq3pLHTqfZhoyLds5HWyhVPf2SzW1WtXVB6Ase96yxYOAIj0dIdgscz3i41xY+Mf27x/PNl1BLHVYHoZCKhSHD2BYSuRM6loXjvPZA4fwtHGbcBsRnHkwJYUjIOLZzQHSY2CA4qRUpZDV/gFD/2oRE3SSrSVJPFI6p57DkrE0idA8EsjoqzkPg5effzDlF0xK+6h4tlOCI9AAvvobGcRWyN+N9KjvYdgLu80LgVRdHTgVV8pinUOI4yiUHtrns/7bPX/E8bnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZUH7N8psmMK1gunYgZnXukaw4BkjzZJsv9uYP8vbCQ=;
 b=LHU+XEJEfLdX8OCuiIP2EvwUKNGCuSCOzKvzEXnCJHY9nMFQaM1WQ9sLXtc5s0rEqCjVaHTlYcErNAPwe0rpfeWMz/eNl6CN3rRpSGdmO3H0x/bJC41onKiUk8VZJi4PJkn2X3cXbiCid+PYjJCWBSnfKYtrCY+4bdtPXweKU2K17hi47SbAx1+tZG5SUDb5k+6LEXWoUlpsUdo7pDTc3AJmEu5zlp7YWdJM8zLYh2zHAQG9rTdTkY61Wyx6ALNtr28CIN/6sXU3TeOWnL3vhbUed3CHgxnXoM8sjHeKOkeOzU6oHi5Xnrv0dAwdQM7GCrfbYh6OY6CWiT0MpQGJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 05:04:15 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9745.012; Tue, 14 Apr 2026
 05:04:15 +0000
Content-Type: multipart/alternative;
 boundary="------------ldS5hLwM5BntnJuarvT05CQi"
Message-ID: <f93198e1-5988-48c1-8f70-d60131f01f87@windriver.com>
Date: Tue, 14 Apr 2026 13:04:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: add secrets
 PACKAGECONFIG
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20260411101842.3462555-1-zhixiong.chi@windriver.com>
 <20260411101842.3462555-2-zhixiong.chi@windriver.com>
 <CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahUSNM1i=3OAcFFtF+-EqmQ@mail.gmail.com>
From: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
In-Reply-To: <CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahUSNM1i=3OAcFFtF+-EqmQ@mail.gmail.com>
X-ClientProxiedBy: TPYP295CA0046.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::17) To IA3PR11MB8986.namprd11.prod.outlook.com
 (2603:10b6:208:577::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB8986:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb6a179-7e41-4e04-cb47-08de99e3469a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|8096899003|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	dQf7p4qpTWBFIcSo47QGPmYt6rZU0eP2xSygHzJey8BS8PNDiZ0cOkZkUgc9At87CACFZc2JEEfjvsnzQtYFQ6HGtQGLkOEdycuS87EsZbIK6cLK5sk5hnN19zp2/U8EKfFTw24kSX3rSRYIAM9ywgI5nt0/ecYBBU75ZCf4eWzAE2ISTzZferjp/r6sBTfnF4+0atuYb/BkR9Kb4MYYBoXJMROGo7wPRXMaiMe2HoJBSsTXszCqIMuNWy5sC+1Z2jf9wVvZIp+OZIjNmijGntARkjGAhMyFSTFj9U1lbqbIZ4rSSLQrowLrp7GKBGaQEi5LfJEtngJ+jAxcxvJaetSvYkxAuO0Xp3B9xgnn5KkHbVVcl9qn8+WXI7BXVPgGlQuYx1JttgvZm70tEdx0TU1RL1CSSsPuTxZwjTDnRnlGWksb0oAWk1iCchIOj9P+MFHyKC1Rp5oMxuEDZn5xbDwjPftaXkJ36QrD/v1vGLKaoFK7l3PRgPWbjqkzQJ4NemAh0xdrqdD/X9aOALJI6ZpTY/owsoC3GR02NODPc4bV8JV2PAIPE7BwoVROImNFyoU6Emiq8xVUYEgEWckxfpv0Nh6796d1IpcB1xZd2AybFdHiMsz0Jv1rwaquxtOYphxfETie5+H02kPFuqQXSjx/gzKdGhni9tqxEVvO8vTiRFg4tYx9rpDDfzMR3JXg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(8096899003)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1pQSmI5Y2crNU1EY2FEcmcvKzVRT2JFeHd5ZWtpV1g3a3hyK1orTEtFbHhI?=
 =?utf-8?B?UThBL2RiVVZrZ2Zuc0w3TFY3VWhDZTZUM2dpUXhFSEJ3ZmxpWmg2Nnl2VVA3?=
 =?utf-8?B?Y2dkU25aM2JURmc4MVFHSk9rU1Z6SXdUdkdFd2NPcTBBYUsrdTNqa01IczF1?=
 =?utf-8?B?Uk0rUURuTXZUbEFvb2g3ZHRxTnI0TG11UWZveDYwMDBNMFA2eDV3S2dhNUxr?=
 =?utf-8?B?MHZ6Wlc4cFRhUStLQ0lPWkNRU25PbWtFTGNmUXNXNllUMmlGNDM0VkJtdUw5?=
 =?utf-8?B?THZWMndOenhYei94VUJJelFxcGc5UEY2bnR1RTNFUnBDMTRYS1I0WmJvQUJr?=
 =?utf-8?B?TnlNVVdXaWZuL2NxVVlrMEF3RytOczZnUlpxdUJkUDBwaVVmbEEwNXRhTlFS?=
 =?utf-8?B?bWtiRkorZUFmaks5SkV4V005ZHRibUJhU3hUVzZiNjkxNkFNbkVkc1JYU0Ez?=
 =?utf-8?B?OTlodjI2YllVcUNKRkJKRUdUelg1U3pmU3FXdnFaRjVKNG9qckFPQzl0VVFM?=
 =?utf-8?B?OFdCMVYyNFZlV3NpalJ5bXdQdlg1cVpHcDRyVWd1TEpVUC9iejhINUZWbFIr?=
 =?utf-8?B?SkdyNFo4aHhXMnJSclM4Q0d4Uy9lNjRIUys3TjA4dWdyNWlvVUpTc1NxVzVy?=
 =?utf-8?B?a3Y2dVVwb3RXbHZLemh4UmVSakNVaXZPSE9ya09TYmtnWmVZSllXNDk1dDly?=
 =?utf-8?B?cG54MkUxQ21iRjF3SjQrRHpNT01sUEhvWUE2Y2dzcnV2NnZrNG9wemhYWk1t?=
 =?utf-8?B?WG5rUVo3K0I3RzRESmtJVmN6ZGVzU1ovakpxS2YyR3d5MmI5V1hhYzZRU20z?=
 =?utf-8?B?Uyt5YlUzTnQrQWROa3lWTnRoaWFRR1hzeENteHJQTGpyRk1yMEtNMkZtdGtl?=
 =?utf-8?B?cC9PaTNzSXU4cXJ3Q2ViRU40Y0xxSEMxMTRLSWdOY3c2cVp3cXlERmpPelpp?=
 =?utf-8?B?NUdqdzJ3aElCQWxJTGtuV2hnSk40UElSVWJ6RFg0Znc1RFdPZ3VteGZZUDlh?=
 =?utf-8?B?VzhyU282aG0wa3ZJSVRJRktVTTJwdDFDQjNYclhjRERkODJvRlF3azVmWWZw?=
 =?utf-8?B?ZWc2OVV5UEo0eHNYSGpaa1JUUldTb09FZGF2ZHEzbW9qWFdoMm1EK1lxSWRL?=
 =?utf-8?B?ZnNNTU5TTkdhRldWSUxkTTN2MWhIdjF3bU5UekpuWXZjZ0gvTEdFL0pSdkoy?=
 =?utf-8?B?SDM4QXZoUzNyK3BVamdPYXozRWhhY2lodUkyMkd4VlgzSHM4dURMRGgrT1hp?=
 =?utf-8?B?NlNZWHNzcC9Tbk9mZzFDUXEwa3pheWlvR3BsaXhjcm1Ic3pYY1lITnNlN2Fl?=
 =?utf-8?B?dnpsdW1yMjN0ekVXN0pRVGtkS29ZRlpJMGhoUFo5SUZNL0FXUnNYNXIzNGkw?=
 =?utf-8?B?YVRmRm1aQ3A0b0l2MUplcEpNVnJzRTkvZ0ZFejVwWVBMWnFGMDlWR1FWa1VV?=
 =?utf-8?B?a09rc1VMdTZ0SlQ0RHRJQk1JT2hrbTI0Z2JZaEwwdTAvc3NmYWVkZ2JXUGFi?=
 =?utf-8?B?QUFIZXhlRlVoZEJWVCt0T3NYQ1Q1a2tHZ3BMdEhYNjd4SFo1M2FqTTZvSm1q?=
 =?utf-8?B?QUJzZkFzY2V5eWNQS3VHK1VQam1HSkVBMmdONkxzeERTcG03NzlzK0g3UHdW?=
 =?utf-8?B?SzBqQ2tIbStCenZwTTB4ZTZYUGNpWGxLRXNjUk1oZkVaZ0V3bWRqYU1nK3FR?=
 =?utf-8?B?dVM4a3Z0dGRzRDRHQStJSzFOcVVYQ0t5MjhEUTk4NkZ2WFhnUnRqd3JzQUpj?=
 =?utf-8?B?VUZIK0tlU3Q1N29Dc3k1NDlWaC9KQzV4aWNadnNJVS96MmhmWFJKMSswNERG?=
 =?utf-8?B?OGJGVFU5Q2x5Z3hXMkRxRmh5RDZnYWcwbmN4NDJBMnB0eEZyM1VWL1BHbml3?=
 =?utf-8?B?VGZaelRCTUNrVTZ2czQyTWFsWC9hOUt5L1FUSDdzYVRnZnl3QVJNWnl1Y0tY?=
 =?utf-8?B?cWNQd0Y0MFlJSWdRT2MxTTBUZVBsR3AzMlRGV1BjK3krNVc3Ym5QbzBLN296?=
 =?utf-8?B?OXdsYW43RjhSRTJNWlk3L0hmU3lkdnBKdzdqWU1ZRitQRGIyK0hLK1JCcFBl?=
 =?utf-8?B?L1JOOFA0MVV3OHYxbmJBWjhsVlYrdlJNL3dCOFlNdU9KbHYxbTFwcmZ4WTlY?=
 =?utf-8?B?TWF5WjdBRmxRcjFLbEVhNTQ5UE82U2pPTHd6YXFGbzBLRElYQmdwcUZqckM0?=
 =?utf-8?B?cVRYUTgraEdZbXNEa1VrWDBoS2pyc1FydEVHNzlaYnRWdEswR3BiRzlpUVBZ?=
 =?utf-8?B?T0JORUplVGhNNzAvdEY2Z3U2QjdoSkdCbWw3azU3L2x2VitCOHdPdVlkK0to?=
 =?utf-8?B?d3Q2eVVuV3RLMW1qbzhLZDJaaktRai83c2NqV3FXcHBOdlNwakVGczlNQzQr?=
 =?utf-8?Q?34iGZr0Mz7dti0vA=3D?=
X-Exchange-RoutingPolicyChecked: 
	QeulSi3fz1nJ1qC1nBEIf+gJ+qMCI0IKbp3AmBQ2ZR1CBRko4c3YclGky6Iyig8mG4GfPVw+kYAkGzEwDv5J7hXgdBPU3D9Yn2f1bBJBRyhKrWiawAQaSROaOJ3cbH89GDLCCz3zpvSflvfAZd8dw6Wfuj876nU7XvHpljK7Y1aHa+r/1ifh0qNjSIUwt2Q/tAk9u5kXFZItcSCCvHr/cFlEnX7+FzlTF/yRXMxyJ3HdIlkYh3TPpS02LhAkaeeDp84XWmV2a39s+bKGVch6u36kHGmzUkl+0oWZ6kfFVJuapDb1bLl9eqqyW4q4RbaqMiXowixs1oy1U4aBLLaHHg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb6a179-7e41-4e04-cb47-08de99e3469a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 05:04:15.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+/XHW+bWvq53ftnCaQbCqBB+cXVaqobqDb+Pn4mLDqtj9eYj4A1H7/1VwGligFTlYVL9TAYBJ96T8qnsZx9G4+yC/Ujok3oP+P1oJiz+Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69ddcb0f cx=c_pps
 a=1c0oZQ8MA7sDNsoFSDv1iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=iGHA9ds3AAAA:8
 a=5zBmwohVAAAA:8 a=vnynRzA7AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=R_xijZuorxu3qrKqGoYA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uc8VlMhjAWsCgeBPREwA:9 a=AR5tMIBVosW-tygt:21
 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=vWgD8zG0H4_5ii-OlP9Z:22
 a=KzGtPItofEgYnRrcTJYe:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: igxOKGFv3YChd3QDRHaIZkeYI0mprzE7
X-Proofpoint-ORIG-GUID: igxOKGFv3YChd3QDRHaIZkeYI0mprzE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX8mI6LN2hkMrC
 iBL1X7d6e4qR0sqWyeXeWBH57c8HqXZrCz3JP7g6rZZ31vMQJNE6DDGRChkuRA5bDaKAW/7E+p+
 F6EEAZ5921o6fJMVWSNfFYO8BAY7IhrOGXE9+OPZmvQO9rSVGhc2MrdfInDSNZ48pickeoaMzF+
 wqRFQDVFTrr0JO3yEIyNoB+08jsZZU9k4wn77IHBJ4fZjgjjjFpe5Gmt6KKHD1hHg7iD34J3dp3
 ITI49RbwL3VID6ZFl7vj6upuOO+j3sDjVtEG+uOAWLqhk4t4B/FtbbqCL/r3VBUQ1FSODryzMKo
 /PdG59Vishl/o8HGoqgxyQkFU+uCxCickMC3Y1aqS106T4gXT/fTSFWQCOs31QmeEBMRJQek6U6
 LLcdQhPAVOuhAwOcOHnMyFJQqZP4FrCqtgFlR5+D1KWvgGF6US+Jjk9fFj7NIPG6gL3921xagJx
 sl0GDdc8kBn2yVEV74Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 05:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9701

--------------ldS5hLwM5BntnJuarvT05CQi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63E4r5Ih4067311


On 4/13/26 22:16, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Sat, Apr 11, 2026 at 6:18=E2=80=AFAM Zhixiong Chi via=20
> lists.yoctoproject.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEK=
ATrBh1p0-RmGBSG0scglZdegA$>=20
> <zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>     After being upgraded to v12.1.0, the new
>     virt-secret-init-encryption.service
>     has been introduced, and it requires systemd to add openssl to
>     PACKAGECONFIG.
>     Because systemd-creds encrypt command will be executed in the
>     service file.
>
>     Meanwhile this service was added into the dependency chain of the
>     main service
>     libvirtd.service.
>
>     In systemd recipe, the openssl PACKAGECONFIG is disabled at
>     default. Finally
>     the service file virt-secret-init-encryption.service and libvirtd
>     will be
>     failed.
>
>
> Considering it didn't exist before, then yes, it is disabled by=20
> default.=C2=A0 But that
> we can see from the patch.
>
> If the new service was introduced by the uprev, is it enabled by=20
> default by
> libvirt itself, or is it doing some sort of build time detection ? We=20
> need to
> document that in the commit message. That is what your commit message
> already implies, I just want it to be clearly stated.
>
> We should also be capturing what the user would see in the system logs,
> on the console, or wherever if this service is enabled. Is it an error=20
> ? is
> it functional ?
>
Updated the comments in V2 patch including the services status when=20
secret service is enabled .
>
>
>     So add secrets PACKAGECONFIG for libvirt and conditional removal
>     the new
>     virt-secret-init-encryption in the libvirt.service.
>
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     ---
>     =C2=A0recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrB=
h1p0-RmGBSG0seih9UXkA$>
>     | 11 +++++++++++
>     =C2=A01 file changed, 11 insertions(+)
>
>     diff --git a/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrB=
h1p0-RmGBSG0seih9UXkA$>
>     b/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrB=
h1p0-RmGBSG0seih9UXkA$>
>     index fbee9c5b..3075149b 100644
>     --- a/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrB=
h1p0-RmGBSG0seih9UXkA$>
>     +++ b/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrB=
h1p0-RmGBSG0seih9UXkA$>
>     @@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] =3D
>     "-Dfirewalld=3Denabled, -Dfirewalld=3Ddisabled,"
>     =C2=A0PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled,
>     -Dlibpcap=3Ddisabled,libpcap,libpcap"
>     =C2=A0PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabl=
ed,"
>     =C2=A0PACKAGECONFIG[nftables] =3D ""
>     +# Require systemd to add openssl to PACKAGECONFIG, so disable it
>     at default.
>     +PACKAGECONFIG[secrets] =3D "-Ddriver_secrets=3Denabled,
>     -Ddriver_secrets=3Ddisabled,"
>
>     =C2=A0# Enable the Python tool support
>     =C2=A0require libvirt-python.inc
>     <https://urldefense.com/v3/__http://libvirt-python.inc__;!!AjveYdw8=
EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEK=
ATrBh1p0-RmGBSG0scd3pMLYg$>
>     @@ -225,6 +227,15 @@ do_install:append() {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${=
D}${prefix}/lib/systemd/system/*
>     ${D}${systemd_system_unitdir}
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir=
 ${D}${prefix}/lib/systemd/system
>     ${D}${prefix}/lib/systemd
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     +
>
>
> We need a comment above those sed expressions to indicate the final=20
> result.
> i.e. service is completely removed.
Done in V2.
>
> But again, back to my first comments. If libvirt is enabling this by=20
> default, and it
> isn't doing some sort of runtime/buildtime detection, is this really=20
> the only way that
> libvirt has to disable it ?

Add the benefit description about this approach in v2.
Provide the opportunity to choose the specific configurations they wish=20
to activate,
thereby avoiding potential PACKAGECONFIG conflicts between packages.

>
> Bruce
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! ${@bb.utils.contain=
s('PACKAGECONFIG', 'secrets',
>     'true', 'false', d)}; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -e
>     '/^Requires=3Dvirt-secret-init-encryption.service/d' \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -e
>     '/^After=3Dvirt-secret-init-encryption.service/d' \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -e '/^Environment=3DSECRETS_ENCRYPTION_KEY=3D/d' \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -e '/^LoadCredentialEncrypted=3D/d' \
>     + ${D}${systemd_system_unitdir}/libvirtd.service
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The /run/libvirt directories created =
by the Makefile are
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9692):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9692
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9692__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb32=
1z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0seQbx4qdw$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/118773077/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1187=
73077/1050810__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPX=
GyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0sdUIwrPoQ$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJv=
fsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0sd8XqPZXg$>
>     [bruce.ashfield@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------ldS5hLwM5BntnJuarvT05CQi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63E4r5Ih4067311

<!DOCTYPE html><html data-lt-installed=3D"true"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body style=3D"padding-bottom: 1px;">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/13/26 22:16, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahU=
SNM1i=3D3OAcFFtF+-EqmQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 11, 2026 at
              6:18=E2=80=AFAM Zhixiong Chi via
              <a href=3D"https://urldefense.com/v3/__http://lists.yoctopr=
oject.org__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVg=
pxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0scglZdegA$" moz-do-not-send=3D"true=
">
                lists.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"=
mailto:windriver.com@lists.yoctoproject.org" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">windriver.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              After being upgraded to v12.1.0, the new
              virt-secret-init-encryption.service<br>
              has been introduced, and it requires systemd to add
              openssl to PACKAGECONFIG.<br>
              Because systemd-creds encrypt command will be executed in
              the service file.<br>
              <br>
              Meanwhile this service was added into the dependency chain
              of the main service<br>
              libvirtd.service.<br>
              <br>
              In systemd recipe, the openssl PACKAGECONFIG is disabled
              at default. Finally<br>
              the service file virt-secret-init-encryption.service and
              libvirtd will be<br>
              failed.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">Cons=
idering
                it didn't exist before, then yes, it is disabled by
                default.&nbsp; But that</div>
              <div class=3D"gmail_default" style=3D"font-size:small">we c=
an
                see from the patch.<br>
                <br>
                If the new service was introduced by the uprev, is it
                enabled by default by</div>
              <div class=3D"gmail_default" style=3D"font-size:small">libv=
irt
                itself, or is it doing some sort of build time detection
                ? We need to</div>
              <div class=3D"gmail_default" style=3D"font-size:small">docu=
ment
                that in the commit message. That is what your commit
                message</div>
              <div class=3D"gmail_default" style=3D"font-size:small">alre=
ady
                implies, I just want it to be clearly stated.</div>
              <br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">We
                should also be capturing what the user would see in the
                system logs,</div>
              <div class=3D"gmail_default" style=3D"font-size:small">on t=
he
                console, or wherever if this service is enabled. Is it
                an error ? is</div>
              <div class=3D"gmail_default" style=3D"font-size:small">it
                functional ?</div>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Updated the comments in V2 patch including the services status when
    secret service is enabled .<br>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahU=
SNM1i=3D3OAcFFtF+-EqmQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              So add secrets PACKAGECONFIG for libvirt and conditional
              removal the new<br>
              virt-secret-init-encryption in the libvirt.service.<br>
              <br>
              Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.=
chi@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">zhixiong.chi@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;recipes-extended/libvirt/<a href=3D"https://urldefens=
e.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjK=
fSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0seih9UXkA$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git=
.bb</a>
              | 11 +++++++++++<br>
              &nbsp;1 file changed, 11 insertions(+)<br>
              <br>
              diff --git a/recipes-extended/libvirt/<a href=3D"https://ur=
ldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-=
a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0seih9=
UXkA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libv=
irt_git.bb</a>
              b/recipes-extended/libvirt/<a href=3D"https://urldefense.co=
m/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb3=
21z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0seih9UXkA$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git.bb</a=
><br>
              index fbee9c5b..3075149b 100644<br>
              --- a/recipes-extended/libvirt/<a href=3D"https://urldefens=
e.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjK=
fSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0seih9UXkA$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git=
.bb</a><br>
              +++ b/recipes-extended/libvirt/<a href=3D"https://urldefens=
e.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjK=
fSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0seih9UXkA$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git=
.bb</a><br>
              @@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] =3D
              &quot;-Dfirewalld=3Denabled, -Dfirewalld=3Ddisabled,&quot;<=
br>
              &nbsp;PACKAGECONFIG[libpcap] =3D &quot;-Dlibpcap=3Denabled,
              -Dlibpcap=3Ddisabled,libpcap,libpcap&quot;<br>
              &nbsp;PACKAGECONFIG[numad] =3D &quot;-Dnumad=3Denabled,
              -Dnumad=3Ddisabled,&quot;<br>
              &nbsp;PACKAGECONFIG[nftables] =3D &quot;&quot;<br>
              +# Require systemd to add openssl to PACKAGECONFIG, so
              disable it at default.<br>
              +PACKAGECONFIG[secrets] =3D &quot;-Ddriver_secrets=3Denable=
d,
              -Ddriver_secrets=3Ddisabled,&quot;<br>
              <br>
              &nbsp;# Enable the Python tool support<br>
              &nbsp;require <a href=3D"https://urldefense.com/v3/__http:/=
/libvirt-python.inc__;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvf=
sD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmGBSG0scd3pMLYg$" moz-do-not-se=
nd=3D"true">
                libvirt-python.inc</a><br>
              @@ -225,6 +227,15 @@ do_install:append() {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;mv ${D}${prefix}/lib/systemd/system/*
              ${D}${systemd_system_unitdir}<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;rmdir ${D}${prefix}/lib/systemd/system
              ${D}${prefix}/lib/systemd<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
              +<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">We n=
eed
                a comment above those sed expressions to indicate the
                final result.</div>
              <div class=3D"gmail_default" style=3D"font-size:small">i.e.
                service is completely removed.</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Done in V2.<br>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahU=
SNM1i=3D3OAcFFtF+-EqmQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">But
                again, back to my first comments. If libvirt is enabling
                this by default, and it</div>
              <div class=3D"gmail_default" style=3D"font-size:small">isn'=
t
                doing some sort of runtime/buildtime detection, is this
                really the only way that</div>
              <div class=3D"gmail_default" style=3D"font-size:small">libv=
irt
                has to disable it ?</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Add the benefit description about this approach in v2.<br>
      Provide the opportunity to choose the specific configurations they
      wish to activate,<br>
      thereby avoiding potential PACKAGECONFIG conflicts between
      packages.</p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahU=
SNM1i=3D3OAcFFtF+-EqmQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div>
              <br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ! ${@bb.utils=
.contains('PACKAGECONFIG',
              'secrets', 'true', 'false', d)}; then<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; se=
d -i \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; -e
              '/^Requires=3Dvirt-secret-init-encryption.service/d' \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; -e
              '/^After=3Dvirt-secret-init-encryption.service/d' \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; -e
              '/^Environment=3DSECRETS_ENCRYPTION_KEY=3D/d' \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; -e '/^LoadCredentialEncrypted=3D/d' \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
              ${D}${systemd_system_unitdir}/libvirtd.service<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
              &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; # The /run/libvirt directories =
created by the
              Makefile are <br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9692): <a href=3D"https://urldefense.co=
m/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9692_=
_;!!AjveYdw8EvQ!Y975dNSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3Ugwy=
X7V2hTcxDpEKATrBh1p0-RmGBSG0seQbx4qdw$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9692</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.yoctoproject.org/mt/118773077/1050810__;!!AjveYdw8EvQ!Y975dNSr=
iLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-RmG=
BSG0sdUIwrPoQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
                https://lists.yoctoproject.org/mt/118773077/1050810</a><b=
r>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!Y975d=
NSriLr4qezC-a4SpzjKfSb321z98fJvfsD2uPXGyVgpxiwy3UgwyX7V2hTcxDpEKATrBh1p0-=
RmGBSG0sd8XqPZXg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"tr=
ue" class=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not fol=
low
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------ldS5hLwM5BntnJuarvT05CQi--

