Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A5937E01430
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 01:44:48 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.2.318.1;
	Thu, 6 Dec 2012 10:44:45 +0100
Message-ID: <50C0690D.1080401@enea.com>
Date: Thu, 6 Dec 2012 10:44:45 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>
References: <97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com>
	<50BF9906.6080108@se-eng.com>
In-Reply-To: <50BF9906.6080108@se-eng.com>
X-Originating-IP: [172.16.140.28]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: meta-virtualization structure
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
X-List-Received-Date: Thu, 06 Dec 2012 09:44:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/05/2012 07:57 PM, Raymond Danks wrote:
> On 12/05/2012 05:02 AM, Prica, Mihai wrote:
>>
>> Hi,
>>
>> I wanted to include my work with meta-kvm into the new
>> layer(meta-virtualization) and I was thinking about the best method of
>> doing this.  The problem is there are different kernel configs
>> depending on the hypervisor and different values for the PACKAGECONFIG
>> in libvirt.
>>
>> One solution would be to move all the common pieces into a meta layer
>> and group the hypervisor configurations into a specific directory
>> (meta-kvm, meta-xen), all of them in meta-virtualization. Is there
>> another way ?
>>
>
> It seems to me the choice of hypervisor should be made in the distro
> configuration.  Can't this be handled with the addition of a HYPERVISOR
> definition there?

For kernel Kconfig I think this will be a good idea for config options 
which  cannot be set to =m, and are mutually exclusive.

Different values for PACKAGECONF in libvirt for xen/kvm is not 
neccesarily needed, unless your focus is to optimize binary package 
sizes. libvirt drivers for xen/kvm should not be mutually exclusive 
during build/packaging/runtime afaik.
Trying to use a hypervisor driver in runtime where the underlying tech. 
is not available will result in libvirt runtime errors.

Adding specific binary size optimizations flavours, such as xen-minimal 
et.c. of course also be done from DISTRO or local.conf.

>
>> Thanks,
>>
>> Mihai
>>
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

