Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2EE4E005B4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:39:42 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id ev20so1138887lab.39
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8lbRDXd0N7HJFEmISVqvvnG8kT4BS2JZhgwy80GJxX4=;
	b=luxkwNJSAZ8Wwr7LvzMxS2OOb6d231OfTeo0vCRRcwk2q2cI/4kaJEi/Jrg6ANE+tw
	8TsM0NIwMVZbU+vLtwrFfwCKMtnbyaO5pYaCixTlmdVzLs/jSgg4tsfQplXKAbMjtc12
	76PNy3hRfH3vpYoCexaHc+KqmTcuGzWHsCQY9fG/8iunjNpxKy7syZqbYfRsXzdUePhO
	aQXMKbLQU8Mn/FyrKX9olvZNnMZqUGlSLuuJcQrNj8TduOkRjrelWpFANt+TD7gyf9Jt
	GiPE8Rwp2MUUvpRzEbLMbvXs08ONtdTo4oJqR8n+raAytD1GAo5rNgPwKTuzcrBb4QSr
	QUbw==
MIME-Version: 1.0
X-Received: by 10.112.52.225 with SMTP id w1mr6283224lbo.31.1377841181229;
	Thu, 29 Aug 2013 22:39:41 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 22:39:41 -0700 (PDT)
In-Reply-To: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
Date: Fri, 30 Aug 2013 01:39:41 -0400
Message-ID: <CADkTA4Pnj9wftZuMKoTGSbp1Jg3BeLcNjfUqdK6HVDsz+NqLag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/4] xen 4.3.0 recipe and updated xen-image-minimal
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
X-List-Received-Date: Fri, 30 Aug 2013 05:39:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com> wrote:
> This set of patches should provide a user with the ability to generate a xen 4.3.0 based dom0 image.
>
> [NOTES]
>
> With these patches, xen-image-minimal requires "xen" and "aufs" to be present in DISTRO_FEATURES to function correctly.
>
> [DISTRO TESTING]
>
> This image has been tested using:
>
> machine=sugarbay
> DISTRO_FEATURES += " aufs xen"
>
> [BUILDING IMAGE]
>
> bitbake xen-image-minimal
>
> [QEMU BUILD TESTING]
>
> To start up and test core-image-xen using kvm on hardware supporting nested virtualization:
>
> kvm -hda deploy/images/xen-image-minimal-sugarbay.hddimg -cpu host -no-kvm-irqchip -m 4096 -net nic,model=e1000 -net user -serial stdio
>
> ..or..
>
> kvm -hdc deploy/images/xen-image-minimal-sugarbay.iso -cpu host -no-kvm-irqchip -m 4096 -net nic,model=e1000 -net user -serial stdio
>
> [XEN TESTING]
>
> To test the runtime core-image-xen and boot a debian PV virtual machine:
>
> # bring up networking
> ifconfig eth0 up
> brctl addbr br0
> brctl addif br0 eth0
> udhcpc -i br0
>
> # place test debian vm in /test/debian
> mkdir -p /test/debian
> cd /test/debian
>
> # pull example kernel, initrd
> wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/initrd.gz
> wget http://ftp.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/xen/vmlinuz
>
> # create 4G disk
> truncate -s 4096M disk.img
>
> cat > debian.cfg << EOF
> kernel = "/test/debian/vmlinuz"
> ramdisk = "/test/debian/initrd.gz"
> extra = "debian-installer/exit/always_halt=true -- console=hvc0"
> vif = ['bridge=br0']
> memory = "256"
> name = "debian"
> disk = ['file:/test/debian/disk.img,xvda,w']
> EOF
>
> xl -v create -d debian.cfg
>

Great steps and documentation. I'll take them for a spin myself and
see if I can get
a working system :)

Bruce

> xl console debian
>
> Chris Patterson (4):
>   linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
>   linux-yocto: add optional support for aufs and xen using
>     DISTRO_FEATURES.
>   xen: add 4.3.0 recipe.
>   xen-image-minimal: update image to support xen 4.3.0 base with xl
>     toolstack.
>
>  recipes-extended/images/xen-image-initramfs.bb     |   17 +
>  recipes-extended/images/xen-image-minimal.bb       |   55 +-
>  .../initrdscripts/files/init-boot-xen.sh           |  205 +++++++
>  .../initrdscripts/initramfs-boot-xen_1.0.bb        |   16 +
>  recipes-extended/xen/xen_4.3.0.bb                  |  623 ++++++++++++++++++++
>  recipes-kernel/linux/linux-yocto/xen.cfg           |   53 ++
>  recipes-kernel/linux/linux-yocto/xen.scc           |    4 +
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |    6 +
>  recipes-kernel/linux/linux-yocto_3.8.bbappend      |    6 +
>  9 files changed, 978 insertions(+), 7 deletions(-)
>  create mode 100644 recipes-extended/images/xen-image-initramfs.bb
>  create mode 100644 recipes-extended/initrdscripts/files/init-boot-xen.sh
>  create mode 100644 recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.3.0.bb
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
>
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

