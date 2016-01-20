Return-Path: <brian.mcgillion@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FCBEE00BB7; Wed, 20 Jan 2016 08:11:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.223.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7607E00B83
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Jan 2016 08:11:04 -0800 (PST)
Received: by mail-io0-f178.google.com with SMTP id 77so24420175ioc.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Jan 2016 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=MfbU/q5DAcK+VzI6eShenJNfVDaqI6RtrjwQVX0OaoI=;
	b=0yZSuusxTWoQkoOMaSQI7pf0BCdlf7I7Y4u7UT8siVIU4XOoW0vB95JJ4m6Rh+4frU
	gZHAPCicTOVryDpm2HoMPH13qYB03vmHXIDfMPkdGO46xCuIL9xbJrVzab3NJ9XQHcb3
	wkNtly42EvHstkNOtfwI3yMtk9wZ/GnkbfN//nlrKrCRYlkQuBbk/SyCo3iBJQRswJ4J
	zfjbCJVkDKxcyf1D20XdJBovqij16XG1bu1BRzlC/3FZ3lhkZlh65bCw9J+5DP1lbk6m
	aVpbjm2OnivOaM01UCIpXDP7afeRdAXVnqS8CKU3kU31whBCvU2NQxLcw2nTXFyh7S6x
	45dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=MfbU/q5DAcK+VzI6eShenJNfVDaqI6RtrjwQVX0OaoI=;
	b=CVDk/r7RP1eigvPb7bHsRQN/tFhjk86sDetAwvBRGyyUHMQaAK6s8rp9pwkhaLm37C
	ZrRhbAWc8NcELAe9eDsHKMq1bghkqpWWQ52ZUkNBuXB8G9hCw8zHiATaqD52F/P78d5H
	KFWQ06n4R9je/1WShZ2DX+fiqYTaWprEtVZLJ0jaHO8kM9Zg1dMaImrXRhas24Ozg0oC
	RZqXkqCo68FRtQmhEDQoeCWbkPVdN/YE1xEf2uOZSj/c4bdQlIqwy2xRLtST3FbwZbWr
	BRYgCKabqpQ5L0kqnXhTbFAnPMmwT62I8R+CHrpIizbDaA14SEN8SyBWD0CyslHJ+zPW
	WNtg==
X-Gm-Message-State: ALoCoQkKuHFXG5M0qOKjpn9QckjiQKCh9UPBbc7QLJ3lRmw8CSMnjEXakUcAN4JXOZX7Q5tknU3FAebpuwCrRLF8817CX0VtUd9yPWVFKOblaiCoS8viCgI=
MIME-Version: 1.0
X-Received: by 10.107.128.37 with SMTP id b37mr30440536iod.183.1453306263404; 
	Wed, 20 Jan 2016 08:11:03 -0800 (PST)
Received: by 10.36.117.72 with HTTP; Wed, 20 Jan 2016 08:11:03 -0800 (PST)
Date: Wed, 20 Jan 2016 18:11:03 +0200
Message-ID: <CADqm_SRdKySYQwvUMepd3uVvYzLW+Qd6tc77k616h3BiTe5-NQ@mail.gmail.com>
From: "McGillion, Brian" <brian.mcgillion@intel.com>
To: meta-virtualization@yoctoproject.org
Subject: Failure to build xen-image-minimal
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
X-List-Received-Date: Wed, 20 Jan 2016 16:11:10 -0000
Content-Type: multipart/alternative; boundary=001a113f8f66949f7a0529c63bf8

--001a113f8f66949f7a0529c63bf8
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to build a default xen-image-minimal target.

Followed these steps
git clone http://git.yoctoproject.org/git/poky
cd poky/
git clone git://git.yoctoproject.org/meta-yocto-kernel-extras
git clone git://git.yoctoproject.org/meta-intel.git
git clone git://git.yoctoproject.org/meta-virtualization
git clone git://github.com/openembedded/meta-openembedded.git
git clone git://github.com/errordeveloper/oe-meta-go.git

source oe-init-build-env

bitbake-layers add-layer meta-intel
bitbake-layers add-layer meta-virtualization
bitbake-layers add-layer meta-openembedded/meta-oe
bitbake-layers add-layer meta-openembedded/meta-networking
bitbake-layers add-layer meta-openembedded/meta-python
bitbake-layers add-layer meta-openembedded/meta-filesystems
bitbake-layers add-layer oe-meta-go


edit conf/local.conf adding the following

MACHINE ?= "intel-corei7-64" or MACHINE ?= "genericx86_64"
PACKAGE_CLASSES = "package_deb "


bitbake xen-image-minimal



with the following result:

ERROR: Unable to install packages. Command
'/home/brian/embedded/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/apt-get
 install --force-yes --allow-unauthenticated kernel-module-xen-netback
kernel-module-xen-gntalloc run-postinsts kernel-module-xen-acpi-processor
packagegroup-core-ssh-openssh kernel-module-xen-pciback
kernel-module-xen-blkback kernel-module-xen-gntdev qemu xen-base
packagegroup-core-boot kernel-module-xen-wdt' returned 100:
Reading package lists...
Building dependency tree...
Reading state information...
E: Unable to locate package kernel-module-xen-netback
E: Unable to locate package kernel-module-xen-gntalloc
E: Unable to locate package kernel-module-xen-acpi-processor
E: Unable to locate package kernel-module-xen-pciback
E: Unable to locate package kernel-module-xen-blkback
E: Unable to locate package kernel-module-xen-gntdev
E: Unable to locate package kernel-module-xen-wdt

ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/brian/embedded/yocto/poky/build/tmp/work/genericx86_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_rootfs.25163
ERROR: Task 9
(/home/brian/embedded/yocto/poky/meta-virtualization/recipes-extended/images/
xen-image-minimal.bb, do_rootfs) failed with exit code '1'


if the following directory should contain the final kernel .config that is
being built then I do not see the xen config options that are defined
in /meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg being
applied.

yocto/poky/build/tmp/work/genericx86_64-poky-linux/linux-yocto/4.1.15+gitAUTOINC+46bb64d605_788dfc9859-r0/linux-genericx86_64-standard-build

Any help is greatly appreciated.

Thanks,
Brian

--001a113f8f66949f7a0529c63bf8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to build a default xen-=
image-minimal target.</div><div><br></div><div>Followed these steps<br><div=
>git clone <a href=3D"http://git.yoctoproject.org/git/poky">http://git.yoct=
oproject.org/git/poky</a><br></div><div><div>cd poky/</div><div>git clone g=
it://<a href=3D"http://git.yoctoproject.org/meta-yocto-kernel-extras">git.y=
octoproject.org/meta-yocto-kernel-extras</a></div><div>git clone git://<a h=
ref=3D"http://git.yoctoproject.org/meta-intel.git">git.yoctoproject.org/met=
a-intel.git</a></div><div>git clone git://<a href=3D"http://git.yoctoprojec=
t.org/meta-virtualization">git.yoctoproject.org/meta-virtualization</a></di=
v><div>git clone git://<a href=3D"http://github.com/openembedded/meta-opene=
mbedded.git">github.com/openembedded/meta-openembedded.git</a></div><div>gi=
t clone git://<a href=3D"http://github.com/errordeveloper/oe-meta-go.git">g=
ithub.com/errordeveloper/oe-meta-go.git</a></div><div><br></div><div>source=
 oe-init-build-env</div><div><br></div><div>bitbake-layers add-layer meta-i=
ntel</div><div>bitbake-layers add-layer meta-virtualization</div><div>bitba=
ke-layers add-layer meta-openembedded/meta-oe</div><div>bitbake-layers add-=
layer meta-openembedded/meta-networking</div><div>bitbake-layers add-layer =
meta-openembedded/meta-python</div><div>bitbake-layers add-layer meta-opene=
mbedded/meta-filesystems</div><div>bitbake-layers add-layer oe-meta-go</div=
><div><br></div><div><br></div><div>edit conf/local.conf adding the followi=
ng</div><div><br></div><div>MACHINE ?=3D &quot;intel-corei7-64&quot; or=C2=
=A0MACHINE ?=3D &quot;genericx86_64&quot;</div><div>PACKAGE_CLASSES =3D &qu=
ot;package_deb &quot;</div></div></div><div><br></div><div><br></div><div>b=
itbake xen-image-minimal<br></div><div><br></div><div><br></div><div><br></=
div><div>with the following result:</div><div><br></div><div><div>ERROR: Un=
able to install packages. Command &#39;/home/brian/embedded/yocto/poky/buil=
d/tmp/sysroots/x86_64-linux/usr/bin/apt-get =C2=A0install --force-yes --all=
ow-unauthenticated kernel-module-xen-netback kernel-module-xen-gntalloc run=
-postinsts kernel-module-xen-acpi-processor packagegroup-core-ssh-openssh k=
ernel-module-xen-pciback kernel-module-xen-blkback kernel-module-xen-gntdev=
 qemu xen-base packagegroup-core-boot kernel-module-xen-wdt&#39; returned 1=
00:</div><div>Reading package lists...</div><div>Building dependency tree..=
.</div><div>Reading state information...</div><div>E: Unable to locate pack=
age kernel-module-xen-netback</div><div>E: Unable to locate package kernel-=
module-xen-gntalloc</div><div>E: Unable to locate package kernel-module-xen=
-acpi-processor</div><div>E: Unable to locate package kernel-module-xen-pci=
back</div><div>E: Unable to locate package kernel-module-xen-blkback</div><=
div>E: Unable to locate package kernel-module-xen-gntdev</div><div>E: Unabl=
e to locate package kernel-module-xen-wdt</div><div><br></div><div>ERROR: F=
unction failed: do_rootfs</div><div>ERROR: Logfile of failure stored in: /h=
ome/brian/embedded/yocto/poky/build/tmp/work/genericx86_64-poky-linux/xen-i=
mage-minimal/1.0-r0/temp/log.do_rootfs.25163</div><div>ERROR: Task 9 (/home=
/brian/embedded/yocto/poky/meta-virtualization/recipes-extended/images/<a h=
ref=3D"http://xen-image-minimal.bb">xen-image-minimal.bb</a>, do_rootfs) fa=
iled with exit code &#39;1&#39;</div></div><div><br></div><div><br></div><d=
iv>if the following directory should contain the final kernel .config that =
is being built then I do not see the xen config options that are defined in=
=C2=A0/meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg being a=
pplied.</div><div><br></div><div>yocto/poky/build/tmp/work/genericx86_64-po=
ky-linux/linux-yocto/4.1.15+gitAUTOINC+46bb64d605_788dfc9859-r0/linux-gener=
icx86_64-standard-build<br></div><div><br></div><div>Any help is greatly ap=
preciated.</div><div><br></div><div>Thanks,</div><div>Brian</div></div>

--001a113f8f66949f7a0529c63bf8--
