Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E59FE0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:20:45 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id k6so5728970lbo.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=769YSnEpiGg5KI8WtEVg9hDzNHdBYnRy5uumNi81cyE=;
	b=RkCup8X3caANYMheFvqAfqb8jq0rV+t+cXW+z7s9BQakx1AWrUoNOqqp/XSEbccfiq
	wgtrW2pjSdzfWCwARK4bqAwE7Ggb0ArPGEbLvad3w1nETgcyyCQZjf4jYG4POF5AZBcr
	bpSzxk4bTm/7nO7rT77n69VEMKi/lcXFSBgR7ab1hNAsV3gHKCjWSvuVzZDXghTSo3Ix
	BNjsByErhKsixAmwjWpUtqQlkeyCNhqrP/xFB4gS7aq/Yz6B1W12jncDxIJzJ8bIb4av
	V1auI+8SGl3hqCqAU04GkYqG5SHfBXbFnODQjg7y1N9zS22C+Hu6feXQNyqhjAq3B28S
	eiCQ==
Received: by 10.152.122.133 with SMTP id ls5mr1878086lab.9.1354803645067;
	Thu, 06 Dec 2012 06:20:45 -0800 (PST)
Received: from [172.16.140.28] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id so7sm3498843lab.0.2012.12.06.06.20.43
	(version=SSLv3 cipher=OTHER); Thu, 06 Dec 2012 06:20:44 -0800 (PST)
Message-ID: <50C0A9B9.3020902@gmail.com>
Date: Thu, 06 Dec 2012 15:20:41 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-5-git-send-email-david.c.nystrom@gmail.com>
	<CADkTA4O_Bj7+DjSgEKK=9TTc-=FNFkyJnVBz3CaoVNKgT8WN=Q@mail.gmail.com>
In-Reply-To: <CADkTA4O_Bj7+DjSgEKK=9TTc-=FNFkyJnVBz3CaoVNKgT8WN=Q@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv3 04/14] Added lxc recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 14:20:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/06/2012 03:15 PM, Bruce Ashfield wrote:
> On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:
>
>> From: David Nyström <david.nystrom@enea.com>
>>
>> ---
>>   recipes-containers/lxc/files/libmounts.patch  |   48
>> +++++++++++++++++++++++++
>>   recipes-containers/lxc/files/noldconfig.patch |   29 +++++++++++++++
>>   recipes-containers/lxc/lxc_0.8.0.bb           |   39 ++++++++++++++++++++
>>   3 files changed, 116 insertions(+)
>>   create mode 100644 recipes-containers/lxc/files/libmounts.patch
>>   create mode 100644 recipes-containers/lxc/files/noldconfig.patch
>>   create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
>>
>> diff --git a/recipes-containers/lxc/files/libmounts.patch
>> b/recipes-containers/lxc/files/libmounts.patch
>> new file mode 100644
>> index 0000000..7e092f1
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/libmounts.patch
>> @@ -0,0 +1,48 @@
>> +From dfef62f0334c65397254215f809a8f25364ea6ef Mon Sep 17 00:00:00 2001
>> +From: Stuart Yoder <stuart.yoder@freescale.com>
>> +Date: Wed, 12 Sep 2012 11:05:07 -0500
>> +Subject: [PATCH] create lib mounts only if the host directories exist
>> +
>>
>
> Is the source of the lxc recipe the meta-fsl layers ? If so, it's always a
> good idea
> to provide a reference to the original recipe (or layer) in the commit
> message or
> even in the patch itself. It serves to give credit and help people trace
> the history
> of a particular recipe.
>
> Cheers,
>
> Bruce

Yes, the source is lxc_0.8.0-rc1.bb in meta-fsl-ppc. Unfortunately I 
lack the git-fu needed  to import _only_ one file with history from 
another repo.
Any suggestions are welcome here.

I'll make a note in the commit message of the origin.

>
>
>> +Signed-off-by: Stuart Yoder <stuart.yoder@freescale.com>
>> +---
>> + templates/lxc-busybox.in |   24 +++++++++++-------------
>> + 1 file changed, 11 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
>> +index 720ceef..f6cb1ba 100644
>> +--- a/templates/lxc-busybox.in
>> ++++ b/templates/lxc-busybox.in
>> +@@ -235,19 +235,17 @@ lxc.pts = 1
>> + lxc.rootfs = $rootfs
>> + EOF
>> +
>> +-if [ -d "$rootfs/lib" ]; then
>> +-cat <<EOF >> $path/config
>> +-lxc.mount.entry=/lib $rootfs/lib none ro,bind 0 0
>> +-lxc.mount.entry=/usr/lib $rootfs/usr/lib none ro,bind 0 0
>> +-EOF
>> +-fi
>> +-
>> +-if [ -d "/lib64" ] && [ -d "$rootfs/lib64" ]; then
>> +-cat <<EOF >> $path/config
>> +-lxc.mount.entry=/lib64 $rootfs/lib64 none ro,bind 0 0
>> +-lxc.mount.entry=/usr/lib64 $rootfs/usr/lib64 none ro,bind 0 0
>> +-EOF
>> +-fi
>> ++    libdirs="\
>> ++        /lib \
>> ++        /usr/lib \
>> ++        /lib64 \
>> ++        /usr/lib64"
>> ++
>> ++    for dir in $libdirs; do
>> ++        if [ -d $dir ]; then
>> ++            echo "lxc.mount.entry=$dir $rootfs$dir none ro,bind 0 0" >>
>> $path/config
>> ++        fi
>> ++    done
>> + }
>> +
>> + usage()
>> +--
>> +1.7.9.7
>> +
>> diff --git a/recipes-containers/lxc/files/noldconfig.patch
>> b/recipes-containers/lxc/files/noldconfig.patch
>> new file mode 100644
>> index 0000000..5edff46
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/noldconfig.patch
>> @@ -0,0 +1,29 @@
>> +From a8aa8d131a7140d5625c24c9f4c28c605213552c Mon Sep 17 00:00:00 2001
>> +From: Andrey Mazo <ahippo@yandex.ru>
>> +Date: Fri, 18 May 2012 21:11:22 +0400
>> +Subject: [PATCH] Avoid ldconfig due to cross-compilation problems.
>> +
>> +Make required symlinks manually.
>> +Otherwise, it cases problems on cbuild endianness != ctarget endianness
>> +setups because /sbin/ldconfig expects elf header in the wrong endianness.
>> +---
>> + src/lxc/Makefile.am |    2 +-
>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>> +
>> +diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
>> +index 1c26952..3b84c1a 100644
>> +--- a/src/lxc/Makefile.am
>> ++++ b/src/lxc/Makefile.am
>> +@@ -125,8 +125,8 @@ lxc_kill_SOURCES = lxc_kill.c
>> +
>> + install-exec-local: install-soPROGRAMS
>> +       mv $(DESTDIR)$(libdir)/liblxc.so
>> $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
>> +-      /sbin/ldconfig -l $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
>> +       cd $(DESTDIR)$(libdir); \
>> ++      ln -sf liblxc.so.$(VERSION) liblxc.so.$(firstword $(subst .,
>> ,$(VERSION))); \
>> +       ln -sf liblxc.so.$(firstword $(subst ., ,$(VERSION))) liblxc.so
>> +
>> + uninstall-local:
>> +--
>> +1.7.3.4
>> +
>> diff --git a/recipes-containers/lxc/lxc_0.8.0.bb b/recipes-containers/lxc/
>> lxc_0.8.0.bb
>> new file mode 100644
>> index 0000000..c662cb1
>> --- /dev/null
>> +++ b/recipes-containers/lxc/lxc_0.8.0.bb
>> @@ -0,0 +1,39 @@
>> +DESCRIPTION = "lxc aims to use these new functionnalities to provide an
>> userspace container object"
>> +SECTION = "console/utils"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>> +PRIORITY = "optional"
>> +PR = "r2"
>> +DEPENDS = "libxml2 libcap"
>> +RDEPENDS_${PN} = " \
>> +               rsync \
>> +               gzip \
>> +               libcap-bin \
>> +               bridge-utils \
>> +               dnsmasq \
>> +               perl-module-strict \
>> +               perl-module-getopt-long \
>> +               perl-module-vars \
>> +               perl-module-warnings-register \
>> +               perl-module-exporter \
>> +               perl-module-constant \
>> +               perl-module-overload \
>> +               perl-module-exporter-heavy \
>> +"
>> +
>> +SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
>> +       file://noldconfig.patch \
>> +       "
>> +SRC_URI[md5sum] = "7304fa57146ce687f749b5df876bb20d"
>> +SRC_URI[sha256sum] =
>> "eac833730b94e423d4bef6834bc4a716437d2abd6ab8b24334c506aaaa08692c"
>> +
>> +S = "${WORKDIR}/${PN}-${PV}"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
>> +PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
>> +PACKAGECONFIG[apparmour] =
>> "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>> +
>> +inherit autotools
>> +
>> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>


