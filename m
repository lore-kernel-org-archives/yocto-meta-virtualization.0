Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id DE03EE006B4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2012 01:51:32 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.2.318.1;
	Wed, 12 Dec 2012 10:51:29 +0100
Message-ID: <50C85393.2070300@enea.com>
Date: Wed, 12 Dec 2012 10:51:15 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Prica, Mihai" <mihai.prica@intel.com>
References: <97BD068FB200C44AA73C2B641F162ECF8F4F22@IRSMSX101.ger.corp.intel.com>,
	<50C72905.7030003@enea.com>
	<97BD068FB200C44AA73C2B641F162ECF8F4F6E@IRSMSX101.ger.corp.intel.com>,
	<50C73C64.5020702@enea.com>
	<97BD068FB200C44AA73C2B641F162ECF8F4FF0@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8F4FF0@IRSMSX101.ger.corp.intel.com>
X-Originating-IP: [172.16.140.28]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Meta-virtualization build
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
X-List-Received-Date: Wed, 12 Dec 2012 09:51:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

Build Configuration:
BB_VERSION        =3D "1.16.0"
TARGET_ARCH       =3D "x86_64"
TARGET_OS         =3D "linux"
MACHINE           =3D "qemux86-64"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.3"
TUNE_FEATURES     =3D "m64"
TARGET_FPU        =3D ""
meta
meta-yocto
meta-yocto-bsp    =3D "danny:27af23e65f63b41962a7cfddba9e9372d5212396"
meta-oe           =3D "danny:f8ad0760abf8055bac27036853c56f56b40a36c7"
meta-virtualization =3D "nova:ab6b70a1f495f4ba5e2752878c2d37572cf59c4e"

Build of kvm image with your patches is successful with unmodificed=20
libvirt PACKAGECONFIG,  when adding:
PACKAGECONFIG_pn-libvirt =3D "libvirtd remote qemu yajl test"
to local.conf and rebuilding.

I get errors below:
64/usr/lib/libgpg-error.so -lcap ../gnulib/lib/.libs/libgnu.a -lrt=20
-lpthread -lutil -ldl -pthread
|=20
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=20
undefined reference to `vboxRegister'
|=20
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=20
undefined reference to `openvzRegister'
|=20
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=20
undefined reference to `curl_global_init'
|=20
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=20
undefined reference to `esxRegister'
|=20
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=20
undefined reference to `vmwareRegister'
| collect2: error: ld returned 1 exit status

After bitbake -c cleanall libvirt; bitbake libvirt;
Build is successful, with new packageconfig.

It seems rebuilds (from sstate ??) is not playing nicely with=20
PACKAGECONFIG modifications.

Br,
David


On 12/11/2012 03:30 PM, Prica, Mihai wrote:
>
> I tried with the PACKAGECONFIG you suggested and I get other errors, with=
 an undefined reference. If I leave it in its initial form I get other erro=
rs from openbsd-netcat and netcf, but I think these are due to my proxy set=
tings.  I'll continue to look into these errors.
> I've attached you my patches for kvm. Can you apply them in your repo and=
 see if the build succeeds ?
>
> Thanks,
> Mihai
>
> ________________________________________
> From: David Nystr=F6m [david.nystrom@enea.com]
> Sent: Tuesday, December 11, 2012 4:00 PM
> To: Prica, Mihai
> Cc: ray.danks@se-eng.com; bruce.ashfield@gmail.com
> Subject: Re: Meta-virtualization build
>
> Well,
>
> Setting packageconfig to only qemu might not be enough for libvirtd on KV=
M.
>
> Packageconfig "qemu" included --with-yajl in the old recipe, it does not
> in the new.
>
> OLD config line when setting "qemu" in packageconfig:
> EXTRA_OECONF =3D "--with-libvirtd --with-test=3Dyes --with-remote=3Dyes
> --with-macvtap=3Dno --with-polkit=3Dno"
> PACKAGECONFIG[qemu] =3D "--with-qemu --with-yajl, ......
>
> To get the same config line with libvirt_1.0.0.bb
>
> PACKAGECONFIG =3D "libvirtd remote qemu yajl test"
>
> Try setting packageconfig to above, when building qemu/kvm/libvirt 1.0
>
> Br,
> David
>
> How about if you build with no modifications
>
> On 12/11/2012 02:43 PM, Prica, Mihai wrote:
>> Hi,
>>
>> I tried now to build on a x86-64 target using a fresh poky repo(the late=
st) and I got the same error. I reverted the 2 commits and the build was su=
ccessful. I set PACKAGECONFIG to "qemu" to build only for KVM.
>>
>> It seems like a libvirt error, I don't think it has anything to do with =
kvm.
>>
>> Thanks,
>> Mihai
>>
>>
>> ________________________________________
>> From: David Nystr=F6m [david.nystrom@enea.com]
>> Sent: Tuesday, December 11, 2012 2:37 PM
>> To: Prica, Mihai
>> Cc: ray.danks@se-eng.com; bruce.ashfield@gmail.com
>> Subject: Re: Meta-virtualization build
>>
>> Hi,
>>
>> I built for a x86-64 target,on danny branch and did not see this when
>> building, tested images using kvm on laptop.
>>
>> Try reverting commits:
>> 1c75f19747b91d5d9556aff20b0f740eeffd8028
>> c83fd72a864acdaf4f9790dbfd14c153ac0a1d4f
>>
>> and rebuild if you suspect the new libvirt additions.
>>
>> What changed did you make in poky  ?
>> "mprica:b75157885432312bbdb3189acfb7adf3cdaf8b93"
>>
>> Br,
>> David
>>
>> On 12/11/2012 12:11 PM, Prica, Mihai wrote:
>>> Hi,
>>>
>>> I've developed some patches for KVM integration but I wasn't able to bu=
ild an image because of an error at libvrit compile:
>>>
>>> | ../src/.libs/libvirt.so: undefined reference to `virNetTLSInit'
>>>
>>>     don't think this is caused by my changes. Did meta-virtualization b=
uild ? This is my build configuration:
>>>
>>> BB_VERSION        =3D "1.17.0"
>>> BUILD_SYS         =3D "x86_64-linux"
>>> NATIVELSBSTRING   =3D "Ubuntu-12.04"
>>> TARGET_SYS        =3D "i586-poky-linux"
>>> MACHINE           =3D "qemux86"
>>> DISTRO            =3D "poky"
>>> DISTRO_VERSION    =3D "1.3+snapshot-20121211"
>>> TUNE_FEATURES     =3D "m32 i586"
>>> TARGET_FPU        =3D ""
>>> meta
>>> meta-yocto
>>> meta-yocto-bsp    =3D "mprica:b75157885432312bbdb3189acfb7adf3cdaf8b93"
>>> meta-oe           =3D "master:c75fc2573b88576b577946ff834b10446e591532"
>>> meta-virtualization =3D "mihaip:7e9649d297ecddde556a0aa7ed1251e1a727969=
6"
>>>
>>> Thanks,
>>> Mihai
>>>

