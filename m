Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.52])
 by mx.groups.io with SMTP id smtpd.web12.10894.1612543235118787950
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 08:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DJxc5Z/K;
 spf=pass (domain: windriver.com, ip: 40.107.68.52, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtQZkbNUbc9byBclHdxSVZyjMZoomVAZDaFNYuOUSSWGUcFhLRq8FHUXYXm6KnavkCTTrFw4WZglmye5RONTyCdYqPqetJ8K2JuBEOuWp/HOpDFLCuoY8Qwk70+0ZLLRvDExKMRy6ccINpPQTtClNwiK5eMKQ0k3OsYkTd/4xyAFmbEb5YZMNs26h/MzQ7VI4UbdBgm0D2EzFGdOYv3ZGlmeVeiQgzlMVtHlOVBwj9ovKRXExNXW21AKSeR0rxq7xEan5JY+fvI0cEDmgnqTP54OrgrRZmcG73yYPvKQtW2cGF4VUp6fDMKMgYiNfEBsUkqc8amcU4UouCZa77LxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfykpYf3eXxxTVQ6twi/Sy/HXD1j61TYvzrc+SWcuO0=;
 b=a7RvnTKJKbHH2uv+ATM9oEHNPYdS1v1I26pePT5AahLUybcQKt4Q0Ix7kh+yJxSA9/an1Rn31Nc99x8gOz1KvIx7+lPa5f7RpjPkElqrdmHq7NxFc5WRNGE2hIyNEcdm4GxAcSN48PDXdvZXfmqKl5A4pAdRcl5DeORjO0TMz88wlJKZn1/X+awDKvEKCLyh/D101mWjG7yieNPFMcXh8GUOm6aKA4Ff7R1s8O/sGUPDBLmGTE0wSQtOaK8R551Ma8eESwFui/C8Zm1+OQsTrgBJhpM/kmbO0o/io45gP/S6cDnuqygSwBg0bfdRmr+k9LogJyu1yDqAcH7Od5sYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfykpYf3eXxxTVQ6twi/Sy/HXD1j61TYvzrc+SWcuO0=;
 b=DJxc5Z/Kjl65Uk1elJvQY+RXzsgv+ypkI7/KkiKp8GoZ8dhMqvEXFmM2QnytBy7JT/h0kKCtOrVFztODP/iSW5vTmYwV2yoaero2yawUzM/ZB4tmVfAiAGAgLKLgworqqnRYH/cVf8RglNVWfpVrQigap+I37QcVqBFV/TtlHDk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 16:40:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 16:40:33 +0000
To: meta-virtualization@lists.yoctoproject.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Yi Fan Yu <yifan.yu@windriver.com>,
 Mark Asselstine <mark.asselstine@windriver.com>,
 Khem Raj <raj.khem@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Subject: nagios-nsca -> libmcrypt: autoconf-2.71 update
Message-ID: <f20096a5-96fc-b7d5-6c16-f67eb1e849b0@windriver.com>
Date: Fri, 5 Feb 2021 11:40:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR05CA0159.namprd05.prod.outlook.com (2603:10b6:a03:339::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 16:40:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9de78a5-9d81-4e01-a4f0-08d8c9f4c1ff
X-MS-TrafficTypeDiagnostic: DM6PR11MB4721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4721F1BED54364BAB86FB07BF8B29@DM6PR11MB4721.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E69kfLh7zHZmjFnyRIh4f0q91gne83EiCJH3sPxwk07sa8DmssNYDuG7LZPTnuPek3Flh4nnSrWvRJT7J9e1ZDJr7Rxvus4fAALwmCRf9lyKGpZixsk/nJMsMMdXuvahqZSYPURnarlUkQZZGYnurMg8sOLxXnTwR/cDzHmg13U1OG0ffz1j1eo89ORUoafRX83KKznodJ1aSgU+Z3edT7+Sd+99KuQqjewKfN23po2+kZXgn3gVxfucAUZ+jyidFh5ospZuZgn+QOYs1Ww6VKaXWZbpJbvC1bwOW9iDeW/yccXPHMvzIc0mUN8/B4Y2tJBtQO4rzf7eggdUoFnwbyknf+T3Ym9j7jI4nUB5q9UZzF3M5L/5qd9oI9Jqw97rwq8MXtWxROJBDX7ogk9s+Vz7Q3BDbrOgd7vTs/D62Z8Yga7Llp6RSPsP9jR/wJ7zeR+SRPCo5ra4gwmkHjb54Gd5s3xVojmyj3TqhhOgivtNRJL1wrZMwD9a7RSevE4wedb2kbAKM9xVUREVWhBmAMJwLLwNjUWz6S5cFvLE9eHUAiGP0gJOOHY4RJHyObvKb/5CLl1fvZRpwQEDR054+XHL2j8laxJTo8tAnhKwGEqjNCWe0sWwJ/0ddG12RFAB+SXWuveeWSxxa035GCLvGukgXaBz0xMzt/bNtsIzaCzX0qp32Jk7sS1YC3/jpOzV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(15650500001)(31696002)(2906002)(5660300002)(478600001)(6916009)(8936002)(2616005)(16526019)(966005)(956004)(26005)(66556008)(66476007)(31686004)(186003)(52116002)(86362001)(6666004)(83380400001)(4326008)(54906003)(8676002)(16576012)(316002)(66946007)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TEg5ZWRsNHFmNG9MUnU5VkROQkdDa1FlRStHZXovY2JNNlZjV05tZzlKKzA0?=
 =?utf-8?B?VmRBc0NNVTJkQXcycjEzcTZiMWFsbTl4WW1wc25ESW1YY2FKVU0ycUN4WG1B?=
 =?utf-8?B?cFFrMnVTVVIvKzJ0eTgvbzlXOGRLNlRFb2wyVkZoUTI3U0ltNDJ1YjhJUlF4?=
 =?utf-8?B?ckg4bW9KMEdHOUxiYloyN20rUzUvK0NHeENOeVhzSTZodzN0Qm83b0RhK2pY?=
 =?utf-8?B?MDlUc2dFaUM1NzVvb1l1NWFWdVZMUCtBamVsdkJGNEVKM1BOZVhIaTlCNFNw?=
 =?utf-8?B?RXFrVlJYb0ZsaWVhYmcvZkxhOTNrbE9ONndsNUUvUThpTkdKbGJmWWx5OTFI?=
 =?utf-8?B?Yk5jYldpZGJ3SFhRVWNXM21Sb3U1MmZ2Y3pXbFlzQStCb3hoNGk0dUJmV1l0?=
 =?utf-8?B?NFhudjF6c0F5NkZ2Vmx2bGpvZDQyQkttOE5LQWdLcE11M3k2Q1VaZHlnQUYz?=
 =?utf-8?B?c3ZsbFk1d20vbkpZOHNXaThQblljRFMrdVJndjR6cE5jSW51Y0VRZzkrSTlU?=
 =?utf-8?B?VEFuNE40cUIzOE1QOWxja0JRYks1NFpWMDl2ZTJibm50VVF4R3hFZ0xEaFdh?=
 =?utf-8?B?blR4ejJ4WkFRYlFWQXFoNEFHWklsaDZWNk9mRXZVM1pka29YTlFaMHJCMFQw?=
 =?utf-8?B?UDFySy85RE43YzZaNlR3blZtZk52MGJYeWpIbHk1SkhvUTVzLzlxYUJFeFRN?=
 =?utf-8?B?cFZhRklIc0p2bGpnc1lUeE1EV1JKMU0yTUI4MVJubTJFQzU1RmpFOXJDTk10?=
 =?utf-8?B?Y2VVdFB2cFZHeFQ3TGNvODdvQkRqTEpYZTBlZk9IdTEyRlJPcWVSMHpST3RU?=
 =?utf-8?B?LzFYYzlHOUVqWmRYcWc2d1IrckxTSHBqd2J1dUpqaVlWZ2JGOVBXUWwreTZa?=
 =?utf-8?B?Zm0xZ1VZNXFEOTBBeTFPVGJadUt4QlFQQnBIdzNQRzRRbGlQM0VCMWxES1Y5?=
 =?utf-8?B?UEVFcEpta1plcDBHSzhaL2UyV25EMHg1UFRXL3l5MUFUZW9RSW5QR2xhbjZX?=
 =?utf-8?B?akFLOHRQSjdHT09tbTJmQ3ZPZFV0ZkhNQlEvTjVRbS9BTkpoN04xNVRLTGlX?=
 =?utf-8?B?THJVWCtvNW1XTWh0dGRXN1kyQk8zcmM5Y3RucEdBb2ZmaGFHMHJCbnFkSlJK?=
 =?utf-8?B?NGtJcDZXN0h2MWlOMGh0SXdhT0FSVzB0b3JianRNZDlxaTd3UUlxQ0ZESFp6?=
 =?utf-8?B?dFZ0QllrRXJpVXVLWGJGeTdFSkxRTUtBRnJadk9mbkU1Q281bHE3TC9melRo?=
 =?utf-8?B?TENRQnBhQ2dlZGt3WTBZT2kvMHBGZ1JWd0hnNC9Bc0ViTjNWNUhNZi90dllJ?=
 =?utf-8?B?czl3R3g4Z0VETDRDbk1QZ3BPWTd1UUd1TDdsdlorT3lSMDhWRjdwRTlwMU5h?=
 =?utf-8?B?NE43SEdIWURKZUJtRUtpSEJCdlVzZ0UvR2VGQlcwVjk3N1BlQVJxRDNSZFFn?=
 =?utf-8?B?ZW4wTUs3MDAvK09pNktpVjVXV3NNVGQwa1ZBYWJMZEs5a3hCVzhQSWNPR2dP?=
 =?utf-8?B?UWd2b3RkOHJKd2QxVDFsdnpJSkpORkszZk9pZTdDOExZSnJBYmkvdjJ4RXli?=
 =?utf-8?B?TnJmTk5EdUpmR0JqT01sOVhJV2l3SXVPZDQwVnhkNmI4cmlQN2sxd25zeFVK?=
 =?utf-8?B?c1R3NUVqYmZqTGVmQUdMRFYrTWMwZXRUZUdJbVdNc0JDL1hoV0trbEdnY0lh?=
 =?utf-8?B?Um1DK0VOTFJacW05MS9CdzVmOTNDR0lUUjJqaC83TndQRUdKTTBZQThReVk1?=
 =?utf-8?Q?nH97XytHF7irONNJhEd3Cry8qQ87u+5FUIL9DEv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9de78a5-9d81-4e01-a4f0-08d8c9f4c1ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:40:33.7764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9eMA1vgoMUwLm0UZdQbj7mXFHaKqABQvVIGpdBmweYyLS69hdZ9lxQmjZLoH7Cjdp8THEMSBMhMN/mHh7bqGlmhv3FzGTG7Q8N25wIIvJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Hi,

oe-core has an update of autoconf-2.71 in master-next and
there are a few packages in meta-oe, like libmcrypt, that break with
the new version of autoconf. I looked at the layers that I have on hand
and only nagios-nsca depends on libmcrypt.

The newer release:
     https://github.com/NagiosEnterprises/nsca/releases/tag/nsca-2.10.0
hasn't replaced the libmcrypt dependency with a crypto library that is
actually maintained:
   https://en.wikipedia.org/wiki/Mcrypt
   "The last update to libmcrypt was in 2007,[1] despite years of
    unmerged patches.[2] These facts have led security experts to
    declare mcrypt abandonware and discourage its use in
    new development."

What should we do with nagios-nsca?
1. drop the encryption?
    This is a bad idea but we might have to do it anyway and warn users.
2. drop the nagios-nsca and replace it with something else?
3. Fix libmcrypt even though it's considered to be abandonware.

There is an issue open to use AES encryption:
   https://github.com/NagiosEnterprises/nsca/issues/5
but it doesn't seem to be going anywhere quickly.

Any other ideas?
-- 
# Randy MacLeod
# Wind River Linux
