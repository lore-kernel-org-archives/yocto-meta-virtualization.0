Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81151E00B57; Tue, 29 May 2018 06:07:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B6F2E009AC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 06:06:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4TD5nAW008531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 06:06:04 -0700
Received: from yow-masselst-lx1.localnet (128.224.60.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 May 2018 06:05:38 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Nicolai Weis <nicolai.weis@web.de>
Date: Tue, 29 May 2018 09:05:37 -0400
Message-ID: <2733784.4O7enH61Te@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <trinity-375847ef-5d15-4d33-ba70-a4dd5a8ac85f-1527597485908@3c-app-webde-bap21>
References: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
	<trinity-ff36e0fa-466b-4d34-936f-97b6a19f73bb-1527597250966@3c-app-webde-bap21>
	<trinity-375847ef-5d15-4d33-ba70-a4dd5a8ac85f-1527597485908@3c-app-webde-bap21>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Question Integration of LXC
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
X-List-Received-Date: Tue, 29 May 2018 13:07:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, May 29, 2018 8:38:05 AM EDT Nicolai Weis wrote:
> >> I actually had a cgroup-lite uprev in flight which has now been sent
> >> to the list. I also have plans to uprev LXC in the next week or so,
> >> along with making some changes, such as dropping the lxc-setup package
> >> which has its roots from early iterations of the systemd/sysvinit
> >> split, which can be done differently now. If I find the time to get
> >> this done you should see the series soon.
> 
>  
> The uprev cgroup-lite works fine. Now I don't have to mount systemd
> manually. Thank you for that. 

np

> 
> > Just to follow up on this. With the cgroup-lite change sent and merged
> > yesterday I am able to create and run a container using the lxc busybox
> > template.
> > 
> > I needed to update the template to 'binary_copy passwd' and adjust the
> > 'chmod' path for this from '/bin/passwd' to '/usr/bin/passwd'.
> 
>  
> How do you change the lxc-busybox-template exactly? What code do I have to
> change into binary_copy passwd? Do you mean the chmod path in the function
> configure_busybox() { ... # passwd exec must be setuid chmod +s
> $rootfs/bin/passwd ...} ? 

--- tmp/work/core2-64-poky-linux/lxc/2.0.8-r0/image/usr/share/lxc/templates/
lxc-busybox 2018-05-25 15:19:53.143030528 -0400
+++ /tmp/lxc-busybox    2018-05-29 08:57:31.291643488 -0400
@@ -94,6 +94,7 @@
 
     mkdir -p $tree || return 1
     chmod 755 $tree || return 1
+    copy_binary passwd || return 1
 
     pushd $rootfs/dev > /dev/null || return 1
 
@@ -326,7 +327,7 @@
     touch $rootfs/etc/fstab
 
     # passwd exec must be setuid
-    chmod +s $rootfs/bin/passwd
+    chmod +s $rootfs/usr/bin/passwd
     touch $rootfs/etc/shadow
 
     return 0


> 
> > Along with manually tweaking the memory cgroup (via 'echo 1 >
> > /sys/fs/cgroup/memory/memory.use_hierarchy).
>  
> In my case this isn't possible: write error: Device or resource busy.

Do it as soon as the system boots and not after you attempt to create or start 
the container.

> 
> > I will not consider
> > digging in to fix these until I confirm they are still an issue after
> > the LXC uprev.
> > 
> > The following are the only changes to my local.conf
> > ---
> > MACHINE = "qemux86-64"
> > DISTRO_FEATURES += "virtualization"
> > PACKAGE_CLASSES = "package_ipk"
> > IMAGE_INSTALL_append += "cgroup-lite lxc"
> > ---
> 
>  
> I got it working on the machine = "qemux86", too (Krogoth). I needed to add
> under meta-virtualization/recipes-core/busybox a new Config-file with
> "CONFIG_INIT=y" in it.  I can't access the running container with
> lxc-console,  but with lxc-attach it works fine.

For some of the templates you need to first run do 'lxc-execute -n <name> /
bin/bash' then use 'passwd' to set a password and you should be able to use 
lxc-console after this. But each template is different.

> 
> In my minnowboard image (machine = "intel-corei7-64" modified with
> PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
> and MACHINE_EXTRA_RRECOMMENDS += "kernel-modules") this isn't enough. I got
> the error:
>   [12208.261387] devpts: called with bogus options
>   lxc-start: conf.c: lxc_create_tty: 3284 No such file or directory - failed
> to create pty #0 lxc-start: conf.c: lxc_setup: 3800 failed to create the
> ttys
>   lxc-start: start.c: do_start: 819 failed to setup the container
>   lxc-start: sync.c: __sync_wait: 52 An error occurred in another process
> (expected sequence number 2)
> 
> Any ideas?
> In lxc-checkconfig there is Multiple /dev/pts instances: missing (in qemux
> it is enabled). CONFIG_DEVPTS_MULTIPLE_INSTANCES=y is always set.

Make sure lxc-enable.scc kernel feature is enabled. Compare against a working 
qemux86-64 kernel. That's about all I can advise.

Mark




