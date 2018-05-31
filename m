Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7AD5FE00C6F; Thu, 31 May 2018 04:44:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8FBFE00C4D;
	Thu, 31 May 2018 04:44:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4VBi34t021339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2018 04:44:04 -0700 (PDT)
Received: from server.local (128.224.21.85) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 May 2018 04:44:02 -0700
To: Jakob Hasse <jakob.hasse@smart-home-technology.ch>, Yocto List
	<yocto@yoctoproject.org>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <783ff7cd-c1d8-1802-4b67-3aff339aae31@smart-home-technology.ch>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <6391ddea-802d-7f4d-26b3-44a79556c8a0@windriver.com>
Date: Thu, 31 May 2018 07:44:02 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <783ff7cd-c1d8-1802-4b67-3aff339aae31@smart-home-technology.ch>
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
X-List-Received-Date: Thu, 31 May 2018 11:44:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-05-31 7:00 AM, Jakob Hasse wrote:
> Hello,

Make sure to cc meta-virtualization on questions like this, since
that is where you'll get more eyes that are running docker
all the time.

> I ran into trouble running docker on our target.
> 1. When I want to start docker, I first have to re-mount cgroups:
> root@target:~# cgroups-umount
> root@target:~# cgroups-mount
> Otherwise docker would produce an error:
> ERRO[0002] Failed to built-in GetDriver graph btrfs /var/lib/docker
> 
> 2. When I then start dockerd, it complains about a missing nat table:
> root@target:~# dockerd
> INFO[0000] libcontainerd: new containerd process, pid: 929
> WARN[0000] containerd: low RLIMIT_NOFILE changing to max current=1024 
> max=4096
> INFO[0001] [graphdriver] using prior storage driver: overlay2
> INFO[0001] Graph migration to content-addressability took 0.00 seconds
> WARN[0001] Your kernel does not support cgroup memory limit
> WARN[0001] Unable to find cpu cgroup in mounts
> WARN[0001] Unable to find blkio cgroup in mounts
> WARN[0001] Unable to find cpuset cgroup in mounts
> WARN[0001] mountpoint for pids not found
> INFO[0001] Loading containers: start.
> WARN[0001] Running modprobe nf_nat failed with message: `modprobe: 
> WARNING: Module nf_nat not found in directory 
> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
> WARN[0001] Running modprobe xt_conntrack failed with message: `modprobe: 
> WARNING: Module xt_conntrack not found in directory 
> /lib/modules/4.9.81-dey+g2c6ae4c`, error: exit status 1
> Error starting daemon: Error initializing network controller: error 
> obtaining controller instance: failed to create NAT chain: iptables 
> failed: iptables --wait -t nat -N DOCKER: iptables v1.6.1: can't 
> initialize iptables table `nat': Table does not exist (do you need to 
> insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>   (exit status 3)
> 
> Our configuration is as suggested here: 
> https://wiki.yoctoproject.org/wiki/TipsAndTricks/DockerOnImage, except 

I've never seen that wiki page before (or at least I don't remember
seeing it), so I can't confirm or deny the validity of the content :)

> that I don't include the system systemd stuff  (it lets my build fail) 

If systemd is breaking your build, make sure to log a bugzilla against
oe-core

> and connman (using NetworkManager).
> Furthermore, I added the following lines to the kernel bbappend file:
> 
> # remove old defconfig
> SRC_URI_remove = " defconfig"
> # replace with new defconfig
> SRC_URI_append = " file://defconfig"
> 
> KERNEL_FEATURES_append = " features/cgroups/cgroups.scc "
> 
> I also added a lot of configurations manually to the defconfig (mostly 
> via menuconfig) to enable NAT:
> 
> CONFIG_CGROUP_DEVICE=y
> CONFIG_IP_MULTICAST=y
> CONFIG_IP_ADVANCED_ROUTER=y
> CONFIG_NETFILTER=y
> CONFIG_NF_CONNTRACK=y
> CONFIG_NF_TABLES=y
> CONFIG_NF_NAT=y
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
> CONFIG_NETFILTER_XT_MATCH_COMMENT=y
> CONFIG_NETFILTER_XT_MATCH_HL=y
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
> CONFIG_NETFILTER_XT_MATCH_LIMIT=y
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
> CONFIG_NETFILTER_XT_MATCH_RECENT=y
> CONFIG_IP_VS=y
> CONFIG_NF_TABLES_IPV4=y
> CONFIG_IP_NF_IPTABLES=y
> CONFIG_IP_NF_NAT=y
> CONFIG_IP_NF_FILTER=y
> CONFIG_IP_NF_MANGLE=y
> CONFIG_IP6_NF_IPTABLES=y
> CONFIG_IP6_NF_FILTER=y
> CONFIG_IP6_NF_MANGLE=y
> CONFIG_BTRFS_FS=y
> CONFIG_OVERLAY_FS=y
> 
> Apart from that, I added virtualization and aufs as DISTRO_FEATURE in 
> local.conf and also enabled it in menuconfig.
> 
> But I still keep getting the above mentioned iptables error when trying 
> to start docker. All this hassle makes me suspicious, especially as I'm 
> quite sure that I once had docker running already with an image on our 
> target and it wasn't that hard. So maybe it's just a misconfiguration 
> and I need to add something in local.conf or the kernel recipe? Is 
> systemd necessary? Or am I missing some life-or-death kernel 
> configuration? It would also be nice if I could avoid the cgroup 
> re-mounting before starting docker.

What release branch are you using ?

I'm running docker from meta-virt every day, as are many others,
but you have several differences in your configuration.

  - most use systemd as the init manager, I know that I do. That
    is going to impact how cgroups is set up on your 'host' image.
    You shouldn't need to touch cgroups at all if systemd is used,
    since it is correct out of the box.

  - You are using a different kernel and kernel configuration.
    linux-yocto + the configuration fragments in the layer are what
    is routinely tested. Are you using linux-yocto, or something
    different ? If it is different, all you can do is run the various
    checks to make sure that the docker prereqs are in place.

    The errors you see in dockerd tells me that the options you are
    turning on, are not making it into the final kernel that is
    running on target.

Cheers,

Bruce

> 
> Thanks for every answer!
> All the Best,
> Jakob
> 


