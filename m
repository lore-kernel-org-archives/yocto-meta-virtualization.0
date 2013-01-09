Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11E2CE00770
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Jan 2013 11:57:09 -0800 (PST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2013 11:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,439,1355126400"; d="scan'208";a="244209842"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2013 11:57:07 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.151]) with mapi id
	14.01.0355.002; Wed, 9 Jan 2013 19:57:06 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 2/2] Created new
	target:kvm-image-minimal
Thread-Index: AQHN7N2XEnESeo1vNEq03Ab3kd4Iwpg+UNsAgAMZMtA=
Date: Wed, 9 Jan 2013 19:57:05 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8FB687@IRSMSX101.ger.corp.intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-3-git-send-email-mihai.prica@intel.com>
	<CADkTA4N3E2JpKxm6tzBz6TOs0cAx+OkB_q2e+=bExLSgFUyPNg@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A818CA5@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A818CA5@039-SN1MPN1-002.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Wed, 09 Jan 2013 19:57:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: McClintock Matthew-B29882 [mailto:B29882@freescale.com]=20
Sent: Monday, January 07, 2013 10:27 PM
To: Bruce Ashfield
Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 2/2] Created new target:kvm-image=
-minimal

On Mon, Jan 7, 2013 at 7:47 AM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
>
>
> On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <mihai.prica@intel.com> wrote=
:
>>
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>>  recipes-extended/images/kvm-image-minimal.bb |   22
>> ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>>
>> diff --git a/recipes-extended/images/kvm-image-minimal.bb
>> b/recipes-extended/images/kvm-image-minimal.bb
>> new file mode 100644
>> index 0000000..486cd9c
>> --- /dev/null
>> +++ b/recipes-extended/images/kvm-image-minimal.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "A minimal kvm image"
>> +
>> +IMAGE_INSTALL =3D " \
>> +    packagegroup-core-boot \
>
>
> Have you thought about an image variant that isn't actually bootable ?=20
> There are quite a few use cases where having the build not depend on a=20
> kernel, but instead simply creates a userspace that can be booted via=20
> feeding an external kernel directly to qemu on the command line.
>
> Not having the kernel decadency turns out to be quite useful when you=20
> want to build a KVM host and KVM guest kernel with different=20
> configurations, in a single build.

I don't exactly understand what you mean by " an image variant that isn't a=
ctually bootable ?". I just used core-image-minimal as a starting point. Us=
ing this recipe you just get the ext3 and the kernel, you don't get an hddi=
mg..

> I've shared this with Bruce before so I thought I would share on this lis=
t also. It's hacky and possibly not the way to go but we have been doing th=
is in a kvm image. Not the depends, and the post process addition.
>
> fsl-image-kvm.bb:
>
> #
> # Copyright (C) 2007 OpenedHand Ltd.
> #
> IMAGE_INSTALL =3D "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} u=
-boot"
> IMAGE_LINGUAS =3D " "
>
> PR =3D "r1"
>
> LICENSE =3D "MIT"
>
> inherit core-image
>
> IMAGE_ROOTFS_SIZE =3D "8192"
>
> # remove not needed ipkg informations
> ROOTFS_POSTPROCESS_COMMAND +=3D "remove_packaging_data_files ; mkdir ${IM=
AGE_ROOTFS}/images; cp ${DEPLOY_DIR_IMAGE}/fsl-image-minimal-${MACHINE}.ext=
2.gz.u-boot
> ${IMAGE_ROOTFS}/images"
>
> IMAGE_FSTYPES =3D "tar.gz ext2.gz.u-boot"
>
> # pkgconfig is here for qemu, and it's not in DEPENDS because of multilib=
 # build issues. to fix later IMAGE_INSTALL +=3D "pkgconfig qemu kernel-ima=
ge"
>
> do_rootfs[depends] +=3D "fsl-image-minimal:do_rootfs"

Thanks for the recipe. I'll see what I can use from it.
=20

Mihai
>
>
> Cheers,
>
> Bruce
>
>>
>> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>> +    qemu \
>> +    libvirt \
>> +    libvirt-libvirtd \
>> +    libvirt-virsh \
>> +    "
>> +
>> +IMAGE_FEATURES +=3D "ssh-server-openssh"
>> +
>> +IMAGE_LINGUAS =3D " "
>> +
>> +LICENSE =3D "MIT"
>> +
>> +inherit core-image
>> +
>> +IMAGE_ROOTFS_SIZE =3D "8192"
>> +
>> +ROOTFS_POSTPROCESS_COMMAND +=3D "remove_packaging_data_files ; "
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
> "Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end"
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

