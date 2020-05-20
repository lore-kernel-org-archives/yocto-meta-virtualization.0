Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10803.1589974256855801845
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 May 2020 04:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04KBTw2B002959
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 20 May 2020 04:30:28 -0700
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 20 May 2020
 04:30:03 -0700
Subject: Re: [meta-virtualization] [PATCH 1/1] notary: Define SRCREV_FORMAT to make it work with archiver.bbclass
To: Paul Barker <pbarker@konsulko.com>
CC: <meta-virtualization@lists.yoctoproject.org>
References: <20200520082737.76973-1-liezhi.yang@windriver.com>
 <3873.1589968841005157960@lists.yoctoproject.org>
 <CAM9ZRVvppkewhy94Gq2XHLReJnAQC8nSVCKpLKeu+YZ+-RRO8Q@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <9bdf1367-620a-1b57-5443-12147a5c25fb@windriver.com>
Date: Wed, 20 May 2020 19:29:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVvppkewhy94Gq2XHLReJnAQC8nSVCKpLKeu+YZ+-RRO8Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/20/20 7:26 PM, Paul Barker wrote:
> On Wed, 20 May 2020 at 11:00, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Hi Bruce,
>>
>> Please ignore this patch, I found more recipes in meta-virt have this issue, we need fix all of them or find a better solutions.
> 
> I think the issue should probably be logged against the archiver
> itself in the Yocto bugzilla. If the archiver is changing SRC_URI it
> should handle any consequences, not require recipes to adapt for it.

Yes, indeed, I'm working on that.

// Robert

> 
> 
> 
> 
