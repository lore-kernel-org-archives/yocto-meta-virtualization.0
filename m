Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E89CE004AB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2013 07:49:20 -0800 (PST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2013 07:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,539,1355126400"; d="scan'208";a="278412343"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2013 07:48:59 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 25 Jan 2013 15:48:47 +0000
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.60]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Fri, 25 Jan 2013 15:48:47 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, lei yang
	<yanglei.fage@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH v2 1/2] linux-yocto: added kernel
	configuration for KVM
Thread-Index: AQHN8BiHWcEbwWvPNkqaM/lSMSY7dphEn4oAgACW4YCAAiOHgIAS7Bcw
Date: Fri, 25 Jan 2013 15:48:47 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF914A03@IRSMSX101.ger.corp.intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<CADkTA4Nh1b6oySSoz59oODeLyehSYdGsUrh3JMLK2C9=AOZaKg@mail.gmail.com>
	<CAHsH0E8431dvHzC+qHerH6UqpDp3KbUzOf8vE5KXHUw0+23_QQ@mail.gmail.com>
	<CADkTA4OWKDPuP+g_VDqfoWGkRHaee-aOS+WhCySYMb7kPwjxQw@mail.gmail.com>
In-Reply-To: <CADkTA4OWKDPuP+g_VDqfoWGkRHaee-aOS+WhCySYMb7kPwjxQw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Fri, 25 Jan 2013 15:49:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]=20
> Sent: Sunday, January 13, 2013 4:49 PM
> To: lei yang
> Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH v2 1/2] linux-yocto: added kern=
el configuration for KVM
>
>
>
> On Sat, Jan 12, 2013 at 1:08 AM, lei yang <yanglei.fage@gmail.com> wrote:
> On Fri, Jan 11, 2013 at 1:08 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica <mihai.prica@intel.com> w=
rote:
> >>
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>> =A0recipes-kernel/linux/linux-yocto_3.4.bbappend | =A0 =A05 +++++
>> =A01 file changed, 5 insertions(+)
>>
>> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> index 5b163ff..6fa02e8 100644
>> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>> @@ -6,3 +6,8 @@ SRC_URI +=3D "file://xt-checksum.scc \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \
>> =A0 =A0 =A0 =A0 =A0 =A0 "
>>
>> +KERNEL_FEATURES_append =3D " kvm/qemu-kvm-enable"
>
>
> Have you confirmed that this is adding the option you want ? I would have
> expected this to be:
>
> KERNEL_FEATURES_append =3D " features/kvm/qemu-kvm-enable.scc"
>
>
> Hi Bruce,
>
> I also notice this, I did a serch in internal layer just found below
> in wr-kernel use the same way
>
> templates/feature/libhugetlbfs/template.conf:KERNEL_FEATURES_append +=3D
> "features/hugetlb"
>
> I don't know if there is defect for this, both work or not,or we like
>.scc is there(coding style)
>
> They style is an older way of doing things. I have a yocto 1.4 bugzilla e=
ntry to convert
> all cases of features that do not end with ".scc" to the more explicit fo=
rmat that includes
> the extension.
>
> So no need to do anything special, but just keep in mind to use ".scc" wh=
en possible,=A0
> and eventually existing features will be converted.
>
> Cheers,
>
> Bruce

I see that this hasn't been merged to master. Do I have to redo this  with =
"features/kvm/qemu-kvm-enable.scc" ?

Mihai

> I'm glad to do a test later.
>
> Lei
>
>
>>
>> +
>> +module_autoload_kvm =3D "kvm"
>> +module_autoload_kvm-amd =3D "kvm-amd"
>> +module_autoload_kvm-intel =3D "kvm-intel"
>
>
> This part looks fine though.
>
> Cheers,
>
> Bruce
>
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at
> its end"
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>




--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"=20

