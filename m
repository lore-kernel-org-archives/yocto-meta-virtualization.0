Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.28750.1605491942543540120
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2020 17:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VZCBIk0y;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: yanfei.xu@windriver.com)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C0C2838C06E8
	for <meta-virtualization@yoctoproject.org>; Mon, 16 Nov 2020 01:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQvI65BAcR3DH4EdZwIZiio86GIoiXqRvwqK/QqNKOE130sc2eMpUqgVAFKnFxXb5x0CE5JB4bzYHRAb9xD9FNFVn54g5v1nv5y/t7DH9+ybwiBPy7Ule351nKRIYVsuD26BnA4jD+uiENUj2i6Hfst0fHgjeQpdTSo/W3DIzvT5FknSS+GdbQU3F3OsazkWcC31Yv7B+U2cmf2QwhVWxunR+erycJkd0BaDqNVzJgzDTKQqm3r9nUXG77IHXQBPhXVbHSNu9+63zR91VgJakhqC5rZvPEtG0dfuVP1RdoD8JxZyninWk5a30VuJms03T6LyafK/JYeQRoG/iL699Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd9CHholrehVLv6OZcsji8Y5bNpOzCZJBez+PRf1Qys=;
 b=O/YmmJDx3TpX+MqWb52WU9hnyc+QMB32AxCWviZbeKSKDyUQdudF18psqrNeXvzLkkploAyM5kYMFvu2PBrpzDsrNoZi784oNN5UWqBXRlA5GivtUzY4IONFUJWDJpUsW/35W50KhN+WJPGpn9uT70YM83bJ9zlPQ5rtP7WhUAqgeQhBRw91j5yy5ec//0dzylFdRtQXH1TU7jHSQ+jxYojbqgrlsAgrzVoB2RzbnfZgNuteoKLXnXkZ/HxwoNeGnHQMutJshMqdRw7CPRTjZNeKemE8uYeVCUdt+lgxMhSeCCzIedbXJ1mlRxOy1Ih06dXk+krrPC4UW05PfvmVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd9CHholrehVLv6OZcsji8Y5bNpOzCZJBez+PRf1Qys=;
 b=VZCBIk0ydLitSqUrkrf2fw3sfPATAL6a4CWDXSZmMAzpp1uJt+XZbAhNlIaHT/BSM9OOH7Mm/+1JNfToxwM0McKIlAovrNnrthDpG6iQKa10NHRovR5KD6sQBWpXDL0cOUJn5igy8EC5tYDuSf1ul6MaQtpyhL/Ls1KTXGz5sBk=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 01:58:59 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b%6]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 01:58:59 +0000
Subject: Re: [meta-virtualization] [PATCH v2] ceph: add support for python3.9
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: pbarker@konsulko.com, meta-virtualization@yoctoproject.org
References: <20201111031951.33998-1-yanfei.xu@windriver.com>
 <20201115041154.GA20540@gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <0065c806-20f5-d445-d564-6a95a40c24dc@windriver.com>
Date: Mon, 16 Nov 2020 09:58:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20201115041154.GA20540@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 01:58:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17fec959-2ac4-445c-c4cc-08d889d32ebb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5136:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51369B1123AA6B1FB70F9635E4E30@SJ0PR11MB5136.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eQ8Hc1p7kQ6FXzU+vXsxJMhwipw3b/8dS+v103tvRXQpUVoDX5Z0uFv3H/Jb9wwJO78Mptuxpy3xFkeF3u7hhjEvfF+ZVWD4Ol7HYWIQf/0DyqKKsKaNwIpfuH3auf76CrZAldT+9RfZp/XDdLVatE79WvluMuGVCM1r5lWDTxcD7XTPcX7af8tajwuUovYLUUT//imA7EZXIS8Qz76QZ2f09ltkFjunqy1o4bVCHfTlb7+seuZq4Vqr09q6Ei1hMrXxUJHiJ0MDRa4O+jTx5zrx6ABYCFYL5vizJMfKNbxHcGBaRLwBK/lKT+qZYPcvCAqnaMjC9GUIc+0eXPpm7jNgREoAVOpIeacBqHn8ASBNbopjwEAhDczImz1/uPagIFOtn22sScYNwL+zyqEyGwzCRBsjvE3GSKAiUF+amhOi5uOmbkoCVYKJY+HgRCd29LURt+mfzqOwSHND+/7fvOakWsB838XLvJmpYid+KGE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39830400003)(396003)(5660300002)(6666004)(6486002)(83380400001)(8936002)(8676002)(31696002)(86362001)(31686004)(6916009)(6706004)(966005)(26005)(52116002)(186003)(16526019)(53546011)(66946007)(66556008)(66476007)(478600001)(316002)(16576012)(2616005)(2906002)(956004)(36756003)(4326008)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Y2cNouV+6iiGOH1MHD+ZUMdPourqCmwc2Y4yq+rpHPuDlFIY6Ljmsit8NclY+6J5wMuUue23ATc6kKLq8PZfLnVhvIpOLRCbgAJayiD1BXiLDS1jOl9CvZzHTf21Y5qmyAf0jlJ18wRepL9nfz3C5GxIBwsDhNI80pRWf9d+ptaSfNzv+3bfvVFeHFd/u7u7hhT1j3kXFU3WU2wv2sVzJhNTNLvLRhOieWQUtSzphMGA/WhPs2lgjq4koiNTV+0d3CZt/2qi5wwzwadMbRmjXQmhT4Q/Los2cXHo/YktJAJ4Ec9MbT1mpqoW46D84ikmxqz4Z4weJK5cRaZGN4WGGfBJrR2oJdjv8au4AKCPL21U0St7e1X4wQM9Zi2R3PG8q2diYh6L701qxPlruT2GJ2o/Fmm+KFFlAY1A9jTgzeck/tgQTP0DUADTPPamXEm7zvyZwS1xI566gUG0cftDyU0U9rRJ7V/rViOyRC3hCJUYKjm6toVMdSGLC24r0ha9kzmE3gwqejTTsLdmgysBUu7P+7iwRLAFzipHD6WSQJr7nVHNnhac5wCmkMsNjXwFAkwSNLryX9ejnZXW7YP51JgWk1DPspgEiKgOMwA/IiFqHps6Fufl8v7MZS21fpHprnsO1ECtrvvrPa1/TKo6TA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fec959-2ac4-445c-c4cc-08d889d32ebb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 01:58:59.2025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dDtYNotgxufA8gXErIpMdC98uQ/53ZkS0Ft0IOASVJ+5n/WX5xa3P3gx6SfrQBznMla0abRBnEHKXO3WwHefg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/15/20 12:11 PM, Bruce Ashfield wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
> 
> You have a patch in your SRC_URI, that I don't have in master ..
> 
> So I checked the mailing list and found a submission from August.
> 
> I applied that patch first, and then yours.
> 
> As a general rule though, you should be sure that you are on
> upstream master, not a local branch when sending a patch. You
> would have noticed that I missed the patch and could have pinged /
> asked about it.
> 
Sorry. I wrongly thought my local meta-virt layer was same with upstream 
master. Thank you and I will do that as you said next time.

Cheers,

Yanfei

> Cheers,
> 
> Bruce
> 
> In message: [meta-virtualization] [PATCH v2] ceph: add support for python3.9
> on 11/11/2020 Xu, Yanfei wrote:
> 
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> Add support for python3.9, or it will do_configure failed.
>>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>> v1->v2: Change the patch's Upstream-Status to 'Pending'.
>>
>>   ...0001-cmake-add-support-for-python3.9.patch | 30 +++++++++++++++++++
>>   recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>>
>> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>> new file mode 100644
>> index 0000000..d9116c4
>> --- /dev/null
>> +++ b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>> @@ -0,0 +1,30 @@
>> +From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
>> +From: Yanfei Xu <yanfei.xu@windriver.com>
>> +Date: Tue, 10 Nov 2020 17:17:30 +0800
>> +Subject: [PATCH] cmake: add support for python3.9
>> +
>> +add support for python3.9.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> +---
>> + cmake/modules/FindPython/Support.cmake | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPython/Support.cmake
>> +index 6584699b79..c05bbe3306 100644
>> +--- a/cmake/modules/FindPython/Support.cmake
>> ++++ b/cmake/modules/FindPython/Support.cmake
>> +@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR)
>> +   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
>> + endif()
>> + if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
>> +-  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
>> ++  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
>> + elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
>> +   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
>> + else()
>> +--
>> +2.18.2
>> +
>> diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
>> index bdc794f..8454a20 100644
>> --- a/recipes-extended/ceph/ceph_15.2.0.bb
>> +++ b/recipes-extended/ceph/ceph_15.2.0.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>>              file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
>>              file://0003-PendingReleaseNotes-note-about-security-fix.patch \
>>              file://0001-add-missing-include-for-atomic-bool.patch \
>> +           file://0001-cmake-add-support-for-python3.9.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
>> --
>> 2.18.2
>>
> 
>>
>> 
>>
> 
