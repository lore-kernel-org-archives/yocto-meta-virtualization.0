Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1363.1605061423122997742
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 18:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i5qtQieQ;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: yanfei.xu@windriver.com)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D326E38C129F
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 18:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIaFCxfWj19+lUujI9j+x6jOQ1/FqgnPFcmfB8yXFe3dLfqToltk3SfeYaIYrWkaK3qtwUOiZyYC6LQWY7twRmdGat5fmNuDxsJoFiLcLCaIWQ2nOKK/6832Uoc86J4LePAUgGVNXkIRKI7778g2oSiMJKpXsdIRdQ8WqwHZ4I0wVJ6dNFZaqxgATEgSCLt0PHfZGxP22FGdstUPx3zq2WEz4G/FCnUQsiN2eyQmYNDntl68/JiScOJLPuYa85imTrgNyc90fHoVWM3jG337y7JIUwpX2DkFhYfr9DKaHKI/ChoRUvD8cF3jCY67L7srma+7r1T3awPkjxTIkN/CyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75MY+f+wcDfomLB4cExC1Ux7573mtIIyrOWYzkBoTug=;
 b=NgvaQpMRTDgSUht4aOGGw1JESPzv2OEfg8dDIU5NLvATTvkwFx98OLut1hjlBtlW6Jakg74PqyRHsEhcJwN+Da0pTkQLb955F49+Cnd6s/ZJ1SnFhE3MAGfNT+q0DO64HJ5lntQnLgdWZE2wCeDEEYZJ0N9G8WI+8JZQuRaUT2FCUX2KRdhHAFdpL2tNwHKHPnER9bXNzC7IzPT2jMcBVZ3QmmZZhISbvOswLri+yCXiUSB7qizUVrWBRGko2eTCyvI1kcZS+BWphxXJN/tH42pM0P58cynq2gwz7w5HqaIOJD2Y9MPn9f8KZLTdsiRnDijGKwG9rNhLcwGcu/Qppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75MY+f+wcDfomLB4cExC1Ux7573mtIIyrOWYzkBoTug=;
 b=i5qtQieQwU99u3pdB1rnT5m86XNxeaTDvOuXzoxhXoalGVBpKs+5hXmw27+sjTWg24pCytp+LFgW0+z0W/q6UnMagPinzO/Eg3KC1q/xktZYx/KM7V9ZzH/Yb7Vjjz86EMhj3Bi9QPWDTbOI9RAnWWDFdfjnqUXbwSj4+agC8BY=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3109.namprd11.prod.outlook.com (2603:10b6:a03:8c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 02:23:40 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b%6]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 02:23:39 +0000
Subject: Re: [meta-virtualization] [PATCH] ceph: add support for python3.9
To: Paul Barker <pbarker@konsulko.com>
Cc: meta-virtualization@yoctoproject.org
References: <20201110094641.11352-1-yanfei.xu@windriver.com>
 <CAM9ZRVskHmGkqJQu+WNechg3DiDS_ADCFTRYO=6mbhkmaG5o3w@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <5efe585b-ed8a-3a64-513c-e688eddec533@windriver.com>
Date: Wed, 11 Nov 2020 10:23:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CAM9ZRVskHmGkqJQu+WNechg3DiDS_ADCFTRYO=6mbhkmaG5o3w@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend Transport; Wed, 11 Nov 2020 02:23:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97b86d7f-a36a-409e-887f-08d885e8cd4c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3109:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB310939BDC21CEDAA1BE7ACFAE4E80@BYAPR11MB3109.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iXVn993F6lWYaue79iGqluo2HijIiIDxTOREnhlOdfTGjF+js/3YxcnoET44FZFUzPsLfK9jQrNczTVnqb3Tbip6BPMdS4XsNQidrjAO+xipTS00kT1g8Ps1BmVsFCKHEAZdPZQbpKwtEQZ/XURq7F4SC2rOR6yORR0Ps139Pjq4mb2wH5rYX8bgqgAPo/Xv9Y5lKLXCbRRt8bJvla2pdEelhsyQXXT++PtVXah2m1uP7it9NV2NrSgpUg+pnZqD6DinDMkmY0kmAhRdRKm9LtpjD7QAinQ1Uj91PHR+nZFJ5zbGh17J70kVmoSBwlOUncQ0f3msMvKEkZesy3B9qPAI9U0ZES6deQpmDTX4HU+gaspnc2b+a7qg909sDwHglh2N9KNMUENtbMfQOQ26Sw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(346002)(376002)(366004)(136003)(6916009)(83380400001)(66946007)(26005)(66476007)(66556008)(8936002)(6486002)(16526019)(2906002)(478600001)(31696002)(53546011)(31686004)(6666004)(186003)(4326008)(2616005)(956004)(5660300002)(316002)(16576012)(36756003)(8676002)(86362001)(52116002)(6706004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qm6JE6pAzWzBHh0YebCWmIaSif9pjGFO35fGTjMBdz5ClOfEiydMYnBAWrfvQKPbopki/0nMHqGeP9Jm7LZikYNV4RhNKCRIosOk3SrxlZ99vK5AOIai8j8ZCFyA/c8pQiq24X7y6T78MWfEXwqAW7+gZM2y1h72QV+LfTXn42N2wK4Z+draLRmMW9xzuLYnppGmG3Qx1mXLvOYlpJFyIp+CTNon8LQUjA+TMeUMjVE5+RuZW7SO5RNBMi95imJuWO4bYiuceM7qgYhjltA0bD5+EQel5FFAjLS9cjF761y05RwybWznpoi//MdtBi5875y321eRkAU/lr2N3vVkoiKuq+wlb9F2YknTFH07ZEuOJZfWPtCUpcMoE8RVAciJefBcyX291nVDm7JUX5OLSkPTrAYOPMPKrTYh48Dz79P91MsmRc7l6dqtHZpGu/j8hy1mwBE1i6p59IT+zIFqu/PdyEyb5k+H6XeMMZPN01jdTxI8QqadOB/U1gH05SUcVI90G/rvpSNbwbalLK8LY8bkFy49+bhXU/Pdx7vbQc2/LPNXqI2I2rKrPNP1MFR+64wvrnCGNhugOjfpQ6ilWHBVlamQlxISgeYA+LGO19LOmRWZUh5rNhxkwmiGqsE221BH58YQ0+rzvuGgcrcaKA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b86d7f-a36a-409e-887f-08d885e8cd4c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 02:23:39.7756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgoruqZiNKm9pDOH4wq2HoN7BrdqFEgGFWr9EEMod/CvexNTIN/UTkxX11MZvxijKmfNaxFhJJ37gbShqNnUBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3109
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/10/20 5:56 PM, Paul Barker wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
> 
> On Tue, 10 Nov 2020 at 09:46, Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>>
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> Add support for python3.9, or it will do_configure failed.
>>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   ...FindPython-add-support-for-python3.9.patch | 30 +++++++++++++++++++
>>   recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
>>
>> diff --git a/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
>> new file mode 100644
>> index 0000000..096c9b7
>> --- /dev/null
>> +++ b/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
>> @@ -0,0 +1,30 @@
>> +From 27ac21526eae33a40edb81aef627aa13719fdaae Mon Sep 17 00:00:00 2001
>> +From: Yanfei Xu <yanfei.xu@windriver.com>
>> +Date: Tue, 10 Nov 2020 17:17:30 +0800
>> +Subject: [PATCH] FindPython: add support for python3.9
>> +
>> +Python of oe-core has been upgraded to v3.9, add support for python3.9.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
> 
> This doesn't sound very OE specific - surely upstream would want
> Python 3.9 support as well?
> 
> --
> Paul Barker
> Konsulko Group
> 
OK, I will investigate how to contribute ceph, then send a v2.
