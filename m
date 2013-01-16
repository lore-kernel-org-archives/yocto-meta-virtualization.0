Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82AD9E011DB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Jan 2013 19:27:54 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0G3Rrts002002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jan 2013 19:27:53 -0800 (PST)
Received: from [128.224.158.225] (128.224.158.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 15 Jan 2013 19:27:53 -0800
Message-ID: <50F61E35.9000204@windriver.com>
Date: Wed, 16 Jan 2013 11:27:49 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<1357921647-17864-2-git-send-email-mihai.prica@intel.com>
	<50F04908.2020103@windriver.com>
	<97BD068FB200C44AA73C2B641F162ECF8FC42C@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8FC42C@IRSMSX101.ger.corp.intel.com>
X-Originating-IP: [128.224.158.225]
Cc: "meta-virtualization@yoctoproject.org"
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
X-List-Received-Date: Wed, 16 Jan 2013 03:27:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2013 06:44 PM, Prica, Mihai wrote:
>> -----Original Message-----
>> From: Lei Yang [mailto:lei.yang@windriver.com]
>> Sent: Friday, January 11, 2013 7:17 PM
>> To: Prica, Mihai
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new target:kvm-image-
>> minimal
>>
>> On 01/12/2013 12:27 AM, Mihai Prica wrote:
>>> Signed-off-by: Mihai Prica<mihai.prica@intel.com>
>>> ---
>>>    recipes-extended/images/kvm-image-minimal.bb |   28
>> ++++++++++++++++++++++++++
>>>    1 file changed, 28 insertions(+)
>>>    create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>>>
>>> diff --git a/recipes-extended/images/kvm-image-minimal.bb
>>> b/recipes-extended/images/kvm-image-minimal.bb
>>> new file mode 100644
>>> index 0000000..275c43b
>>> --- /dev/null
>>> +++ b/recipes-extended/images/kvm-image-minimal.bb
>>> @@ -0,0 +1,28 @@
>>> +DESCRIPTION = "A minimal kvm image"
>>> +
>>> +IMAGE_INSTALL = " \
>>> +    packagegroup-core-boot \
>>> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>>> +    qemu \
>>> +    libvirt \
>>> +    libvirt-libvirtd \
>>> +    libvirt-virsh \
>>> +    "
>>> +
>>> +IMAGE_FEATURES += "ssh-server-openssh"
>>> +
>>> +IMAGE_LINGUAS = " "
>>> +
>>> +LICENSE = "MIT"
>>> +
>>> +inherit core-image
>>> +
>>> +IMAGE_ROOTFS_SIZE = "8192"
>>> +
>>> +ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
>>> +
>>> +PACKAGE_INSTALL_ATTEMPTONLY = "\
>> Hi Mibai
>>
>> can you explain "PACKAGE_INSTALL_ATTEMPTONLY " to me, I just see this
>> variable first time
> In an image recipe you can't use RRECOMMENDS to specify a list of packages that extend the usability of the image being built.  In this type of recipe you can use PACKAGE_INSTALL_ATTEMPTONLY that has the same functionality.

and I think both can be used, from below, it tells me, they can perform 
the same function, do you try RRECOMEEDS and meet an error?

lyang001@lyang0-9010:~/intel-xeon-core/layers/oe-core/meta/classes$ cat 
image.bbclass |grep -E "^RRECOM|^PACKAGE_INSTALL_ATTEMPTONLY"
RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"


  Lei



> Thanks,
> Mihai
>> Lei
>> :-)
>>
>>> +    kernel-module-kvm \
>>> +    kernel-module-kvm-intel \
>>> +    kernel-module-kvm-amd \
>>> +    "


