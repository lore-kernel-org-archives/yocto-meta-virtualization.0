Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03CBCE00B4C; Mon,  4 Jun 2018 08:54:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D7B2E0086B;
	Mon,  4 Jun 2018 08:54:43 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w54Frawe022808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Jun 2018 08:53:52 -0700
Received: from server.local (128.224.21.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 4 Jun 2018 08:53:19 -0700
To: Jakob Hasse <jakob.hasse@smart-home-technology.ch>, Yocto List
	<yocto@yoctoproject.org>
References: <783ff7cd-c1d8-1802-4b67-3aff339aae31@smart-home-technology.ch>
	<6391ddea-802d-7f4d-26b3-44a79556c8a0@windriver.com>
	<761e6979-b696-04f6-6e62-e325bc979c38@smart-home-technology.ch>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <80617b66-6714-03f6-f6e7-45afc4def6d5@windriver.com>
Date: Mon, 4 Jun 2018 11:53:18 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <761e6979-b696-04f6-6e62-e325bc979c38@smart-home-technology.ch>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: cgroups and iptables problems running docker - maybe my config wrong?
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
X-List-Received-Date: Mon, 04 Jun 2018 15:54:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-06-01 12:15 PM, Jakob Hasse wrote:
> Hello Bruce,
> 
> Thank you very much for the quick response. I tried to built in the 
> kernel changes. But the iptables error persists.

I double checked over the weekend, and I have no problems with
linux-yocto + the meta-virtualization fragment and docker.

Did you say that you confirmed on target via /proc/config.gz that
all the options you tried to enable are still present in the running
kernel ?

> Eventually, I tried to enable systemd again and it still breaks my build 
> -.-:
> 
> test$ bitbake core-image-base
> NOTE: Started PRServer with DBfile: 
> /home/build/test/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 40169, PID: 
> 2335
> Loading cache: 100% 
> |########################################################################################################| 
> Time: 0:00:00
> Loaded 3023 entries from dependency cache.
> Parsing recipes: 100% 
> |######################################################################################################| 
> Time: 0:00:01
> Parsing of 2194 .bb files complete (2193 cached, 1 parsed). 3024 
> targets, 146 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION           = "1.36.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-dey-linux-gnueabi"
> MACHINE              = "ccimx6ulstarter"
> DISTRO               = "dey"
> DISTRO_VERSION       = "2.4-r1"
> TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard 
> cortexa7"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp       = "HEAD:3befe6d7b7fa8c8481519aa8dd0cae52207ad339"
> meta-oe
> meta-python
> meta-networking
> meta-webserver       = "HEAD:dacfa2b1920e285531bec55cd2f08743390aaf57"
> meta-qt5             = "HEAD:cfe02f26de53e5c20e6f9555059cbaaf5ab9b22f"
> meta-swupdate        = "HEAD:6e4eab4f475b0129d6510815a3bbc4748c97dbbe"
> meta-freescale       = "HEAD:d6141ea291a1ac9ab8fb1dd1110d408f840fda57"
> meta-fsl-demos       = "HEAD:0ec6d7e206705702b5b534611754de0787f92b72"
> meta-digi-arm
> meta-digi-dey        = "HEAD:1246ecff2cecea9247d94f36385608ac844d7abb"
> 
> Initialising tasks: 100% 
> |###################################################################################################| 
> Time: 0:00:04
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: core-image-base-1.0-r0 do_rootfs: Could not invoke dnf. Command 
> '/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/recipe-sysroot-native/usr/bin/dnf 
> -y -c 
> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/dnf/dnf.conf 
> --setopt=reposdir=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs/etc/yum.repos.d 
> --repofrompath=oe-repo,/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/oe-rootfs-repo 
> --installroot=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/rootfs 
> --setopt=logdir=/home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/temp 
> -x udev-cache --nogpgcheck install locale-base-en-us locale-base-en-gb 
> packagegroup-core-boot packagegroup-core-eclipse-debug run-postinsts 
> packagegroup-dey-bluetooth psplash packagegroup-core-ssh-dropbear 
> packagegroup-dey-network packagegroup-base-extended 
> packagegroup-dey-audio packagegroup-dey-wireless rpm dnf' returned 1:
> Added oe-repo repo from 
> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/oe-rootfs-repo 
> 
> Last metadata expiration check: 0:00:00 ago on Fri 01 Jun 2018 03:49:44 
> PM UTC.
> Error:
>   Problem: package packagegroup-base-1.0-r83.0.ccimx6ulstarter requires 
> packagegroup-distro-base, but none of the providers can be installed
>    - package packagegroup-base-extended-1.0-r83.0.ccimx6ulstarter 
> requires packagegroup-base, but none of the providers can be installed
>    - package packagegroup-distro-base-1.0-r83.0.ccimx6ulstarter requires 
> packagegroup-dey-core, but none of the providers can be installed
>    - conflicting requests
>    - nothing provides busybox-hwclock needed by 
> packagegroup-dey-core-1.0-r0.0.ccimx6ulstarter
> 
> ERROR: core-image-base-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: 
> /home/build/test/tmp/work/ccimx6ulstarter-dey-linux-gnueabi/core-image-base/1.0-r0/temp/log.do_rootfs.2380 
> 
> ERROR: Task 
> (/usr/local/dey-2.4/sources/poky/meta/recipes-core/images/core-image-base.bb:do_rootfs) 
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4106 tasks of which 4105 didn't need to 
> be rerun and 1 failed.
> 
> Summary: 1 task failed:
> /usr/local/dey-2.4/sources/poky/meta/recipes-core/images/core-image-base.bb:do_rootfs 
> 
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> Seems that the introduction of systemd "confuses" dnf. I found a quite 
> similar description in this bugreport here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12025
> only that I'm not using different machines. This bug doesn't seem to be 
> resolved yet.
> 
> Our Yocto-distribution is DIGI Embedded Yocto. So non-standard.
> Shall I still log a bug against oe-core?

You could, but without a reproducer on oe-core, chances are that it
won't be easily resolved.

At a glance, it isn't clear to me how systemd is causing your 
busybox-hwclock
issue. But if you check the list, that particular package has recently
been moved around/broken out. So I'd suggest making sure that all of
your layers are on the correct branches and that releases aren't being
mixed.

Bruce

> If someone here has some more helpful ideas, I would be very thankful.
> 
> All the Best,
> Jakob
> 
> On 31.05.2018 13:44, Bruce Ashfield wrote:
>> On 2018-05-31 7:00 AM, Jakob Hasse wrote:
>>> Hello,
>>
>> Make sure to cc meta-virtualization on questions like this, since
>> that is where you'll get more eyes that are running docker
>> all the time.
>>
>>> I ran into trouble running docker on our target.
>>> 1. When I want to start docker, I first have to re-mount cgroups:
>>> root@target:~# cgroups-umount
>>> root@target:~# cgroups-mount
>>> Otherwise docker would produce an error:
>>> ERRO[0002] Failed to built-in GetDriver graph btrfs /var/lib/docker
>>>
>>> 2. When I then start dockerd, it complains about a missing nat table:
>>> root@target:~# dockerd
>>> INFO[0000] libcontainerd: new containerd process, pid: 929
>>> WARN[0000] containerd: low RLIMIT_NOFILE changing to max current=1024 
>>> max=4096
>>> INFO[0001] [graphdriver] using prior storage driver: overlay2
>>> INFO[0001] Graph migration to content-addressability took 0.00 seconds
>>> WARN[0001] Your kernel does not support cgroup memory limit
>>> WARN[0001] Unable to find cpu cgroup in mounts
>>> WARN[0001] Unable to find blkio cgroup in mounts
>>> WARN[0001] Unable to find cpuset cgroup in mounts
>>> WARN[0001] mountpoint for pids not found
>>> INFO[0001] Loading containers: start.
>>> WARN[0001] Running modprobe nf_nat failed with message: `modprobe: 
>>> WARNING: Module nf_nat not found in directory 
>>> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
>>> WARN[0001] Running modprobe xt_conntrack failed with message: 
>>> `modprobe: WARNING: Module xt_conntrack not found in directory 
>>> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
>>> Error starting daemon: Error initializing network controller: error 
>>> obtaining controller instance: failed to create NAT chain: iptables 
>>> failed: iptables --wait -t nat -N DOCKER: iptables v1.6.1: can't 
>>> initialize iptables table `nat': Table does not exist (do you need to 
>>> insmod?)
>>> Perhaps iptables or your kernel needs to be upgraded.
>>>   (exit status 3)
>>>
>>> Our configuration is as suggested here: 
>>> https://wiki.yoctoproject.org/wiki/TipsAndTricks/DockerOnImage, except 
>>
>> I've never seen that wiki page before (or at least I don't remember
>> seeing it), so I can't confirm or deny the validity of the content :)
>>
>>> that I don't include the system systemd stuff  (it lets my build fail) 
>>
>> If systemd is breaking your build, make sure to log a bugzilla against
>> oe-core
>>
>>> and connman (using NetworkManager).
>>> Furthermore, I added the following lines to the kernel bbappend file:
>>>
>>> # remove old defconfig
>>> SRC_URI_remove = " defconfig"
>>> # replace with new defconfig
>>> SRC_URI_append = " file://defconfig"
>>>
>>> KERNEL_FEATURES_append = " features/cgroups/cgroups.scc "
>>>
>>> I also added a lot of configurations manually to the defconfig 
>>> (mostly via menuconfig) to enable NAT:
>>>
>>> CONFIG_CGROUP_DEVICE=y
>>> CONFIG_IP_MULTICAST=y
>>> CONFIG_IP_ADVANCED_ROUTER=y
>>> CONFIG_NETFILTER=y
>>> CONFIG_NF_CONNTRACK=y
>>> CONFIG_NF_TABLES=y
>>> CONFIG_NF_NAT=y
>>> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
>>> CONFIG_NETFILTER_XT_MATCH_COMMENT=y
>>> CONFIG_NETFILTER_XT_MATCH_HL=y
>>> CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
>>> CONFIG_NETFILTER_XT_MATCH_LIMIT=y
>>> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
>>> CONFIG_NETFILTER_XT_MATCH_RECENT=y
>>> CONFIG_IP_VS=y
>>> CONFIG_NF_TABLES_IPV4=y
>>> CONFIG_IP_NF_IPTABLES=y
>>> CONFIG_IP_NF_NAT=y
>>> CONFIG_IP_NF_FILTER=y
>>> CONFIG_IP_NF_MANGLE=y
>>> CONFIG_IP6_NF_IPTABLES=y
>>> CONFIG_IP6_NF_FILTER=y
>>> CONFIG_IP6_NF_MANGLE=y
>>> CONFIG_BTRFS_FS=y
>>> CONFIG_OVERLAY_FS=y
>>>
>>> Apart from that, I added virtualization and aufs as DISTRO_FEATURE in 
>>> local.conf and also enabled it in menuconfig.
>>>
>>> But I still keep getting the above mentioned iptables error when 
>>> trying to start docker. All this hassle makes me suspicious, 
>>> especially as I'm quite sure that I once had docker running already 
>>> with an image on our target and it wasn't that hard. So maybe it's 
>>> just a misconfiguration and I need to add something in local.conf or 
>>> the kernel recipe? Is systemd necessary? Or am I missing some 
>>> life-or-death kernel configuration? It would also be nice if I could 
>>> avoid the cgroup re-mounting before starting docker.
>>
>> What release branch are you using ?
>>
>> I'm running docker from meta-virt every day, as are many others,
>> but you have several differences in your configuration.
>>
>>  - most use systemd as the init manager, I know that I do. That
>>    is going to impact how cgroups is set up on your 'host' image.
>>    You shouldn't need to touch cgroups at all if systemd is used,
>>    since it is correct out of the box.
>>
>>  - You are using a different kernel and kernel configuration.
>>    linux-yocto + the configuration fragments in the layer are what
>>    is routinely tested. Are you using linux-yocto, or something
>>    different ? If it is different, all you can do is run the various
>>    checks to make sure that the docker prereqs are in place.
>>
>>    The errors you see in dockerd tells me that the options you are
>>    turning on, are not making it into the final kernel that is
>>    running on target.
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> Thanks for every answer!
>>> All the Best,
>>> Jakob
>>>
>>
> 


