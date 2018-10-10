Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D01DE00994; Tue,  9 Oct 2018 18:45:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,BODY_URI_ONLY,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* 1.0 BODY_URI_ONLY Message body is only a URI in one line of text or
	for *      an image
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B550E00971
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 18:45:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A1jG3v007007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2018 18:45:16 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 9 Oct 2018 18:45:15 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<meta-virtualization@yoctoproject.org>
References: <1539079412-37928-1-git-send-email-dengke.du@windriver.com>
	<cf8478a59597553cf3bf69e1c3174ad69fac47e7.camel@linuxfoundation.org>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <617c49a9-3c59-9b64-3bb9-b08285efe195@windriver.com>
Date: Wed, 10 Oct 2018 09:41:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cf8478a59597553cf3bf69e1c3174ad69fac47e7.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.149]
Subject: Re: [PATCH V2] ceph: only support x86-64
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
X-List-Received-Date: Wed, 10 Oct 2018 01:45:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年10月09日 18:33, Richard Purdie wrote:
> On Tue, 2018-10-09 at 18:03 +0800, Dengke Du wrote:
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   recipes-extended/ceph/ceph_13.2.1.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-
>> extended/ceph/ceph_13.2.1.bb
>> index d7186b9..7888e64 100644
>> --- a/recipes-extended/ceph/ceph_13.2.1.bb
>> +++ b/recipes-extended/ceph/ceph_13.2.1.bb
>> @@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
>>   RDEPENDS_${PN} += "\
>>   		python \
>>   "
>> +COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"
> If you mean x86-64, don't you want COMPATIBLE_HOST ?
>
> Cheers,
>
> Richard
>
>
Thanks, COMPATIBLE_HOST = "(x86_64).*"  more better.

