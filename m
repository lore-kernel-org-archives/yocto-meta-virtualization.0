Return-Path: <Liezhi.Yang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4CFFE00F0D; Mon, 26 Feb 2018 22:46:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C231E00D91
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Feb 2018 22:46:21 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1R6jtf7027589
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Feb 2018 22:45:55 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.240) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 26 Feb 2018 22:45:48 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180227015512.27675-1-liezhi.yang@windriver.com>
	<CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <30bb08d4-12e5-7474-7ef5-42fdf9afec70@windriver.com>
Date: Tue, 27 Feb 2018 14:46:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-pyparsing: fix SRC_URI's checksum
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
X-List-Received-Date: Tue, 27 Feb 2018 06:46:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

I remembered that I had sent this patch on Nov. 16th, but I couldn't find it,
maybe I failed to send it. It was because the source was changed from .zip to
.tar.gz:

commit 3d512115129e2cea97067d23cb72fea62b70dd39
Author: Mark Asselstine <mark.asselstine@windriver.com>
Date:   Mon Nov 13 16:48:05 2017 -0500

     python-*: switch remaining pypi recipes to use the pypi class

It had been wrong for more than 3 months. I will add more comments and send a
V2.

// Robert

On 02/27/2018 02:15 PM, Bruce Ashfield wrote:
> We need to document the reason why the checksum changed.
> 
> What happened to trigger the bad checksum ?
> 
> Bruce
> 
> On Mon, Feb 26, 2018 at 8:55 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   recipes-devtools/python/python-pyparsing_2.0.1.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-devtools/python/python-pyparsing_2.0.1.bb b/recipes-devtools/python/python-pyparsing_2.0.1.bb
>> index 2ef6df9..c19f137 100644
>> --- a/recipes-devtools/python/python-pyparsing_2.0.1.bb
>> +++ b/recipes-devtools/python/python-pyparsing_2.0.1.bb
>> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
>>
>> -SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
>> -SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
>> +SRC_URI[md5sum] = "37adec94104b98591507218bc82e7c31"
>> +SRC_URI[sha256sum] = "0007cd3f008eba4a203f1f6b4b133ddc352552c8808b694c88c23db56416e4e4"
>>
>>   inherit distutils pypi
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 

