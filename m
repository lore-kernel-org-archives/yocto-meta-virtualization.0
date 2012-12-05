Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id DB5C9E0045D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Dec 2012 02:25:04 -0800 (PST)
Received: from [5.5.8.21] (192.168.201.202) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.2.318.1; Wed, 5 Dec 2012 11:25:01 +0100
Message-ID: <50BF20FD.3060602@enea.com>
Date: Wed, 5 Dec 2012 11:25:01 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <50BE184E.2000403@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8F260F@IRSMSX101.ger.corp.intel.com>
	<50BE1EE8.30504@enea.com>, <50BE34FC.8040205@se-eng.com>
	<88701C38B5D07249817D428430999C9128A89A70@sestoex05.enea.se>
	<50BE773C.7080905@linux.intel.com>
In-Reply-To: <50BE773C.7080905@linux.intel.com>
X-Originating-IP: [192.168.201.202]
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
X-List-Received-Date: Wed, 05 Dec 2012 10:25:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/04/2012 11:20 PM, Saul Wold wrote:
> On 12/04/2012 01:43 PM, David Nystr=F6m wrote:
>> Ray,
>>
>> Yes, of course. Let's add a *-minimal package configs,
>> if none are set, we'll let it autodetect + add full dependencies
>> otherwise.

> Won't using autodetect cause inconsistencies depending on how the image
> gets built,

Yes, if by inconsistencies you mean that binary package will differ=20
depending on sysroot content, i.e. DEPENDS.

 > it will also lead to a lot larger dependency requirement.
Not nessecarily, since DEPENDS might be dynamically added with=20
PACKAGECONFIG variables. But I understand what you are aiming at here.

> I know it's better to have a known list of what's in and what's out.
> Autoconf has caused inconsistencies in the past, when options are not
> specified.

I understand and agree, autodetect does wreak havoc on DEPEND/RDEPEND=20
semantics, since some packages tries to autodetect RDEPENDS, which will=20
have to be placed in DEPENDS to able to be properly autodetected.

I suspect regressions are also caught in buildtime when having it either=20
on or off, rather than having autoconf errors detected in runtime. I'll=20
adjust accordingly.

Best Regards,
David

>
> Sau!
>
>> Is it OK for you if I set it to auto detect by default? , this would
>> imply
>> a local.conf addition to optimize for footprint.
>> I'm guessing package config selects cannot be set from an image file,
>> I'll give that a try tomorrow.
>>
>> Br,
>> David
>>
>> Sent from my Android phone using TouchDown (www.nitrodesk.com)
>>
>> -----Original Message-----
>> *From:* Raymond Danks [ray.danks@se-eng.com]
>> *Received:* Tuesday, 04 Dec 2012, 18:38
>> *To:* David Nystr=F6m [David.Nystrom@enea.com]
>> *CC:* Prica, Mihai [mihai.prica@intel.com];
>> meta-virtualization@yoctoproject.org
>> [meta-virtualization@yoctoproject.org]
>> *Subject:* Re: [meta-virtualization] PACKAGECONFIG variables.
>>
>> David,
>>
>> XenAPI is used by XenServer and Xen Cloud Platform.  There is currently
>> no underlying metadata support for these packages, so this should be
>> disabled.
>>
>> I do, in fact have binary size constraints.  I see where you are going
>> with this, but would it be possible instead to add a "detect" or "all"
>> to PACKAGECONFIG?  I suppose an alternative would be to add "*-minimal"
>> to PACKAGECONFIG which tweak the configure to create minimal build
>> configurations.
>>
>> Ray
>>
>> On 12/04/2012 09:03 AM, David Nystr=F6m wrote:
>>> I have some issues with how PACKAGECONFIG works, do you guys mind if I
>>> disable all --without functionality in PACKAGECONFIG, and let libvirt
>>> ./configure autodetect dependencies ?
>>> This will result in a bigger libvirt binary, and
>>> libnl, netcf, augeas, polkit dependencies being mandatory for all
>>> users of libvirt, unless explicitly disabled by the "xen" PACKAGECONFIG=
.
>>>
>>> Does anyone have any binary size constraints ?
>>>
>>> Br,
>>> David
>>>
>>> On 12/04/2012 04:49 PM, Prica, Mihai wrote:
>>>>
>>>> Hi,
>>>>
>>>> The error is because configure is called with the --with-xenapi
>>>> option. I think there is a bug in the recipe at the
>>>> PACKAGECONFIG[xen] line. It should be --without-xenapi instead of the
>>>> first --with-xenapi. I don't know exactly what xenapi does, Raymond
>>>> can give you more details here.
>>>>
>>>> Try to change this and see if it works.
>>>>
>>>> Thanks,
>>>> Mihai
>>>>
>>>> -----Original Message-----
>>>> From: David Nystr=F6m [mailto:david.c.nystrom@gmail.com]
>>>> Sent: Tuesday, December 04, 2012 5:36 PM
>>>> To: Raymond Danks
>>>> Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
>>>> Subject: PACKAGECONFIG variables.
>>>>
>>>> Hi All,
>>>>
>>>> When trying to upgrade to libvirt-1.0, I'm getting some strange errors=
.
>>>> How could this pass with the old libvirt I dont know.
>>>>
>>>> Is the XenAPI driver something you explicitly build and use ?
>>>>
>>>> ------------------------------------------------------------------
>>>> checking for xen_vm_start in -lxenserver... no
>>>> configure: error: You must install the XenServer Library to compile
>>>> XenAPI driver with -lxenserver Configure failed. The contents of all
>>>> config.log files follows to aid debugging
>>>> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/libv=
irt-1.0.0/config.log
>>>>
>>>> This file contains any messages produced by compilers while running
>>>> configure, to aid debugging if configure makes a mistake.
>>>>
>>>> It was created by libvirt configure 1.0.0, which was generated by GNU
>>>> Autoconf 2.69.  Invocation command line was
>>>>
>>>>     $
>>>> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r1/libv=
irt-1.0.0/configure
>>>>
>>>>
>>>> --build=3Dx86_64-linux --host=3Dx86_64-poky-linux
>>>> --target=3Dx86_64-poky-linux --prefix=3D/usr --exec_prefi x=3D/usr
>>>> --bindir=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/libexec
>>>> --datadir=3D/usr/share --sysconfdir=3D/etc --sharedstatedir=3D/com
>>>> --localstatedir=3D/var --libdir=3D/usr/lib --includedir=3D/usr/incl ud=
e
>>>> --oldincludedir=3D/usr/include --infodir=3D/usr/share/info
>>>> --mandir=3D/usr/share/man --disable-silent-rules
>>>> --disable-dependency-tracking
>>>> --with-libtool-sysroot=3D/media/sdb5/eel/build/tmp/sysroots
>>>> /qemux86-64 --with-python=3Dyes
>>>> --with-python-inc-dir=3D-I/media/sdb5/eel/build/tmp/sysroots/qemux86-6=
4/usr/include/python2.7
>>>>
>>>>
>>>> --enable-nls --without-hyperv --with-remote --without-openvz
>>>> --without- phyp --without-augeas --with-xen --with-xenapi
>>>> --with-libxl=3D/media/sdb5/eel/build/tmp/sysroots/qemux86-64/lib
>>>> --with-xen-inotify --with-macvtap=3Dno --without-esx --without-vbox
>>>> --without-polkit --without-lxc --without-uml --with-test=3Dyes
>>>> --with-libvirtd --without-qemu --without-yajl --without-vmware
>>>>
>>>>
>>>> Br,
>>>> David
>>>> _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>
>>
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>

