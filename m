Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45165E00C8B; Fri, 27 Jul 2018 06:42:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59700E00C8B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jul 2018 06:42:46 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6RDghU3026102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jul 2018 06:42:44 -0700
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 27 Jul 2018 06:42:42 -0700
To: <mark.asselstine@windriver.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180724110856.925-1-zhe.he@windriver.com>
	<CADkTA4NEFB1pKFBmbHdNGRF1nKNdxUmqHvwEPqPA8HLsG8KQMQ@mail.gmail.com>
	<CAPuovEKysxWXemV_ngox2bsHLy-VkAgt4F8ec9xRPTbiUdi8rQ@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <924582dc-63ab-ff7d-5fad-b5220ae43ba7@windriver.com>
Date: Fri, 27 Jul 2018 21:42:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAPuovEKysxWXemV_ngox2bsHLy-VkAgt4F8ec9xRPTbiUdi8rQ@mail.gmail.com>
X-Originating-IP: [128.224.162.216]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux-yocto: Fix systemd-modules-load.service start failure
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
X-List-Received-Date: Fri, 27 Jul 2018 13:42:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年07月26日 23:30, Mark Asselstine wrote:
> On Thu, Jul 26, 2018 at 10:41 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> merged.
>>
>> Bruce
>>
>> On Tue, Jul 24, 2018 at 7:08 AM, He Zhe <zhe.he@windriver.com> wrote:
>>> systemd-modules-load.service bindly load whatever in modules-load.d/*.conf,
>>> in this case, kvm_intel and kvm_amd. One of them must fail on a specific
>>> board and causes the following failure.
>>>
>>> This patches remove them from KERNEL_MODULE_AUTOLOAD and leaves them to udev.
>>>
>>> systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE
>>> Failed to start Load Kernel Modules.
> Nice. I have been wanting to look at why this message was being produced.
>
> I do wonder if this change will cause an issue for folks using
> meta-virtualization with sysvinit though. What is the behavior if this
> is the case?

It's also OK for sysvinit.

With sysvinit, modutils.sh in modutils-initscripts.bb in packagegroup-core-boot.bb
would take care of /etc/modules-load.d. And udev still takes care of kvm-intel and
kvm-amd.

Zhe

>
> Mark
>
>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> ---
>>>  recipes-kernel/linux/linux-yocto_virtualization.inc | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
>>> index 9905ed9..c09b07c 100644
>>> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
>>> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
>>> @@ -10,8 +10,6 @@ KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'featu
>>>
>>>  KERNEL_MODULE_AUTOLOAD += "openvswitch"
>>>  KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm', '', d)}"
>>> -KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm-amd', '', d)}"
>>> -KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm-intel', '', d)}"
>>>
>>>  # aufs kernel support required for xen-image-minimal
>>>  KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>>> --
>>> 2.11.0
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


