Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71836E007EA; Tue, 29 Jul 2014 05:58:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43F09E007E4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 05:58:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6TCwgmN006284
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Jul 2014 05:58:42 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Jul 2014 05:58:42 -0700
Message-ID: <53D79A7F.3050204@windriver.com>
Date: Tue, 29 Jul 2014 08:58:39 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Alexandru Vaduva <Alexandru.Vaduva@enea.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <DDB0C57E45663A458C5CACB7B5688BC21D6D568D@SESTOEX04.enea.se>
	<53D79893.3090705@windriver.com>
	<DDB0C57E45663A458C5CACB7B5688BC21D6D56B6@SESTOEX04.enea.se>
In-Reply-To: <DDB0C57E45663A458C5CACB7B5688BC21D6D56B6@SESTOEX04.enea.se>
Cc: "vu.tran@windriver.com" <vu.tran@windriver.com>
Subject: Re: meta-openstack open-iscsi question
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
X-List-Received-Date: Tue, 29 Jul 2014 12:58:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-07-29 08:51 AM, Alexandru Vaduva wrote:
> So you no longer use the open-iscsi-user  and open-iscsi-kernel recipes?

packagegroup-cloud-compute can conditionally use them, I'm not heavily using
that backend, but others are.


Bruce

>
> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]
> Sent: Tuesday, July 29, 2014 3:50 PM
> To: Alexandru Vaduva; meta-virtualization@yoctoproject.org
> Cc: vu.tran@windriver.com
> Subject: Re: meta-openstack open-iscsi question
>
> On 14-07-29 08:44 AM, Alexandru Vaduva wrote:
>> Hello guys,
>>
>> I am curious on why do you have in meta-cloud-services duplicated recipes:
>> 	open-iscsi-user  	- 	iscsi-initiator-utils
>
> We have modifications to this recipe that I'm working to get into the original over time.
>
> But I can't hold merging dependent recipes while I wait, so I carry the changes in meta-cloud-services while that process happens.
>
>> 	open-iscsi-kernel 	-  	kernel with open iscsi modules enabled and built.
>>
>> I can see that the sources available for open-iscsi-kernel are
>> applicable for kernel version < 3,
>
> The kernel part is only there for completeness sake. We build the kernel parts from the linux-yocto recipes. Over time, we'll also be dropping this part .. as Vu knows, I already asked him and am in the process of removing it.
>
>> But I do not understand the uses of both open-iscsi-user and iscsi-initiator-utils because they are building the same information but different version of the sources.
>> At least so it seems.
>
> Again. For completeness sake. We brought in a complete copy of the HIPOS recipes to work with as part of enabling the backend. That way I can more easily keep it in sync.
>
> Bruce
>
>>
>>
>> Thanks,
>> Alexandru Vaduva
>>
>>
>>
>>
>>
>


