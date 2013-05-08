Return-Path: <Ben.Warren@spidercloud.com>
Received: from berg.int.copivia.com (mailgate1.spidercloud.com [209.49.242.60])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 438E9E01407
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 May 2013 13:57:47 -0700 (PDT)
Received: from mailx.spidercloud.com ([10.1.1.225])
	by berg.int.copivia.com (8.13.8/8.13.8) with ESMTP id r48KvkEx006843
	for <meta-virtualization@yoctoproject.org>;
	Wed, 8 May 2013 13:57:46 -0700
Received: from sofia.us.spidercloud.com ([10.1.1.225]) by
	sofia.us.spidercloud.com ([10.1.1.225]) with mapi;
	Wed, 8 May 2013 13:57:46 -0700
From: Ben Warren <Ben.Warren@spidercloud.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Date: Wed, 8 May 2013 13:57:45 -0700
Thread-Topic: `virNetTLSInit' link error when building libvirt
Thread-Index: Ac5MLrDXHajDKtLkSSyHR66X3EsdAA==
Message-ID: <89EFFFA7-0CB8-409C-BF0F-2355ED1BA0FD@spidercloud.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: `virNetTLSInit' link error when building libvirt
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
X-List-Received-Date: Wed, 08 May 2013 20:57:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to add virtualization support to my Yocto project and can't get =
libvirt to build.  In particular, the following link error occurs:

| ../src/.libs/libvirt.so: undefined reference to `virNetTLSInit'
| collect2: error: ld returned 1 exit status

Looking at the code, this function is conditionally compiled as:

#ifdef WITH_GNUTLS
    virNetTLSInit();
#endif

and the function itself is here:
libvirt-1.0.3/src/rpc/virnettlscontext.c

I don't see any .o files in that 'rpc' directory, so it appears that the fi=
les aren't being compiled, hence the link error.

I'm using the following code revisions:
	=95 poky @ git tag 'dylan 9.0.0'
	=95 meta-virtualization @ git commit 22e7b5e92b33e5fe18723083ce69867749839=
894 (5/3/2013)
	=95 meta-oa @ git commit a8b96b69bd418b74f48dc4d111caac676ae667f5 (4/27/20=
13 from git://github.com/openembedded/meta-oe.git)

My build command line is:

MACHINE=3Dscw-appscard bitbake kvm-image-minimal

where the 'scw_appscard' BSP is identical to 'crystalforest' (x86_64) with =
some kernel config modifications.

My bblayers are:
BBLAYERS ?=3D " \
  /opt/poky/meta \
  /opt/poky/meta-yocto \
  /opt/poky/meta-yocto-bsp \
  /opt/meta-oe/meta-oe \
  /opt/meta-oe/meta-networking \
  /opt/meta-virtualization \
  /opt/meta-scw-appscard \
  "

Does anybody have insight as to why this won't build?

thanks,
Ben=

