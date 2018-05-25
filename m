Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D5BDE009CA; Fri, 25 May 2018 08:24:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37A88E009B9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 08:24:31 -0700 (PDT)
Received: by mail-yb0-f193.google.com with SMTP id v12-v6so1949235ybl.10
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nZ1YVSXvD4e67hvqgasbcOMWgkWfFSZf6Z+exAcceYU=;
	b=iZCIcEazVgEQPyLx/ArZeItQ0IJuS0aREkk+D6978ud864k54Tz0eloaVnT5XOP+DN
	na0KQuz594W2EJGZbhtqfXqUZ3BYcIV/rU8Mi1+BDS38457leamz+bThj+pYtMUoErt2
	7dP4iozQRPTUd8dLH5dIaQqckvTW/R+me4Xed2/tJWxkl8j1neZl3YVvPpnoQ+RCkakf
	y/mgx6SxlCvxIZ9yPLvGe8/MZ9nk7dS9Ve7qciEV59Z2tsrA/+2I4JHP/s7IvpEIewl+
	kTlZpKvC+z5DFJTqFBQEchbfCHl5VKRZu6rAOdo9Evy26usLr4gildn358vO/iLithUn
	iMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=nZ1YVSXvD4e67hvqgasbcOMWgkWfFSZf6Z+exAcceYU=;
	b=SGJFWRYTfdwv97pT/EnBzxR2FGPl1kECHbEaG02fks7eVIVGI3zEXKOtcbrQeXbm78
	6Tmznrm3/gA+mwLl5MaWmNRugEf/5Czg/XAA6Kox4pQP2l30XYM3V6uZVwHCYejsFbA7
	KCQNuRgnCryNLNkDHZGK2bM6u8Y77sF7MRKWRFsm7jnpNBDAOQ3gtdB7dmFhpfrUhRS4
	zYUptB6xppPi7KhD1IR47+UNVVPw9kuskhmLK+UvbwNeta7sd9MviYgaCcbn662eyVtH
	rQz4lT3KZdDPyeWSom+bbbbRrdyAaRUorVCNkuUNmuAwH10QWLEi9wGh1bJi/8jeVMUD
	NuSA==
X-Gm-Message-State: ALKqPwckCsIY6m7eV0eTsqJZtJrSM+IJkwwnLMV2FIkn+j0ajkkpqSpj
	BseEzRGOA7l8q0lx+5XjM7RzaYLoqyoNMqZcPMw=
X-Google-Smtp-Source: ADUXVKKu/zQqkZp/dfgrFJzTRA4h20fBqT0r1yUDxpxZago+zzHJVyVWNc0JAA3K3uXwOcyj6Jyuty1OaXQit+V66Fk=
X-Received: by 2002:a25:a529:: with SMTP id
	h38-v6mr1623151ybi.74.1527261871137; 
	Fri, 25 May 2018 08:24:31 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:3dc7:0:0:0:0:0 with HTTP; Fri, 25 May 2018 08:24:30
	-0700 (PDT)
In-Reply-To: <CAPuovEK-2tb_7aimb7YXL8Q7H=NWJDSd5FdWn97A80eBOUkSAw@mail.gmail.com>
References: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
	<CADkTA4OsWJoD5X9DuRZjoYA4aAAQ_qdT0WJSnKoTZGK83ojrQw@mail.gmail.com>
	<trinity-1641f8e9-1faa-4cb2-8cc2-99d2377a8751-1527074397717@3c-app-webde-bap48>
	<CADkTA4MqER7xi56ab-SVnC1AEfXA4pABLT-Pksj1U792CY6ajg@mail.gmail.com>
	<CAPuovEK-2tb_7aimb7YXL8Q7H=NWJDSd5FdWn97A80eBOUkSAw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 25 May 2018 11:24:30 -0400
X-Google-Sender-Auth: OdMVohlEb3a2VGdyAF0OwgdkRf0
Message-ID: <CAPuovEKMXPTVHp=4WkCRsk2Au_EC6HJh-8ESg=EMYdM3GhxuHQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Question Integration of LXC
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 15:24:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 3:06 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Wed, May 23, 2018 at 2:15 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>>
>> On Wed, May 23, 2018 at 7:19 AM, Nicolai Weis <nicolai.weis@web.de> wrote:
>>>
>>> On Tue, May 22, 2018 at 7:38 AM, Nicolai Weis <nicolai.weis at web.de>
>>> wrote:
>>>
>>> > > Hi all,
>>> > >
>>> > > In a project I want to integrate lxc-containers into the
>>> > > core-image-minimal for the minnowboard turbot. Therefore I'm using the
>>> > > krogoth branch (have to use this branch) for the meta-layers.
>>> > > As described in the README-file I add meta-virtualization, meta-oe,
>>> > > meta-networking, meta-filesystems and meta-python to the
>>> > > bblayers.conf. In
>>> > > the local.conf
>>> > > I added at the end of the file BBFILE_PRIORITY_openembedded-layer =
>>> > > "4"
>>> > > and IMAGE_INSTALL_append = " lxc" (lxc_2.0.0.bb).
>>> > >
>>> > > After the sucessful build I start the image and created with the
>>> > > busybox-template - should I use a different template? - a lxc-busybox
>>> > > container. I tried to start the container, but the error
>>> > > "1079 failed initializing cgroup support" appeared. lxc-checkconfig
>>> > > showed
>>> > > cgroup-namespaces: required. I tried to solve this with adding
>>> > > cgroup-lite
>>> > > to IMAGE_INSTALL_append, but it
>>> > > didn't change anything (only let cgroup-namespaces disappear and
>>> > > showed
>>> > > Cgroup clone_children flag: enabled). I'm using sysvinit instead of
>>> > > systemd.
>>>
>>>
>>> > What kernel are you using ? This typically means that the kernel config
>>> > isn't correct.
>>> > If you aren't using linux-yocto, then the fragments we have in the layer
>>> > are likely
>>> > not being applied, and you'll need to manually configure your kernel
>>> > with
>>> > the right
>>> >
>>> options.
>>>
>>> In the minnowboard image I'm using the kernel version
>>> 4.4.26-rt19-yocto-preempt-rt.
>>> I tried it with a qemux image with the kernel version
>>> 4.4.26-yocto-standard, too.
>>
>>
>> You are fine with both of these kernels. I know that we've run LXC against
>> them in the past
>>>
>>> > Otherwise, it could be that the cgroups are not being mounted properly
>>> > by
>>> > your
>>> > recipe, so have a look and confirm if cgroups or cgroups2 are in fact
>>> > mounted in
>>> > your image.
>>>
>>> I did the mounting with the cgroups-mount script under the /bin directory
>>> (comming through adding cgroups-lite to the image). Inside /sys/fs/cgroup
>>> directory
>>> there are the mounted folders with blkio, cpu, cpuacct, cpuset, debug,
>>> devices, freezer, memory and net_cls. Furthermore I checked it with a
>>> cgroups_check-config.sh from docker.
>>> The output showed following missing configs, but I don't think they are
>>> the reason that the lxc-busybox container doesn't start:
>>> - Generally necessary - missing: CONFIG_VETH,
>>> CONFIG_IP_NF_TARGET_MASQUERADE, CONFIG_NETFILTER_XT_MATCH_ADDRTYPE,
>>> CONFIG_NETFILTER_XT_MATCH_IPVS, CONFIG_IP_NF_NAT,
>>>    CONFIG_DEVPTS_MULTIPLE_INSTANCES
>>> - Optional Features - missing: CONFIG_CGROUP_PIDS,
>>> CONFIG_BLK_DEV_THROTTLING, CONFIG_CFQ_GROUP_IOSCHED, CONFIG_CGROUP_PERF,
>>> CONFIG_CGROUP_HUGETLB, CONFIG_CGROUP_NET_PRIO,
>>>   CONFIG_CFS_BANDWIDTH, CONFIG_RT_GROUP_SCHED, CONFIG_IP_VS,
>>> CONFIG_IP_VS_NFCT, CONFIG_IP_VS_RR
>>>
>>> With lxc-start -n Test -F it showed that start.c: 1079 failed initializing
>>> cgroup support comes after cgfsng.c: 431 no systemd controller mountpoint
>>> found. If I try to mount systemd (I'm using sysvinit and so mounting systemd
>>> makes no sense to me) there are a lot of other failures.
>>
>>
>> Both lxc and docker have over time evolved to have very specific
>> expectations of mounts (and in particular cgroup mounts), which is made
>> worse with the versions moving from cgroup to cgroup2 mount structures.
>>
>> It could also just be that our sysvinit support has bit-rotted. I know that
>> I've been using systemd for quite a long time and haven't heard of a lot of
>> sysvinit testing.
>>
>> My suggestion is that we need to dive into the code to see what mount
>> structure that LXC version is looking for, and then figure out how to
>> manually mount it (which I've done in the past), or get cgroups-lite to take
>> care of it.
>>
>> Bruce
>
> I actually had a cgroup-lite uprev in flight which has now been sent
> to the list. I also have plans to uprev LXC in the next week or so,
> along with making some changes, such as dropping the lxc-setup package
> which has its roots from early iterations of the systemd/sysvinit
> split, which can be done differently now. If I find the time to get
> this done you should see the series soon.

Just to follow up on this. With the cgroup-lite change sent and merged yesterday
I am able to create and run a container using the lxc busybox template.

I needed to update the template to 'binary_copy passwd' and adjust the
'chmod' path for
this from '/bin/passwd' to '/usr/bin/passwd'. Along with manually
tweaking the memory
cgroup (via 'echo 1 > /sys/fs/cgroup/memory/memory.use_hierarchy).  I
will not consider
digging in to fix these until I confirm they are still an issue after
the LXC uprev.

The following are the only changes to my local.conf
---
MACHINE = "qemux86-64"
DISTRO_FEATURES += "virtualization"
PACKAGE_CLASSES = "package_ipk"
IMAGE_INSTALL_append += "cgroup-lite lxc"
---

So no systemd etc..

This is all on 'master' so you will have to attempt to recreate on krogoth

Mark

>
> Mark
>
>>
>>> > Bruce
>>>
>>>
>>> > > Do I have to change some configurations in the lxc-recipe? I would be
>>> > > very
>>> > > grateful if you can give me some information about it.
>>> > >
>>> > > Thanks
>>> > > Nicolai
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>> its end"
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>

