Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 951FBE006C3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2012 03:07:17 -0800 (PST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2012 03:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,265,1355126400"; d="scan'208";a="261059310"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2012 03:07:15 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.74]) with mapi id
	14.01.0355.002; Wed, 12 Dec 2012 11:07:14 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Thread-Topic: Meta-virtualization build
Thread-Index: Ac3XkEl6NdcRP7LdRpGqqvI3gTfvDAAC/xaAAAGqSr0AATipAAAAyqV9ACjPXYAAAo9irQ==
Date: Wed, 12 Dec 2012 11:07:13 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8F5328@IRSMSX101.ger.corp.intel.com>
References: <97BD068FB200C44AA73C2B641F162ECF8F4F22@IRSMSX101.ger.corp.intel.com>,
	<50C72905.7030003@enea.com>
	<97BD068FB200C44AA73C2B641F162ECF8F4F6E@IRSMSX101.ger.corp.intel.com>,
	<50C73C64.5020702@enea.com>
	<97BD068FB200C44AA73C2B641F162ECF8F4FF0@IRSMSX101.ger.corp.intel.com>,
	<50C85393.2070300@enea.com>
In-Reply-To: <50C85393.2070300@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 12 Dec 2012 11:07:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
I did a cleanall on libvirt and the build was successful. I'll send the pat=
ches on the mailing list.=0A=
=0A=
Thanks for all the help,=0A=
Mihai=0A=
=0A=
=0A=
________________________________________=0A=
From: David Nystr=F6m [david.nystrom@enea.com]=0A=
Sent: Wednesday, December 12, 2012 11:51 AM=0A=
To: Prica, Mihai=0A=
Cc: meta-virtualization@yoctoproject.org=0A=
Subject: Re: Meta-virtualization build=0A=
=0A=
Build Configuration:=0A=
BB_VERSION        =3D "1.16.0"=0A=
TARGET_ARCH       =3D "x86_64"=0A=
TARGET_OS         =3D "linux"=0A=
MACHINE           =3D "qemux86-64"=0A=
DISTRO            =3D "poky"=0A=
DISTRO_VERSION    =3D "1.3"=0A=
TUNE_FEATURES     =3D "m64"=0A=
TARGET_FPU        =3D ""=0A=
meta=0A=
meta-yocto=0A=
meta-yocto-bsp    =3D "danny:27af23e65f63b41962a7cfddba9e9372d5212396"=0A=
meta-oe           =3D "danny:f8ad0760abf8055bac27036853c56f56b40a36c7"=0A=
meta-virtualization =3D "nova:ab6b70a1f495f4ba5e2752878c2d37572cf59c4e"=0A=
=0A=
Build of kvm image with your patches is successful with unmodificed=0A=
libvirt PACKAGECONFIG,  when adding:=0A=
PACKAGECONFIG_pn-libvirt =3D "libvirtd remote qemu yajl test"=0A=
to local.conf and rebuilding.=0A=
=0A=
I get errors below:=0A=
64/usr/lib/libgpg-error.so -lcap ../gnulib/lib/.libs/libgnu.a -lrt=0A=
-lpthread -lutil -ldl -pthread=0A=
|=0A=
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=0A=
undefined reference to `vboxRegister'=0A=
|=0A=
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=0A=
undefined reference to `openvzRegister'=0A=
|=0A=
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=0A=
undefined reference to `curl_global_init'=0A=
|=0A=
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=0A=
undefined reference to `esxRegister'=0A=
|=0A=
/media/sdb5/eel/build/tmp/work/x86_64-poky-linux/libvirt-1.0.0-r0/libvirt-1=
.0.0/src/.libs/libvirt.so:=0A=
undefined reference to `vmwareRegister'=0A=
| collect2: error: ld returned 1 exit status=0A=
=0A=
After bitbake -c cleanall libvirt; bitbake libvirt;=0A=
Build is successful, with new packageconfig.=0A=
=0A=
It seems rebuilds (from sstate ??) is not playing nicely with=0A=
PACKAGECONFIG modifications.=0A=
=0A=
Br,=0A=
David=0A=
=0A=
=0A=
On 12/11/2012 03:30 PM, Prica, Mihai wrote:=0A=
>=0A=
> I tried with the PACKAGECONFIG you suggested and I get other errors, with=
 an undefined reference. If I leave it in its initial form I get other erro=
rs from openbsd-netcat and netcf, but I think these are due to my proxy set=
tings.  I'll continue to look into these errors.=0A=
> I've attached you my patches for kvm. Can you apply them in your repo and=
 see if the build succeeds ?=0A=
>=0A=
> Thanks,=0A=
> Mihai=0A=
>=0A=
> ________________________________________=0A=
> From: David Nystr=F6m [david.nystrom@enea.com]=0A=
> Sent: Tuesday, December 11, 2012 4:00 PM=0A=
> To: Prica, Mihai=0A=
> Cc: ray.danks@se-eng.com; bruce.ashfield@gmail.com=0A=
> Subject: Re: Meta-virtualization build=0A=
>=0A=
> Well,=0A=
>=0A=
> Setting packageconfig to only qemu might not be enough for libvirtd on KV=
M.=0A=
>=0A=
> Packageconfig "qemu" included --with-yajl in the old recipe, it does not=
=0A=
> in the new.=0A=
>=0A=
> OLD config line when setting "qemu" in packageconfig:=0A=
> EXTRA_OECONF =3D "--with-libvirtd --with-test=3Dyes --with-remote=3Dyes=
=0A=
> --with-macvtap=3Dno --with-polkit=3Dno"=0A=
> PACKAGECONFIG[qemu] =3D "--with-qemu --with-yajl, ......=0A=
>=0A=
> To get the same config line with libvirt_1.0.0.bb=0A=
>=0A=
> PACKAGECONFIG =3D "libvirtd remote qemu yajl test"=0A=
>=0A=
> Try setting packageconfig to above, when building qemu/kvm/libvirt 1.0=0A=
>=0A=
> Br,=0A=
> David=0A=
>=0A=
> How about if you build with no modifications=0A=
>=0A=
> On 12/11/2012 02:43 PM, Prica, Mihai wrote:=0A=
>> Hi,=0A=
>>=0A=
>> I tried now to build on a x86-64 target using a fresh poky repo(the late=
st) and I got the same error. I reverted the 2 commits and the build was su=
ccessful. I set PACKAGECONFIG to "qemu" to build only for KVM.=0A=
>>=0A=
>> It seems like a libvirt error, I don't think it has anything to do with =
kvm.=0A=
>>=0A=
>> Thanks,=0A=
>> Mihai=0A=
>>=0A=
>>=0A=
>> ________________________________________=0A=
>> From: David Nystr=F6m [david.nystrom@enea.com]=0A=
>> Sent: Tuesday, December 11, 2012 2:37 PM=0A=
>> To: Prica, Mihai=0A=
>> Cc: ray.danks@se-eng.com; bruce.ashfield@gmail.com=0A=
>> Subject: Re: Meta-virtualization build=0A=
>>=0A=
>> Hi,=0A=
>>=0A=
>> I built for a x86-64 target,on danny branch and did not see this when=0A=
>> building, tested images using kvm on laptop.=0A=
>>=0A=
>> Try reverting commits:=0A=
>> 1c75f19747b91d5d9556aff20b0f740eeffd8028=0A=
>> c83fd72a864acdaf4f9790dbfd14c153ac0a1d4f=0A=
>>=0A=
>> and rebuild if you suspect the new libvirt additions.=0A=
>>=0A=
>> What changed did you make in poky  ?=0A=
>> "mprica:b75157885432312bbdb3189acfb7adf3cdaf8b93"=0A=
>>=0A=
>> Br,=0A=
>> David=0A=
>>=0A=
>> On 12/11/2012 12:11 PM, Prica, Mihai wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> I've developed some patches for KVM integration but I wasn't able to bu=
ild an image because of an error at libvrit compile:=0A=
>>>=0A=
>>> | ../src/.libs/libvirt.so: undefined reference to `virNetTLSInit'=0A=
>>>=0A=
>>>     don't think this is caused by my changes. Did meta-virtualization b=
uild ? This is my build configuration:=0A=
>>>=0A=
>>> BB_VERSION        =3D "1.17.0"=0A=
>>> BUILD_SYS         =3D "x86_64-linux"=0A=
>>> NATIVELSBSTRING   =3D "Ubuntu-12.04"=0A=
>>> TARGET_SYS        =3D "i586-poky-linux"=0A=
>>> MACHINE           =3D "qemux86"=0A=
>>> DISTRO            =3D "poky"=0A=
>>> DISTRO_VERSION    =3D "1.3+snapshot-20121211"=0A=
>>> TUNE_FEATURES     =3D "m32 i586"=0A=
>>> TARGET_FPU        =3D ""=0A=
>>> meta=0A=
>>> meta-yocto=0A=
>>> meta-yocto-bsp    =3D "mprica:b75157885432312bbdb3189acfb7adf3cdaf8b93"=
=0A=
>>> meta-oe           =3D "master:c75fc2573b88576b577946ff834b10446e591532"=
=0A=
>>> meta-virtualization =3D "mihaip:7e9649d297ecddde556a0aa7ed1251e1a727969=
6"=0A=
>>>=0A=
>>> Thanks,=0A=
>>> Mihai=0A=
>>>=0A=

