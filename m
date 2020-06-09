Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.80])
 by mx.groups.io with SMTP id smtpd.web11.5252.1591665016030157304
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 18:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SNpyV/fj;
 spf=pass (domain: windriver.com, ip: 40.107.244.80, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhM647kN6V6rUzZccG2iHtt2+U5/wGCkn19vjUuT3owPxEjI4ngx+XBUXoNEw8Aw46+TbcLgFO/Dq/2pSjCtBxftFAkhHUm8bkjkXJu2aLLrr0ctvtZTfFYfiRQE010j8Sp4HrDR0eO0t1rzfE7H+EO7h4rYlgd3hd/nTAzU+Rsnno03UXvBFm+u71ceEILT7KEzkckL1P9QH4IChQx3s9kAl3Kbmp1dergMnD2DyqSTYcDfVskF/DAx/iCF++mdfchIvhZA+Q3pGD/QMUXpWKTtWJ1UPA9BNncnRLmeYlOTiIzPHOfNCuwg6zxBfOrwKzBYzLGQ250n98pUVr0Z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbI5cJeUCwc4vJHsDbPFOUgu1CftiRTMMvoLUhyWybA=;
 b=WGQKIMOn3A1jDZ7BUjYezdzBBOgDoAB70n06E9r4lc6vaXeUGq49l+V5YHCZ7zOs/jYbYUY5HxdzNtMsB3dDUTNL96XwfnqmgtZrtdpE/pg4y7NvqyBxjl20unnECCJJ8kFLC0D24RwU2Lmsosjfh7rurvVhS3oQF+G53tiX/3aDCzWx9TVOtb4lV/Mf5sx6lhAzL+SBJpRhzUATkSyDhWCuN/x6w+5iHFH67W3rrcgb+UDFDcRAFQpn/k5fM2pKUNVSbsiJ28eG+ZgrnpQX3nV0LW8s2vpc7c3/MwwEHXs9dbbn8NqzqCr21//dOv3dpRGhbQrmK9/N6aJR+REoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbI5cJeUCwc4vJHsDbPFOUgu1CftiRTMMvoLUhyWybA=;
 b=SNpyV/fjjRPLDytkcivcLQgm+p9iiOLs6W4ktdLJuvjwV+Y+RHVNANfVHkWOFsbmn3KNSN5/nF9LiQ8GgY0DSAmgE3IAVbbPPqwkZBCeWN2BAzQmE8NOA/LPKxz5y53p/1rekLDUxyG8Fjb3rMrUPrWwOkE7cP9rgpPyR//nx8Q=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3176.namprd11.prod.outlook.com (2603:10b6:a03:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Tue, 9 Jun
 2020 01:10:14 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 01:10:14 +0000
Subject: Re: [meta-virtualization][m-c-s][PATCH] meta-openstack: be compatible with dunfell
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20200608034208.112106-1-Qi.Chen@windriver.com>
 <161692922988E497.22829@lists.yoctoproject.org>
 <CADkTA4MBGkgVjVSEGapi266R3binp3ToSA8LvV_au-h81JnZKQ@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <e0874257-f2f6-3e79-065e-4ef5484acf98@windriver.com>
Date: Tue, 9 Jun 2020 09:13:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CADkTA4MBGkgVjVSEGapi266R3binp3ToSA8LvV_au-h81JnZKQ@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 01:10:12 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e97e0412-a7e3-4b75-6d3c-08d80c11dd0c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3176:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3176269838D92CCB50075C23ED820@BYAPR11MB3176.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PzpbJqOXCW1emCjmhRUIzrEHhiJUbuK0wqzdtIhG/8tZkkUilh+dGzb2sqConWoZgd9zs0bJEeimUhIpcKo8+Cvzktz9iquE6fWcZBUtsOf5e1ZaGDd/XydmTxzW0ZD4i+dvVxShLkej1M/8pqfPUnhx6R2TLI/GsSG8IRqD4wwtJT3uu7Py3ljNVpIQ3/XF6/aZXqDq84l9fFTHYo1BwRDl4NXmp7sgKcD2N24rjrNWUOgWYqWhBZoaDJJQP797aoTyPsML+Y2h08ZAmxNEztcP69NtRHOd7ZTV72bU3sCU8tyC6b62se9JukiejGzQSBJ44TEWoMJ1zPHP5EF3jBmuGrM8nz7QYPYkaBJ8f8zmDxmaxlI4lPyu7LnBKehiwGkq7CXEQsEmlsCP9EpkSfV3NdX6NDzJDOTtLfuiefqu9IwlRAF4YqlvzHVcbWaSuB4d5s4dXF2pcakmLRrMRuzPmNEQssYWcmDZgmx4cjTf4ihnlg7i80pUILSiEdS5nP6E/Ns9mO3L79UC2pjGTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(396003)(366004)(4326008)(8936002)(36756003)(16526019)(186003)(26005)(956004)(66556008)(16576012)(66946007)(8676002)(5660300002)(66476007)(2906002)(316002)(6706004)(2616005)(6486002)(966005)(52116002)(53546011)(478600001)(86362001)(83380400001)(31686004)(31696002)(6916009)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NMbGcwL8CCavR7FTBF6ptSPJv/r/SXKU8bZf6g5bSTA8P0AEeWdHtwJ10spS3l4mo/069nBU5TkDROjr0pkAYbuu5B1eDK4h2J11qymrX3OpGLVBjfmHXC9UI4fU/zcS7gPPSxYJixPWZvHnkY+Q9SVsztLM49Am//PrkWTcQzail9KCW1lFr/XsgrgpKyT6BfiAtQ/o6h1NH6SJqYEOaKm+JOl59EPzApV/1yaGejN2EJ8caniPcUSUJZ3n6FEe4rk2U0c1pPsIUEI28QpUbeyZr9gD4Vtx/NjXppPtHD3zesBqtaipX+wb8mHgGKYSdRLlOtIDWBf/GDLaBvkBqmICw0gDBE75KHid8o9go1E7hXmMBp+knrlWGmRLiIIlqNEQ+aPXfOIaMza8esFKmDuruZ0MAruWDwq6OikgTedLP1xnI24HVsEQiaTyUHco8Yhfy2nacLtesdvicmLAgRtmtxrLkvAWd2aOg+usGeg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97e0412-a7e3-4b75-6d3c-08d80c11dd0c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 01:10:13.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFC/xNoO0zM0tR6h363wNfAKoltpVzxkBE2vb56BhW1No/2GwtavOtSS6/txQN3H2eiIWD8uCb/q8bWhnV6LWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3176
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2020 08:53 PM, Bruce Ashfield wrote:
> On Mon, Jun 8, 2020 at 8:51 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>> Hmm.  I already did a patch for this, it looks like I forgot to push it :(
>>
> oh wait, I see my dunfell patch.
>
> I excluded those layers on purpose, since the deployment hasn't been
> tested in quite a while. Did you confirm that the layers build when
> bumping the compatibility. I honestly expect runtime errors .. but did
> anyone try booting with them enabled ?
>
> Bruce

No. I didn't do any test. These layers are included in my bblayers.conf, 
I have to add 'dunfell', otherwise bitbake errors out.

Regards,
Chen Qi


>
>> Bruce
>>
>> On Sun, Jun 7, 2020 at 11:42 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
>>>   meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
>>>   meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
>>>   meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
>>>   meta-openstack-controller-test-config/conf/layer.conf | 2 +-
>>>   meta-openstack-qemu/conf/layer.conf                   | 2 +-
>>>   meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
>>>   7 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
>>> index f3d2c5f2..c8bdaff5 100644
>>> --- a/meta-openstack-aio-deploy/conf/layer.conf
>>> +++ b/meta-openstack-aio-deploy/conf/layer.conf
>>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>>>   BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
>>>   BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
>>> -LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-aio-deploy-layer = " \
>>>          core \
>>> diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
>>> index e25cf3e0..3d700330 100644
>>> --- a/meta-openstack-compute-deploy/conf/layer.conf
>>> +++ b/meta-openstack-compute-deploy/conf/layer.conf
>>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>>>   BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
>>>   BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
>>> -LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-compute-deploy-layer = " \
>>>          core \
>>> diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
>>> index dfa5f31b..b082d609 100644
>>> --- a/meta-openstack-compute-test-config/conf/layer.conf
>>> +++ b/meta-openstack-compute-test-config/conf/layer.conf
>>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
>>>   BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
>>>   # We want this layer to have higher priority than any other meta-openstack layers
>>>   BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
>>> -LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-compute-test-config-layer = " \
>>>          openstack-compute-deploy-layer \
>>> diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
>>> index e8be8321..e9786313 100644
>>> --- a/meta-openstack-controller-deploy/conf/layer.conf
>>> +++ b/meta-openstack-controller-deploy/conf/layer.conf
>>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>>>   BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
>>>   BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
>>> -LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-controller-deploy-layer = " \
>>>          core \
>>> diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
>>> index b81f21e0..695767d1 100644
>>> --- a/meta-openstack-controller-test-config/conf/layer.conf
>>> +++ b/meta-openstack-controller-test-config/conf/layer.conf
>>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
>>>   BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
>>>   # We want this layer to have higher priority than any other meta-openstack layers
>>>   BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
>>> -LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-controller-test-config-layer = " \
>>>          openstack-controller-deploy-layer \
>>> diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
>>> index 98a35b40..8f6378d9 100644
>>> --- a/meta-openstack-qemu/conf/layer.conf
>>> +++ b/meta-openstack-qemu/conf/layer.conf
>>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>>>   BBFILE_COLLECTIONS += "openstack-qemu-layer"
>>>   BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_openstack-qemu-layer = "6"
>>> -LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-qemu-layer = " \
>>>          core \
>>> diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
>>> index e9675e28..e48aa601 100644
>>> --- a/meta-openstack-swift-deploy/conf/layer.conf
>>> +++ b/meta-openstack-swift-deploy/conf/layer.conf
>>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>>>   BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
>>>   BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
>>> -LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus"
>>> +LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus dunfell"
>>>
>>>   LAYERDEPENDS_openstack-swift-deploy-layer = " \
>>>          core \
>>> --
>>> 2.21.0
>>>
>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>> 
>
>

