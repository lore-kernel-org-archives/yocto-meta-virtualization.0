Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05AF0E006CB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2013 09:10:59 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0PHAx1q004614
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Jan 2013 09:10:59 -0800 (PST)
Received: from [128.224.159.136] (128.224.159.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 25 Jan 2013 09:10:58 -0800
Message-ID: <5102BC9D.6040406@windriver.com>
Date: Sat, 26 Jan 2013 01:10:53 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<1357921647-17864-2-git-send-email-mihai.prica@intel.com>
	<50F04908.2020103@windriver.com>
	<97BD068FB200C44AA73C2B641F162ECF8FC42C@IRSMSX101.ger.corp.intel.com>
	<50F61E35.9000204@windriver.com>
	<97BD068FB200C44AA73C2B641F162ECF905906@IRSMSX101.ger.corp.intel.com>
	<97BD068FB200C44AA73C2B641F162ECF914A2E@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF914A2E@IRSMSX101.ger.corp.intel.com>
X-Originating-IP: [128.224.159.136]
Cc: bruce.ashfield@windriver.com, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Fri, 25 Jan 2013 17:11:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2013 11:58 PM, Prica, Mihai wrote:
>> -----Original Message-----
>> From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualization-
>> bounces@yoctoproject.org] On Behalf Of Prica, Mihai
>> Sent: Wednesday, January 16, 2013 3:59 PM
>> To: lei yang
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new target:kvm-image-
>> minimal
>>
>>> -----Original Message-----
>>> From: lei yang [mailto:lei.yang@windriver.com]
>>> Sent: Wednesday, January 16, 2013 5:28 AM
>>> To: Prica, Mihai
>>> Cc: meta-virtualization@yoctoproject.org
>>> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new
>>> target:kvm-image- minimal
>>>
>>> On 01/15/2013 06:44 PM, Prica, Mihai wrote:
>>>>> -----Original Message-----
>>>>> From: Lei Yang [mailto:lei.yang@windriver.com]
>>>>> Sent: Friday, January 11, 2013 7:17 PM
>>>>> To: Prica, Mihai
>>>>> Cc: meta-virtualization@yoctoproject.org
>>>>> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new
>>>>> target:kvm-image- minimal
>>>>>
>>>>> On 01/12/2013 12:27 AM, Mihai Prica wrote:
>>>>>> Signed-off-by: Mihai Prica<mihai.prica@intel.com>
>>>>>> ---
>>>>>>     recipes-extended/images/kvm-image-minimal.bb |   28
>>>>> ++++++++++++++++++++++++++
>>>>>>     1 file changed, 28 insertions(+)
>>>>>>     create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>>>>>>
>>>>>> diff --git a/recipes-extended/images/kvm-image-minimal.bb
>>>>>> b/recipes-extended/images/kvm-image-minimal.bb
>>>>>> new file mode 100644
>>>>>> index 0000000..275c43b
>>>>>> --- /dev/null
>>>>>> +++ b/recipes-extended/images/kvm-image-minimal.bb
>>>>>> @@ -0,0 +1,28 @@
>>>>>> +DESCRIPTION = "A minimal kvm image"
>>>>>> +
>>>>>> +IMAGE_INSTALL = " \
>>>>>> +    packagegroup-core-boot \
>>>>>> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>>>>>> +    qemu \
>>>>>> +    libvirt \
>>>>>> +    libvirt-libvirtd \
>>>>>> +    libvirt-virsh \
>>>>>> +    "
>>>>>> +
>>>>>> +IMAGE_FEATURES += "ssh-server-openssh"
>>>>>> +
>>>>>> +IMAGE_LINGUAS = " "
>>>>>> +
>>>>>> +LICENSE = "MIT"
>>>>>> +
>>>>>> +inherit core-image
>>>>>> +
>>>>>> +IMAGE_ROOTFS_SIZE = "8192"
>>>>>> +
>>>>>> +ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ;
>> "
>>>>>> +
>>>>>> +PACKAGE_INSTALL_ATTEMPTONLY = "\
>>>>> Hi Mibai
>>>>>
>>>>> can you explain "PACKAGE_INSTALL_ATTEMPTONLY " to me, I just see
>>>>> this variable first time
>>>> In an image recipe you can't use RRECOMMENDS to specify a list of
>>>> packages
>>> that extend the usability of the image being built.  In this type of
>>> recipe you can use PACKAGE_INSTALL_ATTEMPTONLY that has the same
>> functionality.
>>> and I think both can be used, from below, it tells me, they can
>>> perform the same function, do you try RRECOMEEDS and meet an error?
>> I tried using RRECOMMENDS. I didn't get any errors but the kernel modules were
>> not loaded onto the image. I tried a number of times to be sure it's because of
>> the shared state, but with the same result. With
>> PACAKAGE_INSTALL_ATTEMPTONLY it worked.

if you want to install  those kernel-modules, I like IMAGE_INSTALL , 
this is more popular used in practice

Lei

> I see this hasn't been merged to master yet. Is there a specific reason for this ? Maybe it's something I'm missing.
>
> Mihai
>
>>> lyang001@lyang0-9010:~/intel-xeon-core/layers/oe-core/meta/classes$
>>> cat image.bbclass |grep -E "^RRECOM|^PACKAGE_INSTALL_ATTEMPTONLY"
>>> RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
>>> PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>>>
>>>
>>>    Lei
>>>
>>>
>>>
>>>> Thanks,
>>>> Mihai
>>>>> Lei
>>>>> :-)
>>>>>
>>>>>> +    kernel-module-kvm \
>>>>>> +    kernel-module-kvm-intel \
>>>>>> +    kernel-module-kvm-amd \
>>>>>> +    "
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


