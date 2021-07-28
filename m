Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1966.1627497430817122914
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 11:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VxRrErbN;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=384319cfa6=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16SIJ5Qs029723;
	Wed, 28 Jul 2021 18:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=to : cc : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=cDCV2Xsd1OZqS4Pl2NoEBU4xnDpF9OKdhuvjjucchZE=;
 b=VxRrErbN/OCcsTHnXEjRd8yWZ9GlO8ls0sGIWuwvYIZuQ1EP2FZvE2XOgKLSd+umXLOT
 hhV2KNNORDU80w3FdaLbZ06TgldPhC++yAOxlAJ3hZAWL1AsG2ctK0VlrWO+phSRb/r/
 1+md5tOBlm4BnLwz+8Het7D/3XAs0/faMW0vE3DOVPbHdjOWuvcanK2E0deEpwF6kPI1
 1WPxC0srTmbFU9L/xiaJIG3kQLa1SlXO2BOjsn6mQ4cIRyC+qzddlbAkWZNen8rI13NM
 D7D62MadLWxRZTO6sGGATX5Q+pHOEhulWIGSyG5SonX39m7pKXpm/8CxeeaTPIgmelZK AA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a34gygja6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jul 2021 18:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIE89exMOwFRuXv6fBtQIh8OnsI/2tHDcJ2neOl4UaI/xvdoBVZpBaXUVuWyzAiC54L4EJtu7F2uJzFx0teroLTmJYHND74ODnDGylkg8/YwUOCxC1nRm88cuCvwI7DWNtbCMWMxSuYbIQKncsfL6dJk8lvG98dIkt922JNJjnf4aLl5Z9I93LpHCmHND8flC1XhYGgN5NJfG15++viH3WSH7sZDoG3WDGZaxI6M2jZzehsOOj1ryhkggK9YCUvF6jvAMP1/Yo0wiccmZ/wqOLIpTWJmPhRr2riVVLz1uHnE+9a1Xms0ek9w4tcBIn4m8G24yZF9VsocoW04cKaqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDCV2Xsd1OZqS4Pl2NoEBU4xnDpF9OKdhuvjjucchZE=;
 b=Cn/BfSfpOSxgWV6c5xvL/aFfPoVBC7IpxH8i+mlWhSazqYHKoMl5OJnzPI5E1Mc5Hq5/+IvDHx+3HQP/3kxAJNZ43LkKUrsZ/NKSdQW1KaQxci5fsvTIHDcIyj205H+rvBWsGhpHF53OCD6c+1NJpWYqQ+iu6kmkavvxwYbU9csPpPWoomvY/de5wUrn68QSdbG9PbijUFc6hCTGpz9tR7SHt5Stw8WIMtyUR9CC/AApfbbc0m8I8NOScsJ7U8vxcMnQN+d0ScJJOHBPWzAtHiJbIn9hGn/EpbJrAXNHyHmh45LyB7IjTJqUj4BPVG+8Ura1wnySKnsi+9pQ8hL0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17; Wed, 28 Jul 2021 18:37:07 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 18:37:07 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
From: sakib.sajal@windriver.com
Subject: uprev k8s from v1.20.4 to v1.20.9
Message-ID: <ea3f1ccf-b659-631f-460f-bc69be735728@windriver.com>
Date: Wed, 28 Jul 2021 14:36:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.28] (184.147.146.64) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 18:37:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b4b8dae-fee8-40cf-1c12-08d951f6b3c0
X-MS-TrafficTypeDiagnostic: DM4PR11MB5294:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5294114D1307505A717E8404F2EA9@DM4PR11MB5294.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZDtoKE8Z3Ep092R5xgOs2cLnY5ANGeNt8fOKuMExwS/E0Xqq8cJg2glmiCMLP+nJ6KcW9PCBtMYcuEg2e+S5fF9OScLLmVnzXYnxE3afCj6QWatKVDx1xgE9LEbemLgL+M9ayeT2W7JNpG+uvMSRx3G2h4Osu8dRuIxuANZHU4h3EC3lFcBzuWIcJkL+w8ZjhR04LVUBSv/QQwttBw1Vr9TKS/quuC+HQ4oOaVdXOcH33//x56EaEOGDQ46SlmO28/8Af+Wnj7jp77koCqylO4//InLLbTuuignowaSVHw8wVJSwGTo1ouWnlIcgxLFspMKSjItjfOoReHrXgAreVBKJ4diiAskaF1Kr5Rma45TWYn8zt1jvj43TLg9l4hqMQAQQ4iFK3P/Z/A5Wuu+eqdgUqq4F02sc1BPH5dB0t+GafEesVgQ5w8sEXTYvDx3YUUCeL1HWB4rMd6kCwgR3tZgLYqi74n41EvJbVTs/oxojW0tELDoLTYfq2W6MRkhIJSdrnfFgLY+J/k6v6JD+DU0Nrzf+wb2ECxRaiCQYOoPJB6AsAFCqiGjEc1qh1n7MA/IkCuZAj0tMzadInCXwiKAJLFH/XsbxNK8nBNAM9azNJyRg8wsVkiuxAHEi/ko/uulHh+rUAVh1tGqUGAT6IFgmQlt1nXLZiwoJOSh0bsCWEXpu2Y5VbW8rBdK2JQnOo1YZ1vRAxZ+3upuQAz0Q4ZWcnCZaG7rpmx7A6jvUPBI+K2sZ1dyxjCS+SlihSFCFlrmKrPG7FRE9SBm96D7kUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(396003)(346002)(478600001)(52116002)(31696002)(36756003)(6916009)(2616005)(4326008)(956004)(86362001)(31686004)(44832011)(2906002)(16576012)(316002)(6666004)(38350700002)(186003)(8676002)(4744005)(8936002)(5660300002)(26005)(6486002)(66476007)(66556008)(66946007)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OW9hVXE3SFlTTVlVeFJtSEc5NFZhNW9nc1dIbi9hSTUvbzRvWW95eG16Qkhh?=
 =?utf-8?B?eHhWTWpFQ0NBc3NUNlB6WWg0UWM3UmhtODBKOHhCc0tjT1FEWXRlWkF6bUNp?=
 =?utf-8?B?cmd1N09KNENkN1JEaGpHSHBad3RxR3VpbVlMOEdmdUxaR3l2cjBOeFhYRkhI?=
 =?utf-8?B?amJCMjluV1lNeFZJOFJ5U3RFUEVVWGg2eUVqZVJSeFcrRExHUXI3bE9xUThF?=
 =?utf-8?B?QzRqWms2Znd2MXdjaFBiM3JzWnJiL2pyaUtPMnhTSm9zem5saHJVeUhWSDVW?=
 =?utf-8?B?MWF4TnNEYWNIN3RKRFpqZWtZU2dXcTBLWVg1WUp1ODRjYk91amxzeVBHOGdV?=
 =?utf-8?B?eWtSVTBIMXdJVmYzbnFXSjh5VWNYWDJVQTdCbk8vK0pkTEFpZWU3dHZxVmtw?=
 =?utf-8?B?SE1xTDdlMkZ2VWhTMkZoajRaWlpxaE5peGtscDJUK25QZldOK1RtY0Ztbnl3?=
 =?utf-8?B?ajhKSUtkbVBKNkhWTlZBVGVoL3JONVR6dHIvQzloWi9pT2hLVlY2ZUY1RmI2?=
 =?utf-8?B?ejFUTC96UUkvSE0rb2d2K25xdmZYb0tiUzVZT0VZZUg2WkNPQmpyMnNubUs2?=
 =?utf-8?B?WlcxNmRtMENzMVR3ckkrNXhkM080NHBqbjRqa2hwT0s0VTZEMEorSFRBeXI2?=
 =?utf-8?B?WDZHS216b1lSVXhURVQ2K0lpMDhQRUQrWFJLazFtcjNpSnU0ZTNiNnFNaGQ4?=
 =?utf-8?B?SjZvNlFKOEJMczBGYi8xMml1enYyM1BDQ2M3K21zV1hpU2o5TDR3VnFOUDYv?=
 =?utf-8?B?REFMbWdTUHJLT0JHTkF6Zm5QMkt1WnNEckZoMFJCK0Irbms3TTN6QUMxRWRW?=
 =?utf-8?B?S004T29odm1nUUh3cDErRWJmWHBEcTV6YlFReHloMytaYWRaU0RYS1BhZHlw?=
 =?utf-8?B?c2dLRmZvTjdNdGY2YWhsZnU3djdkaWxBWmJkZExRcEZaUnZ4SXhpWEVRekNm?=
 =?utf-8?B?amdVZUVjQ2dBRUVEbkZlSGpVaTJtWUIxWU5MMVZPT3NVM1F1U2F3OGlhUE1L?=
 =?utf-8?B?Q0RYaCtRRWVaZTFYVEFsTEE2Sld3WUI4ck9VOWE4VUdFSmtzOTVlYU1TZmxZ?=
 =?utf-8?B?V0VRcFRBY1A2NUs0YVg0RzdjS1FrZW9kOWNWQjRtMWxacUpLNEowSm40eHBW?=
 =?utf-8?B?MjRybnh1ZVQ3ZmNuS05lY3h0R3p5T2JkMlJyV0F5MGxyOVlsVTI0YkNxakVK?=
 =?utf-8?B?RS9GZUtUMXYyWkc1NlE4NUNxMlAvcHMyT3UrSU9oY2NZS25oSTFSY2FnYmIy?=
 =?utf-8?B?aHZYSnFSeUpUZzFEeDR2aVZqdEdJSzF5cXBwSmJRYldhcFdBYW9odmxISXpF?=
 =?utf-8?B?aDh1SFFtL0UzcDJjL05jZ0Z0VzJEVzVUYWVlWkFWbTJPQzNBQkRhN3l4UStz?=
 =?utf-8?B?dE8vWmgzQ1FzV21NR2N4VzlnRTZqaUZ1U29GVnNWM3VmenBBWVd3cGwzOVRP?=
 =?utf-8?B?R3hEeHJLUmMzVnJiN0c0TWxIS1JLOGZYakRib3IxQjhmUkVyc1FDbEVVQjll?=
 =?utf-8?B?S0R3ZkUzZE5IZ3FkQ2tmVmRNN1RlUTcrbDNoRXNUQVJ6VGV4Z0IwYms5ZXdQ?=
 =?utf-8?B?MEt3UXlMdjIwYXkybnJFS212NGZHNllmQzZocGVwNXpkTk1OS2hkVGNlSWJv?=
 =?utf-8?B?ajRyVkhhRjlvVWpvU2Y2UjZSbDExMndHbkRWckx2R3VMSXpnb0ZveGxMakpp?=
 =?utf-8?B?VE5EeCs3U0RlUHMvWFNTdjRYcXd3Q3R2UXN5ckt1MW9MRFhsNEZDLzZrcVBj?=
 =?utf-8?Q?20sT0FzZt7eX1KjosPnqhHhEeAGKLejCr6exXqn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4b8dae-fee8-40cf-1c12-08d951f6b3c0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 18:37:07.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBEZaGinbSqNlaVsGg+OZ7FDBocO4Gq8Wm8Rvrgcyy2WksELSxWlloglEor5SdKw/HLzO+lZ1loe7wSijS+/NwRTYA36O4F2zHq5IQ5Qglg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
X-Proofpoint-GUID: -gV4oiosdY0xUYPESWI4VJ8GKaispdWv
X-Proofpoint-ORIG-GUID: -gV4oiosdY0xUYPESWI4VJ8GKaispdWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-28_09,2021-07-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=707 priorityscore=1501
 phishscore=0 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280106
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Bruce,

I was thinking of upgrading kubernetes on the hardknott branch from 
v1.20.4 to 1.20.9. This change will bring fixes for CVE-2021-25735 and 
CVE-2021-25737 as well as other fixes.

This will bring in 309 commits:

kubernetes.git$ git log --oneline v1.20.4...v1.20.9 | wc -l
309

I was wondering if you had already started the work or should I go ahead 
with the uprev to v1.20.9 or any other release.

Sakib

