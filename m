Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 693D3E01468
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Jan 2013 02:45:02 -0800 (PST)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Jan 2013 02:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="191276208"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jan 2013 02:44:48 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 15 Jan 2013 10:44:42 +0000
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.213]) with mapi id
	14.01.0355.002; Tue, 15 Jan 2013 10:44:41 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: "lei.yang@windriver.com" <lei.yang@windriver.com>
Thread-Topic: [meta-virtualization] [PATCH v2 2/2] Created new
	target:kvm-image-minimal
Thread-Index: AQHN8BiHtWdZ/usQO028YMJ+BamZwphEXrgAgAXaMOA=
Date: Tue, 15 Jan 2013 10:44:41 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8FC42C@IRSMSX101.ger.corp.intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<1357921647-17864-2-git-send-email-mihai.prica@intel.com>
	<50F04908.2020103@windriver.com>
In-Reply-To: <50F04908.2020103@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 15 Jan 2013 10:45:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Lei Yang [mailto:lei.yang@windriver.com]
> Sent: Friday, January 11, 2013 7:17 PM
> To: Prica, Mihai
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new target:kvm-=
image-
> minimal
>=20
> On 01/12/2013 12:27 AM, Mihai Prica wrote:
> > Signed-off-by: Mihai Prica<mihai.prica@intel.com>
> > ---
> >   recipes-extended/images/kvm-image-minimal.bb |   28
> ++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >   create mode 100644 recipes-extended/images/kvm-image-minimal.bb
> >
> > diff --git a/recipes-extended/images/kvm-image-minimal.bb
> > b/recipes-extended/images/kvm-image-minimal.bb
> > new file mode 100644
> > index 0000000..275c43b
> > --- /dev/null
> > +++ b/recipes-extended/images/kvm-image-minimal.bb
> > @@ -0,0 +1,28 @@
> > +DESCRIPTION =3D "A minimal kvm image"
> > +
> > +IMAGE_INSTALL =3D " \
> > +    packagegroup-core-boot \
> > +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> > +    qemu \
> > +    libvirt \
> > +    libvirt-libvirtd \
> > +    libvirt-virsh \
> > +    "
> > +
> > +IMAGE_FEATURES +=3D "ssh-server-openssh"
> > +
> > +IMAGE_LINGUAS =3D " "
> > +
> > +LICENSE =3D "MIT"
> > +
> > +inherit core-image
> > +
> > +IMAGE_ROOTFS_SIZE =3D "8192"
> > +
> > +ROOTFS_POSTPROCESS_COMMAND +=3D "remove_packaging_data_files ; "
> > +
> > +PACKAGE_INSTALL_ATTEMPTONLY =3D "\
> Hi Mibai
>=20
> can you explain "PACKAGE_INSTALL_ATTEMPTONLY " to me, I just see this
> variable first time

In an image recipe you can't use RRECOMMENDS to specify a list of packages =
that extend the usability of the image being built.  In this type of recipe=
 you can use PACKAGE_INSTALL_ATTEMPTONLY that has the same functionality.

Thanks,
Mihai
>=20
> Lei
> :-)
>=20
> > +    kernel-module-kvm \
> > +    kernel-module-kvm-intel \
> > +    kernel-module-kvm-amd \
> > +    "


