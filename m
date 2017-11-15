Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8ECCE00CD4; Wed, 15 Nov 2017 13:09:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A6E2E00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:09:05 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAFL91SK022990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 15 Nov 2017 13:09:02 -0800
Received: from server.local (128.224.21.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 15 Nov 2017 13:09:01 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1510768793-27481-1-git-send-email-mark.asselstine@windriver.com>
	<1510779516.3952.165.camel@linuxfoundation.org>
	<2041101.pqKFSuxYtT@yow-masselst-lx1>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <4fc1f3af-2c4f-7fe8-f2f1-12023f3b79de@windriver.com>
Date: Wed, 15 Nov 2017 16:09:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <2041101.pqKFSuxYtT@yow-masselst-lx1>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python-*: fixup postinst scripts
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2017 21:09:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-11-15 4:08 PM, Mark Asselstine wrote:
> On Wednesday, November 15, 2017 8:58:36 PM EST Richard Purdie wrote:
>> On Wed, 2017-11-15 at 12:59 -0500, Mark Asselstine wrote:
>>> Checking for "$D" and doing an "exit 1" now results in errors such
>>> as:
>>>
>>> [log_check] warning: %post(keystone-cronjobs-...) scriptlet failed,
>>> exit status 2
>>>
>>> during image creation. Instead of escaping the script for "level-1"
>>> (image creation postinst) we wrap the "level-2" (first boot) postinst
>>> in an if statement. This also ensure the scriptlet in
>>> indentity.bbclass is less prone to behaving differently based on the
>>> postinsts defined in the classes which inherit 'identity'.
>>
>> I think this could mean the postinst doesn't get executed at all if
>> there isn't an exit 1, else how would it know to defer to first boot?
> 
> Every time I touch the postinst I admittedly end up in a knot. I was
> inspecting the rpm scripts and all seemed well but I will take another look to
> ensure I am not being a dolt.
> 
> Either way thanks for the nudge Richard. Bruce hold off on this one for now. I
> have so many little and big changes to get m-c-s back up to snuff I am better
> off taking the time to ensure I am not messing something up.

hah. I already merged this one, so rebase and send any fixups.

Bruce

> 
> Mark
> 
>>
>> Cheers,
>>
>> Richard
> 
> 


