Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 555DFE0045D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Dec 2012 14:20:46 -0800 (PST)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Dec 2012 14:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,217,1355126400"; d="scan'208";a="176188241"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Dec 2012 14:20:44 -0800
Message-ID: <50BE773C.7080905@linux.intel.com>
Date: Tue, 04 Dec 2012 14:20:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <David.Nystrom@enea.com>
References: <50BE184E.2000403@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8F260F@IRSMSX101.ger.corp.intel.com>
	<50BE1EE8.30504@enea.com>, <50BE34FC.8040205@se-eng.com>
	<88701C38B5D07249817D428430999C9128A89A70@sestoex05.enea.se>
In-Reply-To: <88701C38B5D07249817D428430999C9128A89A70@sestoex05.enea.se>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: PACKAGECONFIG variables.
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
X-List-Received-Date: Tue, 04 Dec 2012 22:20:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/04/2012 01:43 PM, David Nyström wrote:
> Ray,
>
> Yes, of course. Let's add a *-minimal package configs,
> if none are set, we'll let it autodetect + add full dependencies otherwise.
Won't using autodetect cause inconsistencies depending on how the image 
gets built, it will also lead to a lot larger dependency requirement.

I know it's better to have a known list of what's in and what's out.
Autoconf has caused inconsistencies in the past, when options are not 
specified.

Sau!

> Is it OK for you if I set it to auto detect by default? , this would imply
> a local.conf addition to optimize for footprint.
> I'm guessing package config selects cannot be set from an image file,
> I'll give that a try tomorrow.
>
> Br,
> David
>
> Sent from my Android phone using TouchDown (www.nitrodesk.com)
>
> -----Original Message-----
> *From:* Raymond Danks [ray.danks@se-eng.com]
> *Received:* Tuesday, 04 Dec 2012, 18:38
> *To:* David Nyström [David.Nystrom@enea.com]
> *CC:* Prica, Mihai [mihai.prica@intel.com];
> meta-virtualization@yoctoproject.org [meta-virtualization@yoctoproject.org]
> *Subject:* Re: [meta-virtualization] PACKAGECONFIG variables.
>
> David,
>
> XenAPI is used by XenServer and Xen Cloud Platform.  There is currently
> no underlying metadata support for these packages, so this should be
> disabled.
>
> I do, in fact have binary size constraints.  I see where you are going
> with this, but would it be possible instead to add a "detect" or "all"
> to PACKAGECONFIG?  I suppose an alternative would be to add "*-minimal"
> to PACKAGECONFIG which tweak the configure to create minimal build
> configurations.
>
> Ray
>
> On 12/04/2012 09:03 AM, David Nyström wrote:
>> I have some issues with how PACKAGECONFIG works, do you guys mind if I
>> disable all --without functionality in PACKAGECONFIG, and let libvirt
>> ./configure autodetect dependencies ?
>> This will result in a bigger libvirt binary, and
>> libnl, netcf, augeas, polkit dependencies being mandatory for all
>> users of libvirt, unless explicitly disabled by the "xen" PACKAGECONFIG.
>>
>> Does anyone have any binary size constraints ?
>>
>> Br,
>> David
>>
>> On 12/04/2012 04:49 PM, Prica, Mihai wrote:
>>>
>>> Hi,
>>>
>>> The error is because configure is called with the --with-xenapi
>>> option. I think there is a bug in the recipe at the
>>> PACKAGECONFIG[xen] line. It should be --without-xenapi instead of the
>>> first --with-xenapi. I don't know exactly what xenapi does, Raymond
>>> can give you more details here.
>>>
>>> Try to change this and see if it works.
>>>
>>> Thanks,
>>> Mihai
>>>
>>> -----Original Message-----
>>> From: David Nyström [mailto:david.c.nystrom@gmail.com]
>>> Sent: Tuesday, December 04, 2012 5:36 PM
>>> To: Raymond Danks
>>> Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
>>> Subject: PACKAGECONFIG variables.
>>>
>>> Hi All,
>>>
>>> When trying to upgrade to libvirt-1.0, I'm getting some strange errors.
>>> How could this pass with the old libvirt I dont know.
>>>
>>> Is the XenAPI driver something you explicitly build and use ?
>>>
>>> ------------------------------------------------------------------
>>> checking for xen_vm_start in -lxenserver... no
>>> configure: error: You must install the XenServer Library to compile
>>> XenAPI driver with -lxenserver Configure failed. The contents of all
>>> config.log files follows to aid debugging
>>> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/libvirt-1.0.0/config.log
>>> This file contains any messages produced by compilers while running
>>> configure, to aid debugging if configure makes a mistake.
>>>
>>> It was created by libvirt configure 1.0.0, which was generated by GNU
>>> Autoconf 2.69.  Invocation command line was
>>>
>>>     $
>>> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/libvirt-1.0.0/configure
>>>
>>> --build=x86_64-linux --host=x86_64-poky-linux
>>> --target=x86_64-poky-linux --prefix=/usr --exec_prefi x=/usr
>>> --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec
>>> --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com
>>> --localstatedir=/var --libdir=/usr/lib --includedir=/usr/incl ude
>>> --oldincludedir=/usr/include --infodir=/usr/share/info
>>> --mandir=/usr/share/man --disable-silent-rules
>>> --disable-dependency-tracking
>>> --with-libtool-sysroot=/media/sdb5/eel/build/tmp/sysroots
>>> /qemux86-64 --with-python=yes
>>> --with-python-inc-dir=-I/media/sdb5/eel/build/tmp/sysroots/qemux86-64/usr/include/python2.7
>>>
>>> --enable-nls --without-hyperv --with-remote --without-openvz
>>> --without- phyp --without-augeas --with-xen --with-xenapi
>>> --with-libxl=/media/sdb5/eel/build/tmp/sysroots/qemux86-64/lib
>>> --with-xen-inotify --with-macvtap=no --without-esx --without-vbox
>>> --without-polkit --without-lxc --without-uml --with-test=yes
>>> --with-libvirtd --without-qemu --without-yajl --without-vmware
>>>
>>>
>>> Br,
>>> David
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>>https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

