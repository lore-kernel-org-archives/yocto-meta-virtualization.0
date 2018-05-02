Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE34EE007C2; Tue,  1 May 2018 20:16:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_03_06,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* 3.0 DATE_IN_FUTURE_03_06 Date: is 3 to 6 hours after Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DE84E007C2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 20:16:37 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w423GCR3008913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 1 May 2018 20:16:27 -0700
Received: from [128.224.20.89] (128.224.20.89) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 1 May 2018 20:16:01 -0700
To: <mark.asselstine@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
	<CAPuovE+34RbGFrJAw6=231D0w3oJvkig1ifVx-FZ8yNtxZEn6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <3ce36291-6deb-ef5d-34cc-2584b8aa5753@windriver.com>
Date: Wed, 2 May 2018 03:16:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAPuovE+34RbGFrJAw6=231D0w3oJvkig1ifVx-FZ8yNtxZEn6Q@mail.gmail.com>
Subject: Re: [m-c-s][PATCH 1/5] python-uritemplate: initial version (v3.0.0)
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
X-List-Received-Date: Wed, 02 May 2018 03:16:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

luckily, I got them all. These are now merged.

Bruce

On 5/1/2018 9:28 AM, Mark Asselstine wrote:
> For anyone wondering where the 5/5 is. Once again it was held up
> pending moderator approval due to its size.
> 
> Mark
> 
> On Mon, Apr 30, 2018 at 2:51 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>> Needed by python-google-api-python-client.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>   .../recipes-devtools/python/python-uritemplate_3.0.0.bb          | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>   create mode 100644 meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb b/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
>> new file mode 100644
>> index 0000000..d32c1a8
>> --- /dev/null
>> +++ b/meta-openstack/recipes-devtools/python/python-uritemplate_3.0.0.bb
>> @@ -0,0 +1,9 @@
>> +SUMMARY = "Simple python library to deal with URI Templates."
>> +AUTHOR = "Ian Cordasco"
>> +LICENSE = "Apache-2.0 & BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f2e14cc8f5f696fd9d47092e992265c1"
>> +
>> +inherit setuptools pypi
>> +
>> +SRC_URI[md5sum] = "1ec31e0d8a2eec72357b2cef4bce5945"
>> +SRC_URI[sha256sum] = "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4028a93f1527d011d"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

