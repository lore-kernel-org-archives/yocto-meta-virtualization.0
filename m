Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.11365.1636692589244319597
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 20:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NIiXwJ0C;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6950af1939=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AC4nPsj012332;
	Fri, 12 Nov 2021 04:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZioVMn77I1JTwm7RcsCJBxwjckt8DOYBV0e2YqNr+BA=;
 b=NIiXwJ0CO/dfROjF37wX6gaOwoD/9lznqT9FO6sNuRXFfVOzTmR/QBSkpLqRpouu9bgh
 WbGyyydWH0mO+A3atT2lOh7eXrbwURgvekyba00VG+zv3O37GTZfO3BrqlevkqVeNTDk
 7qljwvEVACbIHL/0Yznx023sg5OsMU0gP+dBRU5J8L4IJg6lI/dElb5J0OjPH2m5ZrTh
 vMVL3rRFdqARQ1voIWqvBici9aAg863liqxO2Z3xZhR8iuhtrlFmQ2bmgs/qaWevT6fM
 ibNusBEih3QvMMHGXBU0NrCqLACWnuqHMYaUVfeG7Xq+rrKCYsXJMk0cBnDVbSX/Zcjo 6w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c93ss8nbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Nov 2021 04:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu52ODxQGQlDoKOpduXerg7ueIcmGQa4WbavU4hxvPE9sr/ixt2VSN3Vr8GxE28p0ZYBI48p/jmOW2u4hYyzRovWqf8wMmMLZJLukLn6ugJknu99xIYxIz9b1J4owk4N5qDDfaka8/4TWPfj8pAeH/NQyavTaSA3uh6mJEHD/o7fqisLYUxpaCf9vHk7CPCp0b/jN5R+v2BZ/rkelEiloBqTKlR58dbPbIPAHfJ5SENvf+uc4+4zxy0zTA1pwCtc7+5pEX2eL6j1bCFShjIwjlVYWc0WH7mD9TYvBSogafIGI0RSKUb1sLjXNKlufF8ww7h6hgDdX2Z8+b3NA+YmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZioVMn77I1JTwm7RcsCJBxwjckt8DOYBV0e2YqNr+BA=;
 b=IpU+hCuaJSdKHM9W5lwXtMgikI3fXeWtzQZzQ62QkTLUJXcVV3odlVcpYmtJggFjgzWtChjXtqM1sFTbjg5Fh3CBkqLsXZy4bq+o7j1sgQ9ZqF7mpFtc8GrQ3zshh1dAo8vglEzmC6P+SFqJyXOU0vSYWh15YL5SJpyv5LEzipI0ULkFxYhz37KKIR3nXJfGRl70cT2fGxkIuNNIiSneIvYXpXJKptZLNgxj8K434Cn29F37AHjqCLvGVL3uvPm8Qqou2j0eEP/A9cLeIu0xxTAtC+6TDerJcQcqbCJSwF6JqM6IOxG3MZnWuZ9U7Y+7//9gxUif+40wyYT15GB6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 12 Nov
 2021 04:49:45 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%6]) with mapi id 15.20.4649.015; Fri, 12 Nov 2021
 04:49:44 +0000
Subject: Re: [meta-virtualization] [PATCH] libvirt: do not install /var/log for target
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20211112032335.5922-1-kai.kang@windriver.com>
 <CADkTA4O6W8QHsSrsWuc-_CM8yBo=QgcVBBynOj-92UbWwftNAA@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <bbb475b9-d49d-576f-5a70-8dfc462582c6@windriver.com>
Date: Fri, 12 Nov 2021 12:49:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADkTA4O6W8QHsSrsWuc-_CM8yBo=QgcVBBynOj-92UbWwftNAA@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by HK2PR04CA0046.apcprd04.prod.outlook.com (2603:1096:202:14::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend Transport; Fri, 12 Nov 2021 04:49:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35ea8c8b-2449-4980-0cdb-08d9a597d8c5
X-MS-TrafficTypeDiagnostic: CO6PR11MB5652:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56521965F6CE917E0EE9B74195959@CO6PR11MB5652.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iBlyaot3IdPLatfxpQXk42JbNQ7SAprn5jMyxaAOu2td7xWVtAD+1cZrapR4fi/GHDrcnaPdideFlhYuLXAkobzJq7Iul3jH1XWtobkG9Myy2vaQHdtRokLFhcD+tXADIi0Mjs7FO4DiFy52kHJMghKA/tvoFMr1nqwMIkUFV7yZucfXUtVhnMnZzwutGgprmat8kfti2lnOPOhLoqr15/Hy+VB3qipeKcRtYF5hHo1WDEQu/JnT0VlQrxSt5Tu6EAKo0314n8zzizTjU6k7Vpi+kBwl4AFuyYFXViaC6+3vGlPACkZrV7R00tZnDfXhb3s0ADFDV0RDjwFeasamb8YeFG3R9negVSeWPAnOH+YZrXTYAJW4T1dMZJp3JyMdEfXuasDfvA1ME4+1YLGb/keRU0jFP+QP5PTliOn0ZS49TGp3e5Jo0+yR71PnTh/pQfITnCiB2Z+6GgJ+I5wZuw6EbQ2MnzFvNnzrVB9SZvnRsi7NEaEuyQgVi8n7FRmCFZZtF61bRJAYBIfhjmE6rSQKsctRFj8eyx+CONOwLZhlbQjT2buOlMrBLba8jK8iHQhblnF9IngB2nzzrPoyHXLYzeIyGzjT6YFD5ACESxHgE7jGCoe80E2pLpxvgdl/hkXnIjJA3lHdyyRdTGMu/d/fXQIC1NSCZJKo+4aVNiUUpGrYkdTA5T5De7YE/+KAVFbN7nLH5Og+AUiL2h6YUIWfxPIUacOCVu2Lwk0qrsYwot/90Y6wX4N97zQO4rH5mHENd0mCx2faZQ9SWpM7XliwThqeUZ4vcyEFgiuvAc5erHK3mGfLApGzElR5Fa6tuFlxqTOAwhLxkNkhrV4hz2dmyakRrtg5pNIHduWke+iRuWnjhy2zBLjvsbtYpY9V75QbOj2RvvYpmxZSOXh3UCOao1eAIzl2YZtO0rmZgl8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(86362001)(2616005)(6706004)(26005)(966005)(52116002)(53546011)(186003)(31686004)(6666004)(6486002)(6916009)(36756003)(83380400001)(16576012)(2906002)(38350700002)(66556008)(8676002)(4326008)(5660300002)(316002)(8936002)(66476007)(66946007)(38100700002)(31696002)(508600001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHdtQlJzN1N5YWxYUDhsdW0vejZmTERtZTZzeHRiT3p5ekhXdTJjcFFybFVC?=
 =?utf-8?B?c2ljYjd5ajBPdjl4N2pObUx6U0E0YUsxeENJMkRjZTBFaVdGaVpvNWFrSU9m?=
 =?utf-8?B?VXpwQks5M0dTQlFBYTdFQVRub1FDQVFSeTBubDhqaXd4RjJNS2Y4QzI0VTlw?=
 =?utf-8?B?cDJCLzdpUG9YVU9EaVRDZzlsMlBuL3BCTzQ1ZDV0TURkOWRnTnJGaWFYY3Vi?=
 =?utf-8?B?bjJmSTkza2ZNVm9tSXE4NThYSlZHazJYTEZaN3M0aEY1NG1pRzR6MkI4c2g0?=
 =?utf-8?B?VVZ6MG9KMVhHdmMxK0puNTl3QkRrWjZscWJ5Q0w1enV0bktJa0prKzFGTjdh?=
 =?utf-8?B?MWFzSVVOUnBlWmJ0RGNSWkNqVVpzT0dBRDZtMmg3ZnZJQkQ0cGFWMHZJa0tB?=
 =?utf-8?B?Wld3aWovSnYwM3RRNmhFN1QvTEN5dWFhZGYwRFJMNmRDcm5WRzh4OFJobW5I?=
 =?utf-8?B?dzQrS3YvaVBiZXQvREU5b29uTzdsVUpoM2l0cFNraW9BdHpsdkEzcG5hcmhx?=
 =?utf-8?B?bk1DK0g5eWlBbDBiUERmTWRVTE1RVEdud1ErNlZwS2ZxTWhFUnRodzhVZ0JW?=
 =?utf-8?B?ZGdyVVpYazJhcUMwTnVjZ3VncHczb2xYZEpGeDEwdlNXaHRHdkRlZVI5bkNO?=
 =?utf-8?B?NExFOFdjbE9xbk5qdEFyemNsT2ZrUjNrRjFaWjREY0RuM3p3WVJoQWg0MXRL?=
 =?utf-8?B?cjdtWEp4bUhJNXlPMUIwazlGSHRwUmRvc1dSZUM4Mlhhb05uMUhsaXk5dzdw?=
 =?utf-8?B?eFJCU1d5eDBTQlFQWWZYM1ZOeUNBYzkraFFNNm8xN0RuZEdXN25nVTY0TjVV?=
 =?utf-8?B?OFpvcjJ4Wm5GeUdvY0dDaXBhT1kwWjJYcmFPb3grV2JZUURwYU9VOVRKU1Ry?=
 =?utf-8?B?ZVFSSVA2UE9QVmJUUFVQY0swZG1PV0JrVG9sTmhObkVtZ2NKYituR2dLazlY?=
 =?utf-8?B?V1hPVGNiT1JRVkY3c3M0S28xTUVuaHFXV254VXJjbVl4TTN3YlYxamwzbCs4?=
 =?utf-8?B?MGJCZzlPRDd5WXJCeVVxamxjWWp3c2FHVEpMNk5JdFVKeFY3YUNNK2IweEJv?=
 =?utf-8?B?Yjc4aGNtVEc0bHhkREpEa1ZuVU04ODdGbEdBMFY4WVRzQmtkbGQyNmtMc1Rs?=
 =?utf-8?B?cDYyckp5c2s5SXIzc0gwMzlBR0VMekxDQko0bEVDSmxOZTQxTXBDZnVQdFgx?=
 =?utf-8?B?MVhSbVBnZGxTSURxb1NyRHkwMnBzZ1RNWHFWbGNzNFFhLzlYWkdVcWFRcFI5?=
 =?utf-8?B?aUZzMnFKNEZKK0FUSm5XZEM0QmhyMEM2VlNQSHQ0Z1RpYjJpOWJkSU9KN0Ur?=
 =?utf-8?B?aUd5SndXNHo2K2pmWHpXbGJyY0xmMk85dnEzS1FCWVMvSVNKRDh2Y3BFSklH?=
 =?utf-8?B?STNad3Baam5BTVJjTFhKKzNSaWhGL1BKOWdYNU1RcGJJYjdCTWpESWJmcFlT?=
 =?utf-8?B?d2xPN1lZL0lFRHY3amIrK2VtSmJJcE9DMUVXQUJKcXBRL2dkbUNOLzVtWHZZ?=
 =?utf-8?B?YkNZai9iVGRWQzJYblJQcERmeENycXNnOXRGOVU5ZG43NC9EeVBOWXJOWW00?=
 =?utf-8?B?eU1NdjFyaytjeGJjWFpjTVp6azlydG40eDJkdXIydy9GbWhoOVVzK0ttYlhM?=
 =?utf-8?B?Sis4QTFKenYzamxJSXd4SDFaM0phbkJiUGRhQ3FKOHhoVVYvdFdVRWg5Yysx?=
 =?utf-8?B?Nm8zdWRzSWpPYXdhOExiRnBSVVo2cXI4djRuaFhpT0NKTFllR1l3NGxlUG5L?=
 =?utf-8?B?NXkwcFIxZVcxWEVBZFd0VGFJL0tJMVhwc213RFM5OXpBRWx1VkdmbEtTNWRH?=
 =?utf-8?B?VU5vSlJ6ZFFpM055dGtQVk5RR2I4ZFM3aW9OYTI4Q3grUW10S0hoYXJ3ZXUz?=
 =?utf-8?B?STdMR0wzSzk1bm9kOU5VYkF2K01VR3BrZXpDOU9sUENLcEdBUjZwUGdsYlRK?=
 =?utf-8?B?VzhzYmRnbHl6N04raVIwOCtwMUpoVGx6K1ozYXczL01Wdmw0M3E5TU5OTk12?=
 =?utf-8?B?Vm9NNUFxRk1samgwQXdkTFEzVC9xR3FTYWVmMzB4emJzWENtWm1xTmZWQzJF?=
 =?utf-8?B?ZEpmTGlEb2dFeFoxTVBia3dFQ2VJcmNHRXpEd1Q1aUlwTG1pL1hVR2p3TWxu?=
 =?utf-8?B?ZG5UalNZVHh0ejRhMXladWVzdzM2UUZSaVdpYi9Fb29pRTdIVDdtVHNOVWYw?=
 =?utf-8?Q?aF2RWCJ/gObsD6O96wv9gec=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ea8c8b-2449-4980-0cdb-08d9a597d8c5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 04:49:44.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFFSSYuyhIK7in/Y58kdholLEhtWOaDzYC9OHFsf57OD5h4y+qK8/DjYue6vmXFECiPLJcWHyrOYZjSwvQ/fDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
X-Proofpoint-GUID: z_ZDbs2ZtAHU_XtSfDliXhczTU86TID2
X-Proofpoint-ORIG-GUID: z_ZDbs2ZtAHU_XtSfDliXhczTU86TID2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_01,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120027
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/12/21 12:03 PM, Bruce Ashfield wrote:
> On Thu, Nov 11, 2021 at 10:23 PM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> /var/log is normally a link to /var/volatile/log and /var/volatile is a tmpfs
>> mount. So anything created in /var/log will not be available when the tmpfs is
>> mounted.
>>
>> Not install /var/log to avoid 'empty-dirs' qa issue:
>>
>> | ERROR: libvirt-7.2.0-r0 do_package_qa: QA Issue: libvirt installs files in
>>    /var/volatile, but it is expected to be empty [empty-dirs]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   recipes-extended/libvirt/libvirt_7.2.0.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
>> index b7f8383a..b49bd11a 100644
>> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
>> @@ -232,6 +232,10 @@ do_install:append() {
>>          echo "d root root 0755 /run/libvirt/qemu none" \
>>               >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>>
>> +       # /var/log is normally a link to /var/volatile/log
>> +       # and /var/volatile is a tmpfs mount which should be clean.
>> +       rm -rf ${D}${localstatedir}/log
> We should be preventing the install from happening at all, not
> deleting it after the fact.
>
> If libvirt thinks something needs to be in the directory, then we
> should be looking into why it does exactly that.

OK.I'll figure out.

Regards,
Kai

>
> Bruce
>
>> +
>>          # Manually set permissions and ownership to match polkit recipe
>>          if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
>>                  install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
>> --
>> 2.33.0
>>
>>
>> 
>>
>

-- 
Kai Kang
Wind River Linux

