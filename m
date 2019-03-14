Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0435AE00D13; Thu, 14 Mar 2019 01:33:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 700A6E009A0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 01:33:42 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2E8XBKS031579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 01:33:31 -0700
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 14 Mar 2019 01:33:05 -0700
To: <meta-virtualization@yoctoproject.org>
References: <1551927535-18666-1-git-send-email-dengke.du@windriver.com>
	<c7e7d530-742d-744e-bbff-615347e1f5d4@windriver.com>
	<a295f370-91ec-1d3e-fd50-028b57c6a701@windriver.com>
From: ddu <dengke.du@windriver.com>
Message-ID: <1edb6d09-b1a1-f2d9-018a-e6f74b85b2e7@windriver.com>
Date: Thu, 14 Mar 2019 16:33:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <a295f370-91ec-1d3e-fd50-028b57c6a701@windriver.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [m-c-s][PATCH] libvirt: fix GROUPADD_PARAM override conflict
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
X-List-Received-Date: Thu, 14 Mar 2019 08:33:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


在 2019/3/8 下午2:00, ddu 写道:
>
> 在 2019/3/7 下午10:00, Mark Hatle 写道:
>> On 3/6/19 8:58 PM, Dengke Du wrote:
>>> The libvirt recipe in meta-virtualization already define the 
>>> GROUPADD_PARAM,
>>> so we should append it, not override.
>>>
>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> ---
>>>   meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend 
>>> b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>>> index b55f9a9..0b0f011 100644
>>> --- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>>> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
>>> @@ -5,7 +5,7 @@ PACKAGECONFIG ?= "qemu lxc test remote macvtap 
>>> libvirtd udev yajl \
>>>     inherit useradd
>>>   USERADD_PACKAGES = "${PN}"
>>> -GROUPADD_PARAM_${PN} = "--system libvirt"
>>> +GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
>> The __append should be fine then, but why the ';'?  That part looks 
>> wrong, since
>> typically the PARAM is the parameters passed directly to the groupadd 
>> program.
>> I don't believe ';' is a valid parameter.

Hi Mark

Do you have any questions on this still?

>
> Hi Mark
>
> The GROUPADD_PARAM in useradd.bbclass using ';' to create pieces, and 
> pass each piece to groupadd command,
>
> https://git.openembedded.org/openembedded-core/tree/meta/classes/useradd.bbclass#n54 
>
>
> such as "-r qemu; -r kvm; --system libvirt" into
>
> '-r qemu'
>
> '-r kvm'
>
> '--system libvirt'
>
> to groupadd command.
>
> If we don't use the ';'  like this:
>
> '-r qemu -r kvm --system libvirt' pass to groupadd command will fail.
>
> So we should add ';'
>
>>
>> --Mark
>>
>>>   do_install_append() {
>>>       sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i 
>>> ${D}/etc/libvirt/libvirtd.conf
>>>
>>

